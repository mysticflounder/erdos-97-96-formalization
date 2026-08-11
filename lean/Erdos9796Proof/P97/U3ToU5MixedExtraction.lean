/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Dumitrescu.L1
import Erdos9796Proof.P97.U3EscapingAuditStep

/-!
# Mode-preserving finite extraction for the mixed U3 audit

The existing U5 finite audit records only q-deleted rows.  A confined U3 audit
also permits a `CriticalFourShell`, whose support contains `q`.  This file
projects both alternatives to the same eight named labels while retaining the
row mode and its exact q-membership polarity.

The eight labels form a bounded subconfiguration of an arbitrary ambient
carrier.  No exact-cardinality assumption on `D.A` is made here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U3MixedFiniteExtraction

open U5AuditLabel

/-- The two source constructors represented in a mixed confined audit row. -/
inductive MixedRowMode where
  | qDeleted
  | criticalFourShell
  deriving DecidableEq, Repr

/-- A source-faithful confined row before projection to the eight labels. -/
inductive MixedConfinedRow
    (D : CounterexampleData) (q center : ℝ²) (S : Finset ℝ²) where
  | qDeleted (B : Finset ℝ²)
      (K : U5QDeletedK4Class D q center B)
      (card_eq_four : B.card = 4)
      (confined : B ⊆ S)
  | criticalFourShell
      (K : CriticalFourShell D.A q center)
      (confined : K.support ⊆ S)

namespace MixedConfinedRow

variable {D : CounterexampleData} {q center : ℝ²} {S : Finset ℝ²}

noncomputable def support : MixedConfinedRow D q center S → Finset ℝ²
  | .qDeleted B _ _ _ => B
  | .criticalFourShell K _ => K.support

def mode : MixedConfinedRow D q center S → MixedRowMode
  | .qDeleted .. => .qDeleted
  | .criticalFourShell .. => .criticalFourShell

theorem support_card_eq_four (R : MixedConfinedRow D q center S) :
    R.support.card = 4 := by
  cases R with
  | qDeleted B K hcard hconf => exact hcard
  | criticalFourShell K hconf => exact K.support_card

theorem support_confined (R : MixedConfinedRow D q center S) :
    R.support ⊆ S := by
  cases R with
  | qDeleted B K hcard hconf => exact hconf
  | criticalFourShell K hconf => exact hconf

theorem center_not_mem_support (R : MixedConfinedRow D q center S) :
    center ∉ R.support := by
  cases R with
  | qDeleted B K hcard hconf =>
      intro hcenter
      exact (Finset.mem_erase.mp (K.subset hcenter)).1 rfl
  | criticalFourShell K hconf => exact K.center_not_mem_support

theorem q_not_mem_support_iff (R : MixedConfinedRow D q center S) :
    q ∉ R.support ↔ R.mode = .qDeleted := by
  cases R with
  | qDeleted B K hcard hconf => simp [support, mode, K.q_not_mem]
  | criticalFourShell K hconf => simp [support, mode, K.q_mem_support]

noncomputable def toQAllowedK4Class (R : MixedConfinedRow D q center S) :
    U5QAllowedK4Class D center R.support := by
  cases R with
  | qDeleted B K hcard hconf => exact K.toQAllowedK4Class
  | criticalFourShell K hconf => exact K.toU5QAllowedK4Class

