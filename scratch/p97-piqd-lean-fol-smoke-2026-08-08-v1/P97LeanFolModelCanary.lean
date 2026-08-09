import Mathlib.Data.Fin.Basic

/-!
Synthetic SAT/model-decoding companion to `P97LeanFolCanary.lean`.  The
neighboring JSON is still hand-authored because PIQD has no Lean-source
exporter.
-/

theorem p97PiqdOrderTwoCommutativityWitness :
    ∃ mul : Fin 2 → Fin 2 → Fin 2, ∀ x y, mul x y = mul y x := by
  refine ⟨fun _ _ => 0, ?_⟩
  intro x y
  rfl
