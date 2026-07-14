/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Census554.FiveRowCircleIntersectionOrderCore
import Erdos9796Proof.P97.Census554.FivePointCollision
import Erdos9796Proof.P97.Census554.ThreeTriadCollision
import Erdos9796Proof.P97.Census554.SurplusSourceCollision
import Erdos9796Proof.P97.Census554.SixRowAnchorCollision
import Erdos9796Proof.P97.Census554.SixPointTwoPairCollision
import Erdos9796Proof.P97.Census554.SixPointCircleChainCollision
import Erdos9796Proof.P97.Census554.SixPointFiveCircleCollisions
import Erdos9796Proof.P97.Census554.SevenEightPointFiveCircleCollisions
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollision
import Erdos9796Proof.P97.Census554.SevenPointSixCircleCollisionB
import Erdos9796Proof.P97.Census554.SevenPointTwinFourCircleCollision
import Erdos9796Proof.P97.Census554.SevenPointOrbitCollision
import Erdos9796Proof.P97.Census554.SevenPointCircleNetworkCollision
import Erdos9796Proof.P97.Census554.ConvexFivePointCore
import Erdos9796Proof.P97.Census554.ConvexRhombusCore
import Erdos9796Proof.P97.Census554.SeparationCore
import Erdos9796Proof.P97.ConvexCyclicOrder.Construct
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Arbitrary-cardinality carrier bridge

This file converts a `FaithfulCarrierPattern` on an arbitrary finite carrier
into the label-indexed row pattern consumed by the generic Census554 equality
cores.  A `CriticalShellSystem` then identifies each blocker row with its
exact critical shell.

The bridge constructs the realized row system and its exact blocker rows.  It
does not assert that every such system contains one of the known obstruction
cores.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace GeneralCarrierBridge

open EqualityCore

/-- The canonical label type of a finite carrier. -/
abbrev CarrierLabel (A : Finset ℝ²) := {x : ℝ² // x ∈ A}

/-- Interpret a carrier label as its plane point. -/
def pointOf {A : Finset ℝ²} : CarrierLabel A → ℝ² :=
  Subtype.val

/-- An injective CCW boundary enumeration together with the inverse index of
every canonical carrier label. -/
structure BoundaryIndexing (A : Finset ℝ²) where
  n : ℕ
  boundary : Fin n → ℝ²
  indexOf : CarrierLabel A → Fin n
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  index_injective : Function.Injective indexOf
  point_eq : ∀ label, boundary (indexOf label) = pointOf label

/-- Convex independence and non-collinearity supply a boundary indexing of the
entire arbitrary-cardinality carrier. -/
theorem exists_boundaryIndexing {A : Finset ℝ²}
    (hconv : ConvexIndep A) (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²)) :
    Nonempty (BoundaryIndexing A) := by
  classical
  rcases exists_isCcwConvexPolygon_of_convexIndep hconv hnoncoll with
    ⟨n, _hn, boundary, hboundaryInj, hboundaryImage, hboundaryCcw⟩
  have hex (label : CarrierLabel A) :
      ∃ i : Fin n, boundary i = label.1 := by
    have hmem : label.1 ∈ Finset.univ.image boundary := by
      rw [hboundaryImage]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  let indexOf : CarrierLabel A → Fin n :=
    fun label => Classical.choose (hex label)
  have hpoint : ∀ label, boundary (indexOf label) = pointOf label :=
    fun label => Classical.choose_spec (hex label)
  have hindexInj : Function.Injective indexOf := by
    intro a b hab
    apply Subtype.ext
    calc
      a.1 = boundary (indexOf a) := (hpoint a).symm
      _ = boundary (indexOf b) := congrArg boundary hab
      _ = b.1 := hpoint b
  exact ⟨{
    n := n
    boundary := boundary
    indexOf := indexOf
    boundary_injective := hboundaryInj
    boundary_image := hboundaryImage
    boundary_ccw := hboundaryCcw
    index_injective := hindexInj
    point_eq := hpoint }⟩

/-- Pull every selected geometric support back to canonical carrier labels. -/
noncomputable def rowPattern {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) :
    EqualityCore.RowPattern (CarrierLabel A) :=
  fun center =>
    A.attach.filter fun z =>
      z.1 ∈ (F.classAt center.1 center.2).support

