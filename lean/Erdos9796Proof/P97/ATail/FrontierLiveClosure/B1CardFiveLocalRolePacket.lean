/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LocalRolePacket

/-!
# B1 five-point local roles

This module names the two live physical slices and their exact-row
completions in the card-five branch of the B1 normal form.  It preserves only
within-slice and within-completion inequalities.  No roles from different
rows are asserted to be distinct.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open GenericRowNogoodCertificate

attribute [local instance] Classical.propDecidable

/-- A one-point slice identified with its already distinguished source. -/
structure B1NamedSingletonSlice (A slice : Finset ℝ²)
    (source : CarrierVertex A) : Prop where
  slice_eq : slice = {source.1}

/-- A singleton slice containing a named source is exactly that source. -/
theorem nonempty_b1NamedSingletonSlice_of_card_eq_one
    {A slice : Finset ℝ²} {source : CarrierVertex A}
    (hsource : source.1 ∈ slice) (hcard : slice.card = 1) :
    Nonempty (B1NamedSingletonSlice A slice source) := by
  classical
  obtain ⟨point, hslice⟩ := Finset.card_eq_one.mp hcard
  have hsourcePoint : source.1 = point := by
    simpa [hslice] using hsource
  exact ⟨⟨by simpa [hsourcePoint] using hslice⟩⟩

/-- Three pairwise-distinct carrier labels naming the part of an exact row
outside a chosen physical class. -/
structure B1RowCompletionTriple
    (A row physicalClass : Finset ℝ²) where
  first : CarrierVertex A
  second : CarrierVertex A
  third : CarrierVertex A
  first_ne_second : first ≠ second
  first_ne_third : first ≠ third
  second_ne_third : second ≠ third
  complement_eq :
    row \ physicalClass = {first.1, second.1, third.1}

/-- Name any three-point row complement by three pairwise-distinct ambient
carrier labels. -/
theorem nonempty_b1RowCompletionTriple_of_card_eq_three
    {A row physicalClass : Finset ℝ²}
    (hrowA : row ⊆ A)
    (hcard : (row \ physicalClass).card = 3) :
    Nonempty (B1RowCompletionTriple A row physicalClass) := by
  classical
  obtain ⟨first, second, third, hfirstSecond, hfirstThird,
      hsecondThird, hcomplement⟩ := Finset.card_eq_three.mp hcard
  have hfirstRow : first ∈ row :=
    (Finset.mem_sdiff.mp (by rw [hcomplement]; simp)).1
  have hsecondRow : second ∈ row :=
    (Finset.mem_sdiff.mp (by rw [hcomplement]; simp)).1
  have hthirdRow : third ∈ row :=
    (Finset.mem_sdiff.mp (by rw [hcomplement]; simp)).1
  let firstLabel : CarrierVertex A := ⟨first, hrowA hfirstRow⟩
  let secondLabel : CarrierVertex A := ⟨second, hrowA hsecondRow⟩
  let thirdLabel : CarrierVertex A := ⟨third, hrowA hthirdRow⟩
  exact ⟨{
    first := firstLabel
    second := secondLabel
    third := thirdLabel
    first_ne_second := fun h ↦ hfirstSecond (congrArg Subtype.val h)
    first_ne_third := fun h ↦ hfirstThird (congrArg Subtype.val h)
    second_ne_third := fun h ↦ hsecondThird (congrArg Subtype.val h)
    complement_eq := by
      simpa [firstLabel, secondLabel, thirdLabel] using hcomplement }⟩

