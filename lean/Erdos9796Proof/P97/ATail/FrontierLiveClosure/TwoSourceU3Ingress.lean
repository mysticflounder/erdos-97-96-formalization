/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary
import Erdos9796Proof.P97.U3ToU5Terminal

/-!
# Neutral five-row ingress to the U3 exact-radius obstruction

This module isolates the part of the FreshThird seventh-blocker reduction that
does not depend on the two-source frontier hierarchy.  A five-row deletion
boundary already identifies the deleted point's blocked actual center and
therefore supplies the localized no-q-free packet needed by the U3 extractor.

The result is an obstruction packet, not a contradiction: its escaping-row and
critical-shell arms still require a universal consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceU3Ingress

attribute [local instance] Classical.propDecidable

/-- Exact U3 obstruction with the source-derived dangerous radius and the
off-circle candidate attached to every escaping q-deleted row. -/
abbrev ExactRadiusAuditObstruction
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (deleted : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ t₁ t₂ t₃ : ℝ²,
    ∃ F : U3FixedTripleAuditFrame D deleted.1
        (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃,
      (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
        dist (H.centerAt deleted.1 deleted.2) y =
          dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 ∧
        ∃ x,
          x ∈ U5BoundedAuditCenters D deleted.1
            (H.centerAt deleted.1 deleted.2)
            ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
            ((∃ (B : Finset ℝ²) (z : ℝ²),
                Nonempty (U5QDeletedK4Class D deleted.1 x B) ∧
                  B.card = 4 ∧
                  (B ∩ insert deleted.1
                    ({t₁, t₂, t₃} : Finset ℝ²)).card ≤ 2 ∧
                  2 ≤ (B \ insert deleted.1
                    ({t₁, t₂, t₃} : Finset ℝ²)).card ∧
                  z ∈ B ∧
                  z ∉ U5BoundedSupport D deleted.1
                    (H.centerAt deleted.1 deleted.2)
                    ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
                  U5SelectedCandidateSkeleton D deleted.1
                    (H.centerAt deleted.1 deleted.2)
                    ({t₁, t₂, t₃} : Finset ℝ²) z ∧
                  dist (H.centerAt deleted.1 deleted.2) z ≠
                    dist (H.centerAt deleted.1 deleted.2) deleted.1) ∨
              ∃ K : CriticalFourShell D.A deleted.1 x,
                (K.support ∩ insert deleted.1
                  ({t₁, t₂, t₃} : Finset ℝ²)).card ≤ 2 ∧
                2 ≤ (K.support \ insert deleted.1
                  ({t₁, t₂, t₃} : Finset ℝ²)).card)

/-- The blocked actual center in a five-row deletion boundary supplies the
localized no-q-free packet required by the U3 fixed-triple extractor. -/
def localizedNoQFreePacket
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
      D H deleted.1 deleted.2 c₀ c₁ c₂ c₃ c₄) :
    U3LocalizedNoQFreePacket D deleted.1
      (H.centerAt deleted.1 deleted.2) := by
  refine
    { q_mem := deleted.2
      p_mem_skeleton := mem_skeleton_of_mem_ne
        (H.blockerVertex deleted).2 B.actualBlocker_ne_deleted
      no_qfree := ?_ }
  intro hfree
  exact B.actualBlocker_fails (hasNEquidistantPointsAt_of_erase hfree)

/-- A five-row deletion boundary supplies a U3 dangerous triple and bounded
audit frame whenever the carrier has more than nine points. -/
theorem exists_fixedTripleAuditFrame
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
      D H deleted.1 deleted.2 c₀ c₁ c₂ c₃ c₄)
    (hcard : 9 < D.A.card) :
    ∃ t₁ t₂ t₃ : ℝ²,
      Nonempty
        (U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃) := by
  let P₃ := localizedNoQFreePacket B
  rcases B.actualBlocker_uniqueFour with
    ⟨hblockerMem, r, hr, hclassCard, -⟩
  have hK4 :
      HasNEquidistantPointsAt 4 D.A (H.centerAt deleted.1 deleted.2) :=
    ⟨r, hr, le_of_eq hclassCard.symm⟩
  rcases exists_u3FixedTriplePacket_of_k4_no_qfree
      P₃.q_mem hblockerMem B.actualBlocker_ne_deleted hK4 P₃.no_qfree with
    ⟨t₁, t₂, t₃, F₃⟩
  exact
    ⟨t₁, t₂, t₃,
      P₃.exists_fixedTripleAuditFrame_of_card_gt_nine F₃ hcard⟩

/-- The exact-radius U3 obstruction already follows from the five surviving
rows; no sixth q-deleted row is used in this extraction. -/
theorem exists_exactRadiusAuditObstruction
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
      D H deleted.1 deleted.2 c₀ c₁ c₂ c₃ c₄)
    (hcard : 9 < D.A.card) :
    ExactRadiusAuditObstruction D H deleted := by
  let P₃ := localizedNoQFreePacket B
  rcases exists_fixedTripleAuditFrame B hcard with ⟨t₁, t₂, t₃, ⟨F⟩⟩
  have hexact :=
    P₃.exact_radius_class_card_eq_three_of_dangerousTriple F.dangerous
  rcases F.exists_qDeleted_escape_or_criticalFourShell with ⟨x, hx, hobs⟩
  refine ⟨t₁, t₂, t₃, F, hexact, x, hx, ?_⟩
  rcases hobs with hescape | hshell
  · left
    rcases hescape with ⟨Brow, z, ⟨K⟩, hBrowCard, hzBrow, hzOutside⟩
    have hdistribution :=
      F.qDeletedRow_dangerousCircle_distribution hx K hBrowCard
    have hcandidate :=
      F.dangerous.candidate_of_not_mem_boundedSupport
        K hzBrow hzOutside hexact
    exact
      ⟨Brow, z, ⟨K⟩, hBrowCard, hdistribution.1, hdistribution.2,
        hzBrow, hzOutside, hcandidate.1, hcandidate.2⟩
  · rcases hshell with ⟨K⟩
    have hdistribution :=
      F.criticalFourShell_dangerousCircle_distribution hx K
    exact Or.inr ⟨K, hdistribution⟩

end TwoSourceU3Ingress
end ATailFrontierLiveClosure
end Problem97
