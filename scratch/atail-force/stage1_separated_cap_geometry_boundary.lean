/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import stage1_common_cap_alignment_boundary
import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusGeneralM

/-!
# ATAIL Stage-I separated-cap geometry boundary

This module classifies the exact branch left by
`URowSeparatedCapPlacement` on the actual surplus-cap surface.  A separated
pair of carrier centers has only three geometric forms:

* both centers are strict interior points of two different indexed caps;
* `p` is the Moser vertex opposite the strict cap containing the `u`-row
  center; or
* the `u`-row center is the Moser vertex opposite the strict cap containing
  `p`.

The two-Moser-vertex case is impossible because any two Moser vertices share
an indexed closed cap.  In either endpoint form, if the facing cap has
cardinality four, the existing Moser-cap core selector and the *full* critical
radius filter force the opposite interior center into the endpoint row.  This
is the precise positive MEC/full-filter consequence currently available; it
does not by itself contradict the K-A-PAIR leaf.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILStageOneSeparatedCapGeometry

open U1Depth5
open ATAILStageOneCommonCap

/-- Both live centers occupy strict interiors of different indexed caps. -/
def URowDistinctInteriorCapPlacement
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ kp kc : Fin 3,
    p ∈ S.capInteriorByIndex kp ∧
    rows.uRow.center ∈ S.capInteriorByIndex kc ∧
    kp ≠ kc

/-- One center is the Moser endpoint opposite the strict cap containing the
other center.  These are exactly the endpoint forms compatible with failure
of common-cap alignment. -/
def URowOppositeEndpointCapPlacement
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  (∃ kc : Fin 3,
      rows.uRow.center ∈ S.capInteriorByIndex kc ∧
      p = S.oppositeVertexByIndex kc) ∨
    (∃ kp : Fin 3,
      p ∈ S.capInteriorByIndex kp ∧
      rows.uRow.center = S.oppositeVertexByIndex kp)

private theorem triangle_vertex_cases
    {A : Finset Plane} {S : SurplusCapPacket A} {x : Plane}
    (hx : x ∈ S.triangle.verts) :
    x = S.triangle.v1 ∨ x = S.triangle.v2 ∨ x = S.triangle.v3 := by
  simpa [MoserTriangle.verts] using hx

/-- The only Moser vertex outside an indexed cap is its opposite vertex. -/
theorem eq_oppositeVertexByIndex_of_mem_triangle_verts_of_not_mem_capByIndex
    {A : Finset Plane} (S : SurplusCapPacket A) (i : Fin 3) {x : Plane}
    (hxMoser : x ∈ S.triangle.verts)
    (hxOff : x ∉ S.capByIndex i) :
    x = S.oppositeVertexByIndex i := by
  rcases triangle_vertex_cases hxMoser with rfl | rfl | rfl <;>
    fin_cases i
  · rfl
  · exact False.elim (hxOff S.partition.v1_mem_C2)
  · exact False.elim (hxOff S.partition.v1_mem_C3)
  · exact False.elim (hxOff S.partition.v2_mem_C1)
  · rfl
  · exact False.elim (hxOff S.partition.v2_mem_C3)
  · exact False.elim (hxOff S.partition.v3_mem_C1)
  · exact False.elim (hxOff S.partition.v3_mem_C2)
  · rfl

/-- Any two (possibly equal) Moser vertices share an indexed closed cap. -/
theorem exists_common_capByIndex_of_mem_triangle_verts
    {A : Finset Plane} (S : SurplusCapPacket A) {x y : Plane}
    (hx : x ∈ S.triangle.verts) (hy : y ∈ S.triangle.verts) :
    ∃ k : Fin 3, x ∈ S.capByIndex k ∧ y ∈ S.capByIndex k := by
  rcases triangle_vertex_cases hx with rfl | rfl | rfl <;>
    rcases triangle_vertex_cases hy with rfl | rfl | rfl
  · exact ⟨1, S.partition.v1_mem_C2, S.partition.v1_mem_C2⟩
  · exact ⟨2, S.partition.v1_mem_C3, S.partition.v2_mem_C3⟩
  · exact ⟨1, S.partition.v1_mem_C2, S.partition.v3_mem_C2⟩
  · exact ⟨2, S.partition.v2_mem_C3, S.partition.v1_mem_C3⟩
  · exact ⟨0, S.partition.v2_mem_C1, S.partition.v2_mem_C1⟩
  · exact ⟨0, S.partition.v2_mem_C1, S.partition.v3_mem_C1⟩
  · exact ⟨1, S.partition.v3_mem_C2, S.partition.v1_mem_C2⟩
  · exact ⟨0, S.partition.v3_mem_C1, S.partition.v2_mem_C1⟩
  · exact ⟨0, S.partition.v3_mem_C1, S.partition.v3_mem_C1⟩

