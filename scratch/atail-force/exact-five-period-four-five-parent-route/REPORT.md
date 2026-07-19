# Exact-five all-reverse periods four and five: parent-coupled route audit

Status: **PROVEN conditional fixed-card-11 closure for cap cardinality at least
8; cap cardinalities 6 and 7 remain OPEN**.

Scope: the period-4 and period-5 cases of the all-reverse arm of
`ExactFivePhysicalCycleParentResidual.exactFive.cycle`.  This lane changes no
production module, shared document, blueprint state, or other scratch lane.

## Verdict

The existing outside-pair capacity theorem closes both periods directly once
the fixed-card-11 branch supplies cap cardinality at least 8.  This argument
uses no shared-order or straddling assumption.

The new source-faithful sharpening is:

- period 5 exhausts the physical strict-cap vertex set, so both distinct
  origin-tagged continuation sources occur at distinct cycle indices;
- period 4 leaves at most one physical strict-cap vertex off-cycle, so at least
  one of the two distinct continuation sources occurs on-cycle; and
- under all-reverse membership, each occurring continuation source is in the
  successor source's actual critical row but is absent from the retained
  unused source's actual critical row.

This is genuine parent coupling, but it does not yet supply the cross-row
ordered roles, dangerous-triple incidences, or critical-fiber packet consumed
by the existing contradiction theorems.  Those stronger producers are needed
only for the remaining cap-cardinality-6/7 cases, not for the new capacity
closure.

## Required theorem-bank preflight

The lane checked the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and its JSON inventory;
- `certificates/erdos97_legacy_general_n_mining.md` and its JSON inventory;
- `certificates/erdos_general_theorem_p97_mining.md` and its JSON inventory.

It also ran `nthdegree docs search --lean` for:

- `exact five physical omission cycle all reverse membership period four contradiction`;
- `period five reverse outside pair repeated cap center Kalmanson`;
- `all reverse omission cycle critical fiber closing core`; and
- `successor actual blockers distinct cycle period`; and
- `all reverse cycle period outside pair capacity cap complement choose two`.

The nearest indexed results were the production physical omission-cycle
module, `period_le_five`, `successor_actualBlockers_ne`,
`TwoCenterCapLocalization`, `CriticalFiberClosingCore`, and the Kalmanson
modules.  The final query also confirmed the exact reusable scratch theorem
`period_le_choose_capComplement_two`.  None of the production results
produces the missing cross-row occurrence for the cap-cardinality-6/7 packet.

## Source map and source discipline

The live parent is
`lean/Erdos9796Proof/P97/ATail/PhysicalOmissionCycleParentResidual.lean`:

- `ExactFivePhysicalCycleParentResidual` retains `profile`, `continuation`,
  `cycle`, the ingress equality at `cycle.start`, and the parent-radius
  equality;
- `FrontierCoupledExactFivePhysicalCycleParentResidual` adds a freshly
  reconstructed first-apex `CriticalPairFrontier` using the same concrete
  `CriticalShellSystem`.

This lane does **not** identify that reconstructed frontier with an original
frontier and does not treat `cycle.start` as `cycle.base`.  The cycle may have
an ingress tail.

The cycle facts used are in
`lean/Erdos9796Proof/P97/ATail/LargeCapUniqueFivePhysicalOmissionCycle.lean`:

- `source_injective`;
- `successor_not_mem_actualCriticalSupport`;
- `successor_actualBlockers_ne`; and
- `period_le_five`.

The two continuation sources and their negative unused-row incidences are
fields of `LargeCapUniqueFiveTwoCommonDeletionSources` in
`LargeCapUniqueFiveLowHit.lean`.

## New checked reductions

The file `PeriodFourFiveParentRoute.lean` proves without `sorry`:

1. `cycleSourcePoints_card_eq_period`:
   the normalized cycle has exactly `K.period` distinct underlying sources.
2. `physicalVertices_sdiff_cycleSourcePoints_card_le_one_of_period_eq_four`:
   period 4 leaves at most one physical strict-cap vertex off-cycle.
3. `cycleSourcePoints_eq_physicalVertices_of_period_eq_five`:
   period 5 exhausts the physical strict-cap vertex set.
4. `exists_distinct_continuation_cycleIndices_of_period_eq_five`:
   both parent continuation sources occur at distinct period-5 indices.
