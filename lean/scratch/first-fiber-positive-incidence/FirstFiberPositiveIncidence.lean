import Erdos9796Proof.P97.ATail.BlockerMultiplicityGeometry
import Erdos9796Proof.P97.ATail.TwoCollisionGlobalProducer

/-!
# Exact positive-incidence frontier for the first enlarged blocker fiber

This scratch shard proves that, once the cap-source row omits at least one
endpoint of the first collision pair, the desired three-point overlap has
exactly one possible membership pattern: both named off-cap points and one
permitted endpoint of the first pair.

It deliberately does not postulate or claim the missing positive memberships.
-/

namespace Problem97
namespace ATailFirstFiberPositiveIncidence

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer

attribute [local instance] Classical.propDecidable

private theorem card_le_three_of_firstPair_omission
    (K : Finset ℝ²) {a b c d : ℝ²}
    (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (homit : a ∉ K ∨ b ∉ K) :
    (K ∩ {a, b, c, d}).card ≤ 3 := by
  by_cases ha : a ∈ K <;>
    by_cases hb : b ∈ K <;>
    by_cases hc : c ∈ K <;>
    by_cases hd : d ∈ K <;>
    simp_all

private theorem three_le_iff_bothOutside_and_firstPairHit
    (K : Finset ℝ²) {a b c d : ℝ²}
    (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (homit : a ∉ K ∨ b ∉ K) :
    3 ≤ (K ∩ {a, b, c, d}).card ↔
      c ∈ K ∧ d ∈ K ∧ (a ∈ K ∨ b ∈ K) := by
  by_cases ha : a ∈ K <;>
    by_cases hb : b ∈ K <;>
    by_cases hc : c ∈ K <;>
    by_cases hd : d ∈ K <;>
    simp_all

/-- Reconstruct the enlarged first blocker row without importing the live
closure file (and hence without depending on its open terminal). -/
theorem firstFiber_shell_eq_explicitFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support =
      {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} := by
  classical
  calc
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support =
        ((H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1) ∪
        ((H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1) := by
            ext x
            by_cases hx : x ∈ S.capByIndex S.oppIndex1 <;> simp [hx]
    _ = ({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Q.source.1, Q.otherOutsidePoint} := by
          rw [P.shell_inter_cap_eq_sources, Q.outside_eq_pair]
    _ = {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} := by
          ext x
          simp [or_comm, or_left_comm, or_assoc]

/-- The cap-source omission makes three the largest possible overlap with the
explicit first-fiber row. -/
theorem firstFiber_overlap_card_le_three_of_firstPair_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (homit :
      P.source₁ ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∨
        P.source₂ ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    (((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
      {P.source₁, P.source₂, Q.source.1,
        Q.otherOutsidePoint}).card) ≤ 3 := by
  have hsourceNeFirst₁ : Q.source.1 ≠ P.source₁ := by
    intro h
    apply Q.source_ne_first₁
    exact Subtype.ext h
  have hsourceNeFirst₂ : Q.source.1 ≠ P.source₂ := by
    intro h
    apply Q.source_ne_first₂
    exact Subtype.ext h
  have hotherNeFirst₁ : Q.otherOutsidePoint ≠ P.source₁ := by
    intro h
    apply Q.otherOutsidePoint_not_mem_firstCap
    rw [h]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₁_mem_capInterior
  have hotherNeFirst₂ : Q.otherOutsidePoint ≠ P.source₂ := by
    intro h
    apply Q.otherOutsidePoint_not_mem_firstCap
    rw [h]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₂_mem_capInterior
  exact card_le_three_of_firstPair_omission
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
    hsourceNeFirst₁.symm hotherNeFirst₁.symm
    hsourceNeFirst₂.symm hotherNeFirst₂.symm
    Q.otherOutsidePoint_ne_source.symm homit

/-- Under the omission already carried by the cap-source packet, the
three-overlap goal is equivalent to the literal positive-incidence packet:
both named off-cap hits and at least one first-pair hit. -/
theorem firstFiber_three_overlap_iff_positive_incidence
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (homit :
      P.source₁ ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∨
        P.source₂ ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support) :
    3 ≤
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          {P.source₁, P.source₂, Q.source.1,
            Q.otherOutsidePoint}).card ↔
      Q.source.1 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
        Q.otherOutsidePoint ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
        (P.source₁ ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∨
          P.source₂ ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support) := by
  have hsourceNeFirst₁ : Q.source.1 ≠ P.source₁ := by
    intro h
    apply Q.source_ne_first₁
    exact Subtype.ext h
  have hsourceNeFirst₂ : Q.source.1 ≠ P.source₂ := by
    intro h
    apply Q.source_ne_first₂
    exact Subtype.ext h
  have hotherNeFirst₁ : Q.otherOutsidePoint ≠ P.source₁ := by
    intro h
    apply Q.otherOutsidePoint_not_mem_firstCap
    rw [h]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₁_mem_capInterior
  have hotherNeFirst₂ : Q.otherOutsidePoint ≠ P.source₂ := by
    intro h
    apply Q.otherOutsidePoint_not_mem_firstCap
    rw [h]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₂_mem_capInterior
  exact three_le_iff_bothOutside_and_firstPairHit
    (H.selectedAt source.1 source.2).toCriticalFourShell.support
    hsourceNeFirst₁.symm hotherNeFirst₁.symm
    hsourceNeFirst₂.symm hotherNeFirst₂.symm
    Q.otherOutsidePoint_ne_source.symm homit

/-- Extract the exact remaining overlap route from the production cap-source
surface.  The source's automatic self-hit and exact-four row are retained
explicitly; the final equivalence shows that neither fact supplies one of the
three required common hits. -/
theorem exists_capSource_with_exact_firstFiber_overlap_route
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ) :
    ∃ source : CriticalShellSystem.CarrierVertex D.A,
      source.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
      source.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) ∧
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A ∧
      source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      (H.selectedAt source.1
        source.2).toCriticalFourShell.support.card = 4 ∧
      (3 ≤
          ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            {P.source₁, P.source₂, Q.source.1,
              Q.otherOutsidePoint}).card ↔
        Q.source.1 ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          Q.otherOutsidePoint ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
          (P.source₁ ∈
              (H.selectedAt source.1 source.2).toCriticalFourShell.support ∨
            P.source₂ ∈
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support)) := by
  rcases hcapSource with
    ⟨_, source, hsourceInterior, hsourceOutside, hcenterNeFirst,
      _, _, _, hself, hcard, homitFirst, _⟩
  refine ⟨source, hsourceInterior, hsourceOutside, hcenterNeFirst,
    hself, hcard, ?_⟩
  exact firstFiber_three_overlap_iff_positive_incidence
    P Pρ Q source homitFirst

/-- Pure two-circle geometry forces the complementary omission grid.  Thus
none of the local cap-source/fresh-fiber fields can themselves prove the
positive-incidence packet: a global hypothesis must eliminate these three
alternatives. -/
theorem exists_capSource_with_forced_firstFiber_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ) :
    ∃ source : CriticalShellSystem.CarrierVertex D.A,
      Q.source.1 ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∨
        Q.otherOutsidePoint ∉
            (H.selectedAt source.1 source.2).toCriticalFourShell.support ∨
          (P.source₁ ∉
              (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
            P.source₂ ∉
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support) := by
  rcases hcapSource with
    ⟨_, source, _, _, hcenterNeFirst, _, _, _, _, _, homitFirst, _⟩
  refine ⟨source, ?_⟩
  by_cases hsource :
      Q.source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support
  · by_cases hother :
        Q.otherOutsidePoint ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support
    · by_cases hfirst₁ :
          P.source₁ ∈
            (H.selectedAt source.1 source.2).toCriticalFourShell.support
      · have hthree :=
          (firstFiber_three_overlap_iff_positive_incidence
            P Pρ Q source homitFirst).2
            ⟨hsource, hother, Or.inl hfirst₁⟩
        rw [← firstFiber_shell_eq_explicitFour P Pρ Q] at hthree
        have htwo :=
          SelectedFourClass.inter_card_le_two
            (H.selectedAt source.1 source.2).toSelectedFourClass
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass
            hcenterNeFirst
        omega
      · by_cases hfirst₂ :
            P.source₂ ∈
              (H.selectedAt source.1 source.2).toCriticalFourShell.support
        · have hthree :=
            (firstFiber_three_overlap_iff_positive_incidence
              P Pρ Q source homitFirst).2
              ⟨hsource, hother, Or.inr hfirst₂⟩
          rw [← firstFiber_shell_eq_explicitFour P Pρ Q] at hthree
          have htwo :=
            SelectedFourClass.inter_card_le_two
              (H.selectedAt source.1 source.2).toSelectedFourClass
              (H.selectedAt P.source₁
                P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass
              hcenterNeFirst
          omega
        · exact Or.inr (Or.inr ⟨hfirst₁, hfirst₂⟩)
    · exact Or.inr (Or.inl hother)
  · exact Or.inl hsource

end ATailFirstFiberPositiveIncidence
end Problem97