theorem inter_card_le_two
    {center' : ℝ²} {R' : MixedConfinedRow D q center' S}
    (R : MixedConfinedRow D q center S) (hne : center ≠ center') :
    (R.support ∩ R'.support).card ≤ 2 :=
  U5QAllowedK4Class.inter_card_le_two
    R.toQAllowedK4Class R'.toQAllowedK4Class hne

/-- A mixed row in critical-shell mode that contains `p` places its center on
the perpendicular bisector of `p` and `q`. -/
theorem dist_eq_q_of_criticalFourShell_mode_of_mem
    {p : ℝ²} (R : MixedConfinedRow D q center S)
    (hmode : R.mode = .criticalFourShell) (hp : p ∈ R.support) :
    dist center p = dist center q := by
  cases R with
  | qDeleted B K hcard hconf => simp [mode] at hmode
  | criticalFourShell K hconf =>
      exact
        (K.support_eq_radius p (by simpa [support] using hp)).trans
          (K.support_eq_radius q K.q_mem_support).symm

/-- At most two distinct carrier centers can carry critical four-shells
that contain `p`.  Three such rows would give three carrier points on the
perpendicular bisector of the carrier edge `p q`. -/
theorem false_of_three_criticalFourShell_rows_containing_p
    {p c₁ c₂ c₃ : ℝ²}
    (hpA : p ∈ D.A) (hqA : q ∈ D.A) (hpq : p ≠ q)
    (hc₁A : c₁ ∈ D.A) (hc₂A : c₂ ∈ D.A) (hc₃A : c₃ ∈ D.A)
    (hc₁c₂ : c₁ ≠ c₂) (hc₁c₃ : c₁ ≠ c₃) (hc₂c₃ : c₂ ≠ c₃)
    (R₁ : MixedConfinedRow D q c₁ S)
    (R₂ : MixedConfinedRow D q c₂ S)
    (R₃ : MixedConfinedRow D q c₃ S)
    (hm₁ : R₁.mode = .criticalFourShell)
    (hm₂ : R₂.mode = .criticalFourShell)
    (hm₃ : R₃.mode = .criticalFourShell)
    (hp₁ : p ∈ R₁.support) (hp₂ : p ∈ R₂.support)
    (hp₃ : p ∈ R₃.support) : False := by
  have hc₁eq : dist c₁ p = dist c₁ q :=
    R₁.dist_eq_q_of_criticalFourShell_mode_of_mem hm₁ hp₁
  have hc₂eq : dist c₂ p = dist c₂ q :=
    R₂.dist_eq_q_of_criticalFourShell_mode_of_mem hm₂ hp₂
  have hc₃eq : dist c₃ p = dist c₃ q :=
    R₃.dist_eq_q_of_criticalFourShell_mode_of_mem hm₃ hp₃
  have hc₁Filter :
      c₁ ∈ D.A.filter (fun center ↦ dist center p = dist center q) :=
    Finset.mem_filter.mpr ⟨hc₁A, hc₁eq⟩
  have hc₂Filter :
      c₂ ∈ D.A.filter (fun center ↦ dist center p = dist center q) :=
    Finset.mem_filter.mpr ⟨hc₂A, hc₂eq⟩
  have hc₃Filter :
      c₃ ∈ D.A.filter (fun center ↦ dist center p = dist center q) :=
    Finset.mem_filter.mpr ⟨hc₃A, hc₃eq⟩
  have hthree :
      2 < (D.A.filter (fun center ↦ dist center p = dist center q)).card := by
    rw [Finset.two_lt_card]
    exact ⟨c₁, hc₁Filter, c₂, hc₂Filter, c₃, hc₃Filter,
      hc₁c₂, hc₁c₃, hc₂c₃⟩
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hpA hqA hpq
  omega

/-- Dangerous-triple specialization of
`false_of_three_criticalFourShell_rows_containing_p`. -/
theorem false_of_three_dangerous_criticalFourShell_rows_containing_p
    {p c₁ c₂ c₃ : ℝ²} {T : Finset ℝ²}
    (H : U5DangerousTriple D q p T)
    (hc₁T : c₁ ∈ T) (hc₂T : c₂ ∈ T) (hc₃T : c₃ ∈ T)
    (hc₁c₂ : c₁ ≠ c₂) (hc₁c₃ : c₁ ≠ c₃) (hc₂c₃ : c₂ ≠ c₃)
    (R₁ : MixedConfinedRow D q c₁ S)
    (R₂ : MixedConfinedRow D q c₂ S)
    (R₃ : MixedConfinedRow D q c₃ S)
    (hm₁ : R₁.mode = .criticalFourShell)
    (hm₂ : R₂.mode = .criticalFourShell)
    (hm₃ : R₃.mode = .criticalFourShell)
    (hp₁ : p ∈ R₁.support) (hp₂ : p ∈ R₂.support)
    (hp₃ : p ∈ R₃.support) : False := by
  have center_mem_A {c : ℝ²} (hcT : c ∈ T) : c ∈ D.A := by
    have hcErase : c ∈ (D.skeleton q).erase p := H.T_subset hcT
    have hcSkeleton : c ∈ D.skeleton q := (Finset.mem_erase.mp hcErase).2
    have hcEraseQ : c ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using hcSkeleton
    exact (Finset.mem_erase.mp hcEraseQ).2
  exact false_of_three_criticalFourShell_rows_containing_p
    H.p_mem H.q_mem H.p_ne_q
    (center_mem_A hc₁T) (center_mem_A hc₂T) (center_mem_A hc₃T)
    hc₁c₂ hc₁c₃ hc₂c₃ R₁ R₂ R₃ hm₁ hm₂ hm₃ hp₁ hp₂ hp₃

end MixedConfinedRow

/-- A pure finite row on the eight audit labels.  The final field records the
exact q-membership polarity supplied by the source constructor. -/
structure MixedChoice (center : U5AuditLabel) where
  support : Finset U5AuditLabel
  card_eq_four : support.card = 4
  center_not_mem : center ∉ support
  mode : MixedRowMode
  q_not_mem_iff : q ∉ support ↔ mode = .qDeleted

/-- The subtype of the six audited center labels. -/
abbrev MixedCenter := {center : U5AuditLabel // center ∈ centers}

/-- Six mode-preserving finite rows with the universal two-circle overlap
bound.  This is finite ingress, not a contradiction certificate. -/
structure MixedSixRowPattern where
  row : (c : MixedCenter) → MixedChoice c.1
  overlap : ∀ c d : MixedCenter, c ≠ d →
    ((row c).support ∩ (row d).support).card ≤ 2

/-- The four labels on the dangerous `p`-circle: `q` and the dangerous
triple. -/
def dangerousCircleLabels : Finset U5AuditLabel := {q, t1, t2, t3}

/-- The source-faithful strengthening used by the mixed finite census. -/
structure MixedSixRowPatternWithDangerousCircle extends MixedSixRowPattern where
  dangerousCircle_overlap : ∀ c : MixedCenter,
    ((row c).support ∩ dangerousCircleLabels).card ≤ 2
  shell_p_at_most_two : ∀ c₁ c₂ c₃ : MixedCenter,
    c₁ ≠ c₂ → c₁ ≠ c₃ → c₂ ≠ c₃ →
    ¬ ((row c₁).mode = .criticalFourShell ∧
      p ∈ (row c₁).support ∧
      (row c₂).mode = .criticalFourShell ∧
      p ∈ (row c₂).support ∧
      (row c₃).mode = .criticalFourShell ∧
      p ∈ (row c₃).support)

/-- If the perpendicular-bisector multiplicity bound is available for every
non-`q` label, then at least two of the six mixed rows are q-deleted.

Indeed, five critical shells would contribute `5 * 3 = 15` non-`q`
incidences.  There are only seven non-`q` labels, and no one label can occur in
three distinct critical shells, so their total capacity is at most `7 * 2 =
14`. -/
theorem MixedSixRowPattern.exists_two_qDeleted_of_uniform_shell_multiplicity
    (P : MixedSixRowPattern)
    (huniform : ∀ z : U5AuditLabel, z ≠ q →
      ∀ c₁ c₂ c₃ : MixedCenter,
        c₁ ≠ c₂ → c₁ ≠ c₃ → c₂ ≠ c₃ →
        ¬ ((P.row c₁).mode = .criticalFourShell ∧
          z ∈ (P.row c₁).support ∧
          (P.row c₂).mode = .criticalFourShell ∧
          z ∈ (P.row c₂).support ∧
          (P.row c₃).mode = .criticalFourShell ∧
          z ∈ (P.row c₃).support)) :
    ∃ c₁ c₂ : MixedCenter, c₁ ≠ c₂ ∧
      (P.row c₁).mode = .qDeleted ∧
      (P.row c₂).mode = .qDeleted := by
  classical
  let shellCenters : Finset MixedCenter :=
    Finset.univ.filter fun c ↦ (P.row c).mode = .criticalFourShell
  let qDeletedCenters : Finset MixedCenter :=
    Finset.univ.filter fun c ↦ (P.row c).mode = .qDeleted
  by_contra htwo
  have hqCard : qDeletedCenters.card ≤ 1 := by
    by_contra hcard
    have hlarge : 1 < qDeletedCenters.card := Nat.lt_of_not_ge hcard
    rw [Finset.one_lt_card] at hlarge
    rcases hlarge with ⟨c₁, hc₁, c₂, hc₂, hc₁c₂⟩
    apply htwo
    exact ⟨c₁, c₂, hc₁c₂,
      (Finset.mem_filter.mp hc₁).2, (Finset.mem_filter.mp hc₂).2⟩
  have hdisj : Disjoint shellCenters qDeletedCenters := by
    rw [Finset.disjoint_left]
    intro c hcShell hcQ
    have hshell := (Finset.mem_filter.mp hcShell).2
    have hqDeleted := (Finset.mem_filter.mp hcQ).2
    rw [hshell] at hqDeleted
    cases hqDeleted
  have hunion : shellCenters ∪ qDeletedCenters = Finset.univ := by
    ext c
    simp only [shellCenters, qDeletedCenters, Finset.mem_union,
      Finset.mem_filter, Finset.mem_univ, true_and, iff_true]
    cases hmode : (P.row c).mode with
    | qDeleted => exact Or.inr rfl
    | criticalFourShell => exact Or.inl rfl
  have hcenterCard : (Finset.univ : Finset MixedCenter).card = 6 := by
    native_decide
  have hshellCard : 5 ≤ shellCenters.card := by
    have htotal : shellCenters.card + qDeletedCenters.card = 6 := by
      rw [← Finset.card_union_of_disjoint hdisj, hunion, hcenterCard]
    omega
  let incidenceByCenter (c : MixedCenter) :
      Finset (MixedCenter × U5AuditLabel) :=
    ((P.row c).support.erase q).image fun z ↦ (c, z)
  let incidences : Finset (MixedCenter × U5AuditLabel) :=
    shellCenters.biUnion incidenceByCenter
  have hpairwise : (shellCenters : Set MixedCenter).PairwiseDisjoint
      incidenceByCenter := by
    intro c hc d hd hcd
    change Disjoint (incidenceByCenter c) (incidenceByCenter d)
    rw [Finset.disjoint_left]
    intro x hxc hxd
    rcases Finset.mem_image.mp hxc with ⟨z, hz, rfl⟩
    rcases Finset.mem_image.mp hxd with ⟨w, hw, heq⟩
    exact hcd (congrArg Prod.fst heq).symm
  have hrowCard (c : MixedCenter) (hc : c ∈ shellCenters) :
      (incidenceByCenter c).card = 3 := by
    have hshell : (P.row c).mode = .criticalFourShell :=
      (Finset.mem_filter.mp hc).2
    have hqMem : q ∈ (P.row c).support := by
      by_contra hq
      have hmode := (P.row c).q_not_mem_iff.mp hq
      rw [hshell] at hmode
      cases hmode
    change (((P.row c).support.erase q).image fun z ↦ (c, z)).card = 3
    rw [Finset.card_image_of_injective]
    · rw [Finset.card_erase_of_mem hqMem, (P.row c).card_eq_four]
    · intro z w hzw
      exact congrArg Prod.snd hzw
  have hincidenceCard : incidences.card = shellCenters.card * 3 := by
    change (shellCenters.biUnion incidenceByCenter).card =
      shellCenters.card * 3
    rw [Finset.card_biUnion hpairwise]
    calc
      ∑ c ∈ shellCenters, (incidenceByCenter c).card =
          ∑ _c ∈ shellCenters, 3 := by
            apply Finset.sum_congr rfl
            intro c hc
            exact hrowCard c hc
      _ = shellCenters.card * 3 := by simp
  let labelCenters (z : U5AuditLabel) : Finset MixedCenter :=
    shellCenters.filter fun c ↦ z ∈ (P.row c).support
  let incidenceByLabel (z : U5AuditLabel) :
      Finset (MixedCenter × U5AuditLabel) :=
    (labelCenters z).image fun c ↦ (c, z)
  let labelIncidences : Finset (MixedCenter × U5AuditLabel) :=
    (Finset.univ.erase q).biUnion incidenceByLabel
  have hlabelCard (z : U5AuditLabel) (hzq : z ≠ q) :
      (labelCenters z).card ≤ 2 := by
    by_contra hcard
    have hlarge : 2 < (labelCenters z).card := Nat.lt_of_not_ge hcard
    rw [Finset.two_lt_card] at hlarge
    rcases hlarge with
      ⟨c₁, hc₁, c₂, hc₂, c₃, hc₃, hc₁c₂, hc₁c₃, hc₂c₃⟩
    apply huniform z hzq c₁ c₂ c₃ hc₁c₂ hc₁c₃ hc₂c₃
    exact ⟨(Finset.mem_filter.mp (Finset.mem_filter.mp hc₁).1).2,
      (Finset.mem_filter.mp hc₁).2,
      (Finset.mem_filter.mp (Finset.mem_filter.mp hc₂).1).2,
      (Finset.mem_filter.mp hc₂).2,
      (Finset.mem_filter.mp (Finset.mem_filter.mp hc₃).1).2,
      (Finset.mem_filter.mp hc₃).2⟩
  have hsubset : incidences ⊆ labelIncidences := by
    intro x hx
    rcases Finset.mem_biUnion.mp hx with ⟨c, hcShell, hxc⟩
    rcases Finset.mem_image.mp hxc with ⟨z, hz, rfl⟩
    have hzq : z ≠ q := (Finset.mem_erase.mp hz).1
    apply Finset.mem_biUnion.mpr
    refine ⟨z, Finset.mem_erase.mpr ⟨hzq, Finset.mem_univ _⟩, ?_⟩
    apply Finset.mem_image.mpr
    exact ⟨c, Finset.mem_filter.mpr
      ⟨hcShell, (Finset.mem_erase.mp hz).2⟩, rfl⟩
  have hlabelUniverseCard :
      ((Finset.univ : Finset U5AuditLabel).erase q).card = 7 := by
    native_decide
  have hlabelIncidenceCard : labelIncidences.card ≤ 14 := by
    calc
      labelIncidences.card ≤
          ∑ z ∈ (Finset.univ.erase q), (incidenceByLabel z).card :=
        Finset.card_biUnion_le
      _ = ∑ z ∈ (Finset.univ.erase q), (labelCenters z).card := by
        apply Finset.sum_congr rfl
        intro z hz
        change ((labelCenters z).image fun c ↦ (c, z)).card =
          (labelCenters z).card
        rw [Finset.card_image_of_injective]
        intro c d hcd
        exact congrArg Prod.fst hcd
      _ ≤ ∑ _z ∈ (Finset.univ.erase q), 2 := by
        apply Finset.sum_le_sum
        intro z hz
        exact hlabelCard z (Finset.mem_erase.mp hz).1
      _ = 14 := by simp [hlabelUniverseCard]
  have hincidenceLe : incidences.card ≤ 14 :=
    (Finset.card_le_card hsubset).trans hlabelIncidenceCard
  omega

noncomputable def MixedConfinedRow.toMixedChoice
    {D : CounterexampleData} {q center : ℝ²} {S : Finset ℝ²}
    (R : MixedConfinedRow D q center S)
    (L : PointLabeling) (label : U5AuditLabel)
    (hcenter : center = L.point label)
    (hq : q = L.point U5AuditLabel.q)
    (hsupport : R.support ⊆ supportSet L.point) : MixedChoice label where
  support := classLabels L.point R.support
  card_eq_four :=
    classLabels_card_eq_of_subset_support L.injective hsupport
      R.support_card_eq_four
  center_not_mem := by
    apply label_not_mem_classLabels
    simpa [hcenter] using R.center_not_mem_support
  mode := R.mode
  q_not_mem_iff := by
    rw [← R.q_not_mem_support_iff]
    constructor
    · intro hqLabel hqSupport
      apply hqLabel
      simp [classLabels, labelFinset, labels, ← hq, hqSupport]
    · intro hqSupport
      apply label_not_mem_classLabels
      simpa [← hq] using hqSupport

/-- Project a family of six real mixed rows to the pure finite pattern. -/
noncomputable def MixedSixRowPattern.ofRealRows
    {D : CounterexampleData} {q : ℝ²} {S : Finset ℝ²}
    (L : PointLabeling)
    (hq : q = L.point U5AuditLabel.q)
    (rows : ∀ c : MixedCenter,
      MixedConfinedRow D q (L.point c.1) S)
    (hsupport : S ⊆ supportSet L.point) : MixedSixRowPattern where
  row := fun c => (rows c).toMixedChoice L c.1 rfl hq
    ((rows c).support_confined.trans hsupport)
  overlap := by
    intro c d hcd
    apply classLabels_inter_card_le L.injective
    apply (rows c).inter_card_le_two (R' := rows d)
    intro hpoint
    apply hcd
    apply Subtype.ext
    exact L.injective hpoint

/-- A source-clean mixed confined audit extracts to six mode-preserving finite
rows on any injective labeling of the bounded support. -/
theorem MixedConfinedAuditPacket.exists_mixedSixRowPattern
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket)
    (L : PointLabeling)
    (hq : q = L.point U5AuditLabel.q)
    (hcenter : ∀ c : MixedCenter,
      L.point c.1 ∈ U5BoundedAuditCenters D q p
        ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1)
    (hsupport : U5BoundedSupport D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ⊆
        supportSet L.point) :
    Nonempty MixedSixRowPattern := by
  classical
  let S := U5BoundedSupport D q p
    ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
  have hexists : ∀ c : MixedCenter,
      Nonempty (MixedConfinedRow D q (L.point c.1) S) := by
    intro c
    rcases hmixed (L.point c.1) (hcenter c) with
      ⟨B, ⟨K⟩, hcard, hconf⟩ | ⟨K, hconf⟩
    · exact ⟨.qDeleted B K hcard (by
        simpa [S] using hconf)⟩
    · exact ⟨.criticalFourShell K (by
        simpa [S] using hconf)⟩
  let rows := fun c : MixedCenter => Classical.choice (hexists c)
  exact ⟨MixedSixRowPattern.ofRealRows L hq rows (by
    simpa [S] using hsupport)⟩

/-- A canonical finite pattern together with the real mixed rows from which it
was projected.  Retaining the rows prevents a finite mode conclusion from
being stranded behind the lossy label projection. -/
structure CanonicalMixedRowsWithDangerousCircle
    (D : CounterexampleData) (q p t1 t2 t3 : ℝ²)
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) where
  labeling : PointLabeling
  rows : ∀ c : MixedCenter,
    MixedConfinedRow D q (labeling.point c.1)
      (U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
        H.u H.a0 H.a1)
  center_mem : ∀ c : MixedCenter,
    labeling.point c.1 ∈ U5BoundedAuditCenters D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
  pattern : MixedSixRowPatternWithDangerousCircle
  row_mode : ∀ c : MixedCenter,
    (pattern.row c).mode = (rows c).mode
  shell_label_at_most_two : ∀ z : U5AuditLabel, z ≠ U5AuditLabel.q →
    ∀ c₁ c₂ c₃ : MixedCenter,
      c₁ ≠ c₂ → c₁ ≠ c₃ → c₂ ≠ c₃ →
      ¬ ((pattern.row c₁).mode = .criticalFourShell ∧
        z ∈ (pattern.row c₁).support ∧
        (pattern.row c₂).mode = .criticalFourShell ∧
        z ∈ (pattern.row c₂).support ∧
        (pattern.row c₃).mode = .criticalFourShell ∧
        z ∈ (pattern.row c₃).support)

/-- The canonical eight-label projection attached to a U3 audit frame.

The frame may live in an arbitrarily large carrier.  The extracted labels are
the three points of its dangerous triple together with `p`, `q`, and the three
successive audit points `u`, `a0`, `a1`. -/
theorem MixedConfinedAuditPacket.exists_canonical_mixedRowsWithDangerousCircle
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket) :
    Nonempty (CanonicalMixedRowsWithDangerousCircle D q p t1 t2 t3 H) := by
  classical
  rcases H.dangerous.exists_triple_labels with
    ⟨s1, s2, s3, hs12, hs13, hs23, hT, _hnoncol, _hr1, _hr2, _hr3⟩
  have hs1T : s1 ∈ ({t1, t2, t3} : Finset ℝ²) := by simp [hT]
  have hs2T : s2 ∈ ({t1, t2, t3} : Finset ℝ²) := by simp [hT]
  have hs3T : s3 ∈ ({t1, t2, t3} : Finset ℝ²) := by simp [hT]
  have hps1 : p ≠ s1 :=
    (ne_of_mem_skeleton_erase (H.dangerous.T_subset hs1T)).1
  have hps2 : p ≠ s2 :=
    (ne_of_mem_skeleton_erase (H.dangerous.T_subset hs2T)).1
  have hps3 : p ≠ s3 :=
    (ne_of_mem_skeleton_erase (H.dangerous.T_subset hs3T)).1
  have hqs1 : q ≠ s1 :=
    (ne_of_mem_skeleton_erase (H.dangerous.T_subset hs1T)).2
  have hqs2 : q ≠ s2 :=
    (ne_of_mem_skeleton_erase (H.dangerous.T_subset hs2T)).2
  have hqs3 : q ≠ s3 :=
    (ne_of_mem_skeleton_erase (H.dangerous.T_subset hs3T)).2
  have hpu : p ≠ H.u :=
    (ne_of_mem_skeleton_erase H.selected.candidate_mem).1
  have hqu : q ≠ H.u :=
    (ne_of_mem_skeleton_erase H.selected.candidate_mem).2
  have hpa0 : p ≠ H.a0 := (ne_of_mem_skeleton_erase H.a0_mem).1
  have hqa0 : q ≠ H.a0 := (ne_of_mem_skeleton_erase H.a0_mem).2
  have hpa1 : p ≠ H.a1 := (ne_of_mem_skeleton_erase H.a1_mem).1
  have hqa1 : q ≠ H.a1 := (ne_of_mem_skeleton_erase H.a1_mem).2
  have hs1u : s1 ≠ H.u := by
    intro h
    exact H.selected.candidate_notin_T (by simpa [h] using hs1T)
  have hs2u : s2 ≠ H.u := by
    intro h
    exact H.selected.candidate_notin_T (by simpa [h] using hs2T)
  have hs3u : s3 ≠ H.u := by
    intro h
    exact H.selected.candidate_notin_T (by simpa [h] using hs3T)
  have hs1a0 : s1 ≠ H.a0 := by
    intro h
    exact H.a0_notin_base (Finset.mem_insert.mpr (Or.inr (by
      simpa [h] using hs1T)))
  have hs2a0 : s2 ≠ H.a0 := by
    intro h
    exact H.a0_notin_base (Finset.mem_insert.mpr (Or.inr (by
      simpa [h] using hs2T)))
  have hs3a0 : s3 ≠ H.a0 := by
    intro h
    exact H.a0_notin_base (Finset.mem_insert.mpr (Or.inr (by
      simpa [h] using hs3T)))
  have hua0 : H.u ≠ H.a0 := by
    intro h
    exact H.a0_notin_base (Finset.mem_insert.mpr (Or.inl h.symm))
  have hs1a1 : s1 ≠ H.a1 := by
    intro h
    exact H.a1_notin_base
      (Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inr (by
        simpa [h] using hs1T)))))
  have hs2a1 : s2 ≠ H.a1 := by
    intro h
    exact H.a1_notin_base
      (Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inr (by
        simpa [h] using hs2T)))))
  have hs3a1 : s3 ≠ H.a1 := by
    intro h
    exact H.a1_notin_base
      (Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inr (by
        simpa [h] using hs3T)))))
  have hua1 : H.u ≠ H.a1 := by
    intro h
    exact H.a1_notin_base (Finset.mem_insert.mpr (Or.inl h.symm))
  have ha01 : H.a0 ≠ H.a1 := by
    intro h
    exact H.a1_notin_base
      (Finset.mem_insert.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inl h.symm))))
  let L : PointLabeling :=
    { point := pointOf p q s1 s2 s3 H.u H.a0 H.a1
      injective := pointOf_injective H.dangerous.p_ne_q
        hps1 hps2 hps3 hpu hpa0 hpa1 hqs1 hqs2 hqs3 hqu hqa0 hqa1
        hs12 hs13 hs1u hs1a0 hs1a1 hs23 hs2u hs2a0 hs2a1
        hs3u hs3a0 hs3a1 hua0 hua1 ha01 }
  have hqL : q = L.point U5AuditLabel.q := by simp [L, pointOf]
  have hcenter : ∀ c : MixedCenter,
      L.point c.1 ∈ U5BoundedAuditCenters D q p
        ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 := by
    intro c
    rcases c with ⟨c, hc⟩
    fin_cases c <;>
      simp [centers, L, pointOf, U5BoundedAuditCenters, hT] at hc ⊢
  have hsupport : U5BoundedSupport D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ⊆
        supportSet L.point := by
    intro x hx
    have hx' : x ∈ U5BoundedSupport D q p
        ({s1, s2, s3} : Finset ℝ²) H.u H.a0 H.a1 := by
      simpa [hT] using hx
    have hsupport := supportSet_pointOf_eq_boundedSupport
      D q p s1 s2 s3 H.u H.a0 H.a1
    have : x ∈ supportSet (pointOf p q s1 s2 s3 H.u H.a0 H.a1) := by
      rwa [hsupport]
    simpa [L] using this
  let S := U5BoundedSupport D q p
    ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
  have hexists : ∀ c : MixedCenter,
      Nonempty (MixedConfinedRow D q (L.point c.1) S) := by
    intro c
    rcases hmixed (L.point c.1) (hcenter c) with
      ⟨B, ⟨K⟩, hcard, hconf⟩ | ⟨K, hconf⟩
    · exact ⟨.qDeleted B K hcard (by simpa [S] using hconf)⟩
    · exact ⟨.criticalFourShell K (by simpa [S] using hconf)⟩
  let rows := fun c : MixedCenter => Classical.choice (hexists c)
  let P := MixedSixRowPattern.ofRealRows L hqL rows (by
    simpa [S] using hsupport)
  have hcircleLabels :
      classLabels L.point (insert q ({t1, t2, t3} : Finset ℝ²)) =
        dangerousCircleLabels := by
    ext label
    fin_cases label <;>
      simp [classLabels, labelFinset, labels, dangerousCircleLabels,
        L, pointOf, hT, H.dangerous.p_ne_q, hps1, hps2, hps3,
        Ne.symm hqu, Ne.symm hqa0, Ne.symm hqa1,
        Ne.symm hs1u, Ne.symm hs2u, Ne.symm hs3u,
        Ne.symm hs1a0, Ne.symm hs2a0, Ne.symm hs3a0,
        Ne.symm hs1a1, Ne.symm hs2a1, Ne.symm hs3a1]
  refine ⟨⟨L, rows, hcenter, ⟨P, ?_, ?_⟩, ?_, ?_⟩⟩
  · intro c
    have hreal : ((rows c).support ∩
        insert q ({t1, t2, t3} : Finset ℝ²)).card ≤ 2 := by
      cases hrow : rows c with
      | qDeleted B K hcard hconf =>
          simpa [MixedConfinedRow.support, hrow] using
            (H.qDeletedRow_dangerousCircle_distribution
              (hcenter c) K hcard).1
      | criticalFourShell K hconf =>
          simpa [MixedConfinedRow.support, hrow] using
            (H.criticalFourShell_dangerousCircle_distribution
              (hcenter c) K).1
    change ((classLabels L.point (rows c).support) ∩
      dangerousCircleLabels).card ≤ 2
    rw [← hcircleLabels]
    exact classLabels_inter_card_le L.injective hreal
  · intro c₁ c₂ c₃ hc₁c₂ hc₁c₃ hc₂c₃
    rintro ⟨hm1, hp1, hm2, hp2, hm3, hp3⟩
    change (rows c₁).mode = .criticalFourShell at hm1
    change U5AuditLabel.p ∈ classLabels L.point (rows c₁).support at hp1
    change (rows c₂).mode = .criticalFourShell at hm2
    change U5AuditLabel.p ∈ classLabels L.point (rows c₂).support at hp2
    change (rows c₃).mode = .criticalFourShell at hm3
    change U5AuditLabel.p ∈ classLabels L.point (rows c₃).support at hp3
    have hp1Real : p ∈ (rows c₁).support := by
      have := (Finset.mem_filter.mp hp1).2
      simpa [L, pointOf] using this
    have hp2Real : p ∈ (rows c₂).support := by
      have := (Finset.mem_filter.mp hp2).2
      simpa [L, pointOf] using this
    have hp3Real : p ∈ (rows c₃).support := by
      have := (Finset.mem_filter.mp hp3).2
      simpa [L, pointOf] using this
    have center_mem_A (c : MixedCenter) : L.point c.1 ∈ D.A := by
      have hcSkeleton : L.point c.1 ∈ D.skeleton q :=
        H.dangerous.audit_center_mem_skeleton H.selected H.a0_mem H.a1_mem
          (hcenter c)
      have hcEraseQ : L.point c.1 ∈ D.A.erase q := by
        simpa [CounterexampleData.skeleton] using hcSkeleton
      exact (Finset.mem_erase.mp hcEraseQ).2
    have hc₁c₂Real : L.point c₁.1 ≠ L.point c₂.1 := by
      intro h
      apply hc₁c₂
      apply Subtype.ext
      exact L.injective h
    have hc₁c₃Real : L.point c₁.1 ≠ L.point c₃.1 := by
      intro h
      apply hc₁c₃
      apply Subtype.ext
      exact L.injective h
    have hc₂c₃Real : L.point c₂.1 ≠ L.point c₃.1 := by
      intro h
      apply hc₂c₃
      apply Subtype.ext
      exact L.injective h
    exact MixedConfinedRow.false_of_three_criticalFourShell_rows_containing_p
      H.dangerous.p_mem H.dangerous.q_mem H.dangerous.p_ne_q
      (center_mem_A c₁) (center_mem_A c₂) (center_mem_A c₃)
      hc₁c₂Real hc₁c₃Real hc₂c₃Real
      (rows c₁) (rows c₂) (rows c₃) hm1 hm2 hm3 hp1Real hp2Real hp3Real
  · intro c
    rfl
  · intro z hzq c₁ c₂ c₃ hc₁c₂ hc₁c₃ hc₂c₃
    rintro ⟨hm1, hz1, hm2, hz2, hm3, hz3⟩
    change (rows c₁).mode = .criticalFourShell at hm1
    change z ∈ classLabels L.point (rows c₁).support at hz1
    change (rows c₂).mode = .criticalFourShell at hm2
    change z ∈ classLabels L.point (rows c₂).support at hz2
    change (rows c₃).mode = .criticalFourShell at hm3
    change z ∈ classLabels L.point (rows c₃).support at hz3
    have hz1Real : L.point z ∈ (rows c₁).support :=
      (Finset.mem_filter.mp hz1).2
    have hz2Real : L.point z ∈ (rows c₂).support :=
      (Finset.mem_filter.mp hz2).2
    have hz3Real : L.point z ∈ (rows c₃).support :=
      (Finset.mem_filter.mp hz3).2
    have hzA : L.point z ∈ D.A := by
      have hzSkeleton := (rows c₁).toQAllowedK4Class.subset hz1Real
      exact (Finset.mem_erase.mp hzSkeleton).2
    have hzNeQ : L.point z ≠ q := by
      intro hz
      apply hzq
      apply L.injective
      exact hz.trans hqL
    have center_mem_A (c : MixedCenter) : L.point c.1 ∈ D.A := by
      have hcSkeleton : L.point c.1 ∈ D.skeleton q :=
        H.dangerous.audit_center_mem_skeleton H.selected H.a0_mem H.a1_mem
          (hcenter c)
      have hcEraseQ : L.point c.1 ∈ D.A.erase q := by
        simpa [CounterexampleData.skeleton] using hcSkeleton
      exact (Finset.mem_erase.mp hcEraseQ).2
    have hc₁c₂Real : L.point c₁.1 ≠ L.point c₂.1 := by
      intro h
      apply hc₁c₂
      apply Subtype.ext
      exact L.injective h
    have hc₁c₃Real : L.point c₁.1 ≠ L.point c₃.1 := by
      intro h
      apply hc₁c₃
      apply Subtype.ext
      exact L.injective h
    have hc₂c₃Real : L.point c₂.1 ≠ L.point c₃.1 := by
      intro h
      apply hc₂c₃
      apply Subtype.ext
      exact L.injective h
    exact MixedConfinedRow.false_of_three_criticalFourShell_rows_containing_p
      hzA H.dangerous.q_mem hzNeQ
      (center_mem_A c₁) (center_mem_A c₂) (center_mem_A c₃)
      hc₁c₂Real hc₁c₃Real hc₂c₃Real
      (rows c₁) (rows c₂) (rows c₃) hm1 hm2 hm3
      hz1Real hz2Real hz3Real

