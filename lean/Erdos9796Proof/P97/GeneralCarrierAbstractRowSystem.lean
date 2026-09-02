/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.AbstractRowSystemConnectivity
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# The faithful carrier as an abstract row system

This thin adapter exposes the source-backed `GeneralCarrierBridge.rowPattern`
through the weak `AbstractRowSystem` interface. It deliberately adds no
pair-codegree or metric/cap assumptions that are absent from a
`FaithfulCarrierPattern`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace GeneralCarrierAbstractRowSystem

open Census554.GeneralCarrierBridge

/-- The selected geometric rows, pulled back to canonical carrier labels. -/
noncomputable def system {A : Finset ℝ²} (F : FaithfulCarrierPattern A) :
    AbstractRowSystem (CarrierLabel A) where
  row := rowPattern F

@[simp]
theorem system_row {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (center : CarrierLabel A) :
    (system F).row center = rowPattern F center :=
  rfl

/-- Every faithful-carrier row has four labels. -/
theorem system_rowCardEq_four {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) :
    (system F).RowCardEq 4 := by
  intro center
  exact rowPattern_card F center

/-- A faithful-carrier row omits its own center. -/
theorem system_centerExcluded {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) :
    (system F).CenterExcluded := by
  classical
  intro center hcenter
  exact (F.classAt center.1 center.2).center_not_mem
    ((mem_rowPattern_iff F center center).mp hcenter)

/-- Distinct faithful-carrier rows meet in at most two labels. -/
theorem system_rowInterCardLE_two {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) :
    (system F).RowInterCardLE 2 := by
  classical
  intro c d hcd
  have hcenters : c.1 ≠ d.1 := by
    intro h
    exact hcd (Subtype.ext h)
  have himage :
      ((rowPattern F c ∩ rowPattern F d).image pointOf) ⊆
        (F.classAt c.1 c.2).support ∩
          (F.classAt d.1 d.2).support := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨label, hlabel, rfl⟩
    exact Finset.mem_inter.mpr
      ⟨(mem_rowPattern_iff F c label).mp (Finset.mem_inter.mp hlabel).1,
        (mem_rowPattern_iff F d label).mp (Finset.mem_inter.mp hlabel).2⟩
  calc
    ((system F).row c ∩ (system F).row d).card =
        ((rowPattern F c ∩ rowPattern F d).image pointOf).card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ ((F.classAt c.1 c.2).support ∩
        (F.classAt d.1 d.2).support).card :=
      Finset.card_le_card himage
    _ ≤ 2 :=
      SelectedFourClass.inter_card_le_two
        (F.classAt c.1 c.2) (F.classAt d.1 d.2) hcenters

/-- The chosen blocker label differs from its source label. -/
theorem blockerLabel_ne_source {A : Finset ℝ²}
    (H : CriticalShellSystem A) (q : CarrierLabel A) :
    blockerLabel H q.1 q.2 ≠ q := by
  intro h
  have hpoints : H.centerAt q.1 q.2 = q.1 :=
    congrArg Subtype.val h
  exact
    (Finset.mem_erase.mp
      (H.selectedAt q.1 q.2).toCriticalFourShell.center_mem).1 hpoints

/-- A critical-shell choice supplies the abstract system's blocker section. -/
theorem system_hasBlockerSection {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (H : CriticalShellSystem A) :
    (system F).HasBlockerSection
      (fun q => blockerLabel H q.1 q.2) := by
  intro q
  exact ⟨blockerLabel_ne_source H q, source_mem_blocker_row F H q⟩

/-- Minimality of the geometric counterexample becomes support-minimality of
the canonical label system. -/
theorem system_supportMinimal {D : CounterexampleData}
    (hminimal : D.Minimal) (F : FaithfulCarrierPattern D.A) :
    (system F).SupportMinimal := by
  classical
  intro T hTne hclosed
  let B : Finset ℝ² := T.image pointOf
  have hBne : B.Nonempty := by
    rcases hTne with ⟨label, hlabel⟩
    exact ⟨pointOf label, Finset.mem_image.mpr ⟨label, hlabel, rfl⟩⟩
  have hBA : B ⊆ D.A := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨label, _hlabel, rfl⟩
    exact label.2
  have hBclosed : ∀ center : ℝ², ∀ hcenter : center ∈ B,
      (F.classAt center (hBA hcenter)).support ⊆ B := by
    intro center hcenter z hz
    rcases Finset.mem_image.mp hcenter with
      ⟨centerLabel, hcenterLabel, rfl⟩
    let zLabel : CarrierLabel D.A :=
      ⟨z, (F.classAt centerLabel.1 (hBA hcenter)).support_subset_A hz⟩
    have hzRow : zLabel ∈ rowPattern F centerLabel := by
      apply (mem_rowPattern_iff F centerLabel zLabel).mpr
      simpa only using hz
    have hzT : zLabel ∈ T := hclosed hcenterLabel hzRow
    exact Finset.mem_image.mpr ⟨zLabel, hzT, rfl⟩
  have hBeq : B = D.A :=
    F.eq_carrier_of_nonempty_closed hminimal hBne hBA hBclosed
  apply Finset.eq_univ_of_forall
  intro label
  have hlabelB : label.1 ∈ B := by
    rw [hBeq]
    exact label.2
  rcases Finset.mem_image.mp hlabelB with
    ⟨source, hsource, hpoints⟩
  have hsources : source = label := Subtype.ext hpoints
  simpa [hsources] using hsource

/-- A minimal faithful carrier is strongly connected through its selected
row-membership edges. -/
theorem system_supportStronglyConnected {D : CounterexampleData}
    (hminimal : D.Minimal) (F : FaithfulCarrierPattern D.A) :
    (system F).SupportStronglyConnected :=
  AbstractRowSystem.supportStronglyConnected_of_supportMinimal
    (system F) (system_supportMinimal hminimal F)

end GeneralCarrierAbstractRowSystem
end Problem97
