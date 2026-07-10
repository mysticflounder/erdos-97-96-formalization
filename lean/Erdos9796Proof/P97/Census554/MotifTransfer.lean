/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U2.SimilarityNormalization

/-!
# Census-554 motif transfer (closure plan A.2 step 4)

The single new mathematical lemma of the card-11 slice of Front A
(`docs/closure-plan-full-spec-2026-07-09.md`, §A.2 step 4): **equidistance-
pattern deadness is similarity- and relabeling-invariant.**

The (5,5,4) census (`scratch/census-554/`) certifies patterns dead in the
*gauged* coordinate system — point 0 at `(0,0)`, point 1 at `(1,0)`, free
coordinates for the rest (`census554_lib.py` header).  The cover loop's lazy
motif-embedding step excludes every candidate-feasible **injective
relabeling** of a banked dead motif, not just its `AUTOS` orbit
(`cover_probe.py`); the resulting UNSAT is conditional on exactly the lemma
proven here (`motif_transfer`): a pattern with no gauged realization admits
no injectively-relabeled realization by any point configuration at all.

## Contents

* `Pattern` — per-center equidistance masks on the 11 census labels,
  mirroring the banked JSON rows (empty mask = center absent).
* `IsGaugedRealization` / `IsDead` — the census deadness system: gauge
  anchors, per-mask equidistance from the center, pairwise-distinct points.
  `IsDead P` is the statement the banked Nullstellensatz certificates
  discharge (plan step A.2.2): full distinctness here is *weaker* than the
  certificates' support-pair Rabinowitsch distinctness, so certificate-level
  emptiness implies `IsDead`.
* `motif_transfer` — the transfer lemma, proven via the existing normalizing
  similarity `normSim` (`U2/SimilarityNormalization.lean`): compose with
  `normSim` at the relabeled anchors; equidistances scale by the common
  positive factor `(dist z₀ z₁)⁻¹` and distinctness is preserved.

## Wiring status

Not yet imported by the leaf (`U1LargeCapRouteBTail.lean`); consumed at plan
step A.2.5 (card-11 split wiring), which builds the
`D.A.card = 11 → False` packaging from steps 1–4 +
`capProfile_eq_554_of_card_eq_eleven`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554

/-- An equidistance pattern on the 11 labeled census points: for each center
`c`, `P c` is the mask of labels required to be equidistant from `c`.  An
empty mask means the center does not participate.  Mirrors the banked JSON
rows of `scratch/census-554/bank.jsonl` (`{center: mask}`, miner.py sense:
`|M_c| ≥ 2`, `c ∉ M_c` — neither condition is needed for the lemma, so
neither is imposed). -/
abbrev Pattern := Fin 11 → Finset (Fin 11)

/-- A **gauged realization** of a pattern: plane points for the 11 labels
with label 0 at `(0,0)` and label 1 at `(1,0)` (the census gauge of
`census554_lib.py`), every mask equidistant from its center, and all points
pairwise distinct.

This is the real-solution set of the census deadness system: the
equidistance generators `d²(c,a) − d²(c,b)` vanish iff `equidist` holds, the
gauge substitutions are `gauge0`/`gauge1`, and `injective` implies the
Rabinowitsch distinctness `d²(a,b) ≠ 0` on every support pair. -/
structure IsGaugedRealization (P : Pattern) (y : Fin 11 → ℝ²) : Prop where
  gauge0 : y 0 = pt 0 0
  gauge1 : y 1 = pt 1 0
  equidist : ∀ c, ∀ a ∈ P c, ∀ b ∈ P c, dist (y c) (y a) = dist (y c) (y b)
  injective : Function.Injective y

/-- Pattern deadness: no gauged plane realization exists.  This is the
statement the banked exact Nullstellensatz certificates discharge by
evaluation over `ℝ` (closure plan step A.2.2). -/
def IsDead (P : Pattern) : Prop := ¬∃ y, IsGaugedRealization P y

/-- **Motif transfer** (closure plan A.2 step 4): a dead pattern excludes
every injective relabeling in every point configuration.  If `P` has no
gauged realization, `σ` is an injective relabeling, and `x` is any injective
assignment of plane points to the 11 labels, then the relabeled mask
equidistances cannot all hold.