/-- Compatibility wrapper exposing only the finite projection. -/
theorem MixedConfinedAuditPacket.exists_canonical_mixedSixRowPatternWithDangerousCircle
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket) :
    Nonempty MixedSixRowPatternWithDangerousCircle := by
  rcases MixedConfinedAuditPacket.exists_canonical_mixedRowsWithDangerousCircle
      hmixed with ⟨W⟩
  exact ⟨W.pattern⟩

/-- Forgetting the dangerous-circle field recovers the plain mixed pattern. -/
theorem MixedConfinedAuditPacket.exists_canonical_mixedSixRowPattern
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket) :
    Nonempty MixedSixRowPattern := by
  rcases MixedConfinedAuditPacket.exists_canonical_mixedSixRowPatternWithDangerousCircle
      hmixed with
    ⟨P⟩
  exact ⟨P.toMixedSixRowPattern⟩

/- The following finite reflection checks the all-shell mode vector.  Every
row is represented by an executable eight-label bit mask, with the source
overlap and dangerous-circle bounds retained.  The resulting `native_decide`
certificate is only a finite projection; the theorem below transports it back
to the six actual rows. -/

def maskSupport (m : Fin 256) : Finset U5AuditLabel :=
  labels.toFinset.filter (fun x => has m.val x)

