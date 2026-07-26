import P4MirrorCapSourceBridge

/-!
# P4 mirror cap source bridge axiom audit

The terminal declarations below must stay within the approved native replay
profile:

`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and
`Quot.sound`.
-/

namespace Problem97.P4MirrorCapSourceBridgeScratch

#print axioms shortCapEndpointOwnCapAtMostOneSat_mirror
#print axioms secondOppositeCapEndpointOwnCapAtMostOneSat_mirror
#print axioms rightCapEndpointOwnCapAtMostOneSat_mirror
#print axioms shortCapOwnCapAtMostTwoSat_mirror
#print axioms secondOppositeCapOwnCapAtMostTwoSat_mirror
#print axioms rightCapOwnCapAtMostTwoSat_mirror
#print axioms secondOppositeCapClassHitAtLeastOne_mirror
#print axioms rightCapClassHitAtLeastOne_mirror

end Problem97.P4MirrorCapSourceBridgeScratch
