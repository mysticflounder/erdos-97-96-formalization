/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CriticalShellDangerousTripleAdapter
import CriticalSystemRebase
import ContinuationBankMatch

/-!
# Scratch: critical expansion of a common-deletion two-center packet

A `CommonDeletionTwoCenterPacket` is not itself a contradiction.  Its two
q-deleted rows are geometric data independent of the chosen
`CriticalShellSystem`; only the two inequalities naming the actual blocker
depend on that choice.

This file records the strongest unconditional expansion used by the next
consumer:

* the packet transports to any favorable critical-shell system without
  changing either row;
* the chosen exact critical shell at the deleted source gives a dangerous
  triple;
* each q-deleted row has at least two points outside that critical circle;
* every such outside point has a chosen blocker distinct from the deleted
  source's blocker; and
* either the two rows share a distinct outside pair, in which case the
  deleted source's blocker strictly separates that pair by distance, or the
  union contains at least three outside critical sources.

No incidence between the fresh sources' own critical shells is asserted.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCommonDeletionCriticalExpansionScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailCriticalShellDangerousTripleScratch

attribute [local instance] Classical.propDecidable

/-- Change only the chosen critical-shell system.  The same two exact
q-deleted rows and their overlap certificate remain valid. -/
def rebaseCommonDeletionSystem
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (H' : CriticalShellSystem D.A) :
    CommonDeletionTwoCenterPacket D H' q center₁ center₂ where
  q_mem_A := C.q_mem_A
  center₁_mem_A := C.center₁_mem_A
  center₂_mem_A := C.center₂_mem_A
  centers_ne := C.centers_ne
  survives₁ := C.survives₁
  survives₂ := C.survives₂
  actual_blocker_ne_center₁ :=
    actual_blocker_ne_of_deletion_survives H' C.q_mem_A C.survives₁
  actual_blocker_ne_center₂ :=
    actual_blocker_ne_of_deletion_survives H' C.q_mem_A C.survives₂
  B₁ := C.B₁
  B₂ := C.B₂
  row₁ := C.row₁
  row₂ := C.row₂
  B₁_card := C.B₁_card
  B₂_card := C.B₂_card
  overlap_le_two := C.overlap_le_two

@[simp] theorem rebaseCommonDeletionSystem_B₁
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (H' : CriticalShellSystem D.A) :
    (rebaseCommonDeletionSystem C H').B₁ = C.B₁ := rfl

@[simp] theorem rebaseCommonDeletionSystem_B₂
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (H' : CriticalShellSystem D.A) :
    (rebaseCommonDeletionSystem C H').B₂ = C.B₂ := rfl

def deletedCriticalSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) :
    Finset ℝ² :=
  (H.selectedAt q C.q_mem_A).toCriticalFourShell.support

/-- Pointwise critical-shell override, applied only after the geometric
common-deletion packet and both of its exact rows have been selected. -/
noncomputable def overrideCommonDeletionAt
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ source blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (R : CriticalSelectedFourClass D.A source blocker)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) blocker) :
    CommonDeletionTwoCenterPacket
      D (H.overrideAt R hblocked) q center₁ center₂ :=
  rebaseCommonDeletionSystem C (H.overrideAt R hblocked)

/-- The retained exact critical shell at the common deleted source, with the
deleted source removed, is a theorem-facing dangerous triple. -/
theorem dangerousTriple_at_commonDeletion
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) :
    U5DangerousTriple D q (H.centerAt q C.q_mem_A)
      (deletedCriticalSupport C |>.erase q) := by
  simpa [deletedCriticalSupport] using
    dangerousTriple_of_criticalShellSystem D H C.q_mem_A

/-- Each exact q-deleted row has two points outside the deleted source's
chosen exact critical circle. -/
theorem two_le_row_sdiff_deletedCriticalSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (i : Fin 2) :
    2 ≤ ((if i = 0 then C.B₁ else C.B₂) \
      deletedCriticalSupport C).card := by
  let T := deletedCriticalSupport C |>.erase q
  have htriple :
      U5DangerousTriple D q (H.centerAt q C.q_mem_A) T := by
    simpa [T] using dangerousTriple_at_commonDeletion C
  have hshell : insert q T = deletedCriticalSupport C := by
    dsimp [T, deletedCriticalSupport]
    exact Finset.insert_erase
      (H.selectedAt q C.q_mem_A).toCriticalFourShell.q_mem_support
  fin_cases i
  · have hinter :
        (C.B₁ ∩ deletedCriticalSupport C).card ≤ 2 := by
      rw [← hshell]
      exact U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
        htriple C.row₁ C.actual_blocker_ne_center₁.symm
    have hsplit := Finset.card_sdiff_add_card_inter
      C.B₁ (deletedCriticalSupport C)
    change 2 ≤ (C.B₁ \ deletedCriticalSupport C).card
    rw [C.B₁_card] at hsplit
    omega
  · have hinter :
        (C.B₂ ∩ deletedCriticalSupport C).card ≤ 2 := by
      rw [← hshell]
      exact U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
        htriple C.row₂ C.actual_blocker_ne_center₂.symm
    have hsplit := Finset.card_sdiff_add_card_inter
      C.B₂ (deletedCriticalSupport C)
    change 2 ≤ (C.B₂ \ deletedCriticalSupport C).card
    rw [C.B₂_card] at hsplit
    omega

/-- One source outside the deleted source's critical circle.  Its chosen
blocker is forced to differ from the deleted source's chosen blocker. -/
structure FreshCriticalSource
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) where
  point : ℝ²
  mem_rows : point ∈ C.B₁ ∪ C.B₂
  outside_deleted_shell : point ∉ deletedCriticalSupport C
  mem_A : point ∈ D.A
  blocker_ne_deleted_blocker :
    H.centerAt point mem_A ≠ H.centerAt q C.q_mem_A

