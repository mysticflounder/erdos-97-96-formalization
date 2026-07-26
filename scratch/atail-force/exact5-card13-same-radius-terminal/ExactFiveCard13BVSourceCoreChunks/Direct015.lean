/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def direct015 (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  (!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 8).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 51).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 66).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 51).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 51).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 68).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 52)) || ((rankAtom ranks 8).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 71).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 5).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 64).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 57).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 8).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 65).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 57).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 9).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 57).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 57).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 68).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 69).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 70).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 10).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 68).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 70).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 71).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 34).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 15).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 35).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 16).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 36).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 17).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 37).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 12).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 23).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 18).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 38).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 39).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 40).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 41).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 42).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 12).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 43).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 12).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 44).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 45).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 12).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 24).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 18).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))

@[bv_normalize]
theorem direct015_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    direct015 rows blockers shell q w b1 ranks = ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 8).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 51).ult (rankAtom ranks 54))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 66).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 51).ult (rankAtom ranks 55))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 51).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 68).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 52)) || ((rankAtom ranks 8).ult (rankAtom ranks 53))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 71).ult (rankAtom ranks 56))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 63)) || ((rankAtom ranks 5).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 5)) || ((rankAtom ranks 63).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 58))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 7)) || ((rankAtom ranks 57).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 7).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 64).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 8)) || ((rankAtom ranks 57).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 8).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 65).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 57).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 57)) || ((rankAtom ranks 9).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 5)) || ((rankAtom ranks 66).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 57).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 67).ult (rankAtom ranks 6))) &&
    (!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 57).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 68).ult (rankAtom ranks 59))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 69).ult (rankAtom ranks 60))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 70).ult (rankAtom ranks 61))) &&
    (!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 10).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 62))) &&
    (!((rankAtom ranks 62 == rankAtom ranks 5)) || ((rankAtom ranks 71).ult (rankAtom ranks 7))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 68).ult (rankAtom ranks 64))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 70).ult (rankAtom ranks 66))) &&
    (!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 71).ult (rankAtom ranks 67))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 34).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 15).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 35).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 16).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 36).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 17).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 37).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 12).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 23).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 18).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 38).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 39).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 40).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 41).ult (rankAtom ranks 13))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 42).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 12).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 43).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 12).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 44).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 45).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 12).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 24).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 18).ult (rankAtom ranks 14))) &&
    (!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
