/-
Generated packed-source ingress for `allOneHitHubMiddle`.

The row roles are fixed in the original boundary frame: hub 2,
g0 spoke 1, and g1 spoke 3.  The `m` row
family is reserved for the source table carrying the actual fixed-H supports.
-/
import AllOneMiddleVerified
import Lean.Data.RArray

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

abbrev RowBits := BitVec 507
abbrev BlockerBits := BitVec 52
abbrev ShellBits := BitVec 13
abbrev RoleBits := BitVec 4
abbrev FirstRowBits := BitVec 13
abbrev RankBits := BitVec 546

abbrev rowBit (rows : RowBits) (family center point : Nat) : Bool :=
  rows.getLsbD (169 * family + 13 * center + point)

abbrev blockerAt (blockers : BlockerBits) (source : Nat) : BitVec 4 :=
  blockers.extractLsb' (4 * source) 4

abbrev shellBit (shell : ShellBits) (point : Nat) : Bool :=
  shell.getLsbD point

abbrev firstRowBit (row : FirstRowBits) (point : Nat) : Bool :=
  row.getLsbD point

abbrev rankAtom (ranks : RankBits) (index : Nat) : BitVec 7 :=
  ranks.extractLsb' (7 * index) 7

/-- Exact dense slot function recorded by the generated variable map. -/
def sourceSlot
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    Nat → BVExpr.PackedBitVec
  | 0 => ⟨BitVec.ofBool (firstRowBit b1 0)⟩
  | 1 => ⟨BitVec.ofBool (firstRowBit b1 1)⟩
  | 2 => ⟨BitVec.ofBool (firstRowBit b1 2)⟩
  | 3 => ⟨BitVec.ofBool (firstRowBit b1 3)⟩
  | 4 => ⟨BitVec.ofBool (firstRowBit b1 4)⟩
  | 5 => ⟨BitVec.ofBool (firstRowBit b1 5)⟩
  | 6 => ⟨BitVec.ofBool (firstRowBit b1 6)⟩
  | 7 => ⟨BitVec.ofBool (firstRowBit b1 7)⟩
  | 8 => ⟨BitVec.ofBool (firstRowBit b1 8)⟩
  | 9 => ⟨BitVec.ofBool (firstRowBit b1 9)⟩
  | 10 => ⟨BitVec.ofBool (firstRowBit b1 10)⟩
  | 11 => ⟨BitVec.ofBool (firstRowBit b1 11)⟩
  | 12 => ⟨BitVec.ofBool (firstRowBit b1 12)⟩
  | 13 => ⟨blockerAt blockers 3⟩
  | 14 => ⟨q⟩
  | 15 => ⟨w⟩
  | 16 => ⟨BitVec.ofBool (rowBit rows 1 0 0)⟩
  | 17 => ⟨BitVec.ofBool (rowBit rows 1 0 1)⟩
  | 18 => ⟨BitVec.ofBool (rowBit rows 1 0 2)⟩
  | 19 => ⟨BitVec.ofBool (rowBit rows 1 0 3)⟩
  | 20 => ⟨BitVec.ofBool (rowBit rows 1 0 4)⟩
  | 21 => ⟨BitVec.ofBool (rowBit rows 1 0 5)⟩
  | 22 => ⟨BitVec.ofBool (rowBit rows 1 0 6)⟩
  | 23 => ⟨BitVec.ofBool (rowBit rows 1 0 7)⟩
  | 24 => ⟨BitVec.ofBool (rowBit rows 1 0 8)⟩
  | 25 => ⟨BitVec.ofBool (rowBit rows 1 0 9)⟩
  | 26 => ⟨BitVec.ofBool (rowBit rows 1 0 10)⟩
  | 27 => ⟨BitVec.ofBool (rowBit rows 1 0 11)⟩
  | 28 => ⟨BitVec.ofBool (rowBit rows 1 0 12)⟩
  | 29 => ⟨BitVec.ofBool (rowBit rows 1 1 0)⟩
  | 30 => ⟨BitVec.ofBool (rowBit rows 1 1 1)⟩
  | 31 => ⟨BitVec.ofBool (rowBit rows 1 1 2)⟩
  | 32 => ⟨BitVec.ofBool (rowBit rows 1 1 3)⟩
  | 33 => ⟨BitVec.ofBool (rowBit rows 1 1 4)⟩
  | 34 => ⟨BitVec.ofBool (rowBit rows 1 1 5)⟩
  | 35 => ⟨BitVec.ofBool (rowBit rows 1 1 6)⟩
  | 36 => ⟨BitVec.ofBool (rowBit rows 1 1 7)⟩
  | 37 => ⟨BitVec.ofBool (rowBit rows 1 1 8)⟩
  | 38 => ⟨BitVec.ofBool (rowBit rows 1 1 9)⟩
  | 39 => ⟨BitVec.ofBool (rowBit rows 1 1 10)⟩
  | 40 => ⟨BitVec.ofBool (rowBit rows 1 1 11)⟩
  | 41 => ⟨BitVec.ofBool (rowBit rows 1 1 12)⟩
  | 42 => ⟨BitVec.ofBool (rowBit rows 1 2 0)⟩
  | 43 => ⟨BitVec.ofBool (rowBit rows 1 2 1)⟩
  | 44 => ⟨BitVec.ofBool (rowBit rows 1 2 2)⟩
  | 45 => ⟨BitVec.ofBool (rowBit rows 1 2 3)⟩
  | 46 => ⟨BitVec.ofBool (rowBit rows 1 2 4)⟩
  | 47 => ⟨BitVec.ofBool (rowBit rows 1 2 5)⟩
  | 48 => ⟨BitVec.ofBool (rowBit rows 1 2 6)⟩
  | 49 => ⟨BitVec.ofBool (rowBit rows 1 2 7)⟩
  | 50 => ⟨BitVec.ofBool (rowBit rows 1 2 8)⟩
  | 51 => ⟨BitVec.ofBool (rowBit rows 1 2 9)⟩
  | 52 => ⟨BitVec.ofBool (rowBit rows 1 2 10)⟩
  | 53 => ⟨BitVec.ofBool (rowBit rows 1 2 11)⟩
  | 54 => ⟨BitVec.ofBool (rowBit rows 1 2 12)⟩
  | 55 => ⟨BitVec.ofBool (rowBit rows 1 3 0)⟩
  | 56 => ⟨BitVec.ofBool (rowBit rows 1 3 1)⟩
  | 57 => ⟨BitVec.ofBool (rowBit rows 1 3 2)⟩
  | 58 => ⟨BitVec.ofBool (rowBit rows 1 3 3)⟩
  | 59 => ⟨BitVec.ofBool (rowBit rows 1 3 4)⟩
  | 60 => ⟨BitVec.ofBool (rowBit rows 1 3 5)⟩
  | 61 => ⟨BitVec.ofBool (rowBit rows 1 3 6)⟩
  | 62 => ⟨BitVec.ofBool (rowBit rows 1 3 7)⟩
  | 63 => ⟨BitVec.ofBool (rowBit rows 1 3 8)⟩
  | 64 => ⟨BitVec.ofBool (rowBit rows 1 3 9)⟩
  | 65 => ⟨BitVec.ofBool (rowBit rows 1 3 10)⟩
  | 66 => ⟨BitVec.ofBool (rowBit rows 1 3 11)⟩
  | 67 => ⟨BitVec.ofBool (rowBit rows 1 3 12)⟩
  | 68 => ⟨BitVec.ofBool (rowBit rows 1 4 0)⟩
  | 69 => ⟨BitVec.ofBool (rowBit rows 1 4 1)⟩
  | 70 => ⟨BitVec.ofBool (rowBit rows 1 4 2)⟩
  | 71 => ⟨BitVec.ofBool (rowBit rows 1 4 3)⟩
  | 72 => ⟨BitVec.ofBool (rowBit rows 1 4 4)⟩
  | 73 => ⟨BitVec.ofBool (rowBit rows 1 4 5)⟩
  | 74 => ⟨BitVec.ofBool (rowBit rows 1 4 6)⟩
  | 75 => ⟨BitVec.ofBool (rowBit rows 1 4 7)⟩
  | 76 => ⟨BitVec.ofBool (rowBit rows 1 4 8)⟩
  | 77 => ⟨BitVec.ofBool (rowBit rows 1 4 9)⟩
  | 78 => ⟨BitVec.ofBool (rowBit rows 1 4 10)⟩
  | 79 => ⟨BitVec.ofBool (rowBit rows 1 4 11)⟩
  | 80 => ⟨BitVec.ofBool (rowBit rows 1 4 12)⟩
  | 81 => ⟨BitVec.ofBool (rowBit rows 1 5 0)⟩
  | 82 => ⟨BitVec.ofBool (rowBit rows 1 5 1)⟩
  | 83 => ⟨BitVec.ofBool (rowBit rows 1 5 2)⟩
  | 84 => ⟨BitVec.ofBool (rowBit rows 1 5 3)⟩
  | 85 => ⟨BitVec.ofBool (rowBit rows 1 5 4)⟩
  | 86 => ⟨BitVec.ofBool (rowBit rows 1 5 5)⟩
  | 87 => ⟨BitVec.ofBool (rowBit rows 1 5 6)⟩
  | 88 => ⟨BitVec.ofBool (rowBit rows 1 5 7)⟩
  | 89 => ⟨BitVec.ofBool (rowBit rows 1 5 8)⟩
  | 90 => ⟨BitVec.ofBool (rowBit rows 1 5 9)⟩
  | 91 => ⟨BitVec.ofBool (rowBit rows 1 5 10)⟩
  | 92 => ⟨BitVec.ofBool (rowBit rows 1 5 11)⟩
  | 93 => ⟨BitVec.ofBool (rowBit rows 1 5 12)⟩
  | 94 => ⟨BitVec.ofBool (rowBit rows 1 6 0)⟩
  | 95 => ⟨BitVec.ofBool (rowBit rows 1 6 1)⟩
  | 96 => ⟨BitVec.ofBool (rowBit rows 1 6 2)⟩
  | 97 => ⟨BitVec.ofBool (rowBit rows 1 6 3)⟩
  | 98 => ⟨BitVec.ofBool (rowBit rows 1 6 4)⟩
  | 99 => ⟨BitVec.ofBool (rowBit rows 1 6 5)⟩
  | 100 => ⟨BitVec.ofBool (rowBit rows 1 6 6)⟩
  | 101 => ⟨BitVec.ofBool (rowBit rows 1 6 7)⟩
  | 102 => ⟨BitVec.ofBool (rowBit rows 1 6 8)⟩
  | 103 => ⟨BitVec.ofBool (rowBit rows 1 6 9)⟩
  | 104 => ⟨BitVec.ofBool (rowBit rows 1 6 10)⟩
  | 105 => ⟨BitVec.ofBool (rowBit rows 1 6 11)⟩
  | 106 => ⟨BitVec.ofBool (rowBit rows 1 6 12)⟩
  | 107 => ⟨BitVec.ofBool (rowBit rows 1 7 0)⟩
  | 108 => ⟨BitVec.ofBool (rowBit rows 1 7 1)⟩
  | 109 => ⟨BitVec.ofBool (rowBit rows 1 7 2)⟩
  | 110 => ⟨BitVec.ofBool (rowBit rows 1 7 3)⟩
  | 111 => ⟨BitVec.ofBool (rowBit rows 1 7 4)⟩
  | 112 => ⟨BitVec.ofBool (rowBit rows 1 7 5)⟩
  | 113 => ⟨BitVec.ofBool (rowBit rows 1 7 6)⟩
  | 114 => ⟨BitVec.ofBool (rowBit rows 1 7 7)⟩
  | 115 => ⟨BitVec.ofBool (rowBit rows 1 7 8)⟩
  | 116 => ⟨BitVec.ofBool (rowBit rows 1 7 9)⟩
  | 117 => ⟨BitVec.ofBool (rowBit rows 1 7 10)⟩
  | 118 => ⟨BitVec.ofBool (rowBit rows 1 7 11)⟩
  | 119 => ⟨BitVec.ofBool (rowBit rows 1 7 12)⟩
  | 120 => ⟨BitVec.ofBool (rowBit rows 1 8 0)⟩
  | 121 => ⟨BitVec.ofBool (rowBit rows 1 8 1)⟩
  | 122 => ⟨BitVec.ofBool (rowBit rows 1 8 2)⟩
  | 123 => ⟨BitVec.ofBool (rowBit rows 1 8 3)⟩
  | 124 => ⟨BitVec.ofBool (rowBit rows 1 8 4)⟩
  | 125 => ⟨BitVec.ofBool (rowBit rows 1 8 5)⟩
  | 126 => ⟨BitVec.ofBool (rowBit rows 1 8 6)⟩
  | 127 => ⟨BitVec.ofBool (rowBit rows 1 8 7)⟩
  | 128 => ⟨BitVec.ofBool (rowBit rows 1 8 8)⟩
  | 129 => ⟨BitVec.ofBool (rowBit rows 1 8 9)⟩
  | 130 => ⟨BitVec.ofBool (rowBit rows 1 8 10)⟩
  | 131 => ⟨BitVec.ofBool (rowBit rows 1 8 11)⟩
  | 132 => ⟨BitVec.ofBool (rowBit rows 1 8 12)⟩
  | 133 => ⟨BitVec.ofBool (rowBit rows 1 9 0)⟩
  | 134 => ⟨BitVec.ofBool (rowBit rows 1 9 1)⟩
  | 135 => ⟨BitVec.ofBool (rowBit rows 1 9 2)⟩
  | 136 => ⟨BitVec.ofBool (rowBit rows 1 9 3)⟩
  | 137 => ⟨BitVec.ofBool (rowBit rows 1 9 4)⟩
  | 138 => ⟨BitVec.ofBool (rowBit rows 1 9 5)⟩
  | 139 => ⟨BitVec.ofBool (rowBit rows 1 9 6)⟩
  | 140 => ⟨BitVec.ofBool (rowBit rows 1 9 7)⟩
  | 141 => ⟨BitVec.ofBool (rowBit rows 1 9 8)⟩
  | 142 => ⟨BitVec.ofBool (rowBit rows 1 9 9)⟩
  | 143 => ⟨BitVec.ofBool (rowBit rows 1 9 10)⟩
  | 144 => ⟨BitVec.ofBool (rowBit rows 1 9 11)⟩
  | 145 => ⟨BitVec.ofBool (rowBit rows 1 9 12)⟩
  | 146 => ⟨BitVec.ofBool (rowBit rows 1 10 0)⟩
  | 147 => ⟨BitVec.ofBool (rowBit rows 1 10 1)⟩
  | 148 => ⟨BitVec.ofBool (rowBit rows 1 10 2)⟩
  | 149 => ⟨BitVec.ofBool (rowBit rows 1 10 3)⟩
  | 150 => ⟨BitVec.ofBool (rowBit rows 1 10 4)⟩
  | 151 => ⟨BitVec.ofBool (rowBit rows 1 10 5)⟩
  | 152 => ⟨BitVec.ofBool (rowBit rows 1 10 6)⟩
  | 153 => ⟨BitVec.ofBool (rowBit rows 1 10 7)⟩
  | 154 => ⟨BitVec.ofBool (rowBit rows 1 10 8)⟩
  | 155 => ⟨BitVec.ofBool (rowBit rows 1 10 9)⟩
  | 156 => ⟨BitVec.ofBool (rowBit rows 1 10 10)⟩
  | 157 => ⟨BitVec.ofBool (rowBit rows 1 10 11)⟩
  | 158 => ⟨BitVec.ofBool (rowBit rows 1 10 12)⟩
  | 159 => ⟨BitVec.ofBool (rowBit rows 1 11 0)⟩
  | 160 => ⟨BitVec.ofBool (rowBit rows 1 11 1)⟩
  | 161 => ⟨BitVec.ofBool (rowBit rows 1 11 2)⟩
  | 162 => ⟨BitVec.ofBool (rowBit rows 1 11 3)⟩
  | 163 => ⟨BitVec.ofBool (rowBit rows 1 11 4)⟩
  | 164 => ⟨BitVec.ofBool (rowBit rows 1 11 5)⟩
  | 165 => ⟨BitVec.ofBool (rowBit rows 1 11 6)⟩
  | 166 => ⟨BitVec.ofBool (rowBit rows 1 11 7)⟩
  | 167 => ⟨BitVec.ofBool (rowBit rows 1 11 8)⟩
  | 168 => ⟨BitVec.ofBool (rowBit rows 1 11 9)⟩
  | 169 => ⟨BitVec.ofBool (rowBit rows 1 11 10)⟩
  | 170 => ⟨BitVec.ofBool (rowBit rows 1 11 11)⟩
  | 171 => ⟨BitVec.ofBool (rowBit rows 1 11 12)⟩
  | 172 => ⟨BitVec.ofBool (rowBit rows 1 12 0)⟩
  | 173 => ⟨BitVec.ofBool (rowBit rows 1 12 1)⟩
  | 174 => ⟨BitVec.ofBool (rowBit rows 1 12 2)⟩
  | 175 => ⟨BitVec.ofBool (rowBit rows 1 12 3)⟩
  | 176 => ⟨BitVec.ofBool (rowBit rows 1 12 4)⟩
  | 177 => ⟨BitVec.ofBool (rowBit rows 1 12 5)⟩
  | 178 => ⟨BitVec.ofBool (rowBit rows 1 12 6)⟩
  | 179 => ⟨BitVec.ofBool (rowBit rows 1 12 7)⟩
  | 180 => ⟨BitVec.ofBool (rowBit rows 1 12 8)⟩
  | 181 => ⟨BitVec.ofBool (rowBit rows 1 12 9)⟩
  | 182 => ⟨BitVec.ofBool (rowBit rows 1 12 10)⟩
  | 183 => ⟨BitVec.ofBool (rowBit rows 1 12 11)⟩
  | 184 => ⟨BitVec.ofBool (rowBit rows 1 12 12)⟩
  | 185 => ⟨BitVec.ofBool (rowBit rows 2 0 0)⟩
  | 186 => ⟨BitVec.ofBool (rowBit rows 2 0 1)⟩
  | 187 => ⟨BitVec.ofBool (rowBit rows 2 0 2)⟩
  | 188 => ⟨BitVec.ofBool (rowBit rows 2 0 3)⟩
  | 189 => ⟨BitVec.ofBool (rowBit rows 2 0 4)⟩
  | 190 => ⟨BitVec.ofBool (rowBit rows 2 0 5)⟩
  | 191 => ⟨BitVec.ofBool (rowBit rows 2 0 6)⟩
  | 192 => ⟨BitVec.ofBool (rowBit rows 2 0 7)⟩
  | 193 => ⟨BitVec.ofBool (rowBit rows 2 0 8)⟩
  | 194 => ⟨BitVec.ofBool (rowBit rows 2 0 9)⟩
  | 195 => ⟨BitVec.ofBool (rowBit rows 2 0 10)⟩
  | 196 => ⟨BitVec.ofBool (rowBit rows 2 0 11)⟩
  | 197 => ⟨BitVec.ofBool (rowBit rows 2 0 12)⟩
  | 198 => ⟨BitVec.ofBool (rowBit rows 2 1 0)⟩
  | 199 => ⟨BitVec.ofBool (rowBit rows 2 1 1)⟩
  | 200 => ⟨BitVec.ofBool (rowBit rows 2 1 2)⟩
  | 201 => ⟨BitVec.ofBool (rowBit rows 2 1 3)⟩
  | 202 => ⟨BitVec.ofBool (rowBit rows 2 1 4)⟩
  | 203 => ⟨BitVec.ofBool (rowBit rows 2 1 5)⟩
  | 204 => ⟨BitVec.ofBool (rowBit rows 2 1 6)⟩
  | 205 => ⟨BitVec.ofBool (rowBit rows 2 1 7)⟩
  | 206 => ⟨BitVec.ofBool (rowBit rows 2 1 8)⟩
  | 207 => ⟨BitVec.ofBool (rowBit rows 2 1 9)⟩
  | 208 => ⟨BitVec.ofBool (rowBit rows 2 1 10)⟩
  | 209 => ⟨BitVec.ofBool (rowBit rows 2 1 11)⟩
  | 210 => ⟨BitVec.ofBool (rowBit rows 2 1 12)⟩
  | 211 => ⟨BitVec.ofBool (rowBit rows 2 2 0)⟩
  | 212 => ⟨BitVec.ofBool (rowBit rows 2 2 1)⟩
  | 213 => ⟨BitVec.ofBool (rowBit rows 2 2 2)⟩
  | 214 => ⟨BitVec.ofBool (rowBit rows 2 2 3)⟩
  | 215 => ⟨BitVec.ofBool (rowBit rows 2 2 4)⟩
  | 216 => ⟨BitVec.ofBool (rowBit rows 2 2 5)⟩
  | 217 => ⟨BitVec.ofBool (rowBit rows 2 2 6)⟩
  | 218 => ⟨BitVec.ofBool (rowBit rows 2 2 7)⟩
  | 219 => ⟨BitVec.ofBool (rowBit rows 2 2 8)⟩
  | 220 => ⟨BitVec.ofBool (rowBit rows 2 2 9)⟩
  | 221 => ⟨BitVec.ofBool (rowBit rows 2 2 10)⟩
  | 222 => ⟨BitVec.ofBool (rowBit rows 2 2 11)⟩
  | 223 => ⟨BitVec.ofBool (rowBit rows 2 2 12)⟩
  | 224 => ⟨BitVec.ofBool (rowBit rows 2 3 0)⟩
  | 225 => ⟨BitVec.ofBool (rowBit rows 2 3 1)⟩
  | 226 => ⟨BitVec.ofBool (rowBit rows 2 3 2)⟩
  | 227 => ⟨BitVec.ofBool (rowBit rows 2 3 3)⟩
  | 228 => ⟨BitVec.ofBool (rowBit rows 2 3 4)⟩
  | 229 => ⟨BitVec.ofBool (rowBit rows 2 3 5)⟩
  | 230 => ⟨BitVec.ofBool (rowBit rows 2 3 6)⟩
  | 231 => ⟨BitVec.ofBool (rowBit rows 2 3 7)⟩
  | 232 => ⟨BitVec.ofBool (rowBit rows 2 3 8)⟩
  | 233 => ⟨BitVec.ofBool (rowBit rows 2 3 9)⟩
  | 234 => ⟨BitVec.ofBool (rowBit rows 2 3 10)⟩
  | 235 => ⟨BitVec.ofBool (rowBit rows 2 3 11)⟩
  | 236 => ⟨BitVec.ofBool (rowBit rows 2 3 12)⟩
  | 237 => ⟨BitVec.ofBool (rowBit rows 2 4 0)⟩
  | 238 => ⟨BitVec.ofBool (rowBit rows 2 4 1)⟩
  | 239 => ⟨BitVec.ofBool (rowBit rows 2 4 2)⟩
  | 240 => ⟨BitVec.ofBool (rowBit rows 2 4 3)⟩
  | 241 => ⟨BitVec.ofBool (rowBit rows 2 4 4)⟩
  | 242 => ⟨BitVec.ofBool (rowBit rows 2 4 5)⟩
  | 243 => ⟨BitVec.ofBool (rowBit rows 2 4 6)⟩
  | 244 => ⟨BitVec.ofBool (rowBit rows 2 4 7)⟩
  | 245 => ⟨BitVec.ofBool (rowBit rows 2 4 8)⟩
  | 246 => ⟨BitVec.ofBool (rowBit rows 2 4 9)⟩
  | 247 => ⟨BitVec.ofBool (rowBit rows 2 4 10)⟩
  | 248 => ⟨BitVec.ofBool (rowBit rows 2 4 11)⟩
  | 249 => ⟨BitVec.ofBool (rowBit rows 2 4 12)⟩
  | 250 => ⟨BitVec.ofBool (rowBit rows 2 5 0)⟩
  | 251 => ⟨BitVec.ofBool (rowBit rows 2 5 1)⟩
  | 252 => ⟨BitVec.ofBool (rowBit rows 2 5 2)⟩
  | 253 => ⟨BitVec.ofBool (rowBit rows 2 5 3)⟩
  | 254 => ⟨BitVec.ofBool (rowBit rows 2 5 4)⟩
  | 255 => ⟨BitVec.ofBool (rowBit rows 2 5 5)⟩
  | 256 => ⟨BitVec.ofBool (rowBit rows 2 5 6)⟩
  | 257 => ⟨BitVec.ofBool (rowBit rows 2 5 7)⟩
  | 258 => ⟨BitVec.ofBool (rowBit rows 2 5 8)⟩
  | 259 => ⟨BitVec.ofBool (rowBit rows 2 5 9)⟩
  | 260 => ⟨BitVec.ofBool (rowBit rows 2 5 10)⟩
  | 261 => ⟨BitVec.ofBool (rowBit rows 2 5 11)⟩
  | 262 => ⟨BitVec.ofBool (rowBit rows 2 5 12)⟩
  | 263 => ⟨BitVec.ofBool (rowBit rows 2 6 0)⟩
  | 264 => ⟨BitVec.ofBool (rowBit rows 2 6 1)⟩
  | 265 => ⟨BitVec.ofBool (rowBit rows 2 6 2)⟩
  | 266 => ⟨BitVec.ofBool (rowBit rows 2 6 3)⟩
  | 267 => ⟨BitVec.ofBool (rowBit rows 2 6 4)⟩
  | 268 => ⟨BitVec.ofBool (rowBit rows 2 6 5)⟩
  | 269 => ⟨BitVec.ofBool (rowBit rows 2 6 6)⟩
  | 270 => ⟨BitVec.ofBool (rowBit rows 2 6 7)⟩
  | 271 => ⟨BitVec.ofBool (rowBit rows 2 6 8)⟩
  | 272 => ⟨BitVec.ofBool (rowBit rows 2 6 9)⟩
  | 273 => ⟨BitVec.ofBool (rowBit rows 2 6 10)⟩
  | 274 => ⟨BitVec.ofBool (rowBit rows 2 6 11)⟩
  | 275 => ⟨BitVec.ofBool (rowBit rows 2 6 12)⟩
  | 276 => ⟨BitVec.ofBool (rowBit rows 2 7 0)⟩
  | 277 => ⟨BitVec.ofBool (rowBit rows 2 7 1)⟩
  | 278 => ⟨BitVec.ofBool (rowBit rows 2 7 2)⟩
  | 279 => ⟨BitVec.ofBool (rowBit rows 2 7 3)⟩
  | 280 => ⟨BitVec.ofBool (rowBit rows 2 7 4)⟩
  | 281 => ⟨BitVec.ofBool (rowBit rows 2 7 5)⟩
  | 282 => ⟨BitVec.ofBool (rowBit rows 2 7 6)⟩
  | 283 => ⟨BitVec.ofBool (rowBit rows 2 7 7)⟩
  | 284 => ⟨BitVec.ofBool (rowBit rows 2 7 8)⟩
  | 285 => ⟨BitVec.ofBool (rowBit rows 2 7 9)⟩
  | 286 => ⟨BitVec.ofBool (rowBit rows 2 7 10)⟩
  | 287 => ⟨BitVec.ofBool (rowBit rows 2 7 11)⟩
  | 288 => ⟨BitVec.ofBool (rowBit rows 2 7 12)⟩
  | 289 => ⟨BitVec.ofBool (rowBit rows 2 8 0)⟩
  | 290 => ⟨BitVec.ofBool (rowBit rows 2 8 1)⟩
  | 291 => ⟨BitVec.ofBool (rowBit rows 2 8 2)⟩
  | 292 => ⟨BitVec.ofBool (rowBit rows 2 8 3)⟩
  | 293 => ⟨BitVec.ofBool (rowBit rows 2 8 4)⟩
  | 294 => ⟨BitVec.ofBool (rowBit rows 2 8 5)⟩
  | 295 => ⟨BitVec.ofBool (rowBit rows 2 8 6)⟩
  | 296 => ⟨BitVec.ofBool (rowBit rows 2 8 7)⟩
  | 297 => ⟨BitVec.ofBool (rowBit rows 2 8 8)⟩
  | 298 => ⟨BitVec.ofBool (rowBit rows 2 8 9)⟩
  | 299 => ⟨BitVec.ofBool (rowBit rows 2 8 10)⟩
  | 300 => ⟨BitVec.ofBool (rowBit rows 2 8 11)⟩
  | 301 => ⟨BitVec.ofBool (rowBit rows 2 8 12)⟩
  | 302 => ⟨BitVec.ofBool (rowBit rows 2 9 0)⟩
  | 303 => ⟨BitVec.ofBool (rowBit rows 2 9 1)⟩
  | 304 => ⟨BitVec.ofBool (rowBit rows 2 9 2)⟩
  | 305 => ⟨BitVec.ofBool (rowBit rows 2 9 3)⟩
  | 306 => ⟨BitVec.ofBool (rowBit rows 2 9 4)⟩
  | 307 => ⟨BitVec.ofBool (rowBit rows 2 9 5)⟩
  | 308 => ⟨BitVec.ofBool (rowBit rows 2 9 6)⟩
  | 309 => ⟨BitVec.ofBool (rowBit rows 2 9 7)⟩
  | 310 => ⟨BitVec.ofBool (rowBit rows 2 9 8)⟩
  | 311 => ⟨BitVec.ofBool (rowBit rows 2 9 9)⟩
  | 312 => ⟨BitVec.ofBool (rowBit rows 2 9 10)⟩
  | 313 => ⟨BitVec.ofBool (rowBit rows 2 9 11)⟩
  | 314 => ⟨BitVec.ofBool (rowBit rows 2 9 12)⟩
  | 315 => ⟨BitVec.ofBool (rowBit rows 2 10 0)⟩
  | 316 => ⟨BitVec.ofBool (rowBit rows 2 10 1)⟩
  | 317 => ⟨BitVec.ofBool (rowBit rows 2 10 2)⟩
  | 318 => ⟨BitVec.ofBool (rowBit rows 2 10 3)⟩
  | 319 => ⟨BitVec.ofBool (rowBit rows 2 10 4)⟩
  | 320 => ⟨BitVec.ofBool (rowBit rows 2 10 5)⟩
  | 321 => ⟨BitVec.ofBool (rowBit rows 2 10 6)⟩
  | 322 => ⟨BitVec.ofBool (rowBit rows 2 10 7)⟩
  | 323 => ⟨BitVec.ofBool (rowBit rows 2 10 8)⟩
  | 324 => ⟨BitVec.ofBool (rowBit rows 2 10 9)⟩
  | 325 => ⟨BitVec.ofBool (rowBit rows 2 10 10)⟩
  | 326 => ⟨BitVec.ofBool (rowBit rows 2 10 11)⟩
  | 327 => ⟨BitVec.ofBool (rowBit rows 2 10 12)⟩
  | 328 => ⟨BitVec.ofBool (rowBit rows 2 11 0)⟩
  | 329 => ⟨BitVec.ofBool (rowBit rows 2 11 1)⟩
  | 330 => ⟨BitVec.ofBool (rowBit rows 2 11 2)⟩
  | 331 => ⟨BitVec.ofBool (rowBit rows 2 11 3)⟩
  | 332 => ⟨BitVec.ofBool (rowBit rows 2 11 4)⟩
  | 333 => ⟨BitVec.ofBool (rowBit rows 2 11 5)⟩
  | 334 => ⟨BitVec.ofBool (rowBit rows 2 11 6)⟩
  | 335 => ⟨BitVec.ofBool (rowBit rows 2 11 7)⟩
  | 336 => ⟨BitVec.ofBool (rowBit rows 2 11 8)⟩
  | 337 => ⟨BitVec.ofBool (rowBit rows 2 11 9)⟩
  | 338 => ⟨BitVec.ofBool (rowBit rows 2 11 10)⟩
  | 339 => ⟨BitVec.ofBool (rowBit rows 2 11 11)⟩
  | 340 => ⟨BitVec.ofBool (rowBit rows 2 11 12)⟩
  | 341 => ⟨BitVec.ofBool (rowBit rows 2 12 0)⟩
  | 342 => ⟨BitVec.ofBool (rowBit rows 2 12 1)⟩
  | 343 => ⟨BitVec.ofBool (rowBit rows 2 12 2)⟩
  | 344 => ⟨BitVec.ofBool (rowBit rows 2 12 3)⟩
  | 345 => ⟨BitVec.ofBool (rowBit rows 2 12 4)⟩
  | 346 => ⟨BitVec.ofBool (rowBit rows 2 12 5)⟩
  | 347 => ⟨BitVec.ofBool (rowBit rows 2 12 6)⟩
  | 348 => ⟨BitVec.ofBool (rowBit rows 2 12 7)⟩
  | 349 => ⟨BitVec.ofBool (rowBit rows 2 12 8)⟩
  | 350 => ⟨BitVec.ofBool (rowBit rows 2 12 9)⟩
  | 351 => ⟨BitVec.ofBool (rowBit rows 2 12 10)⟩
  | 352 => ⟨BitVec.ofBool (rowBit rows 2 12 11)⟩
  | 353 => ⟨BitVec.ofBool (rowBit rows 2 12 12)⟩
  | 354 => ⟨BitVec.ofBool (rowBit rows 0 0 0)⟩
  | 355 => ⟨BitVec.ofBool (rowBit rows 0 0 1)⟩
  | 356 => ⟨BitVec.ofBool (rowBit rows 0 0 2)⟩
  | 357 => ⟨BitVec.ofBool (rowBit rows 0 0 3)⟩
  | 358 => ⟨BitVec.ofBool (rowBit rows 0 0 4)⟩
  | 359 => ⟨BitVec.ofBool (rowBit rows 0 0 5)⟩
  | 360 => ⟨BitVec.ofBool (rowBit rows 0 0 6)⟩
  | 361 => ⟨BitVec.ofBool (rowBit rows 0 0 7)⟩
  | 362 => ⟨BitVec.ofBool (rowBit rows 0 0 8)⟩
  | 363 => ⟨BitVec.ofBool (rowBit rows 0 0 9)⟩
  | 364 => ⟨BitVec.ofBool (rowBit rows 0 0 10)⟩
  | 365 => ⟨BitVec.ofBool (rowBit rows 0 0 11)⟩
  | 366 => ⟨BitVec.ofBool (rowBit rows 0 0 12)⟩
  | 367 => ⟨BitVec.ofBool (rowBit rows 0 1 0)⟩
  | 368 => ⟨BitVec.ofBool (rowBit rows 0 1 1)⟩
  | 369 => ⟨BitVec.ofBool (rowBit rows 0 1 2)⟩
  | 370 => ⟨BitVec.ofBool (rowBit rows 0 1 3)⟩
  | 371 => ⟨BitVec.ofBool (rowBit rows 0 1 4)⟩
  | 372 => ⟨BitVec.ofBool (rowBit rows 0 1 5)⟩
  | 373 => ⟨BitVec.ofBool (rowBit rows 0 1 6)⟩
  | 374 => ⟨BitVec.ofBool (rowBit rows 0 1 7)⟩
  | 375 => ⟨BitVec.ofBool (rowBit rows 0 1 8)⟩
  | 376 => ⟨BitVec.ofBool (rowBit rows 0 1 9)⟩
  | 377 => ⟨BitVec.ofBool (rowBit rows 0 1 10)⟩
  | 378 => ⟨BitVec.ofBool (rowBit rows 0 1 11)⟩
  | 379 => ⟨BitVec.ofBool (rowBit rows 0 1 12)⟩
  | 380 => ⟨BitVec.ofBool (rowBit rows 0 2 0)⟩
  | 381 => ⟨BitVec.ofBool (rowBit rows 0 2 1)⟩
  | 382 => ⟨BitVec.ofBool (rowBit rows 0 2 2)⟩
  | 383 => ⟨BitVec.ofBool (rowBit rows 0 2 3)⟩
  | 384 => ⟨BitVec.ofBool (rowBit rows 0 2 4)⟩
  | 385 => ⟨BitVec.ofBool (rowBit rows 0 2 5)⟩
  | 386 => ⟨BitVec.ofBool (rowBit rows 0 2 6)⟩
  | 387 => ⟨BitVec.ofBool (rowBit rows 0 2 7)⟩
  | 388 => ⟨BitVec.ofBool (rowBit rows 0 2 8)⟩
  | 389 => ⟨BitVec.ofBool (rowBit rows 0 2 9)⟩
  | 390 => ⟨BitVec.ofBool (rowBit rows 0 2 10)⟩
  | 391 => ⟨BitVec.ofBool (rowBit rows 0 2 11)⟩
  | 392 => ⟨BitVec.ofBool (rowBit rows 0 2 12)⟩
  | 393 => ⟨BitVec.ofBool (rowBit rows 0 3 0)⟩
  | 394 => ⟨BitVec.ofBool (rowBit rows 0 3 1)⟩
  | 395 => ⟨BitVec.ofBool (rowBit rows 0 3 2)⟩
  | 396 => ⟨BitVec.ofBool (rowBit rows 0 3 3)⟩
  | 397 => ⟨BitVec.ofBool (rowBit rows 0 3 4)⟩
  | 398 => ⟨BitVec.ofBool (rowBit rows 0 3 5)⟩
  | 399 => ⟨BitVec.ofBool (rowBit rows 0 3 6)⟩
  | 400 => ⟨BitVec.ofBool (rowBit rows 0 3 7)⟩
  | 401 => ⟨BitVec.ofBool (rowBit rows 0 3 8)⟩
  | 402 => ⟨BitVec.ofBool (rowBit rows 0 3 9)⟩
  | 403 => ⟨BitVec.ofBool (rowBit rows 0 3 10)⟩
  | 404 => ⟨BitVec.ofBool (rowBit rows 0 3 11)⟩
  | 405 => ⟨BitVec.ofBool (rowBit rows 0 3 12)⟩
  | 406 => ⟨BitVec.ofBool (rowBit rows 0 4 0)⟩
  | 407 => ⟨BitVec.ofBool (rowBit rows 0 4 1)⟩
  | 408 => ⟨BitVec.ofBool (rowBit rows 0 4 2)⟩
  | 409 => ⟨BitVec.ofBool (rowBit rows 0 4 3)⟩
  | 410 => ⟨BitVec.ofBool (rowBit rows 0 4 4)⟩
  | 411 => ⟨BitVec.ofBool (rowBit rows 0 4 5)⟩
  | 412 => ⟨BitVec.ofBool (rowBit rows 0 4 6)⟩
  | 413 => ⟨BitVec.ofBool (rowBit rows 0 4 7)⟩
  | 414 => ⟨BitVec.ofBool (rowBit rows 0 4 8)⟩
  | 415 => ⟨BitVec.ofBool (rowBit rows 0 4 9)⟩
  | 416 => ⟨BitVec.ofBool (rowBit rows 0 4 10)⟩
  | 417 => ⟨BitVec.ofBool (rowBit rows 0 4 11)⟩
  | 418 => ⟨BitVec.ofBool (rowBit rows 0 4 12)⟩
  | 419 => ⟨BitVec.ofBool (rowBit rows 0 5 0)⟩
  | 420 => ⟨BitVec.ofBool (rowBit rows 0 5 1)⟩
  | 421 => ⟨BitVec.ofBool (rowBit rows 0 5 2)⟩
  | 422 => ⟨BitVec.ofBool (rowBit rows 0 5 3)⟩
  | 423 => ⟨BitVec.ofBool (rowBit rows 0 5 4)⟩
  | 424 => ⟨BitVec.ofBool (rowBit rows 0 5 5)⟩
  | 425 => ⟨BitVec.ofBool (rowBit rows 0 5 6)⟩
  | 426 => ⟨BitVec.ofBool (rowBit rows 0 5 7)⟩
  | 427 => ⟨BitVec.ofBool (rowBit rows 0 5 8)⟩
  | 428 => ⟨BitVec.ofBool (rowBit rows 0 5 9)⟩
  | 429 => ⟨BitVec.ofBool (rowBit rows 0 5 10)⟩
  | 430 => ⟨BitVec.ofBool (rowBit rows 0 5 11)⟩
  | 431 => ⟨BitVec.ofBool (rowBit rows 0 5 12)⟩
  | 432 => ⟨BitVec.ofBool (rowBit rows 0 6 0)⟩
  | 433 => ⟨BitVec.ofBool (rowBit rows 0 6 1)⟩
  | 434 => ⟨BitVec.ofBool (rowBit rows 0 6 2)⟩
  | 435 => ⟨BitVec.ofBool (rowBit rows 0 6 3)⟩
  | 436 => ⟨BitVec.ofBool (rowBit rows 0 6 4)⟩
  | 437 => ⟨BitVec.ofBool (rowBit rows 0 6 5)⟩
  | 438 => ⟨BitVec.ofBool (rowBit rows 0 6 6)⟩
  | 439 => ⟨BitVec.ofBool (rowBit rows 0 6 7)⟩
  | 440 => ⟨BitVec.ofBool (rowBit rows 0 6 8)⟩
  | 441 => ⟨BitVec.ofBool (rowBit rows 0 6 9)⟩
  | 442 => ⟨BitVec.ofBool (rowBit rows 0 6 10)⟩
  | 443 => ⟨BitVec.ofBool (rowBit rows 0 6 11)⟩
  | 444 => ⟨BitVec.ofBool (rowBit rows 0 6 12)⟩
  | 445 => ⟨BitVec.ofBool (rowBit rows 0 7 0)⟩
  | 446 => ⟨BitVec.ofBool (rowBit rows 0 7 1)⟩
  | 447 => ⟨BitVec.ofBool (rowBit rows 0 7 2)⟩
  | 448 => ⟨BitVec.ofBool (rowBit rows 0 7 3)⟩
  | 449 => ⟨BitVec.ofBool (rowBit rows 0 7 4)⟩
  | 450 => ⟨BitVec.ofBool (rowBit rows 0 7 5)⟩
  | 451 => ⟨BitVec.ofBool (rowBit rows 0 7 6)⟩
  | 452 => ⟨BitVec.ofBool (rowBit rows 0 7 7)⟩
  | 453 => ⟨BitVec.ofBool (rowBit rows 0 7 8)⟩
  | 454 => ⟨BitVec.ofBool (rowBit rows 0 7 9)⟩
  | 455 => ⟨BitVec.ofBool (rowBit rows 0 7 10)⟩
  | 456 => ⟨BitVec.ofBool (rowBit rows 0 7 11)⟩
  | 457 => ⟨BitVec.ofBool (rowBit rows 0 7 12)⟩
  | 458 => ⟨BitVec.ofBool (rowBit rows 0 8 0)⟩
  | 459 => ⟨BitVec.ofBool (rowBit rows 0 8 1)⟩
  | 460 => ⟨BitVec.ofBool (rowBit rows 0 8 2)⟩
  | 461 => ⟨BitVec.ofBool (rowBit rows 0 8 3)⟩
  | 462 => ⟨BitVec.ofBool (rowBit rows 0 8 4)⟩
  | 463 => ⟨BitVec.ofBool (rowBit rows 0 8 5)⟩
  | 464 => ⟨BitVec.ofBool (rowBit rows 0 8 6)⟩
  | 465 => ⟨BitVec.ofBool (rowBit rows 0 8 7)⟩
  | 466 => ⟨BitVec.ofBool (rowBit rows 0 8 8)⟩
  | 467 => ⟨BitVec.ofBool (rowBit rows 0 8 9)⟩
  | 468 => ⟨BitVec.ofBool (rowBit rows 0 8 10)⟩
  | 469 => ⟨BitVec.ofBool (rowBit rows 0 8 11)⟩
  | 470 => ⟨BitVec.ofBool (rowBit rows 0 8 12)⟩
  | 471 => ⟨BitVec.ofBool (rowBit rows 0 9 0)⟩
  | 472 => ⟨BitVec.ofBool (rowBit rows 0 9 1)⟩
  | 473 => ⟨BitVec.ofBool (rowBit rows 0 9 2)⟩
  | 474 => ⟨BitVec.ofBool (rowBit rows 0 9 3)⟩
  | 475 => ⟨BitVec.ofBool (rowBit rows 0 9 4)⟩
  | 476 => ⟨BitVec.ofBool (rowBit rows 0 9 5)⟩
  | 477 => ⟨BitVec.ofBool (rowBit rows 0 9 6)⟩
  | 478 => ⟨BitVec.ofBool (rowBit rows 0 9 7)⟩
  | 479 => ⟨BitVec.ofBool (rowBit rows 0 9 8)⟩
  | 480 => ⟨BitVec.ofBool (rowBit rows 0 9 9)⟩
  | 481 => ⟨BitVec.ofBool (rowBit rows 0 9 10)⟩
  | 482 => ⟨BitVec.ofBool (rowBit rows 0 9 11)⟩
  | 483 => ⟨BitVec.ofBool (rowBit rows 0 9 12)⟩
  | 484 => ⟨BitVec.ofBool (rowBit rows 0 10 0)⟩
  | 485 => ⟨BitVec.ofBool (rowBit rows 0 10 1)⟩
  | 486 => ⟨BitVec.ofBool (rowBit rows 0 10 2)⟩
  | 487 => ⟨BitVec.ofBool (rowBit rows 0 10 3)⟩
  | 488 => ⟨BitVec.ofBool (rowBit rows 0 10 4)⟩
  | 489 => ⟨BitVec.ofBool (rowBit rows 0 10 5)⟩
  | 490 => ⟨BitVec.ofBool (rowBit rows 0 10 6)⟩
  | 491 => ⟨BitVec.ofBool (rowBit rows 0 10 7)⟩
  | 492 => ⟨BitVec.ofBool (rowBit rows 0 10 8)⟩
  | 493 => ⟨BitVec.ofBool (rowBit rows 0 10 9)⟩
  | 494 => ⟨BitVec.ofBool (rowBit rows 0 10 10)⟩
  | 495 => ⟨BitVec.ofBool (rowBit rows 0 10 11)⟩
  | 496 => ⟨BitVec.ofBool (rowBit rows 0 10 12)⟩
  | 497 => ⟨BitVec.ofBool (rowBit rows 0 11 0)⟩
  | 498 => ⟨BitVec.ofBool (rowBit rows 0 11 1)⟩
  | 499 => ⟨BitVec.ofBool (rowBit rows 0 11 2)⟩
  | 500 => ⟨BitVec.ofBool (rowBit rows 0 11 3)⟩
  | 501 => ⟨BitVec.ofBool (rowBit rows 0 11 4)⟩
  | 502 => ⟨BitVec.ofBool (rowBit rows 0 11 5)⟩
  | 503 => ⟨BitVec.ofBool (rowBit rows 0 11 6)⟩
  | 504 => ⟨BitVec.ofBool (rowBit rows 0 11 7)⟩
  | 505 => ⟨BitVec.ofBool (rowBit rows 0 11 8)⟩
  | 506 => ⟨BitVec.ofBool (rowBit rows 0 11 9)⟩
  | 507 => ⟨BitVec.ofBool (rowBit rows 0 11 10)⟩
  | 508 => ⟨BitVec.ofBool (rowBit rows 0 11 11)⟩
  | 509 => ⟨BitVec.ofBool (rowBit rows 0 11 12)⟩
  | 510 => ⟨BitVec.ofBool (rowBit rows 0 12 0)⟩
  | 511 => ⟨BitVec.ofBool (rowBit rows 0 12 1)⟩
  | 512 => ⟨BitVec.ofBool (rowBit rows 0 12 2)⟩
  | 513 => ⟨BitVec.ofBool (rowBit rows 0 12 3)⟩
  | 514 => ⟨BitVec.ofBool (rowBit rows 0 12 4)⟩
  | 515 => ⟨BitVec.ofBool (rowBit rows 0 12 5)⟩
  | 516 => ⟨BitVec.ofBool (rowBit rows 0 12 6)⟩
  | 517 => ⟨BitVec.ofBool (rowBit rows 0 12 7)⟩
  | 518 => ⟨BitVec.ofBool (rowBit rows 0 12 8)⟩
  | 519 => ⟨BitVec.ofBool (rowBit rows 0 12 9)⟩
  | 520 => ⟨BitVec.ofBool (rowBit rows 0 12 10)⟩
  | 521 => ⟨BitVec.ofBool (rowBit rows 0 12 11)⟩
  | 522 => ⟨BitVec.ofBool (rowBit rows 0 12 12)⟩
  | 523 => ⟨rankAtom ranks 0⟩
  | 524 => ⟨rankAtom ranks 1⟩
  | 525 => ⟨rankAtom ranks 2⟩
  | 526 => ⟨rankAtom ranks 3⟩
  | 527 => ⟨rankAtom ranks 4⟩
  | 528 => ⟨rankAtom ranks 5⟩
  | 529 => ⟨rankAtom ranks 6⟩
  | 530 => ⟨rankAtom ranks 7⟩
  | 531 => ⟨rankAtom ranks 8⟩
  | 532 => ⟨rankAtom ranks 9⟩
  | 533 => ⟨rankAtom ranks 10⟩
  | 534 => ⟨rankAtom ranks 11⟩
  | 535 => ⟨rankAtom ranks 12⟩
  | 536 => ⟨rankAtom ranks 13⟩
  | 537 => ⟨rankAtom ranks 14⟩
  | 538 => ⟨rankAtom ranks 15⟩
  | 539 => ⟨rankAtom ranks 16⟩
  | 540 => ⟨rankAtom ranks 17⟩
  | 541 => ⟨rankAtom ranks 18⟩
  | 542 => ⟨rankAtom ranks 19⟩
  | 543 => ⟨rankAtom ranks 20⟩
  | 544 => ⟨rankAtom ranks 21⟩
  | 545 => ⟨rankAtom ranks 22⟩
  | 546 => ⟨rankAtom ranks 23⟩
  | 547 => ⟨rankAtom ranks 24⟩
  | 548 => ⟨rankAtom ranks 25⟩
  | 549 => ⟨rankAtom ranks 26⟩
  | 550 => ⟨rankAtom ranks 27⟩
  | 551 => ⟨rankAtom ranks 28⟩
  | 552 => ⟨rankAtom ranks 29⟩
  | 553 => ⟨rankAtom ranks 30⟩
  | 554 => ⟨rankAtom ranks 31⟩
  | 555 => ⟨rankAtom ranks 32⟩
  | 556 => ⟨rankAtom ranks 33⟩
  | 557 => ⟨rankAtom ranks 34⟩
  | 558 => ⟨rankAtom ranks 35⟩
  | 559 => ⟨rankAtom ranks 36⟩
  | 560 => ⟨rankAtom ranks 37⟩
  | 561 => ⟨rankAtom ranks 38⟩
  | 562 => ⟨rankAtom ranks 39⟩
  | 563 => ⟨rankAtom ranks 40⟩
  | 564 => ⟨rankAtom ranks 41⟩
  | 565 => ⟨rankAtom ranks 42⟩
  | 566 => ⟨rankAtom ranks 43⟩
  | 567 => ⟨rankAtom ranks 44⟩
  | 568 => ⟨rankAtom ranks 45⟩
  | 569 => ⟨rankAtom ranks 46⟩
  | 570 => ⟨rankAtom ranks 47⟩
  | 571 => ⟨rankAtom ranks 48⟩
  | 572 => ⟨rankAtom ranks 49⟩
  | 573 => ⟨rankAtom ranks 50⟩
  | 574 => ⟨rankAtom ranks 51⟩
  | 575 => ⟨rankAtom ranks 52⟩
  | 576 => ⟨rankAtom ranks 53⟩
  | 577 => ⟨rankAtom ranks 54⟩
  | 578 => ⟨rankAtom ranks 55⟩
  | 579 => ⟨rankAtom ranks 56⟩
  | 580 => ⟨rankAtom ranks 57⟩
  | 581 => ⟨rankAtom ranks 58⟩
  | 582 => ⟨rankAtom ranks 59⟩
  | 583 => ⟨rankAtom ranks 60⟩
  | 584 => ⟨rankAtom ranks 61⟩
  | 585 => ⟨rankAtom ranks 62⟩
  | 586 => ⟨rankAtom ranks 63⟩
  | 587 => ⟨rankAtom ranks 64⟩
  | 588 => ⟨rankAtom ranks 65⟩
  | 589 => ⟨rankAtom ranks 66⟩
  | 590 => ⟨rankAtom ranks 67⟩
  | 591 => ⟨rankAtom ranks 68⟩
  | 592 => ⟨rankAtom ranks 69⟩
  | 593 => ⟨rankAtom ranks 70⟩
  | 594 => ⟨rankAtom ranks 71⟩
  | 595 => ⟨rankAtom ranks 72⟩
  | 596 => ⟨rankAtom ranks 73⟩
  | 597 => ⟨rankAtom ranks 74⟩
  | 598 => ⟨rankAtom ranks 75⟩
  | 599 => ⟨rankAtom ranks 76⟩
  | 600 => ⟨rankAtom ranks 77⟩
  | 601 => ⟨BitVec.ofBool (shellBit shell 0)⟩
  | 602 => ⟨BitVec.ofBool (shellBit shell 1)⟩
  | 603 => ⟨BitVec.ofBool (shellBit shell 2)⟩
  | 604 => ⟨BitVec.ofBool (shellBit shell 3)⟩
  | 605 => ⟨BitVec.ofBool (shellBit shell 4)⟩
  | 606 => ⟨BitVec.ofBool (shellBit shell 5)⟩
  | 607 => ⟨BitVec.ofBool (shellBit shell 6)⟩
  | 608 => ⟨BitVec.ofBool (shellBit shell 7)⟩
  | 609 => ⟨BitVec.ofBool (shellBit shell 8)⟩
  | 610 => ⟨BitVec.ofBool (shellBit shell 9)⟩
  | 611 => ⟨BitVec.ofBool (shellBit shell 10)⟩
  | 612 => ⟨BitVec.ofBool (shellBit shell 11)⟩
  | 613 => ⟨BitVec.ofBool (shellBit shell 12)⟩
  | _ => ⟨0#1⟩