/-- Turn any point of either q-deleted row outside the deleted critical
circle into a fresh critical source. -/
def freshCriticalSource_of_mem
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ x : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (hxrows : x ∈ C.B₁ ∪ C.B₂)
    (hxoutside : x ∉ deletedCriticalSupport C) :
    FreshCriticalSource C where
  point := x
  mem_rows := hxrows
  outside_deleted_shell := hxoutside
  mem_A := by
    rcases Finset.mem_union.mp hxrows with hx₁ | hx₂
    · have hxErase := C.row₁.subset hx₁
      exact (Finset.mem_erase.mp
        (Finset.mem_erase.mp hxErase).2).2
    · have hxErase := C.row₂.subset hx₂
      exact (Finset.mem_erase.mp
        (Finset.mem_erase.mp hxErase).2).2
  blocker_ne_deleted_blocker := by
    apply blocker_centers_ne_of_not_mem_other_selected_support
      H _ C.q_mem_A
    simpa [deletedCriticalSupport] using hxoutside

/-- A fresh critical source is not the common deleted source, since the
deleted source belongs to its own exact critical shell. -/
theorem FreshCriticalSource.point_ne_deleted
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H q center₁ center₂}
    (X : FreshCriticalSource C) : X.point ≠ q := by
  intro h
  apply X.outside_deleted_shell
  rw [h]
  simpa [deletedCriticalSupport] using
    (H.selectedAt q C.q_mem_A).toCriticalFourShell.q_mem_support

/-- Two distinct fresh critical sources selected from one of the two exact
q-deleted rows. -/
structure FreshCriticalPair
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (i : Fin 2) where
  first : FreshCriticalSource C
  second : FreshCriticalSource C
  first_mem_row : first.point ∈ if i = 0 then C.B₁ else C.B₂
  second_mem_row : second.point ∈ if i = 0 then C.B₁ else C.B₂
  ne : first.point ≠ second.point

/-- Each of the two exact q-deleted rows contains a fresh critical pair. -/
theorem nonempty_freshCriticalPair
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (i : Fin 2) : Nonempty (FreshCriticalPair C i) := by
  let B := if i = 0 then C.B₁ else C.B₂
  have htwo : 2 ≤ (B \ deletedCriticalSupport C).card := by
    simpa [B] using two_le_row_sdiff_deletedCriticalSupport C i
  have hone : 1 < (B \ deletedCriticalSupport C).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  have haB := (Finset.mem_sdiff.mp ha).1
  have hbB := (Finset.mem_sdiff.mp hb).1
  have haOutside := (Finset.mem_sdiff.mp ha).2
  have hbOutside := (Finset.mem_sdiff.mp hb).2
  have haRows : a ∈ C.B₁ ∪ C.B₂ := by
    fin_cases i
    · exact Finset.mem_union.mpr (Or.inl (by simpa [B] using haB))
    · exact Finset.mem_union.mpr (Or.inr (by simpa [B] using haB))
  have hbRows : b ∈ C.B₁ ∪ C.B₂ := by
    fin_cases i
    · exact Finset.mem_union.mpr (Or.inl (by simpa [B] using hbB))
    · exact Finset.mem_union.mpr (Or.inr (by simpa [B] using hbB))
  exact ⟨{
    first := freshCriticalSource_of_mem C haRows haOutside
    second := freshCriticalSource_of_mem C hbRows hbOutside
    first_mem_row := by simpa [B] using haB
    second_mem_row := by simpa [B] using hbB
    ne := hab }⟩