set_option maxRecDepth 100000 in
theorem labelMask_lt_256 (L : Finset U5AuditLabel) : labelMask L < 256 := by
  decide +revert

def supportMask (L : Finset U5AuditLabel) : Fin 256 :=
  ⟨labelMask L, labelMask_lt_256 L⟩

set_option maxRecDepth 100000 in
theorem maskSupport_supportMask (L : Finset U5AuditLabel) :
    maskSupport (supportMask L) = L := by
  decide +revert

def allMasks : List (Fin 256) := List.finRange 256

def shellMasks (center : U5AuditLabel) : List (Fin 256) :=
  allMasks.filter fun m =>
    let B := maskSupport m
    decide (B.card = 4) && decide (q ∈ B) && decide (center ∉ B) &&
      decide ((B ∩ dangerousCircleLabels).card ≤ 2)

def shellPatternOK
    (Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset U5AuditLabel) : Bool :=
  decide ((Bt1 ∩ Bt2).card ≤ 2) &&
  decide ((Bt1 ∩ Bt3).card ≤ 2) &&
  decide ((Bt1 ∩ Bu).card ≤ 2) &&
  decide ((Bt1 ∩ Ba0).card ≤ 2) &&
  decide ((Bt1 ∩ Ba1).card ≤ 2) &&
  decide ((Bt2 ∩ Bt3).card ≤ 2) &&
  decide ((Bt2 ∩ Bu).card ≤ 2) &&
  decide ((Bt2 ∩ Ba0).card ≤ 2) &&
  decide ((Bt2 ∩ Ba1).card ≤ 2) &&
  decide ((Bt3 ∩ Bu).card ≤ 2) &&
  decide ((Bt3 ∩ Ba0).card ≤ 2) &&
  decide ((Bt3 ∩ Ba1).card ≤ 2) &&
  decide ((Bu ∩ Ba0).card ≤ 2) &&
  decide ((Bu ∩ Ba1).card ≤ 2) &&
  decide ((Ba0 ∩ Ba1).card ≤ 2) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt2 ∧ p ∈ Bt3) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt2 ∧ p ∈ Bu) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt2 ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt2 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt3 ∧ p ∈ Bu) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt3 ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bt3 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bu ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Bu ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt1 ∧ p ∈ Ba0 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bt3 ∧ p ∈ Bu) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bt3 ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bt3 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bu ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Bu ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt2 ∧ p ∈ Ba0 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt3 ∧ p ∈ Bu ∧ p ∈ Ba0) &&
  decide ¬ (p ∈ Bt3 ∧ p ∈ Bu ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bt3 ∧ p ∈ Ba0 ∧ p ∈ Ba1) &&
  decide ¬ (p ∈ Bu ∧ p ∈ Ba0 ∧ p ∈ Ba1)

