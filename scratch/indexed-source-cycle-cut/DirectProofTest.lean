import Erdos9796Proof.P97.SurplusM44Packet.Shard01

/-! Minimal-Shard01 check for the local indexed-cap lemma. -/

open scoped EuclideanGeometry

namespace Problem97
namespace IndexedSourceCycleCut

private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hji : j ≠ i) :
    S.oppositeVertexByIndex j ∈ S.capByIndex i := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hji rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · exact False.elim (hji rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · exact False.elim (hji rfl)

end IndexedSourceCycleCut
end Problem97
