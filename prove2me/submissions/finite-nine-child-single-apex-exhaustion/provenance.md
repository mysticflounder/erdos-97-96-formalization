# Provenance: finite-nine single-apex exhaustion

The public target is `Erdos9796FiniteNine.single_apex_exhaustion`, theorem ID
`b5c8965d-f45d-4911-a606-655ddfa6899d`. Its exact statement is recorded in
`submissions/finite-nine-stage3-theorems/platform/Theorems/Thm_Erdos9796FiniteNine_single_apex_exhaustion.lean`.
The immediate consumer is the finite-nine root solution.

The authenticated source fragment is
`submissions/finite-nine-modular/source-fragments/single_apex_exhaustion.lean`,
176,077 bytes, SHA-256
`9cbde9063b4d1e42e5f7e110019565b290fa7065b8fd6392353cd6a580ce505d`. It comes
from `Solutions.Batch3N9.N8.N8kDistribution`, target theorem
`N8k_capInterior_false_of_hasNEquidistantProperty`, and its commit-pinned source URL
is recorded in `plan.toml`.

The direct accepted dependency is `Erdos9796FiniteNine.circle_placement`, theorem ID
`0e9040fa-76aa-44d0-9f4a-f78e0f838e21`, accepted proof ID
`dabbf8f4-1dad-4e7d-93ac-a4861ec89239`. The source fragment contains eight reachable
uses of the private `S.n7_circle_placement hN4e` theorem. The generator replaces all
eight with the public predecessor and asserts the exact count. The earlier inventory
of seven calls omitted one reachable use; the authenticated source bytes control the
transfer.

Prove2Me accepted proof `d578752d-d17e-46cf-b111-ae3d7aec65a2` for the target theorem.
It was created at `2026-09-10T07:45:36.488255+00:00` and accepted at
`2026-09-10T07:50:22.552727+00:00`; the platform theorem status is `Proved`.

Reuse preflight at indexed revision `4ccf89c09` found the exact N8k target and
`N8k_single_apex_false`. Its first missing antecedent was `circle_placement`, now
accepted, and its immediate consumer is the finite-nine root solution.

The generated source has no `sorry`, named axiom, native reduction, compiler-trust
primitive, unsafe or partial declaration, external implementation, or solution-module
import. The local public circle-placement file and public theorem files in the shared
support frontier are offline statement mirrors. They contribute `sorryAx` to the
offline transitive audit; that inherited boundary is separate from the generated proof
source's trust classification.