private theorem mem_interior_of_mem_cap_of_not_moser
    {A : Finset Plane} (S : SurplusCapPacket A) (i : Fin 3) {x : Plane}
    (hxCap : x ∈ S.capByIndex i)
    (hxNotMoser : x ∉ S.triangle.verts) :
    x ∈ S.capInteriorByIndex i := by
  apply S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer i hxCap
  · intro hx
    exact hxNotMoser (by
      simpa [hx] using S.rightOuterVertexByIndex_mem_triangle_verts i)
  · intro hx
    exact hxNotMoser (by
      simpa [hx] using S.leftOuterVertexByIndex_mem_triangle_verts i)

/-- Exact cap-geometric classification of the separated branch.  No row
incidence, cardinality, or solver abstraction is used. -/
theorem separatedCapPlacement_classification
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hsep : URowSeparatedCapPlacement S p q t1 t2 t3 u rows) :
    URowDistinctInteriorCapPlacement S p q t1 t2 t3 u rows ∨
      URowOppositeEndpointCapPlacement S p q t1 t2 t3 u rows := by
  classical
  rcases hsep with ⟨kp, kc, hpCap, hcCap, hnoCommon, _hkp_ne_kc⟩
  by_cases hpMoser : p ∈ S.triangle.verts
  · by_cases hcMoser : rows.uRow.center ∈ S.triangle.verts
    · rcases exists_common_capByIndex_of_mem_triangle_verts S hpMoser hcMoser with
        ⟨k, hp, hc⟩
      exact False.elim (hnoCommon k ⟨hp, hc⟩)
    · right
      left
      refine ⟨kc, mem_interior_of_mem_cap_of_not_moser S kc hcCap hcMoser, ?_⟩
      apply eq_oppositeVertexByIndex_of_mem_triangle_verts_of_not_mem_capByIndex
        S kc hpMoser
      intro hp
      exact hnoCommon kc ⟨hp, hcCap⟩
  · by_cases hcMoser : rows.uRow.center ∈ S.triangle.verts
    · right
      right
      refine ⟨kp, mem_interior_of_mem_cap_of_not_moser S kp hpCap hpMoser, ?_⟩
      apply eq_oppositeVertexByIndex_of_mem_triangle_verts_of_not_mem_capByIndex
        S kp hcMoser
      intro hc
      exact hnoCommon kp ⟨hpCap, hc⟩
    · left
      refine ⟨kp, kc,
        mem_interior_of_mem_cap_of_not_moser S kp hpCap hpMoser,
        mem_interior_of_mem_cap_of_not_moser S kc hcCap hcMoser, ?_⟩
      intro hkc
      subst kc
      exact hnoCommon kp ⟨hpCap, hcCap⟩

/-- If the dangerous center is the Moser vertex opposite a short cap and the
`u`-row center lies in that cap interior, the exact dangerous full-radius
filter contains the `u`-row center. -/
theorem uRow_center_mem_dangerous_of_p_opposite_shortCap
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A) (k : Fin 3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hcInterior : rows.uRow.center ∈ S.capInteriorByIndex k)
    (hpOpposite : p = S.oppositeVertexByIndex k)
    (hshort : (S.capByIndex k).card = 4) :
    rows.uRow.center ∈ ({q, t1, t2, t3} : Finset Plane) := by
  classical
  let shell := rows.t2Row.selected.toCriticalFourShell
  have hclassEq :
      shell.support = SelectedClass D.A p shell.radius := by
    simpa [shell, SelectedClass, hcenter] using shell.support_eq
  have hclassCard :
      4 ≤ (SelectedClass D.A (S.oppositeVertexByIndex k) shell.radius).card := by
    rw [← hpOpposite, ← hclassEq, shell.support_card]
  have hcore := S.moserCapCoreSelectorAt D.convex k shell.radius_pos
    hshort hclassCard
  have hcClass :
      rows.uRow.center ∈ SelectedClass D.A (S.oppositeVertexByIndex k) shell.radius :=
    hcore.2.1 hcInterior
  have hcSupport : rows.uRow.center ∈ shell.support := by
    rw [hclassEq]
    simpa [hpOpposite] using hcClass
  simpa [shell, hsupport] using hcSupport

