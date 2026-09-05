# Exact-five five-incidence role-consumer audit

Date: 2026-09-05

Lane: `luna-radius-five-incidence-20260904`

Request: conversation message `#14460`, lane B

## Result

The first three constructors can all be normalized to a common-deletion
packet whose centers are the two physical apices.  Installing the deleted
source's actual blocker row then exposes a clean hit/omission split.  No
current import-acyclic theorem consumes either side of that split.

The fourth-prefix physical replacement is also nonterminal.  Its replacement
row omits the retained and original deleted sources, but it need not omit the
strict fresh source.  It therefore cannot replace the old second-apex row in
the existing three-center physical leaf.  The old row itself contains the
retained source, so the existing leaf's omission hypothesis cannot be used.

No Lean declaration was changed.  In particular, this audit does not call,
wrap, move, or duplicate either admitted body in `Rigid221Closure.lean`.

## Source anchor

The requested GitHub revision was
`f26c12d629cd6eb1d397db1e54adc0f1027b9ee3`.  The lane began at
`6604fc4e5343d615fc30e2ae22cfe7a7ea93569c` and was rechecked at
`a8c83dd98ee47ee7452ca8e06538dca9968098ea`.  None of the seven files below
changed between the requested and final revisions.

| Source | SHA-256 |
|---|---|
| `RobustApexFourIncidenceCyclicReduction.lean` | `e891b5f47c5e717e4df408efa486c53cff054b64444cde5db1b5d8c2f31de12e` |
| `RobustApexCommonDeletion.lean` | `86aa284d67290848a171fd4741b074b774390f8e42e94c2e6f60a6abdce34531` |
| `Rigid221Closure.lean` | `1da4880d00cdc6b521bf0be3d5ed4ab00c905b729dfab43159901744804e57e5` |
| `ExactFiveDistinctThreeCenterContinuation.lean` | `4122f2e0ef8ddcee4a6b81e6e79c2efdb509b677a0cb7034b6c0c1eac03b8e46` |
| `ExactFiveDistinctSecondApexSourceSwap.lean` | `27a5074011361f87a0e2f45661cbd19b3991f67712cf0bf59e9ed7d5eaee6c98` |
| `ExactFiveDistinctSecondApexSourceSwapCyclic.lean` | `eabc9d37a2ce6c8b9aace35c5257ac7ddfce78c70ee4d8459b2792d5ae76f497` |
| `ExactFiveDistinctOpposedTurnHardSource.lean` | `91b0a547ac7f45c6ae47a4c3bf2b46c7836a6f9950aea973ed0c8589156e4294` |

