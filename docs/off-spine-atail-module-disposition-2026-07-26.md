# Off-spine A-tail module disposition (2026-07-26)

Path-resolution note for readers of any older doc that cites an
`Erdos9796Proof.P97.ATail.*` module which is no longer under `lean/`.

## What was measured

Import-graph reachability over all 4218 production modules from every build
root — the two library roots `Erdos9796` and `Erdos9796Proof`, plus the
`erase_m1_gate` executable root declared in `lean/lakefile.toml`. The exe root
was included deliberately; it accounts for exactly one module
(`ErasedCertificate.ErasedNativeEvalGate`) and does not rescue any A-tail
module.

Result: 3630 modules reachable, 588 unreachable, of which **25 are under
`P97/ATail/`**. Unreachable means `lake build` never compiles them and
`proof-blueprint spine` cannot see them. Corroborating evidence that they were
dead weight rather than latent machinery: their `.olean` files dated 18–25 July
against a 26 July build, and the full-build job count was **11639 both before
and after** the 13-module removal below.

Off-spine counts by area at the time of measurement, for reference:

| Area | Reachable | Off-spine |
|---|---|---|
| `ATail` | 2112 | 25 |
| `EndpointCertificate` | 549 | 1 |
| `SurplusCertificate` | 536 | 1 |
| `ErasedCertificate` | 160 | 385 |
| `Census554` | 78 | 154 |
| `MultiCenter` | 3 | 17 |

The large `ErasedCertificate` / `Census554` / `MultiCenter` figures were not
acted on and are not classified here.

## Structure of the 25

Undirected component analysis gives **two components plus six singletons** —
not one island. An earlier reading that split them into three groups was wrong:
the exact-five cover-star chain and the parent-assembler chain share
`LargeCapUniqueFivePhysicalOmission{SharedCapOrder,SingleOrbit,TransitionGlobal}`
and `ParentExactFiveAssembler`, so they are one 13-module component with four
roots.

## Moved to `attic/atail-exact-five-parent-assembler-2026-07-26/` (13)

Commits `195baf23` (move) and `830f0a3e` (provenance README). Full reasoning,
including the two distinct detachment histories, is in that directory's
`README.md`.

Old path for all thirteen was `lean/Erdos9796Proof/P97/ATail/<name>.lean`;
component roots marked ★.

    ★ ExactFiveGlobalCoverStarGeometry      retired by b6b15763 (2026-07-25)
    ★ FrontierPairGlobalDeletionSplit       never wired
    ★ ParentExactFiveExactSix               never wired
    ★ ParentExactFiveExactSeven             never wired
      ExactFiveGlobalCrossDeletionPair
      ExactFiveMutualOneHitGeometry
      FirstApexShellRole
      FirstApexShellRoleExtractor
      LargeCapUniqueFivePhysicalOmissionSharedCapOrder
      LargeCapUniqueFivePhysicalOmissionSingleOrbit
      LargeCapUniqueFivePhysicalOmissionTransitionGlobal
      ParentExactFiveAssembler
      ParentExactFiveSecondCap

`b6b15763` removed the last spine tie — the
`ExactFiveGlobalCoverStarGeometry` import in `FrontierLiveClosure.lean` — and
its message records *"another agent's in-flight exact-five retirement; its
removed declarations are referenced nowhere else."* The other three roots were
never imported by anything reachable, and no commit in history ever removed an
import of them. The live exact-five branch is closed by cap redesignation
(`K-A-EXACT5-GLOBAL-COVER`), which consumes none of this chain.

Verified after the move: no file under `lean/` references any moved module
name; full build green (11639 jobs, 0 errors); spine unchanged at six open
obligations on both publish targets.

## Kept in `lean/`, marked `COMPAT-ONLY/BANK` (12)

Retained strict-interior component (6) — detached separately and earlier by
`80a1be2c` (2026-07-20, "reorient physical critical arm"), unrelated to
exact-five:

    FrontierCoupledStrictInteriorNormalForm       marked by ef691edb
    RetainedStrictInteriorParentNormalForm        marked by 0d846a2a
    RetainedMatchingEndpointContinuation          marked by 0d846a2a
    RetainedMatchingSourceReturnRadiusSplit       marked by 0d846a2a
    RetainedMatchingCommonDeletionCycle           marked by 0d846a2a
    RetainedMatchingCommonDeletionNormalization   marked by 0d846a2a

Never-wired singletons (6), all marked by `0d846a2a`:

    SurvivalCoverParentBoundary
    SecondApexClassOneHit
    Sub2Certificate
    LargeCapUniqueFiveShortCapTerminal
    RetainedCollisionDifferentPairConsumer
    MutualShellPairSharedMember

The retained strict-interior component was kept deliberately rather than
atticked. `RetainedStrictInteriorParentNormalForm.lean`
`nonempty_retainedStrictInteriorTerminalSurface` is sorry-free and produces a
four-constructor flat surface — `localizedCollisionMutualOmission |
matchingSourceReturn | matchingEndpointCriticalFiber |
matchingThreeDistinctBlockers` — from `R : FrontierCommonDeletionParentResidual F`
**alone**, and two of the six open obligations sit under that same residual.
Wiring it would refine those two branches; it would **not** close them, and the
sibling `false_of_frontierCoupledStrictInteriorConsumers` takes `coupledFalse`
as a hypothesis and is bookkeeping. It is a bank, not a closure.

Two wordings were used, because the cases differ: component members do have
import consumers — off-spine siblings — so their marker names the component
root instead of claiming none; singletons have no consumer anywhere in the tree.

"source-proved and builds" is verified, not assumed. Each of the 12 was built
individually with `lake build <module>`, which rebuilds transitive imports;
`lake env lean` would have silently accepted the stale oleans these modules
carried. All succeeded, and none is among the only two production files holding
a `sorry` (`ATail/FrontierLiveClosure.lean`, `U1LargeCapRouteBTail.lean`).
`Sub2Certificate` had no `.olean` at all beforehand — it had never been in a
verified build.

## Outstanding ledger correction — NOT done here

`docs/closure-matrix-2026-07-09.md` row `K-A-ALL-REVERSE-OCCURRENCE` lists
`ATail/ParentExactFiveAssembler.lean` and calls the full-parent assembler
`DONE-PRODUCTION`, while that row's own completion gate — choice-free co-radial
occurrence — is still open. The kernel never had that module on either publish
spine, so `DONE-PRODUCTION` was not supportable even before the move, and the
path is now stale as well.

That row was left unedited on purpose: the file carried uncommitted edits from
a concurrent session throughout this work, and committing it would have
captured that session's in-progress changes. It needs restating by its owner.
Older dated audits and prompts that cite the moved paths were also left intact,
since they are point-in-time records rather than live inventory.
