# FreshThird corrected metric-core theorem-bank pass (2026-08-08)

## Scope and trust

This is an audit of `freshthird_cross_deletion_metric_cegar_20260808.py` and
its versioned result file.  The two reported cuts have widths 29 and 30,
`core_minimized = 5`, and independent cvc5 results `unsat`.  They are exact
QF_LRA replays, not Lean closure: the result file remains
`metric_unsat_bounded_pending` after one model per branch, with no quotient and
no structural UNSAT.

## The five assumptions (branch 1)

Tracing the corrected fresh implication solver gives the following five
metric assumptions (the first is a known pinned row equality):

```text
d(pinnedCenter,w1) = d(pinnedCenter,w0)
d(b0,w0) = r_b0
d(b0,a1_2) = r_b0
d(b1,w1) = r_b1
d(b1,a1_2) = r_b1
```

In the replayed model the occupied-rank order is

```text
a1_2 < w0 < w1 < b1 < pinnedCenter < b0.
```

Set `(i0,i1,i2,i3,i4,i5)` to these six points.  The three blocker/row
incidences are then

```text
row(i3): i0, i2       row(i4): i1, i2       row(i5): i0, i1.
```

After the `support_eq_radius` equalities are composed, this is exactly the
incidence shape of
`KalmansonThreeEqualitySchemas.false_of_support_first_two_k2_three_selected_rows`
(six strictly ordered boundary indices), not
`CapCrossingKalmanson.false_of_three_selected_rows_bridged_late_pair`.
The latter needs two rows with one common first center and a late transferred
pair; this core has three distinct centers and the support-first triangle.

The current structural script cannot promote this identification: it records
only the five metric labels and projects their dependencies to 29/30 global
rank/shell literals.  A source-level adapter still has to construct
`SelectedFourClass` rows, an injective ordered boundary, and the six-index
support incidences.  Until that producer/lift exists, keep the schema counter
`unclassified_cross_kalmanson`.

## Relation to the concurrent 39-core replay (#3439)

`freshthird_cross_row_metric_replay_20260808.results.md` is a different
occupied-24 model.  Its irreducible 39-core contains two cross equal-radius
assumptions (cross `1 -> 0` at `qOutside` and `a2_0`), two `b2` shell-slot
equalities (`a2_0` and `a2_2`), and 35 strict Kalmanson inequalities.  The
rank packet aliases `qOutside/pinnedCenter/a0_1/a1_0/a2_2`, so it does not
provide the injective CCW carrier required by either the FivePoint or
KalmansonRadius consumers.  It is therefore not a larger presentation of the
five-label support-first triangle and cannot be merged into that adapter.

## Assert-and-track and promotion audit

The deletion minimizer is now sound: each trial rebuilds a fresh QF_LRA solver
with the untracked triangle/Kalmanson base plus implications for only the
candidate labels, then checks those labels as assumptions.  Omitted
`assert_and_track` labels are no longer active, so the former spurious
one-label-core failure is removed.  Both result-file cores have size five;
cvc5 replays the same minimized implication core before a structural block is
added.

This agreement licenses only a finite model block (`Or(term != model value)`)
for the current structural assignment.  It is not a universal theorem and
must not be counted as Lean promotion or closure.  The 39-core likewise
remains diagnostic until a producer and universal lift are proved.

## Bank search outcome

The corpus search found the support-first triangle consumer and its reflected
variant, the bridged-late-pair consumer, and the existing FreshThird source
producers.  The required general-n certificate registries contain no direct
producer for this exact metric-core packet.  The highest-leverage next step is
therefore a source-level adapter for the six ordered ranks and three selected
rows; only after that adapter can the 29/30-literal cuts be replaced by a
semantic support packet.  Branch 2 needs a fresh trace under its actual
post-branch model before claiming the same six-role normalization.
