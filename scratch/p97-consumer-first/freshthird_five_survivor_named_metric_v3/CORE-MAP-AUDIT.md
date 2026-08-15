# Five-row order-core role-map audit

Status: **no complete source-entitled map**.

The live deletion arms terminate in `FiveSurvivorExactRowsBoundary`
(`FiveCenterDeletionBoundary.lean`).  That boundary supplies five exact
q-deleted four-point rows, their centers and radii, the deleted-point
omissions, and the deleted point's blocked actual center.  It supplies none
of the named roles, row-membership spine, `EdgeClosure` fields, or cyclic
signed-area facts required by `FiveRowCircleIntersectionOrderCore.Core`.

## Missing core fields

All ten are absent at the source boundary:

| field | source status |
|---|---|
| `OA_OC` | missing |
| `OA_OD` | missing |
| `OA_OE` | missing |
| `OA_AC` | missing |
| `DA_DX5` | missing |
| `OA_EX5` | missing |
| `OA_AX6` | missing |
| `DA_DX6` | missing |
| `CD_CX9` | missing |
| `OA_EX9` | missing |

The six all-positive orientations required by `false_of_core`, and the six
all-negative orientations required by `false_of_core_of_neg`, are also all
absent.  Strictly, the first missing premise is the role tuple/cyclic spine;
even `Core.hOA` cannot be constructed.

The scratch adapter
`scratch/atail-force/residual_555_round19_general_carrier_adapter.lean`
defines a useful *target contract* (`FiveRowSupportData.toCore`), but no live
theorem constructs that contract from either deletion arm.  It is not an
ingress theorem.

Therefore this directory does not generate a consumer-shaped Kalmanson/NRA
query and does not fabricate any missing closure or orientation premise.

