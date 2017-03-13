// GENERATED CODE - DO NOT MODIFY BY HAND

part of library;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ScopeFrame
// **************************************************************************

class _$ScopeFrame extends ScopeFrame {
  @override
  final BuiltSet<String> constants;
  @override
  final BuiltSet<String> variables;
  @override
  final BuiltSetMultimap<String, String> disjointVariables;
  @override
  final BuiltList<FramedHypothesis> hypotheses;
  @override
  final BuiltMap<String, FramedHypothesis> floatingHypothesesByVariable;

  factory _$ScopeFrame([updates(ScopeFrameBuilder b)]) =>
      (new ScopeFrameBuilder()..update(updates)).build();

  _$ScopeFrame._(
      {this.constants,
      this.variables,
      this.disjointVariables,
      this.hypotheses,
      this.floatingHypothesesByVariable})
      : super._() {
    if (constants == null) throw new ArgumentError.notNull('constants');
    if (variables == null) throw new ArgumentError.notNull('variables');
    if (disjointVariables == null)
      throw new ArgumentError.notNull('disjointVariables');
    if (hypotheses == null) throw new ArgumentError.notNull('hypotheses');
    if (floatingHypothesesByVariable == null)
      throw new ArgumentError.notNull('floatingHypothesesByVariable');
  }

  @override
  ScopeFrame rebuild(updates(ScopeFrameBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ScopeFrameBuilder toBuilder() => new ScopeFrameBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! ScopeFrame) return false;
    return constants == other.constants &&
        variables == other.variables &&
        disjointVariables == other.disjointVariables &&
        hypotheses == other.hypotheses &&
        floatingHypothesesByVariable == other.floatingHypothesesByVariable;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, constants.hashCode), variables.hashCode),
                disjointVariables.hashCode),
            hypotheses.hashCode),
        floatingHypothesesByVariable.hashCode));
  }

  @override
  String toString() {
    return 'ScopeFrame {'
        'constants=${constants.toString()},\n'
        'variables=${variables.toString()},\n'
        'disjointVariables=${disjointVariables.toString()},\n'
        'hypotheses=${hypotheses.toString()},\n'
        'floatingHypothesesByVariable=${floatingHypothesesByVariable.toString()},\n'
        '}';
  }
}

class ScopeFrameBuilder implements Builder<ScopeFrame, ScopeFrameBuilder> {
  ScopeFrame _$v;

  SetBuilder<String> _constants;
  SetBuilder<String> get constants =>
      _$this._constants ??= new SetBuilder<String>();
  set constants(SetBuilder<String> constants) => _$this._constants = constants;

  SetBuilder<String> _variables;
  SetBuilder<String> get variables =>
      _$this._variables ??= new SetBuilder<String>();
  set variables(SetBuilder<String> variables) => _$this._variables = variables;

  SetMultimapBuilder<String, String> _disjointVariables;
  SetMultimapBuilder<String, String> get disjointVariables =>
      _$this._disjointVariables ??= new SetMultimapBuilder<String, String>();
  set disjointVariables(SetMultimapBuilder<String, String> disjointVariables) =>
      _$this._disjointVariables = disjointVariables;

  ListBuilder<FramedHypothesis> _hypotheses;
  ListBuilder<FramedHypothesis> get hypotheses =>
      _$this._hypotheses ??= new ListBuilder<FramedHypothesis>();
  set hypotheses(ListBuilder<FramedHypothesis> hypotheses) =>
      _$this._hypotheses = hypotheses;

  MapBuilder<String, FramedHypothesis> _floatingHypothesesByVariable;
  MapBuilder<String, FramedHypothesis> get floatingHypothesesByVariable =>
      _$this._floatingHypothesesByVariable ??=
          new MapBuilder<String, FramedHypothesis>();
  set floatingHypothesesByVariable(
          MapBuilder<String, FramedHypothesis> floatingHypothesesByVariable) =>
      _$this._floatingHypothesesByVariable = floatingHypothesesByVariable;

