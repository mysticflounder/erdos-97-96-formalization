/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueArmRouteAudit.OriginalUniqueResidualDispatch
import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion
import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector

/-!
# Context frames for the frontier live-closure clusters

Two argument bundles are repeated on hundreds of declarations across the
frontier live-closure directory.  This module packages each of them as a
record so a consumer can take one argument instead of the loose list.  It
introduces no new mathematical content: every field repeats, verbatim, a
hypothesis that the call sites already carry, and the two records are pure
data with no proof obligation of their own.

## `TwoSourceCollisionFrame`

The two-source collision bundle shared by the `TwoSource*`, `FreshThird*`,
`FirstFiber*` and `FirstNonHit*` modules.  Its marker hypothesis is
`hfrontierInteriorEq`, which pins the strict-cap interior trace of the
frontier radius class to the two collision sources of `P`.

The two collision records `P` and `Pρ` stay *parameters* of the frame rather
than fields, because every consumer's conclusion mentions them by name; that
keeps consumer statement text unchanged.  They remain recoverable from a
frame value through `TwoSourceCollisionFrame.collision` and
`TwoSourceCollisionFrame.collisionρ`.

Field names repeat the loose hypothesis names exactly, so
`obtain ⟨hρne, hfrontierFour, …⟩ := frame` reintroduces the same local names
a proof body already uses.

## `PostCardElevenSurfaceFrame`

The post-card-eleven robust surface triple shared by `Rigid221Closure` and
`TwoDeletionCollision`: the original unique-four residual, the carrier
cardinality bound `12 ≤ D.A.card`, and the robust surface over that
residual.  The residual `R` stays a parameter for the same reason, and is
recoverable through `PostCardElevenSurfaceFrame.residual`.

## Deliberately absent

The two-source bundle also carries the tri-apex robust residual
`T : FrontierAllLargeCapsTriApexRobustResidual N` together with its index
chain `B`, `L`, `N`.  `FrontierAllLargeCapsBiApexRobustResidual` and
`FrontierAllLargeCapsTriApexRobustResidual` are both defined inside the
cluster module `Erdos9796Proof.P97.ATail.FrontierLiveClosure`
`.TriApexEndpointRetainedOmission`, and this module is a *shared* module of
that directory.  Importing the defining module would create a
`from-shared-to-cluster` edge that `scripts/lint_cluster_imports.py`
rejects, so those fields are left out.  They can move into
`TwoSourceCollisionFrame` once the two residual types live in a shared
module.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- The repeated two-source collision context.  Every field is one of the
loose hypotheses the frontier cluster passes alongside the marker
`hfrontierInteriorEq`, in the order the cluster's `variable` blocks declare
them.  The tri-apex residual of that bundle is not a field; see the module
docstring. -/
structure TwoSourceCollisionFrame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Type where
  /-- The two collision radii are distinct. -/
  hρne : ρ ≠ radius
  /-- The frontier radius class at the first opposite apex has four points. -/
  hfrontierFour :
    (SelectedClass D.A S.oppApex1 radius).card = 4
  /-- The second radius class at the first opposite apex has four points. -/
  hρfour :
    (SelectedClass D.A S.oppApex1 ρ).card = 4
  /-- Marker hypothesis: the frontier radius class meets the first strict cap
  interior in exactly the two sources of `P`. -/
  hfrontierInteriorEq :
    SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 =
      {P.source₁, P.source₂}
  /-- The second radius class meets the first strict cap interior in exactly
  the two sources of `Pρ`. -/
  hρInteriorEq :
    SelectedClass D.A S.oppApex1 ρ ∩
        S.capInteriorByIndex S.oppIndex1 =
      {Pρ.source₁, Pρ.source₂}
  /-- The two source pairs are disjoint. -/
  hpairsDisjoint :
    Disjoint
      ({P.source₁, P.source₂} : Finset ℝ²)
      {Pρ.source₁, Pρ.source₂}
  /-- The two common blockers are distinct. -/
  hblockersNe :
    H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
      H.centerAt P.source₁ P.source₁_mem_A
  /-- Localized common deletion produced by `P`. -/
  LPρ : LocalizedCollisionCommonDeletion P
  /-- Its fresh point is the first source of `Pρ`. -/
  hLPρ : LPρ.fresh = Pρ.source₁
  /-- Mutual omission cycle over `P` and `LPρ`. -/
  MPρ : LocalizedCollisionMutualOmissionCycle P LPρ
  /-- Localized common deletion produced by `Pρ`. -/
  LP : LocalizedCollisionCommonDeletion Pρ
  /-- Its fresh point is the first source of `P`. -/
  hLP : LP.fresh = P.source₁
  /-- Mutual omission cycle over `Pρ` and `LP`. -/
  MP : LocalizedCollisionMutualOmissionCycle Pρ LP

