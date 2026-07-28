import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# D-family bank (scratch)

Kernel-checked, `sorry`-free bank theorems for the structural derivations
claimed in

* `docs/solve-prompts/2026-07-28-d-round1-response-a.md` (run A), and
* `docs/solve-prompts/2026-07-28-d-round1-response-b.md` (run B),

against the four live D leaves in
`Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`:

* D1 `false_of_exactFourPostCardElevenTwoRadiusBranch`,
* D2 `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`,
* D3 `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual`,
* D4 `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`.

Every hypothesis block below is the leaf's own binder block (up to removal of
the `_` linter prefix), so each theorem instantiates verbatim in the leaf
context.  Nothing here is wired into the production files; these are BANK
theorems only.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace DPackageBank

open ATAILStageOnePrescribedApexDichotomy
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailFrontierLiveClosure
open ATailPhysicalSecondApexSwap
open FirstApexExactFiveInteriorFrontier
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/- ## Target 1 — the unique-four-center helper

Stated for an arbitrary carrier `A`, center `c` and blocked source `x`, so
that the C-package and B-package lanes can reuse it. -/

/-- **Unique-four center, membership form.**  If deleting `x` destroys every
four-point equidistant class at `c`, then *every* ambient radius class at `c`
with at least four points contains `x`. -/
theorem mem_selectedClass_of_card_ge_four_of_erase_blocked
    {A : Finset ℝ²} {c x : ℝ²} {s : ℝ}
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase x) c)
    (hs : 0 < s)
    (hcard : 4 ≤ (SelectedClass A c s).card) :
    x ∈ SelectedClass A c s := by
  classical
  by_contra hx
  have hEq : (SelectedClass (A.erase x) c s).card = (SelectedClass A c s).card :=
    selectedClass_erase_card_eq_of_not_mem hx
  refine hblocked ⟨s, hs, ?_⟩
  change 4 ≤ (SelectedClass (A.erase x) c s).card
  rw [hEq]
  exact hcard

/-- **Unique-four center, radius form.**  Under the same hypothesis every
four-point radius at `c` equals `dist c x`; so `c` carries at most one
`K4` radius even though uniqueness is not a `CriticalShellSystem` field. -/
theorem eq_dist_of_card_ge_four_of_erase_blocked
    {A : Finset ℝ²} {c x : ℝ²} {s : ℝ}
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase x) c)
    (hs : 0 < s)
    (hcard : 4 ≤ (SelectedClass A c s).card) :
    s = dist c x :=
  (mem_selectedClass.mp
    (mem_selectedClass_of_card_ge_four_of_erase_blocked hblocked hs hcard)).2.symm

/-- **Unique-four center, corollary (2) of run A.**  With an exact four-point
row `R_x` at `c` through the blocked source `x`, a single deletion survives at
`c` exactly when the deleted point is off that row. -/
theorem hasNEquidistantPointsAt_erase_iff_not_mem_exactFourRow
    {A : Finset ℝ²} {c x y : ℝ²} {r : ℝ}
    (hr : 0 < r)
    (hx : x ∈ SelectedClass A c r)
    (hcard : (SelectedClass A c r).card = 4)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase x) c) :
    HasNEquidistantPointsAt 4 (A.erase y) c ↔ y ∉ SelectedClass A c r := by
  classical
  constructor
  · rintro ⟨s, hs, hscard⟩
    have hsErase : 4 ≤ (SelectedClass (A.erase y) c s).card := by
      simpa [SelectedClass] using hscard
    have hsAmbient : 4 ≤ (SelectedClass A c s).card := by
      refine hsErase.trans (Finset.card_le_card ?_)
      intro z hz
      rcases mem_selectedClass.mp hz with ⟨hzErase, hzdist⟩
      exact mem_selectedClass.mpr ⟨Finset.mem_of_mem_erase hzErase, hzdist⟩
    have hsr : s = r := by
      have h1 := eq_dist_of_card_ge_four_of_erase_blocked hblocked hs hsAmbient
      have h2 : r = dist c x := (mem_selectedClass.mp hx).2.symm
      exact h1.trans h2.symm
    subst hsr
    intro hy
    rw [selectedClass_erase_eq, Finset.card_erase_of_mem hy, hcard] at hsErase
    omega
  · intro hy
    have hEq : (SelectedClass (A.erase y) c r).card = (SelectedClass A c r).card :=
      selectedClass_erase_card_eq_of_not_mem hy
    refine ⟨r, hr, ?_⟩
    change 4 ≤ (SelectedClass (A.erase y) c r).card
    rw [hEq, hcard]

/-- The chosen critical shell of a source is exactly the ambient radius class
at its blocker center. -/
theorem criticalShell_support_eq_selectedClass
    {A : Finset ℝ²} (H : CriticalShellSystem A) (q : ℝ²) (hq : q ∈ A) :
    (H.selectedAt q hq).toCriticalFourShell.support =
      SelectedClass A (H.centerAt q hq)
        (H.selectedAt q hq).toCriticalFourShell.radius :=
  (H.selectedAt q hq).toCriticalFourShell.support_eq

/-- **Unique-four center at a chosen blocker.**  Every positive ambient radius
with four points at a chosen blocker center is that shell's radius. -/
theorem criticalShell_unique_four_radius
    {A : Finset ℝ²} (H : CriticalShellSystem A) (q : ℝ²) (hq : q ∈ A)
    {s : ℝ} (hs : 0 < s)
    (hcard : 4 ≤ (SelectedClass A (H.centerAt q hq) s).card) :
    s = (H.selectedAt q hq).toCriticalFourShell.radius := by
  have h := eq_dist_of_card_ge_four_of_erase_blocked
    (H.no_qfree_at q hq) hs hcard
  refine h.trans ?_
  exact (H.selectedAt q hq).toCriticalFourShell.support_eq_radius q
    (H.selectedAt q hq).toCriticalFourShell.q_mem_support

/-- **Corollary (2), critical-shell form.**  A single deletion survives at a
chosen blocker center exactly when the deleted point is off the chosen
shell. -/
theorem criticalShell_erase_survives_iff_not_mem_support
    {A : Finset ℝ²} (H : CriticalShellSystem A) (q : ℝ²) (hq : q ∈ A)
    (y : ℝ²) :
    HasNEquidistantPointsAt 4 (A.erase y) (H.centerAt q hq) ↔
      y ∉ (H.selectedAt q hq).toCriticalFourShell.support := by
  have hsupp := criticalShell_support_eq_selectedClass H q hq
  rw [hsupp]
  refine hasNEquidistantPointsAt_erase_iff_not_mem_exactFourRow
    (H.selectedAt q hq).toCriticalFourShell.radius_pos ?_ ?_
    (H.no_qfree_at q hq)
  · rw [← hsupp]
    exact (H.selectedAt q hq).toCriticalFourShell.q_mem_support
  · rw [← hsupp]
    exact (H.selectedAt q hq).toCriticalFourShell.support_card

/-- A `K4` witness at a center survives passing to a larger ambient set. -/
theorem equidistantAt_mono
    {n : ℕ} {X Y : Finset ℝ²} {p : ℝ²} (hsub : X ⊆ Y)
    (h : HasNEquidistantPointsAt n X p) :
    HasNEquidistantPointsAt n Y p := by
  rcases h with ⟨r, hr, hcard⟩
  refine ⟨r, hr, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzX, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzX, hzdist⟩