/-- If the two rows share a distinct pair outside the deleted critical
circle, then the deleted source's blocker cannot also bisect that pair.  The
two row centers already give the maximum two carrier bisector centers. -/
theorem deletedBlocker_distance_ne_of_common_outside_pair
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ a b : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (ha₁ : a ∈ C.B₁) (hb₁ : b ∈ C.B₁)
    (ha₂ : a ∈ C.B₂) (hb₂ : b ∈ C.B₂)
    (hab : a ≠ b) :
    dist (H.centerAt q C.q_mem_A) a ≠
      dist (H.centerAt q C.q_mem_A) b := by
  intro hblockerEq
  have haA : a ∈ D.A := by
    have haErase := C.row₁.subset ha₁
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp haErase).2).2
  have hbA : b ∈ D.A := by
    have hbErase := C.row₁.subset hb₁
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hbErase).2).2
  have hblockerA : H.centerAt q C.q_mem_A ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt q C.q_mem_A).toCriticalFourShell.center_mem).2
  have hcenter₁Eq : dist center₁ a = dist center₁ b :=
    (C.row₁.same_radius a ha₁).trans
      (C.row₁.same_radius b hb₁).symm
  have hcenter₂Eq : dist center₂ a = dist center₂ b :=
    (C.row₂.same_radius a ha₂).trans
      (C.row₂.same_radius b hb₂).symm
  have hbound := Dumitrescu.perpBisector_apex_bound
    D.convex haA hbA hab
  have hcenter₁Filter : center₁ ∈
      D.A.filter (fun x => dist x a = dist x b) :=
    Finset.mem_filter.mpr ⟨C.center₁_mem_A, hcenter₁Eq⟩
  have hcenter₂Filter : center₂ ∈
      D.A.filter (fun x => dist x a = dist x b) :=
    Finset.mem_filter.mpr ⟨C.center₂_mem_A, hcenter₂Eq⟩
  have hblockerFilter : H.centerAt q C.q_mem_A ∈
      D.A.filter (fun x => dist x a = dist x b) :=
    Finset.mem_filter.mpr ⟨hblockerA, hblockerEq⟩
  have hthree : 2 <
      (D.A.filter (fun x => dist x a = dist x b)).card := by
    rw [Finset.two_lt_card]
    exact ⟨center₁, hcenter₁Filter,
      center₂, hcenter₂Filter,
      H.centerAt q C.q_mem_A, hblockerFilter,
      C.centers_ne,
      C.actual_blocker_ne_center₁.symm,
      C.actual_blocker_ne_center₂.symm⟩
  omega

/-- The two q-deleted rows have at least six points in their union.  The
four-point critical shell contains q, while neither q-deleted row does, so at
most the other three shell points can cover that union.  Hence at least three
row points lie outside every late-chosen critical shell at q. -/
theorem three_le_rows_union_sdiff_deletedCriticalSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) :
    3 ≤ ((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C).card := by
  have hrowsSplit := Finset.card_union_add_card_inter C.B₁ C.B₂
  have hrowsSix : 6 ≤ (C.B₁ ∪ C.B₂).card := by
    rw [C.B₁_card, C.B₂_card] at hrowsSplit
    have hinter := C.overlap_le_two
    omega
  have hqNotRows : q ∉ C.B₁ ∪ C.B₂ := by
    simpa using ⟨C.row₁.q_not_mem, C.row₂.q_not_mem⟩
  have hqShell : q ∈ deletedCriticalSupport C := by
    simpa [deletedCriticalSupport] using
      (H.selectedAt q C.q_mem_A).toCriticalFourShell.q_mem_support
  have hshellCard : (deletedCriticalSupport C).card = 4 := by
    simpa [deletedCriticalSupport] using
      (H.selectedAt q C.q_mem_A).toCriticalFourShell.support_card
  have hinterSubset :
      (C.B₁ ∪ C.B₂) ∩ deletedCriticalSupport C ⊆
        (deletedCriticalSupport C).erase q := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxRows, hxShell⟩
    exact Finset.mem_erase.mpr
      ⟨fun hxq => hqNotRows (hxq ▸ hxRows), hxShell⟩
  have heraseCard : ((deletedCriticalSupport C).erase q).card = 3 := by
    rw [Finset.card_erase_of_mem hqShell, hshellCard]
  have hinterThree :
      ((C.B₁ ∪ C.B₂) ∩ deletedCriticalSupport C).card ≤ 3 := by
    have hle := Finset.card_le_card hinterSubset
    omega
  have hsplit := Finset.card_sdiff_add_card_inter
    (C.B₁ ∪ C.B₂) (deletedCriticalSupport C)
  omega

/-- The exact unconditional branch left by the two fresh row pairs. -/
def CommonDeletionCriticalResidual
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) : Prop :=
  (∃ a b : ℝ²,
      a ∈ C.B₁ ∧ b ∈ C.B₁ ∧
      a ∈ C.B₂ ∧ b ∈ C.B₂ ∧
      a ∉ deletedCriticalSupport C ∧
      b ∉ deletedCriticalSupport C ∧
      a ≠ b ∧
      dist (H.centerAt q C.q_mem_A) a ≠
        dist (H.centerAt q C.q_mem_A) b) ∨
    3 ≤ ((C.B₁ ∪ C.B₂) \
      deletedCriticalSupport C).card

