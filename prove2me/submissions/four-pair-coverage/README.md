# Four-support overlap: prepared Prove2Me submission

**Status: locally validated; not submitted to Prove2Me.**

This packet extracts `Problem97.FourPairCoverage.overlap_of_three_disjoint_pairs` as a standalone Mathlib-only proof. The exact original binders, hypotheses, conclusion, and proof body are retained; only the exported name is changed. The public source theorem remains untouched.

## Files and validation

- `payload.json`: create a **private** theorem in Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` (Lean 4.33.1).
- `Theorems/Thm_Erdos9796Mission_four_pair_overlap_on_seven.lean`: the exact target statement. Its `sorry` is the platform-required statement placeholder, not the submitted proof.
- `Solutions/Sol_Erdos9796Mission_four_pair_overlap_on_seven.lean`: the complete top-level `solution`; no project imports or proof placeholders.
- `explanation.md`: the counting argument and its precise role in the exact-16 classifier.
- `provenance.json`: source commit, declaration, hash, and intended private mission.
- `validation.json`: the actual Lean command, successful exit, exact-target application, core axiom output, and file hashes.
- `readback.json`: independent review of the exact statement and proof packet.

The local check uses the already-built Prove2Me workspace under Lean 4.33.1, with `autoImplicit false` and a 4 GiB memory ceiling. The checked probe embeds the submitted proof, then applies it to an independently elaborated copy of the target type. `#print axioms solution` reports exactly `propext`, `Classical.choice`, and `Quot.sound`. No full migration build is needed for this lemma.

## Submission sequence

1. Recheck the receipt hashes and confirm this target name does not already exist in the selected environment.
2. Send `payload.json` to `POST /api/v1/submit-problem`; wait for the publish job to succeed and record the resulting theorem ID.
3. Send that ID and the solution file to `POST /api/v1/verify`, with `proof_type=prove` and `explanation.md` as the explanation. Record the verdict and remote IDs separately. The proof is accepted by the platform only after its server verification succeeds.

The intended mission is the existing private Erdős 97/96 mission, ID `1061a384-cdea-43b4-adb5-273627ea45a0`. The payload creates a private supporting theorem; it does not modify the mission or its milestones. Link it through a later submitted parent reduction when transferring the exact-16 classifier. No authentication material is included in this packet.

## Proposed descent milestones

The current mission's `minimal_counterexample_removable` target can remain the parent while its substantive dependencies are exposed separately:

1. **Deletion and induction framework:** given a removable vertex, construct a smaller nonempty convex counterexample and derive the contradiction to minimality. Publish this with the removable-vertex input explicit.
2. **Structural reduction of a minimal counterexample:** produce the actual geometric packets used by the descent argument, preserving their realizability and minimality hypotheses.
3. **Local geometric exclusions:** make independently reusable cases into child theorems. The exact-15/16 coverage lemmas are supporting examples, not a proof for arbitrary cardinalities.
4. **Exhaustive coverage and removable-vertex construction:** prove that every remaining minimal counterexample is handled by those cases or yields the required deletion. This universal step remains open.

The existing counting lower bound and nine-point exclusion already have mission milestones. Keep them visible rather than duplicating them. The final induction assembly consumes the base cases and the descent step. A reduction depending on open children must retain that status; it must not present the imported open removable-vertex theorem as an unconditional completed proof. These are proposed boundaries only; exact new formal contracts and platform milestone changes are separate work.
