/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct008 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (!((firstRowBit b1 6 && firstRowBit b1 11)) || ((rankAtom ranks 43 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 6 && firstRowBit b1 12)) || ((rankAtom ranks 43 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 9)) || ((rankAtom ranks 44 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 10)) || ((rankAtom ranks 44 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 11)) || ((rankAtom ranks 44 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 12)) || ((rankAtom ranks 44 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 9)) || ((rankAtom ranks 45 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 10)) || ((rankAtom ranks 45 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 11)) || ((rankAtom ranks 45 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 12)) || ((rankAtom ranks 45 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 9 && firstRowBit b1 10)) || ((rankAtom ranks 46 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 9 && firstRowBit b1 11)) || ((rankAtom ranks 46 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 9 && firstRowBit b1 12)) || ((rankAtom ranks 46 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 10 && firstRowBit b1 11)) || ((rankAtom ranks 47 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 10 && firstRowBit b1 12)) || ((rankAtom ranks 47 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 11 && firstRowBit b1 12)) || ((rankAtom ranks 48 == rankAtom ranks 49))) &&
    (!((shellBit shell 0 && shellBit shell 1)) || ((rankAtom ranks 7 == rankAtom ranks 18))) &&
    (!((shellBit shell 0 && shellBit shell 2)) || ((rankAtom ranks 7 == rankAtom ranks 28))) &&
    (!((shellBit shell 0 && shellBit shell 3)) || ((rankAtom ranks 7 == rankAtom ranks 37))) &&
    (!((shellBit shell 0 && shellBit shell 4)) || ((rankAtom ranks 7 == rankAtom ranks 45))) &&
    (!((shellBit shell 0 && shellBit shell 5)) || ((rankAtom ranks 7 == rankAtom ranks 52))) &&
    (!((shellBit shell 0 && shellBit shell 6)) || ((rankAtom ranks 7 == rankAtom ranks 58))) &&
    (!((shellBit shell 0 && shellBit shell 7)) || ((rankAtom ranks 7 == rankAtom ranks 63))) &&
    (!((shellBit shell 1 && shellBit shell 2)) || ((rankAtom ranks 18 == rankAtom ranks 28))) &&
    (!((shellBit shell 1 && shellBit shell 3)) || ((rankAtom ranks 18 == rankAtom ranks 37))) &&
    (!((shellBit shell 1 && shellBit shell 4)) || ((rankAtom ranks 18 == rankAtom ranks 45))) &&
    (!((shellBit shell 1 && shellBit shell 5)) || ((rankAtom ranks 18 == rankAtom ranks 52))) &&
    (!((shellBit shell 1 && shellBit shell 6)) || ((rankAtom ranks 18 == rankAtom ranks 58))) &&
    (!((shellBit shell 1 && shellBit shell 7)) || ((rankAtom ranks 18 == rankAtom ranks 63))) &&
    (!((shellBit shell 1 && shellBit shell 9)) || ((rankAtom ranks 18 == rankAtom ranks 68))) &&
    (!((shellBit shell 1 && shellBit shell 10)) || ((rankAtom ranks 18 == rankAtom ranks 69))) &&
    (!((shellBit shell 1 && shellBit shell 11)) || ((rankAtom ranks 18 == rankAtom ranks 70))) &&
    (!((shellBit shell 1 && shellBit shell 12)) || ((rankAtom ranks 18 == rankAtom ranks 71))) &&
    (!((shellBit shell 2 && shellBit shell 3)) || ((rankAtom ranks 28 == rankAtom ranks 37))) &&
    (!((shellBit shell 2 && shellBit shell 4)) || ((rankAtom ranks 28 == rankAtom ranks 45))) &&
    (!((shellBit shell 2 && shellBit shell 5)) || ((rankAtom ranks 28 == rankAtom ranks 52))) &&
    (!((shellBit shell 2 && shellBit shell 6)) || ((rankAtom ranks 28 == rankAtom ranks 58))) &&
    (!((shellBit shell 2 && shellBit shell 7)) || ((rankAtom ranks 28 == rankAtom ranks 63))) &&
    (!((shellBit shell 2 && shellBit shell 9)) || ((rankAtom ranks 28 == rankAtom ranks 68))) &&
    (!((shellBit shell 2 && shellBit shell 10)) || ((rankAtom ranks 28 == rankAtom ranks 69))) &&
    (!((shellBit shell 2 && shellBit shell 11)) || ((rankAtom ranks 28 == rankAtom ranks 70))) &&
    (!((shellBit shell 2 && shellBit shell 12)) || ((rankAtom ranks 28 == rankAtom ranks 71))) &&
    (!((shellBit shell 3 && shellBit shell 4)) || ((rankAtom ranks 37 == rankAtom ranks 45))) &&
    (!((shellBit shell 3 && shellBit shell 5)) || ((rankAtom ranks 37 == rankAtom ranks 52))) &&
    (!((shellBit shell 3 && shellBit shell 6)) || ((rankAtom ranks 37 == rankAtom ranks 58))) &&
    (!((shellBit shell 3 && shellBit shell 7)) || ((rankAtom ranks 37 == rankAtom ranks 63))) &&
    (!((shellBit shell 3 && shellBit shell 9)) || ((rankAtom ranks 37 == rankAtom ranks 68))) &&
    (!((shellBit shell 3 && shellBit shell 10)) || ((rankAtom ranks 37 == rankAtom ranks 69))) &&
    (!((shellBit shell 3 && shellBit shell 11)) || ((rankAtom ranks 37 == rankAtom ranks 70))) &&
    (!((shellBit shell 3 && shellBit shell 12)) || ((rankAtom ranks 37 == rankAtom ranks 71))) &&
    (!((shellBit shell 4 && shellBit shell 9)) || ((rankAtom ranks 45 == rankAtom ranks 68))) &&
    (!((shellBit shell 4 && shellBit shell 11)) || ((rankAtom ranks 45 == rankAtom ranks 70))) &&
    (!((shellBit shell 4 && shellBit shell 12)) || ((rankAtom ranks 45 == rankAtom ranks 71))) &&
    (!((shellBit shell 5 && shellBit shell 7)) || ((rankAtom ranks 52 == rankAtom ranks 63))) &&
    (!((shellBit shell 5 && shellBit shell 9)) || ((rankAtom ranks 52 == rankAtom ranks 68))) &&
    (!((shellBit shell 5 && shellBit shell 10)) || ((rankAtom ranks 52 == rankAtom ranks 69))) &&
    (!((shellBit shell 5 && shellBit shell 11)) || ((rankAtom ranks 52 == rankAtom ranks 70))) &&
    (!((shellBit shell 5 && shellBit shell 12)) || ((rankAtom ranks 52 == rankAtom ranks 71))) &&
    (!((shellBit shell 6 && shellBit shell 7)) || ((rankAtom ranks 58 == rankAtom ranks 63))) &&
    (!((rankAtom ranks 1 == rankAtom ranks 4)) || ((rankAtom ranks 12).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 1 == rankAtom ranks 5)) || ((rankAtom ranks 12).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 1 == rankAtom ranks 6)) || ((rankAtom ranks 12).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 28).ult (rankAtom ranks 1))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 0).ult (rankAtom ranks 1)))

