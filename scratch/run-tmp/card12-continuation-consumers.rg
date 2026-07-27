scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustCapExpansion.lean:88:structure ExactFourPostCardElevenRobustSurface
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustCapExpansion.lean:145:    Nonempty (ExactFourPostCardElevenRobustSurface R) := by
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:184:  surface : ExactFourPostCardElevenRobustSurface R
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:209:theorem nonempty_twoDistinctRadiiContinuation
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:213:    (surface : ExactFourPostCardElevenRobustSurface R)
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:291:theorem nonempty_twoDistinctRadiiFirstCapProfile
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:637:inductive ExactFourPostCardElevenRobustContinuation
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:641:  | surplusFivePoint
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:642:      (surface : ExactFourPostCardElevenRobustSurface R)
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:650:  | firstOppositeFivePoint
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:651:      (surface : ExactFourPostCardElevenRobustSurface R)
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:659:  | secondOppositeLargeRadiusCommonDeletion
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:660:      (surface : ExactFourPostCardElevenRobustSurface R)
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:670:  | secondOppositeLargeRadiusExactFiveCycle
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:671:      (surface : ExactFourPostCardElevenRobustSurface R)
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:678:  | twoDistinctRadii
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:691:    (surface : ExactFourPostCardElevenRobustSurface R) :
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:692:    Nonempty (ExactFourPostCardElevenRobustContinuation R) := by
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:700:          exact ⟨.surplusFivePoint surface hsurplus physicalRadius
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:706:          exact ⟨.firstOppositeFivePoint surface profile physicalRadius
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:728:            exact ⟨.secondOppositeLargeRadiusCommonDeletion
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:735:            exact ⟨.secondOppositeLargeRadiusExactFiveCycle
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:737:  | twoDistinctRadii firstRadius secondRadius firstRadius_pos
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:742:      rcases nonempty_twoDistinctRadiiContinuation R surface
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:748:      rcases nonempty_twoDistinctRadiiFirstCapProfile continuation with
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:750:      exact ⟨.twoDistinctRadii continuation firstCapProfile⟩
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:753:#print axioms nonempty_twoDistinctRadiiContinuation
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:755:#print axioms nonempty_twoDistinctRadiiFirstCapProfile
scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:765:#print axioms ExactFourPostCardElevenRobustContinuation
scratch/atail-force/unique4-robust-completion-radius-choice/RobustCompletionRadiusChoice.lean:74:  | twoDistinctRadii
scratch/atail-force/unique4-robust-completion-radius-choice/RobustCompletionRadiusChoice.lean:153:    exact DeletionRobustRadiusClassification.twoDistinctRadii
scratch/atail-force/robust-second-apex-geometry/RobustSecondApexGeometry.lean:79:  | twoDistinctRadii
scratch/atail-force/robust-second-apex-geometry/RobustSecondApexGeometry.lean:156:    exact SecondApexDeletionRobustRadiusClassification.twoDistinctRadii
scratch/atail-force/unique-arm-post-card11-coordinator/PostCardElevenRefinedCoordinator.lean:51:      (continuation : ExactFourPostCardElevenRobustContinuation R)
