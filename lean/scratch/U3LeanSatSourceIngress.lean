import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceClosure

/-!
# Lean-owned finite ingress for the U3 exact-radius obstruction

This file is an adapter boundary, not a closure theorem.  It replaces the
ambient finite carrier by `Fin A.card` and carries only the named incidence
sets which a SAT backend can inspect.  The point map and every exported set
are constructed from the source `Finset` data; no synthetic class table is
introduced here.
-/

open scoped EuclideanGeometry

namespace Problem97

/- ## Canonical finite indexing of a carrier -/

noncomputable def carrierPoint (A : Finset ℝ²) : Fin A.card → ℝ² :=
  fun i => ((Finset.equivFinOfCardEq rfl).symm i).1

noncomputable def carrierIndex {A : Finset ℝ²} (x : ℝ²) (hx : x ∈ A) :
    Fin A.card :=
  Finset.equivFinOfCardEq rfl ⟨x, hx⟩

theorem carrierPoint_index {A : Finset ℝ²} {x : ℝ²} (hx : x ∈ A) :
    carrierPoint A (carrierIndex x hx) = x := by
  simp [carrierPoint, carrierIndex]

theorem carrierIndex_injective {A : Finset ℝ²} {x y : ℝ²}
    (hx : x ∈ A) (hy : y ∈ A)
    (hxy : carrierIndex x hx = carrierIndex y hy) : x = y := by
  calc
    x = carrierPoint A (carrierIndex x hx) := (carrierPoint_index hx).symm
    _ = carrierPoint A (carrierIndex y hy) := congrArg (carrierPoint A) hxy
    _ = y := carrierPoint_index hy

noncomputable def indexSet (A S : Finset ℝ²) (hS : S ⊆ A) :
    Finset (Fin A.card) :=
  S.attach.image (fun y => carrierIndex y.1 (hS y.2))

