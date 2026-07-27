import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover

/-!
# An exact rational convex local two-cycle

This scratch file certifies a convex-independent rational carrier containing two
critical exact-four rows `q ↦ p` and `p ↦ q`.  It is intentionally not a
production module and does not construct a `CriticalShellSystem` on every vertex
of the carrier.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97.BlockerCycleGeometry

noncomputable section

def p : ℝ² := !₂[(0 : ℝ), 0]
def q : ℝ² := !₂[(1 : ℝ), 0]

def a : ℝ² := !₂[-(3 : ℝ) / 5, -(4 : ℝ) / 5]
def b : ℝ² := !₂[-(85 : ℝ) / 157, -(132 : ℝ) / 157]
def c : ℝ² := !₂[(35 : ℝ) / 37, (12 : ℝ) / 37]

def d : ℝ² := !₂[(98 : ℝ) / 85, -(84 : ℝ) / 85]
def e : ℝ² := !₂[(1 : ℝ), -1]
def f : ℝ² := !₂[(32 : ℝ) / 41, (40 : ℝ) / 41]

def carrier : Finset ℝ² := {p, q, a, b, c, d, e, f}
def pShell : Finset ℝ² := {q, a, b, c}
def qShell : Finset ℝ² := {p, d, e, f}

def linearScore (nx ny : ℝ) (z : ℝ²) : ℝ := nx * z 0 + ny * z 1

lemma linearScore_isLinear (nx ny : ℝ) : IsLinearMap ℝ (linearScore nx ny) := by
  constructor
  · intro x y
    simp [linearScore]
    ring
  · intro r x
    simp [linearScore]
    ring

lemma excluded_by_strict_support {A : Finset ℝ²} {x : ℝ²} (nx ny : ℝ)
    (h : ∀ z ∈ A, z ≠ x → linearScore nx ny z < linearScore nx ny x) :
    x ∉ convexHull ℝ (((A : Finset ℝ²) : Set ℝ²) \ {x}) := by
  intro hx
  have hsub : (((A : Finset ℝ²) : Set ℝ²) \ {x}) ⊆
      {z | linearScore nx ny z < linearScore nx ny x} := by
    intro z hz
    exact h z hz.1 hz.2
  have hmem := convexHull_min hsub
    (convex_halfSpace_lt (linearScore_isLinear nx ny) (linearScore nx ny x)) hx
  exact (lt_irrefl (linearScore nx ny x)) hmem

private lemma carrier_cases {z : ℝ²} (hz : z ∈ carrier) :
    z = p ∨ z = q ∨ z = a ∨ z = b ∨ z = c ∨ z = d ∨ z = e ∨ z = f := by
  simpa [carrier] using hz

private lemma strict_support_p :
    ∀ z ∈ carrier, z ≠ p → linearScore (-364) 283 z < linearScore (-364) 283 p := by
  intro z hz hzp
  rcases carrier_cases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore] at hzp
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore]

private lemma strict_support_q :
    ∀ z ∈ carrier, z ≠ q → linearScore 4128 651 z < linearScore 4128 651 q := by
  intro z hz hzq
  rcases carrier_cases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore] at hzq
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore]

private lemma strict_support_a :
    ∀ z ∈ carrier, z ≠ a → linearScore (-132) 85 z < linearScore (-132) 85 a := by
  intro z hz hza
  rcases carrier_cases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore] at hza
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore]

private lemma strict_support_b :
    ∀ z ∈ carrier, z ≠ b → linearScore (-1) (-8) z < linearScore (-1) (-8) b := by
  intro z hz hzb
  rcases carrier_cases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore] at hzb
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore]

private lemma strict_support_c :
    ∀ z ∈ carrier, z ≠ c → linearScore 40 9 z < linearScore 40 9 c := by
  intro z hz hzc
  rcases carrier_cases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore] at hzc
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore]

private lemma strict_support_d :
    ∀ z ∈ carrier, z ≠ d → linearScore 1 0 z < linearScore 1 0 d := by
  intro z hz hzd
  rcases carrier_cases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore] at hzd
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore]

private lemma strict_support_e :
    ∀ z ∈ carrier, z ≠ e →
      linearScore (-1968) (-22611) z < linearScore (-1968) (-22611) e := by
  intro z hz hze
  rcases carrier_cases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore] at hze
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore]

private lemma strict_support_f :
    ∀ z ∈ carrier, z ≠ f → linearScore (-12) 35 z < linearScore (-12) 35 f := by
  intro z hz hzf
  rcases carrier_cases hz with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore] at hzf
  all_goals norm_num [p, q, a, b, c, d, e, f, linearScore]

