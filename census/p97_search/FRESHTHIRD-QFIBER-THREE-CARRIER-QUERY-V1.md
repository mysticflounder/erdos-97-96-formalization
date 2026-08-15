# FreshThird exact-three carrier query v1

## Scope

`freshthird_qfiber_three_carrier_query_v1.py` is the first source-owned
structural query for the exact-three `Q`-fiber carrier packet. It represents
67 named point roles and 14 exact selected-four rows. It does not enumerate or
bound the ambient carrier.

The source contract is
`FreshThirdQFiberThreeCarrierFiniteSourceTheory.CompleteSourceTheory`, with
ingress supplied by `completeSourceTheory_ofView`. The query is split into the
four values of the intrinsic `boundaryIndex : Fin 4`.

## Source-faithful representation

- `Same` is a canonical restricted-growth partition of the 67 roles.
- `Incident point row` is exactly aliasing with one of the row's four slots.
- every row has four distinct slots, excludes its center, and has one radius
  class at that center;
- cap membership and cap interior remain separate finite predicates, with
  source-proved interior inclusion and cross-cap exclusion;
- boundary order is a strict total order on `Same` classes;
- distance equality is represented by finite equality classes;
- `HasFourAfterDeleting` and `Nonrobust` remain opaque ambient semantic atoms;
  they are not reconstructed from the named roles;
- every failed named deletion implies source-proved nonrobustness;
- all row-support and overlap counts are computed through `Same` classes.

The Q row is explicitly identified with the inherited fresh row. The Q row,
the unique boundary blocker's row, and all four second-order blocker rows have
source-proved exact-row semantics. Nonboundary Q blockers are normalized to
the existing `freshCenter` and Q row, so no duplicate synthetic rows are
introduced.

## Constraint groups

1. `same_equivalence_canonical`
2. `complete_exact_row_theory`
3. `complete_relational_theory`
4. `cap_skolem_ranges`
5. `pinned_source_theory`
6. `carrier_source_theory`

Each group is tracked in Z3 for coarse UNSAT-core provenance. The manifest
records exact SHA-256 hashes of the Python producer and the three Lean source
modules, all row origins, role and row counts, and explicit false claims.

## Verdict contract

- `SAT_ABSTRACTION` is theorem-mining data only.
- `UNSAT_RELAXATION` is not promotion-ready. A future terminal result requires
  independent certificate replay and a Lean bridge to `QueryContract`.
- `UNKNOWN` is fail-closed.

No result from this module alone claims source entitlement, a theorem,
universal closure, Lean closure, or Euclidean realizability.

## First-wave objective

Run all four boundary-index cells, freeze their canonical signatures, and
mine only the new wave for a uniform clause. Productive candidates must either
force positive pinned-fan/Q incidence, route every disjoint survivor to an
existing cross-deletion/geometric terminal, or expose a source theorem absent
from the current finite contract. No learned clause is admitted until its
source producer and Lean consumer are named.
