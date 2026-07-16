/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2SupportHeavyReduction
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# Scratch: global-K4 split on the F2 support-heavy witnesses

The two support-heavy strict points are named source-faithfully as points of
the dangerous triple at the original common deleted source.  Global K4 at
each actual center then gives the exact four-way q-deleted/q-critical split.

No incidence inside a generated class is asserted unless it follows from the
class definition.  In the both-q-deleted arm, the two chosen exact classes are
retained verbatim as a new same-deletion common-deletion packet.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2SupportHeavyK4SplitScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch

attribute [local instance] Classical.propDecidable

/-- The two exact strict support-only witnesses, retaining their membership in
the actual middle row and the actual deleted-source critical shell. -/
structure NamedF2SupportHeavyWitnesses
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (P : F2SupportHeavyReduction S W C) where
  s : ℝ²
  t : ℝ²
  s_mem_supportStrict :
    s ∈ supportOnlyCell C.B₂
      ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  t_mem_supportStrict :
    t ∈ supportOnlyCell C.B₂
      ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  s_ne_t : s ≠ t
  s_mem_middleRow : s ∈ C.B₂
  t_mem_middleRow : t ∈ C.B₂
  s_mem_deletedSupport : s ∈ deletedCriticalSupport C
  t_mem_deletedSupport : t ∈ deletedCriticalSupport C
  s_mem_dangerousTriple :
    s ∈ (deletedCriticalSupport C).erase deleted
  t_mem_dangerousTriple :
    t ∈ (deletedCriticalSupport C).erase deleted
  s_mem_skeleton : s ∈ D.skeleton deleted
  t_mem_skeleton : t ∈ D.skeleton deleted
  s_mem_A : s ∈ D.A
  t_mem_A : t ∈ D.A
  supportStrict_card :
    (supportOnlyCell C.B₂
      ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S).card = 2
  middleRow_card : C.B₂.card = 4
  deletedSupport_card : (deletedCriticalSupport C).card = 4

/-- Name the two support-heavy witnesses. -/
theorem F2SupportHeavyReduction.nonempty_namedWitnesses
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (P : F2SupportHeavyReduction S W C) :
    Nonempty (NamedF2SupportHeavyWitnesses P) := by
  let supportStrict :=
    supportOnlyCell C.B₂
      ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  have hone : 1 < supportStrict.card := by
    have hcard : supportStrict.card = 2 := by
      simpa [supportStrict] using P.supportStrict_card
    omega
  rcases Finset.one_lt_card.mp hone with ⟨s, hs, t, ht, hst⟩
  have hsSupportOnly :=
    Finset.mem_inter.mp hs |>.1 |> Finset.mem_sdiff.mp
  have htSupportOnly :=
    Finset.mem_inter.mp ht |>.1 |> Finset.mem_sdiff.mp
  have hsB : s ∈ C.B₂ :=
    (Finset.mem_inter.mp hsSupportOnly.1).1
  have htB : t ∈ C.B₂ :=
    (Finset.mem_inter.mp htSupportOnly.1).1
  have hsSupport : s ∈ deletedCriticalSupport C :=
    (Finset.mem_inter.mp hsSupportOnly.1).2
  have htSupport : t ∈ deletedCriticalSupport C :=
    (Finset.mem_inter.mp htSupportOnly.1).2
  have hs_ne_deleted : s ≠ deleted := by
    intro h
    subst s
    exact deleted_not_mem_secondRow C hsB
  have ht_ne_deleted : t ≠ deleted := by
    intro h
    subst t
    exact deleted_not_mem_secondRow C htB
  have hsRowSubset := C.row₂.subset hsB
  have htRowSubset := C.row₂.subset htB
  exact ⟨{
    s := s
    t := t
    s_mem_supportStrict := by simpa [supportStrict] using hs
    t_mem_supportStrict := by simpa [supportStrict] using ht
    s_ne_t := hst
    s_mem_middleRow := hsB
    t_mem_middleRow := htB
    s_mem_deletedSupport := hsSupport
    t_mem_deletedSupport := htSupport
    s_mem_dangerousTriple :=
      Finset.mem_erase.mpr ⟨hs_ne_deleted, hsSupport⟩
    t_mem_dangerousTriple :=
      Finset.mem_erase.mpr ⟨ht_ne_deleted, htSupport⟩
    s_mem_skeleton := (Finset.mem_erase.mp hsRowSubset).2
    t_mem_skeleton := (Finset.mem_erase.mp htRowSubset).2
    s_mem_A :=
      (Finset.mem_erase.mp
        (Finset.mem_erase.mp hsRowSubset).2).2
    t_mem_A :=
      (Finset.mem_erase.mp
        (Finset.mem_erase.mp htRowSubset).2).2
    supportStrict_card := P.supportStrict_card
    middleRow_card := C.B₂_card
    deletedSupport_card := deletedCriticalSupport_card_eq_four C
  }⟩