/-- Membership in a pulled-back row is geometric support membership. -/
theorem mem_rowPattern_iff {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (center z : CarrierLabel A) :
    z ∈ rowPattern F center ↔
      z.1 ∈ (F.classAt center.1 center.2).support := by
  simp [rowPattern]

/-- The canonical carrier interpretation realizes all pulled-back row
equalities and is injective. -/
theorem realizes {A : Finset ℝ²} (F : FaithfulCarrierPattern A) :
    EqualityCore.Realizes (rowPattern F) (pointOf (A := A)) := by
  refine ⟨?_, Subtype.val_injective⟩
  intro center a ha b hb
  have haSupport :
      a.1 ∈ (F.classAt center.1 center.2).support :=
    (mem_rowPattern_iff F center a).mp ha
  have hbSupport :
      b.1 ∈ (F.classAt center.1 center.2).support :=
    (mem_rowPattern_iff F center b).mp hb
  exact
    ((F.classAt center.1 center.2).support_eq_radius a.1 haSupport).trans
      ((F.classAt center.1 center.2).support_eq_radius b.1 hbSupport).symm

/-- Mapping a pulled-back row into the plane recovers its selected support. -/
theorem image_rowPattern_eq_support
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (center : CarrierLabel A) :
    (rowPattern F center).image (pointOf (A := A)) =
      (F.classAt center.1 center.2).support := by
  ext z
  constructor
  · intro hz
    rcases Finset.mem_image.mp hz with ⟨label, hlabel, rfl⟩
    exact (mem_rowPattern_iff F center label).mp hlabel
  · intro hz
    have hzA : z ∈ A :=
      (F.classAt center.1 center.2).support_subset_A hz
    let label : CarrierLabel A := ⟨z, hzA⟩
    exact Finset.mem_image.mpr
      ⟨label, (mem_rowPattern_iff F center label).mpr hz, rfl⟩

/-- Every pulled-back carrier row has exactly four labels. -/
theorem rowPattern_card
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (center : CarrierLabel A) :
    (rowPattern F center).card = 4 := by
  calc
    (rowPattern F center).card =
        ((rowPattern F center).image (pointOf (A := A))).card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ = (F.classAt center.1 center.2).support.card := by
      rw [image_rowPattern_eq_support]
    _ = 4 := (F.classAt center.1 center.2).support_card

/-- The canonical label of a source's chosen blocker center. -/
def blockerLabel {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) : CarrierLabel A :=
  ⟨H.centerAt q hq,
    (Finset.mem_erase.mp
      (H.selectedAt q hq).toCriticalFourShell.center_mem).2⟩

/-- The globally selected row at a blocker center is the exact chosen shell. -/
theorem blocker_row_support_eq_shell
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (q : ℝ²) (hq : q ∈ A) :
    (F.classAt (blockerLabel H q hq).1
        (blockerLabel H q hq).2).support =
      (H.selectedAt q hq).toCriticalFourShell.support := by
  exact H.selectedFourClass_support_eq_shell q hq
    (F.classAt (blockerLabel H q hq).1 (blockerLabel H q hq).2)

/-- Each source label lies in the canonical row at its chosen blocker. -/
theorem source_mem_blocker_row
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (q : CarrierLabel A) :
    q ∈ rowPattern F (blockerLabel H q.1 q.2) := by
  apply (mem_rowPattern_iff F (blockerLabel H q.1 q.2) q).mpr
  rw [blocker_row_support_eq_shell F H q.1 q.2]
  exact (H.selectedAt q.1 q.2).toCriticalFourShell.q_mem_support

/-- Every blocker row in the canonical pattern is exact over the full carrier
label type. -/
theorem exactAt_blocker
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (q : ℝ²) (hq : q ∈ A) :
    EqualityCore.ExactAt (rowPattern F) (pointOf (A := A))
      (blockerLabel H q hq) := by
  intro a ha z hz hdist
  have haClass :
      a.1 ∈
        (F.classAt (blockerLabel H q hq).1
          (blockerLabel H q hq).2).support :=
    (mem_rowPattern_iff F (blockerLabel H q hq) a).mp ha
  have haShell :
      a.1 ∈ (H.selectedAt q hq).toCriticalFourShell.support := by
    rw [← blocker_row_support_eq_shell F H q hq]
    exact haClass
  have hzRadius :
      dist (H.centerAt q hq) z.1 =
        (H.selectedAt q hq).toCriticalFourShell.radius := by
    calc
      dist (H.centerAt q hq) z.1 =
          dist (H.centerAt q hq) a.1 := hdist
      _ = (H.selectedAt q hq).toCriticalFourShell.radius :=
        (H.selectedAt q hq).toCriticalFourShell.support_eq_radius a.1
          haShell
  apply hz
  apply (mem_rowPattern_iff F (blockerLabel H q hq) z).mpr
  rw [blocker_row_support_eq_shell F H q hq]
  exact (H.selectedAt q hq).toCriticalFourShell.off_row_named_label_forbidden
    z.2 hzRadius

/-- The obstruction families used by the bounded metric-core miner, stated on
an arbitrary canonical carrier pattern. The additional equality-only
families reuse generic Census554 collision theorems proved before this bridge.
The three order-sensitive families use the negative signed-area convention of
the live convex boundary enumeration. -/
def MetricCoreAlternative {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) : Prop :=
  Nonempty (SevenPointSixCircleCollisionCore (rowPattern F)) ∨
  Nonempty (SevenPointSixCircleCollisionCoreB (rowPattern F)) ∨
  Nonempty (SixPointCircleChainCollisionCore (rowPattern F)) ∨
  Nonempty (DuplicateCenterCore (rowPattern F)) ∨
  (∃ core : ExactOffCircleCore (rowPattern F),
    ExactAt (rowPattern F) (pointOf (A := A)) core.c) ∨
  Nonempty (EqualK4Core (rowPattern F)) ∨
  Nonempty (EquilateralBisectorCollisionCore (rowPattern F)) ∨
  Nonempty (ThreeTriadCollisionCore (rowPattern F)) ∨
  Nonempty (SurplusSourceCollisionCore (rowPattern F)) ∨
  Nonempty (SixRowAnchorCollisionCore (rowPattern F)) ∨
  Nonempty (SixPointTwoPairCollisionCore (rowPattern F)) ∨
  Nonempty (SevenPointOrbitCollisionCore (rowPattern F)) ∨
  Nonempty (SevenPointCircleNetworkCollisionCore (rowPattern F)) ∨
  Nonempty (PerpBisectorCore (rowPattern F)) ∨
  (∃ core : ConvexFivePointCore.Core (rowPattern F),
    signedArea2 (pointOf core.a) (pointOf core.x) (pointOf core.b) < 0 ∧
    signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.y) < 0) ∨
  (∃ core : ConvexRhombusCore.Core (rowPattern F),
    signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.c) < 0 ∧
    signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.d) < 0 ∧
    signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.y) < 0 ∧
    signedArea2 (pointOf core.x) (pointOf core.d) (pointOf core.a) < 0 ∧
    signedArea2 (pointOf core.c) (pointOf core.x) (pointOf core.y) < 0 ∧
    signedArea2 (pointOf core.x) (pointOf core.y) (pointOf core.d) < 0) ∨
  Nonempty (SevenPointTwinFourCircleCollisionCore (rowPattern F)) ∨
  Nonempty (SixPointFiveCircleCollisionCoreA (rowPattern F)) ∨
  Nonempty (SixPointFiveCircleCollisionCoreB (rowPattern F)) ∨
  Nonempty (SixPointFiveCircleCollisionCoreC (rowPattern F)) ∨
  Nonempty (SevenPointFiveCircleCollisionCore (rowPattern F)) ∨
  Nonempty (EightPointFiveCircleCollisionCore (rowPattern F)) ∨
  (∃ core : FiveRowCircleIntersectionOrderCore.Core (rowPattern F),
    signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.E) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.C) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.C) < 0)

