# Six-frontier structural-core audit

Date: 2026-07-14

Status: bounded finite audit plus conditional scratch-Lean validation. This is
not a proof of the ATAIL/K-A residual and does not promote census output to a
Lean theorem.

## Pinned inputs

- Smallest-frontier bank:
  `scratch/atail-force/fresh-continuation-marco/frontier_checkpoint.json`,
  SHA-256 `60cdb851ae94d0afef0188cc4a2ee7ac0cfc9a67dc998a87082e1ab96cf3bc68`.
- Complete-row/cyclic-order checkpoint:
  `scratch/atail-force/fresh-continuation-marco/checkpoint.json`, SHA-256
  `f3234fb83d4097393b96bcfd091d59f2431e089d2d933fd9a188847bb2a5ba70`.
- Semantic label source: `census/candidate_d_probe/q2_token.py`, SHA-256
  `71016fc8212a386ae09e76af6920d72b064327c6e6e73ed7b51954f106fc4f48`.
- Machine-readable result: `checkpoint.json`; generator/checker: `analyze.py`.

The six audited smallest frontiers are shards `0,1,2,3,16,20`. Direct row
membership and inferred equality closure are recorded separately. Formal role
aliasing and injective relabeling are also checked separately.

## Exact semantic labels

For the `(5,5,5)` profile, the census convention is:

| Label | Meaning |
| --- | --- |
| `0` | Moser apex `U`, incident to `O1,O2`, opposite cap `S` |
| `1` | Moser apex `V`, incident to `S,O2`, opposite cap `O1` |
| `2` | Moser apex `W`, incident to `S,O1`, opposite cap `O2` |
| `3` | strict interior support of `S` (block `3,4,5`) |
| `6,7` | strict interior supports of `O1` (block `6,7,8`) |
| `9,10` | strict interior supports of `O2` (block `9,10,11`) |

Thus `0,1,2` are the Moser apices. Labels `3,6,7,9,10` are non-Moser
carrier points used as selected-row supports.

## Common equality skeleton

All six frontiers contain an injective realization of
`Problem97.Census554.MECStraddlingRowCore.Core`:

| Shards | `(o,a,p,s,x,y)` |
| --- | --- |
| `0` | `(0,1,6,2,9,10)` |
| `1,2,3,20` | `(1,0,3,2,9,10)` |
| `16` | `(2,0,3,1,6,7)` |

In each case, a selected row centered at Moser apex `a` directly contains
`o,s,p`, and a selected row centered at Moser apex `s` directly contains
`a,o,x,y`. Direct row equalities are therefore

`d(a,o)=d(a,s)=d(a,p)` and `d(s,a)=d(s,o)=d(s,x)=d(s,y)`.

Edge symmetry and transitivity, not additional row memberships, infer the
four `Core` fields

`oa=ap`, `oa=os`, `oa=sx`, and `oa=sy`.

The generic constructor and all three concrete row forms kernel-check in
`MECStraddlingTwoRowValidation.lean`.

## Why this does not fire the MEC consumer

The displayed mappings have pinned orientation signatures `(+,+,+,-)` for
shards `0,16` and `(-,-,-,+)` for shards `1,2,3,20`, in the theorem's field
order `(oap,oas,oxs,osy)`. Hence neither `Geometry` nor `NegativeGeometry`
can be built from these mappings. Exhaustive equality-closure plus cyclic-order
search finds no orientation-compatible mapping at all in shards `0,1,2`.
Shards `3,16` have unrelated injective orientation-compatible equality
skeletons, but their boundary roles are not the Moser-apex assignment above;
shard `20` has only a role-aliasing match. There is no common usable mapping.

Field-by-field audit against the live `leafSurplusPacket` geometry:

| `Geometry` field | Status |
| --- | --- |
| `center` | Direct from `CircumscribedMECPacket.ofNonObtuse` |
| `boundary_oa` | Direct: `o,a` are Moser vertices on the MEC boundary |
| `boundary_op` | Missing: `p` is a strict cap-interior label, not the third Moser vertex |
| `x_disk`, `y_disk` | Direct from `disk_contains_A` once label carrier membership is supplied |
| `nonobtuse_a` | Derivable from opposite-cap membership and the live packet |
| four orientations | False for the common mappings; no common alternative |

The exact missing boundary statement is

`dist (pointOf o) center = dist (pointOf p) center`,

i.e. the chosen strict cap support `p` would also have to lie on the MEC
boundary. The packet only supplies its disk inequality. The scratch file
kernel-checks all three cyclic `nonobtuse_a` producers using
`exists_cone_coeffs_of_cap_region`, `CapTriple.arc_membership`, disk
containment, Moser nondegeneracy, and the packet's Moser-angle inequality.

## Negative registry audit

- No direct `FourRowPerpBisectorCore` match in any shard.
- No equality-closure `PerpBisectorCore` or `ExactOffCircleCore` match.
- No exact same-side `FourPointTwoCircleBisectorOrderCore` match.
- Zero matches common to all six among 23 parsed equality-only collision cores
  or nine parsed cyclic/order cores, both with formal aliases and with
  injective relabelings.
- Every shard is deficit one from the three named small templates above, but
  those are near-cores only; the checkpoint records whether the complete exact
  row forces each proposed completion unequal.

## Validation

From the repository root:

```text
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/six-frontier-structural-core/analyze.py --check
```

From `lean/`:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/six-frontier-structural-core/MECStraddlingTwoRowValidation.lean
```

The Lean command exits `0`. `coreOfTwoRows` reports only
`[propext, Quot.sound]`; the geometric adapters and conditional contradiction
consumers report only `[propext, Classical.choice, Quot.sound]`. There is no
`sorryAx` in the scratch declarations.