/-- Exact packed assignment consumed by this orbit's BVLogicalExpr. -/
def sourceAssignment
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.Assignment :=
  .branch 307
  (.branch 153
    (.branch 76
      (.branch 38
        (.branch 19
          (.branch 9
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 0)⟩)
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 1)⟩))
                (.branch 3
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 2)⟩)
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 3)⟩)))
              (.branch 6
                (.branch 5
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 4)⟩)
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 5)⟩))
                (.branch 7
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 6)⟩)
                  (.branch 8
                    (.leaf ⟨BitVec.ofBool (firstRowBit b1 7)⟩)
                    (.leaf ⟨BitVec.ofBool (firstRowBit b1 8)⟩)))))
            (.branch 14
              (.branch 11
                (.branch 10
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 9)⟩)
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 10)⟩))
                (.branch 12
                  (.leaf ⟨BitVec.ofBool (firstRowBit b1 11)⟩)
                  (.branch 13
                    (.leaf ⟨BitVec.ofBool (firstRowBit b1 12)⟩)
                    (.leaf ⟨blockerAt blockers 3⟩))))
              (.branch 16
                (.branch 15
                  (.leaf ⟨q⟩)
                  (.leaf ⟨w⟩))
                (.branch 17
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 0)⟩)
                  (.branch 18
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 1)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 2)⟩))))))
          (.branch 28
            (.branch 23
              (.branch 21
                (.branch 20
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 4)⟩))
                (.branch 22
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 6)⟩)))
              (.branch 25
                (.branch 24
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 8)⟩))
                (.branch 26
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 9)⟩)
                  (.branch 27
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 10)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 11)⟩)))))
            (.branch 33
              (.branch 30
                (.branch 29
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 0 12)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 0)⟩))
                (.branch 31
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 1)⟩)
                  (.branch 32
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 2)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 3)⟩))))
              (.branch 35
                (.branch 34
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 5)⟩))
                (.branch 36
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 6)⟩)
                  (.branch 37
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 7)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 8)⟩)))))))
        (.branch 57
          (.branch 47
            (.branch 42
              (.branch 40
                (.branch 39
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 10)⟩))
                (.branch 41
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 1 12)⟩)))
              (.branch 44
                (.branch 43
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 0)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 1)⟩))
                (.branch 45
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 2)⟩)
                  (.branch 46
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 3)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 4)⟩)))))
            (.branch 52
              (.branch 49
                (.branch 48
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 6)⟩))
                (.branch 50
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 7)⟩)
                  (.branch 51
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 8)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 9)⟩))))
              (.branch 54
                (.branch 53
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 11)⟩))
                (.branch 55
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 12)⟩)
                  (.branch 56
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 0)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 1)⟩))))))
          (.branch 66
            (.branch 61
              (.branch 59
                (.branch 58
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 3)⟩))
                (.branch 60
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 5)⟩)))
              (.branch 63
                (.branch 62
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 6)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 7)⟩))
                (.branch 64
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 8)⟩)
                  (.branch 65
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 9)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 10)⟩)))))
            (.branch 71
              (.branch 68
                (.branch 67
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 3 12)⟩))
                (.branch 69
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 0)⟩)
                  (.branch 70
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 1)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 2)⟩))))
              (.branch 73
                (.branch 72
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 4)⟩))
                (.branch 74
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 5)⟩)
                  (.branch 75
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 6)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 7)⟩))))))))
      (.branch 114
        (.branch 95
          (.branch 85
            (.branch 80
              (.branch 78
                (.branch 77
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 9)⟩))
                (.branch 79
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 11)⟩)))
              (.branch 82
                (.branch 81
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 4 12)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 0)⟩))
                (.branch 83
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 1)⟩)
                  (.branch 84
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 2)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 3)⟩)))))
            (.branch 90
              (.branch 87
                (.branch 86
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 5)⟩))
                (.branch 88
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 6)⟩)
                  (.branch 89
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 7)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 8)⟩))))
              (.branch 92
                (.branch 91
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 10)⟩))
                (.branch 93
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 11)⟩)
                  (.branch 94
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 5 12)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 0)⟩))))))
          (.branch 104
            (.branch 99
              (.branch 97
                (.branch 96
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 1)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 2)⟩))
                (.branch 98
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 4)⟩)))
              (.branch 101
                (.branch 100
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 6)⟩))
                (.branch 102
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 7)⟩)
                  (.branch 103
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 8)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 9)⟩)))))
            (.branch 109
              (.branch 106
                (.branch 105
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 11)⟩))
                (.branch 107
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 12)⟩)
                  (.branch 108
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 0)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 1)⟩))))
              (.branch 111
                (.branch 110
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 3)⟩))
                (.branch 112
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 4)⟩)
                  (.branch 113
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 5)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 6)⟩)))))))
        (.branch 133
          (.branch 123
            (.branch 118
              (.branch 116
                (.branch 115
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 8)⟩))
                (.branch 117
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 10)⟩)))
              (.branch 120
                (.branch 119
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 7 12)⟩))
                (.branch 121
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 0)⟩)
                  (.branch 122
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 1)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 2)⟩)))))
            (.branch 128
              (.branch 125
                (.branch 124
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 4)⟩))
                (.branch 126
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 5)⟩)
                  (.branch 127
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 6)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 7)⟩))))
              (.branch 130
                (.branch 129
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 9)⟩))
                (.branch 131
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 10)⟩)
                  (.branch 132
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 11)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 8 12)⟩))))))
          (.branch 143
            (.branch 138
              (.branch 135
                (.branch 134
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 0)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 1)⟩))
                (.branch 136
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 2)⟩)
                  (.branch 137
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 3)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 4)⟩))))
              (.branch 140
                (.branch 139
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 6)⟩))
                (.branch 141
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 7)⟩)
                  (.branch 142
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 8)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 9)⟩)))))
            (.branch 148
              (.branch 145
                (.branch 144
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 11)⟩))
                (.branch 146
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 9 12)⟩)
                  (.branch 147
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 0)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 1)⟩))))
              (.branch 150
                (.branch 149
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 3)⟩))
                (.branch 151
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 4)⟩)
                  (.branch 152
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 5)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 6)⟩)))))))))
    (.branch 230
      (.branch 191
        (.branch 172
          (.branch 162
            (.branch 157
              (.branch 155
                (.branch 154
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 8)⟩))
                (.branch 156
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 10)⟩)))
              (.branch 159
                (.branch 158
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 10 12)⟩))
                (.branch 160
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 0)⟩)
                  (.branch 161
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 1)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 2)⟩)))))
            (.branch 167
              (.branch 164
                (.branch 163
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 4)⟩))
                (.branch 165
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 5)⟩)
                  (.branch 166
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 6)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 7)⟩))))
              (.branch 169
                (.branch 168
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 9)⟩))
                (.branch 170
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 10)⟩)
                  (.branch 171
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 11)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 11 12)⟩))))))
          (.branch 181
            (.branch 176
              (.branch 174
                (.branch 173
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 0)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 1)⟩))
                (.branch 175
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 3)⟩)))
              (.branch 178
                (.branch 177
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 5)⟩))
                (.branch 179
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 6)⟩)
                  (.branch 180
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 7)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 8)⟩)))))
            (.branch 186
              (.branch 183
                (.branch 182
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 10)⟩))
                (.branch 184
                  (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 11)⟩)
                  (.branch 185
                    (.leaf ⟨BitVec.ofBool (rowBit rows 1 12 12)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 0)⟩))))
              (.branch 188
                (.branch 187
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 1)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 2)⟩))
                (.branch 189
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 3)⟩)
                  (.branch 190
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 4)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 5)⟩)))))))
        (.branch 210
          (.branch 200
            (.branch 195
              (.branch 193
                (.branch 192
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 6)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 7)⟩))
                (.branch 194
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 9)⟩)))
              (.branch 197
                (.branch 196
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 11)⟩))
                (.branch 198
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 0 12)⟩)
                  (.branch 199
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 0)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 1)⟩)))))
            (.branch 205
              (.branch 202
                (.branch 201
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 3)⟩))
                (.branch 203
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 4)⟩)
                  (.branch 204
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 5)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 6)⟩))))
              (.branch 207
                (.branch 206
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 8)⟩))
                (.branch 208
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 9)⟩)
                  (.branch 209
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 10)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 11)⟩))))))
          (.branch 220
            (.branch 215
              (.branch 212
                (.branch 211
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 1 12)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 0)⟩))
                (.branch 213
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 1)⟩)
                  (.branch 214
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 2)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 3)⟩))))
              (.branch 217
                (.branch 216
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 5)⟩))
                (.branch 218
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 6)⟩)
                  (.branch 219
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 7)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 8)⟩)))))
            (.branch 225
              (.branch 222
                (.branch 221
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 10)⟩))
                (.branch 223
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 11)⟩)
                  (.branch 224
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 2 12)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 0)⟩))))
              (.branch 227
                (.branch 226
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 1)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 2)⟩))
                (.branch 228
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 3)⟩)
                  (.branch 229
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 4)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 5)⟩))))))))
      (.branch 268
        (.branch 249
          (.branch 239
            (.branch 234
              (.branch 232
                (.branch 231
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 6)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 7)⟩))
                (.branch 233
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 9)⟩)))
              (.branch 236
                (.branch 235
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 11)⟩))
                (.branch 237
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 3 12)⟩)
                  (.branch 238
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 0)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 1)⟩)))))
            (.branch 244
              (.branch 241
                (.branch 240
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 3)⟩))
                (.branch 242
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 4)⟩)
                  (.branch 243
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 5)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 6)⟩))))
              (.branch 246
                (.branch 245
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 8)⟩))
                (.branch 247
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 9)⟩)
                  (.branch 248
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 10)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 11)⟩))))))
          (.branch 258
            (.branch 253
              (.branch 251
                (.branch 250
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 4 12)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 0)⟩))
                (.branch 252
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 1)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 2)⟩)))
              (.branch 255
                (.branch 254
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 4)⟩))
                (.branch 256
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 5)⟩)
                  (.branch 257
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 6)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 7)⟩)))))
            (.branch 263
              (.branch 260
                (.branch 259
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 9)⟩))
                (.branch 261
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 10)⟩)
                  (.branch 262
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 11)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 12)⟩))))
              (.branch 265
                (.branch 264
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 0)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 1)⟩))
                (.branch 266
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 2)⟩)
                  (.branch 267
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 3)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 4)⟩)))))))
        (.branch 287
          (.branch 277
            (.branch 272
              (.branch 270
                (.branch 269
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 6)⟩))
                (.branch 271
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 8)⟩)))
              (.branch 274
                (.branch 273
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 10)⟩))
                (.branch 275
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 11)⟩)
                  (.branch 276
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 6 12)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 0)⟩)))))
            (.branch 282
              (.branch 279
                (.branch 278
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 1)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 2)⟩))
                (.branch 280
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 3)⟩)
                  (.branch 281
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 4)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 5)⟩))))
              (.branch 284
                (.branch 283
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 6)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 7)⟩))
                (.branch 285
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 8)⟩)
                  (.branch 286
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 9)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 10)⟩))))))
          (.branch 297
            (.branch 292
              (.branch 289
                (.branch 288
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 7 12)⟩))
                (.branch 290
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 0)⟩)
                  (.branch 291
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 1)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 2)⟩))))
              (.branch 294
                (.branch 293
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 4)⟩))
                (.branch 295
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 5)⟩)
                  (.branch 296
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 6)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 7)⟩)))))
            (.branch 302
              (.branch 299
                (.branch 298
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 9)⟩))
                (.branch 300
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 10)⟩)
                  (.branch 301
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 11)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 8 12)⟩))))
              (.branch 304
                (.branch 303
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 0)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 1)⟩))
                (.branch 305
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 2)⟩)
                  (.branch 306
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 3)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 4)⟩))))))))))
  (.branch 460
    (.branch 383
      (.branch 345
        (.branch 326
          (.branch 316
            (.branch 311
              (.branch 309
                (.branch 308
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 6)⟩))
                (.branch 310
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 8)⟩)))
              (.branch 313
                (.branch 312
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 10)⟩))
                (.branch 314
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 11)⟩)
                  (.branch 315
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 9 12)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 0)⟩)))))
            (.branch 321
              (.branch 318
                (.branch 317
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 1)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 2)⟩))
                (.branch 319
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 3)⟩)
                  (.branch 320
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 4)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 5)⟩))))
              (.branch 323
                (.branch 322
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 6)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 7)⟩))
                (.branch 324
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 8)⟩)
                  (.branch 325
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 9)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 10)⟩))))))
          (.branch 335
            (.branch 330
              (.branch 328
                (.branch 327
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 10 12)⟩))
                (.branch 329
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 0)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 1)⟩)))
              (.branch 332
                (.branch 331
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 3)⟩))
                (.branch 333
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 4)⟩)
                  (.branch 334
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 5)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 6)⟩)))))
            (.branch 340
              (.branch 337
                (.branch 336
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 8)⟩))
                (.branch 338
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 9)⟩)
                  (.branch 339
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 10)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 11)⟩))))
              (.branch 342
                (.branch 341
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 11 12)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 0)⟩))
                (.branch 343
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 1)⟩)
                  (.branch 344
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 2)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 3)⟩)))))))
        (.branch 364
          (.branch 354
            (.branch 349
              (.branch 347
                (.branch 346
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 5)⟩))
                (.branch 348
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 6)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 7)⟩)))
              (.branch 351
                (.branch 350
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 9)⟩))
                (.branch 352
                  (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 10)⟩)
                  (.branch 353
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 11)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 2 12 12)⟩)))))
            (.branch 359
              (.branch 356
                (.branch 355
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 0)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 1)⟩))
                (.branch 357
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 2)⟩)
                  (.branch 358
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 3)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 4)⟩))))
              (.branch 361
                (.branch 360
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 6)⟩))
                (.branch 362
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 7)⟩)
                  (.branch 363
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 8)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 9)⟩))))))
          (.branch 373
            (.branch 368
              (.branch 366
                (.branch 365
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 11)⟩))
                (.branch 367
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 12)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 0)⟩)))
              (.branch 370
                (.branch 369
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 1)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 2)⟩))
                (.branch 371
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 3)⟩)
                  (.branch 372
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 4)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 5)⟩)))))
            (.branch 378
              (.branch 375
                (.branch 374
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 6)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 7)⟩))
                (.branch 376
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 8)⟩)
                  (.branch 377
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 9)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 10)⟩))))
              (.branch 380
                (.branch 379
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 1 12)⟩))
                (.branch 381
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 0)⟩)
                  (.branch 382
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 1)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 2)⟩))))))))
      (.branch 421
        (.branch 402
          (.branch 392
            (.branch 387
              (.branch 385
                (.branch 384
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 4)⟩))
                (.branch 386
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 6)⟩)))
              (.branch 389
                (.branch 388
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 8)⟩))
                (.branch 390
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 9)⟩)
                  (.branch 391
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 10)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 11)⟩)))))
            (.branch 397
              (.branch 394
                (.branch 393
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 12)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 0)⟩))
                (.branch 395
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 1)⟩)
                  (.branch 396
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 2)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 3)⟩))))
              (.branch 399
                (.branch 398
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 5)⟩))
                (.branch 400
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 6)⟩)
                  (.branch 401
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 7)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 8)⟩))))))
          (.branch 411
            (.branch 406
              (.branch 404
                (.branch 403
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 10)⟩))
                (.branch 405
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 3 12)⟩)))
              (.branch 408
                (.branch 407
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 0)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 1)⟩))
                (.branch 409
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 2)⟩)
                  (.branch 410
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 3)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 4)⟩)))))
            (.branch 416
              (.branch 413
                (.branch 412
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 6)⟩))
                (.branch 414
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 7)⟩)
                  (.branch 415
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 8)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 9)⟩))))
              (.branch 418
                (.branch 417
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 11)⟩))
                (.branch 419
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 12)⟩)
                  (.branch 420
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 0)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 1)⟩)))))))
        (.branch 440
          (.branch 430
            (.branch 425
              (.branch 423
                (.branch 422
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 3)⟩))
                (.branch 424
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 5)⟩)))
              (.branch 427
                (.branch 426
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 6)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 7)⟩))
                (.branch 428
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 8)⟩)
                  (.branch 429
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 9)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 10)⟩)))))
            (.branch 435
              (.branch 432
                (.branch 431
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 5 12)⟩))
                (.branch 433
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 0)⟩)
                  (.branch 434
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 1)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 2)⟩))))
              (.branch 437
                (.branch 436
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 4)⟩))
                (.branch 438
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 5)⟩)
                  (.branch 439
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 6)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 7)⟩))))))
          (.branch 450
            (.branch 445
              (.branch 442
                (.branch 441
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 9)⟩))
                (.branch 443
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 10)⟩)
                  (.branch 444
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 11)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 6 12)⟩))))
              (.branch 447
                (.branch 446
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 0)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 1)⟩))
                (.branch 448
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 2)⟩)
                  (.branch 449
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 3)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 4)⟩)))))
            (.branch 455
              (.branch 452
                (.branch 451
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 6)⟩))
                (.branch 453
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 7)⟩)
                  (.branch 454
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 8)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 9)⟩))))
              (.branch 457
                (.branch 456
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 11)⟩))
                (.branch 458
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 7 12)⟩)
                  (.branch 459
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 0)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 1)⟩)))))))))
    (.branch 537
      (.branch 498
        (.branch 479
          (.branch 469
            (.branch 464
              (.branch 462
                (.branch 461
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 3)⟩))
                (.branch 463
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 5)⟩)))
              (.branch 466
                (.branch 465
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 6)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 7)⟩))
                (.branch 467
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 8)⟩)
                  (.branch 468
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 9)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 10)⟩)))))
            (.branch 474
              (.branch 471
                (.branch 470
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 11)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 8 12)⟩))
                (.branch 472
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 0)⟩)
                  (.branch 473
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 1)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 2)⟩))))
              (.branch 476
                (.branch 475
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 4)⟩))
                (.branch 477
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 5)⟩)
                  (.branch 478
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 6)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 7)⟩))))))
          (.branch 488
            (.branch 483
              (.branch 481
                (.branch 480
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 8)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 9)⟩))
                (.branch 482
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 11)⟩)))
              (.branch 485
                (.branch 484
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 9 12)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 0)⟩))
                (.branch 486
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 1)⟩)
                  (.branch 487
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 2)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 3)⟩)))))
            (.branch 493
              (.branch 490
                (.branch 489
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 4)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 5)⟩))
                (.branch 491
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 6)⟩)
                  (.branch 492
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 7)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 8)⟩))))
              (.branch 495
                (.branch 494
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 9)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 10)⟩))
                (.branch 496
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 11)⟩)
                  (.branch 497
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 10 12)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 0)⟩)))))))
        (.branch 517
          (.branch 507
            (.branch 502
              (.branch 500
                (.branch 499
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 1)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 2)⟩))
                (.branch 501
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 3)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 4)⟩)))
              (.branch 504
                (.branch 503
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 5)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 6)⟩))
                (.branch 505
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 7)⟩)
                  (.branch 506
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 8)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 9)⟩)))))
            (.branch 512
              (.branch 509
                (.branch 508
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 10)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 11)⟩))
                (.branch 510
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 11 12)⟩)
                  (.branch 511
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 0)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 1)⟩))))
              (.branch 514
                (.branch 513
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 2)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 3)⟩))
                (.branch 515
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 4)⟩)
                  (.branch 516
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 5)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 6)⟩))))))
          (.branch 527
            (.branch 522
              (.branch 519
                (.branch 518
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 7)⟩)
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 8)⟩))
                (.branch 520
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 9)⟩)
                  (.branch 521
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 10)⟩)
                    (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 11)⟩))))
              (.branch 524
                (.branch 523
                  (.leaf ⟨BitVec.ofBool (rowBit rows 0 12 12)⟩)
                  (.leaf ⟨rankAtom ranks 0⟩))
                (.branch 525
                  (.leaf ⟨rankAtom ranks 1⟩)
                  (.branch 526
                    (.leaf ⟨rankAtom ranks 2⟩)
                    (.leaf ⟨rankAtom ranks 3⟩)))))
            (.branch 532
              (.branch 529
                (.branch 528
                  (.leaf ⟨rankAtom ranks 4⟩)
                  (.leaf ⟨rankAtom ranks 5⟩))
                (.branch 530
                  (.leaf ⟨rankAtom ranks 6⟩)
                  (.branch 531
                    (.leaf ⟨rankAtom ranks 7⟩)
                    (.leaf ⟨rankAtom ranks 8⟩))))
              (.branch 534
                (.branch 533
                  (.leaf ⟨rankAtom ranks 9⟩)
                  (.leaf ⟨rankAtom ranks 10⟩))
                (.branch 535
                  (.leaf ⟨rankAtom ranks 11⟩)
                  (.branch 536
                    (.leaf ⟨rankAtom ranks 12⟩)
                    (.leaf ⟨rankAtom ranks 13⟩))))))))
      (.branch 575
        (.branch 556
          (.branch 546
            (.branch 541
              (.branch 539
                (.branch 538
                  (.leaf ⟨rankAtom ranks 14⟩)
                  (.leaf ⟨rankAtom ranks 15⟩))
                (.branch 540
                  (.leaf ⟨rankAtom ranks 16⟩)
                  (.leaf ⟨rankAtom ranks 17⟩)))
              (.branch 543
                (.branch 542
                  (.leaf ⟨rankAtom ranks 18⟩)
                  (.leaf ⟨rankAtom ranks 19⟩))
                (.branch 544
                  (.leaf ⟨rankAtom ranks 20⟩)
                  (.branch 545
                    (.leaf ⟨rankAtom ranks 21⟩)
                    (.leaf ⟨rankAtom ranks 22⟩)))))
            (.branch 551
              (.branch 548
                (.branch 547
                  (.leaf ⟨rankAtom ranks 23⟩)
                  (.leaf ⟨rankAtom ranks 24⟩))
                (.branch 549
                  (.leaf ⟨rankAtom ranks 25⟩)
                  (.branch 550
                    (.leaf ⟨rankAtom ranks 26⟩)
                    (.leaf ⟨rankAtom ranks 27⟩))))
              (.branch 553
                (.branch 552
                  (.leaf ⟨rankAtom ranks 28⟩)
                  (.leaf ⟨rankAtom ranks 29⟩))
                (.branch 554
                  (.leaf ⟨rankAtom ranks 30⟩)
                  (.branch 555
                    (.leaf ⟨rankAtom ranks 31⟩)
                    (.leaf ⟨rankAtom ranks 32⟩))))))
          (.branch 565
            (.branch 560
              (.branch 558
                (.branch 557
                  (.leaf ⟨rankAtom ranks 33⟩)
                  (.leaf ⟨rankAtom ranks 34⟩))
                (.branch 559
                  (.leaf ⟨rankAtom ranks 35⟩)
                  (.leaf ⟨rankAtom ranks 36⟩)))
              (.branch 562
                (.branch 561
                  (.leaf ⟨rankAtom ranks 37⟩)
                  (.leaf ⟨rankAtom ranks 38⟩))
                (.branch 563
                  (.leaf ⟨rankAtom ranks 39⟩)
                  (.branch 564
                    (.leaf ⟨rankAtom ranks 40⟩)
                    (.leaf ⟨rankAtom ranks 41⟩)))))
            (.branch 570
              (.branch 567
                (.branch 566
                  (.leaf ⟨rankAtom ranks 42⟩)
                  (.leaf ⟨rankAtom ranks 43⟩))
                (.branch 568
                  (.leaf ⟨rankAtom ranks 44⟩)
                  (.branch 569
                    (.leaf ⟨rankAtom ranks 45⟩)
                    (.leaf ⟨rankAtom ranks 46⟩))))
              (.branch 572
                (.branch 571
                  (.leaf ⟨rankAtom ranks 47⟩)
                  (.leaf ⟨rankAtom ranks 48⟩))
                (.branch 573
                  (.leaf ⟨rankAtom ranks 49⟩)
                  (.branch 574
                    (.leaf ⟨rankAtom ranks 50⟩)
                    (.leaf ⟨rankAtom ranks 51⟩)))))))
        (.branch 594
          (.branch 584
            (.branch 579
              (.branch 577
                (.branch 576
                  (.leaf ⟨rankAtom ranks 52⟩)
                  (.leaf ⟨rankAtom ranks 53⟩))
                (.branch 578
                  (.leaf ⟨rankAtom ranks 54⟩)
                  (.leaf ⟨rankAtom ranks 55⟩)))
              (.branch 581
                (.branch 580
                  (.leaf ⟨rankAtom ranks 56⟩)
                  (.leaf ⟨rankAtom ranks 57⟩))
                (.branch 582
                  (.leaf ⟨rankAtom ranks 58⟩)
                  (.branch 583
                    (.leaf ⟨rankAtom ranks 59⟩)
                    (.leaf ⟨rankAtom ranks 60⟩)))))
            (.branch 589
              (.branch 586
                (.branch 585
                  (.leaf ⟨rankAtom ranks 61⟩)
                  (.leaf ⟨rankAtom ranks 62⟩))
                (.branch 587
                  (.leaf ⟨rankAtom ranks 63⟩)
                  (.branch 588
                    (.leaf ⟨rankAtom ranks 64⟩)
                    (.leaf ⟨rankAtom ranks 65⟩))))
              (.branch 591
                (.branch 590
                  (.leaf ⟨rankAtom ranks 66⟩)
                  (.leaf ⟨rankAtom ranks 67⟩))
                (.branch 592
                  (.leaf ⟨rankAtom ranks 68⟩)
                  (.branch 593
                    (.leaf ⟨rankAtom ranks 69⟩)
                    (.leaf ⟨rankAtom ranks 70⟩))))))
          (.branch 604
            (.branch 599
              (.branch 596
                (.branch 595
                  (.leaf ⟨rankAtom ranks 71⟩)
                  (.leaf ⟨rankAtom ranks 72⟩))
                (.branch 597
                  (.leaf ⟨rankAtom ranks 73⟩)
                  (.branch 598
                    (.leaf ⟨rankAtom ranks 74⟩)
                    (.leaf ⟨rankAtom ranks 75⟩))))
              (.branch 601
                (.branch 600
                  (.leaf ⟨rankAtom ranks 76⟩)
                  (.leaf ⟨rankAtom ranks 77⟩))
                (.branch 602
                  (.leaf ⟨BitVec.ofBool (shellBit shell 0)⟩)
                  (.branch 603
                    (.leaf ⟨BitVec.ofBool (shellBit shell 1)⟩)
                    (.leaf ⟨BitVec.ofBool (shellBit shell 2)⟩)))))
            (.branch 609
              (.branch 606
                (.branch 605
                  (.leaf ⟨BitVec.ofBool (shellBit shell 3)⟩)
                  (.leaf ⟨BitVec.ofBool (shellBit shell 4)⟩))
                (.branch 607
                  (.leaf ⟨BitVec.ofBool (shellBit shell 5)⟩)
                  (.branch 608
                    (.leaf ⟨BitVec.ofBool (shellBit shell 6)⟩)
                    (.leaf ⟨BitVec.ofBool (shellBit shell 7)⟩))))
              (.branch 611
                (.branch 610
                  (.leaf ⟨BitVec.ofBool (shellBit shell 8)⟩)
                  (.leaf ⟨BitVec.ofBool (shellBit shell 9)⟩))
                (.branch 612
                  (.leaf ⟨BitVec.ofBool (shellBit shell 10)⟩)
                  (.branch 613
                    (.leaf ⟨BitVec.ofBool (shellBit shell 11)⟩)
                    (.leaf ⟨BitVec.ofBool (shellBit shell 12)⟩))))))))))

