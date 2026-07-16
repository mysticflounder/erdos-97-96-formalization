# Strict-witness completion theorem-bank audit

## Result

No checked theorem in the required P97 banks constructs
`StrictWitnessBankCompletion T`, and no kernel-checked adapter from the live
`NonEquilateralOutput`/`StrictWitnessMetricHinge` surface to a bank producer
was found.

The first genuinely missing producer, before any of the three reverse metric
equalities can even be stated at a chosen witness, is

```lean
∃ f : ℝ², f ∈ P.row₁.support ∧ f ∈ P.row₂.support
```

The current native theorem `nativeRow_inter_card_le_one` gives only an upper
bound on this intersection; it does not give nonemptiness.  Even if such an
`f` is supplied, the following three fields remain unproduced:

```lean
dist f T.x = dist f P.z₂
dist f T.x = dist f T.y
dist T.y T.x = dist T.y P.z₁
```

Thus this audit does not close the strict arm.

## Exact live interface

`StrictWitnessBankCompletion T` has six data/proof fields:

1. `f : ℝ²`;
2. `f_mem_row₁ : f ∈ P.row₁.support`;
3. `f_mem_row₂ : f ∈ P.row₂.support`;
4. `f_x_eq_f_z₂ : dist f T.x = dist f P.z₂`;
5. `f_x_eq_f_y : dist f T.x = dist f T.y`;
6. `y_x_eq_y_z₁ : dist T.y T.x = dist T.y P.z₁`.

The native rows already supply the four equalities centered at `P.z₁` and
`P.z₂` used by
`u1TwoLargeCapHypotheses_of_strictWitnessBankCompletion`.  They do not supply
any equality centered at `f` or `T.y`.

## Required registry audit

The following registries and their JSON inventories were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The only bank theorem with the exact five-point terminal is

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction
```

at `lean/RVOL/P97/U1TwoLargeCapObstruction.lean:77`.  It is source-proved but
outside the sibling `RVOL` import closure (`source_reachable = false`) and is
not visible from the current strict-witness consumer import surface.  It is a
consumer of all three missing reverse equalities, not a producer of any of
them.

The two legacy JSON inventories contain zero candidate declarations whose
conclusion is existential and whose statement contains a distance relation.
Their closest result is
`Problem97.three_common_equidistant_centers_eq`
(`lean/N9Geometry.lean:19096` and `:19309` respectively).  Both archive copies
are source-proved and archive-root reachable, but they consume six
equidistance hypotheses to identify two centers.  The current, stronger
`Problem97.eq_of_equidistant_three_noncollinear` is already import-reachable.

## Nearest sibling row producers

The generic gauge-witness theorem chooses from one row only.  Every
useful-looking producer that actually couples two selected rows occurs in the
sibling C5D3B surface.  Those C5D3B declarations are source-proved and
sibling-`RVOL` reachable, but no `C5D3BPacket` module exists in the current
worktree and none is visible from the strict-witness consumer import surface.

| Theorem | What matches | Why it does not adapt |
|---|---|---|
| `Problem97.SelectedFourClass.exists_gauge_witness` (`U1CarrierInjection.lean:431` in the sibling registry; current copy at `U1CarrierInjection.lean:455`) | Chooses a point from one selected support and proves its row-radius equality | Applying it to each native row gives two independently chosen points.  It gives no reason they coincide, so it cannot fill fields 1--3 with one `f`, and its equality is centered at `P.z₁` or `P.z₂`, not at `f` or `T.y`. |
| `Problem97.C5D3B.qAllowedSelected_two_full_rowOffProfiles_common_rowOff_anchor` (`C5D3BPacket.lean:8842`) | Produces one point in two selected supports, analogous to fields 1--3 | Requires a `C5D3BSameSideTerminalPacket`, `U5QAllowedAuditSupport`, bounded-center labels, and a two/full row-profile split.  No live theorem identifies those selected classes with `P.row₁/P.row₂` or produces the full-row antecedent.  It gives none of fields 4--6. |
| `Problem97.C5D3B.qAllowedSelected_full_rowOffProfiles_common_pair` (`C5D3BPacket.lean:8463`) | Produces two distinct common support points | Requires both specialized rows to be full on the C5D3B row-off carrier.  This antecedent is strictly more data than the live native profile and is unavailable.  It gives none of fields 4--6. |
| `Problem97.C5D3B.qAllowedSelected_common_u_direct_metric_cells` (`C5D3BPacket.lean:32721`) | Packages two common support labels and many row-radius equalities | It already assumes a common point `r` and the same two/full C5D3B profile.  Its equalities are centered at the C5D3B row centers (`w`, `t`, and `q`), not at the chosen common point and strict witness required by fields 4--6. |

These are packet-specific classification theorems, not generic two-row
intersection producers.  Importing them would not remove the missing live
antecedents.

## Import-reachable near consumers

The following existing declarations are visible after importing the exact
non-equilateral consumer and were rechecked in
`ReachableCandidates.lean`:

- `Problem97.SelectedFourClass.exists_gauge_witness`;
- `Problem97.u2_sharedBase_strictWitness_elim`;
- `Problem97.eq_of_equidistant_three_noncollinear`;
- `Problem97.U5QDeletedK4Class.inter_card_le_two`; and
- `Problem97.U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility`.

All five compile with only `propext`, `Classical.choice`, and `Quot.sound`.
None is a producer:

- `exists_gauge_witness` chooses from only one selected row at a time;
- `inter_card_le_two` is only an upper bound on a row intersection;
- the U5 common-point theorem assumes the common incidences and derives
  `False`;
- `eq_of_equidistant_three_noncollinear` assumes four equidistance relations;
  and
- `u2_sharedBase_strictWitness_elim` assumes three common points on two
  circles plus a noncollinearity witness.

The Census554 five- and six-point collision declarations surfaced by semantic
search are also consumers of prescribed metric equalities.  They are not
visible from the exact import surface without an additional import and do not
construct any completion field.

## Indexed Lean search

The all-corpus `nthdegree docs search --lean` audit searched both the exact
names and the concepts "two selected rows common support", "common point on
two circles", "reverse critical incidence", and "three points equal radius
centered at f".  Focused signature searches for `∃ f : ℝ²` and `dist f`
returned no producer hit.  The strict-witness name search returned only
`u2_sharedBase_strictWitness_elim`, which is the elimination theorem described
above.

## Smallest honest next target

At structure granularity the first target is common-support nonemptiness:

```lean
theorem exists_native_common_support_point
    (T : StrictWitnessMetricHinge N) :
    ∃ f, f ∈ P.row₁.support ∧ f ∈ P.row₂.support
```

It cannot be obtained from row cardinality plus the existing overlap upper
bound.  A proof must consume additional Euclidean/MEC/cap placement or a new
critical-incidence coupling.  After that witness exists, a second producer
still has to put `T.x`, `P.z₂`, and `T.y` on one circle centered at `f`, and a
third has to put `T.x` and `P.z₁` at one radius from `T.y`.  No audited bank
theorem supplies either reverse-radius packet.

## Validation

From `lean/`:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans:/tmp/p97-mixed-parent-coupling \
  lake env lean \
  -R ../scratch/atail-force/non-equilateral-geometry-consumer \
  -R ../scratch/atail-force/strict-witness-bank-search \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/StrictWitnessReachableCandidates.olean \
  ../scratch/atail-force/strict-witness-bank-search/ReachableCandidates.lean
```

This check passes.  It validates import reachability and axiom closure of the
five near declarations; it is not an adapter or a closure proof.