The active target is
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`
at `Rigid221Closure.lean:1558-1580`.  Its only caller is at lines 1647-1654.
The reduced packet and constructors are in
`RobustApexFourIncidenceCyclicReduction.lean:87-121`; its producer is at
lines 194-299.

## Reuse preflight

One bounded search of the repository Lean corpus covered the reduced packet,
the three concrete `CommonDeletionTwoCenterPacket` signatures, actual blocker
rows, self-deletion, physical-apex consumers, and source-swap consumers.

The only general physical splitter is
`Problem97.ATailPhysicalSecondApexCommonDeletion.physicalSecondApex_commonDeletion_robust_or_critical`
at `PhysicalSecondApexCommonDeletion.lean:152-207`.  It returns the robustness
already present in the normal form or a critical arm contradicted by that
robustness; it does not close the robust arm.  The exact-five terminal
`false_of_exactFiveDistinct_commonDeletion` at
`Rigid221Closure.lean:1686-1737` requires the original pair-source orientation
and sends its robust arm back through the current three-center target.  It is
both role-inapplicable to the new sources and logically downstream.

No other declaration pattern-matches any constructor of
`RobustApexFourIncidenceContinuation`.  The source-heavy self-deletion theorem
`xvDeletion_c1_not_mem_BO_yields_self_commonDeletion` only produces another
packet and has no call site.  Exact-four four-center consumers require their
own `OriginalUniqueFourResidual`, two joint deletions, blocker inequalities,
and a cross packet; the exact-five surface cannot supply that typed context.

## First-three normalization

Write

```text
O = S.oppApex1
b = blocker
P = S.oppApex2
a = normalForm.retained
d = deleted
z = fresh
```

The normal form gives full deletion robustness at `P`.  Consequently the
first packet in each of the first two rows below can be combined with survival
at `P`; the third row already has the desired physical centers.

| Reduced constructor | Deleted source `q` | Stored centers | Normalized centers |
|---|---:|---:|---:|
| `firstCenter_not_mem_robustRow` | `b` | `O,b` | `O,P` |
| `robustCenter_not_mem_firstRow` | `O` | `O,b` | `O,P` |
| `robustCenter_not_mem_secondRow` | `O` | `O,P` | `O,P` |

For each normalized packet `Q`, set

```lean
let e := H.centerAt q Q.q_mem_A
let Kq := (H.selectedAt q Q.q_mem_A).toCriticalFourShell.toSelectedFourClass
```

Then `q ∈ Kq.support`, deleting `q` fails at `e`, and `e` is distinct from
`O` and `P`.  The stored `O,b` packet gives the stronger `e ≠ b` in the first
two constructors.  In the third constructor the required alias split is
`e = b` or `e ≠ b`.

The point `b` is the actual blocker of `a`, as follows directly from
`normalForm.orientation`.  Splitting `a ∈ Kq.support` gives the following
source-faithful residue.

### First and second constructors

Both stored packets say that deleting `q` survives at `b`.

- If `a ∉ Kq.support`, deleting `a` survives at `e`; robustness gives its
  survival at `O` and `P`.  Thus `q` survives at `O,b,P` and fails at `e`,
  while `a` survives at `O,e,P` and fails at `b`.  This is an anti-diagonal
  survival square with exact source ownership.
- If `a ∈ Kq.support`, the actual `q`-blocker row contains `a`, while the
  actual `a`-blocker row at `b` omits `q`.  In the first constructor this is
  because `q=b` is its center; in the second it is the recorded missing
  incidence `O ∉ row₁`.

These statements count only `O,P,e` and, where applicable, `b` as carrier
centers after deleting `q`.  The self-center `q` is not counted in
`D.A.erase q`.

### Third constructor

The stored packet does not give survival of `q=O` at `b`.

- If `e=b`, the two sources `q` and `a` have the same actual blocker; the
  positive prefix places both in the row at that center.
- If `e≠b` and `a∈Kq.support`, the actual blocker rows have the two cross
  hits `a∈Kq` and `q∈Ka`.
- If `e≠b` and `a∉Kq.support`, deleting `a` survives at `e`, but no premise
  supplies deletion survival of `q` at `b`.

No installed exact-five theorem consumes the equal-blocker case, the two
cross-hit case, or the incomplete square.  Boundary order, a further
source-row support, or a monotone progress measure is absent.

## Fourth-prefix physical replacement

The fourth constructor supplies

```text
b ∈ row₀, O ∈ row₁, O ∈ row₂, b ∉ row₂.
```

The source-swap theorem
`Problem97.ExactFiveDistinctSecondApexSourceSwap.exactFiveDistinct_secondApex_physical_or_hardSourceSwap`
at `ExactFiveDistinctSecondApexSourceSwap.lean:251-310` is applicable because
the incidence packet supplies `a ∈ row₂`.

On its physical arm it returns a selected row `K` centered at `P` with

```text
a ∉ K.support
d ∉ K.support.
```

Robustness at `O` and omission of `a` from `K` construct a physical packet
deleting `a` at `O,P`.  This still cannot call
`false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`:

- that target requires `a ∉ normalForm.secondApexClass.support`, while the
  five-incidence input gives membership there;
- replacing the normal form's old row by `K` also requires `z ∉ K.support`,
  which the source-swap physical arm does not prove;
- rebuilding the normal form would require a source-faithful replacement of
  the original `C.B2` row rather than a bare selected class.

Nor does the later exact-five common-deletion terminal accept the derived
packet.  For source `a` its orientation would require the first packet center
to be the actual blocker of `d`; for source `d` it would require the first
center to be `b`, the actual blocker of `a`.  The replacement construction
has first center `O` in both cases.

The smallest source-clean physical residual is therefore the fourth positive
prefix together with `K`, the two displayed omissions, and the derived packet
deleting `a` at `O,P`.  A suitable missing consumer has this shape:

```lean
theorem false_of_exactFiveDistinct_fourthPrefix_physicalReplacement
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (C : CommonDeletionTwoCenterPacket D H d b S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (z : ℝ²) (hz_ne_d : z ≠ d)
    (rows : ThreeCenterCommonDeletionExactRows D z
      S.oppApex1 b S.oppApex2
      N.firstApexClass.support N.blockerClass.support
      N.secondApexClass.support)
    (I : RobustApexFourIncidenceContinuationPacket D H
      S.oppApex1 b S.oppApex2 N.retained
      N.firstApexClass.support N.blockerClass.support
      N.secondApexClass.support)
    (hb0 : b ∈ I.surface.row₀.support)
    (hO1 : S.oppApex1 ∈ I.surface.row₁.support)
    (hO2 : S.oppApex1 ∈ I.surface.row₂.support)
    (hb2 : b ∉ I.surface.row₂.support)
    (K : SelectedFourClass D.A S.oppApex2)
    (haK : N.retained ∉ K.support)
    (hdK : d ∉ K.support) : False
```

This is a theorem candidate, not a proved consequence.  Current source lacks
the decisive premise needed by all known routes: either `z ∉ K.support` plus
an acyclic terminal for the rebuilt physical normal form, or a direct
geometric consumer of the replacement-row residual above.

The hard source-swap arm has genuine acyclic progress already.  The exact-grid
subcase with `P ∈ row₀` closes through
`HardSourceSwapExactGridRoles.false_of_fourthIncidence_exactGrid`; the large
second-interior arm and the `P ∉ row₀` profile remain separate residuals.

## Verification boundary

Because this lane changed documentation only, no Lean build or axiom print was
needed.  The source conclusions use existing kernel-checked declarations; the
two target admissions remain exactly where they were.  The worktree was
shared and dirty throughout, and no foreign path was staged or modified by
this lane.
