/-
Generated packed-source bridge for verified right chunk 033.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk033_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2112 : ((!((rowBit rows 0 1 4 && rowBit rows 0 1 9)) || ((rankAtom ranks 14 == rankAtom ranks 19)))) = true)
    (h2113 : ((!((rowBit rows 0 1 4 && rowBit rows 0 1 10)) || ((rankAtom ranks 14 == rankAtom ranks 20)))) = true)
    (h2114 : ((!((rowBit rows 0 1 4 && rowBit rows 0 1 11)) || ((rankAtom ranks 14 == rankAtom ranks 21)))) = true)
    (h2115 : ((!((rowBit rows 0 1 4 && rowBit rows 0 1 12)) || ((rankAtom ranks 14 == rankAtom ranks 22)))) = true)
    (h2116 : ((!((rowBit rows 0 1 5 && rowBit rows 0 1 6)) || ((rankAtom ranks 15 == rankAtom ranks 16)))) = true)
    (h2117 : ((!((rowBit rows 0 1 5 && rowBit rows 0 1 7)) || ((rankAtom ranks 15 == rankAtom ranks 17)))) = true)
    (h2118 : ((!((rowBit rows 0 1 5 && rowBit rows 0 1 8)) || ((rankAtom ranks 15 == rankAtom ranks 18)))) = true)
    (h2119 : ((!((rowBit rows 0 1 5 && rowBit rows 0 1 9)) || ((rankAtom ranks 15 == rankAtom ranks 19)))) = true)
    (h2120 : ((!((rowBit rows 0 1 5 && rowBit rows 0 1 10)) || ((rankAtom ranks 15 == rankAtom ranks 20)))) = true)
    (h2121 : ((!((rowBit rows 0 1 5 && rowBit rows 0 1 11)) || ((rankAtom ranks 15 == rankAtom ranks 21)))) = true)
    (h2122 : ((!((rowBit rows 0 1 5 && rowBit rows 0 1 12)) || ((rankAtom ranks 15 == rankAtom ranks 22)))) = true)
    (h2123 : ((!((rowBit rows 0 1 6 && rowBit rows 0 1 7)) || ((rankAtom ranks 16 == rankAtom ranks 17)))) = true)
    (h2124 : ((!((rowBit rows 0 1 6 && rowBit rows 0 1 8)) || ((rankAtom ranks 16 == rankAtom ranks 18)))) = true)
    (h2125 : ((!((rowBit rows 0 1 6 && rowBit rows 0 1 9)) || ((rankAtom ranks 16 == rankAtom ranks 19)))) = true)
    (h2126 : ((!((rowBit rows 0 1 6 && rowBit rows 0 1 10)) || ((rankAtom ranks 16 == rankAtom ranks 20)))) = true)
    (h2127 : ((!((rowBit rows 0 1 6 && rowBit rows 0 1 11)) || ((rankAtom ranks 16 == rankAtom ranks 21)))) = true)
    (h2128 : ((!((rowBit rows 0 1 6 && rowBit rows 0 1 12)) || ((rankAtom ranks 16 == rankAtom ranks 22)))) = true)
    (h2129 : ((!((rowBit rows 0 1 7 && rowBit rows 0 1 8)) || ((rankAtom ranks 17 == rankAtom ranks 18)))) = true)
    (h2130 : ((!((rowBit rows 0 1 7 && rowBit rows 0 1 9)) || ((rankAtom ranks 17 == rankAtom ranks 19)))) = true)
    (h2131 : ((!((rowBit rows 0 1 7 && rowBit rows 0 1 10)) || ((rankAtom ranks 17 == rankAtom ranks 20)))) = true)
    (h2132 : ((!((rowBit rows 0 1 7 && rowBit rows 0 1 11)) || ((rankAtom ranks 17 == rankAtom ranks 21)))) = true)
    (h2133 : ((!((rowBit rows 0 1 7 && rowBit rows 0 1 12)) || ((rankAtom ranks 17 == rankAtom ranks 22)))) = true)
    (h2134 : ((!((rowBit rows 0 1 8 && rowBit rows 0 1 9)) || ((rankAtom ranks 18 == rankAtom ranks 19)))) = true)
    (h2135 : ((!((rowBit rows 0 1 8 && rowBit rows 0 1 10)) || ((rankAtom ranks 18 == rankAtom ranks 20)))) = true)
    (h2136 : ((!((rowBit rows 0 1 8 && rowBit rows 0 1 11)) || ((rankAtom ranks 18 == rankAtom ranks 21)))) = true)
    (h2137 : ((!((rowBit rows 0 1 8 && rowBit rows 0 1 12)) || ((rankAtom ranks 18 == rankAtom ranks 22)))) = true)
    (h2138 : ((!((rowBit rows 0 1 9 && rowBit rows 0 1 10)) || ((rankAtom ranks 19 == rankAtom ranks 20)))) = true)
    (h2139 : ((!((rowBit rows 0 1 9 && rowBit rows 0 1 11)) || ((rankAtom ranks 19 == rankAtom ranks 21)))) = true)
    (h2140 : ((!((rowBit rows 0 1 9 && rowBit rows 0 1 12)) || ((rankAtom ranks 19 == rankAtom ranks 22)))) = true)
    (h2141 : ((!((rowBit rows 0 1 10 && rowBit rows 0 1 11)) || ((rankAtom ranks 20 == rankAtom ranks 21)))) = true)
    (h2142 : ((!((rowBit rows 0 1 10 && rowBit rows 0 1 12)) || ((rankAtom ranks 20 == rankAtom ranks 22)))) = true)
    (h2143 : ((!((rowBit rows 0 1 11 && rowBit rows 0 1 12)) || ((rankAtom ranks 21 == rankAtom ranks 22)))) = true)
    (h2144 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 1)) || ((rankAtom ranks 1 == rankAtom ranks 12)))) = true)
    (h2145 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 3)) || ((rankAtom ranks 1 == rankAtom ranks 23)))) = true)
    (h2146 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 4)) || ((rankAtom ranks 1 == rankAtom ranks 24)))) = true)
    (h2147 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 5)) || ((rankAtom ranks 1 == rankAtom ranks 25)))) = true)
    (h2148 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 6)) || ((rankAtom ranks 1 == rankAtom ranks 26)))) = true)
    (h2149 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 7)) || ((rankAtom ranks 1 == rankAtom ranks 27)))) = true)
    (h2150 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 8)) || ((rankAtom ranks 1 == rankAtom ranks 28)))) = true)
    (h2151 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 9)) || ((rankAtom ranks 1 == rankAtom ranks 29)))) = true)
    (h2152 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 10)) || ((rankAtom ranks 1 == rankAtom ranks 30)))) = true)
    (h2153 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 11)) || ((rankAtom ranks 1 == rankAtom ranks 31)))) = true)
    (h2154 : ((!((rowBit rows 0 2 0 && rowBit rows 0 2 12)) || ((rankAtom ranks 1 == rankAtom ranks 32)))) = true)
    (h2155 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 3)) || ((rankAtom ranks 12 == rankAtom ranks 23)))) = true)
    (h2156 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 4)) || ((rankAtom ranks 12 == rankAtom ranks 24)))) = true)
    (h2157 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 5)) || ((rankAtom ranks 12 == rankAtom ranks 25)))) = true)
    (h2158 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 6)) || ((rankAtom ranks 12 == rankAtom ranks 26)))) = true)
    (h2159 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 7)) || ((rankAtom ranks 12 == rankAtom ranks 27)))) = true)
    (h2160 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 8)) || ((rankAtom ranks 12 == rankAtom ranks 28)))) = true)
    (h2161 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 9)) || ((rankAtom ranks 12 == rankAtom ranks 29)))) = true)
    (h2162 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 10)) || ((rankAtom ranks 12 == rankAtom ranks 30)))) = true)
    (h2163 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 11)) || ((rankAtom ranks 12 == rankAtom ranks 31)))) = true)
    (h2164 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 12)) || ((rankAtom ranks 12 == rankAtom ranks 32)))) = true)
    (h2165 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 4)) || ((rankAtom ranks 23 == rankAtom ranks 24)))) = true)
    (h2166 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 5)) || ((rankAtom ranks 23 == rankAtom ranks 25)))) = true)
    (h2167 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 6)) || ((rankAtom ranks 23 == rankAtom ranks 26)))) = true)
    (h2168 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 7)) || ((rankAtom ranks 23 == rankAtom ranks 27)))) = true)
    (h2169 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 8)) || ((rankAtom ranks 23 == rankAtom ranks 28)))) = true)
    (h2170 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 9)) || ((rankAtom ranks 23 == rankAtom ranks 29)))) = true)
    (h2171 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 10)) || ((rankAtom ranks 23 == rankAtom ranks 30)))) = true)
    (h2172 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 11)) || ((rankAtom ranks 23 == rankAtom ranks 31)))) = true)
    (h2173 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 12)) || ((rankAtom ranks 23 == rankAtom ranks 32)))) = true)
    (h2174 : ((!((rowBit rows 0 2 4 && rowBit rows 0 2 5)) || ((rankAtom ranks 24 == rankAtom ranks 25)))) = true)
    (h2175 : ((!((rowBit rows 0 2 4 && rowBit rows 0 2 6)) || ((rankAtom ranks 24 == rankAtom ranks 26)))) = true) :
    ∀ item ∈ sourceChunk033Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk033Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2113
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2114
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2115
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2119
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2124
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2125
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2126
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2127
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2128
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2130
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2131
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2132
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2133
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2135
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2142
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2143
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2148
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2149
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2150
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2151
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2152
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2153
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2154
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2159
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2161
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2162
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2163
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2164
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2165
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2167
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2175

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
