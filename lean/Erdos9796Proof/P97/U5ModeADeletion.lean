/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.U2EquilateralMECFromM44
import Erdos9796Proof.P97.SmallerCounterexample
import Erdos9796Proof.P97.Cap.PartitionFromMEC

open scoped EuclideanGeometry

/-!
# U5 — Mode A deletion theorem (direct C39 replacement)

This file states `U5` from `docs/97-uniform-theorem-closure-plan.md`
(Phase 4, lines 368–463) in formal Lean.

Upstream prose statement:

> **U5.**  In Mode A, if a chosen large-cap point `q` is non-removable,
> then some fixed-arc interior apex `p` has maximum fixed multiplicity
> exactly `3` in the skeleton `S = P ∖ {q}`, and `q` lies on the
> corresponding `p`-centered triple circle.  Every surviving
> fixed-triple component either:
> 1. already gives `p` a `4`-class avoiding `q`; or
> 2. violates strict convex order / circle-incidence constraints.

U5 is the **direct C39 replacement** target — closing it removes the
only certificate-backed import in the current theorem-facing
assembly (`docs/97-c39-certificate-audit.md`).

## Hard non-circularity constraints (closure plan Phase 0)

* No `FiniteN9Closure` cite.
* No `K4(q)` axiom or `q`-center chart import.
* No C39 cite.

These hold by inspection: every `HasNEquidistantPointsAt 4` instance
below is at a *non-`q`* apex, and the only finite-certificate
admissible in Phase 4B is a *local replay* over the 432-skeleton table
(`docs/97-c39-certificate-audit.md`) restricted to deletion-only
content — the chart-bijection lift is itself open.

## What this scaffold provides

* `SurplusCapPacket.surplusApex` — imported from
  `U1TwoShortCapReduction`; reused here as the Moser apex opposite the
  surplus cap.
* `CounterexampleData.skeleton` — `S = A ∖ {q}` for a chosen `q`.
* `muP` — skeleton multiplicity at an apex `p` (max same-distance
  class cardinality in `S ∖ {p}`).
* `U5ModeA` — Mode A predicate per closure-plan U4 lines 326–328
  (radius `d`, two endpoints, ≥ 2 interior).
* Sublemma `def` signatures for the three work packages 4A
  (`U5_4A_preservation/lowerBound/tripleCircle`), 4B
  (`U5_4B_saturatedFinite`), 4C (`U5_4C_positiveDimensional`).
* `U5StrictOrderViolation` — strict-order / circle-incidence
  violation alternative (Phase 4C; placeholder until variety
  classification lands).
* `U5ModeADeletion` — combined U5 statement.

## What is *not* yet proved

All seven `def`s above are open obligations.  The closure-plan path:

* **4A first** (skeleton multiplicity lemmas from Finset cardinality).
* **4B chart-bijection lift** — `{{NEEDS_ADAM_INPUT}}`: is the
  10-point → 432-row chart bijection already proved in
  `97-c39-certificate-audit.md`, or is it itself an open obligation?
  Per the math-professor design 2026-05-21 (this scaffold's source
  spec), 4B's status depends on this answer.
* **4C** (variety classification) — explicitly marked CONJECTURED by
  closure plan line 454.

## Downstream consumers

After 4A / 4B / 4C close, a composition lemma will derive
`U5ModeADeletion D` by case-split on `muP (D.skeleton q) p`.  That
composition is intentionally NOT included in this scaffold — it would
require sorry / open proof, which the project policy forbids.
-/

namespace Problem97

/- ### Skeleton helpers -/

/-- The skeleton obtained by deleting `q` from `D.A`. -/
noncomputable def CounterexampleData.skeleton (D : CounterexampleData) (q : ℝ²) :
    Finset ℝ² :=
  D.A.erase q

/- ### Skeleton multiplicity -/

/-- **Skeleton multiplicity at an apex.**

`muP S p` is the maximum, over distances realized by `S ∖ {p}`, of the
cardinality of the same-distance class around `p` inside `S ∖ {p}`.
Closure plan task 4A (line 399).

