import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk011Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1102, bvar 1103, bvar 1115, bvar 1116]),
    bnot (bands [bvar 1102, bvar 1104, bvar 1115, bvar 1117]),
    bnot (bands [bvar 1102, bvar 1105, bvar 1115, bvar 1118]),
    bnot (bands [bvar 1102, bvar 1106, bvar 1115, bvar 1119]),
    bnot (bands [bvar 1103, bvar 1104, bvar 1116, bvar 1117]),
    bnot (bands [bvar 1103, bvar 1105, bvar 1116, bvar 1118]),
    bnot (bands [bvar 1103, bvar 1106, bvar 1116, bvar 1119]),
    bnot (bands [bvar 1104, bvar 1105, bvar 1117, bvar 1118]),
    bnot (bands [bvar 1104, bvar 1106, bvar 1117, bvar 1119]),
    bnot (bands [bvar 1105, bvar 1106, bvar 1118, bvar 1119]),
    bnot (bands [bvar 1094, bvar 1101, bvar 1120, bvar 1127]),
    bnot (bands [bvar 1094, bvar 1102, bvar 1120, bvar 1128]),
    bnot (bands [bvar 1094, bvar 1103, bvar 1120, bvar 1129]),
    bnot (bands [bvar 1094, bvar 1104, bvar 1120, bvar 1130]),
    bnot (bands [bvar 1094, bvar 1105, bvar 1120, bvar 1131]),
    bnot (bands [bvar 1094, bvar 1106, bvar 1120, bvar 1132]),
    bnot (bands [bvar 1095, bvar 1101, bvar 1121, bvar 1127]),
    bnot (bands [bvar 1095, bvar 1102, bvar 1121, bvar 1128]),
    bnot (bands [bvar 1095, bvar 1105, bvar 1121, bvar 1131]),
    bnot (bands [bvar 1096, bvar 1101, bvar 1122, bvar 1127]),
    bnot (bands [bvar 1096, bvar 1102, bvar 1122, bvar 1128]),
    bnot (bands [bvar 1096, bvar 1103, bvar 1122, bvar 1129]),
    bnot (bands [bvar 1096, bvar 1104, bvar 1122, bvar 1130]),
    bnot (bands [bvar 1096, bvar 1105, bvar 1122, bvar 1131]),
    bnot (bands [bvar 1097, bvar 1101, bvar 1123, bvar 1127]),
    bnot (bands [bvar 1097, bvar 1102, bvar 1123, bvar 1128]),
    bnot (bands [bvar 1097, bvar 1103, bvar 1123, bvar 1129]),
    bnot (bands [bvar 1097, bvar 1104, bvar 1123, bvar 1130]),
    bnot (bands [bvar 1097, bvar 1105, bvar 1123, bvar 1131]),
    bnot (bands [bvar 1097, bvar 1106, bvar 1123, bvar 1132]),
    bnot (bands [bvar 1101, bvar 1103, bvar 1127, bvar 1129]),
    bnot (bands [bvar 1101, bvar 1104, bvar 1127, bvar 1130]),
    bnot (bands [bvar 1101, bvar 1105, bvar 1127, bvar 1131]),
    bnot (bands [bvar 1101, bvar 1106, bvar 1127, bvar 1132]),
    bnot (bands [bvar 1102, bvar 1103, bvar 1128, bvar 1129]),
    bnot (bands [bvar 1102, bvar 1104, bvar 1128, bvar 1130]),
    bnot (bands [bvar 1102, bvar 1105, bvar 1128, bvar 1131]),
    bnot (bands [bvar 1102, bvar 1106, bvar 1128, bvar 1132]),
    bnot (bands [bvar 1103, bvar 1104, bvar 1129, bvar 1130]),
    bnot (bands [bvar 1103, bvar 1105, bvar 1129, bvar 1131]),
    bnot (bands [bvar 1103, bvar 1106, bvar 1129, bvar 1132]),
    bnot (bands [bvar 1104, bvar 1105, bvar 1130, bvar 1131]),
    bnot (bands [bvar 1105, bvar 1106, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1094, bvar 1102, bvar 1133, bvar 1141]),
    bnot (bands [bvar 1094, bvar 1105, bvar 1133, bvar 1144]),
    bnot (bands [bvar 1095, bvar 1102, bvar 1134, bvar 1141]),
    bnot (bands [bvar 1096, bvar 1102, bvar 1135, bvar 1141]),
    bnot (bands [bvar 1096, bvar 1103, bvar 1135, bvar 1142]),
    bnot (bands [bvar 1096, bvar 1104, bvar 1135, bvar 1143]),
    bnot (bands [bvar 1096, bvar 1106, bvar 1135, bvar 1145]),
    bnot (bands [bvar 1097, bvar 1102, bvar 1136, bvar 1141]),
    bnot (bands [bvar 1097, bvar 1103, bvar 1136, bvar 1142]),
    bnot (bands [bvar 1097, bvar 1106, bvar 1136, bvar 1145]),
    bnot (bands [bvar 1102, bvar 1103, bvar 1141, bvar 1142]),
    bnot (bands [bvar 1102, bvar 1104, bvar 1141, bvar 1143]),
    bnot (bands [bvar 1102, bvar 1105, bvar 1141, bvar 1144]),
    bnot (bands [bvar 1102, bvar 1106, bvar 1141, bvar 1145]),
    bnot (bands [bvar 1103, bvar 1104, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1103, bvar 1105, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1103, bvar 1106, bvar 1142, bvar 1145]),
    bnot (bands [bvar 1104, bvar 1106, bvar 1143, bvar 1145]),
    bnot (bands [bvar 1105, bvar 1106, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1094, bvar 1097, bvar 1159, bvar 1162]),
    bnot (bands [bvar 1094, bvar 1104, bvar 1159, bvar 1169]) ]

def reducedUnionChunk011 : BVLogicalExpr :=
  bands reducedUnionChunk011Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
