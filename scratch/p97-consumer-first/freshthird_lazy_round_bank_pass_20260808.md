# FreshThird lazy Kalmanson/metric CEGAR bank pass (2026-08-08)

## Verdict

The corrected universal script examined one branch,
`outside_fresh_between_source_canonical`, with `fresh_cap=1`, `row_cap=1`,
repeated-cap pair `(0,1)`, and independent mutual pair `(0,1)`.  It produced
five cvc5-verified metric cuts followed by a sixth z3-UNSAT but cvc5-timeout
core.  The five cuts are empirical fixed-rank QF-LRA blocks; they are not a
Lean closure.  No cut has a direct source-level lift to an import-reachable
consumer.

Evidence: `freshthird_lazy_cut_trace_20260808.txt`,
`freshthird_cross_row_kalmanson_universal_20260808.results.md`, and
`freshthird_cross_row_metric_replay_20260808.results.md`.

## Five verified cuts

Calls 1--5 in the trace each have `z3=unsat`, `cvc5=unsat`, minimized tracked
core `5/5`, and width `25`.  Their normalized structural core is identical:

```
a0_1,a0_2,a1_1,a1_2,a2_0,a3_0,
b0,b1,b2,b3,c2,canonicalSource,e0,e3,f1,f2,
freshCenter,qBetween,qOutside,sourceCenter,w0,w1,w2,w3,
shell_0_contains_w3
```

The rank assignments differ only by the solver's choice of aliases/offsets;
all five carry the same three source-entitled survivor origins:

* `cross 1→0`: one-way hfan materialized survivor at blocker center `b1`,
  support (role aliases shown exactly as represented in the trace)
  `(qOutside/pinnedCenter/a0_1/a1_0/a2_2/a3_2, w2,
  a1_1, f1/w3/a0_0)`;
* `mutual 0→1`: hmutual survivor at `b0`, support
  `(canonicalSource, w2, a0_2/a3_1, qOutside/pinnedCenter/...)`;
* `mutual 1→0`: the independent hmutual survivor at `b1`, support
  `(sourceCenter, a3_0, a0_2/a3_1, qOutside/pinnedCenter/...)`.

The ellipses above denote only rank aliases that are explicitly equal in the
corresponding model (for example `qOutside=pinnedCenter=a0_1=a1_0=...`);
they are not new source equalities.  The source row origins and their exact
support packets are those audited in `freshthird_row_origin_audit_20260808.md`:

```
source      : (qOutside,qBetween,canonicalSource,c2)
fresh       : (qOutside,qBetween,f1,f2)
pinned      : (w0,w1,w2,w3)
DRow        : (e0,e1,e2,e3)
canonical b_z: (w_z,a_z_0,a_z_1,a_z_2)
cross a→b   : existential selectedAt(a) row, four slots, omits w_b and b_a
mutual a↔b  : independent two-way rows, four slots, omits w_b and b_a
```

The source order is the first arm of `FreshThirdFivePointKalmansonOrder`:
`qOutside < freshCenter < qBetween < sourceCenter < canonicalSource`.
The lazy script itself only asserts rank aliases and all strict six-index
chains; it does not assert an injective boundary, image equality, CCW
convexity, or a named selected-row incidence theorem.

## Consumer matching and first missing adapters

The exact import-reachable metric schemas found by the mandatory global Lean
search are:

* `CapCrossingKalmansonBridge.false_of_six_ccw_two_k2_three_selected_rows`
  (and the four orientation schemas in
  `KalmansonThreeEqualitySchemas.lean`).  Statement shape:
  `i0<i1<i2<i3<i4<i5`, rows centered at `i0,i1,i2`, with supports
  `(i3,i5)`, `(i4,i5)`, `(i3,i4)` respectively.
* `FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows`.
  Statement shape: `ia < ib < ic < id < ie`, a row at `id` supporting `ia,ic,ie`,
  and a row at `ie` supporting `ia,ib`; its public cut is the nonlinear
  five-point pattern documented as `b:{a,e}`, `c:{a,b,d}`.
* `false_of_freshThird_orderSelectedEndpointDeletionObstructions`, whose
  source order arm additionally requires two endpoint deletion obstructions
  and the source/fresh equal-radius hypotheses.

These are consumers/producers, not applicable proofs of calls 1--5: the lazy
rank packet has no `Function.Injective boundary`,
`Finset.univ.image boundary = A`, `IsCcwConvexPolygon`, `ConvexIndep`, or
universal lift identifying the existential cross/mutual slots with named
`SelectedFourClass` rows at ordered indices.  The first missing adapter for
every verified cut is therefore a source theorem that (i) preserves the
repeated-cap and independent-mutual pair as separate data, (ii) names the
actual `SelectedFourClass` rows and support memberships above, and (iii)
transports them to an injective CCW boundary with one of the displayed strict
order schemas.  The existing FreshThird producers
`freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket` and
`freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow`
provide only partial ingress and do not supply this product adapter.

The sibling `/Users/adam/projects/math-projects/p97-rvol` corpus has analogous
mutual/cross metric declarations (for example
`Problem97.U5QCriticalTripleClass.two_transport_mutual_delayed_anchor_incompatibility`
and its no-`p`/off-anchor variants), but they consume the RVOL
`U5DangerousTriple`/`U5QCriticalTripleClass` model and are not import-compatible
with this `SelectedFourClass`/FreshThird packet.

## Sixth core and status

Call 6 is z3-UNSAT but **cvc5=timeout**, minimized core `8/8`, width `28`; it
adds `pure_rank_pinnedCenter` and the shell selectors
`shell_0_contains_w0`, `shell_0_contains_w3`, and
`shell_1_contains_w1`.  It is an unverified timeout core and must not be
blocked or promoted.

Classification: calls 1--5 are empirical/core artifacts; the FreshThird row
and order lemmas are source producers; the Kalmanson/FivePoint declarations
are consumers; closure is **none** until the missing universal source adapter
and boundary/CCW lift are proved.

## Search record

The mandatory global search was run as
`nthdegree docs search --lean --agentic`; its answer and handles are in
`freshthird_lazy_global_search_20260808.txt` and
`freshthird_lazy_global_show_20260808.txt`.  The required registry scan is in
`freshthird_lazy_registry_search_20260808.txt`.
