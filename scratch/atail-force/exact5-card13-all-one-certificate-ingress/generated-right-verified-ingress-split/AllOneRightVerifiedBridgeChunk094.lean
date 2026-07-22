/-
Generated packed-source bridge for verified right chunk 094.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk094_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6016 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 33).ult (rankAtom ranks 35)))) = true)
    (h6017 : ((!((rankAtom ranks 35 == rankAtom ranks 39)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h6018 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h6019 : ((!((rankAtom ranks 47 == rankAtom ranks 39)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h6020 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 35)))) = true)
    (h6021 : ((!((rankAtom ranks 35 == rankAtom ranks 33)) || ((rankAtom ranks 61).ult (rankAtom ranks 48)))) = true)
    (h6022 : ((!((rankAtom ranks 35 == rankAtom ranks 61)) || ((rankAtom ranks 33).ult (rankAtom ranks 48)))) = true)
    (h6023 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 61).ult (rankAtom ranks 35)))) = true)
    (h6024 : ((!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 33).ult (rankAtom ranks 35)))) = true)
    (h6025 : ((!((rankAtom ranks 35 == rankAtom ranks 40)) || ((rankAtom ranks 43).ult (rankAtom ranks 48)))) = true)
    (h6026 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h6027 : ((!((rankAtom ranks 48 == rankAtom ranks 40)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h6028 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 40).ult (rankAtom ranks 35)))) = true)
    (h6029 : ((!((rankAtom ranks 35 == rankAtom ranks 33)) || ((rankAtom ranks 62).ult (rankAtom ranks 49)))) = true)
    (h6030 : ((!((rankAtom ranks 35 == rankAtom ranks 62)) || ((rankAtom ranks 33).ult (rankAtom ranks 49)))) = true)
    (h6031 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 62).ult (rankAtom ranks 35)))) = true)
    (h6032 : ((!((rankAtom ranks 35 == rankAtom ranks 41)) || ((rankAtom ranks 43).ult (rankAtom ranks 49)))) = true)
    (h6033 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h6034 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 41).ult (rankAtom ranks 35)))) = true)
    (h6035 : ((!((rankAtom ranks 36 == rankAtom ranks 37)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h6036 : ((!((rankAtom ranks 36 == rankAtom ranks 44)) || ((rankAtom ranks 37).ult (rankAtom ranks 45)))) = true)
    (h6037 : ((!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 44).ult (rankAtom ranks 36)))) = true)
    (h6038 : ((!((rankAtom ranks 45 == rankAtom ranks 44)) || ((rankAtom ranks 37).ult (rankAtom ranks 36)))) = true)
    (h6039 : ((!((rankAtom ranks 36 == rankAtom ranks 33)) || ((rankAtom ranks 64).ult (rankAtom ranks 46)))) = true)
    (h6040 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 64).ult (rankAtom ranks 36)))) = true)
    (h6041 : ((!((rankAtom ranks 46 == rankAtom ranks 64)) || ((rankAtom ranks 33).ult (rankAtom ranks 36)))) = true)
    (h6042 : ((!((rankAtom ranks 36 == rankAtom ranks 38)) || ((rankAtom ranks 44).ult (rankAtom ranks 46)))) = true)
    (h6043 : ((!((rankAtom ranks 36 == rankAtom ranks 44)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h6044 : ((!((rankAtom ranks 46 == rankAtom ranks 38)) || ((rankAtom ranks 44).ult (rankAtom ranks 36)))) = true)
    (h6045 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 38).ult (rankAtom ranks 36)))) = true)
    (h6046 : ((!((rankAtom ranks 36 == rankAtom ranks 33)) || ((rankAtom ranks 65).ult (rankAtom ranks 47)))) = true)
    (h6047 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 65).ult (rankAtom ranks 36)))) = true)
    (h6048 : ((!((rankAtom ranks 47 == rankAtom ranks 65)) || ((rankAtom ranks 33).ult (rankAtom ranks 36)))) = true)
    (h6049 : ((!((rankAtom ranks 36 == rankAtom ranks 39)) || ((rankAtom ranks 44).ult (rankAtom ranks 47)))) = true)
    (h6050 : ((!((rankAtom ranks 36 == rankAtom ranks 44)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h6051 : ((!((rankAtom ranks 47 == rankAtom ranks 39)) || ((rankAtom ranks 44).ult (rankAtom ranks 36)))) = true)
    (h6052 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 39).ult (rankAtom ranks 36)))) = true)
    (h6053 : ((!((rankAtom ranks 36 == rankAtom ranks 33)) || ((rankAtom ranks 66).ult (rankAtom ranks 48)))) = true)
    (h6054 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 66).ult (rankAtom ranks 36)))) = true)
    (h6055 : ((!((rankAtom ranks 48 == rankAtom ranks 66)) || ((rankAtom ranks 33).ult (rankAtom ranks 36)))) = true)
    (h6056 : ((!((rankAtom ranks 36 == rankAtom ranks 40)) || ((rankAtom ranks 44).ult (rankAtom ranks 48)))) = true)
    (h6057 : ((!((rankAtom ranks 36 == rankAtom ranks 44)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h6058 : ((!((rankAtom ranks 48 == rankAtom ranks 40)) || ((rankAtom ranks 44).ult (rankAtom ranks 36)))) = true)
    (h6059 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 40).ult (rankAtom ranks 36)))) = true)
    (h6060 : ((!((rankAtom ranks 36 == rankAtom ranks 33)) || ((rankAtom ranks 67).ult (rankAtom ranks 49)))) = true)
    (h6061 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 67).ult (rankAtom ranks 36)))) = true)
    (h6062 : ((!((rankAtom ranks 36 == rankAtom ranks 41)) || ((rankAtom ranks 44).ult (rankAtom ranks 49)))) = true)
    (h6063 : ((!((rankAtom ranks 36 == rankAtom ranks 44)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h6064 : ((!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 41).ult (rankAtom ranks 36)))) = true)
    (h6065 : ((!((rankAtom ranks 37 == rankAtom ranks 33)) || ((rankAtom ranks 68).ult (rankAtom ranks 46)))) = true)
    (h6066 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 33).ult (rankAtom ranks 46)))) = true)
    (h6067 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 68).ult (rankAtom ranks 37)))) = true)
    (h6068 : ((!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 33).ult (rankAtom ranks 37)))) = true)
    (h6069 : ((!((rankAtom ranks 37 == rankAtom ranks 38)) || ((rankAtom ranks 45).ult (rankAtom ranks 46)))) = true)
    (h6070 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h6071 : ((!((rankAtom ranks 46 == rankAtom ranks 38)) || ((rankAtom ranks 45).ult (rankAtom ranks 37)))) = true)
    (h6072 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 38).ult (rankAtom ranks 37)))) = true)
    (h6073 : ((!((rankAtom ranks 37 == rankAtom ranks 33)) || ((rankAtom ranks 69).ult (rankAtom ranks 47)))) = true)
    (h6074 : ((!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 33).ult (rankAtom ranks 47)))) = true)
    (h6075 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 69).ult (rankAtom ranks 37)))) = true)
    (h6076 : ((!((rankAtom ranks 37 == rankAtom ranks 39)) || ((rankAtom ranks 45).ult (rankAtom ranks 47)))) = true)
    (h6077 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h6078 : ((!((rankAtom ranks 47 == rankAtom ranks 39)) || ((rankAtom ranks 45).ult (rankAtom ranks 37)))) = true)
    (h6079 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 39).ult (rankAtom ranks 37)))) = true) :
    ∀ item ∈ sourceChunk094Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk094Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6016
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6017
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6018
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6019
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6020
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6021
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6022
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6023
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6024
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6025
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6026
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6027
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6028
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6029
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6030
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6031
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6032
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6033
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6034
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6035
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6036
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6037
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6038
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6039
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6040
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6041
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6042
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6043
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6044
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6045
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6046
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6047
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6048
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6049
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6050
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6051
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6052
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6053
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6054
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6055
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6056
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6057
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6058
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6059
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6060
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6061
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6062
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6063
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6071
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6075
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6076
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6079

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
