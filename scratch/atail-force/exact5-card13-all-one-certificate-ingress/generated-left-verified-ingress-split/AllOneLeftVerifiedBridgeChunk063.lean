/-
Generated packed-source bridge for verified left chunk 063.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk063_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4032 : ((!((rankAtom ranks 8 == rankAtom ranks 4)) || ((rankAtom ranks 74).ult (rankAtom ranks 56)))) = true)
    (h4033 : ((!((rankAtom ranks 8 == rankAtom ranks 74)) || ((rankAtom ranks 4).ult (rankAtom ranks 56)))) = true)
    (h4034 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 74).ult (rankAtom ranks 8)))) = true)
    (h4035 : ((!((rankAtom ranks 56 == rankAtom ranks 74)) || ((rankAtom ranks 4).ult (rankAtom ranks 8)))) = true)
    (h4036 : ((!((rankAtom ranks 8 == rankAtom ranks 11)) || ((rankAtom ranks 53).ult (rankAtom ranks 56)))) = true)
    (h4037 : ((!((rankAtom ranks 8 == rankAtom ranks 53)) || ((rankAtom ranks 11).ult (rankAtom ranks 56)))) = true)
    (h4038 : ((!((rankAtom ranks 56 == rankAtom ranks 53)) || ((rankAtom ranks 11).ult (rankAtom ranks 8)))) = true)
    (h4039 : ((!((rankAtom ranks 9 == rankAtom ranks 4)) || ((rankAtom ranks 75).ult (rankAtom ranks 55)))) = true)
    (h4040 : ((!((rankAtom ranks 9 == rankAtom ranks 75)) || ((rankAtom ranks 4).ult (rankAtom ranks 55)))) = true)
    (h4041 : ((!((rankAtom ranks 55 == rankAtom ranks 4)) || ((rankAtom ranks 75).ult (rankAtom ranks 9)))) = true)
    (h4042 : ((!((rankAtom ranks 55 == rankAtom ranks 75)) || ((rankAtom ranks 4).ult (rankAtom ranks 9)))) = true)
    (h4043 : ((!((rankAtom ranks 9 == rankAtom ranks 10)) || ((rankAtom ranks 54).ult (rankAtom ranks 55)))) = true)
    (h4044 : ((!((rankAtom ranks 9 == rankAtom ranks 54)) || ((rankAtom ranks 10).ult (rankAtom ranks 55)))) = true)
    (h4045 : ((!((rankAtom ranks 55 == rankAtom ranks 10)) || ((rankAtom ranks 54).ult (rankAtom ranks 9)))) = true)
    (h4046 : ((!((rankAtom ranks 55 == rankAtom ranks 54)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h4047 : ((!((rankAtom ranks 9 == rankAtom ranks 4)) || ((rankAtom ranks 76).ult (rankAtom ranks 56)))) = true)
    (h4048 : ((!((rankAtom ranks 9 == rankAtom ranks 76)) || ((rankAtom ranks 4).ult (rankAtom ranks 56)))) = true)
    (h4049 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 76).ult (rankAtom ranks 9)))) = true)
    (h4050 : ((!((rankAtom ranks 56 == rankAtom ranks 76)) || ((rankAtom ranks 4).ult (rankAtom ranks 9)))) = true)
    (h4051 : ((!((rankAtom ranks 9 == rankAtom ranks 11)) || ((rankAtom ranks 54).ult (rankAtom ranks 56)))) = true)
    (h4052 : ((!((rankAtom ranks 9 == rankAtom ranks 54)) || ((rankAtom ranks 11).ult (rankAtom ranks 56)))) = true)
    (h4053 : ((!((rankAtom ranks 56 == rankAtom ranks 54)) || ((rankAtom ranks 11).ult (rankAtom ranks 9)))) = true)
    (h4054 : ((!((rankAtom ranks 10 == rankAtom ranks 4)) || ((rankAtom ranks 77).ult (rankAtom ranks 56)))) = true)
    (h4055 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 4).ult (rankAtom ranks 56)))) = true)
    (h4056 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 77).ult (rankAtom ranks 10)))) = true)
    (h4057 : ((!((rankAtom ranks 10 == rankAtom ranks 55)) || ((rankAtom ranks 11).ult (rankAtom ranks 56)))) = true)
    (h4058 : ((!((rankAtom ranks 56 == rankAtom ranks 55)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h4059 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h4060 : ((!((rankAtom ranks 58 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 6)))) = true)
    (h4061 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h4062 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 58)))) = true)
    (h4063 : ((!((rankAtom ranks 58 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 6)))) = true)
    (h4064 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h4065 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h4066 : ((!((rankAtom ranks 59 == rankAtom ranks 5)) || ((rankAtom ranks 64).ult (rankAtom ranks 6)))) = true)
    (h4067 : ((!((rankAtom ranks 59 == rankAtom ranks 64)) || ((rankAtom ranks 5).ult (rankAtom ranks 6)))) = true)
    (h4068 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h4069 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 8).ult (rankAtom ranks 59)))) = true)
    (h4070 : ((!((rankAtom ranks 59 == rankAtom ranks 8)) || ((rankAtom ranks 57).ult (rankAtom ranks 6)))) = true)
    (h4071 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 8).ult (rankAtom ranks 6)))) = true)
    (h4072 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h4073 : ((!((rankAtom ranks 6 == rankAtom ranks 65)) || ((rankAtom ranks 5).ult (rankAtom ranks 60)))) = true)
    (h4074 : ((!((rankAtom ranks 60 == rankAtom ranks 5)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true)
    (h4075 : ((!((rankAtom ranks 60 == rankAtom ranks 65)) || ((rankAtom ranks 5).ult (rankAtom ranks 6)))) = true)
    (h4076 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h4077 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 9).ult (rankAtom ranks 60)))) = true)
    (h4078 : ((!((rankAtom ranks 60 == rankAtom ranks 9)) || ((rankAtom ranks 57).ult (rankAtom ranks 6)))) = true)
    (h4079 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 9).ult (rankAtom ranks 6)))) = true)
    (h4080 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h4081 : ((!((rankAtom ranks 6 == rankAtom ranks 66)) || ((rankAtom ranks 5).ult (rankAtom ranks 61)))) = true)
    (h4082 : ((!((rankAtom ranks 61 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 6)))) = true)
    (h4083 : ((!((rankAtom ranks 61 == rankAtom ranks 66)) || ((rankAtom ranks 5).ult (rankAtom ranks 6)))) = true)
    (h4084 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h4085 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 10).ult (rankAtom ranks 61)))) = true)
    (h4086 : ((!((rankAtom ranks 61 == rankAtom ranks 10)) || ((rankAtom ranks 57).ult (rankAtom ranks 6)))) = true)
    (h4087 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 10).ult (rankAtom ranks 6)))) = true)
    (h4088 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h4089 : ((!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h4090 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h4091 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 11).ult (rankAtom ranks 62)))) = true)
    (h4092 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 11).ult (rankAtom ranks 6)))) = true)
    (h4093 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h4094 : ((!((rankAtom ranks 59 == rankAtom ranks 5)) || ((rankAtom ranks 68).ult (rankAtom ranks 7)))) = true)
    (h4095 : ((!((rankAtom ranks 59 == rankAtom ranks 68)) || ((rankAtom ranks 5).ult (rankAtom ranks 7)))) = true) :
    ∀ item ∈ sourceChunk063Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk063Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4032
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4033
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4034
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4035
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4036
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4037
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4038
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4039
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4040
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4041
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4042
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4043
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4044
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4045
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4046
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4047
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4048
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4049
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4050
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4051
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4052
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4053
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4054
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4055
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4056
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4057
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4058
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4059
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4060
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4061
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4062
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4063
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4071
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4075
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4076
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4079
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4087
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4095

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
