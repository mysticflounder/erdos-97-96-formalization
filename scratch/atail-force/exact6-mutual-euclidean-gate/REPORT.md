# Exact-six mutual literal equality-ideal gate

Date: 2026-07-18

Status: **THE FOURTEEN DISPLAYED ROWS OF THE FINITE EXACT-SIX MUTUAL
FIXTURE ARE ALGEBRAICALLY INCONSISTENT AFTER NORMALIZING POINTS `0` AND
`1`.  A GREEDY DELETION REDUCES THE OBSTRUCTION TO FIFTEEN EQUALITIES AT
EIGHT ROW CENTERS.  MSOLVE RETURNS `UNIT` IN BOTH VARIABLE ORDERS, EVERY
ONE-EQUATION DELETION RETURNS `NONUNIT` IN BOTH ORDERS, AND SINGULAR
RETURNS `UNIT` IN THREE FINITE CHARACTERISTICS.  SINGULAR OVER `QQ`
TIMES OUT.  THIS IS A LITERAL-FIXTURE DIAGNOSTIC, NOT A UNIFORM LEAN
PRODUCER, AND IT CLOSES NO PRODUCTION `sorry`.**

This lane owns only
`scratch/atail-force/exact6-mutual-euclidean-gate/`.  It does not edit
production Lean, closure documents, generated blueprint state, git, or any
protected/shared lane.

## Required theorem-bank preflight

Before deriving the equality core, this lane checked the registries required
by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The focused indexed-corpus search was:

```bash
nthdegree docs search --lean \
  "two distinct centers share an equal-distance pair exact six cap polynomial ideal contradiction"
```

The closest reusable production consumers remain
`CapSelectedRowCounting.outsidePair_unique_capCenter` and
`ATailTwoCenterCapLocalization.false_of_two_cap_centers_equidistant_outside_pair`.
Neither theorem produces the positive cross-row incidences encoded below.

## Encoding

For every displayed row with center `c`, reference member `r`, and other
member `m`, the probe adds the exact polynomial equality

```text
dist(c,m)^2 - dist(c,r)^2 = 0.
```

The fourteen rows are the cyclic shifts modulo fourteen of
`{1,2,5,7}`.  They produce 42 quadratic equalities in planar coordinates.

The probe fixes

```text
point 0 = (0,0),  point 1 = (1,0).
```

This normalization is sound only for the intended injective realization:
distinct labels `0` and `1` have positive distance, so translation, rotation,
and scaling put them at these coordinates.  Without distinctness, the
all-coincident coordinate assignment satisfies every row equality.  The
gate therefore obstructs an injective Euclidean realization of this literal
row fixture; it is not an unconditional statement about the ungauged ideal.

All polynomials passed to msolve are expanded and contain no parentheses.
The default ring retains all 24 free coordinate variables.  `--active-ring`
drops variables absent from a selected subsystem and was used only for the
bounded Singular probes.

## Full literal fixture

For all 42 equalities, msolve over `QQ` returns `UNIT` in both declared
variable orders:

```text
forward: UNIT, about 2.5 s in the recorded smoke result
reverse: UNIT, 1.84 s
```

Here `UNIT` means msolve printed `[-1]`, its claim that the equality ideal is
the whole ring.  This is exact-CAS evidence about the encoded ideal, not a
stored certificate and not a Lean theorem.

## Stable 15-equation core

Reverse greedy deletion of row groups followed by individual equations,
with five-second fail-closed trial budgets, retained full-equation indices

```text
0,1,2,3,5,6,7,8,9,10,13,21,22,24,27.
```

In row form the core is

```text
c0 ref1 -> 2,5,7
c1 ref2 -> 3,8
c2 ref3 -> 4,7,9
c3 ref4 -> 5,8
c4 ref5 -> 9
c7 ref0 -> 8,9
c8 ref1 -> 9
c9 ref0 -> 2
```

Equivalently, it uses these same-radius groups:

```text
0 : {1,2,5,7}
1 : {2,3,8}
2 : {3,4,7,9}
3 : {4,5,8}
4 : {5,9}
7 : {0,8,9}
8 : {1,9}
9 : {0,2}
```

Thus the core has eight row-center roles, nine total point roles, and fifteen
positive co-radial incidences.  It is available directly as `--core15` in
`equality_ideal_probe.py`.

The core replay over `QQ` is stable under the mandatory msolve order detector:

```text
msolve, forward variables: UNIT, 0.20 s
msolve, reverse variables: UNIT, 0.20 s
```

The deletion-mutation gate removes each of the fifteen equations in turn.
All 30 replays (fifteen deletions times two variable orders) return `NONUNIT`;
there are no timeouts or errors in the banked mutation result.  Therefore the
core is one-equation-deletion-minimal **under this msolve oracle**.  This does
not claim globally minimum cardinality or a certified algebraic minimal
unsatisfiable subset.

