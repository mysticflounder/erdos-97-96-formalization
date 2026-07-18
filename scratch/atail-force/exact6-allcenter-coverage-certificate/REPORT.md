# Exact-six all-center coverage-certificate lane

Date: 2026-07-18

Scope: corrected card-fourteen exact-`(5,6,6)` mutual exact-six finite outer.
This directory is scratch-only.  It does not edit the active gate, production
Lean, closure documents, or proof-blueprint state.

## Headline result

There is no structural-UNSAT certificate for the current static 20-schema
outer abstraction.

The independent encoder in [`encode.py`](encode.py) constructs, for each of
the seven mutual role orbits, a deterministic CNF containing:

- one four-member selected row at every one of the fourteen carrier centers;
- both finite pair-incidence bounds;
- the perpendicular-bisector alternation clauses;
- exact contiguous cap blocks of sizes `(5,6,6)` and their cap-local row-hit
  bounds;
- the exact-five physical-apex shell and the checked card-three/card-four
  physical distribution;
- one actual blocker and source-containing blocker row at every source, with
  both physical apices omitted from the blocker image;
- all named unused/source/target omission fields and the mutual-blocker
  inequality;
- selected-witness strong connectivity, encoded exhaustively by the no-sink-
  subset clauses;
- all 102,102 increasing/reflected embeddings of the existing 20 transported
  2-Kalmanson/3-equality schemas; and
- the source-audit correction

  ```text
  unused ∈ PHYSICAL_CAP = {0,1,2,3,4,5}.
  ```

All seven CNFs are SAT.  Every complete 476-variable CaDiCaL assignment was
substituted back into every clause.  Regenerating all seven formulas and
replaying the compact saved assignments also passes.  The clause totals are
218,863--218,903 per orbit; the small variation is only the role-orbit clause
surface.

This is an exact exhaustive result **within the stated finite structural
encoding**.  The assignments are not abstract-distance, exact-radius,
Euclidean, MEC, no-`M44`, minimal-counterexample, or live Lean models.

The static 20-schema bank is therefore a sound cut family but not a complete
coverage family for the corrected all-center outer.

## Active linear-oracle handoff

The continuation-order SAT assignment was exported by
[`export_active_decoded.py`](export_active_decoded.py) to the precise internal
shape consumed by `allcenter_gate.py`:

```python
decoded = {
    "rows": {int(k): tuple(v) for k, v in encoded["rows"].items()},
    "blockers": tuple(encoded["blockers"]),
    "shell": tuple(encoded["shell"]),
    "roles": dict(encoded["roles"]),
}
```

[`run_active_linear_oracle.py`](run_active_linear_oracle.py) pins every source
variable of the current active `Outer` to that exported assignment.  The
current source outer accepts it as SAT.  Feeding exactly the same `decoded`
object to `linear_metric_check` returns UNSAT with this core:

```text
kal2_0_1_10_11
kal2_0_1_11_12
kal2_1_2_10_11
kal2_1_2_11_12
kal2_2_3_11_12
kal2_3_4_11_12
kal2_4_5_11_12
kal2_5_6_11_12
kal2_6_7_11_12
kal2_7_8_11_12
row_10_0_2
row_11_2_8
row_12_0_8
```

The three row equalities require precisely

```text
{(10,0),(10,2),(11,2),(11,8),(12,0),(12,8)}.
```

This membership schema is absent from the old 20-schema bank because it uses
ten strict Kalmanson inequalities rather than two.  It is nevertheless a
unit-weight instance of the existing generic
`false_of_weighted_kalmanson_cancellation` consumer.  Exact edge-vector replay
gives multiplier `1` on all ten `K2` inequalities and row multipliers
`+1,+1,-1`; every abstract distance coefficient cancels and the strict weight
sum is ten.