theorem carrier_convexIndep : Problem97.ConvexIndep carrier := by
  intro x hx
  rcases carrier_cases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact excluded_by_strict_support (-364) 283 strict_support_p
  · exact excluded_by_strict_support 4128 651 strict_support_q
  · exact excluded_by_strict_support (-132) 85 strict_support_a
  · exact excluded_by_strict_support (-1) (-8) strict_support_b
  · exact excluded_by_strict_support 40 9 strict_support_c
  · exact excluded_by_strict_support 1 0 strict_support_d
  · exact excluded_by_strict_support (-1968) (-22611) strict_support_e
  · exact excluded_by_strict_support (-12) 35 strict_support_f

private lemma dist_eq_one_of_coordSqDist_eq_one {x y : ℝ²}
    (h : coordSqDist x y = 1) : dist x y = 1 := by
  rw [coordSqDist_eq_dist_sq] at h
  have hn : 0 ≤ dist x y := dist_nonneg
  nlinarith

private lemma dist_ne_one_of_coordSqDist_ne_one {x y : ℝ²}
    (h : coordSqDist x y ≠ 1) : dist x y ≠ 1 := by
  intro hdist
  apply h
  rw [coordSqDist_eq_dist_sq, hdist]
  norm_num

private lemma p_dist_q : dist p q = 1 := by
  apply dist_eq_one_of_coordSqDist_eq_one
  norm_num [coordSqDist, p, q]

private lemma p_dist_a : dist p a = 1 := by
  apply dist_eq_one_of_coordSqDist_eq_one
  norm_num [coordSqDist, p, a]

private lemma p_dist_b : dist p b = 1 := by
  apply dist_eq_one_of_coordSqDist_eq_one
  norm_num [coordSqDist, p, b]

private lemma p_dist_c : dist p c = 1 := by
  apply dist_eq_one_of_coordSqDist_eq_one
  norm_num [coordSqDist, p, c]

private lemma p_dist_d_ne : dist p d ≠ 1 := by
  apply dist_ne_one_of_coordSqDist_ne_one
  norm_num [coordSqDist, p, d]

private lemma p_dist_e_ne : dist p e ≠ 1 := by
  apply dist_ne_one_of_coordSqDist_ne_one
  norm_num [coordSqDist, p, e]

private lemma p_dist_f_ne : dist p f ≠ 1 := by
  apply dist_ne_one_of_coordSqDist_ne_one
  norm_num [coordSqDist, p, f]

private lemma q_dist_p : dist q p = 1 := by
  simpa [dist_comm] using p_dist_q

private lemma q_dist_d : dist q d = 1 := by
  apply dist_eq_one_of_coordSqDist_eq_one
  norm_num [coordSqDist, q, d]

private lemma q_dist_e : dist q e = 1 := by
  apply dist_eq_one_of_coordSqDist_eq_one
  norm_num [coordSqDist, q, e]

private lemma q_dist_f : dist q f = 1 := by
  apply dist_eq_one_of_coordSqDist_eq_one
  norm_num [coordSqDist, q, f]

private lemma q_dist_a_ne : dist q a ≠ 1 := by
  apply dist_ne_one_of_coordSqDist_ne_one
  norm_num [coordSqDist, q, a]

private lemma q_dist_b_ne : dist q b ≠ 1 := by
  apply dist_ne_one_of_coordSqDist_ne_one
  norm_num [coordSqDist, q, b]

private lemma q_dist_c_ne : dist q c ≠ 1 := by
  apply dist_ne_one_of_coordSqDist_ne_one
  norm_num [coordSqDist, q, c]