def shellPatternExists : Bool :=
  (shellMasks t1).any fun mt1 =>
    (shellMasks t2).any fun mt2 =>
      (shellMasks t3).any fun mt3 =>
        (shellMasks u).any fun mu =>
          (shellMasks a0).any fun ma0 =>
            (shellMasks a1).any fun ma1 =>
              shellPatternOK (maskSupport mt1) (maskSupport mt2)
                (maskSupport mt3) (maskSupport mu) (maskSupport ma0)
                (maskSupport ma1)

set_option maxHeartbeats 10000000 in
-- Exhaustively reduces the fixed six-row Boolean certificate.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem shellPatternExists_false : shellPatternExists = false := by
  native_decide

def ct1 : MixedCenter := ⟨t1, by simp [centers]⟩
def ct2 : MixedCenter := ⟨t2, by simp [centers]⟩
def ct3 : MixedCenter := ⟨t3, by simp [centers]⟩
def cu : MixedCenter := ⟨u, by simp [centers]⟩
def ca0 : MixedCenter := ⟨a0, by simp [centers]⟩
def ca1 : MixedCenter := ⟨a1, by simp [centers]⟩

set_option maxRecDepth 100000 in
theorem exists_qDeleted_mode_of_mixedSixRowPatternWithDangerousCircle
    (P : MixedSixRowPatternWithDangerousCircle) :
    ∃ c : MixedCenter, (P.row c).mode = .qDeleted := by
  by_contra hnone
  have hall : ∀ c : MixedCenter,
      (P.row c).mode = .criticalFourShell := by
    intro c
    cases hmode : (P.row c).mode with
    | qDeleted => exact False.elim (hnone ⟨c, hmode⟩)
    | criticalFourShell => rfl
  have d12 : ct1 ≠ ct2 := by decide
  have d13 : ct1 ≠ ct3 := by decide
  have d1u : ct1 ≠ cu := by decide
  have d1a0 : ct1 ≠ ca0 := by decide
  have d1a1 : ct1 ≠ ca1 := by decide
  have d23 : ct2 ≠ ct3 := by decide
  have d2u : ct2 ≠ cu := by decide
  have d2a0 : ct2 ≠ ca0 := by decide
  have d2a1 : ct2 ≠ ca1 := by decide
  have d3u : ct3 ≠ cu := by decide
  have d3a0 : ct3 ≠ ca0 := by decide
  have d3a1 : ct3 ≠ ca1 := by decide
  have du0 : cu ≠ ca0 := by decide
  have du1 : cu ≠ ca1 := by decide
  have d01 : ca0 ≠ ca1 := by decide
  have qmem (c : MixedCenter) (h : (P.row c).mode = .criticalFourShell) :
      q ∈ (P.row c).support := by
    by_contra hq
    have h' := (P.row c).q_not_mem_iff.mp hq
    rw [h] at h'
    cases h'
  have hq1 := qmem ct1 (hall ct1)
  have hq2 := qmem ct2 (hall ct2)
  have hq3 := qmem ct3 (hall ct3)
  have hqu := qmem cu (hall cu)
  have hq0 := qmem ca0 (hall ca0)
  have hq1a := qmem ca1 (hall ca1)
  let B1 := (P.row ct1).support
  let B2 := (P.row ct2).support
  let B3 := (P.row ct3).support
  let Bu := (P.row cu).support
  let B0 := (P.row ca0).support
  let B1a := (P.row ca1).support
  have hcard1 : B1.card = 4 := by simpa [B1] using (P.row ct1).card_eq_four
  have hcard2 : B2.card = 4 := by simpa [B2] using (P.row ct2).card_eq_four
  have hcard3 : B3.card = 4 := by simpa [B3] using (P.row ct3).card_eq_four
  have hcardu : Bu.card = 4 := by simpa [Bu] using (P.row cu).card_eq_four
  have hcard0 : B0.card = 4 := by simpa [B0] using (P.row ca0).card_eq_four
  have hcard1a : B1a.card = 4 := by simpa [B1a] using (P.row ca1).card_eq_four
  have hq1B : q ∈ B1 := by simpa [B1] using hq1
  have hq2B : q ∈ B2 := by simpa [B2] using hq2
  have hq3B : q ∈ B3 := by simpa [B3] using hq3
  have hquB : q ∈ Bu := by simpa [Bu] using hqu
  have hq0B : q ∈ B0 := by simpa [B0] using hq0
  have hq1aB : q ∈ B1a := by simpa [B1a] using hq1a
  have hcenter1 : t1 ∉ B1 := by simpa [B1, ct1] using (P.row ct1).center_not_mem
  have hcenter2 : t2 ∉ B2 := by simpa [B2, ct2] using (P.row ct2).center_not_mem
  have hcenter3 : t3 ∉ B3 := by simpa [B3, ct3] using (P.row ct3).center_not_mem
  have hcenteru : u ∉ Bu := by simpa [Bu, cu] using (P.row cu).center_not_mem
  have hcenter0 : a0 ∉ B0 := by simpa [B0, ca0] using (P.row ca0).center_not_mem
  have hcenter1a : a1 ∉ B1a := by simpa [B1a, ca1] using (P.row ca1).center_not_mem
  have hdanger1 : (B1 ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B1] using P.dangerousCircle_overlap ct1
  have hdanger2 : (B2 ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B2] using P.dangerousCircle_overlap ct2
  have hdanger3 : (B3 ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B3] using P.dangerousCircle_overlap ct3
  have hdangeru : (Bu ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [Bu] using P.dangerousCircle_overlap cu
  have hdanger0 : (B0 ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B0] using P.dangerousCircle_overlap ca0
  have hdanger1a : (B1a ∩ dangerousCircleLabels).card ≤ 2 := by
    simpa [B1a] using P.dangerousCircle_overlap ca1
  have hmask (B : Finset U5AuditLabel) (hcard : B.card = 4)
      (hq : q ∈ B) (center : U5AuditLabel) (hc : center ∉ B)
      (hd : (B ∩ dangerousCircleLabels).card ≤ 2) :
      supportMask B ∈ shellMasks center := by
    apply List.mem_filter.mpr
    constructor
    · simp [allMasks]
    · simp [maskSupport_supportMask, hcard, hq, hc, hd]
  have hm1 := hmask B1 hcard1 hq1B t1 hcenter1 hdanger1
  have hm2 := hmask B2 hcard2 hq2B t2 hcenter2 hdanger2
  have hm3 := hmask B3 hcard3 hq3B t3 hcenter3 hdanger3
  have hmu := hmask Bu hcardu hquB u hcenteru hdangeru
  have hm0 := hmask B0 hcard0 hq0B a0 hcenter0 hdanger0
  have hm1a := hmask B1a hcard1a hq1aB a1 hcenter1a hdanger1a
  have hNo : ∀ (c d e : MixedCenter), c ≠ d → c ≠ e → d ≠ e →
      ¬ (p ∈ (P.row c).support ∧ p ∈ (P.row d).support ∧
        p ∈ (P.row e).support) := by
    intro c d e hcd hce hde h
    apply P.shell_p_at_most_two c d e hcd hce hde
    exact ⟨hall c, h.1, hall d, h.2.1, hall e, h.2.2⟩
  have hOK : shellPatternOK B1 B2 B3 Bu B0 B1a = true := by
    simp [shellPatternOK, B1, B2, B3, Bu, B0, B1a,
      P.overlap ct1 ct2 d12, P.overlap ct1 ct3 d13,
      P.overlap ct1 cu d1u, P.overlap ct1 ca0 d1a0,
      P.overlap ct1 ca1 d1a1, P.overlap ct2 ct3 d23,
      P.overlap ct2 cu d2u, P.overlap ct2 ca0 d2a0,
      P.overlap ct2 ca1 d2a1, P.overlap ct3 cu d3u,
      P.overlap ct3 ca0 d3a0, P.overlap ct3 ca1 d3a1,
      P.overlap cu ca0 du0, P.overlap cu ca1 du1,
      P.overlap ca0 ca1 d01,
      hNo ct1 ct2 ct3 d12 d13 d23, hNo ct1 ct2 cu d12 d1u d2u,
      hNo ct1 ct2 ca0 d12 d1a0 d2a0, hNo ct1 ct2 ca1 d12 d1a1 d2a1,
      hNo ct1 ct3 cu d13 d1u d3u, hNo ct1 ct3 ca0 d13 d1a0 d3a0,
      hNo ct1 ct3 ca1 d13 d1a1 d3a1, hNo ct1 cu ca0 d1u d1a0 du0,
      hNo ct1 cu ca1 d1u d1a1 du1, hNo ct1 ca0 ca1 d1a0 d1a1 d01,
      hNo ct2 ct3 cu d23 d2u d3u, hNo ct2 ct3 ca0 d23 d2a0 d3a0,
      hNo ct2 ct3 ca1 d23 d2a1 d3a1, hNo ct2 cu ca0 d2u d2a0 du0,
      hNo ct2 cu ca1 d2u d2a1 du1, hNo ct2 ca0 ca1 d2a0 d2a1 d01,
      hNo ct3 cu ca0 d3u d3a0 du0, hNo ct3 cu ca1 d3u d3a1 du1,
      hNo ct3 ca0 ca1 d3a0 d3a1 d01, hNo cu ca0 ca1 du0 du1 d01]
  have hex : shellPatternExists = true := by
    simp only [shellPatternExists, List.any_eq_true]
    exact ⟨supportMask B1, hm1, supportMask B2, hm2, supportMask B3, hm3,
      supportMask Bu, hmu, supportMask B0, hm0, supportMask B1a, hm1a,
      by simpa [maskSupport_supportMask] using hOK⟩
  simpa [shellPatternExists_false] using hex

/-- Source-coupled form of the finite mode exclusion: among the six canonical
audit centers, at least one actual confined row is q-deleted. -/
theorem MixedConfinedAuditPacket.exists_confined_qDeletedRow_of_mode
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket) :
    ∃ x ∈ U5BoundedAuditCenters D q p
        ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1,
      ∃ B : Finset ℝ²,
        Nonempty (U5QDeletedK4Class D q x B) ∧
        B.card = 4 ∧
        B ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 := by
  rcases MixedConfinedAuditPacket.exists_canonical_mixedRowsWithDangerousCircle
      hmixed with ⟨W⟩
  rcases exists_qDeleted_mode_of_mixedSixRowPatternWithDangerousCircle
      W.pattern with ⟨c, hmode⟩
  have hreal : (W.rows c).mode = .qDeleted :=
    (W.row_mode c).symm.trans hmode
  cases hrow : W.rows c with
  | qDeleted B K hcard hconf =>
      exact ⟨W.labeling.point c.1, W.center_mem c, B, ⟨K⟩,
        hcard, hconf⟩
  | criticalFourShell K hconf =>
      simp [MixedConfinedRow.mode, hrow] at hreal

