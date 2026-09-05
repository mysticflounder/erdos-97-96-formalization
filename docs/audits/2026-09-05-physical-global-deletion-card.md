# Physical global-deletion cardinality

The new source-clean theorem
`Problem97.ATailFrontierLiveClosure.physicalGlobalDeletion_card_eq_two`
formalizes the useful global-counting consequence behind the physical rigid
`2+2+1` leaf: when the physical second-apex class has five points, a globally
minimal rigid deletion has exactly two points.

The proof uses only the live source packet.  The deleted set is contained in
the five-point physical class, so its cardinality is at most five.  If it had
fewer than two points, the same positive radius would leave four points after
deletion, contradicting the blocking hypothesis.  Restoring one deleted point
leaves a four-point class; comparing the erased class with the five-point class
forces the deleted set with that point removed to have at least four remaining
members, giving the upper bound of two.

This is a reusable producer for the open non-`u` physical leaf.  It is not a
closure of that leaf: the remaining placement/collision argument still needs a
consumer of the exact-two conclusion.

Validation: the focused source check (`cd lean && lake env lean
Erdos9796Proof/P97/ATail/FrontierLiveClosure/PhysicalGlobalDeletionCard.lean`)
and the inline axiom probe both pass with no `sorry`, `admit`, or custom axiom.
A governed `lake-build` replay was attempted, but the shared Lake tree was
already rebuilding thousands of modules; no aggregate-spine claim is made from
that interrupted replay.