theorem selectedClass_p_one : SelectedClass carrier p 1 = pShell := by
  ext z
  constructor
  · intro hz
    rcases mem_selectedClass.mp hz with ⟨hzA, hzdist⟩
    rcases carrier_cases hzA with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    · simpa using hzdist
    · simp [pShell]
    · simp [pShell]
    · simp [pShell]
    · simp [pShell]
    · exact (p_dist_d_ne hzdist).elim
    · exact (p_dist_e_ne hzdist).elim
    · exact (p_dist_f_ne hzdist).elim
  · intro hz
    simp only [pShell, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact mem_selectedClass.mpr ⟨by simp [carrier], p_dist_q⟩
    · exact mem_selectedClass.mpr ⟨by simp [carrier], p_dist_a⟩
    · exact mem_selectedClass.mpr ⟨by simp [carrier], p_dist_b⟩
    · exact mem_selectedClass.mpr ⟨by simp [carrier], p_dist_c⟩

theorem selectedClass_q_one : SelectedClass carrier q 1 = qShell := by
  ext z
  constructor
  · intro hz
    rcases mem_selectedClass.mp hz with ⟨hzA, hzdist⟩
    rcases carrier_cases hzA with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    · simp [qShell]
    · simpa using hzdist
    · exact (q_dist_a_ne hzdist).elim
    · exact (q_dist_b_ne hzdist).elim
    · exact (q_dist_c_ne hzdist).elim
    · simp [qShell]
    · simp [qShell]
    · simp [qShell]
  · intro hz
    simp only [qShell, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact mem_selectedClass.mpr ⟨by simp [carrier], q_dist_p⟩
    · exact mem_selectedClass.mpr ⟨by simp [carrier], q_dist_d⟩
    · exact mem_selectedClass.mpr ⟨by simp [carrier], q_dist_e⟩
    · exact mem_selectedClass.mpr ⟨by simp [carrier], q_dist_f⟩

private lemma p_nonunit_class_subset (ρ : ℝ) (hρ : 0 < ρ) (hne : ρ ≠ 1) :
    SelectedClass carrier p ρ ⊆ {d, e, f} := by
  intro z hz
  rcases mem_selectedClass.mp hz with ⟨hzA, hzdist⟩
  rcases carrier_cases hzA with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · rw [dist_self] at hzdist
    nlinarith
  · exact (hne (p_dist_q.symm.trans hzdist).symm).elim
  · exact (hne (p_dist_a.symm.trans hzdist).symm).elim
  · exact (hne (p_dist_b.symm.trans hzdist).symm).elim
  · exact (hne (p_dist_c.symm.trans hzdist).symm).elim
  · simp
  · simp
  · simp

private lemma q_nonunit_class_subset (ρ : ℝ) (hρ : 0 < ρ) (hne : ρ ≠ 1) :
    SelectedClass carrier q ρ ⊆ {a, b, c} := by
  intro z hz
  rcases mem_selectedClass.mp hz with ⟨hzA, hzdist⟩
  rcases carrier_cases hzA with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact (hne (q_dist_p.symm.trans hzdist).symm).elim
  · rw [dist_self] at hzdist
    nlinarith
  · simp
  · simp
  · simp
  · exact (hne (q_dist_d.symm.trans hzdist).symm).elim
  · exact (hne (q_dist_e.symm.trans hzdist).symm).elim
  · exact (hne (q_dist_f.symm.trans hzdist).symm).elim

theorem p_isUniqueFourCenter :
    ATailMinimalUniqueFourCover.IsUniqueFourCenter carrier p := by
  refine ⟨by simp [carrier], 1, by norm_num, ?_, ?_⟩
  · rw [selectedClass_p_one]
    norm_num [pShell, q, a, b, c]
  · intro ρ hρ hcard
    by_contra hne
    have hle := Finset.card_le_card (p_nonunit_class_subset ρ hρ hne)
    have hthree : ({d, e, f} : Finset ℝ²).card = 3 := by
      norm_num [d, e, f]
    omega

theorem q_isUniqueFourCenter :
    ATailMinimalUniqueFourCover.IsUniqueFourCenter carrier q := by
  refine ⟨by simp [carrier], 1, by norm_num, ?_, ?_⟩
  · rw [selectedClass_q_one]
    norm_num [qShell, p, d, e, f]
  · intro ρ hρ hcard
    by_contra hne
    have hle := Finset.card_le_card (q_nonunit_class_subset ρ hρ hne)
    have hthree : ({a, b, c} : Finset ℝ²).card = 3 := by
      norm_num [a, b, c]
    omega

def p_criticalShell : CriticalFourShell carrier q p where
  center_mem := by norm_num [carrier, p, q]
  radius := 1
  radius_pos := by norm_num
  support := pShell
  support_eq := by
    simpa [SelectedClass] using selectedClass_p_one.symm
  support_card := by norm_num [pShell, q, a, b, c]
  q_mem_support := by simp [pShell]

def q_criticalShell : CriticalFourShell carrier p q where
  center_mem := by norm_num [carrier, p, q]
  radius := 1
  radius_pos := by norm_num
  support := qShell
  support_eq := by
    simpa [SelectedClass] using selectedClass_q_one.symm
  support_card := by norm_num [qShell, p, d, e, f]
  q_mem_support := by simp [qShell]

end

end Problem97.BlockerCycleGeometry
