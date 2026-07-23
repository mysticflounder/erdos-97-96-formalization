/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.TwoCenterBisectorParity

/-!
# Existing consumer check for the n=12 shared-middle-pair cores

The two full-linear replays in this directory normalize to the production
`false_of_two_centers_equidistant_pair_split` theorem.  This file makes that
import boundary and its axiom audit directly checkable without duplicating the
consumer.
-/

#check Problem97.false_of_two_centers_equidistant_pair_split
#check Problem97.false_of_two_centers_equidistant_pair_after
#print axioms Problem97.false_of_two_centers_equidistant_pair_split
#print axioms Problem97.false_of_two_centers_equidistant_pair_after
