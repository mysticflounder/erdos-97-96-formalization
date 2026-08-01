import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity

/-!
# Finite blocker-map saturation probe

Scratch-only audit of the finite self-map data available in the live
first-fiber five-center terminal.  The countermodel below shows that three
named omitted values together with fibers of sizes at least three and two do
not force exact saturation, even for a fixed-point-free self-map.
-/

namespace Scratch.BlockerMapSaturation

/-- A fixed-point-free finite self-map with:

* the three named omitted values `0`, `1`, and `2`;
* a fiber of size at least three over `3`;
* a distinct fiber of size at least two over `4`;
* an additional collision over `5`; and
* a fourth omitted value, `7`.

Thus the live lower bounds on omitted values and fiber excess do not force
either exact fibers or an exact three-element image complement. -/
def nonsaturatedBlockerMap : Fin 8 → Fin 8 :=
  ![3, 3, 3, 4, 5, 4, 5, 6]

theorem nonsaturatedBlockerMap_certificate :
    (∀ x, nonsaturatedBlockerMap x ≠ 0) ∧
    (∀ x, nonsaturatedBlockerMap x ≠ 1) ∧
    (∀ x, nonsaturatedBlockerMap x ≠ 2) ∧
    nonsaturatedBlockerMap 0 = nonsaturatedBlockerMap 1 ∧
    nonsaturatedBlockerMap 0 = nonsaturatedBlockerMap 2 ∧
    nonsaturatedBlockerMap 3 = nonsaturatedBlockerMap 5 ∧
    nonsaturatedBlockerMap 0 ≠ nonsaturatedBlockerMap 3 ∧
    nonsaturatedBlockerMap 4 = nonsaturatedBlockerMap 6 ∧
    nonsaturatedBlockerMap 4 ≠ nonsaturatedBlockerMap 0 ∧
    nonsaturatedBlockerMap 4 ≠ nonsaturatedBlockerMap 3 ∧
    (∀ x, nonsaturatedBlockerMap x ≠ x) ∧
    (∀ x, nonsaturatedBlockerMap x ≠ 7) := by
  decide

/-- Exact `3 + 2 + 1 + 1` saturation is itself compatible with a
fixed-point-free self-map omitting exactly three values. -/
def saturatedBlockerMap : Fin 7 → Fin 7 :=
  ![3, 3, 3, 4, 6, 4, 5]

theorem saturatedBlockerMap_certificate :
    (∀ x, saturatedBlockerMap x ≠ x) ∧
    (∀ y, (∃ x, saturatedBlockerMap x = y) ↔
      y ≠ 0 ∧ y ≠ 1 ∧ y ≠ 2) ∧
    (∀ x, saturatedBlockerMap x = 3 ↔
      x = 0 ∨ x = 1 ∨ x = 2) ∧
    (∀ x, saturatedBlockerMap x = 4 ↔
      x = 3 ∨ x = 5) ∧
    (∀ x y, x ≠ y → saturatedBlockerMap x = saturatedBlockerMap y →
      saturatedBlockerMap x = 3 ∨ saturatedBlockerMap x = 4) := by
  decide

/-- Purely logical classification of every way the displayed `3 + 2` fiber
profile can fail to be the complete collision profile.  No finiteness
assumption is needed for this classification.

This is the next exhaustive finite-map split after finding the third source in
the first named fiber: exact fiber saturation, a fourth first-fiber source, a
third second-fiber source, or a collision at a third value. -/
theorem saturation_or_furtherMultiplicity
    {α : Type*} (f : α → α) (a₁ a₂ a₃ b₁ b₂ : α) :
    ((∀ x, f x = f a₁ → x = a₁ ∨ x = a₂ ∨ x = a₃) ∧
        (∀ x, f x = f b₁ → x = b₁ ∨ x = b₂) ∧
        ∀ x y, x ≠ y → f x = f y →
          f x = f a₁ ∨ f x = f b₁) ∨
      (∃ x, x ≠ a₁ ∧ x ≠ a₂ ∧ x ≠ a₃ ∧ f x = f a₁) ∨
      (∃ x, x ≠ b₁ ∧ x ≠ b₂ ∧ f x = f b₁) ∨
      ∃ x y, x ≠ y ∧ f x = f y ∧
        f x ≠ f a₁ ∧ f x ≠ f b₁ := by
  classical
  by_cases hA :
      ∃ x, x ≠ a₁ ∧ x ≠ a₂ ∧ x ≠ a₃ ∧ f x = f a₁
  · exact Or.inr (Or.inl hA)
  by_cases hB :
      ∃ x, x ≠ b₁ ∧ x ≠ b₂ ∧ f x = f b₁
  · exact Or.inr (Or.inr (Or.inl hB))
  by_cases hthird :
      ∃ x y, x ≠ y ∧ f x = f y ∧
        f x ≠ f a₁ ∧ f x ≠ f b₁
  · exact Or.inr (Or.inr (Or.inr hthird))
  left
  refine ⟨?_, ?_, ?_⟩
  · intro x hx
    by_cases h₁ : x = a₁
    · exact Or.inl h₁
    by_cases h₂ : x = a₂
    · exact Or.inr (Or.inl h₂)
    by_cases h₃ : x = a₃
    · exact Or.inr (Or.inr h₃)
    exact False.elim (hA ⟨x, h₁, h₂, h₃, hx⟩)
  · intro x hx
    by_cases h₁ : x = b₁
    · exact Or.inl h₁
    by_cases h₂ : x = b₂
    · exact Or.inr h₂
    exact False.elim (hB ⟨x, h₁, h₂, hx⟩)
  · intro x y hxy hfx
    by_cases hAvalue : f x = f a₁
    · exact Or.inl hAvalue
    by_cases hBvalue : f x = f b₁
    · exact Or.inr hBvalue
    exact False.elim
      (hthird ⟨x, y, hxy, hfx, hAvalue, hBvalue⟩)

end Scratch.BlockerMapSaturation
