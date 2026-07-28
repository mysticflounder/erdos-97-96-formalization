/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Multi-deletion failure and blocker-closed deletion sets (scratch bank)

Kernel-checked, `sorry`-free general-`V` bank for the multi-deletion failure
interface (MD) named in
`docs/solve-prompts/2026-07-28-u1-double-apex-round1-response.md`:

> `∀ ∅ ≠ V ⊊ A, ∃ c ∈ A ∖ V, ¬ K4 (A ∖ V) c`.

A `CriticalShellSystem` `H` supplies only the singleton statement
`¬ K4 (A ∖ {s}) (χ s)` for `χ = H.centerAt`.  §2 shows exactly how far that
reaches for a general deletion set `V`:

* if some `s ∈ V` has `χ s ∉ V`, then `χ s` is a *named* failed remaining
  center (`exists_failed_center_of_escaping_blocker`); and
* conversely, if every remaining center keeps `K4`, then `V` is closed under
  `χ` (`blockerClosed_of_globalK4_sdiff`).

So the residual for the singleton-blocker mechanism is exactly the
**blocker-closed** deletion sets.  §3 recovers the already-banked `|V| = 2`
census of `lean/scratch/d-package-bank/D1GlobalSurvival.lean` from the general
dichotomy, and adds the `|V| = 1` case.  §4 records what blocker-closedness
forces (`2 ≤ V.card`, and a fiber-counting bound `V.card ≤ 4 * |χ '' V|`), §5
proves the purely combinatorial periodic-orbit statement, and §6 reuses
`ATailGlobalMinimalDeletion` to bank (MD) itself from global cardinal
minimality, together with the sharp consequence for a blocker-closed `V`: the
failed remaining center minimality produces is never a designated blocker of a
deleted source.

Nothing here is wired into the production files; these are BANK theorems only.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace MDBlockerClosed

/- ## §1 Bank prerequisites re-derived

`lean/scratch/d-package-bank/D1GlobalSurvival.lean` and
`lean/scratch/b-family-bank/B2Arm3.lean` are not library targets and have no
`.olean`, so the three facts consumed below are re-derived here.  Provenance is
named on each declaration. -/

/-- A `K4` witness at a center survives passing to a larger ambient set.

Provenance: verbatim `Problem97.D1GlobalSurvival.equidistantAt_mono`
(`lean/scratch/d-package-bank/D1GlobalSurvival.lean`). -/
theorem equidistantAt_mono
    {n : ℕ} {X Y : Finset ℝ²} {p : ℝ²} (hsub : X ⊆ Y)
    (h : HasNEquidistantPointsAt n X p) :
    HasNEquidistantPointsAt n Y p := by
  rcases h with ⟨r, hr, hcard⟩
  refine ⟨r, hr, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzX, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzX, hzdist⟩

#print axioms equidistantAt_mono

/-- The chosen blocker center of a source is a carrier point.

Provenance: verbatim `Problem97.D1GlobalSurvival.centerAt_mem_A`. -/
theorem centerAt_mem_A {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z : ℝ²} (hz : z ∈ A) : H.centerAt z hz ∈ A :=
  (Finset.mem_erase.mp (H.selectedAt z hz).toCriticalFourShell.center_mem).2

#print axioms centerAt_mem_A

/-- The chosen blocker center of a source is distinct from that source.

Provenance: verbatim `Problem97.D1GlobalSurvival.centerAt_ne_self`. -/
theorem centerAt_ne_self {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z : ℝ²} (hz : z ∈ A) : H.centerAt z hz ≠ z :=
  (Finset.mem_erase.mp (H.selectedAt z hz).toCriticalFourShell.center_mem).1

#print axioms centerAt_ne_self

/-- **Blocker fibers sit on one circle.**  If `y` and `q` have the same chosen
blocker center then `y` lies on the canonical shell of `q`.

