import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4CompactAtomBinding.AtomBinding
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4CompactAtomBinding.BindingData

namespace Problem97.P4CompactAtomBindingScratch

def expectedDenseCount : Nat := 2557

def bindingAt (dense : Nat) : Option AtomBinding :=
  if dense = 0 then none else bindings[dense - 1]?

def denseCoverageOK : Bool :=
  (bindings.map AtomBinding.dense).toList == (List.range expectedDenseCount).map (· + 1)

def sourceIdsUniqueOK : Bool :=
  (bindings.map AtomBinding.sourceId).toList.dedup.length == expectedDenseCount

def parametersMatchFamiliesOK : Bool :=
  bindings.all AtomBinding.familyMatches

def countFamily (family : CompactFamily) : Nat :=
  bindings.foldl (fun n binding => if binding.family = family then n + 1 else n) 0

def familyCountsOK : Bool :=
  countFamily .membership == 110 &&
  countFamily .radiusEquality == 495 &&
  countFamily .firstApexClass == 11 &&
  countFamily .blockerChoice == 21 &&
  countFamily .criticalSupport == 68 &&
  countFamily .rowSupport == 1716 &&
  countFamily .outerArc == 136

def exactBindingDataOK : Bool :=
  bindings.size == expectedDenseCount && denseCoverageOK && sourceIdsUniqueOK &&
  parametersMatchFamiliesOK && familyCountsOK

theorem exact_binding_data : exactBindingDataOK = true := by native_decide

/-- Dense lookup is functional for the full source binding, hence for source
ID, family, and typed parameters separately. -/
theorem bindingAt_functional {dense : Nat} {left right : AtomBinding}
    (hleft : bindingAt dense = some left) (hright : bindingAt dense = some right) : left = right := by
  rw [hleft] at hright
  exact Option.some.inj hright

theorem dense_coverage :
    (bindings.map AtomBinding.dense).toList = (List.range expectedDenseCount).map (· + 1) := by
  native_decide

theorem family_counts :
    countFamily .membership = 110 ∧ countFamily .radiusEquality = 495 ∧
    countFamily .firstApexClass = 11 ∧ countFamily .blockerChoice = 21 ∧
    countFamily .criticalSupport = 68 ∧ countFamily .rowSupport = 1716 ∧
    countFamily .outerArc = 136 := by
  native_decide

end Problem97.P4CompactAtomBindingScratch
