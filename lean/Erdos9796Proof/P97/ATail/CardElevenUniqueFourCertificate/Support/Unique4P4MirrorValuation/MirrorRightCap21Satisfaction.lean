import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorValuation.MirrorIndexedAgreement
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorCapSourceBridge.P4MirrorCapSourceBridge
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4RightCapSourceBridge.RightCapOccurrences

/-!
# Reflected P4 satisfaction of the 21 right-cap occurrences

This module isolates the literal replay from the three geometric cap facts.
The mirror cap-source bridge supplies those facts; the proof below consumes
only their exact row-membership consequences.
-/

namespace Problem97.P4MirrorValuationScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4RightCapSourceBridgeScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

private theorem mirrorShortEndpointSat
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hshort :
      ∀ center ∈ shortCapEndpoints,
        ∀ left ∈ shortCapPositions,
          ∀ right ∈ shortCapPositions,
            left ≠ center → right ≠ center → left ≠ right →
              ¬ (rowMem P.core mirrorIndex center left ∧
                rowMem P.core mirrorIndex center right))
    {v : Nat → Prop} (hv : RowValAgreement P.core mirrorIndex v)
    (center left right : Label)
    (hcenter : center ∈ shortCapEndpoints)
    (hleft : left ∈ shortCapPositions)
    (hright : right ∈ shortCapPositions)
    (hleftCenter : left ≠ center)
    (hrightCenter : right ≠ center)
    (hleftRight : left ≠ right) :
    P5OccurrenceBridgeScratch.clauseSat v
      (RightCapShape.literals (.shortEndpoint center left right)) := by
  have hnot := hshort center hcenter left hleft right hright
    hleftCenter hrightCenter hleftRight
  have hcenterLeft : center ≠ left := Ne.symm hleftCenter
  have hcenterRight : center ≠ right := Ne.symm hrightCenter
  by_cases hleftMem : rowMem P.core mirrorIndex center left
  · refine ⟨-(rowVariable center right : Int),
      by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center right)
    exact fun hrightVal =>
      hnot ⟨hleftMem, (hv.row center right hcenterRight).mp hrightVal⟩
  · refine ⟨-(rowVariable center left : Int),
      by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center left)
    exact fun hleftVal =>
      hleftMem ((hv.row center left hcenterLeft).mp hleftVal)

private theorem mirrorRightEndpointSat
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hendpoint :
      ∀ center ∈ rightCapEndpoints,
        ∀ left ∈ rightCapPositions,
          ∀ right ∈ rightCapPositions,
            left ≠ center → right ≠ center → left ≠ right →
              ¬ (rowMem P.core mirrorIndex center left ∧
                rowMem P.core mirrorIndex center right))
    {v : Nat → Prop} (hv : RowValAgreement P.core mirrorIndex v)
    (center left right : Label)
    (hcenter : center ∈ rightCapEndpoints)
    (hleft : left ∈ rightCapPositions)
    (hright : right ∈ rightCapPositions)
    (hleftCenter : left ≠ center)
    (hrightCenter : right ≠ center)
    (hleftRight : left ≠ right) :
    P5OccurrenceBridgeScratch.clauseSat v
      (RightCapShape.literals (.endpoint center left right)) := by
  have hnot := hendpoint center hcenter left hleft right hright
    hleftCenter hrightCenter hleftRight
  have hcenterLeft : center ≠ left := Ne.symm hleftCenter
  have hcenterRight : center ≠ right := Ne.symm hrightCenter
  by_cases hleftMem : rowMem P.core mirrorIndex center left
  · refine ⟨-(rowVariable center right : Int),
      by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center right)
    exact fun hrightVal =>
      hnot ⟨hleftMem, (hv.row center right hcenterRight).mp hrightVal⟩
  · refine ⟨-(rowVariable center left : Int),
      by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center left)
    exact fun hleftVal =>
      hleftMem ((hv.row center left hcenterLeft).mp hleftVal)

private theorem mirrorRightOwnCapSat
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hownCap :
      ∀ center ∈ rightCapPositions,
        ∀ first ∈ rightCapPositions,
          ∀ second ∈ rightCapPositions,
            ∀ third ∈ rightCapPositions,
              first ≠ center → second ≠ center → third ≠ center →
              first ≠ second → first ≠ third → second ≠ third →
                ¬ (rowMem P.core mirrorIndex center first ∧
                  rowMem P.core mirrorIndex center second ∧
                  rowMem P.core mirrorIndex center third))
    {v : Nat → Prop} (hv : RowValAgreement P.core mirrorIndex v)
    (center first second third : Label)
    (hcenter : center ∈ rightCapPositions)
    (hfirst : first ∈ rightCapPositions)
    (hsecond : second ∈ rightCapPositions)
    (hthird : third ∈ rightCapPositions)
    (hfirstCenter : first ≠ center)
    (hsecondCenter : second ≠ center)
    (hthirdCenter : third ≠ center)
    (hfirstSecond : first ≠ second)
    (hfirstThird : first ≠ third)
    (hsecondThird : second ≠ third) :
    P5OccurrenceBridgeScratch.clauseSat v
      (RightCapShape.literals (.ownCap center first second third)) := by
  have hnot := hownCap center hcenter first hfirst second hsecond third hthird
    hfirstCenter hsecondCenter hthirdCenter hfirstSecond hfirstThird hsecondThird
  have hcenterFirst : center ≠ first := Ne.symm hfirstCenter
  have hcenterSecond : center ≠ second := Ne.symm hsecondCenter
  have hcenterThird : center ≠ third := Ne.symm hthirdCenter
  by_cases hfirstMem : rowMem P.core mirrorIndex center first
  · by_cases hsecondMem : rowMem P.core mirrorIndex center second
    · refine ⟨-(rowVariable center third : Int),
        by simp [RightCapShape.literals], ?_⟩
      apply litSat_neg (rowVariable_pos center third)
      exact fun hthirdVal =>
        hnot ⟨hfirstMem, hsecondMem,
          (hv.row center third hcenterThird).mp hthirdVal⟩
    · refine ⟨-(rowVariable center second : Int),
        by simp [RightCapShape.literals], ?_⟩
      apply litSat_neg (rowVariable_pos center second)
      exact fun hsecondVal =>
        hsecondMem ((hv.row center second hcenterSecond).mp hsecondVal)
  · refine ⟨-(rowVariable center first : Int),
      by simp [RightCapShape.literals], ?_⟩
    apply litSat_neg (rowVariable_pos center first)
    exact fun hfirstVal =>
      hfirstMem ((hv.row center first hcenterFirst).mp hfirstVal)