/-- Two radius classes at distinct centers meet in at most two points. -/
theorem selectedClass_inter_card_le_two
    {A : Finset ℝ²} {x y : ℝ²} {r s : ℝ} (hxy : x ≠ y) :
    (SelectedClass A x r ∩ SelectedClass A y s).card ≤ 2 := by
  classical
  by_contra hle
  have h3 : 3 ≤ (SelectedClass A x r ∩ SelectedClass A y s).card := by omega
  rcases Finset.exists_subset_card_eq
    (s := SelectedClass A x r ∩ SelectedClass A y s) h3 with ⟨E, hEsub, hEcard⟩
  rw [Finset.card_eq_three] at hEcard
  rcases hEcard with ⟨a, b, c, hab, hac, hbc, hEeq⟩
  have haE : a ∈ E := by simp [hEeq]
  have hbE : b ∈ E := by simp [hEeq]
  have hcE : c ∈ E := by simp [hEeq]
  let sx : Sphere ℝ² := ⟨x, r⟩
  let sy : Sphere ℝ² := ⟨y, s⟩
  have hsne : sx ≠ sy := fun h ↦ hxy (congrArg (fun t : Sphere ℝ² ↦ t.1) h)
  have hmemx : ∀ z ∈ E, z ∈ sx := by
    intro z hz
    rw [mem_sphere]
    calc
      dist z x = dist x z := dist_comm z x
      _ = r := (mem_selectedClass.mp (Finset.mem_inter.mp (hEsub hz)).1).2
  have hmemy : ∀ z ∈ E, z ∈ sy := by
    intro z hz
    rw [mem_sphere]
    calc
      dist z y = dist y z := dist_comm z y
      _ = s := (mem_selectedClass.mp (Finset.mem_inter.mp (hEsub hz)).2).2
  rcases two_circle_common_point_eq_endpoint hsne hab
      (hmemx a haE) (hmemx b hbE) (hmemy a haE) (hmemy b hbE)
      (hmemx c hcE) (hmemy c hcE) with hca | hcb
  · exact hac hca.symm
  · exact hbc hcb.symm

/- ## Shared packet plumbing

Copies of the private apex facts used by the production modules. -/

/-- The first opposite apex is a carrier point. -/
theorem oppApex1_mem_A {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- The second opposite apex is a carrier point. -/
theorem oppApex2_mem_A {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- The two opposite apexes are distinct Moser vertices. -/
theorem oppApex1_ne_oppApex2 {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] using
      S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] using
      S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] using
      S.triangle.v12_ne

/-- The first apex is the vertex opposite the first opposite cap index. -/
theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The second apex is the vertex opposite the second opposite cap index. -/
theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- The first opposite cap is the closed cap of the first opposite index. -/
theorem oppCap1_eq_capByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppCap1 = S.capByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppCap1, SurplusCapPacket.capByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The second opposite cap is the closed cap of the second opposite index. -/
theorem oppCap2_eq_capByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppCap2 = S.capByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppCap2, SurplusCapPacket.capByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- The second opposite cap is the left-adjacent cap of the first opposite
index; this is the ordered-cap fact behind the one-hit bound at `a₁`. -/
theorem leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.oppIndex1 = S.capByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.leftAdjacentCapByIndex, SurplusCapPacket.capByIndex,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi]

/- ## Target 2 and 3 — leaf D4
`false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`
(`FrontierLiveClosure.lean:6132`).  The single binder is
`R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F`. -/

/-- The common obstruction center `b = χ(q̃) = χ(w̃)` is a carrier point. -/
theorem d4_commonObstructionCenter_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    H.centerAt R.interior.frontier.pair.q R.interior.frontier.pair.q_mem_A ∈
      D.A :=
  (Finset.mem_erase.mp
    (H.selectedAt R.interior.frontier.pair.q
      R.interior.frontier.pair.q_mem_A).toCriticalFourShell.center_mem).2

/-- `b ≠ a₁`: the first apex is fully deletion robust (E6), the common
obstruction center is not. -/
theorem d4_commonObstructionCenter_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    H.centerAt R.interior.frontier.pair.q R.interior.frontier.pair.q_mem_A ≠
      S.oppApex1 := by
  intro h
  refine H.no_qfree_at R.interior.frontier.pair.q
    R.interior.frontier.pair.q_mem_A ?_
  rw [h]
  exact R.firstApex_fullyDeletionRobust.survives _
    R.interior.frontier.pair.q_mem_A

/-- `b ≠ a₂`: `A ∖ {q̃, w̃}` still has a `K4` witness at the second apex (E8),
so a fortiori `A ∖ {q̃}` does. -/
theorem d4_commonObstructionCenter_ne_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    H.centerAt R.interior.frontier.pair.q R.interior.frontier.pair.q_mem_A ≠
      S.oppApex2 := by
  intro h
  refine H.no_qfree_at R.interior.frontier.pair.q
    R.interior.frontier.pair.q_mem_A ?_
  rw [h]
  exact equidistantAt_mono (Finset.erase_subset _ _)
    R.interior.frontier.secondApexDouble

/-- **Run B (1) — the global one-defect two-deletion cover.**  Every carrier
center other than `b` keeps a `K4` witness after deleting `q̃` or after
deleting `w̃`. -/
theorem d4_global_twoDeletion_cover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    ∀ c : ℝ², c ∈ D.A →
      c ≠ H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A →
      HasNEquidistantPointsAt 4
          (D.A.erase R.interior.frontier.pair.q) c ∨
        HasNEquidistantPointsAt 4
          (D.A.erase R.interior.frontier.pair.w) c := by
  classical
  intro c hcA hcNe
  by_cases hcApex : c = S.oppApex1
  · subst hcApex
    exact Or.inl (R.firstApex_fullyDeletionRobust.survives _
      R.interior.frontier.pair.q_mem_A)
  · rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 c hcA) with ⟨r, hr, hrcard⟩
    have hbis :
        dist c R.interior.frontier.pair.q ≠
          dist c R.interior.frontier.pair.w :=
      R.no_third_carrier_bisector c hcA hcApex hcNe
    by_cases hq : R.interior.frontier.pair.q ∈ SelectedClass D.A c r
    · right
      have hw : R.interior.frontier.pair.w ∉ SelectedClass D.A c r := by
        intro hw
        exact hbis
          (((mem_selectedClass.mp hq).2).trans
            ((mem_selectedClass.mp hw).2).symm)
      refine ⟨r, hr, ?_⟩
      change 4 ≤
        (SelectedClass (D.A.erase R.interior.frontier.pair.w) c r).card
      rw [selectedClass_erase_card_eq_of_not_mem hw]
      exact hrcard
    · left
      refine ⟨r, hr, ?_⟩
      change 4 ≤
        (SelectedClass (D.A.erase R.interior.frontier.pair.q) c r).card
      rw [selectedClass_erase_card_eq_of_not_mem hq]
      exact hrcard

/-- **Run B (2), `q̃` half.**  This is the critical-shell no-survival field. -/
theorem d4_no_survival_at_commonObstructionCenter_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.q)
      (H.centerAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A) :=
  H.no_qfree_at R.interior.frontier.pair.q R.interior.frontier.pair.q_mem_A

/-- **Run B (2), `w̃` half.**  The `w̃` no-survival field transported along
the common-center equality. -/
theorem d4_no_survival_at_commonObstructionCenter_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.w)
      (H.centerAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A) := by
  rw [R.obstructionCenters_eq]
  exact H.no_qfree_at R.interior.frontier.pair.w
    R.interior.frontier.pair.w_mem_A

/-- **Run B (1)–(2) packaged.**  `b` is the unique possible common defect of
the two singleton deletions. -/
theorem d4_global_twoDeletion_cover_with_unique_common_defect
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    (∀ c : ℝ², c ∈ D.A →
        c ≠ H.centerAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A →
        HasNEquidistantPointsAt 4
            (D.A.erase R.interior.frontier.pair.q) c ∨
          HasNEquidistantPointsAt 4
            (D.A.erase R.interior.frontier.pair.w) c) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.q)
          (H.centerAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.w)
          (H.centerAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A) :=
  ⟨d4_global_twoDeletion_cover R,
    d4_no_survival_at_commonObstructionCenter_q R,
    d4_no_survival_at_commonObstructionCenter_w R⟩