/-- Symmetric endpoint consequence: if the `u`-row center is the Moser vertex
opposite a short cap containing `p` in its strict interior, the exact `u`-row
full-radius filter contains `p`. -/
theorem p_mem_uRow_support_of_uRow_center_opposite_shortCap
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A) (k : Fin 3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hpInterior : p ∈ S.capInteriorByIndex k)
    (hcOpposite : rows.uRow.center = S.oppositeVertexByIndex k)
    (hshort : (S.capByIndex k).card = 4) :
    p ∈ rows.uRow.selected.toCriticalFourShell.support := by
  classical
  let shell := rows.uRow.selected.toCriticalFourShell
  have hclassEq :
      shell.support = SelectedClass D.A rows.uRow.center shell.radius := by
    simpa [shell, SelectedClass] using shell.support_eq
  have hclassCard :
      4 ≤ (SelectedClass D.A (S.oppositeVertexByIndex k) shell.radius).card := by
    rw [← hcOpposite, ← hclassEq, shell.support_card]
  have hcore := S.moserCapCoreSelectorAt D.convex k shell.radius_pos
    hshort hclassCard
  have hpClass :
      p ∈ SelectedClass D.A (S.oppositeVertexByIndex k) shell.radius :=
    hcore.2.1 hpInterior
  rw [hclassEq]
  simpa [hcOpposite] using hpClass

private theorem capByIndex_card_ge_four
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3) :
    4 ≤ (S.capByIndex k).card := by
  obtain ⟨h1, h2, h3⟩ :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four
      S.partition D.convex S.hncol D.K4 S.circPacket
  fin_cases k
  · simpa [SurplusCapPacket.capByIndex] using h1
  · simpa [SurplusCapPacket.capByIndex] using h2
  · simpa [SurplusCapPacket.capByIndex] using h3

/-- The exact endpoint frontier after using all currently available cap lower
bounds and the short-cap full-filter selector. -/
def URowOppositeEndpointLargeOrCrossRowIncidence
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  (∃ k : Fin 3,
      rows.uRow.center ∈ S.capInteriorByIndex k ∧
      p = S.oppositeVertexByIndex k ∧
      (5 ≤ (S.capByIndex k).card ∨
        rows.uRow.center ∈ ({q, t1, t2, t3} : Finset Plane))) ∨
    (∃ k : Fin 3,
      p ∈ S.capInteriorByIndex k ∧
      rows.uRow.center = S.oppositeVertexByIndex k ∧
      (5 ≤ (S.capByIndex k).card ∨
        p ∈ rows.uRow.selected.toCriticalFourShell.support))

/-- On an opposite-endpoint branch, a facing cap is either large or the
short-cap selector gives the corresponding exact cross-row incidence. -/
theorem oppositeEndpoint_largeCap_or_crossRowIncidence
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hendpoint : URowOppositeEndpointCapPlacement S p q t1 t2 t3 u rows) :
    URowOppositeEndpointLargeOrCrossRowIncidence
      S p q t1 t2 t3 u rows := by
  rcases hendpoint with ⟨k, hcI, hpOpp⟩ | ⟨k, hpI, hcOpp⟩
  · left
    refine ⟨k, hcI, hpOpp, ?_⟩
    by_cases hlarge : 5 ≤ (S.capByIndex k).card
    · exact Or.inl hlarge
    · right
      have hcardLower : 4 ≤ (S.capByIndex k).card :=
        capByIndex_card_ge_four S k
      have hshort : (S.capByIndex k).card = 4 := by omega
      exact uRow_center_mem_dangerous_of_p_opposite_shortCap
        S k rows hcenter hsupport hcI hpOpp hshort
  · right
    refine ⟨k, hpI, hcOpp, ?_⟩
    by_cases hlarge : 5 ≤ (S.capByIndex k).card
    · exact Or.inl hlarge
    · right
      have hlower : 4 ≤ (S.capByIndex k).card := capByIndex_card_ge_four S k
      have hshort : (S.capByIndex k).card = 4 := by omega
      exact p_mem_uRow_support_of_uRow_center_opposite_shortCap
        S k rows hpI hcOpp hshort