/-- Source-coupled form of the uniform shell-multiplicity count: among the six
canonical audit centers, two distinct actual confined rows are q-deleted.

This is a strict mode descent.  It does not by itself identify the reciprocal
incidences needed by the existing two-row contradiction consumers. -/
theorem MixedConfinedAuditPacket.exists_two_confined_qDeletedRows_of_mode
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket) :
    ∃ x₁ x₂,
      x₁ ∈ U5BoundedAuditCenters D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
      x₂ ∈ U5BoundedAuditCenters D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
      x₁ ≠ x₂ ∧
      ∃ B₁ B₂ : Finset ℝ²,
        Nonempty (U5QDeletedK4Class D q x₁ B₁) ∧
        B₁.card = 4 ∧
        B₁ ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
        Nonempty (U5QDeletedK4Class D q x₂ B₂) ∧
        B₂.card = 4 ∧
        B₂ ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 := by
  rcases MixedConfinedAuditPacket.exists_canonical_mixedRowsWithDangerousCircle
      hmixed with ⟨W⟩
  rcases W.pattern.toMixedSixRowPattern.exists_two_qDeleted_of_uniform_shell_multiplicity
      W.shell_label_at_most_two with ⟨c₁, c₂, hcne, hmode₁, hmode₂⟩
  have hreal₁ : (W.rows c₁).mode = .qDeleted :=
    (W.row_mode c₁).symm.trans hmode₁
  have hreal₂ : (W.rows c₂).mode = .qDeleted :=
    (W.row_mode c₂).symm.trans hmode₂
  have hxne : W.labeling.point c₁.1 ≠ W.labeling.point c₂.1 := by
    intro h
    apply hcne
    apply Subtype.ext
    exact W.labeling.injective h
  cases hrow₁ : W.rows c₁ with
  | qDeleted B₁ K₁ hcard₁ hconf₁ =>
      cases hrow₂ : W.rows c₂ with
      | qDeleted B₂ K₂ hcard₂ hconf₂ =>
          exact ⟨W.labeling.point c₁.1, W.labeling.point c₂.1,
            W.center_mem c₁, W.center_mem c₂, hxne,
            B₁, B₂, ⟨K₁⟩, hcard₁, hconf₁,
            ⟨K₂⟩, hcard₂, hconf₂⟩
      | criticalFourShell K₂ hconf₂ =>
          simp [MixedConfinedRow.mode, hrow₂] at hreal₂
  | criticalFourShell K₁ hconf₁ =>
      simp [MixedConfinedRow.mode, hrow₁] at hreal₁