Equivalent formulations:
* The max over points `y ∈ S ∖ {p}` of `|{y' ∈ S ∖ {p} : dist p y = dist p y'}|`.
* Returns `0` on `S ∖ {p}` empty (no realized distances). -/
noncomputable def muP (S : Finset ℝ²) (p : ℝ²) : ℕ :=
  (S.erase p).sup fun y =>
    ((S.erase p).filter fun y' => dist p y = dist p y').card

/-- The skeleton multiplicity only depends on the erased set `S.erase p`,
so erasing `p` again does nothing. -/
theorem muP_erase_self (S : Finset ℝ²) (p : ℝ²) :
    muP (S.erase p) p = muP S p := by
  unfold muP
  simp

/-- The maximum same-distance class around `p` is bounded by the size of
`S.erase p`.  This is the basic finitary estimate used in the 4A packet. -/
theorem muP_le_card_erase (S : Finset ℝ²) (p : ℝ²) :
    muP S p ≤ (S.erase p).card := by
  unfold muP
  refine Finset.sup_le ?_
  intro y hy
  exact Finset.card_filter_le _ _

/- ### Mode A predicate (closure plan U4 lines 326–328) -/

/-- **Mode A of U4.**

On `D`, the opposite-MEC `4`-class on the surplus cap has radius `d`
(the common MEC side length from `U2`), uses the two large-cap
endpoints (the two non-surplus Moser-triangle vertices shared with
the surplus cap), and uses at least two *interior* surplus-cap
points on the corresponding `d`-Apollonius arc.

