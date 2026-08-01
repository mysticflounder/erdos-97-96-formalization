# Local compute results — 2026-07-28

All runs in this note were executed on `dada-mun-26.local`; `flux.local` was
removed from the compute plan after it crashed.

## Generic actual-blocker cycle

The corrected structural lower bound is

```text
point_count >= max(5, period + 1).
```

The complete `period = 2..16`, slack `1..4` sweep contains 240 cells:

| terminal status | cells |
|---|---:|
| independently verified equality-pattern SAT | 143 |
| Z3 UNSAT, discovery only | 97 |
| UNKNOWN | 0 |

Artifact:
`out-corrected-p2-p16-local-hardened/manifest.json`. The independent model
checker passes all 143 SAT records.

The `period = 17..20` extension contains 64 cells: 40 independently verified
SAT, 16 Z3-UNSAT discovery cells, and 8 initial timeouts. A 900-second retry of
the eight fixed-radius/slack-3 cells proved six Z3-UNSAT and left the two
period-20 queries UNKNOWN. Artifacts:
`out-corrected-p17-p20-local/manifest.json` and
`out-retry-fixed-slack3-p17-p20-local/manifest.json`.

Every free-radius query has a verified survivor in the scanned range once a
small finite point threshold is reached. In particular, both `some_hit` and
`all_omission` survive for every `period = 6..20` already at
`point_count = period + 1`.

This is now explained by an explicit construction. For every `p >= 11`, take
an apex `a` and cyclic sources `v_j`. At center `v_j`, give the four edges to

```text
v_(j-1), v_(j-2), v_(j-3), v_(j-5)
```

one fresh shell color; all remaining source-source edges are singleton unless
already assigned. With `D = {1,2,3,5}`, the shell edge classes do not merge
because `D ∩ (-D) = empty` modulo every `p >= 11`. The directed-difference
multiplicity of `D` is at most two, so two shell rows have at most two common
points.

For `all_omission`, partition the apex-source edges into opposite pairs when
`p` is even. For `p = 2q+1`, use the triple `{v_0,v_q,v_(2q)}` and pairs
`{v_i,v_(i+q)}` for `1 <= i < q`. For `some_hit`, use the block
`{v_0,v_(p-1)}`; pair the remainder when `p` is even, and when `p` is odd use
the additional triple `{v_1,v_4,v_7}` before pairing the remainder. These
apex blocks also meet every shell row in at most two points.

A solver-free audit checked every hard equality/incidence rule for both
queries at `p = 11..100`. The finite model checker supplies the remaining
`p = 6..10` cases. Giving every edge incident to a newly added point a fresh
singleton color extends any construction to every larger carrier.
Consequently both alternatives have equality-shadow survivors for every
`p >= 6` and every `point_count >= p+1`.

This is a proved combinatorial construction within the encoder's shadow, not
a Euclidean realization. It shows that no amount of further generic orbit
enumeration using only the present hard rules can close either alternative;
an additional geometric or robust-history rule is necessary.

Fixed-apex-radius runs are sensitivity experiments only: the cycle theorem
does not prove a common apex radius.

## Exact projected quotient at the smallest surviving cell

For `point_count = 6`, `period = 2`, the complete projected
incidence-signature quotients have:

| query | free radius | fixed radius |
|---|---:|---:|
| `all_omission` | 7 | 7 |
| `some_hit` | 12 | 7 |

These enumerate the stated projected signatures modulo symmetry with an
existential full equality-color completion. They do not enumerate full
equality partitions and do not certify Euclidean realization. See the four
`semantic-n6-p2-*-local/manifest.json` artifacts.

## Exact first-fiber packet

The packet uses distinct `p1,p2,r1,r2,q,o,b,bρ`, except only the source-level
cross coincidences allowed by `CrossBlockerCoincidence`; exact shells
`|K(p1)| = |K(r1)| = 4`; exact cap intersections
`K(p1) ∩ cap = {p1,p2}` and `K(r1) ∩ cap = {r1,r2}`; total represented-point
cap classification; partial blocker fibers of sizes at least three and two;
`b != bρ`; and the proved rule that `q,o` are not both in `K(r1)`.

The bounded matrix is:

| additional outside points | both | neither | `q` only | `o` only |
|---:|---|---|---|---|
| 0 | UNSAT | UNSAT | UNSAT | UNSAT |
| 1 | UNSAT | UNSAT | SAT | SAT |
| 2 | UNSAT | SAT | SAT | SAT |

Here `both` is UNSAT by the already-proved Lean nonbisection rule. The new
finite consequence is the point budget: at least one additional outside-cap
point is mandatory, and the `neither` branch requires two.

## Verification and trust boundary

```bash
uv run python -m unittest \
  test_census.py test_parallel_sweep.py test_semantic_enumeration.py \
  test_uniform_survivors.py
```

This runs 52 tests. The current result is `OK`.

SAT means an independently checked equality-pattern survivor. Z3 UNSAT remains
discovery evidence until a deterministic CNF/CaDiCaL/DRAT certificate is
produced. Neither status is a Lean theorem or an exact geometric realization.
