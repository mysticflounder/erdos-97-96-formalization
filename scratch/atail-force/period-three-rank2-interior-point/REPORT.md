# Period-three rank-two interior-point probe

Date: 2026-07-17

Status: **96/96 ALL-FOUR-SIGN STARTS COMPLETED WITH ZERO SUBSTITUTION-VERIFIED
HITS.  THIS IS A BOUNDED NUMERICAL NO-HIT, NOT UNSAT, NOT A PROOF, NOT A
LEAN RESULT, AND IT CLOSES NO PRODUCTION `sorry`.**

This lane owns only
`scratch/atail-force/period-three-rank2-interior-point/`.  It did not edit
production Lean, shared docs, proof-blueprint state, git, `ShellCurvature`,
`SurplusM44`, or protected finite-certificate lanes, and it ran no
Lean/Lake/LSP command.

## Source-compatible cell and exact seed gate

The fixed boundary word is the independently audited
`COMPLETE_ROW_WORD_LRA` cell from
`../period-three-seed-compatible-cell/{REPORT.md,SEED.json}`:

```text
first,t0s,nS,second,x0,y0,q,w,t0i,t1i0,t1i1,t1i2,nI,
x1,y1,x2,y2,surplus,c0,b0,b2,c1,b1,c2,t1o.
```

Before optimization, `search_parametric_interior.py` fits the exact banked
complete-`b0`-row seed to a 27-parameter chart and substitutes it back.  The
smoke gate records:

```text
maximum coordinate error on the exact 11-point subsequence   3.510833468576701e-16
maximum residual among all 19 row equalities                 2.220446049250313e-16
initial minimum 25-point edge orientation                   -8.86038445390325e-1
```

Thus the source-compatible eleven-point geometry is preserved at floating
roundoff.  Its parametric completion is not initially convex; that is the
feasibility question, not a mapping failure.

## Exact-row parameterization

The chart uses exactly 27 real parameters:

- one log-radius and four angles for each selected first-apex row T0 and T1;
- one log-radius and five angles for the physical second-apex exact five;
- one perpendicular-bisector scalar for each of the three reverse blockers;
- one angle for each of the six reverse outside targets; and
- two coordinates for the surplus apex.

Every blocker is constructed on the perpendicular bisector of its incident
source pair.  Its two outside targets are then constructed on the circle at
the resulting incident-source radius.  Hence all 19 displayed row equalities
hold identically at every optimizer iterate.  This removes the equality vs.
convex-collapse merit tradeoff seen in the earlier Cartesian SLSQP searches.

## Interior-point ledger

SciPy `trust-constr` searches the exact-row chart under these hard open
conditions:

- 575 strict convex boundary-order inequalities;
- 300 pairwise squared separations; and
- one fixed-sign component of each of the two required radius gaps.

The four radius-gap sign components are scheduled exactly 24 times each in
the final 96-start run.  The 79 exact-support disequalities are postchecked on
every returned candidate because fixing all of their sign branches would be
an artificial combinatorial explosion.  A candidate counts as a hit only if
the shared independent checker validates the complete 956-condition
coordinate ledger.

Each start has both a 750-iteration cap and a preemptive 300-second wall
watchdog.  The driver writes `PROGRESS.jsonl` with `fsync` after every event:
`run_start`, a heartbeat every 15 seconds, each `attempt_complete`, any
`early_hit`, and `run_complete`.  Heartbeats contain exact completed and
remaining seed IDs; status is no longer inferred from host load.

Reproduction:

```bash
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 \
MKL_NUM_THREADS=1 NUMEXPR_NUM_THREADS=1 BLIS_NUM_THREADS=1 \
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/period-three-rank2-interior-point/\
  search_parametric_interior.py \
  --attempts 96 --jobs 24 --maxiter 750 --timeout-seconds 300 \
  --output scratch/atail-force/period-three-rank2-interior-point/\
  PARAMETRIC_ALL_SIGNS_RESULT.json \
  --progress scratch/atail-force/period-three-rank2-interior-point/\
  PROGRESS.jsonl
```

The first durable heartbeat occurred at 15.100039582990576 seconds with
`completed=0/96`, all seed IDs `0..95` remaining, and `jobs=24`.

## Exploratory stages that motivated the final constraints

`search_trust_constr.py` first put the 19 equations and 575 convex-order
tests into one Cartesian hard-constraint solve.  Keeping convexity feasible
left large row residuals, so this was not allocated a full campaign.

The first 96-start exact-row run kept pair and radius gaps only as
postchecks.  All 96 row ledgers stayed at floating roundoff, but the best
candidate approached zero orientation by collapsing unrelated roles:

```text
minimum edge orientation                   -4.12196395067924e-10
minimum pair squared distance               3.144504846930519e-25
SECOND q/w squared gap                       0
maximum row equality residual                2.0816681711721685e-17
```

That is why pair separation and radius-gap components are hard constraints
in the final instrument.

An intermediate 96-start hard-open-condition run completed with zero hits,
but its warm-start-derived sign schedule omitted the `(+,+)` radius component.
It is retained as `PARAMETRIC_HARD_RESULT.json` only as exploratory evidence;
it is not the final audit.

## Final result

`PARAMETRIC_ALL_SIGNS_RESULT.json` and the final `run_complete` event in
`PROGRESS.jsonl` record:

```text
scheduled/completed starts                 96 / 96
remaining seed IDs                         none
exact complete-row / projected regular     48 / 48
(-,-),(-,+),(+,-),(+,+) sign starts        24 / 24 / 24 / 24
optimizer returns / wall watchdog stops    46 / 50
maximum observed worker wall time           300.46915399999125 s
substitution-verified hits                   0
hard-feasible returned candidates            0
returned candidates with nonnegative
  minimum edge orientation                   0
maximum row residual over all starts         3.552713678800501e-15
total campaign elapsed                       1185.697011916025 s
```

All 96 starts therefore remained on the 19-equation row variety at floating
roundoff.  The preemptive watchdog was operational: the first 24 workers were
all durably accounted for by approximately 301 seconds, and the 50 timeout
records retain their last callback iterate rather than silently dropping a
start.

The best joint hard-condition candidate was attempt 33, a projected affine
regular seed on radius sign branch `(-,+)`:

```text
minimum hard slack                         -1.1817702678559308e-3
minimum convex-orientation slack           -1.1817702678559308e-3
minimum pair-separation slack              -9.786030621243878e-9
minimum radius-gap slack                    8.645607775583171e-8
maximum row equality residual               4.440892098500626e-16
minimum exact-support squared gap            3.3604248624456213e-7
```

The convex-order condition was the limiting hard surface at that candidate.
Across the whole run, 87 candidates met the requested pair-separation margin
and 14 met both fixed-sign radius-gap margins, but no candidate made even the
minimum edge orientation nonnegative, let alone passed all hard conditions
simultaneously.  Every returned candidate nevertheless had postchecked
minimum exact-support gap above `1e-8` (the smallest was
`1.4554114903010673e-7`).

## Epistemic boundary

Completion of this finite start budget is not a real-algebraic infeasibility
certificate.  The run does not prove the fixed cell impossible and does not
close a source `sorry`.  A numerical hit would only realize
the displayed Euclidean row/cyclic-order cell; it would not by itself supply
the live MEC packet, total `CriticalShellSystem`, or minimality.  A no-hit
would justify escalating this cell to certified real-algebraic elimination or
a direct geometric obstruction, not declaring the cell impossible.
