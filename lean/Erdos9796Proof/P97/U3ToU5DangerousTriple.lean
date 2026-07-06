/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5GlobalIncidenceBasic
import Erdos9796Proof.P97.Moser.NonDeg

/-!
# U3 fixed-triple packet to U5 dangerous triple

This file isolates the bookkeeping bridge from the U3d nonpartner packet shape
to the U5 theorem-facing `U5DangerousTriple` interface.

The bridge does not assert that U3 produces such a packet.  It records the
exact labelled data a future U3 producer must supply: three distinct surviving
points after deleting `q` and erasing the center `p`, all on the circle centered
at `p` through `q`.  Noncollinearity of the U5 triple is then automatic from
the three distinct equal-radius points.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Labelled U3d fixed-triple packet data around `p`.

The fields are the U3-side raw data needed to assemble the U5 dangerous triple
on `T = {t1, t2, t3}`.  In particular, the packet supplies membership of the
three labels in the q-deleted, center-erased skeleton and their common
`p`-radius with `q`; it does not supply a U5 selected candidate outside `T`. -/
structure U3FixedTriplePacket (D : CounterexampleData) (q p t1 t2 t3 : ℝ²) where
  q_mem : q ∈ D.A
  p_mem : p ∈ D.A
  t1_mem : t1 ∈ (D.skeleton q).erase p
  t2_mem : t2 ∈ (D.skeleton q).erase p
  t3_mem : t3 ∈ (D.skeleton q).erase p
  t1_ne_t2 : t1 ≠ t2
  t1_ne_t3 : t1 ≠ t3
  t2_ne_t3 : t2 ≠ t3
  q_radius_pos : 0 < dist p q
  t1_same_radius : dist p t1 = dist p q
  t2_same_radius : dist p t2 = dist p q
  t3_same_radius : dist p t3 = dist p q

namespace U3FixedTriplePacket

