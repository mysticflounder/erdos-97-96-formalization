import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk096Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1172, bvar 1176, bvar 678, bvar 682]),
    bnot (bands [bvar 1172, bvar 1177, bvar 678, bvar 683]),
    bnot (bands [bvar 1172, bvar 1178, bvar 678, bvar 684]),
    bnot (bands [bvar 1172, bvar 1179, bvar 678, bvar 685]),
    bnot (bands [bvar 1172, bvar 1180, bvar 678, bvar 686]),
    bnot (bands [bvar 1172, bvar 1181, bvar 678, bvar 687]),
    bnot (bands [bvar 1173, bvar 1176, bvar 679, bvar 682]),
    bnot (bands [bvar 1173, bvar 1177, bvar 679, bvar 683]),
    bnot (bands [bvar 1173, bvar 1178, bvar 679, bvar 684]),
    bnot (bands [bvar 1173, bvar 1179, bvar 679, bvar 685]),
    bnot (bands [bvar 1173, bvar 1180, bvar 679, bvar 686]),
    bnot (bands [bvar 1174, bvar 1176, bvar 680, bvar 682]),
    bnot (bands [bvar 1174, bvar 1180, bvar 680, bvar 686]),
    bnot (bands [bvar 1174, bvar 1181, bvar 680, bvar 687]),
    bnot (bands [bvar 1175, bvar 1176, bvar 681, bvar 682]),
    bnot (bands [bvar 1175, bvar 1179, bvar 681, bvar 685]),
    bnot (bands [bvar 1176, bvar 1177, bvar 682, bvar 683]),
    bnot (bands [bvar 1176, bvar 1178, bvar 682, bvar 684]),
    bnot (bands [bvar 1176, bvar 1179, bvar 682, bvar 685]),
    bnot (bands [bvar 1176, bvar 1180, bvar 682, bvar 686]),
    bnot (bands [bvar 1176, bvar 1181, bvar 682, bvar 687]),
    bnot (bands [bvar 1176, bvar 1184, bvar 682, bvar 690]),
    bnot (bands [bvar 1177, bvar 1179, bvar 683, bvar 685]),
    bnot (bands [bvar 1177, bvar 1180, bvar 683, bvar 686]),
    bnot (bands [bvar 1178, bvar 1179, bvar 684, bvar 685]),
    bnot (bands [bvar 1178, bvar 1180, bvar 684, bvar 686]),
    bnot (bands [bvar 1178, bvar 1181, bvar 684, bvar 687]),
    bnot (bands [bvar 1178, bvar 1184, bvar 684, bvar 690]),
    bnot (bands [bvar 1179, bvar 1180, bvar 685, bvar 686]),
    bnot (bands [bvar 1179, bvar 1181, bvar 685, bvar 687]),
    bnot (bands [bvar 1179, bvar 1184, bvar 685, bvar 690]),
    bnot (bands [bvar 665, bvar 666, bvar 1185, bvar 1186]),
    bnot (bands [bvar 665, bvar 667, bvar 1185, bvar 1187]),
    bnot (bands [bvar 665, bvar 669, bvar 1185, bvar 1189]),
    bnot (bands [bvar 665, bvar 670, bvar 1185, bvar 1190]),
    bnot (bands [bvar 665, bvar 671, bvar 1185, bvar 1191]),
    bnot (bands [bvar 665, bvar 672, bvar 1185, bvar 1192]),
    bnot (bands [bvar 665, bvar 673, bvar 1185, bvar 1193]),
    bnot (bands [bvar 665, bvar 674, bvar 1185, bvar 1194]),
    bnot (bands [bvar 665, bvar 677, bvar 1185, bvar 1197]),
    bnot (bands [bvar 666, bvar 669, bvar 1186, bvar 1189]),
    bnot (bands [bvar 666, bvar 670, bvar 1186, bvar 1190]),
    bnot (bands [bvar 666, bvar 671, bvar 1186, bvar 1191]),
    bnot (bands [bvar 666, bvar 672, bvar 1186, bvar 1192]),
    bnot (bands [bvar 666, bvar 673, bvar 1186, bvar 1193]),
    bnot (bands [bvar 666, bvar 674, bvar 1186, bvar 1194]),
    bnot (bands [bvar 666, bvar 677, bvar 1186, bvar 1197]),
    bnot (bands [bvar 667, bvar 669, bvar 1187, bvar 1189]),
    bnot (bands [bvar 667, bvar 670, bvar 1187, bvar 1190]),
    bnot (bands [bvar 667, bvar 671, bvar 1187, bvar 1191]),
    bnot (bands [bvar 667, bvar 672, bvar 1187, bvar 1192]),
    bnot (bands [bvar 667, bvar 673, bvar 1187, bvar 1193]),
    bnot (bands [bvar 667, bvar 674, bvar 1187, bvar 1194]),
    bnot (bands [bvar 667, bvar 677, bvar 1187, bvar 1197]),
    bnot (bands [bvar 668, bvar 669, bvar 1188, bvar 1189]),
    bnot (bands [bvar 668, bvar 671, bvar 1188, bvar 1191]),
    bnot (bands [bvar 668, bvar 672, bvar 1188, bvar 1192]),
    bnot (bands [bvar 668, bvar 673, bvar 1188, bvar 1193]),
    bnot (bands [bvar 668, bvar 674, bvar 1188, bvar 1194]),
    bnot (bands [bvar 669, bvar 670, bvar 1189, bvar 1190]),
    bnot (bands [bvar 669, bvar 671, bvar 1189, bvar 1191]),
    bnot (bands [bvar 669, bvar 672, bvar 1189, bvar 1192]),
    bnot (bands [bvar 669, bvar 673, bvar 1189, bvar 1193]),
    bnot (bands [bvar 669, bvar 674, bvar 1189, bvar 1194]) ]

def reducedUnionChunk096 : BVLogicalExpr :=
  bands reducedUnionChunk096Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