[`certified_linear_cut_bank.json`](certified_linear_cut_bank.json) records this
cut.  [`verify_linear_cut_bank.py`](verify_linear_cut_bank.py) reconstructs all
Kalmanson and row-equality vectors from their typed names, checks positive
strict weights, checks exact cancellation, and checks that the clause
antecedent is exactly the six row memberships above.

Thus the correct next computation is certified CEGAR, not a larger static
preload of the 20 existing schemas.

## Reusable certificate pipeline

The directory contains two demonstrated layers.

### 1. Deterministic CNF plus terminal SAT/DRAT handling

- [`encode.py`](encode.py) emits byte-stable DIMACS and a category-span
  manifest with per-span SHA-256 hashes, a complete variable-name bijection,
  the transported-bank digest, and the corrected unused-source domain.
- [`run_certificate.py`](run_certificate.py) invokes CaDiCaL with a hard wall
  limit.  SAT is stored only as a candidate model for replay.  UNSAT is
  promoted only after `drat-trim` emits `s VERIFIED`; the core CNF and LRAT are
  retained.
- [`verify_artifact.py`](verify_artifact.py) independently parses DIMACS,
  checks every artifact digest and category span, reconstructs every
  transported schema embedding directly from the source bank, reconstructs
  the exact unused-in-closed-cap clauses, and then either substitutes the full
  SAT model or re-runs `drat-trim`.

The five-vertex smoke profile forces the complete four-member row at each
center and applies the transported schema closure.  It is UNSAT, its DRAT is
checked, and `drat-trim` emits a seven-clause core plus LRAT.  This smoke proves
that the certificate mechanics work; it has no live geometric meaning.

This follows the useful Census554 infrastructure split:

- `Census554/CoverCnf.lean` is the model for a Lean-side byte-identical CNF
  port;
- `census/census_554/terminal_artifacts.py` is the model for proof-gated
  CaDiCaL/DRAT/core/LRAT publication;
- `census/census_554/verify_completion.py` is the model for consumer-side
  digest and DRAT rechecking; and
- `Census554/CapSelectedNogoodCertificate.lean` is the model for a proof-free
  nogood payload plus a Lean soundness theorem.

The full Census554 publication wrapper should be adapted only at the terminal
UNSAT checkpoint; its bank-row fields are Census554-specific.  Its solver,
checker, hashing, core, LRAT, and atomic-publication discipline are directly
reusable.

### 2. Compact seven-orbit SAT census and active-oracle adapter

- [`orbit_census.py`](orbit_census.py) regenerates and solves all seven CNFs,
  substitutes every complete assignment, and stores only true variable names
  plus decoded rows/blockers/shell/roles.
- [`verify_orbit_census.py`](verify_orbit_census.py) regenerates every CNF from
  source and replays those assignments.
- [`export_active_decoded.py`](export_active_decoded.py) gives the exact mapping
  into the active gate's `decoded` interface.
- [`run_active_linear_oracle.py`](run_active_linear_oracle.py) first pins and
  checks the current source outer, then calls the active linear oracle.

## Exact commands and current results

All Python commands used a writable uv cache and no project mutation:

```bash
UV_CACHE_DIR=/tmp/p97-exact6-coverage-uv \
PYTHONPYCACHEPREFIX=/tmp/p97-exact6-coverage-pyc \
uv run --no-project python \
  scratch/atail-force/exact6-allcenter-coverage-certificate/run_certificate.py \
  --profile smoke \
  --prefix scratch/atail-force/exact6-allcenter-coverage-certificate/smoke \
  --timeout-seconds 60
```

Result:

```text
UNSAT_DRAT_VERIFIED; 25 variables; 43 clauses
```

Independent smoke replay:

```text
INDEPENDENT_REPLAY_PASS
transported_applications=18
```

Full continuation-order structural artifact:

```bash
UV_CACHE_DIR=/tmp/p97-exact6-coverage-uv \
PYTHONPYCACHEPREFIX=/tmp/p97-exact6-coverage-pyc \
uv run --no-project python \
  scratch/atail-force/exact6-allcenter-coverage-certificate/run_certificate.py \
  --profile n14 --orbit continuationOrder \
  --prefix scratch/atail-force/exact6-allcenter-coverage-certificate/n14_continuationOrder \
  --timeout-seconds 300
```

Result:

```text
SAT_CANDIDATE; 476 variables; 218877 clauses
cnf_sha256=e65851c851c7d3b4f57ae9e969e93037e87a8a108a40eaef29c9926e9d3988b4
```

Independent artifact replay:

```text
INDEPENDENT_REPLAY_PASS
transported_applications=102102
unused_domain_checked=[0,1,2,3,4,5]
```

Seven-orbit run and regeneration replay:

```bash
UV_CACHE_DIR=/tmp/p97-exact6-coverage-uv \
PYTHONPYCACHEPREFIX=/tmp/p97-exact6-coverage-pyc \
uv run --no-project python \
  scratch/atail-force/exact6-allcenter-coverage-certificate/orbit_census.py \
  --output scratch/atail-force/exact6-allcenter-coverage-certificate/n14_all_orbits.json \
  --timeout-seconds 300

UV_CACHE_DIR=/tmp/p97-exact6-coverage-uv \
PYTHONPYCACHEPREFIX=/tmp/p97-exact6-coverage-pyc \
uv run --no-project python \
  scratch/atail-force/exact6-allcenter-coverage-certificate/verify_orbit_census.py \
  --input scratch/atail-force/exact6-allcenter-coverage-certificate/n14_all_orbits.json
```

Result:

```text
7/7 SAT_ASSIGNMENT_REPLAYED
SEVEN_ORBIT_REGENERATION_REPLAY_PASS
```

Active source outer plus linear-oracle check:

```bash
UV_CACHE_DIR=/tmp/p97-exact6-coverage-uv \
PYTHONPYCACHEPREFIX=/tmp/p97-exact6-coverage-pyc \
uv run --no-project --with z3-solver --with sympy python \
  scratch/atail-force/exact6-allcenter-coverage-certificate/run_active_linear_oracle.py \
  --input scratch/atail-force/exact6-allcenter-coverage-certificate/n14_continuationOrder.active-decoded.json \
  --output scratch/atail-force/exact6-allcenter-coverage-certificate/n14_continuationOrder.linear-oracle.json \
  --timeout-ms 60000 --wall-seconds 120
```

Result:

```text
active_outer_pinned_status=SAT
linear_metric_check.status=UNSAT
```

Exact new-cut replay:

```bash
UV_CACHE_DIR=/tmp/p97-exact6-coverage-uv \
PYTHONPYCACHEPREFIX=/tmp/p97-exact6-coverage-pyc \
uv run --no-project python \
  scratch/atail-force/exact6-allcenter-coverage-certificate/verify_linear_cut_bank.py \
  --input scratch/atail-force/exact6-allcenter-coverage-certificate/certified_linear_cut_bank.json
```

Result:

```text
EXACT_WEIGHTED_KALMANSON_CUT_BANK_REPLAY_PASS
cut_count=1; strict_weight_sum=10
```

## Required final CEGAR certificate architecture

The active search must not declare coverage from a bare Z3 outer-UNSAT or from
an unrecorded sequence of lazy cuts.  A checkable terminal run needs the
following artifacts.

1. A byte-stable corrected base CNF per role orbit.
2. The SHA-256-pinned 20-schema bank and every concrete embedding clause.
3. An append-only linear-cut bank.  Every cut must contain:
   - the exact Kalmanson and row-equality constraints;
   - exact rational/integer multipliers;
   - positive multipliers on every strict inequality;
   - an exact zero distance-coefficient residual;
   - the exact row-membership antecedent;
   - the complete shell cell if the cut uses an apex-shell equality; and
   - the immediate `false_of_weighted_kalmanson_cancellation` adapter shape.