/-- The cap-cardinality-free endpoint packet.  In either opposite-Moser
branch, the exact four-point row centered at the opposite vertex has two
distinct support points in the facing strict cap interior.  Those two points
are equidistant from the opposite center and have distinct distances from
each of the two outer Moser endpoints. -/
def URowOppositeEndpointInteriorPairFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  (∃ k : Fin 3, ∃ x y : Plane,
      rows.uRow.center ∈ S.capInteriorByIndex k ∧
      p = S.oppositeVertexByIndex k ∧
      x ≠ y ∧
      x ∈ ({q, t1, t2, t3} : Finset Plane) ∧
      y ∈ ({q, t1, t2, t3} : Finset Plane) ∧
      x ∈ S.capInteriorByIndex k ∧
      y ∈ S.capInteriorByIndex k ∧
      dist p x = dist p y ∧
      D.A.filter (fun z => dist p z = dist p x) =
        ({q, t1, t2, t3} : Finset Plane) ∧
      dist x (S.rightOuterVertexByIndex k) ≠
        dist y (S.rightOuterVertexByIndex k) ∧
      dist x (S.leftOuterVertexByIndex k) ≠
        dist y (S.leftOuterVertexByIndex k)) ∨
    (∃ k : Fin 3, ∃ x y : Plane,
      p ∈ S.capInteriorByIndex k ∧
      rows.uRow.center = S.oppositeVertexByIndex k ∧
      x ≠ y ∧
      x ∈ rows.uRow.selected.toCriticalFourShell.support ∧
      y ∈ rows.uRow.selected.toCriticalFourShell.support ∧
      x ∈ S.capInteriorByIndex k ∧
      y ∈ S.capInteriorByIndex k ∧
      dist rows.uRow.center x = dist rows.uRow.center y ∧
      D.A.filter (fun z =>
        dist rows.uRow.center z = dist rows.uRow.center x) =
          rows.uRow.selected.toCriticalFourShell.support ∧
      dist x (S.rightOuterVertexByIndex k) ≠
        dist y (S.rightOuterVertexByIndex k) ∧
      dist x (S.leftOuterVertexByIndex k) ≠
        dist y (S.leftOuterVertexByIndex k))

