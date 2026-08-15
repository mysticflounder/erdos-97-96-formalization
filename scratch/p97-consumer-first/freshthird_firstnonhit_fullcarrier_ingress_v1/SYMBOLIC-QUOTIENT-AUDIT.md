# Symbolic anonymous-carrier quotient audit

Date: 2026-08-11

## Short answer

Not from the current source contract. Naming the four points of the Q
support and the finitely many already-named blocker centers does not give a
source-faithful quotient of the remaining carrier. Anonymous points affect
all of the following simultaneously: which points are sources, their actual
blocker centers, the exact-four support at each center, deletion survival, cap
membership, and the cyclic/metric relations. A finite collection of unary
types or Presburger counts records none of the required unbounded
source-to-row incidence relation unless a new source theorem has already
bounded the relevant core.

In particular, introducing one symbolic source center does not solve the
problem. The live leaf supplies no theorem that an anonymous source center
has a row containing three Q points, nor that three Q-point deletions are
blocked at it. Those are precisely the missing conclusions of the active
anchor.

## What a valid symbolic contract would have to say

A prospective finite-type implementation would need a finite type set `T` of
anonymous point/center incidence types, unbounded count variables `n[t]`, and
finite relation tables for every selected-row, blocker, cap, and order
predicate. Source-faithfulness would require Lean theorems of the following
form (the first one is currently missing):

```lean
-- Extraction from every live counterexample, with no bound on D.A.card.
theorem live_to_symbolic_quotient
    (h : LiveFirstNonHitResidual ...) :
    ∃ q : SymbolicQuotient T,
      EncodesAllCarrierWideK4BlockerMinimalityCapOrder h q := ...

-- Every symbolic model is a sound abstraction of the source hypotheses.
theorem symbolic_quotient_sound
    (q : SymbolicQuotient T)
    (hq : EncodesAllCarrierWideK4BlockerMinimalityCapOrder h q) :
    SourceConsequences q := ...

-- Only this implication promotes an UNSAT arithmetic/FOL result.
theorem symbolic_unsat_lifts
    (hunsat : ∀ q, ¬ EncodesAllCarrierWideK4BlockerMinimalityCapOrder h q) :
    ¬ LiveFirstNonHitResidual ... := ...
```

For this anchor, `SourceConsequences q` must include either the exact
three-blocked-deletions packet

```lean
∃ source, centerAt source ≠ centerAt Q.source₁ ∧
  ∃ W ⊆ Q.selectedSupport, 3 ≤ W.card ∧
    ∀ w ∈ W, ¬ HasNEquidistantPointsAt 4 (D.A.erase w) (centerAt source)
```

or a direct source-clean contradiction. Merely recording counts of
anonymous types is not this consequence.

The only credible way to make `T` finite is first to prove a uniform
bounded-core theorem: every live instance has a witness involving at most
`K` anonymous carrier points and centers, for a fixed `K` independent of
`D.A.card`, together with an extraction theorem preserving every K4,
deletion, cap, order, and metric guard on that core. Then a finite relational
quotient can name those at-most-`K` elements and exact-replay all relations.
No such `K`-core or universal lift is present in the current tree.

## Why finite types/Presburger do not repair the ingress

Presburger counts can safely express cardinalities of a proved finite set
of unary types, including threshold counts such as `0`, `1`, `2`, `3`, `4`,
and `4+`. They cannot by themselves express the missing binary relation
between every anonymous source and its exact selected support, or the
quantification over every anonymous center and every deletion. Replacing
those relations by independent type counts permits models in which the same
anonymous point is silently reused across rows, or in which a row has no
actual source/center witness. Adding all pair and triple types only moves the
same issue to higher arity; without a bounded core there is no finite arity
cut justified by the Lean hypotheses.

FOL compactness gives the same obstruction in another form. The existing
source-mapped incidence axioms have a finite model (the recorded Mace4 model
has domain eight), so they do not entail the missing producer. A symbolic
unbounded extension can add anonymous points and rows while preserving every
finite local fragment unless a new global axiom rules that extension out.
Compactness therefore cannot turn the current local incidence packet into the
universal three-point Q overlap.

## Prover capability assessment

* **Vampire** can refute a supplied producer plus the clean terminal, as in
  `freshthird_firstnonhit_fo_v1`; it cannot invent the missing existential
  source theorem. With the current axioms it is correctly allowed to find a
  model/countermodel of the abstraction.
* **Mace4** searches finite models only. A model is useful evidence that a
  proposed quotient is too weak, but no finite-model result is a universal
  P97 statement and it cannot certify arbitrary `D.A.card`.
* **CEGAR** can propose a new relation or clause from countermodels, but each
  refinement needs a source proof and a Lean extraction/lift theorem before it
  is a valid production cut. It cannot promote a discovered clause merely
  because it survives all tested finite sizes.
* **Presburger/SAT encodings** are appropriate after a bounded-core or
  source-level finite-type theorem. Before that point, an UNSAT result would
  establish only the chosen abstraction (or a fixed-cardinality instance).

## Decision

Do not launch a symbolic quotient wave. The smallest enabling theorem remains
the cardinality-independent three-blocked-deletions producer recorded in
`INGRESS-AUDIT.md` (or an equivalent row-relocation/direct metric theorem).
Once that producer exists, the existing Lean consumer closes the target and
solver work is optional regression testing rather than a closure route.