5. `firstContinuation_occurs_or_secondContinuation_occurs_of_period_eq_four`:
   at least one parent continuation source occurs in period 4.
6. `exists_firstContinuation_parentCrossRowOccurrence_of_period_eq_five` and
   `exists_secondContinuation_parentCrossRowOccurrence_of_period_eq_five`:
   each period-5 continuation source is positive in its reverse successor row
   and negative in the unused-source row.
7. `exists_parentCrossRowOccurrence_of_period_eq_four`:
   the same positive/negative occurrence exists for at least one continuation
   source in period 4.
8. `false_of_allReverse_of_card_eleven_of_cap_card_ge_eight_of_period_four_or_five`:
   if `D.A.card = 11`, the physical cap has cardinality at least 8, actual
   all-reverse membership holds on `R.exactFive.cycle`, and its period is 4 or
   5, then `False`.

The occurrence claims use actual production rows selected by the retained
global `CriticalShellSystem`; they do not quantify an unrelated profile or
cycle.

The last theorem first derives
`(D.A \ S.capByIndex S.oppIndex2).card ≤ 3` from
`Finset.card_sdiff_add_card_eq_card`, `D.A.card = 11`, cap containment, and
the cap lower bound.  It then combines
`ATailExactFiveReverseOutsidePairProducerScratch.period_le_choose_capComplement_two`
with `Nat.choose_le_choose` and `Nat.choose 3 2 = 3`.  Thus period 4 or 5 is
impossible by pure outside-pair capacity.

## Why the remaining cap-cardinality-6/7 cases stay open

### Repeated outside pair has the wrong polarity

`exact-five-reverse-outside-pair-producer/ReverseOutsidePairProducer.lean`
already proves:

- `reverseRowCenter_injective`;
- `false_of_repeated_reverseOutsidePair`; and
- `reverseOutsidePair_injective`.

Thus the current packet forces distinct two-point outside-cap residuals for
distinct reverse rows.  A pigeonhole argument for a repeated pair cannot be
the remaining period-4/5 producer: with cap cardinality 7 the complement can
have cardinality 4 and pair capacity 6, while with cap cardinality 6 it can
have cardinality 5 and pair capacity 10.  Both capacities accommodate periods
4 and 5.  The new contradiction begins exactly at cap cardinality 8, where
the complement has cardinality at most 3 and pair capacity at most 3.

### Kalmanson consumers need an order-occurrence producer

The production sinks are ready:

- `ATailOrdinalKalmansonCycle.false_of_transGen_cycle`;
- `CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`; and
- `CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`.

The current rows give an adjacent physical pair in each reverse row and a
strict cap-order straddle at its actual blocker.  They do not choose the
additional outside support roles in one shared global boundary order, nor do
they produce a directed cycle of `SelectedRowOrdinalComparison` steps.

### U5 consumers need positive incidences not present here

`U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility` needs a
dangerous triple containing both actual blockers, the dangerous center in
both erased critical supports, and one cross-row blocker incidence.  The new
parent occurrence supplies none of those fields.

### The critical-fiber sink is on a different parent surface

`CriticalFiberClosingCore` consumes a
`FrontierCommonDeletionParentResidual F` and a source-indexed critical fiber.
The exact-five residual stores only a reconstructed `CriticalPairFrontier`;
it does not store the required common-deletion parent or an extractor from
that frontier to `CriticalFiberClosingCore`.  The scratch
`FirstApexShellRolePacket` also has no extractor.  Treating the reconstructed
frontier as an original parent would be an invalid extra assumption.

## Smallest honest next theorem target

The smallest next target is not another capacity wrapper.  Restricted to cap
cardinality 6 or 7, it is an **order-occurrence producer** on the actual
period-4/5 parent packet:

> From the global boundary order, the cycle rows, the unused-source row, and
> the now-proved continuation occurrence, construct either a nonempty directed
> cycle of `SelectedRowOrdinalComparison` steps or one exact existing U5
> adjacent-centers packet.

The target must use `R.exactFive.cycle` and the same `H`; it must not quantify
an independent cycle, assume a repeated outside pair, or identify frontiers.

## Smallest fixed-`n = 11` SAT audit

This is now a targeted finite **occurrence** audit for cap cardinality 6 or 7,
not a Euclidean coordinate search.  `D.A.card = 11` is not a field of the
residual above, so a Lean use must supply that equality from the outer
fixed-cardinality branch.