/-- The bounded support attached to a fixed-triple audit frame really has
eight points.  This is the source-level cardinality fact behind the finite
eight-label projection. -/
theorem U3FixedTripleAuditFrame.boundedSupport_card_eq_eight
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) :
    (U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
      H.u H.a0 H.a1).card = 8 := by
  classical
  let T : Finset ℝ² := {t1, t2, t3}
  have hpT : p ∉ T := by
    intro hp
    exact (Finset.mem_erase.mp (H.dangerous.T_subset hp)).1 rfl
  have hqT : q ∉ T := by
    intro hq
    have hqSkeleton := (Finset.mem_erase.mp (H.dangerous.T_subset hq)).2
    exact (Finset.mem_erase.mp hqSkeleton).1 rfl
  have hpu : p ≠ H.u :=
    (ne_of_mem_skeleton_erase H.selected.candidate_mem).1
  have hqu : q ≠ H.u :=
    (ne_of_mem_skeleton_erase H.selected.candidate_mem).2
  have hpa0 : p ≠ H.a0 := (ne_of_mem_skeleton_erase H.a0_mem).1
  have hqa0 : q ≠ H.a0 := (ne_of_mem_skeleton_erase H.a0_mem).2
  have hpa1 : p ≠ H.a1 := (ne_of_mem_skeleton_erase H.a1_mem).1
  have hqa1 : q ≠ H.a1 := (ne_of_mem_skeleton_erase H.a1_mem).2
  have ha0Base : H.a0 ≠ H.u ∧ H.a0 ∉ T := by
    simpa [T] using H.a0_notin_base
  have ha1Base : H.a1 ≠ H.u ∧ H.a1 ≠ H.a0 ∧ H.a1 ∉ T := by
    simpa [T] using H.a1_notin_base
  have huT : H.u ∉ T := by
    simpa [T] using H.selected.candidate_notin_T
  have hpRest : p ∉ insert q (insert H.u (insert H.a0 (insert H.a1 T))) := by
    simp [H.dangerous.p_ne_q, hpu, hpa0, hpa1, hpT]
  have hqRest : q ∉ insert H.u (insert H.a0 (insert H.a1 T)) := by
    simp [hqu, hqa0, hqa1, hqT]
  have huRest : H.u ∉ insert H.a0 (insert H.a1 T) := by
    simp [ha0Base.1.symm, ha1Base.1.symm, huT]
  have ha0Rest : H.a0 ∉ insert H.a1 T := by
    simp [ha1Base.2.1.symm, ha0Base.2]
  change (insert p (insert q (insert H.u (insert H.a0 (insert H.a1 T))))).card = 8
  rw [Finset.card_insert_of_notMem hpRest,
    Finset.card_insert_of_notMem hqRest,
    Finset.card_insert_of_notMem huRest,
    Finset.card_insert_of_notMem ha0Rest,
    Finset.card_insert_of_notMem ha1Base.2.2]
  simpa [T] using H.dangerous.T_card

/-- Two rows supplied by the mixed-frame descent overlap in exactly one or
two points.  The upper bound is the two-circle theorem.  For the lower bound,
both four-point rows lie in the seven-point support obtained by erasing `q`
from the exact eight-point bounded support. -/
theorem MixedConfinedAuditPacket.exists_two_confined_qDeletedRows_with_intersection
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket) :
    ∃ x₁ x₂,
      x₁ ∈ U5BoundedAuditCenters D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
      x₂ ∈ U5BoundedAuditCenters D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
      x₁ ≠ x₂ ∧
      ∃ B₁ B₂ : Finset ℝ²,
        Nonempty (U5QDeletedK4Class D q x₁ B₁) ∧
        B₁.card = 4 ∧
        B₁ ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
        Nonempty (U5QDeletedK4Class D q x₂ B₂) ∧
        B₂.card = 4 ∧
        B₂ ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
        1 ≤ (B₁ ∩ B₂).card ∧ (B₁ ∩ B₂).card ≤ 2 := by
  rcases MixedConfinedAuditPacket.exists_two_confined_qDeletedRows_of_mode
      (H := H) hmixed with
    ⟨x₁, x₂, hx₁, hx₂, hxne, B₁, B₂, ⟨K₁⟩, hB₁card, hB₁,
      ⟨K₂⟩, hB₂card, hB₂⟩
  let S := U5BoundedSupport D q p
    ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
  have hqS : q ∈ S := by
    simp [S, U5BoundedSupport]
  have hSeraseCard : (S.erase q).card = 7 := by
    rw [Finset.card_erase_of_mem hqS]
    simpa [S] using
      U3FixedTripleAuditFrame.boundedSupport_card_eq_eight H
  have hB₁erase : B₁ ⊆ S.erase q := by
    intro z hz
    exact Finset.mem_erase.mpr ⟨fun hzq => K₁.q_not_mem (hzq ▸ hz), hB₁ hz⟩
  have hB₂erase : B₂ ⊆ S.erase q := by
    intro z hz
    exact Finset.mem_erase.mpr ⟨fun hzq => K₂.q_not_mem (hzq ▸ hz), hB₂ hz⟩
  have hunion : B₁ ∪ B₂ ⊆ S.erase q := by
    intro z hz
    rcases Finset.mem_union.mp hz with hz | hz
    · exact hB₁erase hz
    · exact hB₂erase hz
  have hunionCard : (B₁ ∪ B₂).card ≤ 7 := by
    simpa [hSeraseCard] using Finset.card_le_card hunion
  have hcardIdentity := Finset.card_union_add_card_inter B₁ B₂
  have hinterUpper : (B₁ ∩ B₂).card ≤ 2 :=
    U5QDeletedK4Class.inter_card_le_two K₁ K₂ hxne
  have hinterLower : 1 ≤ (B₁ ∩ B₂).card := by
    omega
  exact ⟨x₁, x₂, hx₁, hx₂, hxne, B₁, B₂, ⟨K₁⟩,
    hB₁card, hB₁, ⟨K₂⟩, hB₂card, hB₂,
    hinterLower, hinterUpper⟩

