# Exact-six integrated metric search

Status: **exact theorem-discovery / finite-shadow work only.**  This directory
does not close a Lean `sorry`, and no result here is a Euclidean or MEC
realization certificate.

## Surface audited

The structural outer formula is rebuilt from
`scratch/atail-force/exact6-allcenter-coverage-certificate/encode.py`, SHA-256
`1d31c875afa50ea03d825d6ddc34ea41928438dddd5f0b50918c4b448ef599d5`.
The integrated model covers all seven distinguished-role orbits at `n = 14`:

- `continuationOrder`;
- `reverseContinuationOrder`;
- `sharesFirstAtSource`;
- `sharesFirstAtTarget`;
- `sharesSecondAtSource`;
- `sharesSecondAtTarget`; and
- `fourDistinct`.

Every run in this lane explicitly omits the old literal metric-cut banks.  The
metric layer consists of selected-row equalities, the exact-five second-apex
shell equality, and either:

- the full linear profile: strict Kalmanson plus strict triangle inequalities;
  or
- the Kalmanson profile: strict Kalmanson only.

The exact direct and CEGAR profiles normalize strict pair positivity and strict
Kalmanson slack to at least one.  This is a homogeneous normalization, not an
extra geometric assumption.

## Numerical reconnaissance

For the full linear MIP, six role orbits reached HiGHS optimum with common
slack zero in 50--65 seconds.  `fourDistinct` retained a zero incumbent but did
not close its positive dual bound after either 300 or 900 seconds; it is
`UNKNOWN` under those budgets, not proved zero.

For the Kalmanson-only MIP, all seven role orbits reached numerical optimum
zero.  `kalmanson-only.exact-zero-primal-replay.json` independently replays an
exact uniform-distance zero-slack primal for every orbit.  That replay proves
only feasibility at Kalmanson slack zero; it is not a strict-Kalmanson ALIVE
witness.  All seven LP relaxations have positive optimum, so the obstruction is
integrality-sensitive.

## Exact fixed-leaf certificates

For one HiGHS-selected leaf in each orbit, `dual_probe.py` reconstructed an
exact rational Farkas contradiction.  `verify_dual_probe.py` independently
replays all seven.  The resulting pure-membership nogoods use 7--11 selected
row literals apiece and no numerical tolerance.

These certificates are local leaf exclusions.  They do not prove orbit
coverage.

## Exact CEGAR banks

`exact_cegar.py` alternates an exact structural SAT model with an exact Z3
linear oracle.  Every metric-UNSAT leaf emits an append-only integer Farkas
nogood.  The corrected driver has:

- pinned run identity and input hashes;
- output-directory locking;
- explicit `ALIVE`, `UNKNOWN`, and `LIMIT` outcomes;
- canonical exact-rational ALIVE persistence; and
- vector/domain/shell replay before accepting a cut.

The independent checker in
`scratch/atail-force/exact6-integrated-cegar-audit/verify_exact_cegar.py` does
not import this producer.  It separately checks seed duals, cut cancellation,
antecedent polarity, exact-five shell conditioning, and the complete displayed
semantics of any ALIVE artifact.

The first seven-orbit run produced 7,000 exact cuts.  Deduplication left 6,891
cuts in `global-cuts-1000.jsonl`.  Exact dihedral closure, restricted to
transports preserving the fixed second apex where required, produced 186,404
unique cuts in `global-cuts-1000-d14.jsonl`.

A later faithful Source/Target pass added 2,816 and 2,822 independently replayed
cuts.  Merging those with the 6,891-cut bank removed 20 duplicates and produced
12,509 exact cuts:

```text
global-cuts-cross-20260718.jsonl
SHA-256 92a88957465e7d9e3c47392e8748ad6a8da05089b75e14abb7b16181a17e7288
```

