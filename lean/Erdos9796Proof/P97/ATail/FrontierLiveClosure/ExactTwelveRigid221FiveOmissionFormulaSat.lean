/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FiveOmissionSat

/-!
# Formula-level source satisfiability for the exact-twelve five-omission CNF

This small assembly module keeps the expensive selector checks in the imported
semantic module while combining their results over the complete common and
shard formulas.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FiveOmissionCnf

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SafeCoverIndexBridge
open TerminalBankConsumer

/-- The semantic source witness satisfies every common clause emitted before
the deleted-label shard unit.  This is the complete source-to-common-CNF
soundness direction, not a finite closure theorem. -/
theorem fiveOmissionDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (deleted : Label) (B : FrozenFiveOmissionBoundary row deleted)
    {c : List Int} (hc : c ∈ fiveOmissionDimacs) :
    evalClauseD
        (fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
          deleted B.blocker B.centers) c = true := by
  rw [fiveOmissionDimacs] at hc
  obtain ⟨family, hfamily, hc⟩ := List.mem_flatten.mp hc
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hfamily
  rcases hfamily with rfl | rfl | rfl | rfl | rfl | rfl
  · exact baseDimacs_sat hrow deleted B hc
  · exact deletedSelectorClauses_sat _ deleted B.blocker B.centers hc
  · exact blockerSelectorClauses_sat _ deleted B.blocker B.centers hc
  · exact centerSelectorClauses_sat _ deleted B.blocker B.centers B.centers_card hc
  · exact roleDistinctness_sat _ deleted B.blocker B.centers
      B.blocker_ne_deleted B.blocker_not_mem_centers hc
  · exact boundaryClauses_sat hrow deleted B hc

/-- The semantic source witness also satisfies its shard's positive deleted
selector unit. -/
theorem shardDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (deleted : Label) (B : FrozenFiveOmissionBoundary row deleted)
    {c : List Int} (hc : c ∈ shardDimacs deleted) :
    evalClauseD
        (fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
          deleted B.blocker B.centers) c = true := by
  simp only [shardDimacs, List.mem_append, List.mem_singleton] at hc
  rcases hc with hc | rfl
  · exact fiveOmissionDimacs_sat hrow deleted B hc
  · simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false]
    rw [evalLitD_pos _ (by unfold deletedVar; omega),
      fiveOmissionAssign_deletedVar]
    simp

end FiveOmissionCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