## Independent-engine boundary

Singular `std` in degree-reverse-lex order was given bounded attempts on the
14 active coordinate variables of the core:

```text
QQ, forward variables: TIMEOUT at 180 s
QQ, reverse variables: TIMEOUT at 120 s
GF(1009):              UNIT in 2.83 s
GF(32003):             UNIT in 2.87 s
GF(65521):             UNIT in 3.01 s
```

The three finite-field results are independent-engine corroboration that the
core is not merely an msolve variable-order artifact.  They do **not** prove
that the characteristic-zero ideal is unit: a reduction can become unit in a
finite characteristic while the `QQ` ideal remains proper.  Since the
characteristic-zero Singular computation and a checkable Nullstellensatz
certificate are absent, the `QQ` verdict remains strong external CAS evidence,
not proof-grade closure.

## Smoke and mutation gates

The script checks parser and solver behavior on hand-decidable systems before
the target verdict:

```text
{x=0, y=0, x+y=1}: UNIT
{x-y=0}:            NONUNIT
```

Both systems are replayed through msolve in forward and reverse variable order
and through Singular over `QQ`; the banked smoke result is `PASS`.

The probe records elapsed time, return code, variable order, timeout, selected
equation indices, ring size, and solver status in JSON.  `--verbose` emits each
minimization trial as JSONL, and `--log-path` persists that event stream, so a
timeout is never guessed or silently treated as `UNIT`.

## Uniform-occurrence audit

The sibling audit in
`scratch/atail-force/exact6-uniform-core-occurrence/REPORT.md` checked all
seven exact-six source-role orbits.  None forces an embedding of this core,
including permitted alias quotients.  The live packet supplies own-source
membership and several negative omissions/upper bounds, but it does not choose
the eight row centers or force the fifteen positive cross-row incidences above.

Consequently this core cannot be installed as the missing exact-six mutual
producer.  A future useful theorem would have to derive the core occurrence
from genuinely stronger full-fiber/MEC/global-minimality geometry, or find a
different direct contradiction.

## Replay

The stable replays use a writable uv cache:

```bash
UV_CACHE_DIR=/tmp/p97-uv uv run --with sympy python \
  scratch/atail-force/exact6-mutual-euclidean-gate/equality_ideal_probe.py \
  --core15 --engine msolve --variable-order forward --threads 24 \
  --timeout-seconds 30 --smoke --summary

UV_CACHE_DIR=/tmp/p97-uv uv run --with sympy python \
  scratch/atail-force/exact6-mutual-euclidean-gate/equality_ideal_probe.py \
  --core15 --engine msolve --variable-order reverse --threads 24 \
  --timeout-seconds 30 --summary

UV_CACHE_DIR=/tmp/p97-uv uv run --with sympy python \
  scratch/atail-force/exact6-mutual-euclidean-gate/equality_ideal_probe.py \
  --core15 --engine msolve --threads 24 --mutation-check \
  --trial-timeout-seconds 5 --summary

UV_CACHE_DIR=/tmp/p97-uv uv run --with sympy python \
  scratch/atail-force/exact6-mutual-euclidean-gate/equality_ideal_probe.py \
  --core15 --engine singular --active-ring --characteristic 32003 \
  --timeout-seconds 60 --summary
```

Key banked artifacts are:

- `minimize-reverse.log.jsonl` and `minimize-reverse-result.json` for discovery;
- `core15-canonical-result.json` for the 30 deletion mutations;
- `core15-msolve-{forward,reverse}.json` for the `QQ` order detector;
- `core15-singular-mod-{1009,32003,65521}.json` for the independent-engine
  finite-field checks; and
- `core15-singular-{forward,reverse}.json` for the bounded `QQ` timeouts.

## Epistemic ledger

- **EMPIRICALLY VERIFIED / EXACT EXTERNAL CAS EVIDENCE:** full 42-equation and
  core 15-equation msolve `UNIT` in both variable orders; every core
  one-equation mutation is `NONUNIT` in both orders.
- **INDEPENDENT FINITE-FIELD CAS EVIDENCE:** Singular `UNIT` in characteristics
  1009, 32003, and 65521.
- **UNRESOLVED:** Singular over `QQ`; no Nullstellensatz certificate and no
  kernel-checked algebraic theorem.
- **PROVEN BY THE SIBLING FINITE/LEAN AUDIT:** no current exact-six source-role
  orbit forces this core's occurrence.
- **NOT CLAIMED:** a uniform contradiction for `FullParentExactFiveMutualData`,
  a Euclidean `CounterexampleData` theorem, or production closure.
- **PRODUCTION `sorry` CLOSED:** none.
