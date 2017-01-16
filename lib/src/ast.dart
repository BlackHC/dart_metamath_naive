/// AST model for an `mm` file.
library ast;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'ast.g.dart';

abstract class Statement {}

abstract class ConstantDecl implements Built<ConstantDecl, ConstantDeclBuilder>, Statement {
  BuiltList<String> get symbols;

  ConstantDecl._();
  factory ConstantDecl([updates(ConstantDeclBuilder b)]) = _$ConstantDecl;
}

abstract class VariableDecl implements Built<VariableDecl, VariableDeclBuilder>, Statement {
  BuiltList<String> get symbols;

  VariableDecl._();
  factory VariableDecl([updates(VariableDeclBuilder b)]) = _$VariableDecl;
}

abstract class DisjointRestriction implements Built<DisjointRestriction, DisjointRestrictionBuilder>, Statement {
  BuiltList<String> get variables;

  DisjointRestriction._();
  factory DisjointRestriction([updates(DisjointRestrictionBuilder b)]) = _$DisjointRestriction;
}

abstract class Hypothesis implements Statement {
  String get label;
}

abstract class FloatingHypothesis
    implements Built<FloatingHypothesis, FloatingHypothesisBuilder>, Hypothesis {
  String get label;
  String get constant;
  String get variable;

  FloatingHypothesis._();
  factory FloatingHypothesis([updates(FloatingHypothesisBuilder b)]) =
      _$FloatingHypothesis;
}

abstract class EssentialHypothesis
    implements Built<EssentialHypothesis, EssentialHypothesisBuilder>, Hypothesis {
  String get label;
  String get constant;
  BuiltList<String> get symbols;

  EssentialHypothesis._();
  factory EssentialHypothesis([updates(EssentialHypothesisBuilder b)]) =
      _$EssentialHypothesis;
}

abstract class Assertion implements Statement {
  String get label;
  String get constant;
  BuiltList<String> get symbols;
}

abstract class AxiomaticAssertion implements Built<AxiomaticAssertion, AxiomaticAssertionBuilder>, Assertion {
  String get label;
  String get constant;
  BuiltList<String> get symbols;

  AxiomaticAssertion._();
  factory AxiomaticAssertion([updates(AxiomaticAssertionBuilder b)]) = _$AxiomaticAssertion;
}

abstract class Proof {}

abstract class ProvableAssertion implements Built<ProvableAssertion, ProvableAssertionBuilder>, Assertion {
  String get label;
  String get constant;
  BuiltList<String> get symbols;
  Proof get proof;

  ProvableAssertion._();
  factory ProvableAssertion([updates(ProvableAssertionBuilder b)]) = _$ProvableAssertion;
}

abstract class VerboseProof implements Built<VerboseProof, VerboseProofBuilder>, Proof {
  BuiltList<String> get labels;

  VerboseProof._();
  factory VerboseProof([updates(VerboseProofBuilder b)]) = _$VerboseProof;
}

abstract class CompressedProof implements Built<CompressedProof, CompressedProofBuilder>, Proof {
  BuiltList<String> get labels;
  BuiltList<String> get steps;

  CompressedProof._();
  factory CompressedProof([updates(CompressedProofBuilder b)]) = _$CompressedProof;
}

abstract class Scope implements Built<Scope, ScopeBuilder>, Statement {
  BuiltList<Statement> get statements;

  Scope._();
  factory Scope([updates(ScopeBuilder b)]) = _$Scope;
}

abstract class Include implements Built<Include, IncludeBuilder>, Statement {
  String get filename;

  Include._();
  factory Include([updates(IncludeBuilder b)]) = _$Include;
}