theorem indexSet_card {A S : Finset ℝ²} (hS : S ⊆ A) :
    (indexSet A S hS).card = S.card := by
  classical
  let f : {x // x ∈ S} → Fin A.card :=
    fun y => carrierIndex y.1 (hS y.2)
  have hf : Function.Injective f := by
    intro x y hxy
    apply Subtype.ext
    exact carrierIndex_injective (hS x.2) (hS y.2) hxy
  simpa [indexSet, f] using
    (Finset.card_image_of_injective S.attach hf).trans
      Finset.card_attach

theorem mem_indexSet_of_mem {A S : Finset ℝ²} (hS : S ⊆ A)
  {x : ℝ²} (hx : x ∈ A) (hxs : x ∈ S) :
    carrierIndex x hx ∈ indexSet A S hS := by
  rw [indexSet]
  apply Finset.mem_image.mpr
  refine ⟨⟨x, hxs⟩, ?_, ?_⟩
  · simp
  · rfl

theorem mem_of_mem_indexSet {A S : Finset ℝ²} (hS : S ⊆ A)
    {x : ℝ²} (hx : x ∈ A)
    (hxi : carrierIndex x hx ∈ indexSet A S hS) : x ∈ S := by
  rcases Finset.mem_image.mp hxi with ⟨y, hy, hxy⟩
  have hyS : y.1 ∈ S := y.2
  have hpoint : y.1 = x :=
    carrierIndex_injective (hS hyS) hx hxy
  simpa [hpoint] using hyS

theorem mem_indexSet_iff {A S : Finset ℝ²} (hS : S ⊆ A)
    {i : Fin A.card} :
    i ∈ indexSet A S hS ↔ carrierPoint A i ∈ S := by
  constructor
  · intro hi
    change i ∈ S.attach.image (fun y => carrierIndex y.1 (hS y.2)) at hi
    rcases Finset.mem_image.mp hi with ⟨y, hy, hyi⟩
    have hyS : y.1 ∈ S := y.2
    have hpoint : y.1 = carrierPoint A i := by
      have h := congrArg (carrierPoint A) hyi
      simpa [carrierPoint_index (hS hyS)] using h
    simpa [hpoint] using hyS
  · intro hi
    have hA : carrierPoint A i ∈ A :=
      ((Finset.equivFinOfCardEq rfl).symm i).2
    have hidx : carrierIndex (carrierPoint A i) hA = i := by
      simp [carrierIndex, carrierPoint]
    simpa [hidx] using mem_indexSet_of_mem hS hA hi

private theorem indexSet_inter_eq
    {A S T : Finset ℝ²} (hS : S ⊆ A) (hT : T ⊆ A) :
    indexSet A (S ∩ T) (by intro y hy; exact hS (Finset.mem_inter.mp hy).1) =
      indexSet A S hS ∩ indexSet A T hT := by
  ext i
  simp only [Finset.mem_inter]
  rw [mem_indexSet_iff (fun y hy => hS (Finset.mem_inter.mp hy).1),
    mem_indexSet_iff hS, mem_indexSet_iff hT]
  simp only [Finset.mem_inter]

private theorem indexSet_sdiff_eq
    {A S T : Finset ℝ²} (hS : S ⊆ A) (hT : T ⊆ A) :
    indexSet A (S \ T) (by intro y hy; exact hS (Finset.mem_sdiff.mp hy).1) =
      indexSet A S hS \ indexSet A T hT := by
  ext i
  simp only [Finset.mem_sdiff]
  rw [mem_indexSet_iff (fun y hy => hS (Finset.mem_sdiff.mp hy).1),
    mem_indexSet_iff hS, mem_indexSet_iff hT]
  simp only [Finset.mem_sdiff]

private theorem indexSet_inter_card
    {A S T : Finset ℝ²} (hS : S ⊆ A) (hT : T ⊆ A) :
    (indexSet A S hS ∩ indexSet A T hT).card = (S ∩ T).card := by
  rw [← indexSet_inter_eq hS hT, indexSet_card]

private theorem indexSet_sdiff_card
    {A S T : Finset ℝ²} (hS : S ⊆ A) (hT : T ⊆ A) :
    (indexSet A S hS \ indexSet A T hT).card = (S \ T).card := by
  rw [← indexSet_sdiff_eq hS hT, indexSet_card]

/- ## The finite row payload -/

inductive U3FiniteEscapeRow (n : ℕ) (q : Fin n) where
  | qDeleted (support : Finset (Fin n))
      (support_card : support.card = 4)
      (q_not_mem : q ∉ support)
  | criticalShell (support : Finset (Fin n))
      (support_card : support.card = 4)
      (q_mem : q ∈ support)

namespace U3FiniteEscapeRow

def support {n : ℕ} {q : Fin n} : U3FiniteEscapeRow n q → Finset (Fin n)
  | .qDeleted B _ _ => B
  | .criticalShell K _ _ => K

theorem support_card {n : ℕ} {q : Fin n}
    (R : U3FiniteEscapeRow n q) : R.support.card = 4 := by
  cases R <;> simp [support, *]

end U3FiniteEscapeRow

/-- A finite projection of one exact-radius U3 escape.  `dangerous` and
`bounded` are source-built sets, while `row` preserves whether the source row
was q-deleted or an ambient critical shell. -/
structure U3FiniteEscapePacket (A : Finset ℝ²) where
  point : Fin A.card → ℝ²
  point_injective : Function.Injective point
  point_image : Finset.univ.image point = A
  q : Fin A.card
  p : Fin A.card
  t1 : Fin A.card
  t2 : Fin A.card
  t3 : Fin A.card
  u : Fin A.card
  a0 : Fin A.card
  a1 : Fin A.card
  x : Fin A.card
  z : Fin A.card
  dangerous : Finset (Fin A.card)
  dangerous_card : dangerous.card = 4
  exact_radius : Finset (Fin A.card)
  exact_radius_card : exact_radius.card = 3
  bounded : Finset (Fin A.card)
  row : U3FiniteEscapeRow A.card q
  row_inter_dangerous_card_le_two :
    (row.support ∩ dangerous).card ≤ 2
  row_sdiff_dangerous_card_ge_two :
    2 ≤ (row.support \ dangerous).card
  z_mem_row : z ∈ row.support
  z_not_mem_bounded : z ∉ bounded

/- The critical-shell arm has no escaping point in the source packet, so it
has a separate finite record rather than an invented optional witness. -/
structure U3FiniteCriticalShellPacket (A : Finset ℝ²) where
  point : Fin A.card → ℝ²
  point_injective : Function.Injective point
  point_image : Finset.univ.image point = A
  q : Fin A.card
  p : Fin A.card
  t1 : Fin A.card
  t2 : Fin A.card
  t3 : Fin A.card
  u : Fin A.card
  a0 : Fin A.card
  a1 : Fin A.card
  x : Fin A.card
  dangerous : Finset (Fin A.card)
  dangerous_card : dangerous.card = 4
  exact_radius : Finset (Fin A.card)
  exact_radius_card : exact_radius.card = 3
  bounded : Finset (Fin A.card)
  row : U3FiniteEscapeRow A.card q
  row_inter_dangerous_card_le_two :
    (row.support ∩ dangerous).card ≤ 2
  row_sdiff_dangerous_card_ge_two :
    2 ≤ (row.support \ dangerous).card

namespace U3FiniteEscapePacket

noncomputable def dangerousSet (A : Finset ℝ²) (q p t1 t2 t3 : ℝ²)
    (h : insert q ({t1, t2, t3} : Finset ℝ²) ⊆ A) :
    Finset (Fin A.card) :=
  indexSet A (insert q ({t1, t2, t3} : Finset ℝ²)) h

noncomputable def exactRadiusSet (A : Finset ℝ²) (S : Finset ℝ²)
    (hS : S ⊆ A) : Finset (Fin A.card) :=
  indexSet A S hS

noncomputable def boundedSet (A : Finset ℝ²) (S : Finset ℝ²)
    (hS : S ⊆ A) : Finset (Fin A.card) :=
  indexSet A S hS

end U3FiniteEscapePacket

/- ## Source extraction helpers -/

private theorem mem_A_of_mem_skeleton {D : CounterexampleData} {q x : ℝ²}
    (hx : x ∈ D.skeleton q) : x ∈ D.A := by
  simpa [CounterexampleData.skeleton] using (Finset.mem_of_mem_erase hx)

private theorem dangerous_subset_A
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) :
    insert q ({t1, t2, t3} : Finset ℝ²) ⊆ D.A := by
  intro y hy
  simp only [Finset.mem_insert, Finset.mem_singleton] at hy
  rcases hy with rfl | rfl | rfl | rfl
  · exact H.dangerous.q_mem
  · exact mem_A_of_mem_skeleton (Finset.mem_erase.mp
      (H.dangerous.T_subset (by simp))).2
  · exact mem_A_of_mem_skeleton (Finset.mem_erase.mp
      (H.dangerous.T_subset (by simp))).2
  · exact mem_A_of_mem_skeleton (Finset.mem_erase.mp
      (H.dangerous.T_subset (by simp))).2