theorem mirrorTotalVal_rightCapOccurrences_sat_of_capTerminals
    (P : P4MirrorBoundaryPacket R profile distribution)
    (hshort :
      ∀ center ∈ shortCapEndpoints,
        ∀ left ∈ shortCapPositions,
          ∀ right ∈ shortCapPositions,
            left ≠ center → right ≠ center → left ≠ right →
              ¬ (rowMem P.core mirrorIndex center left ∧
                rowMem P.core mirrorIndex center right))
    (hendpoint :
      ∀ center ∈ rightCapEndpoints,
        ∀ left ∈ rightCapPositions,
          ∀ right ∈ rightCapPositions,
            left ≠ center → right ≠ center → left ≠ right →
              ¬ (rowMem P.core mirrorIndex center left ∧
                rowMem P.core mirrorIndex center right))
    (hownCap :
      ∀ center ∈ rightCapPositions,
        ∀ first ∈ rightCapPositions,
          ∀ second ∈ rightCapPositions,
            ∀ third ∈ rightCapPositions,
              first ≠ center → second ≠ center → third ≠ center →
              first ≠ second → first ≠ third → second ≠ third →
                ¬ (rowMem P.core mirrorIndex center first ∧
                  rowMem P.core mirrorIndex center second ∧
                  rowMem P.core mirrorIndex center third)) :
    ∀ entry ∈ rightCapOccurrences,
      P5OccurrenceBridgeScratch.clauseSat
        (mirrorTotalVal P) entry.clause := by
  intro entry hentry
  have hentryWF := List.all_eq_true.mp rightCapOccurrences_wf entry hentry
  let hv : RowValAgreement P.core mirrorIndex (mirrorTotalVal P) :=
    ⟨(mirrorValAgreement P).row⟩
  rcases entry with
    ⟨outputClause, sourceCoreClause, sourceTerminalClause, sourceFamily,
      sourceCoreLiterals, sourceTerminalLiterals, shape, clause⟩
  cases shape with
  | shortEndpoint center left right =>
      simp [rightCapOccurrenceWF, rightCapShapeWF] at hentryWF
      rw [hentryWF.1]
      exact mirrorShortEndpointSat P hshort hv center left right
        hentryWF.2.1 hentryWF.2.2.1 hentryWF.2.2.2.1
        hentryWF.2.2.2.2.1 hentryWF.2.2.2.2.2.1 hentryWF.2.2.2.2.2.2
  | endpoint center left right =>
      simp [rightCapOccurrenceWF, rightCapShapeWF] at hentryWF
      rw [hentryWF.1]
      exact mirrorRightEndpointSat P hendpoint hv center left right
        hentryWF.2.1 hentryWF.2.2.1 hentryWF.2.2.2.1
        hentryWF.2.2.2.2.1 hentryWF.2.2.2.2.2.1 hentryWF.2.2.2.2.2.2
  | ownCap center first second third =>
      simp [rightCapOccurrenceWF, rightCapShapeWF] at hentryWF
      rw [hentryWF.1]
      exact mirrorRightOwnCapSat P hownCap hv center first second third
        hentryWF.2.1 hentryWF.2.2.1 hentryWF.2.2.2.1
        hentryWF.2.2.2.2.1 hentryWF.2.2.2.2.2.1
        hentryWF.2.2.2.2.2.2.1 hentryWF.2.2.2.2.2.2.2.1
        hentryWF.2.2.2.2.2.2.2.2.1 hentryWF.2.2.2.2.2.2.2.2.2.1
        hentryWF.2.2.2.2.2.2.2.2.2.2

theorem mirrorTotalVal_rightCapOccurrences_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ entry ∈ rightCapOccurrences,
      P5OccurrenceBridgeScratch.clauseSat
        (mirrorTotalVal P) entry.clause :=
  mirrorTotalVal_rightCapOccurrences_sat_of_capTerminals P
    (P4MirrorCapSourceBridgeScratch.shortCapEndpointOwnCapAtMostOneSat_mirror P)
    (P4MirrorCapSourceBridgeScratch.rightCapEndpointOwnCapAtMostOneSat_mirror P)
    (P4MirrorCapSourceBridgeScratch.rightCapOwnCapAtMostTwoSat_mirror P)

end Problem97.P4MirrorValuationScratch
