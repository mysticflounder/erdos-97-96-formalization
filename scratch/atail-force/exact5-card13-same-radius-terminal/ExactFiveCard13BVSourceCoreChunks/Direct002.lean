/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct002 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 1 then 1#4 else 0#4) + (bif shellBit shell 2 then 1#4 else 0#4) + (bif shellBit shell 3 then 1#4 else 0#4) + (bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4) + (bif shellBit shell 8 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 5#4) &&
    shellBit shell 1 &&
    shellBit shell 2 &&
    shellBit shell 3 &&
    (((bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4)) == 1#4) &&
    (((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 1#4) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 0 == rowBit rows 0 2 0))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 1 == rowBit rows 0 2 1))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 3 == rowBit rows 0 2 3))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 4 == rowBit rows 0 2 4))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 6 == rowBit rows 0 2 6))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 8 == rowBit rows 0 2 8))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 10 == rowBit rows 0 2 10))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 11 == rowBit rows 0 2 11))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 12 == rowBit rows 0 2 12))) &&
    (((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4) + (bif firstRowBit b1 9 then 1#4 else 0#4) + (bif firstRowBit b1 10 then 1#4 else 0#4) + (bif firstRowBit b1 11 then 1#4 else 0#4) + (bif firstRowBit b1 12 then 1#4 else 0#4)) == 4#4) &&
    !(firstRowBit b1 4) &&
    (!((q == 9#4)) || (!(firstRowBit b1 9))) &&
    (!((w == 9#4)) || (!(firstRowBit b1 9))) &&
    (!((q == 10#4)) || (!(firstRowBit b1 10))) &&
    (!((w == 10#4)) || (!(firstRowBit b1 10))) &&
    (!((q == 11#4)) || (!(firstRowBit b1 11))) &&
    (!((w == 11#4)) || (!(firstRowBit b1 11))) &&
    (!((q == 12#4)) || (!(firstRowBit b1 12))) &&
    (!((w == 12#4)) || (!(firstRowBit b1 12))) &&
    (((bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4))).ule 1#4 &&
    (((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4))).ule 1#4 &&
    !((rowBit rows 1 6 2 && rowBit rows 1 6 1)) &&
    !((rowBit rows 2 5 2 && rowBit rows 2 5 3)) &&
    (blockerAt blockers 1 == 2#4) &&
    rowBit rows 0 2 1 &&
    rowBit rows 0 2 3 &&
    !(rowBit rows 0 2 0) &&
    !(rowBit rows 0 2 4) &&
    (2#4).ule ((bif rowBit rows 0 4 9 then 1#4 else 0#4) + (bif rowBit rows 0 4 10 then 1#4 else 0#4) + (bif rowBit rows 0 4 11 then 1#4 else 0#4) + (bif rowBit rows 0 4 12 then 1#4 else 0#4)) &&
    (2#4).ule ((bif firstRowBit b1 9 then 1#4 else 0#4) + (bif firstRowBit b1 10 then 1#4 else 0#4) + (bif firstRowBit b1 11 then 1#4 else 0#4) + (bif firstRowBit b1 12 then 1#4 else 0#4)) &&
    (((q == 9#4) && rowBit rows 0 4 9) || ((q == 10#4) && rowBit rows 0 4 10) || ((q == 11#4) && rowBit rows 0 4 11) || ((q == 12#4) && rowBit rows 0 4 12) || ((w == 9#4) && rowBit rows 0 4 9) || ((w == 10#4) && rowBit rows 0 4 10) || ((w == 11#4) && rowBit rows 0 4 11) || ((w == 12#4) && rowBit rows 0 4 12)) &&
    (((bif (rowBit rows 0 4 0 || firstRowBit b1 0) then 1#4 else 0#4) + (bif (rowBit rows 0 4 1 || firstRowBit b1 1) then 1#4 else 0#4) + (bif (rowBit rows 0 4 2 || firstRowBit b1 2) then 1#4 else 0#4) + (bif (rowBit rows 0 4 3 || firstRowBit b1 3) then 1#4 else 0#4) + (bif (rowBit rows 0 4 4 || firstRowBit b1 4) then 1#4 else 0#4) + (bif (rowBit rows 0 4 5 || firstRowBit b1 5) then 1#4 else 0#4) + (bif (rowBit rows 0 4 6 || firstRowBit b1 6) then 1#4 else 0#4) + (bif (rowBit rows 0 4 7 || firstRowBit b1 7) then 1#4 else 0#4) + (bif (rowBit rows 0 4 8 || firstRowBit b1 8) then 1#4 else 0#4) + (bif (rowBit rows 0 4 9 || firstRowBit b1 9) then 1#4 else 0#4) + (bif (rowBit rows 0 4 10 || firstRowBit b1 10) then 1#4 else 0#4) + (bif (rowBit rows 0 4 11 || firstRowBit b1 11) then 1#4 else 0#4) + (bif (rowBit rows 0 4 12 || firstRowBit b1 12) then 1#4 else 0#4)) == 6#4) &&
    (rowBit rows 0 4 9 || firstRowBit b1 9) &&
    (rowBit rows 0 4 10 || firstRowBit b1 10) &&
    (rowBit rows 0 4 11 || firstRowBit b1 11) &&
    (rowBit rows 0 4 12 || firstRowBit b1 12) &&
    (rankAtom ranks 1).ult (78#7) &&
    (rankAtom ranks 2).ult (78#7) &&
    (rankAtom ranks 3).ult (78#7) &&
    (rankAtom ranks 4).ult (78#7) &&
    (rankAtom ranks 5).ult (78#7) &&
    (rankAtom ranks 6).ult (78#7) &&
    (rankAtom ranks 7).ult (78#7) &&
    (rankAtom ranks 8).ult (78#7) &&
    (rankAtom ranks 9).ult (78#7) &&
    (rankAtom ranks 12).ult (78#7) &&
    (rankAtom ranks 13).ult (78#7) &&
    (rankAtom ranks 14).ult (78#7) &&
    (rankAtom ranks 15).ult (78#7) &&
    (rankAtom ranks 16).ult (78#7) &&
    (rankAtom ranks 17).ult (78#7) &&
    (rankAtom ranks 18).ult (78#7) &&
    (rankAtom ranks 19).ult (78#7) &&
    (rankAtom ranks 20).ult (78#7) &&
    (rankAtom ranks 21).ult (78#7) &&
    (rankAtom ranks 22).ult (78#7) &&
    (rankAtom ranks 23).ult (78#7) &&
    (rankAtom ranks 24).ult (78#7)

@[bv_normalize]
theorem direct002_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct002 rows blockers shell q w b1 ranks = ((((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 1 then 1#4 else 0#4) + (bif shellBit shell 2 then 1#4 else 0#4) + (bif shellBit shell 3 then 1#4 else 0#4) + (bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4) + (bif shellBit shell 8 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 5#4) &&
    shellBit shell 1 &&
    shellBit shell 2 &&
    shellBit shell 3 &&
    (((bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4)) == 1#4) &&
    (((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 1#4) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 0 == rowBit rows 0 2 0))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 1 == rowBit rows 0 2 1))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 3 == rowBit rows 0 2 3))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 4 == rowBit rows 0 2 4))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 6 == rowBit rows 0 2 6))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 8 == rowBit rows 0 2 8))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 10 == rowBit rows 0 2 10))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 11 == rowBit rows 0 2 11))) &&
    (!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 12 == rowBit rows 0 2 12))) &&
    (((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4) + (bif firstRowBit b1 9 then 1#4 else 0#4) + (bif firstRowBit b1 10 then 1#4 else 0#4) + (bif firstRowBit b1 11 then 1#4 else 0#4) + (bif firstRowBit b1 12 then 1#4 else 0#4)) == 4#4) &&
    !(firstRowBit b1 4) &&
    (!((q == 9#4)) || (!(firstRowBit b1 9))) &&
    (!((w == 9#4)) || (!(firstRowBit b1 9))) &&
    (!((q == 10#4)) || (!(firstRowBit b1 10))) &&
    (!((w == 10#4)) || (!(firstRowBit b1 10))) &&
    (!((q == 11#4)) || (!(firstRowBit b1 11))) &&
    (!((w == 11#4)) || (!(firstRowBit b1 11))) &&
    (!((q == 12#4)) || (!(firstRowBit b1 12))) &&
    (!((w == 12#4)) || (!(firstRowBit b1 12))) &&
    (((bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4))).ule 1#4 &&
    (((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4))).ule 1#4 &&
    !((rowBit rows 1 6 2 && rowBit rows 1 6 1)) &&
    !((rowBit rows 2 5 2 && rowBit rows 2 5 3)) &&
    (blockerAt blockers 1 == 2#4) &&
    rowBit rows 0 2 1 &&
    rowBit rows 0 2 3 &&
    !(rowBit rows 0 2 0) &&
    !(rowBit rows 0 2 4) &&
    (2#4).ule ((bif rowBit rows 0 4 9 then 1#4 else 0#4) + (bif rowBit rows 0 4 10 then 1#4 else 0#4) + (bif rowBit rows 0 4 11 then 1#4 else 0#4) + (bif rowBit rows 0 4 12 then 1#4 else 0#4)) &&
    (2#4).ule ((bif firstRowBit b1 9 then 1#4 else 0#4) + (bif firstRowBit b1 10 then 1#4 else 0#4) + (bif firstRowBit b1 11 then 1#4 else 0#4) + (bif firstRowBit b1 12 then 1#4 else 0#4)) &&
    (((q == 9#4) && rowBit rows 0 4 9) || ((q == 10#4) && rowBit rows 0 4 10) || ((q == 11#4) && rowBit rows 0 4 11) || ((q == 12#4) && rowBit rows 0 4 12) || ((w == 9#4) && rowBit rows 0 4 9) || ((w == 10#4) && rowBit rows 0 4 10) || ((w == 11#4) && rowBit rows 0 4 11) || ((w == 12#4) && rowBit rows 0 4 12)) &&
    (((bif (rowBit rows 0 4 0 || firstRowBit b1 0) then 1#4 else 0#4) + (bif (rowBit rows 0 4 1 || firstRowBit b1 1) then 1#4 else 0#4) + (bif (rowBit rows 0 4 2 || firstRowBit b1 2) then 1#4 else 0#4) + (bif (rowBit rows 0 4 3 || firstRowBit b1 3) then 1#4 else 0#4) + (bif (rowBit rows 0 4 4 || firstRowBit b1 4) then 1#4 else 0#4) + (bif (rowBit rows 0 4 5 || firstRowBit b1 5) then 1#4 else 0#4) + (bif (rowBit rows 0 4 6 || firstRowBit b1 6) then 1#4 else 0#4) + (bif (rowBit rows 0 4 7 || firstRowBit b1 7) then 1#4 else 0#4) + (bif (rowBit rows 0 4 8 || firstRowBit b1 8) then 1#4 else 0#4) + (bif (rowBit rows 0 4 9 || firstRowBit b1 9) then 1#4 else 0#4) + (bif (rowBit rows 0 4 10 || firstRowBit b1 10) then 1#4 else 0#4) + (bif (rowBit rows 0 4 11 || firstRowBit b1 11) then 1#4 else 0#4) + (bif (rowBit rows 0 4 12 || firstRowBit b1 12) then 1#4 else 0#4)) == 6#4) &&
    (rowBit rows 0 4 9 || firstRowBit b1 9) &&
    (rowBit rows 0 4 10 || firstRowBit b1 10) &&
    (rowBit rows 0 4 11 || firstRowBit b1 11) &&
    (rowBit rows 0 4 12 || firstRowBit b1 12) &&
    (rankAtom ranks 1).ult (78#7) &&
    (rankAtom ranks 2).ult (78#7) &&
    (rankAtom ranks 3).ult (78#7) &&
    (rankAtom ranks 4).ult (78#7) &&
    (rankAtom ranks 5).ult (78#7) &&
    (rankAtom ranks 6).ult (78#7) &&
    (rankAtom ranks 7).ult (78#7) &&
    (rankAtom ranks 8).ult (78#7) &&
    (rankAtom ranks 9).ult (78#7) &&
    (rankAtom ranks 12).ult (78#7) &&
    (rankAtom ranks 13).ult (78#7) &&
    (rankAtom ranks 14).ult (78#7) &&
    (rankAtom ranks 15).ult (78#7) &&
    (rankAtom ranks 16).ult (78#7) &&
    (rankAtom ranks 17).ult (78#7) &&
    (rankAtom ranks 18).ult (78#7) &&
    (rankAtom ranks 19).ult (78#7) &&
    (rankAtom ranks 20).ult (78#7) &&
    (rankAtom ranks 21).ult (78#7) &&
    (rankAtom ranks 22).ult (78#7) &&
    (rankAtom ranks 23).ult (78#7) &&
    (rankAtom ranks 24).ult (78#7)) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