private theorem bounded_subset_A
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) :
    U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ⊆ D.A := by
  intro y hy
  simp only [U5BoundedSupport, Finset.mem_insert, Finset.mem_singleton] at hy
  rcases hy with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact H.dangerous.p_mem
  · exact H.dangerous.q_mem
  · exact mem_A_of_mem_skeleton (Finset.mem_erase.mp H.selected.candidate_mem).2
  · exact mem_A_of_mem_skeleton (Finset.mem_erase.mp H.a0_mem).2
  · exact mem_A_of_mem_skeleton (Finset.mem_erase.mp H.a1_mem).2
  · exact mem_A_of_mem_skeleton (Finset.mem_erase.mp
      (H.dangerous.T_subset (by simp))).2
  · exact mem_A_of_mem_skeleton (Finset.mem_erase.mp
      (H.dangerous.T_subset (by simp))).2
  · exact mem_A_of_mem_skeleton (Finset.mem_erase.mp
      (H.dangerous.T_subset (by simp))).2

private theorem exact_radius_subset_A
    {D : CounterexampleData} {q p : ℝ²} :
    ((D.skeleton q).erase p).filter (fun y => dist p y = dist p q) ⊆ D.A := by
  intro y hy
  exact mem_A_of_mem_skeleton (Finset.mem_erase.mp
    (Finset.mem_filter.mp hy).1).2

