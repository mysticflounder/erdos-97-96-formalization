# Provenance: finite-nine common-radius circle placement

The public target is `Erdos9796FiniteNine.circle_placement`, theorem ID
`0e9040fa-76aa-44d0-9f4a-f78e0f838e21`. Its exact statement is recorded in
`submissions/finite-nine-stage3-theorems/platform/Theorems/Thm_Erdos9796FiniteNine_circle_placement.lean`.
The immediate consumer is `Erdos9796FiniteNine.single_apex_exhaustion`.

The authenticated source fragment is
`submissions/finite-nine-modular/source-fragments/circle_placement.lean`, 7,289 bytes,
SHA-256 `12c06a3679448b5b1e4b506db4b099ed6396e98b4e8af1a7c7831b217b8d411b`. It comes
from `Solutions.Batch3N9.N9Endpoint.N67`, theorem `n7_circle_placement`, and its
authenticated source URL is the commit-pinned GitHub path in `plan.toml`.

The public definition module is `Definitions.Def_Erdos9796FiniteNine_N8Interface`; it
already declares `N4eCapContainment`, so the generator omits that duplicate source
definition and retains `exact_cap_class_at_v1`, `exact_cap_class_at_v2`,
`exact_cap_class_at_v3`, `n6_equilateral_moser_triangle`, and `n7_circle_placement`.
The final wrapper uses the public theorem's explicit `hN4e` premise and does not import
any solution module. The accepted upstream cap-containment proof is
`2ab7afe0-25de-4ecb-b326-1bcb63a31b23` for theorem
`2636c407-2850-4f3e-ac20-18e12aa740fa`.

Prove2Me accepted proof `dabbf8f4-1dad-4e7d-93ac-a4861ec89239` for the target theorem.
It was created at `2026-09-10T07:08:34.795679+00:00` and accepted at
`2026-09-10T07:09:55.587793+00:00`; the platform theorem status is `Proved`.

Reuse preflight at indexed revision `9b7f6c4d4` found the exact `n7_circle_placement`
source theorem. Its first missing antecedent was `cap_containment`, now accepted; the
public target exposes that antecedent directly as `hN4e`.

The generated source has no `sorry`, named axiom, native reduction, compiler-trust
primitive, unsafe or partial declaration, or external implementation. The exported
solution's local axiom closure is `[propext, Classical.choice, Quot.sound]`; the
statement-only public theorem mirror is not in that closure.