Proof: normalize `x ∘ σ` by the similarity `normSim` sending the relabeled
anchors `x (σ 0) ↦ (0,0)`, `x (σ 1) ↦ (1,0)`; every distance scales by the
common positive factor `(dist (x (σ 0)) (x (σ 1)))⁻¹`, so the mask
equidistances and pairwise distinctness survive and produce a gauged
realization of `P`, contradicting deadness. -/
theorem motif_transfer (P : Pattern) (hP : IsDead P)
    (σ : Fin 11 → Fin 11) (hσ : Function.Injective σ)
    (x : Fin 11 → ℝ²) (hx : Function.Injective x)
    (heq : ∀ c, ∀ a ∈ P c, ∀ b ∈ P c,
      dist (x (σ c)) (x (σ a)) = dist (x (σ c)) (x (σ b))) : False := by
  have hzinj : Function.Injective (fun a => x (σ a)) :=
    fun a b h => hσ (hx h)
  have h01 : x (σ 0) ≠ x (σ 1) := by
    intro h
    exact absurd (hzinj h) (by decide)
  apply hP
  refine ⟨fun a => normSim (x (σ 0)) (x (σ 1)) (x (σ a)),
    normSim_fst _ _, normSim_snd _ _ h01, ?_, ?_⟩
  · intro c a ha b hb
    rw [normSim_dist_image _ _ h01, normSim_dist_image _ _ h01,
      heq c a ha b hb]
  · intro a b hab
    have hab' : normSim (x (σ 0)) (x (σ 1)) (x (σ a))
        = normSim (x (σ 0)) (x (σ 1)) (x (σ b)) := hab
    have h0 : dist (normSim (x (σ 0)) (x (σ 1)) (x (σ a)))
        (normSim (x (σ 0)) (x (σ 1)) (x (σ b))) = 0 := by
      rw [hab', dist_self]
    rw [normSim_dist_image _ _ h01] at h0
    have hD : (0 : ℝ) < dist (x (σ 0)) (x (σ 1)) := dist_pos.mpr h01
    rcases mul_eq_zero.mp h0 with h | h
    · exact absurd h (by positivity)
    · exact hzinj (dist_eq_zero.mp h)

/- ## Support-injection bridge (audit 2026-07-09, obligation 4)

The cover loop's embedding step produces an injection defined only on a
motif's **support** (its centers and mask members), not on all of `Fin 11`.
`motif_transfer` wants a totally-injective relabeling, so we bridge: any
map injective on a finite subset of `Fin n` extends to an injective
self-map (complement counting), and the transfer hypothesis only ever
evaluates the relabeling on the support. -/

/-- The labels a pattern actually mentions: participating centers plus all
mask members. -/
def support (P : Pattern) : Finset (Fin 11) :=
  (Finset.univ.filter fun c => (P c).Nonempty) ∪ Finset.univ.biUnion P

theorem center_mem_support {P : Pattern} {c a : Fin 11} (ha : a ∈ P c) :
    c ∈ support P := by
  simp only [support, Finset.mem_union, Finset.mem_filter, Finset.mem_univ,
    true_and]
  exact Or.inl ⟨a, ha⟩

theorem mem_support_of_mem {P : Pattern} {c a : Fin 11} (ha : a ∈ P c) :
    a ∈ support P := by
  simp only [support, Finset.mem_union, Finset.mem_biUnion, Finset.mem_univ,
    true_and]
  exact Or.inr ⟨c, ha⟩

/-- Any map injective on a finite subset of `Fin n` extends to an injective
self-map of `Fin n`: the complements of `S` and of its image have equal
cardinality, so a bijection between them completes the injection. -/
theorem exists_injective_extension {n : ℕ} {S : Finset (Fin n)}
    {f : Fin n → Fin n} (hf : Set.InjOn f S) :
    ∃ σ : Fin n → Fin n, Function.Injective σ ∧ ∀ i ∈ S, σ i = f i := by
  classical
  have hcard : Sᶜ.card = (S.image f)ᶜ.card := by
    rw [Finset.card_compl, Finset.card_compl,
      Finset.card_image_of_injOn hf]
  let e := Finset.equivOfCardEq hcard
  refine ⟨fun i => if h : i ∈ S then f i
    else (e ⟨i, Finset.mem_compl.mpr h⟩ : Fin n), ?_, ?_⟩
  · intro i j hij
    by_cases hi : i ∈ S <;> by_cases hj : j ∈ S <;>
      simp only [hi, hj, dif_pos, dif_neg, not_false_iff] at hij
    · exact hf hi hj hij
    · exact absurd (hij ▸ Finset.mem_image_of_mem f hi)
        (Finset.mem_compl.mp (e ⟨j, Finset.mem_compl.mpr hj⟩).2)
    · exact absurd (hij ▸ Finset.mem_image_of_mem f hj)
        (Finset.mem_compl.mp (e ⟨i, Finset.mem_compl.mpr hi⟩).2)
    · have := e.injective (Subtype.coe_injective hij)
      exact congrArg Subtype.val this
  · intro i hi
    simp [hi]

/-- **Motif transfer from a support injection**: the form the cover loop's
lazy embedding step licenses.  An embedding of a dead motif is injective
only on the motif's support; extend it and apply `motif_transfer`. -/
theorem motif_transfer_of_supportInjOn (P : Pattern) (hP : IsDead P)
    (f : Fin 11 → Fin 11) (hf : Set.InjOn f (support P))
    (x : Fin 11 → ℝ²) (hx : Function.Injective x)
    (heq : ∀ c, ∀ a ∈ P c, ∀ b ∈ P c,
      dist (x (f c)) (x (f a)) = dist (x (f c)) (x (f b))) : False := by
  obtain ⟨σ, hσ, hagree⟩ := exists_injective_extension hf
  refine motif_transfer P hP σ hσ x hx ?_
  intro c a ha b hb
  rw [hagree c (center_mem_support ha), hagree a (mem_support_of_mem ha),
    hagree b (mem_support_of_mem hb)]
  exact heq c a ha b hb

end Census554
end Problem97