/-- Any arbitrary-cardinality carrier pattern satisfying the metric-core
alternative is contradictory.  This is the complete generic consumer; a
PIN-GENERAL proof must still produce the alternative without assuming the
desired confinement conclusion. -/
theorem false_of_metricCoreAlternative
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (hconv : ConvexIndep A) (hcore : MetricCoreAlternative F) :
    False := by
  have hreal : Realizes (rowPattern F) (pointOf (A := A)) := realizes F
  rcases hcore with hsevenSixCircle | hcore
  · rcases hsevenSixCircle with ⟨core⟩
    exact not_realizes_of_sevenPointSixCircleCollisionCore core ⟨_, hreal⟩
  rcases hcore with hsevenSixCircleB | hcore
  · rcases hsevenSixCircleB with ⟨core⟩
    exact not_realizes_of_sevenPointSixCircleCollisionCoreB core ⟨_, hreal⟩
  rcases hcore with hsixCircleChain | hcore
  · rcases hsixCircleChain with ⟨core⟩
    exact not_realizes_of_sixPointCircleChainCollisionCore core ⟨_, hreal⟩
  rcases hcore with hduplicate | hexact | hequalK4 | hequilateral |
      hthreeTriad | hsurplusSource | hsixRow | hsixPoint | hsevenPoint |
      hcircleNetwork | hperp | hfive | hrhombus | htwinFourCircle |
      hfiveCircleA | hfiveCircleB | hfiveCircleC | hsevenFiveCircle |
      heightFiveCircle | hfiveRow
  · rcases hduplicate with ⟨core⟩
    exact not_realizes_of_duplicateCenterCore core ⟨_, hreal⟩
  · rcases hexact with ⟨core, hcoreExact⟩
    exact false_of_exactAt_of_exactOffCircleCore hreal core hcoreExact
  · rcases hequalK4 with ⟨core⟩
    exact not_realizes_of_equalK4Core core ⟨_, hreal⟩
  · rcases hequilateral with ⟨core⟩
    exact not_realizes_of_equilateralBisectorCollisionCore core ⟨_, hreal⟩
  · rcases hthreeTriad with ⟨core⟩
    exact not_realizes_of_threeTriadCollisionCore core ⟨_, hreal⟩
  · rcases hsurplusSource with ⟨core⟩
    exact not_realizes_of_surplusSourceCollisionCore core ⟨_, hreal⟩
  · rcases hsixRow with ⟨core⟩
    exact not_realizes_of_sixRowAnchorCollisionCore core ⟨_, hreal⟩
  · rcases hsixPoint with ⟨core⟩
    exact not_realizes_of_sixPointTwoPairCollisionCore core ⟨_, hreal⟩
  · rcases hsevenPoint with ⟨core⟩
    exact not_realizes_of_sevenPointOrbitCollisionCore core ⟨_, hreal⟩
  · rcases hcircleNetwork with ⟨core⟩
    exact not_realizes_of_sevenPointCircleNetworkCollisionCore core ⟨_, hreal⟩
  · rcases hperp with ⟨core⟩
    exact false_of_convexIndep_of_perpBisectorCore hreal hconv
      (fun label => label.2) core
  · rcases hfive with ⟨core, haxb, hbcy⟩
    exact ConvexFivePointCore.false_of_core_of_neg hreal core haxb hbcy
  · rcases hrhombus with ⟨core, habc, habd, hbcy, hxda, hcxy, hxyd⟩
    exact ConvexRhombusCore.false_of_core_of_neg hreal core
      habc habd hbcy hxda hcxy hxyd
  · rcases htwinFourCircle with ⟨core⟩
    exact not_realizes_of_sevenPointTwinFourCircleCollisionCore core ⟨_, hreal⟩
  · rcases hfiveCircleA with ⟨core⟩
    exact not_realizes_of_sixPointFiveCircleCollisionCoreA core ⟨_, hreal⟩
  · rcases hfiveCircleB with ⟨core⟩
    exact not_realizes_of_sixPointFiveCircleCollisionCoreB core ⟨_, hreal⟩
  · rcases hfiveCircleC with ⟨core⟩
    exact not_realizes_of_sixPointFiveCircleCollisionCoreC core ⟨_, hreal⟩
  · rcases hsevenFiveCircle with ⟨core⟩
    exact not_realizes_of_sevenPointFiveCircleCollisionCore core ⟨_, hreal⟩
  · rcases heightFiveCircle with ⟨core⟩
    exact not_realizes_of_eightPointFiveCircleCollisionCore core ⟨_, hreal⟩
  · rcases hfiveRow with ⟨core, hOAC, hOAD, hOAE, hODE, hODC, hOEC⟩
    exact FiveRowCircleIntersectionOrderCore.false_of_core_of_neg
      hreal core hOAC hOAD hOAE hODE hODC hOEC