/-- Exact card-five trace split for the two live physical slices. -/
theorem b1_live_slices_card_five_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hfive : (SelectedClass D.A S.oppApex2 C.rho).card = 5) :
    let physicalClass := SelectedClass D.A S.oppApex2 C.rho
    let uSlice :=
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.support ∩ physicalClass
    let vSlice :=
      ((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.support ∩ physicalClass
    (uSlice.card = 1 ∧ vSlice.card = 2) ∨
      (uSlice.card = 2 ∧ vSlice.card = 1) ∨
      (uSlice.card = 2 ∧ vSlice.card = 2 ∧
        (uSlice ∩ vSlice).card = 1) := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support ∩ physicalClass
  let vSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support ∩ physicalClass
  let deletedPair : Finset ℝ² :=
    {C.first.deleted.1, C.second.deleted.1}
  have hnormal' :
      (¬ ∃ third : ExactFourMutualOmissionJointDeletion
          C.R C.rho C.u C.v,
          third.deleted ≠ C.first.deleted ∧
            third.deleted ≠ C.second.deleted) ∧
        (physicalClass.card = 5 ∨ physicalClass.card = 6) ∧
          physicalClass = deletedPair ∪ (uSlice ∪ vSlice) := by
    simpa [B1PhysicalClassFiveSixNormalForm, physicalClass,
      uSlice, vSlice, deletedPair] using hnormal
  have hdeletedValuesNe :
      C.first.deleted.1 ≠ C.second.deleted.1 := by
    intro h
    exact C.hdeletedNe (Subtype.ext h)
  have hpairCard : deletedPair.card = 2 := by
    simp [deletedPair, hdeletedValuesNe]
  have hpairDisjointU : Disjoint deletedPair uSlice := by
    rw [Finset.disjoint_left]
    intro x hxPair hxU
    have hxURow := (Finset.mem_inter.mp (show x ∈ uSlice from hxU)).1
    rcases Finset.mem_insert.mp hxPair with rfl | hxSecond
    · exact C.first.deleted_not_mem_uRow hxURow
    · have hx : x = C.second.deleted.1 := Finset.mem_singleton.mp hxSecond
      subst x
      exact C.second.deleted_not_mem_uRow hxURow
  have hpairDisjointV : Disjoint deletedPair vSlice := by
    rw [Finset.disjoint_left]
    intro x hxPair hxV
    have hxVRow := (Finset.mem_inter.mp (show x ∈ vSlice from hxV)).1
    rcases Finset.mem_insert.mp hxPair with rfl | hxSecond
    · exact C.first.deleted_not_mem_vRow hxVRow
    · have hx : x = C.second.deleted.1 := Finset.mem_singleton.mp hxSecond
      subst x
      exact C.second.deleted_not_mem_vRow hxVRow
  have hpairDisjointUnion : Disjoint deletedPair (uSlice ∪ vSlice) := by
    rw [Finset.disjoint_left]
    intro x hxPair hxUV
    rcases Finset.mem_union.mp hxUV with hxU | hxV
    · exact Finset.disjoint_left.mp hpairDisjointU hxPair hxU
    · exact Finset.disjoint_left.mp hpairDisjointV hxPair hxV
  have hunionCard : (uSlice ∪ vSlice).card = 3 := by
    have hclassCardEq :
        physicalClass.card = deletedPair.card + (uSlice ∪ vSlice).card := by
      rw [hnormal'.2.2, Finset.card_union_of_disjoint hpairDisjointUnion]
    have hfive' : physicalClass.card = 5 := by
      simpa [physicalClass] using hfive
    omega
  have huPos : 1 ≤ uSlice.card := by
    apply Finset.card_pos.mpr
    exact ⟨C.u.1, Finset.mem_inter.mpr ⟨
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.q_mem_support,
      C.huClass⟩⟩
  have hvPos : 1 ≤ vSlice.card := by
    apply Finset.card_pos.mpr
    exact ⟨C.v.1, Finset.mem_inter.mpr ⟨
      ((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.q_mem_support,
      C.hvClass⟩⟩
  have huTwo : uSlice.card ≤ 2 := by
    simpa [uSlice, physicalClass] using
      actualLateRow_secondClass_card_le_two C.R C.surface C.u
  have hvTwo : vSlice.card ≤ 2 := by
    simpa [vSlice, physicalClass] using
      actualLateRow_secondClass_card_le_two C.R C.surface C.v
  have huCases : uSlice.card = 1 ∨ uSlice.card = 2 := by omega
  have hvCases : vSlice.card = 1 ∨ vSlice.card = 2 := by omega
  rcases huCases with huOne | huTwoEq <;>
    rcases hvCases with hvOne | hvTwoEq
  · have hunionUpper := Finset.card_union_le uSlice vSlice
    omega
  · exact Or.inl ⟨huOne, hvTwoEq⟩
  · exact Or.inr (Or.inl ⟨huTwoEq, hvOne⟩)
  · right; right
    refine ⟨huTwoEq, hvTwoEq, ?_⟩
    change (uSlice ∩ vSlice).card = 1
    have hidentity := Finset.card_union_add_card_inter uSlice vSlice
    rw [hunionCard, huTwoEq, hvTwoEq] at hidentity
    omega

private theorem row_complement_card_eq_three_of_inter_card_eq_one
    {row physicalClass : Finset ℝ²}
    (hrowCard : row.card = 4)
    (hinterCard : (row ∩ physicalClass).card = 1) :
    (row \ physicalClass).card = 3 := by
  have hidentity := Finset.card_sdiff_add_card_inter row physicalClass
  omega

private theorem row_complement_card_eq_two_of_inter_card_eq_two
    {row physicalClass : Finset ℝ²}
    (hrowCard : row.card = 4)
    (hinterCard : (row ∩ physicalClass).card = 2) :
    (row \ physicalClass).card = 2 := by
  have hidentity := Finset.card_sdiff_add_card_inter row physicalClass
  omega

/-- Complete live-row packet when the `u` slice is a singleton. -/
structure B1CardFiveUSingletonRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) where
  uPhysical : B1NamedSingletonSlice D.A
    (((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho) C.u
  vPhysical : B1NamedTwoPointSlice D.A
    (((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho) C.v
  uCompletion : B1RowCompletionTriple D.A
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support
    (SelectedClass D.A S.oppApex2 C.rho)
  vCompletion : B1RowCompletionPair D.A
    ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support
    (SelectedClass D.A S.oppApex2 C.rho)

/-- Complete live-row packet when the `v` slice is a singleton. -/
structure B1CardFiveVSingletonRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) where
  uPhysical : B1NamedTwoPointSlice D.A
    (((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho) C.u
  vPhysical : B1NamedSingletonSlice D.A
    (((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho) C.v
  uCompletion : B1RowCompletionPair D.A
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support
    (SelectedClass D.A S.oppApex2 C.rho)
  vCompletion : B1RowCompletionTriple D.A
    ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support
    (SelectedClass D.A S.oppApex2 C.rho)

/-- Complete live-row packet when both slices have two points and share one. -/
structure B1CardFiveSharedPairRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) where
  uPhysical : B1NamedTwoPointSlice D.A
    (((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho) C.u
  vPhysical : B1NamedTwoPointSlice D.A
    (((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho) C.v
  overlap_card :
    ((((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho) ∩
      (((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 C.rho)).card = 1
  uCompletion : B1RowCompletionPair D.A
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support
    (SelectedClass D.A S.oppApex2 C.rho)
  vCompletion : B1RowCompletionPair D.A
    ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support
    (SelectedClass D.A S.oppApex2 C.rho)

/-- The three exhaustive card-five live-row shapes. -/
inductive B1CardFiveLiveRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Type
  | uSingleton (packet : B1CardFiveUSingletonRows C)
  | vSingleton (packet : B1CardFiveVSingletonRows C)
  | sharedPairs (packet : B1CardFiveSharedPairRows C)

/-- Card-five local roles, including the common-row completion pair and both
complete live rows in the applicable trace branch. -/
structure B1CardFiveLocalRolePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) where
  physicalClass_card :
    (SelectedClass D.A S.oppApex2 C.rho).card = 5
  commonCompletion : B1RowCompletionPair D.A (b1CommonRow C)
    (SelectedClass D.A S.oppApex2 C.rho)
  liveRows : B1CardFiveLiveRows C

/-- Every card-five B1 normal form supplies one of the three complete local
live-row packets. -/
theorem nonempty_b1CardFiveLocalRolePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hfive : (SelectedClass D.A S.oppApex2 C.rho).card = 5) :
    Nonempty (B1CardFiveLocalRolePacket C) := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uRow :=
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support
  let vRow :=
    ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support
  let uSlice := uRow ∩ physicalClass
  let vSlice := vRow ∩ physicalClass
  have hsplit := b1_live_slices_card_five_split C hnormal hfive
  have huMem : C.u.1 ∈ uSlice := by
    exact Finset.mem_inter.mpr ⟨
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.q_mem_support,
      C.huClass⟩
  have hvMem : C.v.1 ∈ vSlice := by
    exact Finset.mem_inter.mpr ⟨
      ((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.q_mem_support,
      C.hvClass⟩
  have huSliceA : uSlice ⊆ D.A := by
    intro x hx
    exact ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support_subset_A
        (Finset.mem_inter.mp hx).1
  have hvSliceA : vSlice ⊆ D.A := by
    intro x hx
    exact ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support_subset_A
        (Finset.mem_inter.mp hx).1
  have huRowA : uRow ⊆ D.A := by
    intro x hx
    exact ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support_subset_A hx
  have hvRowA : vRow ⊆ D.A := by
    intro x hx
    exact ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support_subset_A hx
  have huRowCard : uRow.card = 4 := by
    simpa [uRow] using ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support_card
  have hvRowCard : vRow.card = 4 := by
    simpa [vRow] using ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support_card
  obtain ⟨commonCompletion⟩ := nonempty_b1CommonRowCompletionPair C
  rcases hsplit with huSingleton | hvSingleton | hshared
  · obtain ⟨uPhysical⟩ :=
      nonempty_b1NamedSingletonSlice_of_card_eq_one huMem
        (by simpa [uSlice, vSlice, uRow, vRow, physicalClass] using huSingleton.1)
    obtain ⟨vPhysical⟩ :=
      nonempty_b1NamedTwoPointSlice_of_card_eq_two hvSliceA hvMem
        (by simpa [uSlice, vSlice, uRow, vRow, physicalClass] using huSingleton.2)
    have huComplement : (uRow \ physicalClass).card = 3 :=
      row_complement_card_eq_three_of_inter_card_eq_one huRowCard huSingleton.1
    have hvComplement : (vRow \ physicalClass).card = 2 :=
      row_complement_card_eq_two_of_inter_card_eq_two hvRowCard huSingleton.2
    obtain ⟨uCompletion⟩ :=
      nonempty_b1RowCompletionTriple_of_card_eq_three huRowA huComplement
    obtain ⟨vCompletion⟩ :=
      nonempty_b1RowCompletionPair_of_card_eq_two hvRowA hvComplement
    exact ⟨{
      physicalClass_card := hfive
      commonCompletion := commonCompletion
      liveRows := .uSingleton {
        uPhysical := uPhysical
        vPhysical := vPhysical
        uCompletion := uCompletion
        vCompletion := vCompletion } }⟩
  · obtain ⟨uPhysical⟩ :=
      nonempty_b1NamedTwoPointSlice_of_card_eq_two huSliceA huMem
        (by simpa [uSlice, vSlice, uRow, vRow, physicalClass] using hvSingleton.1)
    obtain ⟨vPhysical⟩ :=
      nonempty_b1NamedSingletonSlice_of_card_eq_one hvMem
        (by simpa [uSlice, vSlice, uRow, vRow, physicalClass] using hvSingleton.2)
    have huComplement : (uRow \ physicalClass).card = 2 :=
      row_complement_card_eq_two_of_inter_card_eq_two huRowCard hvSingleton.1
    have hvComplement : (vRow \ physicalClass).card = 3 :=
      row_complement_card_eq_three_of_inter_card_eq_one hvRowCard hvSingleton.2
    obtain ⟨uCompletion⟩ :=
      nonempty_b1RowCompletionPair_of_card_eq_two huRowA huComplement
    obtain ⟨vCompletion⟩ :=
      nonempty_b1RowCompletionTriple_of_card_eq_three hvRowA hvComplement
    exact ⟨{
      physicalClass_card := hfive
      commonCompletion := commonCompletion
      liveRows := .vSingleton {
        uPhysical := uPhysical
        vPhysical := vPhysical
        uCompletion := uCompletion
        vCompletion := vCompletion } }⟩
  · obtain ⟨uPhysical⟩ :=
      nonempty_b1NamedTwoPointSlice_of_card_eq_two huSliceA huMem
        (by simpa [uSlice, vSlice, uRow, vRow, physicalClass] using hshared.1)
    obtain ⟨vPhysical⟩ :=
      nonempty_b1NamedTwoPointSlice_of_card_eq_two hvSliceA hvMem
        (by simpa [uSlice, vSlice, uRow, vRow, physicalClass] using hshared.2.1)
    have huComplement : (uRow \ physicalClass).card = 2 :=
      row_complement_card_eq_two_of_inter_card_eq_two huRowCard hshared.1
    have hvComplement : (vRow \ physicalClass).card = 2 :=
      row_complement_card_eq_two_of_inter_card_eq_two hvRowCard hshared.2.1
    obtain ⟨uCompletion⟩ :=
      nonempty_b1RowCompletionPair_of_card_eq_two huRowA huComplement
    obtain ⟨vCompletion⟩ :=
      nonempty_b1RowCompletionPair_of_card_eq_two hvRowA hvComplement
    exact ⟨{
      physicalClass_card := hfive
      commonCompletion := commonCompletion
      liveRows := .sharedPairs {
        uPhysical := uPhysical
        vPhysical := vPhysical
        overlap_card := by
          simpa [uSlice, vSlice, uRow, vRow, physicalClass] using hshared.2.2
        uCompletion := uCompletion
        vCompletion := vCompletion } }⟩

namespace B1CardFiveLocalRolePacket

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- Physical second-apex center of the card-five metric row. -/
def physicalApex (_ : B1CardFiveLocalRolePacket C) : CarrierLabel D.A :=
  ⟨S.oppApex2, C.first.uPacket.center₂_mem_A⟩

/-- Common deleted-source blocker center. -/
noncomputable def Bc (_ : B1CardFiveLocalRolePacket C) : CarrierLabel D.A :=
  ⟨b1CommonBlocker C,
    (Finset.mem_erase.mp
      ((lateFirstApexSystem C.R).selectedAt
        C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.center_mem).2⟩

/-- First live-source blocker center. -/
noncomputable def Bu (_ : B1CardFiveLocalRolePacket C) : CarrierLabel D.A :=
  ⟨(lateFirstApexSystem C.R).centerAt C.u.1 C.u.2,
    (Finset.mem_erase.mp
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.center_mem).2⟩

/-- Second live-source blocker center. -/
noncomputable def Bv (_ : B1CardFiveLocalRolePacket C) : CarrierLabel D.A :=
  ⟨(lateFirstApexSystem C.R).centerAt C.v.1 C.v.2,
    (Finset.mem_erase.mp
      ((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.center_mem).2⟩

/-- Radius selected for each of the four named metric centers. -/
noncomputable def sourceRadius (P : B1CardFiveLocalRolePacket C)
    (center : CarrierLabel D.A) : ℝ :=
  if center = P.physicalApex then C.rho
  else if center = P.Bc then dist P.Bc.1 C.first.deleted.1
  else if center = P.Bu then dist P.Bu.1 C.u.1
  else if center = P.Bv then dist P.Bv.1 C.v.1
  else 0

/-- Source metric rows as full carrier spheres at the four named centers. -/
noncomputable def sourceMetricRows (P : B1CardFiveLocalRolePacket C) :
    RowPattern (CarrierLabel D.A) :=
  fun center => D.A.attach.filter fun point ↦
    dist center.1 point.1 = P.sourceRadius center

@[simp] theorem mem_sourceMetricRows_iff
    (P : B1CardFiveLocalRolePacket C) (center point : CarrierLabel D.A) :
    point ∈ P.sourceMetricRows center ↔
      dist center.1 point.1 = P.sourceRadius center := by
  simp [sourceMetricRows]

/-- Canonical carrier points realize all four source metric rows. -/
theorem realizes_sourceMetricRows (P : B1CardFiveLocalRolePacket C) :
    Realizes P.sourceMetricRows (pointOf (A := D.A)) := by
  refine ⟨?_, Subtype.val_injective⟩
  intro center first hfirst second hsecond
  exact ((mem_sourceMetricRows_iff P center first).mp hfirst).trans
    ((mem_sourceMetricRows_iff P center second).mp hsecond).symm

/-- Carrier labels lying in a specified geometric source row. -/
noncomputable def labelsIn (_P : B1CardFiveLocalRolePacket C)
    (row : Finset ℝ²) : Finset (CarrierLabel D.A) :=
  D.A.attach.filter fun point ↦ point.1 ∈ row

@[simp] theorem mem_labelsIn_iff (P : B1CardFiveLocalRolePacket C)
    (row : Finset ℝ²) (point : CarrierLabel D.A) :
    point ∈ P.labelsIn row ↔ point.1 ∈ row := by
  simp [labelsIn]

/-- Exact five-point physical-radius row choice. -/
noncomputable def physicalRowChoice (P : B1CardFiveLocalRolePacket C) :
    RowChoice (CarrierLabel D.A) :=
  { center := P.physicalApex
    support := P.labelsIn (SelectedClass D.A S.oppApex2 C.rho) }

/-- Exact common-blocker row choice. -/
noncomputable def commonRowChoice (P : B1CardFiveLocalRolePacket C) :
    RowChoice (CarrierLabel D.A) :=
  { center := P.Bc
    support := P.labelsIn (b1CommonRow C) }

/-- Exact first live-blocker row choice. -/
noncomputable def uRowChoice (P : B1CardFiveLocalRolePacket C) :
    RowChoice (CarrierLabel D.A) :=
  { center := P.Bu
    support := P.labelsIn
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.support }

/-- Exact second live-blocker row choice. -/
noncomputable def vRowChoice (P : B1CardFiveLocalRolePacket C) :
    RowChoice (CarrierLabel D.A) :=
  { center := P.Bv
    support := P.labelsIn
      ((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.support }

/-- The physical K5 row followed by the three exact-four blocker rows. -/
noncomputable def sourceRowChoices (P : B1CardFiveLocalRolePacket C) :
    List (RowChoice (CarrierLabel D.A)) :=
  [P.physicalRowChoice, P.commonRowChoice, P.uRowChoice, P.vRowChoice]

private theorem Bc_ne_physicalApex (P : B1CardFiveLocalRolePacket C) :
    P.Bc ≠ P.physicalApex := by
  intro h
  exact C.first.uPacket.actual_blocker_ne_center₂
    (congrArg Subtype.val h)

private theorem Bu_ne_physicalApex (P : B1CardFiveLocalRolePacket C) :
    P.Bu ≠ P.physicalApex := by
  intro h
  exact C.first.uPacket.centers_ne (congrArg Subtype.val h)

private theorem Bu_ne_Bc (P : B1CardFiveLocalRolePacket C) : P.Bu ≠ P.Bc := by
  intro h
  exact C.first.uPacket.actual_blocker_ne_center₁
    (congrArg Subtype.val h).symm

private theorem Bv_ne_physicalApex (P : B1CardFiveLocalRolePacket C) :
    P.Bv ≠ P.physicalApex := by
  intro h
  exact C.first.vPacket.centers_ne (congrArg Subtype.val h)

private theorem Bv_ne_Bc (P : B1CardFiveLocalRolePacket C) : P.Bv ≠ P.Bc := by
  intro h
  exact C.first.vPacket.actual_blocker_ne_center₁
    (congrArg Subtype.val h).symm

private theorem Bv_ne_Bu (P : B1CardFiveLocalRolePacket C) : P.Bv ≠ P.Bu := by
  intro h
  exact C.first.blockers_ne (congrArg Subtype.val h).symm

private theorem physical_support_subset_sourceMetricRows
    (P : B1CardFiveLocalRolePacket C) :
    P.physicalRowChoice.support ⊆ P.sourceMetricRows P.physicalApex := by
  intro point hpoint
  have hclass : point.1 ∈ SelectedClass D.A S.oppApex2 C.rho := by
    simpa [physicalRowChoice] using hpoint
  apply (mem_sourceMetricRows_iff P P.physicalApex point).mpr
  simpa [sourceRadius] using (mem_selectedClass.mp hclass).2

private theorem common_support_subset_sourceMetricRows
    (P : B1CardFiveLocalRolePacket C) :
    P.commonRowChoice.support ⊆ P.sourceMetricRows P.Bc := by
  intro point hpoint
  let K := ((lateFirstApexSystem C.R).selectedAt
    C.first.deleted.1 C.first.deleted.2).toCriticalFourShell
  have hsupport : point.1 ∈ K.support := by
    simpa [commonRowChoice, b1CommonRow, K] using hpoint
  apply (mem_sourceMetricRows_iff P P.Bc point).mpr
  simp only [sourceRadius, if_neg (Bc_ne_physicalApex P), if_pos]
  exact (K.support_eq_radius point.1 hsupport).trans
    (K.support_eq_radius C.first.deleted.1 K.q_mem_support).symm

private theorem u_support_subset_sourceMetricRows
    (P : B1CardFiveLocalRolePacket C) :
    P.uRowChoice.support ⊆ P.sourceMetricRows P.Bu := by
  intro point hpoint
  let K := ((lateFirstApexSystem C.R).selectedAt
    C.u.1 C.u.2).toCriticalFourShell
  have hsupport : point.1 ∈ K.support := by
    simpa [uRowChoice, K] using hpoint
  apply (mem_sourceMetricRows_iff P P.Bu point).mpr
  simp only [sourceRadius, if_neg (Bu_ne_physicalApex P), if_neg (Bu_ne_Bc P), if_pos]
  exact (K.support_eq_radius point.1 hsupport).trans
    (K.support_eq_radius C.u.1 K.q_mem_support).symm

private theorem v_support_subset_sourceMetricRows
    (P : B1CardFiveLocalRolePacket C) :
    P.vRowChoice.support ⊆ P.sourceMetricRows P.Bv := by
  intro point hpoint
  let K := ((lateFirstApexSystem C.R).selectedAt
    C.v.1 C.v.2).toCriticalFourShell
  have hsupport : point.1 ∈ K.support := by
    simpa [vRowChoice, K] using hpoint
  apply (mem_sourceMetricRows_iff P P.Bv point).mpr
  simp only [sourceRadius, if_neg (Bv_ne_physicalApex P), if_neg (Bv_ne_Bc P),
    if_neg (Bv_ne_Bu P), if_pos]
  exact (K.support_eq_radius point.1 hsupport).trans
    (K.support_eq_radius C.v.1 K.q_mem_support).symm

/-- The four named source rows positively match their realized metric
pattern. -/
theorem positiveRowsMatch_sourceRowChoices
    (P : B1CardFiveLocalRolePacket C) :
    PositiveRowsMatch P.sourceMetricRows P.sourceRowChoices := by
  intro choice hchoice
  simp only [sourceRowChoices, List.mem_cons, List.not_mem_nil, or_false] at hchoice
  rcases hchoice with rfl | rfl | rfl | rfl
  · exact physical_support_subset_sourceMetricRows P
  · exact common_support_subset_sourceMetricRows P
  · exact u_support_subset_sourceMetricRows P
  · exact v_support_subset_sourceMetricRows P

end B1CardFiveLocalRolePacket

end ATailFrontierLiveClosure
end Problem97