Provenance: `Problem97.B2Arm3.mem_support_of_centerAt_eq`
(`lean/scratch/b-family-bank/B2Arm3.lean`).  The original routed through the
production lemma
`ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`;
the proof below uses only the `CriticalShellSystem` fields, so this file needs
no frontier import. -/
theorem mem_support_of_centerAt_eq {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) (y : ℝ²) (hy : y ∈ A)
    (hcenter : H.centerAt y hy = H.centerAt q hq) :
    y ∈ (H.selectedAt q hq).toCriticalFourShell.support := by
  by_contra hmem
  refine H.no_qfree_at y hy ?_
  rw [hcenter]
  refine ⟨(H.selectedAt q hq).toCriticalFourShell.radius,
    (H.selectedAt q hq).toCriticalFourShell.radius_pos, ?_⟩
  have hsub : (H.selectedAt q hq).toCriticalFourShell.support ⊆
      (A.erase y).filter fun z ↦
        dist (H.centerAt q hq) z =
          (H.selectedAt q hq).toCriticalFourShell.radius := by
    intro z hz
    refine Finset.mem_filter.mpr ⟨Finset.mem_erase.mpr ⟨?_, ?_⟩, ?_⟩
    · intro hzy
      exact hmem (hzy ▸ hz)
    · exact (H.selectedAt q hq).toCriticalFourShell.support_subset_A hz
    · exact (H.selectedAt q hq).toCriticalFourShell.support_eq_radius z hz
  calc
    4 = (H.selectedAt q hq).toCriticalFourShell.support.card :=
      (H.selectedAt q hq).toCriticalFourShell.support_card.symm
    _ ≤ _ := Finset.card_le_card hsub

#print axioms mem_support_of_centerAt_eq

/- ## §2 The escaping-blocker producer and the blocker-closed dichotomy

Only the `CriticalShellSystem` fields are used: no minimality, no cap, no
frontier. -/

/-- Deleting a set containing `s` deletes at least `s`. -/
theorem sdiff_subset_erase {A V : Finset ℝ²} {s : ℝ²} (hsV : s ∈ V) :
    A \ V ⊆ A.erase s := by
  intro z hz
  rcases Finset.mem_sdiff.mp hz with ⟨hzA, hzV⟩
  refine Finset.mem_erase.mpr ⟨?_, hzA⟩
  intro hzs
  exact hzV (by rw [hzs]; exact hsV)

#print axioms sdiff_subset_erase

/-- **Target 1 — the escaping-blocker producer.**  If a deleted source `s ∈ V`
has its designated blocker center outside `V`, then that blocker center is a
*named* failed remaining center for the whole deletion `V`.

`A ∖ V ⊆ A ∖ {s}`, so the singleton criticality field
`CriticalShellSystem.no_qfree_at` already refutes `K4` there, and `χ s ≠ s`
keeps `χ s` in the carrier. -/
theorem exists_failed_center_of_escaping_blocker
    {A : Finset ℝ²} (H : CriticalShellSystem A) {V : Finset ℝ²} {s : ℝ²}
    (hsA : s ∈ A) (hsV : s ∈ V) (hesc : H.centerAt s hsA ∉ V) :
    H.centerAt s hsA ∈ A \ V ∧
      ¬ HasNEquidistantPointsAt 4 (A \ V) (H.centerAt s hsA) := by
  refine ⟨Finset.mem_sdiff.mpr ⟨centerAt_mem_A H hsA, hesc⟩, fun h ↦ ?_⟩
  exact H.no_qfree_at s hsA (equidistantAt_mono (sdiff_subset_erase hsV) h)

#print axioms exists_failed_center_of_escaping_blocker

