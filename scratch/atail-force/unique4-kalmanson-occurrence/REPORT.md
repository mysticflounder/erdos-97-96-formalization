# Exact-two Kalmanson occurrence boundary

Date: 2026-07-22

Scope: scratch-only cardinality-generic consumer and source occurrence audit for
`OriginalUniqueFourResidual F` plus `ExactTwoStrictHitDistribution R`.  This lane changes no
production Lean or shared closure document.

## Result

The first two unseeded corrected `opp1_card = 5` refinements and the first old-bank-seeded
refinement contain the same new normalized row-instance schema.  Its kernel-checked consumer is

```lean
Problem97.UniqueFourKalmansonOccurrenceScratch
  .false_of_two_k2_three_row_triangle
```

It uses six boundary-ordered roles

```text
i0 < i1 < i2 < i3 < i4 < i5
```

and three concrete row instances:

```text
Row0 at i0: {i3,i5}
Row1 at i1: {i4,i5}
Row2 at i2: {i3,i4}.
```

The direct inequalities are `K2(i0,i1,i3,i5)` and `K2(i1,i2,i3,i4)`.  The three row
equalities cancel their sum exactly.  The theorem is independent of the carrier cardinality,
passes warnings-as-errors elaboration, and has axiom closure exactly

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, custom axiom, `native_decide`, or unsafe declaration in the
consumer or source-boundary file.

This consumer alone closes no production `sorry`: occurrence from the source residual remains
unproved.

## Required theorem-bank preflight

Before extracting the consumer, the registries required by `AGENTS.md` were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered strict Kalmanson cancellation, selected
rows, exact-two distributions, and row-instance occurrence.  The closest existing theorem,
`ExactTwoKalmansonCoreScratch.false_of_two_k2_three_selected_classes`, has a different incidence
shape: its first two rows share the third row's center.  In the new triangle their common point
is a separate later role.

Exact transport over all order-preserving and reflected injections found no old schema among the
46 records in `unique-arm-whole-carrier-source-audit/kalmanson_schema_bank.json` that subsumes
the new six-role schema.

## Three occurrences, one theorem

The exact replay is in [`replay.json`](replay.json).

### Attempt 1

The source roles are

```text
(i0,i1,i2,i3,i4,i5) = (0,1,2,7,8,10).
```

The source oracle used three consecutive `K2(0,1,-,-)` inequalities and one
`K2(1,2,7,8)`.  The consecutive path telescopes to `K2(0,1,7,10)`.  Dropping reference
memberships leaves exactly

```text
Row0 {7,10}, Row1 {8,10}, Row2 {7,8}.
```

This occurrence is independently checked against the preserved decoded assignment.

### Attempt 2

The source roles compress to

```text
(i0,i1,i2,i3,i4,i5) = (0,2,3,4,5,9).
```

The source oracle's longer paths are unnecessary.  Convex order directly supplies
`K2(0,2,4,9)` and `K2(2,3,4,5)`, while the stored refinement memberships give

```text
Row0 {4,9}, Row2 {5,9}, Row3 {4,5}.
```

Thus attempt 2 is a second occurrence of the same generic theorem, not a new bank schema.

### Old-bank-seeded attempt 1

The source roles compress to

```text
(i0,i1,i2,i3,i4,i5) = (0,1,2,6,8,10).
```

The two consecutive K2 paths compress to the direct inequalities `K2(0,1,6,10)` and
`K2(1,2,6,8)`.  Roles `7` and `9` are path-only.  Dropping the reference memberships leaves

```text
Row0 {6,10}, Row1 {8,10}, Row2 {6,8}.
```

This is a third occurrence of the same six-role theorem, not another schema.

The replay hashes the three named refinement records semantically.  Later refinements may be
appended to either live CEGAR checkpoint without invalidating this audit.

## Strongest unconditional source theorem

[`ExactTwoSourceOccurrenceBoundary.lean`](ExactTwoSourceOccurrenceBoundary.lean) proves

```lean
exists_mutualCompletion_or_pathCompletion
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) :
    Nonempty (MutualCompletionSourceIngress R Q) ∨
      Nonempty (PathCompletionSourceIngress R Q)
```

uniformly at arbitrary carrier cardinality.  It combines:

1. one CCW boundary indexing re-cut at the first apex;
2. the source-proved actual-blocker walk from the first apex;
3. the exact first-apex row and its complete `2+1+1` cap distribution; and
4. a concrete global-K4 completion row at a carrier center omitted from the entire late blocker
   image.

On the mutual arm it additionally proves:

- the successor belongs to the exact first-apex row;
- the first apex belongs to the concrete successor row;
- the omitted-image completion center differs from both source row centers; and
- the successor and completion indices satisfy one of the two strict orders after the re-cut.

On the path arm the source retains the three-center actual-blocker path plus the omitted-image
completion row.  Every row is a concrete instance; no two rows are identified merely because
their centers agree.

## First missing source field

The new p5 attempt-1 assignment has precisely the mutual source shape:

```text
first apex 0 < successor 1 < omitted-image completion center 2
```

and later common-support witnesses

```text
7 ∈ exactRow ∩ completionRow
8 ∈ successorRow ∩ completionRow
10 ∈ exactRow ∩ successorRow.
```

The exact first unproved source-level statement on this arm is the disjunction

```lean
MutualTailTriangleOccurrence P
```

formalized as the two possible orders of the successor and completion centers.  Each constructor
requires three pairwise common-support witnesses in the later boundary tail, in the order used by
`false_of_two_k2_three_row_triangle`.

This is not a disguised metric lemma.  The source theorem already supplies all three row
instances, center distinctness, and the center-order disjunction.  What it does **not** supply is
even one common support point between two of those rows.  The mutual blocker cycle supplies
opposite center memberships (`successor ∈ exactRow` and `firstApex ∈ successorRow`), which
are not a shared row point.

The same obstruction precedes the two corrected fixed consumers: all three normalized schemas
need positive cross-row support intersections, while the checked source packets retain only
own-source/back-edge incidences.  Therefore the next mathematical producer should force a
pairwise row-intersection cycle (with its boundary placement), not another Kalmanson consumer or
another center-only row wrapper.

The non-mutual path arm remains separate.  No occurrence of either corrected fixed core follows
from its currently exported fields; the first absent layer is again positive cross-row support
incidence among its exact, path, and completion rows.

## Validation

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/unique4-kalmanson-occurrence/audit_six_role_triangle.py \
  --output scratch/atail-force/unique4-kalmanson-occurrence/replay.json --check

cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-kalmanson-occurrence/SixRoleKalmansonTriangle.lean
```

The source-boundary module also passes warnings-as-errors elaboration against current scratch
dependency oleans, with only the same three core axioms.
