# Provenance: finite-nine Form B at v2

The public target is `Erdos9796FiniteNine.form_b_v2`, theorem ID
`706aaedc-4e9a-4aad-8ee6-3b57c6a19423`. Its statement is:

```lean
theorem Erdos9796FiniteNine.form_b_v2 {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormB_v2
```

The formal source is `Problem97.N4d.CyclicTransport.N4dExcludesFormB_v2_proof`, represented in
the current Lean tree by
`Problem97.FiniteEndpointShell.N4dExcludesFormB_v2_proof` in
`lean/Erdos9796Proof/P97/N4d/CyclicTransport.lean`. The current module has SHA-256
`edbf1d9caed20389ae0b93b9f13ea65433b6ae9230b7a85a53e45b1f408e794c`; the target declaration
header has SHA-256 `4e9345900b2af7106cccc0550fce33876ccaeef68a82670f44f285a1c1ea2006`.

The stage-3 authenticated target fragment is
`submissions/finite-nine-modular/source-fragments/form_b_v2.lean`, 644 bytes, SHA-256
`dd805a29601e3b8fa2290b87ac62bb338f0a616914c1b4d050359ea079058437`. Its cyclic support source
is `submissions/finite-nine-modular/source-fragments/cyclic_forms.lean`, 12,271 bytes, SHA-256
`246d74d5159947ad68c26e2725fa6af7e62b9226a28968a0f5319d3f1087e32c`.

The generated packet keeps the authenticated declarations `b3n9m073_cyclicShiftMT`,
`b3n9m073_cyclicShift_hCirc`,
`b3n9m073_not_mem_verts_of_not_mem_cyclicShift_verts`, `b3n9m073_cyclicShiftCP`,
`b3n9m073_cyclicShiftPacket`, `cyclicShift`, `cyclicShift_witnessClassAt_v1`,
`cyclicShift_CP_C1`, and `isFormB_v1_cyclicShift`. The non-membership theorem is the
source-private antecedent required by the retained cap-triple construction.

The only deliberate proof-link substitution replaces the source-private call to
`N4dExcludesFormB_v1_proof` by the accepted public theorem
`Erdos9796FiniteNine.form_b_v1`. That predecessor is theorem
`b6bb5e30-c060-4622-9cea-acaa92a6be0d`, accepted proof submission
`03e034b0-3f2c-4371-bf58-a37f96e453a2`. All quantified variables, hypotheses, and the conclusion
of the transported target remain unchanged.

Prove2Me accepted proof submission `4dc55b21-a512-4a1c-9e81-161649b772be` for theorem
`706aaedc-4e9a-4aad-8ee6-3b57c6a19423`; the theorem status is `Proved`. This platform verification
is the promotion evidence for the target. The offline workspace continues to represent the
accepted predecessor with a statement-only mirror, so its local `#print axioms` result separately
contains `sorryAx`.