/-- **(MD) whenever some designated blocker escapes the deletion.**  This is
the packaged form of `exists_failed_center_of_escaping_blocker`. -/
theorem exists_failed_remaining_center_of_not_blockerClosed
    {A : Finset ℝ²} (H : CriticalShellSystem A) {V : Finset ℝ²} (hVA : V ⊆ A)
    (hesc : ∃ s : ℝ², ∃ hs : s ∈ V, H.centerAt s (hVA hs) ∉ V) :
    ∃ c ∈ A \ V, ¬ HasNEquidistantPointsAt 4 (A \ V) c := by
  obtain ⟨s, hsV, hsesc⟩ := hesc
  obtain ⟨hmem, hfail⟩ :=
    exists_failed_center_of_escaping_blocker H (hVA hsV) hsV hsesc
  exact ⟨H.centerAt s (hVA hsV), hmem, hfail⟩

#print axioms exists_failed_remaining_center_of_not_blockerClosed

/-- **Target 2 — the blocker-closed dichotomy.**  If every remaining carrier
point keeps its `K4` witness after deleting `V`, then `V` is closed under the
designated blocker map.  Contrapositive of Target 1. -/
theorem blockerClosed_of_globalK4_sdiff
    {A : Finset ℝ²} (H : CriticalShellSystem A) {V : Finset ℝ²} (hVA : V ⊆ A)
    (hglobal : ∀ c ∈ A \ V, HasNEquidistantPointsAt 4 (A \ V) c)
    {s : ℝ²} (hsV : s ∈ V) :
    H.centerAt s (hVA hsV) ∈ V := by
  by_contra hesc
  obtain ⟨hmem, hfail⟩ :=
    exists_failed_center_of_escaping_blocker H (hVA hsV) hsV hesc
  exact hfail (hglobal _ hmem)

#print axioms blockerClosed_of_globalK4_sdiff

/-- The total (choice-free-at-the-boundary) designated blocker map: `χ` on the
carrier, the identity off it. -/
noncomputable def blockerMap {A : Finset ℝ²} (H : CriticalShellSystem A)
    (z : ℝ²) : ℝ² :=
  if hz : z ∈ A then H.centerAt z hz else z

/-- On the carrier, `blockerMap` is the designated blocker center. -/
theorem blockerMap_of_mem {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z : ℝ²} (hz : z ∈ A) : blockerMap H z = H.centerAt z hz :=
  dif_pos hz

#print axioms blockerMap_of_mem

/-- `blockerMap` maps the carrier to itself. -/
theorem blockerMap_mem_A {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z : ℝ²} (hz : z ∈ A) : blockerMap H z ∈ A := by
  rw [blockerMap_of_mem H hz]
  exact centerAt_mem_A H hz

#print axioms blockerMap_mem_A

/-- `blockerMap` is fixed-point-free on the carrier. -/
theorem blockerMap_ne_self {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z : ℝ²} (hz : z ∈ A) : blockerMap H z ≠ z := by
  rw [blockerMap_of_mem H hz]
  exact centerAt_ne_self H hz

#print axioms blockerMap_ne_self

/-- A deletion set is *blocker-closed* when it is a sub-carrier closed under
the designated blocker map. -/
def BlockerClosed {A : Finset ℝ²} (H : CriticalShellSystem A)
    (V : Finset ℝ²) : Prop :=
  V ⊆ A ∧ ∀ s ∈ V, blockerMap H s ∈ V

/-- `blockerMap` form of the Target 2 dichotomy. -/
theorem blockerClosed_of_globalK4_sdiff'
    {A : Finset ℝ²} (H : CriticalShellSystem A) {V : Finset ℝ²} (hVA : V ⊆ A)
    (hglobal : ∀ c ∈ A \ V, HasNEquidistantPointsAt 4 (A \ V) c) :
    BlockerClosed H V := by
  refine ⟨hVA, fun s hsV ↦ ?_⟩
  rw [blockerMap_of_mem H (hVA hsV)]
  exact blockerClosed_of_globalK4_sdiff H hVA hglobal hsV

#print axioms blockerClosed_of_globalK4_sdiff'

