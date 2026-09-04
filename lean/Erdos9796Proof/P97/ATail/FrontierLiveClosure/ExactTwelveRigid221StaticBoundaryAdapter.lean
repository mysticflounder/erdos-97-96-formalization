/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowBoundaryAdapter
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticPositiveMembershipTerminalConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticTerminalConsumer

/-!
# Static-parent boundary adapter for the exact-twelve next-row lane

The source-normalized boundary package can feed either the generic frozen
static-parent terminal consumer or the existing positive-membership consumer.
This module records both compositions as conditional all-cell interfaces: a
sound terminal bank and per-cell UNSAT result contradict the source branch.
The formula-shape lemmas expose clause and variable bounds for future
certificate artifacts.  This module does not provide a bank, authenticate
generated clauses, or claim closure of the live residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ExactTwelveCarrierIngress
open FrozenNextRowCompiledJob
open GenericRowNogoodCertificate
open NextRowTerminalBankConsumer
open SourceOrderTerminalBankConsumer
open StaticTerminalConsumer
open TerminalBankConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open FrozenNextRowJobCnf

/-- The static parent contributes its fixed clause count, while the bank adds
one clause for each proof-carrying source-order cut. -/
theorem terminalStaticDimacs_length (cell : FrozenNextRowCell)
    (bank : List SourceOrderPositiveNogood) :
    (StaticTerminalConsumer.terminalStaticDimacs cell bank).length =
      634859 + bank.length := by
  simp [StaticTerminalConsumer.terminalStaticDimacs,
    StaticParentIngress.frozenParentClauseCount]

/- The positive-membership endpoint adds its 57 compiler implications and
the single final blocking clause to the same frozen parent. -/
theorem terminalStaticPositiveMembershipDimacs_length
    (cell : FrozenNextRowCell) (bank : List SourceOrderPositiveNogood) :
    (StaticPositiveMembershipTerminalConsumer.terminalStaticPositiveMembershipDimacs
      cell bank).length =
      634917 + bank.length := by
  have himplication :
      StaticCell1ThirdBlockSpanningMembershipCnf.implicationDimacs.length =
        57 := by
    native_decide
  simp [StaticPositiveMembershipTerminalConsumer.terminalStaticPositiveMembershipDimacs,
    StaticParentIngress.frozenParentClauseCount, himplication]
  omega

/-- Every learned bank literal remains in the base-variable interval whenever
its source candidate is admitted by the frozen candidate filter. -/
theorem learnedClause_lit_natAbs_le_baseNumVars
    {choices : List (RowChoice ExactTwelveCarrierIngress.Label)}
    (hencodable : ∀ choice ∈ choices,
      FrozenSafeCandidateAt choice.center choice.support)
    {literal : Int}
    (hliteral : literal ∈ SafeCoverIndexBridge.learnedClause choices) :
    literal.natAbs ≤ SafeCoverCnf.baseNumVars := by
  change literal ∈ choices.map SafeCoverIndexBridge.learnedLiteral at hliteral
  obtain ⟨choice, hchoice, rfl⟩ := List.mem_map.mp hliteral
  have hindex : SafeCoverIndexBridge.encodedChoiceIndex choice <
      SafeCoverCnf.candCount choice.center.val :=
    SafeCoverIndexBridge.coverIndexAt_lt choice.center choice.support
      (hencodable choice hchoice)
  have hx : SafeCoverCnf.xVar choice.center.val
      (SafeCoverIndexBridge.encodedChoiceIndex choice) ≤
      SafeCoverCnf.baseNumVars := by
    calc
      SafeCoverCnf.xVar choice.center.val
          (SafeCoverIndexBridge.encodedChoiceIndex choice) ≤
          SafeCoverCnf.nX :=
        SafeCoverCnf.xVar_le_nX choice.center.isLt hindex
      _ ≤ SafeCoverCnf.baseNumVars := by
        rw [SafeCoverCnf.nX_eq, SafeCoverCnf.baseNumVars_eq]
        omega
  simpa [SafeCoverIndexBridge.learnedLiteral] using hx

