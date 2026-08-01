import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3PerpendicularBisectorSliceLedger

namespace Problem97.ExactFiveCommonShellV7

private def testGlobalEqualityIndex
    (center left right : Label) : Fin 1485 :=
  Fin.ofNat 1485
    (encoderGlobalEqRows.idxOf
      (canonicalGlobalRow
        (canonicalEdge center left) (canonicalEdge center right)))

theorem testGlobalEqualityIndex_spec
    (center left right : Label)
    (hcenterLeft : center ≠ left)
    (hcenterRight : center ≠ right)
    (hleftRight : left ≠ right) :
    globalEqRow (testGlobalEqualityIndex center left right) =
      canonicalGlobalRow
        (canonicalEdge center left) (canonicalEdge center right) := by
  let row := canonicalGlobalRow
    (canonicalEdge center left) (canonicalEdge center right)
  have hmem : row ∈ encoderGlobalEqRows :=
    canonicalGlobalStarRow_mem center left right
      hcenterLeft hcenterRight hleftRight
  have hlt : encoderGlobalEqRows.idxOf row < 1485 := by
    simpa [encoderGlobalEqRows_length] using
      (List.idxOf_lt_length_iff.mpr hmem)
  unfold testGlobalEqualityIndex globalEqRow
  change encoderGlobalEqRows.get
      ⟨encoderGlobalEqRows.idxOf row % 1485, _⟩ = row
  rw [Nat.mod_eq_of_lt hlt]
  exact List.idxOf_get hlt

end Problem97.ExactFiveCommonShellV7