/-- The endpoint branch always yields the named interior pair above.  Unlike
`oppositeEndpoint_largeCap_or_crossRowIncidence`, this conclusion has no
large-cap escape. -/
theorem oppositeEndpoint_interiorPairFields
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hendpoint : URowOppositeEndpointCapPlacement S p q t1 t2 t3 u rows) :
    URowOppositeEndpointInteriorPairFields S p q t1 t2 t3 u rows := by
  classical
  rcases hendpoint with ⟨k, hcI, hpOpp⟩ | ⟨k, hpI, hcOpp⟩
  · left
    let shell := rows.t2Row.selected.toCriticalFourShell
    have hclassEq :
        shell.support =
          SelectedClass D.A (S.oppositeVertexByIndex k) shell.radius := by
      simpa [shell, SelectedClass, hcenter, hpOpp] using shell.support_eq
    have hclassCard :
        4 ≤ (SelectedClass D.A
          (S.oppositeVertexByIndex k) shell.radius).card := by
      rw [← hclassEq, shell.support_card]
    have htwo :
        2 ≤ (SelectedClass D.A
          (S.oppositeVertexByIndex k) shell.radius ∩
            S.capInteriorByIndex k).card :=
      S.selectedClass_capInteriorByIndex_card_ge_two
        D.convex k shell.radius_pos hclassCard
    rcases Finset.one_lt_card.mp (by omega :
        1 < (SelectedClass D.A
          (S.oppositeVertexByIndex k) shell.radius ∩
            S.capInteriorByIndex k).card) with
      ⟨x, hx, y, hy, hxy⟩
    have hxClass := (Finset.mem_inter.mp hx).1
    have hyClass := (Finset.mem_inter.mp hy).1
    have hxI := (Finset.mem_inter.mp hx).2
    have hyI := (Finset.mem_inter.mp hy).2
    have hxSupport : x ∈ shell.support := by simpa [hclassEq] using hxClass
    have hySupport : y ∈ shell.support := by simpa [hclassEq] using hyClass
    have hpxy : dist p x = dist p y := by
      have h := (shell.support_eq_radius x hxSupport).trans
        (shell.support_eq_radius y hySupport).symm
      simpa [shell, hcenter] using h
    have hxRadius : dist p x = shell.radius := by
      simpa [shell, hcenter] using shell.support_eq_radius x hxSupport
    have hExact :
        D.A.filter (fun z => dist p z = dist p x) =
          ({q, t1, t2, t3} : Finset Plane) := by
      rw [hxRadius]
      calc
        D.A.filter (fun z => dist p z = shell.radius) = shell.support := by
          simpa [shell, hcenter] using shell.support_eq.symm
        _ = ({q, t1, t2, t3} : Finset Plane) := by
          simpa [shell] using hsupport
    exact ⟨k, x, y, hcI, hpOpp, hxy,
      by simpa [shell, hsupport] using hxSupport,
      by simpa [shell, hsupport] using hySupport,
      hxI, hyI, hpxy, hExact,
      S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
        k hxI hyI hxy hxClass hyClass,
      S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
        k hxI hyI hxy hxClass hyClass⟩
  · right
    let shell := rows.uRow.selected.toCriticalFourShell
    have hclassEq :
        shell.support =
          SelectedClass D.A (S.oppositeVertexByIndex k) shell.radius := by
      simpa [shell, SelectedClass, hcOpp] using shell.support_eq
    have hclassCard :
        4 ≤ (SelectedClass D.A
          (S.oppositeVertexByIndex k) shell.radius).card := by
      rw [← hclassEq, shell.support_card]
    have htwo :
        2 ≤ (SelectedClass D.A
          (S.oppositeVertexByIndex k) shell.radius ∩
            S.capInteriorByIndex k).card :=
      S.selectedClass_capInteriorByIndex_card_ge_two
        D.convex k shell.radius_pos hclassCard
    rcases Finset.one_lt_card.mp (by omega :
        1 < (SelectedClass D.A
          (S.oppositeVertexByIndex k) shell.radius ∩
            S.capInteriorByIndex k).card) with
      ⟨x, hx, y, hy, hxy⟩
    have hxClass := (Finset.mem_inter.mp hx).1
    have hyClass := (Finset.mem_inter.mp hy).1
    have hxI := (Finset.mem_inter.mp hx).2
    have hyI := (Finset.mem_inter.mp hy).2
    have hxSupport : x ∈ shell.support := by simpa [hclassEq] using hxClass
    have hySupport : y ∈ shell.support := by simpa [hclassEq] using hyClass
    have hcxy : dist rows.uRow.center x = dist rows.uRow.center y :=
      (shell.support_eq_radius x hxSupport).trans
        (shell.support_eq_radius y hySupport).symm
    have hExact :
        D.A.filter (fun z =>
          dist rows.uRow.center z = dist rows.uRow.center x) =
            rows.uRow.selected.toCriticalFourShell.support := by
      rw [shell.support_eq_radius x hxSupport]
      exact shell.support_eq.symm
    exact ⟨k, x, y, hpI, hcOpp, hxy, hxSupport, hySupport,
      hxI, hyI, hcxy, hExact,
      S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
        k hxI hyI hxy hxClass hyClass,
      S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
        k hxI hyI hxy hxClass hyClass⟩

/-- Sharp separated-cap frontier with the cap-cardinality split removed. -/
theorem separatedCapPlacement_sharp_frontier
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hsep : URowSeparatedCapPlacement S p q t1 t2 t3 u rows) :
    URowDistinctInteriorCapPlacement S p q t1 t2 t3 u rows ∨
      URowOppositeEndpointInteriorPairFields S p q t1 t2 t3 u rows := by
  rcases separatedCapPlacement_classification S rows hsep with
    hinterior | hendpoint
  · exact Or.inl hinterior
  · exact Or.inr
      (oppositeEndpoint_interiorPairFields
        S rows hcenter hsupport hendpoint)