/- ## q-deleted source arm -/

theorem U3FixedTripleAuditFrame.toFiniteQDeletedEscapePacket
    {D : CounterexampleData} {q p t1 t2 t3 x z : ℝ²}
    {B : Finset ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hx : x ∈ U5BoundedAuditCenters D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1)
    (K : U5QDeletedK4Class D q x B)
    (hBcard : B.card = 4)
    (hzB : z ∈ B)
    (hzOutside : z ∉ U5BoundedSupport D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1)
    (hexact : (((D.skeleton q).erase p).filter
      (fun y => dist p y = dist p q)).card = 3) :
    Nonempty (U3FiniteEscapePacket D.A) := by
  classical
  let hDangerous := dangerous_subset_A H
  let dangerous := indexSet D.A
    (insert q ({t1, t2, t3} : Finset ℝ²)) hDangerous
  let hExact := exact_radius_subset_A (D := D) (q := q) (p := p)
  let exactRadius := indexSet D.A
    (((D.skeleton q).erase p).filter (fun y => dist p y = dist p q)) hExact
  let hBounded := bounded_subset_A H
  let bounded := indexSet D.A
    (U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1)
    hBounded
  let hBsubset : B ⊆ D.A := fun y hy => mem_A_of_mem_skeleton
    (Finset.mem_erase.mp (K.subset hy)).2
  let row := indexSet D.A B hBsubset
  let iq := carrierIndex q H.dangerous.q_mem
  let ip := carrierIndex p H.dangerous.p_mem
  let it1 := carrierIndex t1 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp (H.dangerous.T_subset (by simp))).2)
  let it2 := carrierIndex t2 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp (H.dangerous.T_subset (by simp))).2)
  let it3 := carrierIndex t3 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp (H.dangerous.T_subset (by simp))).2)
  let iu := carrierIndex H.u (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp H.selected.candidate_mem).2)
  let ia0 := carrierIndex H.a0 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp H.a0_mem).2)
  let ia1 := carrierIndex H.a1 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp H.a1_mem).2)
  let ix := carrierIndex x (mem_A_of_mem_skeleton
    (H.dangerous.audit_center_mem_skeleton H.selected H.a0_mem H.a1_mem hx))
  let iz := carrierIndex z (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp (K.subset hzB)).2)
  have hqnot : q ∉ ({t1, t2, t3} : Finset ℝ²) := by
    intro hqT
    have hqT' := H.dangerous.T_subset hqT
    have hqSkel : q ∈ D.skeleton q := (Finset.mem_erase.mp hqT').2
    have hqErase : q ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using hqSkel
    exact (Finset.mem_erase.mp hqErase).1 rfl
  have hDangerousCard :
      (insert q ({t1, t2, t3} : Finset ℝ²)).card = 4 := by
    rw [Finset.card_insert_of_notMem hqnot]
    simpa using H.dangerous.T_card
  have hdangerous_card : dangerous.card = 4 := by
    simpa [dangerous] using indexSet_card hDangerous
      |>.trans hDangerousCard
  have hexact_card : exactRadius.card = 3 := by
    simpa [exactRadius] using indexSet_card hExact |>.trans hexact
  have hrow_card : row.card = 4 := by
    simpa [row] using indexSet_card hBsubset
      |>.trans hBcard
  have hrowDist := H.qDeletedRow_dangerousCircle_distribution hx K hBcard
  have hrowInter : (row ∩ dangerous).card =
      (B ∩ insert q ({t1, t2, t3} : Finset ℝ²)).card := by
    simpa [row, dangerous] using indexSet_inter_card hBsubset hDangerous
  have hrowDiff : (row \ dangerous).card =
      (B \ insert q ({t1, t2, t3} : Finset ℝ²)).card := by
    simpa [row, dangerous] using indexSet_sdiff_card hBsubset hDangerous
  have hzrow : iz ∈ row := by
    exact mem_indexSet_of_mem
      (fun y hy => mem_A_of_mem_skeleton (Finset.mem_erase.mp (K.subset hy)).2)
      (mem_A_of_mem_skeleton (Finset.mem_erase.mp (K.subset hzB)).2) hzB
  have hzbounded : iz ∉ bounded := by
    intro hz
    apply hzOutside
    exact mem_of_mem_indexSet hBounded
      (mem_A_of_mem_skeleton (Finset.mem_erase.mp (K.subset hzB)).2) hz
  refine ⟨{
    point := carrierPoint D.A
    point_injective := by
      intro i j h
      exact (Finset.equivFinOfCardEq rfl).symm.injective
        (by simpa [carrierPoint] using h)
    point_image := by
      apply Finset.ext
      intro y
      constructor
      · intro hy
        rcases Finset.mem_image.mp hy with ⟨i, _hi, hiy⟩
        have hmem : ((Finset.equivFinOfCardEq rfl).symm i).1 ∈ D.A :=
          ((Finset.equivFinOfCardEq rfl).symm i).2
        rw [← hiy]
        exact hmem
      · intro hy
        let i := Finset.equivFinOfCardEq rfl ⟨y, hy⟩
        refine Finset.mem_image.mpr ⟨i, Finset.mem_univ _, ?_⟩
        simp [carrierPoint, i]
    q := iq
    p := ip
    t1 := it1
    t2 := it2
    t3 := it3
    u := iu
    a0 := ia0
    a1 := ia1
    x := ix
    z := iz
    dangerous := dangerous
    dangerous_card := hdangerous_card
    exact_radius := exactRadius
    exact_radius_card := hexact_card
    bounded := bounded
    row := .qDeleted row hrow_card (by
      intro hqrow
      have hqB : q ∈ B := mem_of_mem_indexSet
        hBsubset
        H.dangerous.q_mem hqrow
      exact K.q_not_mem hqB)
    row_inter_dangerous_card_le_two := by
      change (row ∩ dangerous).card ≤ 2
      rw [hrowInter]
      exact hrowDist.1
    row_sdiff_dangerous_card_ge_two := by
      change 2 ≤ (row \ dangerous).card
      rw [hrowDiff]
      exact hrowDist.2
    z_mem_row := hzrow
    z_not_mem_bounded := hzbounded }⟩

theorem U3FixedTripleAuditFrame.toFiniteCriticalShellPacket
    {D : CounterexampleData} {q p t1 t2 t3 x : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hx : x ∈ U5BoundedAuditCenters D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1)
    (K : CriticalFourShell D.A q x)
    (hexact : (((D.skeleton q).erase p).filter
      (fun y => dist p y = dist p q)).card = 3) :
    Nonempty (U3FiniteCriticalShellPacket D.A) := by
  classical
  let hDangerous := dangerous_subset_A H
  let dangerous := indexSet D.A
    (insert q ({t1, t2, t3} : Finset ℝ²)) hDangerous
  let hExact := exact_radius_subset_A (D := D) (q := q) (p := p)
  let exactRadius := indexSet D.A
    (((D.skeleton q).erase p).filter (fun y => dist p y = dist p q)) hExact
  let hBounded := bounded_subset_A H
  let bounded := indexSet D.A
    (U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1)
    hBounded
  let hKsubset : K.support ⊆ D.A := K.support_subset_A
  let row := indexSet D.A K.support hKsubset
  let iq := carrierIndex q H.dangerous.q_mem
  let ip := carrierIndex p H.dangerous.p_mem
  let it1 := carrierIndex t1 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp (H.dangerous.T_subset (by simp))).2)
  let it2 := carrierIndex t2 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp (H.dangerous.T_subset (by simp))).2)
  let it3 := carrierIndex t3 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp (H.dangerous.T_subset (by simp))).2)
  let iu := carrierIndex H.u (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp H.selected.candidate_mem).2)
  let ia0 := carrierIndex H.a0 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp H.a0_mem).2)
  let ia1 := carrierIndex H.a1 (mem_A_of_mem_skeleton
    (Finset.mem_erase.mp H.a1_mem).2)
  let ix := carrierIndex x (mem_A_of_mem_skeleton
    (H.dangerous.audit_center_mem_skeleton H.selected H.a0_mem H.a1_mem hx))
  have hqnot : q ∉ ({t1, t2, t3} : Finset ℝ²) := by
    intro hqT
    have hqT' := H.dangerous.T_subset hqT
    have hqSkel : q ∈ D.skeleton q := (Finset.mem_erase.mp hqT').2
    have hqErase : q ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using hqSkel
    exact (Finset.mem_erase.mp hqErase).1 rfl
  have hDangerousCard :
      (insert q ({t1, t2, t3} : Finset ℝ²)).card = 4 := by
    rw [Finset.card_insert_of_notMem hqnot]
    simpa using H.dangerous.T_card
  have hdangerous_card : dangerous.card = 4 := by
    simpa [dangerous] using indexSet_card hDangerous |>.trans hDangerousCard
  have hexact_card : exactRadius.card = 3 := by
    simpa [exactRadius] using indexSet_card hExact |>.trans hexact
  have hrow_card : row.card = 4 := by
    simpa [row] using indexSet_card hKsubset |>.trans K.support_card
  have hrowDist := H.criticalFourShell_dangerousCircle_distribution hx K
  have hrowInter : (row ∩ dangerous).card =
      (K.support ∩ insert q ({t1, t2, t3} : Finset ℝ²)).card := by
    simpa [row, dangerous] using indexSet_inter_card hKsubset hDangerous
  have hrowDiff : (row \ dangerous).card =
      (K.support \ insert q ({t1, t2, t3} : Finset ℝ²)).card := by
    simpa [row, dangerous] using indexSet_sdiff_card hKsubset hDangerous
  refine ⟨{
    point := carrierPoint D.A
    point_injective := by
      intro i j h
      exact (Finset.equivFinOfCardEq rfl).symm.injective
        (by simpa [carrierPoint] using h)
    point_image := by
      apply Finset.ext
      intro y
      constructor
      · intro hy
        rcases Finset.mem_image.mp hy with ⟨i, _hi, hiy⟩
        have hmem : ((Finset.equivFinOfCardEq rfl).symm i).1 ∈ D.A :=
          ((Finset.equivFinOfCardEq rfl).symm i).2
        rw [← hiy]
        exact hmem
      · intro hy
        let i := Finset.equivFinOfCardEq rfl ⟨y, hy⟩
        refine Finset.mem_image.mpr ⟨i, Finset.mem_univ _, ?_⟩
        simp [carrierPoint, i]
    q := iq
    p := ip
    t1 := it1
    t2 := it2
    t3 := it3
    u := iu
    a0 := ia0
    a1 := ia1
    x := ix
    dangerous := dangerous
    dangerous_card := hdangerous_card
    exact_radius := exactRadius
    exact_radius_card := hexact_card
    bounded := bounded
    row := .criticalShell row hrow_card (by
      exact mem_indexSet_of_mem hKsubset
        H.dangerous.q_mem K.q_mem_support)
    row_inter_dangerous_card_le_two := by
      change (row ∩ dangerous).card ≤ 2
      rw [hrowInter]
      exact hrowDist.1
    row_sdiff_dangerous_card_ge_two := by
      change 2 ≤ (row \ dangerous).card
      rw [hrowDiff]
      exact hrowDist.2 }⟩

end Problem97

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

/-- The live exact-radius obstruction enters the finite backend without
discarding its source arm.  The q-deleted arm carries its escaping point; the
critical-shell arm remains a shell packet with no fabricated escape witness. -/
theorem SixSurvivorU3ExactRadiusAuditObstruction.toFiniteIngress
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    (h : SixSurvivorU3ExactRadiusAuditObstruction (H := H) deleted) :
    Nonempty (U3FiniteEscapePacket D.A) ∨
      Nonempty (U3FiniteCriticalShellPacket D.A) := by
  rcases h with ⟨t1, t2, t3, F, hexact, x, hx, harm⟩
  rcases harm with hq | hshell
  · rcases hq with ⟨B, z, hK, hBcard, _hinter, _hoff, hzB,
        hzOutside, _hselected, _hzoff⟩
    rcases hK with ⟨K⟩
    left
    exact F.toFiniteQDeletedEscapePacket hx K hBcard hzB hzOutside hexact
  · rcases hshell with ⟨K, _hinter, _hoff⟩
    right
    exact F.toFiniteCriticalShellPacket hx K hexact

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
