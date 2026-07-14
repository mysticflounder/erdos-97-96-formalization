# ATAIL endpoint-spending blocker-cycle assessment

**Status: CHECKED SCRATCH CONSUMER; LIVE PRODUCER OPEN.**

This is authorized parallel ATAIL research.  It does not claim that
`K-A-PAIR` is closed and does not alter the imported Lean source graph.

## Verdict

The saved `(4,5,6)` one-way/distinct-blocker case contains a real two-step
endpoint-spending chain, but not a same-cap descent contradiction.  Its third
edge is exactly where the current live interface runs out:

```text
cap C0               = [0,1,2,3]
right endpoint       = 3
critical blocker map = 0 -> 1 -> 2 -> 0

source  blocker  exact row at blocker  endpoint  consequence
0       1        {0,3,6,9}             hit       0 < 1
1       2        {1,3,5,8}             hit       1 < 2
2       0        {2,4,5,9}             omitted   no push
```

The return blocker `0` is itself the left endpoint.  Its positive-radius
exact row cannot contain its own center, and it also omits the right endpoint
`3`.  Thus neither endpoint orientation turns `2 -> 0` into a same-cap
endpoint-spending edge.  The chain proves `0 < 1 < 2`, not `0 < 1 < 2 < 0`.

The next required statement is therefore a **continuation producer**: when a
blocker edge does not select an endpoint of the current cap, it must either
enter a named contradiction sink, move to an adjacent cap with a strict
global-boundary advance, or produce a different strictly smaller rank.  No
current field of `CriticalPairFrontier` or `CriticalShellSystem` states this.

## Required theorem-bank preflight

The required markdown and JSON registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were also run for same-cap blocker endpoint spending,
source pushout, rank descent, strict laps, and common critical-shell systems.
The closest declarations are:

- `Problem97.source_pushout_right` and `source_pushout_left` in the sibling
  `p97-rvol` lane;
- `Problem97.rank_drop` and `strictLapPacket_nonreturn` in its
  `WitnessLapInterface`;
- current `Problem97.CGN.CGN6c_oneSidedDistanceInjective`; and
- current `CriticalShellSystem.exists_blocker_cycle`.

These are consumers.  None proves that a chosen critical row contains a cap
endpoint, that the next blocker remains in the same cap, or that a cross-cap
step advances one common global boundary order.  The endpoint certificate bank
is also inapplicable: it consumes a banked `EndpointMetricShadow`; it does not
produce endpoint membership for a critical-shell blocker orbit.

## New kernel-checked conditional consumer

`scratch/atail-force/endpoint_spending_cycle.lean` proves:

```lean
blocker_index_gt_of_right_endpoint_mem
blocker_index_lt_of_left_endpoint_mem
right_endpoint_blocker_periodic_false
right_endpoint_three_blocker_cycle_false
```

The one-step lemmas use the exact critical-shell equalities

```text
dist(blocker, source) = shell radius
dist(blocker, endpoint) = shell radius
```

and `CGN.CGN6c_oneSidedDistanceInjective` to force the blocker strictly toward
the selected endpoint.  The periodic theorem accepts any positive-period
`CriticalShellSystem.blockerVertex` orbit represented in one modeled ordered
cap.  If every step selects the same right endpoint, its cap indices strictly
increase around the period, contradicting return.  It does not require the
period to equal three or require the whole carrier to lie in that cap.

Direct scratch elaboration succeeds.  Every printed axiom set is exactly:

```text
propext, Classical.choice, Quot.sound
```

No `sorryAx`, `native_decide`, or external certificate is used.

## Relation to the live one-way blocker branch

For the survivor pair `(q,w)`, the one-way branch gives one of

```text
w notin selectedAt(q).support
q in    selectedAt(w).support
```

or its mirror, where `selectedAt(q)` is the row centered at the blocker of
`q`.  This does **not** imply that the blocker of `w` belongs to the row at the
blocker of `q`.  In the saved chain, the first spent endpoint is precisely the
independent incidence

```text
centerAt(w) = 3 and 3 in selectedAt(q).support.
```

That blocker-center cross-incidence is not a consequence of the source-source
one-way membership.  Even when it happens once, `CriticalShellSystem` does not
propagate it to the next source.  At source `2` the propagation fails.

`CriticalShellSystem.exists_blocker_cycle` alone also does not connect its
cycle to `CriticalPairFrontier.pair.q` or `pair.w`.  A live proof must show
that the active frontier source reaches an invariant endpoint-spending region,
or make every other step enter a named sink.

## Exact missing producer field

The checked periodic consumer would close immediately from the following data
on some positive-period blocker orbit:

1. one `CGN.OrderedCap` and `CGN.MinorCapChainModel` containing every orbit
   source and its next blocker;
2. cap indices for the finite orbit segment, compatible with the blocker map;
3. every source strictly before one fixed endpoint; and
4. that endpoint belongs to the exact critical row chosen at every source.

Items 1--3 are geometric/order transport.  Item 4 is the first genuinely
missing incidence.  Current cap-row results give **at most one** endpoint hit,
not **at least one**, and the saved return row demonstrates the distinction.

A weaker and more plausible live target is the one-step alternative

```text
same-cap endpoint hit
  OR named metric/order/cap contradiction sink
  OR adjacent-cap step with strict global-boundary advance.
```

Iterating the first arm gives rank descent; iterating the third arm must build
the already banked `StrictLapPacket`; every other arm closes locally.  Without
that alternative, importing or reproducing the legacy pushout lemmas only
repackages an antecedent that the live proof still lacks.

## Validation

The saved-shadow replay remains:

```text
status: VALIDATED_STRENGTHENED_FINITE_SHADOW_ONLY
checkpoint: MATCH (2 cases)
(5, 5, 5): cap-pairs 9/21, 11/21, 13/21; max-joint 1; wrong-side 0
(4, 5, 6): cap-pairs 8/28, 15/21, 10/15; max-joint 1; wrong-side 0
```

The shadow is not Euclidean and omits the `MinorCapChainModel`; it is evidence
about the incidence boundary only.  In particular, `wrong-side 0` agrees with
the analysis: the saved orbit reaches a missing endpoint-spending edge, not a
legacy wrong-side contradiction.
