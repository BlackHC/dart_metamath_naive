library library;

import 'package:blackhc_metamath/src/ast.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'library.g.dart';

abstract class ScopeFrame implements Built<ScopeFrame, ScopeFrameBuilder> {
  BuiltSet<String> get constants;
  BuiltSet<String> get variables;
  BuiltSetMultimap<String, String> get disjointVariables;
  BuiltList<FramedHypothesis> get hypotheses;
  BuiltMap<String, FramedHypothesis> get floatingHypothesesByVariable;

  ScopeFrame._();
  factory ScopeFrame([updates(ScopeFrameBuilder b)]) = _$ScopeFrame;
}

abstract class FramedHypothesis
    implements Built<FramedHypothesis, FramedHypothesisBuilder> {
  ScopeFrame get frame;
  Hypothesis get hypothesis;

  FramedHypothesis._();
  factory FramedHypothesis([updates(FramedHypothesisBuilder b)]) =
      _$FramedHypothesis;
}

abstract class FramedAssertion
    implements Built<FramedAssertion, FramedAssertionBuilder> {
  ScopeFrame get frame;
  Assertion get assertion;

  FramedAssertion._();
  factory FramedAssertion([updates(FramedAssertionBuilder b)]) =
      _$FramedAssertion;
}

/// A library of proofs
abstract class Library implements Built<Library, LibraryBuilder> {
  BuiltMap<String, FramedHypothesis> get hypothesesByLabel;
  BuiltMap<String, FramedAssertion> get assertionsByLabel;
  BuiltSet<String> get labels;

  Library._();
  factory Library([updates(LibraryBuilder b)]) = _$Library;

  factory Library.fromScope(Scope scope,
      [Library library, ScopeFrame scopeFrame]) {
    library ??= new Library();
    scopeFrame ??= new ScopeFrame();
    int i = 0;

    for (final statement in scope.statements) {
      try {
        if (statement is ConstantDecl) {
          for (final constant in statement.symbols) {
            if (scopeFrame.variables.contains(constant)) {
              throw new StateError('$constant already declared as variable!');
            }
            scopeFrame = scopeFrame.rebuild((b) => b.constants.add(constant));
          }
        } else if (statement is VariableDecl) {
          for (final variable in statement.symbols) {
            if (scopeFrame.constants.contains(variable)) {
              throw new StateError('$variable already declared as constant!');
            }
            scopeFrame = scopeFrame.rebuild((b) => b.variables.add(variable));
          }
        } else if (statement is DisjointRestriction) {
          for (final variable in statement.variables) {
            if (!scopeFrame.variables.contains(variable)) {
              throw new StateError('$variable is not a constant!');
            }
          }
          for (final variable in statement.variables) {
            for (final otherVariable in statement.variables) {
              if (variable == otherVariable) {
                continue;
              }
              scopeFrame = scopeFrame.rebuild(
                  (b) => b.disjointVariables.add(variable, otherVariable));
            }
          }
        } else if (statement is Hypothesis) {
          if (statement is FloatingHypothesis) {
            if (!scopeFrame.constants.contains(statement.constant)) {
              throw new StateError('${statement.constant} is not a constant!');
            }
            if (!scopeFrame.variables.contains(statement.variable)) {
              throw new StateError('${statement.variable} is not a variable!');
            }
            if (library.labels.contains(statement.label)) {
              throw new StateError('Label ${statement.label} already in use!');
            }

            if (scopeFrame.floatingHypothesesByVariable
                .containsKey(statement.variable)) {
              throw new StateError('${statement.variable} already has an \$f: '
                  '${scopeFrame.floatingHypothesesByVariable[statement
                  .variable]}');
            }

            final framedHypothesis = new FramedHypothesis((b) {
              b.frame = scopeFrame.toBuilder();
              b.hypothesis = statement;
            });

            scopeFrame = scopeFrame.rebuild((b) {
              b.floatingHypothesesByVariable[statement.variable] =
                  framedHypothesis;
              b.hypotheses.add(framedHypothesis);
            });

            library = library.rebuild((b) => b
              ..hypothesesByLabel[statement.label] = framedHypothesis
              ..labels.add(statement.label));
          } else if (statement is EssentialHypothesis) {
            if (!scopeFrame.constants.contains(statement.constant)) {
              throw new StateError('${statement.constant} is not a constant!');
            }
            for (final symbol in statement.symbols) {
              if (!scopeFrame.constants.contains(symbol) &&
                  !scopeFrame.variables.contains(symbol)) {
                throw new StateError('Unknown symbol ${statement.constant}!');
              }
            }
            if (library.labels.contains(statement.label)) {
              throw new StateError('Label ${statement.label} already in use!');
            }

            final framedHypothesis = new FramedHypothesis((b) {
              b.frame = scopeFrame.toBuilder();
              b.hypothesis = statement;
            });

            scopeFrame = scopeFrame.rebuild((b) {
              b.hypotheses.add(framedHypothesis);
            });
            library = library.rebuild((b) => b
              ..hypothesesByLabel[statement.label] = framedHypothesis
              ..labels.add(statement.label));
          }
        } else if (statement is Assertion) {
          // Verify assertion part.
          if (library.labels.contains(statement.label)) {
            throw new StateError('Label ${statement.label} already in use!');
          }
          if (!scopeFrame.constants.contains(statement.constant)) {
            throw new StateError('${statement.constant} is not a constant!');
          }

          BuiltSet<String> statementVariables =
              getAssertionVariables(statement, scopeFrame);

          final mandatoryHypothesesBuilder =
              new ListBuilder<FramedHypothesis>();
          for (final framedHypothesis in scopeFrame.hypotheses) {
            final hypothesis = framedHypothesis.hypothesis;
            if (hypothesis is EssentialHypothesis) {
              mandatoryHypothesesBuilder.add(framedHypothesis);
            } else if (hypothesis is FloatingHypothesis) {
              if (statementVariables.contains(hypothesis.variable)) {
                mandatoryHypothesesBuilder.add(framedHypothesis);
              }
            }
          }

          // TODO: more verifications.. what kind of verifications?
          final frameBuilder = new ScopeFrameBuilder();
          frameBuilder.variables = statementVariables.toBuilder();
          frameBuilder.constants = scopeFrame.constants.toBuilder();

          final disjointVariableBuilder =
              new SetMultimapBuilder<String, String>();
          for (final disjointVariable in scopeFrame.disjointVariables.keys) {
            if (!statementVariables.contains(disjointVariable)) {
              continue;
            }
            final others = scopeFrame.disjointVariables[disjointVariable]
                .toBuilder()..retainAll(statementVariables);
            disjointVariableBuilder.addValues(disjointVariable, others.build());
          }
          frameBuilder.disjointVariables = disjointVariableBuilder;
          frameBuilder.hypotheses = mandatoryHypothesesBuilder;
          // NOTE: floatingHypothesisByVariable stays empty!

          final framedAssertion = new FramedAssertion((b) => b
            ..frame = frameBuilder
            ..assertion = statement);

          library = library.rebuild((b) => b
            ..assertionsByLabel[statement.label] = framedAssertion
            ..labels.add(statement.label));

          if (statement is ProvableAssertion) {
            verifyProof(library, framedAssertion);
          }
        } else if (statement is Scope) {
          library = new Library.fromScope(statement, library, scopeFrame);
        } else {
          throw new StateError(
              'Unknown statement type ${statement.runtimeType}!');
        }
      } catch (e) {
        print(statement);
        /*print(scopeFrame);
        print(library);*/
        rethrow;
      }
    }

