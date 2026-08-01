/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3ClauseFamilySemantics
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3LocalFourGeometry

/-!
# Semantic cores for the exact-eleven G3 U5 clause families

These theorems isolate the geometry used by the two U5 clause families from
their finite, generator-ordered occurrence decoder.  The downstream decoder
only has to identify the relevant source choice, mask bits, deleted-pair
atoms, local-four row, and global-equality atoms.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554

attribute [local instance] Classical.propDecidable

/-- The deleted-pair semantic atom is symmetric in its two required support
points.  The generator stores those points in canonical sorted order. -/
theorem CanonicalPacket.qDeletedPairHolds_swap
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (q c a b : Label) :
    P.qDeletedPairHolds ⟨q, c, a, b⟩ ↔
      P.qDeletedPairHolds ⟨q, c, b, a⟩ := by
  constructor <;>
    rintro ⟨row, hr, hc, hq, ha, hb, hlocal⟩
  · exact ⟨row, hr, hc, hq, hb, ha, hlocal⟩
  · exact ⟨row, hr, hc, hq, hb, ha, hlocal⟩

/-- A canonical global-equality row whose two edges share a center has the
expected metric meaning, independently of both sorting decisions. -/
theorem CanonicalPacket.globalEqHolds_canonicalStar_iff
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (c a b : Label) :
    P.globalEqHolds
        (canonicalGlobalRow (canonicalEdge c a) (canonicalEdge c b)) ↔
      dist (L.pointOf c) (L.pointOf a) =
        dist (L.pointOf c) (L.pointOf b) := by
  simp only [CanonicalPacket.globalEqHolds, canonicalGlobalRow,
    canonicalEdge]
  split <;> split <;> split <;> simp [dist_comm, eq_comm]

/-- Equal distance from one reference support point to every point in a
decoded four-row establishes the row atom. -/
theorem CanonicalPacket.localFourHolds_of_common_reference
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : LocalFourRow) (reference : Label)
    (hrow : row ∈ encoderLocalFourRows)
    (hcommon : ∀ z ∈ row.support,
      dist (L.pointOf row.center) (L.pointOf reference) =
        dist (L.pointOf row.center) (L.pointOf z)) :
    P.localFourHolds row := by
  have hanchor : row.support.getD 0 0 ∈ row.support := by
    cases hs : row.support with
    | nil =>
        have hlength := encoderLocalFourRows_support_length hrow
        simp [hs] at hlength
    | cons first rest =>
        simp
  intro z hz
  exact (hcommon _ hanchor).symm.trans (hcommon z hz)

/-- Semantic contradiction behind the compact
`nontriple_equilateral_on_p_circle` G3 clauses. -/
theorem CanonicalPacket.u5NontripleChoice_incompatible
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame} {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source p t x : Label) (choice : SourceChoiceIndex source)
    (hp : (sourceChoiceAt source choice).1 = p)
    (hchoice : P.sourceChoiceHolds shadow source choice)
    (ht : t ∈ P.cube.cube p) (hx : x ∉ P.cube.cube p)
    (hpairT : P.qDeletedPairHolds
      { deleted := source, center := t, first := p, second := x })
    (hpairX : P.qDeletedPairHolds
      { deleted := source, center := x, first := p, second := t }) :
    False := by
  have hcenter : shadow.centerOf source = p := hchoice.1.trans hp
  have hsource : source ∈ P.cube.cube p := by
    simpa [hcenter] using shadow.source_mem_cube source
  have hused : P.usedCenterHolds shadow p := ⟨source, hcenter⟩
  have hexact := P.exactAt_usedCenter shadow p hused
  have ht_radius :
      dist (L.pointOf p) (L.pointOf t) =
        dist (L.pointOf p) (L.pointOf source) :=
    P.localEqHolds_of_mem_cube ⟨p, t, source⟩ ht hsource
  have hx_off :
      dist (L.pointOf p) (L.pointOf x) ≠
        dist (L.pointOf p) (L.pointOf source) := by
    intro h
    exact (P.not_localEqHolds_of_exactAt
      ⟨p, source, x⟩ hexact hsource hx) h.symm
  rcases P.qDeletedPairHolds_to_u5QDeletedK4Class_row
      ⟨source, t, p, x⟩ hpairT with
    ⟨Bt, ⟨Kt⟩, hpBt, hxBt⟩
  rcases P.qDeletedPairHolds_to_u5QDeletedK4Class_row
      ⟨source, x, p, t⟩ hpairX with
    ⟨Bx, ⟨Kx⟩, hpBx, htBx⟩
  exact u5_nontriple_equilateral_on_p_circle_incompatibility
    ht_radius hx_off Kt Kx hpBt hxBt hpBx htBx

