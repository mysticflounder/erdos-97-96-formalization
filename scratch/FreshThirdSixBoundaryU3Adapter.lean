import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceClosure
import Erdos9796Proof.P97.U3ToU5Terminal

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry

theorem SixSurvivorExactRowsBoundary.localizedNoQFreePacket
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) q
      c₀ c₁ c₂ c₃ c₄ c₅) :
    U3LocalizedNoQFreePacket D q.1 (H.centerAt q.1 q.2) := by
  refine
    { q_mem := q.2
      p_mem_skeleton := mem_skeleton_of_mem_ne
        (H.blockerVertex q).2 B.firstFive.actualBlocker_ne_deleted
      no_qfree := ?_ }
  intro hfree
  exact B.firstFive.actualBlocker_fails
    (hasNEquidistantPointsAt_of_erase hfree)

theorem SixSurvivorExactRowsBoundary.exists_fixedTripleAuditFrame
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) q
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card) :
    ∃ t₁ t₂ t₃ : ℝ²,
      Nonempty
        (U3FixedTripleAuditFrame D q.1 (H.centerAt q.1 q.2) t₁ t₂ t₃) := by
  let P := B.localizedNoQFreePacket
  rcases B.firstFive.actualBlocker_uniqueFour with
    ⟨hblockerMem, r, hr, hclassCard, -⟩
  have hK4 : HasNEquidistantPointsAt 4 D.A (H.centerAt q.1 q.2) :=
    ⟨r, hr, le_of_eq hclassCard.symm⟩
  rcases exists_u3FixedTriplePacket_of_k4_no_qfree
      P.q_mem
      hblockerMem
      (Finset.ne_of_mem_erase P.p_mem_skeleton)
      hK4
      P.no_qfree with
    ⟨t₁, t₂, t₃, F⟩
  exact ⟨t₁, t₂, t₃, P.exists_fixedTripleAuditFrame_of_card_gt_nine F hcard⟩

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
