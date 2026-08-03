import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open Problem97
open Problem97.ATailFrontierLiveClosure
open Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

/-! Read-only probe for the `equalCrossRowCenters` arm.  The intended route is:
    both hits + equal centers -> exact four-row packet -> all endpoint omissions.
  The remaining APIs are listed below to expose the first type-level gap. -/

#check freshThirdEqualCenterExactFourRow_of_hits
#check allCollisionEndpointsOmitted_of_equalCenterHits
#check collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted
#check false_of_twoCapSources_sameBlockerAllEndpointOmission
#check CapCrossingKalmansonBridge.false_of_four_ccw_endpoint_centers_bisect_middle_pair
#check CapCrossingKalmansonBridge.false_of_four_ccw_middle_centers_bisect_endpoint_pair

/- The exact packet and omission producer are source-clean and compile in the
   current tree.  Their output is intentionally not enough to invoke the
   first-fiber five-center terminal: that terminal requires
   `FreshOutsideFirstBlockerFiber P Pρ`, whereas this arm has
   `FreshThirdBlockerFiber P Pρ`. -/
