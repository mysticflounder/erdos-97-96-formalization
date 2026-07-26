/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct003 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (rankAtom ranks 25).ult (78#7) &&
    (rankAtom ranks 26).ult (78#7) &&
    (rankAtom ranks 27).ult (78#7) &&
    (rankAtom ranks 28).ult (78#7) &&
    (rankAtom ranks 29).ult (78#7) &&
    (rankAtom ranks 30).ult (78#7) &&
    (rankAtom ranks 31).ult (78#7) &&
    (rankAtom ranks 32).ult (78#7) &&
    (rankAtom ranks 34).ult (78#7) &&
    (rankAtom ranks 35).ult (78#7) &&
    (rankAtom ranks 36).ult (78#7) &&
    (rankAtom ranks 37).ult (78#7) &&
    (rankAtom ranks 38).ult (78#7) &&
    (rankAtom ranks 39).ult (78#7) &&
    (rankAtom ranks 40).ult (78#7) &&
    (rankAtom ranks 41).ult (78#7) &&
    (rankAtom ranks 42).ult (78#7) &&
    (rankAtom ranks 43).ult (78#7) &&
    (rankAtom ranks 44).ult (78#7) &&
    (rankAtom ranks 45).ult (78#7) &&
    (rankAtom ranks 46).ult (78#7) &&
    (rankAtom ranks 47).ult (78#7) &&
    (rankAtom ranks 48).ult (78#7) &&
    (rankAtom ranks 49).ult (78#7) &&
    (rankAtom ranks 50).ult (78#7) &&
    (rankAtom ranks 51).ult (78#7) &&
    (rankAtom ranks 52).ult (78#7) &&
    (rankAtom ranks 53).ult (78#7) &&
    (rankAtom ranks 54).ult (78#7) &&
    (rankAtom ranks 55).ult (78#7) &&
    (rankAtom ranks 56).ult (78#7) &&
    (rankAtom ranks 57).ult (78#7) &&
    (rankAtom ranks 58).ult (78#7) &&
    (rankAtom ranks 59).ult (78#7) &&
    (rankAtom ranks 60).ult (78#7) &&
    (rankAtom ranks 61).ult (78#7) &&
    (rankAtom ranks 62).ult (78#7) &&
    (rankAtom ranks 63).ult (78#7) &&
    (rankAtom ranks 64).ult (78#7) &&
    (rankAtom ranks 65).ult (78#7) &&
    (rankAtom ranks 66).ult (78#7) &&
    (rankAtom ranks 67).ult (78#7) &&
    (rankAtom ranks 69).ult (78#7) &&
    (rankAtom ranks 70).ult (78#7) &&
    (rankAtom ranks 71).ult (78#7) &&
    (!((rowBit rows 0 0 1 && rowBit rows 0 0 5)) || ((rankAtom ranks 0 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 1 && rowBit rows 0 0 6)) || ((rankAtom ranks 0 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 1 && rowBit rows 0 0 7)) || ((rankAtom ranks 0 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 2 && rowBit rows 0 0 5)) || ((rankAtom ranks 1 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 2 && rowBit rows 0 0 6)) || ((rankAtom ranks 1 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 2 && rowBit rows 0 0 7)) || ((rankAtom ranks 1 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 5)) || ((rankAtom ranks 2 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 6)) || ((rankAtom ranks 2 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 7)) || ((rankAtom ranks 2 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 8)) || ((rankAtom ranks 2 == rankAtom ranks 7))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 5)) || ((rankAtom ranks 3 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 6)) || ((rankAtom ranks 3 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 7)) || ((rankAtom ranks 3 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 8)) || ((rankAtom ranks 3 == rankAtom ranks 7))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 9)) || ((rankAtom ranks 3 == rankAtom ranks 8))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 10)) || ((rankAtom ranks 3 == rankAtom ranks 9))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 11)) || ((rankAtom ranks 3 == rankAtom ranks 10))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 12)) || ((rankAtom ranks 3 == rankAtom ranks 11))) &&
    (!((rowBit rows 0 0 5 && rowBit rows 0 0 6)) || ((rankAtom ranks 4 == rankAtom ranks 5)))

@[bv_normalize]
theorem direct003_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct003 rows blockers shell q w b1 ranks = ((rankAtom ranks 25).ult (78#7) &&
    (rankAtom ranks 26).ult (78#7) &&
    (rankAtom ranks 27).ult (78#7) &&
    (rankAtom ranks 28).ult (78#7) &&
    (rankAtom ranks 29).ult (78#7) &&
    (rankAtom ranks 30).ult (78#7) &&
    (rankAtom ranks 31).ult (78#7) &&
    (rankAtom ranks 32).ult (78#7) &&
    (rankAtom ranks 34).ult (78#7) &&
    (rankAtom ranks 35).ult (78#7) &&
    (rankAtom ranks 36).ult (78#7) &&
    (rankAtom ranks 37).ult (78#7) &&
    (rankAtom ranks 38).ult (78#7) &&
    (rankAtom ranks 39).ult (78#7) &&
    (rankAtom ranks 40).ult (78#7) &&
    (rankAtom ranks 41).ult (78#7) &&
    (rankAtom ranks 42).ult (78#7) &&
    (rankAtom ranks 43).ult (78#7) &&
    (rankAtom ranks 44).ult (78#7) &&
    (rankAtom ranks 45).ult (78#7) &&
    (rankAtom ranks 46).ult (78#7) &&
    (rankAtom ranks 47).ult (78#7) &&
    (rankAtom ranks 48).ult (78#7) &&
    (rankAtom ranks 49).ult (78#7) &&
    (rankAtom ranks 50).ult (78#7) &&
    (rankAtom ranks 51).ult (78#7) &&
    (rankAtom ranks 52).ult (78#7) &&
    (rankAtom ranks 53).ult (78#7) &&
    (rankAtom ranks 54).ult (78#7) &&
    (rankAtom ranks 55).ult (78#7) &&
    (rankAtom ranks 56).ult (78#7) &&
    (rankAtom ranks 57).ult (78#7) &&
    (rankAtom ranks 58).ult (78#7) &&
    (rankAtom ranks 59).ult (78#7) &&
    (rankAtom ranks 60).ult (78#7) &&
    (rankAtom ranks 61).ult (78#7) &&
    (rankAtom ranks 62).ult (78#7) &&
    (rankAtom ranks 63).ult (78#7) &&
    (rankAtom ranks 64).ult (78#7) &&
    (rankAtom ranks 65).ult (78#7) &&
    (rankAtom ranks 66).ult (78#7) &&
    (rankAtom ranks 67).ult (78#7) &&
    (rankAtom ranks 69).ult (78#7) &&
    (rankAtom ranks 70).ult (78#7) &&
    (rankAtom ranks 71).ult (78#7) &&
    (!((rowBit rows 0 0 1 && rowBit rows 0 0 5)) || ((rankAtom ranks 0 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 1 && rowBit rows 0 0 6)) || ((rankAtom ranks 0 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 1 && rowBit rows 0 0 7)) || ((rankAtom ranks 0 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 2 && rowBit rows 0 0 5)) || ((rankAtom ranks 1 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 2 && rowBit rows 0 0 6)) || ((rankAtom ranks 1 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 2 && rowBit rows 0 0 7)) || ((rankAtom ranks 1 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 5)) || ((rankAtom ranks 2 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 6)) || ((rankAtom ranks 2 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 7)) || ((rankAtom ranks 2 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 3 && rowBit rows 0 0 8)) || ((rankAtom ranks 2 == rankAtom ranks 7))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 5)) || ((rankAtom ranks 3 == rankAtom ranks 4))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 6)) || ((rankAtom ranks 3 == rankAtom ranks 5))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 7)) || ((rankAtom ranks 3 == rankAtom ranks 6))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 8)) || ((rankAtom ranks 3 == rankAtom ranks 7))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 9)) || ((rankAtom ranks 3 == rankAtom ranks 8))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 10)) || ((rankAtom ranks 3 == rankAtom ranks 9))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 11)) || ((rankAtom ranks 3 == rankAtom ranks 10))) &&
    (!((rowBit rows 0 0 4 && rowBit rows 0 0 12)) || ((rankAtom ranks 3 == rankAtom ranks 11))) &&
    (!((rowBit rows 0 0 5 && rowBit rows 0 0 6)) || ((rankAtom ranks 4 == rankAtom ranks 5)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
