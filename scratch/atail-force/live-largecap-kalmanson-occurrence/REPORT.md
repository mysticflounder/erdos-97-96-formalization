# Live large-cap Kalmanson occurrence: bounded checkpoint

## Result

The full source-indexed minimum-profile outer audit is **UNKNOWN
(fail-closed)**.  Its first Z3 check produced no decoded assignment before the
bounded smoke was interrupted.  There is no SAT witness, no UNSAT proof, and
no ordinal-cycle coverage claim from that run.

A smaller order consequence is **kernel-checked**:

```lean
theorem false_of_periodThree_straddles_card_le_four
    {α : Type*} [LinearOrder α]
    (U : Finset α) (q0 q1 q2 b0 b1 b2 : α)
    (hU : U.card ≤ 4)
    ...
    (hq01 : q0 ≠ q1) (hq12 : q1 ≠ q2) (hq20 : q2 ≠ q0)
    (h0 : StrictBetween q0 b0 q1)
    (h1 : StrictBetween q1 b1 q2)
    (h2 : StrictBetween q2 b2 q0) : False
```

The stronger checked theorem proves `5 ≤ U.card`.  Its proof orders the three
sources.  The two blockers on the adjacent source gaps are distinct from the
three sources and from each other, producing five carrier members.  The
reported axiom closure is only `propext`, `Classical.choice`, and `Quot.sound`;
there is no `sorryAx`.

## Does the checked schema apply to the live exact-six cap?

The required ingredients are present in production source:

- `FullParentExactFiveAllReverseData.cycle_period` fixes period three;
- `PhysicalActualCriticalOmissionCycle.source_injective` makes the three
  canonical sources distinct;
- `successor_source_eq` identifies the three transition edges;
- `FullParentExactFiveAllReverseData.sharedOrder.straddle` places each actual
  successor blocker strictly between its incident source pair in one shared
  cap order;
- the shared-order point identities and the production transition-global
  lemmas put all sources and blockers in the physical second-cap interior;
- an exact six-point closed cap has a four-point strict interior by the usual
  cap-interior-card-plus-two identity.

Thus the schema is the correct finite endpoint for the **exact-six** physical
cap slice.  However, this checkpoint does not contain a kernel-checked adapter
from `FullParentExactFiveAllReverseData` plus cap-cardinality six to the generic
schema.  It therefore does **not** yet close a production `sorry`, and it says
nothing uniform about physical caps of cardinality seven or larger.

## Source-indexed object encoded in `search.py`

Relative to the older anonymous n=14 `(5,6,6)` probe, the new encoder retains:

1. current multi-center candidate rows and actual common-map blocker rows;
2. source membership, row exactness, both apex omissions, row-intersection,
   pair-hit, alternation, cap-row, and full strong-connectivity constraints;
3. the named first-apex frontier pair, retained row, and same-center
   double-deletion row with its same-radius-six-or-disjoint split;
4. the physical exact-five class, unused cap source, and two origin-tagged
   continuation sources;
5. the total physical successor/actual-blocker map, global all-reverse
   membership, common cap-order straddles, and the entry-zero period-three
   cycle anchored at `continuation.first`.

No nontrivial symmetry quotient is used: the apices, cap roles, frontier
fields, continuation origin, and transition orientation are all distinguished.

## Omitted fields

The finite outer still omits:

- planar Euclidean rank/PSD and coordinate realizability;
- MEC inequalities beyond the current candidate-row semantics;
- global `noM44` over alternative support triangles;
- complete radius filters away from actual blocker rows and the physical
  exact-five class;
- metric supports witnessing deletion survival when no named row is retained.

Therefore even a future SAT result would be only an exact finite/Kalmanson
shadow, not a geometric counterexample.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=.uv-cache uv run python -B \
  scratch/atail-force/live-largecap-kalmanson-occurrence/search.py --help
```

From `lean/`:

```bash
lake env lean \
  ../scratch/atail-force/live-largecap-kalmanson-occurrence/ExactSixPeriodThreeOrder.lean
```

The Lean command exits zero and prints the three permitted axioms above.

## Next semantic delta

Write the small production-facing scratch adapter for the exact-six cap slice:

```text
FullParentExactFiveAllReverseData
+ (second physical closed cap).card = 6
→ shared-order interior carrier has card 4
→ false_of_periodThree_straddles_card_le_four
→ False.
```

This is a bounded theorem-plumbing task.  It should be completed before any
further timeout extension of the full n=14 outer solver.  It closes only the
exact-six all-reverse slice; a uniform large-cap closure still needs a
different argument for cap cardinality at least seven.
