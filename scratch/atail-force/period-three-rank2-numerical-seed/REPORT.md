# Period-three fully-disjoint rank-two numerical probe

Date: 2026-07-17

Status: **TWO 24-CORE BOUNDED NUMERICAL SEARCHES RETURNED NO HIT.  THIS IS NOT
UNSAT, NOT A PROOF, NOT A LEAN RESULT, AND IT CLOSES NO PRODUCTION `sorry`.**

This lane owns only
`scratch/atail-force/period-three-rank2-numerical-seed/`.  It did not edit
production Lean, shared docs, proof-blueprint state, git, protected lanes,
`ShellCurvature`, or `SurplusM44`, and it ran no Lean/Lake/LSP command.

## Question tested

The exact QF_LRA ledger in
`../period-three-full-role-identity-quotient/probe_fully_disjoint.py` assigns
independent abstract distance variables to one legal 25-role word.  It is
exact SAT under positivity, triangle inequalities, all strict Kalmanson
inequalities, and the named row equalities.  It does not require those
distances to come from one point family in `R^2`.

The first probe replaces the free distance matrix by 25 common planar
coordinates and asks whether the **same fixed fully-disjoint word** can be
found numerically.  The boundary word is copied literally from the QF_LRA
probe.  A second probe, described below, uses an independently source-audited
word compatible with the exact complete-row witness.
`FIRST=(-1/2,0)` and `SECOND=(1/2,0)` remove translation, rotation, and scale.

The 19 exact squared-distance equations are:

- three equalities for the selected T0 four-shell about `FIRST`;
- three equalities for the selected T1 four-shell about `FIRST`;
- four equalities for the physical exact-five shell about `SECOND`; and
- three equalities for each of the three reverse four-shells.

The hard nonlinear feasibility solve also includes:

- all 300 pairwise squared separations;
- all 575 strict convex-order half-plane tests (every non-edge point lies
  left of every directed boundary edge).

Every returned candidate is independently substitution-checked for those 19
equalities and for the complete final 956-condition ledger:

- 300 pair separations;
- 575 strict convex-order tests;
- 79 exact-support squared-distance exclusions for the physical and reverse
  exact shells; and
- unequal T0/T1 squared radii plus the required `SECOND`-to-`q,w`
  squared-distance inequality.

T0 and T1 are selected rows, not exact support classes, so the checker does
not invent non-support exclusions for them.  With the normalized
`FIRST--SECOND` chord, the final positive numerical margins are

```text
pair squared separation       1e-8
edge orientation area         1e-10
exact-support squared gap      1e-8
required radius squared gap    1e-8
maximum row equality error     1e-9
```

These small strictness margins are deliberate: a 25-vertex configuration may
legitimately place several named vertices on a short boundary arc.  Earlier
smoke formulations used much larger margins and were rejected before the
recorded run.

## Exact partial seed and its limit

Half the starts use the exact rational seed now recorded in
`../period-three-exact-seed-lift/SEED.json`.  Its source-facing map is

```text
second = o
nI = left
c0,c1,c2 = q0,q1,q2
b0,b1,b2 = old c0,c1,c2
nS = right
```

It supplies, exactly:

- the physical five squared-distance equalities;
- all three reverse cap-pair equalities; and
- a strict convex nine-point cycle/blocker core.

It does **not** supply a complete reverse four-shell.  The banked construction
has only one outside target, and that target lies cyclically between `second`
and `nI`.  Every fixed `x_i,y_i` slot in this 25-role word lies after `nI`.
Consequently the exact target is intentionally left unmapped; all six reverse
outside targets remain numerical unknowns.  Treating this seed as a complete
row would be a source/order bug.

The other half of the starts use noisy regular 25-gons followed by random
orientation-preserving affine shear and vertical scaling.  This avoids making
the bounded result dependent on one near-symmetric initial shape.

## Recorded run

Reproduction command:

```bash
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 \
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/period-three-rank2-numerical-seed/search_constrained.py \
  --attempts 192 --jobs 24 --maxiter 1500 \
  --output \
  scratch/atail-force/period-three-rank2-numerical-seed/CONSTRAINED_RESULT.json
```

The script stops the worker pool immediately if a candidate passes the full
substitution gate and records unused attempt seeds.  This run completed all
192 starts:

```text
96 exact nine-point cycle-core starts
96 affine-diverse regular-polygon starts
0 optimizer success verdicts
0 full substitution-verified coordinate hits
0 unused attempt seeds
```

The closest joint equality/inequality candidate was exact-seed attempt 120:

```text
maximum row equality residual       6.164911293136824e-4
minimum pair squared distance       4.081395482202418e-9
minimum edge orientation           -4.010291748977842e-5
minimum exact-support squared gap   3.6475999134916785e-7
SECOND q/w squared gap              3.3771346093259824e-3
T0/T1 radius squared gap            7.792092333325663e-5
```

It is not a realization: it misses both the row-equality tolerance and strict
convexity/separation gates.

The candidate closest to the hard convexity/separation surface was exact-seed
attempt 184:

```text
minimum signed hard constraint     -5.497318714484553e-8
maximum row equality residual       7.405323862472635e-2
```

No candidate simultaneously approached the `1e-9` row tolerance and stayed
inside the strict convexity/separation region.  That is useful discovery
evidence that the omitted rank-two condition is substantive, but it is not an
infeasibility certificate.

## Second source-compatible complete-row word

The exact bank also contains an eleven-point realization of one **complete**
reverse row, with cyclic order

```text
second, x0, y0, nI, c0, b0, b2, c1, b1, c2, nS.
```

