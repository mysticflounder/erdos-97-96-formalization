# Projected-static-v2 cube-19 global theorem-bank audit — 2026-07-29

## Verdict

**EMPIRICALLY VERIFIED NEGATIVE AUDIT.** No theorem or finite certificate in
the indexed Lean corpora or the three prescribed theorem-bank registries was
found that rules out the sole directed graph isomorphism class from
`phase3_structural_cegar_projected_static_v2_cube19_20260729` independently of
its cap annotation and compatible convex order.

The closest genuine bank hit is

```text
Problem97.Census554.FivePointCircleIsoscelesOrderBridge
  .false_of_two_selected_rows_of_ccw
```

but it is only a partial discriminator for this round: it eliminates all 24
cap-compatible orders for 25 of the 100 retained records, while 23 records
have no matching order at all. Therefore it is not a theorem about the graph
pattern alone and does not close the round.

The run itself remains `SURVIVOR_LIMIT`, hence nonterminal. Its summary
explicitly says that it is neither an UNSAT certificate nor a P97
counterexample and that no aggregate DRAT or Lean coverage theorem follows
from it:
`scratch/p97-distinct-distance-lane/phase3_structural_cegar_projected_static_v2_cube19_20260729/round-summary.md:5-24,48-54`.

## Search scope

The required indexed-corpus search was performed first with `nthdegree docs
search --lean`. Queries covered:

- 4-regular ten-vertex graphs, triangles, diameter two, common-neighbor and
  codegree profiles;
- reciprocal selected shells and row intersections;
- convex-order and distinct-distance obstructions;
- equal-distance incidence, circle, perpendicular-bisector, rhombus, chord,
  and equilateral-hinge cores.

Those searches returned generic graph declarations and already-known local
P97 metric consumers, but no declaration with the sole graph's signature.
Exact follow-up filtering of all three exhaustive JSON inventories for
`codegree`, `common neighbor`, `4-regular`/`four-regular`, `diameter 2`,
`unit-distance graph`, `twenty ... distance`, and `distance graph` returned
zero candidates in each inventory.

The following named registries were then audited:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and `.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and `.json`;
- `certificates/erdos_general_theorem_p97_mining.md` and `.json`.

This is an exhaustive negative result for those indexed declarations and
registry inventories, not a claim that no relevant theorem exists elsewhere
or under an unrecognized semantic reformulation.

## Exact graph pattern

**EMPIRICALLY VERIFIED.** All 100 records have one directed graph isomorphism
class. The representative is reciprocal, hence the following undirected
4-regular graph on `Fin 10`:

```text
0: 2 5 7 8
1: 3 4 7 8
2: 0 3 4 9
3: 1 2 8 9
4: 1 2 6 7
5: 0 6 7 9
6: 4 5 8 9
7: 0 1 4 5
8: 0 1 3 6
9: 2 3 5 6
```

It has 20 edges, five triangles

```text
057, 138, 147, 239, 569,
```

diameter two, clique number three, automorphism-group size ten, and
unordered-pair common-neighbor histogram

```text
0 × 5, 1 × 20, 2 × 20.
```

These are finite Python/NetworkX computations, not Lean theorems. In
particular, the graph is not the Petersen graph (it contains triangles), and
this report assigns it no standard graph name.

**PROVEN MATHEMATICALLY FROM THE DISPLAYED ROWS.** Because the graph is
connected and reciprocal, row equality plus distance symmetry puts all 20
displayed graph edges in one `EqualityCore.EdgeClosure` class. Thus a geometric
realization of the rows would be a convex ten-point realization in which all
20 displayed edges have one common length. This does not assert that any
nonedge has a different length because every saved `metric_row` has
`exact = false`.

## Closest bank hit: five-point circle-isosceles order

### Kernel theorem

**PROVEN.**
`lean/Erdos9796Proof/P97/Census554/FivePointCircleIsoscelesOrderBridge.lean:68`
states that increasing convex-boundary vertices

```text
W < F < P < X < Z
```

are impossible when the selected row at `W` contains `F,X,Z` and the selected
row at `Z` contains `P,X`. The underlying equality form is

```text
WF = WX = WZ,    PZ = XZ.
```

Live `lean_verify` on
`Problem97.Census554.FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw`
reported exactly

```text
[propext, Classical.choice, Quot.sound]
```

with no suspicious-source warnings. The general mining report independently
records the same consumer and trust set at
`docs/general-n-certificate-bank-mining-2026-07-09.md:785-812`.

### Mechanical replay on the round

**EMPIRICALLY VERIFIED.** Each survivor's projected semantic assignment was
decoded with the pinned `SatEncoding`, all 24 orders were reconstructed with
`census/p97_search/realize.py:367` `cap_orders`, and every increasing
five-subsequence was tested against the two required support rows.
Equality-closure matching gives the same result as literal-row matching.

The number of cap orders covered per retained record has histogram

```text
 0: 23 records
 2:  2
 4:  9
 6:  6
 8:  3
