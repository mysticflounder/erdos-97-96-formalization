import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk076Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 536, bvar 539, bvar 1108, bvar 1111]),
    bnot (bands [bvar 541, bvar 542, bvar 1113, bvar 1114]),
    bnot (bands [bvar 541, bvar 543, bvar 1113, bvar 1115]),
    bnot (bands [bvar 541, bvar 544, bvar 1113, bvar 1116]),
    bnot (bands [bvar 541, bvar 545, bvar 1113, bvar 1117]),
    bnot (bands [bvar 541, bvar 546, bvar 1113, bvar 1118]),
    bnot (bands [bvar 541, bvar 547, bvar 1113, bvar 1119]),
    bnot (bands [bvar 542, bvar 543, bvar 1114, bvar 1115]),
    bnot (bands [bvar 542, bvar 544, bvar 1114, bvar 1116]),
    bnot (bands [bvar 542, bvar 545, bvar 1114, bvar 1117]),
    bnot (bands [bvar 542, bvar 546, bvar 1114, bvar 1118]),
    bnot (bands [bvar 542, bvar 547, bvar 1114, bvar 1119]),
    bnot (bands [bvar 543, bvar 544, bvar 1115, bvar 1116]),
    bnot (bands [bvar 543, bvar 545, bvar 1115, bvar 1117]),
    bnot (bands [bvar 543, bvar 546, bvar 1115, bvar 1118]),
    bnot (bands [bvar 543, bvar 547, bvar 1115, bvar 1119]),
    bnot (bands [bvar 544, bvar 545, bvar 1116, bvar 1117]),
    bnot (bands [bvar 544, bvar 546, bvar 1116, bvar 1118]),
    bnot (bands [bvar 544, bvar 547, bvar 1116, bvar 1119]),
    bnot (bands [bvar 545, bvar 546, bvar 1117, bvar 1118]),
    bnot (bands [bvar 546, bvar 547, bvar 1118, bvar 1119]),
    atMost [bands [bvar 1042, bvar 613], bands [bvar 1043, bvar 614], bands [bvar 1044, bvar 615], bands [bvar 1045, bvar 616], bands [bvar 1046, bvar 617], bands [bvar 1047, bvar 618], bands [bvar 1048, bvar 619], bands [bvar 1049, bvar 620], bands [bvar 1050, bvar 621], bands [bvar 1051, bvar 622], bands [bvar 1052, bvar 623], bands [bvar 1053, bvar 624], bands [bvar 1054, bvar 625]] 2,
    bnot (bands [bvar 1043, bvar 1047, bvar 614, bvar 618]),
    bnot (bands [bvar 1044, bvar 1047, bvar 615, bvar 618]),
    bnot (bands [bvar 1045, bvar 1046, bvar 616, bvar 617]),
    bnot (bands [bvar 1045, bvar 1047, bvar 616, bvar 618]),
    bnot (bands [bvar 1046, bvar 1047, bvar 617, bvar 618]),
    bnot (bands [bvar 1049, bvar 1050, bvar 620, bvar 621]),
    bnot (bands [bvar 1049, bvar 1051, bvar 620, bvar 622]),
    bnot (bands [bvar 1049, bvar 1052, bvar 620, bvar 623]),
    bnot (bands [bvar 1049, bvar 1053, bvar 620, bvar 624]),
    bnot (bands [bvar 1049, bvar 1054, bvar 620, bvar 625]),
    bnot (bands [bvar 1051, bvar 1052, bvar 622, bvar 623]),
    bnot (bands [bvar 1051, bvar 1053, bvar 622, bvar 624]),
    bnot (bands [bvar 1051, bvar 1054, bvar 622, bvar 625]),
    atMost [bands [bvar 535, bvar 1120], bands [bvar 536, bvar 1121], bands [bvar 537, bvar 1122], bands [bvar 538, bvar 1123], bands [bvar 539, bvar 1124], bands [bvar 540, bvar 1125], bands [bvar 541, bvar 1126], bands [bvar 542, bvar 1127], bands [bvar 543, bvar 1128], bands [bvar 544, bvar 1129], bands [bvar 545, bvar 1130], bands [bvar 546, bvar 1131], bands [bvar 547, bvar 1132]] 2,
    bnot (bands [bvar 536, bvar 540, bvar 1121, bvar 1125]),
    bnot (bands [bvar 537, bvar 539, bvar 1122, bvar 1124]),
    bnot (bands [bvar 537, bvar 540, bvar 1122, bvar 1125]),
    bnot (bands [bvar 538, bvar 539, bvar 1123, bvar 1124]),
    bnot (bands [bvar 538, bvar 540, bvar 1123, bvar 1125]),
    bnot (bands [bvar 539, bvar 540, bvar 1124, bvar 1125]),
    bnot (bands [bvar 542, bvar 543, bvar 1127, bvar 1128]),
    bnot (bands [bvar 542, bvar 544, bvar 1127, bvar 1129]),
    bnot (bands [bvar 542, bvar 545, bvar 1127, bvar 1130]),
    bnot (bands [bvar 542, bvar 546, bvar 1127, bvar 1131]),
    bnot (bands [bvar 542, bvar 547, bvar 1127, bvar 1132]),
    bnot (bands [bvar 543, bvar 544, bvar 1128, bvar 1129]),
    bnot (bands [bvar 543, bvar 545, bvar 1128, bvar 1130]),
    bnot (bands [bvar 543, bvar 547, bvar 1128, bvar 1132]),
    bnot (bands [bvar 544, bvar 545, bvar 1129, bvar 1130]),
    bnot (bands [bvar 544, bvar 546, bvar 1129, bvar 1131]),
    bnot (bands [bvar 544, bvar 547, bvar 1129, bvar 1132]),
    bnot (bands [bvar 545, bvar 546, bvar 1130, bvar 1131]),
    bnot (bands [bvar 545, bvar 547, bvar 1130, bvar 1132]),
    bnot (bands [bvar 1043, bvar 1047, bvar 627, bvar 631]),
    bnot (bands [bvar 1043, bvar 1048, bvar 627, bvar 632]),
    bnot (bands [bvar 1044, bvar 1047, bvar 628, bvar 631]),
    bnot (bands [bvar 1044, bvar 1048, bvar 628, bvar 632]),
    bnot (bands [bvar 1045, bvar 1047, bvar 629, bvar 631]),
    bnot (bands [bvar 1045, bvar 1048, bvar 629, bvar 632]),
    bnot (bands [bvar 1046, bvar 1047, bvar 630, bvar 631]),
    bnot (bands [bvar 1046, bvar 1048, bvar 630, bvar 632]),
    bnot (bands [bvar 1047, bvar 1048, bvar 631, bvar 632]) ]

def reducedUnionChunk076 : BVLogicalExpr :=
  bands reducedUnionChunk076Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
