import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk061Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1104, bvar 1106, bvar 155, bvar 157]),
    bnot (bands [bvar 1105, bvar 1106, bvar 156, bvar 157]),
    bnot (bands [bvar 1094, bvar 1097, bvar 158, bvar 161]),
    bnot (bands [bvar 1094, bvar 1105, bvar 158, bvar 169]),
    bnot (bands [bvar 1094, bvar 1106, bvar 158, bvar 170]),
    bnot (bands [bvar 1095, bvar 1105, bvar 159, bvar 169]),
    bnot (bands [bvar 1095, bvar 1106, bvar 159, bvar 170]),
    bnot (bands [bvar 1096, bvar 1105, bvar 160, bvar 169]),
    bnot (bands [bvar 1096, bvar 1106, bvar 160, bvar 170]),
    bnot (bands [bvar 1097, bvar 1105, bvar 161, bvar 169]),
    bnot (bands [bvar 1097, bvar 1106, bvar 161, bvar 170]),
    bnot (bands [bvar 1099, bvar 1102, bvar 163, bvar 166]),
    bnot (bands [bvar 1099, bvar 1103, bvar 163, bvar 167]),
    bnot (bands [bvar 1100, bvar 1102, bvar 164, bvar 166]),
    bnot (bands [bvar 1100, bvar 1103, bvar 164, bvar 167]),
    bnot (bands [bvar 1101, bvar 1103, bvar 165, bvar 167]),
    bnot (bands [bvar 1102, bvar 1103, bvar 166, bvar 167]),
    bnot (bands [bvar 1094, bvar 1096, bvar 171, bvar 173]),
    bnot (bands [bvar 1094, bvar 1106, bvar 171, bvar 183]),
    bnot (bands [bvar 1095, bvar 1106, bvar 172, bvar 183]),
    bnot (bands [bvar 1096, bvar 1106, bvar 173, bvar 183]),
    bnot (bands [bvar 1097, bvar 1106, bvar 174, bvar 183]),
    bnot (bands [bvar 1099, bvar 1103, bvar 176, bvar 180]),
    bnot (bands [bvar 1100, bvar 1103, bvar 177, bvar 180]),
    bnot (bands [bvar 1100, bvar 1104, bvar 177, bvar 181]),
    bnot (bands [bvar 1101, bvar 1103, bvar 178, bvar 180]),
    bnot (bands [bvar 1102, bvar 1103, bvar 179, bvar 180]),
    bnot (bands [bvar 1102, bvar 1104, bvar 179, bvar 181]),
    bnot (bands [bvar 1099, bvar 1103, bvar 189, bvar 193]),
    bnot (bands [bvar 1100, bvar 1103, bvar 190, bvar 193]),
    bnot (bands [bvar 1101, bvar 1104, bvar 191, bvar 194]),
    bnot (bands [bvar 1101, bvar 1105, bvar 191, bvar 195]),
    bnot (bands [bvar 1102, bvar 1105, bvar 192, bvar 195]),
    bnot (bands [bvar 1103, bvar 1105, bvar 193, bvar 195]),
    bnot (bands [bvar 1104, bvar 1105, bvar 194, bvar 195]),
    bnot (bands [bvar 1109, bvar 1111, bvar 108, bvar 110]),
    bnot (bands [bvar 1109, bvar 1114, bvar 108, bvar 113]),
    bnot (bands [bvar 1109, bvar 1115, bvar 108, bvar 114]),
    bnot (bands [bvar 1109, bvar 1116, bvar 108, bvar 115]),
    bnot (bands [bvar 1109, bvar 1117, bvar 108, bvar 116]),
    bnot (bands [bvar 1110, bvar 1111, bvar 109, bvar 110]),
    bnot (bands [bvar 1110, bvar 1114, bvar 109, bvar 113]),
    bnot (bands [bvar 1110, bvar 1115, bvar 109, bvar 114]),
    bnot (bands [bvar 1110, bvar 1116, bvar 109, bvar 115]),
    bnot (bands [bvar 1110, bvar 1118, bvar 109, bvar 117]),
    bnot (bands [bvar 1110, bvar 1119, bvar 109, bvar 118]),
    bnot (bands [bvar 1111, bvar 1114, bvar 110, bvar 113]),
    bnot (bands [bvar 1111, bvar 1115, bvar 110, bvar 114]),
    bnot (bands [bvar 1111, bvar 1116, bvar 110, bvar 115]),
    bnot (bands [bvar 1111, bvar 1117, bvar 110, bvar 116]),
    bnot (bands [bvar 1111, bvar 1118, bvar 110, bvar 117]),
    bnot (bands [bvar 1111, bvar 1119, bvar 110, bvar 118]),
    bnot (bands [bvar 1114, bvar 1115, bvar 113, bvar 114]),
    bnot (bands [bvar 1114, bvar 1116, bvar 113, bvar 115]),
    bnot (bands [bvar 1114, bvar 1117, bvar 113, bvar 116]),
    bnot (bands [bvar 1114, bvar 1118, bvar 113, bvar 117]),
    bnot (bands [bvar 1114, bvar 1119, bvar 113, bvar 118]),
    bnot (bands [bvar 1115, bvar 1116, bvar 114, bvar 115]),
    bnot (bands [bvar 1115, bvar 1117, bvar 114, bvar 116]),
    bnot (bands [bvar 1115, bvar 1118, bvar 114, bvar 117]),
    bnot (bands [bvar 1115, bvar 1119, bvar 114, bvar 118]),
    bnot (bands [bvar 1116, bvar 1117, bvar 115, bvar 116]),
    bnot (bands [bvar 1116, bvar 1119, bvar 115, bvar 118]),
    bnot (bands [bvar 1118, bvar 1119, bvar 117, bvar 118]) ]

def reducedUnionChunk061 : BVLogicalExpr :=
  bands reducedUnionChunk061Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
