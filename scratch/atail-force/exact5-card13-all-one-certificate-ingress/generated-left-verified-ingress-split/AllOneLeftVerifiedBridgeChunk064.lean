/-
Generated packed-source bridge for verified left chunk 064.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk064_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4096 : ((!((rankAtom ranks 7 == rankAtom ranks 8)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h4097 : ((!((rankAtom ranks 7 == rankAtom ranks 58)) || ((rankAtom ranks 8).ult (rankAtom ranks 59)))) = true)
    (h4098 : ((!((rankAtom ranks 59 == rankAtom ranks 8)) || ((rankAtom ranks 58).ult (rankAtom ranks 7)))) = true)
    (h4099 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 8).ult (rankAtom ranks 7)))) = true)
    (h4100 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h4101 : ((!((rankAtom ranks 60 == rankAtom ranks 5)) || ((rankAtom ranks 69).ult (rankAtom ranks 7)))) = true)
    (h4102 : ((!((rankAtom ranks 60 == rankAtom ranks 69)) || ((rankAtom ranks 5).ult (rankAtom ranks 7)))) = true)
    (h4103 : ((!((rankAtom ranks 7 == rankAtom ranks 9)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h4104 : ((!((rankAtom ranks 7 == rankAtom ranks 58)) || ((rankAtom ranks 9).ult (rankAtom ranks 60)))) = true)
    (h4105 : ((!((rankAtom ranks 60 == rankAtom ranks 9)) || ((rankAtom ranks 58).ult (rankAtom ranks 7)))) = true)
    (h4106 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 9).ult (rankAtom ranks 7)))) = true)
    (h4107 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h4108 : ((!((rankAtom ranks 61 == rankAtom ranks 5)) || ((rankAtom ranks 70).ult (rankAtom ranks 7)))) = true)
    (h4109 : ((!((rankAtom ranks 61 == rankAtom ranks 70)) || ((rankAtom ranks 5).ult (rankAtom ranks 7)))) = true)
    (h4110 : ((!((rankAtom ranks 7 == rankAtom ranks 58)) || ((rankAtom ranks 10).ult (rankAtom ranks 61)))) = true)
    (h4111 : ((!((rankAtom ranks 61 == rankAtom ranks 10)) || ((rankAtom ranks 58).ult (rankAtom ranks 7)))) = true)
    (h4112 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 10).ult (rankAtom ranks 7)))) = true)
    (h4113 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h4114 : ((!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h4115 : ((!((rankAtom ranks 62 == rankAtom ranks 71)) || ((rankAtom ranks 5).ult (rankAtom ranks 7)))) = true)
    (h4116 : ((!((rankAtom ranks 7 == rankAtom ranks 11)) || ((rankAtom ranks 58).ult (rankAtom ranks 62)))) = true)
    (h4117 : ((!((rankAtom ranks 7 == rankAtom ranks 58)) || ((rankAtom ranks 11).ult (rankAtom ranks 62)))) = true)
    (h4118 : ((!((rankAtom ranks 62 == rankAtom ranks 11)) || ((rankAtom ranks 58).ult (rankAtom ranks 7)))) = true)
    (h4119 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 11).ult (rankAtom ranks 7)))) = true)
    (h4120 : ((!((rankAtom ranks 8 == rankAtom ranks 5)) || ((rankAtom ranks 72).ult (rankAtom ranks 60)))) = true)
    (h4121 : ((!((rankAtom ranks 8 == rankAtom ranks 72)) || ((rankAtom ranks 5).ult (rankAtom ranks 60)))) = true)
    (h4122 : ((!((rankAtom ranks 60 == rankAtom ranks 5)) || ((rankAtom ranks 72).ult (rankAtom ranks 8)))) = true)
    (h4123 : ((!((rankAtom ranks 60 == rankAtom ranks 72)) || ((rankAtom ranks 5).ult (rankAtom ranks 8)))) = true)
    (h4124 : ((!((rankAtom ranks 8 == rankAtom ranks 59)) || ((rankAtom ranks 9).ult (rankAtom ranks 60)))) = true)
    (h4125 : ((!((rankAtom ranks 60 == rankAtom ranks 9)) || ((rankAtom ranks 59).ult (rankAtom ranks 8)))) = true)
    (h4126 : ((!((rankAtom ranks 60 == rankAtom ranks 59)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h4127 : ((!((rankAtom ranks 8 == rankAtom ranks 5)) || ((rankAtom ranks 73).ult (rankAtom ranks 61)))) = true)
    (h4128 : ((!((rankAtom ranks 8 == rankAtom ranks 73)) || ((rankAtom ranks 5).ult (rankAtom ranks 61)))) = true)
    (h4129 : ((!((rankAtom ranks 61 == rankAtom ranks 5)) || ((rankAtom ranks 73).ult (rankAtom ranks 8)))) = true)
    (h4130 : ((!((rankAtom ranks 61 == rankAtom ranks 73)) || ((rankAtom ranks 5).ult (rankAtom ranks 8)))) = true)
    (h4131 : ((!((rankAtom ranks 8 == rankAtom ranks 59)) || ((rankAtom ranks 10).ult (rankAtom ranks 61)))) = true)
    (h4132 : ((!((rankAtom ranks 61 == rankAtom ranks 10)) || ((rankAtom ranks 59).ult (rankAtom ranks 8)))) = true)
    (h4133 : ((!((rankAtom ranks 61 == rankAtom ranks 59)) || ((rankAtom ranks 10).ult (rankAtom ranks 8)))) = true)
    (h4134 : ((!((rankAtom ranks 8 == rankAtom ranks 5)) || ((rankAtom ranks 74).ult (rankAtom ranks 62)))) = true)
    (h4135 : ((!((rankAtom ranks 8 == rankAtom ranks 74)) || ((rankAtom ranks 5).ult (rankAtom ranks 62)))) = true)
    (h4136 : ((!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 74).ult (rankAtom ranks 8)))) = true)
    (h4137 : ((!((rankAtom ranks 8 == rankAtom ranks 11)) || ((rankAtom ranks 59).ult (rankAtom ranks 62)))) = true)
    (h4138 : ((!((rankAtom ranks 8 == rankAtom ranks 59)) || ((rankAtom ranks 11).ult (rankAtom ranks 62)))) = true)
    (h4139 : ((!((rankAtom ranks 62 == rankAtom ranks 11)) || ((rankAtom ranks 59).ult (rankAtom ranks 8)))) = true)
    (h4140 : ((!((rankAtom ranks 62 == rankAtom ranks 59)) || ((rankAtom ranks 11).ult (rankAtom ranks 8)))) = true)
    (h4141 : ((!((rankAtom ranks 9 == rankAtom ranks 5)) || ((rankAtom ranks 75).ult (rankAtom ranks 61)))) = true)
    (h4142 : ((!((rankAtom ranks 9 == rankAtom ranks 75)) || ((rankAtom ranks 5).ult (rankAtom ranks 61)))) = true)
    (h4143 : ((!((rankAtom ranks 61 == rankAtom ranks 5)) || ((rankAtom ranks 75).ult (rankAtom ranks 9)))) = true)
    (h4144 : ((!((rankAtom ranks 61 == rankAtom ranks 75)) || ((rankAtom ranks 5).ult (rankAtom ranks 9)))) = true)
    (h4145 : ((!((rankAtom ranks 9 == rankAtom ranks 60)) || ((rankAtom ranks 10).ult (rankAtom ranks 61)))) = true)
    (h4146 : ((!((rankAtom ranks 61 == rankAtom ranks 10)) || ((rankAtom ranks 60).ult (rankAtom ranks 9)))) = true)
    (h4147 : ((!((rankAtom ranks 61 == rankAtom ranks 60)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h4148 : ((!((rankAtom ranks 9 == rankAtom ranks 5)) || ((rankAtom ranks 76).ult (rankAtom ranks 62)))) = true)
    (h4149 : ((!((rankAtom ranks 9 == rankAtom ranks 76)) || ((rankAtom ranks 5).ult (rankAtom ranks 62)))) = true)
    (h4150 : ((!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 76).ult (rankAtom ranks 9)))) = true)
    (h4151 : ((!((rankAtom ranks 9 == rankAtom ranks 60)) || ((rankAtom ranks 11).ult (rankAtom ranks 62)))) = true)
    (h4152 : ((!((rankAtom ranks 62 == rankAtom ranks 60)) || ((rankAtom ranks 11).ult (rankAtom ranks 9)))) = true)
    (h4153 : ((!((rankAtom ranks 10 == rankAtom ranks 5)) || ((rankAtom ranks 77).ult (rankAtom ranks 62)))) = true)
    (h4154 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 5).ult (rankAtom ranks 62)))) = true)
    (h4155 : ((!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 77).ult (rankAtom ranks 10)))) = true)
    (h4156 : ((!((rankAtom ranks 10 == rankAtom ranks 11)) || ((rankAtom ranks 61).ult (rankAtom ranks 62)))) = true)
    (h4157 : ((!((rankAtom ranks 10 == rankAtom ranks 61)) || ((rankAtom ranks 11).ult (rankAtom ranks 62)))) = true)
    (h4158 : ((!((rankAtom ranks 62 == rankAtom ranks 11)) || ((rankAtom ranks 61).ult (rankAtom ranks 10)))) = true)
    (h4159 : ((!((rankAtom ranks 62 == rankAtom ranks 61)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true) :
    ∀ item ∈ sourceChunk064Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk064Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4098
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4099
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4103
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4104
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4111
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4113
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4114
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4115
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4119
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4124
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4125
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4126
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4127
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4128
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4130
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4131
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4132
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4133
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4135
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4142
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4143
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4148
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4149
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4150
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4151
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4152
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4153
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4154
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4159

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
