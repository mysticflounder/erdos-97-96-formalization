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


end Problem97.ATailExactFiveVerifiedPass5
