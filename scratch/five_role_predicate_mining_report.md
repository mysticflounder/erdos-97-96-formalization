# Five-role missing-predicate mining (2026-08-04)

Status: diagnostic search only. No predicate in this report is a proved
producer or a closure result.

## Current abstract residual

The endpoint five-role consumer leaves 16 Kalmanson-feasible cyclic orders in
each of the two branches:

* `A=J`: `dOA=dOC`, `dAC=dAK`, `dXA=dXK`;
* `X=C`: `dOJ=dOC`, `dAC=dAK`, `dCJ=dCK`.

The existing Kalmanson consumer closes the other 8 placements in each branch.
The exact rational metric search found no single additional distance equality
that closes all 16, and no single one-sided distance comparison that does so.

## Best missing predicates

The most source-faithful target is:

```text
P_radius: K = W.next ∈ SelectedClass D.A S.oppApex1 radius.
```

This is precisely the premise missing from the scratch localization audit.
In the abstract order search, its row/radius consequence is represented by
`dCO=dKO` in the `A=J` branch or `dJO=dKO` in the `X=C` branch. Either equality
alone closes 14 of the 16 residual orders.

Adding one more shell relation closes the remaining two:

* `A=J`: `dCX=dKX` together with `dCO=dKO`;
* `X=C`: `dCK=dJK` together with `dJO=dKO`.

Equivalent two-predicate covers were also found, but these are the most
natural representatives because they separate the missing radius placement
from the extra shell/equidistance information.

## Source-side result

`RetainedMatchingEndpointContinuation` proves `C_mem_radius` and
`J_mem_radius`. `RetainedMatchingCommonDeletionCycle` proves that `next` has
the relevant cap-interior membership, but not membership in the retained
`O`-radius. `EndpointFreshCrossOrCommonDeletion` gives either a cross hit at
`J` or a fresh common deletion; neither branch supplies `P_radius`.

Therefore the next producer target is a branch split on the
`RetainedMatchingNextLocation` constructor:

1. in the `freshFirstCap` branch, try to derive `P_radius` or an equivalent
   shell equality;
2. in the `freshSecondCap` branch, seek a separate cap-side/row predicate;
3. if neither is derivable, expose the failure as an explicit leaf obligation
   rather than adding a conditional consumer.

The same-cap cap-dot inequality was tested and is too weak: it does not remove
the residual orders in the linear metric relaxation. Cap contiguity likewise
removes none of the 16 residual orders.

## Reproduction artifacts

* `scratch/five_role_extra_predicate_search.py`
* `scratch/five_role_extra_predicate_search.json`
* `scratch/five_role_linear_predicate_search.py`
* `scratch/five_role_linear_predicate_search.json`
* `lean/scratch/MirrorSharedBlockerSameOrderAudit20260803.lean`