/-- Shell-aware form of the metric-core alternative.  Its exact-row branch
only has to identify the core center as a chosen blocker; exactness is then a
proved consequence of `CriticalShellSystem`. -/
def ShellMetricCoreAlternative {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (H : CriticalShellSystem A) : Prop :=
  Nonempty (SevenPointSixCircleCollisionCore (rowPattern F)) ∨
  Nonempty (SevenPointSixCircleCollisionCoreB (rowPattern F)) ∨
  Nonempty (SixPointCircleChainCollisionCore (rowPattern F)) ∨
  Nonempty (DuplicateCenterCore (rowPattern F)) ∨
  (∃ (q : ℝ²) (hq : q ∈ A) (core : ExactOffCircleCore (rowPattern F)),
    core.c = blockerLabel H q hq) ∨
  Nonempty (EqualK4Core (rowPattern F)) ∨
  Nonempty (EquilateralBisectorCollisionCore (rowPattern F)) ∨
  Nonempty (ThreeTriadCollisionCore (rowPattern F)) ∨
  Nonempty (SurplusSourceCollisionCore (rowPattern F)) ∨
  Nonempty (SixRowAnchorCollisionCore (rowPattern F)) ∨
  Nonempty (SixPointTwoPairCollisionCore (rowPattern F)) ∨
  Nonempty (SevenPointOrbitCollisionCore (rowPattern F)) ∨
  Nonempty (SevenPointCircleNetworkCollisionCore (rowPattern F)) ∨
  Nonempty (PerpBisectorCore (rowPattern F)) ∨
  (∃ core : ConvexFivePointCore.Core (rowPattern F),
    signedArea2 (pointOf core.a) (pointOf core.x) (pointOf core.b) < 0 ∧
    signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.y) < 0) ∨
  (∃ core : ConvexRhombusCore.Core (rowPattern F),
    signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.c) < 0 ∧
    signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.d) < 0 ∧
    signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.y) < 0 ∧
    signedArea2 (pointOf core.x) (pointOf core.d) (pointOf core.a) < 0 ∧
    signedArea2 (pointOf core.c) (pointOf core.x) (pointOf core.y) < 0 ∧
    signedArea2 (pointOf core.x) (pointOf core.y) (pointOf core.d) < 0) ∨
  Nonempty (SevenPointTwinFourCircleCollisionCore (rowPattern F)) ∨
  Nonempty (SixPointFiveCircleCollisionCoreA (rowPattern F)) ∨
  Nonempty (SixPointFiveCircleCollisionCoreB (rowPattern F)) ∨
  Nonempty (SixPointFiveCircleCollisionCoreC (rowPattern F)) ∨
  Nonempty (SevenPointFiveCircleCollisionCore (rowPattern F)) ∨
  Nonempty (EightPointFiveCircleCollisionCore (rowPattern F)) ∨
  (∃ core : FiveRowCircleIntersectionOrderCore.Core (rowPattern F),
    signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.E) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.D) (pointOf core.C) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.C) < 0)

