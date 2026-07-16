# Exact cap-local transport model

Date: 2026-07-14

## Verdict

**EXACTLY VERIFIED WITHIN THE STATED SYMBOLIC MODEL:** the strongest local
Euclidean/MEC/cap/no-M44/card-five/two-blocker surface currently isolated in
the ATAIL scratch lane does **not** force
`CardFiveDistinctCapLocalCrossHypothesis`.  The same construction also
falsifies `CapSeparatedDirectedCrossHypothesis`, because both predicates first
require one of the same two directed cross incidences and both incidences are
absent.

This is not a counterexample to K-A-PAIR and not a model of the complete live
binders.  In particular, it omits `CounterexampleData`'s all-center K4 field
and a total `CriticalShellSystem`.  Therefore the live producer remains
**OPEN**, but its first load-bearing new content is now sharply identified:
it must use one of those global layers to rule out reciprocal cross-deletion
survival.  Cap localization is downstream of that step.

## Exact construction

The checker starts from
`../blocker-cap-geometry/exact_blocker_cap_countermodel.py`, pinned by SHA-256,
removes its points `t2` and `H`, and adds rational points `X,Y,Z`.  Each new
point is obtained by rotating `D` around `t1` with the rational half-angle
parameters

| point | parameter |
|---|---:|
| `X` | `-139/707` |
| `Y` | `-41/216` |
| `Z` | `-136/743` |

The resulting 14-point carrier has exact strict hull order

```text
O, t1, I, F, A, X, Y, Z, D, J, E, C, G, K.
```

Its unique minimum-enclosing-circle boundary is `{O,A,C}`.  That triangle is
equilateral and therefore non-obtuse.  With `(v1,v2,v3)=(C,O,A)`, exact
oriented-line tests give these closed caps:

| cap | exact members | card |
|---|---|---:|
| surplus | `{O,t1,I,F,A}` | 5 |
| opposite 1 | `{A,X,Y,Z,D,J,E,C}` | 8 |
| opposite 2 | `{C,G,K,O}` | 4 |

Every non-MEC point is strictly inside the MEC disk.  Hence every
circumscribed MEC triangle is a permutation of `{O,A,C}`, which only permutes
the cap-card multiset `(5,8,4)`.  There is only one card-four cap, so no
orientation has two card-four opposite caps: exact no-M44 holds for all MEC
permutations.

## The two exact blocker rows

Take first apex `O`, second apex `A`, and the distinct source pair
`q=E`, `w=D`.  The relevant exact distance classes are:

| center | exact class | role |
|---|---|---|
| `O` | `{A,C,D,E,J}` | unique K4-or-larger row, of card five; contains `q,w` |
| `A` | `{C,G,K,O}` | K4 survives deletion of `q`, `w`, or both |
| `D` | `{A,E,F,I}` | selected deletion-critical shell for `q=E` |
| `t1` | `{D,X,Y,Z}` | selected deletion-critical shell for `w=D` |

The blocker centers `D` and `t1` are distinct.  Deleting each source kills K4
at its selected blocker, while deleting the opposite source preserves K4:

```text
w=D ∉ {A,E,F,I}
q=E ∉ {D,X,Y,Z}.
```

Thus both directed cross hits are false.  Although `t1` lies in the surplus
cap, the reverse arm still fails because `E` is absent from its shell;
although the forward row is exact, its blocker `D` is outside the surplus cap
and its shell omits `w` in any case.  An adaptive choice of cap cannot repair
the missing row incidence.

## Precise omitted live hypotheses

The checker exhaustively groups every exact distance class of the model.  Ten
of the fourteen centers have no K4 at all:

```text
C, E, F, G, I, J, K, X, Y, Z.
```

It also exhaustively enumerates deletion-critical exact four-shell candidates
for every source.  Sources `J` and `t1` have none.  Consequently this model
does not instantiate:

1. the all-center K4 field carried by `CounterexampleData`; or
2. a total `CriticalShellSystem` selecting a source-deletion blocker for every
   carrier point.

Those omissions are precise, checked failures—not informal caveats.  All
local facts listed above, including both actual source blockers for `q,w`, are
retained exactly.

## Consequence for the producer plan

The first new inequality/disjunction needed on the reciprocal-survival branch
is

```text
¬ HasNEquidistantPointsAt 4 (A.erase w) (blocker q)
∨ ¬ HasNEquidistantPointsAt 4 (A.erase q) (blocker w).
```

By the already-proved
`cross_deletion_survives_iff_not_mem_selected_support`, this is equivalent to
at least one directed cross hit.  The present model makes both deletion
survivals true.  Therefore strict convexity, exact MEC/cap placement, no-M44,
the card-five row, robust second-apex survival, and two distinct exact blockers
cannot prove this disjunction by themselves.

The viable next proof step is correspondingly narrower: combine the *global*
all-center K4/total-critical-map information with reciprocal deletion survival
to derive a contradiction or a one-sided cross hit.  Only after obtaining that
hit does either the surplus-cap consumer or the adaptive-cap consumer become
applicable.  More local cap-only mining would repeat a surface this exact model
already separates.

## Reproduction

No Lean or Lake build is involved.  Run:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/cap-local-transport-model/check.py --check
```

Expected output:

```text
PASS: exact cap-local cross countermodel matches checkpoint.json
```

Trust boundary: **exact symbolic SymPy arithmetic, not Lean-kernel proof**.
The checker pins its imported base checker and compares the complete result to
`checkpoint.json` so source or conclusion drift fails closed.
