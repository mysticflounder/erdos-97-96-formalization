# Finite-nine shell child

This packet closes the first Stage-3 child statement, `Erdos9796FiniteNine.shell`. It constructs the public `Batch3N9.Problem97.FiniteEndpointShell` from a nonempty convex-independent nine-point set with the four-distance property.

The 3,207-byte solution is a direct public-boundary rewrite of the authenticated `finiteEndpointShellOfCounterexample` construction. It imports the published `Erdos9796FiniteNine_Shell` definition bundle and five already-published counting theorems; it does not copy their proofs or re-establish their geometry.

## Validation status

- The theorem stub and no-sorry solution elaborate under Lean 4.33.1 (commit `819816b2`).
- The solution is below Prove2Me's one-MiB source limit and contains none of the forbidden proof/trust tokens listed in `validation.json`.
- The four published finite-nine definition bundles were previously audited with axiom closure `{propext, Classical.choice, Quot.sound}`.
- The accepted counting packet audited all 75 proof nodes, including the five direct imports here, with the same three-axiom closure.
- A local `#print axioms` over downloaded public theorem stubs reports `{propext, sorryAx, Classical.choice, Quot.sound}`. The `sorryAx` is expected from Prove2Me's downloaded statement-only theorem modules; all five corresponding proof submissions are `PUBLISHED` and their proof-bearing source closure was independently audited without `sorryAx`.
- No native reduction, unsafe declaration, external implementation, or compiler-trust boundary occurs in the solution or either audited dependency frontier.

The Stage-3 theorem node is public as `a8773adc-86d1-4bff-b1e3-5380e4ae8974`, and the corrected top-level solution was accepted as submission `1e741eb6-3b25-4609-9c63-9e8fb24eb101`. The earlier namespaced-solution rejection is retained separately for diagnosis and replay.

## Files

- `platform/Theorems/Thm_Erdos9796FiniteNine_shell.lean`: exact Stage-3 child statement.
- `platform/Solutions/Sol_Erdos9796FiniteNine_shell.lean`: no-sorry solution.
- `platform/Audit.lean`: local type and placeholder-aware axiom probe.
- `explanation.md`: proof explanation sent with the solution.
- `plan.toml`: generic uploader plan for the public shell node.
- `provenance.md`: source and public dependency binding.
- `validation.json`: bounded compile, size, token, and trust results.
