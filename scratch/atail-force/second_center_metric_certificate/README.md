# ATAIL five-row metric certificate

This authorized parallel-research lane produced a replayable exact certificate
for the smaller `(4,5,6)` CEGAR core.  The original saved six-row core remained
certificate-intractable under the declared bounds, and the seven-row `(5,5,5)`
core was therefore not attempted.

## Outcome

The decisive artifact is
`certificate_normalized_cegar_456_5row.json`.  Singular produced rational
polynomials `h_i` satisfying

```text
1 = sum_i h_i * g_i
```

for the 15 normalized squared-distance generators `g_i`.  `check.py`
independently rebuilt those generators from the pinned CEGAR rows, reparsed all
coefficients over `QQ`, and expanded the identity exactly to the one-term
constant polynomial `1`.  That replay takes about eight seconds on the current
host and is recorded in `verification_normalized_cegar_456_5row.json`.

Only 11 multipliers are nonzero.  The effective rows/equalities use the seven
labels `{0,1,2,6,8,9,10}`; the one-use support labels `4,5,7,11` disappear.
The effective generator indices are

```text
1, 3, 4, 5, 6, 7, 8, 11, 12, 13, 15.
```

`generated_normalized_cegar_456_5row.lean` is a generated fallback proof using
those 11 hypotheses.  The standalone command below exits `0` under a 300-second
wall cap.  It needs theorem-local heartbeat/recursion allowances, and three
syntax-tree tactic linters are disabled because they recurse through the 116 KB
`linear_combination` syntax; those options do not weaken kernel checking.  The
generated theorem remains deliberately unimported.  The compact structural
kernel in the neighboring `scratch/atail-force/five_row_metric_core.lean` is the
preferred integration route and is now complete: its normalized scalar theorem,
point bridge, invariant collision theorem, `SelectedFourClass` incidence bridge,
and `EdgeClosure` consumer all compile with only the standard core axioms.

## Exact statistics and hashes

- CEGAR row-set SHA256:
  `583594c8e55bdf7d3e91734e9c3aa61451131664abea1540c78c660a599e6a63`
- 15-generator SHA256:
  `cfa015ef232fb3306cded3edcb734a7435416cc214c80248b02de48e7e3956fa`
- independently verified certificate file SHA256:
  `8433b3a6b0a1cbd0c5c2b9087f4a4ca55408c3fce0f251155cd327f704cbff74`
- generated Lean file SHA256:
  `af42d2392cb9f911090f42b3a4186214e63d27de2786c1b6292ac565ea6bf65c`
- certificate JSON size: 117,107 bytes
- nonzero multipliers: 11 of 15
- total multiplier terms: 4,302
- largest multiplier: 1,396 terms
- maximum multiplier degree: 8
- maximum product degree: 9
- maximum coefficient numerator: 38,248,429 (26 bits)
- maximum denominator: 12

These numbers make a verbatim imported `ring` proof unattractive even though
the generated fallback checks.  `nlinarith` alone cannot synthesize the
nonconstant ideal-membership multipliers.

## Structural route

The certificate exposes the compact elimination now used by the structural
lane.  With `P0=(0,0)`, `P1=(1,0)`, write `P2=(1/2,b)` and `P6=(c,d)`.
The first equations give

```text
b^2 = 3/4,  c = 2*b*d,  d*(d-b) = 0.
```

The two branches admit short circle parameterizations for `P8`, `P9`, and
`P10`, each ending in incompatible equations for `b*r`.  This is the preferred
human-sized kernel.  A separate exhaustive EdgeClosure audit checked all 11
required EqualityCore families, including
`SixPointCircleChainCollisionCore` and
`SevenPointCircleNetworkCollisionCore`, plus the newer indexed
`SevenPointFiveCircleCollisionCore`, and found no match for this particular
five-row subject.  That 12-family negative is exact only within the listed
families and closure model; see
`../second_center_metric_cegar/bank_reuse_audit.json`.

## Rabinowitsch result

For the five-row core, translation was removed by the invertible change of
variables `u_i = P_i - P0`; no scale or rotation normalization was imposed.
Adding

```text
s * distSq(P0,P1) - 1
```

gives a 16-generator ideal that Singular decides UNIT in 0.531 seconds.
Tracked `liftstd` extraction nevertheless timed out at 120.05 seconds with no
output.  Therefore this is an exact membership result but **not** a replayed
Rabinowitsch certificate.  The timeout is no verdict about certificate
existence or mathematical truth.

For the original six-row core, both absolute-coordinate and
translation-eliminated Rabinowitsch membership probes timed out at 120 seconds;
these are also no verdicts.

## Original requested cores

The original `(4,5,6)` six-row/18-equality normalized ideal is UNIT by ordinary
Singular `slimgb` (about 1.9 seconds), but both tracked representations emitted
nothing before their caps:

- `liftstd(I,T,"slimgb")`: timeout/no verdict at 120.024 seconds;
- `lift(I,ideal(1),U,"slimgb")`: timeout/no verdict at 120.017 seconds.

Because the six-row extraction was not tractable, the original `(5,5,5)`
seven-row/21-equality extraction was not run, exactly as the predeclared gate
required.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_metric_certificate/extract.py --smoke-only

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_metric_certificate/check.py \
  scratch/atail-force/second_center_metric_certificate/certificate_normalized_cegar_456_5row.json \
  --output scratch/atail-force/second_center_metric_certificate/verification_normalized_cegar_456_5row.json

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_metric_certificate/generate_lean.py

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_metric_certificate/test_certificate.py
```

Then, from `lean/`:

```bash
/opt/homebrew/bin/gtimeout 300 lake env lean \
  ../scratch/atail-force/second_center_metric_certificate/generated_normalized_cegar_456_5row.lean
```

All CAS target calls in `extract.py` are hard-capped at 120 seconds and 10 MiB
of output.  UNIT/NONUNIT smoke gates run before every target call.  The
independent checker also rejects a mutated UNIT identity and a false identity
for the known NONUNIT ideal `(z^2-1)`.

## Scope

This closes the scalar inconsistency of one fixed normalized CEGAR core.  It
does **not** prove that every card-12 configuration emits the five rows, does
not provide the shared-radius producer, and does not close the live theorem by
itself.  The round-64 provenance replay sharpens the gap: only one of these five
metric rows aliases a supplied source row (`supplied:u`), while the other four
come only from the finite shadow's selected global-row inventory.  Thus the
five live `CriticalSourceRows` do not directly instantiate this consumer; a
global selected-K4 incidence producer is still required.  No shared Lean source
was edited in this lane.
