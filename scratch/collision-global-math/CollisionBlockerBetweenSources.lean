import Erdos9796Proof.P97.CGN.CGN6

/-!
# A collision blocker lies between its two strict-cap sources

This is the ordered-cap consequence needed by the two exact collision-row
frontier.  If an external apex and a carrier blocker both bisect one source
chord, `CGN6e3` puts one of the two bisectors on the positive side of that
chord.  The apex is excluded because it is outside the indexed cap, so the
blocker is an indexed point strictly between the source endpoints.

The theorem is deliberately source-independent.  A production consumer can
instantiate `a` with the physical apex, `b` with the actual blocker, and the
two endpoints with a retained collision's sources.
-/

open scoped EuclideanGeometry

namespace Problem97.CGN

theorem exists_between_eq_secondBisector_of_first_not_mem_cap
    {m : ℕ} {L : OrderedCap m} {A : Finset ℝ²}
    (Hord : StrictCapOrder A L)
    (hconv : ConvexIndep A)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    {r s : Fin m} (hrs : r < s) {a b : ℝ²}
    (haA : a ∈ A) (hbA : b ∈ A)
    (hab : a ≠ b)
    (har : a ≠ L.points r) (has : a ≠ L.points s)
    (hbr : b ≠ L.points r) (hbs : b ≠ L.points s)
    (haeq : dist a (L.points r) = dist a (L.points s))
    (hbeq : dist b (L.points r) = dist b (L.points s))
    (haOff : a ∉ Finset.univ.image L.points) :
    ∃ j : Fin m, r < j ∧ j < s ∧ L.points j = b ∧
      WitnessesCapEdgeAt L j r s := by
  rcases CGN6e3_exists_subchain_side_apex hconv hmem hrs haA hbA hab
      har has hbr hbs haeq hbeq with hapos | hbpos
  · have haImage : a ∈ Finset.univ.image L.points := by
      rcases (Hord.subchord_open_side_iff_A hrs haA).1 hapos with
        ⟨j, _hrj, _hjs, hj⟩
      rw [← hj]
      exact Finset.mem_image_of_mem L.points (Finset.mem_univ j)
    exact False.elim (haOff haImage)
  · rcases CGN6e4_positive_side_apex_to_indexed_witness
        Hord hrs hbA hbpos hbeq with
      ⟨j, hrj, hjs, hjb, hjw⟩
    exact ⟨j, hrj, hjs, hjb, hjw⟩

