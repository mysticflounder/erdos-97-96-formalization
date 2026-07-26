/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct027 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (!((rankAtom ranks 43 == rankAtom ranks 59)) || ((rankAtom ranks 42).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 60)) || ((rankAtom ranks 42).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 61)) || ((rankAtom ranks 42).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 62)) || ((rankAtom ranks 42).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 45)) || ((rankAtom ranks 51).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 45).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 64).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 51).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 46).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 51).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 47).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 51).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 48).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 49).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 46).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 47).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 48).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 49).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 53).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 53).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 54).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 54).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 55).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 43)) || ((rankAtom ranks 63).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 45).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))

@[bv_normalize]
theorem direct027_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct027 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 43 == rankAtom ranks 59)) || ((rankAtom ranks 42).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 42)) || ((rankAtom ranks 59).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 46).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 60)) || ((rankAtom ranks 42).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 42)) || ((rankAtom ranks 60).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 47).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 61)) || ((rankAtom ranks 42).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 61).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 48).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 62)) || ((rankAtom ranks 42).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 62).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 50).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 49).ult (rankAtom ranks 43))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 45)) || ((rankAtom ranks 51).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 45).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 64).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 51).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 46).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 51).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 47).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 51).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 48).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 49).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 46).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 47).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 48).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 49).ult (rankAtom ranks 45))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 53).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 53).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 46))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 54).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 54).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 55).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 49).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 43)) || ((rankAtom ranks 63).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 45).ult (rankAtom ranks 44))) &&
    (!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
