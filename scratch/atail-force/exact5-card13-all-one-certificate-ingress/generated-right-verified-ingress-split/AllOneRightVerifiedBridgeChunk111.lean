/-
Generated packed-source bridge for verified right chunk 111.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk111_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h7104 : ((!((rankAtom ranks 60 == rankAtom ranks 75)) || ((rankAtom ranks 57).ult (rankAtom ranks 66)))) = true)
    (h7105 : ((!((rankAtom ranks 66 == rankAtom ranks 75)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h7106 : ((!((rankAtom ranks 60 == rankAtom ranks 61)) || ((rankAtom ranks 65).ult (rankAtom ranks 66)))) = true)
    (h7107 : ((!((rankAtom ranks 60 == rankAtom ranks 65)) || ((rankAtom ranks 61).ult (rankAtom ranks 66)))) = true)
    (h7108 : ((!((rankAtom ranks 66 == rankAtom ranks 61)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h7109 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 76).ult (rankAtom ranks 67)))) = true)
    (h7110 : ((!((rankAtom ranks 60 == rankAtom ranks 76)) || ((rankAtom ranks 57).ult (rankAtom ranks 67)))) = true)
    (h7111 : ((!((rankAtom ranks 60 == rankAtom ranks 62)) || ((rankAtom ranks 65).ult (rankAtom ranks 67)))) = true)
    (h7112 : ((!((rankAtom ranks 60 == rankAtom ranks 65)) || ((rankAtom ranks 62).ult (rankAtom ranks 67)))) = true)
    (h7113 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 77).ult (rankAtom ranks 67)))) = true)
    (h7114 : ((!((rankAtom ranks 61 == rankAtom ranks 77)) || ((rankAtom ranks 57).ult (rankAtom ranks 67)))) = true)
    (h7115 : ((!((rankAtom ranks 61 == rankAtom ranks 62)) || ((rankAtom ranks 66).ult (rankAtom ranks 67)))) = true)
    (h7116 : ((!((rankAtom ranks 61 == rankAtom ranks 66)) || ((rankAtom ranks 62).ult (rankAtom ranks 67)))) = true)
    (h7117 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 72).ult (rankAtom ranks 69)))) = true)
    (h7118 : ((!((rankAtom ranks 59 == rankAtom ranks 72)) || ((rankAtom ranks 58).ult (rankAtom ranks 69)))) = true)
    (h7119 : ((!((rankAtom ranks 69 == rankAtom ranks 58)) || ((rankAtom ranks 72).ult (rankAtom ranks 59)))) = true)
    (h7120 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h7121 : ((!((rankAtom ranks 59 == rankAtom ranks 60)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h7122 : ((!((rankAtom ranks 59 == rankAtom ranks 68)) || ((rankAtom ranks 60).ult (rankAtom ranks 69)))) = true)
    (h7123 : ((!((rankAtom ranks 69 == rankAtom ranks 60)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h7124 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 73).ult (rankAtom ranks 70)))) = true)
    (h7125 : ((!((rankAtom ranks 59 == rankAtom ranks 73)) || ((rankAtom ranks 58).ult (rankAtom ranks 70)))) = true)
    (h7126 : ((!((rankAtom ranks 70 == rankAtom ranks 58)) || ((rankAtom ranks 73).ult (rankAtom ranks 59)))) = true)
    (h7127 : ((!((rankAtom ranks 70 == rankAtom ranks 73)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h7128 : ((!((rankAtom ranks 59 == rankAtom ranks 61)) || ((rankAtom ranks 68).ult (rankAtom ranks 70)))) = true)
    (h7129 : ((!((rankAtom ranks 59 == rankAtom ranks 68)) || ((rankAtom ranks 61).ult (rankAtom ranks 70)))) = true)
    (h7130 : ((!((rankAtom ranks 70 == rankAtom ranks 61)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h7131 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 74).ult (rankAtom ranks 71)))) = true)
    (h7132 : ((!((rankAtom ranks 59 == rankAtom ranks 74)) || ((rankAtom ranks 58).ult (rankAtom ranks 71)))) = true)
    (h7133 : ((!((rankAtom ranks 71 == rankAtom ranks 58)) || ((rankAtom ranks 74).ult (rankAtom ranks 59)))) = true)
    (h7134 : ((!((rankAtom ranks 71 == rankAtom ranks 74)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h7135 : ((!((rankAtom ranks 59 == rankAtom ranks 62)) || ((rankAtom ranks 68).ult (rankAtom ranks 71)))) = true)
    (h7136 : ((!((rankAtom ranks 59 == rankAtom ranks 68)) || ((rankAtom ranks 62).ult (rankAtom ranks 71)))) = true)
    (h7137 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 75).ult (rankAtom ranks 70)))) = true)
    (h7138 : ((!((rankAtom ranks 60 == rankAtom ranks 75)) || ((rankAtom ranks 58).ult (rankAtom ranks 70)))) = true)
    (h7139 : ((!((rankAtom ranks 70 == rankAtom ranks 58)) || ((rankAtom ranks 75).ult (rankAtom ranks 60)))) = true)
    (h7140 : ((!((rankAtom ranks 70 == rankAtom ranks 75)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h7141 : ((!((rankAtom ranks 60 == rankAtom ranks 61)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h7142 : ((!((rankAtom ranks 60 == rankAtom ranks 69)) || ((rankAtom ranks 61).ult (rankAtom ranks 70)))) = true)
    (h7143 : ((!((rankAtom ranks 70 == rankAtom ranks 61)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h7144 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 76).ult (rankAtom ranks 71)))) = true)
    (h7145 : ((!((rankAtom ranks 60 == rankAtom ranks 76)) || ((rankAtom ranks 58).ult (rankAtom ranks 71)))) = true)
    (h7146 : ((!((rankAtom ranks 71 == rankAtom ranks 58)) || ((rankAtom ranks 76).ult (rankAtom ranks 60)))) = true)
    (h7147 : ((!((rankAtom ranks 60 == rankAtom ranks 62)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h7148 : ((!((rankAtom ranks 60 == rankAtom ranks 69)) || ((rankAtom ranks 62).ult (rankAtom ranks 71)))) = true)
    (h7149 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 77).ult (rankAtom ranks 71)))) = true)
    (h7150 : ((!((rankAtom ranks 61 == rankAtom ranks 77)) || ((rankAtom ranks 58).ult (rankAtom ranks 71)))) = true)
    (h7151 : ((!((rankAtom ranks 71 == rankAtom ranks 58)) || ((rankAtom ranks 77).ult (rankAtom ranks 61)))) = true)
    (h7152 : ((!((rankAtom ranks 61 == rankAtom ranks 62)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true)
    (h7153 : ((!((rankAtom ranks 61 == rankAtom ranks 70)) || ((rankAtom ranks 62).ult (rankAtom ranks 71)))) = true)
    (h7154 : ((!((rankAtom ranks 71 == rankAtom ranks 62)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h7155 : ((!((rankAtom ranks 60 == rankAtom ranks 59)) || ((rankAtom ranks 75).ult (rankAtom ranks 73)))) = true)
    (h7156 : ((!((rankAtom ranks 60 == rankAtom ranks 75)) || ((rankAtom ranks 59).ult (rankAtom ranks 73)))) = true)
    (h7157 : ((!((rankAtom ranks 73 == rankAtom ranks 59)) || ((rankAtom ranks 75).ult (rankAtom ranks 60)))) = true)
    (h7158 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 59).ult (rankAtom ranks 60)))) = true)
    (h7159 : ((!((rankAtom ranks 60 == rankAtom ranks 61)) || ((rankAtom ranks 72).ult (rankAtom ranks 73)))) = true)
    (h7160 : ((!((rankAtom ranks 60 == rankAtom ranks 72)) || ((rankAtom ranks 61).ult (rankAtom ranks 73)))) = true)
    (h7161 : ((!((rankAtom ranks 73 == rankAtom ranks 61)) || ((rankAtom ranks 72).ult (rankAtom ranks 60)))) = true)
    (h7162 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 61).ult (rankAtom ranks 60)))) = true)
    (h7163 : ((!((rankAtom ranks 60 == rankAtom ranks 59)) || ((rankAtom ranks 76).ult (rankAtom ranks 74)))) = true)
    (h7164 : ((!((rankAtom ranks 60 == rankAtom ranks 76)) || ((rankAtom ranks 59).ult (rankAtom ranks 74)))) = true)
    (h7165 : ((!((rankAtom ranks 74 == rankAtom ranks 59)) || ((rankAtom ranks 76).ult (rankAtom ranks 60)))) = true)
    (h7166 : ((!((rankAtom ranks 60 == rankAtom ranks 62)) || ((rankAtom ranks 72).ult (rankAtom ranks 74)))) = true)
    (h7167 : ((!((rankAtom ranks 60 == rankAtom ranks 72)) || ((rankAtom ranks 62).ult (rankAtom ranks 74)))) = true) :
    ∀ item ∈ sourceChunk111Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk111Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7104
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7111
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7113
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7114
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7115
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7119
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7124
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7125
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7126
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7127
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7128
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7130
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7131
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7132
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7133
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7135
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7142
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7143
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7148
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7149
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7150
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7151
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7152
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7153
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7154
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7159
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7161
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7162
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7163
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7164
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7165
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7167

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
