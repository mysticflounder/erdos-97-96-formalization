# Provenance: finite-nine N4 cap containment

The target is `Erdos9796FiniteNine.cap_containment`, theorem ID
`2636c407-2850-4f3e-ac20-18e12aa740fa`. Its public statement is the declaration in
`submissions/finite-nine-stage3-theorems/platform/Theorems/Thm_Erdos9796FiniteNine_cap_containment.lean`.
The source fragment is `submissions/finite-nine-modular/source-fragments/cap_containment.lean`,
808 bytes, SHA-256
`c1dce51523622316761cc2066704591ce1c958a473de61c0dad445e05613c071`.

The authenticated definition and theorem inputs are `Erdos9796FiniteNine_N4dPackets`
(`20e77876-f67d-4a4a-bb0e-7613b5d63ace`) and `Erdos9796FiniteNine.n4e_core`
(`8092e252-3da6-454a-813c-702397a844f8`), plus accepted N4d Form-B branch support
(`42459e69-2295-4399-8a78-05eecc61a975`) and accepted Form A v1, Form B v1, Form B v2,
Form C v1, and cyclic-forms theorem modules. Their accepted identifiers are recorded in the
sibling packets. The reuse preflight at indexed revision `a16f3070d` located the N4c/N4d
declarations in `Erdos9796Proof.P97.N9Endpoint.N4e`; the first missing antecedent was the
classification bridge and its immediate consumer is `circle_placement`.

`generate.py` binds the accepted Form-B split artifact at 374,744 bytes and SHA-256
`261fc4de1e90b0bafb3fdba4f40f8406bbd526e00deda3930259d92203d3fc12`. It re-derives the
authenticated 52,954-byte N4e tail (SHA-256
`521a9c821ae591fc7e4edfb7d2578bdb646178d0973f81c010a483e541c33850`) and extracts only the
five helper declarations, three form splits, classification aliases/constructors, N4d aliases,
form-combination constructors, and N4e bridge required by the target.

The extracted proof source contains no `sorry`, named axiom, native reduction, compiler-trust
primitive, unsafe or partial declaration, or external implementation. Local theorem mirrors for
accepted dependencies are statement-only, so the offline transitive axiom report may include
`sorryAx`; this is attributed to the dependency mirrors rather than the generated source.

Prove2Me accepted proof `2ab7afe0-25de-4ecb-b326-1bcb63a31b23` for theorem
`2636c407-2850-4f3e-ac20-18e12aa740fa`. The submission was created at
`2026-09-10T06:49:05.81592+00:00` and accepted at `2026-09-10T06:51:33.432619+00:00`; the
platform theorem status is `Proved`. The local offline-mirror `sorryAx` observation remains a
separate limitation of this workspace.
