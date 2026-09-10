# Provenance: split finite-nine Form `c` at `v₁`

The target is the existing Prove2Me theorem `Erdos9796FiniteNine.form_c_v1`, ID
`0a9dd51c-149f-46d7-950a-fb2454f0c58f`. Its normalized source declaration header is bound by
SHA-256 `253b1f058415bfaef33ea833eb20b052a12e17f7a4b9956802fea8bbbe599296`.

The parent generator authenticates the 306,175-byte Form C fragment at
`submissions/finite-nine-modular/source-fragments/form_c_v1.lean`, SHA-256
`a653d138d81fcaf23ad2e68015fbc4ccc2978dcf9f5d52f55f61535a2c6d246b`, and all 17 current Lean
source files named in its source manifest. It also authenticates the preserved full submission
snapshot, preamble, first 46 units, support declarations, target header, and all Lean 4.33 repair
sites before producing the 815,939-byte parent source, SHA-256
`af6c52e92be3f505d1a43ebb9301c03bcf2aeafa4e3164aa29182fe21f566351`.

This split generator removes the parent's five-unit N4e frontier. Before the parent's duplicate
subtraction and Lean 4.33 repairs, that frontier is 364,106 bytes with SHA-256
`09de892952067480541bb8aef6d405994934027cfe07eea2956aeb3e98dc2a73`. The corresponding repaired
parent slice is 359,438 bytes with SHA-256
`37de5a1b48eade0305753536a05ec531e33db2f9d2a904de65b282aee5c18db0`.

Four declarations not published by `N4eCoreSupport` remain necessary:
`formC_v1_split`, `I1_v3_distance_chain`, `I3_cap_order_chain`, and
`b3n9m051_v1_lt_v1v2_of_mem_I3`. Their authenticated parent bytes concatenate to 20,136 bytes,
SHA-256 `e19f7b2a7603fb172fb42a67c3d08d3bf7ed6c47cd40e83b6a49724675a63c9e`. They are emitted as
local source declarations used by the later Form C units. The retained final source is the six units `FormCPEqCProducer`,
`FormCLowerForcesV2`, `FormCcB1UpperArc`, `FormCcA3QeqC`, `FormCQeqEb3PinClash`, and
`ExcludesFormCv1`, together with the exact seven support groups selected by the parent generator.

The packet imports public definition `Erdos9796FiniteNine_N4dPackets`, ID
`20e77876-f67d-4a4a-bb0e-7613b5d63ace`, and accepted theorem
`Erdos9796FiniteNine.n4e_core`, ID `8092e252-3da6-454a-813c-702397a844f8`, proof submission
`1a2e8096-87cf-4595-b748-0c0ada857b8a`. Every available N4e fact used by the retained source is
read through the chosen `N4eCoreSupport` record. The packet does not import
`Erdos9796FiniteNine.n4d_formb_branch`; no Form C source use requires any of its eight fields.

The shell-free distance helpers are private thin applications of `Problem97.dist_sq_coord`.
Duplicate signed-area and base-transport bodies are replaced by record projections. The eight
unit-local half-shift and vertical-flip injectivity lemmas are private direct coordinate proofs.

The generated source rejects `sorry`, `sorryAx`, native reduction, compiler trust,
unsafe/partial code, external implementations, and named axioms. Local Lean validation and its
statement-mirror trust boundary are recorded in `validation.json`.

Prove2Me accepted proof submission `da2c2503-a9f6-4569-beb8-72bc09713eef` for theorem ID
`0a9dd51c-149f-46d7-950a-fb2454f0c58f`. The submission was created at
`2026-09-10T05:37:27.92401+00:00` and accepted at `2026-09-10T05:45:27.265408+00:00`. This
platform verification does not remove the separate offline `sorryAx` observation caused by the
workspace's statement-only dependency mirrors.
