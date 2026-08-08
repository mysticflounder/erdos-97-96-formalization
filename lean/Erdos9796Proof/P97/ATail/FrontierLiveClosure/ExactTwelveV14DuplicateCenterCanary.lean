/-
Lean ingress canary for the first authenticated normalized-v14 structural
CEGAR record.

Source journal:
  scratch/rigid221-sourceheavy-anchor/
    exact12-v14-structural-v2-canary-0000-1/journal.jsonl

Journal record SHA-256:
  b177dd73b6de679186bced6492941456c3d97c653b169273fe8f30b4705ae16f

Certificate SHA-256:
  202acebee1d1d043f7c081ac042482a317aa1f603d8ea0f0f4465accd3683ca0

This module checks the emitted duplicate-center record and connects a proved
row match to the existing source realization consumer.  It does not prove
that this record covers a normalized-v14 cell, and it is not a terminal cell
or aggregate exact-twelve coverage theorem.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221LearnedClauseBridge

/-!
# Exact-twelve normalized-v14 duplicate-center ingress canary

This module replays the first authenticated structural CEGAR certificate and
connects an exact source-row match to the existing Rigid221 contradiction
consumer.  Coverage of a whole cell or the complete schedule remains separate.
-/

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
namespace ExactTwelveV14DuplicateCenterCanary

open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate

abbrev Label := Fin 12

/-- The first replayed structural cut from normalized-v14 cell 0. -/
def record0 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3, 4, 7} },
      { center := 1, support := {0, 2, 6, 8} },
      { center := 2, support := {0, 1, 10, 11} },
      { center := 3, support := {0, 1, 4, 5} },
      { center := 4, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 2
      b := 3
      ap_aq := {
        first := (2, 0)
        steps := [.row 2 0 1]
        last := (2, 1) }
      ap_ar := {
        first := (2, 0)
        steps := [
          .row 2 0 1,
          .flip 2 1,
          .row 1 2 0,
          .flip 1 0,
          .row 0 1 4,
          .flip 0 4,
          .row 4 0 2,
          .flip 4 2
        ]
        last := (2, 4) }
      bp_bq := {
        first := (3, 0)
        steps := [.row 3 0 1]
        last := (3, 1) }
      bp_br := {
        first := (3, 0)
        steps := [.row 3 0 4]
        last := (3, 4) } } }

/-- Kernel replay of the Boolean closure-path checker for `record0`. -/
theorem record0_check : record0.check = true := by
  decide

/-- Every selected row named by `record0` belongs to the frozen safe candidate
table.  This is the finite side condition needed to decode its learned SAT
clause back to source rows. -/
theorem record0_encodable :
    ∀ choice ∈ record0.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  decide

/-- Direct source-facing consumer for the first normalized-v14 record.

The remaining finite-reflection obligation is exactly `hmatches`: a terminal
cell or aggregate coverage theorem must prove that the source-labeled row
pattern selects these recorded rows. -/
theorem FrozenRoleLabeling.false_of_v14Cell0Record0
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (hmatches : record0.Matches
      (labeledRowPattern carrierPattern labeling.e)) : False := by
  exact (record0.not_realizes_of_check record0_check hmatches)
    ⟨fun i => pointOf (labeling.e.symm i), labeling.realizes⟩

/-- Positive-match form of the same source-facing consumer.

This is the interface needed by membership-generalized CEGAR cuts: the
recorded support only has to be contained in each selected source row.  As in
the exact-match canary, the finite-reflection obligation remains the premise
`hpositive`; this theorem does not establish cell or schedule coverage. -/
theorem FrozenRoleLabeling.false_of_v14Cell0Record0_positive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (hpositive : record0.PositivelyMatches
      (labeledRowPattern carrierPattern labeling.e)) : False := by
  exact (record0.not_realizes_of_positiveCheck record0_check hpositive)
    ⟨fun i => pointOf (labeling.e.symm i), labeling.realizes⟩

/-- Source-to-record reflection for the first canary, conditional only on the
finite learned-clause selection fact.  The source-safe hypotheses produce the
canonical candidate assignment; the generic bridge turns selection of every
recorded candidate into the positive row match consumed above.

The remaining computational obligation is to derive `hselected` from a
verified terminal cell journal (and eventually from the aggregate schedule),
not to justify the geometry of the duplicate-center record again. -/
theorem FrozenRoleLabeling.false_of_v14Cell0Record0_selectedByCoverIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (interiors : FrozenInteriorProfile labeling)
    (caps : FrozenClosedCapProfile labeling)
    (hselected : ∀ choice ∈ record0.choices,
      SafeCoverIndexBridge.RowChoiceSelectedByCoverIndex
        (labeledRowPattern carrierPattern labeling.e) choice) : False := by
  apply FrozenRoleLabeling.false_of_v14Cell0Record0_positive labeling
  exact SafeCoverIndexBridge.DuplicateCenterNogood.positivelyMatches_of_selectedByCoverIndex
    (labeling.safeCubeOK interiors caps) record0 hselected

/-- End-to-end source consumer for the authenticated learned clause.

The premise is deliberately the exact Boolean fact supplied by SAT coverage:
the canonical source assignment falsifies `record0`'s learned blocking clause.
The reflection bridge decodes that fact to a positive source-row match, and the
checked duplicate-center record gives the contradiction.  This theorem still
does not assert that a terminal journal proves the premise. -/
theorem FrozenRoleLabeling.false_of_v14Cell0Record0_learnedClauseFalse
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (interiors : FrozenInteriorProfile labeling)
    (caps : FrozenClosedCapProfile labeling)
    (hfalse : Census554.CoverCnf.evalClauseD
      (SafeCoverCnf.finalAssign
        (SafeCoverIndexBridge.coverIndex
          (labeledRowPattern carrierPattern labeling.e)))
      (SafeCoverIndexBridge.learnedClause record0.choices) = false) : False := by
  apply FrozenRoleLabeling.false_of_v14Cell0Record0_positive labeling
  exact
    SafeCoverIndexBridge.DuplicateCenterNogood.positivelyMatches_of_learnedClause_false
      (labeling.safeCubeOK interiors caps) record0 record0_encodable hfalse

end ExactTwelveV14DuplicateCenterCanary
end Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
