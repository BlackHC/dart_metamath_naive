library parser;

import 'dart:core' hide Symbol;
import 'package:blackhc_metamath/src/ast.dart';
import 'package:source_span/source_span.dart';

// TODO: support file inclusions using $[$]!

/// An "on-demand lexer".
class TokenExtractor {
  static final SYMBOL_REGEXP = new RegExp(r'[\u0021-\u007E]+');
  static final LABEL_REGEXP = new RegExp(r'[a-zA-Z0-9-_.]+');
  static final COMMENT_REGEXP =
      new RegExp(r'\$\(((?:.|\n)*?)\$\)', multiLine: true);
  static final WHITESPACE_REGEXP = new RegExp(r'\s+', multiLine: true);
  static final NEXT_TOKEN_REGEXP = new RegExp(r'\S+');
  static final COMPRESSED_STEP_REGEXP =
      new RegExp(r'\?|Z|[U-Y\s]*[A-T]', multiLine: true);

  final SourceFile sourceFile;
  final String text;
  int column = 0;

  TokenExtractor(this.text, {path})
      : sourceFile = new SourceFile(text, url: path);

  bool get isEof => column >= text.length;

  String readComment() {
    skipWhitespace();
    final match = COMMENT_REGEXP.matchAsPrefix(text, column);
    if (match == null) {
      return null;
    }
    column = match.end;
    return match.group(1);
  }

  bool skipWhitespace() {
    final match = WHITESPACE_REGEXP.matchAsPrefix(text, column);
    if (match == null) {
      return false;
    }
    column = match.end;
    return true;
  }

  void skipHidden() {
    while (readComment() != null || skipWhitespace());
  }

  bool readConstant(String constant) {
    skipHidden();
    final success = text.startsWith(constant, column);
    if (success) {
      column += constant.length;
    }
    return success;
  }

  String readRegExp(RegExp regExp) {
    skipHidden();
    final match = regExp.matchAsPrefix(text, column);
    if (match == null) {
      return null;
    }
    column = match.end;
    return match.group(0);
  }

  String readSymbol() => readRegExp(SYMBOL_REGEXP);

  String readLabel() => readRegExp(LABEL_REGEXP);

  String readCompressedStep() => readRegExp(COMPRESSED_STEP_REGEXP);

  SourceSpan getSpan() {
    final match = NEXT_TOKEN_REGEXP.matchAsPrefix(text, column);
    if (match == null) {
      return null;
    }
    return sourceFile.span(match.start, match.end);
  }

  String getMessage(String message) {
    final span = getSpan();
    if (span == null) {
      return '${sourceFile.url} col $column: $message';
    }
    return span.message(message);
  }

  void expectConstant(String expected) {
    if (!readConstant(expected)) {
      throw getMessage('Expected $expected!');
    }
  }

  String expectSymbol() {
    final symbol = readSymbol();
    if (symbol == null) {
      throw getMessage('Expected symbol!');
    }
    return symbol;
  }

  String expectLabel() {
    final label = readLabel();
    if (label == null) {
      throw getMessage('Expected label!');
    }
    return label;
  }

  String expectCompressedStep() {
    final step = readCompressedStep();
    if (step == null) {
      throw getMessage('Expected compressed step!');
    }
    return step;
  }
}

class Parser {
  static const String STATEMENT_END = r'$.';
  final TokenExtractor extractor;

  Parser(this.extractor);

  Scope parseGlobalScope() {
    final builder = new ScopeBuilder();
    extractor.skipHidden();
    while (!extractor.isEof) {
      builder.statements.add(parseStatement());
      extractor.skipHidden();
    }
    return builder.build();
  }

  Statement parseStatement() {
    if (extractor.readConstant(r'$v')) {
      final builder = new VariableDeclBuilder();
      builder.symbols.add(extractor.expectSymbol());
      while (!extractor.readConstant(STATEMENT_END)) {
        builder.symbols.add(extractor.expectSymbol());
      }
      return builder.build();
    } else if (extractor.readConstant(r'$c')) {
      final builder = new ConstantDeclBuilder();
      builder.symbols.add(extractor.expectSymbol());
      while (!extractor.readConstant(STATEMENT_END)) {
        builder.symbols.add(extractor.expectSymbol());
      }
      return builder.build();
    } else if (extractor.readConstant(r'$d')) {
      final builder = new DisjointRestrictionBuilder();
      builder.variables.add(extractor.expectSymbol());
      builder.variables.add(extractor.expectSymbol());
      while (!extractor.readConstant(STATEMENT_END)) {
        builder.variables.add(extractor.expectSymbol());
      }
      return builder.build();
    } else if (extractor.readConstant(r'${')) {
      final builder = new ScopeBuilder();
      while (!extractor.readConstant(r'$}')) {
        builder.statements.add(parseStatement());
      }
      return builder.build();
    }

    final label = extractor.expectLabel();
    if (extractor.readConstant(r'$f')) {
      final builder = new FloatingHypothesisBuilder();
      builder.label = label;
      builder.constant = extractor.expectSymbol();
      builder.variable = extractor.expectSymbol();
      extractor.expectConstant(STATEMENT_END);
      return builder.build();
    } else if (extractor.readConstant(r'$e')) {
      final builder = new EssentialHypothesisBuilder();
      builder.label = label;
      builder.constant = extractor.expectSymbol();
      builder.symbols.add(extractor.expectSymbol());
      while (!extractor.readConstant(STATEMENT_END)) {
        builder.symbols.add(extractor.expectSymbol());
      }
      return builder.build();
    } else if (extractor.readConstant(r'$a')) {
      final builder = new AxiomaticAssertionBuilder();
      builder.label = label;
      builder.constant = extractor.expectSymbol();
      builder.symbols.add(extractor.expectSymbol());
      while (!extractor.readConstant(STATEMENT_END)) {
        builder.symbols.add(extractor.expectSymbol());
      }
      return builder.build();
    } else if (extractor.readConstant(r'$p')) {
      final builder = new ProvableAssertionBuilder();
      builder.label = label;
      builder.constant = extractor.expectSymbol();
      builder.symbols.add(extractor.expectSymbol());
      while (!extractor.readConstant(r'$=')) {
        builder.symbols.add(extractor.expectSymbol());
      }
      if (extractor.readConstant('(')) {
        final proofBuilder = new CompressedProofBuilder();
        while (!extractor.readConstant(')')) {
          proofBuilder.labels.add(extractor.expectLabel());
        }
        while (!extractor.readConstant(STATEMENT_END)) {
          // Also remove whitespace from the extracted steps.
          proofBuilder.steps.add(extractor
              .expectCompressedStep()
              .replaceAll(TokenExtractor.WHITESPACE_REGEXP, ''));
        }
        builder.proof = proofBuilder.build();
      } else {
        final proofBuilder = new VerboseProofBuilder();
        proofBuilder.labels.add(extractor.expectLabel());
        while (!extractor.readConstant(STATEMENT_END)) {
          proofBuilder.labels.add(extractor.expectLabel());
        }
        builder.proof = proofBuilder.build();
      }
      return builder.build();
    } else {
      throw extractor.getMessage('Expected a statement!');
    }
  }
}
