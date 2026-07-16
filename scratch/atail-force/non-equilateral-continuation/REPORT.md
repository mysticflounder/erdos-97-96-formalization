# Non-equilateral continuation audit

Date: 2026-07-14

Status: **SOURCE-CURRENT SCRATCH; KERNEL CHECKED.**

## Result

The non-equilateral dispatcher arm is not closed by the current theorem bank.
The useful normalization is stronger than the existing
`CommonDeletionTwoCenterPacket`, but it still leaves a genuine incidence
producer.

`NonEquilateralContinuation.lean` keeps the original continuation rows.  This
matters because the common-deletion packet trims arbitrary exact witnesses and
therefore does not retain the residual mutual hits.  On the original supports
the file packages both rows as exact q-deleted U5 rows while preserving:

- `dist z1 z2 != K.radius`;
- `z2` in the row at `z1` and `z1` in the row at `z2`;
- both row radii equal to `dist z1 z2`; and
- `oppApex2` absent from both rows.

The chosen critical shell at `oppApex2` also yields a genuine
`U5DangerousTriple` after erasing the source.  This exposes the strongest
current U5 bank interface without claiming that the two continuation rows
match one of the banked terminal incidence patterns.

## New exact consequences

The original row supports overlap in at most one point.  Any common point is
equidistant from `z1,z2`; `oppApex2` is another such carrier point.  Two common
row points would therefore give three carrier points on one perpendicular
bisector, contradicting `Dumitrescu.perpBisector_apex_bound`.

The smallest producer-friendly ordered-cap terminal found is:

```text
exists x,
  x in row1.support and
  x in row2.support and
  x in oppCap1 \\ (surplusCap union oppCap2).
```

One such hit closes immediately.  The existing
`firstCap_center_separates_secondApex_pair` theorem says a strict-`oppCap1`
point has unequal distances to `z1,z2`, whereas common membership in the two
equal-radius mutual rows gives equal distances.

This is a consumer, not a producer.  Nothing in the current output forces the
two row supports to meet at all.

## Exact regression

`verify_exact_local_regression.py` gives an exact rational 11-point model.  It
checks:

- every point is a strict vertex of the convex hull;
- the parent row at `O2` has the four-point support
  `{z1,z2,kL,kR}` at squared radius `269/400`;
- the row at `z1` and the row at `z2` each have four points at squared radius
  `1` and contain the opposite center;
- `O2` is absent from both continuation rows;
- the two continuation supports are disjoint; and
- `{z2,kR,kL,z1}` is a contiguous cyclic cap block, with three outside-block
  points in each continuation row.

Therefore strict convexity, a parent four-class, the full non-equilateral
metric residual, and the local cap-block shape do not force a common hit.

The model is deliberately not a `CounterexampleData`: it does not provide a
full MEC/cap packet, global K4 at every carrier point, or a total
`CriticalShellSystem`.  It is a regression gate against geometry-free or
local-cap-only producer claims, not a counterexample to the live theorem.

## Exact remaining content

After the checked normalization, the branch may have disjoint row supports,
or a unique common point outside strict `oppCap1`.  Closure therefore needs a
parent-level argument that uses more than the local residual.  The narrowest
current target is one strict-`oppCap1` common hit (or directly the equivalent
forbidden equality at such a point).

## Bank preflight

The current source bank, sibling `p97-rvol` registry, legacy `erdos/97`
registry, and older `erdos-general-theorem/97` registry were searched.  Focused
nthdegree searches covered common-deletion q-deleted rows, mutual equal-radius
centers, perpendicular-bisector triples, and dangerous-triple consumers.  The
closest reusable sinks are:

- `U5QDeletedK4Class.inter_card_le_two`;
- `U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two`;
- `Dumitrescu.perpBisector_apex_bound`; and
- `firstCap_center_separates_secondApex_pair`.

None consumes `NonEquilateralOutput` without an additional incidence field.

## Rigor boundary

- The Lean declarations above compile against source-current scratch imports.
  Their `#print axioms` output contains only `propext`, `Classical.choice`, and
  `Quot.sound`; there is no `sorryAx` dependency.
- The rational validator is exact finite computation for the displayed local
  model.
- No claim is made that the live parent produces the strict-cap common hit.
- No claim is made that the local model realizes the full live hypotheses.

## Validation

From `lean/`:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/non-equilateral-continuation \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/NonEquilateralContinuation.olean \
  ../scratch/atail-force/non-equilateral-continuation/NonEquilateralContinuation.lean
```

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/non-equilateral-continuation/verify_exact_local_regression.py
```

The exact validator reports `PASS`, row overlap `0`, parent squared radius
`269/400`, and continuation-row squared radius `1`.