/-! The preceding packet has one further source-clean consequence: the two
q-deleted rows cannot both avoid the other row's center.  This is purely a
finite-support count, and does not add a geometric hypothesis. -/

theorem MixedConfinedAuditPacket.exists_two_confined_qDeletedRows_with_cross_incidence
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket) :
    ∃ x₁ x₂,
      x₁ ∈ U5BoundedAuditCenters D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
      x₂ ∈ U5BoundedAuditCenters D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
      x₁ ≠ x₂ ∧
      ∃ B₁ B₂ : Finset ℝ²,
        Nonempty (U5QDeletedK4Class D q x₁ B₁) ∧
        B₁.card = 4 ∧
        B₁ ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
        Nonempty (U5QDeletedK4Class D q x₂ B₂) ∧
        B₂.card = 4 ∧
        B₂ ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
        1 ≤ (B₁ ∩ B₂).card ∧ (B₁ ∩ B₂).card ≤ 2 ∧
        (x₁ ∈ B₂ ∨ x₂ ∈ B₁) := by
  rcases MixedConfinedAuditPacket.exists_two_confined_qDeletedRows_with_intersection
      (H := H) hmixed with
    ⟨x₁, x₂, hx₁, hx₂, hxne, B₁, B₂, ⟨K₁⟩, hB₁card, hB₁,
      ⟨K₂⟩, hB₂card, hB₂, hinterLower, hinterUpper⟩
  let T : Finset ℝ² := {t1, t2, t3}
  let S := U5BoundedSupport D q p T H.u H.a0 H.a1
  have hqT : q ∉ T := by
    intro hq
    have hqSkeleton := (Finset.mem_erase.mp (H.dangerous.T_subset hq)).2
    exact (Finset.mem_erase.mp hqSkeleton).1 rfl
  have hqu : q ≠ H.u := (ne_of_mem_skeleton_erase H.selected.candidate_mem).2
  have hqa0 : q ≠ H.a0 := (ne_of_mem_skeleton_erase H.a0_mem).2
  have hqa1 : q ≠ H.a1 := (ne_of_mem_skeleton_erase H.a1_mem).2
  have hqCenters : q ∉ U5BoundedAuditCenters D q p T H.u H.a0 H.a1 := by
    simp [U5BoundedAuditCenters, hqu, hqa0, hqa1, hqT]
  have hx₁S : x₁ ∈ S := by
    have hx₁' : x₁ ∈ U5BoundedAuditCenters D q p T H.u H.a0 H.a1 := by
      simpa [T] using hx₁
    simp only [S, U5BoundedSupport]
    exact Finset.mem_insert_of_mem (Finset.mem_insert_of_mem hx₁')
  have hx₂S : x₂ ∈ S := by
    have hx₂' : x₂ ∈ U5BoundedAuditCenters D q p T H.u H.a0 H.a1 := by
      simpa [T] using hx₂
    simp only [S, U5BoundedSupport]
    exact Finset.mem_insert_of_mem (Finset.mem_insert_of_mem hx₂')
  have hq₁ : q ≠ x₁ := by
    intro h
    apply hqCenters
    simpa [h] using hx₁
  have hq₂ : q ≠ x₂ := by
    intro h
    apply hqCenters
    simpa [h] using hx₂
  have hqS : q ∈ S := by simp [S, U5BoundedSupport]
  have hB₁erase : B₁ ⊆ S.erase q := by
    intro z hz
    exact Finset.mem_erase.mpr ⟨fun hzq => K₁.q_not_mem (hzq ▸ hz), hB₁ hz⟩
  have hB₂erase : B₂ ⊆ S.erase q := by
    intro z hz
    exact Finset.mem_erase.mpr ⟨fun hzq => K₂.q_not_mem (hzq ▸ hz), hB₂ hz⟩
  have hx₁Sq : x₁ ∈ S.erase q := Finset.mem_erase.mpr ⟨hq₁.symm, hx₁S⟩
  have hx₂Sq : x₂ ∈ S.erase q := Finset.mem_erase.mpr ⟨hq₂.symm, hx₂S⟩
  have hx₂Sx₁ : x₂ ∈ (S.erase q).erase x₁ :=
    Finset.mem_erase.mpr ⟨hxne.symm, hx₂Sq⟩
  have hSCard : S.card = 8 := by
    simpa [S, T] using U3FixedTripleAuditFrame.boundedSupport_card_eq_eight H
  have hRCard : (((S.erase q).erase x₁).erase x₂).card = 5 := by
    rw [Finset.card_erase_of_mem hx₂Sx₁,
      Finset.card_erase_of_mem hx₁Sq,
      Finset.card_erase_of_mem hqS, hSCard]
  by_cases hcross : x₁ ∈ B₂ ∨ x₂ ∈ B₁
  · exact ⟨x₁, x₂, hx₁, hx₂, hxne, B₁, B₂, ⟨K₁⟩,
      hB₁card, hB₁, ⟨K₂⟩, hB₂card, hB₂,
      hinterLower, hinterUpper, hcross⟩
  · have hnot₁ : x₁ ∉ B₂ := by
      intro hx
      exact hcross (Or.inl hx)
    have hnot₂ : x₂ ∉ B₁ := by
      intro hx
      exact hcross (Or.inr hx)
    have hB₁R : B₁ ⊆ ((S.erase q).erase x₁).erase x₂ := by
      intro z hz
      have hzSq : z ∈ S.erase q := hB₁erase hz
      have hz₁ : z ≠ x₁ := (Finset.mem_erase.mp (K₁.subset hz)).1
      have hz₂ : z ≠ x₂ := by
        intro hzx₂
        exact hnot₂ (hzx₂ ▸ hz)
      exact Finset.mem_erase.mpr ⟨hz₂, Finset.mem_erase.mpr ⟨hz₁, hzSq⟩⟩
    have hB₂R : B₂ ⊆ ((S.erase q).erase x₁).erase x₂ := by
      intro z hz
      have hzSq : z ∈ S.erase q := hB₂erase hz
      have hz₁ : z ≠ x₁ := by
        intro hzx₁
        exact hnot₁ (hzx₁ ▸ hz)
      have hz₂ : z ≠ x₂ := (Finset.mem_erase.mp (K₂.subset hz)).1
      exact Finset.mem_erase.mpr ⟨hz₂, Finset.mem_erase.mpr ⟨hz₁, hzSq⟩⟩
    have hunionR : B₁ ∪ B₂ ⊆ ((S.erase q).erase x₁).erase x₂ := by
      intro z hz
      rcases Finset.mem_union.mp hz with hz | hz
      · exact hB₁R hz
      · exact hB₂R hz
    have hunionCard : (B₁ ∪ B₂).card ≤ 5 := by
      calc
        (B₁ ∪ B₂).card ≤ (((S.erase q).erase x₁).erase x₂).card :=
          Finset.card_le_card hunionR
        _ = 5 := hRCard
    have hunionIdentity := Finset.card_union_add_card_inter B₁ B₂
    have hfalse : False := by omega
    exact hfalse.elim

end U3MixedFiniteExtraction
end Problem97
