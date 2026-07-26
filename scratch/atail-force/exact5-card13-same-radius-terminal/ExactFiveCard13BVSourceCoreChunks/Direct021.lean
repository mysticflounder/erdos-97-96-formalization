/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct021 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 38).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 38).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 38).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 39).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 39).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 40).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 24)) || ((rankAtom ranks 50).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 42).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 27).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 24).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 28).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 53).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 54).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 55).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 31).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 56).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 32).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 24).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 43).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 27).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 24).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 28).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 59).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 24).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 43).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 60).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 24).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 43).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 61).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 43).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 24).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 62).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 43).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 26)))

@[bv_normalize]
theorem direct021_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct021 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 38).ult (rankAtom ranks 39))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 38).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 38).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 39).ult (rankAtom ranks 40))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 39).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 40).ult (rankAtom ranks 41))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 24)) || ((rankAtom ranks 50).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 26)) || ((rankAtom ranks 42).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 26).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 27)) || ((rankAtom ranks 42).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 27).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 52)) || ((rankAtom ranks 24).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 28).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 42).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 53).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 29).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 54).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 30).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 55).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 31).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 56).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 24).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 32).ult (rankAtom ranks 25))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 57)) || ((rankAtom ranks 24).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 27)) || ((rankAtom ranks 43).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 27).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 58)) || ((rankAtom ranks 24).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 28).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 28)) || ((rankAtom ranks 43).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 59).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 24).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 29)) || ((rankAtom ranks 43).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 29).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 60).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 24).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 30)) || ((rankAtom ranks 43).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 47))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 30).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 61).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 31)) || ((rankAtom ranks 43).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 48))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 31).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 24).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 62).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 43).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 49))) &&
    (!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 32).ult (rankAtom ranks 26)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