`global-cuts-cross-20260718.replay.json` records
`INDEPENDENT_EXACT_LOCAL_CUT_REPLAY_PASS` for all 12,509 cuts, including 302
exact-five-shell-conditioned cuts and zero positive-distance constraints.

No CEGAR run has reached a terminal structural UNSAT plus DRAT package.

## Positivity correction and ALIVE status

Every Kalmanson, selected-row, and shell vector has coefficient sum zero.
Therefore translating an exact nonnegative distance table by
`d'(i,j) = d(i,j) + 1` preserves those expressions and forces positive pair
distances.  Pair positivity cannot strengthen this translation-invariant
linear shadow.  Triangle slacks also increase by one under this translation.

An earlier unpersisted nonnegative-oracle SAT event motivated this correction,
but it is not a certificate.  Replaying the recorded Source/Target frontiers
did not reproduce SAT: both next leaves were exactly Kalmanson-UNSAT and yielded
new valid cuts.  The authoritative prefix replays matched all 721 Source and
719 Target historical cuts and are pinned at:

```text
recovery-agent/sharesFirstAtSource.original-boundary.json
SHA-256 f516dd91202757240850323819888c6acbc5a8cb5307293af4ae5ca392e1f676

recovery-agent/sharesFirstAtTarget.original-boundary.json
SHA-256 4c9409cc1fe185a832864a1e817483fcb54d46a0f7ca74ab94feb6a5d67eb128
```

At this checkpoint there is **no persisted `alive.json`**.  Accordingly the
existence of a strict-positive integrated survivor remains unresolved, not
established.

`find_exact_alive.py` now writes a fail-closed package for every direct run:

- a pinned manifest before solving;
- an append-only start/done event log;
- an output lock;
- an atomic result; and
- on SAT, a standalone canonical `*.alive.json` for independent replay.

The initial Source D14 direct run returned exact-SMT `unknown` after 653.618
seconds.  The six remaining orbits then ran a one-random-seed-per-orbit,
600-second Kalmanson-only portfolio under
`direct-portfolio-d14-20260718/`.  Each member imports all seven verified seed
duals, the 6,891-cut bank, and the 186,404-cut D14 closure.

All six members completed with exact Z3 status `unknown` and reason `timeout`
after 655.9--656.7 seconds wall time.  None returned SAT or UNSAT, no lock
remains, and no ALIVE sidecar exists.  The fail-closed package inventory is:

```text
direct-portfolio-d14-20260718/summary.json
SHA-256 344e5c57fd1ab023217792ccbdbdf614e11ee3cf85ef855e2bee31a46d64f863
status EXACT_DIRECT_PORTFOLIO_COMPLETE_NO_ALIVE_NO_UNSAT_PROOF
```

An absent result with a manifest would mean interrupted/incomplete, never
UNSAT; that condition does not occur in this completed six-member package.

## Decision boundary

- A verifier-accepted exact ALIVE table would show that the current abstract
  structural + Kalmanson surface is insufficient.  It would still not be a
  planar Euclidean, MEC, or Lean counterexample; the next consumer would need
  rank-two Euclidean/Cayley--Menger, MEC/full-fiber, or global-minimality force.
- A proof-producing exact UNSAT result for all seven orbits would close this
  finite `n = 14` abstraction only.  A checked coverage/cardinality lift and a
  Lean-facing producer would still be required to close the live parent.
- `UNKNOWN`, a numerical zero optimum, or a growing exact-cut bank closes no
  theorem.

## Reproduction entry points

```bash
UV_CACHE_DIR=/tmp/uv-cache-exact6 uv run python \
  scratch/atail-force/exact6-integrated-cegar-audit/verify_exact_cegar.py \
  --self-test \
  --bank scratch/atail-force/exact6-integrated-milp/global-cuts-cross-20260718.jsonl

UV_CACHE_DIR=/tmp/uv-cache-exact6 uv run python \
  scratch/atail-force/exact6-integrated-milp/find_exact_alive.py --help
```
