# Package 1: outside-slice counting

Date: 2026-09-05. Lane: `native-outside-counting-20260905`.
Lane baseline: `9120a9609b4124e9808f166523b9c5a3caa20663`.
Status: isolated proof check passed; live integration applied; governed module
and consumer builds and fresh axiom probes pending.

## Scope and argument

This implements package 1 of the
[native-bank replacement plan](../../prove2me/native-bank-replacement-plan.md).
The two targets are `outsideHits_card_eq_two` in the namespaces
`Problem97.BlockerVExactFifteenFourRowCoverage` and
`Problem97.BlockerVExactSixteenFourRowCoverage`.

The shared theorem `Problem97.FiniteRowCardinality.outsideSlice_card_eq_two`
extracts the existing exact-17 finite-set argument. Two distinct certified cap
members give an intersection of cardinality at least two. The cap bound makes
that cardinality exactly two. Subtracting it from a support of cardinality four
leaves exactly two points outside the cap.

Each adapter takes the support to be the Boolean membership filter and the cap
to be the `longLabelBool` filter. It identifies the intersection with the
Boolean conjunction filter, supplies the two fixed hits, and applies the shared
theorem. Injectivity of `outsideLabel` and an exact image identity transport the
result to `outsideHits`. Kernel-checked `decide` proofs cover only fixed finite
label facts; the proof does not enumerate arbitrary row-membership predicates.

The exact-17 declaration retains its public signature as a call to the shared
theorem. The exact-15/16 public signatures, docstrings, finite definitions, and
`outsidePairOfMembership` consumers are preserved.

## Dependency ledger

| Target | Before | Intended after | Immediate consumer |
| --- | --- | --- | --- |
| Exact-15 `outsideHits_card_eq_two` | `native_decide +revert` | Shared counting and label adapter | `outsidePairOfMembership` |
| Exact-16 `outsideHits_card_eq_two` | `native_decide +revert` | Shared counting and label adapter | `outsidePairOfMembership` |
| Exact-17 `outsideSlice_card_eq_two` | General finite-set proof | Compatibility call to extracted proof | Existing exact-17 source-model proofs |

`ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean` imports all three existing
modules and is the affected consumer build target. The separate exact-15
`exists_metricMotif_of_pairwiseSeparated` and exact-16
`metricObstructionOccurs_of_pairwiseSeparated` classifiers retain native proofs.
This package removes two cardinality computation sites; it does not retire a
whole certificate bank, remove the exact-10/11 banks, close a `sorry`, or make
the P97 root core-only.

The frozen-manifest preflight found none of the three edited existing source
paths in a `lean_dependency_modules` or `lean_source_manifest` array. No frozen
bank chain was identified as requiring refreezing for this change. This is not
a freshness claim about all historical import-closure audit records.

## Validation record

Pre-edit SHA-256 digests (all paths below `lean/Erdos9796Proof/P97/ATail/`):

| File | SHA-256 |
| --- | --- |
| `BlockerVExactFifteenFourRowCoverage.lean` | `143ac43ddcc1b4864ea9793dd62b6a9452b248f34a2c23166c0bd70001560fa0` |
| `BlockerVExactSixteenFourRowCoverage.lean` | `063e5759395b8e385ef99e7fbb9c34fb330b8a65025e2022adaa5f53c6cc49ad` |
| `BlockerVExactSeventeenSourceNormalForm.lean` | `fc0fc93d72ecda88afb914deb6dc68f581885c3ae50b575ea58c9cc297828c4d` |

Toolchain: Lean `v4.27.0`, repository Mathlib `v4.27.0`.
The lane's generated evidence is under
`scratch/runs/native-outside-counting-20260905/run-0001/`.

The unchanged exact-16 classifier makes the full module rebuild expensive:
historical governed timings were 2,849 seconds on 2026-08-11 and 4,854 / 5,155
seconds on 2026-09-05 / 06. These are historical observations, not a timing
guarantee or a measured regression from this package.

An isolated Mathlib-only draft compiled successfully with `autoImplicit=false`
and a 4096 MB memory limit. Its exact-15/16 definitions and theorem signatures
were checked against the live source. Both replacement declarations reported
exactly `[propext, Classical.choice, Quot.sound]` from `#print axioms`.
Independent reviewer `plan_review` passed the draft's counting argument,
signature preservation, and fixed-label case checks, while requiring live
integration and consumer validation before completion.

The live integration also passed independent static review by `plan_review`:
the extracted proof and both adapters match the checked draft, the public
interfaces are preserved, and the helper's import direction introduces no cycle.
Module builds, consumer build, and fresh axiom probes remain pending. The
isolated draft is preliminary evidence.