/-- Two equal-bisector rows in one ordered cap decompose into two oriented
source-blocker-source triples. -/
theorem exists_two_oriented_source_blocker_source_triples
    {m : ℕ} {L : OrderedCap m} {A : Finset ℝ²}
    (Hord : StrictCapOrder A L)
    (hconv : ConvexIndep A)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    {a b₀ b₁ p q u v : ℝ²}
    (haA : a ∈ A) (hb₀A : b₀ ∈ A) (hb₁A : b₁ ∈ A)
    (hab₀ : a ≠ b₀) (hab₁ : a ≠ b₁)
    (hpq : p ≠ q) (huv : u ≠ v)
    (hap : a ≠ p) (haq : a ≠ q) (hau : a ≠ u) (hav : a ≠ v)
    (hb₀p : b₀ ≠ p) (hb₀q : b₀ ≠ q)
    (hb₁u : b₁ ≠ u) (hb₁v : b₁ ≠ v)
    (hp : p ∈ Finset.univ.image L.points)
    (hq : q ∈ Finset.univ.image L.points)
    (hu : u ∈ Finset.univ.image L.points)
    (hv : v ∈ Finset.univ.image L.points)
    (haOff : a ∉ Finset.univ.image L.points)
    (haeq₀ : dist a p = dist a q)
    (hb₀eq : dist b₀ p = dist b₀ q)
    (haeq₁ : dist a u = dist a v)
    (hb₁eq : dist b₁ u = dist b₁ v) :
    ∃ r₀ j₀ s₀ r₁ j₁ s₁ : Fin m,
      r₀ < j₀ ∧ j₀ < s₀ ∧ L.points j₀ = b₀ ∧
      ((L.points r₀ = p ∧ L.points s₀ = q) ∨
       (L.points r₀ = q ∧ L.points s₀ = p)) ∧
      WitnessesCapEdgeAt L j₀ r₀ s₀ ∧
      r₁ < j₁ ∧ j₁ < s₁ ∧ L.points j₁ = b₁ ∧
      ((L.points r₁ = u ∧ L.points s₁ = v) ∨
       (L.points r₁ = v ∧ L.points s₁ = u)) ∧
      WitnessesCapEdgeAt L j₁ r₁ s₁ := by
  rcases Finset.mem_image.mp hp with ⟨ip, _hip, hip⟩
  rcases Finset.mem_image.mp hq with ⟨iq, _hiq, hiq⟩
  rcases Finset.mem_image.mp hu with ⟨iu, _hiu, hiu⟩
  rcases Finset.mem_image.mp hv with ⟨iv, _hiv, hiv⟩
  have hipq : ip ≠ iq := by
    intro h
    apply hpq
    rw [← hip, ← hiq, h]
  have hiuv : iu ≠ iv := by
    intro h
    apply huv
    rw [← hiu, ← hiv, h]
  have row₀ :
      ∃ r j s : Fin m, r < j ∧ j < s ∧ L.points j = b₀ ∧
        ((L.points r = p ∧ L.points s = q) ∨
         (L.points r = q ∧ L.points s = p)) ∧
        WitnessesCapEdgeAt L j r s := by
    rcases lt_or_gt_of_ne hipq with hlt | hgt
    · rcases exists_between_eq_secondBisector_of_first_not_mem_cap
          Hord hconv hmem hlt haA hb₀A hab₀
          (by simpa [hip] using hap)
          (by simpa [hiq] using haq)
          (by simpa [hip] using hb₀p)
          (by simpa [hiq] using hb₀q)
          (by simpa [hip, hiq] using haeq₀)
          (by simpa [hip, hiq] using hb₀eq)
          haOff with ⟨j, hj⟩
      exact ⟨ip, j, iq, hj.1, hj.2.1, hj.2.2.1,
        Or.inl ⟨hip, hiq⟩, hj.2.2.2⟩
    · rcases exists_between_eq_secondBisector_of_first_not_mem_cap
          Hord hconv hmem hgt haA hb₀A hab₀
          (by simpa [hiq] using haq)
          (by simpa [hip] using hap)
          (by simpa [hiq] using hb₀q)
          (by simpa [hip] using hb₀p)
          (by simpa [hip, hiq] using haeq₀.symm)
          (by simpa [hip, hiq] using hb₀eq.symm)
          haOff with ⟨j, hj⟩
      exact ⟨iq, j, ip, hj.1, hj.2.1, hj.2.2.1,
        Or.inr ⟨hiq, hip⟩, hj.2.2.2⟩
  have row₁ :
      ∃ r j s : Fin m, r < j ∧ j < s ∧ L.points j = b₁ ∧
        ((L.points r = u ∧ L.points s = v) ∨
         (L.points r = v ∧ L.points s = u)) ∧
        WitnessesCapEdgeAt L j r s := by
    rcases lt_or_gt_of_ne hiuv with hlt | hgt
    · rcases exists_between_eq_secondBisector_of_first_not_mem_cap
          Hord hconv hmem hlt haA hb₁A hab₁
          (by simpa [hiu] using hau)
          (by simpa [hiv] using hav)
          (by simpa [hiu] using hb₁u)
          (by simpa [hiv] using hb₁v)
          (by simpa [hiu, hiv] using haeq₁)
          (by simpa [hiu, hiv] using hb₁eq)
          haOff with ⟨j, hj⟩
      exact ⟨iu, j, iv, hj.1, hj.2.1, hj.2.2.1,
        Or.inl ⟨hiu, hiv⟩, hj.2.2.2⟩
    · rcases exists_between_eq_secondBisector_of_first_not_mem_cap
          Hord hconv hmem hgt haA hb₁A hab₁
          (by simpa [hiv] using hav)
          (by simpa [hiu] using hau)
          (by simpa [hiv] using hb₁v)
          (by simpa [hiu] using hb₁u)
          (by simpa [hiu, hiv] using haeq₁.symm)
          (by simpa [hiu, hiv] using hb₁eq.symm)
          haOff with ⟨j, hj⟩
      exact ⟨iv, j, iu, hj.1, hj.2.1, hj.2.2.1,
        Or.inr ⟨hiv, hiu⟩, hj.2.2.2⟩
  rcases row₀ with
    ⟨r₀, j₀, s₀, hrj₀, hjs₀, hj₀, hor₀, hw₀⟩
  rcases row₁ with
    ⟨r₁, j₁, s₁, hrj₁, hjs₁, hj₁, hor₁, hw₁⟩
  exact ⟨r₀, j₀, s₀, r₁, j₁, s₁,
    hrj₀, hjs₀, hj₀, hor₀, hw₀,
    hrj₁, hjs₁, hj₁, hor₁, hw₁⟩

end Problem97.CGN

#print axioms Problem97.CGN.exists_between_eq_secondBisector_of_first_not_mem_cap
#print axioms Problem97.CGN.exists_two_oriented_source_blocker_source_triples
