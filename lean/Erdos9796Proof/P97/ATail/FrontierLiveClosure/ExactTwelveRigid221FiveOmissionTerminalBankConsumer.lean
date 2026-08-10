/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FiveOmissionFormulaSat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericEquilateralBisectorNogoodCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericEqualK4NogoodCertificate

/-!
# Mixed-stage terminal consumption for exact-twelve five-omission jobs

This module gives the five-omission formula a typed terminal bank.  Each
learned clause carries a source proof through `SourceOrderPositiveNogood`, so
duplicate-center and order-sensitive geometric cuts can coexist without
silently treating a detector label as a theorem.

The theorem below is a source-to-terminal-CNF soundness consumer.  It does not
produce a terminal UNSAT proof, translate a journal into the typed bank, or
close a live frontier residual by itself.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FiveOmissionTerminalBankConsumer

open scoped EuclideanGeometry

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SafeCoverIndexBridge
open TerminalBankConsumer
open FiveOmissionCnf
open SourceOrderTerminalBankConsumer

/-- One deleted-label shard followed by a heterogeneous bank of source-proved
positive-row cuts. -/
def terminalDimacs (deleted : Label)
    (bank : List SourceOrderPositiveNogood) : List (List Int) :=
  shardDimacs deleted ++
    bank.map fun nogood => learnedClause nogood.choices

/-- Package an equilateral-bisector collision as a typed positive-row cut.
The builder is deliberately uniform in the row pattern: a core proved only
for one fixed decoded SAT row is not sufficient for a learned clause. -/
def SourceOrderPositiveNogood.ofEquilateralBisectorCollisionCore
    (choices : List (RowChoice Label))
    (coreOf :
      ∀ {row : RowPattern Label},
        PositiveRowsMatch row choices →
          Census554.EqualityCore.EquilateralBisectorCollisionCore row) :
    SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal _order _hforced _hconv hpositive
    exact Census554.EqualityCore.not_realizes_of_equilateralBisectorCollisionCore
      (coreOf hpositive) ⟨pointOf, hreal⟩

/-- Package one checked positive-row equilateral-bisector certificate as a
typed learned cut.  This is the journal-facing constructor: its Boolean check
is independent of the realized source row, while `PositiveRowsMatch` supplies
the exact incidences traversed by every stored equality path. -/
def SourceOrderPositiveNogood.ofEquilateralBisectorCertificate
    (choices : List (RowChoice Label))
    (data : EquilateralBisectorCollisionData Label)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofEquilateralBisectorCollisionCore choices fun hrows =>
    (nonempty_equilateralBisectorCollisionCore_of_positiveCheck
      hrows data hcheck).some

/-- Package an equal-K4 core as a typed positive-row cut. -/
def SourceOrderPositiveNogood.ofEqualK4Core
    (choices : List (RowChoice Label))
    (coreOf :
      ∀ {row : RowPattern Label},
        PositiveRowsMatch row choices → Census554.EqualityCore.EqualK4Core row) :
    SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    intro row pointOf hreal _order _hforced _hconv hpositive
    exact Census554.EqualityCore.not_realizes_of_equalK4Core
      (coreOf hpositive) ⟨pointOf, hreal⟩

/-- Package one checked positive-row equal-K4 certificate as a typed cut. -/
def SourceOrderPositiveNogood.ofEqualK4Certificate
    (choices : List (RowChoice Label))
    (data : EqualK4Data Label)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofEqualK4Core choices fun hrows =>
    (nonempty_equalK4Core_of_positiveCheck hrows data hcheck).some

/-- A realized five-omission boundary would satisfy the complete terminal
formula.  Any false learned clause instead recovers the positive row
incidences contradicted by that clause's stored source proof. -/
theorem false_of_terminalFiveOmissionSourceOrderBank
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hrow : FrozenSafeCubeOK row)
    (deleted : Label) (B : FrozenFiveOmissionBoundary row deleted)
    (hreal : Realizes row pointOf)
    (order : FrozenBoundaryOrder pointOf)
    (hforced : FrozenForcedSecondCapOrder order.position)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (bank : List SourceOrderPositiveNogood)
    (hencodable : ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : DimacsUnsatisfiable (terminalDimacs deleted bank)) : False := by
  apply hterminal
  refine ⟨fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
    deleted B.blocker B.centers, ?_⟩
  intro c hc
  simp only [terminalDimacs, List.mem_append] at hc
  rcases hc with hc | hc
  · exact shardDimacs_sat hrow deleted B hc
  · obtain ⟨nogood, hnogood, hclause⟩ := List.mem_map.mp hc
    subst c
    by_cases hfalse :
        evalClauseD
            (fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
              deleted B.blocker B.centers)
            (learnedClause nogood.choices) = false
    · have hsourceFalse :
          evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
              (learnedClause nogood.choices) = false := by
        rw [← evalClauseD_fiveOmissionAssign_learnedClause_eq
          deleted B.blocker B.centers nogood.choices
          (hencodable nogood hnogood)]
        exact hfalse
      have hselected := selectedByCoverIndex_of_learnedClause_false hrow
        (hencodable nogood hnogood) hsourceFalse
      have hpositive := positiveRowsMatch_of_selectedByCoverIndex hrow hselected
      exact False.elim
        (nogood.refutes hreal order hforced hconv hpositive)
    · cases heval : evalClauseD
        (fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
          deleted B.blocker B.centers)
        (learnedClause nogood.choices) with
      | false => exact False.elim (hfalse heval)
      | true => rfl

end FiveOmissionTerminalBankConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