Use boundary-order labels `0,...,10` and solve the `p = 4` and `p = 5`
instances separately for `m = 6` and `m = 7`.  Up to cyclic relabeling, fix
the physical closed cap as one contiguous boundary interval of cardinality
`m`.

### Variables

- one-hot `q[i,x]`: cycle source at index `i < p`;
- one-hot `b[i,x]`: actual blocker of `q[i]`;
- Boolean `row[i,x]`: membership in the exact four-point actual row at
  `q[i]`;
- Boolean `physical[x]`: membership in `physicalVertices profile`;
- one-hot `u[x]` and `ub[x]`: the unused source and its actual blocker;
- Boolean `urow[x]`: the unused source's exact four-point actual row;
- one-hot `first[x]`, `second[x]`: the two distinct continuation sources;
- for every unordered boundary pair `{x,y}`, a finite rank
  `rank[x,y] ∈ {0,...,54}` for its distance term.

The ranks may be encoded one-hot or in binary with a standard strict-less-than
circuit.  They are ordinal witnesses only; no coordinates or floating-point
distances are introduced.

### Clauses copied from checked Lean consequences

1. Cycle/source cardinality:
   all `q[i]` are distinct physical vertices; `|physical| ≤ 5`.
2. Period occurrence:
   for `p=5`, `physical = {q[0],...,q[4]}` and both continuation sources are
   distinct cycle sources; for `p=4`, at most one physical vertex is outside
   the cycle and at least one continuation source is a cycle source.
3. Reverse/forward row incidence, with indices modulo `p`:
   `q[i] ∈ row[i]`, `q[i-1] ∈ row[i]`, and `q[i+1] ∉ row[i]`.
4. Exact cap split:
   `row[i] ∩ cap = {q[i-1],q[i]}`; hence every row has exactly two outside-cap
   points.
5. Center facts:
   `b[i]` lies strictly between `q[i-1]` and `q[i]` in cap order, is not in
   `row[i]`, and the `b[i]` are pairwise distinct.
6. Outside-pair uniqueness:
   distinct cycle rows do not have the same two outside-cap points.
7. Parent continuation:
   `first` and `second` are distinct physical vertices, both are absent from
   `urow`, and `|urow ∩ physical| ≤ 1`; assert the proved positive/negative
   occurrence for the relevant period.
8. General convex-incidence guards needed by the current banks:
   a selected row whose center lies in a cap has at most two support points in
   that cap; two distinct same-cap centers cannot share two distinct support
   points outside that cap; and at most two distinct ambient centers bisect
   any fixed pair of ambient points.

### Kalmanson rank clauses

For every increasing boundary quadruple `a < b < c < d`, instantiate every
checked row-induced strict comparison:

- a row centered at `a` containing `c,d` forces
  `rank[b,c] < rank[b,d]`;
- a row centered at `c` containing `a,d` forces
  `rank[a,b] < rank[b,d]`; and
- the checked fourth-vertex orientation, when included, maps a row centered
  at `d` containing `a,b` to `rank[b,c] < rank[a,c]`.

These clauses are the finite ordinal content of the Kalmanson theorems.  A
rank assignment exists exactly when the induced strict-comparison graph is
acyclic.

### Query and rigor boundary

Ask for all clauses above **and** an acyclic rank assignment.

- `SAT` gives an exact combinatorial countermodel to the claim that the
  currently exposed period-4/5 incidence/order packet alone forces a
  Kalmanson cycle.  It is not a geometric counterexample to Problem 97.
- `UNSAT` with DRAT/LRAT replay certifies, exactly within this fixed-11
  abstraction, that the current packet forces an ordinal contradiction.  A
  Lean closure still requires a checked reduction from every SAT clause to
  the parent residual and a kernel-checked certificate consumer.

Do not add random coordinate variables or nonlinear distance equations to
this first audit.  If the incidence/order instance is SAT, inspect the model
to identify the one missing source-valid clause before strengthening it.

## Validation

The three scratch imports were first elaborated to a temporary module path;
the owned file was then checked from the Lake root with warnings as errors:

```text
lake env env LEAN_PATH=/private/tmp/period45-parent-route-lean:<lake-path> \
  lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/exact-five-period-four-five-parent-route/PeriodFourFiveParentRoute.lean
```

Result: exit 0.  Every printed theorem has axiom closure exactly
`[propext, Classical.choice, Quot.sound]`; no theorem reaches `sorryAx`.