theorem terminalStaticDimacs_lit_natAbs_le
    (cell : FrozenNextRowCell) (bank : List SourceOrderPositiveNogood)
    (hencodable :
      ∀ (nogood : SourceOrderPositiveNogood), nogood ∈ bank →
        ∀ (choice : RowChoice ExactTwelveCarrierIngress.Label),
          choice ∈ nogood.choices →
            FrozenSafeCandidateAt choice.center choice.support)
    {clause : List Int}
    (hclause : clause ∈ StaticTerminalConsumer.terminalStaticDimacs cell bank)
    {literal : Int} (hliteral : literal ∈ clause) :
    literal.natAbs ≤ 44875 := by
  change clause ∈ StaticParentIngress.frozenParentDimacs cell ++
      bank.map fun nogood => SafeCoverIndexBridge.learnedClause nogood.choices
    at hclause
  rcases List.mem_append.mp hclause with hparent | hbank
  · exact StaticPositiveMembershipTerminalConsumer.frozenParentDimacs_lit_bound
      cell clause hparent literal hliteral
  · obtain ⟨nogood, hnogood, rfl⟩ := List.mem_map.mp hbank
    have hlearned :=
      learnedClause_lit_natAbs_le_baseNumVars
        (choices := nogood.choices)
        (fun choice hchoice => hencodable nogood hnogood choice hchoice)
        hliteral
    rw [SafeCoverCnf.baseNumVars_eq] at hlearned
    exact le_trans hlearned (by omega)

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem terminalStaticPositiveMembershipDimacs_lit_natAbs_le
    (cell : FrozenNextRowCell) (bank : List SourceOrderPositiveNogood)
    (hencodable :
      ∀ (nogood : SourceOrderPositiveNogood), nogood ∈ bank →
        ∀ (choice : RowChoice ExactTwelveCarrierIngress.Label),
          choice ∈ nogood.choices →
            FrozenSafeCandidateAt choice.center choice.support)
    {clause : List Int}
    (hclause :
      clause ∈
        StaticPositiveMembershipTerminalConsumer.terminalStaticPositiveMembershipDimacs
          cell bank)
    {literal : Int} (hliteral : literal ∈ clause) :
    literal.natAbs ≤ 44878 := by
  have himplication :
      ∀ clause ∈ StaticCell1ThirdBlockSpanningMembershipCnf.implicationDimacs,
        ∀ literal ∈ clause, literal.natAbs ≤ 44878 := by
    native_decide +revert
  have hblocking :
      ∀ literal ∈ StaticCell1ThirdBlockSpanningMembershipCnf.blockingClause,
        literal.natAbs ≤ 44878 := by
    native_decide +revert
  change clause ∈ StaticParentIngress.frozenParentDimacs cell ++
      (StaticCell1ThirdBlockSpanningMembershipCnf.implicationDimacs ++
        ([StaticCell1ThirdBlockSpanningMembershipCnf.blockingClause] ++
          bank.map fun nogood => SafeCoverIndexBridge.learnedClause nogood.choices))
    at hclause
  rcases List.mem_append.mp hclause with hparent | hrest
  · exact le_trans
      (StaticPositiveMembershipTerminalConsumer.frozenParentDimacs_lit_bound
        cell clause hparent literal hliteral) (by omega)
  · rcases List.mem_append.mp hrest with himp | hrest
    · exact himplication clause himp literal hliteral
    · rcases List.mem_append.mp hrest with hblock | hbank
      · obtain rfl : clause =
            StaticCell1ThirdBlockSpanningMembershipCnf.blockingClause :=
          List.mem_singleton.mp hblock
        exact hblocking literal hliteral
      · obtain ⟨nogood, hnogood, rfl⟩ := List.mem_map.mp hbank
        have hlearned :=
          learnedClause_lit_natAbs_le_baseNumVars
            (choices := nogood.choices)
            (fun choice hchoice => hencodable nogood hnogood choice hchoice)
            hliteral
        rw [SafeCoverCnf.baseNumVars_eq] at hlearned
        exact le_trans hlearned (by omega)

theorem false_of_source_namedNextRowStaticTerminalBank
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecond : S.oppCap2.card = 6)
    (hsecondInterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support)
    (bank : FrozenNextRowCell → List SourceOrderPositiveNogood)
    (hencodable :
      ∀ (cell : FrozenNextRowCell) (nogood : SourceOrderPositiveNogood),
        nogood ∈ bank cell →
          ∀ (choice : RowChoice ExactTwelveCarrierIngress.Label),
            choice ∈ nogood.choices →
            FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : ∀ cell : FrozenNextRowCell,
      DimacsUnsatisfiable
        (terminalStaticDimacs cell (bank cell))) : False := by
  obtain ⟨carrierPattern, labeling, blocker, cell, _job, hcell, hsafe,
      hadded, _hjob, _interiors, order, hforced, hreal, hconv⟩ :=
    exists_source_namedNextRowBoundaryJob Q hcard hsurplus hfirst hsecond
      hsecondInterior hnextRowOnlyHit
  have haddedCell :
      FrozenNextRowOnlyHitAddedConstraintsHold
        (labeledRowPattern carrierPattern labeling.e) blocker
        cell.1.1 cell.1.2 := by
    simpa only [hcell] using hadded
  exact false_of_terminalStaticNextRowSourceOrderBank cell hsafe haddedCell
    hreal order hforced hconv (bank cell) (hencodable cell) (hterminal cell)

