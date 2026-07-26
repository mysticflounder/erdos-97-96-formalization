import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk071Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 151, bvar 157, bvar 1178, bvar 1184]),
    bnot (bands [bvar 152, bvar 153, bvar 1179, bvar 1180]),
    bnot (bands [bvar 152, bvar 156, bvar 1179, bvar 1183]),
    bnot (bands [bvar 152, bvar 157, bvar 1179, bvar 1184]),
    bnot (bands [bvar 153, bvar 156, bvar 1180, bvar 1183]),
    bnot (bands [bvar 153, bvar 157, bvar 1180, bvar 1184]),
    bnot (bands [bvar 156, bvar 157, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1159, bvar 1160, bvar 171, bvar 172]),
    bnot (bands [bvar 1159, bvar 1165, bvar 171, bvar 177]),
    bnot (bands [bvar 146, bvar 149, bvar 1186, bvar 1189]),
    bnot (bands [bvar 147, bvar 149, bvar 1187, bvar 1189]),
    bnot (bands [bvar 147, bvar 151, bvar 1187, bvar 1191]),
    bnot (bands [bvar 147, bvar 153, bvar 1187, bvar 1193]),
    bnot (bands [bvar 148, bvar 153, bvar 1188, bvar 1193]),
    bnot (bands [bvar 149, bvar 150, bvar 1189, bvar 1190]),
    bnot (bands [bvar 149, bvar 151, bvar 1189, bvar 1191]),
    bnot (bands [bvar 149, bvar 152, bvar 1189, bvar 1192]),
    bnot (bands [bvar 149, bvar 153, bvar 1189, bvar 1193]),
    bnot (bands [bvar 149, bvar 157, bvar 1189, bvar 1197]),
    bnot (bands [bvar 150, bvar 153, bvar 1190, bvar 1193]),
    bnot (bands [bvar 151, bvar 153, bvar 1191, bvar 1193]),
    bnot (bands [bvar 152, bvar 153, bvar 1192, bvar 1193]),
    atMost [bands [bvar 145, bvar 1198], bands [bvar 146, bvar 1199], bands [bvar 147, bvar 1200], bands [bvar 148, bvar 1201], bands [bvar 149, bvar 1202], bands [bvar 150, bvar 1203], bands [bvar 151, bvar 1204], bands [bvar 152, bvar 1205], bands [bvar 153, bvar 1206], bands [bvar 154, bvar 1207], bands [bvar 155, bvar 1208], bands [bvar 156, bvar 1209], bands [bvar 157, bvar 1210]] 2,
    bnot (bands [bvar 145, bvar 146, bvar 1198, bvar 1199]),
    bnot (bands [bvar 145, bvar 147, bvar 1198, bvar 1200]),
    bnot (bands [bvar 145, bvar 148, bvar 1198, bvar 1201]),
    bnot (bands [bvar 145, bvar 149, bvar 1198, bvar 1202]),
    bnot (bands [bvar 145, bvar 150, bvar 1198, bvar 1203]),
    bnot (bands [bvar 145, bvar 151, bvar 1198, bvar 1204]),
    bnot (bands [bvar 145, bvar 152, bvar 1198, bvar 1205]),
    bnot (bands [bvar 145, bvar 153, bvar 1198, bvar 1206]),
    bnot (bands [bvar 146, bvar 149, bvar 1199, bvar 1202]),
    bnot (bands [bvar 146, bvar 150, bvar 1199, bvar 1203]),
    bnot (bands [bvar 146, bvar 151, bvar 1199, bvar 1204]),
    bnot (bands [bvar 146, bvar 152, bvar 1199, bvar 1205]),
    bnot (bands [bvar 146, bvar 153, bvar 1199, bvar 1206]),
    bnot (bands [bvar 147, bvar 149, bvar 1200, bvar 1202]),
    bnot (bands [bvar 147, bvar 151, bvar 1200, bvar 1204]),
    bnot (bands [bvar 147, bvar 152, bvar 1200, bvar 1205]),
    bnot (bands [bvar 147, bvar 153, bvar 1200, bvar 1206]),
    bnot (bands [bvar 148, bvar 149, bvar 1201, bvar 1202]),
    bnot (bands [bvar 148, bvar 152, bvar 1201, bvar 1205]),
    bnot (bands [bvar 148, bvar 153, bvar 1201, bvar 1206]),
    bnot (bands [bvar 149, bvar 150, bvar 1202, bvar 1203]),
    bnot (bands [bvar 149, bvar 151, bvar 1202, bvar 1204]),
    bnot (bands [bvar 149, bvar 152, bvar 1202, bvar 1205]),
    bnot (bands [bvar 149, bvar 153, bvar 1202, bvar 1206]),
    bnot (bands [bvar 150, bvar 151, bvar 1203, bvar 1204]),
    bnot (bands [bvar 150, bvar 152, bvar 1203, bvar 1205]),
    bnot (bands [bvar 150, bvar 153, bvar 1203, bvar 1206]),
    bnot (bands [bvar 151, bvar 152, bvar 1204, bvar 1205]),
    bnot (bands [bvar 151, bvar 153, bvar 1204, bvar 1206]),
    bnot (bands [bvar 152, bvar 153, bvar 1205, bvar 1206]),
    bnot (bands [bvar 155, bvar 156, bvar 1208, bvar 1209]),
    bnot (bands [bvar 1172, bvar 1173, bvar 171, bvar 172]),
    bnot (bands [bvar 1172, bvar 1174, bvar 171, bvar 173]),
    bnot (bands [bvar 1172, bvar 1176, bvar 171, bvar 175]),
    bnot (bands [bvar 1172, bvar 1179, bvar 171, bvar 178]),
    bnot (bands [bvar 1173, bvar 1176, bvar 172, bvar 175]),
    bnot (bands [bvar 1173, bvar 1177, bvar 172, bvar 176]),
    bnot (bands [bvar 1173, bvar 1178, bvar 172, bvar 177]),
    bnot (bands [bvar 1173, bvar 1180, bvar 172, bvar 179]),
    bnot (bands [bvar 1173, bvar 1184, bvar 172, bvar 183]),
    bnot (bands [bvar 1174, bvar 1177, bvar 173, bvar 176]) ]

def reducedUnionChunk071 : BVLogicalExpr :=
  bands reducedUnionChunk071Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
