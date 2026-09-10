# Provenance: finite-nine N4d Form B branch support

The public theorem is `Erdos9796FiniteNine.n4d_formb_branch`. For every finite-nine endpoint
shell `S` and fixed zero-defect cap layout `Z`, it returns a nonempty
`N4dFormBBranchSupport S Z`. The record exposes eight exact conclusions used by the final Form
`b` proof.

The packet depends on public definition `Erdos9796FiniteNine_N4dPackets`, Prove2Me ID
`20e77876-f67d-4a4a-bb0e-7613b5d63ace`, and accepted theorem
`Erdos9796FiniteNine.n4e_core`, ID `8092e252-3da6-454a-813c-702397a844f8`, proof submission
`1a2e8096-87cf-4595-b748-0c0ada857b8a`.

Prove2Me published definition `Erdos9796FiniteNine_N4dFormBBranchSupport` as
`3cf4e4b9-6989-4b26-85ca-ae7d5c56a13e` and theorem
`Erdos9796FiniteNine.n4d_formb_branch` as
`42459e69-2295-4399-8a78-05eecc61a975`. Proof submission
`e7aae940-ff91-4c37-a2d9-a7284461f1ba` has status `ACCEPTED`.

The proof declarations come from `lean/Erdos9796Proof/P97/N9Endpoint/N4e.lean`. The generator
delegates authentication of the preserved full-stream snapshot and current Lean sources to the
checked Form-`b` generator. It additionally binds the complete N4e unit at SHA-256
`666acb64602d171cb5c6de9ec7af1eabd6edd1fb4c64756e92ccd23e5972b326`, the repaired
70,922-byte prerequisite prefix at
`de54e8fa7392016f93e362aaf20192a3f9d12f7458b1b5c0f32e3980474de8c5`, the balanced
22,992-byte pure-helper slice at
`05e6cd0ec63a1366824e34c6763b74dac0143d93d212224dfad63fa9b14cd2bc`, and the raw N4e
branch slice at `e28276416f4976c01dabf0bf3f307ac09409561f115d087a58474af873f918e6`.

The branch slice starts immediately after `c2_vertex_same_open_side_as_v3` and ends after
`qEqE_lowerArc_impossible_flipped`. Declarations already published in the N4d packet definition
are removed. References to seven shell-level facts from the omitted first N4e slice are redirected
to projections from the accepted `n4e_core` support record. Pure coordinate and trigonometric
helpers are retained with their original proofs because their statements have no shell parameter
from which to select a support record.

The generated public definition and solution contain no proof placeholder, named axiom, native
reduction, compiler-trust primitive, unsafe declaration, partial declaration, or external
implementation. The theorem stub contains the platform-required placeholder. Local dependency
mirrors for accepted Prove2Me theorems remain statement-only, so the local final-consumer axiom
report includes `sorryAx`. Prove2Me verified the submitted solution using the accepted dependency
proofs and accepted the new theorem. This establishes platform verification; it does not establish
a separately observed local transitive core-only closure.
