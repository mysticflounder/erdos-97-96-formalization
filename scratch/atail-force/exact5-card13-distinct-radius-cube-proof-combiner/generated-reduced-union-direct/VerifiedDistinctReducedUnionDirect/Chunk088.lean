import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk088Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1108, bvar 1117, bvar 653, bvar 662]),
    bnot (bands [bvar 1109, bvar 1111, bvar 654, bvar 656]),
    bnot (bands [bvar 1109, bvar 1117, bvar 654, bvar 662]),
    bnot (bands [bvar 1110, bvar 1111, bvar 655, bvar 656]),
    bnot (bands [bvar 1110, bvar 1117, bvar 655, bvar 662]),
    bnot (bands [bvar 1111, bvar 1117, bvar 656, bvar 662]),
    bnot (bands [bvar 1111, bvar 1118, bvar 656, bvar 663]),
    bnot (bands [bvar 1111, bvar 1119, bvar 656, bvar 664]),
    bnot (bands [bvar 1117, bvar 1118, bvar 662, bvar 663]),
    bnot (bands [bvar 1117, bvar 1119, bvar 662, bvar 664]),
    bnot (bands [bvar 1118, bvar 1119, bvar 663, bvar 664]),
    bnot (bands [bvar 603, bvar 610, bvar 1162, bvar 1169]),
    bnot (bands [bvar 603, bvar 611, bvar 1162, bvar 1170]),
    bnot (bands [bvar 604, bvar 610, bvar 1163, bvar 1169]),
    bnot (bands [bvar 604, bvar 611, bvar 1163, bvar 1170]),
    bnot (bands [bvar 610, bvar 611, bvar 1169, bvar 1170]),
    bnot (bands [bvar 611, bvar 612, bvar 1170, bvar 1171]),
    bnot (bands [bvar 1107, bvar 1108, bvar 665, bvar 666]),
    bnot (bands [bvar 1107, bvar 1111, bvar 665, bvar 669]),
    bnot (bands [bvar 1108, bvar 1111, bvar 666, bvar 669]),
    bnot (bands [bvar 1108, bvar 1118, bvar 666, bvar 676]),
    bnot (bands [bvar 1109, bvar 1111, bvar 667, bvar 669]),
    bnot (bands [bvar 1110, bvar 1111, bvar 668, bvar 669]),
    bnot (bands [bvar 1111, bvar 1118, bvar 669, bvar 676]),
    bnot (bands [bvar 1111, bvar 1119, bvar 669, bvar 677]),
    bnot (bands [bvar 1113, bvar 1115, bvar 671, bvar 673]),
    bnot (bands [bvar 1113, bvar 1116, bvar 671, bvar 674]),
    bnot (bands [bvar 1114, bvar 1115, bvar 672, bvar 673]),
    bnot (bands [bvar 1114, bvar 1116, bvar 672, bvar 674]),
    bnot (bands [bvar 1115, bvar 1116, bvar 673, bvar 674]),
    bnot (bands [bvar 1118, bvar 1119, bvar 676, bvar 677]),
    bnot (bands [bvar 600, bvar 601, bvar 1172, bvar 1173]),
    bnot (bands [bvar 600, bvar 602, bvar 1172, bvar 1174]),
    bnot (bands [bvar 600, bvar 603, bvar 1172, bvar 1175]),
    bnot (bands [bvar 600, bvar 604, bvar 1172, bvar 1176]),
    bnot (bands [bvar 600, bvar 611, bvar 1172, bvar 1183]),
    bnot (bands [bvar 600, bvar 612, bvar 1172, bvar 1184]),
    bnot (bands [bvar 601, bvar 604, bvar 1173, bvar 1176]),
    bnot (bands [bvar 601, bvar 611, bvar 1173, bvar 1183]),
    bnot (bands [bvar 601, bvar 612, bvar 1173, bvar 1184]),
    bnot (bands [bvar 602, bvar 604, bvar 1174, bvar 1176]),
    bnot (bands [bvar 602, bvar 611, bvar 1174, bvar 1183]),
    bnot (bands [bvar 602, bvar 612, bvar 1174, bvar 1184]),
    bnot (bands [bvar 603, bvar 604, bvar 1175, bvar 1176]),
    bnot (bands [bvar 603, bvar 611, bvar 1175, bvar 1183]),
    bnot (bands [bvar 603, bvar 612, bvar 1175, bvar 1184]),
    bnot (bands [bvar 604, bvar 611, bvar 1176, bvar 1183]),
    bnot (bands [bvar 604, bvar 612, bvar 1176, bvar 1184]),
    bnot (bands [bvar 606, bvar 607, bvar 1178, bvar 1179]),
    bnot (bands [bvar 606, bvar 608, bvar 1178, bvar 1180]),
    bnot (bands [bvar 606, bvar 609, bvar 1178, bvar 1181]),
    bnot (bands [bvar 607, bvar 608, bvar 1179, bvar 1180]),
    bnot (bands [bvar 607, bvar 609, bvar 1179, bvar 1181]),
    bnot (bands [bvar 608, bvar 609, bvar 1180, bvar 1181]),
    bnot (bands [bvar 611, bvar 612, bvar 1183, bvar 1184]),
    atMost [bands [bvar 600, bvar 1185], bands [bvar 601, bvar 1186], bands [bvar 602, bvar 1187], bands [bvar 603, bvar 1188], bands [bvar 604, bvar 1189], bands [bvar 605, bvar 1190], bands [bvar 606, bvar 1191], bands [bvar 607, bvar 1192], bands [bvar 608, bvar 1193], bands [bvar 609, bvar 1194], bands [bvar 610, bvar 1195], bands [bvar 611, bvar 1196], bands [bvar 612, bvar 1197]] 2,
    bnot (bands [bvar 604, bvar 612, bvar 1189, bvar 1197]),
    bnot (bands [bvar 606, bvar 607, bvar 1191, bvar 1192]),
    bnot (bands [bvar 606, bvar 609, bvar 1191, bvar 1194]),
    bnot (bands [bvar 607, bvar 609, bvar 1192, bvar 1194]),
    bnot (bands [bvar 607, bvar 610, bvar 1192, bvar 1195]),
    bnot (bands [bvar 608, bvar 609, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1113, bvar 1114, bvar 697, bvar 698]),
    bnot (bands [bvar 603, bvar 604, bvar 1201, bvar 1202]) ]

def reducedUnionChunk088 : BVLogicalExpr :=
  bands reducedUnionChunk088Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