/-- Every common-deletion packet reaches either a shared outside pair, with
the forced blocker-distance separation, or at least three fresh sources in
the union of its two exact q-deleted rows. -/
theorem commonDeletionCriticalResidual
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) :
    CommonDeletionCriticalResidual C := by
  exact Or.inr (three_le_rows_union_sdiff_deletedCriticalSupport C)

/-- Three named fresh critical sources obtained from the expanding branch. -/
structure ThreeFreshCriticalSources
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) where
  first : FreshCriticalSource C
  second : FreshCriticalSource C
  third : FreshCriticalSource C
  first_ne_second : first.point ≠ second.point
  first_ne_third : first.point ≠ third.point
  second_ne_third : second.point ≠ third.point

/-- Cardinality-three expansion gives three named sources whose blockers all
differ from the deleted source's blocker. -/
theorem nonempty_threeFreshCriticalSources
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (hthree : 3 ≤ ((C.B₁ ∪ C.B₂) \
      deletedCriticalSupport C).card) :
    Nonempty (ThreeFreshCriticalSources C) := by
  have hlt : 2 < ((C.B₁ ∪ C.B₂) \
      deletedCriticalSupport C).card := by omega
  rcases Finset.two_lt_card.mp hlt with
    ⟨a, ha, b, hb, c, hc, hab, hac, hbc⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haRows, haOutside⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbRows, hbOutside⟩
  rcases Finset.mem_sdiff.mp hc with ⟨hcRows, hcOutside⟩
  exact ⟨{
    first := freshCriticalSource_of_mem C haRows haOutside
    second := freshCriticalSource_of_mem C hbRows hbOutside
    third := freshCriticalSource_of_mem C hcRows hcOutside
    first_ne_second := hab
    first_ne_third := hac
    second_ne_third := hbc }⟩

/-- A certified prescribed-deletion critical shell at one named center. -/
structure PrescribedCriticalAt
    (D : CounterexampleData) (source center : ℝ²) where
  shell : CriticalSelectedFourClass D.A source center
  blocks :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center

/-- Two prescribed critical shells at the same center have the same exact
support.  Criticality of the second source forces it into the first shell,
which identifies the radii; exactness then identifies the full classes. -/
theorem prescribedCritical_support_eq_of_common_center
    {D : CounterexampleData} {source₁ source₂ center : ℝ²}
    (P₁ : PrescribedCriticalAt D source₁ center)
    (P₂ : PrescribedCriticalAt D source₂ center) :
    P₁.shell.toCriticalFourShell.support =
      P₂.shell.toCriticalFourShell.support := by
  have hsource₂First :
      source₂ ∈ P₁.shell.toCriticalFourShell.support := by
    by_contra houtside
    apply P₂.blocks
    refine ⟨P₁.shell.toCriticalFourShell.radius,
      P₁.shell.toCriticalFourShell.radius_pos, ?_⟩
    calc
      4 = P₁.shell.toCriticalFourShell.support.card :=
        P₁.shell.toCriticalFourShell.support_card.symm
      _ ≤ ((D.A.erase source₂).filter
          fun x => dist center x =
            P₁.shell.toCriticalFourShell.radius).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hxSource => houtside (hxSource ▸ hx),
                P₁.shell.toCriticalFourShell.support_subset_A hx⟩,
            P₁.shell.toCriticalFourShell.support_eq_radius x hx⟩
  have hradius : P₁.shell.toCriticalFourShell.radius =
      P₂.shell.toCriticalFourShell.radius := by
    calc
      P₁.shell.toCriticalFourShell.radius = dist center source₂ :=
        (P₁.shell.toCriticalFourShell.support_eq_radius
          source₂ hsource₂First).symm
      _ = P₂.shell.toCriticalFourShell.radius :=
        P₂.shell.toCriticalFourShell.support_eq_radius source₂
          P₂.shell.toCriticalFourShell.q_mem_support
  rw [P₁.shell.toCriticalFourShell.support_eq,
    P₂.shell.toCriticalFourShell.support_eq, hradius]

