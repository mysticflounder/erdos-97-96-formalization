# Provenance: finite-nine Form B at v1 split proof

The target statement is the existing theorem `Erdos9796FiniteNine.form_b_v1`, ID
`b6bb5e30-c060-4622-9cea-acaa92a6be0d`. Its formal source is
`lean/Erdos9796Proof/P97/N4d/ExcludesFormBv1.lean` at repository revision
`0707e2c26e2e570e2b56ce656242cf5dec4d2584`.

The proof imports these live Prove2Me dependencies:

- definition `Erdos9796FiniteNine_N4dPackets`, ID
  `20e77876-f67d-4a4a-bb0e-7613b5d63ace`;
- definition `Erdos9796FiniteNine_N4dFormBBranchSupport`, ID
  `3cf4e4b9-6989-4b26-85ca-ae7d5c56a13e`;
- accepted theorem `Erdos9796FiniteNine.n4e_core`, ID
  `8092e252-3da6-454a-813c-702397a844f8`, proof
  `1a2e8096-87cf-4595-b748-0c0ada857b8a`; and
- accepted theorem `Erdos9796FiniteNine.n4d_formb_branch`, ID
  `42459e69-2295-4399-8a78-05eecc61a975`, proof
  `e7aae940-ff91-4c37-a2d9-a7284461f1ba`.

`generate.py` authenticates the repaired parent stream before extracting a 32,828-byte prerequisite
prefix, the N4e tail after the published branch conclusions, the exact radial-order and
equilateral-row helper slices, the required N4d modules, and the final theorem wrapper. It applies
the established Lean 4.33 repairs through the parent generator and rewires omitted declarations to
the two accepted support records. The output is 374,744 bytes with SHA-256
`261fc4de1e90b0bafb3fdba4f40f8406bbd526e00deda3930259d92203d3fc12`.

The isolated solution build completed under Lean 4.33.1 in
`/Users/adam/prove2me_workspace`; the log is
`/Users/adam/prove2me_workspace/.lake/lake-build-logs/26856-1789010240290817000.log`.
The generated solution contains no `sorry`, named axiom, native reduction, compiler-trust
primitive, unsafe or partial declaration, or external implementation.

The earlier monolithic submissions `e79c8662-4da5-4028-a16a-ae1139352bd1` and
`c48a71c4-7c62-4cd8-8fb6-0e12fad9dada` both returned only `Verification timed out after 300s`.
This packet supersedes those attempts by consuming the accepted split support nodes and removing
319,432 bytes from the final proof source. Prove2Me accepted the resulting proof submission
`03e034b0-3f2c-4371-bf58-a37f96e453a2` for theorem
`Erdos9796FiniteNine.form_b_v1` (`b6bb5e30-c060-4622-9cea-acaa92a6be0d`). The platform-verified
status uses the accepted `n4e_core` and `n4d_formb_branch` dependencies listed above. The offline
axiom report continues to contain `sorryAx` solely through local statement mirrors and is not a
separate local transitive core-only certification.
