import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk099Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1176, bvar 1180, bvar 695, bvar 699]),
    bnot (bands [bvar 1176, bvar 1181, bvar 695, bvar 700]),
    bnot (bands [bvar 1178, bvar 1180, bvar 697, bvar 699]),
    bnot (bands [bvar 1178, bvar 1181, bvar 697, bvar 700]),
    bnot (bands [bvar 1179, bvar 1180, bvar 698, bvar 699]),
    bnot (bands [bvar 1179, bvar 1181, bvar 698, bvar 700]),
    bnot (bands [bvar 665, bvar 666, bvar 1198, bvar 1199]),
    bnot (bands [bvar 665, bvar 667, bvar 1198, bvar 1200]),
    bnot (bands [bvar 665, bvar 669, bvar 1198, bvar 1202]),
    bnot (bands [bvar 665, bvar 670, bvar 1198, bvar 1203]),
    bnot (bands [bvar 665, bvar 671, bvar 1198, bvar 1204]),
    bnot (bands [bvar 665, bvar 672, bvar 1198, bvar 1205]),
    bnot (bands [bvar 665, bvar 673, bvar 1198, bvar 1206]),
    bnot (bands [bvar 665, bvar 674, bvar 1198, bvar 1207]),
    bnot (bands [bvar 666, bvar 669, bvar 1199, bvar 1202]),
    bnot (bands [bvar 666, bvar 670, bvar 1199, bvar 1203]),
    bnot (bands [bvar 666, bvar 671, bvar 1199, bvar 1204]),
    bnot (bands [bvar 666, bvar 672, bvar 1199, bvar 1205]),
    bnot (bands [bvar 666, bvar 673, bvar 1199, bvar 1206]),
    bnot (bands [bvar 666, bvar 674, bvar 1199, bvar 1207]),
    bnot (bands [bvar 667, bvar 669, bvar 1200, bvar 1202]),
    bnot (bands [bvar 667, bvar 671, bvar 1200, bvar 1204]),
    bnot (bands [bvar 667, bvar 672, bvar 1200, bvar 1205]),
    bnot (bands [bvar 667, bvar 673, bvar 1200, bvar 1206]),
    bnot (bands [bvar 667, bvar 674, bvar 1200, bvar 1207]),
    bnot (bands [bvar 668, bvar 669, bvar 1201, bvar 1202]),
    bnot (bands [bvar 668, bvar 671, bvar 1201, bvar 1204]),
    bnot (bands [bvar 668, bvar 672, bvar 1201, bvar 1205]),
    bnot (bands [bvar 669, bvar 670, bvar 1202, bvar 1203]),
    bnot (bands [bvar 669, bvar 671, bvar 1202, bvar 1204]),
    bnot (bands [bvar 669, bvar 672, bvar 1202, bvar 1205]),
    bnot (bands [bvar 669, bvar 673, bvar 1202, bvar 1206]),
    bnot (bands [bvar 669, bvar 674, bvar 1202, bvar 1207]),
    bnot (bands [bvar 670, bvar 671, bvar 1203, bvar 1204]),
    bnot (bands [bvar 670, bvar 672, bvar 1203, bvar 1205]),
    bnot (bands [bvar 670, bvar 674, bvar 1203, bvar 1207]),
    bnot (bands [bvar 671, bvar 672, bvar 1204, bvar 1205]),
    bnot (bands [bvar 671, bvar 673, bvar 1204, bvar 1206]),
    bnot (bands [bvar 671, bvar 674, bvar 1204, bvar 1207]),
    bnot (bands [bvar 672, bvar 673, bvar 1205, bvar 1206]),
    bnot (bands [bvar 672, bvar 674, bvar 1205, bvar 1207]),
    bnot (bands [bvar 673, bvar 674, bvar 1206, bvar 1207]),
    bnot (bands [bvar 1185, bvar 1186, bvar 691, bvar 692]),
    bnot (bands [bvar 1185, bvar 1187, bvar 691, bvar 693]),
    bnot (bands [bvar 1185, bvar 1189, bvar 691, bvar 695]),
    bnot (bands [bvar 1185, bvar 1190, bvar 691, bvar 696]),
    bnot (bands [bvar 1185, bvar 1191, bvar 691, bvar 697]),
    bnot (bands [bvar 1185, bvar 1192, bvar 691, bvar 698]),
    bnot (bands [bvar 1185, bvar 1193, bvar 691, bvar 699]),
    bnot (bands [bvar 1185, bvar 1194, bvar 691, bvar 700]),
    bnot (bands [bvar 1186, bvar 1189, bvar 692, bvar 695]),
    bnot (bands [bvar 1186, bvar 1190, bvar 692, bvar 696]),
    bnot (bands [bvar 1186, bvar 1191, bvar 692, bvar 697]),
    bnot (bands [bvar 1186, bvar 1192, bvar 692, bvar 698]),
    bnot (bands [bvar 1186, bvar 1193, bvar 692, bvar 699]),
    bnot (bands [bvar 1186, bvar 1194, bvar 692, bvar 700]),
    bnot (bands [bvar 1186, bvar 1195, bvar 692, bvar 701]),
    bnot (bands [bvar 1187, bvar 1189, bvar 693, bvar 695]),
    bnot (bands [bvar 1187, bvar 1190, bvar 693, bvar 696]),
    bnot (bands [bvar 1187, bvar 1191, bvar 693, bvar 697]),
    bnot (bands [bvar 1187, bvar 1192, bvar 693, bvar 698]),
    bnot (bands [bvar 1187, bvar 1193, bvar 693, bvar 699]),
    bnot (bands [bvar 1187, bvar 1194, bvar 693, bvar 700]),
    bnot (bands [bvar 1187, bvar 1195, bvar 693, bvar 701]) ]

def reducedUnionChunk099 : BVLogicalExpr :=
  bands reducedUnionChunk099Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