/-- A prescribed critical shell at the center of an exact four-point
q-deleted row is exactly that row.  If the source were absent from the row,
the row itself would survive its deletion; once the source is present, the
two radii agree and exactness identifies all four points. -/
theorem prescribedCritical_support_eq_qDeletedRow
    {D : CounterexampleData} {q source center : ℝ²} {B : Finset ℝ²}
    (P : PrescribedCriticalAt D source center)
    (K : U5QDeletedK4Class D q center B)
    (hBcard : B.card = 4) :
    P.shell.toCriticalFourShell.support = B := by
  have hsourceB : source ∈ B := by
    by_contra hsourceOutside
    apply P.blocks
    refine ⟨K.radius, K.radius_pos, ?_⟩
    calc
      4 = B.card := hBcard.symm
      _ ≤ ((D.A.erase source).filter
          fun x => dist center x = K.radius).card := by
        apply Finset.card_le_card
        intro x hx
        have hxErase := K.subset hx
        have hxA : x ∈ D.A :=
          (Finset.mem_erase.mp (Finset.mem_erase.mp hxErase).2).2
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hxSource => hsourceOutside (hxSource ▸ hx), hxA⟩,
            K.same_radius x hx⟩
  have hradius : K.radius = P.shell.toCriticalFourShell.radius := by
    calc
      K.radius = dist center source := (K.same_radius source hsourceB).symm
      _ = P.shell.toCriticalFourShell.radius :=
        P.shell.toCriticalFourShell.support_eq_radius source
          P.shell.toCriticalFourShell.q_mem_support
  have hsubset : B ⊆ P.shell.toCriticalFourShell.support := by
    intro x hx
    apply P.shell.toCriticalFourShell.off_row_named_label_forbidden
    · have hxErase := K.subset hx
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hxErase).2).2
    · exact (K.same_radius x hx).trans hradius
  have heq : B = P.shell.toCriticalFourShell.support :=
    Finset.eq_of_subset_of_card_le hsubset (by
      rw [P.shell.toCriticalFourShell.support_card, hBcard])
  exact heq.symm

/-- At one fresh source, the two prescribed centers give a branch-complete
transition: either deletion survives at both centers and produces the next
common-deletion packet, or one of the centers supplies a certified critical
shell that may be installed by a late sourcewise override. -/
def FreshSourcePrescribedTransition
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (X : FreshCriticalSource C) : Prop :=
  Nonempty (CommonDeletionTwoCenterPacket
      D H X.point center₁ center₂) ∨
    Nonempty (PrescribedCriticalAt D X.point center₁) ∨
    Nonempty (PrescribedCriticalAt D X.point center₂)

/-- Construct the prescribed transition at every fresh source. -/
theorem freshSourcePrescribedTransition
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (X : FreshCriticalSource C) :
    FreshSourcePrescribedTransition C X := by
  rcases erase_survives_or_criticalSelectedFourClass_at
      D.K4 C.center₁_mem_A with hsurvives₁ | ⟨R₁, hblocks₁⟩
  · rcases erase_survives_or_criticalSelectedFourClass_at
        D.K4 C.center₂_mem_A with hsurvives₂ | ⟨R₂, hblocks₂⟩
    · exact Or.inl (nonempty_commonDeletionTwoCenterPacket
        H X.mem_A C.center₁_mem_A C.center₂_mem_A C.centers_ne
        hsurvives₁ hsurvives₂)
    · exact Or.inr (Or.inr ⟨⟨R₂, hblocks₂⟩⟩)
  · exact Or.inr (Or.inl ⟨⟨R₁, hblocks₁⟩⟩)

