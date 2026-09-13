# Current resolution pointer

**Closure status — 13 September 2026.** Erdős Problems 97 and 96 are solved
negatively by the external Kruer–Kohlmeyer–Price construction. Prove2Me
accepted separate exact-statement disproofs after transfer audit. The Lean
material described below records the unfinished affirmative route and is
retained for historical provenance with its original conditional and
unfinished claims. See the [resolution record](../RESOLUTION.md#references),
the [citation pointer](../references/kruer-kohlmeyer-price-2026.md), and the
[accepted closure packet](../../prove2me/submissions/negative-resolution-20260913/README.md).

## Historical affirmative-proof checkpoint

The strict consolidation implementation head was
`bef49689c0c29b232199107530f715b85da0d729`, recorded in the
[strict-completion checkpoint](checkpoints/consolidation-refactor-strict-completion-2026-08-26.md)
and its
[gate receipt](../../proof-status/receipts/consolidation-refactor-strict-cluster-isolation-gate-receipt.json).
Its explicit lane base is `ffc54db5658b39d82cedf3e420f59fbffe031c94`.

The bounded W1–W4 packet and the strict original cluster-isolation refactor are
**COMPLETE** under their recorded structural gates. The W4 source cut moves 38
shared declarations into four neutral interface modules, removes both recorded
direct imports of `TriApexEndpointRetainedOmission`, and carries the remaining
coordinator-facing dependency through the governed `Legacy.TriApexWrappers`
seam. The import linter authenticates 25 live waivers, 5 retired waivers, and
all 7 Legacy edges.

This consolidation completion claim is structural only and belongs to the
retired affirmative route. The obligation registry and proof-blueprint surfaces
preserve that historical frontier. Those surfaces were
re-anchored at `eb6a12039aba1e3c4cc48baa9f1299337fc6a2ac` after the subsequent
Rigid221 and B1 source closures. The pre-closure registry recorded 25 reachable
and 6 off-spine declarations, with all 25 reachable leaves carrying validated
factorization records. This later frontier update does not alter the recorded
strict-refactor result above.

For preserved positive-proof source status, see
[proof-status/README.md](../../proof-status/README.md) and the
[generated blueprint](../live-blueprint.md). Checkpoint files remain historical
records; new affirmative work requires explicit reopening by the owner.
