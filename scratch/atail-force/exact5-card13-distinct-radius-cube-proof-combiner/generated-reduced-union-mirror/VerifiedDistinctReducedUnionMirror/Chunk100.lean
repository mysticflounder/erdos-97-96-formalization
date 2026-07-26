import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk100Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1188, bvar 1189, bvar 694, bvar 695]),
    bnot (bands [bvar 1188, bvar 1190, bvar 694, bvar 696]),
    bnot (bands [bvar 1188, bvar 1191, bvar 694, bvar 697]),
    bnot (bands [bvar 1188, bvar 1192, bvar 694, bvar 698]),
    bnot (bands [bvar 1188, bvar 1193, bvar 694, bvar 699]),
    bnot (bands [bvar 1188, bvar 1195, bvar 694, bvar 701]),
    bnot (bands [bvar 1189, bvar 1190, bvar 695, bvar 696]),
    bnot (bands [bvar 1189, bvar 1191, bvar 695, bvar 697]),
    bnot (bands [bvar 1189, bvar 1192, bvar 695, bvar 698]),
    bnot (bands [bvar 1189, bvar 1193, bvar 695, bvar 699]),
    bnot (bands [bvar 1189, bvar 1194, bvar 695, bvar 700]),
    bnot (bands [bvar 1189, bvar 1195, bvar 695, bvar 701]),
    bnot (bands [bvar 1190, bvar 1191, bvar 696, bvar 697]),
    bnot (bands [bvar 1190, bvar 1192, bvar 696, bvar 698]),
    bnot (bands [bvar 1190, bvar 1193, bvar 696, bvar 699]),
    bnot (bands [bvar 1190, bvar 1194, bvar 696, bvar 700]),
    bnot (bands [bvar 1190, bvar 1195, bvar 696, bvar 701]),
    bnot (bands [bvar 1191, bvar 1192, bvar 697, bvar 698]),
    bnot (bands [bvar 1191, bvar 1193, bvar 697, bvar 699]),
    bnot (bands [bvar 1191, bvar 1194, bvar 697, bvar 700]),
    bnot (bands [bvar 1191, bvar 1195, bvar 697, bvar 701]),
    bnot (bands [bvar 1192, bvar 1193, bvar 698, bvar 699]),
    bnot (bands [bvar 1192, bvar 1194, bvar 698, bvar 700]),
    bnot (bands [bvar 1192, bvar 1195, bvar 698, bvar 701]),
    bnot (bands [bvar 1193, bvar 1194, bvar 699, bvar 700]),
    bnot (bands [bvar 1193, bvar 1195, bvar 699, bvar 701]),
    bnot (bands [bvar 1194, bvar 1195, bvar 700, bvar 701]),
    bnot (bands [bvar 678, bvar 679, bvar 1198, bvar 1199]),
    bnot (bands [bvar 678, bvar 680, bvar 1198, bvar 1200]),
    bnot (bands [bvar 678, bvar 681, bvar 1198, bvar 1201]),
    bnot (bands [bvar 678, bvar 682, bvar 1198, bvar 1202]),
    bnot (bands [bvar 678, bvar 683, bvar 1198, bvar 1203]),
    bnot (bands [bvar 678, bvar 684, bvar 1198, bvar 1204]),
    bnot (bands [bvar 678, bvar 685, bvar 1198, bvar 1205]),
    bnot (bands [bvar 678, bvar 686, bvar 1198, bvar 1206]),
    bnot (bands [bvar 678, bvar 687, bvar 1198, bvar 1207]),
    bnot (bands [bvar 678, bvar 688, bvar 1198, bvar 1208]),
    bnot (bands [bvar 679, bvar 682, bvar 1199, bvar 1202]),
    bnot (bands [bvar 679, bvar 683, bvar 1199, bvar 1203]),
    bnot (bands [bvar 679, bvar 684, bvar 1199, bvar 1204]),
    bnot (bands [bvar 679, bvar 686, bvar 1199, bvar 1206]),
    bnot (bands [bvar 679, bvar 687, bvar 1199, bvar 1207]),
    bnot (bands [bvar 679, bvar 688, bvar 1199, bvar 1208]),
    bnot (bands [bvar 680, bvar 682, bvar 1200, bvar 1202]),
    bnot (bands [bvar 680, bvar 683, bvar 1200, bvar 1203]),
    bnot (bands [bvar 680, bvar 686, bvar 1200, bvar 1206]),
    bnot (bands [bvar 680, bvar 688, bvar 1200, bvar 1208]),
    bnot (bands [bvar 681, bvar 683, bvar 1201, bvar 1203]),
    bnot (bands [bvar 682, bvar 683, bvar 1202, bvar 1203]),
    bnot (bands [bvar 682, bvar 684, bvar 1202, bvar 1204]),
    bnot (bands [bvar 682, bvar 685, bvar 1202, bvar 1205]),
    bnot (bands [bvar 682, bvar 686, bvar 1202, bvar 1206]),
    bnot (bands [bvar 682, bvar 687, bvar 1202, bvar 1207]),
    bnot (bands [bvar 682, bvar 688, bvar 1202, bvar 1208]),
    bnot (bands [bvar 683, bvar 684, bvar 1203, bvar 1204]),
    bnot (bands [bvar 683, bvar 685, bvar 1203, bvar 1205]),
    bnot (bands [bvar 683, bvar 686, bvar 1203, bvar 1206]),
    bnot (bands [bvar 683, bvar 687, bvar 1203, bvar 1207]),
    bnot (bands [bvar 683, bvar 688, bvar 1203, bvar 1208]),
    bnot (bands [bvar 684, bvar 686, bvar 1204, bvar 1206]),
    bnot (bands [bvar 684, bvar 687, bvar 1204, bvar 1207]),
    bnot (bands [bvar 684, bvar 688, bvar 1204, bvar 1208]),
    bnot (bands [bvar 685, bvar 686, bvar 1205, bvar 1206]),
    bnot (bands [bvar 685, bvar 687, bvar 1205, bvar 1207]) ]

def reducedUnionChunk100 : BVLogicalExpr :=
  bands reducedUnionChunk100Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
