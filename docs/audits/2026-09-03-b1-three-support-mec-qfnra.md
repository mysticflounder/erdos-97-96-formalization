# B1 three-support MEC QF_NRA audit

Date: 2026-09-03

## Scope

This lane tests the first geometric field absent from the exact rational
6/4/4/4 row countermodel: the three-boundary-point, nonobtuse circumscribed
MEC packet carried by `SurplusCapPacket`.  It does not test deletion
minimality, retained-deletion survival, or the full Problem 97 counterexample
context.

The evidence classification is **EMPIRICALLY VERIFIED for the recorded finite
formulas only**.  Both production queries returned `UNKNOWN`; they prove and
disprove nothing.

## Authenticated source extension

Commit `9470be3fe14813a583b1bf664cd80dad8ff7b4b3` added direct source schema
`p97-endpoint-direct-metric-system-source-v2`.  It binds three distinct MEC
apex indices into the system ID and adds, in every applicable stage:

- positive squared MEC radius;
- three boundary equalities;
- disk containment for every ambient label; and
- three nonobtuse dot-product inequalities.

Exact `Fraction` replay checks every MEC assertion in a returned rational
model.  Commit `ba74628e4` corrected the top-level MEC count and Markdown
formula ledger.  The quantified minimum-radius clause remains outside this
finite packet, matching the exposed fields of `CircumscribedMECPacket` used by
the B1 ingress.

## Role map and rows

The cyclic labels are

`A,s,x0,c00,c01,b0,x1,x2,b1,c10,c11,x5,c20,c21,x4,b2,o1,x3`.

The four row constraints are:

- center `A`: support `{x0,x1,x2,x3,x4,x5}`;
- center `b0`: support `{x0,x1,c00,c01}`;
- center `b1`: support `{x2,x5,c10,c11}`; and
- center `b2`: support `{x3,x4,c20,c21}`.

The MEC boundary tuple is `(s,o1,A)`, or indices `[1,16,0]`.  The source file
and complete custody trees are under
`scratch/runs/b1-three-support-mec-qfnra-20260903/`.

## Wave A: exact rows

System `eeb00e5cb035ad741f82` contains 14 row equalities, 50 exact
off-circle exclusions, 153 pairwise-distinctness constraints, 288 convex-order
constraints, and 25 MEC constraints.  PIQD/Z3 returned:

| Stage | Assertions | Raw result | Solve time |
|---|---:|---|---:|
| exact-metric relaxation | 246 | `UNKNOWN` | 124856 ms |
| full convex | 534 | `UNKNOWN` | 139944 ms |
| convex-only relaxation | 484 | `UNKNOWN` | 126159 ms |

The complete production custody bundle revalidated offline against the exact
captured sources from commit `9470be3fe`.  A direct cvc5 1.3.3 run on the
weakest archived stage produced no verdict within the planned five-minute
window and was interrupted after the process exceeded that window.  This is no
solver result.

## Wave B: equality-only rows

System `82c2dfe781d609472430` changes only the four row flags from exact to
nonexact, removing all 50 off-circle exclusions.  PIQD/Z3 returned:

| Stage | Assertions | Raw result | Solve time |
|---|---:|---|---:|
| exact-metric relaxation | 196 | `UNKNOWN` | 130003 ms |
| full convex | 484 | `UNKNOWN` | 125588 ms |
| convex-only relaxation | 484 | `UNKNOWN` | 124876 ms |

The production custody bundle passes complete offline validation against its
captured sources, whose adapter and producer hashes match commit `ba74628e4`.

## Theorem mining checkpoint

Neither wave produced a SAT model, an UNSAT core, or a decisive subformula.
Consequently there is no new concrete theorem candidate to send through the
Lean-corpus reuse preflight.  The prior source audit still identifies
`B1WinningLiveSliceSameBoundaryArc` as the missing antecedent for the shortest
checked terminal; these computations do not produce it.

The next computational query must first remove solver-only redundancy forced
by the gauge `A=(0,0)`, `s=(1,0)`: the MEC equations imply
`mec_x=1/2` and `mec_r2=1/4+mec_y^2`.  Any further elimination must be checked
against precisely the current `CircumscribedMECPacket` fields and must not add
same-arc or deletion hypotheses.

## Wave C: derived MEC gauge consequences

Commit `41c696bd0` supplements any MEC system whose boundary tuple contains
the two fixed gauge labels with the derived assertions
`mec_x = 1/2` and `mec_r2 = 1/4 + mec_y^2`.  Exact replay verifies both
identities.  These assertions follow by subtracting the boundary equations at
`A=(0,0)` and `s=(1,0)`; they do not strengthen the geometric source packet.

Rerunning equality-only system `82c2dfe781d609472430` with those two
assertions returned:

| Stage | Assertions | Raw result | Solve time |
|---|---:|---|---:|
| exact-metric relaxation | 198 | `UNKNOWN` | 131413 ms |
| full convex | 486 | `UNKNOWN` | 126944 ms |
| convex-only relaxation | 486 | `UNKNOWN` | 126848 ms |

The production custody bundle passes complete offline validation against its
captured sources from commit `41c696bd0`.  The normalization did not change the
verdict, so further work must eliminate variables or use a smaller geometric
parameterization rather than add more redundant equalities.  As in Waves A and
B, no model or core was produced and there is no new data-mined Lean theorem
candidate.

Separately, commit `5f63d3540` promotes the source-clean disk-boundary
projection inequality
`norm_sq_le_two_inner_center_sub_of_mem_disk_at_boundary` and its
`CircumscribedMECPacket` specialization.  This is the checked Lean fact behind
the intended disk-to-half-space normalization; it does not by itself produce
the missing B1 boundary-arc witness.
