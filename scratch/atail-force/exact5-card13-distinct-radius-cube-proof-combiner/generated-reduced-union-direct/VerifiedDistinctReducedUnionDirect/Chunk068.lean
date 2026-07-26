import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk068Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1136, bvar 1144, bvar 148, bvar 156]),
    bnot (bands [bvar 1137, bvar 1138, bvar 149, bvar 150]),
    bnot (bands [bvar 1137, bvar 1144, bvar 149, bvar 156]),
    bnot (bands [bvar 1137, bvar 1145, bvar 149, bvar 157]),
    bnot (bands [bvar 1138, bvar 1139, bvar 150, bvar 151]),
    bnot (bands [bvar 1138, bvar 1143, bvar 150, bvar 155]),
    bnot (bands [bvar 1138, bvar 1144, bvar 150, bvar 156]),
    bnot (bands [bvar 1138, bvar 1145, bvar 150, bvar 157]),
    bnot (bands [bvar 1139, bvar 1143, bvar 151, bvar 155]),
    bnot (bands [bvar 1139, bvar 1144, bvar 151, bvar 156]),
    bnot (bands [bvar 1139, bvar 1145, bvar 151, bvar 157]),
    bnot (bands [bvar 1143, bvar 1144, bvar 155, bvar 156]),
    bnot (bands [bvar 1144, bvar 1145, bvar 156, bvar 157]),
    bnot (bands [bvar 119, bvar 120, bvar 1159, bvar 1160]),
    bnot (bands [bvar 119, bvar 121, bvar 1159, bvar 1161]),
    bnot (bands [bvar 119, bvar 122, bvar 1159, bvar 1162]),
    bnot (bands [bvar 119, bvar 123, bvar 1159, bvar 1163]),
    bnot (bands [bvar 119, bvar 124, bvar 1159, bvar 1164]),
    bnot (bands [bvar 119, bvar 125, bvar 1159, bvar 1165]),
    bnot (bands [bvar 119, bvar 129, bvar 1159, bvar 1169]),
    bnot (bands [bvar 119, bvar 130, bvar 1159, bvar 1170]),
    bnot (bands [bvar 120, bvar 123, bvar 1160, bvar 1163]),
    bnot (bands [bvar 120, bvar 125, bvar 1160, bvar 1165]),
    bnot (bands [bvar 120, bvar 130, bvar 1160, bvar 1170]),
    bnot (bands [bvar 120, bvar 131, bvar 1160, bvar 1171]),
    bnot (bands [bvar 121, bvar 123, bvar 1161, bvar 1163]),
    bnot (bands [bvar 121, bvar 125, bvar 1161, bvar 1165]),
    bnot (bands [bvar 121, bvar 129, bvar 1161, bvar 1169]),
    bnot (bands [bvar 121, bvar 130, bvar 1161, bvar 1170]),
    bnot (bands [bvar 121, bvar 131, bvar 1161, bvar 1171]),
    bnot (bands [bvar 122, bvar 123, bvar 1162, bvar 1163]),
    bnot (bands [bvar 122, bvar 125, bvar 1162, bvar 1165]),
    bnot (bands [bvar 122, bvar 130, bvar 1162, bvar 1170]),
    bnot (bands [bvar 122, bvar 131, bvar 1162, bvar 1171]),
    bnot (bands [bvar 123, bvar 124, bvar 1163, bvar 1164]),
    bnot (bands [bvar 123, bvar 125, bvar 1163, bvar 1165]),
    bnot (bands [bvar 123, bvar 129, bvar 1163, bvar 1169]),
    bnot (bands [bvar 123, bvar 130, bvar 1163, bvar 1170]),
    bnot (bands [bvar 123, bvar 131, bvar 1163, bvar 1171]),
    bnot (bands [bvar 124, bvar 125, bvar 1164, bvar 1165]),
    bnot (bands [bvar 124, bvar 130, bvar 1164, bvar 1170]),
    bnot (bands [bvar 124, bvar 131, bvar 1164, bvar 1171]),
    bnot (bands [bvar 125, bvar 129, bvar 1165, bvar 1169]),
    bnot (bands [bvar 125, bvar 130, bvar 1165, bvar 1170]),
    bnot (bands [bvar 125, bvar 131, bvar 1165, bvar 1171]),
    bnot (bands [bvar 129, bvar 130, bvar 1169, bvar 1170]),
    bnot (bands [bvar 129, bvar 131, bvar 1169, bvar 1171]),
    bnot (bands [bvar 130, bvar 131, bvar 1170, bvar 1171]),
    bnot (bands [bvar 1135, bvar 1144, bvar 160, bvar 169]),
    bnot (bands [bvar 1138, bvar 1144, bvar 163, bvar 169]),
    atMost [bands [bvar 119, bvar 1172], bands [bvar 120, bvar 1173], bands [bvar 121, bvar 1174], bands [bvar 122, bvar 1175], bands [bvar 123, bvar 1176], bands [bvar 124, bvar 1177], bands [bvar 125, bvar 1178], bands [bvar 126, bvar 1179], bands [bvar 127, bvar 1180], bands [bvar 128, bvar 1181], bands [bvar 129, bvar 1182], bands [bvar 130, bvar 1183], bands [bvar 131, bvar 1184]] 2,
    bnot (bands [bvar 119, bvar 120, bvar 1172, bvar 1173]),
    bnot (bands [bvar 119, bvar 121, bvar 1172, bvar 1174]),
    bnot (bands [bvar 119, bvar 122, bvar 1172, bvar 1175]),
    bnot (bands [bvar 119, bvar 123, bvar 1172, bvar 1176]),
    bnot (bands [bvar 119, bvar 124, bvar 1172, bvar 1177]),
    bnot (bands [bvar 119, bvar 125, bvar 1172, bvar 1178]),
    bnot (bands [bvar 119, bvar 130, bvar 1172, bvar 1183]),
    bnot (bands [bvar 119, bvar 131, bvar 1172, bvar 1184]),
    bnot (bands [bvar 120, bvar 123, bvar 1173, bvar 1176]),
    bnot (bands [bvar 120, bvar 124, bvar 1173, bvar 1177]),
    bnot (bands [bvar 120, bvar 125, bvar 1173, bvar 1178]),
    bnot (bands [bvar 120, bvar 130, bvar 1173, bvar 1183]),
    bnot (bands [bvar 121, bvar 123, bvar 1174, bvar 1176]) ]

def reducedUnionChunk068 : BVLogicalExpr :=
  bands reducedUnionChunk068Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
