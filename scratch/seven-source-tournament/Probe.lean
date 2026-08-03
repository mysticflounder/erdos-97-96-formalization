import Mathlib

abbrev Vertex := Fin 7
abbrev UpperPair := {p : Vertex × Vertex // p.1 < p.2}

#synth Fintype UpperPair
#synth DecidableEq UpperPair
#synth Fintype (UpperPair → Bool)
#synth Fintype (Equiv.Perm Vertex)
#synth Decidable (∀ bits : UpperPair → Bool, True)
#synth Decidable (∃ σ : Equiv.Perm Vertex, True)

def arc (bits : UpperPair → Bool) (i j : Vertex) : Bool :=
  if h : i < j then bits ⟨(i, j), h⟩
  else if h : j < i then !bits ⟨(j, i), h⟩
  else false

def outNeighbors (bits : UpperPair → Bool) (i : Vertex) : Finset Vertex :=
  Finset.univ.filter fun j ↦ arc bits i j = true

def paleyArc (i j : Vertex) : Bool :=
  let d := (j.val + 7 - i.val) % 7
  d = 1 || d = 2 || d = 4

def IsDoublyRegular (bits : UpperPair → Bool) : Prop :=
  (∀ i, (outNeighbors bits i).card = 3) ∧
    ∀ i j, i ≠ j → ((outNeighbors bits i) ∩ outNeighbors bits j).card = 1

#synth Decidable (IsDoublyRegular (fun _ ↦ false))
#synth Decidable
  (∀ bits : UpperPair → Bool, IsDoublyRegular bits →
    ∃ σ : Equiv.Perm Vertex, ∀ i j, arc bits i j = paleyArc (σ i) (σ j))
