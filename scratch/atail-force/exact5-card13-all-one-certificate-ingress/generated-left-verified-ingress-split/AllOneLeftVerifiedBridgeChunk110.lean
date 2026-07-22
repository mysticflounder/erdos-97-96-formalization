/-
Generated packed-source bridge for verified left chunk 110.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk110_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h7040 : ((!((rankAtom ranks 55 == rankAtom ranks 70)) || ((rankAtom ranks 56).ult (rankAtom ranks 71)))) = true)
    (h7041 : ((!((rankAtom ranks 71 == rankAtom ranks 56)) || ((rankAtom ranks 70).ult (rankAtom ranks 55)))) = true)
    (h7042 : ((!((rankAtom ranks 54 == rankAtom ranks 53)) || ((rankAtom ranks 75).ult (rankAtom ranks 73)))) = true)
    (h7043 : ((!((rankAtom ranks 54 == rankAtom ranks 75)) || ((rankAtom ranks 53).ult (rankAtom ranks 73)))) = true)
    (h7044 : ((!((rankAtom ranks 73 == rankAtom ranks 53)) || ((rankAtom ranks 75).ult (rankAtom ranks 54)))) = true)
    (h7045 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 53).ult (rankAtom ranks 54)))) = true)
    (h7046 : ((!((rankAtom ranks 54 == rankAtom ranks 55)) || ((rankAtom ranks 72).ult (rankAtom ranks 73)))) = true)
    (h7047 : ((!((rankAtom ranks 54 == rankAtom ranks 72)) || ((rankAtom ranks 55).ult (rankAtom ranks 73)))) = true)
    (h7048 : ((!((rankAtom ranks 73 == rankAtom ranks 55)) || ((rankAtom ranks 72).ult (rankAtom ranks 54)))) = true)
    (h7049 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 55).ult (rankAtom ranks 54)))) = true)
    (h7050 : ((!((rankAtom ranks 54 == rankAtom ranks 53)) || ((rankAtom ranks 76).ult (rankAtom ranks 74)))) = true)
    (h7051 : ((!((rankAtom ranks 54 == rankAtom ranks 76)) || ((rankAtom ranks 53).ult (rankAtom ranks 74)))) = true)
    (h7052 : ((!((rankAtom ranks 74 == rankAtom ranks 53)) || ((rankAtom ranks 76).ult (rankAtom ranks 54)))) = true)
    (h7053 : ((!((rankAtom ranks 54 == rankAtom ranks 56)) || ((rankAtom ranks 72).ult (rankAtom ranks 74)))) = true)
    (h7054 : ((!((rankAtom ranks 54 == rankAtom ranks 72)) || ((rankAtom ranks 56).ult (rankAtom ranks 74)))) = true)
    (h7055 : ((!((rankAtom ranks 74 == rankAtom ranks 72)) || ((rankAtom ranks 56).ult (rankAtom ranks 54)))) = true)
    (h7056 : ((!((rankAtom ranks 55 == rankAtom ranks 53)) || ((rankAtom ranks 77).ult (rankAtom ranks 74)))) = true)
    (h7057 : ((!((rankAtom ranks 55 == rankAtom ranks 77)) || ((rankAtom ranks 53).ult (rankAtom ranks 74)))) = true)
    (h7058 : ((!((rankAtom ranks 74 == rankAtom ranks 53)) || ((rankAtom ranks 77).ult (rankAtom ranks 55)))) = true)
    (h7059 : ((!((rankAtom ranks 55 == rankAtom ranks 56)) || ((rankAtom ranks 73).ult (rankAtom ranks 74)))) = true)
    (h7060 : ((!((rankAtom ranks 55 == rankAtom ranks 73)) || ((rankAtom ranks 56).ult (rankAtom ranks 74)))) = true)
    (h7061 : ((!((rankAtom ranks 74 == rankAtom ranks 56)) || ((rankAtom ranks 73).ult (rankAtom ranks 55)))) = true)
    (h7062 : ((!((rankAtom ranks 74 == rankAtom ranks 73)) || ((rankAtom ranks 56).ult (rankAtom ranks 55)))) = true)
    (h7063 : ((!((rankAtom ranks 55 == rankAtom ranks 54)) || ((rankAtom ranks 77).ult (rankAtom ranks 76)))) = true)
    (h7064 : ((!((rankAtom ranks 55 == rankAtom ranks 77)) || ((rankAtom ranks 54).ult (rankAtom ranks 76)))) = true)
    (h7065 : ((!((rankAtom ranks 76 == rankAtom ranks 54)) || ((rankAtom ranks 77).ult (rankAtom ranks 55)))) = true)
    (h7066 : ((!((rankAtom ranks 55 == rankAtom ranks 56)) || ((rankAtom ranks 75).ult (rankAtom ranks 76)))) = true)
    (h7067 : ((!((rankAtom ranks 55 == rankAtom ranks 75)) || ((rankAtom ranks 56).ult (rankAtom ranks 76)))) = true)
    (h7068 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 56).ult (rankAtom ranks 55)))) = true)
    (h7069 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h7070 : ((!((rankAtom ranks 58 == rankAtom ranks 68)) || ((rankAtom ranks 57).ult (rankAtom ranks 64)))) = true)
    (h7071 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h7072 : ((!((rankAtom ranks 58 == rankAtom ranks 59)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h7073 : ((!((rankAtom ranks 64 == rankAtom ranks 59)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h7074 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h7075 : ((!((rankAtom ranks 58 == rankAtom ranks 69)) || ((rankAtom ranks 57).ult (rankAtom ranks 65)))) = true)
    (h7076 : ((!((rankAtom ranks 65 == rankAtom ranks 69)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h7077 : ((!((rankAtom ranks 58 == rankAtom ranks 60)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h7078 : ((!((rankAtom ranks 65 == rankAtom ranks 60)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h7079 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h7080 : ((!((rankAtom ranks 58 == rankAtom ranks 70)) || ((rankAtom ranks 57).ult (rankAtom ranks 66)))) = true)
    (h7081 : ((!((rankAtom ranks 66 == rankAtom ranks 70)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h7082 : ((!((rankAtom ranks 58 == rankAtom ranks 61)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h7083 : ((!((rankAtom ranks 66 == rankAtom ranks 61)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h7084 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h7085 : ((!((rankAtom ranks 58 == rankAtom ranks 71)) || ((rankAtom ranks 57).ult (rankAtom ranks 67)))) = true)
    (h7086 : ((!((rankAtom ranks 58 == rankAtom ranks 62)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h7087 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 72).ult (rankAtom ranks 65)))) = true)
    (h7088 : ((!((rankAtom ranks 59 == rankAtom ranks 72)) || ((rankAtom ranks 57).ult (rankAtom ranks 65)))) = true)
    (h7089 : ((!((rankAtom ranks 65 == rankAtom ranks 72)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h7090 : ((!((rankAtom ranks 59 == rankAtom ranks 60)) || ((rankAtom ranks 64).ult (rankAtom ranks 65)))) = true)
    (h7091 : ((!((rankAtom ranks 59 == rankAtom ranks 64)) || ((rankAtom ranks 60).ult (rankAtom ranks 65)))) = true)
    (h7092 : ((!((rankAtom ranks 65 == rankAtom ranks 60)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h7093 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 73).ult (rankAtom ranks 66)))) = true)
    (h7094 : ((!((rankAtom ranks 59 == rankAtom ranks 73)) || ((rankAtom ranks 57).ult (rankAtom ranks 66)))) = true)
    (h7095 : ((!((rankAtom ranks 66 == rankAtom ranks 73)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h7096 : ((!((rankAtom ranks 59 == rankAtom ranks 61)) || ((rankAtom ranks 64).ult (rankAtom ranks 66)))) = true)
    (h7097 : ((!((rankAtom ranks 59 == rankAtom ranks 64)) || ((rankAtom ranks 61).ult (rankAtom ranks 66)))) = true)
    (h7098 : ((!((rankAtom ranks 66 == rankAtom ranks 61)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h7099 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 74).ult (rankAtom ranks 67)))) = true)
    (h7100 : ((!((rankAtom ranks 59 == rankAtom ranks 74)) || ((rankAtom ranks 57).ult (rankAtom ranks 67)))) = true)
    (h7101 : ((!((rankAtom ranks 59 == rankAtom ranks 62)) || ((rankAtom ranks 64).ult (rankAtom ranks 67)))) = true)
    (h7102 : ((!((rankAtom ranks 59 == rankAtom ranks 64)) || ((rankAtom ranks 62).ult (rankAtom ranks 67)))) = true)
    (h7103 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 75).ult (rankAtom ranks 66)))) = true) :
    ∀ item ∈ sourceChunk110Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk110Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7040
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7041
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7042
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7043
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7044
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7045
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7046
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7047
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7048
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7049
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7050
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7051
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7052
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7053
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7054
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7055
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7056
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7057
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7058
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7059
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7060
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7061
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7062
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7063
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7071
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7075
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7076
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7079
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7087
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7095
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7098
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7099
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7103

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