/-- Exact q-deleted output at one named center. -/
structure ExactQDeletedAt
    (D : CounterexampleData) (deleted center : ℝ²) where
  support : Finset ℝ²
  row : U5QDeletedK4Class D deleted center support
  support_card : support.card = 4

/-- Exact q-critical output at one named center. -/
structure ExactQCriticalAt
    (D : CounterexampleData) (deleted center : ℝ²) where
  support : Finset ℝ²
  row : U5QCriticalTripleClass D deleted center support
  support_card : support.card = 3

/-- Any exact q-deleted class witnesses deletion survival at its center. -/
private theorem ExactQDeletedAt.hasNEquidistantPointsAt
    {D : CounterexampleData} {deleted center : ℝ²}
    (K : ExactQDeletedAt D deleted center) :
    HasNEquidistantPointsAt 4 (D.A.erase deleted) center := by
  refine ⟨K.row.radius, K.row.radius_pos, ?_⟩
  calc
    4 ≤ K.support.card := K.row.card_four
    _ ≤ ((D.A.erase deleted).filter
        fun y ↦ dist center y = K.row.radius).card :=
      Finset.card_le_card (by
        intro y hy
        have hySubset := K.row.subset hy
        have hySkeleton : y ∈ D.skeleton deleted :=
          (Finset.mem_erase.mp hySubset).2
        have hyErase : y ∈ D.A.erase deleted := by
          simpa [CounterexampleData.skeleton] using hySkeleton
        exact Finset.mem_filter.mpr
          ⟨hyErase, K.row.same_radius y hy⟩)

/-- Both generated centers are q-deleted.  The new common-deletion packet
retains the two generated supports exactly. -/
structure BothQDeletedCase
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P) where
  at_s : ExactQDeletedAt D deleted N.s
  at_t : ExactQDeletedAt D deleted N.t
  packet :
    CommonDeletionTwoCenterPacket D W.H deleted N.s N.t
  packet_B₁_eq : packet.B₁ = at_s.support
  packet_B₂_eq : packet.B₂ = at_t.support

/-- The first generated center is q-deleted and the second q-critical. -/
structure QDeletedQCriticalCase
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P) where
  at_s : ExactQDeletedAt D deleted N.s
  at_t : ExactQCriticalAt D deleted N.t

/-- The first generated center is q-critical and the second q-deleted. -/
structure QCriticalQDeletedCase
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P) where
  at_s : ExactQCriticalAt D deleted N.s
  at_t : ExactQDeletedAt D deleted N.t

/-- Both generated centers are q-critical. -/
structure BothQCriticalCase
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P) where
  at_s : ExactQCriticalAt D deleted N.s
  at_t : ExactQCriticalAt D deleted N.t

/-- Exact four-combination normal form at the two support-heavy centers. -/
inductive F2SupportHeavyK4FourWay
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P) : Type
  | qDeleted_qDeleted : BothQDeletedCase N →
      F2SupportHeavyK4FourWay N
  | qDeleted_qCritical : QDeletedQCriticalCase N →
      F2SupportHeavyK4FourWay N
  | qCritical_qDeleted : QCriticalQDeletedCase N →
      F2SupportHeavyK4FourWay N
  | qCritical_qCritical : BothQCriticalCase N →
      F2SupportHeavyK4FourWay N

/-- Build a same-deletion common-deletion packet from the two exact q-deleted
outputs without reselecting either support. -/
private def exactCommonDeletionPacket
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P)
    (Ks : ExactQDeletedAt D deleted N.s)
    (Kt : ExactQDeletedAt D deleted N.t) :
    CommonDeletionTwoCenterPacket D W.H deleted N.s N.t := by
  let hs := Ks.hasNEquidistantPointsAt
  let ht := Kt.hasNEquidistantPointsAt
  exact {
    q_mem_A := C.q_mem_A
    center₁_mem_A := N.s_mem_A
    center₂_mem_A := N.t_mem_A
    centers_ne := N.s_ne_t
    survives₁ := hs
    survives₂ := ht
    actual_blocker_ne_center₁ :=
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        W.H C.q_mem_A hs
    actual_blocker_ne_center₂ :=
      ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
        W.H C.q_mem_A ht
    B₁ := Ks.support
    B₂ := Kt.support
    row₁ := Ks.row
    row₂ := Kt.row
    B₁_card := Ks.support_card
    B₂_card := Kt.support_card
    overlap_le_two :=
      U5QDeletedK4Class.inter_card_le_two
        Ks.row Kt.row N.s_ne_t
  }