/-- Sharp separated-cap frontier after the cap combinatorics, global-K4 cap
lower bounds, and exact short-cap radius filters have all been consumed. -/
theorem separatedCapPlacement_geometry_frontier
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hsep : URowSeparatedCapPlacement S p q t1 t2 t3 u rows) :
    URowDistinctInteriorCapPlacement S p q t1 t2 t3 u rows ∨
      URowOppositeEndpointLargeOrCrossRowIncidence
        S p q t1 t2 t3 u rows := by
  rcases separatedCapPlacement_classification S rows hsep with
    hinterior | hendpoint
  · exact Or.inl hinterior
  · exact Or.inr
      (oppositeEndpoint_largeCap_or_crossRowIncidence
        S rows hcenter hsupport hendpoint)

/-- Adapter to the exact `leafSurplusPacket` used by K-A-PAIR. -/
theorem leaf_separatedCapPlacement_geometry_frontier
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    {hncol : ¬ Collinear ℝ (D.A : Set Plane)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hsep :
      let S := U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
        (D := D) MT hCirc CP i hM hsurplus
      URowSeparatedCapPlacement S p q t1 t2 t3 u rows) :
    let S := U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
      (D := D) MT hCirc CP i hM hsurplus
    URowDistinctInteriorCapPlacement S p q t1 t2 t3 u rows ∨
      URowOppositeEndpointLargeOrCrossRowIncidence
        S p q t1 t2 t3 u rows := by
  dsimp only at hsep ⊢
  exact separatedCapPlacement_geometry_frontier _ rows hcenter hsupport hsep

/-- Adapter exposing the stronger cap-cardinality-free frontier on the exact
`leafSurplusPacket` used by K-A-PAIR. -/
theorem leaf_separatedCapPlacement_sharp_frontier
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    {hncol : ¬ Collinear ℝ (D.A : Set Plane)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hsep :
      let S := U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
        (D := D) MT hCirc CP i hM hsurplus
      URowSeparatedCapPlacement S p q t1 t2 t3 u rows) :
    let S := U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
      (D := D) MT hCirc CP i hM hsurplus
    URowDistinctInteriorCapPlacement S p q t1 t2 t3 u rows ∨
      URowOppositeEndpointInteriorPairFields
        S p q t1 t2 t3 u rows := by
  dsimp only at hsep ⊢
  exact separatedCapPlacement_sharp_frontier _ rows hcenter hsupport hsep

/-- Final ALIGN adapter.  After the checked frontier reduction, new geometry
only has to exclude the distinct-interior packet and the cap-cardinality-free
endpoint interior-pair packet; all cap bookkeeping is complete. -/
theorem commonCapAlignment_of_geometry_frontier_exclusions
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter : rows.t2Row.center = p)
    (hsupport :
      rows.t2Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset Plane))
    (hinterior :
      URowDistinctInteriorCapPlacement S p q t1 t2 t3 u rows → False)
    (hendpoint :
      URowOppositeEndpointInteriorPairFields
        S p q t1 t2 t3 u rows → False) :
    URowCommonCapAlignment S p q t1 t2 t3 u rows := by
  rcases commonCapAlignment_or_separatedCapPlacement S hfixed rows with
    hcommon | hsep
  · exact hcommon
  · rcases separatedCapPlacement_sharp_frontier
      S rows hcenter hsupport hsep with hII | hEP
    · exact False.elim (hinterior hII)
    · exact False.elim (hendpoint hEP)

#print axioms separatedCapPlacement_classification
#print axioms uRow_center_mem_dangerous_of_p_opposite_shortCap
#print axioms p_mem_uRow_support_of_uRow_center_opposite_shortCap
#print axioms oppositeEndpoint_largeCap_or_crossRowIncidence
#print axioms oppositeEndpoint_interiorPairFields
#print axioms separatedCapPlacement_sharp_frontier
#print axioms separatedCapPlacement_geometry_frontier
#print axioms leaf_separatedCapPlacement_geometry_frontier
#print axioms leaf_separatedCapPlacement_sharp_frontier
#print axioms commonCapAlignment_of_geometry_frontier_exclusions

end ATAILStageOneSeparatedCapGeometry
end Problem97