/-- Two distinct fresh sources whose prescribed critical choices align at
one of the two existing row centers. -/
structure AlignedPrescribedCriticalPair
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (i : Fin 2) where
  first : FreshCriticalSource C
  second : FreshCriticalSource C
  ne : first.point ≠ second.point
  firstCritical : PrescribedCriticalAt D first.point
    (if i = 0 then center₁ else center₂)
  secondCritical : PrescribedCriticalAt D second.point
    (if i = 0 then center₁ else center₂)
  supports_eq :
    firstCritical.shell.toCriticalFourShell.support =
      secondCritical.shell.toCriticalFourShell.support
  support_eq_prescribed_row :
    firstCritical.shell.toCriticalFourShell.support =
      (if i = 0 then C.B₁ else C.B₂)

/-- Install both aligned prescribed shells after their source labels have
been selected.  The second pointwise override is safe because the two fresh
sources are distinct. -/
noncomputable def AlignedPrescribedCriticalPair.installedSystem
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H q center₁ center₂}
    {i : Fin 2} (P : AlignedPrescribedCriticalPair C i) :
    CriticalShellSystem D.A :=
  (H.overrideAt P.firstCritical.shell P.firstCritical.blocks).overrideAt
    P.secondCritical.shell P.secondCritical.blocks

/-- The installed system sends the first fresh source to the prescribed
common center. -/
theorem AlignedPrescribedCriticalPair.installedSystem_centerAt_first
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H q center₁ center₂}
    {i : Fin 2} (P : AlignedPrescribedCriticalPair C i) :
    P.installedSystem.centerAt P.first.point P.first.mem_A =
      (if i = 0 then center₁ else center₂) := by
  dsimp only [installedSystem]
  rw [CriticalShellSystem.overrideAt_centerAt_of_ne
    _ P.secondCritical.shell P.secondCritical.blocks
    P.first.mem_A P.ne]
  exact CriticalShellSystem.overrideAt_centerAt
    H P.firstCritical.shell P.firstCritical.blocks P.first.mem_A

/-- The installed system sends the second fresh source to the same prescribed
center. -/
theorem AlignedPrescribedCriticalPair.installedSystem_centerAt_second
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H q center₁ center₂}
    {i : Fin 2} (P : AlignedPrescribedCriticalPair C i) :
    P.installedSystem.centerAt P.second.point P.second.mem_A =
      (if i = 0 then center₁ else center₂) :=
  CriticalShellSystem.overrideAt_centerAt
    _ P.secondCritical.shell P.secondCritical.blocks P.second.mem_A

/-- Installing the aligned pair leaves the deleted source's chosen blocker
unchanged. -/
theorem AlignedPrescribedCriticalPair.installedSystem_centerAt_deleted
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H q center₁ center₂}
    {i : Fin 2} (P : AlignedPrescribedCriticalPair C i) :
    P.installedSystem.centerAt q C.q_mem_A = H.centerAt q C.q_mem_A := by
  dsimp only [installedSystem]
  rw [CriticalShellSystem.overrideAt_centerAt_of_ne
    _ P.secondCritical.shell P.secondCritical.blocks C.q_mem_A
    P.second.point_ne_deleted.symm]
  exact CriticalShellSystem.overrideAt_centerAt_of_ne
    H P.firstCritical.shell P.firstCritical.blocks C.q_mem_A
    P.first.point_ne_deleted.symm

/-- Rebase the original common-deletion packet to the system with both
sourcewise prescribed shells installed. -/
noncomputable def AlignedPrescribedCriticalPair.installedPacket
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H q center₁ center₂}
    {i : Fin 2} (P : AlignedPrescribedCriticalPair C i) :
    CommonDeletionTwoCenterPacket D P.installedSystem q center₁ center₂ :=
  rebaseCommonDeletionSystem C P.installedSystem

private def alignedPrescribedCriticalPairAtFirstCenter
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (X Y : FreshCriticalSource C) (hXY : X.point ≠ Y.point)
    (PX : PrescribedCriticalAt D X.point center₁)
    (PY : PrescribedCriticalAt D Y.point center₁) :
    AlignedPrescribedCriticalPair C (0 : Fin 2) :=
  { first := X
    second := Y
    ne := hXY
    firstCritical := PX
    secondCritical := PY
    supports_eq := prescribedCritical_support_eq_of_common_center PX PY
    support_eq_prescribed_row :=
      prescribedCritical_support_eq_qDeletedRow PX C.row₁ C.B₁_card }