Stated against `U2Statement D` so the radius `d` and the Apollonius
geometry are available as hypotheses. -/
def U5ModeA (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D →
    ∃ (d : ℝ) (K : Finset ℝ²),
      0 < d ∧
      K ⊆ D.A ∧
      (∀ x ∈ K, dist x D.packet.surplusApex = d) ∧
      4 ≤ K.card ∧
      (∃ e₁ e₂ : ℝ², e₁ ∈ K ∧ e₂ ∈ K ∧ e₁ ≠ e₂ ∧
        e₁ ∈ D.packet.oppCap1 ∧ e₁ ∈ D.packet.surplusCap ∧
        e₂ ∈ D.packet.oppCap2 ∧ e₂ ∈ D.packet.surplusCap) ∧
      2 ≤ (K.filter (fun x => x ∈ D.packet.surplusCap ∧
            x ≠ D.packet.triangle.v1 ∧ x ≠ D.packet.triangle.v2 ∧
            x ≠ D.packet.triangle.v3)).card

/- ### Strict order / circle-incidence violation placeholder -/

/-- **Strict convex order / circle-incidence constraint violation.**

The alternative arm of the 4C variety classification: along a
fixed-triple variety on which `q` would have to sit, the resulting
convex-position / Apollonius-arc incidences are mutually inconsistent.

{{NEEDS_UPDATE}}: refine once 4C variety work begins.  Currently
`True` placeholder so the combined `U5ModeADeletion` statement is
well-formed; this is `weaker` than the closure-plan prose but
correctly hides the work behind a named obligation. -/
def U5StrictOrderViolation (_D : CounterexampleData) (_q _p : ℝ²) : Prop :=
  True

/- ### Work-package sublemma signatures -/

/-- **4A.1 — Preservation.**  `μ_p(S) ≥ 4` ⇒ `K4` survives at `p`
after deletion of `q`.  Closure plan line 401. -/
def U5_4A_preservation (D : CounterexampleData) (q p : ℝ²) : Prop :=
  q ∈ D.A → p ∈ D.A → p ≠ q →
    4 ≤ muP (D.skeleton q) p →
    HasNEquidistantPointsAt 4 (D.skeleton q) p

/-- **4A.2 — Lower bound.**  `μ_p(S) ≤ 2` ⇒ no placement of `q`
re-establishes `K4` at `p`.  Closure plan line 402. -/
def U5_4A_lowerBound (D : CounterexampleData) (q p : ℝ²) : Prop :=
  q ∈ D.A → p ∈ D.A → p ≠ q →
    muP (D.skeleton q) p ≤ 2 →
    ¬ HasNEquidistantPointsAt 4 D.A p

/-- **4A.3 — Triple circle.**  `μ_p(S) = 3` ⇒ `K4(p)` on the original
configuration requires `q` to lie on the unique `p`-centered triple
circle of `S ∖ {p}`.  Closure plan line 403. -/
def U5_4A_tripleCircle (D : CounterexampleData) (q p : ℝ²) : Prop :=
  q ∈ D.A → p ∈ D.A → p ≠ q →
    muP (D.skeleton q) p = 3 →
    HasNEquidistantPointsAt 4 D.A p →
    ∃ r : ℝ, 0 < r ∧ dist p q = r ∧
      (((D.skeleton q).erase p).filter (fun y => dist p y = r)).card = 3

/-- **4B — Saturated finite branch.**

The AP-count `≥ 3` saturated families already closed in the `n = 10`
finite-skeleton certificate, lifted to a deletion-only statement.
*Statement-level only* in this scaffold.

Admissible as a *local replay bridge* per closure plan §"Certificate
Policy" (lines 290–294); blocked on the chart-bijection lift
({{NEEDS_ADAM_INPUT}}).

The AP-count `0,1,2` saturated extension (closure plan line 416) is
the *new* finite work to be done deletion-only. -/
def U5_4B_saturatedFinite (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    D.A.card = 10 →
    ∀ q ∈ D.packet.surplusCap, IsRemovableVertex D.A q ∨
      ∃ p ∈ D.A, p ∉ ({D.packet.triangle.v1, D.packet.triangle.v2,
                       D.packet.triangle.v3, q} : Finset ℝ²) ∧
        muP (D.skeleton q) p = 3

/-- **4C — Positive-dimensional fixed-triple loci.**

For surviving one-free-shaped families with `|A| ≥ 11`, every
fixed-triple component is either `q`-free (delivers a 4-class at `p`
without `q`) or order-incident-violating.  Closure plan lines
421–432; explicitly marked CONJECTURED at line 454. -/
def U5_4C_positiveDimensional (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    11 ≤ D.A.card →
    ∀ q ∈ D.packet.surplusCap, ∀ p ∈ D.A,
      muP (D.skeleton q) p = 3 →
      HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p ∨
      U5StrictOrderViolation D q p

/- ### Combined U5 statement -/

/-- **U5 — Mode A deletion theorem (formal statement).**

In Mode A, every chosen large-cap point `q ∈ surplusCap` is either
removable, or witnesses a fixed-arc interior apex `p` with `μ_p(S) = 3`
and `q` on the corresponding `p`-centered triple circle — and even
then, every such component either supplies a `q`-free `4`-class at
`p` or violates strict convex-order / circle-incidence constraints.

The combined statement is the direct C39 replacement target. -/
def U5ModeADeletion (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    ∀ q ∈ D.packet.surplusCap,
      IsRemovableVertex D.A q ∨
      ∃ p ∈ D.A,
        p ∉ ({D.packet.triangle.v1, D.packet.triangle.v2,
              D.packet.triangle.v3, q} : Finset ℝ²) ∧
        muP (D.skeleton q) p = 3 ∧
        (∃ r : ℝ, 0 < r ∧ dist p q = r ∧
          (((D.skeleton q).erase p).filter (fun y => dist p y = r)).card = 3) ∧
        ( HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p ∨
          U5StrictOrderViolation D q p )

/- ### 4A — Skeleton-multiplicity proofs

The three 4A sublemmas are pure `Finset` cardinality facts (closure
plan line 399, "depends only on `Finset` cardinality"): no geometric
content beyond `dist` positivity and the fact that deleting a single
point from `A` reduces any same-distance class around `p` by at most
one element. -/

/-- Helper.  For any `S : Finset ℝ²` and any `p : ℝ²`, if `r > 0` then
`p` is not in the filter `{x ∈ S : dist p x = r}` (since `dist p p = 0`).
This lets us swap between `S.filter (dist p · = r)` and
`(S.erase p).filter (dist p · = r)` without changing cardinality. -/
private lemma filter_dist_card_eq_erase_filter_dist_card
    (S : Finset ℝ²) (p : ℝ²) (r : ℝ) (hr : 0 < r) :
    (S.filter (fun y => dist p y = r)).card =
      ((S.erase p).filter (fun y => dist p y = r)).card := by
  congr 1
  ext x
  simp only [Finset.mem_filter, Finset.mem_erase]
  refine ⟨fun ⟨hxS, hxd⟩ => ?_, fun ⟨⟨_, hxS⟩, hxd⟩ => ⟨hxS, hxd⟩⟩
  refine ⟨⟨?_, hxS⟩, hxd⟩
  rintro rfl
  rw [dist_self] at hxd
  exact ne_of_lt hr hxd

/-- Removing the apex point from the ambient set does not change a
positive-radius same-distance witness class.  This is the theorem-facing
transport needed when passing from `D.skeleton q` to `((D.skeleton q).erase p)`
in the U5 output shape. -/
private theorem hasNEquidistantPointsAt_erase_self
    {S : Finset ℝ²} {p : ℝ²} :
    HasNEquidistantPointsAt 4 S p →
      HasNEquidistantPointsAt 4 (S.erase p) p := by
  intro hK4
  obtain ⟨r, hr_pos, hr_card⟩ := hK4
  refine ⟨r, hr_pos, ?_⟩
  simpa [filter_dist_card_eq_erase_filter_dist_card S p r hr_pos] using hr_card

/-- Helper.  If `y ∈ (S.erase p)` and `dist p y = r`, then the
same-distance class of `y` in `S.erase p` has cardinality at most
`muP S p`. -/
private lemma filter_dist_card_le_muP
    {S : Finset ℝ²} {p y : ℝ²} {r : ℝ}
    (hy_mem : y ∈ S.erase p) (hy_dist : dist p y = r) :
    ((S.erase p).filter (fun y' => dist p y' = r)).card ≤ muP S p := by
  unfold muP
  have hfilter_eq :
      (S.erase p).filter (fun y' => dist p y' = r) =
      (S.erase p).filter (fun y' => dist p y = dist p y') := by
    ext x; simp only [Finset.mem_filter, hy_dist, eq_comm]
  rw [hfilter_eq]
  exact Finset.le_sup (s := S.erase p)
    (f := fun z => ((S.erase p).filter (fun y' => dist p z = dist p y')).card)
    hy_mem

/-- **4A.1 — Preservation.**  Pure `Finset` cardinality. -/
theorem u5_4A_preservation_proof (D : CounterexampleData) (q p : ℝ²) :
    U5_4A_preservation D q p := by
  intro _hq _hp _hpq hmu
  unfold muP at hmu
  rw [Finset.le_sup_iff (by norm_num : (0 : ℕ) < 4)] at hmu
  obtain ⟨y, hy_mem, hy_card⟩ := hmu
  have hy_ne_p : y ≠ p := (Finset.mem_erase.mp hy_mem).1
  have hr_pos : (0 : ℝ) < dist p y :=
    dist_pos.mpr (Ne.symm hy_ne_p)
  refine ⟨dist p y, hr_pos, ?_⟩
  -- Goal: 4 ≤ |(D.skeleton q).filter (fun q' => dist p q' = dist p y)|
  -- We have: 4 ≤ |((D.skeleton q).erase p).filter (fun y' => dist p y = dist p y')|
  -- Step 1: the two filters with swapped `=` direction are equal
  have h1 :
      (((D.skeleton q).erase p).filter (fun y' => dist p y = dist p y')).card =
      (((D.skeleton q).erase p).filter (fun y' => dist p y' = dist p y)).card := by
    congr 1; ext x; simp only [Finset.mem_filter]; exact and_congr_right (fun _ => eq_comm)
  -- Step 2: erase_p version equals non-erase version (since dist p y > 0)
  have h2 :
      (((D.skeleton q).erase p).filter (fun y' => dist p y' = dist p y)).card =
      ((D.skeleton q).filter (fun y' => dist p y' = dist p y)).card :=
    (filter_dist_card_eq_erase_filter_dist_card (D.skeleton q) p (dist p y) hr_pos).symm
  linarith [hy_card, h1, h2]

/-- **4A.2 — Lower bound.**  Pure `Finset` cardinality.

Proof idea: if `K4` held at `p` in `A`, the witness 4-class around `p`
would lose at most one point under deletion of `q`, giving `μ_p(S) ≥ 3`.
Contrapositive of `μ_p(S) ≤ 2`. -/
theorem u5_4A_lowerBound_proof (D : CounterexampleData) (q p : ℝ²) :
    U5_4A_lowerBound D q p := by
  intro hq _hp _hpq hmu hK4
  obtain ⟨r, hr_pos, hr_card⟩ := hK4
  -- T := D.A.filter (dist p · = r) has card ≥ 4.
  set T := D.A.filter (fun q' => dist p q' = r)
  -- T' := (D.skeleton q).filter (dist p · = r) has card ≥ 3.
  have hT'_card :
      3 ≤ ((D.skeleton q).filter (fun q' => dist p q' = r)).card := by
    -- (D.skeleton q).filter P ⊇ T.erase q (since T ⊆ D.A and q gets erased).
    have h_eq : (D.skeleton q).filter (fun q' => dist p q' = r) = T.erase q := by
      ext x
      simp only [Finset.mem_filter, Finset.mem_erase, CounterexampleData.skeleton, T]
      tauto
    rw [h_eq]
    calc 3 = 4 - 1 := by norm_num
      _ ≤ T.card - 1 := Nat.sub_le_sub_right hr_card 1
      _ ≤ (T.erase q).card := by
          rcases Decidable.em (q ∈ T) with hqT | hqT
          · rw [Finset.card_erase_of_mem hqT]
          · rw [Finset.erase_eq_of_notMem hqT]
            exact Nat.sub_le _ _
  -- T'.erase p = T' (since p ∉ T' because dist p p = 0 ≠ r)
  have hT''_card :
      3 ≤ (((D.skeleton q).erase p).filter (fun q' => dist p q' = r)).card := by
    rw [← filter_dist_card_eq_erase_filter_dist_card _ _ _ hr_pos]
    exact hT'_card
  -- Pick y ∈ that filter; muP S p ≥ filter card ≥ 3.
  have hne :
      (((D.skeleton q).erase p).filter (fun q' => dist p q' = r)).Nonempty :=
    Finset.card_pos.mp (by omega)
  obtain ⟨y, hy⟩ := hne
  rw [Finset.mem_filter] at hy
  obtain ⟨hy_mem, hy_dist⟩ := hy
  have hmu_ge : 3 ≤ muP (D.skeleton q) p :=
    le_trans hT''_card (filter_dist_card_le_muP hy_mem hy_dist)
  omega

/-- **4A.3 — Triple circle.**  Pure `Finset` cardinality. -/
theorem u5_4A_tripleCircle_proof (D : CounterexampleData) (q p : ℝ²) :
    U5_4A_tripleCircle D q p := by
  intro hq _hp hpq hmu hK4
  obtain ⟨r, hr_pos, hr_card⟩ := hK4
  set T := D.A.filter (fun q' => dist p q' = r)
  -- Filter of D.skeleton q at radius r equals T.erase q.
  have hT'_eq :
      (D.skeleton q).filter (fun q' => dist p q' = r) = T.erase q := by
    ext x
    simp only [Finset.mem_filter, Finset.mem_erase, CounterexampleData.skeleton, T]
    tauto
  -- Case on q ∈ T: if not, the class survives in D.skeleton q with card ≥ 4,
  -- but muP S p = 3 — contradiction.
  have hqT : q ∈ T := by
    by_contra hqT
    have hT'_card_ge_4 :
        4 ≤ ((D.skeleton q).filter (fun q' => dist p q' = r)).card := by
      rw [hT'_eq, Finset.erase_eq_of_notMem hqT]; exact hr_card
    -- Lift to (D.skeleton q).erase p (dist p p = 0 ≠ r):
    have hT''_card_ge_4 :
        4 ≤ (((D.skeleton q).erase p).filter (fun q' => dist p q' = r)).card := by
      rw [← filter_dist_card_eq_erase_filter_dist_card _ _ _ hr_pos]
      exact hT'_card_ge_4
    -- Find witness y in this filter; muP S p ≥ 4 contradicts muP = 3.
    have hne :
        (((D.skeleton q).erase p).filter (fun q' => dist p q' = r)).Nonempty :=
      Finset.card_pos.mp (by omega)
    obtain ⟨y, hy⟩ := hne
    rw [Finset.mem_filter] at hy
    obtain ⟨hy_mem, hy_dist⟩ := hy
    have hmu_ge_4 : 4 ≤ muP (D.skeleton q) p :=
      le_trans hT''_card_ge_4 (filter_dist_card_le_muP hy_mem hy_dist)
    omega
  -- Now q ∈ T: extract `dist p q = r`.
  have hpq_dist : dist p q = r := (Finset.mem_filter.mp hqT).2
  refine ⟨r, hr_pos, hpq_dist, ?_⟩
  -- Goal: |((D.skeleton q).erase p).filter (dist p · = r)| = 3
  -- We have: T.erase q has card ≥ 3 (since |T| ≥ 4 and q ∈ T).
  have hT'_card :
      3 ≤ ((D.skeleton q).filter (fun q' => dist p q' = r)).card := by
    rw [hT'_eq, Finset.card_erase_of_mem hqT]; omega
  have hT''_card_ge_3 :
      3 ≤ (((D.skeleton q).erase p).filter (fun q' => dist p q' = r)).card := by
    rw [← filter_dist_card_eq_erase_filter_dist_card _ _ _ hr_pos]
    exact hT'_card
  -- And ≤ 3 from muP = 3.
  have hT''_card_le_3 :
      (((D.skeleton q).erase p).filter (fun q' => dist p q' = r)).card ≤ 3 := by
    have hne :
        (((D.skeleton q).erase p).filter (fun q' => dist p q' = r)).Nonempty :=
      Finset.card_pos.mp (by omega)
    obtain ⟨y, hy⟩ := hne
    rw [Finset.mem_filter] at hy
    obtain ⟨hy_mem, hy_dist⟩ := hy
    have := filter_dist_card_le_muP (S := D.skeleton q) hy_mem hy_dist
    omega
  omega

/-- **U5.4A bundled trichotomy.**  Skeleton multiplicity dichotomizes
`K4`-survival at `p` after deletion of `q`: assuming `K4(p)` on the
original configuration, either the witness 4-class survives intact
into `S = A ∖ {q}` (i.e. `μ_p(S) ≥ 4` case), or `q` lies on a precise
`p`-centered triple circle realizing the 3-class (`μ_p(S) = 3` case).
The remaining `μ_p(S) ≤ 2` case is impossible by
`u5_4A_lowerBound_proof`.

This wraps `u5_4A_preservation_proof`, `u5_4A_lowerBound_proof`, and
`u5_4A_tripleCircle_proof` into the closure-plan-shaped dichotomy
that downstream `u5ModeADeletion_of_components` will consume. -/
theorem u5_4A_trichotomy (D : CounterexampleData) (q p : ℝ²)
    (hq : q ∈ D.A) (hp : p ∈ D.A) (hpq : p ≠ q)
    (hK4 : HasNEquidistantPointsAt 4 D.A p) :
    HasNEquidistantPointsAt 4 (D.skeleton q) p ∨
    (∃ r : ℝ, 0 < r ∧ dist p q = r ∧
      (((D.skeleton q).erase p).filter (fun y => dist p y = r)).card = 3) := by
  rcases lt_or_ge (muP (D.skeleton q) p) 4 with hμlt4 | hμge4
  · -- μ < 4: rule out μ ≤ 2 by lowerBound, then μ = 3 ⇒ tripleCircle.
    have hμle3 : muP (D.skeleton q) p ≤ 3 := by omega
    rcases lt_or_ge (muP (D.skeleton q) p) 3 with hμlt3 | hμge3
    · -- μ ≤ 2: contradicts hK4.
      exact absurd hK4 (u5_4A_lowerBound_proof D q p hq hp hpq (by omega))
    · -- μ = 3: triple circle.
      exact Or.inr (u5_4A_tripleCircle_proof D q p hq hp hpq
        (le_antisymm hμle3 hμge3) hK4)
  · -- μ ≥ 4: K4 survives at p after deletion of q.
    exact Or.inl (u5_4A_preservation_proof D q p hq hp hpq hμge4)

/-- **U5.4A trichotomy in theorem-facing form.**

This is `u5_4A_trichotomy` with the surviving `K4` witness transported
from `D.skeleton q` to `((D.skeleton q).erase p)`, matching the exact
output interface of `U5ModeADeletion`. -/
theorem u5_4A_trichotomy_erase (D : CounterexampleData) (q p : ℝ²)
    (hq : q ∈ D.A) (hp : p ∈ D.A) (hpq : p ≠ q)
    (hK4 : HasNEquidistantPointsAt 4 D.A p) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p ∨
    (∃ r : ℝ, 0 < r ∧ dist p q = r ∧
      (((D.skeleton q).erase p).filter (fun y => dist p y = r)).card = 3) := by
  rcases u5_4A_trichotomy D q p hq hp hpq hK4 with hsurvive | htriple
  · exact Or.inl (hasNEquidistantPointsAt_erase_self hsurvive)
  · exact Or.inr htriple

/- ### Surplus-cap membership transport -/

/-- The surplus cap is a subset of the ambient point set `A`.  Read off
the matching `CapTriple` subset field for the chosen `surplusIdx`.  This
lets a `q ∈ surplusCap` hypothesis supply `q ∈ A`, which the 4A
triple-circle lemma requires. -/
theorem surplusCap_subset {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusCap ⊆ A := by
  rcases hidx : S.surplusIdx with ⟨i, hilt⟩
  unfold SurplusCapPacket.surplusCap
  rw [hidx]
  interval_cases i
  · exact S.partition.C1_subset
  · exact S.partition.C2_subset
  · exact S.partition.C3_subset

/- ### U5 assembly (pure-assembly kernel) -/

/-- **U5 combined-statement assembly from the geometric existence step.**

This is the U5 `PureAssembly` kernel (prose `U5K8`).  It derives the
combined `U5ModeADeletion D` statement from a single explicit hypothesis
`hExist` that packages the open geometric content of work packages 4B
(`U5_4B_saturatedFinite`) and 4C (`U5_4C_positiveDimensional`): namely,
that for each surplus-cap point `q`, either `q` is removable, or there is
a non-triangle, non-`q` apex `p` with `μ_p(S) = 3`, with `K4(p)` on the
original configuration, and with the final `q`-free-4-class /
order-violation disjunction.

The assembly is mechanical: given that data, the triple-circle conclusion
of `U5ModeADeletion` is synthesized by the *proven* 4A.3 lemma
`u5_4A_tripleCircle_proof` (using `q ∈ A`, transported from
`q ∈ surplusCap` by `surplusCap_subset`), and the remaining conjuncts are
copied through verbatim.

Honesty note.  `hExist` is **not** proved here.  It is the irreducible
CONJECTURED geometric core of U5 (4B finite local replay, blocked on the
chart-bijection lift; 4C variety classification, marked CONJECTURED at
closure-plan line 454).  Carrying it as one named hypothesis keeps the
interface honest: this theorem is the assembly, not a closure of U5.  It
does not strengthen or re-scope the `U5ModeADeletion` conclusion (which is
verbatim the spine `def`); it factors the existing open content into an
explicit input. -/
theorem u5ModeADeletion_of_components
    (D : CounterexampleData)
    (hExist : D.IsM44 → U2Statement D → U5ModeA D →
      ∀ q ∈ D.packet.surplusCap,
        IsRemovableVertex D.A q ∨
        ∃ p ∈ D.A, p ≠ q ∧
          p ∉ ({D.packet.triangle.v1, D.packet.triangle.v2,
                D.packet.triangle.v3, q} : Finset ℝ²) ∧
          muP (D.skeleton q) p = 3 ∧
          HasNEquidistantPointsAt 4 D.A p ∧
          (HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p ∨
            U5StrictOrderViolation D q p)) :
    U5ModeADeletion D := by
  intro hM44 hU2 hModeA q hq
  rcases hExist hM44 hU2 hModeA q hq with
    hrem | ⟨p, hp, hpq, hpnot, hmu, hK4, hfinal⟩
  · exact Or.inl hrem
  · have hqA : q ∈ D.A := surplusCap_subset D.packet hq
    exact Or.inr
      ⟨p, hp, hpnot, hmu, u5_4A_tripleCircle_proof D q p hqA hp hpq hmu hK4,
        hfinal⟩

end Problem97
