import Mathlib

namespace BridgeProbe

abbrev Vertex := Fin 7
abbrev UpperPair := {p : Vertex × Vertex // p.1 < p.2}

def arc (bits : UpperPair → Bool) (i j : Vertex) : Bool :=
  if h : i < j then bits ⟨(i, j), h⟩
  else if h : j < i then !bits ⟨(j, i), h⟩
  else false

def outNeighbors (bits : UpperPair → Bool) (i : Vertex) : Finset Vertex :=
  Finset.univ.filter fun j ↦ arc bits i j = true

def bitsOfSupports (B : Vertex → Finset Vertex) : UpperPair → Bool :=
  fun p ↦ decide (p.1.2 ∈ B p.1.1)

theorem arc_bitsOfSupports_iff
    {B : Vertex → Finset Vertex}
    (hone : ∀ i j, i ≠ j → (j ∈ B i ↔ i ∉ B j))
    {i j : Vertex} (hij : i ≠ j) :
    arc (bitsOfSupports B) i j = true ↔ j ∈ B i := by
  by_cases hlt : i < j
  · simp [arc, bitsOfSupports, hlt]
  · have hji : j < i := lt_of_le_of_ne (le_of_not_gt hlt) (Ne.symm hij)
    simpa [arc, bitsOfSupports, hlt, hji] using (hone i j hij).symm

theorem outNeighbors_bitsOfSupports_eq_erase
    {B : Vertex → Finset Vertex}
    (hone : ∀ i j, i ≠ j → (j ∈ B i ↔ i ∉ B j))
    (i : Vertex) :
    outNeighbors (bitsOfSupports B) i = (B i).erase i := by
  ext j
  by_cases hij : i = j
  · subst j
    simp [outNeighbors, arc]
  · have hji : j ≠ i := Ne.symm hij
    simp [outNeighbors, hji, arc_bitsOfSupports_iff hone hij]

end BridgeProbe