section TwoSourceFrame

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/-- Package the loose two-source collision hypotheses into a frame.  The
argument order is the order of the cluster's `variable` block, with the
tri-apex residual dropped. -/
def twoSourceCollisionFrame_of_hypotheses
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP) :
    TwoSourceCollisionFrame P Pρ where
  hρne := hρne
  hfrontierFour := hfrontierFour
  hρfour := hρfour
  hfrontierInteriorEq := hfrontierInteriorEq
  hρInteriorEq := hρInteriorEq
  hpairsDisjoint := hpairsDisjoint
  hblockersNe := hblockersNe
  LPρ := LPρ
  hLPρ := hLPρ
  MPρ := MPρ
  LP := LP
  hLP := hLP
  MP := MP

variable {P Pρ}

/-- Recover the frontier-radius collision record from a frame.  It is a
parameter of the frame's type, so this is definitionally `P`. -/
def TwoSourceCollisionFrame.collision
    (_frame : TwoSourceCollisionFrame P Pρ) :
    RetainedInteriorBlockerCollision R := P

/-- Recover the second-radius collision record from a frame.  It is a
parameter of the frame's type, so this is definitionally `Pρ`. -/
def TwoSourceCollisionFrame.collisionρ
    (_frame : TwoSourceCollisionFrame P Pρ) :
    RetainedInteriorBlockerCollision Rρ := Pρ

theorem TwoSourceCollisionFrame.collision_eq
    (frame : TwoSourceCollisionFrame P Pρ) :
    frame.collision = P := rfl

theorem TwoSourceCollisionFrame.collisionρ_eq
    (frame : TwoSourceCollisionFrame P Pρ) :
    frame.collisionρ = Pρ := rfl

/-- Reassembling a frame from its own projections returns that frame.  With
the structure projections this is the complete recovery statement: no
component of the bundle is lost by packing it. -/
theorem twoSourceCollisionFrame_of_hypotheses_eta
    (frame : TwoSourceCollisionFrame P Pρ) :
    twoSourceCollisionFrame_of_hypotheses P Pρ
        frame.hρne frame.hfrontierFour frame.hρfour
        frame.hfrontierInteriorEq frame.hρInteriorEq
        frame.hpairsDisjoint frame.hblockersNe
        frame.LPρ frame.hLPρ frame.MPρ
        frame.LP frame.hLP frame.MP =
      frame := rfl

end TwoSourceFrame

/-- The repeated post-card-eleven robust surface context.  The residual `R`
stays a parameter so consumer statements that mention it are unchanged; the
carrier bound and the surface are the fields. -/
structure PostCardElevenSurfaceFrame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) :
    Type where
  /-- The carrier has at least twelve points. -/
  hcard : 12 ≤ D.A.card
  /-- The robust exact-four surface available after the card-eleven
  certificate. -/
  surface : ExactFourPostCardElevenRobustSurface R

section PostCardElevenFrame

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)

/-- Package the loose post-card-eleven triple into a frame. -/
def postCardElevenSurfaceFrame_of_hypotheses
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    PostCardElevenSurfaceFrame R where
  hcard := hcard
  surface := surface

variable {R}

/-- Recover the original unique-four residual from a frame.  It is a
parameter of the frame's type, so this is definitionally `R`. -/
def PostCardElevenSurfaceFrame.residual
    (_frame : PostCardElevenSurfaceFrame R) :
    ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F := R

theorem PostCardElevenSurfaceFrame.residual_eq
    (frame : PostCardElevenSurfaceFrame R) :
    frame.residual = R := rfl

/-- Reassembling a frame from its own projections returns that frame. -/
theorem postCardElevenSurfaceFrame_of_hypotheses_eta
    (frame : PostCardElevenSurfaceFrame R) :
    postCardElevenSurfaceFrame_of_hypotheses R frame.hcard frame.surface =
      frame := rfl

end PostCardElevenFrame

end ATailFrontierLiveClosure
end Problem97
