# Global nested-pair census on the saved `(4,5,6)` residual

Date: 2026-07-13

## Exact finite verdict

Within the saved card-12 `(4,5,6)` frame, **no** automatically ordered blocker
row admits the four memberships in `GlobalNestedPairFields`.

This is an exact finite statement about:

- the fixed cyclic order
  `0,8,9,10,11,1,3,4,2,5,6,7`;
- the four saved exact critical rows;
- the saved source-to-blocker map; and
- the current locally admissible selected-row candidate surface generated with
  `PROVEN_ROWS`.

It is not a proof for other placements, the `(5,5,5)` profile, card 11, or the
live theorem.

## Ordered blocker patterns

The source itself does not affect the cyclic enumeration once its blocker
center is fixed.  The twelve sources collapse to four patterns:

| `o` | Sources | Ordered support `a,b,c,d` | Required row at `a` | Required row at `b` | Result |
|---:|:---|:---|:---|:---|:---|
| 0 | `1,3,4,5` | `1,3,4,5` | center 1 contains `{0,5}` | center 3 contains `{0,4}` | locked row 3 lacks `4` |
| 1 | `0,2,6` | `2,5,6,0` | center 2 contains `{0,1}` | center 5 contains `{1,6}` | locked row 2 lacks `0` |
| 2 | `7,8,9` | `7,8,9,1` | center 7 contains `{1,2}` | center 8 contains `{2,9}` | all center-7 candidates excluded |
| 3 | `10,11` | `7,0,10,11` | center 7 contains `{3,11}` | center 0 contains `{3,10}` | locked row 0 lacks `10` |

Rows at centers `0..3` are locked because a global selected four-class at an
actual blocker center has the same support as the exact critical shell.  Thus
three patterns fail without any new candidate search.

## The only unlocked pattern

For `o = 2`, the row at center `7` must contain `{1,2}` and the row at center
`8` must contain `{2,9}`.

The candidate surface contains:

- 15 locally admissible center-7 supports containing `{1,2}`; and
- 21 locally admissible center-8 supports containing `{2,9}`.

The center-7 side alone is exhaustive: none of its 15 candidates is compatible
with the four saved exact rows.  The independent incidence classification is:

| Existing row | Failure | Count |
|---:|:---|---:|
| center 0 | intersection has cardinality 3 | 1 |
| center 0 | two common points are not cyclically separated | 8 |
| center 2 | intersection has cardinality 3 | 1 |
| center 2 | two common points are not cyclically separated | 4 |
| center 3 | two common points are not cyclically separated | 1 |

The complete existing formalized-core scanner independently covers all 15:

- 6 instantiate `DuplicateCenterCore`; and
- 9 instantiate `ExactOffCircleCore`.

There are zero scanner survivors and therefore zero admitted center-7/center-8
row pairs.  Per the requested fail-fast policy, the exact equality oracle was
not called.

## Theorem-bank preflight

The required sibling/legacy theorem registries and indexed Lean corpora were
searched before considering any new core.  The relevant hits are the existing
common-bisector/duplicate-center incompatibility family and exact-row
off-circle membership.  These are precisely the two production consumers
reported by the scanner, so no new Lean core was introduced.

## Closure consequence

Simply adding the two global selected rows does not make the nested-pair
producer appear in this residual.  More strongly, the saved placement and
blocker assignment exclude that producer for every source.

Therefore a proof of `HasGlobalNestedPairProducer` from the full live
hypotheses would have to use additional geometry to rule out or reconfigure
this saved blocker placement—MEC disk confinement, cap/full-filter alignment,
or a different global-row obstruction.  Global K4 row existence by itself
does not force these four named memberships here.

This also redirects the next finite layer: enumerating arbitrary center-7 and
center-8 row pairs for this particular nested pattern is unnecessary.  A
useful two-row search must target a different formalized core or add an omitted
live constraint first.

## Replay

The deterministic census is implemented in
`scratch/atail-force/residual_456_global_nested_pair_census.py`:

```bash
UV_CACHE_DIR=/tmp/uv-cache PYTHONDONTWRITEBYTECODE=1 \
  uv run python scratch/atail-force/residual_456_global_nested_pair_census.py
```

The driver asserts that all twelve sources are classified, that the unlocked
pattern has no incidence-compatible required row at center `7`, and that all
15 required candidates have an existing formalized core.