  ScopeFrameBuilder();

  ScopeFrameBuilder get _$this {
    if (_$v != null) {
      _constants = _$v.constants?.toBuilder();
      _variables = _$v.variables?.toBuilder();
      _disjointVariables = _$v.disjointVariables?.toBuilder();
      _hypotheses = _$v.hypotheses?.toBuilder();
      _floatingHypothesesByVariable =
          _$v.floatingHypothesesByVariable?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScopeFrame other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(ScopeFrameBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  ScopeFrame build() {
    final result = _$v ??
        new _$ScopeFrame._(
            constants: constants?.build(),
            variables: variables?.build(),
            disjointVariables: disjointVariables?.build(),
            hypotheses: hypotheses?.build(),
            floatingHypothesesByVariable:
                floatingHypothesesByVariable?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class FramedHypothesis
// **************************************************************************

class _$FramedHypothesis extends FramedHypothesis {
  @override
  final ScopeFrame frame;
  @override
  final Hypothesis hypothesis;

  factory _$FramedHypothesis([updates(FramedHypothesisBuilder b)]) =>
      (new FramedHypothesisBuilder()..update(updates)).build();

  _$FramedHypothesis._({this.frame, this.hypothesis}) : super._() {
    if (frame == null) throw new ArgumentError.notNull('frame');
    if (hypothesis == null) throw new ArgumentError.notNull('hypothesis');
  }

  @override
  FramedHypothesis rebuild(updates(FramedHypothesisBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FramedHypothesisBuilder toBuilder() =>
      new FramedHypothesisBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! FramedHypothesis) return false;
    return frame == other.frame && hypothesis == other.hypothesis;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, frame.hashCode), hypothesis.hashCode));
  }

  @override
  String toString() {
    return 'FramedHypothesis {'
        'frame=${frame.toString()},\n'
        'hypothesis=${hypothesis.toString()},\n'
        '}';
  }
}

class FramedHypothesisBuilder
    implements Builder<FramedHypothesis, FramedHypothesisBuilder> {
  FramedHypothesis _$v;

  ScopeFrameBuilder _frame;
  ScopeFrameBuilder get frame => _$this._frame ??= new ScopeFrameBuilder();
  set frame(ScopeFrameBuilder frame) => _$this._frame = frame;

  Hypothesis _hypothesis;
  Hypothesis get hypothesis => _$this._hypothesis;
  set hypothesis(Hypothesis hypothesis) => _$this._hypothesis = hypothesis;

  FramedHypothesisBuilder();

  FramedHypothesisBuilder get _$this {
    if (_$v != null) {
      _frame = _$v.frame?.toBuilder();
      _hypothesis = _$v.hypothesis;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FramedHypothesis other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(FramedHypothesisBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  FramedHypothesis build() {
    final result = _$v ??
        new _$FramedHypothesis._(frame: frame?.build(), hypothesis: hypothesis);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class FramedAssertion
// **************************************************************************

class _$FramedAssertion extends FramedAssertion {
  @override
  final ScopeFrame frame;
  @override
  final Assertion assertion;

  factory _$FramedAssertion([updates(FramedAssertionBuilder b)]) =>
      (new FramedAssertionBuilder()..update(updates)).build();

  _$FramedAssertion._({this.frame, this.assertion}) : super._() {
    if (frame == null) throw new ArgumentError.notNull('frame');
    if (assertion == null) throw new ArgumentError.notNull('assertion');
  }

  @override
  FramedAssertion rebuild(updates(FramedAssertionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FramedAssertionBuilder toBuilder() =>
      new FramedAssertionBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! FramedAssertion) return false;
    return frame == other.frame && assertion == other.assertion;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, frame.hashCode), assertion.hashCode));
  }

  @override
  String toString() {
    return 'FramedAssertion {'
        'frame=${frame.toString()},\n'
        'assertion=${assertion.toString()},\n'
        '}';
  }
}

class FramedAssertionBuilder
    implements Builder<FramedAssertion, FramedAssertionBuilder> {
  FramedAssertion _$v;

  ScopeFrameBuilder _frame;
  ScopeFrameBuilder get frame => _$this._frame ??= new ScopeFrameBuilder();
  set frame(ScopeFrameBuilder frame) => _$this._frame = frame;

  Assertion _assertion;
  Assertion get assertion => _$this._assertion;
  set assertion(Assertion assertion) => _$this._assertion = assertion;

  FramedAssertionBuilder();

  FramedAssertionBuilder get _$this {
    if (_$v != null) {
      _frame = _$v.frame?.toBuilder();
      _assertion = _$v.assertion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FramedAssertion other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(FramedAssertionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  FramedAssertion build() {
    final result = _$v ??
        new _$FramedAssertion._(frame: frame?.build(), assertion: assertion);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Library
// **************************************************************************

class _$Library extends Library {
  @override
  final BuiltMap<String, FramedHypothesis> hypothesesByLabel;
  @override
  final BuiltMap<String, FramedAssertion> assertionsByLabel;
  @override
  final BuiltSet<String> labels;

  factory _$Library([updates(LibraryBuilder b)]) =>
      (new LibraryBuilder()..update(updates)).build();

  _$Library._({this.hypothesesByLabel, this.assertionsByLabel, this.labels})
      : super._() {
    if (hypothesesByLabel == null)
      throw new ArgumentError.notNull('hypothesesByLabel');
    if (assertionsByLabel == null)
      throw new ArgumentError.notNull('assertionsByLabel');
    if (labels == null) throw new ArgumentError.notNull('labels');
  }

  @override
  Library rebuild(updates(LibraryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LibraryBuilder toBuilder() => new LibraryBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! Library) return false;
    return hypothesesByLabel == other.hypothesesByLabel &&
        assertionsByLabel == other.assertionsByLabel &&
        labels == other.labels;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, hypothesesByLabel.hashCode), assertionsByLabel.hashCode),
        labels.hashCode));
  }

  @override
  String toString() {
    return 'Library {'
        'hypothesesByLabel=${hypothesesByLabel.toString()},\n'
        'assertionsByLabel=${assertionsByLabel.toString()},\n'
        'labels=${labels.toString()},\n'
        '}';
  }
}

class LibraryBuilder implements Builder<Library, LibraryBuilder> {
  Library _$v;

  MapBuilder<String, FramedHypothesis> _hypothesesByLabel;
  MapBuilder<String, FramedHypothesis> get hypothesesByLabel =>
      _$this._hypothesesByLabel ??= new MapBuilder<String, FramedHypothesis>();
  set hypothesesByLabel(
          MapBuilder<String, FramedHypothesis> hypothesesByLabel) =>
      _$this._hypothesesByLabel = hypothesesByLabel;

  MapBuilder<String, FramedAssertion> _assertionsByLabel;
  MapBuilder<String, FramedAssertion> get assertionsByLabel =>
      _$this._assertionsByLabel ??= new MapBuilder<String, FramedAssertion>();
  set assertionsByLabel(
          MapBuilder<String, FramedAssertion> assertionsByLabel) =>
      _$this._assertionsByLabel = assertionsByLabel;

  SetBuilder<String> _labels;
  SetBuilder<String> get labels => _$this._labels ??= new SetBuilder<String>();
  set labels(SetBuilder<String> labels) => _$this._labels = labels;

  LibraryBuilder();

  LibraryBuilder get _$this {
    if (_$v != null) {
      _hypothesesByLabel = _$v.hypothesesByLabel?.toBuilder();
      _assertionsByLabel = _$v.assertionsByLabel?.toBuilder();
      _labels = _$v.labels?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Library other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(LibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  Library build() {
    final result = _$v ??
        new _$Library._(
            hypothesesByLabel: hypothesesByLabel?.build(),
            assertionsByLabel: assertionsByLabel?.build(),
            labels: labels?.build());
    replace(result);
    return result;
  }
}
