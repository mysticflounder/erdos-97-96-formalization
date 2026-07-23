/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExactFourSurvivalCover
import Erdos9796Proof.P97.ATail.TwoCenterBisectorParity
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Existing-consumer check for exact-four robust-O2

The exact-four source closer retains the original residual and common-deletion
ingress on the robust-second-apex arm.  A two-point intersection of its two
deleted rows cannot be a nonalternating shared pair: the generic separation
consumer puts the two points on opposite cyclic arcs between the centers.

This file introduces no new adapter or terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourRobustO2TerminalScratch

#check
  ATailUniqueFourSourceCloserScratch.ExactFourPhysicalConsumerOutcome.robust
#check Census554.SeparationCore.SharedPairSeparationCore.satisfiedBy_of_realizes_ccw
#check false_of_two_centers_equidistant_pair_after
#check false_of_two_centers_equidistant_pair_enclosed
#check false_of_two_centers_equidistant_pair_split
#check false_of_two_centers_equidistant_pair_before

#print axioms
  ATailUniqueFourSourceCloserScratch.nonempty_exactFourPhysicalConsumerOutcome
#print axioms
  Census554.SeparationCore.SharedPairSeparationCore.satisfiedBy_of_realizes_ccw
#print axioms false_of_two_centers_equidistant_pair_after
#print axioms false_of_two_centers_equidistant_pair_enclosed
#print axioms false_of_two_centers_equidistant_pair_split
#print axioms false_of_two_centers_equidistant_pair_before

end ATailUniqueFourRobustO2TerminalScratch
end Problem97
