import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# ATAIL relabeling adapters for the T1/T3 collision families
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRelabelScratch

private theorem support_eq_of_center_eq_l1
    {D : CounterexampleData} {source₁ source₂ : ℝ²}
    (R₁ : U1Depth5.CriticalRowPacket D source₁)
    (R₂ : U1Depth5.CriticalRowPacket D source₂)
    (hcenter : R₁.center = R₂.center)
    (hl1 : R₁.selected.l1 = R₂.selected.l1) :
    R₁.selected.toCriticalFourShell.support =
      R₂.selected.toCriticalFourShell.support := by
  have hradius :
      R₁.selected.toCriticalFourShell.radius =
        R₂.selected.toCriticalFourShell.radius := by
    calc
      R₁.selected.toCriticalFourShell.radius =
          dist R₁.center R₁.selected.l1 := R₁.selected.l1_dist.symm
      _ = dist R₂.center R₁.selected.l1 :=
        congrArg (fun center : ℝ² => dist center R₁.selected.l1) hcenter
      _ = dist R₂.center R₂.selected.l1 :=
        congrArg (fun z : ℝ² => dist R₂.center z) hl1
      _ = R₂.selected.toCriticalFourShell.radius := R₂.selected.l1_dist
  rw [R₁.selected.toCriticalFourShell.support_eq,
    R₂.selected.toCriticalFourShell.support_eq]
  ext z
  simp only [Finset.mem_filter]
  constructor
  · rintro ⟨hzA, hzdist⟩
    exact ⟨hzA, (congrArg (fun center : ℝ² => dist center z) hcenter).symm.trans
      (hzdist.trans hradius)⟩
  · rintro ⟨hzA, hzdist⟩
    exact ⟨hzA, (congrArg (fun center : ℝ² => dist center z) hcenter).trans
      (hzdist.trans hradius.symm)⟩

private def swap12Fixed
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    U3FixedTriplePacket D q p t2 t1 t3 where
  q_mem := P.q_mem
  p_mem := P.p_mem
  t1_mem := P.t2_mem
  t2_mem := P.t1_mem
  t3_mem := P.t3_mem
  t1_ne_t2 := P.t1_ne_t2.symm
  t1_ne_t3 := P.t2_ne_t3
  t2_ne_t3 := P.t1_ne_t3
  q_radius_pos := P.q_radius_pos
  t1_same_radius := P.t2_same_radius
  t2_same_radius := P.t1_same_radius
  t3_same_radius := P.t3_same_radius

private def swap12Rows
    {D : CounterexampleData} {q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) :
    U1Depth5.CriticalSourceRows D q t2 t1 t3 u where
  qRow := rows.qRow
  t1Row := rows.t2Row
  t2Row := rows.t1Row
  t3Row := rows.t3Row
  uRow := rows.uRow

private def swap12LiveData
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    U1LargeCapRouteBTailLiveData D p q t2 t1 t3 u where
  dangerous := by simpa [Finset.insert_comm] using H.dangerous
  exactQDeletedRadius := H.exactQDeletedRadius
  selected := by simpa [Finset.insert_comm] using H.selected

private theorem swap12Base
    {p q t1 t2 t3 u : ℝ²}
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u]) :
    List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t2, t1, t3, u] := by
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true] at hbase ⊢
  aesop

open U1LargeCapRouteBTailMetricResidualTarget in
/-- A sixth-row collision with `t1` reduces to the existing `t2` pair sink by
permuting the dangerous triple. -/
theorem false_of_center_p_t1_t20_via_pair
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) {i : Fin 3}
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hf2Center_eq_rowAt_center :
      ∀ source : U1Depth5.CriticalSource,
        rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          rows.sourcePoint source →
        f2CriticalRow.center = (rows.rowAt source).center)
    (hf2Selected_l1_eq_rowAt_l1 :
      ∀ source : U1Depth5.CriticalSource,
        rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          rows.sourcePoint source →
        f2CriticalRow.selected.l1 = (rows.rowAt source).selected.l1)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter_p : f2CriticalRow.center = p)
    (hsupport :
      f2CriticalRow.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²))
    (ht1_t20 :
      t1 = rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 }) :
    False := by
  let rows' := swap12Rows rows
  have hsource :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        rows.sourcePoint U1Depth5.CriticalSource.t1 := by
    simpa [U1Depth5.CriticalSourceRows.sourcePoint] using ht1_t20.symm
  have hcenter_t1 : rows.t1Row.center = p := by
    have h := hf2Center_eq_rowAt_center U1Depth5.CriticalSource.t1 hsource
    simpa [U1Depth5.CriticalSourceRows.rowAt] using h.symm.trans hcenter_p
  have hsupport_t1 :
      rows.t1Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²) := by
    have hsame := support_eq_of_center_eq_l1 f2CriticalRow rows.t1Row
      (hf2Center_eq_rowAt_center U1Depth5.CriticalSource.t1 hsource)
      (hf2Selected_l1_eq_rowAt_l1 U1Depth5.CriticalSource.t1 hsource)
    exact hsame.symm.trans hsupport
  apply false_of_largeCap_pCentered_t2Source_exactDangerousRow
    (p := p) MT hCirc CP i rows'
      hM hqCap hsurplus hqNonMoser hnotOppExact hNoM44 hcard hnoRem
      hcritical hlocalNoQFree (swap12Fixed hfixed) (swap12Base hbase)
      (swap12LiveData H)
  · simpa [rows', swap12Rows, U1Depth5.CriticalSourceRows.rowAt] using
      hcenter_t1
  · simpa [rows', swap12Rows, U1Depth5.CriticalSourceRows.rowAt,
      Finset.insert_comm] using hsupport_t1

private def swap23Fixed
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    U3FixedTriplePacket D q p t1 t3 t2 where
  q_mem := P.q_mem
  p_mem := P.p_mem
  t1_mem := P.t1_mem
  t2_mem := P.t3_mem
  t3_mem := P.t2_mem
  t1_ne_t2 := P.t1_ne_t3
  t1_ne_t3 := P.t1_ne_t2
  t2_ne_t3 := P.t2_ne_t3.symm
  q_radius_pos := P.q_radius_pos
  t1_same_radius := P.t1_same_radius
  t2_same_radius := P.t3_same_radius
  t3_same_radius := P.t2_same_radius

private def swap23Rows
    {D : CounterexampleData} {q t1 t2 t3 u : ℝ²}
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u) :
    U1Depth5.CriticalSourceRows D q t1 t3 t2 u where
  qRow := rows.qRow
  t1Row := rows.t1Row
  t2Row := rows.t3Row
  t3Row := rows.t2Row
  uRow := rows.uRow

