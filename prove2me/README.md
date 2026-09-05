# Prove2Me mission: Erdős Problems 97 and 96

This directory holds the editable mission proposal for the two problems as one
package. The combined goal is Problem 97 **and** Problem 96. Problem 97 supplies
a vertex with at most three unit-distance neighbours in each nonempty convex
subset; deleting these vertices counts every unordered edge once and gives the
bound `3n`, hence Problem 96's `O(n)` statement. No reverse implication is claimed.

Open the [mission review page](https://prove2.me/my-missions/c63c586d-1908-47a2-afaa-bfc72728b7ab)
to inspect the combined goal, seven milestones, and independent read-backs.

**SKETCH — NOT PROMOTABLE.** These are open mission statements. Every theorem
item deliberately contains `sorry`; definitions contain no unproved assumptions.
Compiling this packet checks its types and its suitability for the platform's
environment. It does not prove either Erdős problem or import the repository's
existing proofs and certificates.

The mission links to the source repository's counting proof, nine-point
exclusion, conditional P97-to-P96 peeling argument, and open minimal-counterexample
descent. Its historical milestone is Danzer's nine-point example for the earlier
three-neighbour conjecture. Existing source proofs still require transfer and
server verification before the corresponding platform nodes can be marked proved.

## Contents

- `mission-description.md`: the public introduction, including why the problems
  belong together, history, mathematical targets, and references.
- `Definitions/` and `Theorems/`: the namespace-isolated, Mathlib-only statements.
- `items.json` and `proposal.json`: exact API payloads; `_milestone` is local
  metadata removed before item upload.
- `readbacks.json`: independent interpretations of the exact Lean payloads,
  authenticated by SHA-256.
- `validation.json`: statement compilation result and payload digests.
- `mission-receipt.json`: remote proposal ID, review URL, and verified upload state.

The source snapshot is
`757d852766f377f7c1a0ffeeef6d3526bc0cb7a4` (Lean 4.27.0). The statement packet
targets Prove2Me's Lean 4.33.1 / Mathlib
`0df444a360eaa60ab8c11dca51a86af692955474` environment. The port changes the
namespace and replaces upstream utility imports with explicit definitions;
it retains the mathematical quantifiers, convex-independence condition,
positive-radius condition, unordered pair convention, and asymptotic P96 target.

## Reproduce and update

From this directory, after Prove2Me workspace setup:

```bash
uv run --no-project python prepare_mission.py prepare
uv run --no-project python validate_mission.py
uv run --no-project python prepare_mission.py upload
```

After editing any Lean payload, obtain a fresh independent read-back before
uploading. The uploader rejects stale validation and read-back digests, saves its
receipt after each mutation, and verifies returned mathematical content. It only
creates/updates a **Draft** proposal; it has no self-audit or submission action.
The human reviews and confirms the items at the receipt's review URL and clicks
**Submit Proposal**. Prove2Me then compiles/publishes the nodes and sends the public
mission to moderator review.

Authentication is read from `~/prove2me_workspace/credentials.json`, outside this
repository. No API key or access token belongs in these files. Reproducible build
outputs live under the registered
`scratch/runs/prove2me-p97-p96-mission-20260905/run-0001/` tree.
