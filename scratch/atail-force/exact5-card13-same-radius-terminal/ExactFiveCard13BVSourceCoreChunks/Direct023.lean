/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct023 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 25).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 25)) || ((rankAtom ranks 63).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 25).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 28).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 51).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 29).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 51).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 30).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 51).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 31).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 51).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 32).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 68).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 25).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 52).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 69).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 25).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 52).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 70).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 25).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 52).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 71).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 25).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 52).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 57).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 29).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 57).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 30).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 57).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 31).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))

@[bv_normalize]
theorem direct023_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct023 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 31).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 62)) || ((rankAtom ranks 25).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 26))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 25)) || ((rankAtom ranks 63).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 63)) || ((rankAtom ranks 25).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 52))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 28).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 51).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 29).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 51).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 30).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 51).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 31).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 51).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 32).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 68).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 25).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 52).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 69).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 25).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 52).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 70).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 25).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 52).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 28))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 71).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 25).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 52).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 57).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 29).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 57).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 30).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 57).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 31).ult (rankAtom ranks 27))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
