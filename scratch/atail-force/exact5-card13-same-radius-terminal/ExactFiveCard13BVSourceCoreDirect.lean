/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVSourceCoreChunks.Direct000
import ExactFiveCard13BVSourceCoreChunks.Direct001
import ExactFiveCard13BVSourceCoreChunks.Direct002
import ExactFiveCard13BVSourceCoreChunks.Direct003
import ExactFiveCard13BVSourceCoreChunks.Direct004
import ExactFiveCard13BVSourceCoreChunks.Direct005
import ExactFiveCard13BVSourceCoreChunks.Direct006
import ExactFiveCard13BVSourceCoreChunks.Direct007
import ExactFiveCard13BVSourceCoreChunks.Direct008
import ExactFiveCard13BVSourceCoreChunks.Direct009
import ExactFiveCard13BVSourceCoreChunks.Direct010
import ExactFiveCard13BVSourceCoreChunks.Direct011
import ExactFiveCard13BVSourceCoreChunks.Direct012
import ExactFiveCard13BVSourceCoreChunks.Direct013
import ExactFiveCard13BVSourceCoreChunks.Direct014
import ExactFiveCard13BVSourceCoreChunks.Direct015
import ExactFiveCard13BVSourceCoreChunks.Direct016
import ExactFiveCard13BVSourceCoreChunks.Direct017
import ExactFiveCard13BVSourceCoreChunks.Direct018
import ExactFiveCard13BVSourceCoreChunks.Direct019
import ExactFiveCard13BVSourceCoreChunks.Direct020
import ExactFiveCard13BVSourceCoreChunks.Direct021
import ExactFiveCard13BVSourceCoreChunks.Direct022
import ExactFiveCard13BVSourceCoreChunks.Direct023
import ExactFiveCard13BVSourceCoreChunks.Direct024
import ExactFiveCard13BVSourceCoreChunks.Direct025
import ExactFiveCard13BVSourceCoreChunks.Direct026
import ExactFiveCard13BVSourceCoreChunks.Direct027
import ExactFiveCard13BVSourceCoreChunks.Direct028
import ExactFiveCard13BVSourceCoreChunks.Direct029
import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000

def directCoreAntecedent (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) : Bool :=
  direct000 rows blockers shell q w b1 ranks &&
    direct001 rows blockers shell q w b1 ranks &&
    direct002 rows blockers shell q w b1 ranks &&
    direct003 rows blockers shell q w b1 ranks &&
    direct004 rows blockers shell q w b1 ranks &&
    direct005 rows blockers shell q w b1 ranks &&
    direct006 rows blockers shell q w b1 ranks &&
    direct007 rows blockers shell q w b1 ranks &&
    direct008 rows blockers shell q w b1 ranks &&
    direct009 rows blockers shell q w b1 ranks &&
    direct010 rows blockers shell q w b1 ranks &&
    direct011 rows blockers shell q w b1 ranks &&
    direct012 rows blockers shell q w b1 ranks &&
    direct013 rows blockers shell q w b1 ranks &&
    direct014 rows blockers shell q w b1 ranks &&
    direct015 rows blockers shell q w b1 ranks &&
    direct016 rows blockers shell q w b1 ranks &&
    direct017 rows blockers shell q w b1 ranks &&
    direct018 rows blockers shell q w b1 ranks &&
    direct019 rows blockers shell q w b1 ranks &&
    direct020 rows blockers shell q w b1 ranks &&
    direct021 rows blockers shell q w b1 ranks &&
    direct022 rows blockers shell q w b1 ranks &&
    direct023 rows blockers shell q w b1 ranks &&
    direct024 rows blockers shell q w b1 ranks &&
    direct025 rows blockers shell q w b1 ranks &&
    direct026 rows blockers shell q w b1 ranks &&
    direct027 rows blockers shell q w b1 ranks &&
    direct028 rows blockers shell q w b1 ranks &&
    direct029 rows blockers shell q w b1 ranks

@[bv_normalize]
theorem directCoreAntecedent_eq (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    directCoreAntecedent rows blockers shell q w b1 ranks = (direct000 rows blockers shell q w b1 ranks &&
    direct001 rows blockers shell q w b1 ranks &&
    direct002 rows blockers shell q w b1 ranks &&
    direct003 rows blockers shell q w b1 ranks &&
    direct004 rows blockers shell q w b1 ranks &&
    direct005 rows blockers shell q w b1 ranks &&
    direct006 rows blockers shell q w b1 ranks &&
    direct007 rows blockers shell q w b1 ranks &&
    direct008 rows blockers shell q w b1 ranks &&
    direct009 rows blockers shell q w b1 ranks &&
    direct010 rows blockers shell q w b1 ranks &&
    direct011 rows blockers shell q w b1 ranks &&
    direct012 rows blockers shell q w b1 ranks &&
    direct013 rows blockers shell q w b1 ranks &&
    direct014 rows blockers shell q w b1 ranks &&
    direct015 rows blockers shell q w b1 ranks &&
    direct016 rows blockers shell q w b1 ranks &&
    direct017 rows blockers shell q w b1 ranks &&
    direct018 rows blockers shell q w b1 ranks &&
    direct019 rows blockers shell q w b1 ranks &&
    direct020 rows blockers shell q w b1 ranks &&
    direct021 rows blockers shell q w b1 ranks &&
    direct022 rows blockers shell q w b1 ranks &&
    direct023 rows blockers shell q w b1 ranks &&
    direct024 rows blockers shell q w b1 ranks &&
    direct025 rows blockers shell q w b1 ranks &&
    direct026 rows blockers shell q w b1 ranks &&
    direct027 rows blockers shell q w b1 ranks &&
    direct028 rows blockers shell q w b1 ranks &&
    direct029 rows blockers shell q w b1 ranks) := rfl

set_option trace.Meta.Tactic.bv true in
set_option trace.Meta.Tactic.sat true in
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem directCoreAntecedent_false (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    directCoreAntecedent rows blockers shell q w b1 ranks = false := by
  bv_decide? (config := { maxSteps := 100000000, timeout := 600 })

end Problem97.ATailExactFiveCard13BVCircuit
