# Exact-n=15 endpoint apex-profile diagnostic

**Status: necessary-condition solver diagnostic only; not Lean closure.**

This adds the exact first-apex S6/D44 radius consequences to the audited
seven-representative strict-Kalmanson endpoint abstraction.

## Census

- `A=J/OAKXC/D44`: SAT=10, UNSAT=20
- `A=J/OAKXC/S6`: UNSAT=30
- `A=J/OCXKA/D44`: SAT=10, UNSAT=20
- `A=J/OCXKA/S6`: UNSAT=30
- `X=C/OCAKJ/D44`: SAT=9, UNSAT=21
- `X=C/OCAKJ/S6`: UNSAT=30
- `X=C/OJKAC/D44`: SAT=9, UNSAT=21
- `X=C/OJKAC/S6`: UNSAT=30

Non-UNSAT lanes: **38 / 240**.

## Scope

- No Euclidean coordinates or full 15-point completion.
- No second/third-cap profile constraints.
- No anonymous outer support points or explicit deletion-row overlap variables.
- UNSAT cores are tracked Z3 cores, not independently checked certificates.

Source anchors: `ATail/ExactFifteenApexProfile.lean` and the endpoint
packet theorems cited by `five_role_extended_packet_report.md`.

Machine-readable artifact: `scratch/endpoint_exact15_profile_results.json`.