/-- **The residual of the singleton-blocker mechanism.**  For every
sub-carrier `V`, either the designated blockers already produce a failed
remaining center, or `V` is blocker-closed — in which case the singleton
criticality data says nothing at all about `A ∖ V`. -/
theorem md_or_blockerClosed
    {A : Finset ℝ²} (H : CriticalShellSystem A) {V : Finset ℝ²} (hVA : V ⊆ A) :
    (∃ c ∈ A \ V, ¬ HasNEquidistantPointsAt 4 (A \ V) c) ∨ BlockerClosed H V := by
  by_cases hclosed : ∀ s ∈ V, blockerMap H s ∈ V
  · exact Or.inr ⟨hVA, hclosed⟩
  · refine Or.inl (exists_failed_remaining_center_of_not_blockerClosed H hVA ?_)
    push_neg at hclosed
    obtain ⟨s, hsV, hsesc⟩ := hclosed
    refine ⟨s, hsV, ?_⟩
    rwa [blockerMap_of_mem H (hVA hsV)] at hsesc

#print axioms md_or_blockerClosed

/- ## §3 Sanity instantiations: the `|V| ≤ 2` cases

These recover, from the general dichotomy, the banked pair census of
`lean/scratch/d-package-bank/D1GlobalSurvival.lean` §2. -/

/-- Deleting a pair as a set is deleting it one point at a time. -/
theorem sdiff_pair_eq_erase_erase {A : Finset ℝ²} (z₁ z₂ : ℝ²) :
    A \ ({z₁, z₂} : Finset ℝ²) = (A.erase z₁).erase z₂ := by
  ext x
  simp only [Finset.mem_sdiff, Finset.mem_erase, Finset.mem_insert,
    Finset.mem_singleton, not_or]
  tauto

#print axioms sdiff_pair_eq_erase_erase