@[bv_normalize]
theorem direct008_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct008 rows blockers shell q w b1 ranks = ((!((firstRowBit b1 6 && firstRowBit b1 11)) || ((rankAtom ranks 43 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 6 && firstRowBit b1 12)) || ((rankAtom ranks 43 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 9)) || ((rankAtom ranks 44 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 10)) || ((rankAtom ranks 44 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 11)) || ((rankAtom ranks 44 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 7 && firstRowBit b1 12)) || ((rankAtom ranks 44 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 9)) || ((rankAtom ranks 45 == rankAtom ranks 46))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 10)) || ((rankAtom ranks 45 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 11)) || ((rankAtom ranks 45 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 8 && firstRowBit b1 12)) || ((rankAtom ranks 45 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 9 && firstRowBit b1 10)) || ((rankAtom ranks 46 == rankAtom ranks 47))) &&
    (!((firstRowBit b1 9 && firstRowBit b1 11)) || ((rankAtom ranks 46 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 9 && firstRowBit b1 12)) || ((rankAtom ranks 46 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 10 && firstRowBit b1 11)) || ((rankAtom ranks 47 == rankAtom ranks 48))) &&
    (!((firstRowBit b1 10 && firstRowBit b1 12)) || ((rankAtom ranks 47 == rankAtom ranks 49))) &&
    (!((firstRowBit b1 11 && firstRowBit b1 12)) || ((rankAtom ranks 48 == rankAtom ranks 49))) &&
    (!((shellBit shell 0 && shellBit shell 1)) || ((rankAtom ranks 7 == rankAtom ranks 18))) &&
    (!((shellBit shell 0 && shellBit shell 2)) || ((rankAtom ranks 7 == rankAtom ranks 28))) &&
    (!((shellBit shell 0 && shellBit shell 3)) || ((rankAtom ranks 7 == rankAtom ranks 37))) &&
    (!((shellBit shell 0 && shellBit shell 4)) || ((rankAtom ranks 7 == rankAtom ranks 45))) &&
    (!((shellBit shell 0 && shellBit shell 5)) || ((rankAtom ranks 7 == rankAtom ranks 52))) &&
    (!((shellBit shell 0 && shellBit shell 6)) || ((rankAtom ranks 7 == rankAtom ranks 58))) &&
    (!((shellBit shell 0 && shellBit shell 7)) || ((rankAtom ranks 7 == rankAtom ranks 63))) &&
    (!((shellBit shell 1 && shellBit shell 2)) || ((rankAtom ranks 18 == rankAtom ranks 28))) &&
    (!((shellBit shell 1 && shellBit shell 3)) || ((rankAtom ranks 18 == rankAtom ranks 37))) &&
    (!((shellBit shell 1 && shellBit shell 4)) || ((rankAtom ranks 18 == rankAtom ranks 45))) &&
    (!((shellBit shell 1 && shellBit shell 5)) || ((rankAtom ranks 18 == rankAtom ranks 52))) &&
    (!((shellBit shell 1 && shellBit shell 6)) || ((rankAtom ranks 18 == rankAtom ranks 58))) &&
    (!((shellBit shell 1 && shellBit shell 7)) || ((rankAtom ranks 18 == rankAtom ranks 63))) &&
    (!((shellBit shell 1 && shellBit shell 9)) || ((rankAtom ranks 18 == rankAtom ranks 68))) &&
    (!((shellBit shell 1 && shellBit shell 10)) || ((rankAtom ranks 18 == rankAtom ranks 69))) &&
    (!((shellBit shell 1 && shellBit shell 11)) || ((rankAtom ranks 18 == rankAtom ranks 70))) &&
    (!((shellBit shell 1 && shellBit shell 12)) || ((rankAtom ranks 18 == rankAtom ranks 71))) &&
    (!((shellBit shell 2 && shellBit shell 3)) || ((rankAtom ranks 28 == rankAtom ranks 37))) &&
    (!((shellBit shell 2 && shellBit shell 4)) || ((rankAtom ranks 28 == rankAtom ranks 45))) &&
    (!((shellBit shell 2 && shellBit shell 5)) || ((rankAtom ranks 28 == rankAtom ranks 52))) &&
    (!((shellBit shell 2 && shellBit shell 6)) || ((rankAtom ranks 28 == rankAtom ranks 58))) &&
    (!((shellBit shell 2 && shellBit shell 7)) || ((rankAtom ranks 28 == rankAtom ranks 63))) &&
    (!((shellBit shell 2 && shellBit shell 9)) || ((rankAtom ranks 28 == rankAtom ranks 68))) &&
    (!((shellBit shell 2 && shellBit shell 10)) || ((rankAtom ranks 28 == rankAtom ranks 69))) &&
    (!((shellBit shell 2 && shellBit shell 11)) || ((rankAtom ranks 28 == rankAtom ranks 70))) &&
    (!((shellBit shell 2 && shellBit shell 12)) || ((rankAtom ranks 28 == rankAtom ranks 71))) &&
    (!((shellBit shell 3 && shellBit shell 4)) || ((rankAtom ranks 37 == rankAtom ranks 45))) &&
    (!((shellBit shell 3 && shellBit shell 5)) || ((rankAtom ranks 37 == rankAtom ranks 52))) &&
    (!((shellBit shell 3 && shellBit shell 6)) || ((rankAtom ranks 37 == rankAtom ranks 58))) &&
    (!((shellBit shell 3 && shellBit shell 7)) || ((rankAtom ranks 37 == rankAtom ranks 63))) &&
    (!((shellBit shell 3 && shellBit shell 9)) || ((rankAtom ranks 37 == rankAtom ranks 68))) &&
    (!((shellBit shell 3 && shellBit shell 10)) || ((rankAtom ranks 37 == rankAtom ranks 69))) &&
    (!((shellBit shell 3 && shellBit shell 11)) || ((rankAtom ranks 37 == rankAtom ranks 70))) &&
    (!((shellBit shell 3 && shellBit shell 12)) || ((rankAtom ranks 37 == rankAtom ranks 71))) &&
    (!((shellBit shell 4 && shellBit shell 9)) || ((rankAtom ranks 45 == rankAtom ranks 68))) &&
    (!((shellBit shell 4 && shellBit shell 11)) || ((rankAtom ranks 45 == rankAtom ranks 70))) &&
    (!((shellBit shell 4 && shellBit shell 12)) || ((rankAtom ranks 45 == rankAtom ranks 71))) &&
    (!((shellBit shell 5 && shellBit shell 7)) || ((rankAtom ranks 52 == rankAtom ranks 63))) &&
    (!((shellBit shell 5 && shellBit shell 9)) || ((rankAtom ranks 52 == rankAtom ranks 68))) &&
    (!((shellBit shell 5 && shellBit shell 10)) || ((rankAtom ranks 52 == rankAtom ranks 69))) &&
    (!((shellBit shell 5 && shellBit shell 11)) || ((rankAtom ranks 52 == rankAtom ranks 70))) &&
    (!((shellBit shell 5 && shellBit shell 12)) || ((rankAtom ranks 52 == rankAtom ranks 71))) &&
    (!((shellBit shell 6 && shellBit shell 7)) || ((rankAtom ranks 58 == rankAtom ranks 63))) &&
    (!((rankAtom ranks 1 == rankAtom ranks 4)) || ((rankAtom ranks 12).ult (rankAtom ranks 15))) &&
    (!((rankAtom ranks 1 == rankAtom ranks 5)) || ((rankAtom ranks 12).ult (rankAtom ranks 16))) &&
    (!((rankAtom ranks 1 == rankAtom ranks 6)) || ((rankAtom ranks 12).ult (rankAtom ranks 17))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 0)) || ((rankAtom ranks 28).ult (rankAtom ranks 1))) &&
    (!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 0).ult (rankAtom ranks 1)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
