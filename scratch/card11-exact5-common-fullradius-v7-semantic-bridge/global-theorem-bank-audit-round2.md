# Exact-11 G3 global theorem-bank audit, round 2

This is a read-only source/import audit of the 42 retained G3 semantic clause
shapes. It does not by itself establish certificate ingress or exact-11
closure.

## Classification

- 28 shapes already have theorem coverage.
- 7 shapes need reusable semantic-bank lemmas.
- 7 shapes are exact-11 finite-map or Tseitin glue.
- G3 selector totality is separate and already proved by
  `CanonicalPacket.g3SelectorTotalityClause_sat`.

| Family | Shapes | Class | Existing producer or next proof |
|---|---:|---|---|
| convex-five-point-core-forward-exclusions | 1 | existing, imported | `Census554.ConvexFivePointCore.false_of_core` |
| duplicate-center-core-exclusions | 1 | existing, imported | `EqualityCore.not_realizes_of_duplicateCenterCore` |
| first-apex-exact-five-global-equality-seeds | 1 | reusable lemma | exact-row semantic bundle |
| first-apex-named-exact-five-entire-class | 2 | reusable lemma | exact-row semantic bundle |
| global-edge-equality-transitivity | 1 | reusable lemma | generic equality-transitivity clause satisfier |
| inherited-census554-base | 7 | existing local wrapper | `CanonicalPacket.baseCnf_sat` |
| inherited-separation | 3 | existing local wrapper | `CanonicalPacket.separationFamily_sat` |
| inherited-source-tail | 10 | existing local wrapper | `CanonicalPacket.shellCaseInheritedTailFamily_sat` |
| local-equality-transitivity | 1 | reusable lemma | generic equality-transitivity clause satisfier |
| perpendicular-bisector-core-exclusions | 1 | existing, imported | `EqualityCore.false_of_convexIndep_of_perpBisectorCore` |
| selected-row-global-equality-seeds | 1 | reusable lemma | exact-row positive-literal theorem |
| selected-row-internal-radius-equalities | 1 | reusable lemma | exact-row positive-literal theorem |
| source-center-iff-some-source-row-choice | 2 | exact-11 glue | finite source-choice map |
| source-choice-implies-entire-blocker-radius-class | 1 | existing, imported | `GeneralCarrierBridge.exactAt_blocker` |
| source-choice-no-qfree-after-that-source-deletion | 1 | existing, imported | `CriticalShellSystem.no_qfree_at` |
| used-center-iff-some-source-center-map | 1 | exact-11 glue | finite source-center map |
| v6-local-four-class-witness-iff | 2 | exact-11 glue | definitional Tseitin valuation |
| v6-qdeleted-pair-witness-iff | 2 | exact-11 glue | definitional Tseitin valuation |
| v6-u5-common-bisector-triple-incompatibilities | 1 | existing, imported | `u5_common_bisector_triple_incompatibility` |
| v6-u5-nontriple-equilateral-incompatibilities | 1 | existing, imported | `u5_nontriple_equilateral_on_p_circle_incompatibility` |
| v7-global-two-center-bisector-parity | 1 | existing local wrapper | `CanonicalPacket.allOccurrenceClauses_sat` |

## Reusable lemmas banked

1. `Census554.Realizes.exactRowSemantic` now bundles:
   - equal center distances for any two row members; and
   - unequal center distances between a row member and a point outside the
     exact row.
2. `Census554.evalClauseD_transitivityClause` is the
   valuation-independent equality-transitivity clause theorem:
   a valuation that decodes equality variables as equality of semantic values
   satisfies `[-eq(e,f), -eq(f,g), +eq(e,g)]`.

These feed the first-apex seed/class families, selected-row local/global seed
families, and both local and global transitivity families. Both declarations
completed a focused global-wrapper build on 2026-07-30.

## Remaining bridge order

1. Define the exact G3 semantic valuation and finite-map/Tseitin glue.
2. Add U5 descriptor adapters to the two existing U5 kernels.
3. Reconstruct/authenticate every retained G3 entry and compose with
   `ExactFiveCommonShellV7G3Replay.startUnsatisfiable`.

The existing local prefix, selector, and cyclic-parity wrappers were
source-clean when audited, but were not yet root-imported. Proof-blueprint
verification was not run because the source/build tree was concurrently
changing.