    return library;
  }

  static BuiltSet<String> getAssertionVariables(
      Assertion statement, ScopeFrame scopeFrame) {
    final statementVariablesBuilder = new SetBuilder<String>();
    for (final symbol in statement.symbols) {
      if (scopeFrame.variables.contains(symbol)) {
        statementVariablesBuilder.add(symbol);
      } else if (!scopeFrame.constants.contains(symbol)) {
        throw new StateError('Unknown symbol ${statement.constant}!');
      }
    }

    for (final framedHypothesis in scopeFrame.hypotheses) {
      final hypothesis = framedHypothesis.hypothesis;
      if (hypothesis is EssentialHypothesis) {
        for (final symbol in hypothesis.symbols) {
          if (scopeFrame.variables.contains(symbol)) {
            statementVariablesBuilder.add(symbol);
          }
        }
      }
    }

    final statementVariables = statementVariablesBuilder.build();
    return statementVariables;
  }

  static void verifyProof(Library library, FramedAssertion framedProof) {
    if (framedProof.assertion is! ProvableAssertion) {
      throw new StateError('Only proofs can be verified!');
    }
    final assertion = framedProof.assertion as ProvableAssertion;
    final proof = assertion.proof;
    int i = 0;
    if (proof is VerboseProof) {
      final stack = <AxiomaticAssertion>[];
      for (final label in proof.labels) {
        if (!library.labels.contains(label)) {
          throw new StateError('Unknown label $label!');
        }
        final framedHypothesis = library.hypothesesByLabel[label];
        if (framedHypothesis != null) {
          // Just push floating ones. We'll substitute when we reduce
          // over an assertion.
          final hypothesis = framedHypothesis.hypothesis;
          if (hypothesis is FloatingHypothesis) {
            stack.add(new AxiomaticAssertion((b) {
              b.label = '${i++}';
              b.constant = hypothesis.constant;
              b.symbols.add(hypothesis.variable);
            }));
          } else if (hypothesis is EssentialHypothesis) {
            stack.add(new AxiomaticAssertion((b) {
              b.label = '${i++}';
              b.constant = hypothesis.constant;
              b.symbols = hypothesis.symbols.toBuilder();
            }));
          }
          continue;
        }
        // Otherwise it has to be an assertion!
        final framedAssertion = library.assertionsByLabel[label];
        // TODO: error message?
        assert(framedAssertion != null);

        final unifications = <String, Assertion>{};
        final framedHypotheses =
            framedAssertion.frame.hypotheses.reversed.toList();
        final numHypotheses = framedAssertion.frame.hypotheses.length;
        final assertions = stack
            .sublist(stack.length - numHypotheses, stack.length)
            .reversed
            .toList();
        while (assertions.isNotEmpty && framedHypotheses.isNotEmpty) {
          final framedHypothesis = framedHypotheses.removeLast();
          final hypothesis = framedHypothesis.hypothesis;
          final assertion = assertions.removeLast();

          // Try to unify the two.
          if (hypothesis is FloatingHypothesis) {
            if (unifications.containsKey(hypothesis.variable)) {
              throw new StateError(
                  'Duplicate unification for ${hypothesis.variable} attempted!');
            }
            if (assertion.constant != hypothesis.constant) {
              throw new StateError('Cannot unify $assertion and $hypothesis!');
            }
            unifications[hypothesis.variable] = assertion;
          } else if (hypothesis is EssentialHypothesis) {
            if (assertion.constant != hypothesis.constant) {
              throw new StateError('Cannot unify $assertion and $hypothesis!');
            }
            // Verify unification
            final unifiedHypothesis =
                new BuiltList<String>(hypothesis.symbols.expand((symbol) {
              if (framedAssertion.frame.constants.contains(symbol)) {
                return [symbol];
              }
              final substitution = unifications[symbol];
              if (substitution == null) {
                throw new StateError('No substitution for $symbol defined!');
              }
              return substitution.symbols;
            }));
            if (unifiedHypothesis != assertion.symbols) {
              throw new StateError(
                  'Cannot unify $assertion and $hypothesis. Got $unifiedHypothesis!');
            }
          }
        }
        assert(assertions.isEmpty && framedHypotheses.isEmpty);
        // Pop the assertions.
        stack.removeRange(stack.length - numHypotheses, stack.length);
        // Verify disjoint variable conditions
        // Two conditions: if A and B are disjoint, then all the variables in
        // their substitutions [A], [B] need to be disjoint as well, and there
        // must be no common variables.
        // TODO: this is n**2 instead of n**2.
        for (final variable in unifications.keys) {
          print(framedProof.frame);
          final substitutionVariables = getAssertionVariables(
              unifications[variable], framedProof.frame);
          for (final other
              in framedProof.frame.disjointVariables[variable]) {
            assert(variable != other);
            if (!unifications.keys.contains(other)) {
              continue;
            }
            // TODO: this is wrong. I need the assertion's frame!
            final otherSubstitutionVariables = getAssertionVariables(
                unifications[other], framedProof.frame);
            if (otherSubstitutionVariables
                .intersection(substitutionVariables)
                .isNotEmpty) {
              throw new StateError(
                  'Disjoint $variable and $other have common variables under '
                  'unification: ${unifications[variable]} <> ${unifications[other]}!');
            }
            if (framedProof.frame.disjointVariables[other]
                .containsAll(substitutionVariables)) {
              throw new StateError('For disjoint $variable and $other during '
                  '${unifications[variable]} <> ${unifications[other]}, ${other}'
                  ' is not disjoint with all ${substitutionVariables}!');
            }
          }
        }
        // Now build the final unification.
        // Copied from above.
        final unifiedAssertion = new BuiltList<String>(
            framedAssertion.assertion.symbols.expand((symbol) {
          if (framedAssertion.frame.constants.contains(symbol)) {
            return [symbol];
          }
          final substitution = unifications[symbol];
          if (substitution == null) {
            throw new StateError('No substitution for $symbol defined!');
          }
          return substitution.symbols;
        }));
        stack.add(new AxiomaticAssertion((b) {
          b.label = '${i++}';
          b.constant = framedAssertion.assertion.constant;
          b.symbols = unifiedAssertion.toBuilder();
        }));
        print('------------------');
        unifications.forEach((s, l) => print('$s -> ${l.symbols.join(' ')}'));
        print(framedAssertion.assertion.constant +
            ' ' +
            framedAssertion.assertion.symbols.join(' '));
        print(stack.last.constant + ' ' + stack.last.symbols.join(' '));
        print('------------------');
      }
      // Finally, the stack should match the proof's symbols.
      if (stack.length != 1) {
        throw new StateError(
            'Stack should only contain 1 assertion! Contains: $stack!');
      }
      final result = stack.first;
      if (result.constant != assertion.constant ||
          result.symbols != assertion.symbols) {
        throw new StateError('Failed to proof $assertion with $result!');
      }
    } else if (assertion.proof is CompressedProof) {
      throw new UnimplementedError('CompressedProof');
    }
  }
}
