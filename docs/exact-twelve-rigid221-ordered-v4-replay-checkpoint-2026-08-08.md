# Exact-12 Rigid221 ordered-v4 replay checkpoint

## Result

All 37 solver-selected ordered-v4 convex-core records have reusable Lean
consumers.  This is a completed **learned-cut replay subtask**, not closure of
an exact-12 leaf.

The replay partition is:

- 18 exact replays in `ExactTwelveRigid221OrderedCoreConsumer.lean` and
  `ExactTwelveRigid221OrderedCoverageCuts.lean`, including the recorded long
  equality closures at iterations 4723 and 4898;
- 6 records covered by four cardinality-independent membership schemas in
  `ExactTwelveRigid221OrderedThreeRowCuts.lean`;
- 10 records covered by direct cardinality-independent schemas in
  `ExactTwelveRigid221OrderedUniversalThreeRowCuts.lean`; and
- records 7808, 8077, and 8556 covered by the multi-core orientation arguments
  in `ExactTwelveRigid221OrderedResidualCoverageCuts.lean`.

In particular, iterations 8391 and 8922 collapse to the same seven-membership
three-row theorem.  These generalized consumers use only the memberships
needed by their geometric core, not the full SAT row assignment.

## Reproduction and trust status

The extracted ordered-record file is
`scratch/rigid221-sourceheavy-anchor/ordered-v4-cuts.jsonl`: 37 records,
SHA-256
`720ceb5bddf1e256c209a60154a47396891a8a798bf001c4b973412a5f1a3a66`.

Run:

```bash
uv run scratch/rigid221-sourceheavy-anchor/audit_ordered_v4_lean_replay_manifest.py
```

The audit fails unless the four documented groups are disjoint and equal the
37 extracted iterations.  The existing analyzer scripts independently
recompute the six direct three-row matches, the ten later universal matches,
and the three residual covers from the recorded row and order data.

The 10-module promoted consumer chain contains no `sorry`, `axiom`,
`native_decide`, or `unsafe` declaration.  The scratch transitive axiom audit
reports only `propext`, `Classical.choice`, and `Quot.sound` for the sixteen
generalized consumer theorems.

The authoritative serialized Lean check is:

```bash
cd lean
lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedCoverageCuts \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221OrderedResidualCoverageCuts
```

Result on 2026-08-08: **PASS**.  The serialized build completed all 10,860
transitive targets and rebuilt both named roots successfully.

The residual module imports the universal-three-row module, which imports the
three-row module and the common ordered-core/ingress chain.  The coverage root
checks the earlier exact replays, including the two recorded long equality
closures.  The standalone `ExactTwelveRigid221OrderedLongClosureCuts.lean`
prototype duplicates those declaration names and is deliberately excluded
from the promoted import chain.

## What remains open

The v4 run stopped at `ITERATION_LIMIT` after 10,000 new classified records
(10,706 learned clauses including bootstrap), not at terminal `UNSAT`.
Replaying every learned ordered cut therefore proves neither finite exhaustion
nor a source theorem.

To close either exact-12 live leaf, the route still needs both:

1. source-exhaustive coverage of every valid selector, deletion arm, and
   placement/signature case by a checked finite obstruction; and
2. the placement/symmetry lift carrying an arbitrary source packet into that
   finite coverage universe.

Equivalently, the new Lean theorems are consumers.  The missing producer is a
universal source-to-covered-signature theorem (or a stronger source-level
structural lemma that bypasses finite enumeration).  No live `sorry` is closed
at this checkpoint.
