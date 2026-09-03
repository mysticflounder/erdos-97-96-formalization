# B1 MEC disk-subset isolation audit

Date: 2026-09-03

## Scope

This wave follows the component-isolation checkpoint at
`5d5e6faf74ef1b9ec5d008312ea3eaf50c0890f7`.  It tests selected MEC disk
atoms from exact source system `82c2dfe781d609472430` while retaining all four
6/4/4/4 row systems, pairwise distinctness, the three nonobtuse support atoms,
and the stage-specific convexity policy.  The source record has SHA-256
`dc310082e5430b32bb6b0829ff627586f9d1a10111a3fe7fc9bfbbe8b955ee09`.

This remains finite diagnostic evidence.  The packets do not include deletion
minimality, retained-deletion survival, or the full Problem 97 counterexample
context.

## Label map and masks

The authenticated 18-label source uses this role map:

| label | role |
|---:|---|
| 0 | `A` |
| 1 | `s` |
| 2 | `x0` |
| 3, 4 | `c00`, `c01` |
| 5 | `b0` |
| 6, 7 | `x1`, `x2` |
| 8 | `b1` |
| 9, 10 | `c10`, `c11` |
| 11 | `x5` |
| 12, 13 | `c20`, `c21` |
| 14 | `x4` |
| 15 | `b2` |
| 16 | `o1` |
| 17 | `x3` |

The MEC support is `[1, 16, 0]`, canonically ordered as `[0, 1, 16]`.
Disk atoms at the three support labels are tautological in the normalized
frame.  The tested non-support groups are

- `DX = {2, 6, 7, 11, 14, 17}`;
- `DB = {5, 8, 15}`;
- `D0 = {3, 4}`, `D1 = {9, 10}`, and `D2 = {12, 13}`.

## Authenticated producer changes

The canonical endpoint adapter and producer now accept repeated
`--mec-disk-point` arguments.  An explicit selector must be nonempty, ordered,
distinct, in bounds, and used with a mode that contains disk atoms.  Omitting
the selector preserves the prior all-label behavior.  The selected tuple is
bound into the source record, descriptor semantic input, query ID, stage and
final results, exact replay, command configuration, and offline publication
reconstruction.

The same path now supports
`--mec-parameterization one-height-quadratic`.  In the normalized frame it
declares only the remaining center height `mec_y`, uses the third-support
boundary equation

```text
2 * y_third * mec_y = x_third^2 - x_third + y_third^2,
```

reconstructs the squared radius as `1/4 + mec_y^2`, and emits quadratic disk
atoms

```text
x^2 - x + y^2 - 2 * mec_y * y <= 0.
```

For the six points in the common radius row, the producer selects the least
support label as a deterministic anchor and emits the shared-radius rewrite

```text
x_anchor^2 + y_anchor^2 - x - 2 * mec_y * y <= 0.
```

Exact replay checks both the emitted polynomial and the original circle-disk
atom.  The Lean theorem
`Problem97.gauge_commonRadius_disk_sq_iff_radicalHalfplane` in
`P97/N4d/SmallSReductions.lean` supplies the kernel-side algebraic rewrite.
Its focused elaboration is clean and its axioms are only `propext`,
`Classical.choice`, and `Quot.sound`.  The later governed
`Erdos9796Proof.P97.N4d.SmallSReductions` build completed successfully across
8,009 jobs.  Its best-effort proof-blueprint resync subsequently failed on a
stale private declaration in `DRExactThirteenCapBetweenness`; the Lean module
build itself exited successfully.

Focused verification passed:

- 147 endpoint PIQD tests;
- Ruff on the adapter, producer, and tests;
- `git diff --check` on the four changed source files;
- offline publication validation for all seven target bundles and all seven
  smoke bundles.

The first `dx-db-v1` run exposed a report-ledger bug: its top-level counts
described the fully eliminated parameterization instead of the one-height
parameterization.  The result was superseded, retained only under
`dx-db-v2/tmp/superseded-ledger-v1`, and is not promoted.  The authoritative
`dx-db-v2` run reports one gauge guard, one boundary equation, no explicit
radius variable, and nine selected disk atoms.

## Q1 results

Every governed run uses a 120-second budget per PIQD/Z3 stage.

| run | disk atoms | exact metric | full convex | convex-only | accepted result |
|---|---:|---:|---:|---:|---|
| `dx-db-v2` | 9 | raw SAT at 185; replay rejected | UNKNOWN at 473 | UNKNOWN at 473 | UNKNOWN |
| `dx-db-d0-v1` | 11 | UNKNOWN at 187 | UNKNOWN at 475 | UNKNOWN at 475 | UNKNOWN |
| `dx-db-d1-v1` | 11 | UNKNOWN at 187 | UNKNOWN at 475 | UNKNOWN at 475 | UNKNOWN |
| `dx-db-d2-v1` | 11 | UNKNOWN at 187 | UNKNOWN at 475 | UNKNOWN at 475 | UNKNOWN |
| `full-minus-d0-v1` | 13 | UNKNOWN at 189 | UNKNOWN at 477 | UNKNOWN at 477 | UNKNOWN |
| `full-minus-d1-v1` | 13 | UNKNOWN at 189 | UNKNOWN at 477 | UNKNOWN at 477 | UNKNOWN |
| `full-minus-d2-v1` | 13 | UNKNOWN at 189 | UNKNOWN at 477 | UNKNOWN at 477 | UNKNOWN |

The `dx-db-v2` raw model is not an accepted witness.  Twelve readbacks contain
Z3 `root-obj` algebraic terms, while this endpoint accepts only exact rational
readback.  Semantic replay records `EndpointMetricPiqdError`, saves no SAT
assignment, and classifies the stage as
`INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE`.

The durable run roots are the seven children of
`scratch/runs/b1-mec-disk-subset-isolation-20260903/` named in the table.

## Post-wave mining and next gate

The required direct mining pass over all seven new runs found no accepted SAT
certificate, UNSAT core, assumption subset, or sound general theorem
candidate.  All seven use the same source and rows.  Six are raw UNKNOWN at
every stage; the sole raw SAT is rejected at the exact-rational trust boundary.
Consequently there is no new Lean search key and no theorem-bank search was
triggered.

Q1 therefore does not close B1 and does not justify longer timeouts.  The next
highest-information gate is Q2: three authenticated relaxations, each omitting
one complete `c_i0,c_i1` row pair and the completion equalities that require
that pair, while retaining its paired physical equality, both other complete
rows, and the full MEC disk, nonobtuse, and induced-order packets.  A decisive
UNSAT branch would isolate a smaller formal antecedent.  Accepted SAT in all
three branches would rule out a static closure from only two complete rows and
move the frontier to the retained-deletion source packet.
