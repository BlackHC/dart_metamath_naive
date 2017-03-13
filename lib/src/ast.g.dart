// GENERATED CODE - DO NOT MODIFY BY HAND

part of ast;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ConstantDecl
// **************************************************************************

class _$ConstantDecl extends ConstantDecl {
  @override
  final BuiltList<String> symbols;

  factory _$ConstantDecl([updates(ConstantDeclBuilder b)]) =>
      (new ConstantDeclBuilder()..update(updates)).build();

  _$ConstantDecl._({this.symbols}) : super._() {
    if (symbols == null) throw new ArgumentError.notNull('symbols');
  }

  @override
  ConstantDecl rebuild(updates(ConstantDeclBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ConstantDeclBuilder toBuilder() => new ConstantDeclBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! ConstantDecl) return false;
    return symbols == other.symbols;
  }

  @override
  int get hashCode {
    return $jf($jc(0, symbols.hashCode));
  }

  @override
  String toString() {
    return 'ConstantDecl {'
        'symbols=${symbols.toString()},\n'
        '}';
  }
}

class ConstantDeclBuilder
    implements Builder<ConstantDecl, ConstantDeclBuilder> {
  ConstantDecl _$v;

  ListBuilder<String> _symbols;
  ListBuilder<String> get symbols =>
      _$this._symbols ??= new ListBuilder<String>();
  set symbols(ListBuilder<String> symbols) => _$this._symbols = symbols;

  ConstantDeclBuilder();

  ConstantDeclBuilder get _$this {
    if (_$v != null) {
      _symbols = _$v.symbols?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConstantDecl other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(ConstantDeclBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  ConstantDecl build() {
    final result = _$v ?? new _$ConstantDecl._(symbols: symbols?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class VariableDecl
// **************************************************************************

class _$VariableDecl extends VariableDecl {
  @override
  final BuiltList<String> symbols;

  factory _$VariableDecl([updates(VariableDeclBuilder b)]) =>
      (new VariableDeclBuilder()..update(updates)).build();

  _$VariableDecl._({this.symbols}) : super._() {
    if (symbols == null) throw new ArgumentError.notNull('symbols');
  }

  @override
  VariableDecl rebuild(updates(VariableDeclBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  VariableDeclBuilder toBuilder() => new VariableDeclBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! VariableDecl) return false;
    return symbols == other.symbols;
  }

  @override
  int get hashCode {
    return $jf($jc(0, symbols.hashCode));
  }

  @override
  String toString() {
    return 'VariableDecl {'
        'symbols=${symbols.toString()},\n'
        '}';
  }
}

class VariableDeclBuilder
    implements Builder<VariableDecl, VariableDeclBuilder> {
  VariableDecl _$v;

  ListBuilder<String> _symbols;
  ListBuilder<String> get symbols =>
      _$this._symbols ??= new ListBuilder<String>();
  set symbols(ListBuilder<String> symbols) => _$this._symbols = symbols;

  VariableDeclBuilder();

  VariableDeclBuilder get _$this {
    if (_$v != null) {
      _symbols = _$v.symbols?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VariableDecl other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(VariableDeclBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  VariableDecl build() {
    final result = _$v ?? new _$VariableDecl._(symbols: symbols?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class DisjointRestriction
// **************************************************************************

class _$DisjointRestriction extends DisjointRestriction {
  @override
  final BuiltList<String> variables;

  factory _$DisjointRestriction([updates(DisjointRestrictionBuilder b)]) =>
      (new DisjointRestrictionBuilder()..update(updates)).build();

  _$DisjointRestriction._({this.variables}) : super._() {
    if (variables == null) throw new ArgumentError.notNull('variables');
  }

  @override
  DisjointRestriction rebuild(updates(DisjointRestrictionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DisjointRestrictionBuilder toBuilder() =>
      new DisjointRestrictionBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! DisjointRestriction) return false;
    return variables == other.variables;
  }

  @override
  int get hashCode {
    return $jf($jc(0, variables.hashCode));
  }

  @override
  String toString() {
    return 'DisjointRestriction {'
        'variables=${variables.toString()},\n'
        '}';
  }
}

class DisjointRestrictionBuilder
    implements Builder<DisjointRestriction, DisjointRestrictionBuilder> {
  DisjointRestriction _$v;

  ListBuilder<String> _variables;
  ListBuilder<String> get variables =>
      _$this._variables ??= new ListBuilder<String>();
  set variables(ListBuilder<String> variables) => _$this._variables = variables;

  DisjointRestrictionBuilder();

  DisjointRestrictionBuilder get _$this {
    if (_$v != null) {
      _variables = _$v.variables?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DisjointRestriction other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(DisjointRestrictionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  DisjointRestriction build() {
    final result =
        _$v ?? new _$DisjointRestriction._(variables: variables?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class FloatingHypothesis
// **************************************************************************

class _$FloatingHypothesis extends FloatingHypothesis {
  @override
  final String label;
  @override
  final String constant;
  @override
  final String variable;

  factory _$FloatingHypothesis([updates(FloatingHypothesisBuilder b)]) =>
      (new FloatingHypothesisBuilder()..update(updates)).build();

  _$FloatingHypothesis._({this.label, this.constant, this.variable})
      : super._() {
    if (label == null) throw new ArgumentError.notNull('label');
    if (constant == null) throw new ArgumentError.notNull('constant');
    if (variable == null) throw new ArgumentError.notNull('variable');
  }

  @override
  FloatingHypothesis rebuild(updates(FloatingHypothesisBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FloatingHypothesisBuilder toBuilder() =>
      new FloatingHypothesisBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! FloatingHypothesis) return false;
    return label == other.label &&
        constant == other.constant &&
        variable == other.variable;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, label.hashCode), constant.hashCode), variable.hashCode));
  }

  @override
  String toString() {
    return 'FloatingHypothesis {'
        'label=${label.toString()},\n'
        'constant=${constant.toString()},\n'
        'variable=${variable.toString()},\n'
        '}';
  }
}

class FloatingHypothesisBuilder
    implements Builder<FloatingHypothesis, FloatingHypothesisBuilder> {
  FloatingHypothesis _$v;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;

  String _constant;
  String get constant => _$this._constant;
  set constant(String constant) => _$this._constant = constant;

  String _variable;
  String get variable => _$this._variable;
  set variable(String variable) => _$this._variable = variable;

  FloatingHypothesisBuilder();

  FloatingHypothesisBuilder get _$this {
    if (_$v != null) {
      _label = _$v.label;
      _constant = _$v.constant;
      _variable = _$v.variable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FloatingHypothesis other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(FloatingHypothesisBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  FloatingHypothesis build() {
    final result = _$v ??
        new _$FloatingHypothesis._(
            label: label, constant: constant, variable: variable);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class EssentialHypothesis
// **************************************************************************

class _$EssentialHypothesis extends EssentialHypothesis {
  @override
  final String label;
  @override
  final String constant;
  @override
  final BuiltList<String> symbols;

  factory _$EssentialHypothesis([updates(EssentialHypothesisBuilder b)]) =>
      (new EssentialHypothesisBuilder()..update(updates)).build();

  _$EssentialHypothesis._({this.label, this.constant, this.symbols})
      : super._() {
    if (label == null) throw new ArgumentError.notNull('label');
    if (constant == null) throw new ArgumentError.notNull('constant');
    if (symbols == null) throw new ArgumentError.notNull('symbols');
  }

  @override
  EssentialHypothesis rebuild(updates(EssentialHypothesisBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EssentialHypothesisBuilder toBuilder() =>
      new EssentialHypothesisBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! EssentialHypothesis) return false;
    return label == other.label &&
        constant == other.constant &&
        symbols == other.symbols;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, label.hashCode), constant.hashCode), symbols.hashCode));
  }

  @override
  String toString() {
    return 'EssentialHypothesis {'
        'label=${label.toString()},\n'
        'constant=${constant.toString()},\n'
        'symbols=${symbols.toString()},\n'
        '}';
  }
}

class EssentialHypothesisBuilder
    implements Builder<EssentialHypothesis, EssentialHypothesisBuilder> {
  EssentialHypothesis _$v;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;

  String _constant;
  String get constant => _$this._constant;
  set constant(String constant) => _$this._constant = constant;

  ListBuilder<String> _symbols;
  ListBuilder<String> get symbols =>
      _$this._symbols ??= new ListBuilder<String>();
  set symbols(ListBuilder<String> symbols) => _$this._symbols = symbols;

  EssentialHypothesisBuilder();

  EssentialHypothesisBuilder get _$this {
    if (_$v != null) {
      _label = _$v.label;
      _constant = _$v.constant;
      _symbols = _$v.symbols?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EssentialHypothesis other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(EssentialHypothesisBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  EssentialHypothesis build() {
    final result = _$v ??
        new _$EssentialHypothesis._(
            label: label, constant: constant, symbols: symbols?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class AxiomaticAssertion
// **************************************************************************

class _$AxiomaticAssertion extends AxiomaticAssertion {
  @override
  final String label;
  @override
  final String constant;
  @override
  final BuiltList<String> symbols;

  factory _$AxiomaticAssertion([updates(AxiomaticAssertionBuilder b)]) =>
      (new AxiomaticAssertionBuilder()..update(updates)).build();

  _$AxiomaticAssertion._({this.label, this.constant, this.symbols})
      : super._() {
    if (label == null) throw new ArgumentError.notNull('label');
    if (constant == null) throw new ArgumentError.notNull('constant');
    if (symbols == null) throw new ArgumentError.notNull('symbols');
  }

  @override
  AxiomaticAssertion rebuild(updates(AxiomaticAssertionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AxiomaticAssertionBuilder toBuilder() =>
      new AxiomaticAssertionBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! AxiomaticAssertion) return false;
    return label == other.label &&
        constant == other.constant &&
        symbols == other.symbols;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, label.hashCode), constant.hashCode), symbols.hashCode));
  }

  @override
  String toString() {
    return 'AxiomaticAssertion {'
        'label=${label.toString()},\n'
        'constant=${constant.toString()},\n'
        'symbols=${symbols.toString()},\n'
        '}';
  }
}

class AxiomaticAssertionBuilder
    implements Builder<AxiomaticAssertion, AxiomaticAssertionBuilder> {
  AxiomaticAssertion _$v;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;

  String _constant;
  String get constant => _$this._constant;
  set constant(String constant) => _$this._constant = constant;

  ListBuilder<String> _symbols;
  ListBuilder<String> get symbols =>
      _$this._symbols ??= new ListBuilder<String>();
  set symbols(ListBuilder<String> symbols) => _$this._symbols = symbols;

  AxiomaticAssertionBuilder();

  AxiomaticAssertionBuilder get _$this {
    if (_$v != null) {
      _label = _$v.label;
      _constant = _$v.constant;
      _symbols = _$v.symbols?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AxiomaticAssertion other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(AxiomaticAssertionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  AxiomaticAssertion build() {
    final result = _$v ??
        new _$AxiomaticAssertion._(
            label: label, constant: constant, symbols: symbols?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ProvableAssertion
// **************************************************************************

class _$ProvableAssertion extends ProvableAssertion {
  @override
  final String label;
  @override
  final String constant;
  @override
  final BuiltList<String> symbols;
  @override
  final Proof proof;

  factory _$ProvableAssertion([updates(ProvableAssertionBuilder b)]) =>
      (new ProvableAssertionBuilder()..update(updates)).build();

  _$ProvableAssertion._({this.label, this.constant, this.symbols, this.proof})
      : super._() {
    if (label == null) throw new ArgumentError.notNull('label');
    if (constant == null) throw new ArgumentError.notNull('constant');
    if (symbols == null) throw new ArgumentError.notNull('symbols');
    if (proof == null) throw new ArgumentError.notNull('proof');
  }

  @override
  ProvableAssertion rebuild(updates(ProvableAssertionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvableAssertionBuilder toBuilder() =>
      new ProvableAssertionBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! ProvableAssertion) return false;
    return label == other.label &&
        constant == other.constant &&
        symbols == other.symbols &&
        proof == other.proof;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, label.hashCode), constant.hashCode), symbols.hashCode),
        proof.hashCode));
  }

  @override
  String toString() {
    return 'ProvableAssertion {'
        'label=${label.toString()},\n'
        'constant=${constant.toString()},\n'
        'symbols=${symbols.toString()},\n'
        'proof=${proof.toString()},\n'
        '}';
  }
}

class ProvableAssertionBuilder
    implements Builder<ProvableAssertion, ProvableAssertionBuilder> {
  ProvableAssertion _$v;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;

  String _constant;
  String get constant => _$this._constant;
  set constant(String constant) => _$this._constant = constant;

  ListBuilder<String> _symbols;
  ListBuilder<String> get symbols =>
      _$this._symbols ??= new ListBuilder<String>();
  set symbols(ListBuilder<String> symbols) => _$this._symbols = symbols;

  Proof _proof;
  Proof get proof => _$this._proof;
  set proof(Proof proof) => _$this._proof = proof;

  ProvableAssertionBuilder();

  ProvableAssertionBuilder get _$this {
    if (_$v != null) {
      _label = _$v.label;
      _constant = _$v.constant;
      _symbols = _$v.symbols?.toBuilder();
      _proof = _$v.proof;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvableAssertion other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(ProvableAssertionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  ProvableAssertion build() {
    final result = _$v ??
        new _$ProvableAssertion._(
            label: label,
            constant: constant,
            symbols: symbols?.build(),
            proof: proof);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class VerboseProof
// **************************************************************************

class _$VerboseProof extends VerboseProof {
  @override
  final BuiltList<String> labels;

  factory _$VerboseProof([updates(VerboseProofBuilder b)]) =>
      (new VerboseProofBuilder()..update(updates)).build();

  _$VerboseProof._({this.labels}) : super._() {
    if (labels == null) throw new ArgumentError.notNull('labels');
  }

  @override
  VerboseProof rebuild(updates(VerboseProofBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  VerboseProofBuilder toBuilder() => new VerboseProofBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! VerboseProof) return false;
    return labels == other.labels;
  }

  @override
  int get hashCode {
    return $jf($jc(0, labels.hashCode));
  }

  @override
  String toString() {
    return 'VerboseProof {'
        'labels=${labels.toString()},\n'
        '}';
  }
}

class VerboseProofBuilder
    implements Builder<VerboseProof, VerboseProofBuilder> {
  VerboseProof _$v;

  ListBuilder<String> _labels;
  ListBuilder<String> get labels =>
      _$this._labels ??= new ListBuilder<String>();
  set labels(ListBuilder<String> labels) => _$this._labels = labels;

  VerboseProofBuilder();

  VerboseProofBuilder get _$this {
    if (_$v != null) {
      _labels = _$v.labels?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerboseProof other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(VerboseProofBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  VerboseProof build() {
    final result = _$v ?? new _$VerboseProof._(labels: labels?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CompressedProof
// **************************************************************************

class _$CompressedProof extends CompressedProof {
  @override
  final BuiltList<String> labels;
  @override
  final BuiltList<String> steps;

  factory _$CompressedProof([updates(CompressedProofBuilder b)]) =>
      (new CompressedProofBuilder()..update(updates)).build();

  _$CompressedProof._({this.labels, this.steps}) : super._() {
    if (labels == null) throw new ArgumentError.notNull('labels');
    if (steps == null) throw new ArgumentError.notNull('steps');
  }

  @override
  CompressedProof rebuild(updates(CompressedProofBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CompressedProofBuilder toBuilder() =>
      new CompressedProofBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! CompressedProof) return false;
    return labels == other.labels && steps == other.steps;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, labels.hashCode), steps.hashCode));
  }

  @override
  String toString() {
    return 'CompressedProof {'
        'labels=${labels.toString()},\n'
        'steps=${steps.toString()},\n'
        '}';
  }
}

class CompressedProofBuilder
    implements Builder<CompressedProof, CompressedProofBuilder> {
  CompressedProof _$v;

  ListBuilder<String> _labels;
  ListBuilder<String> get labels =>
      _$this._labels ??= new ListBuilder<String>();
  set labels(ListBuilder<String> labels) => _$this._labels = labels;

  ListBuilder<String> _steps;
  ListBuilder<String> get steps => _$this._steps ??= new ListBuilder<String>();
  set steps(ListBuilder<String> steps) => _$this._steps = steps;

  CompressedProofBuilder();

  CompressedProofBuilder get _$this {
    if (_$v != null) {
      _labels = _$v.labels?.toBuilder();
      _steps = _$v.steps?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompressedProof other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(CompressedProofBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  CompressedProof build() {
    final result = _$v ??
        new _$CompressedProof._(labels: labels?.build(), steps: steps?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Scope
// **************************************************************************

class _$Scope extends Scope {
  @override
  final BuiltList<Statement> statements;

  factory _$Scope([updates(ScopeBuilder b)]) =>
      (new ScopeBuilder()..update(updates)).build();

  _$Scope._({this.statements}) : super._() {
    if (statements == null) throw new ArgumentError.notNull('statements');
  }

  @override
  Scope rebuild(updates(ScopeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ScopeBuilder toBuilder() => new ScopeBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! Scope) return false;
    return statements == other.statements;
  }

  @override
  int get hashCode {
    return $jf($jc(0, statements.hashCode));
  }

  @override
  String toString() {
    return 'Scope {'
        'statements=${statements.toString()},\n'
        '}';
  }
}

class ScopeBuilder implements Builder<Scope, ScopeBuilder> {
  Scope _$v;

  ListBuilder<Statement> _statements;
  ListBuilder<Statement> get statements =>
      _$this._statements ??= new ListBuilder<Statement>();
  set statements(ListBuilder<Statement> statements) =>
      _$this._statements = statements;

  ScopeBuilder();

  ScopeBuilder get _$this {
    if (_$v != null) {
      _statements = _$v.statements?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Scope other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(ScopeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  Scope build() {
    final result = _$v ?? new _$Scope._(statements: statements?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Include
// **************************************************************************

class _$Include extends Include {
  @override
  final String filename;

  factory _$Include([updates(IncludeBuilder b)]) =>
      (new IncludeBuilder()..update(updates)).build();

  _$Include._({this.filename}) : super._() {
    if (filename == null) throw new ArgumentError.notNull('filename');
  }

  @override
  Include rebuild(updates(IncludeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  IncludeBuilder toBuilder() => new IncludeBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! Include) return false;
    return filename == other.filename;
  }

  @override
  int get hashCode {
    return $jf($jc(0, filename.hashCode));
  }

  @override
  String toString() {
    return 'Include {'
        'filename=${filename.toString()},\n'
        '}';
  }
}

class IncludeBuilder implements Builder<Include, IncludeBuilder> {
  Include _$v;

  String _filename;
  String get filename => _$this._filename;
  set filename(String filename) => _$this._filename = filename;

  IncludeBuilder();

  IncludeBuilder get _$this {
    if (_$v != null) {
      _filename = _$v.filename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Include other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(IncludeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  Include build() {
    final result = _$v ?? new _$Include._(filename: filename);
    replace(result);
    return result;
  }
}