private def alignedPrescribedCriticalPairAtSecondCenter
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (X Y : FreshCriticalSource C) (hXY : X.point ≠ Y.point)
    (PX : PrescribedCriticalAt D X.point center₂)
    (PY : PrescribedCriticalAt D Y.point center₂) :
    AlignedPrescribedCriticalPair C (1 : Fin 2) :=
  { first := X
    second := Y
    ne := hXY
    firstCritical := PX
    secondCritical := PY
    supports_eq := prescribedCritical_support_eq_of_common_center PX PY
    support_eq_prescribed_row :=
      prescribedCritical_support_eq_qDeletedRow PX C.row₂ C.B₂_card }

/-- Three fresh sources and two prescribed centers force the exact next
normal form.  Either one source recursively gives another common-deletion
packet at the same two centers, or two distinct sources are deletion-critical
at the same prescribed center and their exact critical supports coincide. -/
theorem commonDeletion_successor_or_alignedCriticalPair
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) :
    (∃ X : FreshCriticalSource C,
      Nonempty (CommonDeletionTwoCenterPacket
        D H X.point center₁ center₂)) ∨
      (∃ i : Fin 2, Nonempty (AlignedPrescribedCriticalPair C i)) := by
  rcases nonempty_threeFreshCriticalSources C
      (three_le_rows_union_sdiff_deletedCriticalSupport C) with ⟨T⟩
  rcases freshSourcePrescribedTransition C T.first with
    hfirst | hfirst₁ | hfirst₂
  · exact Or.inl ⟨T.first, hfirst⟩
  · rcases freshSourcePrescribedTransition C T.second with
      hsecond | hsecond₁ | hsecond₂
    · exact Or.inl ⟨T.second, hsecond⟩
    · exact Or.inr ⟨0, ⟨
        alignedPrescribedCriticalPairAtFirstCenter C
          T.first T.second T.first_ne_second hfirst₁.some hsecond₁.some⟩⟩
    · rcases freshSourcePrescribedTransition C T.third with
        hthird | hthird₁ | hthird₂
      · exact Or.inl ⟨T.third, hthird⟩
      · exact Or.inr ⟨0, ⟨
          alignedPrescribedCriticalPairAtFirstCenter C
            T.first T.third T.first_ne_third hfirst₁.some hthird₁.some⟩⟩
      · exact Or.inr ⟨1, ⟨
          alignedPrescribedCriticalPairAtSecondCenter C
            T.second T.third T.second_ne_third hsecond₂.some hthird₂.some⟩⟩
  · rcases freshSourcePrescribedTransition C T.second with
      hsecond | hsecond₁ | hsecond₂
    · exact Or.inl ⟨T.second, hsecond⟩
    · rcases freshSourcePrescribedTransition C T.third with
        hthird | hthird₁ | hthird₂
      · exact Or.inl ⟨T.third, hthird⟩
      · exact Or.inr ⟨0, ⟨
          alignedPrescribedCriticalPairAtFirstCenter C
            T.second T.third T.second_ne_third hsecond₁.some hthird₁.some⟩⟩
      · exact Or.inr ⟨1, ⟨
          alignedPrescribedCriticalPairAtSecondCenter C
            T.first T.third T.first_ne_third hfirst₂.some hthird₂.some⟩⟩
    · exact Or.inr ⟨1, ⟨
        alignedPrescribedCriticalPairAtSecondCenter C
          T.first T.second T.first_ne_second hfirst₂.some hsecond₂.some⟩⟩

/-- The three exact four-point circles already occupy at least seven carrier
points.  This is a finite-pattern lower bound, not a contradiction. -/
theorem seven_le_critical_and_two_deleted_rows_union_card
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) :
    7 ≤ (deletedCriticalSupport C ∪ (C.B₁ ∪ C.B₂)).card := by
  have hrowsSplit := Finset.card_union_add_card_inter C.B₁ C.B₂
  have hrowsSix : 6 ≤ (C.B₁ ∪ C.B₂).card := by
    rw [C.B₁_card, C.B₂_card] at hrowsSplit
    have hinter := C.overlap_le_two
    omega
  have hqNotRows : q ∉ C.B₁ ∪ C.B₂ := by
    simpa using ⟨C.row₁.q_not_mem, C.row₂.q_not_mem⟩
  have hinsertSubset : insert q (C.B₁ ∪ C.B₂) ⊆
      deletedCriticalSupport C ∪ (C.B₁ ∪ C.B₂) := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hxRows
    · exact Finset.mem_union.mpr (Or.inl
        (by simpa [deletedCriticalSupport] using
          (H.selectedAt _ C.q_mem_A).toCriticalFourShell.q_mem_support))
    · exact Finset.mem_union.mpr (Or.inr hxRows)
  have hcardInsert :
      (insert q (C.B₁ ∪ C.B₂)).card =
        (C.B₁ ∪ C.B₂).card + 1 := by
    rw [Finset.card_insert_of_notMem hqNotRows]
  have hle := Finset.card_le_card hinsertSubset
  omega

