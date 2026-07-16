# Exact total-CSS audit of the 29-point strict model

## Result

The pinned 29-point strict-convex model does **not** admit a total
`CriticalShellSystem`.

The exact exhaustive scan leaves precisely two carrier sources uncovered:

- `J`: its only carrier-centered radius class of cardinality at least four is
  the `O`-centered card-five class `{A, C, D, E, J}` at squared radius `1`.
  Deleting `J` leaves a four-point class, so `O` is not a blocker for `J`, and
  no exact four-class through `J` exists at another carrier center.
- `t1`: no carrier-centered radius class of cardinality at least four contains
  `t1` at all.

Thus no pointwise source-to-blocker choice can cover all 29 sources.  This is
not a matching or injectivity obstruction: the Lean structure makes
independent choices for each source and permits blocker centers to repeat.

This audit is a baseline for larger completions.  A separate 35-point model
adds rows that repair these two missing source obligations while still failing
global K4 at 24 centers; that larger model is outside this checker and is not
certified by this report.

## Complete candidate enumeration

There are 32 admissible source/center pairs, represented by the following
eight exact four-classes.  Every listed member is a deletion-critical source
for that row's center; there are no other candidates.

| blocker center | squared radius | exact support / covered sources |
|---|---:|---|
| `A` | `1` | `{C, G, K, O}` |
| `D` | `2/13` | `{A, E, F, I}` |
| `F` | `-5*(-39 + 2*sqrt(26))/169` | `{F_k4_1, F_k4_2, F_k4_3, O}` |
| `I` | `1117/1313` | `{I_k4_1, I_k4_2, I_k4_3, O}` |
| `X` | `33899840573/33746050000` | `{O, X_k4_1, X_k4_2, X_k4_3}` |
| `Y` | `-(-3149561303 + 66318750*sqrt(3))/3141905000` | `{C, Y_k4_1, Y_k4_2, Y_k4_3}` |
| `Z` | `-(-4648330156 + 158340475*sqrt(3))/4635678125` | `{C, Z_k4_1, Z_k4_2, Z_k4_3}` |
| `t1` | `258613/260000` | `{D, X, Y, Z}` |

The resulting per-source candidate counts are pinned in `checkpoint.json`.
`C` has three choices, `O` has four, `J` and `t1` have zero, and every other
source has exactly one.

## All-center global K4 audit

The checker exhaustively reconstructs all 782 positive carrier-centered
radius classes.  Exactly 20 centers fail global K4:

```text
C, E,
F_k4_1, F_k4_2, F_k4_3,
G,
I_k4_1, I_k4_2, I_k4_3,
J, K,
X_k4_1, X_k4_2, X_k4_3,
Y_k4_1, Y_k4_2, Y_k4_3,
Z_k4_1, Z_k4_2, Z_k4_3
```

No failure can be repaired by selecting a different radius class already
present at that center.  At `C` the maximum class cardinality is two (two such
classes); at each of the other 19 failed centers every positive-radius class
is a singleton.  Consequently coordinate-preserving row reselection cannot
turn the 29-point carrier into an all-center-K4 model.

## Method and trust boundary

The checker:

1. pins and replays the original exact strict-convex/MEC/cap/no-`IsM44` and
   local robust checker;
2. reconstructs the exact SymPy radius-equality partition at every carrier
   center;
3. for every source, enumerates every carrier center whose full class has
   exactly four points, contains the source, and has post-deletion maximum
   class cardinality at most three; and
4. scans every existing radius class at every failed global-K4 center.

The result is **exact within the fixed 29-point symbolic coordinate model**.
It is not a Lean kernel certificate, does not quantify over coordinate
perturbations or extensions, and is not a K-A counterexample.

Pinned values:

- source model file SHA-256:
  `98a069a5d763436c11f93dafb51bf7173a1909873abaeef7b74a96a451389698`
- coordinate SHA-256:
  `b07182bc396ee9b6131961e2a80f5ce420706bf9bb6f292d90471d80300c83c4`
- exhaustive radius-class partition SHA-256:
  `853bcade006db475849321d9ff5daae31cd9e7c85f86749011c2b4c70241ccea`
- detailed critical-shell enumeration SHA-256:
  `bca64807a98b239b70759e8bd64f12a78fe932695546e7add647434f3c0ac012`
- detailed global-K4 failure enumeration SHA-256:
  `a87fe084687a3b42f029a0a9e91c7694f795a1e407f8b9c45bd4a7f5dc8667ce`

Recheck with:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --with sympy python \
  scratch/atail-force/strict-model-css-audit/audit.py --check
```
