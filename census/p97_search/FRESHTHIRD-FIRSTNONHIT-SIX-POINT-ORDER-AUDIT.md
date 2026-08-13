# FreshThird FirstNonHit six-point order audit

Date: 2026-08-13

Status: completed finite local diagnostic; no Lean closure.

## Scope

This audit concerns only the two geometric constructors of the
`secondInteraction` argument of `false_of_freshThird_firstNonHit`:

- `distinctBlockersDifferentCaps`;
- `sameCapWithInternalFiberSource`.

The first interaction is a `FreshThirdCapSourceNonHit`, not a second geometric
row.  The `sameBlocker` and `sourceRowOmission` cases are outside this audit.

Name the shared chord endpoints `A,D`, the two row centers `B,F`, one
non-chord point of the `B` row `C`, and one non-chord point of the `F` row `E`.
The source-clean local schema is

```text
BA = BC = BD,
FA = FD = FE,
```

together with six distinct boundary points and the cyclic separation of
`A,D` by `B,F`.  No cap-placement fact, first-source non-hit fact, or global
minimality fact is encoded.

## Exact order classification

Fixing `A` as the cyclic anchor leaves 120 oriented cyclic orders.  The
source-proved shared-pair separation condition leaves 40.  Twelve of those
orders match two proved lower-level Lean kernel schemas:

- the `TwoTripleRowSixPointEuclideanObstruction` orbit:
  `ABCDEF`, `ACBDFE`, `AEFDBC`, `AFEDCB`;
- the `SixPointSparseEuclideanObstruction` orbit, using the base role mapping
  `B,A,F,D,E,C`:
  `ABCEDF`, `ABDCEF`, `ABDFEC`, `ACEFDB`, `AECBDF`, `AFDBCE`,
  `AFDECB`, `AFECDB`.

The two schema sets are disjoint.  Of the twelve matches, two have a direct
linear-order adapter, six require a cyclic-cut adapter, and four require both
a cyclic cut and reversal of the boundary orientation.  The artifact records
the theorem-position substitution, cut role, orientation polarity, and missing
adapter for every match.  It therefore does **not** claim that the current
linear boundary declarations directly consume all twelve orders.

The other 28 source-admissible orders have exact rational witnesses; no order
is `UNKNOWN`.

## Authenticated implementation and Lean ingress

The deterministic implementation is
`census/p97_search/freshthird_firstnonhit_six_point_order_audit.py`, with
focused regressions in
`census/p97_search/test_freshthird_firstnonhit_six_point_order_audit.py` and
the checked-in artifact at
`certificates/p97_freshthird_firstnonhit/audit.json`.  Its authenticated
digests are:

```text
payload  157da0a582144704b1e0308032a79e652b92d9f0a07d1a395e549101cbbcc20c
coverage 2bd55080774b727a269ec0d58371d10549fe0219efbd4f54f2aebdc767cb2d39
orders   5f4e72233b1b9aee18631cb18e64b0a1d28cf0b5920d836e70300a50b5583a7a
```

Replay and validation:

```bash
uv run python -m census.p97_search.freshthird_firstnonhit_six_point_order_audit \
  --replay --output certificates/p97_freshthird_firstnonhit/audit.json
uv run pytest -q \
  census/p97_search/test_freshthird_firstnonhit_six_point_order_audit.py
uv run ruff check \
  census/p97_search/freshthird_firstnonhit_six_point_order_audit.py \
  census/p97_search/test_freshthird_firstnonhit_six_point_order_audit.py
```

These checks replay the checked-in artifact, exact rational metric and convex
order predicates, all 120 anchored words, the complete 40-word source subset,
the generated kernel-schema matches, and every retained witness.  They pass
with five tests and a clean Ruff check.

The source side is formalized in
`FreshThirdTwoRowSixPointIngress.lean`.  It proves the exact two-row support
cardinalities, chooses legal remainders away from the opposite centers, proves
six-point distinctness and the four metric equalities, exposes both geometric
second-interaction constructors, and derives shared-pair cyclic separation
from the live `D.K4` boundary.  The module is imported by the
`FrontierLiveClosure` umbrella; the targeted umbrella build succeeds.  All six
new exported declarations report only `propext`, `Classical.choice`, and
`Quot.sound` under `proof-blueprint axioms`, with no `sorryAx`.

## Stronger exact local witness

The two complete selected-four rows themselves are simultaneously realizable:

```text
A  = (-1, 0)                 D  = (1, 0)
B  = (0, 1/2)                F  = (0, -1/2)
C1 = (-41/37, 24/37)         C2 = (-121/109, 69/109)
E1 = (61/58, -51/58)         E2 = (31/29, -24/29)
```

The strict convex cyclic order is `A,F,E1,E2,D,B,C1,C2`.  The `B` support is
`{A,D,C1,C2}`, the `F` support is `{A,D,E1,E2}`, their intersection is exactly
`{A,D}`, and both squared radii are `5/4`.

This witness is not a model of either live constructor: it does not assign the
cap fields or the first-source non-hit packet.  It establishes only that the
two-row local geometry cannot supply the missing contradiction.

## Theorem mine and retarget

No new contradiction schema is mined from the two-row data.  The exact
survivors prove that the next producer must use omitted cap or carrier-wide
information.

The narrow direct target on both ingress arms is a cap-placement/global-order
theorem: the cap fields of each geometric constructor must exclude all 28
exact survivor words, equivalently forcing every legal `C,E` choice into the
twelve kernel-schema words above.  Promotion through all twelve would also
require the recorded cyclic-cut and reverse-orientation boundary adapters;
those adapters alone cannot help with the 28 realizable words.

On the common-radius ingress arm there is a second, stronger route: produce a
selected-four row centered at `A` or `D` whose exact support is the two
canonical sources together with the two fresh-row remainders.  That result is
the missing premise of the existing source-clean theorem
`freshThird_exactSupport_threeRowCyclicSeparations`.  It is not an adapter for
the retained ingress arm, which lacks the required common-radius surface; that
arm instead needs the cap-order theorem, a separate promotion to common-radius
data, or the existing selected-row overlap-cardinality terminal.

No load-bearing `sorry` is closed by this audit.
