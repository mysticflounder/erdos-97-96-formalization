import Erdos9796Proof
/-! Kernel-level reachability census: BFS over usedConstants from the publish
targets, including auxiliary constants (match_N etc.), to classify the 22
frontier leaves as on/off the true kernel spine. -/
open Lean

partial def reach (env : Environment) (start : Array Name) : NameSet := Id.run do
  let mut visited : NameSet := {}
  let mut stack := start
  while stack.size > 0 do
    let n := stack.back!
    stack := stack.pop
    if visited.contains n then
      continue
    visited := visited.insert n
    if let some ci := env.find? n then
      for c in ci.getUsedConstantsAsSet do
        if !visited.contains c then
          stack := stack.push c
  return visited

def pfx : String := "Problem97.ATailFrontierLiveClosure."

def leaves : List Name := [
  (pfx ++ "false_of_exactFourMutualOmissionRigid221_minimalCore").toName,
  (pfx ++ "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted").toName,
  (pfx ++ "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy").toName,
  (pfx ++ "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_oppositeRowHeavy").toName,
  (pfx ++ "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_neitherRowHeavy").toName,
  (pfx ++ "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge").toName,
  (pfx ++ "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_oppositeRowHeavy").toName,
  (pfx ++ "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_sparseRows").toName,
  (pfx ++ "false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision").toName,
  (pfx ++ "false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence").toName,
  (pfx ++ "false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare").toName,
  (pfx ++ "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU").toName,
  (pfx ++ "false_of_exactFourMutualOmissionRigid221_nonphysicalCollision").toName,
  (pfx ++ "false_of_exactFourPostCardElevenTwoRadiusBranch").toName,
  (pfx ++ "false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome").toName,
  (pfx ++ "false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual").toName,
  (pfx ++ "false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual").toName,
  (pfx ++ "false_of_retainedInteriorDirectedOmission_and_all_low_hits").toName,
  (pfx ++ "TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence").toName,
  (pfx ++ "TwoSourceExactCollisionRowsTerminal.false_of_capSource_freshThirdBlockerFiber").toName,
  (pfx ++ "TwoSourceExactCollisionRowsTerminal.false_of_capSource_firstFiber_collisionFiveCenterDeletion").toName,
  (pfx ++ "TwoSourceExactCollisionRowsTerminal.false_of_capSource_freshOutsideSecondBlockerFiber").toName
]

run_meta do
  let env ← getEnv
  for l in leaves do
    unless env.contains l do IO.println s!"MISSING NAME: {l}"
  let r97 := reach env #[`Problem97.erdos97_rhs]
  let r96 := reach env #[`Problem96.erdos96_rhs]
  let mut onCount := 0
  for l in leaves do
    let a := r97.contains l
    let b := r96.contains l
    if a || b then onCount := onCount + 1
    IO.println s!"{if a || b then "ON " else "OFF"} (97:{a} 96:{b}) {l}"
  IO.println s!"total ON: {onCount}/22"
