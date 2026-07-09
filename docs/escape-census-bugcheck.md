<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Escape-Census Bugcheck

Cross-validation of the closed forms in `census/incidence/escape_census.py` against an
independent brute-force enumeration, run 2026-07-05.

## Method

Every closed form in the script was compared against a from-scratch enumerator
that re-derives the same quantity by direct construction, over surplus
`p = n - 9` in the range `p = 0..10`. The harness lives at
`scratchpad/verify_census.py` (session scratch, not committed); its checks are:

- `moser_named_count_for_apex` / `moser_named_count_for_labeled_vector` against
  the row-by-row `named` sum over the full `(O, L, R)` grid and over every
  permutation of every partition.
- `n8_tuple_count_for_surplus` (both `same_one_hit` values) against the
  docstring's min-support feasibility set:
  `{(m,s,l,r) : 0<=m<=2, m+s+l+r>=4, max(0,s-1)+max(0,l-2)+max(0,r-2) <= p}`.
- `reflected_n8_fixed_count` and `n8_reflection_count_for_surplus` against a
  direct Burnside count on that feasibility set under the `l<->r` reflection.
- `n8_primitive_tuple_count_for_surplus` (all `same_one_hit`/`reflect`
  combinations) against a direct `m+s+l+r=4` enumeration.
- `moser_reflection_type_count`, `moser_primitive_type_count`, and the ordered
  `3+5p` shape count against an enumeration of `(h, left, right)` row shapes over
  own-interiors `2..2+p`.
- `partitions3`, `cap_category`, and the `branch_counts` classes (checked
  disjoint and covering).

## Finding: `n8_tuples_for_apex` / `n8_tuples_for_labeled_vector` under-enumerate for `p >= 3`

Status: fixed in `census/incidence/escape_census.py` on 2026-07-05 by replacing the
three cyclic rotations with all distinct labeled permutations of the cap
interior sizes.

`n8_tuples_for_labeled_vector` assigns the `(own, left, right)` apex roles using
only the three **cyclic** rotations of each cap vector:

```python
for i in range(3):
    out |= n8_tuples_for_apex(
        interiors[i], interiors[(i + 1) % 3], interiors[(i + 2) % 3], ...
    )
```

Because `partitions3(p)` yields only nonincreasing representatives, the three
reflected orientations are never generated. For a cap vector with three distinct
parts — first occurring at `p = 3` with `(2,1,0)` — the cyclic rotations give
`(2,1,0), (1,0,2), (0,2,1)` and omit `(2,0,1), (0,1,2), (1,2,0)`.

Two confirmed consequences:

- **The enumerated tuple set is not left/right symmetric.** At `p = 3` it
  contains `(0,0,4,3)` but not its mirror `(0,0,3,4)`, even though the
  reflection-quotient functions (`reflected_n8_fixed_count`,
  `n8_reflection_count_for_surplus`) assume the ordered set is
  reflection-closed.
- **It undercounts** relative to the closed form `n8_tuple_count_for_surplus`:

  | p  | closed form | cyclic enumerator |
  |---:|------------:|------------------:|
  | 3  | 284         | 260               |
  | 5  | 605         | 557               |
  | 7  | 1070        | 965               |
  | 10 | 2090        | 1901              |

Iterating over all distinct permutations of the interiors instead of the three
cyclic rotations makes the enumerator match the closed form exactly across
`p = 0..7` and restores reflection symmetry:

```python
interiors = [2 + x for x in e]
for perm in set(itertools.permutations(interiors)):
    out |= n8_tuples_for_apex(
        perm[0], perm[1], perm[2], same_one_hit=same_one_hit
    )
```

### Impact on shipped output: none

The table columns `n8Card` and `n8SameHit` are computed from the closed form
`n8_tuple_count_for_surplus`, which is correct. The only caller of the
enumerator is `print_n10_detail`, hardcoded to `e = (1,0,0)` (`p = 1`), where the
cyclic rotations already cover every distinct permutation, so the printed
`n = 10` detail is unaffected.

The defect was latent: before the fix it surfaced for anyone who used the
enumerator as a reference check at `p >= 3`, or who extended `--n10-detail` to
larger `n`.

## Verified correct

All of the following matched the independent brute force at every `p = 0..10`:

- `moser_named_count_for_apex`, `moser_named_count_for_labeled_vector`.
- `n8_tuple_count_for_surplus` for both `same_one_hit` settings, including the
  `p = 0` / `p = 1` special cases and the cubic/quadratic general forms.
- `reflected_n8_fixed_count`, `n8_reflection_count_for_surplus`.
- `n8_primitive_tuple_count_for_surplus` for all `same_one_hit`/`reflect`
  combinations.
- `moser_reflection_type_count` (`2 + 3p`), `moser_primitive_type_count`, and the
  ordered `3 + 5p` Moser shape count.
- `partitions3`, `cap_category`, and the `branch_counts` partition (disjoint and
  covering).

## Reproduction

```bash
uv run census/incidence/escape_census.py --min-n 9 --max-n 16 --dedup --families --n10-detail
uv run scratchpad/verify_census.py   # if the harness is restored from this note
```