/-- Semantic contradiction behind the `common_bisector_triple` G3 clauses. -/
theorem CanonicalPacket.u5CommonBisectorChoice_incompatible
    {D : CounterexampleData} {M : MoserTriangle D.A}
    {CP : CapTriple D.A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame} {H : CriticalShellSystem D.A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source p x t1 t2 t3 : Label) (choice : SourceChoiceIndex source)
    (hp : (sourceChoiceAt source choice).1 = p)
    (hchoice : P.sourceChoiceHolds shadow source choice)
    (ht1 : t1 ∈ P.cube.cube p) (ht2 : t2 ∈ P.cube.cube p)
    (ht3 : t3 ∈ P.cube.cube p)
    (ht12 : t1 ≠ t2) (ht13 : t1 ≠ t3) (ht23 : t2 ≠ t3)
    (row : LocalFourRow) (hrow : row ∈ encoderLocalFourRows)
    (hcenterRow : row.center = x)
    (hsourceRow : source ∉ row.support)
    (hpRow : p ∈ row.support)
    (ht1Row : t1 ∈ row.support) (ht2Row : t2 ∈ row.support)
    (ht3Row : t3 ∈ row.support)
    (hexhaust : ∀ z ∈ row.support,
      z = p ∨ z = t1 ∨ z = t2 ∨ z = t3)
    (heq1 : P.globalEqHolds
      (canonicalGlobalRow (canonicalEdge x p) (canonicalEdge x t1)))
    (heq2 : P.globalEqHolds
      (canonicalGlobalRow (canonicalEdge x p) (canonicalEdge x t2)))
    (heq3 : P.globalEqHolds
      (canonicalGlobalRow (canonicalEdge x p) (canonicalEdge x t3))) :
    False := by
  have hcenter : shadow.centerOf source = p := hchoice.1.trans hp
  have hsource : source ∈ P.cube.cube p := by
    simpa [hcenter] using shadow.source_mem_cube source
  have hp_ne_source : p ≠ source := by
    intro h
    subst source
    exact P.cube.center_not_mem_cube p hsource
  have hr_pos :
      0 < dist (L.pointOf p) (L.pointOf source) :=
    dist_pos.mpr (L.injective.ne hp_ne_source)
  have h1 := (P.globalEqHolds_canonicalStar_iff x p t1).mp heq1
  have h2 := (P.globalEqHolds_canonicalStar_iff x p t2).mp heq2
  have h3 := (P.globalEqHolds_canonicalStar_iff x p t3).mp heq3
  have hcommon : ∀ z ∈ row.support,
      dist (L.pointOf row.center) (L.pointOf p) =
        dist (L.pointOf row.center) (L.pointOf z) := by
    intro z hz
    rcases hexhaust z hz with rfl | rfl | rfl | rfl
    · rfl
    · simpa [hcenterRow] using h1
    · simpa [hcenterRow] using h2
    · simpa [hcenterRow] using h3
  have hlocal :=
    P.localFourHolds_of_common_reference row p hrow hcommon
  rcases P.localFourHolds_to_u5QDeletedK4Class
      row source hrow hsourceRow hlocal with
    ⟨Bx, ⟨Kx⟩, hmem⟩
  have Kx' : U5QDeletedK4Class D
      (L.pointOf source) (L.pointOf x) Bx := by
    simpa [hcenterRow] using Kx
  have ht1_radius :=
    P.localEqHolds_of_mem_cube ⟨p, t1, source⟩ ht1 hsource
  have ht2_radius :=
    P.localEqHolds_of_mem_cube ⟨p, t2, source⟩ ht2 hsource
  have ht3_radius :=
    P.localEqHolds_of_mem_cube ⟨p, t3, source⟩ ht3 hsource
  have hnoncol :
      ¬ Collinear ℝ
        ({L.pointOf t1, L.pointOf t2, L.pointOf t3} : Set ℝ²) := by
    intro hcol
    exact D.convex.not_three_collinear
      (L.mem_carrier t1) (L.mem_carrier t2) (L.mem_carrier t3)
      (L.injective.ne ht12) (L.injective.ne ht13)
      (L.injective.ne ht23) hcol
  exact u5_common_bisector_triple_incompatibility
    hr_pos hnoncol ht1_radius ht2_radius ht3_radius Kx'
    (hmem p hpRow) (hmem t1 ht1Row) (hmem t2 ht2Row) (hmem t3 ht3Row)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.qDeletedPairHolds_swap
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.globalEqHolds_canonicalStar_iff
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.localFourHolds_of_common_reference
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.u5NontripleChoice_incompatible
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.u5CommonBisectorChoice_incompatible