/-- **Run A (6), radii.**  The two blocker rows share their radius. -/
theorem d4_sharedRow_radius_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    (H.selectedAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A).toCriticalFourShell.radius =
      (H.selectedAt R.interior.frontier.pair.w
        R.interior.frontier.pair.w_mem_A).toCriticalFourShell.radius := by
  have h1 :
      dist (H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A) R.interior.frontier.pair.w =
        (H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.radius :=
    (H.selectedAt R.interior.frontier.pair.q
      R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_eq_radius
      R.interior.frontier.pair.w R.mutual_cross_membership.1
  have h2 :
      dist (H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A) R.interior.frontier.pair.w =
        (H.selectedAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A).toCriticalFourShell.radius :=
    (H.selectedAt R.interior.frontier.pair.w
      R.interior.frontier.pair.w_mem_A).toCriticalFourShell.support_eq_radius
      R.interior.frontier.pair.w
      (H.selectedAt R.interior.frontier.pair.w
        R.interior.frontier.pair.w_mem_A).toCriticalFourShell.q_mem_support
  rw [← h1, ← h2, R.obstructionCenters_eq]

/-- **Run A (6), supports.**  `R_q̃ = R_w̃ =: K`, one shared exact four-row at
the common obstruction center. -/
theorem d4_sharedRow_support_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    (H.selectedAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support =
      (H.selectedAt R.interior.frontier.pair.w
        R.interior.frontier.pair.w_mem_A).toCriticalFourShell.support := by
  have hrad := d4_sharedRow_radius_eq R
  ext z
  have hdist :
      dist (H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A) z =
        dist (H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A) z := by
    rw [R.obstructionCenters_eq]
  constructor
  · intro hz
    refine (H.selectedAt R.interior.frontier.pair.w
      R.interior.frontier.pair.w_mem_A).toCriticalFourShell.off_row_named_label_forbidden
      ((H.selectedAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_subset_A hz) ?_
    rw [hdist, ← hrad]
    exact (H.selectedAt R.interior.frontier.pair.q
      R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_eq_radius z hz
  · intro hz
    refine (H.selectedAt R.interior.frontier.pair.q
      R.interior.frontier.pair.q_mem_A).toCriticalFourShell.off_row_named_label_forbidden
      ((H.selectedAt R.interior.frontier.pair.w
        R.interior.frontier.pair.w_mem_A).toCriticalFourShell.support_subset_A hz) ?_
    rw [← hdist, hrad]
    exact (H.selectedAt R.interior.frontier.pair.w
      R.interior.frontier.pair.w_mem_A).toCriticalFourShell.support_eq_radius z hz

/-- **Run A (7).**  The shared row meets the closed first opposite cap in
exactly the reselected interior pair. -/
theorem d4_sharedRow_inter_firstOppCap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    (H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      ({R.interior.frontier.pair.q, R.interior.frontier.pair.w} :
        Finset ℝ²) := by
  classical
  have hqCap : R.interior.frontier.pair.q ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      (Finset.mem_inter.mp R.interior.q_mem_interior).2
  have hwCap : R.interior.frontier.pair.w ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      (Finset.mem_inter.mp R.interior.w_mem_interior).2
  have hcenterCap :
      H.centerAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      R.commonObstructionCenter_mem_interior
  have hbound :
      ((H.selectedAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex1
      (H.selectedAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A).toCriticalFourShell.toSelectedFourClass
      hcenterCap
  have hsubset :
      ({R.interior.frontier.pair.q, R.interior.frontier.pair.w} :
          Finset ℝ²) ⊆
        (H.selectedAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro z hz
    rcases Finset.mem_insert.mp hz with hz | hz
    · subst hz
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.q_mem_support,
          hqCap⟩
    · rw [Finset.mem_singleton] at hz
      subst hz
      exact Finset.mem_inter.mpr ⟨R.mutual_cross_membership.1, hwCap⟩
  refine (Finset.eq_of_subset_of_card_le hsubset ?_).symm
  have hpair :
      ({R.interior.frontier.pair.q, R.interior.frontier.pair.w} :
        Finset ℝ²).card = 2 :=
    Finset.card_pair R.interior.frontier.pair.q_ne_w
  omega

/-- **Run A (7)**, restated over the named first opposite cap `Γ₁`. -/
theorem d4_sharedRow_inter_oppCap1_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    (H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support ∩
        S.oppCap1 =
      ({R.interior.frontier.pair.q, R.interior.frontier.pair.w} :
        Finset ℝ²) := by
  rw [oppCap1_eq_capByIndex_oppIndex1 S]
  exact d4_sharedRow_inter_firstOppCap_eq_pair R

/-- **Run A (8).**  The carrier points on the perpendicular bisector of
`q̃ w̃` are exactly the first apex and the common obstruction center. -/
theorem d4_carrier_bisector_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F) :
    (D.A.filter fun x ↦
        dist x R.interior.frontier.pair.q =
          dist x R.interior.frontier.pair.w) =
      ({S.oppApex1,
        H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A} : Finset ℝ²) := by
  classical
  have hqRadius :
      dist R.interior.frontier.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp R.interior.frontier.pair.q_mem_marginal).1).2
  have hwRadius :
      dist R.interior.frontier.pair.w S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp R.interior.frontier.pair.w_mem_marginal).1).2
  ext x
  simp only [Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨hxA, hxdist⟩
    by_contra hx
    push_neg at hx
    exact R.no_third_carrier_bisector x hxA hx.1 hx.2 hxdist
  · rintro (hx | hx)
    · subst hx
      exact ⟨oppApex1_mem_A S, by
        rw [dist_comm S.oppApex1 R.interior.frontier.pair.q,
          dist_comm S.oppApex1 R.interior.frontier.pair.w, hqRadius, hwRadius]⟩
    · subst hx
      refine ⟨d4_commonObstructionCenter_mem_A R, ?_⟩
      exact ((H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_eq_radius
          R.interior.frontier.pair.q
          (H.selectedAt R.interior.frontier.pair.q
            R.interior.frontier.pair.q_mem_A).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_eq_radius
          R.interior.frontier.pair.w R.mutual_cross_membership.1).symm

/- ## Target 5 — leaf D3
`false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual`
(`FrontierLiveClosure.lean:6121`).  The single binder is
`R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F`. -/

/-- After deleting either endpoint of the reselected interior pair the second
apex still carries a `K4` witness (E8 weakened). -/
theorem d3_secondApex_survives_erase_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.q)
      S.oppApex2 := by
  refine equidistantAt_mono ?_ R.interior.frontier.secondApexDouble
  intro z hz
  rcases Finset.mem_erase.mp hz with ⟨_, hz'⟩
  exact hz'

/-- Symmetric form of `d3_secondApex_survives_erase_q`. -/
theorem d3_secondApex_survives_erase_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.w)
      S.oppApex2 := by
  refine equidistantAt_mono ?_ R.interior.frontier.secondApexDouble
  intro z hz
  rcases Finset.mem_erase.mp hz with ⟨hzw, hz'⟩
  exact Finset.mem_erase.mpr ⟨hzw, Finset.mem_of_mem_erase hz'⟩

/-- **Run A (5), first inequality for `b_q`.**  `χ(q̃) ≠ a₁`. -/
theorem d3_obstructionCenter_q_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    H.centerAt R.interior.frontier.pair.q R.interior.frontier.pair.q_mem_A ≠
      S.oppApex1 := by
  intro h
  refine H.no_qfree_at R.interior.frontier.pair.q
    R.interior.frontier.pair.q_mem_A ?_
  rw [h]
  exact R.firstApex_fullyDeletionRobust.survives _
    R.interior.frontier.pair.q_mem_A

/-- **Run A (5), second inequality for `b_q`.**  `χ(q̃) ≠ a₂`. -/
theorem d3_obstructionCenter_q_ne_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    H.centerAt R.interior.frontier.pair.q R.interior.frontier.pair.q_mem_A ≠
      S.oppApex2 := by
  intro h
  refine H.no_qfree_at R.interior.frontier.pair.q
    R.interior.frontier.pair.q_mem_A ?_
  rw [h]
  exact d3_secondApex_survives_erase_q R

/-- **Run A (5), first inequality for `b_w`.**  `χ(w̃) ≠ a₁`. -/
theorem d3_obstructionCenter_w_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    H.centerAt R.interior.frontier.pair.w R.interior.frontier.pair.w_mem_A ≠
      S.oppApex1 := by
  intro h
  refine H.no_qfree_at R.interior.frontier.pair.w
    R.interior.frontier.pair.w_mem_A ?_
  rw [h]
  exact R.firstApex_fullyDeletionRobust.survives _
    R.interior.frontier.pair.w_mem_A

/-- **Run A (5), second inequality for `b_w`.**  `χ(w̃) ≠ a₂`. -/
theorem d3_obstructionCenter_w_ne_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    H.centerAt R.interior.frontier.pair.w R.interior.frontier.pair.w_mem_A ≠
      S.oppApex2 := by
  intro h
  refine H.no_qfree_at R.interior.frontier.pair.w
    R.interior.frontier.pair.w_mem_A ?_
  rw [h]
  exact d3_secondApex_survives_erase_w R

/-- **Run A (4)–(5), packaged.**  The four carrier centers `a₁, a₂, χ(q̃),
`χ(w̃)` are pairwise distinct.  This is unconditional: it does not use the
`D3.2` disjunction. -/
theorem d3_fourCenters_pairwise_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    S.oppApex1 ≠ S.oppApex2 ∧
      H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A ≠ S.oppApex1 ∧
      H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A ≠ S.oppApex2 ∧
      H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A ≠ S.oppApex1 ∧
      H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A ≠ S.oppApex2 ∧
      H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A ≠
        H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A :=
  ⟨oppApex1_ne_oppApex2 S,
    d3_obstructionCenter_q_ne_firstApex R,
    d3_obstructionCenter_q_ne_secondApex R,
    d3_obstructionCenter_w_ne_firstApex R,
    d3_obstructionCenter_w_ne_secondApex R,
    R.obstructionCenters_ne⟩

/-- **Run A (3).**  In the left disjunct of `D3.2`, `w̃` is off `q̃`'s blocker
row; equivalently, the survival is exactly the omission. -/
theorem d3_leftBranch_partner_not_mem_row
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.w)
        (H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A) ↔
      R.interior.frontier.pair.w ∉
        (H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support :=
  criticalShell_erase_survives_iff_not_mem_support H
    R.interior.frontier.pair.q R.interior.frontier.pair.q_mem_A
    R.interior.frontier.pair.w

/-- Symmetric form for the right disjunct of `D3.2`. -/
theorem d3_rightBranch_partner_not_mem_row
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.q)
        (H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A) ↔
      R.interior.frontier.pair.q ∉
        (H.selectedAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A).toCriticalFourShell.support :=
  criticalShell_erase_survives_iff_not_mem_support H
    R.interior.frontier.pair.w R.interior.frontier.pair.w_mem_A
    R.interior.frontier.pair.q

/-- **Run A (4), left disjunct.**  Deleting `w̃` preserves `K4` at three
pairwise-distinct carrier centers `a₁, a₂, χ(q̃)`, while `w̃`'s own obstruction
center `χ(w̃)` is a fourth center distinct from all three. -/
theorem d3_leftBranch_threeCenter_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hbranch : HasNEquidistantPointsAt 4
      (D.A.erase R.interior.frontier.pair.w)
      (H.centerAt R.interior.frontier.pair.q
        R.interior.frontier.pair.q_mem_A)) :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.w)
        S.oppApex1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.w)
        S.oppApex2 ∧
      HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.w)
        (H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.w)
        (H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A) :=
  ⟨R.firstApex_fullyDeletionRobust.survives _
      R.interior.frontier.pair.w_mem_A,
    d3_secondApex_survives_erase_w R,
    hbranch,
    H.no_qfree_at R.interior.frontier.pair.w
      R.interior.frontier.pair.w_mem_A⟩

/-- **Run A (4), right disjunct.**  The mirror packet for the deletion of
`q̃`. -/
theorem d3_rightBranch_threeCenter_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (hbranch : HasNEquidistantPointsAt 4
      (D.A.erase R.interior.frontier.pair.q)
      (H.centerAt R.interior.frontier.pair.w
        R.interior.frontier.pair.w_mem_A)) :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.q)
        S.oppApex1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.q)
        S.oppApex2 ∧
      HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.q)
        (H.centerAt R.interior.frontier.pair.w
          R.interior.frontier.pair.w_mem_A) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase R.interior.frontier.pair.q)
        (H.centerAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A) :=
  ⟨R.firstApex_fullyDeletionRobust.survives _
      R.interior.frontier.pair.q_mem_A,
    d3_secondApex_survives_erase_q R,
    hbranch,
    H.no_qfree_at R.interior.frontier.pair.q
      R.interior.frontier.pair.q_mem_A⟩

/-- The exact first-apex row minus `w̃` is still a four-point row (E4). -/
theorem d3_firstApexRow_erase_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    ((SelectedClass D.A S.oppApex1 radius).erase
      R.interior.frontier.pair.w).card = 4 := by
  have hw :
      R.interior.frontier.pair.w ∈ SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp R.interior.w_mem_interior).1
  rw [Finset.card_erase_of_mem hw, R.class_card_eq_five]

/-- The second-apex row avoiding both `q̃` and `w̃` (E8) as an explicit
four-point ambient row. -/
theorem d3_secondApexRow_avoiding_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    ∃ r : ℝ, 0 < r ∧
      4 ≤ (((SelectedClass D.A S.oppApex2 r).erase
        R.interior.frontier.pair.q).erase
        R.interior.frontier.pair.w).card := by
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
    R.interior.frontier.secondApexDouble with ⟨r, hr, hcard⟩
  refine ⟨r, hr, ?_⟩
  rw [← selectedClass_erase_eq, ← selectedClass_erase_eq]
  exact hcard

/-- The blocker row of `q̃` is an exact four-point row through `q̃`. -/
theorem d3_blockerRow_q_card_and_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F) :
    (H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support.card
        = 4 ∧
      R.interior.frontier.pair.q ∈
        (H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support :=
  ⟨(H.selectedAt R.interior.frontier.pair.q
      R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support_card,
    (H.selectedAt R.interior.frontier.pair.q
      R.interior.frontier.pair.q_mem_A).toCriticalFourShell.q_mem_support⟩

/-- **Run A, three-row incidence.**  The first-apex row, the second-apex row,
and `q̃`'s blocker row sit at pairwise distinct centers, so every pair meets in
at most two carrier points. -/
theorem d3_threeRow_pairwise_inter_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    (r : ℝ) :
    (SelectedClass D.A S.oppApex1 radius ∩
        SelectedClass D.A S.oppApex2 r).card ≤ 2 ∧
      (SelectedClass D.A S.oppApex1 radius ∩
        (H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support).card
          ≤ 2 ∧
      (SelectedClass D.A S.oppApex2 r ∩
        (H.selectedAt R.interior.frontier.pair.q
          R.interior.frontier.pair.q_mem_A).toCriticalFourShell.support).card
          ≤ 2 := by
  have hshell :=
    criticalShell_support_eq_selectedClass H R.interior.frontier.pair.q
      R.interior.frontier.pair.q_mem_A
  refine ⟨selectedClass_inter_card_le_two (oppApex1_ne_oppApex2 S), ?_, ?_⟩
  · rw [hshell]
    exact selectedClass_inter_card_le_two
      (Ne.symm (d3_obstructionCenter_q_ne_firstApex R))
  · rw [hshell]
    exact selectedClass_inter_card_le_two
      (Ne.symm (d3_obstructionCenter_q_ne_secondApex R))

/- ## Target 4 — leaf D2
`false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`
(`FrontierLiveClosure.lean:6041`).  Binders: the original exact-four residual
`R`, the cardinality bound, the physical common-deletion ingress, and the
swapped protected unique-four frontier. -/

/-- A double deletion that survives at a center whose exact four-row is the
unique `K4` row there must avoid that row entirely. -/
theorem pair_not_mem_of_exactFour_unique_radius_doubleSurvival
    {A : Finset ℝ²} {c q w : ℝ²} {r : ℝ}
    (hcard : (SelectedClass A c r).card = 4)
    (hunique : ∀ tau : ℝ, 0 < tau → 4 ≤ (SelectedClass A c tau).card →
      tau = r)
    (hsurvives : HasNEquidistantPointsAt 4 ((A.erase q).erase w) c) :
    q ∉ SelectedClass A c r ∧ w ∉ SelectedClass A c r := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨tau, htau, hcardTau⟩
  rw [selectedClass_erase_eq, selectedClass_erase_eq] at hcardTau
  have hambient : 4 ≤ (SelectedClass A c tau).card :=
    hcardTau.trans (Finset.card_le_card
      ((Finset.erase_subset _ _).trans (Finset.erase_subset _ _)))
  have htauEq : tau = r := hunique tau htau hambient
  subst htauEq
  constructor
  · intro hq
    have hwErase :
        ((SelectedClass A c tau).erase q).card = 3 := by
      rw [Finset.card_erase_of_mem hq, hcard]
    have := Finset.card_erase_le (a := w) (s := (SelectedClass A c tau).erase q)
    omega
  · intro hw
    by_cases hq : q ∈ SelectedClass A c tau
    · have hwErase :
          ((SelectedClass A c tau).erase q).card = 3 := by
        rw [Finset.card_erase_of_mem hq, hcard]
      have := Finset.card_erase_le (a := w) (s := (SelectedClass A c tau).erase q)
      omega
    · have hqErase :
          (SelectedClass A c tau).erase q = SelectedClass A c tau :=
        Finset.erase_eq_self.mpr hq
      rw [hqErase, Finset.card_erase_of_mem hw, hcard] at hcardTau
      omega

/-- The swapped frontier's exact four-row lives at the *second* apex of the
original packet. -/
theorem d2_swappedClass_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (swapped : SwappedFirstApexUniqueFourFrontier D S H) :
    (SelectedClass D.A S.oppApex2 swapped.radius).card = 4 := by
  rw [← swapped.firstApex_eq]
  exact swapped.firstClass_card_eq_four

/-- Unique four-radius at the second apex, in original-packet coordinates. -/
theorem d2_swappedClass_unique_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (swapped : SwappedFirstApexUniqueFourFrontier D S H) :
    ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass D.A S.oppApex2 tau).card → tau = swapped.radius := by
  intro tau htau hcard
  refine swapped.firstClass_unique_radius tau htau ?_
  rw [swapped.firstApex_eq]
  exact hcard

/-- **Run A (9).**  The original frontier pair is disjoint from the swapped
exact four-row at `a₂`: its double survival there would otherwise strip the
only `K4` row at `a₂`. -/
theorem d2_originalPair_not_mem_swappedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_ingress : ExactFourPhysicalCommonDeletionIngress R)
    (swapped : SwappedFirstApexUniqueFourFrontier D S
      (ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem R)) :
    F.pair.q ∉ SelectedClass D.A S.oppApex2 swapped.radius ∧
      F.pair.w ∉ SelectedClass D.A S.oppApex2 swapped.radius :=
  pair_not_mem_of_exactFour_unique_radius_doubleSurvival
    (d2_swappedClass_card_eq_four swapped)
    (d2_swappedClass_unique_radius swapped) F.secondApexDouble

/-- **Run A (10).**  The swapped frontier pair is disjoint from the original
exact four-row at `a₁`. -/
theorem d2_swappedPair_not_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_ingress : ExactFourPhysicalCommonDeletionIngress R)
    (swapped : SwappedFirstApexUniqueFourFrontier D S
      (ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem R)) :
    swapped.frontier.pair.q ∉ SelectedClass D.A S.oppApex1 radius ∧
      swapped.frontier.pair.w ∉ SelectedClass D.A S.oppApex1 radius := by
  refine pair_not_mem_of_exactFour_unique_radius_doubleSurvival
    R.class_card_eq_four R.unique_K4_radius ?_
  rw [← swapped.secondApex_eq]
  exact swapped.frontier.secondApexDouble

/-- The original frontier pair lies on the exact four-row at `a₁`. -/
theorem d2_originalPair_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius ∧
      F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  constructor
  · rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hq, _⟩
    rcases Finset.mem_filter.mp hq with ⟨hqA, hqRadius⟩
    exact mem_selectedClass.mpr ⟨hqA, by simpa only [dist_comm] using hqRadius⟩
  · rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hw, _⟩
    rcases Finset.mem_filter.mp hw with ⟨hwA, hwRadius⟩
    exact mem_selectedClass.mpr ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

/-- The swapped frontier pair lies on the exact four-row at `a₂`. -/
theorem d2_swappedPair_mem_swappedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (swapped : SwappedFirstApexUniqueFourFrontier D S H) :
    swapped.frontier.pair.q ∈ SelectedClass D.A S.oppApex2 swapped.radius ∧
      swapped.frontier.pair.w ∈
        SelectedClass D.A S.oppApex2 swapped.radius := by
  have hfirst := d2_originalPair_mem_firstClass swapped.frontier
  rw [swapped.firstApex_eq] at hfirst
  exact hfirst

/-- **Run A (11).**  The two protected pairs point in opposite directions. -/
theorem d2_protectedPairs_directions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (ingress : ExactFourPhysicalCommonDeletionIngress R)
    (swapped : SwappedFirstApexUniqueFourFrontier D S
      (ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem R)) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius \
        SelectedClass D.A S.oppApex2 swapped.radius ∧
      F.pair.w ∈ SelectedClass D.A S.oppApex1 radius \
        SelectedClass D.A S.oppApex2 swapped.radius ∧
      swapped.frontier.pair.q ∈
        SelectedClass D.A S.oppApex2 swapped.radius \
          SelectedClass D.A S.oppApex1 radius ∧
      swapped.frontier.pair.w ∈
        SelectedClass D.A S.oppApex2 swapped.radius \
          SelectedClass D.A S.oppApex1 radius := by
  classical
  obtain ⟨hqU, hwU⟩ := d2_originalPair_mem_firstClass F
  obtain ⟨hqNotV, hwNotV⟩ :=
    d2_originalPair_not_mem_swappedClass R hcard ingress swapped
  obtain ⟨hqV, hwV⟩ := d2_swappedPair_mem_swappedClass swapped
  obtain ⟨hqNotU, hwNotU⟩ :=
    d2_swappedPair_not_mem_firstClass R hcard ingress swapped
  exact ⟨Finset.mem_sdiff.mpr ⟨hqU, hqNotV⟩,
    Finset.mem_sdiff.mpr ⟨hwU, hwNotV⟩,
    Finset.mem_sdiff.mpr ⟨hqV, hqNotU⟩,
    Finset.mem_sdiff.mpr ⟨hwV, hwNotU⟩⟩

/-- **Run A (12).**  The two exact four-rows are at distinct centers, so they
overlap in at most two points. -/
theorem d2_classes_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (swapped : SwappedFirstApexUniqueFourFrontier D S H) :
    (SelectedClass D.A S.oppApex1 radius ∩
      SelectedClass D.A S.oppApex2 swapped.radius).card ≤ 2 :=
  selectedClass_inter_card_le_two (oppApex1_ne_oppApex2 S)

/-- **Run A, ingress row identification.**  The ingress witness row centered at
`a₂` is exactly the swapped exact four-row. -/
theorem d2_ingress_secondApexRow_eq_swappedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (ingress : ExactFourPhysicalCommonDeletionIngress R)
    (swapped : SwappedFirstApexUniqueFourFrontier D S
      (ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem R)) :
    ingress.packet.B₂ = SelectedClass D.A S.oppApex2 swapped.radius := by
  classical
  have hsubsetA : ingress.packet.B₂ ⊆ D.A := by
    intro y hy
    have hy' := ingress.packet.row₂.subset hy
    have hy'' : y ∈ D.skeleton ingress.deleted := Finset.mem_of_mem_erase hy'
    simpa [CounterexampleData.skeleton] using
      Finset.mem_of_mem_erase (by simpa [CounterexampleData.skeleton] using hy'')
  have hsubsetClass :
      ingress.packet.B₂ ⊆
        SelectedClass D.A S.oppApex2 ingress.packet.row₂.radius := by
    intro y hy
    exact mem_selectedClass.mpr
      ⟨hsubsetA hy, ingress.packet.row₂.same_radius y hy⟩
  have hfour :
      4 ≤ (SelectedClass D.A S.oppApex2 ingress.packet.row₂.radius).card := by
    calc
      4 = ingress.packet.B₂.card := ingress.packet.B₂_card.symm
      _ ≤ _ := Finset.card_le_card hsubsetClass
  have hradius : ingress.packet.row₂.radius = swapped.radius :=
    d2_swappedClass_unique_radius swapped _
      ingress.packet.row₂.radius_pos hfour
  rw [hradius] at hsubsetClass
  refine Finset.eq_of_subset_of_card_le hsubsetClass ?_
  rw [d2_swappedClass_card_eq_four swapped, ingress.packet.B₂_card]

/-- **Run A, ingress row at `c₁`.**  The ingress witness row centered at the
late blocker `c₁ = χ*(u)` is exactly the chosen critical row there. -/
theorem d2_ingress_firstRow_eq_criticalShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (ingress : ExactFourPhysicalCommonDeletionIngress R) :
    ingress.packet.B₁ =
      ((ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem
        R).selectedAt ingress.source.1
          ingress.source.2).toCriticalFourShell.support := by
  classical
  have hsubsetA : ingress.packet.B₁ ⊆ D.A := by
    intro y hy
    have hy' := ingress.packet.row₁.subset hy
    have hy'' : y ∈ D.skeleton ingress.deleted := Finset.mem_of_mem_erase hy'
    exact Finset.mem_of_mem_erase
      (by simpa [CounterexampleData.skeleton] using hy'')
  have hsubsetClass :
      ingress.packet.B₁ ⊆
        SelectedClass D.A
          ((ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem
            R).centerAt ingress.source.1 ingress.source.2)
          ingress.packet.row₁.radius := by
    intro y hy
    exact mem_selectedClass.mpr
      ⟨hsubsetA hy, ingress.packet.row₁.same_radius y hy⟩
  have hfour :
      4 ≤ (SelectedClass D.A
        ((ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem
          R).centerAt ingress.source.1 ingress.source.2)
        ingress.packet.row₁.radius).card := by
    calc
      4 = ingress.packet.B₁.card := ingress.packet.B₁_card.symm
      _ ≤ _ := Finset.card_le_card hsubsetClass
  have hradius :
      ingress.packet.row₁.radius =
        ((ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem
          R).selectedAt ingress.source.1
            ingress.source.2).toCriticalFourShell.radius :=
    criticalShell_unique_four_radius _ ingress.source.1 ingress.source.2
      ingress.packet.row₁.radius_pos hfour
  rw [hradius, ← criticalShell_support_eq_selectedClass] at hsubsetClass
  refine Finset.eq_of_subset_of_card_le hsubsetClass ?_
  rw [((ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem
    R).selectedAt ingress.source.1
      ingress.source.2).toCriticalFourShell.support_card,
    ingress.packet.B₁_card]

/-- **Run A, third-row incidence for D2.**  The ingress row at `c₁` meets the
swapped exact `a₂`-row in at most two points. -/
theorem d2_ingress_firstRow_inter_swappedClass_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (ingress : ExactFourPhysicalCommonDeletionIngress R)
    (swapped : SwappedFirstApexUniqueFourFrontier D S
      (ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem R)) :
    (ingress.packet.B₁ ∩
      SelectedClass D.A S.oppApex2 swapped.radius).card ≤ 2 := by
  rw [d2_ingress_firstRow_eq_criticalShell R ingress,
    criticalShell_support_eq_selectedClass]
  exact selectedClass_inter_card_le_two ingress.blocker_ne_secondApex

/- ## Target 6 — leaf D1
`false_of_exactFourPostCardElevenTwoRadiusBranch`
(`FrontierLiveClosure.lean:5976`). -/

/-- **Sharp ordered-cap bound at the first apex.**  For every radius, the
first-apex radius class meets the *closed* second opposite cap in at most one
point: `Γ₂` is the left-adjacent cap of the first opposite cap index. -/
theorem firstApexClass_inter_secondOppCap_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (r : ℝ) :
    (SelectedClass D.A S.oppApex1 r ∩ S.capByIndex S.oppIndex2).card ≤ 1 := by
  have hbound :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep D.convex
      S.oppIndex1 r
  rw [leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2 S,
    ← oppApex1_eq_oppositeVertex_oppIndex1 S] at hbound
  exact hbound

/-- **Run A (13), sharpened.**  The exact first-apex four-row meets the strict
second-cap interior in at most one point — run A only claimed `≤ 2`. -/
theorem d1_firstApexClass_inter_secondCapInterior_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (r : ℝ) :
    (SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex2).card ≤ 1 := by
  refine le_trans (Finset.card_le_card ?_)
    (firstApexClass_inter_secondOppCap_card_le_one S r)
  intro z hz
  rcases Finset.mem_inter.mp hz with ⟨hz₁, hz₂⟩
  exact Finset.mem_inter.mpr
    ⟨hz₁, S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hz₂⟩

/-- Leaf-D1 positivity of the first row radius, reconstructed from the row. -/
theorem d1_rho_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {rho : ℝ}
    (firstRow : SelectedFourClass D.A S.oppApex2)
    (hfirstRadius : firstRow.radius = rho) :
    0 < rho := by
  rw [← hfirstRadius]
  exact firstRow.radius_pos

/-- A selected four-row at `a₂` sits inside the ambient radius class of its
own radius. -/
theorem selectedFourClass_support_subset_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {rho : ℝ}
    (row : SelectedFourClass D.A S.oppApex2)
    (hradius : row.radius = rho) :
    row.support ⊆ SelectedClass D.A S.oppApex2 rho := by
  intro z hz
  exact mem_selectedClass.mpr
    ⟨row.support_subset_A hz, by rw [← hradius]; exact row.support_eq_radius z hz⟩

/-- Leaf-D1 exact class cardinality, reconstructed from the row and the
no-five packet. -/
theorem d1_class_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {rho : ℝ}
    (row : SelectedFourClass D.A S.oppApex2)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hradius : row.radius = rho) :
    (SelectedClass D.A S.oppApex2 rho).card = 4 := by
  have hge : 4 ≤ (SelectedClass D.A S.oppApex2 rho).card := by
    calc
      4 = row.support.card := row.support_card.symm
      _ ≤ _ := Finset.card_le_card
        (selectedFourClass_support_subset_selectedClass row hradius)
  have hlt := hnoFive rho (d1_rho_pos row hradius)
  omega

/-- **Run A / run B (D1.7) reconstructed.**  Each of the two exact `a₂`-rows
has at least two strict second-cap members. -/
theorem d1_strictInterior_double_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {rho : ℝ}
    (row : SelectedFourClass D.A S.oppApex2)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hradius : row.radius = rho) :
    2 ≤ (SelectedClass D.A S.oppApex2 rho ∩
      S.capInteriorByIndex S.oppIndex2).card := by
  have hbound :=
    S.selectedClass_capInteriorByIndex_card_ge_card_sub_two D.convex
      S.oppIndex2 (d1_rho_pos row hradius)
  rw [← oppApex2_eq_oppositeVertex_oppIndex2 S] at hbound
  have hcard := d1_class_card_eq_four row hnoFive hradius
  omega

/-- **Run B, D1 cardinality.**  Two distinct exact `a₂`-radii force
`|Γ₂| ≥ 6`. -/
theorem d1_secondOppCap_card_ge_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface _R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support) :
    6 ≤ S.oppCap2.card := by
  have hrho : 0 < rho := d1_rho_pos firstRow hfirstRadius
  have hother : 0 < otherRadius := d1_rho_pos secondRow hsecondRadius
  have hfour : (SelectedClass D.A S.oppApex2 rho).card = 4 :=
    d1_class_card_eq_four firstRow hnoFive hfirstRadius
  have hfourOther : (SelectedClass D.A S.oppApex2 otherRadius).card = 4 :=
    d1_class_card_eq_four secondRow hnoFive hsecondRadius
  have hbound :=
    oppositeVertex_distinct_K4_radii_force_cap_card_ge_six S D.convex
      S.oppIndex2 hrho hother
      (by rw [← oppApex2_eq_oppositeVertex_oppIndex2 S, hfour])
      (by rw [← oppApex2_eq_oppositeVertex_oppIndex2 S, hfourOther])
      (Ne.symm hradii)
  rw [oppCap2_eq_capByIndex_oppIndex2 S]
  exact hbound

/- ## Stretch — run A's D1 swapped common-deletion construction

Run A left a residual "rigid `2×2` split" case in which
`|U ∩ Γ₂°| = 2`.  The sharp ordered-cap bound above gives
`|U ∩ Γ₂°| ≤ 1`, so that case is vacuous and the construction always
applies. -/

/-- The rigid `2×2` occupancy split of run A cannot occur. -/
theorem d1_rigid_two_by_two_split_impossible
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (r : ℝ) :
    (SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex2).card ≠ 2 := by
  have := d1_firstApexClass_inter_secondCapInterior_card_le_one S r
  omega

/-- Deleting two points of one exact `a₂`-row that miss the exact `a₁`-row
preserves `K4` at both apexes: the `a₁`-row and the other `a₂`-row survive. -/
theorem twoDeletion_survives_at_both_apexes
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius sigma tau : ℝ} {z₁ z₂ : ℝ²}
    (hradius : 0 < radius) (htau : 0 < tau)
    (hUcard : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hTauCard : (SelectedClass D.A S.oppApex2 tau).card = 4)
    (hsigmatau : sigma ≠ tau)
    (hz₁ : z₁ ∈ SelectedClass D.A S.oppApex2 sigma)
    (hz₂ : z₂ ∈ SelectedClass D.A S.oppApex2 sigma)
    (hz₁U : z₁ ∉ SelectedClass D.A S.oppApex1 radius)
    (hz₂U : z₂ ∉ SelectedClass D.A S.oppApex1 radius) :
    HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex2 := by
  classical
  have hz₁Tau : z₁ ∉ SelectedClass D.A S.oppApex2 tau := by
    intro h
    exact hsigmatau
      (((mem_selectedClass.mp hz₁).2).symm.trans (mem_selectedClass.mp h).2)
  have hz₂Tau : z₂ ∉ SelectedClass D.A S.oppApex2 tau := by
    intro h
    exact hsigmatau
      (((mem_selectedClass.mp hz₂).2).symm.trans (mem_selectedClass.mp h).2)
  have hFirst :
      SelectedClass ((D.A.erase z₁).erase z₂) S.oppApex1 radius =
        SelectedClass D.A S.oppApex1 radius := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq,
      Finset.erase_eq_self.mpr hz₁U, Finset.erase_eq_self.mpr hz₂U]
  have hSecond :
      SelectedClass ((D.A.erase z₁).erase z₂) S.oppApex2 tau =
        SelectedClass D.A S.oppApex2 tau := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq,
      Finset.erase_eq_self.mpr hz₁Tau, Finset.erase_eq_self.mpr hz₂Tau]
  refine ⟨⟨radius, hradius, ?_⟩, ⟨tau, htau, ?_⟩⟩
  · change 4 ≤ (SelectedClass ((D.A.erase z₁).erase z₂) S.oppApex1 radius).card
    rw [hFirst, hUcard]
  · change 4 ≤ (SelectedClass ((D.A.erase z₁).erase z₂) S.oppApex2 tau).card
    rw [hSecond, hTauCard]

/-- **Run A's D1 construction, unconditional.**  In the two-radius branch there
are two distinct strict-`Γ₂` points lying on one exact `a₂`-row and off the
exact `a₁`-row, whose joint deletion preserves `K4` at both apexes. -/
theorem d1_swappedCommonDeletion_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support) :
    ∃ z₁ z₂ : ℝ², z₁ ≠ z₂ ∧
      z₁ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      z₂ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      z₁ ∉ SelectedClass D.A S.oppApex1 radius ∧
      z₂ ∉ SelectedClass D.A S.oppApex1 radius ∧
      ((z₁ ∈ SelectedClass D.A S.oppApex2 rho ∧
          z₂ ∈ SelectedClass D.A S.oppApex2 rho) ∨
        (z₁ ∈ SelectedClass D.A S.oppApex2 otherRadius ∧
          z₂ ∈ SelectedClass D.A S.oppApex2 otherRadius)) ∧
      HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex2 := by
  classical
  have hrho : 0 < rho := d1_rho_pos firstRow hfirstRadius
  have hother : 0 < otherRadius := d1_rho_pos secondRow hsecondRadius
  have hfour : (SelectedClass D.A S.oppApex2 rho).card = 4 :=
    d1_class_card_eq_four firstRow hnoFive hfirstRadius
  have hfourOther : (SelectedClass D.A S.oppApex2 otherRadius).card = 4 :=
    d1_class_card_eq_four secondRow hnoFive hsecondRadius
  set I := S.capInteriorByIndex S.oppIndex2 with hI
  set U := SelectedClass D.A S.oppApex1 radius with hU
  set P := SelectedClass D.A S.oppApex2 rho ∩ I with hP
  set Q := SelectedClass D.A S.oppApex2 otherRadius ∩ I with hQ
  have hP2 : 2 ≤ P.card :=
    d1_strictInterior_double_hit firstRow hnoFive hfirstRadius
  have hQ2 : 2 ≤ Q.card :=
    d1_strictInterior_double_hit secondRow hnoFive hsecondRadius
  have hUI : (U ∩ I).card ≤ 1 :=
    d1_firstApexClass_inter_secondCapInterior_card_le_one S radius
  have hdisPQ : Disjoint (P ∩ U) (Q ∩ U) := by
    rw [Finset.disjoint_left]
    intro x hxP hxQ
    have h₁ : dist S.oppApex2 x = rho :=
      (mem_selectedClass.mp (Finset.mem_inter.mp
        (Finset.mem_inter.mp hxP).1).1).2
    have h₂ : dist S.oppApex2 x = otherRadius :=
      (mem_selectedClass.mp (Finset.mem_inter.mp
        (Finset.mem_inter.mp hxQ).1).1).2
    exact hradii (h₂.symm.trans h₁)
  have hsub : (P ∩ U) ∪ (Q ∩ U) ⊆ U ∩ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · exact Finset.mem_inter.mpr
        ⟨(Finset.mem_inter.mp hx).2,
          (Finset.mem_inter.mp (Finset.mem_inter.mp hx).1).2⟩
    · exact Finset.mem_inter.mpr
        ⟨(Finset.mem_inter.mp hx).2,
          (Finset.mem_inter.mp (Finset.mem_inter.mp hx).1).2⟩
  have hsum : (P ∩ U).card + (Q ∩ U).card ≤ 1 := by
    have hunion : ((P ∩ U) ∪ (Q ∩ U)).card = (P ∩ U).card + (Q ∩ U).card :=
      Finset.card_union_of_disjoint hdisPQ
    have := Finset.card_le_card hsub
    omega
  have hchoose :
      ∃ (T : Finset ℝ²) (sigma tau : ℝ),
        2 ≤ T.card ∧ Disjoint T U ∧ 0 < tau ∧ sigma ≠ tau ∧
          (SelectedClass D.A S.oppApex2 tau).card = 4 ∧
          T ⊆ SelectedClass D.A S.oppApex2 sigma ∩ I ∧
          (sigma = rho ∨ sigma = otherRadius) := by
    rcases Nat.eq_zero_or_pos (P ∩ U).card with hzero | hpos
    · refine ⟨P, rho, otherRadius, hP2, ?_, hother, Ne.symm hradii,
        hfourOther, by rw [hP], Or.inl rfl⟩
      rw [Finset.disjoint_left]
      intro x hxP hxU
      have : x ∈ P ∩ U := Finset.mem_inter.mpr ⟨hxP, hxU⟩
      rw [Finset.card_eq_zero] at hzero
      simp [hzero] at this
    · have hQzero : (Q ∩ U).card = 0 := by omega
      refine ⟨Q, otherRadius, rho, hQ2, ?_, hrho, hradii, hfour,
        by rw [hQ], Or.inr rfl⟩
      rw [Finset.disjoint_left]
      intro x hxQ hxU
      have : x ∈ Q ∩ U := Finset.mem_inter.mpr ⟨hxQ, hxU⟩
      rw [Finset.card_eq_zero] at hQzero
      simp [hQzero] at this
  rcases hchoose with
    ⟨T, sigma, tau, hT2, hTU, htau, hsigmatau, hTauCard, hTsub, hsigma⟩
  rcases Finset.one_lt_card.mp (by omega : 1 < T.card) with
    ⟨z₁, hz₁T, z₂, hz₂T, hz₁z₂⟩
  have hz₁Class : z₁ ∈ SelectedClass D.A S.oppApex2 sigma :=
    (Finset.mem_inter.mp (hTsub hz₁T)).1
  have hz₂Class : z₂ ∈ SelectedClass D.A S.oppApex2 sigma :=
    (Finset.mem_inter.mp (hTsub hz₂T)).1
  have hz₁I : z₁ ∈ I := (Finset.mem_inter.mp (hTsub hz₁T)).2
  have hz₂I : z₂ ∈ I := (Finset.mem_inter.mp (hTsub hz₂T)).2
  have hz₁U : z₁ ∉ U := Finset.disjoint_left.mp hTU hz₁T
  have hz₂U : z₂ ∉ U := Finset.disjoint_left.mp hTU hz₂T
  obtain ⟨hsurv1, hsurv2⟩ :=
    twoDeletion_survives_at_both_apexes (S := S) F.radius_pos htau
      R.class_card_eq_four hTauCard hsigmatau hz₁Class hz₂Class hz₁U hz₂U
  refine ⟨z₁, z₂, hz₁z₂, hz₁I, hz₂I, hz₁U, hz₂U, ?_, hsurv1, hsurv2⟩
  rcases hsigma with hsigma | hsigma
  · exact Or.inl ⟨hsigma ▸ hz₁Class, hsigma ▸ hz₂Class⟩
  · exact Or.inr ⟨hsigma ▸ hz₁Class, hsigma ▸ hz₂Class⟩

/- ## Axiom gate

Every bank theorem must show only Lean core axioms
(`propext`, `Classical.choice`, `Quot.sound`) — no `sorryAx`, no
`Lean.ofReduceBool`, no project axiom. -/

#print axioms mem_selectedClass_of_card_ge_four_of_erase_blocked
#print axioms eq_dist_of_card_ge_four_of_erase_blocked
#print axioms hasNEquidistantPointsAt_erase_iff_not_mem_exactFourRow
#print axioms criticalShell_support_eq_selectedClass
#print axioms criticalShell_unique_four_radius
#print axioms criticalShell_erase_survives_iff_not_mem_support
#print axioms equidistantAt_mono
#print axioms selectedClass_inter_card_le_two
#print axioms oppApex1_mem_A
#print axioms oppApex2_mem_A
#print axioms oppApex1_ne_oppApex2
#print axioms oppApex1_eq_oppositeVertex_oppIndex1
#print axioms oppApex2_eq_oppositeVertex_oppIndex2
#print axioms oppCap1_eq_capByIndex_oppIndex1
#print axioms oppCap2_eq_capByIndex_oppIndex2
#print axioms leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2
#print axioms d4_commonObstructionCenter_mem_A
#print axioms d4_commonObstructionCenter_ne_firstApex
#print axioms d4_commonObstructionCenter_ne_secondApex
#print axioms d4_global_twoDeletion_cover
#print axioms d4_no_survival_at_commonObstructionCenter_q
#print axioms d4_no_survival_at_commonObstructionCenter_w
#print axioms d4_global_twoDeletion_cover_with_unique_common_defect
#print axioms d4_sharedRow_radius_eq
#print axioms d4_sharedRow_support_eq
#print axioms d4_sharedRow_inter_firstOppCap_eq_pair
#print axioms d4_sharedRow_inter_oppCap1_eq_pair
#print axioms d4_carrier_bisector_eq_pair
#print axioms d3_secondApex_survives_erase_q
#print axioms d3_secondApex_survives_erase_w
#print axioms d3_obstructionCenter_q_ne_firstApex
#print axioms d3_obstructionCenter_q_ne_secondApex
#print axioms d3_obstructionCenter_w_ne_firstApex
#print axioms d3_obstructionCenter_w_ne_secondApex
#print axioms d3_fourCenters_pairwise_ne
#print axioms d3_leftBranch_partner_not_mem_row
#print axioms d3_rightBranch_partner_not_mem_row
#print axioms d3_leftBranch_threeCenter_packet
#print axioms d3_rightBranch_threeCenter_packet
#print axioms d3_firstApexRow_erase_card_eq_four
#print axioms d3_secondApexRow_avoiding_pair
#print axioms d3_blockerRow_q_card_and_mem
#print axioms d3_threeRow_pairwise_inter_le_two
#print axioms pair_not_mem_of_exactFour_unique_radius_doubleSurvival
#print axioms d2_swappedClass_card_eq_four
#print axioms d2_swappedClass_unique_radius
#print axioms d2_originalPair_not_mem_swappedClass
#print axioms d2_swappedPair_not_mem_firstClass
#print axioms d2_originalPair_mem_firstClass
#print axioms d2_swappedPair_mem_swappedClass
#print axioms d2_protectedPairs_directions
#print axioms d2_classes_inter_card_le_two
#print axioms d2_ingress_secondApexRow_eq_swappedClass
#print axioms d2_ingress_firstRow_eq_criticalShell
#print axioms d2_ingress_firstRow_inter_swappedClass_card_le_two
#print axioms firstApexClass_inter_secondOppCap_card_le_one
#print axioms d1_firstApexClass_inter_secondCapInterior_card_le_one
#print axioms d1_rho_pos
#print axioms selectedFourClass_support_subset_selectedClass
#print axioms d1_class_card_eq_four
#print axioms d1_strictInterior_double_hit
#print axioms d1_secondOppCap_card_ge_six
#print axioms d1_rigid_two_by_two_split_impossible
#print axioms twoDeletion_survives_at_both_apexes
#print axioms d1_swappedCommonDeletion_pair

end DPackageBank
end Problem97
