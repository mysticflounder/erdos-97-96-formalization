# ATAIL fixed critical-map geometry audit

Date: 2026-07-14

Status: **STAGED QF_NRA UNRESOLVED; ONE FIXED SHADOW EXACTLY ELIMINATED BY A
CHARACTERISTIC-ZERO IDEAL-MEMBERSHIP CERTIFICATE.**

## Scope

`fixed_shadow_query.py` joins the saved card-12 `(5,5,5)` total critical-map
shadow to one 12-point Euclidean model.  It pins the shadow digest

```text
e771d39cd7291aaf8e6adb7a7853495623e54439b2205d5fcdac4a085161064c
```

and encodes the total source-to-blocker map, all twelve exact four-point rows,
strict convex order, the exposed MEC packet, cap signs, and target negation.
The full query contains 662 named atoms.  This is theorem-discovery evidence,
not a Lean proof and not an exhaustive classification of the 930 residues.

## Staged nonlinear-solver result

The new `--families` selector passes `--check`.  At ten seconds per engine:

| families | atoms | Z3 | cvc5 |
|---|---:|---|---|
| `gauge` | 4 | SAT | SAT |
| `gauge,total-critical-map` | 64 | UNKNOWN | TIMEOUT |
| add `distinctness` | 130 | UNKNOWN | TIMEOUT |
| add `total-critical-map-exact` | 400 | UNKNOWN | TIMEOUT |

No UNSAT core was obtained.  The independent staged audit in
`agent-stage/REPORT.md` further shows that a five-row prefix plus all 66
distinctness atoms is SAT with an exact nondegenerate algebraic model, while
adding the sixth prefix row is unresolved at the same budget.  Longer blind
QF_NRA runs are therefore not the right instrument.

## Exact equality-ideal result

`singular_row_core.py` eliminates the auxiliary radius variables, leaving
three squared-distance differences per selected row after the similarity
gauge

```text
p4 = (0,0), p0 = (1,0).
```

Its Singular smoke gate checks a known unit and nonunit ideal.  For all twelve
saved rows, three independent large-prime probes return the same
three-dimensional nonunit ideal and reduce many pairwise squared distances to
zero.  The decisive computation was then rerun over `QQ` and minimized.

The following irredundant 11 equalities suffice.  Each entry
`c : a = b` means `dist(c,a)^2 = dist(c,b)^2`:

```text
1  : 8 = 0       1  : 10 = 0
2  : 4 = 0       2  : 5 = 0
4  : 10 = 1
5  : 1 = 0       5  : 4 = 0
8  : 4 = 2       8  : 10 = 2
10 : 2 = 0       10 : 5 = 0
```

Equivalently these are equation indices

```text
1,2,3,4,7,9,10,13,14,15,16
```

for row centers `1,2,4,5,8,10`.  Singular over characteristic zero returns a
nonunit ideal of dimension 11 and proves by ordinary ideal membership that

```text
dist(0,1)^2 = 0.
```

Deleting any one of the 11 generators makes that same direct membership test
fail, so the displayed certificate support is irredundant for this generator
order.  `lift(I,T)` produces an exact rational coefficient identity, and an
independent SymPy expansion replays it exactly.  The certificate digest is

```text
72ba467f3c7442d8d55d68b5b01c099f437e11eaa905d7baf3cf4b8be62343af
```

The raw lift is not yet a practical Lean artifact: its 11 nonzero
coefficients total 529,234 characters.  The important mathematical result is
nonetheless exact.  On real coordinates, `dist(0,1)^2 = 0` forces points 0 and
1 to coincide, contradicting the carrier distinctness hypothesis.  Thus this
specific total critical-map shadow has no distinct real Euclidean
realization, before convexity, MEC, cap, or target-negation atoms are used.

## Dependency boundary

This exact elimination kills one saved support-only shadow; it does **not**
prove a uniform theorem for all critical maps or close K-A-PAIR.  The next
useful step is to quotient the 11-equality pattern by relabeling and compare it
with the existing formalized metric-certificate bank.  If it is already a
banked class, reuse that small theorem.  Otherwise the producer target is a
uniform finite incidence lemma forcing one of these compact row cores from the
two live source blockers.  More marginal apex-pair sampling will not supply
that input.

## Reproduction

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/critical-map-geometry/fixed_shadow_query.py --check

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/critical-map-geometry/singular_row_core.py \
  --centers 1,2,4,5,8,10 \
  --equation-indices 1,2,3,4,7,9,10,13,14,15,16 \
  --characteristic 0 --timeout-seconds 20 \
  --scan-pair 0,1 --lift-pair 0,1
```