/-- The same source boundary feeds the existing cell-1 positive-membership
terminal consumer.  Its specialized formula and terminal bank remain
explicit premises of this adapter. -/
theorem false_of_source_namedNextRowStaticPositiveMembershipBank
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecond : S.oppCap2.card = 6)
    (hsecondInterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support)
    (bank : FrozenNextRowCell → List SourceOrderPositiveNogood)
    (hencodable :
      ∀ (cell : FrozenNextRowCell) (nogood : SourceOrderPositiveNogood),
        nogood ∈ bank cell →
          ∀ (choice : RowChoice ExactTwelveCarrierIngress.Label),
            choice ∈ nogood.choices →
            FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : ∀ cell : FrozenNextRowCell,
      DimacsUnsatisfiable
        (_root_.Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.StaticPositiveMembershipTerminalConsumer.terminalStaticPositiveMembershipDimacs
          cell (bank cell))) : False := by
  obtain ⟨carrierPattern, labeling, blocker, cell, _job, hcell, hsafe,
      hadded, _hjob, _interiors, order, hforced, hreal, hconv⟩ :=
    exists_source_namedNextRowBoundaryJob Q hcard hsurplus hfirst hsecond
      hsecondInterior hnextRowOnlyHit
  have haddedCell :
      FrozenNextRowOnlyHitAddedConstraintsHold
        (labeledRowPattern carrierPattern labeling.e) blocker
        cell.1.1 cell.1.2 := by
    simpa only [hcell] using hadded
  exact _root_.Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.StaticPositiveMembershipTerminalConsumer.false_of_terminalStaticNextRowPositiveMembershipBank
    cell hsafe haddedCell
      hreal order hforced hconv (bank cell) (hencodable cell) (hterminal cell)

/-- The positive-membership endpoint with the exact-twelve cap profile
supplied by the source normalization theorem. -/
theorem false_of_source_namedNextRowStaticPositiveMembershipBank_of_cardProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcardTwelve : D.A.card = 12)
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support)
    (bank : FrozenNextRowCell → List SourceOrderPositiveNogood)
    (hencodable :
      ∀ (cell : FrozenNextRowCell) (nogood : SourceOrderPositiveNogood),
        nogood ∈ bank cell →
          ∀ (choice : RowChoice ExactTwelveCarrierIngress.Label),
            choice ∈ nogood.choices →
            FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : ∀ cell : FrozenNextRowCell,
      DimacsUnsatisfiable
        (_root_.Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.StaticPositiveMembershipTerminalConsumer.terminalStaticPositiveMembershipDimacs
          cell (bank cell))) : False := by
  obtain ⟨hsurplus, hfirst, hsecond, hinterior, _hgrowth⟩ :=
    pentagonOffClassBlocker_card_twelve_exact_cap_profile P packet Q
      hcardTwelve
  exact false_of_source_namedNextRowStaticPositiveMembershipBank Q
    hcardTwelve hsurplus hfirst hsecond hinterior hnextRowOnlyHit bank
    hencodable hterminal

/-- The same static-parent boundary interface with the exact-twelve cap
profile supplied by the source normalization theorem. -/
theorem false_of_source_namedNextRowStaticTerminalBank_of_cardProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcardTwelve : D.A.card = 12)
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support)
    (bank : FrozenNextRowCell → List SourceOrderPositiveNogood)
    (hencodable :
      ∀ (cell : FrozenNextRowCell) (nogood : SourceOrderPositiveNogood),
        nogood ∈ bank cell →
          ∀ (choice : RowChoice ExactTwelveCarrierIngress.Label),
            choice ∈ nogood.choices →
            FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : ∀ cell : FrozenNextRowCell,
      DimacsUnsatisfiable
        (terminalStaticDimacs cell (bank cell))) : False := by
  obtain ⟨hsurplus, hfirst, hsecond, hinterior, _hgrowth⟩ :=
    pentagonOffClassBlocker_card_twelve_exact_cap_profile P packet Q
      hcardTwelve
  exact false_of_source_namedNextRowStaticTerminalBank Q hcardTwelve
    hsurplus hfirst hsecond hinterior hnextRowOnlyHit bank hencodable hterminal

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