private def swap23LiveData
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    U1LargeCapRouteBTailLiveData D p q t1 t3 t2 u where
  dangerous := by
    have hset :
        ({t1, t3, t2} : Finset ℝ²) = ({t1, t2, t3} : Finset ℝ²) := by
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
    simpa only [hset] using H.dangerous
  exactQDeletedRadius := H.exactQDeletedRadius
  selected := by
    have hset :
        ({t1, t3, t2} : Finset ℝ²) = ({t1, t2, t3} : Finset ℝ²) := by
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
    simpa only [hset] using H.selected

private theorem swap23Base
    {p q t1 t2 t3 u : ℝ²}
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u]) :
    List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t3, t2, u] := by
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true] at hbase ⊢
  aesop

open U1LargeCapRouteBTailMetricResidualTarget in
/-- A sixth-row collision with `t3` reduces to the existing `t2` pair sink by
permuting the dangerous triple. -/
theorem false_of_center_p_t3_t20_via_pair
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) {i : Fin 3}
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hf2Center_eq_rowAt_center :
      ∀ source : U1Depth5.CriticalSource,
        rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          rows.sourcePoint source →
        f2CriticalRow.center = (rows.rowAt source).center)
    (hf2Selected_l1_eq_rowAt_l1 :
      ∀ source : U1Depth5.CriticalSource,
        rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          rows.sourcePoint source →
        f2CriticalRow.selected.l1 = (rows.rowAt source).selected.l1)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter_p : f2CriticalRow.center = p)
    (hsupport :
      f2CriticalRow.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²))
    (ht3_t20 :
      t3 = rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 }) :
    False := by
  let rows' := swap23Rows rows
  have hsource :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        rows.sourcePoint U1Depth5.CriticalSource.t3 := by
    simpa [U1Depth5.CriticalSourceRows.sourcePoint] using ht3_t20.symm
  have hcenter_t3 : rows.t3Row.center = p := by
    have h := hf2Center_eq_rowAt_center U1Depth5.CriticalSource.t3 hsource
    simpa [U1Depth5.CriticalSourceRows.rowAt] using h.symm.trans hcenter_p
  have hsupport_t3 :
      rows.t3Row.selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²) := by
    have hsame := support_eq_of_center_eq_l1 f2CriticalRow rows.t3Row
      (hf2Center_eq_rowAt_center U1Depth5.CriticalSource.t3 hsource)
      (hf2Selected_l1_eq_rowAt_l1 U1Depth5.CriticalSource.t3 hsource)
    exact hsame.symm.trans hsupport
  apply false_of_largeCap_pCentered_t2Source_exactDangerousRow
    (p := p) MT hCirc CP i rows'
      hM hqCap hsurplus hqNonMoser hnotOppExact hNoM44 hcard hnoRem
      hcritical hlocalNoQFree (swap23Fixed hfixed) (swap23Base hbase)
      (swap23LiveData H)
  · simpa [rows', swap23Rows, U1Depth5.CriticalSourceRows.rowAt] using
      hcenter_t3
  · change rows.t3Row.selected.toCriticalFourShell.support =
      ({q, t1, t3, t2} : Finset ℝ²)
    have hset :
        ({q, t1, t3, t2} : Finset ℝ²) =
          ({q, t1, t2, t3} : Finset ℝ²) := by
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
    rw [hset]
    exact hsupport_t3

end ATailRelabelScratch
end Problem97
