import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk073Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 172, bvar 177, bvar 1199, bvar 1204]),
    bnot (bands [bvar 172, bvar 178, bvar 1199, bvar 1205]),
    bnot (bands [bvar 172, bvar 179, bvar 1199, bvar 1206]),
    bnot (bands [bvar 172, bvar 180, bvar 1199, bvar 1207]),
    bnot (bands [bvar 172, bvar 181, bvar 1199, bvar 1208]),
    bnot (bands [bvar 173, bvar 175, bvar 1200, bvar 1202]),
    bnot (bands [bvar 173, bvar 181, bvar 1200, bvar 1208]),
    bnot (bands [bvar 175, bvar 176, bvar 1202, bvar 1203]),
    bnot (bands [bvar 175, bvar 177, bvar 1202, bvar 1204]),
    bnot (bands [bvar 175, bvar 178, bvar 1202, bvar 1205]),
    bnot (bands [bvar 175, bvar 179, bvar 1202, bvar 1206]),
    bnot (bands [bvar 175, bvar 180, bvar 1202, bvar 1207]),
    bnot (bands [bvar 175, bvar 181, bvar 1202, bvar 1208]),
    bnot (bands [bvar 176, bvar 181, bvar 1203, bvar 1208]),
    bnot (bands [bvar 177, bvar 179, bvar 1204, bvar 1206]),
    bnot (bands [bvar 177, bvar 181, bvar 1204, bvar 1208]),
    bnot (bands [bvar 178, bvar 179, bvar 1205, bvar 1206]),
    bnot (bands [bvar 178, bvar 180, bvar 1205, bvar 1207]),
    bnot (bands [bvar 178, bvar 181, bvar 1205, bvar 1208]),
    bnot (bands [bvar 179, bvar 180, bvar 1206, bvar 1207]),
    bnot (bands [bvar 179, bvar 181, bvar 1206, bvar 1208]),
    bnot (bands [bvar 180, bvar 181, bvar 1207, bvar 1208]),
    bnot (bands [bvar 1097, bvar 1103, bvar 135, bvar 141]),
    bnot (bands [bvar 1097, bvar 1104, bvar 135, bvar 142]),
    bnot (bands [bvar 1097, bvar 1105, bvar 135, bvar 143]),
    bnot (bands [bvar 1097, bvar 1106, bvar 135, bvar 144]),
    bnot (bands [bvar 1120, bvar 1123, bvar 132, bvar 135]),
    bnot (bands [bvar 1123, bvar 1129, bvar 135, bvar 141]),
    bnot (bands [bvar 1123, bvar 1130, bvar 135, bvar 142]),
    bnot (bands [bvar 1123, bvar 1131, bvar 135, bvar 143]),
    bnot (bands [bvar 1123, bvar 1132, bvar 135, bvar 144]),
    bnot (bands [bvar 1133, bvar 1136, bvar 132, bvar 135]),
    bnot (bands [bvar 1136, bvar 1142, bvar 135, bvar 141]),
    bnot (bands [bvar 1136, bvar 1143, bvar 135, bvar 142]),
    bnot (bands [bvar 1045, bvar 1048, bvar 135, bvar 138]),
    bnot (bands [bvar 1045, bvar 1049, bvar 135, bvar 139]),
    bnot (bands [bvar 29, bvar 33, bvar 1173, bvar 1177]),
    bnot (bands [bvar 29, bvar 34, bvar 1173, bvar 1178]),
    bnot (bands [bvar 29, bvar 35, bvar 1173, bvar 1179]),
    bnot (bands [bvar 30, bvar 33, bvar 1174, bvar 1177]),
    bnot (bands [bvar 31, bvar 33, bvar 1175, bvar 1177]),
    bnot (bands [bvar 29, bvar 35, bvar 1199, bvar 1205]),
    bnot (bands [bvar 30, bvar 35, bvar 1200, bvar 1205]),
    bnot (bands [bvar 32, bvar 35, bvar 1202, bvar 1205]),
    bnot (bands [bvar 34, bvar 35, bvar 1204, bvar 1205]),
    bnot (bands [bvar 135, bvar 136, bvar 1188, bvar 1189]),
    bnot (bands [bvar 135, bvar 138, bvar 1188, bvar 1191]),
    bnot (bands [bvar 135, bvar 139, bvar 1188, bvar 1192]),
    bnot (bands [bvar 135, bvar 139, bvar 1201, bvar 1205]),
    bnot (bands [bvar 146, bvar 152, bvar 1199, bvar 1205]),
    bnot (bands [bvar 148, bvar 149, bvar 1201, bvar 1202]),
    bnot (bands [bvar 148, bvar 152, bvar 1201, bvar 1205]),
    bnot (bands [bvar 1047, bvar 1049, bvar 72, bvar 74]),
    bnot (bands [bvar 1047, bvar 1050, bvar 72, bvar 75]),
    bnot (bands [bvar 1047, bvar 1051, bvar 72, bvar 76]),
    bnot (bands [bvar 1047, bvar 1052, bvar 72, bvar 77]),
    bnot (bands [bvar 1047, bvar 1053, bvar 72, bvar 78]),
    bnot (bands [bvar 1048, bvar 1049, bvar 73, bvar 74]),
    bnot (bands [bvar 1048, bvar 1050, bvar 73, bvar 75]),
    bnot (bands [bvar 1048, bvar 1051, bvar 73, bvar 76]),
    bnot (bands [bvar 1048, bvar 1052, bvar 73, bvar 77]),
    bnot (bands [bvar 1048, bvar 1054, bvar 73, bvar 79]),
    bnot (bands [bvar 1049, bvar 1051, bvar 74, bvar 76]),
    bnot (bands [bvar 1049, bvar 1052, bvar 74, bvar 77]) ]

def reducedUnionChunk073 : BVLogicalExpr :=
  bands reducedUnionChunk073Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