@[simp] theorem sourceAssignment_get_000
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 0 = ⟨BitVec.ofBool (firstRowBit b1 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_001
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 1 = ⟨BitVec.ofBool (firstRowBit b1 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_002
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 2 = ⟨BitVec.ofBool (firstRowBit b1 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_003
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 3 = ⟨BitVec.ofBool (firstRowBit b1 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_004
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 4 = ⟨BitVec.ofBool (firstRowBit b1 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_005
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 5 = ⟨BitVec.ofBool (firstRowBit b1 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_006
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 6 = ⟨BitVec.ofBool (firstRowBit b1 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_007
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 7 = ⟨BitVec.ofBool (firstRowBit b1 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_008
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 8 = ⟨BitVec.ofBool (firstRowBit b1 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_009
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 9 = ⟨BitVec.ofBool (firstRowBit b1 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_010
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 10 = ⟨BitVec.ofBool (firstRowBit b1 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_011
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 11 = ⟨BitVec.ofBool (firstRowBit b1 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_012
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 12 = ⟨BitVec.ofBool (firstRowBit b1 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_013
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 13 = ⟨blockerAt blockers 3⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_014
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 14 = ⟨q⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_015
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 15 = ⟨w⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_016
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 16 = ⟨BitVec.ofBool (rowBit rows 1 0 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_017
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 17 = ⟨BitVec.ofBool (rowBit rows 1 0 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_018
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 18 = ⟨BitVec.ofBool (rowBit rows 1 0 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_019
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 19 = ⟨BitVec.ofBool (rowBit rows 1 0 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_020
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 20 = ⟨BitVec.ofBool (rowBit rows 1 0 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_021
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 21 = ⟨BitVec.ofBool (rowBit rows 1 0 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_022
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 22 = ⟨BitVec.ofBool (rowBit rows 1 0 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_023
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 23 = ⟨BitVec.ofBool (rowBit rows 1 0 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_024
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 24 = ⟨BitVec.ofBool (rowBit rows 1 0 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_025
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 25 = ⟨BitVec.ofBool (rowBit rows 1 0 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_026
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 26 = ⟨BitVec.ofBool (rowBit rows 1 0 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_027
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 27 = ⟨BitVec.ofBool (rowBit rows 1 0 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_028
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 28 = ⟨BitVec.ofBool (rowBit rows 1 0 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_029
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 29 = ⟨BitVec.ofBool (rowBit rows 1 1 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_030
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 30 = ⟨BitVec.ofBool (rowBit rows 1 1 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_031
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 31 = ⟨BitVec.ofBool (rowBit rows 1 1 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_032
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 32 = ⟨BitVec.ofBool (rowBit rows 1 1 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_033
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 33 = ⟨BitVec.ofBool (rowBit rows 1 1 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_034
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 34 = ⟨BitVec.ofBool (rowBit rows 1 1 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_035
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 35 = ⟨BitVec.ofBool (rowBit rows 1 1 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_036
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 36 = ⟨BitVec.ofBool (rowBit rows 1 1 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_037
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 37 = ⟨BitVec.ofBool (rowBit rows 1 1 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_038
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 38 = ⟨BitVec.ofBool (rowBit rows 1 1 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_039
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 39 = ⟨BitVec.ofBool (rowBit rows 1 1 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_040
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 40 = ⟨BitVec.ofBool (rowBit rows 1 1 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_041
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 41 = ⟨BitVec.ofBool (rowBit rows 1 1 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_042
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 42 = ⟨BitVec.ofBool (rowBit rows 1 2 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_043
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 43 = ⟨BitVec.ofBool (rowBit rows 1 2 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_044
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 44 = ⟨BitVec.ofBool (rowBit rows 1 2 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_045
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 45 = ⟨BitVec.ofBool (rowBit rows 1 2 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_046
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 46 = ⟨BitVec.ofBool (rowBit rows 1 2 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_047
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 47 = ⟨BitVec.ofBool (rowBit rows 1 2 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_048
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 48 = ⟨BitVec.ofBool (rowBit rows 1 2 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_049
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 49 = ⟨BitVec.ofBool (rowBit rows 1 2 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_050
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 50 = ⟨BitVec.ofBool (rowBit rows 1 2 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_051
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 51 = ⟨BitVec.ofBool (rowBit rows 1 2 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_052
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 52 = ⟨BitVec.ofBool (rowBit rows 1 2 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_053
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 53 = ⟨BitVec.ofBool (rowBit rows 1 2 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_054
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 54 = ⟨BitVec.ofBool (rowBit rows 1 2 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_055
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 55 = ⟨BitVec.ofBool (rowBit rows 1 3 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_056
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 56 = ⟨BitVec.ofBool (rowBit rows 1 3 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_057
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 57 = ⟨BitVec.ofBool (rowBit rows 1 3 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_058
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 58 = ⟨BitVec.ofBool (rowBit rows 1 3 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_059
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 59 = ⟨BitVec.ofBool (rowBit rows 1 3 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_060
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 60 = ⟨BitVec.ofBool (rowBit rows 1 3 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_061
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 61 = ⟨BitVec.ofBool (rowBit rows 1 3 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_062
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 62 = ⟨BitVec.ofBool (rowBit rows 1 3 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_063
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 63 = ⟨BitVec.ofBool (rowBit rows 1 3 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_064
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 64 = ⟨BitVec.ofBool (rowBit rows 1 3 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_065
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 65 = ⟨BitVec.ofBool (rowBit rows 1 3 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_066
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 66 = ⟨BitVec.ofBool (rowBit rows 1 3 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_067
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 67 = ⟨BitVec.ofBool (rowBit rows 1 3 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_068
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 68 = ⟨BitVec.ofBool (rowBit rows 1 4 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_069
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 69 = ⟨BitVec.ofBool (rowBit rows 1 4 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_070
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 70 = ⟨BitVec.ofBool (rowBit rows 1 4 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_071
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 71 = ⟨BitVec.ofBool (rowBit rows 1 4 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_072
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 72 = ⟨BitVec.ofBool (rowBit rows 1 4 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_073
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 73 = ⟨BitVec.ofBool (rowBit rows 1 4 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_074
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 74 = ⟨BitVec.ofBool (rowBit rows 1 4 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_075
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 75 = ⟨BitVec.ofBool (rowBit rows 1 4 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_076
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 76 = ⟨BitVec.ofBool (rowBit rows 1 4 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_077
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 77 = ⟨BitVec.ofBool (rowBit rows 1 4 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_078
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 78 = ⟨BitVec.ofBool (rowBit rows 1 4 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_079
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 79 = ⟨BitVec.ofBool (rowBit rows 1 4 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_080
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 80 = ⟨BitVec.ofBool (rowBit rows 1 4 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_081
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 81 = ⟨BitVec.ofBool (rowBit rows 1 5 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_082
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 82 = ⟨BitVec.ofBool (rowBit rows 1 5 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_083
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 83 = ⟨BitVec.ofBool (rowBit rows 1 5 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_084
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 84 = ⟨BitVec.ofBool (rowBit rows 1 5 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_085
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 85 = ⟨BitVec.ofBool (rowBit rows 1 5 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_086
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 86 = ⟨BitVec.ofBool (rowBit rows 1 5 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_087
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 87 = ⟨BitVec.ofBool (rowBit rows 1 5 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_088
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 88 = ⟨BitVec.ofBool (rowBit rows 1 5 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_089
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 89 = ⟨BitVec.ofBool (rowBit rows 1 5 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_090
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 90 = ⟨BitVec.ofBool (rowBit rows 1 5 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_091
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 91 = ⟨BitVec.ofBool (rowBit rows 1 5 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_092
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 92 = ⟨BitVec.ofBool (rowBit rows 1 5 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_093
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 93 = ⟨BitVec.ofBool (rowBit rows 1 5 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_094
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 94 = ⟨BitVec.ofBool (rowBit rows 1 6 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_095
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 95 = ⟨BitVec.ofBool (rowBit rows 1 6 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_096
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 96 = ⟨BitVec.ofBool (rowBit rows 1 6 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_097
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 97 = ⟨BitVec.ofBool (rowBit rows 1 6 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_098
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 98 = ⟨BitVec.ofBool (rowBit rows 1 6 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_099
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 99 = ⟨BitVec.ofBool (rowBit rows 1 6 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_100
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 100 = ⟨BitVec.ofBool (rowBit rows 1 6 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_101
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 101 = ⟨BitVec.ofBool (rowBit rows 1 6 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_102
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 102 = ⟨BitVec.ofBool (rowBit rows 1 6 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_103
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 103 = ⟨BitVec.ofBool (rowBit rows 1 6 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_104
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 104 = ⟨BitVec.ofBool (rowBit rows 1 6 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_105
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 105 = ⟨BitVec.ofBool (rowBit rows 1 6 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_106
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 106 = ⟨BitVec.ofBool (rowBit rows 1 6 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_107
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 107 = ⟨BitVec.ofBool (rowBit rows 1 7 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_108
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 108 = ⟨BitVec.ofBool (rowBit rows 1 7 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_109
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 109 = ⟨BitVec.ofBool (rowBit rows 1 7 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_110
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 110 = ⟨BitVec.ofBool (rowBit rows 1 7 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_111
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 111 = ⟨BitVec.ofBool (rowBit rows 1 7 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_112
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 112 = ⟨BitVec.ofBool (rowBit rows 1 7 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_113
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 113 = ⟨BitVec.ofBool (rowBit rows 1 7 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_114
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 114 = ⟨BitVec.ofBool (rowBit rows 1 7 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_115
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 115 = ⟨BitVec.ofBool (rowBit rows 1 7 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_116
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 116 = ⟨BitVec.ofBool (rowBit rows 1 7 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_117
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 117 = ⟨BitVec.ofBool (rowBit rows 1 7 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_118
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 118 = ⟨BitVec.ofBool (rowBit rows 1 7 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_119
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 119 = ⟨BitVec.ofBool (rowBit rows 1 7 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_120
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 120 = ⟨BitVec.ofBool (rowBit rows 1 8 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_121
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 121 = ⟨BitVec.ofBool (rowBit rows 1 8 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_122
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 122 = ⟨BitVec.ofBool (rowBit rows 1 8 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_123
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 123 = ⟨BitVec.ofBool (rowBit rows 1 8 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_124
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 124 = ⟨BitVec.ofBool (rowBit rows 1 8 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_125
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 125 = ⟨BitVec.ofBool (rowBit rows 1 8 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_126
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 126 = ⟨BitVec.ofBool (rowBit rows 1 8 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_127
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 127 = ⟨BitVec.ofBool (rowBit rows 1 8 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_128
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 128 = ⟨BitVec.ofBool (rowBit rows 1 8 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_129
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 129 = ⟨BitVec.ofBool (rowBit rows 1 8 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_130
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 130 = ⟨BitVec.ofBool (rowBit rows 1 8 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_131
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 131 = ⟨BitVec.ofBool (rowBit rows 1 8 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_132
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 132 = ⟨BitVec.ofBool (rowBit rows 1 8 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_133
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 133 = ⟨BitVec.ofBool (rowBit rows 1 9 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_134
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 134 = ⟨BitVec.ofBool (rowBit rows 1 9 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_135
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 135 = ⟨BitVec.ofBool (rowBit rows 1 9 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_136
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 136 = ⟨BitVec.ofBool (rowBit rows 1 9 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_137
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 137 = ⟨BitVec.ofBool (rowBit rows 1 9 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_138
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 138 = ⟨BitVec.ofBool (rowBit rows 1 9 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_139
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 139 = ⟨BitVec.ofBool (rowBit rows 1 9 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_140
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 140 = ⟨BitVec.ofBool (rowBit rows 1 9 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_141
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 141 = ⟨BitVec.ofBool (rowBit rows 1 9 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_142
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 142 = ⟨BitVec.ofBool (rowBit rows 1 9 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_143
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 143 = ⟨BitVec.ofBool (rowBit rows 1 9 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_144
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 144 = ⟨BitVec.ofBool (rowBit rows 1 9 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_145
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 145 = ⟨BitVec.ofBool (rowBit rows 1 9 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_146
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 146 = ⟨BitVec.ofBool (rowBit rows 1 10 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_147
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 147 = ⟨BitVec.ofBool (rowBit rows 1 10 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_148
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 148 = ⟨BitVec.ofBool (rowBit rows 1 10 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_149
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 149 = ⟨BitVec.ofBool (rowBit rows 1 10 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_150
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 150 = ⟨BitVec.ofBool (rowBit rows 1 10 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_151
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 151 = ⟨BitVec.ofBool (rowBit rows 1 10 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_152
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 152 = ⟨BitVec.ofBool (rowBit rows 1 10 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_153
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 153 = ⟨BitVec.ofBool (rowBit rows 1 10 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_154
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 154 = ⟨BitVec.ofBool (rowBit rows 1 10 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_155
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 155 = ⟨BitVec.ofBool (rowBit rows 1 10 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_156
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 156 = ⟨BitVec.ofBool (rowBit rows 1 10 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_157
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 157 = ⟨BitVec.ofBool (rowBit rows 1 10 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_158
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 158 = ⟨BitVec.ofBool (rowBit rows 1 10 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_159
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 159 = ⟨BitVec.ofBool (rowBit rows 1 11 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_160
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 160 = ⟨BitVec.ofBool (rowBit rows 1 11 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_161
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 161 = ⟨BitVec.ofBool (rowBit rows 1 11 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_162
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 162 = ⟨BitVec.ofBool (rowBit rows 1 11 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_163
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 163 = ⟨BitVec.ofBool (rowBit rows 1 11 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_164
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 164 = ⟨BitVec.ofBool (rowBit rows 1 11 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_165
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 165 = ⟨BitVec.ofBool (rowBit rows 1 11 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_166
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 166 = ⟨BitVec.ofBool (rowBit rows 1 11 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_167
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 167 = ⟨BitVec.ofBool (rowBit rows 1 11 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_168
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 168 = ⟨BitVec.ofBool (rowBit rows 1 11 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_169
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 169 = ⟨BitVec.ofBool (rowBit rows 1 11 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_170
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 170 = ⟨BitVec.ofBool (rowBit rows 1 11 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_171
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 171 = ⟨BitVec.ofBool (rowBit rows 1 11 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_172
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 172 = ⟨BitVec.ofBool (rowBit rows 1 12 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_173
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 173 = ⟨BitVec.ofBool (rowBit rows 1 12 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_174
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 174 = ⟨BitVec.ofBool (rowBit rows 1 12 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_175
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 175 = ⟨BitVec.ofBool (rowBit rows 1 12 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_176
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 176 = ⟨BitVec.ofBool (rowBit rows 1 12 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_177
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 177 = ⟨BitVec.ofBool (rowBit rows 1 12 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_178
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 178 = ⟨BitVec.ofBool (rowBit rows 1 12 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_179
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 179 = ⟨BitVec.ofBool (rowBit rows 1 12 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_180
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 180 = ⟨BitVec.ofBool (rowBit rows 1 12 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_181
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 181 = ⟨BitVec.ofBool (rowBit rows 1 12 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_182
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 182 = ⟨BitVec.ofBool (rowBit rows 1 12 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_183
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 183 = ⟨BitVec.ofBool (rowBit rows 1 12 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_184
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 184 = ⟨BitVec.ofBool (rowBit rows 1 12 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_185
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 185 = ⟨BitVec.ofBool (rowBit rows 2 0 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_186
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 186 = ⟨BitVec.ofBool (rowBit rows 2 0 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_187
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 187 = ⟨BitVec.ofBool (rowBit rows 2 0 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_188
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 188 = ⟨BitVec.ofBool (rowBit rows 2 0 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_189
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 189 = ⟨BitVec.ofBool (rowBit rows 2 0 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_190
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 190 = ⟨BitVec.ofBool (rowBit rows 2 0 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_191
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 191 = ⟨BitVec.ofBool (rowBit rows 2 0 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_192
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 192 = ⟨BitVec.ofBool (rowBit rows 2 0 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_193
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 193 = ⟨BitVec.ofBool (rowBit rows 2 0 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_194
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 194 = ⟨BitVec.ofBool (rowBit rows 2 0 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_195
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 195 = ⟨BitVec.ofBool (rowBit rows 2 0 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_196
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 196 = ⟨BitVec.ofBool (rowBit rows 2 0 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_197
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 197 = ⟨BitVec.ofBool (rowBit rows 2 0 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_198
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 198 = ⟨BitVec.ofBool (rowBit rows 2 1 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_199
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 199 = ⟨BitVec.ofBool (rowBit rows 2 1 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_200
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 200 = ⟨BitVec.ofBool (rowBit rows 2 1 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_201
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 201 = ⟨BitVec.ofBool (rowBit rows 2 1 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_202
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 202 = ⟨BitVec.ofBool (rowBit rows 2 1 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_203
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 203 = ⟨BitVec.ofBool (rowBit rows 2 1 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_204
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 204 = ⟨BitVec.ofBool (rowBit rows 2 1 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_205
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 205 = ⟨BitVec.ofBool (rowBit rows 2 1 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_206
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 206 = ⟨BitVec.ofBool (rowBit rows 2 1 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_207
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 207 = ⟨BitVec.ofBool (rowBit rows 2 1 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_208
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 208 = ⟨BitVec.ofBool (rowBit rows 2 1 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_209
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 209 = ⟨BitVec.ofBool (rowBit rows 2 1 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_210
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 210 = ⟨BitVec.ofBool (rowBit rows 2 1 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_211
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 211 = ⟨BitVec.ofBool (rowBit rows 2 2 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_212
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 212 = ⟨BitVec.ofBool (rowBit rows 2 2 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_213
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 213 = ⟨BitVec.ofBool (rowBit rows 2 2 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_214
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 214 = ⟨BitVec.ofBool (rowBit rows 2 2 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_215
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 215 = ⟨BitVec.ofBool (rowBit rows 2 2 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_216
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 216 = ⟨BitVec.ofBool (rowBit rows 2 2 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_217
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 217 = ⟨BitVec.ofBool (rowBit rows 2 2 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_218
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 218 = ⟨BitVec.ofBool (rowBit rows 2 2 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_219
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 219 = ⟨BitVec.ofBool (rowBit rows 2 2 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_220
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 220 = ⟨BitVec.ofBool (rowBit rows 2 2 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_221
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 221 = ⟨BitVec.ofBool (rowBit rows 2 2 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_222
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 222 = ⟨BitVec.ofBool (rowBit rows 2 2 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_223
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 223 = ⟨BitVec.ofBool (rowBit rows 2 2 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_224
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 224 = ⟨BitVec.ofBool (rowBit rows 2 3 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_225
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 225 = ⟨BitVec.ofBool (rowBit rows 2 3 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_226
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 226 = ⟨BitVec.ofBool (rowBit rows 2 3 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_227
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 227 = ⟨BitVec.ofBool (rowBit rows 2 3 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_228
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 228 = ⟨BitVec.ofBool (rowBit rows 2 3 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_229
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 229 = ⟨BitVec.ofBool (rowBit rows 2 3 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_230
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 230 = ⟨BitVec.ofBool (rowBit rows 2 3 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_231
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 231 = ⟨BitVec.ofBool (rowBit rows 2 3 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_232
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 232 = ⟨BitVec.ofBool (rowBit rows 2 3 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_233
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 233 = ⟨BitVec.ofBool (rowBit rows 2 3 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_234
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 234 = ⟨BitVec.ofBool (rowBit rows 2 3 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_235
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 235 = ⟨BitVec.ofBool (rowBit rows 2 3 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_236
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 236 = ⟨BitVec.ofBool (rowBit rows 2 3 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_237
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 237 = ⟨BitVec.ofBool (rowBit rows 2 4 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_238
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 238 = ⟨BitVec.ofBool (rowBit rows 2 4 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_239
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 239 = ⟨BitVec.ofBool (rowBit rows 2 4 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_240
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 240 = ⟨BitVec.ofBool (rowBit rows 2 4 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_241
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 241 = ⟨BitVec.ofBool (rowBit rows 2 4 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_242
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 242 = ⟨BitVec.ofBool (rowBit rows 2 4 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_243
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 243 = ⟨BitVec.ofBool (rowBit rows 2 4 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_244
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 244 = ⟨BitVec.ofBool (rowBit rows 2 4 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_245
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 245 = ⟨BitVec.ofBool (rowBit rows 2 4 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_246
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 246 = ⟨BitVec.ofBool (rowBit rows 2 4 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_247
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 247 = ⟨BitVec.ofBool (rowBit rows 2 4 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_248
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 248 = ⟨BitVec.ofBool (rowBit rows 2 4 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_249
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 249 = ⟨BitVec.ofBool (rowBit rows 2 4 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_250
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 250 = ⟨BitVec.ofBool (rowBit rows 2 5 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_251
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 251 = ⟨BitVec.ofBool (rowBit rows 2 5 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_252
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 252 = ⟨BitVec.ofBool (rowBit rows 2 5 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_253
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 253 = ⟨BitVec.ofBool (rowBit rows 2 5 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_254
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 254 = ⟨BitVec.ofBool (rowBit rows 2 5 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_255
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 255 = ⟨BitVec.ofBool (rowBit rows 2 5 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_256
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 256 = ⟨BitVec.ofBool (rowBit rows 2 5 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_257
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 257 = ⟨BitVec.ofBool (rowBit rows 2 5 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_258
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 258 = ⟨BitVec.ofBool (rowBit rows 2 5 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_259
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 259 = ⟨BitVec.ofBool (rowBit rows 2 5 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_260
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 260 = ⟨BitVec.ofBool (rowBit rows 2 5 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_261
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 261 = ⟨BitVec.ofBool (rowBit rows 2 5 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_262
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 262 = ⟨BitVec.ofBool (rowBit rows 2 5 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_263
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 263 = ⟨BitVec.ofBool (rowBit rows 2 6 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_264
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 264 = ⟨BitVec.ofBool (rowBit rows 2 6 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_265
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 265 = ⟨BitVec.ofBool (rowBit rows 2 6 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_266
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 266 = ⟨BitVec.ofBool (rowBit rows 2 6 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_267
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 267 = ⟨BitVec.ofBool (rowBit rows 2 6 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_268
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 268 = ⟨BitVec.ofBool (rowBit rows 2 6 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_269
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 269 = ⟨BitVec.ofBool (rowBit rows 2 6 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_270
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 270 = ⟨BitVec.ofBool (rowBit rows 2 6 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_271
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 271 = ⟨BitVec.ofBool (rowBit rows 2 6 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_272
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 272 = ⟨BitVec.ofBool (rowBit rows 2 6 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_273
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 273 = ⟨BitVec.ofBool (rowBit rows 2 6 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_274
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 274 = ⟨BitVec.ofBool (rowBit rows 2 6 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_275
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 275 = ⟨BitVec.ofBool (rowBit rows 2 6 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_276
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 276 = ⟨BitVec.ofBool (rowBit rows 2 7 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_277
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 277 = ⟨BitVec.ofBool (rowBit rows 2 7 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_278
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 278 = ⟨BitVec.ofBool (rowBit rows 2 7 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_279
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 279 = ⟨BitVec.ofBool (rowBit rows 2 7 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_280
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 280 = ⟨BitVec.ofBool (rowBit rows 2 7 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_281
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 281 = ⟨BitVec.ofBool (rowBit rows 2 7 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_282
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 282 = ⟨BitVec.ofBool (rowBit rows 2 7 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_283
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 283 = ⟨BitVec.ofBool (rowBit rows 2 7 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_284
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 284 = ⟨BitVec.ofBool (rowBit rows 2 7 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_285
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 285 = ⟨BitVec.ofBool (rowBit rows 2 7 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_286
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 286 = ⟨BitVec.ofBool (rowBit rows 2 7 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_287
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 287 = ⟨BitVec.ofBool (rowBit rows 2 7 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_288
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 288 = ⟨BitVec.ofBool (rowBit rows 2 7 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_289
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 289 = ⟨BitVec.ofBool (rowBit rows 2 8 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_290
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 290 = ⟨BitVec.ofBool (rowBit rows 2 8 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_291
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 291 = ⟨BitVec.ofBool (rowBit rows 2 8 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_292
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 292 = ⟨BitVec.ofBool (rowBit rows 2 8 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_293
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 293 = ⟨BitVec.ofBool (rowBit rows 2 8 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_294
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 294 = ⟨BitVec.ofBool (rowBit rows 2 8 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_295
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 295 = ⟨BitVec.ofBool (rowBit rows 2 8 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_296
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 296 = ⟨BitVec.ofBool (rowBit rows 2 8 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_297
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 297 = ⟨BitVec.ofBool (rowBit rows 2 8 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_298
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 298 = ⟨BitVec.ofBool (rowBit rows 2 8 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_299
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 299 = ⟨BitVec.ofBool (rowBit rows 2 8 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_300
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 300 = ⟨BitVec.ofBool (rowBit rows 2 8 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_301
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 301 = ⟨BitVec.ofBool (rowBit rows 2 8 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_302
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 302 = ⟨BitVec.ofBool (rowBit rows 2 9 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_303
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 303 = ⟨BitVec.ofBool (rowBit rows 2 9 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_304
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 304 = ⟨BitVec.ofBool (rowBit rows 2 9 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_305
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 305 = ⟨BitVec.ofBool (rowBit rows 2 9 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_306
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 306 = ⟨BitVec.ofBool (rowBit rows 2 9 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_307
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 307 = ⟨BitVec.ofBool (rowBit rows 2 9 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_308
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 308 = ⟨BitVec.ofBool (rowBit rows 2 9 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_309
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 309 = ⟨BitVec.ofBool (rowBit rows 2 9 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_310
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 310 = ⟨BitVec.ofBool (rowBit rows 2 9 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_311
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 311 = ⟨BitVec.ofBool (rowBit rows 2 9 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_312
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 312 = ⟨BitVec.ofBool (rowBit rows 2 9 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_313
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 313 = ⟨BitVec.ofBool (rowBit rows 2 9 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_314
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 314 = ⟨BitVec.ofBool (rowBit rows 2 9 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_315
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 315 = ⟨BitVec.ofBool (rowBit rows 2 10 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_316
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 316 = ⟨BitVec.ofBool (rowBit rows 2 10 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_317
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 317 = ⟨BitVec.ofBool (rowBit rows 2 10 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_318
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 318 = ⟨BitVec.ofBool (rowBit rows 2 10 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_319
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 319 = ⟨BitVec.ofBool (rowBit rows 2 10 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_320
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 320 = ⟨BitVec.ofBool (rowBit rows 2 10 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_321
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 321 = ⟨BitVec.ofBool (rowBit rows 2 10 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_322
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 322 = ⟨BitVec.ofBool (rowBit rows 2 10 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_323
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 323 = ⟨BitVec.ofBool (rowBit rows 2 10 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_324
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 324 = ⟨BitVec.ofBool (rowBit rows 2 10 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_325
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 325 = ⟨BitVec.ofBool (rowBit rows 2 10 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_326
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 326 = ⟨BitVec.ofBool (rowBit rows 2 10 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_327
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 327 = ⟨BitVec.ofBool (rowBit rows 2 10 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_328
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 328 = ⟨BitVec.ofBool (rowBit rows 2 11 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_329
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 329 = ⟨BitVec.ofBool (rowBit rows 2 11 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_330
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 330 = ⟨BitVec.ofBool (rowBit rows 2 11 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_331
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 331 = ⟨BitVec.ofBool (rowBit rows 2 11 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_332
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 332 = ⟨BitVec.ofBool (rowBit rows 2 11 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_333
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 333 = ⟨BitVec.ofBool (rowBit rows 2 11 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_334
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 334 = ⟨BitVec.ofBool (rowBit rows 2 11 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_335
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 335 = ⟨BitVec.ofBool (rowBit rows 2 11 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_336
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 336 = ⟨BitVec.ofBool (rowBit rows 2 11 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_337
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 337 = ⟨BitVec.ofBool (rowBit rows 2 11 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_338
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 338 = ⟨BitVec.ofBool (rowBit rows 2 11 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_339
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 339 = ⟨BitVec.ofBool (rowBit rows 2 11 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_340
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 340 = ⟨BitVec.ofBool (rowBit rows 2 11 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_341
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 341 = ⟨BitVec.ofBool (rowBit rows 2 12 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_342
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 342 = ⟨BitVec.ofBool (rowBit rows 2 12 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_343
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 343 = ⟨BitVec.ofBool (rowBit rows 2 12 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_344
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 344 = ⟨BitVec.ofBool (rowBit rows 2 12 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_345
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 345 = ⟨BitVec.ofBool (rowBit rows 2 12 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_346
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 346 = ⟨BitVec.ofBool (rowBit rows 2 12 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_347
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 347 = ⟨BitVec.ofBool (rowBit rows 2 12 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_348
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 348 = ⟨BitVec.ofBool (rowBit rows 2 12 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_349
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 349 = ⟨BitVec.ofBool (rowBit rows 2 12 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_350
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 350 = ⟨BitVec.ofBool (rowBit rows 2 12 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_351
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 351 = ⟨BitVec.ofBool (rowBit rows 2 12 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_352
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 352 = ⟨BitVec.ofBool (rowBit rows 2 12 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_353
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 353 = ⟨BitVec.ofBool (rowBit rows 2 12 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_354
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 354 = ⟨BitVec.ofBool (rowBit rows 0 0 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_355
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 355 = ⟨BitVec.ofBool (rowBit rows 0 0 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_356
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 356 = ⟨BitVec.ofBool (rowBit rows 0 0 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_357
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 357 = ⟨BitVec.ofBool (rowBit rows 0 0 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_358
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 358 = ⟨BitVec.ofBool (rowBit rows 0 0 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_359
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 359 = ⟨BitVec.ofBool (rowBit rows 0 0 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_360
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 360 = ⟨BitVec.ofBool (rowBit rows 0 0 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_361
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 361 = ⟨BitVec.ofBool (rowBit rows 0 0 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_362
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 362 = ⟨BitVec.ofBool (rowBit rows 0 0 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_363
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 363 = ⟨BitVec.ofBool (rowBit rows 0 0 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_364
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 364 = ⟨BitVec.ofBool (rowBit rows 0 0 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_365
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 365 = ⟨BitVec.ofBool (rowBit rows 0 0 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_366
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 366 = ⟨BitVec.ofBool (rowBit rows 0 0 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_367
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 367 = ⟨BitVec.ofBool (rowBit rows 0 1 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_368
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 368 = ⟨BitVec.ofBool (rowBit rows 0 1 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_369
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 369 = ⟨BitVec.ofBool (rowBit rows 0 1 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_370
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 370 = ⟨BitVec.ofBool (rowBit rows 0 1 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_371
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 371 = ⟨BitVec.ofBool (rowBit rows 0 1 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_372
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 372 = ⟨BitVec.ofBool (rowBit rows 0 1 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_373
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 373 = ⟨BitVec.ofBool (rowBit rows 0 1 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_374
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 374 = ⟨BitVec.ofBool (rowBit rows 0 1 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_375
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 375 = ⟨BitVec.ofBool (rowBit rows 0 1 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_376
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 376 = ⟨BitVec.ofBool (rowBit rows 0 1 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_377
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 377 = ⟨BitVec.ofBool (rowBit rows 0 1 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_378
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 378 = ⟨BitVec.ofBool (rowBit rows 0 1 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_379
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 379 = ⟨BitVec.ofBool (rowBit rows 0 1 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_380
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 380 = ⟨BitVec.ofBool (rowBit rows 0 2 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_381
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 381 = ⟨BitVec.ofBool (rowBit rows 0 2 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_382
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 382 = ⟨BitVec.ofBool (rowBit rows 0 2 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_383
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 383 = ⟨BitVec.ofBool (rowBit rows 0 2 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_384
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 384 = ⟨BitVec.ofBool (rowBit rows 0 2 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_385
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 385 = ⟨BitVec.ofBool (rowBit rows 0 2 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_386
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 386 = ⟨BitVec.ofBool (rowBit rows 0 2 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_387
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 387 = ⟨BitVec.ofBool (rowBit rows 0 2 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_388
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 388 = ⟨BitVec.ofBool (rowBit rows 0 2 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_389
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 389 = ⟨BitVec.ofBool (rowBit rows 0 2 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_390
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 390 = ⟨BitVec.ofBool (rowBit rows 0 2 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_391
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 391 = ⟨BitVec.ofBool (rowBit rows 0 2 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_392
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 392 = ⟨BitVec.ofBool (rowBit rows 0 2 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_393
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 393 = ⟨BitVec.ofBool (rowBit rows 0 3 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_394
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 394 = ⟨BitVec.ofBool (rowBit rows 0 3 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_395
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 395 = ⟨BitVec.ofBool (rowBit rows 0 3 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_396
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 396 = ⟨BitVec.ofBool (rowBit rows 0 3 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_397
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 397 = ⟨BitVec.ofBool (rowBit rows 0 3 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_398
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 398 = ⟨BitVec.ofBool (rowBit rows 0 3 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_399
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 399 = ⟨BitVec.ofBool (rowBit rows 0 3 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_400
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 400 = ⟨BitVec.ofBool (rowBit rows 0 3 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_401
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 401 = ⟨BitVec.ofBool (rowBit rows 0 3 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_402
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 402 = ⟨BitVec.ofBool (rowBit rows 0 3 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_403
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 403 = ⟨BitVec.ofBool (rowBit rows 0 3 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_404
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 404 = ⟨BitVec.ofBool (rowBit rows 0 3 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_405
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 405 = ⟨BitVec.ofBool (rowBit rows 0 3 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_406
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 406 = ⟨BitVec.ofBool (rowBit rows 0 4 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_407
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 407 = ⟨BitVec.ofBool (rowBit rows 0 4 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_408
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 408 = ⟨BitVec.ofBool (rowBit rows 0 4 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_409
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 409 = ⟨BitVec.ofBool (rowBit rows 0 4 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_410
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 410 = ⟨BitVec.ofBool (rowBit rows 0 4 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_411
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 411 = ⟨BitVec.ofBool (rowBit rows 0 4 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_412
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 412 = ⟨BitVec.ofBool (rowBit rows 0 4 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_413
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 413 = ⟨BitVec.ofBool (rowBit rows 0 4 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_414
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 414 = ⟨BitVec.ofBool (rowBit rows 0 4 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_415
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 415 = ⟨BitVec.ofBool (rowBit rows 0 4 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_416
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 416 = ⟨BitVec.ofBool (rowBit rows 0 4 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_417
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 417 = ⟨BitVec.ofBool (rowBit rows 0 4 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_418
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 418 = ⟨BitVec.ofBool (rowBit rows 0 4 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_419
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 419 = ⟨BitVec.ofBool (rowBit rows 0 5 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_420
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 420 = ⟨BitVec.ofBool (rowBit rows 0 5 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_421
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 421 = ⟨BitVec.ofBool (rowBit rows 0 5 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_422
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 422 = ⟨BitVec.ofBool (rowBit rows 0 5 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_423
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 423 = ⟨BitVec.ofBool (rowBit rows 0 5 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_424
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 424 = ⟨BitVec.ofBool (rowBit rows 0 5 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_425
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 425 = ⟨BitVec.ofBool (rowBit rows 0 5 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_426
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 426 = ⟨BitVec.ofBool (rowBit rows 0 5 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_427
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 427 = ⟨BitVec.ofBool (rowBit rows 0 5 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_428
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 428 = ⟨BitVec.ofBool (rowBit rows 0 5 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_429
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 429 = ⟨BitVec.ofBool (rowBit rows 0 5 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_430
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 430 = ⟨BitVec.ofBool (rowBit rows 0 5 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_431
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 431 = ⟨BitVec.ofBool (rowBit rows 0 5 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_432
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 432 = ⟨BitVec.ofBool (rowBit rows 0 6 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_433
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 433 = ⟨BitVec.ofBool (rowBit rows 0 6 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_434
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 434 = ⟨BitVec.ofBool (rowBit rows 0 6 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_435
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 435 = ⟨BitVec.ofBool (rowBit rows 0 6 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_436
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 436 = ⟨BitVec.ofBool (rowBit rows 0 6 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_437
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 437 = ⟨BitVec.ofBool (rowBit rows 0 6 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_438
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 438 = ⟨BitVec.ofBool (rowBit rows 0 6 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_439
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 439 = ⟨BitVec.ofBool (rowBit rows 0 6 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_440
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 440 = ⟨BitVec.ofBool (rowBit rows 0 6 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_441
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 441 = ⟨BitVec.ofBool (rowBit rows 0 6 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_442
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 442 = ⟨BitVec.ofBool (rowBit rows 0 6 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_443
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 443 = ⟨BitVec.ofBool (rowBit rows 0 6 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_444
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 444 = ⟨BitVec.ofBool (rowBit rows 0 6 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_445
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 445 = ⟨BitVec.ofBool (rowBit rows 0 7 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_446
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 446 = ⟨BitVec.ofBool (rowBit rows 0 7 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_447
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 447 = ⟨BitVec.ofBool (rowBit rows 0 7 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_448
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 448 = ⟨BitVec.ofBool (rowBit rows 0 7 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_449
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 449 = ⟨BitVec.ofBool (rowBit rows 0 7 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_450
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 450 = ⟨BitVec.ofBool (rowBit rows 0 7 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_451
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 451 = ⟨BitVec.ofBool (rowBit rows 0 7 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_452
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 452 = ⟨BitVec.ofBool (rowBit rows 0 7 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_453
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 453 = ⟨BitVec.ofBool (rowBit rows 0 7 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_454
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 454 = ⟨BitVec.ofBool (rowBit rows 0 7 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_455
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 455 = ⟨BitVec.ofBool (rowBit rows 0 7 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_456
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 456 = ⟨BitVec.ofBool (rowBit rows 0 7 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_457
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 457 = ⟨BitVec.ofBool (rowBit rows 0 7 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_458
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 458 = ⟨BitVec.ofBool (rowBit rows 0 8 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_459
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 459 = ⟨BitVec.ofBool (rowBit rows 0 8 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_460
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 460 = ⟨BitVec.ofBool (rowBit rows 0 8 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_461
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 461 = ⟨BitVec.ofBool (rowBit rows 0 8 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_462
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 462 = ⟨BitVec.ofBool (rowBit rows 0 8 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_463
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 463 = ⟨BitVec.ofBool (rowBit rows 0 8 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_464
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 464 = ⟨BitVec.ofBool (rowBit rows 0 8 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_465
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 465 = ⟨BitVec.ofBool (rowBit rows 0 8 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_466
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 466 = ⟨BitVec.ofBool (rowBit rows 0 8 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_467
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 467 = ⟨BitVec.ofBool (rowBit rows 0 8 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_468
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 468 = ⟨BitVec.ofBool (rowBit rows 0 8 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_469
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 469 = ⟨BitVec.ofBool (rowBit rows 0 8 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_470
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 470 = ⟨BitVec.ofBool (rowBit rows 0 8 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_471
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 471 = ⟨BitVec.ofBool (rowBit rows 0 9 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_472
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 472 = ⟨BitVec.ofBool (rowBit rows 0 9 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_473
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 473 = ⟨BitVec.ofBool (rowBit rows 0 9 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_474
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 474 = ⟨BitVec.ofBool (rowBit rows 0 9 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_475
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 475 = ⟨BitVec.ofBool (rowBit rows 0 9 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_476
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 476 = ⟨BitVec.ofBool (rowBit rows 0 9 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_477
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 477 = ⟨BitVec.ofBool (rowBit rows 0 9 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_478
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 478 = ⟨BitVec.ofBool (rowBit rows 0 9 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_479
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 479 = ⟨BitVec.ofBool (rowBit rows 0 9 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_480
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 480 = ⟨BitVec.ofBool (rowBit rows 0 9 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_481
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 481 = ⟨BitVec.ofBool (rowBit rows 0 9 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_482
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 482 = ⟨BitVec.ofBool (rowBit rows 0 9 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_483
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 483 = ⟨BitVec.ofBool (rowBit rows 0 9 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_484
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 484 = ⟨BitVec.ofBool (rowBit rows 0 10 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_485
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 485 = ⟨BitVec.ofBool (rowBit rows 0 10 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_486
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 486 = ⟨BitVec.ofBool (rowBit rows 0 10 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_487
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 487 = ⟨BitVec.ofBool (rowBit rows 0 10 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_488
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 488 = ⟨BitVec.ofBool (rowBit rows 0 10 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_489
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 489 = ⟨BitVec.ofBool (rowBit rows 0 10 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_490
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 490 = ⟨BitVec.ofBool (rowBit rows 0 10 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_491
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 491 = ⟨BitVec.ofBool (rowBit rows 0 10 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_492
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 492 = ⟨BitVec.ofBool (rowBit rows 0 10 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_493
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 493 = ⟨BitVec.ofBool (rowBit rows 0 10 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_494
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 494 = ⟨BitVec.ofBool (rowBit rows 0 10 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_495
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 495 = ⟨BitVec.ofBool (rowBit rows 0 10 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_496
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 496 = ⟨BitVec.ofBool (rowBit rows 0 10 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_497
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 497 = ⟨BitVec.ofBool (rowBit rows 0 11 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_498
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 498 = ⟨BitVec.ofBool (rowBit rows 0 11 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_499
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 499 = ⟨BitVec.ofBool (rowBit rows 0 11 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_500
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 500 = ⟨BitVec.ofBool (rowBit rows 0 11 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_501
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 501 = ⟨BitVec.ofBool (rowBit rows 0 11 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_502
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 502 = ⟨BitVec.ofBool (rowBit rows 0 11 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_503
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 503 = ⟨BitVec.ofBool (rowBit rows 0 11 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_504
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 504 = ⟨BitVec.ofBool (rowBit rows 0 11 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_505
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 505 = ⟨BitVec.ofBool (rowBit rows 0 11 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_506
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 506 = ⟨BitVec.ofBool (rowBit rows 0 11 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_507
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 507 = ⟨BitVec.ofBool (rowBit rows 0 11 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_508
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 508 = ⟨BitVec.ofBool (rowBit rows 0 11 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_509
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 509 = ⟨BitVec.ofBool (rowBit rows 0 11 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_510
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 510 = ⟨BitVec.ofBool (rowBit rows 0 12 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_511
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 511 = ⟨BitVec.ofBool (rowBit rows 0 12 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_512
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 512 = ⟨BitVec.ofBool (rowBit rows 0 12 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_513
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 513 = ⟨BitVec.ofBool (rowBit rows 0 12 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_514
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 514 = ⟨BitVec.ofBool (rowBit rows 0 12 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_515
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 515 = ⟨BitVec.ofBool (rowBit rows 0 12 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_516
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 516 = ⟨BitVec.ofBool (rowBit rows 0 12 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_517
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 517 = ⟨BitVec.ofBool (rowBit rows 0 12 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_518
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 518 = ⟨BitVec.ofBool (rowBit rows 0 12 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_519
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 519 = ⟨BitVec.ofBool (rowBit rows 0 12 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_520
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 520 = ⟨BitVec.ofBool (rowBit rows 0 12 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_521
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 521 = ⟨BitVec.ofBool (rowBit rows 0 12 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_522
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 522 = ⟨BitVec.ofBool (rowBit rows 0 12 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_523
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 523 = ⟨rankAtom ranks 0⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_524
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 524 = ⟨rankAtom ranks 1⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_525
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 525 = ⟨rankAtom ranks 2⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_526
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 526 = ⟨rankAtom ranks 3⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_527
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 527 = ⟨rankAtom ranks 4⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_528
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 528 = ⟨rankAtom ranks 5⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_529
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 529 = ⟨rankAtom ranks 6⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_530
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 530 = ⟨rankAtom ranks 7⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_531
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 531 = ⟨rankAtom ranks 8⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_532
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 532 = ⟨rankAtom ranks 9⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_533
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 533 = ⟨rankAtom ranks 10⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_534
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 534 = ⟨rankAtom ranks 11⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_535
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 535 = ⟨rankAtom ranks 12⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_536
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 536 = ⟨rankAtom ranks 13⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_537
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 537 = ⟨rankAtom ranks 14⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_538
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 538 = ⟨rankAtom ranks 15⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_539
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 539 = ⟨rankAtom ranks 16⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_540
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 540 = ⟨rankAtom ranks 17⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_541
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 541 = ⟨rankAtom ranks 18⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_542
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 542 = ⟨rankAtom ranks 19⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_543
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 543 = ⟨rankAtom ranks 20⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_544
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 544 = ⟨rankAtom ranks 21⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_545
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 545 = ⟨rankAtom ranks 22⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_546
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 546 = ⟨rankAtom ranks 23⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_547
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 547 = ⟨rankAtom ranks 24⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_548
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 548 = ⟨rankAtom ranks 25⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_549
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 549 = ⟨rankAtom ranks 26⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_550
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 550 = ⟨rankAtom ranks 27⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_551
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 551 = ⟨rankAtom ranks 28⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_552
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 552 = ⟨rankAtom ranks 29⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_553
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 553 = ⟨rankAtom ranks 30⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_554
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 554 = ⟨rankAtom ranks 31⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_555
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 555 = ⟨rankAtom ranks 32⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_556
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 556 = ⟨rankAtom ranks 33⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_557
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 557 = ⟨rankAtom ranks 34⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_558
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 558 = ⟨rankAtom ranks 35⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_559
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 559 = ⟨rankAtom ranks 36⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_560
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 560 = ⟨rankAtom ranks 37⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_561
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 561 = ⟨rankAtom ranks 38⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_562
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 562 = ⟨rankAtom ranks 39⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_563
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 563 = ⟨rankAtom ranks 40⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_564
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 564 = ⟨rankAtom ranks 41⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_565
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 565 = ⟨rankAtom ranks 42⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_566
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 566 = ⟨rankAtom ranks 43⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_567
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 567 = ⟨rankAtom ranks 44⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_568
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 568 = ⟨rankAtom ranks 45⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_569
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 569 = ⟨rankAtom ranks 46⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_570
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 570 = ⟨rankAtom ranks 47⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_571
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 571 = ⟨rankAtom ranks 48⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_572
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 572 = ⟨rankAtom ranks 49⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_573
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 573 = ⟨rankAtom ranks 50⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_574
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 574 = ⟨rankAtom ranks 51⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_575
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 575 = ⟨rankAtom ranks 52⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_576
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 576 = ⟨rankAtom ranks 53⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_577
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 577 = ⟨rankAtom ranks 54⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_578
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 578 = ⟨rankAtom ranks 55⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_579
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 579 = ⟨rankAtom ranks 56⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_580
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 580 = ⟨rankAtom ranks 57⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_581
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 581 = ⟨rankAtom ranks 58⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_582
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 582 = ⟨rankAtom ranks 59⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_583
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 583 = ⟨rankAtom ranks 60⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_584
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 584 = ⟨rankAtom ranks 61⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_585
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 585 = ⟨rankAtom ranks 62⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_586
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 586 = ⟨rankAtom ranks 63⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_587
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 587 = ⟨rankAtom ranks 64⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_588
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 588 = ⟨rankAtom ranks 65⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_589
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 589 = ⟨rankAtom ranks 66⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_590
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 590 = ⟨rankAtom ranks 67⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_591
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 591 = ⟨rankAtom ranks 68⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_592
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 592 = ⟨rankAtom ranks 69⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_593
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 593 = ⟨rankAtom ranks 70⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_594
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 594 = ⟨rankAtom ranks 71⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_595
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 595 = ⟨rankAtom ranks 72⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_596
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 596 = ⟨rankAtom ranks 73⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_597
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 597 = ⟨rankAtom ranks 74⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_598
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 598 = ⟨rankAtom ranks 75⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_599
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 599 = ⟨rankAtom ranks 76⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_600
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 600 = ⟨rankAtom ranks 77⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_601
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 601 = ⟨BitVec.ofBool (shellBit shell 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_602
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 602 = ⟨BitVec.ofBool (shellBit shell 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_603
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 603 = ⟨BitVec.ofBool (shellBit shell 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_604
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 604 = ⟨BitVec.ofBool (shellBit shell 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_605
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 605 = ⟨BitVec.ofBool (shellBit shell 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_606
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 606 = ⟨BitVec.ofBool (shellBit shell 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_607
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 607 = ⟨BitVec.ofBool (shellBit shell 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_608
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 608 = ⟨BitVec.ofBool (shellBit shell 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_609
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 609 = ⟨BitVec.ofBool (shellBit shell 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_610
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 610 = ⟨BitVec.ofBool (shellBit shell 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_611
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 611 = ⟨BitVec.ofBool (shellBit shell 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_612
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 612 = ⟨BitVec.ofBool (shellBit shell 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem sourceAssignment_get_613
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (sourceAssignment rows blockers shell q w b1 ranks).get 613 = ⟨BitVec.ofBool (shellBit shell 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl


@[simp 1100] theorem sourceAssignment_eval_var_000
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 0) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_000]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_001
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 1) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_001]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_002
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 2) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_002]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_003
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 3) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_003]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_004
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 4) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_004]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_005
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 5) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_005]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_006
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 6) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_006]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_007
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 7) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_007]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_008
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 8) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_008]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_009
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 9) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_009]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_010
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 10) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_010]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_011
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 11) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_011]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_012
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 12) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_012]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_013
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 13) : BVExpr 4) = blockerAt blockers 3 := by
  rw [BVExpr.eval_var, sourceAssignment_get_013]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_014
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 14) : BVExpr 4) = q := by
  rw [BVExpr.eval_var, sourceAssignment_get_014]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_015
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 15) : BVExpr 4) = w := by
  rw [BVExpr.eval_var, sourceAssignment_get_015]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_016
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 16) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_016]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_017
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 17) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_017]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_018
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 18) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_018]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_019
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 19) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_019]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_020
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 20) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_020]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_021
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 21) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_021]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_022
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 22) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_022]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_023
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 23) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_023]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_024
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 24) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_024]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_025
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 25) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_025]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_026
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 26) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_026]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_027
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 27) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_027]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_028
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 28) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 0 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_028]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_029
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 29) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_029]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_030
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 30) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_030]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_031
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 31) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_031]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_032
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 32) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_032]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_033
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 33) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_033]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_034
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 34) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_034]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_035
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 35) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_035]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_036
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 36) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_036]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_037
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 37) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_037]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_038
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 38) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_038]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_039
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 39) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_039]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_040
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 40) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_040]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_041
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 41) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 1 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_041]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_042
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 42) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_042]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_043
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 43) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_043]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_044
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 44) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_044]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_045
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 45) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_045]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_046
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 46) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_046]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_047
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 47) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_047]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_048
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 48) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_048]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_049
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 49) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_049]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_050
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 50) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_050]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_051
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 51) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_051]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_052
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 52) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_052]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_053
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 53) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_053]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_054
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 54) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_054]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_055
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 55) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_055]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_056
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 56) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_056]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_057
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 57) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_057]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_058
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 58) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_058]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_059
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 59) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_059]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_060
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 60) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_060]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_061
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 61) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_061]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_062
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 62) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_062]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_063
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 63) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_063]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_064
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 64) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_064]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_065
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 65) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_065]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_066
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 66) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_066]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_067
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 67) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 3 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_067]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_068
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 68) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_068]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_069
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 69) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_069]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_070
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 70) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_070]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_071
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 71) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_071]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_072
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 72) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_072]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_073
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 73) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_073]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_074
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 74) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_074]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_075
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 75) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_075]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_076
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 76) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_076]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_077
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 77) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_077]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_078
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 78) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_078]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_079
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 79) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_079]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_080
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 80) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 4 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_080]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_081
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 81) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_081]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_082
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 82) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_082]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_083
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 83) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_083]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_084
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 84) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_084]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_085
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 85) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_085]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_086
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 86) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_086]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_087
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 87) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_087]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_088
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 88) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_088]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_089
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 89) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_089]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_090
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 90) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_090]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_091
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 91) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_091]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_092
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 92) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_092]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_093
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 93) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 5 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_093]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_094
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 94) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_094]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_095
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 95) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_095]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_096
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 96) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_096]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_097
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 97) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_097]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_098
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 98) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_098]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_099
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 99) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_099]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_100
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 100) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_100]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_101
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 101) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_101]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_102
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 102) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_102]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_103
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 103) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_103]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_104
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 104) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_104]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_105
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 105) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_105]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_106
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 106) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_106]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_107
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 107) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_107]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_108
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 108) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_108]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_109
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 109) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_109]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_110
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 110) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_110]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_111
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 111) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_111]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_112
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 112) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_112]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_113
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 113) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_113]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_114
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 114) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_114]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_115
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 115) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_115]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_116
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 116) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_116]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_117
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 117) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_117]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_118
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 118) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_118]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_119
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 119) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 7 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_119]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_120
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 120) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_120]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_121
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 121) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_121]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_122
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 122) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_122]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_123
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 123) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_123]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_124
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 124) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_124]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_125
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 125) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_125]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_126
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 126) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_126]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_127
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 127) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_127]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_128
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 128) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_128]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_129
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 129) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_129]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_130
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 130) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_130]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_131
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 131) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_131]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_132
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 132) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 8 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_132]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_133
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 133) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_133]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_134
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 134) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_134]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_135
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 135) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_135]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_136
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 136) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_136]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_137
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 137) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_137]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_138
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 138) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_138]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_139
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 139) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_139]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_140
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 140) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_140]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_141
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 141) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_141]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_142
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 142) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_142]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_143
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 143) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_143]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_144
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 144) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_144]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_145
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 145) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 9 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_145]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_146
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 146) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_146]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_147
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 147) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_147]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_148
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 148) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_148]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_149
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 149) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_149]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_150
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 150) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_150]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_151
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 151) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_151]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_152
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 152) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_152]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_153
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 153) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_153]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_154
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 154) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_154]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_155
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 155) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_155]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_156
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 156) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_156]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_157
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 157) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_157]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_158
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 158) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 10 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_158]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_159
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 159) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_159]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_160
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 160) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_160]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_161
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 161) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_161]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_162
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 162) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_162]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_163
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 163) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_163]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_164
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 164) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_164]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_165
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 165) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_165]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_166
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 166) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_166]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_167
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 167) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_167]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_168
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 168) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_168]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_169
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 169) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_169]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_170
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 170) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_170]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_171
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 171) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 11 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_171]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_172
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 172) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_172]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_173
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 173) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_173]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_174
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 174) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_174]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_175
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 175) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_175]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_176
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 176) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_176]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_177
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 177) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_177]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_178
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 178) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_178]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_179
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 179) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_179]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_180
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 180) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_180]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_181
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 181) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_181]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_182
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 182) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_182]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_183
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 183) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_183]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_184
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 184) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 12 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_184]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_185
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 185) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_185]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_186
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 186) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_186]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_187
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 187) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_187]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_188
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 188) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_188]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_189
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 189) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_189]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_190
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 190) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_190]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_191
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 191) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_191]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_192
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 192) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_192]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_193
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 193) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_193]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_194
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 194) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_194]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_195
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 195) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_195]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_196
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 196) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_196]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_197
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 197) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 0 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_197]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_198
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 198) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_198]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_199
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 199) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_199]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_200
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 200) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_200]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_201
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 201) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_201]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_202
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 202) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_202]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_203
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 203) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_203]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_204
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 204) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_204]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_205
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 205) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_205]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_206
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 206) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_206]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_207
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 207) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_207]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_208
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 208) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_208]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_209
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 209) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_209]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_210
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 210) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 1 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_210]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_211
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 211) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_211]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_212
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 212) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_212]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_213
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 213) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_213]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_214
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 214) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_214]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_215
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 215) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_215]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_216
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 216) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_216]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_217
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 217) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_217]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_218
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 218) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_218]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_219
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 219) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_219]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_220
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 220) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_220]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_221
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 221) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_221]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_222
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 222) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_222]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_223
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 223) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 2 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_223]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_224
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 224) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_224]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_225
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 225) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_225]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_226
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 226) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_226]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_227
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 227) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_227]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_228
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 228) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_228]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_229
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 229) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_229]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_230
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 230) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_230]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_231
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 231) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_231]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_232
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 232) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_232]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_233
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 233) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_233]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_234
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 234) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_234]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_235
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 235) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_235]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_236
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 236) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 3 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_236]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_237
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 237) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_237]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_238
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 238) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_238]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_239
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 239) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_239]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_240
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 240) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_240]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_241
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 241) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_241]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_242
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 242) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_242]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_243
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 243) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_243]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_244
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 244) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_244]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_245
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 245) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_245]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_246
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 246) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_246]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_247
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 247) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_247]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_248
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 248) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_248]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_249
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 249) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 4 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_249]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_250
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 250) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_250]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_251
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 251) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_251]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_252
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 252) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_252]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_253
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 253) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_253]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_254
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 254) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_254]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_255
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 255) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_255]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_256
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 256) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_256]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_257
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 257) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_257]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_258
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 258) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_258]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_259
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 259) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_259]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_260
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 260) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_260]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_261
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 261) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_261]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_262
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 262) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_262]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_263
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 263) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_263]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_264
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 264) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_264]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_265
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 265) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_265]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_266
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 266) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_266]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_267
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 267) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_267]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_268
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 268) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_268]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_269
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 269) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_269]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_270
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 270) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_270]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_271
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 271) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_271]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_272
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 272) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_272]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_273
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 273) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_273]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_274
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 274) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_274]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_275
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 275) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 6 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_275]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_276
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 276) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_276]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_277
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 277) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_277]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_278
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 278) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_278]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_279
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 279) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_279]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_280
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 280) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_280]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_281
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 281) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_281]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_282
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 282) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_282]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_283
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 283) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_283]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_284
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 284) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_284]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_285
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 285) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_285]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_286
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 286) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_286]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_287
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 287) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_287]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_288
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 288) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 7 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_288]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_289
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 289) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_289]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_290
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 290) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_290]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_291
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 291) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_291]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_292
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 292) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_292]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_293
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 293) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_293]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_294
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 294) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_294]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_295
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 295) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_295]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_296
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 296) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_296]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_297
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 297) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_297]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_298
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 298) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_298]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_299
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 299) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_299]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_300
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 300) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_300]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_301
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 301) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 8 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_301]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_302
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 302) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_302]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_303
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 303) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_303]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_304
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 304) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_304]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_305
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 305) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_305]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_306
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 306) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_306]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_307
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 307) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_307]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_308
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 308) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_308]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_309
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 309) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_309]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_310
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 310) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_310]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_311
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 311) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_311]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_312
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 312) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_312]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_313
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 313) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_313]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_314
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 314) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 9 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_314]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_315
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 315) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_315]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_316
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 316) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_316]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_317
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 317) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_317]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_318
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 318) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_318]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_319
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 319) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_319]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_320
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 320) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_320]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_321
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 321) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_321]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_322
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 322) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_322]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_323
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 323) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_323]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_324
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 324) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_324]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_325
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 325) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_325]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_326
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 326) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_326]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_327
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 327) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 10 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_327]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_328
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 328) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_328]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_329
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 329) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_329]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_330
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 330) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_330]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_331
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 331) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_331]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_332
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 332) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_332]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_333
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 333) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_333]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_334
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 334) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_334]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_335
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 335) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_335]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_336
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 336) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_336]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_337
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 337) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_337]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_338
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 338) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_338]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_339
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 339) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_339]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_340
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 340) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 11 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_340]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_341
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 341) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_341]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_342
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 342) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_342]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_343
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 343) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_343]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_344
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 344) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_344]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_345
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 345) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_345]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_346
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 346) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_346]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_347
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 347) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_347]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_348
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 348) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_348]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_349
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 349) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_349]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_350
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 350) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_350]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_351
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 351) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_351]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_352
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 352) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_352]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_353
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 353) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 12 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_353]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_354
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 354) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_354]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_355
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 355) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_355]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_356
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 356) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_356]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_357
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 357) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_357]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_358
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 358) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_358]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_359
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 359) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_359]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_360
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 360) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_360]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_361
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 361) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_361]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_362
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 362) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_362]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_363
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 363) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_363]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_364
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 364) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_364]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_365
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 365) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_365]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_366
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 366) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_366]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_367
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 367) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_367]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_368
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 368) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_368]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_369
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 369) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_369]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_370
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 370) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_370]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_371
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 371) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_371]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_372
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 372) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_372]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_373
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 373) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_373]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_374
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 374) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_374]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_375
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 375) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_375]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_376
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 376) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_376]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_377
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 377) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_377]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_378
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 378) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_378]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_379
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 379) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 1 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_379]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_380
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 380) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_380]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_381
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 381) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_381]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_382
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 382) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_382]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_383
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 383) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_383]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_384
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 384) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_384]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_385
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 385) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_385]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_386
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 386) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_386]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_387
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 387) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_387]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_388
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 388) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_388]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_389
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 389) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_389]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_390
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 390) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_390]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_391
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 391) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_391]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_392
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 392) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_392]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_393
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 393) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_393]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_394
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 394) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_394]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_395
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 395) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_395]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_396
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 396) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_396]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_397
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 397) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_397]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_398
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 398) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_398]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_399
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 399) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_399]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_400
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 400) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_400]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_401
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 401) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_401]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_402
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 402) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_402]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_403
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 403) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_403]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_404
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 404) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_404]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_405
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 405) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 3 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_405]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_406
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 406) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_406]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_407
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 407) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_407]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_408
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 408) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_408]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_409
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 409) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_409]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_410
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 410) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_410]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_411
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 411) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_411]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_412
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 412) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_412]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_413
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 413) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_413]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_414
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 414) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_414]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_415
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 415) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_415]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_416
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 416) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_416]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_417
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 417) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_417]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_418
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 418) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_418]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_419
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 419) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_419]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_420
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 420) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_420]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_421
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 421) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_421]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_422
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 422) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_422]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_423
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 423) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_423]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_424
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 424) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_424]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_425
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 425) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_425]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_426
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 426) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_426]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_427
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 427) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_427]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_428
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 428) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_428]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_429
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 429) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_429]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_430
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 430) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_430]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_431
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 431) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 5 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_431]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_432
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 432) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_432]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_433
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 433) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_433]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_434
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 434) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_434]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_435
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 435) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_435]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_436
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 436) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_436]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_437
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 437) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_437]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_438
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 438) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_438]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_439
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 439) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_439]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_440
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 440) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_440]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_441
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 441) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_441]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_442
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 442) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_442]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_443
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 443) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_443]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_444
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 444) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 6 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_444]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_445
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 445) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_445]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_446
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 446) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_446]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_447
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 447) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_447]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_448
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 448) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_448]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_449
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 449) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_449]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_450
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 450) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_450]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_451
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 451) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_451]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_452
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 452) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_452]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_453
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 453) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_453]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_454
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 454) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_454]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_455
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 455) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_455]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_456
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 456) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_456]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_457
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 457) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 7 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_457]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_458
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 458) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_458]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_459
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 459) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_459]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_460
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 460) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_460]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_461
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 461) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_461]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_462
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 462) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_462]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_463
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 463) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_463]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_464
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 464) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_464]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_465
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 465) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_465]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_466
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 466) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_466]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_467
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 467) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_467]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_468
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 468) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_468]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_469
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 469) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_469]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_470
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 470) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 8 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_470]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_471
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 471) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_471]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_472
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 472) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_472]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_473
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 473) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_473]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_474
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 474) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_474]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_475
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 475) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_475]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_476
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 476) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_476]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_477
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 477) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_477]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_478
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 478) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_478]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_479
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 479) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_479]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_480
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 480) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_480]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_481
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 481) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_481]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_482
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 482) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_482]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_483
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 483) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 9 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_483]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_484
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 484) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_484]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_485
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 485) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_485]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_486
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 486) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_486]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_487
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 487) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_487]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_488
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 488) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_488]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_489
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 489) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_489]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_490
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 490) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_490]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_491
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 491) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_491]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_492
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 492) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_492]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_493
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 493) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_493]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_494
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 494) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_494]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_495
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 495) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_495]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_496
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 496) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 10 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_496]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_497
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 497) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_497]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_498
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 498) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_498]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_499
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 499) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_499]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_500
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 500) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_500]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_501
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 501) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_501]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_502
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 502) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_502]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_503
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 503) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_503]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_504
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 504) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_504]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_505
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 505) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_505]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_506
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 506) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_506]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_507
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 507) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_507]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_508
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 508) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_508]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_509
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 509) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 11 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_509]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_510
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 510) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_510]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_511
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 511) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_511]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_512
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 512) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_512]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_513
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 513) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_513]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_514
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 514) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_514]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_515
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 515) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_515]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_516
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 516) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_516]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_517
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 517) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_517]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_518
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 518) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_518]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_519
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 519) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_519]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_520
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 520) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_520]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_521
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 521) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_521]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_522
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 522) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 12 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_522]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_523
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 523) : BVExpr 7) = rankAtom ranks 0 := by
  rw [BVExpr.eval_var, sourceAssignment_get_523]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_524
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 524) : BVExpr 7) = rankAtom ranks 1 := by
  rw [BVExpr.eval_var, sourceAssignment_get_524]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_525
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 525) : BVExpr 7) = rankAtom ranks 2 := by
  rw [BVExpr.eval_var, sourceAssignment_get_525]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_526
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 526) : BVExpr 7) = rankAtom ranks 3 := by
  rw [BVExpr.eval_var, sourceAssignment_get_526]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_527
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 527) : BVExpr 7) = rankAtom ranks 4 := by
  rw [BVExpr.eval_var, sourceAssignment_get_527]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_528
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 528) : BVExpr 7) = rankAtom ranks 5 := by
  rw [BVExpr.eval_var, sourceAssignment_get_528]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_529
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 529) : BVExpr 7) = rankAtom ranks 6 := by
  rw [BVExpr.eval_var, sourceAssignment_get_529]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_530
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 530) : BVExpr 7) = rankAtom ranks 7 := by
  rw [BVExpr.eval_var, sourceAssignment_get_530]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_531
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 531) : BVExpr 7) = rankAtom ranks 8 := by
  rw [BVExpr.eval_var, sourceAssignment_get_531]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_532
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 532) : BVExpr 7) = rankAtom ranks 9 := by
  rw [BVExpr.eval_var, sourceAssignment_get_532]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_533
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 533) : BVExpr 7) = rankAtom ranks 10 := by
  rw [BVExpr.eval_var, sourceAssignment_get_533]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_534
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 534) : BVExpr 7) = rankAtom ranks 11 := by
  rw [BVExpr.eval_var, sourceAssignment_get_534]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_535
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 535) : BVExpr 7) = rankAtom ranks 12 := by
  rw [BVExpr.eval_var, sourceAssignment_get_535]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_536
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 536) : BVExpr 7) = rankAtom ranks 13 := by
  rw [BVExpr.eval_var, sourceAssignment_get_536]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_537
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 537) : BVExpr 7) = rankAtom ranks 14 := by
  rw [BVExpr.eval_var, sourceAssignment_get_537]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_538
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 538) : BVExpr 7) = rankAtom ranks 15 := by
  rw [BVExpr.eval_var, sourceAssignment_get_538]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_539
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 539) : BVExpr 7) = rankAtom ranks 16 := by
  rw [BVExpr.eval_var, sourceAssignment_get_539]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_540
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 540) : BVExpr 7) = rankAtom ranks 17 := by
  rw [BVExpr.eval_var, sourceAssignment_get_540]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_541
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 541) : BVExpr 7) = rankAtom ranks 18 := by
  rw [BVExpr.eval_var, sourceAssignment_get_541]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_542
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 542) : BVExpr 7) = rankAtom ranks 19 := by
  rw [BVExpr.eval_var, sourceAssignment_get_542]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_543
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 543) : BVExpr 7) = rankAtom ranks 20 := by
  rw [BVExpr.eval_var, sourceAssignment_get_543]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_544
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 544) : BVExpr 7) = rankAtom ranks 21 := by
  rw [BVExpr.eval_var, sourceAssignment_get_544]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_545
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 545) : BVExpr 7) = rankAtom ranks 22 := by
  rw [BVExpr.eval_var, sourceAssignment_get_545]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_546
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 546) : BVExpr 7) = rankAtom ranks 23 := by
  rw [BVExpr.eval_var, sourceAssignment_get_546]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_547
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 547) : BVExpr 7) = rankAtom ranks 24 := by
  rw [BVExpr.eval_var, sourceAssignment_get_547]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_548
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 548) : BVExpr 7) = rankAtom ranks 25 := by
  rw [BVExpr.eval_var, sourceAssignment_get_548]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_549
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 549) : BVExpr 7) = rankAtom ranks 26 := by
  rw [BVExpr.eval_var, sourceAssignment_get_549]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_550
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 550) : BVExpr 7) = rankAtom ranks 27 := by
  rw [BVExpr.eval_var, sourceAssignment_get_550]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_551
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 551) : BVExpr 7) = rankAtom ranks 28 := by
  rw [BVExpr.eval_var, sourceAssignment_get_551]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_552
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 552) : BVExpr 7) = rankAtom ranks 29 := by
  rw [BVExpr.eval_var, sourceAssignment_get_552]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_553
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 553) : BVExpr 7) = rankAtom ranks 30 := by
  rw [BVExpr.eval_var, sourceAssignment_get_553]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_554
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 554) : BVExpr 7) = rankAtom ranks 31 := by
  rw [BVExpr.eval_var, sourceAssignment_get_554]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_555
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 555) : BVExpr 7) = rankAtom ranks 32 := by
  rw [BVExpr.eval_var, sourceAssignment_get_555]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_556
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 556) : BVExpr 7) = rankAtom ranks 33 := by
  rw [BVExpr.eval_var, sourceAssignment_get_556]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_557
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 557) : BVExpr 7) = rankAtom ranks 34 := by
  rw [BVExpr.eval_var, sourceAssignment_get_557]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_558
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 558) : BVExpr 7) = rankAtom ranks 35 := by
  rw [BVExpr.eval_var, sourceAssignment_get_558]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_559
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 559) : BVExpr 7) = rankAtom ranks 36 := by
  rw [BVExpr.eval_var, sourceAssignment_get_559]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_560
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 560) : BVExpr 7) = rankAtom ranks 37 := by
  rw [BVExpr.eval_var, sourceAssignment_get_560]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_561
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 561) : BVExpr 7) = rankAtom ranks 38 := by
  rw [BVExpr.eval_var, sourceAssignment_get_561]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_562
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 562) : BVExpr 7) = rankAtom ranks 39 := by
  rw [BVExpr.eval_var, sourceAssignment_get_562]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_563
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 563) : BVExpr 7) = rankAtom ranks 40 := by
  rw [BVExpr.eval_var, sourceAssignment_get_563]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_564
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 564) : BVExpr 7) = rankAtom ranks 41 := by
  rw [BVExpr.eval_var, sourceAssignment_get_564]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_565
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 565) : BVExpr 7) = rankAtom ranks 42 := by
  rw [BVExpr.eval_var, sourceAssignment_get_565]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_566
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 566) : BVExpr 7) = rankAtom ranks 43 := by
  rw [BVExpr.eval_var, sourceAssignment_get_566]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_567
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 567) : BVExpr 7) = rankAtom ranks 44 := by
  rw [BVExpr.eval_var, sourceAssignment_get_567]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_568
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 568) : BVExpr 7) = rankAtom ranks 45 := by
  rw [BVExpr.eval_var, sourceAssignment_get_568]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_569
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 569) : BVExpr 7) = rankAtom ranks 46 := by
  rw [BVExpr.eval_var, sourceAssignment_get_569]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_570
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 570) : BVExpr 7) = rankAtom ranks 47 := by
  rw [BVExpr.eval_var, sourceAssignment_get_570]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_571
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 571) : BVExpr 7) = rankAtom ranks 48 := by
  rw [BVExpr.eval_var, sourceAssignment_get_571]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_572
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 572) : BVExpr 7) = rankAtom ranks 49 := by
  rw [BVExpr.eval_var, sourceAssignment_get_572]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_573
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 573) : BVExpr 7) = rankAtom ranks 50 := by
  rw [BVExpr.eval_var, sourceAssignment_get_573]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_574
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 574) : BVExpr 7) = rankAtom ranks 51 := by
  rw [BVExpr.eval_var, sourceAssignment_get_574]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_575
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 575) : BVExpr 7) = rankAtom ranks 52 := by
  rw [BVExpr.eval_var, sourceAssignment_get_575]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_576
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 576) : BVExpr 7) = rankAtom ranks 53 := by
  rw [BVExpr.eval_var, sourceAssignment_get_576]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_577
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 577) : BVExpr 7) = rankAtom ranks 54 := by
  rw [BVExpr.eval_var, sourceAssignment_get_577]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_578
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 578) : BVExpr 7) = rankAtom ranks 55 := by
  rw [BVExpr.eval_var, sourceAssignment_get_578]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_579
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 579) : BVExpr 7) = rankAtom ranks 56 := by
  rw [BVExpr.eval_var, sourceAssignment_get_579]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_580
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 580) : BVExpr 7) = rankAtom ranks 57 := by
  rw [BVExpr.eval_var, sourceAssignment_get_580]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_581
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 581) : BVExpr 7) = rankAtom ranks 58 := by
  rw [BVExpr.eval_var, sourceAssignment_get_581]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_582
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 582) : BVExpr 7) = rankAtom ranks 59 := by
  rw [BVExpr.eval_var, sourceAssignment_get_582]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_583
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 583) : BVExpr 7) = rankAtom ranks 60 := by
  rw [BVExpr.eval_var, sourceAssignment_get_583]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_584
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 584) : BVExpr 7) = rankAtom ranks 61 := by
  rw [BVExpr.eval_var, sourceAssignment_get_584]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_585
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 585) : BVExpr 7) = rankAtom ranks 62 := by
  rw [BVExpr.eval_var, sourceAssignment_get_585]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_586
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 586) : BVExpr 7) = rankAtom ranks 63 := by
  rw [BVExpr.eval_var, sourceAssignment_get_586]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_587
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 587) : BVExpr 7) = rankAtom ranks 64 := by
  rw [BVExpr.eval_var, sourceAssignment_get_587]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_588
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 588) : BVExpr 7) = rankAtom ranks 65 := by
  rw [BVExpr.eval_var, sourceAssignment_get_588]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_589
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 589) : BVExpr 7) = rankAtom ranks 66 := by
  rw [BVExpr.eval_var, sourceAssignment_get_589]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_590
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 590) : BVExpr 7) = rankAtom ranks 67 := by
  rw [BVExpr.eval_var, sourceAssignment_get_590]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_591
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 591) : BVExpr 7) = rankAtom ranks 68 := by
  rw [BVExpr.eval_var, sourceAssignment_get_591]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_592
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 592) : BVExpr 7) = rankAtom ranks 69 := by
  rw [BVExpr.eval_var, sourceAssignment_get_592]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_593
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 593) : BVExpr 7) = rankAtom ranks 70 := by
  rw [BVExpr.eval_var, sourceAssignment_get_593]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_594
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 594) : BVExpr 7) = rankAtom ranks 71 := by
  rw [BVExpr.eval_var, sourceAssignment_get_594]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_595
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 595) : BVExpr 7) = rankAtom ranks 72 := by
  rw [BVExpr.eval_var, sourceAssignment_get_595]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_596
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 596) : BVExpr 7) = rankAtom ranks 73 := by
  rw [BVExpr.eval_var, sourceAssignment_get_596]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_597
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 597) : BVExpr 7) = rankAtom ranks 74 := by
  rw [BVExpr.eval_var, sourceAssignment_get_597]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_598
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 598) : BVExpr 7) = rankAtom ranks 75 := by
  rw [BVExpr.eval_var, sourceAssignment_get_598]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_599
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 599) : BVExpr 7) = rankAtom ranks 76 := by
  rw [BVExpr.eval_var, sourceAssignment_get_599]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_600
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 600) : BVExpr 7) = rankAtom ranks 77 := by
  rw [BVExpr.eval_var, sourceAssignment_get_600]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_601
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 601) : BVExpr 1) = BitVec.ofBool (shellBit shell 0) := by
  rw [BVExpr.eval_var, sourceAssignment_get_601]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_602
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 602) : BVExpr 1) = BitVec.ofBool (shellBit shell 1) := by
  rw [BVExpr.eval_var, sourceAssignment_get_602]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_603
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 603) : BVExpr 1) = BitVec.ofBool (shellBit shell 2) := by
  rw [BVExpr.eval_var, sourceAssignment_get_603]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_604
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 604) : BVExpr 1) = BitVec.ofBool (shellBit shell 3) := by
  rw [BVExpr.eval_var, sourceAssignment_get_604]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_605
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 605) : BVExpr 1) = BitVec.ofBool (shellBit shell 4) := by
  rw [BVExpr.eval_var, sourceAssignment_get_605]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_606
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 606) : BVExpr 1) = BitVec.ofBool (shellBit shell 5) := by
  rw [BVExpr.eval_var, sourceAssignment_get_606]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_607
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 607) : BVExpr 1) = BitVec.ofBool (shellBit shell 6) := by
  rw [BVExpr.eval_var, sourceAssignment_get_607]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_608
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 608) : BVExpr 1) = BitVec.ofBool (shellBit shell 7) := by
  rw [BVExpr.eval_var, sourceAssignment_get_608]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_609
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 609) : BVExpr 1) = BitVec.ofBool (shellBit shell 8) := by
  rw [BVExpr.eval_var, sourceAssignment_get_609]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_610
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 610) : BVExpr 1) = BitVec.ofBool (shellBit shell 9) := by
  rw [BVExpr.eval_var, sourceAssignment_get_610]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_611
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 611) : BVExpr 1) = BitVec.ofBool (shellBit shell 10) := by
  rw [BVExpr.eval_var, sourceAssignment_get_611]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_612
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 612) : BVExpr 1) = BitVec.ofBool (shellBit shell 11) := by
  rw [BVExpr.eval_var, sourceAssignment_get_612]
  simp

@[simp 1100] theorem sourceAssignment_eval_var_613
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (sourceAssignment rows blockers shell q w b1 ranks)
      ((.var 613) : BVExpr 1) = BitVec.ofBool (shellBit shell 12) := by
  rw [BVExpr.eval_var, sourceAssignment_get_613]
  simp

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