4. A deterministic final CNF assembled only from the base, the transported
   bank, and independently accepted cut records.
5. CaDiCaL DRAT, `drat-trim` verification, core CNF, and LRAT for each terminal
   UNSAT orbit.
6. A manifest proving that all seven role orbits were covered.  `UNKNOWN` must
   fail closed.

The active gate currently stores only a bounded sample of refinements.  That
is sufficient for theorem discovery but not for a terminal certificate.  A
coverage run must stream **every** added cut to an append-only ledger before it
is asserted, and the final CNF must be regenerated from that ledger rather
than from solver state.

## Precise next Lean bridge

The finite certificate can close a source theorem only after these Lean-facing
steps exist.

1. Move or reproduce the already kernel-checked weighted Kalmanson consumer in
   a production predecessor of the exact-six parent.  Its recorded axiom
   closure is only `propext`, `Classical.choice`, and `Quot.sound`.
2. Define a proof-free `WeightedKalmansonCutData` with typed `K1`/`K2` terms,
   typed selected-row equalities, integer/rational multipliers, optional shell
   conditioning, and a Boolean exact coefficient-cancellation checker.
3. Prove the checker sound: matching selected rows plus a checked cut imply
   `False` through `false_of_weighted_kalmanson_cancellation`.  This is the
   all-center analogue of `CapSelectedNogoodCertificate.isDead_of_check...`.
4. Define the card-fourteen extraction from the live parent packet to a finite
   code containing the boundary reindexing, exact `(5,6,6)` cap blocks, all
   fourteen selected rows, the all-source blocker map, named roles, and strong
   connectivity.  Prove each base-CNF clause family from existing geometry and
   minimality.  In particular the extraction must prove the corrected
   `unused ∈ PHYSICAL_CAP` statement.
5. Port the final deterministic CNF to `Std.Sat.CNF` in Lean, following
   `Census554.CoverCnf`, and replay the terminal LRAT through the repository's
   existing `Std.Tactic.BVDecide.Reflect.verifyCert_correct` route or an
   equivalently audited checker.
6. Combine the seven orbit UNSAT theorems with the exact-six mutual orbit
   classification, then call that theorem from the direct parent `False`
   producer.

The first missing proof-facing object is therefore not another conditional
row producer.  It is the checked `WeightedKalmansonCutData` soundness bridge,
followed by a source-faithful live-to-finite extraction.

## Trust boundary and closure status

- **PROVEN by external exact replay:** the smoke CNF is UNSAT and its DRAT is
  accepted by `drat-trim`; all seven static structural CNFs have complete SAT
  assignments satisfying every clause; the corrected unused-source domain is
  present and checked; the displayed 10-K2/3-row cut has exact zero coefficient
  residual and positive strict weight.
- **EMPIRICALLY VERIFIED against current source:** the exported continuation
  assignment is accepted when fully pinned into the active `Outer`, and the
  active Z3 linear oracle returns the displayed core.
- **KERNEL-CHECKED INPUT CONSUMER, NOT YET WIRED HERE:** the generic weighted
  Kalmanson contradiction theorem is recorded as elaborating with only the
  three standard project axioms.
- **OPEN:** Lean soundness for the generic cut payload, exhaustive certified
  CEGAR termination for all seven orbits, live-to-finite extraction, LRAT
  kernel replay, and the parent theorem application.

No production declaration and no source `sorry` is closed by this scratch
checkpoint.

## Generated-file note

The 7.9 MiB `n14_continuationOrder.cnf` and its solver output are deterministic
reproducible validation artifacts.  The `n14_continuationOrder.drat` path left
by CaDiCaL on a SAT run is **not a proof artifact** and must not be staged or
published.  `run_certificate.py` deliberately excludes DRAT/core/LRAT records
unless the terminal verdict is `UNSAT_DRAT_VERIFIED`.
