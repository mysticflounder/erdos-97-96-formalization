# A-tail exact-five parent-assembler component (retired 2026-07-26)

Thirteen `Erdos9796Proof.P97.ATail.*` modules, moved here from
`lean/Erdos9796Proof/P97/ATail/`. They were **off-spine**: unreachable from
every library root (`Erdos9796`, `Erdos9796Proof`) and from the
`erase_m1_gate` executable root, therefore not built by `lake build` and not
covered by `proof-blueprint spine`. Per the project spine rule, a module not
imported into a publish target's call chain counts for nothing.

## Why these were unneeded

The live exact-five branch is closed by **cap redesignation** in
`ATail/FrontierLiveClosure.lean` (closure-matrix row `K-A-EXACT5-GLOBAL-COVER`,
2026-07-22): `S.oppCap1` is redesignated as surplus, and the fresh frontier for
the redesignated packet either enters the existing unique-radius terminal or
contradicts source-clean `first_oppCap_card_ge_six`. That proof consumes no
exact-five profile, no card split, no large-opposite theorem, and no recursive
exact-five call — and none of this assembler chain.

Two independent detachment histories converge on the same component:

- `ExactFiveGlobalCoverStarGeometry` was the component's last tie to the spine.
  Commit `b6b15763` (2026-07-25, "math(atail): dichotomy at all three apices")
  removed `import Erdos9796Proof.P97.ATail.ExactFiveGlobalCoverStarGeometry`
  from `FrontierLiveClosure.lean`. That commit message states: *"another agent's
  in-flight exact-five retirement; its removed declarations are referenced
  nowhere else."*
- The other three component roots — `FrontierPairGlobalDeletionSplit`,
  `ParentExactFiveExactSix`, `ParentExactFiveExactSeven` — were **never wired**.
  No commit in the repository's history ever removed an import of them,
  and nothing in the reachable graph ever imported them. They were landed
  off-spine on 2026-07-18..20 and never connected.

## State at the time of the move

Not broken, just unwired and unverified-by-CI. `lake env lean` on
`ParentExactFiveAssembler.lean` and `ExactFiveGlobalCoverStarGeometry.lean`
exited 0 against the 2026-07-26 tree; the latter's `#print axioms` output showed
only `propext`, `Classical.choice`, `Quot.sound`. But their `.olean` files dated
from 18–25 July while the live build was 26 July, because `lake build` does not
reach them — so nothing was checking them against current source.

## The 13 modules

Component roots are marked ★.

    ★ ExactFiveGlobalCoverStarGeometry     (retired by b6b15763)
    ★ FrontierPairGlobalDeletionSplit      (never wired)
    ★ ParentExactFiveExactSix              (never wired)
    ★ ParentExactFiveExactSeven            (never wired)
      ExactFiveGlobalCrossDeletionPair
      ExactFiveMutualOneHitGeometry
      FirstApexShellRole
      FirstApexShellRoleExtractor
      LargeCapUniqueFivePhysicalOmissionSharedCapOrder
      LargeCapUniqueFivePhysicalOmissionSingleOrbit
      LargeCapUniqueFivePhysicalOmissionTransitionGlobal
      ParentExactFiveAssembler
      ParentExactFiveSecondCap

The component is import-closed: after the move, no file under `lean/`
references any of these module names.

## Doc drift this move exposes — NOT yet fixed

`docs/closure-matrix-2026-07-09.md` row `K-A-ALL-REVERSE-OCCURRENCE` lists
`ATail/ParentExactFiveAssembler.lean` and calls the full-parent assembler
`DONE-PRODUCTION`, while that row's completion gate ("choice-free co-radial
occurrence") is still open. The kernel does not support `DONE-PRODUCTION`: the
module was never on either publish spine. That row needs restating by its owner.
It was left unedited here deliberately — the file had uncommitted edits from
another concurrent session at the time of this move.

## Not moved, deliberately

The other 12 A-tail off-spine modules were left in `lean/`:

- **Retained strict-interior component (6):** `FrontierCoupledStrictInteriorNormalForm`,
  `RetainedStrictInteriorParentNormalForm`, `RetainedMatchingEndpointContinuation`,
  `RetainedMatchingSourceReturnRadiusSplit`, `RetainedMatchingCommonDeletionCycle`,
  `RetainedMatchingCommonDeletionNormalization`. Detached separately and earlier,
  by `80a1be2c` (2026-07-20, "refactor(atail): reorient physical critical arm").
  These are **live-relevant**, not dead: `RetainedStrictInteriorParentNormalForm.lean:94`
  `nonempty_retainedStrictInteriorTerminalSurface` is sorry-free and produces a
  four-constructor flat surface from `R : FrontierCommonDeletionParentResidual F`
  alone, and two of the six currently-open obligations sit under that same
  residual. Wiring it would refine those two branches (it would not close them).
  Needs a decision, not an attic.
- **Six singletons:** `SurvivalCoverParentBoundary`, `SecondApexClassOneHit`,
  `Sub2Certificate`, `LargeCapUniqueFiveShortCapTerminal`,
  `RetainedCollisionDifferentPairConsumer`, `MutualShellPairSharedMember`.
  Never wired, no removal commit, each needs its own assessment.
  `Sub2Certificate` has no `.olean` at all — it has never been in a verified build.