/-- A shell-aware core alternative supplies the generic metric-core
alternative, with exactness discharged by the blocker-row theorem. -/
theorem metricCoreAlternative_of_shellMetricCoreAlternative
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A)
    (hcore : ShellMetricCoreAlternative F H) :
    MetricCoreAlternative F := by
  rcases hcore with hsevenSixCircle | hcore
  · exact Or.inl hsevenSixCircle
  · apply Or.inr
    rcases hcore with hsevenSixCircleB | hcore
    · exact Or.inl hsevenSixCircleB
    · apply Or.inr
      rcases hcore with hsixCircleChain | hcore
      · exact Or.inl hsixCircleChain
      · apply Or.inr
        rcases hcore with hduplicate | hexact | hequalK4 | hequilateral |
          hthreeTriad | hsurplusSource | hsixRow | hsixPoint | hsevenPoint |
          hcircleNetwork | hperp | hfive | hrhombus | htwinFourCircle |
          hfiveCircleA | hfiveCircleB | hfiveCircleC | hsevenFiveCircle |
          heightFiveCircle | hfiveRow
        · exact Or.inl hduplicate
        · rcases hexact with ⟨q, hq, core, hc⟩
          exact Or.inr <| Or.inl ⟨core, by
            rw [hc]
            exact exactAt_blocker F H q hq⟩
        · exact Or.inr <| Or.inr <| Or.inl hequalK4
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inl hequilateral
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inl hthreeTriad
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inl hsurplusSource
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inl hsixRow
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inl hsixPoint
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inl hsevenPoint
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inl hcircleNetwork
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inl hperp
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inl hfive
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inl hrhombus
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inl htwinFourCircle
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inl hfiveCircleA
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inl hfiveCircleB
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inl hfiveCircleC
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inl hsevenFiveCircle
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inl heightFiveCircle
        · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr <| Or.inr <| Or.inr <| Or.inr <|
            Or.inr <| Or.inr hfiveRow

/-- Complete shell-aware consumer for the arbitrary-cardinality metric-core
route. -/
theorem false_of_shellMetricCoreAlternative
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (hconv : ConvexIndep A)
    (hcore : ShellMetricCoreAlternative F H) : False :=
  false_of_metricCoreAlternative F hconv
    (metricCoreAlternative_of_shellMetricCoreAlternative F H hcore)

/-- Every shared-pair equality core on a faithful carrier obeys the cyclic
alternation required by a compatible boundary indexing. -/
theorem BoundaryIndexing.sharedPair_satisfied
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    (F : FaithfulCarrierPattern A)
    (core : SeparationCore.SharedPairSeparationCore (rowPattern F)) :
    core.SatisfiedBy B.indexOf :=
  core.satisfiedBy_of_realizes_ccw (realizes F)
    B.boundary B.indexOf B.boundary_ccw B.boundary_injective
    B.index_injective B.point_eq

end GeneralCarrierBridge
end Census554
end Problem97