/-- Consolidated theorem-facing expansion packet.  This is the concrete
normal form to feed to the next incidence or cap-localization consumer. -/
structure CommonDeletionCriticalExpansion
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) where
  dangerous : U5DangerousTriple D q (H.centerAt q C.q_mem_A)
    (deletedCriticalSupport C |>.erase q)
  firstRowPair : FreshCriticalPair C (0 : Fin 2)
  secondRowPair : FreshCriticalPair C (1 : Fin 2)
  threeFreshSources : ThreeFreshCriticalSources C
  successor :
    (∃ X : FreshCriticalSource C,
      Nonempty (CommonDeletionTwoCenterPacket
        D H X.point center₁ center₂)) ∨
      (∃ i : Fin 2, Nonempty (AlignedPrescribedCriticalPair C i))
  residual : CommonDeletionCriticalResidual C
  seven_support_points :
    7 ≤ (deletedCriticalSupport C ∪ (C.B₁ ∪ C.B₂)).card

/-- Construct the consolidated expansion without any additional producer
hypothesis. -/
theorem nonempty_commonDeletionCriticalExpansion
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂) :
    Nonempty (CommonDeletionCriticalExpansion C) := by
  rcases nonempty_freshCriticalPair C (0 : Fin 2) with ⟨P₁⟩
  rcases nonempty_freshCriticalPair C (1 : Fin 2) with ⟨P₂⟩
  rcases nonempty_threeFreshCriticalSources C
      (three_le_rows_union_sdiff_deletedCriticalSupport C) with ⟨P₃⟩
  exact ⟨{
    dangerous := dangerousTriple_at_commonDeletion C
    firstRowPair := P₁
    secondRowPair := P₂
    threeFreshSources := P₃
    successor := commonDeletion_successor_or_alignedCriticalPair C
    residual := commonDeletionCriticalResidual C
    seven_support_points :=
      seven_le_critical_and_two_deleted_rows_union_card C }⟩

/-- The same expansion is available after choosing any favorable critical
system; both q-deleted rows remain literally unchanged. -/
theorem nonempty_commonDeletionCriticalExpansion_after_rebase
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H q center₁ center₂)
    (Hfav : CriticalShellSystem D.A) :
    Nonempty (CommonDeletionCriticalExpansion
      (rebaseCommonDeletionSystem C Hfav)) :=
  nonempty_commonDeletionCriticalExpansion
    (rebaseCommonDeletionSystem C Hfav)

#print axioms rebaseCommonDeletionSystem
#print axioms overrideCommonDeletionAt
#print axioms dangerousTriple_at_commonDeletion
#print axioms two_le_row_sdiff_deletedCriticalSupport
#print axioms freshCriticalSource_of_mem
#print axioms nonempty_freshCriticalPair
#print axioms deletedBlocker_distance_ne_of_common_outside_pair
#print axioms three_le_rows_union_sdiff_deletedCriticalSupport
#print axioms commonDeletionCriticalResidual
#print axioms nonempty_threeFreshCriticalSources
#print axioms prescribedCritical_support_eq_of_common_center
#print axioms prescribedCritical_support_eq_qDeletedRow
#print axioms freshSourcePrescribedTransition
#print axioms commonDeletion_successor_or_alignedCriticalPair
#print axioms AlignedPrescribedCriticalPair.installedSystem_centerAt_first
#print axioms AlignedPrescribedCriticalPair.installedSystem_centerAt_second
#print axioms AlignedPrescribedCriticalPair.installedSystem_centerAt_deleted
#print axioms seven_le_critical_and_two_deleted_rows_union_card
#print axioms nonempty_commonDeletionCriticalExpansion
#print axioms nonempty_commonDeletionCriticalExpansion_after_rebase

end ATailCommonDeletionCriticalExpansionScratch
end Problem97