10:  1
12: 10
16:  4
18:  9
20:  4
22:  4
24: 25
```

For survivor record 0, only `order-22` and `order-23` match, both with roles

```text
(W,F,P,X,Z) = (9,3,7,6,5).
```

The raw numeric-label order has the apparent witness `(0,2,4,5,7)`, but label
order `0 < ... < 9` is not a convex-boundary order in this encoding and must
not be used as a geometric witness. The admissible orders are the 24
cap-compatible permutations reconstructed by `cap_orders`.

### First missing bridge

The tempting bridge would be:

```text
every admissible cap annotation/order of this graph contains
W < F < P < X < Z with the two required rows.
```

**EMPIRICALLY DISPROVED FROM THE CURRENT ROUND.** Twenty-three retained cap
annotations have zero matching orders. Consequently no producer with that
conclusion can follow from the present graph-and-cap hypotheses alone.
The theorem remains useful as a new pruning rule for the 25 fully covered
records and as a partial order cut for many others, but not as global closure.

## Equilateral-hinge recheck

The four relevant kernel consumers are in
`lean/Erdos9796Proof/P97/Census554/EquilateralHingeCollisions.lean`:

- `Problem97.Census554.EqualityCore.false_of_fivePointHingeCycleCore`
  at line 411;
- `...false_of_sixPointHingeTailCore` at line 447;
- `...false_of_sixPointHingeDoubleSpokeCore` at line 485;
- `...false_of_sevenPointHingeClosedTailCore` at line 527.

Live `lean_verify` of the largest consumer,
`false_of_sevenPointHingeClosedTailCore`, reported exactly
`[propext, Classical.choice, Quot.sound]` with no suspicious-source warnings.

**EMPIRICALLY VERIFIED ABSENCE, NOT A THEOREM MATCH.** An independent exhaustive
search over all 100 records and every injective assignment of the five, six,
six, or seven named roles found:

```text
five-cycle: 0
six-tail: 0
double-spoke: 0
seven-closed-tail: 0
```

The test used the full row-generated undirected edge-equality closure, not only
literal adjacency. Therefore this audit does not claim an
`EquilateralHingeCollisions` match without an explicit witness.

## Other prescribed banks

### Sibling `p97-rvol`

**PROVEN INVENTORY FACTS.** The registry contains 96 class-level
`U5GlobalIncidence` incompatibility families, 88 metric-point kernels, and 112
scalar kernels. It also contains 18 unimported U1 source-unit consumers and the
standalone
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`;
see `certificates/p97_rvol_general_n_mining.md:20-33,58-72,74-97`.

No U5 theorem supplies the missing classification from this arbitrary
selected-shell graph to one of its named incidence packets. The registry's own
audit identifies exactly that producer gap:
`docs/general-n-certificate-bank-mining-2026-07-09.md:355-398`.

The standalone U1 theorem requires the seven equalities

```text
ca=cd=cf, dc=de=df, fa=fd=fe, ea=ec
```

with `a ≠ c`. Exhaustive role matching against the representative
edge-equality closure found no assignment, even when role collisions other
than `a = c` were allowed. The source-unit certificates instead require their
specific row-slot packet/ordinal producer, which the graph record does not
mechanically provide.

### Two legacy archives

**PROVEN INVENTORY SCOPE.** The legacy registry has 285 bounded-local
candidates and 39 contradiction consumers; the older general-theorem registry
has 297 candidates and 38 contradiction consumers. Both have zero
ambient-`n` candidates. Their high-signal consumers are fixed N9 Radon,
finite-row, or coordinate/Msolve systems, not ten-label selected-shell graph
consumers:

- `certificates/erdos97_legacy_general_n_mining.md:14-60`;
- `certificates/erdos_general_theorem_p97_mining.md:14-59`.

No placement, mask, or metric-shadow producer maps the present ten-vertex
graph to those fixed N9 coordinate cells. They therefore do not rule out this
pattern.

## Honest next theorem target

**CONJECTURED.** The graph may be nonrealizable as a single-distance graph on
ten strictly convex points, but neither this audit nor the nonterminal search
proves that.

The mechanically available geometric payload for a new consumer is:

1. ten pairwise-distinct points in strict convex position;
2. the 20 displayed unordered pairs all have one common distance;
3. no exact-off-edge or nonedge inequality.

The first honest missing bridge is therefore a graph-specific theorem or
exact algebraic certificate of the form

```text
no convex injective realization of the displayed 20-edge equality graph.
```

Such a result would consume precisely what the survivor pattern produces and
would be independent of the varying cap annotations. Until that theorem or a
complete exact certificate exists and is connected to `EqualityCore.Realizes`,
the sole graph class remains unresolved.

## Trust boundary

- Kernel closure is claimed only for the two named live Lean consumers checked
  with `lean_verify`.
- Graph invariants, matcher counts, and order-coverage histograms are
  exhaustive finite computations over the frozen 100-record artifact, not
  kernel-landed coverage.
- The JSON registry searches establish an audit result, not semantic
  completeness under every possible theorem reformulation.
- No Lean source, generator, certificate, manifest, or live run output was
  changed by this audit.
