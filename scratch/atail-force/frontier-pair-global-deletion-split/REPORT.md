# Frontier-pair global deletion split

Date: 2026-07-19

Status: **SCRATCH KERNEL-CHECK TARGET. NO PRODUCTION SORRY CLOSED.**

`FrontierPairGlobalDeletionSplit.lean` applies the existing global minimality
bridge to the actual retained `CriticalPairFrontier.pair`, using the
large-opposite-cap parent’s certified `14 ≤ D.A.card` bound.  It preserves the
complete source-indexed deletion core and classifies the core as either a
singleton or the full frontier pair `{q,w}`.

This is the first source-faithful reduction after the audited local replay. It
does not assert that either arm is contradictory. The singleton arm needs a
consumer that turns one frontier-source deletion failure into progress or a
known terminal. The pair arm is the current global minimal-deletion survival
surface; it still needs the total `CriticalShellSystem`/MEC/progress consumer
identified in the parent route audit.

Acceptance gate: `lake env lean scratch/atail-force/frontier-pair-global-deletion-split/FrontierPairGlobalDeletionSplit.lean`
must pass with no `sorry` and no `sorryAx` in the declaration’s transitive
axioms.