This cannot seed the first word because that word puts all six reverse targets
after `nI`.  Instead, `probe_complete_row_word.py` moves only `x0,y0` before
`nI`:

```text
first,t0s,nS,second,x0,y0,q,w,t0i,t1i0,t1i1,t1i2,nI,
x1,y1,x2,y2,surplus,c0,b0,b2,c1,b1,c2,t1o.
```

The independent audit in
`../period-three-seed-compatible-cell/SEED.json` confirms that this is one
enumerated unequal-radius branch:

```text
q,w = II
T0 = 3I+S
T1 = 3I+O
physical exact five = 3O+I+S
fresh O blockers
six fresh I reverse targets
fully disjoint identities
```

The physical word retains all three required blocker/source straddles.  The
exact eleven-point map is

```text
second = o
x0,y0 = source_x,source_y
nI = left
c0,c1,c2 = q0,q1,q2
b0,b1,b2 = old c0,c1,c2
nS = right.
```

`probe_complete_row_word.py` first replays the complete original QF_LRA
encoder under this word.  `COMPLETE_ROW_WORD_LRA.json` is exact rational SAT:

```text
T0 radius = 309
T1 radius = 300
physical radius = 197
reverse radii = 213,191,213
SECOND q/w distances = 198,201
minimum triangle margin = 1
minimum Kalmanson margin = 1
```

Only then did `search_complete_row_word.py` run the coordinate extension.
Even-numbered attempts retain the exact eleven-point subsequence at the warm
start; odd attempts use the affine-diverse regular seeds.  The exact warm
start satisfies nine of the 19 displayed row-equality residuals at floating
roundoff: physical five, the complete reverse-0 row, and the two other
blocker/source pair equalities.  Fourteen roles and the remaining ten row
residuals still have to be solved.

Reproduction command:

```bash
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 \
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/period-three-rank2-numerical-seed/search_complete_row_word.py \
  --attempts 192 --jobs 24 --maxiter 1500 \
  --output scratch/atail-force/period-three-rank2-numerical-seed/COMPLETE_ROW_WORD_COORDINATE_RESULT.json
```

The second batch also completed all 192 starts with zero optimizer success
verdicts and zero full substitution-verified coordinate hits.  Its closest
joint candidate was regular-seed attempt 49:

```text
maximum row equality residual       1.8237031433399054e-4
minimum pair squared distance       8.75779113708943e-9
minimum edge orientation           -5.781524724004705e-3
minimum exact-support squared gap   9.54211676944487e-9
SECOND q/w squared gap              1.751568519356983e-4
T0/T1 radius squared gap            4.5004920116864934e-5
```

The best exact-complete-row-seeded candidate was attempt 68:

```text
maximum row equality residual       2.5397888431905713e-2
minimum signed hard constraint     -1.60447373827663e-4
```

The candidate closest to the hard convexity/separation surface was attempt
163:

```text
minimum signed hard constraint     -8.747619615116141e-8
maximum row equality residual       1.338469068775141e-1
```

Thus the no-hit result survives both the original arbitrary word and a second
word chosen to contain a banked exact complete reverse row.  It is still only
a bounded numerical result, not a coverage theorem or real-algebraic
certificate.

## MEC/nonobtuse gate

The requested second stage was conditional on a high-precision planar hit.
Neither word produced such a hit, so no candidate was promoted into a
constrained MEC/nonobtuse solve.  For diagnostic completeness, first-word
attempt 120 already fails both post-checks:

```text
all-points-inside support circumdisk slack  -1.208386761762936e-4
minimum nonobtuse support-triangle slack    -2.0653716758189944e-5
```

The exact partial seeds themselves have auxiliary MEC/nonobtuse certificates,
but their auxiliary triangle `(second,nI,nS)` is not the live distinguished
triangle `(first,second,surplus)`.  They do not extend those certificates to
the unmapped roles and must not be reported as full-cell results.

## Interpretation

The correct conclusion is only:

> No planar realization was found in 384 recorded, convexity-preserving SLSQP
> starts across two exact-QF_LRA-SAT 25-role words.  The starts include 96
> lifts from the exact rational nine-point cycle/blocker core and 96 lifts
> from an exact eleven-point complete reverse row.

This does not prove that the fully-disjoint cell is impossible.  A future
decisive route would need either a certified real-algebraic infeasibility
argument or a high-precision coordinate hit followed by exact reconstruction.
The next numerical escalation, if desired, should use a solver with a genuine
interior-point treatment of the convex inequalities (for example IPOPT or a
homotopy/continuation formulation), not more starts of the discarded soft
penalty chart.

## Artifact ledger

- `search_constrained.py`: reproducible 24-worker hard-constraint multistart,
  exact-core insertion, early-stop logic, and final substitution gate;
- `search_coordinates.py`: shared role word, squared-distance equations,
  convexity/support diagnostics, and the initial soft-penalty audit code;
- `CONSTRAINED_RESULT.json`: all 192 first-word attempt summaries and its full
  best-point coordinate ledger;
- `probe_complete_row_word.py` and `COMPLETE_ROW_WORD_LRA.json`: exact QF_LRA
  replay for the independently source-audited complete-row-compatible word;
- `search_complete_row_word.py` and
  `COMPLETE_ROW_WORD_COORDINATE_RESULT.json`: the second 192-start coordinate
  extension and full best-point ledger.

The source registries required by `AGENTS.md` were checked before this probe.
No banked theorem was rederived; the only imported discovery artifact is the
explicit exact partial seed described above.
