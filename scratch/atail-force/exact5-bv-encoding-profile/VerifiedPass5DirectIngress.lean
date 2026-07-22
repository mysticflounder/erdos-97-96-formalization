/-
Generated from the exact pass-5 core and its checked 191-entry variable map.

This file is the source-to-circuit ingress.  It contains no SAT encoding and
no certificate checker: those live in `VerifiedPass5Direct.lean`.
-/
import VerifiedPass5Direct
import Lean.Data.RArray

namespace Problem97.ATailExactFiveVerifiedPass5

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

/-- Exact slot function recorded by `verified-pass5-direct-variable-map.json`. -/
def directSourceSlot
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
  | 13 => ⟨blockerAt blockers 0⟩
  | 14 => ⟨blockerAt blockers 1⟩
  | 15 => ⟨blockerAt blockers 2⟩
  | 16 => ⟨blockerAt blockers 3⟩
  | 17 => ⟨blockerAt blockers 4⟩
  | 18 => ⟨blockerAt blockers 5⟩
  | 19 => ⟨blockerAt blockers 6⟩
  | 20 => ⟨blockerAt blockers 7⟩
  | 21 => ⟨blockerAt blockers 8⟩
  | 22 => ⟨blockerAt blockers 9⟩
  | 23 => ⟨blockerAt blockers 10⟩
  | 24 => ⟨blockerAt blockers 11⟩
  | 25 => ⟨blockerAt blockers 12⟩
  | 26 => ⟨q⟩
  | 27 => ⟨w⟩
  | 28 => ⟨BitVec.ofBool (rowBit rows 1 2 0)⟩
  | 29 => ⟨BitVec.ofBool (rowBit rows 1 2 1)⟩
  | 30 => ⟨BitVec.ofBool (rowBit rows 1 2 2)⟩
  | 31 => ⟨BitVec.ofBool (rowBit rows 1 2 3)⟩
  | 32 => ⟨BitVec.ofBool (rowBit rows 1 2 4)⟩
  | 33 => ⟨BitVec.ofBool (rowBit rows 1 2 5)⟩
  | 34 => ⟨BitVec.ofBool (rowBit rows 1 2 6)⟩
  | 35 => ⟨BitVec.ofBool (rowBit rows 1 2 7)⟩
  | 36 => ⟨BitVec.ofBool (rowBit rows 1 2 8)⟩
  | 37 => ⟨BitVec.ofBool (rowBit rows 1 2 9)⟩
  | 38 => ⟨BitVec.ofBool (rowBit rows 1 2 10)⟩
  | 39 => ⟨BitVec.ofBool (rowBit rows 1 2 11)⟩
  | 40 => ⟨BitVec.ofBool (rowBit rows 1 2 12)⟩
  | 41 => ⟨BitVec.ofBool (rowBit rows 1 6 0)⟩
  | 42 => ⟨BitVec.ofBool (rowBit rows 1 6 1)⟩
  | 43 => ⟨BitVec.ofBool (rowBit rows 1 6 2)⟩
  | 44 => ⟨BitVec.ofBool (rowBit rows 1 6 3)⟩
  | 45 => ⟨BitVec.ofBool (rowBit rows 1 6 4)⟩
  | 46 => ⟨BitVec.ofBool (rowBit rows 1 6 5)⟩
  | 47 => ⟨BitVec.ofBool (rowBit rows 1 6 6)⟩
  | 48 => ⟨BitVec.ofBool (rowBit rows 1 6 7)⟩
  | 49 => ⟨BitVec.ofBool (rowBit rows 1 6 8)⟩
  | 50 => ⟨BitVec.ofBool (rowBit rows 1 6 9)⟩
  | 51 => ⟨BitVec.ofBool (rowBit rows 1 6 10)⟩
  | 52 => ⟨BitVec.ofBool (rowBit rows 1 6 11)⟩
  | 53 => ⟨BitVec.ofBool (rowBit rows 1 6 12)⟩
  | 54 => ⟨BitVec.ofBool (rowBit rows 2 5 0)⟩
  | 55 => ⟨BitVec.ofBool (rowBit rows 2 5 1)⟩
  | 56 => ⟨BitVec.ofBool (rowBit rows 2 5 2)⟩
  | 57 => ⟨BitVec.ofBool (rowBit rows 2 5 3)⟩
  | 58 => ⟨BitVec.ofBool (rowBit rows 2 5 4)⟩
  | 59 => ⟨BitVec.ofBool (rowBit rows 2 5 5)⟩
  | 60 => ⟨BitVec.ofBool (rowBit rows 2 5 6)⟩
  | 61 => ⟨BitVec.ofBool (rowBit rows 2 5 7)⟩
  | 62 => ⟨BitVec.ofBool (rowBit rows 2 5 8)⟩
  | 63 => ⟨BitVec.ofBool (rowBit rows 2 5 9)⟩
  | 64 => ⟨BitVec.ofBool (rowBit rows 2 5 10)⟩
  | 65 => ⟨BitVec.ofBool (rowBit rows 2 5 11)⟩
  | 66 => ⟨BitVec.ofBool (rowBit rows 2 5 12)⟩
  | 67 => ⟨BitVec.ofBool (rowBit rows 0 0 0)⟩
  | 68 => ⟨BitVec.ofBool (rowBit rows 0 0 1)⟩
  | 69 => ⟨BitVec.ofBool (rowBit rows 0 0 2)⟩
  | 70 => ⟨BitVec.ofBool (rowBit rows 0 0 3)⟩
  | 71 => ⟨BitVec.ofBool (rowBit rows 0 0 4)⟩
  | 72 => ⟨BitVec.ofBool (rowBit rows 0 0 5)⟩
  | 73 => ⟨BitVec.ofBool (rowBit rows 0 0 6)⟩
  | 74 => ⟨BitVec.ofBool (rowBit rows 0 0 7)⟩
  | 75 => ⟨BitVec.ofBool (rowBit rows 0 0 8)⟩
  | 76 => ⟨BitVec.ofBool (rowBit rows 0 0 9)⟩
  | 77 => ⟨BitVec.ofBool (rowBit rows 0 0 10)⟩
  | 78 => ⟨BitVec.ofBool (rowBit rows 0 0 11)⟩
  | 79 => ⟨BitVec.ofBool (rowBit rows 0 0 12)⟩
  | 80 => ⟨BitVec.ofBool (rowBit rows 0 2 0)⟩
  | 81 => ⟨BitVec.ofBool (rowBit rows 0 2 1)⟩
  | 82 => ⟨BitVec.ofBool (rowBit rows 0 2 2)⟩
  | 83 => ⟨BitVec.ofBool (rowBit rows 0 2 3)⟩
  | 84 => ⟨BitVec.ofBool (rowBit rows 0 2 4)⟩
  | 85 => ⟨BitVec.ofBool (rowBit rows 0 2 5)⟩
  | 86 => ⟨BitVec.ofBool (rowBit rows 0 2 6)⟩
  | 87 => ⟨BitVec.ofBool (rowBit rows 0 2 7)⟩
  | 88 => ⟨BitVec.ofBool (rowBit rows 0 2 8)⟩
  | 89 => ⟨BitVec.ofBool (rowBit rows 0 2 9)⟩
  | 90 => ⟨BitVec.ofBool (rowBit rows 0 2 10)⟩
  | 91 => ⟨BitVec.ofBool (rowBit rows 0 2 11)⟩
  | 92 => ⟨BitVec.ofBool (rowBit rows 0 2 12)⟩
  | 93 => ⟨BitVec.ofBool (rowBit rows 0 4 0)⟩
  | 94 => ⟨BitVec.ofBool (rowBit rows 0 4 1)⟩
  | 95 => ⟨BitVec.ofBool (rowBit rows 0 4 2)⟩
  | 96 => ⟨BitVec.ofBool (rowBit rows 0 4 3)⟩
  | 97 => ⟨BitVec.ofBool (rowBit rows 0 4 4)⟩
  | 98 => ⟨BitVec.ofBool (rowBit rows 0 4 5)⟩
  | 99 => ⟨BitVec.ofBool (rowBit rows 0 4 6)⟩
  | 100 => ⟨BitVec.ofBool (rowBit rows 0 4 7)⟩
  | 101 => ⟨BitVec.ofBool (rowBit rows 0 4 8)⟩
  | 102 => ⟨BitVec.ofBool (rowBit rows 0 4 9)⟩
  | 103 => ⟨BitVec.ofBool (rowBit rows 0 4 10)⟩
  | 104 => ⟨BitVec.ofBool (rowBit rows 0 4 11)⟩
  | 105 => ⟨BitVec.ofBool (rowBit rows 0 4 12)⟩
  | 106 => ⟨rankAtom ranks 0⟩
  | 107 => ⟨rankAtom ranks 1⟩
  | 108 => ⟨rankAtom ranks 2⟩
  | 109 => ⟨rankAtom ranks 3⟩
  | 110 => ⟨rankAtom ranks 4⟩
  | 111 => ⟨rankAtom ranks 5⟩
  | 112 => ⟨rankAtom ranks 6⟩
  | 113 => ⟨rankAtom ranks 7⟩
  | 114 => ⟨rankAtom ranks 8⟩
  | 115 => ⟨rankAtom ranks 9⟩
  | 116 => ⟨rankAtom ranks 10⟩
  | 117 => ⟨rankAtom ranks 11⟩
  | 118 => ⟨rankAtom ranks 12⟩
  | 119 => ⟨rankAtom ranks 13⟩
  | 120 => ⟨rankAtom ranks 14⟩
  | 121 => ⟨rankAtom ranks 15⟩
  | 122 => ⟨rankAtom ranks 16⟩
  | 123 => ⟨rankAtom ranks 17⟩
  | 124 => ⟨rankAtom ranks 18⟩
  | 125 => ⟨rankAtom ranks 19⟩
  | 126 => ⟨rankAtom ranks 20⟩
  | 127 => ⟨rankAtom ranks 21⟩
  | 128 => ⟨rankAtom ranks 22⟩
  | 129 => ⟨rankAtom ranks 23⟩
  | 130 => ⟨rankAtom ranks 24⟩
  | 131 => ⟨rankAtom ranks 25⟩
  | 132 => ⟨rankAtom ranks 26⟩
  | 133 => ⟨rankAtom ranks 27⟩
  | 134 => ⟨rankAtom ranks 28⟩
  | 135 => ⟨rankAtom ranks 29⟩
  | 136 => ⟨rankAtom ranks 30⟩
  | 137 => ⟨rankAtom ranks 31⟩
  | 138 => ⟨rankAtom ranks 32⟩
  | 139 => ⟨rankAtom ranks 33⟩
  | 140 => ⟨rankAtom ranks 34⟩
  | 141 => ⟨rankAtom ranks 35⟩
  | 142 => ⟨rankAtom ranks 36⟩
  | 143 => ⟨rankAtom ranks 37⟩
  | 144 => ⟨rankAtom ranks 38⟩
  | 145 => ⟨rankAtom ranks 39⟩
  | 146 => ⟨rankAtom ranks 40⟩
  | 147 => ⟨rankAtom ranks 41⟩
  | 148 => ⟨rankAtom ranks 42⟩
  | 149 => ⟨rankAtom ranks 43⟩
  | 150 => ⟨rankAtom ranks 44⟩
  | 151 => ⟨rankAtom ranks 45⟩
  | 152 => ⟨rankAtom ranks 46⟩
  | 153 => ⟨rankAtom ranks 47⟩
  | 154 => ⟨rankAtom ranks 48⟩
  | 155 => ⟨rankAtom ranks 49⟩
  | 156 => ⟨rankAtom ranks 50⟩
  | 157 => ⟨rankAtom ranks 51⟩
  | 158 => ⟨rankAtom ranks 52⟩
  | 159 => ⟨rankAtom ranks 53⟩
  | 160 => ⟨rankAtom ranks 54⟩
  | 161 => ⟨rankAtom ranks 55⟩
  | 162 => ⟨rankAtom ranks 56⟩
  | 163 => ⟨rankAtom ranks 57⟩
  | 164 => ⟨rankAtom ranks 58⟩
  | 165 => ⟨rankAtom ranks 59⟩
  | 166 => ⟨rankAtom ranks 60⟩
  | 167 => ⟨rankAtom ranks 61⟩
  | 168 => ⟨rankAtom ranks 62⟩
  | 169 => ⟨rankAtom ranks 63⟩
  | 170 => ⟨rankAtom ranks 64⟩
  | 171 => ⟨rankAtom ranks 65⟩
  | 172 => ⟨rankAtom ranks 66⟩
  | 173 => ⟨rankAtom ranks 67⟩
  | 174 => ⟨rankAtom ranks 68⟩
  | 175 => ⟨rankAtom ranks 69⟩
  | 176 => ⟨rankAtom ranks 70⟩
  | 177 => ⟨rankAtom ranks 71⟩
  | 178 => ⟨BitVec.ofBool (shellBit shell 0)⟩
  | 179 => ⟨BitVec.ofBool (shellBit shell 1)⟩
  | 180 => ⟨BitVec.ofBool (shellBit shell 2)⟩
  | 181 => ⟨BitVec.ofBool (shellBit shell 3)⟩
  | 182 => ⟨BitVec.ofBool (shellBit shell 4)⟩
  | 183 => ⟨BitVec.ofBool (shellBit shell 5)⟩
  | 184 => ⟨BitVec.ofBool (shellBit shell 6)⟩
  | 185 => ⟨BitVec.ofBool (shellBit shell 7)⟩
  | 186 => ⟨BitVec.ofBool (shellBit shell 8)⟩
  | 187 => ⟨BitVec.ofBool (shellBit shell 9)⟩
  | 188 => ⟨BitVec.ofBool (shellBit shell 10)⟩
  | 189 => ⟨BitVec.ofBool (shellBit shell 11)⟩
  | 190 => ⟨BitVec.ofBool (shellBit shell 12)⟩
  | _ => ⟨0#1⟩

/-- Exact 191-entry assignment consumed by the verified `BVLogicalExpr`. -/
def directSourceAssignment
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.Assignment :=
  .branch 95
  (.branch 47
    (.branch 23
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf ⟨BitVec.ofBool (firstRowBit b1 0)⟩)
              (.leaf ⟨BitVec.ofBool (firstRowBit b1 1)⟩))
            (.branch 3
              (.leaf ⟨BitVec.ofBool (firstRowBit b1 2)⟩)
              (.branch 4
                (.leaf ⟨BitVec.ofBool (firstRowBit b1 3)⟩)
                (.leaf ⟨BitVec.ofBool (firstRowBit b1 4)⟩))))
          (.branch 8
            (.branch 6
              (.leaf ⟨BitVec.ofBool (firstRowBit b1 5)⟩)
              (.branch 7
                (.leaf ⟨BitVec.ofBool (firstRowBit b1 6)⟩)
                (.leaf ⟨BitVec.ofBool (firstRowBit b1 7)⟩)))
            (.branch 9
              (.leaf ⟨BitVec.ofBool (firstRowBit b1 8)⟩)
              (.branch 10
                (.leaf ⟨BitVec.ofBool (firstRowBit b1 9)⟩)
                (.leaf ⟨BitVec.ofBool (firstRowBit b1 10)⟩)))))
        (.branch 17
          (.branch 14
            (.branch 12
              (.leaf ⟨BitVec.ofBool (firstRowBit b1 11)⟩)
              (.branch 13
                (.leaf ⟨BitVec.ofBool (firstRowBit b1 12)⟩)
                (.leaf ⟨blockerAt blockers 0⟩)))
            (.branch 15
              (.leaf ⟨blockerAt blockers 1⟩)
              (.branch 16
                (.leaf ⟨blockerAt blockers 2⟩)
                (.leaf ⟨blockerAt blockers 3⟩))))
          (.branch 20
            (.branch 18
              (.leaf ⟨blockerAt blockers 4⟩)
              (.branch 19
                (.leaf ⟨blockerAt blockers 5⟩)
                (.leaf ⟨blockerAt blockers 6⟩)))
            (.branch 21
              (.leaf ⟨blockerAt blockers 7⟩)
              (.branch 22
                (.leaf ⟨blockerAt blockers 8⟩)
                (.leaf ⟨blockerAt blockers 9⟩))))))
      (.branch 35
        (.branch 29
          (.branch 26
            (.branch 24
              (.leaf ⟨blockerAt blockers 10⟩)
              (.branch 25
                (.leaf ⟨blockerAt blockers 11⟩)
                (.leaf ⟨blockerAt blockers 12⟩)))
            (.branch 27
              (.leaf ⟨q⟩)
              (.branch 28
                (.leaf ⟨w⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 0)⟩))))
          (.branch 32
            (.branch 30
              (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 1)⟩)
              (.branch 31
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 2)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 3)⟩)))
            (.branch 33
              (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 4)⟩)
              (.branch 34
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 5)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 6)⟩)))))
        (.branch 41
          (.branch 38
            (.branch 36
              (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 7)⟩)
              (.branch 37
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 8)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 9)⟩)))
            (.branch 39
              (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 10)⟩)
              (.branch 40
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 11)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 2 12)⟩))))
          (.branch 44
            (.branch 42
              (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 0)⟩)
              (.branch 43
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 1)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 2)⟩)))
            (.branch 45
              (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 3)⟩)
              (.branch 46
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 4)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 5)⟩)))))))
    (.branch 71
      (.branch 59
        (.branch 53
          (.branch 50
            (.branch 48
              (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 6)⟩)
              (.branch 49
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 7)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 8)⟩)))
            (.branch 51
              (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 9)⟩)
              (.branch 52
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 10)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 11)⟩))))
          (.branch 56
            (.branch 54
              (.leaf ⟨BitVec.ofBool (rowBit rows 1 6 12)⟩)
              (.branch 55
                (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 0)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 1)⟩)))
            (.branch 57
              (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 2)⟩)
              (.branch 58
                (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 3)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 4)⟩)))))
        (.branch 65
          (.branch 62
            (.branch 60
              (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 5)⟩)
              (.branch 61
                (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 6)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 7)⟩)))
            (.branch 63
              (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 8)⟩)
              (.branch 64
                (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 9)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 10)⟩))))
          (.branch 68
            (.branch 66
              (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 11)⟩)
              (.branch 67
                (.leaf ⟨BitVec.ofBool (rowBit rows 2 5 12)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 0)⟩)))
            (.branch 69
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 1)⟩)
              (.branch 70
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 2)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 3)⟩))))))
      (.branch 83
        (.branch 77
          (.branch 74
            (.branch 72
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 4)⟩)
              (.branch 73
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 5)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 6)⟩)))
            (.branch 75
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 7)⟩)
              (.branch 76
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 8)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 9)⟩))))
          (.branch 80
            (.branch 78
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 10)⟩)
              (.branch 79
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 11)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 0 12)⟩)))
            (.branch 81
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 0)⟩)
              (.branch 82
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 1)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 2)⟩)))))
        (.branch 89
          (.branch 86
            (.branch 84
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 3)⟩)
              (.branch 85
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 4)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 5)⟩)))
            (.branch 87
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 6)⟩)
              (.branch 88
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 7)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 8)⟩))))
          (.branch 92
            (.branch 90
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 9)⟩)
              (.branch 91
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 10)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 11)⟩)))
            (.branch 93
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 2 12)⟩)
              (.branch 94
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 0)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 1)⟩))))))))
  (.branch 143
    (.branch 119
      (.branch 107
        (.branch 101
          (.branch 98
            (.branch 96
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 2)⟩)
              (.branch 97
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 3)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 4)⟩)))
            (.branch 99
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 5)⟩)
              (.branch 100
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 6)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 7)⟩))))
          (.branch 104
            (.branch 102
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 8)⟩)
              (.branch 103
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 9)⟩)
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 10)⟩)))
            (.branch 105
              (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 11)⟩)
              (.branch 106
                (.leaf ⟨BitVec.ofBool (rowBit rows 0 4 12)⟩)
                (.leaf ⟨rankAtom ranks 0⟩)))))
        (.branch 113
          (.branch 110
            (.branch 108
              (.leaf ⟨rankAtom ranks 1⟩)
              (.branch 109
                (.leaf ⟨rankAtom ranks 2⟩)
                (.leaf ⟨rankAtom ranks 3⟩)))
            (.branch 111
              (.leaf ⟨rankAtom ranks 4⟩)
              (.branch 112
                (.leaf ⟨rankAtom ranks 5⟩)
                (.leaf ⟨rankAtom ranks 6⟩))))
          (.branch 116
            (.branch 114
              (.leaf ⟨rankAtom ranks 7⟩)
              (.branch 115
                (.leaf ⟨rankAtom ranks 8⟩)
                (.leaf ⟨rankAtom ranks 9⟩)))
            (.branch 117
              (.leaf ⟨rankAtom ranks 10⟩)
              (.branch 118
                (.leaf ⟨rankAtom ranks 11⟩)
                (.leaf ⟨rankAtom ranks 12⟩))))))
      (.branch 131
        (.branch 125
          (.branch 122
            (.branch 120
              (.leaf ⟨rankAtom ranks 13⟩)
              (.branch 121
                (.leaf ⟨rankAtom ranks 14⟩)
                (.leaf ⟨rankAtom ranks 15⟩)))
            (.branch 123
              (.leaf ⟨rankAtom ranks 16⟩)
              (.branch 124
                (.leaf ⟨rankAtom ranks 17⟩)
                (.leaf ⟨rankAtom ranks 18⟩))))
          (.branch 128
            (.branch 126
              (.leaf ⟨rankAtom ranks 19⟩)
              (.branch 127
                (.leaf ⟨rankAtom ranks 20⟩)
                (.leaf ⟨rankAtom ranks 21⟩)))
            (.branch 129
              (.leaf ⟨rankAtom ranks 22⟩)
              (.branch 130
                (.leaf ⟨rankAtom ranks 23⟩)
                (.leaf ⟨rankAtom ranks 24⟩)))))
        (.branch 137
          (.branch 134
            (.branch 132
              (.leaf ⟨rankAtom ranks 25⟩)
              (.branch 133
                (.leaf ⟨rankAtom ranks 26⟩)
                (.leaf ⟨rankAtom ranks 27⟩)))
            (.branch 135
              (.leaf ⟨rankAtom ranks 28⟩)
              (.branch 136
                (.leaf ⟨rankAtom ranks 29⟩)
                (.leaf ⟨rankAtom ranks 30⟩))))
          (.branch 140
            (.branch 138
              (.leaf ⟨rankAtom ranks 31⟩)
              (.branch 139
                (.leaf ⟨rankAtom ranks 32⟩)
                (.leaf ⟨rankAtom ranks 33⟩)))
            (.branch 141
              (.leaf ⟨rankAtom ranks 34⟩)
              (.branch 142
                (.leaf ⟨rankAtom ranks 35⟩)
                (.leaf ⟨rankAtom ranks 36⟩)))))))
    (.branch 167
      (.branch 155
        (.branch 149
          (.branch 146
            (.branch 144
              (.leaf ⟨rankAtom ranks 37⟩)
              (.branch 145
                (.leaf ⟨rankAtom ranks 38⟩)
                (.leaf ⟨rankAtom ranks 39⟩)))
            (.branch 147
              (.leaf ⟨rankAtom ranks 40⟩)
              (.branch 148
                (.leaf ⟨rankAtom ranks 41⟩)
                (.leaf ⟨rankAtom ranks 42⟩))))
          (.branch 152
            (.branch 150
              (.leaf ⟨rankAtom ranks 43⟩)
              (.branch 151
                (.leaf ⟨rankAtom ranks 44⟩)
                (.leaf ⟨rankAtom ranks 45⟩)))
            (.branch 153
              (.leaf ⟨rankAtom ranks 46⟩)
              (.branch 154
                (.leaf ⟨rankAtom ranks 47⟩)
                (.leaf ⟨rankAtom ranks 48⟩)))))
        (.branch 161
          (.branch 158
            (.branch 156
              (.leaf ⟨rankAtom ranks 49⟩)
              (.branch 157
                (.leaf ⟨rankAtom ranks 50⟩)
                (.leaf ⟨rankAtom ranks 51⟩)))
            (.branch 159
              (.leaf ⟨rankAtom ranks 52⟩)
              (.branch 160
                (.leaf ⟨rankAtom ranks 53⟩)
                (.leaf ⟨rankAtom ranks 54⟩))))
          (.branch 164
            (.branch 162
              (.leaf ⟨rankAtom ranks 55⟩)
              (.branch 163
                (.leaf ⟨rankAtom ranks 56⟩)
                (.leaf ⟨rankAtom ranks 57⟩)))
            (.branch 165
              (.leaf ⟨rankAtom ranks 58⟩)
              (.branch 166
                (.leaf ⟨rankAtom ranks 59⟩)
                (.leaf ⟨rankAtom ranks 60⟩))))))
      (.branch 179
        (.branch 173
          (.branch 170
            (.branch 168
              (.leaf ⟨rankAtom ranks 61⟩)
              (.branch 169
                (.leaf ⟨rankAtom ranks 62⟩)
                (.leaf ⟨rankAtom ranks 63⟩)))
            (.branch 171
              (.leaf ⟨rankAtom ranks 64⟩)
              (.branch 172
                (.leaf ⟨rankAtom ranks 65⟩)
                (.leaf ⟨rankAtom ranks 66⟩))))
          (.branch 176
            (.branch 174
              (.leaf ⟨rankAtom ranks 67⟩)
              (.branch 175
                (.leaf ⟨rankAtom ranks 68⟩)
                (.leaf ⟨rankAtom ranks 69⟩)))
            (.branch 177
              (.leaf ⟨rankAtom ranks 70⟩)
              (.branch 178
                (.leaf ⟨rankAtom ranks 71⟩)
                (.leaf ⟨BitVec.ofBool (shellBit shell 0)⟩)))))
        (.branch 185
          (.branch 182
            (.branch 180
              (.leaf ⟨BitVec.ofBool (shellBit shell 1)⟩)
              (.branch 181
                (.leaf ⟨BitVec.ofBool (shellBit shell 2)⟩)
                (.leaf ⟨BitVec.ofBool (shellBit shell 3)⟩)))
            (.branch 183
              (.leaf ⟨BitVec.ofBool (shellBit shell 4)⟩)
              (.branch 184
                (.leaf ⟨BitVec.ofBool (shellBit shell 5)⟩)
                (.leaf ⟨BitVec.ofBool (shellBit shell 6)⟩))))
          (.branch 188
            (.branch 186
              (.leaf ⟨BitVec.ofBool (shellBit shell 7)⟩)
              (.branch 187
                (.leaf ⟨BitVec.ofBool (shellBit shell 8)⟩)
                (.leaf ⟨BitVec.ofBool (shellBit shell 9)⟩)))
            (.branch 189
              (.leaf ⟨BitVec.ofBool (shellBit shell 10)⟩)
              (.branch 190
                (.leaf ⟨BitVec.ofBool (shellBit shell 11)⟩)
                (.leaf ⟨BitVec.ofBool (shellBit shell 12)⟩))))))))

@[simp] theorem directSourceAssignment_get_000
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 0 = ⟨BitVec.ofBool (firstRowBit b1 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_001
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 1 = ⟨BitVec.ofBool (firstRowBit b1 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_002
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 2 = ⟨BitVec.ofBool (firstRowBit b1 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_003
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 3 = ⟨BitVec.ofBool (firstRowBit b1 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_004
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 4 = ⟨BitVec.ofBool (firstRowBit b1 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_005
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 5 = ⟨BitVec.ofBool (firstRowBit b1 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_006
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 6 = ⟨BitVec.ofBool (firstRowBit b1 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_007
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 7 = ⟨BitVec.ofBool (firstRowBit b1 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_008
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 8 = ⟨BitVec.ofBool (firstRowBit b1 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_009
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 9 = ⟨BitVec.ofBool (firstRowBit b1 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_010
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 10 = ⟨BitVec.ofBool (firstRowBit b1 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_011
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 11 = ⟨BitVec.ofBool (firstRowBit b1 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_012
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 12 = ⟨BitVec.ofBool (firstRowBit b1 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_013
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 13 = ⟨blockerAt blockers 0⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_014
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 14 = ⟨blockerAt blockers 1⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_015
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 15 = ⟨blockerAt blockers 2⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_016
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 16 = ⟨blockerAt blockers 3⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_017
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 17 = ⟨blockerAt blockers 4⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_018
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 18 = ⟨blockerAt blockers 5⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_019
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 19 = ⟨blockerAt blockers 6⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_020
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 20 = ⟨blockerAt blockers 7⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_021
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 21 = ⟨blockerAt blockers 8⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_022
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 22 = ⟨blockerAt blockers 9⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_023
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 23 = ⟨blockerAt blockers 10⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_024
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 24 = ⟨blockerAt blockers 11⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_025
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 25 = ⟨blockerAt blockers 12⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_026
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 26 = ⟨q⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_027
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 27 = ⟨w⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_028
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 28 = ⟨BitVec.ofBool (rowBit rows 1 2 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_029
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 29 = ⟨BitVec.ofBool (rowBit rows 1 2 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_030
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 30 = ⟨BitVec.ofBool (rowBit rows 1 2 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_031
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 31 = ⟨BitVec.ofBool (rowBit rows 1 2 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_032
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 32 = ⟨BitVec.ofBool (rowBit rows 1 2 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_033
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 33 = ⟨BitVec.ofBool (rowBit rows 1 2 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_034
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 34 = ⟨BitVec.ofBool (rowBit rows 1 2 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_035
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 35 = ⟨BitVec.ofBool (rowBit rows 1 2 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_036
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 36 = ⟨BitVec.ofBool (rowBit rows 1 2 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_037
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 37 = ⟨BitVec.ofBool (rowBit rows 1 2 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_038
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 38 = ⟨BitVec.ofBool (rowBit rows 1 2 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_039
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 39 = ⟨BitVec.ofBool (rowBit rows 1 2 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_040
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 40 = ⟨BitVec.ofBool (rowBit rows 1 2 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_041
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 41 = ⟨BitVec.ofBool (rowBit rows 1 6 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_042
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 42 = ⟨BitVec.ofBool (rowBit rows 1 6 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_043
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 43 = ⟨BitVec.ofBool (rowBit rows 1 6 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_044
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 44 = ⟨BitVec.ofBool (rowBit rows 1 6 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_045
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 45 = ⟨BitVec.ofBool (rowBit rows 1 6 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_046
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 46 = ⟨BitVec.ofBool (rowBit rows 1 6 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_047
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 47 = ⟨BitVec.ofBool (rowBit rows 1 6 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_048
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 48 = ⟨BitVec.ofBool (rowBit rows 1 6 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_049
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 49 = ⟨BitVec.ofBool (rowBit rows 1 6 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_050
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 50 = ⟨BitVec.ofBool (rowBit rows 1 6 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_051
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 51 = ⟨BitVec.ofBool (rowBit rows 1 6 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_052
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 52 = ⟨BitVec.ofBool (rowBit rows 1 6 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_053
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 53 = ⟨BitVec.ofBool (rowBit rows 1 6 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_054
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 54 = ⟨BitVec.ofBool (rowBit rows 2 5 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_055
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 55 = ⟨BitVec.ofBool (rowBit rows 2 5 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_056
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 56 = ⟨BitVec.ofBool (rowBit rows 2 5 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_057
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 57 = ⟨BitVec.ofBool (rowBit rows 2 5 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_058
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 58 = ⟨BitVec.ofBool (rowBit rows 2 5 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_059
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 59 = ⟨BitVec.ofBool (rowBit rows 2 5 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_060
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 60 = ⟨BitVec.ofBool (rowBit rows 2 5 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_061
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 61 = ⟨BitVec.ofBool (rowBit rows 2 5 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_062
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 62 = ⟨BitVec.ofBool (rowBit rows 2 5 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_063
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 63 = ⟨BitVec.ofBool (rowBit rows 2 5 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_064
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 64 = ⟨BitVec.ofBool (rowBit rows 2 5 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_065
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 65 = ⟨BitVec.ofBool (rowBit rows 2 5 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_066
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 66 = ⟨BitVec.ofBool (rowBit rows 2 5 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_067
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 67 = ⟨BitVec.ofBool (rowBit rows 0 0 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_068
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 68 = ⟨BitVec.ofBool (rowBit rows 0 0 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_069
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 69 = ⟨BitVec.ofBool (rowBit rows 0 0 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_070
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 70 = ⟨BitVec.ofBool (rowBit rows 0 0 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_071
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 71 = ⟨BitVec.ofBool (rowBit rows 0 0 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_072
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 72 = ⟨BitVec.ofBool (rowBit rows 0 0 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_073
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 73 = ⟨BitVec.ofBool (rowBit rows 0 0 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_074
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 74 = ⟨BitVec.ofBool (rowBit rows 0 0 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_075
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 75 = ⟨BitVec.ofBool (rowBit rows 0 0 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_076
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 76 = ⟨BitVec.ofBool (rowBit rows 0 0 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_077
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 77 = ⟨BitVec.ofBool (rowBit rows 0 0 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_078
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 78 = ⟨BitVec.ofBool (rowBit rows 0 0 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_079
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 79 = ⟨BitVec.ofBool (rowBit rows 0 0 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_080
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 80 = ⟨BitVec.ofBool (rowBit rows 0 2 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_081
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 81 = ⟨BitVec.ofBool (rowBit rows 0 2 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_082
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 82 = ⟨BitVec.ofBool (rowBit rows 0 2 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_083
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 83 = ⟨BitVec.ofBool (rowBit rows 0 2 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_084
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 84 = ⟨BitVec.ofBool (rowBit rows 0 2 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_085
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 85 = ⟨BitVec.ofBool (rowBit rows 0 2 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_086
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 86 = ⟨BitVec.ofBool (rowBit rows 0 2 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_087
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 87 = ⟨BitVec.ofBool (rowBit rows 0 2 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_088
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 88 = ⟨BitVec.ofBool (rowBit rows 0 2 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_089
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 89 = ⟨BitVec.ofBool (rowBit rows 0 2 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_090
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 90 = ⟨BitVec.ofBool (rowBit rows 0 2 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_091
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 91 = ⟨BitVec.ofBool (rowBit rows 0 2 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_092
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 92 = ⟨BitVec.ofBool (rowBit rows 0 2 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_093
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 93 = ⟨BitVec.ofBool (rowBit rows 0 4 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_094
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 94 = ⟨BitVec.ofBool (rowBit rows 0 4 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_095
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 95 = ⟨BitVec.ofBool (rowBit rows 0 4 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_096
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 96 = ⟨BitVec.ofBool (rowBit rows 0 4 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_097
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 97 = ⟨BitVec.ofBool (rowBit rows 0 4 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_098
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 98 = ⟨BitVec.ofBool (rowBit rows 0 4 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_099
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 99 = ⟨BitVec.ofBool (rowBit rows 0 4 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_100
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 100 = ⟨BitVec.ofBool (rowBit rows 0 4 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_101
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 101 = ⟨BitVec.ofBool (rowBit rows 0 4 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_102
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 102 = ⟨BitVec.ofBool (rowBit rows 0 4 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_103
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 103 = ⟨BitVec.ofBool (rowBit rows 0 4 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_104
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 104 = ⟨BitVec.ofBool (rowBit rows 0 4 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_105
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 105 = ⟨BitVec.ofBool (rowBit rows 0 4 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_106
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 106 = ⟨rankAtom ranks 0⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_107
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 107 = ⟨rankAtom ranks 1⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_108
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 108 = ⟨rankAtom ranks 2⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_109
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 109 = ⟨rankAtom ranks 3⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_110
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 110 = ⟨rankAtom ranks 4⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_111
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 111 = ⟨rankAtom ranks 5⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_112
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 112 = ⟨rankAtom ranks 6⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_113
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 113 = ⟨rankAtom ranks 7⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_114
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 114 = ⟨rankAtom ranks 8⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_115
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 115 = ⟨rankAtom ranks 9⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_116
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 116 = ⟨rankAtom ranks 10⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_117
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 117 = ⟨rankAtom ranks 11⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_118
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 118 = ⟨rankAtom ranks 12⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_119
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 119 = ⟨rankAtom ranks 13⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_120
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 120 = ⟨rankAtom ranks 14⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_121
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 121 = ⟨rankAtom ranks 15⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_122
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 122 = ⟨rankAtom ranks 16⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_123
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 123 = ⟨rankAtom ranks 17⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_124
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 124 = ⟨rankAtom ranks 18⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_125
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 125 = ⟨rankAtom ranks 19⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_126
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 126 = ⟨rankAtom ranks 20⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_127
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 127 = ⟨rankAtom ranks 21⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_128
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 128 = ⟨rankAtom ranks 22⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_129
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 129 = ⟨rankAtom ranks 23⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_130
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 130 = ⟨rankAtom ranks 24⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_131
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 131 = ⟨rankAtom ranks 25⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_132
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 132 = ⟨rankAtom ranks 26⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_133
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 133 = ⟨rankAtom ranks 27⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_134
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 134 = ⟨rankAtom ranks 28⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_135
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 135 = ⟨rankAtom ranks 29⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_136
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 136 = ⟨rankAtom ranks 30⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_137
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 137 = ⟨rankAtom ranks 31⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_138
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 138 = ⟨rankAtom ranks 32⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_139
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 139 = ⟨rankAtom ranks 33⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_140
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 140 = ⟨rankAtom ranks 34⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_141
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 141 = ⟨rankAtom ranks 35⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_142
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 142 = ⟨rankAtom ranks 36⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_143
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 143 = ⟨rankAtom ranks 37⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_144
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 144 = ⟨rankAtom ranks 38⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_145
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 145 = ⟨rankAtom ranks 39⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_146
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 146 = ⟨rankAtom ranks 40⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_147
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 147 = ⟨rankAtom ranks 41⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_148
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 148 = ⟨rankAtom ranks 42⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_149
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 149 = ⟨rankAtom ranks 43⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_150
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 150 = ⟨rankAtom ranks 44⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_151
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 151 = ⟨rankAtom ranks 45⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_152
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 152 = ⟨rankAtom ranks 46⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_153
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 153 = ⟨rankAtom ranks 47⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_154
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 154 = ⟨rankAtom ranks 48⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_155
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 155 = ⟨rankAtom ranks 49⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_156
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 156 = ⟨rankAtom ranks 50⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_157
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 157 = ⟨rankAtom ranks 51⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_158
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 158 = ⟨rankAtom ranks 52⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_159
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 159 = ⟨rankAtom ranks 53⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_160
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 160 = ⟨rankAtom ranks 54⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_161
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 161 = ⟨rankAtom ranks 55⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_162
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 162 = ⟨rankAtom ranks 56⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_163
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 163 = ⟨rankAtom ranks 57⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_164
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 164 = ⟨rankAtom ranks 58⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_165
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 165 = ⟨rankAtom ranks 59⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_166
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 166 = ⟨rankAtom ranks 60⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_167
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 167 = ⟨rankAtom ranks 61⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_168
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 168 = ⟨rankAtom ranks 62⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_169
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 169 = ⟨rankAtom ranks 63⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_170
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 170 = ⟨rankAtom ranks 64⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_171
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 171 = ⟨rankAtom ranks 65⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_172
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 172 = ⟨rankAtom ranks 66⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_173
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 173 = ⟨rankAtom ranks 67⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_174
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 174 = ⟨rankAtom ranks 68⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_175
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 175 = ⟨rankAtom ranks 69⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_176
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 176 = ⟨rankAtom ranks 70⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_177
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 177 = ⟨rankAtom ranks 71⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_178
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 178 = ⟨BitVec.ofBool (shellBit shell 0)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_179
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 179 = ⟨BitVec.ofBool (shellBit shell 1)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_180
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 180 = ⟨BitVec.ofBool (shellBit shell 2)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_181
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 181 = ⟨BitVec.ofBool (shellBit shell 3)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_182
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 182 = ⟨BitVec.ofBool (shellBit shell 4)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_183
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 183 = ⟨BitVec.ofBool (shellBit shell 5)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_184
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 184 = ⟨BitVec.ofBool (shellBit shell 6)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_185
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 185 = ⟨BitVec.ofBool (shellBit shell 7)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_186
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 186 = ⟨BitVec.ofBool (shellBit shell 8)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_187
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 187 = ⟨BitVec.ofBool (shellBit shell 9)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_188
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 188 = ⟨BitVec.ofBool (shellBit shell 10)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_189
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 189 = ⟨BitVec.ofBool (shellBit shell 11)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl

@[simp] theorem directSourceAssignment_get_190
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get 190 = ⟨BitVec.ofBool (shellBit shell 12)⟩ := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl


@[simp 1100] theorem directSourceAssignment_eval_var_000
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 0) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 0) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_000]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_001
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 1) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 1) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_001]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_002
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 2) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 2) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_002]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_003
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 3) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 3) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_003]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_004
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 4) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 4) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_004]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_005
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 5) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 5) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_005]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_006
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 6) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 6) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_006]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_007
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 7) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 7) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_007]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_008
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 8) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 8) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_008]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_009
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 9) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 9) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_009]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_010
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 10) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 10) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_010]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_011
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 11) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 11) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_011]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_012
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 12) : BVExpr 1) = BitVec.ofBool (firstRowBit b1 12) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_012]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_013
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 13) : BVExpr 4) = blockerAt blockers 0 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_013]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_014
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 14) : BVExpr 4) = blockerAt blockers 1 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_014]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_015
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 15) : BVExpr 4) = blockerAt blockers 2 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_015]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_016
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 16) : BVExpr 4) = blockerAt blockers 3 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_016]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_017
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 17) : BVExpr 4) = blockerAt blockers 4 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_017]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_018
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 18) : BVExpr 4) = blockerAt blockers 5 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_018]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_019
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 19) : BVExpr 4) = blockerAt blockers 6 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_019]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_020
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 20) : BVExpr 4) = blockerAt blockers 7 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_020]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_021
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 21) : BVExpr 4) = blockerAt blockers 8 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_021]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_022
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 22) : BVExpr 4) = blockerAt blockers 9 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_022]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_023
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 23) : BVExpr 4) = blockerAt blockers 10 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_023]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_024
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 24) : BVExpr 4) = blockerAt blockers 11 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_024]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_025
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 25) : BVExpr 4) = blockerAt blockers 12 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_025]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_026
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 26) : BVExpr 4) = q := by
  rw [BVExpr.eval_var, directSourceAssignment_get_026]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_027
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 27) : BVExpr 4) = w := by
  rw [BVExpr.eval_var, directSourceAssignment_get_027]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_028
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 28) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 0) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_028]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_029
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 29) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 1) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_029]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_030
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 30) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 2) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_030]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_031
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 31) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 3) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_031]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_032
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 32) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 4) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_032]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_033
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 33) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 5) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_033]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_034
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 34) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 6) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_034]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_035
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 35) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 7) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_035]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_036
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 36) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 8) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_036]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_037
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 37) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 9) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_037]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_038
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 38) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 10) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_038]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_039
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 39) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 11) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_039]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_040
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 40) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 2 12) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_040]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_041
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 41) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 0) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_041]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_042
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 42) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 1) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_042]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_043
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 43) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 2) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_043]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_044
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 44) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 3) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_044]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_045
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 45) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 4) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_045]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_046
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 46) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 5) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_046]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_047
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 47) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 6) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_047]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_048
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 48) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 7) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_048]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_049
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 49) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 8) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_049]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_050
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 50) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 9) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_050]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_051
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 51) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 10) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_051]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_052
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 52) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 11) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_052]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_053
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 53) : BVExpr 1) = BitVec.ofBool (rowBit rows 1 6 12) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_053]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_054
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 54) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 0) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_054]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_055
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 55) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 1) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_055]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_056
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 56) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 2) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_056]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_057
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 57) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 3) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_057]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_058
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 58) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 4) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_058]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_059
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 59) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 5) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_059]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_060
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 60) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 6) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_060]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_061
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 61) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 7) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_061]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_062
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 62) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 8) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_062]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_063
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 63) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 9) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_063]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_064
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 64) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 10) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_064]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_065
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 65) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 11) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_065]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_066
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 66) : BVExpr 1) = BitVec.ofBool (rowBit rows 2 5 12) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_066]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_067
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 67) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 0) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_067]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_068
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 68) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 1) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_068]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_069
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 69) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 2) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_069]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_070
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 70) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 3) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_070]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_071
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 71) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 4) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_071]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_072
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 72) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 5) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_072]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_073
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 73) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 6) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_073]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_074
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 74) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 7) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_074]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_075
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 75) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 8) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_075]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_076
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 76) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 9) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_076]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_077
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 77) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 10) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_077]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_078
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 78) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 11) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_078]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_079
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 79) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 0 12) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_079]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_080
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 80) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 0) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_080]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_081
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 81) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 1) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_081]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_082
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 82) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 2) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_082]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_083
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 83) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 3) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_083]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_084
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 84) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 4) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_084]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_085
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 85) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 5) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_085]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_086
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 86) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 6) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_086]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_087
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 87) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 7) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_087]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_088
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 88) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 8) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_088]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_089
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 89) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 9) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_089]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_090
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 90) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 10) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_090]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_091
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 91) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 11) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_091]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_092
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 92) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 2 12) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_092]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_093
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 93) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 0) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_093]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_094
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 94) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 1) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_094]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_095
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 95) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 2) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_095]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_096
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 96) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 3) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_096]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_097
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 97) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 4) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_097]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_098
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 98) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 5) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_098]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_099
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 99) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 6) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_099]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_100
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 100) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 7) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_100]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_101
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 101) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 8) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_101]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_102
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 102) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 9) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_102]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_103
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 103) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 10) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_103]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_104
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 104) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 11) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_104]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_105
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 105) : BVExpr 1) = BitVec.ofBool (rowBit rows 0 4 12) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_105]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_106
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 106) : BVExpr 7) = rankAtom ranks 0 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_106]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_107
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 107) : BVExpr 7) = rankAtom ranks 1 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_107]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_108
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 108) : BVExpr 7) = rankAtom ranks 2 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_108]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_109
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 109) : BVExpr 7) = rankAtom ranks 3 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_109]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_110
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 110) : BVExpr 7) = rankAtom ranks 4 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_110]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_111
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 111) : BVExpr 7) = rankAtom ranks 5 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_111]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_112
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 112) : BVExpr 7) = rankAtom ranks 6 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_112]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_113
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 113) : BVExpr 7) = rankAtom ranks 7 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_113]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_114
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 114) : BVExpr 7) = rankAtom ranks 8 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_114]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_115
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 115) : BVExpr 7) = rankAtom ranks 9 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_115]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_116
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 116) : BVExpr 7) = rankAtom ranks 10 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_116]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_117
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 117) : BVExpr 7) = rankAtom ranks 11 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_117]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_118
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 118) : BVExpr 7) = rankAtom ranks 12 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_118]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_119
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 119) : BVExpr 7) = rankAtom ranks 13 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_119]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_120
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 120) : BVExpr 7) = rankAtom ranks 14 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_120]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_121
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 121) : BVExpr 7) = rankAtom ranks 15 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_121]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_122
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 122) : BVExpr 7) = rankAtom ranks 16 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_122]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_123
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 123) : BVExpr 7) = rankAtom ranks 17 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_123]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_124
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 124) : BVExpr 7) = rankAtom ranks 18 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_124]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_125
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 125) : BVExpr 7) = rankAtom ranks 19 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_125]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_126
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 126) : BVExpr 7) = rankAtom ranks 20 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_126]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_127
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 127) : BVExpr 7) = rankAtom ranks 21 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_127]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_128
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 128) : BVExpr 7) = rankAtom ranks 22 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_128]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_129
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 129) : BVExpr 7) = rankAtom ranks 23 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_129]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_130
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 130) : BVExpr 7) = rankAtom ranks 24 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_130]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_131
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 131) : BVExpr 7) = rankAtom ranks 25 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_131]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_132
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 132) : BVExpr 7) = rankAtom ranks 26 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_132]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_133
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 133) : BVExpr 7) = rankAtom ranks 27 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_133]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_134
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 134) : BVExpr 7) = rankAtom ranks 28 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_134]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_135
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 135) : BVExpr 7) = rankAtom ranks 29 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_135]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_136
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 136) : BVExpr 7) = rankAtom ranks 30 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_136]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_137
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 137) : BVExpr 7) = rankAtom ranks 31 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_137]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_138
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 138) : BVExpr 7) = rankAtom ranks 32 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_138]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_139
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 139) : BVExpr 7) = rankAtom ranks 33 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_139]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_140
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 140) : BVExpr 7) = rankAtom ranks 34 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_140]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_141
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 141) : BVExpr 7) = rankAtom ranks 35 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_141]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_142
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 142) : BVExpr 7) = rankAtom ranks 36 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_142]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_143
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 143) : BVExpr 7) = rankAtom ranks 37 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_143]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_144
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 144) : BVExpr 7) = rankAtom ranks 38 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_144]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_145
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 145) : BVExpr 7) = rankAtom ranks 39 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_145]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_146
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 146) : BVExpr 7) = rankAtom ranks 40 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_146]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_147
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 147) : BVExpr 7) = rankAtom ranks 41 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_147]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_148
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 148) : BVExpr 7) = rankAtom ranks 42 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_148]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_149
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 149) : BVExpr 7) = rankAtom ranks 43 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_149]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_150
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 150) : BVExpr 7) = rankAtom ranks 44 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_150]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_151
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 151) : BVExpr 7) = rankAtom ranks 45 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_151]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_152
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 152) : BVExpr 7) = rankAtom ranks 46 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_152]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_153
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 153) : BVExpr 7) = rankAtom ranks 47 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_153]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_154
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 154) : BVExpr 7) = rankAtom ranks 48 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_154]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_155
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 155) : BVExpr 7) = rankAtom ranks 49 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_155]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_156
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 156) : BVExpr 7) = rankAtom ranks 50 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_156]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_157
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 157) : BVExpr 7) = rankAtom ranks 51 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_157]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_158
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 158) : BVExpr 7) = rankAtom ranks 52 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_158]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_159
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 159) : BVExpr 7) = rankAtom ranks 53 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_159]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_160
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 160) : BVExpr 7) = rankAtom ranks 54 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_160]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_161
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 161) : BVExpr 7) = rankAtom ranks 55 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_161]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_162
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 162) : BVExpr 7) = rankAtom ranks 56 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_162]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_163
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 163) : BVExpr 7) = rankAtom ranks 57 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_163]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_164
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 164) : BVExpr 7) = rankAtom ranks 58 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_164]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_165
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 165) : BVExpr 7) = rankAtom ranks 59 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_165]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_166
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 166) : BVExpr 7) = rankAtom ranks 60 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_166]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_167
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 167) : BVExpr 7) = rankAtom ranks 61 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_167]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_168
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 168) : BVExpr 7) = rankAtom ranks 62 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_168]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_169
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 169) : BVExpr 7) = rankAtom ranks 63 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_169]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_170
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 170) : BVExpr 7) = rankAtom ranks 64 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_170]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_171
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 171) : BVExpr 7) = rankAtom ranks 65 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_171]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_172
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 172) : BVExpr 7) = rankAtom ranks 66 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_172]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_173
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 173) : BVExpr 7) = rankAtom ranks 67 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_173]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_174
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 174) : BVExpr 7) = rankAtom ranks 68 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_174]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_175
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 175) : BVExpr 7) = rankAtom ranks 69 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_175]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_176
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 176) : BVExpr 7) = rankAtom ranks 70 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_176]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_177
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 177) : BVExpr 7) = rankAtom ranks 71 := by
  rw [BVExpr.eval_var, directSourceAssignment_get_177]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_178
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 178) : BVExpr 1) = BitVec.ofBool (shellBit shell 0) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_178]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_179
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 179) : BVExpr 1) = BitVec.ofBool (shellBit shell 1) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_179]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_180
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 180) : BVExpr 1) = BitVec.ofBool (shellBit shell 2) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_180]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_181
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 181) : BVExpr 1) = BitVec.ofBool (shellBit shell 3) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_181]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_182
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 182) : BVExpr 1) = BitVec.ofBool (shellBit shell 4) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_182]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_183
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 183) : BVExpr 1) = BitVec.ofBool (shellBit shell 5) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_183]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_184
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 184) : BVExpr 1) = BitVec.ofBool (shellBit shell 6) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_184]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_185
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 185) : BVExpr 1) = BitVec.ofBool (shellBit shell 7) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_185]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_186
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 186) : BVExpr 1) = BitVec.ofBool (shellBit shell 8) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_186]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_187
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 187) : BVExpr 1) = BitVec.ofBool (shellBit shell 9) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_187]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_188
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 188) : BVExpr 1) = BitVec.ofBool (shellBit shell 10) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_188]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_189
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 189) : BVExpr 1) = BitVec.ofBool (shellBit shell 11) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_189]
  simp

@[simp 1100] theorem directSourceAssignment_eval_var_190
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var 190) : BVExpr 1) = BitVec.ofBool (shellBit shell 12) := by
  rw [BVExpr.eval_var, directSourceAssignment_get_190]
  simp


theorem directChunk000_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0000 : (!(rowBit rows 0 0 0)) = true)
    (h0001 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 1 then 1#4 else 0#4) + (bif rowBit rows 0 0 2 then 1#4 else 0#4) + (bif rowBit rows 0 0 3 then 1#4 else 0#4) + (bif rowBit rows 0 0 4 then 1#4 else 0#4) + (bif rowBit rows 0 0 5 then 1#4 else 0#4) + (bif rowBit rows 0 0 6 then 1#4 else 0#4) + (bif rowBit rows 0 0 7 then 1#4 else 0#4) + (bif rowBit rows 0 0 8 then 1#4 else 0#4) + (bif rowBit rows 0 0 9 then 1#4 else 0#4) + (bif rowBit rows 0 0 10 then 1#4 else 0#4) + (bif rowBit rows 0 0 11 then 1#4 else 0#4) + (bif rowBit rows 0 0 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0002 : (!(rowBit rows 0 2 2)) = true)
    (h0003 : ((((bif rowBit rows 0 2 0 then 1#4 else 0#4) + (bif rowBit rows 0 2 1 then 1#4 else 0#4) + (bif rowBit rows 0 2 2 then 1#4 else 0#4) + (bif rowBit rows 0 2 3 then 1#4 else 0#4) + (bif rowBit rows 0 2 4 then 1#4 else 0#4) + (bif rowBit rows 0 2 5 then 1#4 else 0#4) + (bif rowBit rows 0 2 6 then 1#4 else 0#4) + (bif rowBit rows 0 2 7 then 1#4 else 0#4) + (bif rowBit rows 0 2 8 then 1#4 else 0#4) + (bif rowBit rows 0 2 9 then 1#4 else 0#4) + (bif rowBit rows 0 2 10 then 1#4 else 0#4) + (bif rowBit rows 0 2 11 then 1#4 else 0#4) + (bif rowBit rows 0 2 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0004 : (!(rowBit rows 0 4 4)) = true)
    (h0005 : ((((bif rowBit rows 0 4 0 then 1#4 else 0#4) + (bif rowBit rows 0 4 1 then 1#4 else 0#4) + (bif rowBit rows 0 4 2 then 1#4 else 0#4) + (bif rowBit rows 0 4 3 then 1#4 else 0#4) + (bif rowBit rows 0 4 4 then 1#4 else 0#4) + (bif rowBit rows 0 4 5 then 1#4 else 0#4) + (bif rowBit rows 0 4 6 then 1#4 else 0#4) + (bif rowBit rows 0 4 7 then 1#4 else 0#4) + (bif rowBit rows 0 4 8 then 1#4 else 0#4) + (bif rowBit rows 0 4 9 then 1#4 else 0#4) + (bif rowBit rows 0 4 10 then 1#4 else 0#4) + (bif rowBit rows 0 4 11 then 1#4 else 0#4) + (bif rowBit rows 0 4 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0006 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 0 2 3 && rowBit rows 0 2 5))) = true)
    (h0007 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 2 3 && rowBit rows 0 2 6))) = true)
    (h0008 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 0 2 3 && rowBit rows 0 2 7))) = true)
    (h0009 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 8 && rowBit rows 0 2 3 && rowBit rows 0 2 8))) = true)
    (h0010 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 2 5 && rowBit rows 0 2 6))) = true)
    (h0011 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 0 2 5 && rowBit rows 0 2 7))) = true)
    (h0012 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 8 && rowBit rows 0 2 5 && rowBit rows 0 2 8))) = true)
    (h0013 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 9 && rowBit rows 0 2 5 && rowBit rows 0 2 9))) = true)
    (h0014 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 10 && rowBit rows 0 2 5 && rowBit rows 0 2 10))) = true)
    (h0015 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 12 && rowBit rows 0 2 5 && rowBit rows 0 2 12))) = true)
    (h0016 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 2 6 && rowBit rows 0 2 7))) = true)
    (h0017 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 2 6 && rowBit rows 0 2 8))) = true)
    (h0018 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 2 6 && rowBit rows 0 2 9))) = true)
    (h0019 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 2 6 && rowBit rows 0 2 10))) = true)
    (h0020 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 2 6 && rowBit rows 0 2 11))) = true)
    (h0021 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 0 2 6 && rowBit rows 0 2 12))) = true)
    (h0022 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 2 7 && rowBit rows 0 2 8))) = true)
    (h0023 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 2 7 && rowBit rows 0 2 9))) = true)
    (h0024 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 2 7 && rowBit rows 0 2 10))) = true)
    (h0025 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 2 7 && rowBit rows 0 2 11))) = true)
    (h0026 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 2 7 && rowBit rows 0 2 12))) = true)
    (h0027 : ((((bif rowBit rows 0 4 4 then 1#4 else 0#4) + (bif rowBit rows 0 4 5 then 1#4 else 0#4) + (bif rowBit rows 0 4 6 then 1#4 else 0#4) + (bif rowBit rows 0 4 7 then 1#4 else 0#4) + (bif rowBit rows 0 4 8 then 1#4 else 0#4))).ule 1#4) = true)
    (h0028 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 8 then 1#4 else 0#4) + (bif rowBit rows 0 0 9 then 1#4 else 0#4) + (bif rowBit rows 0 0 10 then 1#4 else 0#4) + (bif rowBit rows 0 0 11 then 1#4 else 0#4) + (bif rowBit rows 0 0 12 then 1#4 else 0#4))).ule 1#4) = true)
    (h0029 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 1 then 1#4 else 0#4) + (bif rowBit rows 0 0 2 then 1#4 else 0#4) + (bif rowBit rows 0 0 3 then 1#4 else 0#4) + (bif rowBit rows 0 0 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h0030 : ((((bif rowBit rows 0 4 0 then 1#4 else 0#4) + (bif rowBit rows 0 4 1 then 1#4 else 0#4) + (bif rowBit rows 0 4 2 then 1#4 else 0#4) + (bif rowBit rows 0 4 3 then 1#4 else 0#4) + (bif rowBit rows 0 4 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h0031 : (!(rowBit rows 1 2 2)) = true)
    (h0032 : ((((bif rowBit rows 1 2 0 then 1#4 else 0#4) + (bif rowBit rows 1 2 1 then 1#4 else 0#4) + (bif rowBit rows 1 2 2 then 1#4 else 0#4) + (bif rowBit rows 1 2 3 then 1#4 else 0#4) + (bif rowBit rows 1 2 4 then 1#4 else 0#4) + (bif rowBit rows 1 2 5 then 1#4 else 0#4) + (bif rowBit rows 1 2 6 then 1#4 else 0#4) + (bif rowBit rows 1 2 7 then 1#4 else 0#4) + (bif rowBit rows 1 2 8 then 1#4 else 0#4) + (bif rowBit rows 1 2 9 then 1#4 else 0#4) + (bif rowBit rows 1 2 10 then 1#4 else 0#4) + (bif rowBit rows 1 2 11 then 1#4 else 0#4) + (bif rowBit rows 1 2 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0033 : (!(rowBit rows 1 6 6)) = true)
    (h0034 : ((((bif rowBit rows 1 6 0 then 1#4 else 0#4) + (bif rowBit rows 1 6 1 then 1#4 else 0#4) + (bif rowBit rows 1 6 2 then 1#4 else 0#4) + (bif rowBit rows 1 6 3 then 1#4 else 0#4) + (bif rowBit rows 1 6 4 then 1#4 else 0#4) + (bif rowBit rows 1 6 5 then 1#4 else 0#4) + (bif rowBit rows 1 6 6 then 1#4 else 0#4) + (bif rowBit rows 1 6 7 then 1#4 else 0#4) + (bif rowBit rows 1 6 8 then 1#4 else 0#4) + (bif rowBit rows 1 6 9 then 1#4 else 0#4) + (bif rowBit rows 1 6 10 then 1#4 else 0#4) + (bif rowBit rows 1 6 11 then 1#4 else 0#4) + (bif rowBit rows 1 6 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0035 : (!((rowBit rows 1 2 1 && rowBit rows 1 2 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7))) = true)
    (h0036 : ((((bif rowBit rows 1 6 4 then 1#4 else 0#4) + (bif rowBit rows 1 6 5 then 1#4 else 0#4) + (bif rowBit rows 1 6 6 then 1#4 else 0#4) + (bif rowBit rows 1 6 7 then 1#4 else 0#4) + (bif rowBit rows 1 6 8 then 1#4 else 0#4))).ule 2#4) = true)
    (h0037 : (!(rowBit rows 2 5 5)) = true)
    (h0038 : ((((bif rowBit rows 2 5 0 then 1#4 else 0#4) + (bif rowBit rows 2 5 1 then 1#4 else 0#4) + (bif rowBit rows 2 5 2 then 1#4 else 0#4) + (bif rowBit rows 2 5 3 then 1#4 else 0#4) + (bif rowBit rows 2 5 4 then 1#4 else 0#4) + (bif rowBit rows 2 5 5 then 1#4 else 0#4) + (bif rowBit rows 2 5 6 then 1#4 else 0#4) + (bif rowBit rows 2 5 7 then 1#4 else 0#4) + (bif rowBit rows 2 5 8 then 1#4 else 0#4) + (bif rowBit rows 2 5 9 then 1#4 else 0#4) + (bif rowBit rows 2 5 10 then 1#4 else 0#4) + (bif rowBit rows 2 5 11 then 1#4 else 0#4) + (bif rowBit rows 2 5 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0039 : ((((bif rowBit rows 2 5 4 then 1#4 else 0#4) + (bif rowBit rows 2 5 5 then 1#4 else 0#4) + (bif rowBit rows 2 5 6 then 1#4 else 0#4) + (bif rowBit rows 2 5 7 then 1#4 else 0#4) + (bif rowBit rows 2 5 8 then 1#4 else 0#4))).ule 2#4) = true)
    (h0040 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 5 && rowBit rows 1 6 1 && rowBit rows 1 6 5))) = true)
    (h0041 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 5 && rowBit rows 1 6 2 && rowBit rows 1 6 5))) = true)
    (h0042 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 1 6 3 && rowBit rows 1 6 5))) = true)
    (h0043 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 1 6 4 && rowBit rows 1 6 5))) = true)
    (h0044 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8))) = true)
    (h0045 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 1 6 7 && rowBit rows 1 6 9))) = true)
    (h0046 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10))) = true)
    (h0047 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11))) = true)
    (h0048 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12))) = true)
    (h0049 : ((((bif (rowBit rows 0 2 0 && rowBit rows 1 6 0) then 1#4 else 0#4) + (bif (rowBit rows 0 2 1 && rowBit rows 1 6 1) then 1#4 else 0#4) + (bif (rowBit rows 0 2 2 && rowBit rows 1 6 2) then 1#4 else 0#4) + (bif (rowBit rows 0 2 3 && rowBit rows 1 6 3) then 1#4 else 0#4) + (bif (rowBit rows 0 2 4 && rowBit rows 1 6 4) then 1#4 else 0#4) + (bif (rowBit rows 0 2 5 && rowBit rows 1 6 5) then 1#4 else 0#4) + (bif (rowBit rows 0 2 6 && rowBit rows 1 6 6) then 1#4 else 0#4) + (bif (rowBit rows 0 2 7 && rowBit rows 1 6 7) then 1#4 else 0#4) + (bif (rowBit rows 0 2 8 && rowBit rows 1 6 8) then 1#4 else 0#4) + (bif (rowBit rows 0 2 9 && rowBit rows 1 6 9) then 1#4 else 0#4) + (bif (rowBit rows 0 2 10 && rowBit rows 1 6 10) then 1#4 else 0#4) + (bif (rowBit rows 0 2 11 && rowBit rows 1 6 11) then 1#4 else 0#4) + (bif (rowBit rows 0 2 12 && rowBit rows 1 6 12) then 1#4 else 0#4))).ule 2#4) = true)
    (h0050 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7))) = true)
    (h0051 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 1 6 1 && rowBit rows 1 6 8))) = true)
    (h0052 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 9 && rowBit rows 1 6 1 && rowBit rows 1 6 9))) = true)
    (h0053 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 1 6 1 && rowBit rows 1 6 10))) = true)
    (h0054 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 1 6 1 && rowBit rows 1 6 11))) = true)
    (h0055 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 1 6 1 && rowBit rows 1 6 12))) = true)
    (h0056 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 5 && rowBit rows 1 6 3 && rowBit rows 1 6 5))) = true)
    (h0057 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8))) = true)
    (h0058 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10))) = true)
    (h0059 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11))) = true)
    (h0060 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12))) = true)
    (h0061 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 1 6 8 && rowBit rows 1 6 9))) = true)
    (h0062 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 1 6 8 && rowBit rows 1 6 10))) = true)
    (h0063 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 1 6 8 && rowBit rows 1 6 11))) = true) :
    ∀ item ∈ directChunk000Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk000Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0000
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0001 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0002
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0003 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0004
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0005 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0006
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0007
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0008
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0009
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0010
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0011
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0012
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0013
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0014
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0015
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0016
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0017
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0018
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0019
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0020
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0021
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0022
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0023
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0024
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0025
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0026
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0027 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0028 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0029 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0030 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0031
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0032 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0033
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0034 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0035
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0036 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0037
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0038 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0039 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0040
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0041
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0042
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0043
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0044
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0045
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0046
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0047
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0048
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0049 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0050
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0051
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0052
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0053
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0054
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0055
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0056
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0057
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0058
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0059
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0060
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0061
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0062
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0063

theorem directChunk001_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0064 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12))) = true)
    (h0065 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 2 5 6 && rowBit rows 2 5 7))) = true)
    (h0066 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 2 5 6 && rowBit rows 2 5 8))) = true)
    (h0067 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 2 5 6 && rowBit rows 2 5 9))) = true)
    (h0068 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 2 5 6 && rowBit rows 2 5 10))) = true)
    (h0069 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 2 5 6 && rowBit rows 2 5 11))) = true)
    (h0070 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 2 5 6 && rowBit rows 2 5 12))) = true)
    (h0071 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 2 5 7 && rowBit rows 2 5 8))) = true)
    (h0072 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 2 5 7 && rowBit rows 2 5 9))) = true)
    (h0073 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 2 5 7 && rowBit rows 2 5 10))) = true)
    (h0074 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 2 5 7 && rowBit rows 2 5 11))) = true)
    (h0075 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 2 5 7 && rowBit rows 2 5 12))) = true)
    (h0076 : ((((bif (rowBit rows 0 2 0 && rowBit rows 2 5 0) then 1#4 else 0#4) + (bif (rowBit rows 0 2 1 && rowBit rows 2 5 1) then 1#4 else 0#4) + (bif (rowBit rows 0 2 2 && rowBit rows 2 5 2) then 1#4 else 0#4) + (bif (rowBit rows 0 2 3 && rowBit rows 2 5 3) then 1#4 else 0#4) + (bif (rowBit rows 0 2 4 && rowBit rows 2 5 4) then 1#4 else 0#4) + (bif (rowBit rows 0 2 5 && rowBit rows 2 5 5) then 1#4 else 0#4) + (bif (rowBit rows 0 2 6 && rowBit rows 2 5 6) then 1#4 else 0#4) + (bif (rowBit rows 0 2 7 && rowBit rows 2 5 7) then 1#4 else 0#4) + (bif (rowBit rows 0 2 8 && rowBit rows 2 5 8) then 1#4 else 0#4) + (bif (rowBit rows 0 2 9 && rowBit rows 2 5 9) then 1#4 else 0#4) + (bif (rowBit rows 0 2 10 && rowBit rows 2 5 10) then 1#4 else 0#4) + (bif (rowBit rows 0 2 11 && rowBit rows 2 5 11) then 1#4 else 0#4) + (bif (rowBit rows 0 2 12 && rowBit rows 2 5 12) then 1#4 else 0#4))).ule 2#4) = true)
    (h0077 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 6 && rowBit rows 2 5 1 && rowBit rows 2 5 6))) = true)
    (h0078 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 2 5 1 && rowBit rows 2 5 7))) = true)
    (h0079 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 2 5 1 && rowBit rows 2 5 8))) = true)
    (h0080 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 2 5 1 && rowBit rows 2 5 10))) = true)
    (h0081 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 2 5 1 && rowBit rows 2 5 11))) = true)
    (h0082 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 2 5 1 && rowBit rows 2 5 12))) = true)
    (h0083 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 7 && rowBit rows 2 5 6 && rowBit rows 2 5 7))) = true)
    (h0084 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 8 && rowBit rows 2 5 6 && rowBit rows 2 5 8))) = true)
    (h0085 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 9 && rowBit rows 2 5 6 && rowBit rows 2 5 9))) = true)
    (h0086 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 12 && rowBit rows 2 5 6 && rowBit rows 2 5 12))) = true)
    (h0087 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 2 5 7 && rowBit rows 2 5 8))) = true)
    (h0088 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 9 && rowBit rows 2 5 7 && rowBit rows 2 5 9))) = true)
    (h0089 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 2 5 7 && rowBit rows 2 5 10))) = true)
    (h0090 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 2 5 7 && rowBit rows 2 5 11))) = true)
    (h0091 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 2 5 7 && rowBit rows 2 5 12))) = true)
    (h0092 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 2 5 8 && rowBit rows 2 5 9))) = true)
    (h0093 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 2 5 8 && rowBit rows 2 5 10))) = true)
    (h0094 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 2 5 8 && rowBit rows 2 5 11))) = true)
    (h0095 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 2 5 8 && rowBit rows 2 5 12))) = true)
    (h0096 : (!((rowBit rows 2 5 0 && rowBit rows 2 5 4 && rowBit rows 1 6 0 && rowBit rows 1 6 4))) = true)
    (h0097 : (!((rowBit rows 2 5 0 && rowBit rows 2 5 7 && rowBit rows 1 6 0 && rowBit rows 1 6 7))) = true)
    (h0098 : (!((rowBit rows 2 5 0 && rowBit rows 2 5 8 && rowBit rows 1 6 0 && rowBit rows 1 6 8))) = true)
    (h0099 : (!((rowBit rows 2 5 1 && rowBit rows 2 5 4 && rowBit rows 1 6 1 && rowBit rows 1 6 4))) = true)
    (h0100 : (!((rowBit rows 2 5 1 && rowBit rows 2 5 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7))) = true)
    (h0101 : (!((rowBit rows 2 5 1 && rowBit rows 2 5 8 && rowBit rows 1 6 1 && rowBit rows 1 6 8))) = true)
    (h0102 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 4 && rowBit rows 1 6 2 && rowBit rows 1 6 4))) = true)
    (h0103 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 7 && rowBit rows 1 6 2 && rowBit rows 1 6 7))) = true)
    (h0104 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 8 && rowBit rows 1 6 2 && rowBit rows 1 6 8))) = true)
    (h0105 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 11 && rowBit rows 1 6 2 && rowBit rows 1 6 11))) = true)
    (h0106 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 12 && rowBit rows 1 6 2 && rowBit rows 1 6 12))) = true)
    (h0107 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 4 && rowBit rows 1 6 3 && rowBit rows 1 6 4))) = true)
    (h0108 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 7 && rowBit rows 1 6 3 && rowBit rows 1 6 7))) = true)
    (h0109 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 8 && rowBit rows 1 6 3 && rowBit rows 1 6 8))) = true)
    (h0110 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 9 && rowBit rows 1 6 3 && rowBit rows 1 6 9))) = true)
    (h0111 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 10 && rowBit rows 1 6 3 && rowBit rows 1 6 10))) = true)
    (h0112 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 11 && rowBit rows 1 6 3 && rowBit rows 1 6 11))) = true)
    (h0113 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 12 && rowBit rows 1 6 3 && rowBit rows 1 6 12))) = true)
    (h0114 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 7 && rowBit rows 1 6 4 && rowBit rows 1 6 7))) = true)
    (h0115 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 8 && rowBit rows 1 6 4 && rowBit rows 1 6 8))) = true)
    (h0116 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 9 && rowBit rows 1 6 4 && rowBit rows 1 6 9))) = true)
    (h0117 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 10 && rowBit rows 1 6 4 && rowBit rows 1 6 10))) = true)
    (h0118 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 11 && rowBit rows 1 6 4 && rowBit rows 1 6 11))) = true)
    (h0119 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 12 && rowBit rows 1 6 4 && rowBit rows 1 6 12))) = true)
    (h0120 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8))) = true)
    (h0121 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 9 && rowBit rows 1 6 7 && rowBit rows 1 6 9))) = true)
    (h0122 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10))) = true)
    (h0123 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11))) = true)
    (h0124 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12))) = true)
    (h0125 : (!((rowBit rows 2 5 8 && rowBit rows 2 5 10 && rowBit rows 1 6 8 && rowBit rows 1 6 10))) = true)
    (h0126 : (!((rowBit rows 2 5 8 && rowBit rows 2 5 11 && rowBit rows 1 6 8 && rowBit rows 1 6 11))) = true)
    (h0127 : (!((rowBit rows 2 5 8 && rowBit rows 2 5 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12))) = true) :
    ∀ item ∈ directChunk001Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk001Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0071
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0075
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0076 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0079
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0087
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0095
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0098
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0099
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0103
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0104
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0111
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0113
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0114
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0115
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0119
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0124
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0125
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0126
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0127

theorem directChunk002_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0128 : ((((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 1 then 1#4 else 0#4) + (bif shellBit shell 2 then 1#4 else 0#4) + (bif shellBit shell 3 then 1#4 else 0#4) + (bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4) + (bif shellBit shell 8 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 5#4)) = true)
    (h0129 : (shellBit shell 1) = true)
    (h0130 : (shellBit shell 2) = true)
    (h0131 : (shellBit shell 3) = true)
    (h0132 : ((((bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4)) == 1#4)) = true)
    (h0133 : ((((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 1#4)) = true)
    (h0134 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 0 == rowBit rows 0 2 0)))) = true)
    (h0135 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 1 == rowBit rows 0 2 1)))) = true)
    (h0136 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 3 == rowBit rows 0 2 3)))) = true)
    (h0137 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 4 == rowBit rows 0 2 4)))) = true)
    (h0138 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 6 == rowBit rows 0 2 6)))) = true)
    (h0139 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 8 == rowBit rows 0 2 8)))) = true)
    (h0140 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 10 == rowBit rows 0 2 10)))) = true)
    (h0141 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 11 == rowBit rows 0 2 11)))) = true)
    (h0142 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 12 == rowBit rows 0 2 12)))) = true)
    (h0143 : ((((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4) + (bif firstRowBit b1 9 then 1#4 else 0#4) + (bif firstRowBit b1 10 then 1#4 else 0#4) + (bif firstRowBit b1 11 then 1#4 else 0#4) + (bif firstRowBit b1 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0144 : (!(firstRowBit b1 4)) = true)
    (h0145 : ((!((q == 9#4)) || (!(firstRowBit b1 9)))) = true)
    (h0146 : ((!((w == 9#4)) || (!(firstRowBit b1 9)))) = true)
    (h0147 : ((!((q == 10#4)) || (!(firstRowBit b1 10)))) = true)
    (h0148 : ((!((w == 10#4)) || (!(firstRowBit b1 10)))) = true)
    (h0149 : ((!((q == 11#4)) || (!(firstRowBit b1 11)))) = true)
    (h0150 : ((!((w == 11#4)) || (!(firstRowBit b1 11)))) = true)
    (h0151 : ((!((q == 12#4)) || (!(firstRowBit b1 12)))) = true)
    (h0152 : ((!((w == 12#4)) || (!(firstRowBit b1 12)))) = true)
    (h0153 : ((((bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4))).ule 1#4) = true)
    (h0154 : ((((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h0155 : (!((rowBit rows 1 6 2 && rowBit rows 1 6 1))) = true)
    (h0156 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 3))) = true)
    (h0157 : ((blockerAt blockers 1 == 2#4)) = true)
    (h0158 : (rowBit rows 0 2 1) = true)
    (h0159 : (rowBit rows 0 2 3) = true)
    (h0160 : (!(rowBit rows 0 2 0)) = true)
    (h0161 : (!(rowBit rows 0 2 4)) = true)
    (h0162 : ((2#4).ule ((bif rowBit rows 0 4 9 then 1#4 else 0#4) + (bif rowBit rows 0 4 10 then 1#4 else 0#4) + (bif rowBit rows 0 4 11 then 1#4 else 0#4) + (bif rowBit rows 0 4 12 then 1#4 else 0#4))) = true)
    (h0163 : ((2#4).ule ((bif firstRowBit b1 9 then 1#4 else 0#4) + (bif firstRowBit b1 10 then 1#4 else 0#4) + (bif firstRowBit b1 11 then 1#4 else 0#4) + (bif firstRowBit b1 12 then 1#4 else 0#4))) = true)
    (h0164 : ((((q == 9#4) && rowBit rows 0 4 9) || ((q == 10#4) && rowBit rows 0 4 10) || ((q == 11#4) && rowBit rows 0 4 11) || ((q == 12#4) && rowBit rows 0 4 12) || ((w == 9#4) && rowBit rows 0 4 9) || ((w == 10#4) && rowBit rows 0 4 10) || ((w == 11#4) && rowBit rows 0 4 11) || ((w == 12#4) && rowBit rows 0 4 12))) = true)
    (h0165 : ((((bif (rowBit rows 0 4 0 || firstRowBit b1 0) then 1#4 else 0#4) + (bif (rowBit rows 0 4 1 || firstRowBit b1 1) then 1#4 else 0#4) + (bif (rowBit rows 0 4 2 || firstRowBit b1 2) then 1#4 else 0#4) + (bif (rowBit rows 0 4 3 || firstRowBit b1 3) then 1#4 else 0#4) + (bif (rowBit rows 0 4 4 || firstRowBit b1 4) then 1#4 else 0#4) + (bif (rowBit rows 0 4 5 || firstRowBit b1 5) then 1#4 else 0#4) + (bif (rowBit rows 0 4 6 || firstRowBit b1 6) then 1#4 else 0#4) + (bif (rowBit rows 0 4 7 || firstRowBit b1 7) then 1#4 else 0#4) + (bif (rowBit rows 0 4 8 || firstRowBit b1 8) then 1#4 else 0#4) + (bif (rowBit rows 0 4 9 || firstRowBit b1 9) then 1#4 else 0#4) + (bif (rowBit rows 0 4 10 || firstRowBit b1 10) then 1#4 else 0#4) + (bif (rowBit rows 0 4 11 || firstRowBit b1 11) then 1#4 else 0#4) + (bif (rowBit rows 0 4 12 || firstRowBit b1 12) then 1#4 else 0#4)) == 6#4)) = true)
    (h0166 : ((rowBit rows 0 4 9 || firstRowBit b1 9)) = true)
    (h0167 : ((rowBit rows 0 4 10 || firstRowBit b1 10)) = true)
    (h0168 : ((rowBit rows 0 4 11 || firstRowBit b1 11)) = true)
    (h0169 : ((rowBit rows 0 4 12 || firstRowBit b1 12)) = true)
    (h0170 : ((rankAtom ranks 1).ult (78#7)) = true)
    (h0171 : ((rankAtom ranks 2).ult (78#7)) = true)
    (h0172 : ((rankAtom ranks 3).ult (78#7)) = true)
    (h0173 : ((rankAtom ranks 4).ult (78#7)) = true)
    (h0174 : ((rankAtom ranks 5).ult (78#7)) = true)
    (h0175 : ((rankAtom ranks 6).ult (78#7)) = true)
    (h0176 : ((rankAtom ranks 7).ult (78#7)) = true)
    (h0177 : ((rankAtom ranks 8).ult (78#7)) = true)
    (h0178 : ((rankAtom ranks 9).ult (78#7)) = true)
    (h0179 : ((rankAtom ranks 12).ult (78#7)) = true)
    (h0180 : ((rankAtom ranks 13).ult (78#7)) = true)
    (h0181 : ((rankAtom ranks 14).ult (78#7)) = true)
    (h0182 : ((rankAtom ranks 15).ult (78#7)) = true)
    (h0183 : ((rankAtom ranks 16).ult (78#7)) = true)
    (h0184 : ((rankAtom ranks 17).ult (78#7)) = true)
    (h0185 : ((rankAtom ranks 18).ult (78#7)) = true)
    (h0186 : ((rankAtom ranks 19).ult (78#7)) = true)
    (h0187 : ((rankAtom ranks 20).ult (78#7)) = true)
    (h0188 : ((rankAtom ranks 21).ult (78#7)) = true)
    (h0189 : ((rankAtom ranks 22).ult (78#7)) = true)
    (h0190 : ((rankAtom ranks 23).ult (78#7)) = true)
    (h0191 : ((rankAtom ranks 24).ult (78#7)) = true) :
    ∀ item ∈ directChunk002Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk002Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0128 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0130
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0131
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0132 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0133 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0135
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0142
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0143 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0148
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0149
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0150
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0151
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0152
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0153 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0154 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0159
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0161
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0162 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0163 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0164
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] at h0165 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0167
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0175
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0181
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0182
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0183
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0191

theorem directChunk003_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0192 : ((rankAtom ranks 25).ult (78#7)) = true)
    (h0193 : ((rankAtom ranks 26).ult (78#7)) = true)
    (h0194 : ((rankAtom ranks 27).ult (78#7)) = true)
    (h0195 : ((rankAtom ranks 28).ult (78#7)) = true)
    (h0196 : ((rankAtom ranks 29).ult (78#7)) = true)
    (h0197 : ((rankAtom ranks 30).ult (78#7)) = true)
    (h0198 : ((rankAtom ranks 31).ult (78#7)) = true)
    (h0199 : ((rankAtom ranks 32).ult (78#7)) = true)
    (h0200 : ((rankAtom ranks 34).ult (78#7)) = true)
    (h0201 : ((rankAtom ranks 35).ult (78#7)) = true)
    (h0202 : ((rankAtom ranks 36).ult (78#7)) = true)
    (h0203 : ((rankAtom ranks 37).ult (78#7)) = true)
    (h0204 : ((rankAtom ranks 38).ult (78#7)) = true)
    (h0205 : ((rankAtom ranks 39).ult (78#7)) = true)
    (h0206 : ((rankAtom ranks 40).ult (78#7)) = true)
    (h0207 : ((rankAtom ranks 41).ult (78#7)) = true)
    (h0208 : ((rankAtom ranks 42).ult (78#7)) = true)
    (h0209 : ((rankAtom ranks 43).ult (78#7)) = true)
    (h0210 : ((rankAtom ranks 44).ult (78#7)) = true)
    (h0211 : ((rankAtom ranks 45).ult (78#7)) = true)
    (h0212 : ((rankAtom ranks 46).ult (78#7)) = true)
    (h0213 : ((rankAtom ranks 47).ult (78#7)) = true)
    (h0214 : ((rankAtom ranks 48).ult (78#7)) = true)
    (h0215 : ((rankAtom ranks 49).ult (78#7)) = true)
    (h0216 : ((rankAtom ranks 50).ult (78#7)) = true)
    (h0217 : ((rankAtom ranks 51).ult (78#7)) = true)
    (h0218 : ((rankAtom ranks 52).ult (78#7)) = true)
    (h0219 : ((rankAtom ranks 53).ult (78#7)) = true)
    (h0220 : ((rankAtom ranks 54).ult (78#7)) = true)
    (h0221 : ((rankAtom ranks 55).ult (78#7)) = true)
    (h0222 : ((rankAtom ranks 56).ult (78#7)) = true)
    (h0223 : ((rankAtom ranks 57).ult (78#7)) = true)
    (h0224 : ((rankAtom ranks 58).ult (78#7)) = true)
    (h0225 : ((rankAtom ranks 59).ult (78#7)) = true)
    (h0226 : ((rankAtom ranks 60).ult (78#7)) = true)
    (h0227 : ((rankAtom ranks 61).ult (78#7)) = true)
    (h0228 : ((rankAtom ranks 62).ult (78#7)) = true)
    (h0229 : ((rankAtom ranks 63).ult (78#7)) = true)
    (h0230 : ((rankAtom ranks 64).ult (78#7)) = true)
    (h0231 : ((rankAtom ranks 65).ult (78#7)) = true)
    (h0232 : ((rankAtom ranks 66).ult (78#7)) = true)
    (h0233 : ((rankAtom ranks 67).ult (78#7)) = true)
    (h0234 : ((rankAtom ranks 69).ult (78#7)) = true)
    (h0235 : ((rankAtom ranks 70).ult (78#7)) = true)
    (h0236 : ((rankAtom ranks 71).ult (78#7)) = true)
    (h0237 : ((!((rowBit rows 0 0 1 && rowBit rows 0 0 5)) || ((rankAtom ranks 0 == rankAtom ranks 4)))) = true)
    (h0238 : ((!((rowBit rows 0 0 1 && rowBit rows 0 0 6)) || ((rankAtom ranks 0 == rankAtom ranks 5)))) = true)
    (h0239 : ((!((rowBit rows 0 0 1 && rowBit rows 0 0 7)) || ((rankAtom ranks 0 == rankAtom ranks 6)))) = true)
    (h0240 : ((!((rowBit rows 0 0 2 && rowBit rows 0 0 5)) || ((rankAtom ranks 1 == rankAtom ranks 4)))) = true)
    (h0241 : ((!((rowBit rows 0 0 2 && rowBit rows 0 0 6)) || ((rankAtom ranks 1 == rankAtom ranks 5)))) = true)
    (h0242 : ((!((rowBit rows 0 0 2 && rowBit rows 0 0 7)) || ((rankAtom ranks 1 == rankAtom ranks 6)))) = true)
    (h0243 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 5)) || ((rankAtom ranks 2 == rankAtom ranks 4)))) = true)
    (h0244 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 6)) || ((rankAtom ranks 2 == rankAtom ranks 5)))) = true)
    (h0245 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 7)) || ((rankAtom ranks 2 == rankAtom ranks 6)))) = true)
    (h0246 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 8)) || ((rankAtom ranks 2 == rankAtom ranks 7)))) = true)
    (h0247 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 5)) || ((rankAtom ranks 3 == rankAtom ranks 4)))) = true)
    (h0248 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 6)) || ((rankAtom ranks 3 == rankAtom ranks 5)))) = true)
    (h0249 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 7)) || ((rankAtom ranks 3 == rankAtom ranks 6)))) = true)
    (h0250 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 8)) || ((rankAtom ranks 3 == rankAtom ranks 7)))) = true)
    (h0251 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 9)) || ((rankAtom ranks 3 == rankAtom ranks 8)))) = true)
    (h0252 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 10)) || ((rankAtom ranks 3 == rankAtom ranks 9)))) = true)
    (h0253 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 11)) || ((rankAtom ranks 3 == rankAtom ranks 10)))) = true)
    (h0254 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 12)) || ((rankAtom ranks 3 == rankAtom ranks 11)))) = true)
    (h0255 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 6)) || ((rankAtom ranks 4 == rankAtom ranks 5)))) = true) :
    ∀ item ∈ directChunk003Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk003Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0199
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0207
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0215
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0223
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0231
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0239
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0247
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0255

theorem directChunk004_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0256 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 7)) || ((rankAtom ranks 4 == rankAtom ranks 6)))) = true)
    (h0257 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 8)) || ((rankAtom ranks 4 == rankAtom ranks 7)))) = true)
    (h0258 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 9)) || ((rankAtom ranks 4 == rankAtom ranks 8)))) = true)
    (h0259 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 10)) || ((rankAtom ranks 4 == rankAtom ranks 9)))) = true)
    (h0260 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 11)) || ((rankAtom ranks 4 == rankAtom ranks 10)))) = true)
    (h0261 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 12)) || ((rankAtom ranks 4 == rankAtom ranks 11)))) = true)
    (h0262 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 7)) || ((rankAtom ranks 5 == rankAtom ranks 6)))) = true)
    (h0263 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 8)) || ((rankAtom ranks 5 == rankAtom ranks 7)))) = true)
    (h0264 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 9)) || ((rankAtom ranks 5 == rankAtom ranks 8)))) = true)
    (h0265 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 10)) || ((rankAtom ranks 5 == rankAtom ranks 9)))) = true)
    (h0266 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 11)) || ((rankAtom ranks 5 == rankAtom ranks 10)))) = true)
    (h0267 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 12)) || ((rankAtom ranks 5 == rankAtom ranks 11)))) = true)
    (h0268 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 8)) || ((rankAtom ranks 6 == rankAtom ranks 7)))) = true)
    (h0269 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 9)) || ((rankAtom ranks 6 == rankAtom ranks 8)))) = true)
    (h0270 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 10)) || ((rankAtom ranks 6 == rankAtom ranks 9)))) = true)
    (h0271 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 11)) || ((rankAtom ranks 6 == rankAtom ranks 10)))) = true)
    (h0272 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 12)) || ((rankAtom ranks 6 == rankAtom ranks 11)))) = true)
    (h0273 : ((!((rowBit rows 0 0 9 && rowBit rows 0 0 10)) || ((rankAtom ranks 8 == rankAtom ranks 9)))) = true)
    (h0274 : ((!((rowBit rows 0 0 9 && rowBit rows 0 0 11)) || ((rankAtom ranks 8 == rankAtom ranks 10)))) = true)
    (h0275 : ((!((rowBit rows 0 0 10 && rowBit rows 0 0 11)) || ((rankAtom ranks 9 == rankAtom ranks 10)))) = true)
    (h0276 : ((!((rowBit rows 0 0 10 && rowBit rows 0 0 12)) || ((rankAtom ranks 9 == rankAtom ranks 11)))) = true)
    (h0277 : ((!((rowBit rows 0 0 11 && rowBit rows 0 0 12)) || ((rankAtom ranks 10 == rankAtom ranks 11)))) = true)
    (h0278 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 3)) || ((rankAtom ranks 12 == rankAtom ranks 23)))) = true)
    (h0279 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 5)) || ((rankAtom ranks 12 == rankAtom ranks 25)))) = true)
    (h0280 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 6)) || ((rankAtom ranks 12 == rankAtom ranks 26)))) = true)
    (h0281 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 7)) || ((rankAtom ranks 12 == rankAtom ranks 27)))) = true)
    (h0282 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 8)) || ((rankAtom ranks 12 == rankAtom ranks 28)))) = true)
    (h0283 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 9)) || ((rankAtom ranks 12 == rankAtom ranks 29)))) = true)
    (h0284 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 10)) || ((rankAtom ranks 12 == rankAtom ranks 30)))) = true)
    (h0285 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 11)) || ((rankAtom ranks 12 == rankAtom ranks 31)))) = true)
    (h0286 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 12)) || ((rankAtom ranks 12 == rankAtom ranks 32)))) = true)
    (h0287 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 5)) || ((rankAtom ranks 23 == rankAtom ranks 25)))) = true)
    (h0288 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 6)) || ((rankAtom ranks 23 == rankAtom ranks 26)))) = true)
    (h0289 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 7)) || ((rankAtom ranks 23 == rankAtom ranks 27)))) = true)
    (h0290 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 8)) || ((rankAtom ranks 23 == rankAtom ranks 28)))) = true)
    (h0291 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 9)) || ((rankAtom ranks 23 == rankAtom ranks 29)))) = true)
    (h0292 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 10)) || ((rankAtom ranks 23 == rankAtom ranks 30)))) = true)
    (h0293 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 11)) || ((rankAtom ranks 23 == rankAtom ranks 31)))) = true)
    (h0294 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 6)) || ((rankAtom ranks 25 == rankAtom ranks 26)))) = true)
    (h0295 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 7)) || ((rankAtom ranks 25 == rankAtom ranks 27)))) = true)
    (h0296 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 8)) || ((rankAtom ranks 25 == rankAtom ranks 28)))) = true)
    (h0297 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 9)) || ((rankAtom ranks 25 == rankAtom ranks 29)))) = true)
    (h0298 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 12)) || ((rankAtom ranks 25 == rankAtom ranks 32)))) = true)
    (h0299 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 7)) || ((rankAtom ranks 26 == rankAtom ranks 27)))) = true)
    (h0300 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 8)) || ((rankAtom ranks 26 == rankAtom ranks 28)))) = true)
    (h0301 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 9)) || ((rankAtom ranks 26 == rankAtom ranks 29)))) = true)
    (h0302 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 10)) || ((rankAtom ranks 26 == rankAtom ranks 30)))) = true)
    (h0303 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 11)) || ((rankAtom ranks 26 == rankAtom ranks 31)))) = true)
    (h0304 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 12)) || ((rankAtom ranks 26 == rankAtom ranks 32)))) = true)
    (h0305 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 8)) || ((rankAtom ranks 27 == rankAtom ranks 28)))) = true)
    (h0306 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 9)) || ((rankAtom ranks 27 == rankAtom ranks 29)))) = true)
    (h0307 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 10)) || ((rankAtom ranks 27 == rankAtom ranks 30)))) = true)
    (h0308 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 11)) || ((rankAtom ranks 27 == rankAtom ranks 31)))) = true)
    (h0309 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 12)) || ((rankAtom ranks 27 == rankAtom ranks 32)))) = true)
    (h0310 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 9)) || ((rankAtom ranks 28 == rankAtom ranks 29)))) = true)
    (h0311 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 10)) || ((rankAtom ranks 28 == rankAtom ranks 30)))) = true)
    (h0312 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 11)) || ((rankAtom ranks 28 == rankAtom ranks 31)))) = true)
    (h0313 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 12)) || ((rankAtom ranks 28 == rankAtom ranks 32)))) = true)
    (h0314 : ((!((rowBit rows 0 2 9 && rowBit rows 0 2 10)) || ((rankAtom ranks 29 == rankAtom ranks 30)))) = true)
    (h0315 : ((!((rowBit rows 0 2 9 && rowBit rows 0 2 11)) || ((rankAtom ranks 29 == rankAtom ranks 31)))) = true)
    (h0316 : ((!((rowBit rows 0 2 9 && rowBit rows 0 2 12)) || ((rankAtom ranks 29 == rankAtom ranks 32)))) = true)
    (h0317 : ((!((rowBit rows 0 2 10 && rowBit rows 0 2 11)) || ((rankAtom ranks 30 == rankAtom ranks 31)))) = true)
    (h0318 : ((!((rowBit rows 0 2 10 && rowBit rows 0 2 12)) || ((rankAtom ranks 30 == rankAtom ranks 32)))) = true)
    (h0319 : ((!((rowBit rows 0 2 11 && rowBit rows 0 2 12)) || ((rankAtom ranks 31 == rankAtom ranks 32)))) = true) :
    ∀ item ∈ directChunk004Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk004Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0256
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0257
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0258
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0259
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0260
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0261
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0262
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0263
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0264
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0265
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0266
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0267
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0268
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0269
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0270
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0271
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0272
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0273
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0274
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0275
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0276
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0277
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0278
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0279
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0280
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0281
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0282
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0283
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0284
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0285
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0286
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0287
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0288
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0289
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0290
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0291
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0292
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0293
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0294
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0295
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0296
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0297
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0298
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0299
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0300
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0301
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0302
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0303
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0304
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0305
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0306
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0307
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0308
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0309
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0310
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0311
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0312
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0313
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0314
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0315
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0316
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0317
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0318
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0319

theorem directChunk005_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0320 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 9)) || ((rankAtom ranks 3 == rankAtom ranks 46)))) = true)
    (h0321 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 10)) || ((rankAtom ranks 3 == rankAtom ranks 47)))) = true)
    (h0322 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 11)) || ((rankAtom ranks 3 == rankAtom ranks 48)))) = true)
    (h0323 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 12)) || ((rankAtom ranks 3 == rankAtom ranks 49)))) = true)
    (h0324 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 9)) || ((rankAtom ranks 14 == rankAtom ranks 46)))) = true)
    (h0325 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 10)) || ((rankAtom ranks 14 == rankAtom ranks 47)))) = true)
    (h0326 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 11)) || ((rankAtom ranks 14 == rankAtom ranks 48)))) = true)
    (h0327 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 12)) || ((rankAtom ranks 14 == rankAtom ranks 49)))) = true)
    (h0328 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 9)) || ((rankAtom ranks 24 == rankAtom ranks 46)))) = true)
    (h0329 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 10)) || ((rankAtom ranks 24 == rankAtom ranks 47)))) = true)
    (h0330 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 11)) || ((rankAtom ranks 24 == rankAtom ranks 48)))) = true)
    (h0331 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 12)) || ((rankAtom ranks 24 == rankAtom ranks 49)))) = true)
    (h0332 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 10)) || ((rankAtom ranks 33 == rankAtom ranks 47)))) = true)
    (h0333 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 11)) || ((rankAtom ranks 33 == rankAtom ranks 48)))) = true)
    (h0334 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 12)) || ((rankAtom ranks 33 == rankAtom ranks 49)))) = true)
    (h0335 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 9)) || ((rankAtom ranks 42 == rankAtom ranks 46)))) = true)
    (h0336 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 10)) || ((rankAtom ranks 42 == rankAtom ranks 47)))) = true)
    (h0337 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 11)) || ((rankAtom ranks 42 == rankAtom ranks 48)))) = true)
    (h0338 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 12)) || ((rankAtom ranks 42 == rankAtom ranks 49)))) = true)
    (h0339 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 9)) || ((rankAtom ranks 43 == rankAtom ranks 46)))) = true)
    (h0340 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 10)) || ((rankAtom ranks 43 == rankAtom ranks 47)))) = true)
    (h0341 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 11)) || ((rankAtom ranks 43 == rankAtom ranks 48)))) = true)
    (h0342 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 12)) || ((rankAtom ranks 43 == rankAtom ranks 49)))) = true)
    (h0343 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 9)) || ((rankAtom ranks 44 == rankAtom ranks 46)))) = true)
    (h0344 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 10)) || ((rankAtom ranks 44 == rankAtom ranks 47)))) = true)
    (h0345 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 11)) || ((rankAtom ranks 44 == rankAtom ranks 48)))) = true)
    (h0346 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 12)) || ((rankAtom ranks 44 == rankAtom ranks 49)))) = true)
    (h0347 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 9)) || ((rankAtom ranks 45 == rankAtom ranks 46)))) = true)
    (h0348 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 10)) || ((rankAtom ranks 45 == rankAtom ranks 47)))) = true)
    (h0349 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 11)) || ((rankAtom ranks 45 == rankAtom ranks 48)))) = true)
    (h0350 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 12)) || ((rankAtom ranks 45 == rankAtom ranks 49)))) = true)
    (h0351 : ((!((rowBit rows 0 4 9 && rowBit rows 0 4 10)) || ((rankAtom ranks 46 == rankAtom ranks 47)))) = true)
    (h0352 : ((!((rowBit rows 0 4 9 && rowBit rows 0 4 11)) || ((rankAtom ranks 46 == rankAtom ranks 48)))) = true)
    (h0353 : ((!((rowBit rows 0 4 9 && rowBit rows 0 4 12)) || ((rankAtom ranks 46 == rankAtom ranks 49)))) = true)
    (h0354 : ((!((rowBit rows 0 4 10 && rowBit rows 0 4 11)) || ((rankAtom ranks 47 == rankAtom ranks 48)))) = true)
    (h0355 : ((!((rowBit rows 0 4 10 && rowBit rows 0 4 12)) || ((rankAtom ranks 47 == rankAtom ranks 49)))) = true)
    (h0356 : ((!((rowBit rows 0 4 11 && rowBit rows 0 4 12)) || ((rankAtom ranks 48 == rankAtom ranks 49)))) = true)
    (h0357 : ((!((rowBit rows 1 2 1 && rowBit rows 1 2 9)) || ((rankAtom ranks 12 == rankAtom ranks 29)))) = true)
    (h0358 : ((!((rowBit rows 1 2 3 && rowBit rows 1 2 5)) || ((rankAtom ranks 23 == rankAtom ranks 25)))) = true)
    (h0359 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 1)) || ((rankAtom ranks 5 == rankAtom ranks 16)))) = true)
    (h0360 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 2)) || ((rankAtom ranks 5 == rankAtom ranks 26)))) = true)
    (h0361 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 3)) || ((rankAtom ranks 5 == rankAtom ranks 35)))) = true)
    (h0362 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 4)) || ((rankAtom ranks 5 == rankAtom ranks 43)))) = true)
    (h0363 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 5)) || ((rankAtom ranks 5 == rankAtom ranks 50)))) = true)
    (h0364 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 7)) || ((rankAtom ranks 5 == rankAtom ranks 57)))) = true)
    (h0365 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 8)) || ((rankAtom ranks 5 == rankAtom ranks 58)))) = true)
    (h0366 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 9)) || ((rankAtom ranks 5 == rankAtom ranks 59)))) = true)
    (h0367 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 10)) || ((rankAtom ranks 5 == rankAtom ranks 60)))) = true)
    (h0368 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 11)) || ((rankAtom ranks 5 == rankAtom ranks 61)))) = true)
    (h0369 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 12)) || ((rankAtom ranks 5 == rankAtom ranks 62)))) = true)
    (h0370 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 3)) || ((rankAtom ranks 16 == rankAtom ranks 35)))) = true)
    (h0371 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 4)) || ((rankAtom ranks 16 == rankAtom ranks 43)))) = true)
    (h0372 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 5)) || ((rankAtom ranks 16 == rankAtom ranks 50)))) = true)
    (h0373 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 7)) || ((rankAtom ranks 16 == rankAtom ranks 57)))) = true)
    (h0374 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 8)) || ((rankAtom ranks 16 == rankAtom ranks 58)))) = true)
    (h0375 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 9)) || ((rankAtom ranks 16 == rankAtom ranks 59)))) = true)
    (h0376 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 10)) || ((rankAtom ranks 16 == rankAtom ranks 60)))) = true)
    (h0377 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 11)) || ((rankAtom ranks 16 == rankAtom ranks 61)))) = true)
    (h0378 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 12)) || ((rankAtom ranks 16 == rankAtom ranks 62)))) = true)
    (h0379 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 3)) || ((rankAtom ranks 26 == rankAtom ranks 35)))) = true)
    (h0380 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 4)) || ((rankAtom ranks 26 == rankAtom ranks 43)))) = true)
    (h0381 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 5)) || ((rankAtom ranks 26 == rankAtom ranks 50)))) = true)
    (h0382 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 7)) || ((rankAtom ranks 26 == rankAtom ranks 57)))) = true)
    (h0383 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 8)) || ((rankAtom ranks 26 == rankAtom ranks 58)))) = true) :
    ∀ item ∈ directChunk005Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk005Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0320
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0321
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0322
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0323
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0324
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0325
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0326
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0327
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0328
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0329
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0330
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0331
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0332
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0333
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0334
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0335
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0336
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0337
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0338
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0339
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0340
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0341
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0342
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0343
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0344
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0345
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0346
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0347
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0348
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0349
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0350
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0351
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0352
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0353
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0354
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0355
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0356
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0357
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0358
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0359
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0360
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0361
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0362
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0363
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0364
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0365
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0366
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0367
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0368
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0369
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0370
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0371
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0372
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0373
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0374
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0375
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0376
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0377
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0378
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0379
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0380
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0381
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0382
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0383

theorem directChunk006_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0384 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 9)) || ((rankAtom ranks 26 == rankAtom ranks 59)))) = true)
    (h0385 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 10)) || ((rankAtom ranks 26 == rankAtom ranks 60)))) = true)
    (h0386 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 11)) || ((rankAtom ranks 26 == rankAtom ranks 61)))) = true)
    (h0387 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 12)) || ((rankAtom ranks 26 == rankAtom ranks 62)))) = true)
    (h0388 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 4)) || ((rankAtom ranks 35 == rankAtom ranks 43)))) = true)
    (h0389 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 5)) || ((rankAtom ranks 35 == rankAtom ranks 50)))) = true)
    (h0390 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 7)) || ((rankAtom ranks 35 == rankAtom ranks 57)))) = true)
    (h0391 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 8)) || ((rankAtom ranks 35 == rankAtom ranks 58)))) = true)
    (h0392 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 9)) || ((rankAtom ranks 35 == rankAtom ranks 59)))) = true)
    (h0393 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 10)) || ((rankAtom ranks 35 == rankAtom ranks 60)))) = true)
    (h0394 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 11)) || ((rankAtom ranks 35 == rankAtom ranks 61)))) = true)
    (h0395 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 12)) || ((rankAtom ranks 35 == rankAtom ranks 62)))) = true)
    (h0396 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 5)) || ((rankAtom ranks 43 == rankAtom ranks 50)))) = true)
    (h0397 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 7)) || ((rankAtom ranks 43 == rankAtom ranks 57)))) = true)
    (h0398 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 8)) || ((rankAtom ranks 43 == rankAtom ranks 58)))) = true)
    (h0399 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 9)) || ((rankAtom ranks 43 == rankAtom ranks 59)))) = true)
    (h0400 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 10)) || ((rankAtom ranks 43 == rankAtom ranks 60)))) = true)
    (h0401 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 11)) || ((rankAtom ranks 43 == rankAtom ranks 61)))) = true)
    (h0402 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 12)) || ((rankAtom ranks 43 == rankAtom ranks 62)))) = true)
    (h0403 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 7)) || ((rankAtom ranks 50 == rankAtom ranks 57)))) = true)
    (h0404 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 8)) || ((rankAtom ranks 50 == rankAtom ranks 58)))) = true)
    (h0405 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 9)) || ((rankAtom ranks 50 == rankAtom ranks 59)))) = true)
    (h0406 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 10)) || ((rankAtom ranks 50 == rankAtom ranks 60)))) = true)
    (h0407 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 11)) || ((rankAtom ranks 50 == rankAtom ranks 61)))) = true)
    (h0408 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 12)) || ((rankAtom ranks 50 == rankAtom ranks 62)))) = true)
    (h0409 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 8)) || ((rankAtom ranks 57 == rankAtom ranks 58)))) = true)
    (h0410 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 9)) || ((rankAtom ranks 57 == rankAtom ranks 59)))) = true)
    (h0411 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 10)) || ((rankAtom ranks 57 == rankAtom ranks 60)))) = true)
    (h0412 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 11)) || ((rankAtom ranks 57 == rankAtom ranks 61)))) = true)
    (h0413 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 12)) || ((rankAtom ranks 57 == rankAtom ranks 62)))) = true)
    (h0414 : ((!((rowBit rows 1 6 8 && rowBit rows 1 6 9)) || ((rankAtom ranks 58 == rankAtom ranks 59)))) = true)
    (h0415 : ((!((rowBit rows 1 6 8 && rowBit rows 1 6 10)) || ((rankAtom ranks 58 == rankAtom ranks 60)))) = true)
    (h0416 : ((!((rowBit rows 1 6 8 && rowBit rows 1 6 11)) || ((rankAtom ranks 58 == rankAtom ranks 61)))) = true)
    (h0417 : ((!((rowBit rows 1 6 8 && rowBit rows 1 6 12)) || ((rankAtom ranks 58 == rankAtom ranks 62)))) = true)
    (h0418 : ((!((rowBit rows 1 6 9 && rowBit rows 1 6 10)) || ((rankAtom ranks 59 == rankAtom ranks 60)))) = true)
    (h0419 : ((!((rowBit rows 1 6 9 && rowBit rows 1 6 11)) || ((rankAtom ranks 59 == rankAtom ranks 61)))) = true)
    (h0420 : ((!((rowBit rows 1 6 9 && rowBit rows 1 6 12)) || ((rankAtom ranks 59 == rankAtom ranks 62)))) = true)
    (h0421 : ((!((rowBit rows 1 6 10 && rowBit rows 1 6 11)) || ((rankAtom ranks 60 == rankAtom ranks 61)))) = true)
    (h0422 : ((!((rowBit rows 1 6 10 && rowBit rows 1 6 12)) || ((rankAtom ranks 60 == rankAtom ranks 62)))) = true)
    (h0423 : ((!((rowBit rows 1 6 11 && rowBit rows 1 6 12)) || ((rankAtom ranks 61 == rankAtom ranks 62)))) = true)
    (h0424 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 1)) || ((rankAtom ranks 4 == rankAtom ranks 15)))) = true)
    (h0425 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 2)) || ((rankAtom ranks 4 == rankAtom ranks 25)))) = true)
    (h0426 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 3)) || ((rankAtom ranks 4 == rankAtom ranks 34)))) = true)
    (h0427 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 4)) || ((rankAtom ranks 4 == rankAtom ranks 42)))) = true)
    (h0428 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 6)) || ((rankAtom ranks 4 == rankAtom ranks 50)))) = true)
    (h0429 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 7)) || ((rankAtom ranks 4 == rankAtom ranks 51)))) = true)
    (h0430 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 8)) || ((rankAtom ranks 4 == rankAtom ranks 52)))) = true)
    (h0431 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 9)) || ((rankAtom ranks 4 == rankAtom ranks 53)))) = true)
    (h0432 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 10)) || ((rankAtom ranks 4 == rankAtom ranks 54)))) = true)
    (h0433 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 11)) || ((rankAtom ranks 4 == rankAtom ranks 55)))) = true)
    (h0434 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 12)) || ((rankAtom ranks 4 == rankAtom ranks 56)))) = true)
    (h0435 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 2)) || ((rankAtom ranks 15 == rankAtom ranks 25)))) = true)
    (h0436 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 3)) || ((rankAtom ranks 15 == rankAtom ranks 34)))) = true)
    (h0437 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 4)) || ((rankAtom ranks 15 == rankAtom ranks 42)))) = true)
    (h0438 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 6)) || ((rankAtom ranks 15 == rankAtom ranks 50)))) = true)
    (h0439 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 7)) || ((rankAtom ranks 15 == rankAtom ranks 51)))) = true)
    (h0440 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 8)) || ((rankAtom ranks 15 == rankAtom ranks 52)))) = true)
    (h0441 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 9)) || ((rankAtom ranks 15 == rankAtom ranks 53)))) = true)
    (h0442 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 10)) || ((rankAtom ranks 15 == rankAtom ranks 54)))) = true)
    (h0443 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 11)) || ((rankAtom ranks 15 == rankAtom ranks 55)))) = true)
    (h0444 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 12)) || ((rankAtom ranks 15 == rankAtom ranks 56)))) = true)
    (h0445 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 4)) || ((rankAtom ranks 25 == rankAtom ranks 42)))) = true)
    (h0446 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 6)) || ((rankAtom ranks 25 == rankAtom ranks 50)))) = true)
    (h0447 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 7)) || ((rankAtom ranks 25 == rankAtom ranks 51)))) = true) :
    ∀ item ∈ directChunk006Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk006Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0384
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0385
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0386
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0387
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0388
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0389
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0390
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0391
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0392
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0393
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0394
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0395
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0396
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0397
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0398
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0399
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0400
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0401
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0402
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0403
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0404
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0405
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0406
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0407
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0408
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0409
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0410
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0411
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0412
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0413
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0414
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0415
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0416
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0417
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0418
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0419
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0420
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0421
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0422
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0423
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0424
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0425
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0426
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0427
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0428
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0429
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0430
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0431
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0432
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0433
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0434
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0435
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0436
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0437
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0438
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0439
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0440
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0441
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0442
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0443
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0444
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0445
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0446
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0447

theorem directChunk007_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0448 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 8)) || ((rankAtom ranks 25 == rankAtom ranks 52)))) = true)
    (h0449 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 9)) || ((rankAtom ranks 25 == rankAtom ranks 53)))) = true)
    (h0450 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 10)) || ((rankAtom ranks 25 == rankAtom ranks 54)))) = true)
    (h0451 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 11)) || ((rankAtom ranks 25 == rankAtom ranks 55)))) = true)
    (h0452 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 12)) || ((rankAtom ranks 25 == rankAtom ranks 56)))) = true)
    (h0453 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 4)) || ((rankAtom ranks 34 == rankAtom ranks 42)))) = true)
    (h0454 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 6)) || ((rankAtom ranks 34 == rankAtom ranks 50)))) = true)
    (h0455 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 7)) || ((rankAtom ranks 34 == rankAtom ranks 51)))) = true)
    (h0456 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 8)) || ((rankAtom ranks 34 == rankAtom ranks 52)))) = true)
    (h0457 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 9)) || ((rankAtom ranks 34 == rankAtom ranks 53)))) = true)
    (h0458 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 10)) || ((rankAtom ranks 34 == rankAtom ranks 54)))) = true)
    (h0459 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 11)) || ((rankAtom ranks 34 == rankAtom ranks 55)))) = true)
    (h0460 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 12)) || ((rankAtom ranks 34 == rankAtom ranks 56)))) = true)
    (h0461 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 6)) || ((rankAtom ranks 42 == rankAtom ranks 50)))) = true)
    (h0462 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 7)) || ((rankAtom ranks 42 == rankAtom ranks 51)))) = true)
    (h0463 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 8)) || ((rankAtom ranks 42 == rankAtom ranks 52)))) = true)
    (h0464 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 9)) || ((rankAtom ranks 42 == rankAtom ranks 53)))) = true)
    (h0465 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 10)) || ((rankAtom ranks 42 == rankAtom ranks 54)))) = true)
    (h0466 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 11)) || ((rankAtom ranks 42 == rankAtom ranks 55)))) = true)
    (h0467 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 12)) || ((rankAtom ranks 42 == rankAtom ranks 56)))) = true)
    (h0468 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 7)) || ((rankAtom ranks 50 == rankAtom ranks 51)))) = true)
    (h0469 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 8)) || ((rankAtom ranks 50 == rankAtom ranks 52)))) = true)
    (h0470 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 9)) || ((rankAtom ranks 50 == rankAtom ranks 53)))) = true)
    (h0471 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 10)) || ((rankAtom ranks 50 == rankAtom ranks 54)))) = true)
    (h0472 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 11)) || ((rankAtom ranks 50 == rankAtom ranks 55)))) = true)
    (h0473 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 12)) || ((rankAtom ranks 50 == rankAtom ranks 56)))) = true)
    (h0474 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 8)) || ((rankAtom ranks 51 == rankAtom ranks 52)))) = true)
    (h0475 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 9)) || ((rankAtom ranks 51 == rankAtom ranks 53)))) = true)
    (h0476 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 10)) || ((rankAtom ranks 51 == rankAtom ranks 54)))) = true)
    (h0477 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 11)) || ((rankAtom ranks 51 == rankAtom ranks 55)))) = true)
    (h0478 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 12)) || ((rankAtom ranks 51 == rankAtom ranks 56)))) = true)
    (h0479 : ((!((rowBit rows 2 5 8 && rowBit rows 2 5 9)) || ((rankAtom ranks 52 == rankAtom ranks 53)))) = true)
    (h0480 : ((!((rowBit rows 2 5 8 && rowBit rows 2 5 10)) || ((rankAtom ranks 52 == rankAtom ranks 54)))) = true)
    (h0481 : ((!((rowBit rows 2 5 8 && rowBit rows 2 5 11)) || ((rankAtom ranks 52 == rankAtom ranks 55)))) = true)
    (h0482 : ((!((rowBit rows 2 5 8 && rowBit rows 2 5 12)) || ((rankAtom ranks 52 == rankAtom ranks 56)))) = true)
    (h0483 : ((!((rowBit rows 2 5 9 && rowBit rows 2 5 10)) || ((rankAtom ranks 53 == rankAtom ranks 54)))) = true)
    (h0484 : ((!((rowBit rows 2 5 9 && rowBit rows 2 5 11)) || ((rankAtom ranks 53 == rankAtom ranks 55)))) = true)
    (h0485 : ((!((rowBit rows 2 5 9 && rowBit rows 2 5 12)) || ((rankAtom ranks 53 == rankAtom ranks 56)))) = true)
    (h0486 : ((!((rowBit rows 2 5 10 && rowBit rows 2 5 11)) || ((rankAtom ranks 54 == rankAtom ranks 55)))) = true)
    (h0487 : ((!((rowBit rows 2 5 10 && rowBit rows 2 5 12)) || ((rankAtom ranks 54 == rankAtom ranks 56)))) = true)
    (h0488 : ((!((rowBit rows 2 5 11 && rowBit rows 2 5 12)) || ((rankAtom ranks 55 == rankAtom ranks 56)))) = true)
    (h0489 : ((!((firstRowBit b1 0 && firstRowBit b1 9)) || ((rankAtom ranks 3 == rankAtom ranks 46)))) = true)
    (h0490 : ((!((firstRowBit b1 0 && firstRowBit b1 10)) || ((rankAtom ranks 3 == rankAtom ranks 47)))) = true)
    (h0491 : ((!((firstRowBit b1 0 && firstRowBit b1 11)) || ((rankAtom ranks 3 == rankAtom ranks 48)))) = true)
    (h0492 : ((!((firstRowBit b1 0 && firstRowBit b1 12)) || ((rankAtom ranks 3 == rankAtom ranks 49)))) = true)
    (h0493 : ((!((firstRowBit b1 1 && firstRowBit b1 9)) || ((rankAtom ranks 14 == rankAtom ranks 46)))) = true)
    (h0494 : ((!((firstRowBit b1 1 && firstRowBit b1 10)) || ((rankAtom ranks 14 == rankAtom ranks 47)))) = true)
    (h0495 : ((!((firstRowBit b1 1 && firstRowBit b1 11)) || ((rankAtom ranks 14 == rankAtom ranks 48)))) = true)
    (h0496 : ((!((firstRowBit b1 1 && firstRowBit b1 12)) || ((rankAtom ranks 14 == rankAtom ranks 49)))) = true)
    (h0497 : ((!((firstRowBit b1 2 && firstRowBit b1 6)) || ((rankAtom ranks 24 == rankAtom ranks 43)))) = true)
    (h0498 : ((!((firstRowBit b1 2 && firstRowBit b1 9)) || ((rankAtom ranks 24 == rankAtom ranks 46)))) = true)
    (h0499 : ((!((firstRowBit b1 2 && firstRowBit b1 10)) || ((rankAtom ranks 24 == rankAtom ranks 47)))) = true)
    (h0500 : ((!((firstRowBit b1 2 && firstRowBit b1 11)) || ((rankAtom ranks 24 == rankAtom ranks 48)))) = true)
    (h0501 : ((!((firstRowBit b1 2 && firstRowBit b1 12)) || ((rankAtom ranks 24 == rankAtom ranks 49)))) = true)
    (h0502 : ((!((firstRowBit b1 3 && firstRowBit b1 9)) || ((rankAtom ranks 33 == rankAtom ranks 46)))) = true)
    (h0503 : ((!((firstRowBit b1 3 && firstRowBit b1 10)) || ((rankAtom ranks 33 == rankAtom ranks 47)))) = true)
    (h0504 : ((!((firstRowBit b1 3 && firstRowBit b1 11)) || ((rankAtom ranks 33 == rankAtom ranks 48)))) = true)
    (h0505 : ((!((firstRowBit b1 3 && firstRowBit b1 12)) || ((rankAtom ranks 33 == rankAtom ranks 49)))) = true)
    (h0506 : ((!((firstRowBit b1 5 && firstRowBit b1 9)) || ((rankAtom ranks 42 == rankAtom ranks 46)))) = true)
    (h0507 : ((!((firstRowBit b1 5 && firstRowBit b1 10)) || ((rankAtom ranks 42 == rankAtom ranks 47)))) = true)
    (h0508 : ((!((firstRowBit b1 5 && firstRowBit b1 11)) || ((rankAtom ranks 42 == rankAtom ranks 48)))) = true)
    (h0509 : ((!((firstRowBit b1 5 && firstRowBit b1 12)) || ((rankAtom ranks 42 == rankAtom ranks 49)))) = true)
    (h0510 : ((!((firstRowBit b1 6 && firstRowBit b1 9)) || ((rankAtom ranks 43 == rankAtom ranks 46)))) = true)
    (h0511 : ((!((firstRowBit b1 6 && firstRowBit b1 10)) || ((rankAtom ranks 43 == rankAtom ranks 47)))) = true) :
    ∀ item ∈ directChunk007Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk007Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0448
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0449
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0450
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0451
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0452
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0453
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0454
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0455
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0456
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0457
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0458
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0459
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0460
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0461
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0462
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0463
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0464
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0465
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0466
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0467
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0468
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0469
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0470
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0471
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0472
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0473
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0474
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0475
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0476
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0477
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0478
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0479
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0480
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0481
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0482
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0483
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0484
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0485
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0486
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0487
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0488
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0489
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0490
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0491
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0492
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0493
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0494
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0495
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0496
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0497
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0498
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0499
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0500
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0501
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0502
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0503
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0504
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0505
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0506
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0507
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0508
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0509
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0510
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0511

theorem directChunk008_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0512 : ((!((firstRowBit b1 6 && firstRowBit b1 11)) || ((rankAtom ranks 43 == rankAtom ranks 48)))) = true)
    (h0513 : ((!((firstRowBit b1 6 && firstRowBit b1 12)) || ((rankAtom ranks 43 == rankAtom ranks 49)))) = true)
    (h0514 : ((!((firstRowBit b1 7 && firstRowBit b1 9)) || ((rankAtom ranks 44 == rankAtom ranks 46)))) = true)
    (h0515 : ((!((firstRowBit b1 7 && firstRowBit b1 10)) || ((rankAtom ranks 44 == rankAtom ranks 47)))) = true)
    (h0516 : ((!((firstRowBit b1 7 && firstRowBit b1 11)) || ((rankAtom ranks 44 == rankAtom ranks 48)))) = true)
    (h0517 : ((!((firstRowBit b1 7 && firstRowBit b1 12)) || ((rankAtom ranks 44 == rankAtom ranks 49)))) = true)
    (h0518 : ((!((firstRowBit b1 8 && firstRowBit b1 9)) || ((rankAtom ranks 45 == rankAtom ranks 46)))) = true)
    (h0519 : ((!((firstRowBit b1 8 && firstRowBit b1 10)) || ((rankAtom ranks 45 == rankAtom ranks 47)))) = true)
    (h0520 : ((!((firstRowBit b1 8 && firstRowBit b1 11)) || ((rankAtom ranks 45 == rankAtom ranks 48)))) = true)
    (h0521 : ((!((firstRowBit b1 8 && firstRowBit b1 12)) || ((rankAtom ranks 45 == rankAtom ranks 49)))) = true)
    (h0522 : ((!((firstRowBit b1 9 && firstRowBit b1 10)) || ((rankAtom ranks 46 == rankAtom ranks 47)))) = true)
    (h0523 : ((!((firstRowBit b1 9 && firstRowBit b1 11)) || ((rankAtom ranks 46 == rankAtom ranks 48)))) = true)
    (h0524 : ((!((firstRowBit b1 9 && firstRowBit b1 12)) || ((rankAtom ranks 46 == rankAtom ranks 49)))) = true)
    (h0525 : ((!((firstRowBit b1 10 && firstRowBit b1 11)) || ((rankAtom ranks 47 == rankAtom ranks 48)))) = true)
    (h0526 : ((!((firstRowBit b1 10 && firstRowBit b1 12)) || ((rankAtom ranks 47 == rankAtom ranks 49)))) = true)
    (h0527 : ((!((firstRowBit b1 11 && firstRowBit b1 12)) || ((rankAtom ranks 48 == rankAtom ranks 49)))) = true)
    (h0528 : ((!((shellBit shell 0 && shellBit shell 1)) || ((rankAtom ranks 7 == rankAtom ranks 18)))) = true)
    (h0529 : ((!((shellBit shell 0 && shellBit shell 2)) || ((rankAtom ranks 7 == rankAtom ranks 28)))) = true)
    (h0530 : ((!((shellBit shell 0 && shellBit shell 3)) || ((rankAtom ranks 7 == rankAtom ranks 37)))) = true)
    (h0531 : ((!((shellBit shell 0 && shellBit shell 4)) || ((rankAtom ranks 7 == rankAtom ranks 45)))) = true)
    (h0532 : ((!((shellBit shell 0 && shellBit shell 5)) || ((rankAtom ranks 7 == rankAtom ranks 52)))) = true)
    (h0533 : ((!((shellBit shell 0 && shellBit shell 6)) || ((rankAtom ranks 7 == rankAtom ranks 58)))) = true)
    (h0534 : ((!((shellBit shell 0 && shellBit shell 7)) || ((rankAtom ranks 7 == rankAtom ranks 63)))) = true)
    (h0535 : ((!((shellBit shell 1 && shellBit shell 2)) || ((rankAtom ranks 18 == rankAtom ranks 28)))) = true)
    (h0536 : ((!((shellBit shell 1 && shellBit shell 3)) || ((rankAtom ranks 18 == rankAtom ranks 37)))) = true)
    (h0537 : ((!((shellBit shell 1 && shellBit shell 4)) || ((rankAtom ranks 18 == rankAtom ranks 45)))) = true)
    (h0538 : ((!((shellBit shell 1 && shellBit shell 5)) || ((rankAtom ranks 18 == rankAtom ranks 52)))) = true)
    (h0539 : ((!((shellBit shell 1 && shellBit shell 6)) || ((rankAtom ranks 18 == rankAtom ranks 58)))) = true)
    (h0540 : ((!((shellBit shell 1 && shellBit shell 7)) || ((rankAtom ranks 18 == rankAtom ranks 63)))) = true)
    (h0541 : ((!((shellBit shell 1 && shellBit shell 9)) || ((rankAtom ranks 18 == rankAtom ranks 68)))) = true)
    (h0542 : ((!((shellBit shell 1 && shellBit shell 10)) || ((rankAtom ranks 18 == rankAtom ranks 69)))) = true)
    (h0543 : ((!((shellBit shell 1 && shellBit shell 11)) || ((rankAtom ranks 18 == rankAtom ranks 70)))) = true)
    (h0544 : ((!((shellBit shell 1 && shellBit shell 12)) || ((rankAtom ranks 18 == rankAtom ranks 71)))) = true)
    (h0545 : ((!((shellBit shell 2 && shellBit shell 3)) || ((rankAtom ranks 28 == rankAtom ranks 37)))) = true)
    (h0546 : ((!((shellBit shell 2 && shellBit shell 4)) || ((rankAtom ranks 28 == rankAtom ranks 45)))) = true)
    (h0547 : ((!((shellBit shell 2 && shellBit shell 5)) || ((rankAtom ranks 28 == rankAtom ranks 52)))) = true)
    (h0548 : ((!((shellBit shell 2 && shellBit shell 6)) || ((rankAtom ranks 28 == rankAtom ranks 58)))) = true)
    (h0549 : ((!((shellBit shell 2 && shellBit shell 7)) || ((rankAtom ranks 28 == rankAtom ranks 63)))) = true)
    (h0550 : ((!((shellBit shell 2 && shellBit shell 9)) || ((rankAtom ranks 28 == rankAtom ranks 68)))) = true)
    (h0551 : ((!((shellBit shell 2 && shellBit shell 10)) || ((rankAtom ranks 28 == rankAtom ranks 69)))) = true)
    (h0552 : ((!((shellBit shell 2 && shellBit shell 11)) || ((rankAtom ranks 28 == rankAtom ranks 70)))) = true)
    (h0553 : ((!((shellBit shell 2 && shellBit shell 12)) || ((rankAtom ranks 28 == rankAtom ranks 71)))) = true)
    (h0554 : ((!((shellBit shell 3 && shellBit shell 4)) || ((rankAtom ranks 37 == rankAtom ranks 45)))) = true)
    (h0555 : ((!((shellBit shell 3 && shellBit shell 5)) || ((rankAtom ranks 37 == rankAtom ranks 52)))) = true)
    (h0556 : ((!((shellBit shell 3 && shellBit shell 6)) || ((rankAtom ranks 37 == rankAtom ranks 58)))) = true)
    (h0557 : ((!((shellBit shell 3 && shellBit shell 7)) || ((rankAtom ranks 37 == rankAtom ranks 63)))) = true)
    (h0558 : ((!((shellBit shell 3 && shellBit shell 9)) || ((rankAtom ranks 37 == rankAtom ranks 68)))) = true)
    (h0559 : ((!((shellBit shell 3 && shellBit shell 10)) || ((rankAtom ranks 37 == rankAtom ranks 69)))) = true)
    (h0560 : ((!((shellBit shell 3 && shellBit shell 11)) || ((rankAtom ranks 37 == rankAtom ranks 70)))) = true)
    (h0561 : ((!((shellBit shell 3 && shellBit shell 12)) || ((rankAtom ranks 37 == rankAtom ranks 71)))) = true)
    (h0562 : ((!((shellBit shell 4 && shellBit shell 9)) || ((rankAtom ranks 45 == rankAtom ranks 68)))) = true)
    (h0563 : ((!((shellBit shell 4 && shellBit shell 11)) || ((rankAtom ranks 45 == rankAtom ranks 70)))) = true)
    (h0564 : ((!((shellBit shell 4 && shellBit shell 12)) || ((rankAtom ranks 45 == rankAtom ranks 71)))) = true)
    (h0565 : ((!((shellBit shell 5 && shellBit shell 7)) || ((rankAtom ranks 52 == rankAtom ranks 63)))) = true)
    (h0566 : ((!((shellBit shell 5 && shellBit shell 9)) || ((rankAtom ranks 52 == rankAtom ranks 68)))) = true)
    (h0567 : ((!((shellBit shell 5 && shellBit shell 10)) || ((rankAtom ranks 52 == rankAtom ranks 69)))) = true)
    (h0568 : ((!((shellBit shell 5 && shellBit shell 11)) || ((rankAtom ranks 52 == rankAtom ranks 70)))) = true)
    (h0569 : ((!((shellBit shell 5 && shellBit shell 12)) || ((rankAtom ranks 52 == rankAtom ranks 71)))) = true)
    (h0570 : ((!((shellBit shell 6 && shellBit shell 7)) || ((rankAtom ranks 58 == rankAtom ranks 63)))) = true)
    (h0571 : ((!((rankAtom ranks 1 == rankAtom ranks 4)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h0572 : ((!((rankAtom ranks 1 == rankAtom ranks 5)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h0573 : ((!((rankAtom ranks 1 == rankAtom ranks 6)) || ((rankAtom ranks 12).ult (rankAtom ranks 17)))) = true)
    (h0574 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 28).ult (rankAtom ranks 1)))) = true)
    (h0575 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 0).ult (rankAtom ranks 1)))) = true) :
    ∀ item ∈ directChunk008Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk008Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0512
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0513
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0514
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0515
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0516
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0517
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0518
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0519
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0520
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0521
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0522
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0523
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0524
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0525
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0526
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0527
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0528
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0529
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0530
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0531
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0532
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0533
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0534
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0535
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0536
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0537
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0538
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0539
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0540
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0541
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0542
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0543
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0544
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0545
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0546
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0547
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0548
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0549
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0550
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0551
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0552
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0553
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0554
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0555
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0556
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0557
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0558
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0559
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0560
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0561
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0562
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0563
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0564
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0565
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0566
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0567
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0568
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0569
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0570
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0571
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0572
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0573
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0574
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0575

theorem directChunk009_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0576 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h0577 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 7).ult (rankAtom ranks 1)))) = true)
    (h0578 : ((!((rankAtom ranks 2 == rankAtom ranks 4)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h0579 : ((!((rankAtom ranks 2 == rankAtom ranks 5)) || ((rankAtom ranks 13).ult (rankAtom ranks 16)))) = true)
    (h0580 : ((!((rankAtom ranks 2 == rankAtom ranks 6)) || ((rankAtom ranks 13).ult (rankAtom ranks 17)))) = true)
    (h0581 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 37).ult (rankAtom ranks 2)))) = true)
    (h0582 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 0).ult (rankAtom ranks 2)))) = true)
    (h0583 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h0584 : ((!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h0585 : ((!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h0586 : ((!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 14).ult (rankAtom ranks 17)))) = true)
    (h0587 : ((!((rankAtom ranks 3 == rankAtom ranks 7)) || ((rankAtom ranks 14).ult (rankAtom ranks 18)))) = true)
    (h0588 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h0589 : ((!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 0).ult (rankAtom ranks 19)))) = true)
    (h0590 : ((!((rankAtom ranks 3 == rankAtom ranks 8)) || ((rankAtom ranks 14).ult (rankAtom ranks 19)))) = true)
    (h0591 : ((!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 0).ult (rankAtom ranks 20)))) = true)
    (h0592 : ((!((rankAtom ranks 3 == rankAtom ranks 9)) || ((rankAtom ranks 14).ult (rankAtom ranks 20)))) = true)
    (h0593 : ((!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h0594 : ((!((rankAtom ranks 3 == rankAtom ranks 10)) || ((rankAtom ranks 14).ult (rankAtom ranks 21)))) = true)
    (h0595 : ((!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h0596 : ((!((rankAtom ranks 3 == rankAtom ranks 11)) || ((rankAtom ranks 14).ult (rankAtom ranks 22)))) = true)
    (h0597 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 50).ult (rankAtom ranks 16)))) = true)
    (h0598 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h0599 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 5).ult (rankAtom ranks 16)))) = true)
    (h0600 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 51).ult (rankAtom ranks 17)))) = true)
    (h0601 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 15).ult (rankAtom ranks 17)))) = true)
    (h0602 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 6).ult (rankAtom ranks 17)))) = true)
    (h0603 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 52).ult (rankAtom ranks 18)))) = true)
    (h0604 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 15).ult (rankAtom ranks 18)))) = true)
    (h0605 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 15).ult (rankAtom ranks 4)))) = true)
    (h0606 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 53).ult (rankAtom ranks 19)))) = true)
    (h0607 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 15).ult (rankAtom ranks 19)))) = true)
    (h0608 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 54).ult (rankAtom ranks 20)))) = true)
    (h0609 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 15).ult (rankAtom ranks 20)))) = true)
    (h0610 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 55).ult (rankAtom ranks 21)))) = true)
    (h0611 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 15).ult (rankAtom ranks 21)))) = true)
    (h0612 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 56).ult (rankAtom ranks 22)))) = true)
    (h0613 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 15).ult (rankAtom ranks 22)))) = true)
    (h0614 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 16).ult (rankAtom ranks 17)))) = true)
    (h0615 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 58).ult (rankAtom ranks 18)))) = true)
    (h0616 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 16).ult (rankAtom ranks 18)))) = true)
    (h0617 : ((!((rankAtom ranks 5 == rankAtom ranks 16)) || ((rankAtom ranks 7).ult (rankAtom ranks 18)))) = true)
    (h0618 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 16).ult (rankAtom ranks 5)))) = true)
    (h0619 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 59).ult (rankAtom ranks 19)))) = true)
    (h0620 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 16).ult (rankAtom ranks 19)))) = true)
    (h0621 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 60).ult (rankAtom ranks 20)))) = true)
    (h0622 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 16).ult (rankAtom ranks 20)))) = true)
    (h0623 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 61).ult (rankAtom ranks 21)))) = true)
    (h0624 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 16).ult (rankAtom ranks 21)))) = true)
    (h0625 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 62).ult (rankAtom ranks 22)))) = true)
    (h0626 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h0627 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 16).ult (rankAtom ranks 22)))) = true)
    (h0628 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 17).ult (rankAtom ranks 18)))) = true)
    (h0629 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 17).ult (rankAtom ranks 6)))) = true)
    (h0630 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 17).ult (rankAtom ranks 19)))) = true)
    (h0631 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 65).ult (rankAtom ranks 20)))) = true)
    (h0632 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 17).ult (rankAtom ranks 20)))) = true)
    (h0633 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 66).ult (rankAtom ranks 21)))) = true)
    (h0634 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 17).ult (rankAtom ranks 21)))) = true)
    (h0635 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 67).ult (rankAtom ranks 22)))) = true)
    (h0636 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 17).ult (rankAtom ranks 22)))) = true)
    (h0637 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 8).ult (rankAtom ranks 19)))) = true)
    (h0638 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h0639 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true) :
    ∀ item ∈ directChunk009Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk009Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0576
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0577
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0578
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0579
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0580
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0581
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0582
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0583
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0584
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0585
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0586
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0587
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0588
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0589
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0590
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0591
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0592
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0593
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0594
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0595
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0596
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0597
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0598
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0599
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0600
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0601
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0602
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0603
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0604
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0605
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0606
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0607
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0608
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0609
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0610
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0611
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0612
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0613
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0614
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0615
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0616
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0617
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0618
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0619
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0620
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0621
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0622
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0623
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0624
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0625
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0626
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0627
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0628
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0629
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0630
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0631
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0632
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0633
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0634
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0635
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0636
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0637
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0638
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0639

theorem directChunk010_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0640 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h0641 : ((!((rankAtom ranks 2 == rankAtom ranks 4)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h0642 : ((!((rankAtom ranks 25 == rankAtom ranks 4)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h0643 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 4).ult (rankAtom ranks 2)))) = true)
    (h0644 : ((!((rankAtom ranks 2 == rankAtom ranks 5)) || ((rankAtom ranks 23).ult (rankAtom ranks 26)))) = true)
    (h0645 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 5).ult (rankAtom ranks 2)))) = true)
    (h0646 : ((!((rankAtom ranks 2 == rankAtom ranks 6)) || ((rankAtom ranks 23).ult (rankAtom ranks 27)))) = true)
    (h0647 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 6).ult (rankAtom ranks 2)))) = true)
    (h0648 : ((!((rankAtom ranks 28 == rankAtom ranks 1)) || ((rankAtom ranks 37).ult (rankAtom ranks 2)))) = true)
    (h0649 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 1).ult (rankAtom ranks 2)))) = true)
    (h0650 : ((!((rankAtom ranks 2 == rankAtom ranks 23)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0651 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h0652 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 7).ult (rankAtom ranks 2)))) = true)
    (h0653 : ((!((rankAtom ranks 3 == rankAtom ranks 42)) || ((rankAtom ranks 1).ult (rankAtom ranks 25)))) = true)
    (h0654 : ((!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h0655 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h0656 : ((!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h0657 : ((!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 24).ult (rankAtom ranks 27)))) = true)
    (h0658 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h0659 : ((!((rankAtom ranks 3 == rankAtom ranks 7)) || ((rankAtom ranks 24).ult (rankAtom ranks 28)))) = true)
    (h0660 : ((!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0661 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 24).ult (rankAtom ranks 3)))) = true)
    (h0662 : ((!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h0663 : ((!((rankAtom ranks 3 == rankAtom ranks 8)) || ((rankAtom ranks 24).ult (rankAtom ranks 29)))) = true)
    (h0664 : ((!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h0665 : ((!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h0666 : ((!((rankAtom ranks 3 == rankAtom ranks 10)) || ((rankAtom ranks 24).ult (rankAtom ranks 31)))) = true)
    (h0667 : ((!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h0668 : ((!((rankAtom ranks 3 == rankAtom ranks 11)) || ((rankAtom ranks 24).ult (rankAtom ranks 32)))) = true)
    (h0669 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h0670 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 1).ult (rankAtom ranks 26)))) = true)
    (h0671 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 1).ult (rankAtom ranks 4)))) = true)
    (h0672 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h0673 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 5).ult (rankAtom ranks 26)))) = true)
    (h0674 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 5).ult (rankAtom ranks 4)))) = true)
    (h0675 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h0676 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 1).ult (rankAtom ranks 27)))) = true)
    (h0677 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 25).ult (rankAtom ranks 27)))) = true)
    (h0678 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 6).ult (rankAtom ranks 27)))) = true)
    (h0679 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 6).ult (rankAtom ranks 4)))) = true)
    (h0680 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 52).ult (rankAtom ranks 28)))) = true)
    (h0681 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))) = true)
    (h0682 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 1).ult (rankAtom ranks 4)))) = true)
    (h0683 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 25).ult (rankAtom ranks 28)))) = true)
    (h0684 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0685 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 25).ult (rankAtom ranks 4)))) = true)
    (h0686 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 7).ult (rankAtom ranks 4)))) = true)
    (h0687 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 53).ult (rankAtom ranks 29)))) = true)
    (h0688 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h0689 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 25).ult (rankAtom ranks 29)))) = true)
    (h0690 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 54).ult (rankAtom ranks 30)))) = true)
    (h0691 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h0692 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 25).ult (rankAtom ranks 30)))) = true)
    (h0693 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 55).ult (rankAtom ranks 31)))) = true)
    (h0694 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h0695 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 25).ult (rankAtom ranks 31)))) = true)
    (h0696 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 56).ult (rankAtom ranks 32)))) = true)
    (h0697 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h0698 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 25).ult (rankAtom ranks 32)))) = true)
    (h0699 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 1).ult (rankAtom ranks 27)))) = true)
    (h0700 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 26).ult (rankAtom ranks 27)))) = true)
    (h0701 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h0702 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 58).ult (rankAtom ranks 28)))) = true)
    (h0703 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))) = true) :
    ∀ item ∈ directChunk010Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk010Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0640
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0641
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0642
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0643
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0644
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0645
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0646
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0647
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0648
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0649
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0650
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0651
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0652
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0653
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0654
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0655
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0656
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0657
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0658
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0659
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0660
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0661
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0662
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0663
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0664
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0665
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0666
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0667
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0668
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0669
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0670
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0671
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0672
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0673
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0674
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0675
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0676
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0677
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0678
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0679
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0680
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0681
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0682
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0683
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0684
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0685
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0686
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0687
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0688
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0689
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0690
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0691
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0692
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0693
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0694
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0695
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0696
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0697
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0698
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0699
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0700
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0701
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0702
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0703

theorem directChunk011_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0704 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 5)))) = true)
    (h0705 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 26).ult (rankAtom ranks 28)))) = true)
    (h0706 : ((!((rankAtom ranks 5 == rankAtom ranks 26)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0707 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 26).ult (rankAtom ranks 5)))) = true)
    (h0708 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 7).ult (rankAtom ranks 5)))) = true)
    (h0709 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 59).ult (rankAtom ranks 29)))) = true)
    (h0710 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h0711 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 26).ult (rankAtom ranks 29)))) = true)
    (h0712 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 60).ult (rankAtom ranks 30)))) = true)
    (h0713 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h0714 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 26).ult (rankAtom ranks 30)))) = true)
    (h0715 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 61).ult (rankAtom ranks 31)))) = true)
    (h0716 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h0717 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 26).ult (rankAtom ranks 31)))) = true)
    (h0718 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 62).ult (rankAtom ranks 32)))) = true)
    (h0719 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h0720 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 26).ult (rankAtom ranks 32)))) = true)
    (h0721 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 1).ult (rankAtom ranks 6)))) = true)
    (h0722 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 27).ult (rankAtom ranks 28)))) = true)
    (h0723 : ((!((rankAtom ranks 6 == rankAtom ranks 27)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0724 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 27).ult (rankAtom ranks 6)))) = true)
    (h0725 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h0726 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 27).ult (rankAtom ranks 29)))) = true)
    (h0727 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 65).ult (rankAtom ranks 30)))) = true)
    (h0728 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 27).ult (rankAtom ranks 30)))) = true)
    (h0729 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 66).ult (rankAtom ranks 31)))) = true)
    (h0730 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 27).ult (rankAtom ranks 31)))) = true)
    (h0731 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 67).ult (rankAtom ranks 32)))) = true)
    (h0732 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 27).ult (rankAtom ranks 32)))) = true)
    (h0733 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 8).ult (rankAtom ranks 29)))) = true)
    (h0734 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 9).ult (rankAtom ranks 30)))) = true)
    (h0735 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 10).ult (rankAtom ranks 31)))) = true)
    (h0736 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 11).ult (rankAtom ranks 32)))) = true)
    (h0737 : ((!((rankAtom ranks 3 == rankAtom ranks 42)) || ((rankAtom ranks 2).ult (rankAtom ranks 34)))) = true)
    (h0738 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h0739 : ((!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h0740 : ((!((rankAtom ranks 3 == rankAtom ranks 43)) || ((rankAtom ranks 2).ult (rankAtom ranks 35)))) = true)
    (h0741 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h0742 : ((!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 33).ult (rankAtom ranks 35)))) = true)
    (h0743 : ((!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 33).ult (rankAtom ranks 36)))) = true)
    (h0744 : ((!((rankAtom ranks 3 == rankAtom ranks 33)) || ((rankAtom ranks 6).ult (rankAtom ranks 36)))) = true)
    (h0745 : ((!((rankAtom ranks 3 == rankAtom ranks 45)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h0746 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h0747 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 33).ult (rankAtom ranks 3)))) = true)
    (h0748 : ((!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 2).ult (rankAtom ranks 38)))) = true)
    (h0749 : ((!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h0750 : ((!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h0751 : ((!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h0752 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h0753 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 2).ult (rankAtom ranks 35)))) = true)
    (h0754 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h0755 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h0756 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 5).ult (rankAtom ranks 35)))) = true)
    (h0757 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 5).ult (rankAtom ranks 4)))) = true)
    (h0758 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h0759 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 2).ult (rankAtom ranks 36)))) = true)
    (h0760 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h0761 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 6).ult (rankAtom ranks 36)))) = true)
    (h0762 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h0763 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h0764 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h0765 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h0766 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 7).ult (rankAtom ranks 37)))) = true)
    (h0767 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 4)))) = true) :
    ∀ item ∈ directChunk011Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk011Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0704
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0705
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0706
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0707
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0708
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0709
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0710
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0711
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0712
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0713
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0714
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0715
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0716
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0717
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0718
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0719
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0720
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0721
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0722
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0723
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0724
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0725
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0726
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0727
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0728
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0729
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0730
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0731
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0732
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0733
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0734
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0735
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0736
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0737
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0738
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0739
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0740
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0741
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0742
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0743
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0744
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0745
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0746
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0747
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0748
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0749
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0750
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0751
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0752
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0753
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0754
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0755
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0756
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0757
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0758
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0759
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0760
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0761
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0762
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0763
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0764
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0765
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0766
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0767

theorem directChunk012_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0768 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 53).ult (rankAtom ranks 38)))) = true)
    (h0769 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 2).ult (rankAtom ranks 38)))) = true)
    (h0770 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 34).ult (rankAtom ranks 38)))) = true)
    (h0771 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 54).ult (rankAtom ranks 39)))) = true)
    (h0772 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h0773 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 34).ult (rankAtom ranks 39)))) = true)
    (h0774 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 55).ult (rankAtom ranks 40)))) = true)
    (h0775 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h0776 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 34).ult (rankAtom ranks 40)))) = true)
    (h0777 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 56).ult (rankAtom ranks 41)))) = true)
    (h0778 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h0779 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 34).ult (rankAtom ranks 41)))) = true)
    (h0780 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h0781 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 2).ult (rankAtom ranks 36)))) = true)
    (h0782 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true)
    (h0783 : ((!((rankAtom ranks 5 == rankAtom ranks 35)) || ((rankAtom ranks 6).ult (rankAtom ranks 36)))) = true)
    (h0784 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h0785 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h0786 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 2).ult (rankAtom ranks 5)))) = true)
    (h0787 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h0788 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 35).ult (rankAtom ranks 5)))) = true)
    (h0789 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 59).ult (rankAtom ranks 38)))) = true)
    (h0790 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 2).ult (rankAtom ranks 38)))) = true)
    (h0791 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 35).ult (rankAtom ranks 38)))) = true)
    (h0792 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 60).ult (rankAtom ranks 39)))) = true)
    (h0793 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h0794 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 35).ult (rankAtom ranks 39)))) = true)
    (h0795 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 61).ult (rankAtom ranks 40)))) = true)
    (h0796 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h0797 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 35).ult (rankAtom ranks 40)))) = true)
    (h0798 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 62).ult (rankAtom ranks 41)))) = true)
    (h0799 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h0800 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 35).ult (rankAtom ranks 41)))) = true)
    (h0801 : ((!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h0802 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 2).ult (rankAtom ranks 6)))) = true)
    (h0803 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h0804 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 36).ult (rankAtom ranks 6)))) = true)
    (h0805 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 64).ult (rankAtom ranks 38)))) = true)
    (h0806 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 36).ult (rankAtom ranks 38)))) = true)
    (h0807 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 36).ult (rankAtom ranks 39)))) = true)
    (h0808 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 66).ult (rankAtom ranks 40)))) = true)
    (h0809 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 36).ult (rankAtom ranks 40)))) = true)
    (h0810 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 67).ult (rankAtom ranks 41)))) = true)
    (h0811 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 36).ult (rankAtom ranks 41)))) = true)
    (h0812 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 8).ult (rankAtom ranks 38)))) = true)
    (h0813 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 9).ult (rankAtom ranks 39)))) = true)
    (h0814 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 10).ult (rankAtom ranks 40)))) = true)
    (h0815 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 11).ult (rankAtom ranks 41)))) = true)
    (h0816 : ((!((rankAtom ranks 8 == rankAtom ranks 9)) || ((rankAtom ranks 38).ult (rankAtom ranks 39)))) = true)
    (h0817 : ((!((rankAtom ranks 8 == rankAtom ranks 10)) || ((rankAtom ranks 38).ult (rankAtom ranks 40)))) = true)
    (h0818 : ((!((rankAtom ranks 9 == rankAtom ranks 10)) || ((rankAtom ranks 39).ult (rankAtom ranks 40)))) = true)
    (h0819 : ((!((rankAtom ranks 9 == rankAtom ranks 11)) || ((rankAtom ranks 39).ult (rankAtom ranks 41)))) = true)
    (h0820 : ((!((rankAtom ranks 10 == rankAtom ranks 11)) || ((rankAtom ranks 40).ult (rankAtom ranks 41)))) = true)
    (h0821 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h0822 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 3).ult (rankAtom ranks 43)))) = true)
    (h0823 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 3).ult (rankAtom ranks 4)))) = true)
    (h0824 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h0825 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 5).ult (rankAtom ranks 43)))) = true)
    (h0826 : ((!((rankAtom ranks 43 == rankAtom ranks 5)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h0827 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 5).ult (rankAtom ranks 4)))) = true)
    (h0828 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h0829 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 3).ult (rankAtom ranks 44)))) = true)
    (h0830 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h0831 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 6).ult (rankAtom ranks 44)))) = true) :
    ∀ item ∈ directChunk012Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk012Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0768
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0769
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0770
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0771
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0772
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0773
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0774
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0775
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0776
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0777
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0778
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0779
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0780
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0781
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0782
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0783
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0784
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0785
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0786
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0787
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0788
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0789
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0790
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0791
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0792
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0793
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0794
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0795
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0796
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0797
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0798
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0799
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0800
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0801
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0802
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0803
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0804
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0805
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0806
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0807
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0808
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0809
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0810
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0811
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0812
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0813
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0814
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0815
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0816
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0817
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0818
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0819
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0820
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0821
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0822
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0823
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0824
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0825
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0826
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0827
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0828
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0829
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0830
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0831

theorem directChunk013_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0832 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 6).ult (rankAtom ranks 4)))) = true)
    (h0833 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h0834 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 3).ult (rankAtom ranks 45)))) = true)
    (h0835 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h0836 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 7).ult (rankAtom ranks 45)))) = true)
    (h0837 : ((!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h0838 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h0839 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 3).ult (rankAtom ranks 46)))) = true)
    (h0840 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 53).ult (rankAtom ranks 4)))) = true)
    (h0841 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 8).ult (rankAtom ranks 46)))) = true)
    (h0842 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 54).ult (rankAtom ranks 47)))) = true)
    (h0843 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 3).ult (rankAtom ranks 47)))) = true)
    (h0844 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 54).ult (rankAtom ranks 4)))) = true)
    (h0845 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 42).ult (rankAtom ranks 47)))) = true)
    (h0846 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 9).ult (rankAtom ranks 47)))) = true)
    (h0847 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 9).ult (rankAtom ranks 4)))) = true)
    (h0848 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 55).ult (rankAtom ranks 48)))) = true)
    (h0849 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 3).ult (rankAtom ranks 48)))) = true)
    (h0850 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 55).ult (rankAtom ranks 4)))) = true)
    (h0851 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 42).ult (rankAtom ranks 48)))) = true)
    (h0852 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 56).ult (rankAtom ranks 49)))) = true)
    (h0853 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h0854 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 56).ult (rankAtom ranks 4)))) = true)
    (h0855 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 42).ult (rankAtom ranks 49)))) = true)
    (h0856 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 57).ult (rankAtom ranks 44)))) = true)
    (h0857 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 3).ult (rankAtom ranks 44)))) = true)
    (h0858 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h0859 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 6).ult (rankAtom ranks 44)))) = true)
    (h0860 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h0861 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 58).ult (rankAtom ranks 45)))) = true)
    (h0862 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 3).ult (rankAtom ranks 45)))) = true)
    (h0863 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h0864 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 7).ult (rankAtom ranks 45)))) = true)
    (h0865 : ((!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 43).ult (rankAtom ranks 5)))) = true)
    (h0866 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 59).ult (rankAtom ranks 46)))) = true)
    (h0867 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 3).ult (rankAtom ranks 46)))) = true)
    (h0868 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 59).ult (rankAtom ranks 5)))) = true)
    (h0869 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h0870 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 8).ult (rankAtom ranks 46)))) = true)
    (h0871 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 8).ult (rankAtom ranks 5)))) = true)
    (h0872 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 60).ult (rankAtom ranks 47)))) = true)
    (h0873 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 3).ult (rankAtom ranks 47)))) = true)
    (h0874 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 60).ult (rankAtom ranks 5)))) = true)
    (h0875 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h0876 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 9).ult (rankAtom ranks 47)))) = true)
    (h0877 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 9).ult (rankAtom ranks 5)))) = true)
    (h0878 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 61).ult (rankAtom ranks 48)))) = true)
    (h0879 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 3).ult (rankAtom ranks 48)))) = true)
    (h0880 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 61).ult (rankAtom ranks 5)))) = true)
    (h0881 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 43).ult (rankAtom ranks 48)))) = true)
    (h0882 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 10).ult (rankAtom ranks 5)))) = true)
    (h0883 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 62).ult (rankAtom ranks 49)))) = true)
    (h0884 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h0885 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 62).ult (rankAtom ranks 5)))) = true)
    (h0886 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 43).ult (rankAtom ranks 49)))) = true)
    (h0887 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 11).ult (rankAtom ranks 5)))) = true)
    (h0888 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 63).ult (rankAtom ranks 45)))) = true)
    (h0889 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h0890 : ((!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 44).ult (rankAtom ranks 6)))) = true)
    (h0891 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 64).ult (rankAtom ranks 46)))) = true)
    (h0892 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 64).ult (rankAtom ranks 6)))) = true)
    (h0893 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 44).ult (rankAtom ranks 46)))) = true)
    (h0894 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 8).ult (rankAtom ranks 6)))) = true)
    (h0895 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true) :
    ∀ item ∈ directChunk013Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk013Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0832
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0833
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0834
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0835
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0836
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0837
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0838
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0839
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0840
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0841
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0842
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0843
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0844
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0845
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0846
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0847
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0848
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0849
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0850
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0851
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0852
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0853
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0854
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0855
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0856
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0857
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0858
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0859
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0860
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0861
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0862
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0863
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0864
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0865
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0866
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0867
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0868
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0869
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0870
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0871
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0872
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0873
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0874
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0875
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0876
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0877
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0878
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0879
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0880
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0881
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0882
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0883
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0884
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0885
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0886
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0887
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0888
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0889
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0890
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0891
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0892
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0893
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0894
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0895

theorem directChunk014_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0896 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 44).ult (rankAtom ranks 47)))) = true)
    (h0897 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 9).ult (rankAtom ranks 6)))) = true)
    (h0898 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 66).ult (rankAtom ranks 48)))) = true)
    (h0899 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 66).ult (rankAtom ranks 6)))) = true)
    (h0900 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 44).ult (rankAtom ranks 48)))) = true)
    (h0901 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 67).ult (rankAtom ranks 49)))) = true)
    (h0902 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h0903 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 44).ult (rankAtom ranks 49)))) = true)
    (h0904 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 68).ult (rankAtom ranks 7)))) = true)
    (h0905 : ((!((rankAtom ranks 46 == rankAtom ranks 8)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h0906 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 8).ult (rankAtom ranks 7)))) = true)
    (h0907 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 69).ult (rankAtom ranks 7)))) = true)
    (h0908 : ((!((rankAtom ranks 47 == rankAtom ranks 9)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h0909 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 9).ult (rankAtom ranks 7)))) = true)
    (h0910 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 70).ult (rankAtom ranks 7)))) = true)
    (h0911 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h0912 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h0913 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 11).ult (rankAtom ranks 7)))) = true)
    (h0914 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h0915 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 10).ult (rankAtom ranks 8)))) = true)
    (h0916 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 11).ult (rankAtom ranks 8)))) = true)
    (h0917 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 47).ult (rankAtom ranks 9)))) = true)
    (h0918 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h0919 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 11).ult (rankAtom ranks 9)))) = true)
    (h0920 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h0921 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h0922 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 4).ult (rankAtom ranks 51)))) = true)
    (h0923 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h0924 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 6).ult (rankAtom ranks 51)))) = true)
    (h0925 : ((!((rankAtom ranks 51 == rankAtom ranks 6)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h0926 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h0927 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h0928 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 4).ult (rankAtom ranks 52)))) = true)
    (h0929 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h0930 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 7).ult (rankAtom ranks 52)))) = true)
    (h0931 : ((!((rankAtom ranks 52 == rankAtom ranks 7)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h0932 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 7).ult (rankAtom ranks 5)))) = true)
    (h0933 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h0934 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 4).ult (rankAtom ranks 53)))) = true)
    (h0935 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h0936 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 8).ult (rankAtom ranks 53)))) = true)
    (h0937 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h0938 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 4).ult (rankAtom ranks 54)))) = true)
    (h0939 : ((!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 60).ult (rankAtom ranks 5)))) = true)
    (h0940 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h0941 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 9).ult (rankAtom ranks 54)))) = true)
    (h0942 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h0943 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 4).ult (rankAtom ranks 55)))) = true)
    (h0944 : ((!((rankAtom ranks 55 == rankAtom ranks 4)) || ((rankAtom ranks 61).ult (rankAtom ranks 5)))) = true)
    (h0945 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h0946 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 10).ult (rankAtom ranks 55)))) = true)
    (h0947 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h0948 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 4).ult (rankAtom ranks 56)))) = true)
    (h0949 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 62).ult (rankAtom ranks 5)))) = true)
    (h0950 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 50).ult (rankAtom ranks 56)))) = true)
    (h0951 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h0952 : ((!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 4).ult (rankAtom ranks 52)))) = true)
    (h0953 : ((!((rankAtom ranks 52 == rankAtom ranks 4)) || ((rankAtom ranks 63).ult (rankAtom ranks 6)))) = true)
    (h0954 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h0955 : ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 7).ult (rankAtom ranks 52)))) = true)
    (h0956 : ((!((rankAtom ranks 52 == rankAtom ranks 7)) || ((rankAtom ranks 51).ult (rankAtom ranks 6)))) = true)
    (h0957 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h0958 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h0959 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true) :
    ∀ item ∈ directChunk014Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk014Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0896
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0897
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0898
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0899
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0900
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0901
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0902
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0903
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0904
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0905
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0906
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0907
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0908
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0909
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0910
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0911
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0912
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0913
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0914
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0915
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0916
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0917
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0918
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0919
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0920
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0921
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0922
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0923
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0924
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0925
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0926
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0927
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0928
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0929
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0930
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0931
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0932
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0933
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0934
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0935
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0936
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0937
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0938
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0939
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0940
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0941
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0942
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0943
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0944
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0945
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0946
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0947
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0948
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0949
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0950
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0951
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0952
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0953
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0954
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0955
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0956
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0957
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0958
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0959

theorem directChunk015_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0960 : ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 8).ult (rankAtom ranks 53)))) = true)
    (h0961 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h0962 : ((!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true)
    (h0963 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h0964 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 66).ult (rankAtom ranks 55)))) = true)
    (h0965 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h0966 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 56)))) = true)
    (h0967 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h0968 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h0969 : ((!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h0970 : ((!((rankAtom ranks 7 == rankAtom ranks 52)) || ((rankAtom ranks 8).ult (rankAtom ranks 53)))) = true)
    (h0971 : ((!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 71).ult (rankAtom ranks 56)))) = true)
    (h0972 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h0973 : ((!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 5).ult (rankAtom ranks 58)))) = true)
    (h0974 : ((!((rankAtom ranks 58 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 6)))) = true)
    (h0975 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h0976 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 58)))) = true)
    (h0977 : ((!((rankAtom ranks 58 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 6)))) = true)
    (h0978 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h0979 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h0980 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h0981 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 8).ult (rankAtom ranks 59)))) = true)
    (h0982 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h0983 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h0984 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 9).ult (rankAtom ranks 60)))) = true)
    (h0985 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h0986 : ((!((rankAtom ranks 61 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 6)))) = true)
    (h0987 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h0988 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h0989 : ((!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h0990 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h0991 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h0992 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h0993 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h0994 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 10).ult (rankAtom ranks 7)))) = true)
    (h0995 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h0996 : ((!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h0997 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h0998 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h0999 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h1000 : ((!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 34).ult (rankAtom ranks 13)))) = true)
    (h1001 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 15).ult (rankAtom ranks 13)))) = true)
    (h1002 : ((!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 35).ult (rankAtom ranks 13)))) = true)
    (h1003 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 16).ult (rankAtom ranks 13)))) = true)
    (h1004 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 36).ult (rankAtom ranks 13)))) = true)
    (h1005 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 17).ult (rankAtom ranks 13)))) = true)
    (h1006 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 37).ult (rankAtom ranks 13)))) = true)
    (h1007 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 12).ult (rankAtom ranks 13)))) = true)
    (h1008 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 23).ult (rankAtom ranks 13)))) = true)
    (h1009 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 18).ult (rankAtom ranks 13)))) = true)
    (h1010 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 38).ult (rankAtom ranks 13)))) = true)
    (h1011 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 39).ult (rankAtom ranks 13)))) = true)
    (h1012 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 40).ult (rankAtom ranks 13)))) = true)
    (h1013 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 41).ult (rankAtom ranks 13)))) = true)
    (h1014 : ((!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 42).ult (rankAtom ranks 14)))) = true)
    (h1015 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h1016 : ((!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 43).ult (rankAtom ranks 14)))) = true)
    (h1017 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h1018 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 44).ult (rankAtom ranks 14)))) = true)
    (h1019 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 45).ult (rankAtom ranks 14)))) = true)
    (h1020 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h1021 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 24).ult (rankAtom ranks 14)))) = true)
    (h1022 : ((!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 18).ult (rankAtom ranks 14)))) = true)
    (h1023 : ((!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true) :
    ∀ item ∈ directChunk015Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk015Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0960
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0961
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0962
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0963
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0964
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0965
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0966
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0967
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0968
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0969
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0970
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0971
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0972
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0973
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0974
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0975
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0976
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0977
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0978
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0979
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0980
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0981
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0982
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0983
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0984
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0985
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0986
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0987
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0988
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0989
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0990
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0991
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0992
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0993
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0994
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0995
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0996
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0997
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0998
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h0999
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1000
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1001
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1002
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1003
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1004
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1005
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1006
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1007
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1008
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1009
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1010
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1011
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1012
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1013
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1014
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1015
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1016
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1017
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1018
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1019
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1020
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1021
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1022
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1023

theorem directChunk016_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1024 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 46).ult (rankAtom ranks 14)))) = true)
    (h1025 : ((!((rankAtom ranks 14 == rankAtom ranks 47)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h1026 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 47).ult (rankAtom ranks 14)))) = true)
    (h1027 : ((!((rankAtom ranks 14 == rankAtom ranks 48)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h1028 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 48).ult (rankAtom ranks 14)))) = true)
    (h1029 : ((!((rankAtom ranks 14 == rankAtom ranks 49)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h1030 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 49).ult (rankAtom ranks 14)))) = true)
    (h1031 : ((!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 12).ult (rankAtom ranks 26)))) = true)
    (h1032 : ((!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 50).ult (rankAtom ranks 15)))) = true)
    (h1033 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h1034 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 16).ult (rankAtom ranks 15)))) = true)
    (h1035 : ((!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 12).ult (rankAtom ranks 27)))) = true)
    (h1036 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 51).ult (rankAtom ranks 15)))) = true)
    (h1037 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 17).ult (rankAtom ranks 15)))) = true)
    (h1038 : ((!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 12).ult (rankAtom ranks 28)))) = true)
    (h1039 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 52).ult (rankAtom ranks 15)))) = true)
    (h1040 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h1041 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 25).ult (rankAtom ranks 15)))) = true)
    (h1042 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 18).ult (rankAtom ranks 15)))) = true)
    (h1043 : ((!((rankAtom ranks 15 == rankAtom ranks 53)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h1044 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 53).ult (rankAtom ranks 15)))) = true)
    (h1045 : ((!((rankAtom ranks 15 == rankAtom ranks 54)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h1046 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 54).ult (rankAtom ranks 15)))) = true)
    (h1047 : ((!((rankAtom ranks 15 == rankAtom ranks 55)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h1048 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 55).ult (rankAtom ranks 15)))) = true)
    (h1049 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 56).ult (rankAtom ranks 32)))) = true)
    (h1050 : ((!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h1051 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 56).ult (rankAtom ranks 15)))) = true)
    (h1052 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 12).ult (rankAtom ranks 27)))) = true)
    (h1053 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 57).ult (rankAtom ranks 16)))) = true)
    (h1054 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 17).ult (rankAtom ranks 16)))) = true)
    (h1055 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 58).ult (rankAtom ranks 16)))) = true)
    (h1056 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h1057 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 26).ult (rankAtom ranks 16)))) = true)
    (h1058 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h1059 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h1060 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 59).ult (rankAtom ranks 16)))) = true)
    (h1061 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h1062 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 60).ult (rankAtom ranks 16)))) = true)
    (h1063 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h1064 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 61).ult (rankAtom ranks 16)))) = true)
    (h1065 : ((!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 62).ult (rankAtom ranks 32)))) = true)
    (h1066 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h1067 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 62).ult (rankAtom ranks 16)))) = true)
    (h1068 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 63).ult (rankAtom ranks 17)))) = true)
    (h1069 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 12).ult (rankAtom ranks 17)))) = true)
    (h1070 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 27).ult (rankAtom ranks 17)))) = true)
    (h1071 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h1072 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true)
    (h1073 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h1074 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h1075 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h1076 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 68).ult (rankAtom ranks 29)))) = true)
    (h1077 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h1078 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 19).ult (rankAtom ranks 29)))) = true)
    (h1079 : ((!((rankAtom ranks 29 == rankAtom ranks 28)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h1080 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 69).ult (rankAtom ranks 30)))) = true)
    (h1081 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h1082 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 20).ult (rankAtom ranks 30)))) = true)
    (h1083 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 70).ult (rankAtom ranks 31)))) = true)
    (h1084 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h1085 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 21).ult (rankAtom ranks 31)))) = true)
    (h1086 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 71).ult (rankAtom ranks 32)))) = true)
    (h1087 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true) :
    ∀ item ∈ directChunk016Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk016Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1024
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1025
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1026
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1027
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1028
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1029
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1030
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1031
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1032
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1033
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1034
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1035
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1036
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1037
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1038
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1039
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1040
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1041
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1042
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1043
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1044
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1045
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1046
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1047
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1048
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1049
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1050
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1051
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1052
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1053
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1054
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1055
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1056
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1057
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1058
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1059
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1060
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1061
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1062
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1063
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1071
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1075
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1076
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1079
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1087

theorem directChunk017_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1088 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 22).ult (rankAtom ranks 32)))) = true)
    (h1089 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h1090 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h1091 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h1092 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 33).ult (rankAtom ranks 14)))) = true)
    (h1093 : ((!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h1094 : ((!((rankAtom ranks 14 == rankAtom ranks 47)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h1095 : ((!((rankAtom ranks 14 == rankAtom ranks 48)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h1096 : ((!((rankAtom ranks 14 == rankAtom ranks 49)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h1097 : ((!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 13).ult (rankAtom ranks 35)))) = true)
    (h1098 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h1099 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 16).ult (rankAtom ranks 15)))) = true)
    (h1100 : ((!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 13).ult (rankAtom ranks 36)))) = true)
    (h1101 : ((!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 13).ult (rankAtom ranks 37)))) = true)
    (h1102 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h1103 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 34).ult (rankAtom ranks 15)))) = true)
    (h1104 : ((!((rankAtom ranks 15 == rankAtom ranks 53)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h1105 : ((!((rankAtom ranks 15 == rankAtom ranks 54)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h1106 : ((!((rankAtom ranks 15 == rankAtom ranks 55)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h1107 : ((!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h1108 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 13).ult (rankAtom ranks 36)))) = true)
    (h1109 : ((!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 13).ult (rankAtom ranks 37)))) = true)
    (h1110 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 13).ult (rankAtom ranks 16)))) = true)
    (h1111 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 35).ult (rankAtom ranks 16)))) = true)
    (h1112 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h1113 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h1114 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h1115 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h1116 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h1117 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 13).ult (rankAtom ranks 17)))) = true)
    (h1118 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 36).ult (rankAtom ranks 17)))) = true)
    (h1119 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h1120 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 19).ult (rankAtom ranks 38)))) = true)
    (h1121 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h1122 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 20).ult (rankAtom ranks 39)))) = true)
    (h1123 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h1124 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 21).ult (rankAtom ranks 40)))) = true)
    (h1125 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h1126 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 22).ult (rankAtom ranks 41)))) = true)
    (h1127 : ((!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 14).ult (rankAtom ranks 43)))) = true)
    (h1128 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1129 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 16).ult (rankAtom ranks 43)))) = true)
    (h1130 : ((!((rankAtom ranks 43 == rankAtom ranks 16)) || ((rankAtom ranks 42).ult (rankAtom ranks 15)))) = true)
    (h1131 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 16).ult (rankAtom ranks 15)))) = true)
    (h1132 : ((!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 14).ult (rankAtom ranks 44)))) = true)
    (h1133 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 17).ult (rankAtom ranks 44)))) = true)
    (h1134 : ((!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 14).ult (rankAtom ranks 45)))) = true)
    (h1135 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 18).ult (rankAtom ranks 45)))) = true)
    (h1136 : ((!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 42).ult (rankAtom ranks 15)))) = true)
    (h1137 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 53).ult (rankAtom ranks 15)))) = true)
    (h1138 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1139 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 19).ult (rankAtom ranks 46)))) = true)
    (h1140 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 19).ult (rankAtom ranks 15)))) = true)
    (h1141 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 54).ult (rankAtom ranks 15)))) = true)
    (h1142 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1143 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 20).ult (rankAtom ranks 15)))) = true)
    (h1144 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 55).ult (rankAtom ranks 15)))) = true)
    (h1145 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1146 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 21).ult (rankAtom ranks 15)))) = true)
    (h1147 : ((!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h1148 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 56).ult (rankAtom ranks 15)))) = true)
    (h1149 : ((!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1150 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 22).ult (rankAtom ranks 15)))) = true)
    (h1151 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 14).ult (rankAtom ranks 44)))) = true) :
    ∀ item ∈ directChunk017Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk017Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1095
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1098
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1099
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1103
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1104
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1111
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1113
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1114
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1115
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1119
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1124
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1125
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1126
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1127
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1128
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1130
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1131
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1132
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1133
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1135
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1142
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1143
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1148
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1149
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1150
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1151

theorem directChunk018_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1152 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 17).ult (rankAtom ranks 44)))) = true)
    (h1153 : ((!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 14).ult (rankAtom ranks 45)))) = true)
    (h1154 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 18).ult (rankAtom ranks 45)))) = true)
    (h1155 : ((!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 43).ult (rankAtom ranks 16)))) = true)
    (h1156 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 59).ult (rankAtom ranks 16)))) = true)
    (h1157 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 19).ult (rankAtom ranks 46)))) = true)
    (h1158 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 19).ult (rankAtom ranks 16)))) = true)
    (h1159 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 14).ult (rankAtom ranks 47)))) = true)
    (h1160 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 60).ult (rankAtom ranks 16)))) = true)
    (h1161 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 20).ult (rankAtom ranks 16)))) = true)
    (h1162 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 14).ult (rankAtom ranks 48)))) = true)
    (h1163 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 61).ult (rankAtom ranks 16)))) = true)
    (h1164 : ((!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h1165 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 21).ult (rankAtom ranks 16)))) = true)
    (h1166 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h1167 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 62).ult (rankAtom ranks 16)))) = true)
    (h1168 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 22).ult (rankAtom ranks 16)))) = true)
    (h1169 : ((!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 44).ult (rankAtom ranks 17)))) = true)
    (h1170 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true)
    (h1171 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true)
    (h1172 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h1173 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 20).ult (rankAtom ranks 17)))) = true)
    (h1174 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h1175 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 21).ult (rankAtom ranks 17)))) = true)
    (h1176 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h1177 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 19).ult (rankAtom ranks 46)))) = true)
    (h1178 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h1179 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 69).ult (rankAtom ranks 18)))) = true)
    (h1180 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 20).ult (rankAtom ranks 47)))) = true)
    (h1181 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 20).ult (rankAtom ranks 18)))) = true)
    (h1182 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 70).ult (rankAtom ranks 18)))) = true)
    (h1183 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 21).ult (rankAtom ranks 48)))) = true)
    (h1184 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 21).ult (rankAtom ranks 18)))) = true)
    (h1185 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h1186 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 71).ult (rankAtom ranks 18)))) = true)
    (h1187 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 22).ult (rankAtom ranks 49)))) = true)
    (h1188 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 22).ult (rankAtom ranks 18)))) = true)
    (h1189 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 20).ult (rankAtom ranks 19)))) = true)
    (h1190 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 21).ult (rankAtom ranks 19)))) = true)
    (h1191 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 22).ult (rankAtom ranks 19)))) = true)
    (h1192 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 21).ult (rankAtom ranks 20)))) = true)
    (h1193 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 22).ult (rankAtom ranks 20)))) = true)
    (h1194 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true)
    (h1195 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 15).ult (rankAtom ranks 51)))) = true)
    (h1196 : ((!((rankAtom ranks 51 == rankAtom ranks 15)) || ((rankAtom ranks 57).ult (rankAtom ranks 16)))) = true)
    (h1197 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 17).ult (rankAtom ranks 51)))) = true)
    (h1198 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 17).ult (rankAtom ranks 16)))) = true)
    (h1199 : ((!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 15).ult (rankAtom ranks 52)))) = true)
    (h1200 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h1201 : ((!((rankAtom ranks 16 == rankAtom ranks 18)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h1202 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 18).ult (rankAtom ranks 52)))) = true)
    (h1203 : ((!((rankAtom ranks 52 == rankAtom ranks 18)) || ((rankAtom ranks 50).ult (rankAtom ranks 16)))) = true)
    (h1204 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h1205 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 15).ult (rankAtom ranks 53)))) = true)
    (h1206 : ((!((rankAtom ranks 53 == rankAtom ranks 15)) || ((rankAtom ranks 59).ult (rankAtom ranks 16)))) = true)
    (h1207 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 19).ult (rankAtom ranks 53)))) = true)
    (h1208 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 19).ult (rankAtom ranks 16)))) = true)
    (h1209 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 15).ult (rankAtom ranks 54)))) = true)
    (h1210 : ((!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 60).ult (rankAtom ranks 16)))) = true)
    (h1211 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 20).ult (rankAtom ranks 54)))) = true)
    (h1212 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 15).ult (rankAtom ranks 55)))) = true)
    (h1213 : ((!((rankAtom ranks 55 == rankAtom ranks 15)) || ((rankAtom ranks 61).ult (rankAtom ranks 16)))) = true)
    (h1214 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 21).ult (rankAtom ranks 55)))) = true)
    (h1215 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 15).ult (rankAtom ranks 56)))) = true) :
    ∀ item ∈ directChunk018Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk018Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1152
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1153
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1154
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1159
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1161
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1162
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1163
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1164
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1165
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1167
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1175
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1181
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1182
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1183
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1191
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1199
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1207
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1215

theorem directChunk019_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1216 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 62).ult (rankAtom ranks 16)))) = true)
    (h1217 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 15).ult (rankAtom ranks 17)))) = true)
    (h1218 : ((!((rankAtom ranks 52 == rankAtom ranks 18)) || ((rankAtom ranks 51).ult (rankAtom ranks 17)))) = true)
    (h1219 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h1220 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true)
    (h1221 : ((!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h1222 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h1223 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 15).ult (rankAtom ranks 53)))) = true)
    (h1224 : ((!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 19).ult (rankAtom ranks 53)))) = true)
    (h1225 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h1226 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 15).ult (rankAtom ranks 54)))) = true)
    (h1227 : ((!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 20).ult (rankAtom ranks 54)))) = true)
    (h1228 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 20).ult (rankAtom ranks 18)))) = true)
    (h1229 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 15).ult (rankAtom ranks 55)))) = true)
    (h1230 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 15).ult (rankAtom ranks 56)))) = true)
    (h1231 : ((!((rankAtom ranks 58 == rankAtom ranks 63)) || ((rankAtom ranks 16).ult (rankAtom ranks 17)))) = true)
    (h1232 : ((!((rankAtom ranks 58 == rankAtom ranks 18)) || ((rankAtom ranks 57).ult (rankAtom ranks 17)))) = true)
    (h1233 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h1234 : ((!((rankAtom ranks 59 == rankAtom ranks 16)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true)
    (h1235 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true)
    (h1236 : ((!((rankAtom ranks 60 == rankAtom ranks 16)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h1237 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 20).ult (rankAtom ranks 17)))) = true)
    (h1238 : ((!((rankAtom ranks 61 == rankAtom ranks 16)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h1239 : ((!((rankAtom ranks 62 == rankAtom ranks 16)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h1240 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 16).ult (rankAtom ranks 59)))) = true)
    (h1241 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 19).ult (rankAtom ranks 59)))) = true)
    (h1242 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 16).ult (rankAtom ranks 60)))) = true)
    (h1243 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 20).ult (rankAtom ranks 60)))) = true)
    (h1244 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 16).ult (rankAtom ranks 61)))) = true)
    (h1245 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 21).ult (rankAtom ranks 61)))) = true)
    (h1246 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 21).ult (rankAtom ranks 18)))) = true)
    (h1247 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 16).ult (rankAtom ranks 62)))) = true)
    (h1248 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 17).ult (rankAtom ranks 64)))) = true)
    (h1249 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 19).ult (rankAtom ranks 64)))) = true)
    (h1250 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 17).ult (rankAtom ranks 65)))) = true)
    (h1251 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 20).ult (rankAtom ranks 65)))) = true)
    (h1252 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 17).ult (rankAtom ranks 66)))) = true)
    (h1253 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 21).ult (rankAtom ranks 66)))) = true)
    (h1254 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 17).ult (rankAtom ranks 67)))) = true)
    (h1255 : ((!((rankAtom ranks 24 == rankAtom ranks 42)) || ((rankAtom ranks 23).ult (rankAtom ranks 34)))) = true)
    (h1256 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h1257 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h1258 : ((!((rankAtom ranks 35 == rankAtom ranks 23)) || ((rankAtom ranks 43).ult (rankAtom ranks 24)))) = true)
    (h1259 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h1260 : ((!((rankAtom ranks 24 == rankAtom ranks 44)) || ((rankAtom ranks 23).ult (rankAtom ranks 36)))) = true)
    (h1261 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 45).ult (rankAtom ranks 24)))) = true)
    (h1262 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h1263 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 33).ult (rankAtom ranks 24)))) = true)
    (h1264 : ((!((rankAtom ranks 24 == rankAtom ranks 46)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h1265 : ((!((rankAtom ranks 24 == rankAtom ranks 47)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h1266 : ((!((rankAtom ranks 24 == rankAtom ranks 48)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h1267 : ((!((rankAtom ranks 24 == rankAtom ranks 49)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h1268 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h1269 : ((!((rankAtom ranks 25 == rankAtom ranks 50)) || ((rankAtom ranks 23).ult (rankAtom ranks 35)))) = true)
    (h1270 : ((!((rankAtom ranks 35 == rankAtom ranks 23)) || ((rankAtom ranks 50).ult (rankAtom ranks 25)))) = true)
    (h1271 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h1272 : ((!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h1273 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 26).ult (rankAtom ranks 25)))) = true)
    (h1274 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h1275 : ((!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 23).ult (rankAtom ranks 36)))) = true)
    (h1276 : ((!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h1277 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h1278 : ((!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 37)))) = true)
    (h1279 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 52).ult (rankAtom ranks 25)))) = true) :
    ∀ item ∈ directChunk019Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk019Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1223
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1231
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1239
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1247
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1255
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1256
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1257
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1258
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1259
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1260
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1261
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1262
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1263
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1264
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1265
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1266
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1267
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1268
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1269
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1270
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1271
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1272
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1273
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1274
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1275
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1276
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1277
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1278
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1279

theorem directChunk020_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1280 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h1281 : ((!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h1282 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 25)))) = true)
    (h1283 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 53).ult (rankAtom ranks 38)))) = true)
    (h1284 : ((!((rankAtom ranks 25 == rankAtom ranks 53)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h1285 : ((!((rankAtom ranks 25 == rankAtom ranks 29)) || ((rankAtom ranks 34).ult (rankAtom ranks 38)))) = true)
    (h1286 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 54).ult (rankAtom ranks 39)))) = true)
    (h1287 : ((!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h1288 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 55).ult (rankAtom ranks 40)))) = true)
    (h1289 : ((!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h1290 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 56).ult (rankAtom ranks 41)))) = true)
    (h1291 : ((!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h1292 : ((!((rankAtom ranks 25 == rankAtom ranks 32)) || ((rankAtom ranks 34).ult (rankAtom ranks 41)))) = true)
    (h1293 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h1294 : ((!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 23).ult (rankAtom ranks 36)))) = true)
    (h1295 : ((!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true)
    (h1296 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h1297 : ((!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 37)))) = true)
    (h1298 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 26)))) = true)
    (h1299 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 26)))) = true)
    (h1300 : ((!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h1301 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 26)))) = true)
    (h1302 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 28).ult (rankAtom ranks 26)))) = true)
    (h1303 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 59).ult (rankAtom ranks 38)))) = true)
    (h1304 : ((!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h1305 : ((!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 35).ult (rankAtom ranks 38)))) = true)
    (h1306 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 60).ult (rankAtom ranks 39)))) = true)
    (h1307 : ((!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h1308 : ((!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 35).ult (rankAtom ranks 39)))) = true)
    (h1309 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 61).ult (rankAtom ranks 40)))) = true)
    (h1310 : ((!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h1311 : ((!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 35).ult (rankAtom ranks 40)))) = true)
    (h1312 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 62).ult (rankAtom ranks 41)))) = true)
    (h1313 : ((!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h1314 : ((!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 35).ult (rankAtom ranks 41)))) = true)
    (h1315 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 37)))) = true)
    (h1316 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 27)))) = true)
    (h1317 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 23).ult (rankAtom ranks 27)))) = true)
    (h1318 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h1319 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 27)))) = true)
    (h1320 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 64).ult (rankAtom ranks 38)))) = true)
    (h1321 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 36).ult (rankAtom ranks 38)))) = true)
    (h1322 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 65).ult (rankAtom ranks 39)))) = true)
    (h1323 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 36).ult (rankAtom ranks 39)))) = true)
    (h1324 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 66).ult (rankAtom ranks 40)))) = true)
    (h1325 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 36).ult (rankAtom ranks 40)))) = true)
    (h1326 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 67).ult (rankAtom ranks 41)))) = true)
    (h1327 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 36).ult (rankAtom ranks 41)))) = true)
    (h1328 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 68).ult (rankAtom ranks 38)))) = true)
    (h1329 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h1330 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 37).ult (rankAtom ranks 38)))) = true)
    (h1331 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 29).ult (rankAtom ranks 38)))) = true)
    (h1332 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 69).ult (rankAtom ranks 39)))) = true)
    (h1333 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h1334 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 37).ult (rankAtom ranks 39)))) = true)
    (h1335 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 30).ult (rankAtom ranks 39)))) = true)
    (h1336 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 70).ult (rankAtom ranks 40)))) = true)
    (h1337 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h1338 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 37).ult (rankAtom ranks 40)))) = true)
    (h1339 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 31).ult (rankAtom ranks 40)))) = true)
    (h1340 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 71).ult (rankAtom ranks 41)))) = true)
    (h1341 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h1342 : ((!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 37).ult (rankAtom ranks 41)))) = true)
    (h1343 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 32).ult (rankAtom ranks 41)))) = true) :
    ∀ item ∈ directChunk020Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk020Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1280
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1281
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1282
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1283
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1284
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1285
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1286
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1287
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1288
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1289
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1290
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1291
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1292
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1293
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1294
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1295
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1296
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1297
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1298
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1299
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1300
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1301
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1302
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1303
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1304
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1305
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1306
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1307
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1308
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1309
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1310
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1311
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1312
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1313
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1314
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1315
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1316
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1317
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1318
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1319
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1320
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1321
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1322
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1323
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1324
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1325
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1326
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1327
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1328
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1329
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1330
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1331
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1332
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1333
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1334
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1335
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1336
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1337
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1338
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1339
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1340
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1341
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1342
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1343

theorem directChunk021_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1344 : ((!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 38).ult (rankAtom ranks 39)))) = true)
    (h1345 : ((!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 38).ult (rankAtom ranks 40)))) = true)
    (h1346 : ((!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 38).ult (rankAtom ranks 41)))) = true)
    (h1347 : ((!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 39).ult (rankAtom ranks 40)))) = true)
    (h1348 : ((!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 39).ult (rankAtom ranks 41)))) = true)
    (h1349 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 40).ult (rankAtom ranks 41)))) = true)
    (h1350 : ((!((rankAtom ranks 25 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 43)))) = true)
    (h1351 : ((!((rankAtom ranks 43 == rankAtom ranks 24)) || ((rankAtom ranks 50).ult (rankAtom ranks 25)))) = true)
    (h1352 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1353 : ((!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h1354 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 43)))) = true)
    (h1355 : ((!((rankAtom ranks 43 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h1356 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 25)))) = true)
    (h1357 : ((!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 44)))) = true)
    (h1358 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1359 : ((!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h1360 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 27).ult (rankAtom ranks 44)))) = true)
    (h1361 : ((!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 24).ult (rankAtom ranks 45)))) = true)
    (h1362 : ((!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h1363 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 28).ult (rankAtom ranks 45)))) = true)
    (h1364 : ((!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h1365 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 53).ult (rankAtom ranks 25)))) = true)
    (h1366 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1367 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 46)))) = true)
    (h1368 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 25)))) = true)
    (h1369 : ((!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 47)))) = true)
    (h1370 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 54).ult (rankAtom ranks 25)))) = true)
    (h1371 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1372 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h1373 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 25)))) = true)
    (h1374 : ((!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 48)))) = true)
    (h1375 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 55).ult (rankAtom ranks 25)))) = true)
    (h1376 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1377 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 31).ult (rankAtom ranks 25)))) = true)
    (h1378 : ((!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true)
    (h1379 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 56).ult (rankAtom ranks 25)))) = true)
    (h1380 : ((!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1381 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 32).ult (rankAtom ranks 25)))) = true)
    (h1382 : ((!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 24).ult (rankAtom ranks 44)))) = true)
    (h1383 : ((!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h1384 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 27).ult (rankAtom ranks 44)))) = true)
    (h1385 : ((!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 24).ult (rankAtom ranks 45)))) = true)
    (h1386 : ((!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h1387 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 28).ult (rankAtom ranks 45)))) = true)
    (h1388 : ((!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 26)))) = true)
    (h1389 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 59).ult (rankAtom ranks 26)))) = true)
    (h1390 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h1391 : ((!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h1392 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 46)))) = true)
    (h1393 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 26)))) = true)
    (h1394 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 60).ult (rankAtom ranks 26)))) = true)
    (h1395 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h1396 : ((!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h1397 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h1398 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 26)))) = true)
    (h1399 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 61).ult (rankAtom ranks 26)))) = true)
    (h1400 : ((!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 43).ult (rankAtom ranks 48)))) = true)
    (h1401 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 48)))) = true)
    (h1402 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 26)))) = true)
    (h1403 : ((!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true)
    (h1404 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 62).ult (rankAtom ranks 26)))) = true)
    (h1405 : ((!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 43).ult (rankAtom ranks 49)))) = true)
    (h1406 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h1407 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 26)))) = true) :
    ∀ item ∈ directChunk021Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk021Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1344
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1345
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1346
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1347
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1348
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1349
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1350
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1351
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1352
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1353
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1354
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1355
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1356
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1357
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1358
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1359
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1360
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1361
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1362
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1363
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1364
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1365
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1366
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1367
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1368
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1369
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1370
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1371
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1372
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1373
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1374
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1375
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1376
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1377
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1378
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1379
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1380
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1381
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1382
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1383
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1384
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1385
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1386
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1387
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1388
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1389
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1390
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1391
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1392
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1393
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1394
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1395
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1396
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1397
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1398
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1399
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1400
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1401
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1402
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1403
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1404
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1405
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1406
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1407

theorem directChunk022_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1408 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h1409 : ((!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 44).ult (rankAtom ranks 27)))) = true)
    (h1410 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 64).ult (rankAtom ranks 27)))) = true)
    (h1411 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 29).ult (rankAtom ranks 27)))) = true)
    (h1412 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 65).ult (rankAtom ranks 27)))) = true)
    (h1413 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 30).ult (rankAtom ranks 27)))) = true)
    (h1414 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 66).ult (rankAtom ranks 27)))) = true)
    (h1415 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 44).ult (rankAtom ranks 48)))) = true)
    (h1416 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 31).ult (rankAtom ranks 27)))) = true)
    (h1417 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 67).ult (rankAtom ranks 27)))) = true)
    (h1418 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 44).ult (rankAtom ranks 49)))) = true)
    (h1419 : ((!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h1420 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 45).ult (rankAtom ranks 46)))) = true)
    (h1421 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 29).ult (rankAtom ranks 46)))) = true)
    (h1422 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h1423 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 69).ult (rankAtom ranks 28)))) = true)
    (h1424 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 45).ult (rankAtom ranks 47)))) = true)
    (h1425 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h1426 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 30).ult (rankAtom ranks 28)))) = true)
    (h1427 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 70).ult (rankAtom ranks 28)))) = true)
    (h1428 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 45).ult (rankAtom ranks 48)))) = true)
    (h1429 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 31).ult (rankAtom ranks 48)))) = true)
    (h1430 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 31).ult (rankAtom ranks 28)))) = true)
    (h1431 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 71).ult (rankAtom ranks 28)))) = true)
    (h1432 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h1433 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 32).ult (rankAtom ranks 28)))) = true)
    (h1434 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 30).ult (rankAtom ranks 29)))) = true)
    (h1435 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 31).ult (rankAtom ranks 29)))) = true)
    (h1436 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 32).ult (rankAtom ranks 29)))) = true)
    (h1437 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 31).ult (rankAtom ranks 30)))) = true)
    (h1438 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 32).ult (rankAtom ranks 30)))) = true)
    (h1439 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 32).ult (rankAtom ranks 31)))) = true)
    (h1440 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h1441 : ((!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 25).ult (rankAtom ranks 51)))) = true)
    (h1442 : ((!((rankAtom ranks 51 == rankAtom ranks 25)) || ((rankAtom ranks 57).ult (rankAtom ranks 26)))) = true)
    (h1443 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h1444 : ((!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h1445 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 27).ult (rankAtom ranks 51)))) = true)
    (h1446 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 27).ult (rankAtom ranks 26)))) = true)
    (h1447 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h1448 : ((!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 25).ult (rankAtom ranks 52)))) = true)
    (h1449 : ((!((rankAtom ranks 52 == rankAtom ranks 25)) || ((rankAtom ranks 58).ult (rankAtom ranks 26)))) = true)
    (h1450 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h1451 : ((!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h1452 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 28).ult (rankAtom ranks 52)))) = true)
    (h1453 : ((!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h1454 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 28).ult (rankAtom ranks 26)))) = true)
    (h1455 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h1456 : ((!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 25).ult (rankAtom ranks 53)))) = true)
    (h1457 : ((!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 59).ult (rankAtom ranks 26)))) = true)
    (h1458 : ((!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h1459 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 29).ult (rankAtom ranks 53)))) = true)
    (h1460 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 29).ult (rankAtom ranks 26)))) = true)
    (h1461 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h1462 : ((!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 25).ult (rankAtom ranks 54)))) = true)
    (h1463 : ((!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 60).ult (rankAtom ranks 26)))) = true)
    (h1464 : ((!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h1465 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 30).ult (rankAtom ranks 54)))) = true)
    (h1466 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 30).ult (rankAtom ranks 26)))) = true)
    (h1467 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h1468 : ((!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 25).ult (rankAtom ranks 55)))) = true)
    (h1469 : ((!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 61).ult (rankAtom ranks 26)))) = true)
    (h1470 : ((!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h1471 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 55)))) = true) :
    ∀ item ∈ directChunk022Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk022Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1408
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1409
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1410
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1411
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1412
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1413
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1414
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1415
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1416
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1417
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1418
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1419
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1420
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1421
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1422
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1423
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1424
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1425
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1426
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1427
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1428
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1429
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1430
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1431
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1432
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1433
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1434
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1435
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1436
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1437
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1438
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1439
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1440
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1441
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1442
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1443
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1444
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1445
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1446
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1447
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1448
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1449
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1450
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1451
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1452
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1453
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1454
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1455
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1456
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1457
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1458
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1459
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1460
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1461
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1462
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1463
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1464
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1465
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1466
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1467
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1468
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1469
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1470
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1471

theorem directChunk023_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1472 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 26)))) = true)
    (h1473 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h1474 : ((!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 25).ult (rankAtom ranks 56)))) = true)
    (h1475 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 26)))) = true)
    (h1476 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 56)))) = true)
    (h1477 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 26)))) = true)
    (h1478 : ((!((rankAtom ranks 52 == rankAtom ranks 25)) || ((rankAtom ranks 63).ult (rankAtom ranks 27)))) = true)
    (h1479 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 25).ult (rankAtom ranks 27)))) = true)
    (h1480 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h1481 : ((!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h1482 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 28).ult (rankAtom ranks 27)))) = true)
    (h1483 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h1484 : ((!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 27)))) = true)
    (h1485 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h1486 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 29).ult (rankAtom ranks 27)))) = true)
    (h1487 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h1488 : ((!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 27)))) = true)
    (h1489 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h1490 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 30).ult (rankAtom ranks 27)))) = true)
    (h1491 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 55)))) = true)
    (h1492 : ((!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 27)))) = true)
    (h1493 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h1494 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 31).ult (rankAtom ranks 27)))) = true)
    (h1495 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 56)))) = true)
    (h1496 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 27)))) = true)
    (h1497 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h1498 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h1499 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h1500 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 25).ult (rankAtom ranks 53)))) = true)
    (h1501 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h1502 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 53)))) = true)
    (h1503 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h1504 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 69).ult (rankAtom ranks 54)))) = true)
    (h1505 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 25).ult (rankAtom ranks 54)))) = true)
    (h1506 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h1507 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 54)))) = true)
    (h1508 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 28)))) = true)
    (h1509 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 70).ult (rankAtom ranks 55)))) = true)
    (h1510 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 25).ult (rankAtom ranks 55)))) = true)
    (h1511 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 52).ult (rankAtom ranks 55)))) = true)
    (h1512 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 55)))) = true)
    (h1513 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 28)))) = true)
    (h1514 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 71).ult (rankAtom ranks 56)))) = true)
    (h1515 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 25).ult (rankAtom ranks 56)))) = true)
    (h1516 : ((!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 52).ult (rankAtom ranks 56)))) = true)
    (h1517 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h1518 : ((!((rankAtom ranks 58 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 27)))) = true)
    (h1519 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h1520 : ((!((rankAtom ranks 27 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 58)))) = true)
    (h1521 : ((!((rankAtom ranks 58 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 27)))) = true)
    (h1522 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 27)))) = true)
    (h1523 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h1524 : ((!((rankAtom ranks 59 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 27)))) = true)
    (h1525 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h1526 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 29).ult (rankAtom ranks 27)))) = true)
    (h1527 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h1528 : ((!((rankAtom ranks 60 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 27)))) = true)
    (h1529 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h1530 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 30).ult (rankAtom ranks 27)))) = true)
    (h1531 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h1532 : ((!((rankAtom ranks 61 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 27)))) = true)
    (h1533 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h1534 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 31).ult (rankAtom ranks 27)))) = true)
    (h1535 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true) :
    ∀ item ∈ directChunk023Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk023Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1472
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1473
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1474
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1475
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1476
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1477
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1478
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1479
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1480
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1481
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1482
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1483
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1484
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1485
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1486
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1487
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1488
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1489
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1490
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1491
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1492
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1493
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1494
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1495
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1496
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1497
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1498
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1499
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1500
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1501
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1502
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1503
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1504
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1505
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1506
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1507
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1508
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1509
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1510
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1511
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1512
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1513
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1514
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1515
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1516
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1517
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1518
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1519
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1520
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1521
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1522
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1523
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1524
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1525
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1526
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1527
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1528
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1529
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1530
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1531
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1532
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1533
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1534
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1535

theorem directChunk024_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1536 : ((!((rankAtom ranks 62 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 27)))) = true)
    (h1537 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h1538 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h1539 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 26).ult (rankAtom ranks 59)))) = true)
    (h1540 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h1541 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 59)))) = true)
    (h1542 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h1543 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h1544 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 26).ult (rankAtom ranks 60)))) = true)
    (h1545 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h1546 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 60)))) = true)
    (h1547 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 28)))) = true)
    (h1548 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h1549 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 26).ult (rankAtom ranks 61)))) = true)
    (h1550 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 61)))) = true)
    (h1551 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 28)))) = true)
    (h1552 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h1553 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 26).ult (rankAtom ranks 62)))) = true)
    (h1554 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 62)))) = true)
    (h1555 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 28)))) = true)
    (h1556 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h1557 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 27).ult (rankAtom ranks 64)))) = true)
    (h1558 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 29).ult (rankAtom ranks 64)))) = true)
    (h1559 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h1560 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 27).ult (rankAtom ranks 65)))) = true)
    (h1561 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 30).ult (rankAtom ranks 65)))) = true)
    (h1562 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h1563 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 27).ult (rankAtom ranks 66)))) = true)
    (h1564 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 31).ult (rankAtom ranks 66)))) = true)
    (h1565 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h1566 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 27).ult (rankAtom ranks 67)))) = true)
    (h1567 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 32).ult (rankAtom ranks 67)))) = true)
    (h1568 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h1569 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 43)))) = true)
    (h1570 : ((!((rankAtom ranks 43 == rankAtom ranks 35)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h1571 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 34)))) = true)
    (h1572 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 44)))) = true)
    (h1573 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 34)))) = true)
    (h1574 : ((!((rankAtom ranks 34 == rankAtom ranks 52)) || ((rankAtom ranks 33).ult (rankAtom ranks 45)))) = true)
    (h1575 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 37).ult (rankAtom ranks 45)))) = true)
    (h1576 : ((!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h1577 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 53).ult (rankAtom ranks 34)))) = true)
    (h1578 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h1579 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 34)))) = true)
    (h1580 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 54).ult (rankAtom ranks 34)))) = true)
    (h1581 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h1582 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 34)))) = true)
    (h1583 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 55).ult (rankAtom ranks 34)))) = true)
    (h1584 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h1585 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 34)))) = true)
    (h1586 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 56).ult (rankAtom ranks 34)))) = true)
    (h1587 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h1588 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 34)))) = true)
    (h1589 : ((!((rankAtom ranks 35 == rankAtom ranks 57)) || ((rankAtom ranks 33).ult (rankAtom ranks 44)))) = true)
    (h1590 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 44)))) = true)
    (h1591 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 35)))) = true)
    (h1592 : ((!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h1593 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 37).ult (rankAtom ranks 45)))) = true)
    (h1594 : ((!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h1595 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 59).ult (rankAtom ranks 35)))) = true)
    (h1596 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h1597 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 35)))) = true)
    (h1598 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 60).ult (rankAtom ranks 35)))) = true)
    (h1599 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true) :
    ∀ item ∈ directChunk024Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk024Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1536
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1537
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1538
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1539
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1540
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1541
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1542
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1543
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1544
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1545
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1546
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1547
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1548
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1549
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1550
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1551
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1552
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1553
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1554
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1555
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1556
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1557
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1558
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1559
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1560
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1561
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1562
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1563
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1564
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1565
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1566
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1567
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1568
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1569
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1570
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1571
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1572
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1573
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1574
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1575
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1576
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1577
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1578
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1579
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1580
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1581
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1582
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1583
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1584
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1585
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1586
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1587
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1588
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1589
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1590
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1591
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1592
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1593
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1594
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1595
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1596
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1597
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1598
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1599

theorem directChunk025_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1600 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 35)))) = true)
    (h1601 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 61).ult (rankAtom ranks 35)))) = true)
    (h1602 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h1603 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 40).ult (rankAtom ranks 35)))) = true)
    (h1604 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 62).ult (rankAtom ranks 35)))) = true)
    (h1605 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h1606 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 41).ult (rankAtom ranks 35)))) = true)
    (h1607 : ((!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 44).ult (rankAtom ranks 36)))) = true)
    (h1608 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 64).ult (rankAtom ranks 36)))) = true)
    (h1609 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 38).ult (rankAtom ranks 36)))) = true)
    (h1610 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 65).ult (rankAtom ranks 36)))) = true)
    (h1611 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 39).ult (rankAtom ranks 36)))) = true)
    (h1612 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 66).ult (rankAtom ranks 36)))) = true)
    (h1613 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 40).ult (rankAtom ranks 36)))) = true)
    (h1614 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 67).ult (rankAtom ranks 36)))) = true)
    (h1615 : ((!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 41).ult (rankAtom ranks 36)))) = true)
    (h1616 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h1617 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 38).ult (rankAtom ranks 37)))) = true)
    (h1618 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h1619 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 39).ult (rankAtom ranks 37)))) = true)
    (h1620 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h1621 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 40).ult (rankAtom ranks 37)))) = true)
    (h1622 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 71).ult (rankAtom ranks 37)))) = true)
    (h1623 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h1624 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 41).ult (rankAtom ranks 37)))) = true)
    (h1625 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 39).ult (rankAtom ranks 38)))) = true)
    (h1626 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 40).ult (rankAtom ranks 38)))) = true)
    (h1627 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 41).ult (rankAtom ranks 38)))) = true)
    (h1628 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 40).ult (rankAtom ranks 39)))) = true)
    (h1629 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 41).ult (rankAtom ranks 39)))) = true)
    (h1630 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 41).ult (rankAtom ranks 40)))) = true)
    (h1631 : ((!((rankAtom ranks 35 == rankAtom ranks 57)) || ((rankAtom ranks 34).ult (rankAtom ranks 51)))) = true)
    (h1632 : ((!((rankAtom ranks 51 == rankAtom ranks 34)) || ((rankAtom ranks 57).ult (rankAtom ranks 35)))) = true)
    (h1633 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 36).ult (rankAtom ranks 51)))) = true)
    (h1634 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 36).ult (rankAtom ranks 35)))) = true)
    (h1635 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h1636 : ((!((rankAtom ranks 35 == rankAtom ranks 58)) || ((rankAtom ranks 34).ult (rankAtom ranks 52)))) = true)
    (h1637 : ((!((rankAtom ranks 52 == rankAtom ranks 34)) || ((rankAtom ranks 58).ult (rankAtom ranks 35)))) = true)
    (h1638 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h1639 : ((!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h1640 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 37).ult (rankAtom ranks 52)))) = true)
    (h1641 : ((!((rankAtom ranks 52 == rankAtom ranks 37)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h1642 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 37).ult (rankAtom ranks 35)))) = true)
    (h1643 : ((!((rankAtom ranks 35 == rankAtom ranks 59)) || ((rankAtom ranks 34).ult (rankAtom ranks 53)))) = true)
    (h1644 : ((!((rankAtom ranks 53 == rankAtom ranks 34)) || ((rankAtom ranks 59).ult (rankAtom ranks 35)))) = true)
    (h1645 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 38).ult (rankAtom ranks 53)))) = true)
    (h1646 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 38).ult (rankAtom ranks 35)))) = true)
    (h1647 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h1648 : ((!((rankAtom ranks 35 == rankAtom ranks 60)) || ((rankAtom ranks 34).ult (rankAtom ranks 54)))) = true)
    (h1649 : ((!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 60).ult (rankAtom ranks 35)))) = true)
    (h1650 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 39).ult (rankAtom ranks 54)))) = true)
    (h1651 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 39).ult (rankAtom ranks 35)))) = true)
    (h1652 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h1653 : ((!((rankAtom ranks 35 == rankAtom ranks 61)) || ((rankAtom ranks 34).ult (rankAtom ranks 55)))) = true)
    (h1654 : ((!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 61).ult (rankAtom ranks 35)))) = true)
    (h1655 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 40).ult (rankAtom ranks 55)))) = true)
    (h1656 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 40).ult (rankAtom ranks 35)))) = true)
    (h1657 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h1658 : ((!((rankAtom ranks 35 == rankAtom ranks 62)) || ((rankAtom ranks 34).ult (rankAtom ranks 56)))) = true)
    (h1659 : ((!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 62).ult (rankAtom ranks 35)))) = true)
    (h1660 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h1661 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 41).ult (rankAtom ranks 35)))) = true)
    (h1662 : ((!((rankAtom ranks 52 == rankAtom ranks 34)) || ((rankAtom ranks 63).ult (rankAtom ranks 36)))) = true)
    (h1663 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true) :
    ∀ item ∈ directChunk025Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk025Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1600
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1601
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1602
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1603
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1604
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1605
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1606
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1607
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1608
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1609
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1610
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1611
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1612
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1613
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1614
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1615
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1616
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1617
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1618
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1619
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1620
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1621
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1622
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1623
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1624
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1625
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1626
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1627
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1628
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1629
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1630
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1631
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1632
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1633
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1634
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1635
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1636
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1637
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1638
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1639
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1640
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1641
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1642
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1643
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1644
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1645
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1646
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1647
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1648
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1649
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1650
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1651
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1652
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1653
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1654
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1655
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1656
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1657
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1658
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1659
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1660
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1661
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1662
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1663

theorem directChunk026_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1664 : ((!((rankAtom ranks 52 == rankAtom ranks 37)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h1665 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 37).ult (rankAtom ranks 36)))) = true)
    (h1666 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 38).ult (rankAtom ranks 36)))) = true)
    (h1667 : ((!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 65).ult (rankAtom ranks 36)))) = true)
    (h1668 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 39).ult (rankAtom ranks 36)))) = true)
    (h1669 : ((!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 66).ult (rankAtom ranks 36)))) = true)
    (h1670 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 40).ult (rankAtom ranks 36)))) = true)
    (h1671 : ((!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 67).ult (rankAtom ranks 36)))) = true)
    (h1672 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 41).ult (rankAtom ranks 36)))) = true)
    (h1673 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 34).ult (rankAtom ranks 53)))) = true)
    (h1674 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 38).ult (rankAtom ranks 53)))) = true)
    (h1675 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 38).ult (rankAtom ranks 37)))) = true)
    (h1676 : ((!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 34).ult (rankAtom ranks 54)))) = true)
    (h1677 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 39).ult (rankAtom ranks 54)))) = true)
    (h1678 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 39).ult (rankAtom ranks 37)))) = true)
    (h1679 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 34).ult (rankAtom ranks 55)))) = true)
    (h1680 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 40).ult (rankAtom ranks 55)))) = true)
    (h1681 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 40).ult (rankAtom ranks 37)))) = true)
    (h1682 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 34).ult (rankAtom ranks 56)))) = true)
    (h1683 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h1684 : ((!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 41).ult (rankAtom ranks 37)))) = true)
    (h1685 : ((!((rankAtom ranks 58 == rankAtom ranks 35)) || ((rankAtom ranks 63).ult (rankAtom ranks 36)))) = true)
    (h1686 : ((!((rankAtom ranks 58 == rankAtom ranks 37)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h1687 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 37).ult (rankAtom ranks 36)))) = true)
    (h1688 : ((!((rankAtom ranks 59 == rankAtom ranks 35)) || ((rankAtom ranks 64).ult (rankAtom ranks 36)))) = true)
    (h1689 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 38).ult (rankAtom ranks 36)))) = true)
    (h1690 : ((!((rankAtom ranks 60 == rankAtom ranks 35)) || ((rankAtom ranks 65).ult (rankAtom ranks 36)))) = true)
    (h1691 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 39).ult (rankAtom ranks 36)))) = true)
    (h1692 : ((!((rankAtom ranks 61 == rankAtom ranks 35)) || ((rankAtom ranks 66).ult (rankAtom ranks 36)))) = true)
    (h1693 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 40).ult (rankAtom ranks 36)))) = true)
    (h1694 : ((!((rankAtom ranks 62 == rankAtom ranks 35)) || ((rankAtom ranks 67).ult (rankAtom ranks 36)))) = true)
    (h1695 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 41).ult (rankAtom ranks 36)))) = true)
    (h1696 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 35).ult (rankAtom ranks 59)))) = true)
    (h1697 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 38).ult (rankAtom ranks 59)))) = true)
    (h1698 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 38).ult (rankAtom ranks 37)))) = true)
    (h1699 : ((!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 35).ult (rankAtom ranks 60)))) = true)
    (h1700 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 39).ult (rankAtom ranks 60)))) = true)
    (h1701 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 39).ult (rankAtom ranks 37)))) = true)
    (h1702 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 35).ult (rankAtom ranks 61)))) = true)
    (h1703 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 40).ult (rankAtom ranks 61)))) = true)
    (h1704 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 40).ult (rankAtom ranks 37)))) = true)
    (h1705 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 35).ult (rankAtom ranks 62)))) = true)
    (h1706 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 41).ult (rankAtom ranks 62)))) = true)
    (h1707 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 41).ult (rankAtom ranks 37)))) = true)
    (h1708 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 36).ult (rankAtom ranks 64)))) = true)
    (h1709 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 38).ult (rankAtom ranks 64)))) = true)
    (h1710 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 39).ult (rankAtom ranks 65)))) = true)
    (h1711 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 36).ult (rankAtom ranks 66)))) = true)
    (h1712 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 40).ult (rankAtom ranks 66)))) = true)
    (h1713 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 36).ult (rankAtom ranks 67)))) = true)
    (h1714 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 41).ult (rankAtom ranks 67)))) = true)
    (h1715 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h1716 : ((!((rankAtom ranks 43 == rankAtom ranks 57)) || ((rankAtom ranks 42).ult (rankAtom ranks 51)))) = true)
    (h1717 : ((!((rankAtom ranks 51 == rankAtom ranks 42)) || ((rankAtom ranks 57).ult (rankAtom ranks 43)))) = true)
    (h1718 : ((!((rankAtom ranks 43 == rankAtom ranks 44)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h1719 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 44).ult (rankAtom ranks 51)))) = true)
    (h1720 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 44).ult (rankAtom ranks 43)))) = true)
    (h1721 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h1722 : ((!((rankAtom ranks 43 == rankAtom ranks 58)) || ((rankAtom ranks 42).ult (rankAtom ranks 52)))) = true)
    (h1723 : ((!((rankAtom ranks 52 == rankAtom ranks 42)) || ((rankAtom ranks 58).ult (rankAtom ranks 43)))) = true)
    (h1724 : ((!((rankAtom ranks 43 == rankAtom ranks 45)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h1725 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 45).ult (rankAtom ranks 52)))) = true)
    (h1726 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 45).ult (rankAtom ranks 43)))) = true)
    (h1727 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true) :
    ∀ item ∈ directChunk026Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk026Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1664
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1665
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1666
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1667
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1668
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1669
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1670
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1671
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1672
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1673
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1674
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1675
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1676
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1677
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1678
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1679
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1680
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1681
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1682
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1683
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1684
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1685
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1686
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1687
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1688
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1689
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1690
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1691
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1692
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1693
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1694
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1695
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1696
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1697
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1698
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1699
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1700
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1701
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1702
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1703
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1704
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1705
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1706
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1707
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1708
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1709
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1710
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1711
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1712
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1713
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1714
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1715
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1716
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1717
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1718
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1719
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1720
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1721
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1722
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1723
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1724
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1725
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1726
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1727

theorem directChunk027_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1728 : ((!((rankAtom ranks 43 == rankAtom ranks 59)) || ((rankAtom ranks 42).ult (rankAtom ranks 53)))) = true)
    (h1729 : ((!((rankAtom ranks 53 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 43)))) = true)
    (h1730 : ((!((rankAtom ranks 43 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h1731 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 53)))) = true)
    (h1732 : ((!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h1733 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 43)))) = true)
    (h1734 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h1735 : ((!((rankAtom ranks 43 == rankAtom ranks 60)) || ((rankAtom ranks 42).ult (rankAtom ranks 54)))) = true)
    (h1736 : ((!((rankAtom ranks 54 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 43)))) = true)
    (h1737 : ((!((rankAtom ranks 43 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h1738 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 54)))) = true)
    (h1739 : ((!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h1740 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 43)))) = true)
    (h1741 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h1742 : ((!((rankAtom ranks 43 == rankAtom ranks 61)) || ((rankAtom ranks 42).ult (rankAtom ranks 55)))) = true)
    (h1743 : ((!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 43)))) = true)
    (h1744 : ((!((rankAtom ranks 43 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h1745 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 55)))) = true)
    (h1746 : ((!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h1747 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 43)))) = true)
    (h1748 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h1749 : ((!((rankAtom ranks 43 == rankAtom ranks 62)) || ((rankAtom ranks 42).ult (rankAtom ranks 56)))) = true)
    (h1750 : ((!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 43)))) = true)
    (h1751 : ((!((rankAtom ranks 43 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 56)))) = true)
    (h1752 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h1753 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h1754 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 43)))) = true)
    (h1755 : ((!((rankAtom ranks 44 == rankAtom ranks 45)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h1756 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 45).ult (rankAtom ranks 44)))) = true)
    (h1757 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h1758 : ((!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h1759 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 46).ult (rankAtom ranks 44)))) = true)
    (h1760 : ((!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h1761 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 47).ult (rankAtom ranks 44)))) = true)
    (h1762 : ((!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h1763 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 48).ult (rankAtom ranks 44)))) = true)
    (h1764 : ((!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h1765 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h1766 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 49).ult (rankAtom ranks 44)))) = true)
    (h1767 : ((!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h1768 : ((!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h1769 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 46).ult (rankAtom ranks 45)))) = true)
    (h1770 : ((!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h1771 : ((!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h1772 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 47).ult (rankAtom ranks 45)))) = true)
    (h1773 : ((!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 55)))) = true)
    (h1774 : ((!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h1775 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 48).ult (rankAtom ranks 45)))) = true)
    (h1776 : ((!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 56)))) = true)
    (h1777 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h1778 : ((!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 49).ult (rankAtom ranks 45)))) = true)
    (h1779 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 53).ult (rankAtom ranks 54)))) = true)
    (h1780 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 53).ult (rankAtom ranks 55)))) = true)
    (h1781 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 56)))) = true)
    (h1782 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h1783 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h1784 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 54).ult (rankAtom ranks 55)))) = true)
    (h1785 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 54).ult (rankAtom ranks 56)))) = true)
    (h1786 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h1787 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 55).ult (rankAtom ranks 56)))) = true)
    (h1788 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h1789 : ((!((rankAtom ranks 58 == rankAtom ranks 43)) || ((rankAtom ranks 63).ult (rankAtom ranks 44)))) = true)
    (h1790 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 45).ult (rankAtom ranks 44)))) = true)
    (h1791 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true) :
    ∀ item ∈ directChunk027Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk027Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1728
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1729
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1730
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1731
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1732
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1733
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1734
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1735
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1736
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1737
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1738
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1739
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1740
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1741
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1742
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1743
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1744
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1745
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1746
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1747
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1748
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1749
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1750
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1751
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1752
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1753
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1754
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1755
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1756
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1757
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1758
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1759
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1760
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1761
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1762
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1763
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1764
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1765
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1766
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1767
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1768
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1769
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1770
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1771
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1772
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1773
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1774
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1775
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1776
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1777
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1778
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1779
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1780
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1781
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1782
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1783
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1784
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1785
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1786
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1787
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1788
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1789
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1790
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1791

theorem directChunk028_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1792 : ((!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h1793 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 46).ult (rankAtom ranks 44)))) = true)
    (h1794 : ((!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h1795 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 47).ult (rankAtom ranks 44)))) = true)
    (h1796 : ((!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h1797 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 48).ult (rankAtom ranks 44)))) = true)
    (h1798 : ((!((rankAtom ranks 62 == rankAtom ranks 43)) || ((rankAtom ranks 67).ult (rankAtom ranks 44)))) = true)
    (h1799 : ((!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h1800 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 49).ult (rankAtom ranks 44)))) = true)
    (h1801 : ((!((rankAtom ranks 45 == rankAtom ranks 68)) || ((rankAtom ranks 43).ult (rankAtom ranks 59)))) = true)
    (h1802 : ((!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h1803 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 46).ult (rankAtom ranks 45)))) = true)
    (h1804 : ((!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h1805 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 47).ult (rankAtom ranks 45)))) = true)
    (h1806 : ((!((rankAtom ranks 45 == rankAtom ranks 70)) || ((rankAtom ranks 43).ult (rankAtom ranks 61)))) = true)
    (h1807 : ((!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 58).ult (rankAtom ranks 61)))) = true)
    (h1808 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 48).ult (rankAtom ranks 45)))) = true)
    (h1809 : ((!((rankAtom ranks 45 == rankAtom ranks 71)) || ((rankAtom ranks 43).ult (rankAtom ranks 62)))) = true)
    (h1810 : ((!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 58).ult (rankAtom ranks 62)))) = true)
    (h1811 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 49).ult (rankAtom ranks 45)))) = true)
    (h1812 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 59).ult (rankAtom ranks 60)))) = true)
    (h1813 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 59).ult (rankAtom ranks 61)))) = true)
    (h1814 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 59).ult (rankAtom ranks 62)))) = true)
    (h1815 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h1816 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 60).ult (rankAtom ranks 61)))) = true)
    (h1817 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 60).ult (rankAtom ranks 62)))) = true)
    (h1818 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h1819 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 61).ult (rankAtom ranks 62)))) = true)
    (h1820 : ((!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h1821 : ((!((rankAtom ranks 45 == rankAtom ranks 68)) || ((rankAtom ranks 44).ult (rankAtom ranks 64)))) = true)
    (h1822 : ((!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h1823 : ((!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h1824 : ((!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h1825 : ((!((rankAtom ranks 45 == rankAtom ranks 71)) || ((rankAtom ranks 44).ult (rankAtom ranks 67)))) = true)
    (h1826 : ((!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h1827 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 64).ult (rankAtom ranks 65)))) = true)
    (h1828 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 64).ult (rankAtom ranks 66)))) = true)
    (h1829 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 64).ult (rankAtom ranks 67)))) = true)
    (h1830 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 65).ult (rankAtom ranks 66)))) = true)
    (h1831 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 65).ult (rankAtom ranks 67)))) = true)
    (h1832 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 66).ult (rankAtom ranks 67)))) = true)
    (h1833 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h1834 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 68).ult (rankAtom ranks 70)))) = true)
    (h1835 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 68).ult (rankAtom ranks 71)))) = true)
    (h1836 : ((!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 49).ult (rankAtom ranks 71)))) = true)
    (h1837 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h1838 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h1839 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true)
    (h1840 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h1841 : ((!((rankAtom ranks 58 == rankAtom ranks 50)) || ((rankAtom ranks 63).ult (rankAtom ranks 51)))) = true)
    (h1842 : ((!((rankAtom ranks 51 == rankAtom ranks 52)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h1843 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 52).ult (rankAtom ranks 58)))) = true)
    (h1844 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 52).ult (rankAtom ranks 51)))) = true)
    (h1845 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h1846 : ((!((rankAtom ranks 59 == rankAtom ranks 50)) || ((rankAtom ranks 64).ult (rankAtom ranks 51)))) = true)
    (h1847 : ((!((rankAtom ranks 51 == rankAtom ranks 53)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h1848 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 53).ult (rankAtom ranks 59)))) = true)
    (h1849 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 53).ult (rankAtom ranks 51)))) = true)
    (h1850 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h1851 : ((!((rankAtom ranks 60 == rankAtom ranks 50)) || ((rankAtom ranks 65).ult (rankAtom ranks 51)))) = true)
    (h1852 : ((!((rankAtom ranks 51 == rankAtom ranks 54)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h1853 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 54).ult (rankAtom ranks 60)))) = true)
    (h1854 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 54).ult (rankAtom ranks 51)))) = true)
    (h1855 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true) :
    ∀ item ∈ directChunk028Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk028Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1792
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1793
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1794
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1795
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1796
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1797
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1798
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1799
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1800
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1801
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1802
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1803
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1804
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1805
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1806
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1807
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1808
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1809
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1810
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1811
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1812
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1813
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1814
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1815
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1816
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1817
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1818
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1819
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1820
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1821
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1822
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1823
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1824
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1825
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1826
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1827
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1828
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1829
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1830
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1831
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1832
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1833
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1834
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1835
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1836
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1837
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1838
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1839
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1840
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1841
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1842
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1843
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1844
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1845
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1846
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1847
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1848
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1849
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1850
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1851
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1852
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1853
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1854
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1855

theorem directChunk029_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1856 : ((!((rankAtom ranks 61 == rankAtom ranks 50)) || ((rankAtom ranks 66).ult (rankAtom ranks 51)))) = true)
    (h1857 : ((!((rankAtom ranks 51 == rankAtom ranks 55)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h1858 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 55).ult (rankAtom ranks 51)))) = true)
    (h1859 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h1860 : ((!((rankAtom ranks 62 == rankAtom ranks 50)) || ((rankAtom ranks 67).ult (rankAtom ranks 51)))) = true)
    (h1861 : ((!((rankAtom ranks 51 == rankAtom ranks 56)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h1862 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 56).ult (rankAtom ranks 62)))) = true)
    (h1863 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 56).ult (rankAtom ranks 51)))) = true)
    (h1864 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h1865 : ((!((rankAtom ranks 52 == rankAtom ranks 53)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h1866 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 53).ult (rankAtom ranks 59)))) = true)
    (h1867 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 53).ult (rankAtom ranks 52)))) = true)
    (h1868 : ((!((rankAtom ranks 52 == rankAtom ranks 54)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h1869 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 54).ult (rankAtom ranks 52)))) = true)
    (h1870 : ((!((rankAtom ranks 61 == rankAtom ranks 50)) || ((rankAtom ranks 70).ult (rankAtom ranks 52)))) = true)
    (h1871 : ((!((rankAtom ranks 52 == rankAtom ranks 55)) || ((rankAtom ranks 58).ult (rankAtom ranks 61)))) = true)
    (h1872 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 55).ult (rankAtom ranks 52)))) = true)
    (h1873 : ((!((rankAtom ranks 52 == rankAtom ranks 56)) || ((rankAtom ranks 58).ult (rankAtom ranks 62)))) = true)
    (h1874 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 56).ult (rankAtom ranks 62)))) = true)
    (h1875 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 56).ult (rankAtom ranks 52)))) = true)
    (h1876 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h1877 : ((!((rankAtom ranks 52 == rankAtom ranks 68)) || ((rankAtom ranks 51).ult (rankAtom ranks 64)))) = true)
    (h1878 : ((!((rankAtom ranks 52 == rankAtom ranks 53)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h1879 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 53).ult (rankAtom ranks 64)))) = true)
    (h1880 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h1881 : ((!((rankAtom ranks 52 == rankAtom ranks 69)) || ((rankAtom ranks 51).ult (rankAtom ranks 65)))) = true)
    (h1882 : ((!((rankAtom ranks 52 == rankAtom ranks 54)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h1883 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h1884 : ((!((rankAtom ranks 52 == rankAtom ranks 70)) || ((rankAtom ranks 51).ult (rankAtom ranks 66)))) = true)
    (h1885 : ((!((rankAtom ranks 52 == rankAtom ranks 55)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h1886 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h1887 : ((!((rankAtom ranks 52 == rankAtom ranks 71)) || ((rankAtom ranks 51).ult (rankAtom ranks 67)))) = true)
    (h1888 : ((!((rankAtom ranks 52 == rankAtom ranks 56)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h1889 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 56).ult (rankAtom ranks 67)))) = true)
    (h1890 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h1891 : ((!((rankAtom ranks 58 == rankAtom ranks 59)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h1892 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h1893 : ((!((rankAtom ranks 58 == rankAtom ranks 60)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h1894 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h1895 : ((!((rankAtom ranks 58 == rankAtom ranks 61)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h1896 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h1897 : ((!((rankAtom ranks 58 == rankAtom ranks 62)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h1898 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 65).ult (rankAtom ranks 69)))) = true) :
    ∀ item ∈ directChunk029Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk029Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1856
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1857
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1858
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1859
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1860
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1861
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1862
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1863
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1864
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1865
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1866
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1867
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1868
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1869
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1870
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1871
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1872
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1873
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1874
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1875
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1876
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1877
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1878
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1879
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1880
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1881
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1882
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1883
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1884
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1885
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1886
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1887
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1888
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1889
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1890
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1891
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1892
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1893
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1894
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1895
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1896
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1897
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc] using h1898



/-- Thirty itemwise chunk facts are the complete non-certificate endpoint. -/
theorem false_of_directChunks_each (source : BVExpr.Assignment)
    (c000 : ∀ item ∈ directChunk000Assertions,
      item.eval source = true)
    (c001 : ∀ item ∈ directChunk001Assertions,
      item.eval source = true)
    (c002 : ∀ item ∈ directChunk002Assertions,
      item.eval source = true)
    (c003 : ∀ item ∈ directChunk003Assertions,
      item.eval source = true)
    (c004 : ∀ item ∈ directChunk004Assertions,
      item.eval source = true)
    (c005 : ∀ item ∈ directChunk005Assertions,
      item.eval source = true)
    (c006 : ∀ item ∈ directChunk006Assertions,
      item.eval source = true)
    (c007 : ∀ item ∈ directChunk007Assertions,
      item.eval source = true)
    (c008 : ∀ item ∈ directChunk008Assertions,
      item.eval source = true)
    (c009 : ∀ item ∈ directChunk009Assertions,
      item.eval source = true)
    (c010 : ∀ item ∈ directChunk010Assertions,
      item.eval source = true)
    (c011 : ∀ item ∈ directChunk011Assertions,
      item.eval source = true)
    (c012 : ∀ item ∈ directChunk012Assertions,
      item.eval source = true)
    (c013 : ∀ item ∈ directChunk013Assertions,
      item.eval source = true)
    (c014 : ∀ item ∈ directChunk014Assertions,
      item.eval source = true)
    (c015 : ∀ item ∈ directChunk015Assertions,
      item.eval source = true)
    (c016 : ∀ item ∈ directChunk016Assertions,
      item.eval source = true)
    (c017 : ∀ item ∈ directChunk017Assertions,
      item.eval source = true)
    (c018 : ∀ item ∈ directChunk018Assertions,
      item.eval source = true)
    (c019 : ∀ item ∈ directChunk019Assertions,
      item.eval source = true)
    (c020 : ∀ item ∈ directChunk020Assertions,
      item.eval source = true)
    (c021 : ∀ item ∈ directChunk021Assertions,
      item.eval source = true)
    (c022 : ∀ item ∈ directChunk022Assertions,
      item.eval source = true)
    (c023 : ∀ item ∈ directChunk023Assertions,
      item.eval source = true)
    (c024 : ∀ item ∈ directChunk024Assertions,
      item.eval source = true)
    (c025 : ∀ item ∈ directChunk025Assertions,
      item.eval source = true)
    (c026 : ∀ item ∈ directChunk026Assertions,
      item.eval source = true)
    (c027 : ∀ item ∈ directChunk027Assertions,
      item.eval source = true)
    (c028 : ∀ item ∈ directChunk028Assertions,
      item.eval source = true)
    (c029 : ∀ item ∈ directChunk029Assertions,
      item.eval source = true) : False := by
  have hs000 := directChunk000_sat_of_each source c000
  have hs001 := directChunk001_sat_of_each source c001
  have hs002 := directChunk002_sat_of_each source c002
  have hs003 := directChunk003_sat_of_each source c003
  have hs004 := directChunk004_sat_of_each source c004
  have hs005 := directChunk005_sat_of_each source c005
  have hs006 := directChunk006_sat_of_each source c006
  have hs007 := directChunk007_sat_of_each source c007
  have hs008 := directChunk008_sat_of_each source c008
  have hs009 := directChunk009_sat_of_each source c009
  have hs010 := directChunk010_sat_of_each source c010
  have hs011 := directChunk011_sat_of_each source c011
  have hs012 := directChunk012_sat_of_each source c012
  have hs013 := directChunk013_sat_of_each source c013
  have hs014 := directChunk014_sat_of_each source c014
  have hs015 := directChunk015_sat_of_each source c015
  have hs016 := directChunk016_sat_of_each source c016
  have hs017 := directChunk017_sat_of_each source c017
  have hs018 := directChunk018_sat_of_each source c018
  have hs019 := directChunk019_sat_of_each source c019
  have hs020 := directChunk020_sat_of_each source c020
  have hs021 := directChunk021_sat_of_each source c021
  have hs022 := directChunk022_sat_of_each source c022
  have hs023 := directChunk023_sat_of_each source c023
  have hs024 := directChunk024_sat_of_each source c024
  have hs025 := directChunk025_sat_of_each source c025
  have hs026 := directChunk026_sat_of_each source c026
  have hs027 := directChunk027_sat_of_each source c027
  have hs028 := directChunk028_sat_of_each source c028
  have hs029 := directChunk029_sat_of_each source c029
  have hs := directExpr_sat_of_chunks source hs000 hs001 hs002 hs003 hs004 hs005 hs006 hs007 hs008 hs009 hs010 hs011 hs012 hs013 hs014 hs015 hs016 hs017 hs018 hs019 hs020 hs021 hs022 hs023 hs024 hs025 hs026 hs027 hs028 hs029
  have hu := directExpr_unsat source
  exact Bool.noConfusion (hu.symm.trans hs)

/-- The exact 1,899 packed source assertions contradict the verified LRAT endpoint. -/
theorem false_of_directSource_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0000 : (!(rowBit rows 0 0 0)) = true)
    (h0001 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 1 then 1#4 else 0#4) + (bif rowBit rows 0 0 2 then 1#4 else 0#4) + (bif rowBit rows 0 0 3 then 1#4 else 0#4) + (bif rowBit rows 0 0 4 then 1#4 else 0#4) + (bif rowBit rows 0 0 5 then 1#4 else 0#4) + (bif rowBit rows 0 0 6 then 1#4 else 0#4) + (bif rowBit rows 0 0 7 then 1#4 else 0#4) + (bif rowBit rows 0 0 8 then 1#4 else 0#4) + (bif rowBit rows 0 0 9 then 1#4 else 0#4) + (bif rowBit rows 0 0 10 then 1#4 else 0#4) + (bif rowBit rows 0 0 11 then 1#4 else 0#4) + (bif rowBit rows 0 0 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0002 : (!(rowBit rows 0 2 2)) = true)
    (h0003 : ((((bif rowBit rows 0 2 0 then 1#4 else 0#4) + (bif rowBit rows 0 2 1 then 1#4 else 0#4) + (bif rowBit rows 0 2 2 then 1#4 else 0#4) + (bif rowBit rows 0 2 3 then 1#4 else 0#4) + (bif rowBit rows 0 2 4 then 1#4 else 0#4) + (bif rowBit rows 0 2 5 then 1#4 else 0#4) + (bif rowBit rows 0 2 6 then 1#4 else 0#4) + (bif rowBit rows 0 2 7 then 1#4 else 0#4) + (bif rowBit rows 0 2 8 then 1#4 else 0#4) + (bif rowBit rows 0 2 9 then 1#4 else 0#4) + (bif rowBit rows 0 2 10 then 1#4 else 0#4) + (bif rowBit rows 0 2 11 then 1#4 else 0#4) + (bif rowBit rows 0 2 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0004 : (!(rowBit rows 0 4 4)) = true)
    (h0005 : ((((bif rowBit rows 0 4 0 then 1#4 else 0#4) + (bif rowBit rows 0 4 1 then 1#4 else 0#4) + (bif rowBit rows 0 4 2 then 1#4 else 0#4) + (bif rowBit rows 0 4 3 then 1#4 else 0#4) + (bif rowBit rows 0 4 4 then 1#4 else 0#4) + (bif rowBit rows 0 4 5 then 1#4 else 0#4) + (bif rowBit rows 0 4 6 then 1#4 else 0#4) + (bif rowBit rows 0 4 7 then 1#4 else 0#4) + (bif rowBit rows 0 4 8 then 1#4 else 0#4) + (bif rowBit rows 0 4 9 then 1#4 else 0#4) + (bif rowBit rows 0 4 10 then 1#4 else 0#4) + (bif rowBit rows 0 4 11 then 1#4 else 0#4) + (bif rowBit rows 0 4 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0006 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 0 2 3 && rowBit rows 0 2 5))) = true)
    (h0007 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 2 3 && rowBit rows 0 2 6))) = true)
    (h0008 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 0 2 3 && rowBit rows 0 2 7))) = true)
    (h0009 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 8 && rowBit rows 0 2 3 && rowBit rows 0 2 8))) = true)
    (h0010 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 2 5 && rowBit rows 0 2 6))) = true)
    (h0011 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 0 2 5 && rowBit rows 0 2 7))) = true)
    (h0012 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 8 && rowBit rows 0 2 5 && rowBit rows 0 2 8))) = true)
    (h0013 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 9 && rowBit rows 0 2 5 && rowBit rows 0 2 9))) = true)
    (h0014 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 10 && rowBit rows 0 2 5 && rowBit rows 0 2 10))) = true)
    (h0015 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 12 && rowBit rows 0 2 5 && rowBit rows 0 2 12))) = true)
    (h0016 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 2 6 && rowBit rows 0 2 7))) = true)
    (h0017 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 2 6 && rowBit rows 0 2 8))) = true)
    (h0018 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 2 6 && rowBit rows 0 2 9))) = true)
    (h0019 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 2 6 && rowBit rows 0 2 10))) = true)
    (h0020 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 2 6 && rowBit rows 0 2 11))) = true)
    (h0021 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 0 2 6 && rowBit rows 0 2 12))) = true)
    (h0022 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 2 7 && rowBit rows 0 2 8))) = true)
    (h0023 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 2 7 && rowBit rows 0 2 9))) = true)
    (h0024 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 2 7 && rowBit rows 0 2 10))) = true)
    (h0025 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 2 7 && rowBit rows 0 2 11))) = true)
    (h0026 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 2 7 && rowBit rows 0 2 12))) = true)
    (h0027 : ((((bif rowBit rows 0 4 4 then 1#4 else 0#4) + (bif rowBit rows 0 4 5 then 1#4 else 0#4) + (bif rowBit rows 0 4 6 then 1#4 else 0#4) + (bif rowBit rows 0 4 7 then 1#4 else 0#4) + (bif rowBit rows 0 4 8 then 1#4 else 0#4))).ule 1#4) = true)
    (h0028 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 8 then 1#4 else 0#4) + (bif rowBit rows 0 0 9 then 1#4 else 0#4) + (bif rowBit rows 0 0 10 then 1#4 else 0#4) + (bif rowBit rows 0 0 11 then 1#4 else 0#4) + (bif rowBit rows 0 0 12 then 1#4 else 0#4))).ule 1#4) = true)
    (h0029 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 1 then 1#4 else 0#4) + (bif rowBit rows 0 0 2 then 1#4 else 0#4) + (bif rowBit rows 0 0 3 then 1#4 else 0#4) + (bif rowBit rows 0 0 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h0030 : ((((bif rowBit rows 0 4 0 then 1#4 else 0#4) + (bif rowBit rows 0 4 1 then 1#4 else 0#4) + (bif rowBit rows 0 4 2 then 1#4 else 0#4) + (bif rowBit rows 0 4 3 then 1#4 else 0#4) + (bif rowBit rows 0 4 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h0031 : (!(rowBit rows 1 2 2)) = true)
    (h0032 : ((((bif rowBit rows 1 2 0 then 1#4 else 0#4) + (bif rowBit rows 1 2 1 then 1#4 else 0#4) + (bif rowBit rows 1 2 2 then 1#4 else 0#4) + (bif rowBit rows 1 2 3 then 1#4 else 0#4) + (bif rowBit rows 1 2 4 then 1#4 else 0#4) + (bif rowBit rows 1 2 5 then 1#4 else 0#4) + (bif rowBit rows 1 2 6 then 1#4 else 0#4) + (bif rowBit rows 1 2 7 then 1#4 else 0#4) + (bif rowBit rows 1 2 8 then 1#4 else 0#4) + (bif rowBit rows 1 2 9 then 1#4 else 0#4) + (bif rowBit rows 1 2 10 then 1#4 else 0#4) + (bif rowBit rows 1 2 11 then 1#4 else 0#4) + (bif rowBit rows 1 2 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0033 : (!(rowBit rows 1 6 6)) = true)
    (h0034 : ((((bif rowBit rows 1 6 0 then 1#4 else 0#4) + (bif rowBit rows 1 6 1 then 1#4 else 0#4) + (bif rowBit rows 1 6 2 then 1#4 else 0#4) + (bif rowBit rows 1 6 3 then 1#4 else 0#4) + (bif rowBit rows 1 6 4 then 1#4 else 0#4) + (bif rowBit rows 1 6 5 then 1#4 else 0#4) + (bif rowBit rows 1 6 6 then 1#4 else 0#4) + (bif rowBit rows 1 6 7 then 1#4 else 0#4) + (bif rowBit rows 1 6 8 then 1#4 else 0#4) + (bif rowBit rows 1 6 9 then 1#4 else 0#4) + (bif rowBit rows 1 6 10 then 1#4 else 0#4) + (bif rowBit rows 1 6 11 then 1#4 else 0#4) + (bif rowBit rows 1 6 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0035 : (!((rowBit rows 1 2 1 && rowBit rows 1 2 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7))) = true)
    (h0036 : ((((bif rowBit rows 1 6 4 then 1#4 else 0#4) + (bif rowBit rows 1 6 5 then 1#4 else 0#4) + (bif rowBit rows 1 6 6 then 1#4 else 0#4) + (bif rowBit rows 1 6 7 then 1#4 else 0#4) + (bif rowBit rows 1 6 8 then 1#4 else 0#4))).ule 2#4) = true)
    (h0037 : (!(rowBit rows 2 5 5)) = true)
    (h0038 : ((((bif rowBit rows 2 5 0 then 1#4 else 0#4) + (bif rowBit rows 2 5 1 then 1#4 else 0#4) + (bif rowBit rows 2 5 2 then 1#4 else 0#4) + (bif rowBit rows 2 5 3 then 1#4 else 0#4) + (bif rowBit rows 2 5 4 then 1#4 else 0#4) + (bif rowBit rows 2 5 5 then 1#4 else 0#4) + (bif rowBit rows 2 5 6 then 1#4 else 0#4) + (bif rowBit rows 2 5 7 then 1#4 else 0#4) + (bif rowBit rows 2 5 8 then 1#4 else 0#4) + (bif rowBit rows 2 5 9 then 1#4 else 0#4) + (bif rowBit rows 2 5 10 then 1#4 else 0#4) + (bif rowBit rows 2 5 11 then 1#4 else 0#4) + (bif rowBit rows 2 5 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0039 : ((((bif rowBit rows 2 5 4 then 1#4 else 0#4) + (bif rowBit rows 2 5 5 then 1#4 else 0#4) + (bif rowBit rows 2 5 6 then 1#4 else 0#4) + (bif rowBit rows 2 5 7 then 1#4 else 0#4) + (bif rowBit rows 2 5 8 then 1#4 else 0#4))).ule 2#4) = true)
    (h0040 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 5 && rowBit rows 1 6 1 && rowBit rows 1 6 5))) = true)
    (h0041 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 5 && rowBit rows 1 6 2 && rowBit rows 1 6 5))) = true)
    (h0042 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 1 6 3 && rowBit rows 1 6 5))) = true)
    (h0043 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 1 6 4 && rowBit rows 1 6 5))) = true)
    (h0044 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8))) = true)
    (h0045 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 1 6 7 && rowBit rows 1 6 9))) = true)
    (h0046 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10))) = true)
    (h0047 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11))) = true)
    (h0048 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12))) = true)
    (h0049 : ((((bif (rowBit rows 0 2 0 && rowBit rows 1 6 0) then 1#4 else 0#4) + (bif (rowBit rows 0 2 1 && rowBit rows 1 6 1) then 1#4 else 0#4) + (bif (rowBit rows 0 2 2 && rowBit rows 1 6 2) then 1#4 else 0#4) + (bif (rowBit rows 0 2 3 && rowBit rows 1 6 3) then 1#4 else 0#4) + (bif (rowBit rows 0 2 4 && rowBit rows 1 6 4) then 1#4 else 0#4) + (bif (rowBit rows 0 2 5 && rowBit rows 1 6 5) then 1#4 else 0#4) + (bif (rowBit rows 0 2 6 && rowBit rows 1 6 6) then 1#4 else 0#4) + (bif (rowBit rows 0 2 7 && rowBit rows 1 6 7) then 1#4 else 0#4) + (bif (rowBit rows 0 2 8 && rowBit rows 1 6 8) then 1#4 else 0#4) + (bif (rowBit rows 0 2 9 && rowBit rows 1 6 9) then 1#4 else 0#4) + (bif (rowBit rows 0 2 10 && rowBit rows 1 6 10) then 1#4 else 0#4) + (bif (rowBit rows 0 2 11 && rowBit rows 1 6 11) then 1#4 else 0#4) + (bif (rowBit rows 0 2 12 && rowBit rows 1 6 12) then 1#4 else 0#4))).ule 2#4) = true)
    (h0050 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7))) = true)
    (h0051 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 1 6 1 && rowBit rows 1 6 8))) = true)
    (h0052 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 9 && rowBit rows 1 6 1 && rowBit rows 1 6 9))) = true)
    (h0053 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 1 6 1 && rowBit rows 1 6 10))) = true)
    (h0054 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 1 6 1 && rowBit rows 1 6 11))) = true)
    (h0055 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 1 6 1 && rowBit rows 1 6 12))) = true)
    (h0056 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 5 && rowBit rows 1 6 3 && rowBit rows 1 6 5))) = true)
    (h0057 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8))) = true)
    (h0058 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10))) = true)
    (h0059 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11))) = true)
    (h0060 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12))) = true)
    (h0061 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 1 6 8 && rowBit rows 1 6 9))) = true)
    (h0062 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 1 6 8 && rowBit rows 1 6 10))) = true)
    (h0063 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 1 6 8 && rowBit rows 1 6 11))) = true)
    (h0064 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12))) = true)
    (h0065 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 2 5 6 && rowBit rows 2 5 7))) = true)
    (h0066 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 2 5 6 && rowBit rows 2 5 8))) = true)
    (h0067 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 2 5 6 && rowBit rows 2 5 9))) = true)
    (h0068 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 2 5 6 && rowBit rows 2 5 10))) = true)
    (h0069 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 2 5 6 && rowBit rows 2 5 11))) = true)
    (h0070 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 2 5 6 && rowBit rows 2 5 12))) = true)
    (h0071 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 2 5 7 && rowBit rows 2 5 8))) = true)
    (h0072 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 2 5 7 && rowBit rows 2 5 9))) = true)
    (h0073 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 2 5 7 && rowBit rows 2 5 10))) = true)
    (h0074 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 2 5 7 && rowBit rows 2 5 11))) = true)
    (h0075 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 2 5 7 && rowBit rows 2 5 12))) = true)
    (h0076 : ((((bif (rowBit rows 0 2 0 && rowBit rows 2 5 0) then 1#4 else 0#4) + (bif (rowBit rows 0 2 1 && rowBit rows 2 5 1) then 1#4 else 0#4) + (bif (rowBit rows 0 2 2 && rowBit rows 2 5 2) then 1#4 else 0#4) + (bif (rowBit rows 0 2 3 && rowBit rows 2 5 3) then 1#4 else 0#4) + (bif (rowBit rows 0 2 4 && rowBit rows 2 5 4) then 1#4 else 0#4) + (bif (rowBit rows 0 2 5 && rowBit rows 2 5 5) then 1#4 else 0#4) + (bif (rowBit rows 0 2 6 && rowBit rows 2 5 6) then 1#4 else 0#4) + (bif (rowBit rows 0 2 7 && rowBit rows 2 5 7) then 1#4 else 0#4) + (bif (rowBit rows 0 2 8 && rowBit rows 2 5 8) then 1#4 else 0#4) + (bif (rowBit rows 0 2 9 && rowBit rows 2 5 9) then 1#4 else 0#4) + (bif (rowBit rows 0 2 10 && rowBit rows 2 5 10) then 1#4 else 0#4) + (bif (rowBit rows 0 2 11 && rowBit rows 2 5 11) then 1#4 else 0#4) + (bif (rowBit rows 0 2 12 && rowBit rows 2 5 12) then 1#4 else 0#4))).ule 2#4) = true)
    (h0077 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 6 && rowBit rows 2 5 1 && rowBit rows 2 5 6))) = true)
    (h0078 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 2 5 1 && rowBit rows 2 5 7))) = true)
    (h0079 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 2 5 1 && rowBit rows 2 5 8))) = true)
    (h0080 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 2 5 1 && rowBit rows 2 5 10))) = true)
    (h0081 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 2 5 1 && rowBit rows 2 5 11))) = true)
    (h0082 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 2 5 1 && rowBit rows 2 5 12))) = true)
    (h0083 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 7 && rowBit rows 2 5 6 && rowBit rows 2 5 7))) = true)
    (h0084 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 8 && rowBit rows 2 5 6 && rowBit rows 2 5 8))) = true)
    (h0085 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 9 && rowBit rows 2 5 6 && rowBit rows 2 5 9))) = true)
    (h0086 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 12 && rowBit rows 2 5 6 && rowBit rows 2 5 12))) = true)
    (h0087 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 2 5 7 && rowBit rows 2 5 8))) = true)
    (h0088 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 9 && rowBit rows 2 5 7 && rowBit rows 2 5 9))) = true)
    (h0089 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 2 5 7 && rowBit rows 2 5 10))) = true)
    (h0090 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 2 5 7 && rowBit rows 2 5 11))) = true)
    (h0091 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 2 5 7 && rowBit rows 2 5 12))) = true)
    (h0092 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 2 5 8 && rowBit rows 2 5 9))) = true)
    (h0093 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 2 5 8 && rowBit rows 2 5 10))) = true)
    (h0094 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 2 5 8 && rowBit rows 2 5 11))) = true)
    (h0095 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 2 5 8 && rowBit rows 2 5 12))) = true)
    (h0096 : (!((rowBit rows 2 5 0 && rowBit rows 2 5 4 && rowBit rows 1 6 0 && rowBit rows 1 6 4))) = true)
    (h0097 : (!((rowBit rows 2 5 0 && rowBit rows 2 5 7 && rowBit rows 1 6 0 && rowBit rows 1 6 7))) = true)
    (h0098 : (!((rowBit rows 2 5 0 && rowBit rows 2 5 8 && rowBit rows 1 6 0 && rowBit rows 1 6 8))) = true)
    (h0099 : (!((rowBit rows 2 5 1 && rowBit rows 2 5 4 && rowBit rows 1 6 1 && rowBit rows 1 6 4))) = true)
    (h0100 : (!((rowBit rows 2 5 1 && rowBit rows 2 5 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7))) = true)
    (h0101 : (!((rowBit rows 2 5 1 && rowBit rows 2 5 8 && rowBit rows 1 6 1 && rowBit rows 1 6 8))) = true)
    (h0102 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 4 && rowBit rows 1 6 2 && rowBit rows 1 6 4))) = true)
    (h0103 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 7 && rowBit rows 1 6 2 && rowBit rows 1 6 7))) = true)
    (h0104 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 8 && rowBit rows 1 6 2 && rowBit rows 1 6 8))) = true)
    (h0105 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 11 && rowBit rows 1 6 2 && rowBit rows 1 6 11))) = true)
    (h0106 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 12 && rowBit rows 1 6 2 && rowBit rows 1 6 12))) = true)
    (h0107 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 4 && rowBit rows 1 6 3 && rowBit rows 1 6 4))) = true)
    (h0108 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 7 && rowBit rows 1 6 3 && rowBit rows 1 6 7))) = true)
    (h0109 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 8 && rowBit rows 1 6 3 && rowBit rows 1 6 8))) = true)
    (h0110 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 9 && rowBit rows 1 6 3 && rowBit rows 1 6 9))) = true)
    (h0111 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 10 && rowBit rows 1 6 3 && rowBit rows 1 6 10))) = true)
    (h0112 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 11 && rowBit rows 1 6 3 && rowBit rows 1 6 11))) = true)
    (h0113 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 12 && rowBit rows 1 6 3 && rowBit rows 1 6 12))) = true)
    (h0114 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 7 && rowBit rows 1 6 4 && rowBit rows 1 6 7))) = true)
    (h0115 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 8 && rowBit rows 1 6 4 && rowBit rows 1 6 8))) = true)
    (h0116 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 9 && rowBit rows 1 6 4 && rowBit rows 1 6 9))) = true)
    (h0117 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 10 && rowBit rows 1 6 4 && rowBit rows 1 6 10))) = true)
    (h0118 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 11 && rowBit rows 1 6 4 && rowBit rows 1 6 11))) = true)
    (h0119 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 12 && rowBit rows 1 6 4 && rowBit rows 1 6 12))) = true)
    (h0120 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8))) = true)
    (h0121 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 9 && rowBit rows 1 6 7 && rowBit rows 1 6 9))) = true)
    (h0122 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10))) = true)
    (h0123 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11))) = true)
    (h0124 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12))) = true)
    (h0125 : (!((rowBit rows 2 5 8 && rowBit rows 2 5 10 && rowBit rows 1 6 8 && rowBit rows 1 6 10))) = true)
    (h0126 : (!((rowBit rows 2 5 8 && rowBit rows 2 5 11 && rowBit rows 1 6 8 && rowBit rows 1 6 11))) = true)
    (h0127 : (!((rowBit rows 2 5 8 && rowBit rows 2 5 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12))) = true)
    (h0128 : ((((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 1 then 1#4 else 0#4) + (bif shellBit shell 2 then 1#4 else 0#4) + (bif shellBit shell 3 then 1#4 else 0#4) + (bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4) + (bif shellBit shell 8 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 5#4)) = true)
    (h0129 : (shellBit shell 1) = true)
    (h0130 : (shellBit shell 2) = true)
    (h0131 : (shellBit shell 3) = true)
    (h0132 : ((((bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4)) == 1#4)) = true)
    (h0133 : ((((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 1#4)) = true)
    (h0134 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 0 == rowBit rows 0 2 0)))) = true)
    (h0135 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 1 == rowBit rows 0 2 1)))) = true)
    (h0136 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 3 == rowBit rows 0 2 3)))) = true)
    (h0137 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 4 == rowBit rows 0 2 4)))) = true)
    (h0138 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 6 == rowBit rows 0 2 6)))) = true)
    (h0139 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 8 == rowBit rows 0 2 8)))) = true)
    (h0140 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 10 == rowBit rows 0 2 10)))) = true)
    (h0141 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 11 == rowBit rows 0 2 11)))) = true)
    (h0142 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 12 == rowBit rows 0 2 12)))) = true)
    (h0143 : ((((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4) + (bif firstRowBit b1 9 then 1#4 else 0#4) + (bif firstRowBit b1 10 then 1#4 else 0#4) + (bif firstRowBit b1 11 then 1#4 else 0#4) + (bif firstRowBit b1 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h0144 : (!(firstRowBit b1 4)) = true)
    (h0145 : ((!((q == 9#4)) || (!(firstRowBit b1 9)))) = true)
    (h0146 : ((!((w == 9#4)) || (!(firstRowBit b1 9)))) = true)
    (h0147 : ((!((q == 10#4)) || (!(firstRowBit b1 10)))) = true)
    (h0148 : ((!((w == 10#4)) || (!(firstRowBit b1 10)))) = true)
    (h0149 : ((!((q == 11#4)) || (!(firstRowBit b1 11)))) = true)
    (h0150 : ((!((w == 11#4)) || (!(firstRowBit b1 11)))) = true)
    (h0151 : ((!((q == 12#4)) || (!(firstRowBit b1 12)))) = true)
    (h0152 : ((!((w == 12#4)) || (!(firstRowBit b1 12)))) = true)
    (h0153 : ((((bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4))).ule 1#4) = true)
    (h0154 : ((((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h0155 : (!((rowBit rows 1 6 2 && rowBit rows 1 6 1))) = true)
    (h0156 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 3))) = true)
    (h0157 : ((blockerAt blockers 1 == 2#4)) = true)
    (h0158 : (rowBit rows 0 2 1) = true)
    (h0159 : (rowBit rows 0 2 3) = true)
    (h0160 : (!(rowBit rows 0 2 0)) = true)
    (h0161 : (!(rowBit rows 0 2 4)) = true)
    (h0162 : ((2#4).ule ((bif rowBit rows 0 4 9 then 1#4 else 0#4) + (bif rowBit rows 0 4 10 then 1#4 else 0#4) + (bif rowBit rows 0 4 11 then 1#4 else 0#4) + (bif rowBit rows 0 4 12 then 1#4 else 0#4))) = true)
    (h0163 : ((2#4).ule ((bif firstRowBit b1 9 then 1#4 else 0#4) + (bif firstRowBit b1 10 then 1#4 else 0#4) + (bif firstRowBit b1 11 then 1#4 else 0#4) + (bif firstRowBit b1 12 then 1#4 else 0#4))) = true)
    (h0164 : ((((q == 9#4) && rowBit rows 0 4 9) || ((q == 10#4) && rowBit rows 0 4 10) || ((q == 11#4) && rowBit rows 0 4 11) || ((q == 12#4) && rowBit rows 0 4 12) || ((w == 9#4) && rowBit rows 0 4 9) || ((w == 10#4) && rowBit rows 0 4 10) || ((w == 11#4) && rowBit rows 0 4 11) || ((w == 12#4) && rowBit rows 0 4 12))) = true)
    (h0165 : ((((bif (rowBit rows 0 4 0 || firstRowBit b1 0) then 1#4 else 0#4) + (bif (rowBit rows 0 4 1 || firstRowBit b1 1) then 1#4 else 0#4) + (bif (rowBit rows 0 4 2 || firstRowBit b1 2) then 1#4 else 0#4) + (bif (rowBit rows 0 4 3 || firstRowBit b1 3) then 1#4 else 0#4) + (bif (rowBit rows 0 4 4 || firstRowBit b1 4) then 1#4 else 0#4) + (bif (rowBit rows 0 4 5 || firstRowBit b1 5) then 1#4 else 0#4) + (bif (rowBit rows 0 4 6 || firstRowBit b1 6) then 1#4 else 0#4) + (bif (rowBit rows 0 4 7 || firstRowBit b1 7) then 1#4 else 0#4) + (bif (rowBit rows 0 4 8 || firstRowBit b1 8) then 1#4 else 0#4) + (bif (rowBit rows 0 4 9 || firstRowBit b1 9) then 1#4 else 0#4) + (bif (rowBit rows 0 4 10 || firstRowBit b1 10) then 1#4 else 0#4) + (bif (rowBit rows 0 4 11 || firstRowBit b1 11) then 1#4 else 0#4) + (bif (rowBit rows 0 4 12 || firstRowBit b1 12) then 1#4 else 0#4)) == 6#4)) = true)
    (h0166 : ((rowBit rows 0 4 9 || firstRowBit b1 9)) = true)
    (h0167 : ((rowBit rows 0 4 10 || firstRowBit b1 10)) = true)
    (h0168 : ((rowBit rows 0 4 11 || firstRowBit b1 11)) = true)
    (h0169 : ((rowBit rows 0 4 12 || firstRowBit b1 12)) = true)
    (h0170 : ((rankAtom ranks 1).ult (78#7)) = true)
    (h0171 : ((rankAtom ranks 2).ult (78#7)) = true)
    (h0172 : ((rankAtom ranks 3).ult (78#7)) = true)
    (h0173 : ((rankAtom ranks 4).ult (78#7)) = true)
    (h0174 : ((rankAtom ranks 5).ult (78#7)) = true)
    (h0175 : ((rankAtom ranks 6).ult (78#7)) = true)
    (h0176 : ((rankAtom ranks 7).ult (78#7)) = true)
    (h0177 : ((rankAtom ranks 8).ult (78#7)) = true)
    (h0178 : ((rankAtom ranks 9).ult (78#7)) = true)
    (h0179 : ((rankAtom ranks 12).ult (78#7)) = true)
    (h0180 : ((rankAtom ranks 13).ult (78#7)) = true)
    (h0181 : ((rankAtom ranks 14).ult (78#7)) = true)
    (h0182 : ((rankAtom ranks 15).ult (78#7)) = true)
    (h0183 : ((rankAtom ranks 16).ult (78#7)) = true)
    (h0184 : ((rankAtom ranks 17).ult (78#7)) = true)
    (h0185 : ((rankAtom ranks 18).ult (78#7)) = true)
    (h0186 : ((rankAtom ranks 19).ult (78#7)) = true)
    (h0187 : ((rankAtom ranks 20).ult (78#7)) = true)
    (h0188 : ((rankAtom ranks 21).ult (78#7)) = true)
    (h0189 : ((rankAtom ranks 22).ult (78#7)) = true)
    (h0190 : ((rankAtom ranks 23).ult (78#7)) = true)
    (h0191 : ((rankAtom ranks 24).ult (78#7)) = true)
    (h0192 : ((rankAtom ranks 25).ult (78#7)) = true)
    (h0193 : ((rankAtom ranks 26).ult (78#7)) = true)
    (h0194 : ((rankAtom ranks 27).ult (78#7)) = true)
    (h0195 : ((rankAtom ranks 28).ult (78#7)) = true)
    (h0196 : ((rankAtom ranks 29).ult (78#7)) = true)
    (h0197 : ((rankAtom ranks 30).ult (78#7)) = true)
    (h0198 : ((rankAtom ranks 31).ult (78#7)) = true)
    (h0199 : ((rankAtom ranks 32).ult (78#7)) = true)
    (h0200 : ((rankAtom ranks 34).ult (78#7)) = true)
    (h0201 : ((rankAtom ranks 35).ult (78#7)) = true)
    (h0202 : ((rankAtom ranks 36).ult (78#7)) = true)
    (h0203 : ((rankAtom ranks 37).ult (78#7)) = true)
    (h0204 : ((rankAtom ranks 38).ult (78#7)) = true)
    (h0205 : ((rankAtom ranks 39).ult (78#7)) = true)
    (h0206 : ((rankAtom ranks 40).ult (78#7)) = true)
    (h0207 : ((rankAtom ranks 41).ult (78#7)) = true)
    (h0208 : ((rankAtom ranks 42).ult (78#7)) = true)
    (h0209 : ((rankAtom ranks 43).ult (78#7)) = true)
    (h0210 : ((rankAtom ranks 44).ult (78#7)) = true)
    (h0211 : ((rankAtom ranks 45).ult (78#7)) = true)
    (h0212 : ((rankAtom ranks 46).ult (78#7)) = true)
    (h0213 : ((rankAtom ranks 47).ult (78#7)) = true)
    (h0214 : ((rankAtom ranks 48).ult (78#7)) = true)
    (h0215 : ((rankAtom ranks 49).ult (78#7)) = true)
    (h0216 : ((rankAtom ranks 50).ult (78#7)) = true)
    (h0217 : ((rankAtom ranks 51).ult (78#7)) = true)
    (h0218 : ((rankAtom ranks 52).ult (78#7)) = true)
    (h0219 : ((rankAtom ranks 53).ult (78#7)) = true)
    (h0220 : ((rankAtom ranks 54).ult (78#7)) = true)
    (h0221 : ((rankAtom ranks 55).ult (78#7)) = true)
    (h0222 : ((rankAtom ranks 56).ult (78#7)) = true)
    (h0223 : ((rankAtom ranks 57).ult (78#7)) = true)
    (h0224 : ((rankAtom ranks 58).ult (78#7)) = true)
    (h0225 : ((rankAtom ranks 59).ult (78#7)) = true)
    (h0226 : ((rankAtom ranks 60).ult (78#7)) = true)
    (h0227 : ((rankAtom ranks 61).ult (78#7)) = true)
    (h0228 : ((rankAtom ranks 62).ult (78#7)) = true)
    (h0229 : ((rankAtom ranks 63).ult (78#7)) = true)
    (h0230 : ((rankAtom ranks 64).ult (78#7)) = true)
    (h0231 : ((rankAtom ranks 65).ult (78#7)) = true)
    (h0232 : ((rankAtom ranks 66).ult (78#7)) = true)
    (h0233 : ((rankAtom ranks 67).ult (78#7)) = true)
    (h0234 : ((rankAtom ranks 69).ult (78#7)) = true)
    (h0235 : ((rankAtom ranks 70).ult (78#7)) = true)
    (h0236 : ((rankAtom ranks 71).ult (78#7)) = true)
    (h0237 : ((!((rowBit rows 0 0 1 && rowBit rows 0 0 5)) || ((rankAtom ranks 0 == rankAtom ranks 4)))) = true)
    (h0238 : ((!((rowBit rows 0 0 1 && rowBit rows 0 0 6)) || ((rankAtom ranks 0 == rankAtom ranks 5)))) = true)
    (h0239 : ((!((rowBit rows 0 0 1 && rowBit rows 0 0 7)) || ((rankAtom ranks 0 == rankAtom ranks 6)))) = true)
    (h0240 : ((!((rowBit rows 0 0 2 && rowBit rows 0 0 5)) || ((rankAtom ranks 1 == rankAtom ranks 4)))) = true)
    (h0241 : ((!((rowBit rows 0 0 2 && rowBit rows 0 0 6)) || ((rankAtom ranks 1 == rankAtom ranks 5)))) = true)
    (h0242 : ((!((rowBit rows 0 0 2 && rowBit rows 0 0 7)) || ((rankAtom ranks 1 == rankAtom ranks 6)))) = true)
    (h0243 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 5)) || ((rankAtom ranks 2 == rankAtom ranks 4)))) = true)
    (h0244 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 6)) || ((rankAtom ranks 2 == rankAtom ranks 5)))) = true)
    (h0245 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 7)) || ((rankAtom ranks 2 == rankAtom ranks 6)))) = true)
    (h0246 : ((!((rowBit rows 0 0 3 && rowBit rows 0 0 8)) || ((rankAtom ranks 2 == rankAtom ranks 7)))) = true)
    (h0247 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 5)) || ((rankAtom ranks 3 == rankAtom ranks 4)))) = true)
    (h0248 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 6)) || ((rankAtom ranks 3 == rankAtom ranks 5)))) = true)
    (h0249 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 7)) || ((rankAtom ranks 3 == rankAtom ranks 6)))) = true)
    (h0250 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 8)) || ((rankAtom ranks 3 == rankAtom ranks 7)))) = true)
    (h0251 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 9)) || ((rankAtom ranks 3 == rankAtom ranks 8)))) = true)
    (h0252 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 10)) || ((rankAtom ranks 3 == rankAtom ranks 9)))) = true)
    (h0253 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 11)) || ((rankAtom ranks 3 == rankAtom ranks 10)))) = true)
    (h0254 : ((!((rowBit rows 0 0 4 && rowBit rows 0 0 12)) || ((rankAtom ranks 3 == rankAtom ranks 11)))) = true)
    (h0255 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 6)) || ((rankAtom ranks 4 == rankAtom ranks 5)))) = true)
    (h0256 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 7)) || ((rankAtom ranks 4 == rankAtom ranks 6)))) = true)
    (h0257 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 8)) || ((rankAtom ranks 4 == rankAtom ranks 7)))) = true)
    (h0258 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 9)) || ((rankAtom ranks 4 == rankAtom ranks 8)))) = true)
    (h0259 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 10)) || ((rankAtom ranks 4 == rankAtom ranks 9)))) = true)
    (h0260 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 11)) || ((rankAtom ranks 4 == rankAtom ranks 10)))) = true)
    (h0261 : ((!((rowBit rows 0 0 5 && rowBit rows 0 0 12)) || ((rankAtom ranks 4 == rankAtom ranks 11)))) = true)
    (h0262 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 7)) || ((rankAtom ranks 5 == rankAtom ranks 6)))) = true)
    (h0263 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 8)) || ((rankAtom ranks 5 == rankAtom ranks 7)))) = true)
    (h0264 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 9)) || ((rankAtom ranks 5 == rankAtom ranks 8)))) = true)
    (h0265 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 10)) || ((rankAtom ranks 5 == rankAtom ranks 9)))) = true)
    (h0266 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 11)) || ((rankAtom ranks 5 == rankAtom ranks 10)))) = true)
    (h0267 : ((!((rowBit rows 0 0 6 && rowBit rows 0 0 12)) || ((rankAtom ranks 5 == rankAtom ranks 11)))) = true)
    (h0268 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 8)) || ((rankAtom ranks 6 == rankAtom ranks 7)))) = true)
    (h0269 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 9)) || ((rankAtom ranks 6 == rankAtom ranks 8)))) = true)
    (h0270 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 10)) || ((rankAtom ranks 6 == rankAtom ranks 9)))) = true)
    (h0271 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 11)) || ((rankAtom ranks 6 == rankAtom ranks 10)))) = true)
    (h0272 : ((!((rowBit rows 0 0 7 && rowBit rows 0 0 12)) || ((rankAtom ranks 6 == rankAtom ranks 11)))) = true)
    (h0273 : ((!((rowBit rows 0 0 9 && rowBit rows 0 0 10)) || ((rankAtom ranks 8 == rankAtom ranks 9)))) = true)
    (h0274 : ((!((rowBit rows 0 0 9 && rowBit rows 0 0 11)) || ((rankAtom ranks 8 == rankAtom ranks 10)))) = true)
    (h0275 : ((!((rowBit rows 0 0 10 && rowBit rows 0 0 11)) || ((rankAtom ranks 9 == rankAtom ranks 10)))) = true)
    (h0276 : ((!((rowBit rows 0 0 10 && rowBit rows 0 0 12)) || ((rankAtom ranks 9 == rankAtom ranks 11)))) = true)
    (h0277 : ((!((rowBit rows 0 0 11 && rowBit rows 0 0 12)) || ((rankAtom ranks 10 == rankAtom ranks 11)))) = true)
    (h0278 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 3)) || ((rankAtom ranks 12 == rankAtom ranks 23)))) = true)
    (h0279 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 5)) || ((rankAtom ranks 12 == rankAtom ranks 25)))) = true)
    (h0280 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 6)) || ((rankAtom ranks 12 == rankAtom ranks 26)))) = true)
    (h0281 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 7)) || ((rankAtom ranks 12 == rankAtom ranks 27)))) = true)
    (h0282 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 8)) || ((rankAtom ranks 12 == rankAtom ranks 28)))) = true)
    (h0283 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 9)) || ((rankAtom ranks 12 == rankAtom ranks 29)))) = true)
    (h0284 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 10)) || ((rankAtom ranks 12 == rankAtom ranks 30)))) = true)
    (h0285 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 11)) || ((rankAtom ranks 12 == rankAtom ranks 31)))) = true)
    (h0286 : ((!((rowBit rows 0 2 1 && rowBit rows 0 2 12)) || ((rankAtom ranks 12 == rankAtom ranks 32)))) = true)
    (h0287 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 5)) || ((rankAtom ranks 23 == rankAtom ranks 25)))) = true)
    (h0288 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 6)) || ((rankAtom ranks 23 == rankAtom ranks 26)))) = true)
    (h0289 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 7)) || ((rankAtom ranks 23 == rankAtom ranks 27)))) = true)
    (h0290 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 8)) || ((rankAtom ranks 23 == rankAtom ranks 28)))) = true)
    (h0291 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 9)) || ((rankAtom ranks 23 == rankAtom ranks 29)))) = true)
    (h0292 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 10)) || ((rankAtom ranks 23 == rankAtom ranks 30)))) = true)
    (h0293 : ((!((rowBit rows 0 2 3 && rowBit rows 0 2 11)) || ((rankAtom ranks 23 == rankAtom ranks 31)))) = true)
    (h0294 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 6)) || ((rankAtom ranks 25 == rankAtom ranks 26)))) = true)
    (h0295 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 7)) || ((rankAtom ranks 25 == rankAtom ranks 27)))) = true)
    (h0296 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 8)) || ((rankAtom ranks 25 == rankAtom ranks 28)))) = true)
    (h0297 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 9)) || ((rankAtom ranks 25 == rankAtom ranks 29)))) = true)
    (h0298 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 12)) || ((rankAtom ranks 25 == rankAtom ranks 32)))) = true)
    (h0299 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 7)) || ((rankAtom ranks 26 == rankAtom ranks 27)))) = true)
    (h0300 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 8)) || ((rankAtom ranks 26 == rankAtom ranks 28)))) = true)
    (h0301 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 9)) || ((rankAtom ranks 26 == rankAtom ranks 29)))) = true)
    (h0302 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 10)) || ((rankAtom ranks 26 == rankAtom ranks 30)))) = true)
    (h0303 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 11)) || ((rankAtom ranks 26 == rankAtom ranks 31)))) = true)
    (h0304 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 12)) || ((rankAtom ranks 26 == rankAtom ranks 32)))) = true)
    (h0305 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 8)) || ((rankAtom ranks 27 == rankAtom ranks 28)))) = true)
    (h0306 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 9)) || ((rankAtom ranks 27 == rankAtom ranks 29)))) = true)
    (h0307 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 10)) || ((rankAtom ranks 27 == rankAtom ranks 30)))) = true)
    (h0308 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 11)) || ((rankAtom ranks 27 == rankAtom ranks 31)))) = true)
    (h0309 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 12)) || ((rankAtom ranks 27 == rankAtom ranks 32)))) = true)
    (h0310 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 9)) || ((rankAtom ranks 28 == rankAtom ranks 29)))) = true)
    (h0311 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 10)) || ((rankAtom ranks 28 == rankAtom ranks 30)))) = true)
    (h0312 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 11)) || ((rankAtom ranks 28 == rankAtom ranks 31)))) = true)
    (h0313 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 12)) || ((rankAtom ranks 28 == rankAtom ranks 32)))) = true)
    (h0314 : ((!((rowBit rows 0 2 9 && rowBit rows 0 2 10)) || ((rankAtom ranks 29 == rankAtom ranks 30)))) = true)
    (h0315 : ((!((rowBit rows 0 2 9 && rowBit rows 0 2 11)) || ((rankAtom ranks 29 == rankAtom ranks 31)))) = true)
    (h0316 : ((!((rowBit rows 0 2 9 && rowBit rows 0 2 12)) || ((rankAtom ranks 29 == rankAtom ranks 32)))) = true)
    (h0317 : ((!((rowBit rows 0 2 10 && rowBit rows 0 2 11)) || ((rankAtom ranks 30 == rankAtom ranks 31)))) = true)
    (h0318 : ((!((rowBit rows 0 2 10 && rowBit rows 0 2 12)) || ((rankAtom ranks 30 == rankAtom ranks 32)))) = true)
    (h0319 : ((!((rowBit rows 0 2 11 && rowBit rows 0 2 12)) || ((rankAtom ranks 31 == rankAtom ranks 32)))) = true)
    (h0320 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 9)) || ((rankAtom ranks 3 == rankAtom ranks 46)))) = true)
    (h0321 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 10)) || ((rankAtom ranks 3 == rankAtom ranks 47)))) = true)
    (h0322 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 11)) || ((rankAtom ranks 3 == rankAtom ranks 48)))) = true)
    (h0323 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 12)) || ((rankAtom ranks 3 == rankAtom ranks 49)))) = true)
    (h0324 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 9)) || ((rankAtom ranks 14 == rankAtom ranks 46)))) = true)
    (h0325 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 10)) || ((rankAtom ranks 14 == rankAtom ranks 47)))) = true)
    (h0326 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 11)) || ((rankAtom ranks 14 == rankAtom ranks 48)))) = true)
    (h0327 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 12)) || ((rankAtom ranks 14 == rankAtom ranks 49)))) = true)
    (h0328 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 9)) || ((rankAtom ranks 24 == rankAtom ranks 46)))) = true)
    (h0329 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 10)) || ((rankAtom ranks 24 == rankAtom ranks 47)))) = true)
    (h0330 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 11)) || ((rankAtom ranks 24 == rankAtom ranks 48)))) = true)
    (h0331 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 12)) || ((rankAtom ranks 24 == rankAtom ranks 49)))) = true)
    (h0332 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 10)) || ((rankAtom ranks 33 == rankAtom ranks 47)))) = true)
    (h0333 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 11)) || ((rankAtom ranks 33 == rankAtom ranks 48)))) = true)
    (h0334 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 12)) || ((rankAtom ranks 33 == rankAtom ranks 49)))) = true)
    (h0335 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 9)) || ((rankAtom ranks 42 == rankAtom ranks 46)))) = true)
    (h0336 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 10)) || ((rankAtom ranks 42 == rankAtom ranks 47)))) = true)
    (h0337 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 11)) || ((rankAtom ranks 42 == rankAtom ranks 48)))) = true)
    (h0338 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 12)) || ((rankAtom ranks 42 == rankAtom ranks 49)))) = true)
    (h0339 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 9)) || ((rankAtom ranks 43 == rankAtom ranks 46)))) = true)
    (h0340 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 10)) || ((rankAtom ranks 43 == rankAtom ranks 47)))) = true)
    (h0341 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 11)) || ((rankAtom ranks 43 == rankAtom ranks 48)))) = true)
    (h0342 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 12)) || ((rankAtom ranks 43 == rankAtom ranks 49)))) = true)
    (h0343 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 9)) || ((rankAtom ranks 44 == rankAtom ranks 46)))) = true)
    (h0344 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 10)) || ((rankAtom ranks 44 == rankAtom ranks 47)))) = true)
    (h0345 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 11)) || ((rankAtom ranks 44 == rankAtom ranks 48)))) = true)
    (h0346 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 12)) || ((rankAtom ranks 44 == rankAtom ranks 49)))) = true)
    (h0347 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 9)) || ((rankAtom ranks 45 == rankAtom ranks 46)))) = true)
    (h0348 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 10)) || ((rankAtom ranks 45 == rankAtom ranks 47)))) = true)
    (h0349 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 11)) || ((rankAtom ranks 45 == rankAtom ranks 48)))) = true)
    (h0350 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 12)) || ((rankAtom ranks 45 == rankAtom ranks 49)))) = true)
    (h0351 : ((!((rowBit rows 0 4 9 && rowBit rows 0 4 10)) || ((rankAtom ranks 46 == rankAtom ranks 47)))) = true)
    (h0352 : ((!((rowBit rows 0 4 9 && rowBit rows 0 4 11)) || ((rankAtom ranks 46 == rankAtom ranks 48)))) = true)
    (h0353 : ((!((rowBit rows 0 4 9 && rowBit rows 0 4 12)) || ((rankAtom ranks 46 == rankAtom ranks 49)))) = true)
    (h0354 : ((!((rowBit rows 0 4 10 && rowBit rows 0 4 11)) || ((rankAtom ranks 47 == rankAtom ranks 48)))) = true)
    (h0355 : ((!((rowBit rows 0 4 10 && rowBit rows 0 4 12)) || ((rankAtom ranks 47 == rankAtom ranks 49)))) = true)
    (h0356 : ((!((rowBit rows 0 4 11 && rowBit rows 0 4 12)) || ((rankAtom ranks 48 == rankAtom ranks 49)))) = true)
    (h0357 : ((!((rowBit rows 1 2 1 && rowBit rows 1 2 9)) || ((rankAtom ranks 12 == rankAtom ranks 29)))) = true)
    (h0358 : ((!((rowBit rows 1 2 3 && rowBit rows 1 2 5)) || ((rankAtom ranks 23 == rankAtom ranks 25)))) = true)
    (h0359 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 1)) || ((rankAtom ranks 5 == rankAtom ranks 16)))) = true)
    (h0360 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 2)) || ((rankAtom ranks 5 == rankAtom ranks 26)))) = true)
    (h0361 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 3)) || ((rankAtom ranks 5 == rankAtom ranks 35)))) = true)
    (h0362 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 4)) || ((rankAtom ranks 5 == rankAtom ranks 43)))) = true)
    (h0363 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 5)) || ((rankAtom ranks 5 == rankAtom ranks 50)))) = true)
    (h0364 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 7)) || ((rankAtom ranks 5 == rankAtom ranks 57)))) = true)
    (h0365 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 8)) || ((rankAtom ranks 5 == rankAtom ranks 58)))) = true)
    (h0366 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 9)) || ((rankAtom ranks 5 == rankAtom ranks 59)))) = true)
    (h0367 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 10)) || ((rankAtom ranks 5 == rankAtom ranks 60)))) = true)
    (h0368 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 11)) || ((rankAtom ranks 5 == rankAtom ranks 61)))) = true)
    (h0369 : ((!((rowBit rows 1 6 0 && rowBit rows 1 6 12)) || ((rankAtom ranks 5 == rankAtom ranks 62)))) = true)
    (h0370 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 3)) || ((rankAtom ranks 16 == rankAtom ranks 35)))) = true)
    (h0371 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 4)) || ((rankAtom ranks 16 == rankAtom ranks 43)))) = true)
    (h0372 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 5)) || ((rankAtom ranks 16 == rankAtom ranks 50)))) = true)
    (h0373 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 7)) || ((rankAtom ranks 16 == rankAtom ranks 57)))) = true)
    (h0374 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 8)) || ((rankAtom ranks 16 == rankAtom ranks 58)))) = true)
    (h0375 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 9)) || ((rankAtom ranks 16 == rankAtom ranks 59)))) = true)
    (h0376 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 10)) || ((rankAtom ranks 16 == rankAtom ranks 60)))) = true)
    (h0377 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 11)) || ((rankAtom ranks 16 == rankAtom ranks 61)))) = true)
    (h0378 : ((!((rowBit rows 1 6 1 && rowBit rows 1 6 12)) || ((rankAtom ranks 16 == rankAtom ranks 62)))) = true)
    (h0379 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 3)) || ((rankAtom ranks 26 == rankAtom ranks 35)))) = true)
    (h0380 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 4)) || ((rankAtom ranks 26 == rankAtom ranks 43)))) = true)
    (h0381 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 5)) || ((rankAtom ranks 26 == rankAtom ranks 50)))) = true)
    (h0382 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 7)) || ((rankAtom ranks 26 == rankAtom ranks 57)))) = true)
    (h0383 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 8)) || ((rankAtom ranks 26 == rankAtom ranks 58)))) = true)
    (h0384 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 9)) || ((rankAtom ranks 26 == rankAtom ranks 59)))) = true)
    (h0385 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 10)) || ((rankAtom ranks 26 == rankAtom ranks 60)))) = true)
    (h0386 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 11)) || ((rankAtom ranks 26 == rankAtom ranks 61)))) = true)
    (h0387 : ((!((rowBit rows 1 6 2 && rowBit rows 1 6 12)) || ((rankAtom ranks 26 == rankAtom ranks 62)))) = true)
    (h0388 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 4)) || ((rankAtom ranks 35 == rankAtom ranks 43)))) = true)
    (h0389 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 5)) || ((rankAtom ranks 35 == rankAtom ranks 50)))) = true)
    (h0390 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 7)) || ((rankAtom ranks 35 == rankAtom ranks 57)))) = true)
    (h0391 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 8)) || ((rankAtom ranks 35 == rankAtom ranks 58)))) = true)
    (h0392 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 9)) || ((rankAtom ranks 35 == rankAtom ranks 59)))) = true)
    (h0393 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 10)) || ((rankAtom ranks 35 == rankAtom ranks 60)))) = true)
    (h0394 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 11)) || ((rankAtom ranks 35 == rankAtom ranks 61)))) = true)
    (h0395 : ((!((rowBit rows 1 6 3 && rowBit rows 1 6 12)) || ((rankAtom ranks 35 == rankAtom ranks 62)))) = true)
    (h0396 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 5)) || ((rankAtom ranks 43 == rankAtom ranks 50)))) = true)
    (h0397 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 7)) || ((rankAtom ranks 43 == rankAtom ranks 57)))) = true)
    (h0398 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 8)) || ((rankAtom ranks 43 == rankAtom ranks 58)))) = true)
    (h0399 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 9)) || ((rankAtom ranks 43 == rankAtom ranks 59)))) = true)
    (h0400 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 10)) || ((rankAtom ranks 43 == rankAtom ranks 60)))) = true)
    (h0401 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 11)) || ((rankAtom ranks 43 == rankAtom ranks 61)))) = true)
    (h0402 : ((!((rowBit rows 1 6 4 && rowBit rows 1 6 12)) || ((rankAtom ranks 43 == rankAtom ranks 62)))) = true)
    (h0403 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 7)) || ((rankAtom ranks 50 == rankAtom ranks 57)))) = true)
    (h0404 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 8)) || ((rankAtom ranks 50 == rankAtom ranks 58)))) = true)
    (h0405 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 9)) || ((rankAtom ranks 50 == rankAtom ranks 59)))) = true)
    (h0406 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 10)) || ((rankAtom ranks 50 == rankAtom ranks 60)))) = true)
    (h0407 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 11)) || ((rankAtom ranks 50 == rankAtom ranks 61)))) = true)
    (h0408 : ((!((rowBit rows 1 6 5 && rowBit rows 1 6 12)) || ((rankAtom ranks 50 == rankAtom ranks 62)))) = true)
    (h0409 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 8)) || ((rankAtom ranks 57 == rankAtom ranks 58)))) = true)
    (h0410 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 9)) || ((rankAtom ranks 57 == rankAtom ranks 59)))) = true)
    (h0411 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 10)) || ((rankAtom ranks 57 == rankAtom ranks 60)))) = true)
    (h0412 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 11)) || ((rankAtom ranks 57 == rankAtom ranks 61)))) = true)
    (h0413 : ((!((rowBit rows 1 6 7 && rowBit rows 1 6 12)) || ((rankAtom ranks 57 == rankAtom ranks 62)))) = true)
    (h0414 : ((!((rowBit rows 1 6 8 && rowBit rows 1 6 9)) || ((rankAtom ranks 58 == rankAtom ranks 59)))) = true)
    (h0415 : ((!((rowBit rows 1 6 8 && rowBit rows 1 6 10)) || ((rankAtom ranks 58 == rankAtom ranks 60)))) = true)
    (h0416 : ((!((rowBit rows 1 6 8 && rowBit rows 1 6 11)) || ((rankAtom ranks 58 == rankAtom ranks 61)))) = true)
    (h0417 : ((!((rowBit rows 1 6 8 && rowBit rows 1 6 12)) || ((rankAtom ranks 58 == rankAtom ranks 62)))) = true)
    (h0418 : ((!((rowBit rows 1 6 9 && rowBit rows 1 6 10)) || ((rankAtom ranks 59 == rankAtom ranks 60)))) = true)
    (h0419 : ((!((rowBit rows 1 6 9 && rowBit rows 1 6 11)) || ((rankAtom ranks 59 == rankAtom ranks 61)))) = true)
    (h0420 : ((!((rowBit rows 1 6 9 && rowBit rows 1 6 12)) || ((rankAtom ranks 59 == rankAtom ranks 62)))) = true)
    (h0421 : ((!((rowBit rows 1 6 10 && rowBit rows 1 6 11)) || ((rankAtom ranks 60 == rankAtom ranks 61)))) = true)
    (h0422 : ((!((rowBit rows 1 6 10 && rowBit rows 1 6 12)) || ((rankAtom ranks 60 == rankAtom ranks 62)))) = true)
    (h0423 : ((!((rowBit rows 1 6 11 && rowBit rows 1 6 12)) || ((rankAtom ranks 61 == rankAtom ranks 62)))) = true)
    (h0424 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 1)) || ((rankAtom ranks 4 == rankAtom ranks 15)))) = true)
    (h0425 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 2)) || ((rankAtom ranks 4 == rankAtom ranks 25)))) = true)
    (h0426 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 3)) || ((rankAtom ranks 4 == rankAtom ranks 34)))) = true)
    (h0427 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 4)) || ((rankAtom ranks 4 == rankAtom ranks 42)))) = true)
    (h0428 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 6)) || ((rankAtom ranks 4 == rankAtom ranks 50)))) = true)
    (h0429 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 7)) || ((rankAtom ranks 4 == rankAtom ranks 51)))) = true)
    (h0430 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 8)) || ((rankAtom ranks 4 == rankAtom ranks 52)))) = true)
    (h0431 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 9)) || ((rankAtom ranks 4 == rankAtom ranks 53)))) = true)
    (h0432 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 10)) || ((rankAtom ranks 4 == rankAtom ranks 54)))) = true)
    (h0433 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 11)) || ((rankAtom ranks 4 == rankAtom ranks 55)))) = true)
    (h0434 : ((!((rowBit rows 2 5 0 && rowBit rows 2 5 12)) || ((rankAtom ranks 4 == rankAtom ranks 56)))) = true)
    (h0435 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 2)) || ((rankAtom ranks 15 == rankAtom ranks 25)))) = true)
    (h0436 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 3)) || ((rankAtom ranks 15 == rankAtom ranks 34)))) = true)
    (h0437 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 4)) || ((rankAtom ranks 15 == rankAtom ranks 42)))) = true)
    (h0438 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 6)) || ((rankAtom ranks 15 == rankAtom ranks 50)))) = true)
    (h0439 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 7)) || ((rankAtom ranks 15 == rankAtom ranks 51)))) = true)
    (h0440 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 8)) || ((rankAtom ranks 15 == rankAtom ranks 52)))) = true)
    (h0441 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 9)) || ((rankAtom ranks 15 == rankAtom ranks 53)))) = true)
    (h0442 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 10)) || ((rankAtom ranks 15 == rankAtom ranks 54)))) = true)
    (h0443 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 11)) || ((rankAtom ranks 15 == rankAtom ranks 55)))) = true)
    (h0444 : ((!((rowBit rows 2 5 1 && rowBit rows 2 5 12)) || ((rankAtom ranks 15 == rankAtom ranks 56)))) = true)
    (h0445 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 4)) || ((rankAtom ranks 25 == rankAtom ranks 42)))) = true)
    (h0446 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 6)) || ((rankAtom ranks 25 == rankAtom ranks 50)))) = true)
    (h0447 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 7)) || ((rankAtom ranks 25 == rankAtom ranks 51)))) = true)
    (h0448 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 8)) || ((rankAtom ranks 25 == rankAtom ranks 52)))) = true)
    (h0449 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 9)) || ((rankAtom ranks 25 == rankAtom ranks 53)))) = true)
    (h0450 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 10)) || ((rankAtom ranks 25 == rankAtom ranks 54)))) = true)
    (h0451 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 11)) || ((rankAtom ranks 25 == rankAtom ranks 55)))) = true)
    (h0452 : ((!((rowBit rows 2 5 2 && rowBit rows 2 5 12)) || ((rankAtom ranks 25 == rankAtom ranks 56)))) = true)
    (h0453 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 4)) || ((rankAtom ranks 34 == rankAtom ranks 42)))) = true)
    (h0454 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 6)) || ((rankAtom ranks 34 == rankAtom ranks 50)))) = true)
    (h0455 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 7)) || ((rankAtom ranks 34 == rankAtom ranks 51)))) = true)
    (h0456 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 8)) || ((rankAtom ranks 34 == rankAtom ranks 52)))) = true)
    (h0457 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 9)) || ((rankAtom ranks 34 == rankAtom ranks 53)))) = true)
    (h0458 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 10)) || ((rankAtom ranks 34 == rankAtom ranks 54)))) = true)
    (h0459 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 11)) || ((rankAtom ranks 34 == rankAtom ranks 55)))) = true)
    (h0460 : ((!((rowBit rows 2 5 3 && rowBit rows 2 5 12)) || ((rankAtom ranks 34 == rankAtom ranks 56)))) = true)
    (h0461 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 6)) || ((rankAtom ranks 42 == rankAtom ranks 50)))) = true)
    (h0462 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 7)) || ((rankAtom ranks 42 == rankAtom ranks 51)))) = true)
    (h0463 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 8)) || ((rankAtom ranks 42 == rankAtom ranks 52)))) = true)
    (h0464 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 9)) || ((rankAtom ranks 42 == rankAtom ranks 53)))) = true)
    (h0465 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 10)) || ((rankAtom ranks 42 == rankAtom ranks 54)))) = true)
    (h0466 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 11)) || ((rankAtom ranks 42 == rankAtom ranks 55)))) = true)
    (h0467 : ((!((rowBit rows 2 5 4 && rowBit rows 2 5 12)) || ((rankAtom ranks 42 == rankAtom ranks 56)))) = true)
    (h0468 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 7)) || ((rankAtom ranks 50 == rankAtom ranks 51)))) = true)
    (h0469 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 8)) || ((rankAtom ranks 50 == rankAtom ranks 52)))) = true)
    (h0470 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 9)) || ((rankAtom ranks 50 == rankAtom ranks 53)))) = true)
    (h0471 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 10)) || ((rankAtom ranks 50 == rankAtom ranks 54)))) = true)
    (h0472 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 11)) || ((rankAtom ranks 50 == rankAtom ranks 55)))) = true)
    (h0473 : ((!((rowBit rows 2 5 6 && rowBit rows 2 5 12)) || ((rankAtom ranks 50 == rankAtom ranks 56)))) = true)
    (h0474 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 8)) || ((rankAtom ranks 51 == rankAtom ranks 52)))) = true)
    (h0475 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 9)) || ((rankAtom ranks 51 == rankAtom ranks 53)))) = true)
    (h0476 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 10)) || ((rankAtom ranks 51 == rankAtom ranks 54)))) = true)
    (h0477 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 11)) || ((rankAtom ranks 51 == rankAtom ranks 55)))) = true)
    (h0478 : ((!((rowBit rows 2 5 7 && rowBit rows 2 5 12)) || ((rankAtom ranks 51 == rankAtom ranks 56)))) = true)
    (h0479 : ((!((rowBit rows 2 5 8 && rowBit rows 2 5 9)) || ((rankAtom ranks 52 == rankAtom ranks 53)))) = true)
    (h0480 : ((!((rowBit rows 2 5 8 && rowBit rows 2 5 10)) || ((rankAtom ranks 52 == rankAtom ranks 54)))) = true)
    (h0481 : ((!((rowBit rows 2 5 8 && rowBit rows 2 5 11)) || ((rankAtom ranks 52 == rankAtom ranks 55)))) = true)
    (h0482 : ((!((rowBit rows 2 5 8 && rowBit rows 2 5 12)) || ((rankAtom ranks 52 == rankAtom ranks 56)))) = true)
    (h0483 : ((!((rowBit rows 2 5 9 && rowBit rows 2 5 10)) || ((rankAtom ranks 53 == rankAtom ranks 54)))) = true)
    (h0484 : ((!((rowBit rows 2 5 9 && rowBit rows 2 5 11)) || ((rankAtom ranks 53 == rankAtom ranks 55)))) = true)
    (h0485 : ((!((rowBit rows 2 5 9 && rowBit rows 2 5 12)) || ((rankAtom ranks 53 == rankAtom ranks 56)))) = true)
    (h0486 : ((!((rowBit rows 2 5 10 && rowBit rows 2 5 11)) || ((rankAtom ranks 54 == rankAtom ranks 55)))) = true)
    (h0487 : ((!((rowBit rows 2 5 10 && rowBit rows 2 5 12)) || ((rankAtom ranks 54 == rankAtom ranks 56)))) = true)
    (h0488 : ((!((rowBit rows 2 5 11 && rowBit rows 2 5 12)) || ((rankAtom ranks 55 == rankAtom ranks 56)))) = true)
    (h0489 : ((!((firstRowBit b1 0 && firstRowBit b1 9)) || ((rankAtom ranks 3 == rankAtom ranks 46)))) = true)
    (h0490 : ((!((firstRowBit b1 0 && firstRowBit b1 10)) || ((rankAtom ranks 3 == rankAtom ranks 47)))) = true)
    (h0491 : ((!((firstRowBit b1 0 && firstRowBit b1 11)) || ((rankAtom ranks 3 == rankAtom ranks 48)))) = true)
    (h0492 : ((!((firstRowBit b1 0 && firstRowBit b1 12)) || ((rankAtom ranks 3 == rankAtom ranks 49)))) = true)
    (h0493 : ((!((firstRowBit b1 1 && firstRowBit b1 9)) || ((rankAtom ranks 14 == rankAtom ranks 46)))) = true)
    (h0494 : ((!((firstRowBit b1 1 && firstRowBit b1 10)) || ((rankAtom ranks 14 == rankAtom ranks 47)))) = true)
    (h0495 : ((!((firstRowBit b1 1 && firstRowBit b1 11)) || ((rankAtom ranks 14 == rankAtom ranks 48)))) = true)
    (h0496 : ((!((firstRowBit b1 1 && firstRowBit b1 12)) || ((rankAtom ranks 14 == rankAtom ranks 49)))) = true)
    (h0497 : ((!((firstRowBit b1 2 && firstRowBit b1 6)) || ((rankAtom ranks 24 == rankAtom ranks 43)))) = true)
    (h0498 : ((!((firstRowBit b1 2 && firstRowBit b1 9)) || ((rankAtom ranks 24 == rankAtom ranks 46)))) = true)
    (h0499 : ((!((firstRowBit b1 2 && firstRowBit b1 10)) || ((rankAtom ranks 24 == rankAtom ranks 47)))) = true)
    (h0500 : ((!((firstRowBit b1 2 && firstRowBit b1 11)) || ((rankAtom ranks 24 == rankAtom ranks 48)))) = true)
    (h0501 : ((!((firstRowBit b1 2 && firstRowBit b1 12)) || ((rankAtom ranks 24 == rankAtom ranks 49)))) = true)
    (h0502 : ((!((firstRowBit b1 3 && firstRowBit b1 9)) || ((rankAtom ranks 33 == rankAtom ranks 46)))) = true)
    (h0503 : ((!((firstRowBit b1 3 && firstRowBit b1 10)) || ((rankAtom ranks 33 == rankAtom ranks 47)))) = true)
    (h0504 : ((!((firstRowBit b1 3 && firstRowBit b1 11)) || ((rankAtom ranks 33 == rankAtom ranks 48)))) = true)
    (h0505 : ((!((firstRowBit b1 3 && firstRowBit b1 12)) || ((rankAtom ranks 33 == rankAtom ranks 49)))) = true)
    (h0506 : ((!((firstRowBit b1 5 && firstRowBit b1 9)) || ((rankAtom ranks 42 == rankAtom ranks 46)))) = true)
    (h0507 : ((!((firstRowBit b1 5 && firstRowBit b1 10)) || ((rankAtom ranks 42 == rankAtom ranks 47)))) = true)
    (h0508 : ((!((firstRowBit b1 5 && firstRowBit b1 11)) || ((rankAtom ranks 42 == rankAtom ranks 48)))) = true)
    (h0509 : ((!((firstRowBit b1 5 && firstRowBit b1 12)) || ((rankAtom ranks 42 == rankAtom ranks 49)))) = true)
    (h0510 : ((!((firstRowBit b1 6 && firstRowBit b1 9)) || ((rankAtom ranks 43 == rankAtom ranks 46)))) = true)
    (h0511 : ((!((firstRowBit b1 6 && firstRowBit b1 10)) || ((rankAtom ranks 43 == rankAtom ranks 47)))) = true)
    (h0512 : ((!((firstRowBit b1 6 && firstRowBit b1 11)) || ((rankAtom ranks 43 == rankAtom ranks 48)))) = true)
    (h0513 : ((!((firstRowBit b1 6 && firstRowBit b1 12)) || ((rankAtom ranks 43 == rankAtom ranks 49)))) = true)
    (h0514 : ((!((firstRowBit b1 7 && firstRowBit b1 9)) || ((rankAtom ranks 44 == rankAtom ranks 46)))) = true)
    (h0515 : ((!((firstRowBit b1 7 && firstRowBit b1 10)) || ((rankAtom ranks 44 == rankAtom ranks 47)))) = true)
    (h0516 : ((!((firstRowBit b1 7 && firstRowBit b1 11)) || ((rankAtom ranks 44 == rankAtom ranks 48)))) = true)
    (h0517 : ((!((firstRowBit b1 7 && firstRowBit b1 12)) || ((rankAtom ranks 44 == rankAtom ranks 49)))) = true)
    (h0518 : ((!((firstRowBit b1 8 && firstRowBit b1 9)) || ((rankAtom ranks 45 == rankAtom ranks 46)))) = true)
    (h0519 : ((!((firstRowBit b1 8 && firstRowBit b1 10)) || ((rankAtom ranks 45 == rankAtom ranks 47)))) = true)
    (h0520 : ((!((firstRowBit b1 8 && firstRowBit b1 11)) || ((rankAtom ranks 45 == rankAtom ranks 48)))) = true)
    (h0521 : ((!((firstRowBit b1 8 && firstRowBit b1 12)) || ((rankAtom ranks 45 == rankAtom ranks 49)))) = true)
    (h0522 : ((!((firstRowBit b1 9 && firstRowBit b1 10)) || ((rankAtom ranks 46 == rankAtom ranks 47)))) = true)
    (h0523 : ((!((firstRowBit b1 9 && firstRowBit b1 11)) || ((rankAtom ranks 46 == rankAtom ranks 48)))) = true)
    (h0524 : ((!((firstRowBit b1 9 && firstRowBit b1 12)) || ((rankAtom ranks 46 == rankAtom ranks 49)))) = true)
    (h0525 : ((!((firstRowBit b1 10 && firstRowBit b1 11)) || ((rankAtom ranks 47 == rankAtom ranks 48)))) = true)
    (h0526 : ((!((firstRowBit b1 10 && firstRowBit b1 12)) || ((rankAtom ranks 47 == rankAtom ranks 49)))) = true)
    (h0527 : ((!((firstRowBit b1 11 && firstRowBit b1 12)) || ((rankAtom ranks 48 == rankAtom ranks 49)))) = true)
    (h0528 : ((!((shellBit shell 0 && shellBit shell 1)) || ((rankAtom ranks 7 == rankAtom ranks 18)))) = true)
    (h0529 : ((!((shellBit shell 0 && shellBit shell 2)) || ((rankAtom ranks 7 == rankAtom ranks 28)))) = true)
    (h0530 : ((!((shellBit shell 0 && shellBit shell 3)) || ((rankAtom ranks 7 == rankAtom ranks 37)))) = true)
    (h0531 : ((!((shellBit shell 0 && shellBit shell 4)) || ((rankAtom ranks 7 == rankAtom ranks 45)))) = true)
    (h0532 : ((!((shellBit shell 0 && shellBit shell 5)) || ((rankAtom ranks 7 == rankAtom ranks 52)))) = true)
    (h0533 : ((!((shellBit shell 0 && shellBit shell 6)) || ((rankAtom ranks 7 == rankAtom ranks 58)))) = true)
    (h0534 : ((!((shellBit shell 0 && shellBit shell 7)) || ((rankAtom ranks 7 == rankAtom ranks 63)))) = true)
    (h0535 : ((!((shellBit shell 1 && shellBit shell 2)) || ((rankAtom ranks 18 == rankAtom ranks 28)))) = true)
    (h0536 : ((!((shellBit shell 1 && shellBit shell 3)) || ((rankAtom ranks 18 == rankAtom ranks 37)))) = true)
    (h0537 : ((!((shellBit shell 1 && shellBit shell 4)) || ((rankAtom ranks 18 == rankAtom ranks 45)))) = true)
    (h0538 : ((!((shellBit shell 1 && shellBit shell 5)) || ((rankAtom ranks 18 == rankAtom ranks 52)))) = true)
    (h0539 : ((!((shellBit shell 1 && shellBit shell 6)) || ((rankAtom ranks 18 == rankAtom ranks 58)))) = true)
    (h0540 : ((!((shellBit shell 1 && shellBit shell 7)) || ((rankAtom ranks 18 == rankAtom ranks 63)))) = true)
    (h0541 : ((!((shellBit shell 1 && shellBit shell 9)) || ((rankAtom ranks 18 == rankAtom ranks 68)))) = true)
    (h0542 : ((!((shellBit shell 1 && shellBit shell 10)) || ((rankAtom ranks 18 == rankAtom ranks 69)))) = true)
    (h0543 : ((!((shellBit shell 1 && shellBit shell 11)) || ((rankAtom ranks 18 == rankAtom ranks 70)))) = true)
    (h0544 : ((!((shellBit shell 1 && shellBit shell 12)) || ((rankAtom ranks 18 == rankAtom ranks 71)))) = true)
    (h0545 : ((!((shellBit shell 2 && shellBit shell 3)) || ((rankAtom ranks 28 == rankAtom ranks 37)))) = true)
    (h0546 : ((!((shellBit shell 2 && shellBit shell 4)) || ((rankAtom ranks 28 == rankAtom ranks 45)))) = true)
    (h0547 : ((!((shellBit shell 2 && shellBit shell 5)) || ((rankAtom ranks 28 == rankAtom ranks 52)))) = true)
    (h0548 : ((!((shellBit shell 2 && shellBit shell 6)) || ((rankAtom ranks 28 == rankAtom ranks 58)))) = true)
    (h0549 : ((!((shellBit shell 2 && shellBit shell 7)) || ((rankAtom ranks 28 == rankAtom ranks 63)))) = true)
    (h0550 : ((!((shellBit shell 2 && shellBit shell 9)) || ((rankAtom ranks 28 == rankAtom ranks 68)))) = true)
    (h0551 : ((!((shellBit shell 2 && shellBit shell 10)) || ((rankAtom ranks 28 == rankAtom ranks 69)))) = true)
    (h0552 : ((!((shellBit shell 2 && shellBit shell 11)) || ((rankAtom ranks 28 == rankAtom ranks 70)))) = true)
    (h0553 : ((!((shellBit shell 2 && shellBit shell 12)) || ((rankAtom ranks 28 == rankAtom ranks 71)))) = true)
    (h0554 : ((!((shellBit shell 3 && shellBit shell 4)) || ((rankAtom ranks 37 == rankAtom ranks 45)))) = true)
    (h0555 : ((!((shellBit shell 3 && shellBit shell 5)) || ((rankAtom ranks 37 == rankAtom ranks 52)))) = true)
    (h0556 : ((!((shellBit shell 3 && shellBit shell 6)) || ((rankAtom ranks 37 == rankAtom ranks 58)))) = true)
    (h0557 : ((!((shellBit shell 3 && shellBit shell 7)) || ((rankAtom ranks 37 == rankAtom ranks 63)))) = true)
    (h0558 : ((!((shellBit shell 3 && shellBit shell 9)) || ((rankAtom ranks 37 == rankAtom ranks 68)))) = true)
    (h0559 : ((!((shellBit shell 3 && shellBit shell 10)) || ((rankAtom ranks 37 == rankAtom ranks 69)))) = true)
    (h0560 : ((!((shellBit shell 3 && shellBit shell 11)) || ((rankAtom ranks 37 == rankAtom ranks 70)))) = true)
    (h0561 : ((!((shellBit shell 3 && shellBit shell 12)) || ((rankAtom ranks 37 == rankAtom ranks 71)))) = true)
    (h0562 : ((!((shellBit shell 4 && shellBit shell 9)) || ((rankAtom ranks 45 == rankAtom ranks 68)))) = true)
    (h0563 : ((!((shellBit shell 4 && shellBit shell 11)) || ((rankAtom ranks 45 == rankAtom ranks 70)))) = true)
    (h0564 : ((!((shellBit shell 4 && shellBit shell 12)) || ((rankAtom ranks 45 == rankAtom ranks 71)))) = true)
    (h0565 : ((!((shellBit shell 5 && shellBit shell 7)) || ((rankAtom ranks 52 == rankAtom ranks 63)))) = true)
    (h0566 : ((!((shellBit shell 5 && shellBit shell 9)) || ((rankAtom ranks 52 == rankAtom ranks 68)))) = true)
    (h0567 : ((!((shellBit shell 5 && shellBit shell 10)) || ((rankAtom ranks 52 == rankAtom ranks 69)))) = true)
    (h0568 : ((!((shellBit shell 5 && shellBit shell 11)) || ((rankAtom ranks 52 == rankAtom ranks 70)))) = true)
    (h0569 : ((!((shellBit shell 5 && shellBit shell 12)) || ((rankAtom ranks 52 == rankAtom ranks 71)))) = true)
    (h0570 : ((!((shellBit shell 6 && shellBit shell 7)) || ((rankAtom ranks 58 == rankAtom ranks 63)))) = true)
    (h0571 : ((!((rankAtom ranks 1 == rankAtom ranks 4)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h0572 : ((!((rankAtom ranks 1 == rankAtom ranks 5)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h0573 : ((!((rankAtom ranks 1 == rankAtom ranks 6)) || ((rankAtom ranks 12).ult (rankAtom ranks 17)))) = true)
    (h0574 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 28).ult (rankAtom ranks 1)))) = true)
    (h0575 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 0).ult (rankAtom ranks 1)))) = true)
    (h0576 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 12).ult (rankAtom ranks 1)))) = true)
    (h0577 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 7).ult (rankAtom ranks 1)))) = true)
    (h0578 : ((!((rankAtom ranks 2 == rankAtom ranks 4)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h0579 : ((!((rankAtom ranks 2 == rankAtom ranks 5)) || ((rankAtom ranks 13).ult (rankAtom ranks 16)))) = true)
    (h0580 : ((!((rankAtom ranks 2 == rankAtom ranks 6)) || ((rankAtom ranks 13).ult (rankAtom ranks 17)))) = true)
    (h0581 : ((!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 37).ult (rankAtom ranks 2)))) = true)
    (h0582 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 0).ult (rankAtom ranks 2)))) = true)
    (h0583 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 13).ult (rankAtom ranks 2)))) = true)
    (h0584 : ((!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h0585 : ((!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h0586 : ((!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 14).ult (rankAtom ranks 17)))) = true)
    (h0587 : ((!((rankAtom ranks 3 == rankAtom ranks 7)) || ((rankAtom ranks 14).ult (rankAtom ranks 18)))) = true)
    (h0588 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 14).ult (rankAtom ranks 3)))) = true)
    (h0589 : ((!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 0).ult (rankAtom ranks 19)))) = true)
    (h0590 : ((!((rankAtom ranks 3 == rankAtom ranks 8)) || ((rankAtom ranks 14).ult (rankAtom ranks 19)))) = true)
    (h0591 : ((!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 0).ult (rankAtom ranks 20)))) = true)
    (h0592 : ((!((rankAtom ranks 3 == rankAtom ranks 9)) || ((rankAtom ranks 14).ult (rankAtom ranks 20)))) = true)
    (h0593 : ((!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 0).ult (rankAtom ranks 21)))) = true)
    (h0594 : ((!((rankAtom ranks 3 == rankAtom ranks 10)) || ((rankAtom ranks 14).ult (rankAtom ranks 21)))) = true)
    (h0595 : ((!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h0596 : ((!((rankAtom ranks 3 == rankAtom ranks 11)) || ((rankAtom ranks 14).ult (rankAtom ranks 22)))) = true)
    (h0597 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 50).ult (rankAtom ranks 16)))) = true)
    (h0598 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h0599 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 5).ult (rankAtom ranks 16)))) = true)
    (h0600 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 51).ult (rankAtom ranks 17)))) = true)
    (h0601 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 15).ult (rankAtom ranks 17)))) = true)
    (h0602 : ((!((rankAtom ranks 4 == rankAtom ranks 15)) || ((rankAtom ranks 6).ult (rankAtom ranks 17)))) = true)
    (h0603 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 52).ult (rankAtom ranks 18)))) = true)
    (h0604 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 15).ult (rankAtom ranks 18)))) = true)
    (h0605 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 15).ult (rankAtom ranks 4)))) = true)
    (h0606 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 53).ult (rankAtom ranks 19)))) = true)
    (h0607 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 15).ult (rankAtom ranks 19)))) = true)
    (h0608 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 54).ult (rankAtom ranks 20)))) = true)
    (h0609 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 15).ult (rankAtom ranks 20)))) = true)
    (h0610 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 55).ult (rankAtom ranks 21)))) = true)
    (h0611 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 15).ult (rankAtom ranks 21)))) = true)
    (h0612 : ((!((rankAtom ranks 4 == rankAtom ranks 0)) || ((rankAtom ranks 56).ult (rankAtom ranks 22)))) = true)
    (h0613 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 15).ult (rankAtom ranks 22)))) = true)
    (h0614 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 16).ult (rankAtom ranks 17)))) = true)
    (h0615 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 58).ult (rankAtom ranks 18)))) = true)
    (h0616 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 16).ult (rankAtom ranks 18)))) = true)
    (h0617 : ((!((rankAtom ranks 5 == rankAtom ranks 16)) || ((rankAtom ranks 7).ult (rankAtom ranks 18)))) = true)
    (h0618 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 16).ult (rankAtom ranks 5)))) = true)
    (h0619 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 59).ult (rankAtom ranks 19)))) = true)
    (h0620 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 16).ult (rankAtom ranks 19)))) = true)
    (h0621 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 60).ult (rankAtom ranks 20)))) = true)
    (h0622 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 16).ult (rankAtom ranks 20)))) = true)
    (h0623 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 61).ult (rankAtom ranks 21)))) = true)
    (h0624 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 16).ult (rankAtom ranks 21)))) = true)
    (h0625 : ((!((rankAtom ranks 5 == rankAtom ranks 0)) || ((rankAtom ranks 62).ult (rankAtom ranks 22)))) = true)
    (h0626 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 0).ult (rankAtom ranks 22)))) = true)
    (h0627 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 16).ult (rankAtom ranks 22)))) = true)
    (h0628 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 17).ult (rankAtom ranks 18)))) = true)
    (h0629 : ((!((rankAtom ranks 18 == rankAtom ranks 7)) || ((rankAtom ranks 17).ult (rankAtom ranks 6)))) = true)
    (h0630 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 17).ult (rankAtom ranks 19)))) = true)
    (h0631 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 65).ult (rankAtom ranks 20)))) = true)
    (h0632 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 17).ult (rankAtom ranks 20)))) = true)
    (h0633 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 66).ult (rankAtom ranks 21)))) = true)
    (h0634 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 17).ult (rankAtom ranks 21)))) = true)
    (h0635 : ((!((rankAtom ranks 6 == rankAtom ranks 0)) || ((rankAtom ranks 67).ult (rankAtom ranks 22)))) = true)
    (h0636 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 17).ult (rankAtom ranks 22)))) = true)
    (h0637 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 8).ult (rankAtom ranks 19)))) = true)
    (h0638 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 9).ult (rankAtom ranks 20)))) = true)
    (h0639 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 10).ult (rankAtom ranks 21)))) = true)
    (h0640 : ((!((rankAtom ranks 7 == rankAtom ranks 18)) || ((rankAtom ranks 11).ult (rankAtom ranks 22)))) = true)
    (h0641 : ((!((rankAtom ranks 2 == rankAtom ranks 4)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h0642 : ((!((rankAtom ranks 25 == rankAtom ranks 4)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h0643 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 4).ult (rankAtom ranks 2)))) = true)
    (h0644 : ((!((rankAtom ranks 2 == rankAtom ranks 5)) || ((rankAtom ranks 23).ult (rankAtom ranks 26)))) = true)
    (h0645 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 5).ult (rankAtom ranks 2)))) = true)
    (h0646 : ((!((rankAtom ranks 2 == rankAtom ranks 6)) || ((rankAtom ranks 23).ult (rankAtom ranks 27)))) = true)
    (h0647 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 6).ult (rankAtom ranks 2)))) = true)
    (h0648 : ((!((rankAtom ranks 28 == rankAtom ranks 1)) || ((rankAtom ranks 37).ult (rankAtom ranks 2)))) = true)
    (h0649 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 1).ult (rankAtom ranks 2)))) = true)
    (h0650 : ((!((rankAtom ranks 2 == rankAtom ranks 23)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0651 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 23).ult (rankAtom ranks 2)))) = true)
    (h0652 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 7).ult (rankAtom ranks 2)))) = true)
    (h0653 : ((!((rankAtom ranks 3 == rankAtom ranks 42)) || ((rankAtom ranks 1).ult (rankAtom ranks 25)))) = true)
    (h0654 : ((!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h0655 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h0656 : ((!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h0657 : ((!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 24).ult (rankAtom ranks 27)))) = true)
    (h0658 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 1).ult (rankAtom ranks 3)))) = true)
    (h0659 : ((!((rankAtom ranks 3 == rankAtom ranks 7)) || ((rankAtom ranks 24).ult (rankAtom ranks 28)))) = true)
    (h0660 : ((!((rankAtom ranks 3 == rankAtom ranks 24)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0661 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 24).ult (rankAtom ranks 3)))) = true)
    (h0662 : ((!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h0663 : ((!((rankAtom ranks 3 == rankAtom ranks 8)) || ((rankAtom ranks 24).ult (rankAtom ranks 29)))) = true)
    (h0664 : ((!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h0665 : ((!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h0666 : ((!((rankAtom ranks 3 == rankAtom ranks 10)) || ((rankAtom ranks 24).ult (rankAtom ranks 31)))) = true)
    (h0667 : ((!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h0668 : ((!((rankAtom ranks 3 == rankAtom ranks 11)) || ((rankAtom ranks 24).ult (rankAtom ranks 32)))) = true)
    (h0669 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h0670 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 1).ult (rankAtom ranks 26)))) = true)
    (h0671 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 1).ult (rankAtom ranks 4)))) = true)
    (h0672 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h0673 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 5).ult (rankAtom ranks 26)))) = true)
    (h0674 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 5).ult (rankAtom ranks 4)))) = true)
    (h0675 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h0676 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 1).ult (rankAtom ranks 27)))) = true)
    (h0677 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 25).ult (rankAtom ranks 27)))) = true)
    (h0678 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 6).ult (rankAtom ranks 27)))) = true)
    (h0679 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 6).ult (rankAtom ranks 4)))) = true)
    (h0680 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 52).ult (rankAtom ranks 28)))) = true)
    (h0681 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))) = true)
    (h0682 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 1).ult (rankAtom ranks 4)))) = true)
    (h0683 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 25).ult (rankAtom ranks 28)))) = true)
    (h0684 : ((!((rankAtom ranks 4 == rankAtom ranks 25)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0685 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 25).ult (rankAtom ranks 4)))) = true)
    (h0686 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 7).ult (rankAtom ranks 4)))) = true)
    (h0687 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 53).ult (rankAtom ranks 29)))) = true)
    (h0688 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h0689 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 25).ult (rankAtom ranks 29)))) = true)
    (h0690 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 54).ult (rankAtom ranks 30)))) = true)
    (h0691 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h0692 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 25).ult (rankAtom ranks 30)))) = true)
    (h0693 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 55).ult (rankAtom ranks 31)))) = true)
    (h0694 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h0695 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 25).ult (rankAtom ranks 31)))) = true)
    (h0696 : ((!((rankAtom ranks 4 == rankAtom ranks 1)) || ((rankAtom ranks 56).ult (rankAtom ranks 32)))) = true)
    (h0697 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h0698 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 25).ult (rankAtom ranks 32)))) = true)
    (h0699 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 1).ult (rankAtom ranks 27)))) = true)
    (h0700 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 26).ult (rankAtom ranks 27)))) = true)
    (h0701 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h0702 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 58).ult (rankAtom ranks 28)))) = true)
    (h0703 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 28)))) = true)
    (h0704 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 1).ult (rankAtom ranks 5)))) = true)
    (h0705 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 26).ult (rankAtom ranks 28)))) = true)
    (h0706 : ((!((rankAtom ranks 5 == rankAtom ranks 26)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0707 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 26).ult (rankAtom ranks 5)))) = true)
    (h0708 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 7).ult (rankAtom ranks 5)))) = true)
    (h0709 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 59).ult (rankAtom ranks 29)))) = true)
    (h0710 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 1).ult (rankAtom ranks 29)))) = true)
    (h0711 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 26).ult (rankAtom ranks 29)))) = true)
    (h0712 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 60).ult (rankAtom ranks 30)))) = true)
    (h0713 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 1).ult (rankAtom ranks 30)))) = true)
    (h0714 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 26).ult (rankAtom ranks 30)))) = true)
    (h0715 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 61).ult (rankAtom ranks 31)))) = true)
    (h0716 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 1).ult (rankAtom ranks 31)))) = true)
    (h0717 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 26).ult (rankAtom ranks 31)))) = true)
    (h0718 : ((!((rankAtom ranks 5 == rankAtom ranks 1)) || ((rankAtom ranks 62).ult (rankAtom ranks 32)))) = true)
    (h0719 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 1).ult (rankAtom ranks 32)))) = true)
    (h0720 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 26).ult (rankAtom ranks 32)))) = true)
    (h0721 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 1).ult (rankAtom ranks 6)))) = true)
    (h0722 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 27).ult (rankAtom ranks 28)))) = true)
    (h0723 : ((!((rankAtom ranks 6 == rankAtom ranks 27)) || ((rankAtom ranks 7).ult (rankAtom ranks 28)))) = true)
    (h0724 : ((!((rankAtom ranks 28 == rankAtom ranks 7)) || ((rankAtom ranks 27).ult (rankAtom ranks 6)))) = true)
    (h0725 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h0726 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 27).ult (rankAtom ranks 29)))) = true)
    (h0727 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 65).ult (rankAtom ranks 30)))) = true)
    (h0728 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 27).ult (rankAtom ranks 30)))) = true)
    (h0729 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 66).ult (rankAtom ranks 31)))) = true)
    (h0730 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 27).ult (rankAtom ranks 31)))) = true)
    (h0731 : ((!((rankAtom ranks 6 == rankAtom ranks 1)) || ((rankAtom ranks 67).ult (rankAtom ranks 32)))) = true)
    (h0732 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 27).ult (rankAtom ranks 32)))) = true)
    (h0733 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 8).ult (rankAtom ranks 29)))) = true)
    (h0734 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 9).ult (rankAtom ranks 30)))) = true)
    (h0735 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 10).ult (rankAtom ranks 31)))) = true)
    (h0736 : ((!((rankAtom ranks 7 == rankAtom ranks 28)) || ((rankAtom ranks 11).ult (rankAtom ranks 32)))) = true)
    (h0737 : ((!((rankAtom ranks 3 == rankAtom ranks 42)) || ((rankAtom ranks 2).ult (rankAtom ranks 34)))) = true)
    (h0738 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h0739 : ((!((rankAtom ranks 3 == rankAtom ranks 4)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h0740 : ((!((rankAtom ranks 3 == rankAtom ranks 43)) || ((rankAtom ranks 2).ult (rankAtom ranks 35)))) = true)
    (h0741 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h0742 : ((!((rankAtom ranks 3 == rankAtom ranks 5)) || ((rankAtom ranks 33).ult (rankAtom ranks 35)))) = true)
    (h0743 : ((!((rankAtom ranks 3 == rankAtom ranks 6)) || ((rankAtom ranks 33).ult (rankAtom ranks 36)))) = true)
    (h0744 : ((!((rankAtom ranks 3 == rankAtom ranks 33)) || ((rankAtom ranks 6).ult (rankAtom ranks 36)))) = true)
    (h0745 : ((!((rankAtom ranks 3 == rankAtom ranks 45)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h0746 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 2).ult (rankAtom ranks 3)))) = true)
    (h0747 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 33).ult (rankAtom ranks 3)))) = true)
    (h0748 : ((!((rankAtom ranks 3 == rankAtom ranks 46)) || ((rankAtom ranks 2).ult (rankAtom ranks 38)))) = true)
    (h0749 : ((!((rankAtom ranks 3 == rankAtom ranks 47)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h0750 : ((!((rankAtom ranks 3 == rankAtom ranks 48)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h0751 : ((!((rankAtom ranks 3 == rankAtom ranks 49)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h0752 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h0753 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 2).ult (rankAtom ranks 35)))) = true)
    (h0754 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h0755 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h0756 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 5).ult (rankAtom ranks 35)))) = true)
    (h0757 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 5).ult (rankAtom ranks 4)))) = true)
    (h0758 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h0759 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 2).ult (rankAtom ranks 36)))) = true)
    (h0760 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h0761 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 6).ult (rankAtom ranks 36)))) = true)
    (h0762 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h0763 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h0764 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 2).ult (rankAtom ranks 4)))) = true)
    (h0765 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h0766 : ((!((rankAtom ranks 4 == rankAtom ranks 34)) || ((rankAtom ranks 7).ult (rankAtom ranks 37)))) = true)
    (h0767 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 34).ult (rankAtom ranks 4)))) = true)
    (h0768 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 53).ult (rankAtom ranks 38)))) = true)
    (h0769 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 2).ult (rankAtom ranks 38)))) = true)
    (h0770 : ((!((rankAtom ranks 4 == rankAtom ranks 8)) || ((rankAtom ranks 34).ult (rankAtom ranks 38)))) = true)
    (h0771 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 54).ult (rankAtom ranks 39)))) = true)
    (h0772 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h0773 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 34).ult (rankAtom ranks 39)))) = true)
    (h0774 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 55).ult (rankAtom ranks 40)))) = true)
    (h0775 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h0776 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 34).ult (rankAtom ranks 40)))) = true)
    (h0777 : ((!((rankAtom ranks 4 == rankAtom ranks 2)) || ((rankAtom ranks 56).ult (rankAtom ranks 41)))) = true)
    (h0778 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h0779 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 34).ult (rankAtom ranks 41)))) = true)
    (h0780 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h0781 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 2).ult (rankAtom ranks 36)))) = true)
    (h0782 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true)
    (h0783 : ((!((rankAtom ranks 5 == rankAtom ranks 35)) || ((rankAtom ranks 6).ult (rankAtom ranks 36)))) = true)
    (h0784 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h0785 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h0786 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 2).ult (rankAtom ranks 5)))) = true)
    (h0787 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h0788 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 35).ult (rankAtom ranks 5)))) = true)
    (h0789 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 59).ult (rankAtom ranks 38)))) = true)
    (h0790 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 2).ult (rankAtom ranks 38)))) = true)
    (h0791 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 35).ult (rankAtom ranks 38)))) = true)
    (h0792 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 60).ult (rankAtom ranks 39)))) = true)
    (h0793 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h0794 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 35).ult (rankAtom ranks 39)))) = true)
    (h0795 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 61).ult (rankAtom ranks 40)))) = true)
    (h0796 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h0797 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 35).ult (rankAtom ranks 40)))) = true)
    (h0798 : ((!((rankAtom ranks 5 == rankAtom ranks 2)) || ((rankAtom ranks 62).ult (rankAtom ranks 41)))) = true)
    (h0799 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h0800 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 35).ult (rankAtom ranks 41)))) = true)
    (h0801 : ((!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 2).ult (rankAtom ranks 37)))) = true)
    (h0802 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 2).ult (rankAtom ranks 6)))) = true)
    (h0803 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h0804 : ((!((rankAtom ranks 37 == rankAtom ranks 7)) || ((rankAtom ranks 36).ult (rankAtom ranks 6)))) = true)
    (h0805 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 64).ult (rankAtom ranks 38)))) = true)
    (h0806 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 36).ult (rankAtom ranks 38)))) = true)
    (h0807 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 36).ult (rankAtom ranks 39)))) = true)
    (h0808 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 66).ult (rankAtom ranks 40)))) = true)
    (h0809 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 36).ult (rankAtom ranks 40)))) = true)
    (h0810 : ((!((rankAtom ranks 6 == rankAtom ranks 2)) || ((rankAtom ranks 67).ult (rankAtom ranks 41)))) = true)
    (h0811 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 36).ult (rankAtom ranks 41)))) = true)
    (h0812 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 8).ult (rankAtom ranks 38)))) = true)
    (h0813 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 9).ult (rankAtom ranks 39)))) = true)
    (h0814 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 10).ult (rankAtom ranks 40)))) = true)
    (h0815 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 11).ult (rankAtom ranks 41)))) = true)
    (h0816 : ((!((rankAtom ranks 8 == rankAtom ranks 9)) || ((rankAtom ranks 38).ult (rankAtom ranks 39)))) = true)
    (h0817 : ((!((rankAtom ranks 8 == rankAtom ranks 10)) || ((rankAtom ranks 38).ult (rankAtom ranks 40)))) = true)
    (h0818 : ((!((rankAtom ranks 9 == rankAtom ranks 10)) || ((rankAtom ranks 39).ult (rankAtom ranks 40)))) = true)
    (h0819 : ((!((rankAtom ranks 9 == rankAtom ranks 11)) || ((rankAtom ranks 39).ult (rankAtom ranks 41)))) = true)
    (h0820 : ((!((rankAtom ranks 10 == rankAtom ranks 11)) || ((rankAtom ranks 40).ult (rankAtom ranks 41)))) = true)
    (h0821 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h0822 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 3).ult (rankAtom ranks 43)))) = true)
    (h0823 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 3).ult (rankAtom ranks 4)))) = true)
    (h0824 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h0825 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 5).ult (rankAtom ranks 43)))) = true)
    (h0826 : ((!((rankAtom ranks 43 == rankAtom ranks 5)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h0827 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 5).ult (rankAtom ranks 4)))) = true)
    (h0828 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h0829 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 3).ult (rankAtom ranks 44)))) = true)
    (h0830 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h0831 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 6).ult (rankAtom ranks 44)))) = true)
    (h0832 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 6).ult (rankAtom ranks 4)))) = true)
    (h0833 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h0834 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 3).ult (rankAtom ranks 45)))) = true)
    (h0835 : ((!((rankAtom ranks 4 == rankAtom ranks 7)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h0836 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 7).ult (rankAtom ranks 45)))) = true)
    (h0837 : ((!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h0838 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h0839 : ((!((rankAtom ranks 4 == rankAtom ranks 53)) || ((rankAtom ranks 3).ult (rankAtom ranks 46)))) = true)
    (h0840 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 53).ult (rankAtom ranks 4)))) = true)
    (h0841 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 8).ult (rankAtom ranks 46)))) = true)
    (h0842 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 54).ult (rankAtom ranks 47)))) = true)
    (h0843 : ((!((rankAtom ranks 4 == rankAtom ranks 54)) || ((rankAtom ranks 3).ult (rankAtom ranks 47)))) = true)
    (h0844 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 54).ult (rankAtom ranks 4)))) = true)
    (h0845 : ((!((rankAtom ranks 4 == rankAtom ranks 9)) || ((rankAtom ranks 42).ult (rankAtom ranks 47)))) = true)
    (h0846 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 9).ult (rankAtom ranks 47)))) = true)
    (h0847 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 9).ult (rankAtom ranks 4)))) = true)
    (h0848 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 55).ult (rankAtom ranks 48)))) = true)
    (h0849 : ((!((rankAtom ranks 4 == rankAtom ranks 55)) || ((rankAtom ranks 3).ult (rankAtom ranks 48)))) = true)
    (h0850 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 55).ult (rankAtom ranks 4)))) = true)
    (h0851 : ((!((rankAtom ranks 4 == rankAtom ranks 10)) || ((rankAtom ranks 42).ult (rankAtom ranks 48)))) = true)
    (h0852 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 56).ult (rankAtom ranks 49)))) = true)
    (h0853 : ((!((rankAtom ranks 4 == rankAtom ranks 56)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h0854 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 56).ult (rankAtom ranks 4)))) = true)
    (h0855 : ((!((rankAtom ranks 4 == rankAtom ranks 11)) || ((rankAtom ranks 42).ult (rankAtom ranks 49)))) = true)
    (h0856 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 57).ult (rankAtom ranks 44)))) = true)
    (h0857 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 3).ult (rankAtom ranks 44)))) = true)
    (h0858 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h0859 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 6).ult (rankAtom ranks 44)))) = true)
    (h0860 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h0861 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 58).ult (rankAtom ranks 45)))) = true)
    (h0862 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 3).ult (rankAtom ranks 45)))) = true)
    (h0863 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h0864 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 7).ult (rankAtom ranks 45)))) = true)
    (h0865 : ((!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 43).ult (rankAtom ranks 5)))) = true)
    (h0866 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 59).ult (rankAtom ranks 46)))) = true)
    (h0867 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 3).ult (rankAtom ranks 46)))) = true)
    (h0868 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 59).ult (rankAtom ranks 5)))) = true)
    (h0869 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h0870 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 8).ult (rankAtom ranks 46)))) = true)
    (h0871 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 8).ult (rankAtom ranks 5)))) = true)
    (h0872 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 60).ult (rankAtom ranks 47)))) = true)
    (h0873 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 3).ult (rankAtom ranks 47)))) = true)
    (h0874 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 60).ult (rankAtom ranks 5)))) = true)
    (h0875 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h0876 : ((!((rankAtom ranks 5 == rankAtom ranks 43)) || ((rankAtom ranks 9).ult (rankAtom ranks 47)))) = true)
    (h0877 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 9).ult (rankAtom ranks 5)))) = true)
    (h0878 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 61).ult (rankAtom ranks 48)))) = true)
    (h0879 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 3).ult (rankAtom ranks 48)))) = true)
    (h0880 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 61).ult (rankAtom ranks 5)))) = true)
    (h0881 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 43).ult (rankAtom ranks 48)))) = true)
    (h0882 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 10).ult (rankAtom ranks 5)))) = true)
    (h0883 : ((!((rankAtom ranks 5 == rankAtom ranks 3)) || ((rankAtom ranks 62).ult (rankAtom ranks 49)))) = true)
    (h0884 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 3).ult (rankAtom ranks 49)))) = true)
    (h0885 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 62).ult (rankAtom ranks 5)))) = true)
    (h0886 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 43).ult (rankAtom ranks 49)))) = true)
    (h0887 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 11).ult (rankAtom ranks 5)))) = true)
    (h0888 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 63).ult (rankAtom ranks 45)))) = true)
    (h0889 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h0890 : ((!((rankAtom ranks 45 == rankAtom ranks 7)) || ((rankAtom ranks 44).ult (rankAtom ranks 6)))) = true)
    (h0891 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 64).ult (rankAtom ranks 46)))) = true)
    (h0892 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 64).ult (rankAtom ranks 6)))) = true)
    (h0893 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 44).ult (rankAtom ranks 46)))) = true)
    (h0894 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 8).ult (rankAtom ranks 6)))) = true)
    (h0895 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true)
    (h0896 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 44).ult (rankAtom ranks 47)))) = true)
    (h0897 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 9).ult (rankAtom ranks 6)))) = true)
    (h0898 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 66).ult (rankAtom ranks 48)))) = true)
    (h0899 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 66).ult (rankAtom ranks 6)))) = true)
    (h0900 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 44).ult (rankAtom ranks 48)))) = true)
    (h0901 : ((!((rankAtom ranks 6 == rankAtom ranks 3)) || ((rankAtom ranks 67).ult (rankAtom ranks 49)))) = true)
    (h0902 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h0903 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 44).ult (rankAtom ranks 49)))) = true)
    (h0904 : ((!((rankAtom ranks 46 == rankAtom ranks 3)) || ((rankAtom ranks 68).ult (rankAtom ranks 7)))) = true)
    (h0905 : ((!((rankAtom ranks 46 == rankAtom ranks 8)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h0906 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 8).ult (rankAtom ranks 7)))) = true)
    (h0907 : ((!((rankAtom ranks 47 == rankAtom ranks 3)) || ((rankAtom ranks 69).ult (rankAtom ranks 7)))) = true)
    (h0908 : ((!((rankAtom ranks 47 == rankAtom ranks 9)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h0909 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 9).ult (rankAtom ranks 7)))) = true)
    (h0910 : ((!((rankAtom ranks 48 == rankAtom ranks 3)) || ((rankAtom ranks 70).ult (rankAtom ranks 7)))) = true)
    (h0911 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 45).ult (rankAtom ranks 7)))) = true)
    (h0912 : ((!((rankAtom ranks 49 == rankAtom ranks 3)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h0913 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 11).ult (rankAtom ranks 7)))) = true)
    (h0914 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h0915 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 10).ult (rankAtom ranks 8)))) = true)
    (h0916 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 11).ult (rankAtom ranks 8)))) = true)
    (h0917 : ((!((rankAtom ranks 48 == rankAtom ranks 10)) || ((rankAtom ranks 47).ult (rankAtom ranks 9)))) = true)
    (h0918 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h0919 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 11).ult (rankAtom ranks 9)))) = true)
    (h0920 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h0921 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h0922 : ((!((rankAtom ranks 5 == rankAtom ranks 57)) || ((rankAtom ranks 4).ult (rankAtom ranks 51)))) = true)
    (h0923 : ((!((rankAtom ranks 5 == rankAtom ranks 6)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h0924 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 6).ult (rankAtom ranks 51)))) = true)
    (h0925 : ((!((rankAtom ranks 51 == rankAtom ranks 6)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h0926 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 6).ult (rankAtom ranks 5)))) = true)
    (h0927 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h0928 : ((!((rankAtom ranks 5 == rankAtom ranks 58)) || ((rankAtom ranks 4).ult (rankAtom ranks 52)))) = true)
    (h0929 : ((!((rankAtom ranks 5 == rankAtom ranks 7)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h0930 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 7).ult (rankAtom ranks 52)))) = true)
    (h0931 : ((!((rankAtom ranks 52 == rankAtom ranks 7)) || ((rankAtom ranks 50).ult (rankAtom ranks 5)))) = true)
    (h0932 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 7).ult (rankAtom ranks 5)))) = true)
    (h0933 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h0934 : ((!((rankAtom ranks 5 == rankAtom ranks 59)) || ((rankAtom ranks 4).ult (rankAtom ranks 53)))) = true)
    (h0935 : ((!((rankAtom ranks 5 == rankAtom ranks 8)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h0936 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 8).ult (rankAtom ranks 53)))) = true)
    (h0937 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h0938 : ((!((rankAtom ranks 5 == rankAtom ranks 60)) || ((rankAtom ranks 4).ult (rankAtom ranks 54)))) = true)
    (h0939 : ((!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 60).ult (rankAtom ranks 5)))) = true)
    (h0940 : ((!((rankAtom ranks 5 == rankAtom ranks 9)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h0941 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 9).ult (rankAtom ranks 54)))) = true)
    (h0942 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h0943 : ((!((rankAtom ranks 5 == rankAtom ranks 61)) || ((rankAtom ranks 4).ult (rankAtom ranks 55)))) = true)
    (h0944 : ((!((rankAtom ranks 55 == rankAtom ranks 4)) || ((rankAtom ranks 61).ult (rankAtom ranks 5)))) = true)
    (h0945 : ((!((rankAtom ranks 5 == rankAtom ranks 10)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h0946 : ((!((rankAtom ranks 5 == rankAtom ranks 50)) || ((rankAtom ranks 10).ult (rankAtom ranks 55)))) = true)
    (h0947 : ((!((rankAtom ranks 5 == rankAtom ranks 4)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h0948 : ((!((rankAtom ranks 5 == rankAtom ranks 62)) || ((rankAtom ranks 4).ult (rankAtom ranks 56)))) = true)
    (h0949 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 62).ult (rankAtom ranks 5)))) = true)
    (h0950 : ((!((rankAtom ranks 5 == rankAtom ranks 11)) || ((rankAtom ranks 50).ult (rankAtom ranks 56)))) = true)
    (h0951 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h0952 : ((!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 4).ult (rankAtom ranks 52)))) = true)
    (h0953 : ((!((rankAtom ranks 52 == rankAtom ranks 4)) || ((rankAtom ranks 63).ult (rankAtom ranks 6)))) = true)
    (h0954 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h0955 : ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 7).ult (rankAtom ranks 52)))) = true)
    (h0956 : ((!((rankAtom ranks 52 == rankAtom ranks 7)) || ((rankAtom ranks 51).ult (rankAtom ranks 6)))) = true)
    (h0957 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h0958 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h0959 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h0960 : ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 8).ult (rankAtom ranks 53)))) = true)
    (h0961 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h0962 : ((!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true)
    (h0963 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h0964 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 66).ult (rankAtom ranks 55)))) = true)
    (h0965 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h0966 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 56)))) = true)
    (h0967 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h0968 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h0969 : ((!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h0970 : ((!((rankAtom ranks 7 == rankAtom ranks 52)) || ((rankAtom ranks 8).ult (rankAtom ranks 53)))) = true)
    (h0971 : ((!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 71).ult (rankAtom ranks 56)))) = true)
    (h0972 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h0973 : ((!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 5).ult (rankAtom ranks 58)))) = true)
    (h0974 : ((!((rankAtom ranks 58 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 6)))) = true)
    (h0975 : ((!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h0976 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 58)))) = true)
    (h0977 : ((!((rankAtom ranks 58 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 6)))) = true)
    (h0978 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 6)))) = true)
    (h0979 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h0980 : ((!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h0981 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 8).ult (rankAtom ranks 59)))) = true)
    (h0982 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h0983 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h0984 : ((!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 9).ult (rankAtom ranks 60)))) = true)
    (h0985 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h0986 : ((!((rankAtom ranks 61 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 6)))) = true)
    (h0987 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h0988 : ((!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h0989 : ((!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h0990 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h0991 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h0992 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h0993 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h0994 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 10).ult (rankAtom ranks 7)))) = true)
    (h0995 : ((!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h0996 : ((!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h0997 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h0998 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h0999 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h1000 : ((!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 34).ult (rankAtom ranks 13)))) = true)
    (h1001 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 15).ult (rankAtom ranks 13)))) = true)
    (h1002 : ((!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 35).ult (rankAtom ranks 13)))) = true)
    (h1003 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 16).ult (rankAtom ranks 13)))) = true)
    (h1004 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 36).ult (rankAtom ranks 13)))) = true)
    (h1005 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 17).ult (rankAtom ranks 13)))) = true)
    (h1006 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 37).ult (rankAtom ranks 13)))) = true)
    (h1007 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 12).ult (rankAtom ranks 13)))) = true)
    (h1008 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 23).ult (rankAtom ranks 13)))) = true)
    (h1009 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 18).ult (rankAtom ranks 13)))) = true)
    (h1010 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 38).ult (rankAtom ranks 13)))) = true)
    (h1011 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 39).ult (rankAtom ranks 13)))) = true)
    (h1012 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 40).ult (rankAtom ranks 13)))) = true)
    (h1013 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 41).ult (rankAtom ranks 13)))) = true)
    (h1014 : ((!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 42).ult (rankAtom ranks 14)))) = true)
    (h1015 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h1016 : ((!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 43).ult (rankAtom ranks 14)))) = true)
    (h1017 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h1018 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 44).ult (rankAtom ranks 14)))) = true)
    (h1019 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 45).ult (rankAtom ranks 14)))) = true)
    (h1020 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h1021 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 24).ult (rankAtom ranks 14)))) = true)
    (h1022 : ((!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 18).ult (rankAtom ranks 14)))) = true)
    (h1023 : ((!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h1024 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 46).ult (rankAtom ranks 14)))) = true)
    (h1025 : ((!((rankAtom ranks 14 == rankAtom ranks 47)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h1026 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 47).ult (rankAtom ranks 14)))) = true)
    (h1027 : ((!((rankAtom ranks 14 == rankAtom ranks 48)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h1028 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 48).ult (rankAtom ranks 14)))) = true)
    (h1029 : ((!((rankAtom ranks 14 == rankAtom ranks 49)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h1030 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 49).ult (rankAtom ranks 14)))) = true)
    (h1031 : ((!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 12).ult (rankAtom ranks 26)))) = true)
    (h1032 : ((!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 50).ult (rankAtom ranks 15)))) = true)
    (h1033 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h1034 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 16).ult (rankAtom ranks 15)))) = true)
    (h1035 : ((!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 12).ult (rankAtom ranks 27)))) = true)
    (h1036 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 51).ult (rankAtom ranks 15)))) = true)
    (h1037 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 17).ult (rankAtom ranks 15)))) = true)
    (h1038 : ((!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 12).ult (rankAtom ranks 28)))) = true)
    (h1039 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 52).ult (rankAtom ranks 15)))) = true)
    (h1040 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h1041 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 25).ult (rankAtom ranks 15)))) = true)
    (h1042 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 18).ult (rankAtom ranks 15)))) = true)
    (h1043 : ((!((rankAtom ranks 15 == rankAtom ranks 53)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h1044 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 53).ult (rankAtom ranks 15)))) = true)
    (h1045 : ((!((rankAtom ranks 15 == rankAtom ranks 54)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h1046 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 54).ult (rankAtom ranks 15)))) = true)
    (h1047 : ((!((rankAtom ranks 15 == rankAtom ranks 55)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h1048 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 55).ult (rankAtom ranks 15)))) = true)
    (h1049 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 56).ult (rankAtom ranks 32)))) = true)
    (h1050 : ((!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h1051 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 56).ult (rankAtom ranks 15)))) = true)
    (h1052 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 12).ult (rankAtom ranks 27)))) = true)
    (h1053 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 57).ult (rankAtom ranks 16)))) = true)
    (h1054 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 17).ult (rankAtom ranks 16)))) = true)
    (h1055 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 58).ult (rankAtom ranks 16)))) = true)
    (h1056 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 12).ult (rankAtom ranks 16)))) = true)
    (h1057 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 26).ult (rankAtom ranks 16)))) = true)
    (h1058 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h1059 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h1060 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 59).ult (rankAtom ranks 16)))) = true)
    (h1061 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h1062 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 60).ult (rankAtom ranks 16)))) = true)
    (h1063 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h1064 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 61).ult (rankAtom ranks 16)))) = true)
    (h1065 : ((!((rankAtom ranks 16 == rankAtom ranks 12)) || ((rankAtom ranks 62).ult (rankAtom ranks 32)))) = true)
    (h1066 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h1067 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 62).ult (rankAtom ranks 16)))) = true)
    (h1068 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 63).ult (rankAtom ranks 17)))) = true)
    (h1069 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 12).ult (rankAtom ranks 17)))) = true)
    (h1070 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 27).ult (rankAtom ranks 17)))) = true)
    (h1071 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h1072 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true)
    (h1073 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h1074 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h1075 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h1076 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 68).ult (rankAtom ranks 29)))) = true)
    (h1077 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h1078 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 19).ult (rankAtom ranks 29)))) = true)
    (h1079 : ((!((rankAtom ranks 29 == rankAtom ranks 28)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h1080 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 69).ult (rankAtom ranks 30)))) = true)
    (h1081 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h1082 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 20).ult (rankAtom ranks 30)))) = true)
    (h1083 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 70).ult (rankAtom ranks 31)))) = true)
    (h1084 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h1085 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 21).ult (rankAtom ranks 31)))) = true)
    (h1086 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 71).ult (rankAtom ranks 32)))) = true)
    (h1087 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h1088 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 22).ult (rankAtom ranks 32)))) = true)
    (h1089 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h1090 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h1091 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h1092 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 33).ult (rankAtom ranks 14)))) = true)
    (h1093 : ((!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h1094 : ((!((rankAtom ranks 14 == rankAtom ranks 47)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h1095 : ((!((rankAtom ranks 14 == rankAtom ranks 48)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h1096 : ((!((rankAtom ranks 14 == rankAtom ranks 49)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h1097 : ((!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 13).ult (rankAtom ranks 35)))) = true)
    (h1098 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h1099 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 16).ult (rankAtom ranks 15)))) = true)
    (h1100 : ((!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 13).ult (rankAtom ranks 36)))) = true)
    (h1101 : ((!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 13).ult (rankAtom ranks 37)))) = true)
    (h1102 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h1103 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 34).ult (rankAtom ranks 15)))) = true)
    (h1104 : ((!((rankAtom ranks 15 == rankAtom ranks 53)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h1105 : ((!((rankAtom ranks 15 == rankAtom ranks 54)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h1106 : ((!((rankAtom ranks 15 == rankAtom ranks 55)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h1107 : ((!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h1108 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 13).ult (rankAtom ranks 36)))) = true)
    (h1109 : ((!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 13).ult (rankAtom ranks 37)))) = true)
    (h1110 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 13).ult (rankAtom ranks 16)))) = true)
    (h1111 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 35).ult (rankAtom ranks 16)))) = true)
    (h1112 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h1113 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h1114 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h1115 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h1116 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h1117 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 13).ult (rankAtom ranks 17)))) = true)
    (h1118 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 36).ult (rankAtom ranks 17)))) = true)
    (h1119 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h1120 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 19).ult (rankAtom ranks 38)))) = true)
    (h1121 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h1122 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 20).ult (rankAtom ranks 39)))) = true)
    (h1123 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h1124 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 21).ult (rankAtom ranks 40)))) = true)
    (h1125 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h1126 : ((!((rankAtom ranks 18 == rankAtom ranks 37)) || ((rankAtom ranks 22).ult (rankAtom ranks 41)))) = true)
    (h1127 : ((!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 14).ult (rankAtom ranks 43)))) = true)
    (h1128 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1129 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 16).ult (rankAtom ranks 43)))) = true)
    (h1130 : ((!((rankAtom ranks 43 == rankAtom ranks 16)) || ((rankAtom ranks 42).ult (rankAtom ranks 15)))) = true)
    (h1131 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 16).ult (rankAtom ranks 15)))) = true)
    (h1132 : ((!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 14).ult (rankAtom ranks 44)))) = true)
    (h1133 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 17).ult (rankAtom ranks 44)))) = true)
    (h1134 : ((!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 14).ult (rankAtom ranks 45)))) = true)
    (h1135 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 18).ult (rankAtom ranks 45)))) = true)
    (h1136 : ((!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 42).ult (rankAtom ranks 15)))) = true)
    (h1137 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 53).ult (rankAtom ranks 15)))) = true)
    (h1138 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1139 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 19).ult (rankAtom ranks 46)))) = true)
    (h1140 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 19).ult (rankAtom ranks 15)))) = true)
    (h1141 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 54).ult (rankAtom ranks 15)))) = true)
    (h1142 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1143 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 20).ult (rankAtom ranks 15)))) = true)
    (h1144 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 55).ult (rankAtom ranks 15)))) = true)
    (h1145 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1146 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 21).ult (rankAtom ranks 15)))) = true)
    (h1147 : ((!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h1148 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 56).ult (rankAtom ranks 15)))) = true)
    (h1149 : ((!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h1150 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 22).ult (rankAtom ranks 15)))) = true)
    (h1151 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 14).ult (rankAtom ranks 44)))) = true)
    (h1152 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 17).ult (rankAtom ranks 44)))) = true)
    (h1153 : ((!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 14).ult (rankAtom ranks 45)))) = true)
    (h1154 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 18).ult (rankAtom ranks 45)))) = true)
    (h1155 : ((!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 43).ult (rankAtom ranks 16)))) = true)
    (h1156 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 59).ult (rankAtom ranks 16)))) = true)
    (h1157 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 19).ult (rankAtom ranks 46)))) = true)
    (h1158 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 19).ult (rankAtom ranks 16)))) = true)
    (h1159 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 14).ult (rankAtom ranks 47)))) = true)
    (h1160 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 60).ult (rankAtom ranks 16)))) = true)
    (h1161 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 20).ult (rankAtom ranks 16)))) = true)
    (h1162 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 14).ult (rankAtom ranks 48)))) = true)
    (h1163 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 61).ult (rankAtom ranks 16)))) = true)
    (h1164 : ((!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h1165 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 21).ult (rankAtom ranks 16)))) = true)
    (h1166 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h1167 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 62).ult (rankAtom ranks 16)))) = true)
    (h1168 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 22).ult (rankAtom ranks 16)))) = true)
    (h1169 : ((!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 44).ult (rankAtom ranks 17)))) = true)
    (h1170 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true)
    (h1171 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true)
    (h1172 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h1173 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 20).ult (rankAtom ranks 17)))) = true)
    (h1174 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h1175 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 21).ult (rankAtom ranks 17)))) = true)
    (h1176 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h1177 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 19).ult (rankAtom ranks 46)))) = true)
    (h1178 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h1179 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 69).ult (rankAtom ranks 18)))) = true)
    (h1180 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 20).ult (rankAtom ranks 47)))) = true)
    (h1181 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 20).ult (rankAtom ranks 18)))) = true)
    (h1182 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 70).ult (rankAtom ranks 18)))) = true)
    (h1183 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 21).ult (rankAtom ranks 48)))) = true)
    (h1184 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 21).ult (rankAtom ranks 18)))) = true)
    (h1185 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h1186 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 71).ult (rankAtom ranks 18)))) = true)
    (h1187 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 22).ult (rankAtom ranks 49)))) = true)
    (h1188 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 22).ult (rankAtom ranks 18)))) = true)
    (h1189 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 20).ult (rankAtom ranks 19)))) = true)
    (h1190 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 21).ult (rankAtom ranks 19)))) = true)
    (h1191 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 22).ult (rankAtom ranks 19)))) = true)
    (h1192 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 21).ult (rankAtom ranks 20)))) = true)
    (h1193 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 22).ult (rankAtom ranks 20)))) = true)
    (h1194 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true)
    (h1195 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 15).ult (rankAtom ranks 51)))) = true)
    (h1196 : ((!((rankAtom ranks 51 == rankAtom ranks 15)) || ((rankAtom ranks 57).ult (rankAtom ranks 16)))) = true)
    (h1197 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 17).ult (rankAtom ranks 51)))) = true)
    (h1198 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 17).ult (rankAtom ranks 16)))) = true)
    (h1199 : ((!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 15).ult (rankAtom ranks 52)))) = true)
    (h1200 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 15).ult (rankAtom ranks 16)))) = true)
    (h1201 : ((!((rankAtom ranks 16 == rankAtom ranks 18)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h1202 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 18).ult (rankAtom ranks 52)))) = true)
    (h1203 : ((!((rankAtom ranks 52 == rankAtom ranks 18)) || ((rankAtom ranks 50).ult (rankAtom ranks 16)))) = true)
    (h1204 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h1205 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 15).ult (rankAtom ranks 53)))) = true)
    (h1206 : ((!((rankAtom ranks 53 == rankAtom ranks 15)) || ((rankAtom ranks 59).ult (rankAtom ranks 16)))) = true)
    (h1207 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 19).ult (rankAtom ranks 53)))) = true)
    (h1208 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 19).ult (rankAtom ranks 16)))) = true)
    (h1209 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 15).ult (rankAtom ranks 54)))) = true)
    (h1210 : ((!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 60).ult (rankAtom ranks 16)))) = true)
    (h1211 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 20).ult (rankAtom ranks 54)))) = true)
    (h1212 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 15).ult (rankAtom ranks 55)))) = true)
    (h1213 : ((!((rankAtom ranks 55 == rankAtom ranks 15)) || ((rankAtom ranks 61).ult (rankAtom ranks 16)))) = true)
    (h1214 : ((!((rankAtom ranks 16 == rankAtom ranks 50)) || ((rankAtom ranks 21).ult (rankAtom ranks 55)))) = true)
    (h1215 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 15).ult (rankAtom ranks 56)))) = true)
    (h1216 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 62).ult (rankAtom ranks 16)))) = true)
    (h1217 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 15).ult (rankAtom ranks 17)))) = true)
    (h1218 : ((!((rankAtom ranks 52 == rankAtom ranks 18)) || ((rankAtom ranks 51).ult (rankAtom ranks 17)))) = true)
    (h1219 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h1220 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true)
    (h1221 : ((!((rankAtom ranks 54 == rankAtom ranks 15)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h1222 : ((!((rankAtom ranks 56 == rankAtom ranks 15)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h1223 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 15).ult (rankAtom ranks 53)))) = true)
    (h1224 : ((!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 19).ult (rankAtom ranks 53)))) = true)
    (h1225 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h1226 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 15).ult (rankAtom ranks 54)))) = true)
    (h1227 : ((!((rankAtom ranks 18 == rankAtom ranks 52)) || ((rankAtom ranks 20).ult (rankAtom ranks 54)))) = true)
    (h1228 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 20).ult (rankAtom ranks 18)))) = true)
    (h1229 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 15).ult (rankAtom ranks 55)))) = true)
    (h1230 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 15).ult (rankAtom ranks 56)))) = true)
    (h1231 : ((!((rankAtom ranks 58 == rankAtom ranks 63)) || ((rankAtom ranks 16).ult (rankAtom ranks 17)))) = true)
    (h1232 : ((!((rankAtom ranks 58 == rankAtom ranks 18)) || ((rankAtom ranks 57).ult (rankAtom ranks 17)))) = true)
    (h1233 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h1234 : ((!((rankAtom ranks 59 == rankAtom ranks 16)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true)
    (h1235 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true)
    (h1236 : ((!((rankAtom ranks 60 == rankAtom ranks 16)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h1237 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 20).ult (rankAtom ranks 17)))) = true)
    (h1238 : ((!((rankAtom ranks 61 == rankAtom ranks 16)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h1239 : ((!((rankAtom ranks 62 == rankAtom ranks 16)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h1240 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 16).ult (rankAtom ranks 59)))) = true)
    (h1241 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 19).ult (rankAtom ranks 59)))) = true)
    (h1242 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 16).ult (rankAtom ranks 60)))) = true)
    (h1243 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 20).ult (rankAtom ranks 60)))) = true)
    (h1244 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 16).ult (rankAtom ranks 61)))) = true)
    (h1245 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 21).ult (rankAtom ranks 61)))) = true)
    (h1246 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 21).ult (rankAtom ranks 18)))) = true)
    (h1247 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 16).ult (rankAtom ranks 62)))) = true)
    (h1248 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 17).ult (rankAtom ranks 64)))) = true)
    (h1249 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 19).ult (rankAtom ranks 64)))) = true)
    (h1250 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 17).ult (rankAtom ranks 65)))) = true)
    (h1251 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 20).ult (rankAtom ranks 65)))) = true)
    (h1252 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 17).ult (rankAtom ranks 66)))) = true)
    (h1253 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 21).ult (rankAtom ranks 66)))) = true)
    (h1254 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 17).ult (rankAtom ranks 67)))) = true)
    (h1255 : ((!((rankAtom ranks 24 == rankAtom ranks 42)) || ((rankAtom ranks 23).ult (rankAtom ranks 34)))) = true)
    (h1256 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h1257 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h1258 : ((!((rankAtom ranks 35 == rankAtom ranks 23)) || ((rankAtom ranks 43).ult (rankAtom ranks 24)))) = true)
    (h1259 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h1260 : ((!((rankAtom ranks 24 == rankAtom ranks 44)) || ((rankAtom ranks 23).ult (rankAtom ranks 36)))) = true)
    (h1261 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 45).ult (rankAtom ranks 24)))) = true)
    (h1262 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h1263 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 33).ult (rankAtom ranks 24)))) = true)
    (h1264 : ((!((rankAtom ranks 24 == rankAtom ranks 46)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h1265 : ((!((rankAtom ranks 24 == rankAtom ranks 47)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h1266 : ((!((rankAtom ranks 24 == rankAtom ranks 48)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h1267 : ((!((rankAtom ranks 24 == rankAtom ranks 49)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h1268 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h1269 : ((!((rankAtom ranks 25 == rankAtom ranks 50)) || ((rankAtom ranks 23).ult (rankAtom ranks 35)))) = true)
    (h1270 : ((!((rankAtom ranks 35 == rankAtom ranks 23)) || ((rankAtom ranks 50).ult (rankAtom ranks 25)))) = true)
    (h1271 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h1272 : ((!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h1273 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 26).ult (rankAtom ranks 25)))) = true)
    (h1274 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h1275 : ((!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 23).ult (rankAtom ranks 36)))) = true)
    (h1276 : ((!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h1277 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h1278 : ((!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 37)))) = true)
    (h1279 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 52).ult (rankAtom ranks 25)))) = true)
    (h1280 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h1281 : ((!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h1282 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 25)))) = true)
    (h1283 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 53).ult (rankAtom ranks 38)))) = true)
    (h1284 : ((!((rankAtom ranks 25 == rankAtom ranks 53)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h1285 : ((!((rankAtom ranks 25 == rankAtom ranks 29)) || ((rankAtom ranks 34).ult (rankAtom ranks 38)))) = true)
    (h1286 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 54).ult (rankAtom ranks 39)))) = true)
    (h1287 : ((!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h1288 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 55).ult (rankAtom ranks 40)))) = true)
    (h1289 : ((!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h1290 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 56).ult (rankAtom ranks 41)))) = true)
    (h1291 : ((!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h1292 : ((!((rankAtom ranks 25 == rankAtom ranks 32)) || ((rankAtom ranks 34).ult (rankAtom ranks 41)))) = true)
    (h1293 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h1294 : ((!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 23).ult (rankAtom ranks 36)))) = true)
    (h1295 : ((!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true)
    (h1296 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h1297 : ((!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 37)))) = true)
    (h1298 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 26)))) = true)
    (h1299 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 26)))) = true)
    (h1300 : ((!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h1301 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 26)))) = true)
    (h1302 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 28).ult (rankAtom ranks 26)))) = true)
    (h1303 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 59).ult (rankAtom ranks 38)))) = true)
    (h1304 : ((!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h1305 : ((!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 35).ult (rankAtom ranks 38)))) = true)
    (h1306 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 60).ult (rankAtom ranks 39)))) = true)
    (h1307 : ((!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h1308 : ((!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 35).ult (rankAtom ranks 39)))) = true)
    (h1309 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 61).ult (rankAtom ranks 40)))) = true)
    (h1310 : ((!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h1311 : ((!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 35).ult (rankAtom ranks 40)))) = true)
    (h1312 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 62).ult (rankAtom ranks 41)))) = true)
    (h1313 : ((!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h1314 : ((!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 35).ult (rankAtom ranks 41)))) = true)
    (h1315 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 37)))) = true)
    (h1316 : ((!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 27)))) = true)
    (h1317 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 23).ult (rankAtom ranks 27)))) = true)
    (h1318 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h1319 : ((!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 27)))) = true)
    (h1320 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 64).ult (rankAtom ranks 38)))) = true)
    (h1321 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 36).ult (rankAtom ranks 38)))) = true)
    (h1322 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 65).ult (rankAtom ranks 39)))) = true)
    (h1323 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 36).ult (rankAtom ranks 39)))) = true)
    (h1324 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 66).ult (rankAtom ranks 40)))) = true)
    (h1325 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 36).ult (rankAtom ranks 40)))) = true)
    (h1326 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 67).ult (rankAtom ranks 41)))) = true)
    (h1327 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 36).ult (rankAtom ranks 41)))) = true)
    (h1328 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 68).ult (rankAtom ranks 38)))) = true)
    (h1329 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 23).ult (rankAtom ranks 38)))) = true)
    (h1330 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 37).ult (rankAtom ranks 38)))) = true)
    (h1331 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 29).ult (rankAtom ranks 38)))) = true)
    (h1332 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 69).ult (rankAtom ranks 39)))) = true)
    (h1333 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 23).ult (rankAtom ranks 39)))) = true)
    (h1334 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 37).ult (rankAtom ranks 39)))) = true)
    (h1335 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 30).ult (rankAtom ranks 39)))) = true)
    (h1336 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 70).ult (rankAtom ranks 40)))) = true)
    (h1337 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 23).ult (rankAtom ranks 40)))) = true)
    (h1338 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 37).ult (rankAtom ranks 40)))) = true)
    (h1339 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 31).ult (rankAtom ranks 40)))) = true)
    (h1340 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 71).ult (rankAtom ranks 41)))) = true)
    (h1341 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 23).ult (rankAtom ranks 41)))) = true)
    (h1342 : ((!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 37).ult (rankAtom ranks 41)))) = true)
    (h1343 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 32).ult (rankAtom ranks 41)))) = true)
    (h1344 : ((!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 38).ult (rankAtom ranks 39)))) = true)
    (h1345 : ((!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 38).ult (rankAtom ranks 40)))) = true)
    (h1346 : ((!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 38).ult (rankAtom ranks 41)))) = true)
    (h1347 : ((!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 39).ult (rankAtom ranks 40)))) = true)
    (h1348 : ((!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 39).ult (rankAtom ranks 41)))) = true)
    (h1349 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 40).ult (rankAtom ranks 41)))) = true)
    (h1350 : ((!((rankAtom ranks 25 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 43)))) = true)
    (h1351 : ((!((rankAtom ranks 43 == rankAtom ranks 24)) || ((rankAtom ranks 50).ult (rankAtom ranks 25)))) = true)
    (h1352 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1353 : ((!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h1354 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 43)))) = true)
    (h1355 : ((!((rankAtom ranks 43 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h1356 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 25)))) = true)
    (h1357 : ((!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 44)))) = true)
    (h1358 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1359 : ((!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h1360 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 27).ult (rankAtom ranks 44)))) = true)
    (h1361 : ((!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 24).ult (rankAtom ranks 45)))) = true)
    (h1362 : ((!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h1363 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 28).ult (rankAtom ranks 45)))) = true)
    (h1364 : ((!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h1365 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 53).ult (rankAtom ranks 25)))) = true)
    (h1366 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1367 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 46)))) = true)
    (h1368 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 25)))) = true)
    (h1369 : ((!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 47)))) = true)
    (h1370 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 54).ult (rankAtom ranks 25)))) = true)
    (h1371 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1372 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h1373 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 25)))) = true)
    (h1374 : ((!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 48)))) = true)
    (h1375 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 55).ult (rankAtom ranks 25)))) = true)
    (h1376 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1377 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 31).ult (rankAtom ranks 25)))) = true)
    (h1378 : ((!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true)
    (h1379 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 56).ult (rankAtom ranks 25)))) = true)
    (h1380 : ((!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h1381 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 32).ult (rankAtom ranks 25)))) = true)
    (h1382 : ((!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 24).ult (rankAtom ranks 44)))) = true)
    (h1383 : ((!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h1384 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 27).ult (rankAtom ranks 44)))) = true)
    (h1385 : ((!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 24).ult (rankAtom ranks 45)))) = true)
    (h1386 : ((!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h1387 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 28).ult (rankAtom ranks 45)))) = true)
    (h1388 : ((!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 26)))) = true)
    (h1389 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 59).ult (rankAtom ranks 26)))) = true)
    (h1390 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h1391 : ((!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h1392 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 46)))) = true)
    (h1393 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 26)))) = true)
    (h1394 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 60).ult (rankAtom ranks 26)))) = true)
    (h1395 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h1396 : ((!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h1397 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h1398 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 26)))) = true)
    (h1399 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 61).ult (rankAtom ranks 26)))) = true)
    (h1400 : ((!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 43).ult (rankAtom ranks 48)))) = true)
    (h1401 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 48)))) = true)
    (h1402 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 26)))) = true)
    (h1403 : ((!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true)
    (h1404 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 62).ult (rankAtom ranks 26)))) = true)
    (h1405 : ((!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 43).ult (rankAtom ranks 49)))) = true)
    (h1406 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h1407 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 26)))) = true)
    (h1408 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h1409 : ((!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 44).ult (rankAtom ranks 27)))) = true)
    (h1410 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 64).ult (rankAtom ranks 27)))) = true)
    (h1411 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 29).ult (rankAtom ranks 27)))) = true)
    (h1412 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 65).ult (rankAtom ranks 27)))) = true)
    (h1413 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 30).ult (rankAtom ranks 27)))) = true)
    (h1414 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 66).ult (rankAtom ranks 27)))) = true)
    (h1415 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 44).ult (rankAtom ranks 48)))) = true)
    (h1416 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 31).ult (rankAtom ranks 27)))) = true)
    (h1417 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 67).ult (rankAtom ranks 27)))) = true)
    (h1418 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 44).ult (rankAtom ranks 49)))) = true)
    (h1419 : ((!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h1420 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 45).ult (rankAtom ranks 46)))) = true)
    (h1421 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 29).ult (rankAtom ranks 46)))) = true)
    (h1422 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h1423 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 69).ult (rankAtom ranks 28)))) = true)
    (h1424 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 45).ult (rankAtom ranks 47)))) = true)
    (h1425 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h1426 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 30).ult (rankAtom ranks 28)))) = true)
    (h1427 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 70).ult (rankAtom ranks 28)))) = true)
    (h1428 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 45).ult (rankAtom ranks 48)))) = true)
    (h1429 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 31).ult (rankAtom ranks 48)))) = true)
    (h1430 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 31).ult (rankAtom ranks 28)))) = true)
    (h1431 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 71).ult (rankAtom ranks 28)))) = true)
    (h1432 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h1433 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 32).ult (rankAtom ranks 28)))) = true)
    (h1434 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 30).ult (rankAtom ranks 29)))) = true)
    (h1435 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 31).ult (rankAtom ranks 29)))) = true)
    (h1436 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 32).ult (rankAtom ranks 29)))) = true)
    (h1437 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 31).ult (rankAtom ranks 30)))) = true)
    (h1438 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 32).ult (rankAtom ranks 30)))) = true)
    (h1439 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 32).ult (rankAtom ranks 31)))) = true)
    (h1440 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h1441 : ((!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 25).ult (rankAtom ranks 51)))) = true)
    (h1442 : ((!((rankAtom ranks 51 == rankAtom ranks 25)) || ((rankAtom ranks 57).ult (rankAtom ranks 26)))) = true)
    (h1443 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h1444 : ((!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h1445 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 27).ult (rankAtom ranks 51)))) = true)
    (h1446 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 27).ult (rankAtom ranks 26)))) = true)
    (h1447 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h1448 : ((!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 25).ult (rankAtom ranks 52)))) = true)
    (h1449 : ((!((rankAtom ranks 52 == rankAtom ranks 25)) || ((rankAtom ranks 58).ult (rankAtom ranks 26)))) = true)
    (h1450 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h1451 : ((!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h1452 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 28).ult (rankAtom ranks 52)))) = true)
    (h1453 : ((!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h1454 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 28).ult (rankAtom ranks 26)))) = true)
    (h1455 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h1456 : ((!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 25).ult (rankAtom ranks 53)))) = true)
    (h1457 : ((!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 59).ult (rankAtom ranks 26)))) = true)
    (h1458 : ((!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h1459 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 29).ult (rankAtom ranks 53)))) = true)
    (h1460 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 29).ult (rankAtom ranks 26)))) = true)
    (h1461 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h1462 : ((!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 25).ult (rankAtom ranks 54)))) = true)
    (h1463 : ((!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 60).ult (rankAtom ranks 26)))) = true)
    (h1464 : ((!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h1465 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 30).ult (rankAtom ranks 54)))) = true)
    (h1466 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 30).ult (rankAtom ranks 26)))) = true)
    (h1467 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h1468 : ((!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 25).ult (rankAtom ranks 55)))) = true)
    (h1469 : ((!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 61).ult (rankAtom ranks 26)))) = true)
    (h1470 : ((!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h1471 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 55)))) = true)
    (h1472 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 26)))) = true)
    (h1473 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h1474 : ((!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 25).ult (rankAtom ranks 56)))) = true)
    (h1475 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 26)))) = true)
    (h1476 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 56)))) = true)
    (h1477 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 26)))) = true)
    (h1478 : ((!((rankAtom ranks 52 == rankAtom ranks 25)) || ((rankAtom ranks 63).ult (rankAtom ranks 27)))) = true)
    (h1479 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 25).ult (rankAtom ranks 27)))) = true)
    (h1480 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h1481 : ((!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h1482 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 28).ult (rankAtom ranks 27)))) = true)
    (h1483 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h1484 : ((!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 27)))) = true)
    (h1485 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h1486 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 29).ult (rankAtom ranks 27)))) = true)
    (h1487 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h1488 : ((!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 27)))) = true)
    (h1489 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h1490 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 30).ult (rankAtom ranks 27)))) = true)
    (h1491 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 55)))) = true)
    (h1492 : ((!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 27)))) = true)
    (h1493 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h1494 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 31).ult (rankAtom ranks 27)))) = true)
    (h1495 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 56)))) = true)
    (h1496 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 27)))) = true)
    (h1497 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h1498 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h1499 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h1500 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 25).ult (rankAtom ranks 53)))) = true)
    (h1501 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h1502 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 53)))) = true)
    (h1503 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h1504 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 69).ult (rankAtom ranks 54)))) = true)
    (h1505 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 25).ult (rankAtom ranks 54)))) = true)
    (h1506 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h1507 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 54)))) = true)
    (h1508 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 28)))) = true)
    (h1509 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 70).ult (rankAtom ranks 55)))) = true)
    (h1510 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 25).ult (rankAtom ranks 55)))) = true)
    (h1511 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 52).ult (rankAtom ranks 55)))) = true)
    (h1512 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 55)))) = true)
    (h1513 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 28)))) = true)
    (h1514 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 71).ult (rankAtom ranks 56)))) = true)
    (h1515 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 25).ult (rankAtom ranks 56)))) = true)
    (h1516 : ((!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 52).ult (rankAtom ranks 56)))) = true)
    (h1517 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h1518 : ((!((rankAtom ranks 58 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 27)))) = true)
    (h1519 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h1520 : ((!((rankAtom ranks 27 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 58)))) = true)
    (h1521 : ((!((rankAtom ranks 58 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 27)))) = true)
    (h1522 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 27)))) = true)
    (h1523 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h1524 : ((!((rankAtom ranks 59 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 27)))) = true)
    (h1525 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h1526 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 29).ult (rankAtom ranks 27)))) = true)
    (h1527 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h1528 : ((!((rankAtom ranks 60 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 27)))) = true)
    (h1529 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h1530 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 30).ult (rankAtom ranks 27)))) = true)
    (h1531 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h1532 : ((!((rankAtom ranks 61 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 27)))) = true)
    (h1533 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h1534 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 31).ult (rankAtom ranks 27)))) = true)
    (h1535 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h1536 : ((!((rankAtom ranks 62 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 27)))) = true)
    (h1537 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h1538 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h1539 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 26).ult (rankAtom ranks 59)))) = true)
    (h1540 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h1541 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 59)))) = true)
    (h1542 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h1543 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h1544 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 26).ult (rankAtom ranks 60)))) = true)
    (h1545 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h1546 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 60)))) = true)
    (h1547 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 28)))) = true)
    (h1548 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h1549 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 26).ult (rankAtom ranks 61)))) = true)
    (h1550 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 61)))) = true)
    (h1551 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 28)))) = true)
    (h1552 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h1553 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 26).ult (rankAtom ranks 62)))) = true)
    (h1554 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 62)))) = true)
    (h1555 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 28)))) = true)
    (h1556 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h1557 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 27).ult (rankAtom ranks 64)))) = true)
    (h1558 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 29).ult (rankAtom ranks 64)))) = true)
    (h1559 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h1560 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 27).ult (rankAtom ranks 65)))) = true)
    (h1561 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 30).ult (rankAtom ranks 65)))) = true)
    (h1562 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h1563 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 27).ult (rankAtom ranks 66)))) = true)
    (h1564 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 31).ult (rankAtom ranks 66)))) = true)
    (h1565 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h1566 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 27).ult (rankAtom ranks 67)))) = true)
    (h1567 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 32).ult (rankAtom ranks 67)))) = true)
    (h1568 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h1569 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 43)))) = true)
    (h1570 : ((!((rankAtom ranks 43 == rankAtom ranks 35)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h1571 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 34)))) = true)
    (h1572 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 44)))) = true)
    (h1573 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 34)))) = true)
    (h1574 : ((!((rankAtom ranks 34 == rankAtom ranks 52)) || ((rankAtom ranks 33).ult (rankAtom ranks 45)))) = true)
    (h1575 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 37).ult (rankAtom ranks 45)))) = true)
    (h1576 : ((!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h1577 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 53).ult (rankAtom ranks 34)))) = true)
    (h1578 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h1579 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 34)))) = true)
    (h1580 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 54).ult (rankAtom ranks 34)))) = true)
    (h1581 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h1582 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 34)))) = true)
    (h1583 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 55).ult (rankAtom ranks 34)))) = true)
    (h1584 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h1585 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 34)))) = true)
    (h1586 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 56).ult (rankAtom ranks 34)))) = true)
    (h1587 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h1588 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 34)))) = true)
    (h1589 : ((!((rankAtom ranks 35 == rankAtom ranks 57)) || ((rankAtom ranks 33).ult (rankAtom ranks 44)))) = true)
    (h1590 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 44)))) = true)
    (h1591 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 35)))) = true)
    (h1592 : ((!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h1593 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 37).ult (rankAtom ranks 45)))) = true)
    (h1594 : ((!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h1595 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 59).ult (rankAtom ranks 35)))) = true)
    (h1596 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h1597 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 35)))) = true)
    (h1598 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 60).ult (rankAtom ranks 35)))) = true)
    (h1599 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h1600 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 35)))) = true)
    (h1601 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 61).ult (rankAtom ranks 35)))) = true)
    (h1602 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h1603 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 40).ult (rankAtom ranks 35)))) = true)
    (h1604 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 62).ult (rankAtom ranks 35)))) = true)
    (h1605 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h1606 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 41).ult (rankAtom ranks 35)))) = true)
    (h1607 : ((!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 44).ult (rankAtom ranks 36)))) = true)
    (h1608 : ((!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 64).ult (rankAtom ranks 36)))) = true)
    (h1609 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 38).ult (rankAtom ranks 36)))) = true)
    (h1610 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 65).ult (rankAtom ranks 36)))) = true)
    (h1611 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 39).ult (rankAtom ranks 36)))) = true)
    (h1612 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 66).ult (rankAtom ranks 36)))) = true)
    (h1613 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 40).ult (rankAtom ranks 36)))) = true)
    (h1614 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 67).ult (rankAtom ranks 36)))) = true)
    (h1615 : ((!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 41).ult (rankAtom ranks 36)))) = true)
    (h1616 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 38).ult (rankAtom ranks 46)))) = true)
    (h1617 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 38).ult (rankAtom ranks 37)))) = true)
    (h1618 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h1619 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 39).ult (rankAtom ranks 37)))) = true)
    (h1620 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h1621 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 40).ult (rankAtom ranks 37)))) = true)
    (h1622 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 71).ult (rankAtom ranks 37)))) = true)
    (h1623 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h1624 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 41).ult (rankAtom ranks 37)))) = true)
    (h1625 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 39).ult (rankAtom ranks 38)))) = true)
    (h1626 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 40).ult (rankAtom ranks 38)))) = true)
    (h1627 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 41).ult (rankAtom ranks 38)))) = true)
    (h1628 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 40).ult (rankAtom ranks 39)))) = true)
    (h1629 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 41).ult (rankAtom ranks 39)))) = true)
    (h1630 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 41).ult (rankAtom ranks 40)))) = true)
    (h1631 : ((!((rankAtom ranks 35 == rankAtom ranks 57)) || ((rankAtom ranks 34).ult (rankAtom ranks 51)))) = true)
    (h1632 : ((!((rankAtom ranks 51 == rankAtom ranks 34)) || ((rankAtom ranks 57).ult (rankAtom ranks 35)))) = true)
    (h1633 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 36).ult (rankAtom ranks 51)))) = true)
    (h1634 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 36).ult (rankAtom ranks 35)))) = true)
    (h1635 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h1636 : ((!((rankAtom ranks 35 == rankAtom ranks 58)) || ((rankAtom ranks 34).ult (rankAtom ranks 52)))) = true)
    (h1637 : ((!((rankAtom ranks 52 == rankAtom ranks 34)) || ((rankAtom ranks 58).ult (rankAtom ranks 35)))) = true)
    (h1638 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h1639 : ((!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h1640 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 37).ult (rankAtom ranks 52)))) = true)
    (h1641 : ((!((rankAtom ranks 52 == rankAtom ranks 37)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h1642 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 37).ult (rankAtom ranks 35)))) = true)
    (h1643 : ((!((rankAtom ranks 35 == rankAtom ranks 59)) || ((rankAtom ranks 34).ult (rankAtom ranks 53)))) = true)
    (h1644 : ((!((rankAtom ranks 53 == rankAtom ranks 34)) || ((rankAtom ranks 59).ult (rankAtom ranks 35)))) = true)
    (h1645 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 38).ult (rankAtom ranks 53)))) = true)
    (h1646 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 38).ult (rankAtom ranks 35)))) = true)
    (h1647 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h1648 : ((!((rankAtom ranks 35 == rankAtom ranks 60)) || ((rankAtom ranks 34).ult (rankAtom ranks 54)))) = true)
    (h1649 : ((!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 60).ult (rankAtom ranks 35)))) = true)
    (h1650 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 39).ult (rankAtom ranks 54)))) = true)
    (h1651 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 39).ult (rankAtom ranks 35)))) = true)
    (h1652 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h1653 : ((!((rankAtom ranks 35 == rankAtom ranks 61)) || ((rankAtom ranks 34).ult (rankAtom ranks 55)))) = true)
    (h1654 : ((!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 61).ult (rankAtom ranks 35)))) = true)
    (h1655 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 40).ult (rankAtom ranks 55)))) = true)
    (h1656 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 40).ult (rankAtom ranks 35)))) = true)
    (h1657 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h1658 : ((!((rankAtom ranks 35 == rankAtom ranks 62)) || ((rankAtom ranks 34).ult (rankAtom ranks 56)))) = true)
    (h1659 : ((!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 62).ult (rankAtom ranks 35)))) = true)
    (h1660 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h1661 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 41).ult (rankAtom ranks 35)))) = true)
    (h1662 : ((!((rankAtom ranks 52 == rankAtom ranks 34)) || ((rankAtom ranks 63).ult (rankAtom ranks 36)))) = true)
    (h1663 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h1664 : ((!((rankAtom ranks 52 == rankAtom ranks 37)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h1665 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 37).ult (rankAtom ranks 36)))) = true)
    (h1666 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 38).ult (rankAtom ranks 36)))) = true)
    (h1667 : ((!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 65).ult (rankAtom ranks 36)))) = true)
    (h1668 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 39).ult (rankAtom ranks 36)))) = true)
    (h1669 : ((!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 66).ult (rankAtom ranks 36)))) = true)
    (h1670 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 40).ult (rankAtom ranks 36)))) = true)
    (h1671 : ((!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 67).ult (rankAtom ranks 36)))) = true)
    (h1672 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 41).ult (rankAtom ranks 36)))) = true)
    (h1673 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 34).ult (rankAtom ranks 53)))) = true)
    (h1674 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 38).ult (rankAtom ranks 53)))) = true)
    (h1675 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 38).ult (rankAtom ranks 37)))) = true)
    (h1676 : ((!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 34).ult (rankAtom ranks 54)))) = true)
    (h1677 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 39).ult (rankAtom ranks 54)))) = true)
    (h1678 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 39).ult (rankAtom ranks 37)))) = true)
    (h1679 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 34).ult (rankAtom ranks 55)))) = true)
    (h1680 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 40).ult (rankAtom ranks 55)))) = true)
    (h1681 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 40).ult (rankAtom ranks 37)))) = true)
    (h1682 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 34).ult (rankAtom ranks 56)))) = true)
    (h1683 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h1684 : ((!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 41).ult (rankAtom ranks 37)))) = true)
    (h1685 : ((!((rankAtom ranks 58 == rankAtom ranks 35)) || ((rankAtom ranks 63).ult (rankAtom ranks 36)))) = true)
    (h1686 : ((!((rankAtom ranks 58 == rankAtom ranks 37)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h1687 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 37).ult (rankAtom ranks 36)))) = true)
    (h1688 : ((!((rankAtom ranks 59 == rankAtom ranks 35)) || ((rankAtom ranks 64).ult (rankAtom ranks 36)))) = true)
    (h1689 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 38).ult (rankAtom ranks 36)))) = true)
    (h1690 : ((!((rankAtom ranks 60 == rankAtom ranks 35)) || ((rankAtom ranks 65).ult (rankAtom ranks 36)))) = true)
    (h1691 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 39).ult (rankAtom ranks 36)))) = true)
    (h1692 : ((!((rankAtom ranks 61 == rankAtom ranks 35)) || ((rankAtom ranks 66).ult (rankAtom ranks 36)))) = true)
    (h1693 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 40).ult (rankAtom ranks 36)))) = true)
    (h1694 : ((!((rankAtom ranks 62 == rankAtom ranks 35)) || ((rankAtom ranks 67).ult (rankAtom ranks 36)))) = true)
    (h1695 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 41).ult (rankAtom ranks 36)))) = true)
    (h1696 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 35).ult (rankAtom ranks 59)))) = true)
    (h1697 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 38).ult (rankAtom ranks 59)))) = true)
    (h1698 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 38).ult (rankAtom ranks 37)))) = true)
    (h1699 : ((!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 35).ult (rankAtom ranks 60)))) = true)
    (h1700 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 39).ult (rankAtom ranks 60)))) = true)
    (h1701 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 39).ult (rankAtom ranks 37)))) = true)
    (h1702 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 35).ult (rankAtom ranks 61)))) = true)
    (h1703 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 40).ult (rankAtom ranks 61)))) = true)
    (h1704 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 40).ult (rankAtom ranks 37)))) = true)
    (h1705 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 35).ult (rankAtom ranks 62)))) = true)
    (h1706 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 41).ult (rankAtom ranks 62)))) = true)
    (h1707 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 41).ult (rankAtom ranks 37)))) = true)
    (h1708 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 36).ult (rankAtom ranks 64)))) = true)
    (h1709 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 38).ult (rankAtom ranks 64)))) = true)
    (h1710 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 39).ult (rankAtom ranks 65)))) = true)
    (h1711 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 36).ult (rankAtom ranks 66)))) = true)
    (h1712 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 40).ult (rankAtom ranks 66)))) = true)
    (h1713 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 36).ult (rankAtom ranks 67)))) = true)
    (h1714 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 41).ult (rankAtom ranks 67)))) = true)
    (h1715 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h1716 : ((!((rankAtom ranks 43 == rankAtom ranks 57)) || ((rankAtom ranks 42).ult (rankAtom ranks 51)))) = true)
    (h1717 : ((!((rankAtom ranks 51 == rankAtom ranks 42)) || ((rankAtom ranks 57).ult (rankAtom ranks 43)))) = true)
    (h1718 : ((!((rankAtom ranks 43 == rankAtom ranks 44)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h1719 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 44).ult (rankAtom ranks 51)))) = true)
    (h1720 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 44).ult (rankAtom ranks 43)))) = true)
    (h1721 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h1722 : ((!((rankAtom ranks 43 == rankAtom ranks 58)) || ((rankAtom ranks 42).ult (rankAtom ranks 52)))) = true)
    (h1723 : ((!((rankAtom ranks 52 == rankAtom ranks 42)) || ((rankAtom ranks 58).ult (rankAtom ranks 43)))) = true)
    (h1724 : ((!((rankAtom ranks 43 == rankAtom ranks 45)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h1725 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 45).ult (rankAtom ranks 52)))) = true)
    (h1726 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 45).ult (rankAtom ranks 43)))) = true)
    (h1727 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h1728 : ((!((rankAtom ranks 43 == rankAtom ranks 59)) || ((rankAtom ranks 42).ult (rankAtom ranks 53)))) = true)
    (h1729 : ((!((rankAtom ranks 53 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 43)))) = true)
    (h1730 : ((!((rankAtom ranks 43 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h1731 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 53)))) = true)
    (h1732 : ((!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h1733 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 43)))) = true)
    (h1734 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h1735 : ((!((rankAtom ranks 43 == rankAtom ranks 60)) || ((rankAtom ranks 42).ult (rankAtom ranks 54)))) = true)
    (h1736 : ((!((rankAtom ranks 54 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 43)))) = true)
    (h1737 : ((!((rankAtom ranks 43 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 54)))) = true)
    (h1738 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 54)))) = true)
    (h1739 : ((!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h1740 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 43)))) = true)
    (h1741 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h1742 : ((!((rankAtom ranks 43 == rankAtom ranks 61)) || ((rankAtom ranks 42).ult (rankAtom ranks 55)))) = true)
    (h1743 : ((!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 43)))) = true)
    (h1744 : ((!((rankAtom ranks 43 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 55)))) = true)
    (h1745 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 55)))) = true)
    (h1746 : ((!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h1747 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 43)))) = true)
    (h1748 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h1749 : ((!((rankAtom ranks 43 == rankAtom ranks 62)) || ((rankAtom ranks 42).ult (rankAtom ranks 56)))) = true)
    (h1750 : ((!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 43)))) = true)
    (h1751 : ((!((rankAtom ranks 43 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 56)))) = true)
    (h1752 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h1753 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h1754 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 43)))) = true)
    (h1755 : ((!((rankAtom ranks 44 == rankAtom ranks 45)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h1756 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 45).ult (rankAtom ranks 44)))) = true)
    (h1757 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h1758 : ((!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h1759 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 46).ult (rankAtom ranks 44)))) = true)
    (h1760 : ((!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h1761 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 47).ult (rankAtom ranks 44)))) = true)
    (h1762 : ((!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h1763 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 48).ult (rankAtom ranks 44)))) = true)
    (h1764 : ((!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h1765 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h1766 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 49).ult (rankAtom ranks 44)))) = true)
    (h1767 : ((!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h1768 : ((!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h1769 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 46).ult (rankAtom ranks 45)))) = true)
    (h1770 : ((!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h1771 : ((!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h1772 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 47).ult (rankAtom ranks 45)))) = true)
    (h1773 : ((!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 55)))) = true)
    (h1774 : ((!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h1775 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 48).ult (rankAtom ranks 45)))) = true)
    (h1776 : ((!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 56)))) = true)
    (h1777 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h1778 : ((!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 49).ult (rankAtom ranks 45)))) = true)
    (h1779 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 53).ult (rankAtom ranks 54)))) = true)
    (h1780 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 53).ult (rankAtom ranks 55)))) = true)
    (h1781 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 56)))) = true)
    (h1782 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h1783 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h1784 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 54).ult (rankAtom ranks 55)))) = true)
    (h1785 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 54).ult (rankAtom ranks 56)))) = true)
    (h1786 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h1787 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 55).ult (rankAtom ranks 56)))) = true)
    (h1788 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h1789 : ((!((rankAtom ranks 58 == rankAtom ranks 43)) || ((rankAtom ranks 63).ult (rankAtom ranks 44)))) = true)
    (h1790 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 45).ult (rankAtom ranks 44)))) = true)
    (h1791 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h1792 : ((!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h1793 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 46).ult (rankAtom ranks 44)))) = true)
    (h1794 : ((!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h1795 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 47).ult (rankAtom ranks 44)))) = true)
    (h1796 : ((!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h1797 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 48).ult (rankAtom ranks 44)))) = true)
    (h1798 : ((!((rankAtom ranks 62 == rankAtom ranks 43)) || ((rankAtom ranks 67).ult (rankAtom ranks 44)))) = true)
    (h1799 : ((!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h1800 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 49).ult (rankAtom ranks 44)))) = true)
    (h1801 : ((!((rankAtom ranks 45 == rankAtom ranks 68)) || ((rankAtom ranks 43).ult (rankAtom ranks 59)))) = true)
    (h1802 : ((!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h1803 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 46).ult (rankAtom ranks 45)))) = true)
    (h1804 : ((!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h1805 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 47).ult (rankAtom ranks 45)))) = true)
    (h1806 : ((!((rankAtom ranks 45 == rankAtom ranks 70)) || ((rankAtom ranks 43).ult (rankAtom ranks 61)))) = true)
    (h1807 : ((!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 58).ult (rankAtom ranks 61)))) = true)
    (h1808 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 48).ult (rankAtom ranks 45)))) = true)
    (h1809 : ((!((rankAtom ranks 45 == rankAtom ranks 71)) || ((rankAtom ranks 43).ult (rankAtom ranks 62)))) = true)
    (h1810 : ((!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 58).ult (rankAtom ranks 62)))) = true)
    (h1811 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 49).ult (rankAtom ranks 45)))) = true)
    (h1812 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 59).ult (rankAtom ranks 60)))) = true)
    (h1813 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 59).ult (rankAtom ranks 61)))) = true)
    (h1814 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 59).ult (rankAtom ranks 62)))) = true)
    (h1815 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h1816 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 60).ult (rankAtom ranks 61)))) = true)
    (h1817 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 60).ult (rankAtom ranks 62)))) = true)
    (h1818 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h1819 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 61).ult (rankAtom ranks 62)))) = true)
    (h1820 : ((!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h1821 : ((!((rankAtom ranks 45 == rankAtom ranks 68)) || ((rankAtom ranks 44).ult (rankAtom ranks 64)))) = true)
    (h1822 : ((!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h1823 : ((!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h1824 : ((!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h1825 : ((!((rankAtom ranks 45 == rankAtom ranks 71)) || ((rankAtom ranks 44).ult (rankAtom ranks 67)))) = true)
    (h1826 : ((!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h1827 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 64).ult (rankAtom ranks 65)))) = true)
    (h1828 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 64).ult (rankAtom ranks 66)))) = true)
    (h1829 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 64).ult (rankAtom ranks 67)))) = true)
    (h1830 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 65).ult (rankAtom ranks 66)))) = true)
    (h1831 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 65).ult (rankAtom ranks 67)))) = true)
    (h1832 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 66).ult (rankAtom ranks 67)))) = true)
    (h1833 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h1834 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 68).ult (rankAtom ranks 70)))) = true)
    (h1835 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 68).ult (rankAtom ranks 71)))) = true)
    (h1836 : ((!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 49).ult (rankAtom ranks 71)))) = true)
    (h1837 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h1838 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h1839 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true)
    (h1840 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h1841 : ((!((rankAtom ranks 58 == rankAtom ranks 50)) || ((rankAtom ranks 63).ult (rankAtom ranks 51)))) = true)
    (h1842 : ((!((rankAtom ranks 51 == rankAtom ranks 52)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h1843 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 52).ult (rankAtom ranks 58)))) = true)
    (h1844 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 52).ult (rankAtom ranks 51)))) = true)
    (h1845 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h1846 : ((!((rankAtom ranks 59 == rankAtom ranks 50)) || ((rankAtom ranks 64).ult (rankAtom ranks 51)))) = true)
    (h1847 : ((!((rankAtom ranks 51 == rankAtom ranks 53)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h1848 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 53).ult (rankAtom ranks 59)))) = true)
    (h1849 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 53).ult (rankAtom ranks 51)))) = true)
    (h1850 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h1851 : ((!((rankAtom ranks 60 == rankAtom ranks 50)) || ((rankAtom ranks 65).ult (rankAtom ranks 51)))) = true)
    (h1852 : ((!((rankAtom ranks 51 == rankAtom ranks 54)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h1853 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 54).ult (rankAtom ranks 60)))) = true)
    (h1854 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 54).ult (rankAtom ranks 51)))) = true)
    (h1855 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h1856 : ((!((rankAtom ranks 61 == rankAtom ranks 50)) || ((rankAtom ranks 66).ult (rankAtom ranks 51)))) = true)
    (h1857 : ((!((rankAtom ranks 51 == rankAtom ranks 55)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h1858 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 55).ult (rankAtom ranks 51)))) = true)
    (h1859 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h1860 : ((!((rankAtom ranks 62 == rankAtom ranks 50)) || ((rankAtom ranks 67).ult (rankAtom ranks 51)))) = true)
    (h1861 : ((!((rankAtom ranks 51 == rankAtom ranks 56)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h1862 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 56).ult (rankAtom ranks 62)))) = true)
    (h1863 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 56).ult (rankAtom ranks 51)))) = true)
    (h1864 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h1865 : ((!((rankAtom ranks 52 == rankAtom ranks 53)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h1866 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 53).ult (rankAtom ranks 59)))) = true)
    (h1867 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 53).ult (rankAtom ranks 52)))) = true)
    (h1868 : ((!((rankAtom ranks 52 == rankAtom ranks 54)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h1869 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 54).ult (rankAtom ranks 52)))) = true)
    (h1870 : ((!((rankAtom ranks 61 == rankAtom ranks 50)) || ((rankAtom ranks 70).ult (rankAtom ranks 52)))) = true)
    (h1871 : ((!((rankAtom ranks 52 == rankAtom ranks 55)) || ((rankAtom ranks 58).ult (rankAtom ranks 61)))) = true)
    (h1872 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 55).ult (rankAtom ranks 52)))) = true)
    (h1873 : ((!((rankAtom ranks 52 == rankAtom ranks 56)) || ((rankAtom ranks 58).ult (rankAtom ranks 62)))) = true)
    (h1874 : ((!((rankAtom ranks 52 == rankAtom ranks 58)) || ((rankAtom ranks 56).ult (rankAtom ranks 62)))) = true)
    (h1875 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 56).ult (rankAtom ranks 52)))) = true)
    (h1876 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h1877 : ((!((rankAtom ranks 52 == rankAtom ranks 68)) || ((rankAtom ranks 51).ult (rankAtom ranks 64)))) = true)
    (h1878 : ((!((rankAtom ranks 52 == rankAtom ranks 53)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h1879 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 53).ult (rankAtom ranks 64)))) = true)
    (h1880 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h1881 : ((!((rankAtom ranks 52 == rankAtom ranks 69)) || ((rankAtom ranks 51).ult (rankAtom ranks 65)))) = true)
    (h1882 : ((!((rankAtom ranks 52 == rankAtom ranks 54)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h1883 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h1884 : ((!((rankAtom ranks 52 == rankAtom ranks 70)) || ((rankAtom ranks 51).ult (rankAtom ranks 66)))) = true)
    (h1885 : ((!((rankAtom ranks 52 == rankAtom ranks 55)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h1886 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h1887 : ((!((rankAtom ranks 52 == rankAtom ranks 71)) || ((rankAtom ranks 51).ult (rankAtom ranks 67)))) = true)
    (h1888 : ((!((rankAtom ranks 52 == rankAtom ranks 56)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h1889 : ((!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 56).ult (rankAtom ranks 67)))) = true)
    (h1890 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h1891 : ((!((rankAtom ranks 58 == rankAtom ranks 59)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h1892 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h1893 : ((!((rankAtom ranks 58 == rankAtom ranks 60)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h1894 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h1895 : ((!((rankAtom ranks 58 == rankAtom ranks 61)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h1896 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h1897 : ((!((rankAtom ranks 58 == rankAtom ranks 62)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h1898 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 65).ult (rankAtom ranks 69)))) = true) : False := by
  exact false_of_directChunks_each
    (directSourceAssignment rows blockers shell q w b1 ranks)
    (directChunk000_each_of_flat
      rows blockers shell q w b1 ranks h0000 h0001 h0002 h0003 h0004 h0005 h0006 h0007 h0008 h0009 h0010 h0011 h0012 h0013 h0014 h0015 h0016 h0017 h0018 h0019 h0020 h0021 h0022 h0023 h0024 h0025 h0026 h0027 h0028 h0029 h0030 h0031 h0032 h0033 h0034 h0035 h0036 h0037 h0038 h0039 h0040 h0041 h0042 h0043 h0044 h0045 h0046 h0047 h0048 h0049 h0050 h0051 h0052 h0053 h0054 h0055 h0056 h0057 h0058 h0059 h0060 h0061 h0062 h0063)
    (directChunk001_each_of_flat
      rows blockers shell q w b1 ranks h0064 h0065 h0066 h0067 h0068 h0069 h0070 h0071 h0072 h0073 h0074 h0075 h0076 h0077 h0078 h0079 h0080 h0081 h0082 h0083 h0084 h0085 h0086 h0087 h0088 h0089 h0090 h0091 h0092 h0093 h0094 h0095 h0096 h0097 h0098 h0099 h0100 h0101 h0102 h0103 h0104 h0105 h0106 h0107 h0108 h0109 h0110 h0111 h0112 h0113 h0114 h0115 h0116 h0117 h0118 h0119 h0120 h0121 h0122 h0123 h0124 h0125 h0126 h0127)
    (directChunk002_each_of_flat
      rows blockers shell q w b1 ranks h0128 h0129 h0130 h0131 h0132 h0133 h0134 h0135 h0136 h0137 h0138 h0139 h0140 h0141 h0142 h0143 h0144 h0145 h0146 h0147 h0148 h0149 h0150 h0151 h0152 h0153 h0154 h0155 h0156 h0157 h0158 h0159 h0160 h0161 h0162 h0163 h0164 h0165 h0166 h0167 h0168 h0169 h0170 h0171 h0172 h0173 h0174 h0175 h0176 h0177 h0178 h0179 h0180 h0181 h0182 h0183 h0184 h0185 h0186 h0187 h0188 h0189 h0190 h0191)
    (directChunk003_each_of_flat
      rows blockers shell q w b1 ranks h0192 h0193 h0194 h0195 h0196 h0197 h0198 h0199 h0200 h0201 h0202 h0203 h0204 h0205 h0206 h0207 h0208 h0209 h0210 h0211 h0212 h0213 h0214 h0215 h0216 h0217 h0218 h0219 h0220 h0221 h0222 h0223 h0224 h0225 h0226 h0227 h0228 h0229 h0230 h0231 h0232 h0233 h0234 h0235 h0236 h0237 h0238 h0239 h0240 h0241 h0242 h0243 h0244 h0245 h0246 h0247 h0248 h0249 h0250 h0251 h0252 h0253 h0254 h0255)
    (directChunk004_each_of_flat
      rows blockers shell q w b1 ranks h0256 h0257 h0258 h0259 h0260 h0261 h0262 h0263 h0264 h0265 h0266 h0267 h0268 h0269 h0270 h0271 h0272 h0273 h0274 h0275 h0276 h0277 h0278 h0279 h0280 h0281 h0282 h0283 h0284 h0285 h0286 h0287 h0288 h0289 h0290 h0291 h0292 h0293 h0294 h0295 h0296 h0297 h0298 h0299 h0300 h0301 h0302 h0303 h0304 h0305 h0306 h0307 h0308 h0309 h0310 h0311 h0312 h0313 h0314 h0315 h0316 h0317 h0318 h0319)
    (directChunk005_each_of_flat
      rows blockers shell q w b1 ranks h0320 h0321 h0322 h0323 h0324 h0325 h0326 h0327 h0328 h0329 h0330 h0331 h0332 h0333 h0334 h0335 h0336 h0337 h0338 h0339 h0340 h0341 h0342 h0343 h0344 h0345 h0346 h0347 h0348 h0349 h0350 h0351 h0352 h0353 h0354 h0355 h0356 h0357 h0358 h0359 h0360 h0361 h0362 h0363 h0364 h0365 h0366 h0367 h0368 h0369 h0370 h0371 h0372 h0373 h0374 h0375 h0376 h0377 h0378 h0379 h0380 h0381 h0382 h0383)
    (directChunk006_each_of_flat
      rows blockers shell q w b1 ranks h0384 h0385 h0386 h0387 h0388 h0389 h0390 h0391 h0392 h0393 h0394 h0395 h0396 h0397 h0398 h0399 h0400 h0401 h0402 h0403 h0404 h0405 h0406 h0407 h0408 h0409 h0410 h0411 h0412 h0413 h0414 h0415 h0416 h0417 h0418 h0419 h0420 h0421 h0422 h0423 h0424 h0425 h0426 h0427 h0428 h0429 h0430 h0431 h0432 h0433 h0434 h0435 h0436 h0437 h0438 h0439 h0440 h0441 h0442 h0443 h0444 h0445 h0446 h0447)
    (directChunk007_each_of_flat
      rows blockers shell q w b1 ranks h0448 h0449 h0450 h0451 h0452 h0453 h0454 h0455 h0456 h0457 h0458 h0459 h0460 h0461 h0462 h0463 h0464 h0465 h0466 h0467 h0468 h0469 h0470 h0471 h0472 h0473 h0474 h0475 h0476 h0477 h0478 h0479 h0480 h0481 h0482 h0483 h0484 h0485 h0486 h0487 h0488 h0489 h0490 h0491 h0492 h0493 h0494 h0495 h0496 h0497 h0498 h0499 h0500 h0501 h0502 h0503 h0504 h0505 h0506 h0507 h0508 h0509 h0510 h0511)
    (directChunk008_each_of_flat
      rows blockers shell q w b1 ranks h0512 h0513 h0514 h0515 h0516 h0517 h0518 h0519 h0520 h0521 h0522 h0523 h0524 h0525 h0526 h0527 h0528 h0529 h0530 h0531 h0532 h0533 h0534 h0535 h0536 h0537 h0538 h0539 h0540 h0541 h0542 h0543 h0544 h0545 h0546 h0547 h0548 h0549 h0550 h0551 h0552 h0553 h0554 h0555 h0556 h0557 h0558 h0559 h0560 h0561 h0562 h0563 h0564 h0565 h0566 h0567 h0568 h0569 h0570 h0571 h0572 h0573 h0574 h0575)
    (directChunk009_each_of_flat
      rows blockers shell q w b1 ranks h0576 h0577 h0578 h0579 h0580 h0581 h0582 h0583 h0584 h0585 h0586 h0587 h0588 h0589 h0590 h0591 h0592 h0593 h0594 h0595 h0596 h0597 h0598 h0599 h0600 h0601 h0602 h0603 h0604 h0605 h0606 h0607 h0608 h0609 h0610 h0611 h0612 h0613 h0614 h0615 h0616 h0617 h0618 h0619 h0620 h0621 h0622 h0623 h0624 h0625 h0626 h0627 h0628 h0629 h0630 h0631 h0632 h0633 h0634 h0635 h0636 h0637 h0638 h0639)
    (directChunk010_each_of_flat
      rows blockers shell q w b1 ranks h0640 h0641 h0642 h0643 h0644 h0645 h0646 h0647 h0648 h0649 h0650 h0651 h0652 h0653 h0654 h0655 h0656 h0657 h0658 h0659 h0660 h0661 h0662 h0663 h0664 h0665 h0666 h0667 h0668 h0669 h0670 h0671 h0672 h0673 h0674 h0675 h0676 h0677 h0678 h0679 h0680 h0681 h0682 h0683 h0684 h0685 h0686 h0687 h0688 h0689 h0690 h0691 h0692 h0693 h0694 h0695 h0696 h0697 h0698 h0699 h0700 h0701 h0702 h0703)
    (directChunk011_each_of_flat
      rows blockers shell q w b1 ranks h0704 h0705 h0706 h0707 h0708 h0709 h0710 h0711 h0712 h0713 h0714 h0715 h0716 h0717 h0718 h0719 h0720 h0721 h0722 h0723 h0724 h0725 h0726 h0727 h0728 h0729 h0730 h0731 h0732 h0733 h0734 h0735 h0736 h0737 h0738 h0739 h0740 h0741 h0742 h0743 h0744 h0745 h0746 h0747 h0748 h0749 h0750 h0751 h0752 h0753 h0754 h0755 h0756 h0757 h0758 h0759 h0760 h0761 h0762 h0763 h0764 h0765 h0766 h0767)
    (directChunk012_each_of_flat
      rows blockers shell q w b1 ranks h0768 h0769 h0770 h0771 h0772 h0773 h0774 h0775 h0776 h0777 h0778 h0779 h0780 h0781 h0782 h0783 h0784 h0785 h0786 h0787 h0788 h0789 h0790 h0791 h0792 h0793 h0794 h0795 h0796 h0797 h0798 h0799 h0800 h0801 h0802 h0803 h0804 h0805 h0806 h0807 h0808 h0809 h0810 h0811 h0812 h0813 h0814 h0815 h0816 h0817 h0818 h0819 h0820 h0821 h0822 h0823 h0824 h0825 h0826 h0827 h0828 h0829 h0830 h0831)
    (directChunk013_each_of_flat
      rows blockers shell q w b1 ranks h0832 h0833 h0834 h0835 h0836 h0837 h0838 h0839 h0840 h0841 h0842 h0843 h0844 h0845 h0846 h0847 h0848 h0849 h0850 h0851 h0852 h0853 h0854 h0855 h0856 h0857 h0858 h0859 h0860 h0861 h0862 h0863 h0864 h0865 h0866 h0867 h0868 h0869 h0870 h0871 h0872 h0873 h0874 h0875 h0876 h0877 h0878 h0879 h0880 h0881 h0882 h0883 h0884 h0885 h0886 h0887 h0888 h0889 h0890 h0891 h0892 h0893 h0894 h0895)
    (directChunk014_each_of_flat
      rows blockers shell q w b1 ranks h0896 h0897 h0898 h0899 h0900 h0901 h0902 h0903 h0904 h0905 h0906 h0907 h0908 h0909 h0910 h0911 h0912 h0913 h0914 h0915 h0916 h0917 h0918 h0919 h0920 h0921 h0922 h0923 h0924 h0925 h0926 h0927 h0928 h0929 h0930 h0931 h0932 h0933 h0934 h0935 h0936 h0937 h0938 h0939 h0940 h0941 h0942 h0943 h0944 h0945 h0946 h0947 h0948 h0949 h0950 h0951 h0952 h0953 h0954 h0955 h0956 h0957 h0958 h0959)
    (directChunk015_each_of_flat
      rows blockers shell q w b1 ranks h0960 h0961 h0962 h0963 h0964 h0965 h0966 h0967 h0968 h0969 h0970 h0971 h0972 h0973 h0974 h0975 h0976 h0977 h0978 h0979 h0980 h0981 h0982 h0983 h0984 h0985 h0986 h0987 h0988 h0989 h0990 h0991 h0992 h0993 h0994 h0995 h0996 h0997 h0998 h0999 h1000 h1001 h1002 h1003 h1004 h1005 h1006 h1007 h1008 h1009 h1010 h1011 h1012 h1013 h1014 h1015 h1016 h1017 h1018 h1019 h1020 h1021 h1022 h1023)
    (directChunk016_each_of_flat
      rows blockers shell q w b1 ranks h1024 h1025 h1026 h1027 h1028 h1029 h1030 h1031 h1032 h1033 h1034 h1035 h1036 h1037 h1038 h1039 h1040 h1041 h1042 h1043 h1044 h1045 h1046 h1047 h1048 h1049 h1050 h1051 h1052 h1053 h1054 h1055 h1056 h1057 h1058 h1059 h1060 h1061 h1062 h1063 h1064 h1065 h1066 h1067 h1068 h1069 h1070 h1071 h1072 h1073 h1074 h1075 h1076 h1077 h1078 h1079 h1080 h1081 h1082 h1083 h1084 h1085 h1086 h1087)
    (directChunk017_each_of_flat
      rows blockers shell q w b1 ranks h1088 h1089 h1090 h1091 h1092 h1093 h1094 h1095 h1096 h1097 h1098 h1099 h1100 h1101 h1102 h1103 h1104 h1105 h1106 h1107 h1108 h1109 h1110 h1111 h1112 h1113 h1114 h1115 h1116 h1117 h1118 h1119 h1120 h1121 h1122 h1123 h1124 h1125 h1126 h1127 h1128 h1129 h1130 h1131 h1132 h1133 h1134 h1135 h1136 h1137 h1138 h1139 h1140 h1141 h1142 h1143 h1144 h1145 h1146 h1147 h1148 h1149 h1150 h1151)
    (directChunk018_each_of_flat
      rows blockers shell q w b1 ranks h1152 h1153 h1154 h1155 h1156 h1157 h1158 h1159 h1160 h1161 h1162 h1163 h1164 h1165 h1166 h1167 h1168 h1169 h1170 h1171 h1172 h1173 h1174 h1175 h1176 h1177 h1178 h1179 h1180 h1181 h1182 h1183 h1184 h1185 h1186 h1187 h1188 h1189 h1190 h1191 h1192 h1193 h1194 h1195 h1196 h1197 h1198 h1199 h1200 h1201 h1202 h1203 h1204 h1205 h1206 h1207 h1208 h1209 h1210 h1211 h1212 h1213 h1214 h1215)
    (directChunk019_each_of_flat
      rows blockers shell q w b1 ranks h1216 h1217 h1218 h1219 h1220 h1221 h1222 h1223 h1224 h1225 h1226 h1227 h1228 h1229 h1230 h1231 h1232 h1233 h1234 h1235 h1236 h1237 h1238 h1239 h1240 h1241 h1242 h1243 h1244 h1245 h1246 h1247 h1248 h1249 h1250 h1251 h1252 h1253 h1254 h1255 h1256 h1257 h1258 h1259 h1260 h1261 h1262 h1263 h1264 h1265 h1266 h1267 h1268 h1269 h1270 h1271 h1272 h1273 h1274 h1275 h1276 h1277 h1278 h1279)
    (directChunk020_each_of_flat
      rows blockers shell q w b1 ranks h1280 h1281 h1282 h1283 h1284 h1285 h1286 h1287 h1288 h1289 h1290 h1291 h1292 h1293 h1294 h1295 h1296 h1297 h1298 h1299 h1300 h1301 h1302 h1303 h1304 h1305 h1306 h1307 h1308 h1309 h1310 h1311 h1312 h1313 h1314 h1315 h1316 h1317 h1318 h1319 h1320 h1321 h1322 h1323 h1324 h1325 h1326 h1327 h1328 h1329 h1330 h1331 h1332 h1333 h1334 h1335 h1336 h1337 h1338 h1339 h1340 h1341 h1342 h1343)
    (directChunk021_each_of_flat
      rows blockers shell q w b1 ranks h1344 h1345 h1346 h1347 h1348 h1349 h1350 h1351 h1352 h1353 h1354 h1355 h1356 h1357 h1358 h1359 h1360 h1361 h1362 h1363 h1364 h1365 h1366 h1367 h1368 h1369 h1370 h1371 h1372 h1373 h1374 h1375 h1376 h1377 h1378 h1379 h1380 h1381 h1382 h1383 h1384 h1385 h1386 h1387 h1388 h1389 h1390 h1391 h1392 h1393 h1394 h1395 h1396 h1397 h1398 h1399 h1400 h1401 h1402 h1403 h1404 h1405 h1406 h1407)
    (directChunk022_each_of_flat
      rows blockers shell q w b1 ranks h1408 h1409 h1410 h1411 h1412 h1413 h1414 h1415 h1416 h1417 h1418 h1419 h1420 h1421 h1422 h1423 h1424 h1425 h1426 h1427 h1428 h1429 h1430 h1431 h1432 h1433 h1434 h1435 h1436 h1437 h1438 h1439 h1440 h1441 h1442 h1443 h1444 h1445 h1446 h1447 h1448 h1449 h1450 h1451 h1452 h1453 h1454 h1455 h1456 h1457 h1458 h1459 h1460 h1461 h1462 h1463 h1464 h1465 h1466 h1467 h1468 h1469 h1470 h1471)
    (directChunk023_each_of_flat
      rows blockers shell q w b1 ranks h1472 h1473 h1474 h1475 h1476 h1477 h1478 h1479 h1480 h1481 h1482 h1483 h1484 h1485 h1486 h1487 h1488 h1489 h1490 h1491 h1492 h1493 h1494 h1495 h1496 h1497 h1498 h1499 h1500 h1501 h1502 h1503 h1504 h1505 h1506 h1507 h1508 h1509 h1510 h1511 h1512 h1513 h1514 h1515 h1516 h1517 h1518 h1519 h1520 h1521 h1522 h1523 h1524 h1525 h1526 h1527 h1528 h1529 h1530 h1531 h1532 h1533 h1534 h1535)
    (directChunk024_each_of_flat
      rows blockers shell q w b1 ranks h1536 h1537 h1538 h1539 h1540 h1541 h1542 h1543 h1544 h1545 h1546 h1547 h1548 h1549 h1550 h1551 h1552 h1553 h1554 h1555 h1556 h1557 h1558 h1559 h1560 h1561 h1562 h1563 h1564 h1565 h1566 h1567 h1568 h1569 h1570 h1571 h1572 h1573 h1574 h1575 h1576 h1577 h1578 h1579 h1580 h1581 h1582 h1583 h1584 h1585 h1586 h1587 h1588 h1589 h1590 h1591 h1592 h1593 h1594 h1595 h1596 h1597 h1598 h1599)
    (directChunk025_each_of_flat
      rows blockers shell q w b1 ranks h1600 h1601 h1602 h1603 h1604 h1605 h1606 h1607 h1608 h1609 h1610 h1611 h1612 h1613 h1614 h1615 h1616 h1617 h1618 h1619 h1620 h1621 h1622 h1623 h1624 h1625 h1626 h1627 h1628 h1629 h1630 h1631 h1632 h1633 h1634 h1635 h1636 h1637 h1638 h1639 h1640 h1641 h1642 h1643 h1644 h1645 h1646 h1647 h1648 h1649 h1650 h1651 h1652 h1653 h1654 h1655 h1656 h1657 h1658 h1659 h1660 h1661 h1662 h1663)
    (directChunk026_each_of_flat
      rows blockers shell q w b1 ranks h1664 h1665 h1666 h1667 h1668 h1669 h1670 h1671 h1672 h1673 h1674 h1675 h1676 h1677 h1678 h1679 h1680 h1681 h1682 h1683 h1684 h1685 h1686 h1687 h1688 h1689 h1690 h1691 h1692 h1693 h1694 h1695 h1696 h1697 h1698 h1699 h1700 h1701 h1702 h1703 h1704 h1705 h1706 h1707 h1708 h1709 h1710 h1711 h1712 h1713 h1714 h1715 h1716 h1717 h1718 h1719 h1720 h1721 h1722 h1723 h1724 h1725 h1726 h1727)
    (directChunk027_each_of_flat
      rows blockers shell q w b1 ranks h1728 h1729 h1730 h1731 h1732 h1733 h1734 h1735 h1736 h1737 h1738 h1739 h1740 h1741 h1742 h1743 h1744 h1745 h1746 h1747 h1748 h1749 h1750 h1751 h1752 h1753 h1754 h1755 h1756 h1757 h1758 h1759 h1760 h1761 h1762 h1763 h1764 h1765 h1766 h1767 h1768 h1769 h1770 h1771 h1772 h1773 h1774 h1775 h1776 h1777 h1778 h1779 h1780 h1781 h1782 h1783 h1784 h1785 h1786 h1787 h1788 h1789 h1790 h1791)
    (directChunk028_each_of_flat
      rows blockers shell q w b1 ranks h1792 h1793 h1794 h1795 h1796 h1797 h1798 h1799 h1800 h1801 h1802 h1803 h1804 h1805 h1806 h1807 h1808 h1809 h1810 h1811 h1812 h1813 h1814 h1815 h1816 h1817 h1818 h1819 h1820 h1821 h1822 h1823 h1824 h1825 h1826 h1827 h1828 h1829 h1830 h1831 h1832 h1833 h1834 h1835 h1836 h1837 h1838 h1839 h1840 h1841 h1842 h1843 h1844 h1845 h1846 h1847 h1848 h1849 h1850 h1851 h1852 h1853 h1854 h1855)
    (directChunk029_each_of_flat
      rows blockers shell q w b1 ranks h1856 h1857 h1858 h1859 h1860 h1861 h1862 h1863 h1864 h1865 h1866 h1867 h1868 h1869 h1870 h1871 h1872 h1873 h1874 h1875 h1876 h1877 h1878 h1879 h1880 h1881 h1882 h1883 h1884 h1885 h1886 h1887 h1888 h1889 h1890 h1891 h1892 h1893 h1894 h1895 h1896 h1897 h1898)

#print axioms false_of_directChunks_each
#print axioms false_of_directSource_flat


end Problem97.ATailExactFiveVerifiedPass5
