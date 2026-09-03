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
