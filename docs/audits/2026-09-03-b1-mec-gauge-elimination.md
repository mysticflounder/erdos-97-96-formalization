# B1 MEC gauge-elimination audit

Date: 2026-09-03

## Scope

This checkpoint changes only the QF_NRA parameterization of a declared
circumscribed-MEC packet whose three boundary apices include gauge labels
`0` and `1`.  The source system, its `system_id`, its rows, and its geometric
hypotheses are unchanged.

Under the retained gauge assertions

```text
p0 = (0,0), p1 = (1,0),
```

the boundary equations at `0` and `1` imply exactly

```text
mec_x = 1/2,
mec_r2 = 1/4 + mec_y^2.
```

The normalized journal therefore substitutes those expressions, declares and
reads back only `mec_y`, and omits the two resulting tautological boundary
equations.  It retains the third-apex boundary equation, positive radius, disk
containment for every ambient label, and all three nonobtuse inequalities.
Packets without both gauge apices retain the original three MEC variables and
three boundary equations.

## Custody and replay

Normalization schema `p97-endpoint-metric-smt-normalization/v2` binds a
`p97-endpoint-metric-mec-parameterization/v1` record into every source record.
That record identifies the mode, declared terms, exact substitutions, and
omitted boundary apices.  Gauge-eliminated SAT replay reconstructs the MEC
center and squared radius as exact `Fraction` values from `mec_y`; stale
three-value readback fails the authenticated arity check.

The producer and exact semantic verifier descriptor versions are both `v2`.
The source `system_id` deliberately remains stable because it identifies the
source rows, cyclic order, and MEC apices rather than the solver
parameterization.  Journals, source records, descriptor semantic hashes, and
PIQD sessions change with the new normalization.

## Verification

- focused endpoint adapter suite: 96 tests passed;
- independent MEC/legacy subset: 17 tests passed;
- Ruff `E9,F`: clean on all three changed files;
- `git diff --check`: clean; and
- independent adversarial audit: PASS, with no required fixes.

No solver was invoked while implementing or auditing this checkpoint.  A new
run must use a fresh generated root; earlier Wave A/B/C artifacts retain their
captured runtime sources and results.

This is computational infrastructure, not a Lean proof or a closure claim.

## PIQD model-replay custody compatibility

The first live gauge-MEC smoke query returned a SAT model that passed exact
rational replay, but offline validation failed closed because current PIQD SAT
solve and receipt records now include a `model_replay` object.  The generic
PIQD adapter already authenticated that field; this endpoint adapter's copied
validator did not yet admit it.

The endpoint validator now checks the exact replay keys, outcome, digests,
timing, and reason rules.  A present replay is accepted only on SAT and only
with outcome `SATISFIED`; receipt and solve copies must agree, and the replay's
solver digest must match the receipt's solver digest.  Historical records that
predate this optional field remain valid.  Mutation tests cover malformed
objects, non-SAT presence, non-satisfied outcomes, solve/receipt disagreement,
crossed solver digests, and the reconciled response-loss path.  The expanded
focused suite passes 119 tests.

The pre-fix smoke publication is diagnostic only and was moved to quarantine.

## Governed PIQD wave

The publication-quality run is rooted at
`scratch/runs/b1-mec-gauge-elimination-wave-20260903/elimination-v1` under lane
`b1-mec-gauge-elimination-wave-20260903`.  Its run manifest repeats lane base
`58a89bce6daffa5c2786b1d238c453bf329eae6d`; the run report records launch-time
HEAD `3822c2a6cb819e44dbf41e1486926e828ee7a45b` and the exact captured runtime
source digests.  A first completed publication at a nonconforming lane root was
moved intact to quarantine and is not promoted.

The four-point gauge-MEC control returned SAT in both stages.  Exact rational
semantic replay accepted both models, current-source offline validation passed,
and the emitted SMT declared only `mec_y`; the exact substitutions supplied
`mec_x` and `mec_r2`.  After validation, this separate diagnostic tree was
moved intact to `scratch/quarantine/b1-mec-gauge-elimination-gauge-control-20260903`
because its bespoke root name is not one of the registered generated-output
classes.  The target publication retains its own governed PIQD smoke gate under
`artifacts/piqd/smoke-sat`.

For target system `82c2dfe781d609472430`, the eliminated query reduced the
Wave C assertion ladder from `198/486/486` to `194/482/482`.  All three stages
returned `UNKNOWN` after solver times of 131014, 138895, and 129189 ms.  Offline
validation passed.  There is no SAT model, UNSAT core, theorem claim, or Lean
claim, so this wave is computationally inconclusive and does not close B1.

The required new-wave theorem mine found no concrete general theorem candidate:
the full-convex stage adds 288 strict orientation inequalities, while its SMT,
original journal, and normalized journal are byte-identical to the convex-only
stage; neither supplies a model, core, assumption subset, or decisive
subformula.  Because the reuse-search key did not change, no further global
Lean-corpus search was run.
