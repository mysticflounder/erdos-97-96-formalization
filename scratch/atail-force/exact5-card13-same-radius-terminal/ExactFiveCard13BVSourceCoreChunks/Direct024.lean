/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct024 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (!((rankAtom ranks 62 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 32).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 68).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 26).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 58).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 69).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 26).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 58).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 70).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 26).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 71).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 26).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 68).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 27).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 29).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 69).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 27).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 30).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 70).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 27).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 31).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 71).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 27).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 32).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 33).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 35)) || ((rankAtom ranks 42).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 52)) || ((rankAtom ranks 33).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 37).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 42).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 53).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 54).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 55).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 56).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 57)) || ((rankAtom ranks 33).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 37).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 59).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 60).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))

@[bv_normalize]
theorem direct024_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct024 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 62 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 32).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 68).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 26).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 58).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 69).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 26).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 58).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 70).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 26).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 71).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 26).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 68).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 27).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 29).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 69).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 27).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 30).ult (rankAtom ranks 65))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 70).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 27).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 31).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 71).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 27).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 32).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 33).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 35)) || ((rankAtom ranks 42).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 35).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 36).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 52)) || ((rankAtom ranks 33).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 37).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 42).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 53).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 38).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 54).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 39).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 55).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 40).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 56).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 41).ult (rankAtom ranks 34))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 57)) || ((rankAtom ranks 33).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 36).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 37).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 37)) || ((rankAtom ranks 43).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 33)) || ((rankAtom ranks 59).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 38).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 60).ult (rankAtom ranks 35))) &&
    (!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
