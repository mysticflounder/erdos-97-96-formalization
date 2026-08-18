# FirstFiber source-adapter contract

Date: 2026-08-18

The piqd metric miner cannot consume the live FirstFiber target directly.  Its
existing file producer derives boundary order from a finite profile and only
accepts saved assignment records.  The live target has no finite extractor,
no fixed carrier cardinality, and no theorem transporting its boundary order
into that profile convention.

This lane therefore adds
`census/global_confinement/firstfiber_metric_source_adapter.py`.  It defines a
fail-closed packet contract for a future Lean/source extractor:

- five distinct centers with roles `source_blocker`, `first_apex_blocker`,
  `opp_apex1`, `opp_apex2`, and `surplus_apex`;
- five exact four-point supports, with the deleted point omitted from every
  support;
- an explicit cyclic permutation, never inferred from a profile;
- the outside-pair arm and the live theorem declaration as provenance; and
- source facts asserting center distinctness, q-deletion, and outside-pair
  identity.

The adapter projects validated packets to explicit-order metric systems.  It
does not run a solver, infer missing rows, or claim that the packet family is
complete.  Six adversarial tests cover malformed order, deleted-point
membership, non-exact rows, missing provenance, and crossed declarations.

The remaining ingress work is a Lean/source theorem that emits at least one
packet satisfying this contract from
`FiveSurvivorExactRowsBoundary`.  Until that theorem exists, another broad
piqd wave would be off-target.
