# Exact-five profile 0034 source-complete sequential run-0004 postrun

Date: 2026-09-05

Status: authenticated finite diagnostic complete; no theorem or source
realization claim.

## Custody

- Run root:
  `scratch/runs/exactfive-profile0034-new-mirror-reduced-sequential-confirmation-piqd-20260905/run-0004`
- Execution commit: `0ddaee75c2f1a9465d22fe879a859f20a17cd572`
- Wall/user/system time: `66.20s / 13.72s / 1.09s`
- Run-manifest file/self SHA-256:
  `ef3e1744f3a886cf60b51d45949c1af2354adfff5c937683faeda50ca2685f4b` /
  `1c7812122824878500d76cea27c9806ea1876346f4a08dbf2d98cb7cd326442e`
- Launch file/self SHA-256:
  `a07012a2892bc5d6d8db3c1eacf6cc6cb2b211eb4a995a0d7b5d8b355a5d0952` /
  `9c4b78615f649b739d5819d57c7136c648218c2608e7dbe239161a1e907d3983`
- Terminal file/self SHA-256:
  `7162833d0759e766a6a238b7c43e0c7f800be9f745aba2a3c0cfd2ee0670a042` /
  `bcf7c7632af96517c40f62a262310f298e43a26eaeb930478670bc3ffad4e856`
- Upstream custody:
  `6f70dbf7d81353bfd815df50e43f3e048331aa365178bd8872c9c1f922899a9d`

The strict offline verifier passes after later concurrent edits were removed.
The run directly pins eleven source files, including the physical-recovery,
supporting-edge, and `bo_source` modules used by exact reconstruction and
replay, plus twenty-two parent inputs. Independent audit found 216 regular
files, 49 bound engine artifacts, four unique fresh sessions, one solve per
session, no retry, resume, reconciliation, or transport loss, and an empty
runtime temporary directory.

## Results

| Cell | Raw result | Terminal state | Solve time |
|---|---:|---|---:|
| GT7 | UNSAT | `UNSAT_CUSTODY_VALID` | 32,325 ms |
| LT8 | UNSAT | `UNSAT_CUSTODY_VALID` | 18,284 ms |
| Positive control | SAT | `SAT_REPLAYED` | 0 ms |
| Negative control | UNSAT | `UNSAT_CUSTODY_VALID` | 0 ms |

GT7 contains 47 assertions and 68 commands in 5,208 bytes. LT8 contains 58
assertions and 79 commands in 6,183 bytes. This repeats the qualified
run-0003 observations under the repaired source manifest.

Every theorem, source-realization, source-completeness, minimality,
simultaneous-removability, Lean-ingress, promotion, and closure claim remains
false. In particular, neither cell retains the radius-branch or source-strict
group, and neither cell represents the missing B1 provider realization.

## Completed-wave mine and next lane

The bounded mine found no concrete general theorem candidate and therefore
triggered no Lean-corpus search. Existing radius-order schemas do not directly
match this fixed thirteen-class, three-equality pattern. The first theorem-side
gap is source-faithful provider realization: injective convex counterclockwise
boundary data, actual `SelectedFourClass` memberships, complete source-row
equalities, and the live radius/source-strict constraints.

The next experiment should be a small source-faithful canary, not another
abstract minimization wave. Replay the GT7/LT8 order patterns while restoring
the source memberships and both live guard groups. Keep independent controls
and fail-closed exact SAT replay. Only if such a canary survives should the
project return to the prepared fifteen-target leave-one grid.

This result remains finite unguarded discovery evidence and must not be labeled
as progress on the B1 `blockerDeleted` leaf without a new source adapter or
realization theorem.