/-- Global K4 at the two actual support-heavy centers yields exactly the four
q-deleted/q-critical combinations. -/
theorem NamedF2SupportHeavyWitnesses.nonempty_globalK4FourWay
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    (N : NamedF2SupportHeavyWitnesses P) :
    Nonempty (F2SupportHeavyK4FourWay N) := by
  rcases
      U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
        C.q_mem_A N.s_mem_skeleton with
    hsDeleted | hsCritical
  · rcases hsDeleted with ⟨Bs, ⟨Ks⟩, hBs⟩
    let Ds : ExactQDeletedAt D deleted N.s :=
      { support := Bs, row := Ks, support_card := hBs }
    rcases
        U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
          C.q_mem_A N.t_mem_skeleton with
      htDeleted | htCritical
    · rcases htDeleted with ⟨Bt, ⟨Kt⟩, hBt⟩
      let Dt : ExactQDeletedAt D deleted N.t :=
        { support := Bt, row := Kt, support_card := hBt }
      let Pst := exactCommonDeletionPacket N Ds Dt
      exact ⟨.qDeleted_qDeleted {
        at_s := Ds
        at_t := Dt
        packet := Pst
        packet_B₁_eq := rfl
        packet_B₂_eq := rfl
      }⟩
    · rcases U5QCriticalTripleClass.exists_card_three_of_qCritical
          htCritical with ⟨Bt, ⟨Kt⟩, hBt⟩
      exact ⟨.qDeleted_qCritical {
        at_s := Ds
        at_t := { support := Bt, row := Kt, support_card := hBt }
      }⟩
  · rcases U5QCriticalTripleClass.exists_card_three_of_qCritical
        hsCritical with ⟨Bs, ⟨Ks⟩, hBs⟩
    let Cs : ExactQCriticalAt D deleted N.s :=
      { support := Bs, row := Ks, support_card := hBs }
    rcases
        U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
          C.q_mem_A N.t_mem_skeleton with
      htDeleted | htCritical
    · rcases htDeleted with ⟨Bt, ⟨Kt⟩, hBt⟩
      exact ⟨.qCritical_qDeleted {
        at_s := Cs
        at_t := { support := Bt, row := Kt, support_card := hBt }
      }⟩
    · rcases U5QCriticalTripleClass.exists_card_three_of_qCritical
          htCritical with ⟨Bt, ⟨Kt⟩, hBt⟩
      exact ⟨.qCritical_qCritical {
        at_s := Cs
        at_t := { support := Bt, row := Kt, support_card := hBt }
      }⟩

namespace BothQCriticalCase

/-- The exact three missing antecedents for the current adjacent-center bank
consumer: the actual dangerous blocker in both generated supports, plus one
mutual-center incidence. -/
structure AdjacentBankAntecedents
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (R : BothQCriticalCase N) : Prop where
  dangerousBlocker_mem_sSupport :
    W.H.centerAt deleted C.q_mem_A ∈ R.at_s.support
  dangerousBlocker_mem_tSupport :
    W.H.centerAt deleted C.q_mem_A ∈ R.at_t.support
  mutualCenter_incidence :
    N.t ∈ R.at_s.support ∨ N.s ∈ R.at_t.support

/-- Conditional application of the current adjacent-center incompatibility.
The three incidences are explicit inputs; none is inferred from the F2 cells. -/
theorem false_of_adjacentBankAntecedents
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {P : F2SupportHeavyReduction S W C}
    {N : NamedF2SupportHeavyWitnesses P}
    (R : BothQCriticalCase N)
    (A : AdjacentBankAntecedents R) :
    False :=
  U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility
    (dangerousTriple_at_commonDeletion C)
    N.s_mem_dangerousTriple
    N.t_mem_dangerousTriple
    R.at_s.row
    R.at_t.row
    A.dangerousBlocker_mem_sSupport
    A.dangerousBlocker_mem_tSupport
    A.mutualCenter_incidence

end BothQCriticalCase

/-- End-to-end normal form from the exact F2 support-heavy hypothesis. -/
structure F2SupportHeavyGlobalK4NormalForm
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) where
  reduction : F2SupportHeavyReduction S W C
  named : NamedF2SupportHeavyWitnesses reduction
  fourWay : F2SupportHeavyK4FourWay named

/-- Extract the complete global-K4 four-way normal form from the actual F2
support-heavy branch. -/
theorem twoLiveExactCover_to_supportHeavyGlobalK4NormalForm
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C)
    (htwo :
      2 ≤ (supportOnlyCell C.B₂
        ({q, t1, t2, t3} : Finset ℝ²)
        (deletedCriticalSupport C) ∩ strictSecondCap S).card) :
    Nonempty (F2SupportHeavyGlobalK4NormalForm S W C) := by
  let P := twoLiveExactCover_to_supportHeavyReduction S W C F2 htwo
  rcases
      Problem97.ATailRF2SupportHeavyK4SplitScratch.F2SupportHeavyReduction.nonempty_namedWitnesses
        P with
    ⟨N⟩
  rcases N.nonempty_globalK4FourWay with ⟨K⟩
  exact ⟨{
    reduction := P
    named := N
    fourWay := K
  }⟩

#print axioms F2SupportHeavyReduction.nonempty_namedWitnesses
#print axioms NamedF2SupportHeavyWitnesses.nonempty_globalK4FourWay
#print axioms BothQCriticalCase.false_of_adjacentBankAntecedents
#print axioms twoLiveExactCover_to_supportHeavyGlobalK4NormalForm

end ATailRF2SupportHeavyK4SplitScratch
end Problem97
