import Definitions.Def_Erdos9796Mission
import Theorems.Thm_Erdos9796Mission_problem96
import Theorems.Thm_Erdos9796Mission_problem97

/-- The mission root is the conjunction of the two named Erdős-problem statements. -/
theorem solution : Erdos9796Mission.Problem97 ∧ Erdos9796Mission.Problem96 :=
  ⟨Erdos9796Mission.problem97, Erdos9796Mission.problem96⟩

