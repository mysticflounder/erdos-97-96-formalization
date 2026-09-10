# Provenance: finite-nine cyclic forms

The public target is `Erdos9796FiniteNine.cyclic_forms`, theorem ID
`0ecda05b-fa42-4a3f-9e58-f77d7226bc26`. Its statement is:

```lean
theorem Erdos9796FiniteNine.cyclic_forms {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormA_v2 ∧ S.N4dExcludesFormC_v2 ∧
    S.N4dExcludesFormA_v3 ∧ S.N4dExcludesFormB_v3 ∧
    S.N4dExcludesFormC_v3
```

The authenticated source fragment is
`submissions/finite-nine-modular/source-fragments/cyclic_forms.lean`, 12,271 bytes,
SHA-256 `246d74d5159947ad68c26e2725fa6af7e62b9226a28968a0f5319d3f1087e32c`. It corresponds to
`Solutions.Batch3N9.N4d.CyclicTransport`; the current source module is
`lean/Erdos9796Proof/P97/N4d/CyclicTransport.lean`, SHA-256
`edbf1d9caed20389ae0b93b9f13ea65433b6ae9230b7a85a53e45b1f408e794c`.

The mandatory bounded reuse preflight searched the project Lean corpus at indexed revision
`da400a7a1` for exact and name matches to `cyclic_forms`; it found no cyclic_forms match. The
immediate consumer is `single_apex_exhaustion`. Before this packet, the missing antecedents were
accepted Form A v1, Form B v1, Form B v2, and Form C v1; all four are now available as public
theorem modules. Their accepted theorem/proof identifiers are:

- Form A v1: `34a0a695-2a9d-47f4-b9c6-c3b38c82705d` / `c8238e1b-ad33-43cc-8566-185a03a405e6`.
- Form B v1: `b6bb5e30-c060-4622-9cea-acaa92a6be0d` / `03e034b0-3f2c-4371-bf58-a37f96e453a2`.
- Form B v2: `706aaedc-4e9a-4aad-8ee6-3b57c6a19423` / `4dc55b21-a512-4a1c-9e81-161649b772be`.
- Form C v1: `0a9dd51c-149f-46d7-950a-fb2454f0c58f` / `da2c2503-a9f6-4569-beb8-72bc09713eef`.

The generator replaces only source-private calls to the A v1, B v1, and C v1 proofs with those
public theorem names. It does not retain the source-private B v2 proof.

Prove2Me accepted proof submission `ea892517-aefe-4776-9a28-ebcfd62d5252` for the target theorem.
The submission was created at `2026-09-10T06:11:19.419853+00:00` and accepted at
`2026-09-10T06:12:53.232103+00:00`.