/-- The deleted point and root center in a fixed-triple packet are distinct. -/
theorem p_ne_q {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    p ≠ q := by
  intro hpq
  have hzero : dist p q = 0 := by
    simp [hpq]
  linarith [P.q_radius_pos, hzero]

/-- The root center differs from the first fixed-triple point. -/
theorem p_ne_t1 {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    p ≠ t1 :=
  (Finset.mem_erase.mp P.t1_mem).1.symm

/-- The root center differs from the second fixed-triple point. -/
theorem p_ne_t2 {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    p ≠ t2 :=
  (Finset.mem_erase.mp P.t2_mem).1.symm

/-- The root center differs from the third fixed-triple point. -/
theorem p_ne_t3 {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    p ≠ t3 :=
  (Finset.mem_erase.mp P.t3_mem).1.symm

/-- The deleted point differs from the first fixed-triple point. -/
theorem q_ne_t1 {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    q ≠ t1 := by
  have ht1_skeleton : t1 ∈ D.skeleton q :=
    (Finset.mem_erase.mp P.t1_mem).2
  have ht1_erase : t1 ∈ D.A.erase q := by
    simpa [CounterexampleData.skeleton] using ht1_skeleton
  exact (Finset.mem_erase.mp ht1_erase).1.symm

/-- The deleted point differs from the second fixed-triple point. -/
theorem q_ne_t2 {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    q ≠ t2 := by
  have ht2_skeleton : t2 ∈ D.skeleton q :=
    (Finset.mem_erase.mp P.t2_mem).2
  have ht2_erase : t2 ∈ D.A.erase q := by
    simpa [CounterexampleData.skeleton] using ht2_skeleton
  exact (Finset.mem_erase.mp ht2_erase).1.symm

/-- The deleted point differs from the third fixed-triple point. -/
theorem q_ne_t3 {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    q ≠ t3 := by
  have ht3_skeleton : t3 ∈ D.skeleton q :=
    (Finset.mem_erase.mp P.t3_mem).2
  have ht3_erase : t3 ∈ D.A.erase q := by
    simpa [CounterexampleData.skeleton] using ht3_skeleton
  exact (Finset.mem_erase.mp ht3_erase).1.symm

/-- The five base labels `p,q,t1,t2,t3` in a fixed-triple packet are pairwise
distinct, stated as the ten unordered inequalities needed by downstream
depth-5 injectivity adapters. -/
theorem base_distinct {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    p ≠ q ∧ p ≠ t1 ∧ p ≠ t2 ∧ p ≠ t3 ∧
      q ≠ t1 ∧ q ≠ t2 ∧ q ≠ t3 ∧
      t1 ≠ t2 ∧ t1 ≠ t3 ∧ t2 ≠ t3 :=
  ⟨P.p_ne_q, P.p_ne_t1, P.p_ne_t2, P.p_ne_t3,
    P.q_ne_t1, P.q_ne_t2, P.q_ne_t3,
    P.t1_ne_t2, P.t1_ne_t3, P.t2_ne_t3⟩

end U3FixedTriplePacket

/-- If a `K4` class at `p` does not survive after deleting `q`, the proven
U5 4A trichotomy labels the remaining q-critical triple as a U3 fixed-triple
packet.

This is the generic producer for the bookkeeping bridge.  It still requires
the localized U3 argument to supply the no-q-free hypothesis. -/
theorem exists_u3FixedTriplePacket_of_k4_no_qfree
    {D : CounterexampleData} {q p : ℝ²}
    (hq : q ∈ D.A)
    (hp : p ∈ D.A)
    (hpq : p ≠ q)
    (hK4p : HasNEquidistantPointsAt 4 D.A p)
    (hNoQFree :
      ¬ HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p) :
    ∃ t1 t2 t3 : ℝ², U3FixedTriplePacket D q p t1 t2 t3 := by
  rcases u5_4A_trichotomy_erase D q p hq hp hpq hK4p with
    hsurvive | htriple
  · exact False.elim (hNoQFree hsurvive)
  · rcases htriple with ⟨r, hrpos, hqr, hcard⟩
    rw [Finset.card_eq_three] at hcard
    rcases hcard with ⟨t1, t2, t3, ht12, ht13, ht23, hT⟩
    have ht1Filter :
        t1 ∈ (((D.skeleton q).erase p).filter fun y => dist p y = r) := by
      rw [hT]
      simp
    have ht2Filter :
        t2 ∈ (((D.skeleton q).erase p).filter fun y => dist p y = r) := by
      rw [hT]
      simp
    have ht3Filter :
        t3 ∈ (((D.skeleton q).erase p).filter fun y => dist p y = r) := by
      rw [hT]
      simp
    have ht1 := Finset.mem_filter.mp ht1Filter
    have ht2 := Finset.mem_filter.mp ht2Filter
    have ht3 := Finset.mem_filter.mp ht3Filter
    refine ⟨t1, t2, t3, ?_⟩
    exact
      { q_mem := hq
        p_mem := hp
        t1_mem := ht1.1
        t2_mem := ht2.1
        t3_mem := ht3.1
        t1_ne_t2 := ht12
        t1_ne_t3 := ht13
        t2_ne_t3 := ht23
        q_radius_pos := by linarith
        t1_same_radius := ht1.2.trans hqr.symm
        t2_same_radius := ht2.2.trans hqr.symm
        t3_same_radius := ht3.2.trans hqr.symm }

/-- If the maximum same-distance multiplicity at `p` is at most three, then
there is no center-erased four-point same-distance class at `p`. -/
theorem no_qfree_of_muP_le_three
    {S : Finset ℝ²} {p : ℝ²}
    (hmu : muP S p ≤ 3) :
    ¬ HasNEquidistantPointsAt 4 (S.erase p) p := by
  intro hK4
  rcases hK4 with ⟨r, _hrpos, hcard⟩
  let C : Finset ℝ² := (S.erase p).filter fun y => dist p y = r
  have hC_card_ge : 4 ≤ C.card := by
    simpa [C] using hcard
  have hC_pos : 0 < C.card := by
    omega
  rcases Finset.card_pos.mp hC_pos with ⟨y, hyC⟩
  have hy : y ∈ S.erase p ∧ dist p y = r := Finset.mem_filter.mp hyC
  have hC_le_mu : C.card ≤ muP S p := by
    unfold muP
    have hC_eq :
        C = (S.erase p).filter (fun y' => dist p y = dist p y') := by
      ext y'
      simp only [C, Finset.mem_filter, hy.2, eq_comm]
    rw [hC_eq]
    exact Finset.le_sup
      (s := S.erase p)
      (f := fun z => ((S.erase p).filter fun y' => dist p z = dist p y').card)
      hy.1
  omega

/-- Same-distance witnesses are monotone under enlargement of the ambient
finite set. -/
theorem hasNEquidistantPointsAt_mono
    {S T : Finset ℝ²} {p : ℝ²}
    (hsub : S ⊆ T)
    (h : HasNEquidistantPointsAt 4 S p) :
    HasNEquidistantPointsAt 4 T p := by
  rcases h with ⟨r, hrpos, hcard⟩
  refine ⟨r, hrpos, ?_⟩
  let CS : Finset ℝ² := S.filter fun y => dist p y = r
  let CT : Finset ℝ² := T.filter fun y => dist p y = r
  have hCSsub : CS ⊆ CT := by
    intro y hy
    rcases Finset.mem_filter.mp hy with ⟨hyS, hyr⟩
    exact Finset.mem_filter.mpr ⟨hsub hyS, hyr⟩
  exact le_trans (by simpa [CS] using hcard) (Finset.card_le_card hCSsub)

/-- Erasing the center cannot create a K4 witness that was absent before the
erase. -/
theorem hasNEquidistantPointsAt_of_erase
    {S : Finset ℝ²} {p : ℝ²}
    (h : HasNEquidistantPointsAt 4 (S.erase p) p) :
    HasNEquidistantPointsAt 4 S p :=
  hasNEquidistantPointsAt_mono (Finset.erase_subset p S) h

/-- Localized U3 deletion-failure data at the apex `p` after deleting `q`.

This is the minimal faithful packet needed by the fixed-triple extractor:
`q` is a configuration point, `p` survives in the `q`-deleted skeleton, and no
q-free K4 witness remains at `p` after erasing `p` from that skeleton. -/
structure U3LocalizedNoQFreePacket (D : CounterexampleData) (q p : ℝ²) where
  q_mem : q ∈ D.A
  p_mem_skeleton : p ∈ D.skeleton q
  no_qfree : ¬ HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p

/-- A localized U3 packet with skeleton multiplicity at most three supplies the
no-q-free field required by the fixed-triple extractor. -/
theorem U3LocalizedNoQFreePacket.of_muP_le_three
    {D : CounterexampleData} {q p : ℝ²}
    (hq : q ∈ D.A)
    (hp : p ∈ D.skeleton q)
    (hmu : muP (D.skeleton q) p ≤ 3) :
    U3LocalizedNoQFreePacket D q p :=
  { q_mem := hq
    p_mem_skeleton := hp
    no_qfree := no_qfree_of_muP_le_three hmu }

/-- The `μ_p(S)=3` q-critical branch populates the localized no-q-free packet. -/
theorem U3LocalizedNoQFreePacket.of_muP_eq_three
    {D : CounterexampleData} {q p : ℝ²}
    (hq : q ∈ D.A)
    (hp : p ∈ D.skeleton q)
    (hmu : muP (D.skeleton q) p = 3) :
    U3LocalizedNoQFreePacket D q p :=
  U3LocalizedNoQFreePacket.of_muP_le_three hq hp (by omega)

/-- A point of `D.A` distinct from the deleted point survives in the
q-deleted skeleton. -/
theorem mem_skeleton_of_mem_ne
    {D : CounterexampleData} {q p : ℝ²}
    (hp : p ∈ D.A)
    (hpq : p ≠ q) :
    p ∈ D.skeleton q := by
  change p ∈ D.A.erase q
  exact Finset.mem_erase.mpr ⟨hpq, hp⟩

/-- A localized no-q-free U3 packet supplies the hypotheses of the generic
fixed-triple extractor. -/
theorem U3LocalizedNoQFreePacket.exists_fixedTriplePacket
    {D : CounterexampleData} {q p : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p) :
    ∃ t1 t2 t3 : ℝ², U3FixedTriplePacket D q p t1 t2 t3 := by
  have hpErase : p ∈ D.A.erase q := by
    simpa [CounterexampleData.skeleton] using P.p_mem_skeleton
  have hpq : p ≠ q := (Finset.mem_erase.mp hpErase).1
  have hp : p ∈ D.A := (Finset.mem_erase.mp hpErase).2
  exact exists_u3FixedTriplePacket_of_k4_no_qfree
    P.q_mem hp hpq (D.K4 p hp) P.no_qfree

/-- The q-critical multiplicity branch labels the fixed U3 triple packet. -/
theorem exists_u3FixedTriplePacket_of_muP_eq_three
    {D : CounterexampleData} {q p : ℝ²}
    (hq : q ∈ D.A)
    (hp : p ∈ D.skeleton q)
    (hmu : muP (D.skeleton q) p = 3) :
    ∃ t1 t2 t3 : ℝ², U3FixedTriplePacket D q p t1 t2 t3 :=
  (U3LocalizedNoQFreePacket.of_muP_eq_three hq hp hmu).exists_fixedTriplePacket

/-- The q-critical multiplicity branch, stated with `p ∈ D.A` and `p ≠ q`,
labels the fixed U3 triple packet. -/
theorem exists_fixedTriplePacket_of_muP_eq_three_mem
    {D : CounterexampleData} {q p : ℝ²}
    (hq : q ∈ D.A)
    (hp : p ∈ D.A)
    (hpq : p ≠ q)
    (hmu : muP (D.skeleton q) p = 3) :
    ∃ t1 t2 t3 : ℝ², U3FixedTriplePacket D q p t1 t2 t3 :=
  exists_u3FixedTriplePacket_of_muP_eq_three hq
    (mem_skeleton_of_mem_ne hp hpq) hmu

/-- A surplus-cap deletion candidate supplies the ambient membership needed by
the q-critical fixed-triple producer. -/
theorem exists_fixedTriplePacket_of_surplus_muP_eq_three
    {D : CounterexampleData} {q p : ℝ²}
    (hq : q ∈ D.packet.surplusCap)
    (hp : p ∈ D.A)
    (hpq : p ≠ q)
    (hmu : muP (D.skeleton q) p = 3) :
    ∃ t1 t2 t3 : ℝ², U3FixedTriplePacket D q p t1 t2 t3 :=
  exists_fixedTriplePacket_of_muP_eq_three_mem
    (surplusCap_subset D.packet hq) hp hpq hmu

/-- The existing U5 component-branch shape contains enough membership and
multiplicity data to produce the fixed U3 triple packet. -/
theorem exists_fixedTriplePacket_of_component_branch
    {D : CounterexampleData} {q : ℝ²}
    (hq : q ∈ D.packet.surplusCap)
    (hbranch :
      ∃ p ∈ D.A, p ≠ q ∧
        p ∉ ({D.packet.triangle.v1, D.packet.triangle.v2,
              D.packet.triangle.v3, q} : Finset ℝ²) ∧
        muP (D.skeleton q) p = 3 ∧
        HasNEquidistantPointsAt 4 D.A p ∧
        (HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p ∨
          U5StrictOrderViolation D q p)) :
    ∃ p t1 t2 t3 : ℝ², U3FixedTriplePacket D q p t1 t2 t3 := by
  rcases hbranch with ⟨p, hp, hpq, _hpnot, hmu, _hK4, _hfinal⟩
  rcases exists_fixedTriplePacket_of_surplus_muP_eq_three hq hp hpq hmu with
    ⟨t1, t2, t3, P⟩
  exact ⟨p, t1, t2, t3, P⟩

/-- If a surplus deletion candidate is not removable, then some center in the
q-deleted skeleton has no q-free same-distance four-point witness after erasing
the center. -/
theorem exists_localizedNoQFreePacket_of_not_removable_mem
    {D : CounterexampleData} {q : ℝ²}
    (hqA : q ∈ D.A)
    (hnrem : ¬ IsRemovableVertex D.A q) :
    ∃ p : ℝ², U3LocalizedNoQFreePacket D q p := by
  classical
  have hnotProp : ¬ HasNEquidistantProperty 4 (D.skeleton q) := by
    intro hprop
    exact hnrem ⟨hqA, by simpa [CounterexampleData.skeleton] using hprop⟩
  by_contra hnone
  have hprop : HasNEquidistantProperty 4 (D.skeleton q) := by
    intro p hp
    by_cases hpK4 : HasNEquidistantPointsAt 4 (D.skeleton q) p
    · exact hpK4
    · have hnoQFree :
          ¬ HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p := by
        intro hqfree
        exact hpK4 (hasNEquidistantPointsAt_of_erase hqfree)
      exact False.elim
        (hnone ⟨p,
          { q_mem := hqA
            p_mem_skeleton := hp
            no_qfree := hnoQFree }⟩)
  exact hnotProp hprop

theorem exists_localizedNoQFreePacket_of_not_removable
    {D : CounterexampleData} {q : ℝ²}
    (hq : q ∈ D.packet.surplusCap)
    (hnrem : ¬ IsRemovableVertex D.A q) :
    ∃ p : ℝ², U3LocalizedNoQFreePacket D q p := by
  exact exists_localizedNoQFreePacket_of_not_removable_mem
    (surplusCap_subset D.packet hq) hnrem

/-- The non-removable surplus branch supplies a labelled fixed-triple packet. -/
theorem exists_fixedTriplePacket_of_not_removable_mem
    {D : CounterexampleData} {q : ℝ²}
    (hqA : q ∈ D.A)
    (hnrem : ¬ IsRemovableVertex D.A q) :
    ∃ p t1 t2 t3 : ℝ², U3FixedTriplePacket D q p t1 t2 t3 := by
  rcases exists_localizedNoQFreePacket_of_not_removable_mem hqA hnrem with
    ⟨p, P⟩
  rcases P.exists_fixedTriplePacket with ⟨t1, t2, t3, hP⟩
  exact ⟨p, t1, t2, t3, hP⟩

theorem exists_fixedTriplePacket_of_not_removable
    {D : CounterexampleData} {q : ℝ²}
    (hq : q ∈ D.packet.surplusCap)
    (hnrem : ¬ IsRemovableVertex D.A q) :
    ∃ p t1 t2 t3 : ℝ², U3FixedTriplePacket D q p t1 t2 t3 := by
  exact exists_fixedTriplePacket_of_not_removable_mem
    (surplusCap_subset D.packet hq) hnrem

/-- A labelled U3 fixed-triple packet is exactly the U5 dangerous-triple data
for `T = {t1, t2, t3}`. -/
theorem u5DangerousTriple_of_u3FixedTriplePacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3FixedTriplePacket D q p t1 t2 t3) :
    U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²) := by
  refine
    { q_mem := P.q_mem
      p_mem := P.p_mem
      p_ne_q := ?_
      T_subset := ?_
      T_card := ?_
      T_noncollinear := ?_
      q_radius_pos := P.q_radius_pos
      T_same_radius := ?_ }
  · intro hpq
    have hzero : dist p q = 0 := by
      simp [hpq]
    linarith [P.q_radius_pos, hzero]
  · intro x hx
    rw [Finset.mem_insert, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact P.t1_mem
    · exact P.t2_mem
    · exact P.t3_mem
  · simp [P.t1_ne_t2, P.t1_ne_t3, P.t2_ne_t3]
  · have ht1 : dist t1 p = dist p q := by
      simpa [dist_comm] using P.t1_same_radius
    have ht2 : dist t2 p = dist p q := by
      simpa [dist_comm] using P.t2_same_radius
    have ht3 : dist t3 p = dist p q := by
      simpa [dist_comm] using P.t3_same_radius
    have hnoncol : ¬ Collinear ℝ ({t1, t2, t3} : Set ℝ²) :=
      MEC.not_collinear_of_three_dist_eq ht1 ht2 ht3
      P.t1_ne_t2 P.t2_ne_t3 P.t1_ne_t3
    have hset :
        (({t1, t2, t3} : Finset ℝ²) : Set ℝ²) =
          ({t1, t2, t3} : Set ℝ²) := by
      ext x
      simp
    rw [hset]
    exact hnoncol
  · intro t ht
    rw [Finset.mem_insert, Finset.mem_insert, Finset.mem_singleton] at ht
    rcases ht with rfl | rfl | rfl
    · exact P.t1_same_radius
    · exact P.t2_same_radius
    · exact P.t3_same_radius

end Problem97
