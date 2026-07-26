/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct020 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 53).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 53)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 29)) || ((rankAtom ranks 34).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 54).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 55).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 56).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 32)) || ((rankAtom ranks 34).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 57).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 23).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 35).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 28).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 59).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 35).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 60).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 35).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 61).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 35).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 62).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 35).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 23).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 64).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 36).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 65).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 36).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 66).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 36).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 67).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 36).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 68).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 37).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 29).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 69).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 37).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 30).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 70).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 37).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 31).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 71).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 37).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 32).ult (rankAtom ranks 41)))

@[bv_normalize]
theorem direct020_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct020 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 23).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 34).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 53).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 53)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 29)) || ((rankAtom ranks 34).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 54).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 55).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 56).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 32)) || ((rankAtom ranks 34).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 57).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 23).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 35).ult (rankAtom ranks 36))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 58).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 23).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 35).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 28).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 59).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 59)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 35).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 60).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 60)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 35).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 61).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 61)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 35).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 62).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 35).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 23)) || ((rankAtom ranks 63).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 23).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 37))) &&
    (!((rankAtom ranks 37 == rankAtom ranks 28)) || ((rankAtom ranks 36).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 64).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 36).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 65).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 36).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 66).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 36).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 67).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 36).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 68).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 23).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 37).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 29).ult (rankAtom ranks 38))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 69).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 23).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 37).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 30).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 70).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 23).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 37).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 31).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 71).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 23).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 37).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 32).ult (rankAtom ranks 41)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
