import MirrorLedgerAssembly

/-!
# Axiom audit for the reflected P4 ledger assembly

The declarations below must stay within the approved native replay profile:
`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and
`Quot.sound`.
-/

namespace Problem97.P4MirrorValuationScratch

#print axioms directOuterThreeFamilyClauses_normalized_mem_mirrorBridge
#print axioms mirrorTotalVal_directOuterThreeFamilyClauses_sat
#print axioms mirrorTotalVal_p4SourceClauses_sat
#print axioms mirrorTotalVal_p4CompactLedger_sat
#print axioms false_of_p4MirrorBoundaryPacket

end Problem97.P4MirrorValuationScratch