/-- **Target 3, singleton case.**  A single deletion never restores the global
four-equidistant property: `χ s ∈ {s}` contradicts `χ s ≠ s`. -/
theorem false_of_globalK4_singleErase
    {A : Finset ℝ²} (H : CriticalShellSystem A) {s : ℝ²} (hs : s ∈ A)
    (hglobal : ∀ c ∈ A \ ({s} : Finset ℝ²),
      HasNEquidistantPointsAt 4 (A \ ({s} : Finset ℝ²)) c) :
    False := by
  have hVA : ({s} : Finset ℝ²) ⊆ A := Finset.singleton_subset_iff.mpr hs
  have hmem := blockerClosed_of_globalK4_sdiff H hVA hglobal
    (Finset.mem_singleton_self s)
  have hmem' : H.centerAt s hs ∈ ({s} : Finset ℝ²) := hmem
  exact centerAt_ne_self H hs (Finset.mem_singleton.mp hmem')

#print axioms false_of_globalK4_singleErase

/-- Erase form of `false_of_globalK4_singleErase`. -/
theorem false_of_hasNEquidistantProperty_erase
    {A : Finset ℝ²} (H : CriticalShellSystem A) {s : ℝ²} (hs : s ∈ A)
    (hprop : HasNEquidistantProperty 4 (A.erase s)) :
    False := by
  refine false_of_globalK4_singleErase H hs (fun c hc ↦ ?_)
  rw [Finset.sdiff_singleton_eq_erase] at hc ⊢
  exact hprop c hc

#print axioms false_of_hasNEquidistantProperty_erase

/-- **Target 3, pair case.**  A two-point deletion restoring the global
four-equidistant property forces the two deleted points to be each other's
designated blocker centers.

Provenance of the statement: `D1GlobalSurvival.mutual_centerAt_of_globalK4_pairErase`;
the proof here is the `|V| = 2` instance of `blockerClosed_of_globalK4_sdiff`. -/
theorem mutual_centerAt_of_blockerClosed_pair
    {A : Finset ℝ²} (H : CriticalShellSystem A) {z₁ z₂ : ℝ²}
    (hz₁ : z₁ ∈ A) (hz₂ : z₂ ∈ A)
    (hglobal : ∀ c ∈ A \ ({z₁, z₂} : Finset ℝ²),
      HasNEquidistantPointsAt 4 (A \ ({z₁, z₂} : Finset ℝ²)) c) :
    H.centerAt z₁ hz₁ = z₂ ∧ H.centerAt z₂ hz₂ = z₁ := by
  have hVA : ({z₁, z₂} : Finset ℝ²) ⊆ A :=
    Finset.insert_subset_iff.mpr ⟨hz₁, Finset.singleton_subset_iff.mpr hz₂⟩
  have h₁ : H.centerAt z₁ hz₁ ∈ ({z₁, z₂} : Finset ℝ²) :=
    blockerClosed_of_globalK4_sdiff H hVA hglobal (Finset.mem_insert_self z₁ _)
  have h₂ : H.centerAt z₂ hz₂ ∈ ({z₁, z₂} : Finset ℝ²) :=
    blockerClosed_of_globalK4_sdiff H hVA hglobal
      (Finset.mem_insert_of_mem (Finset.mem_singleton_self z₂))
  refine ⟨?_, ?_⟩
  · rcases Finset.mem_insert.mp h₁ with h | h
    · exact absurd h (centerAt_ne_self H hz₁)
    · exact Finset.mem_singleton.mp h
  · rcases Finset.mem_insert.mp h₂ with h | h
    · exact h
    · exact absurd (Finset.mem_singleton.mp h) (centerAt_ne_self H hz₂)

#print axioms mutual_centerAt_of_blockerClosed_pair

/-- Erase form of the pair case, matching the banked
`D1GlobalSurvival.mutual_centerAt_of_globalK4_pairErase` verbatim. -/
theorem mutual_centerAt_of_globalK4_pairErase
    {A : Finset ℝ²} (H : CriticalShellSystem A) {z₁ z₂ : ℝ²}
    (hz₁ : z₁ ∈ A) (hz₂ : z₂ ∈ A)
    (hprop : HasNEquidistantProperty 4 ((A.erase z₁).erase z₂)) :
    H.centerAt z₁ hz₁ = z₂ ∧ H.centerAt z₂ hz₂ = z₁ := by
  refine mutual_centerAt_of_blockerClosed_pair H hz₁ hz₂ (fun c hc ↦ ?_)
  rw [sdiff_pair_eq_erase_erase] at hc ⊢
  exact hprop c hc

#print axioms mutual_centerAt_of_globalK4_pairErase

/- ## §4 What blocker-closedness forces -/

/-- **Target 4a.**  A nonempty blocker-closed deletion set has at least two
points: `s` and `χ s` are distinct members. -/
theorem two_le_card_of_blockerClosed
    {A : Finset ℝ²} {H : CriticalShellSystem A} {V : Finset ℝ²}
    (hclosed : BlockerClosed H V) (hne : V.Nonempty) :
    2 ≤ V.card := by
  obtain ⟨s, hsV⟩ := hne
  have hlt : 1 < V.card :=
    Finset.one_lt_card.mpr
      ⟨s, hsV, blockerMap H s, hclosed.2 s hsV,
        (blockerMap_ne_self H (hclosed.1 hsV)).symm⟩
  omega

#print axioms two_le_card_of_blockerClosed

/-- **Blocker multiplicity bound.**  At most four carrier points share any one
designated blocker center.

Provenance: `Problem97.B2Arm3.blockerFiber_card_le_four`, restated for the
total map `blockerMap` and for an arbitrary (possibly unattained) center. -/
theorem blockerFiber_card_le_four {A : Finset ℝ²} (H : CriticalShellSystem A)
    (c : ℝ²) :
    (A.filter fun y ↦ blockerMap H y = c).card ≤ 4 := by
  rcases Finset.eq_empty_or_nonempty (A.filter fun y ↦ blockerMap H y = c) with
    hempty | ⟨q, hq⟩
  · rw [hempty]
    simp
  · rcases Finset.mem_filter.mp hq with ⟨hqA, hqc⟩
    have hqcenter : H.centerAt q hqA = c := by
      rw [← blockerMap_of_mem H hqA]
      exact hqc
    have hsub : (A.filter fun y ↦ blockerMap H y = c) ⊆
        (H.selectedAt q hqA).toCriticalFourShell.support := by
      intro y hy
      rcases Finset.mem_filter.mp hy with ⟨hyA, hyc⟩
      refine mem_support_of_centerAt_eq H q hqA y hyA ?_
      rw [← blockerMap_of_mem H hyA, hyc, hqcenter]
    calc
      (A.filter fun y ↦ blockerMap H y = c).card
          ≤ (H.selectedAt q hqA).toCriticalFourShell.support.card :=
        Finset.card_le_card hsub
      _ = 4 := (H.selectedAt q hqA).toCriticalFourShell.support_card

#print axioms blockerFiber_card_le_four

/-- **Target 4b — fiber counting.**  Every sub-carrier is at most four times
the size of its designated blocker image.  In particular a blocker-closed `V`
of size `n` carries at least `⌈n/4⌉` distinct blocker centers, all inside `V`. -/
theorem card_le_four_mul_card_blockerImage {A : Finset ℝ²}
    (H : CriticalShellSystem A) {V : Finset ℝ²} (hVA : V ⊆ A) :
    V.card ≤ 4 * (V.image (blockerMap H)).card := by
  refine Finset.card_le_mul_card_image V 4 (fun c _ ↦ ?_)
  refine le_trans (Finset.card_le_card ?_) (blockerFiber_card_le_four H c)
  intro y hy
  rcases Finset.mem_filter.mp hy with ⟨hyV, hyc⟩
  exact Finset.mem_filter.mpr ⟨hVA hyV, hyc⟩

#print axioms card_le_four_mul_card_blockerImage

/-- The designated blocker image of a blocker-closed set stays inside it. -/
theorem blockerImage_subset_of_blockerClosed
    {A : Finset ℝ²} {H : CriticalShellSystem A} {V : Finset ℝ²}
    (hclosed : BlockerClosed H V) :
    V.image (blockerMap H) ⊆ V := by
  intro c hc
  rcases Finset.mem_image.mp hc with ⟨s, hsV, rfl⟩
  exact hclosed.2 s hsV

#print axioms blockerImage_subset_of_blockerClosed

/-- **Blocker-closed counting normal form.**  A blocker-closed `V` has size at
least two, and its blocker image is a subset of `V` of size at least
`V.card / 4`. -/
theorem blockerClosed_counting_normalForm
    {A : Finset ℝ²} {H : CriticalShellSystem A} {V : Finset ℝ²}
    (hclosed : BlockerClosed H V) (hne : V.Nonempty) :
    2 ≤ V.card ∧ V.image (blockerMap H) ⊆ V ∧
      V.card ≤ 4 * (V.image (blockerMap H)).card :=
  ⟨two_le_card_of_blockerClosed hclosed hne,
    blockerImage_subset_of_blockerClosed hclosed,
    card_le_four_mul_card_blockerImage H hclosed.1⟩

#print axioms blockerClosed_counting_normalForm

/- ## §5 The periodic orbit of a fixed-point-free finite self-map

Pure `Finset`/`Function` combinatorics; no geometry. -/

/-- **Target 5.**  A nonempty finite set closed under a fixed-point-free
self-map contains a point with a period of length at least two. -/
theorem exists_periodic_of_fixedPointFree_selfMap {α : Type*}
    {V : Finset α} {f : α → α} (hne : V.Nonempty)
    (hmap : ∀ x ∈ V, f x ∈ V) (hfree : ∀ x ∈ V, f x ≠ x) :
    ∃ x ∈ V, ∃ n : ℕ, 2 ≤ n ∧ f^[n] x = x := by
  obtain ⟨x₀, hx₀⟩ := hne
  have hiter : ∀ k : ℕ, f^[k] x₀ ∈ V := by
    intro k
    induction k with
    | zero => simpa using hx₀
    | succ k ih =>
      rw [Function.iterate_succ_apply']
      exact hmap _ ih
  have key : ∀ i j : ℕ, i < j → f^[i] x₀ = f^[j] x₀ →
      ∃ x ∈ V, ∃ n : ℕ, 2 ≤ n ∧ f^[n] x = x := by
    intro i j hlt heq
    have hji : j - i + i = j := by omega
    have hkey : f^[j - i] (f^[i] x₀) = f^[j] x₀ := by
      rw [← Function.iterate_add_apply, hji]
    have hfix : f^[j - i] (f^[i] x₀) = f^[i] x₀ := hkey.trans heq.symm
    refine ⟨f^[i] x₀, hiter i, j - i, ?_, hfix⟩
    rcases Nat.lt_or_ge (j - i) 2 with hsmall | hbig
    · exfalso
      have hone : j - i = 1 := by omega
      rw [hone, Function.iterate_one] at hfix
      exact hfree _ (hiter i) hfix
    · exact hbig
  have hcard : V.card < (Finset.range (V.card + 1)).card := by simp
  obtain ⟨i, _, j, _, hij, heq⟩ :=
    Finset.exists_ne_map_eq_of_card_lt_of_maps_to hcard
      (fun k (_ : k ∈ Finset.range (V.card + 1)) ↦ hiter k)
  rcases Nat.lt_or_ge i j with hlt | hge
  · exact key i j hlt heq
  · exact key j i (by omega) heq.symm

#print axioms exists_periodic_of_fixedPointFree_selfMap

/-- **Blocker cycles.**  A nonempty blocker-closed deletion set contains a
`blockerMap`-periodic point of period at least two.  The `|V| = 2` case is the
mutual-blocker pair of §3. -/
theorem exists_blocker_cycle_of_blockerClosed
    {A : Finset ℝ²} {H : CriticalShellSystem A} {V : Finset ℝ²}
    (hclosed : BlockerClosed H V) (hne : V.Nonempty) :
    ∃ x ∈ V, ∃ n : ℕ, 2 ≤ n ∧ (blockerMap H)^[n] x = x :=
  exists_periodic_of_fixedPointFree_selfMap hne hclosed.2
    (fun _ hx ↦ blockerMap_ne_self H (hclosed.1 hx))

#print axioms exists_blocker_cycle_of_blockerClosed

/- ## §6 (MD) from global cardinal minimality

`ATailGlobalMinimalDeletion` already proves both halves; this section only
adapts them to the shape named in the round-1 response, and records the sharp
consequence for a blocker-closed `V`. -/

/-- **Target 6 — (MD).**  For a minimal counterexample carrier, every nonempty
proper deletion set leaves a carrier point at which `K4` fails.

Reuses `ATailGlobalMinimalDeletion.not_hasNEquidistantProperty_of_nonempty_proper_subset`
and `ATailGlobalMinimalDeletion.exists_local_blocker_of_not_global_K4`; nothing
is reproved. -/
theorem exists_failed_remaining_center_of_minimal
    {D : CounterexampleData} (hmin : D.Minimal) {V : Finset ℝ²}
    (hVne : V.Nonempty) (hVA : V ⊆ D.A) (hVproper : V ≠ D.A) :
    ∃ c ∈ D.A \ V, ¬ HasNEquidistantPointsAt 4 (D.A \ V) c := by
  have hremaining : (D.A \ V).Nonempty :=
    Finset.sdiff_nonempty.mpr fun hsub ↦
      hVproper (Finset.Subset.antisymm hVA hsub)
  have hproper : D.A \ V ≠ D.A := by
    obtain ⟨v, hvV⟩ := hVne
    intro heq
    have hvRemaining : v ∈ D.A \ V := by
      rw [heq]
      exact hVA hvV
    exact (Finset.mem_sdiff.mp hvRemaining).2 hvV
  exact ATailGlobalMinimalDeletion.exists_local_blocker_of_not_global_K4
    (ATailGlobalMinimalDeletion.not_hasNEquidistantProperty_of_nonempty_proper_subset
      hmin hremaining Finset.sdiff_subset hproper)

#print axioms exists_failed_remaining_center_of_minimal

/-- **The blocker-closed residual is genuinely fresh.**  For a minimal carrier
and a nonempty proper blocker-closed deletion set `V`, minimality still
supplies a failed remaining center — and that center is *never* the designated
blocker of any deleted source, since all of those lie in `V`.

This is the exact sense in which the singleton criticality data of
`CriticalShellSystem` does not reach the blocker-closed case: it produces no
witness, and the witness minimality does produce is outside its image. -/
theorem exists_fresh_failed_center_of_blockerClosed
    {D : CounterexampleData} (hmin : D.Minimal) {H : CriticalShellSystem D.A}
    {V : Finset ℝ²} (hVne : V.Nonempty) (hVproper : V ≠ D.A)
    (hclosed : BlockerClosed H V) :
    ∃ c ∈ D.A \ V,
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) c ∧
        ∀ s ∈ V, blockerMap H s ≠ c := by
  obtain ⟨c, hcMem, hcFail⟩ :=
    exists_failed_remaining_center_of_minimal hmin hVne hclosed.1 hVproper
  refine ⟨c, hcMem, hcFail, fun s hsV hEq ↦ (Finset.mem_sdiff.mp hcMem).2 ?_⟩
  rw [← hEq]
  exact hclosed.2 s hsV

#print axioms exists_fresh_failed_center_of_blockerClosed

/-- **Minimality census for a deletion set.**  Either the designated blockers
already name a failed remaining center, or `V` is blocker-closed — and then it
has at least two points, its blocker image is an inner subset of size at least
a quarter of `V`, it carries a blocker cycle of length at least two, and the
failed center supplied by minimality avoids every designated blocker. -/
theorem md_census_of_minimal
    {D : CounterexampleData} (hmin : D.Minimal) (H : CriticalShellSystem D.A)
    {V : Finset ℝ²} (hVne : V.Nonempty) (hVA : V ⊆ D.A) (hVproper : V ≠ D.A) :
    (∃ s : ℝ², ∃ hs : s ∈ V, H.centerAt s (hVA hs) ∉ V) ∨
      (BlockerClosed H V ∧
        2 ≤ V.card ∧
        V.image (blockerMap H) ⊆ V ∧
        V.card ≤ 4 * (V.image (blockerMap H)).card ∧
        (∃ x ∈ V, ∃ n : ℕ, 2 ≤ n ∧ (blockerMap H)^[n] x = x) ∧
        ∃ c ∈ D.A \ V,
          ¬ HasNEquidistantPointsAt 4 (D.A \ V) c ∧
            ∀ s ∈ V, blockerMap H s ≠ c) := by
  by_cases hclosed : ∀ s ∈ V, blockerMap H s ∈ V
  · have hBC : BlockerClosed H V := ⟨hVA, hclosed⟩
    obtain ⟨hcard, himage, hbound⟩ := blockerClosed_counting_normalForm hBC hVne
    exact Or.inr ⟨hBC, hcard, himage, hbound,
      exists_blocker_cycle_of_blockerClosed hBC hVne,
      exists_fresh_failed_center_of_blockerClosed hmin hVne hVproper hBC⟩
  · refine Or.inl ?_
    push_neg at hclosed
    obtain ⟨s, hsV, hsesc⟩ := hclosed
    refine ⟨s, hsV, ?_⟩
    rwa [blockerMap_of_mem H (hVA hsV)] at hsesc

#print axioms md_census_of_minimal

end MDBlockerClosed
end Problem97
