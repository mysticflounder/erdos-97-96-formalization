import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk087Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 608, bvar 612, bvar 1128, bvar 1132]),
    bnot (bands [bvar 610, bvar 612, bvar 1130, bvar 1132]),
    bnot (bands [bvar 611, bvar 612, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1107, bvar 1116, bvar 626, bvar 635]),
    bnot (bands [bvar 1107, bvar 1117, bvar 626, bvar 636]),
    bnot (bands [bvar 1107, bvar 1119, bvar 626, bvar 638]),
    bnot (bands [bvar 1108, bvar 1117, bvar 627, bvar 636]),
    bnot (bands [bvar 1108, bvar 1118, bvar 627, bvar 637]),
    bnot (bands [bvar 1110, bvar 1111, bvar 629, bvar 630]),
    bnot (bands [bvar 1110, bvar 1115, bvar 629, bvar 634]),
    bnot (bands [bvar 1110, bvar 1116, bvar 629, bvar 635]),
    bnot (bands [bvar 1110, bvar 1117, bvar 629, bvar 636]),
    bnot (bands [bvar 1110, bvar 1119, bvar 629, bvar 638]),
    bnot (bands [bvar 1111, bvar 1115, bvar 630, bvar 634]),
    bnot (bands [bvar 1111, bvar 1116, bvar 630, bvar 635]),
    bnot (bands [bvar 1111, bvar 1117, bvar 630, bvar 636]),
    bnot (bands [bvar 1115, bvar 1116, bvar 634, bvar 635]),
    bnot (bands [bvar 1115, bvar 1117, bvar 634, bvar 636]),
    bnot (bands [bvar 1115, bvar 1118, bvar 634, bvar 637]),
    bnot (bands [bvar 1115, bvar 1119, bvar 634, bvar 638]),
    bnot (bands [bvar 1116, bvar 1117, bvar 635, bvar 636]),
    bnot (bands [bvar 1116, bvar 1118, bvar 635, bvar 637]),
    bnot (bands [bvar 1117, bvar 1118, bvar 636, bvar 637]),
    bnot (bands [bvar 1117, bvar 1119, bvar 636, bvar 638]),
    bnot (bands [bvar 1118, bvar 1119, bvar 637, bvar 638]),
    bnot (bands [bvar 600, bvar 612, bvar 1133, bvar 1145]),
    bnot (bands [bvar 601, bvar 611, bvar 1134, bvar 1144]),
    bnot (bands [bvar 602, bvar 608, bvar 1135, bvar 1141]),
    bnot (bands [bvar 602, bvar 609, bvar 1135, bvar 1142]),
    bnot (bands [bvar 602, bvar 611, bvar 1135, bvar 1144]),
    bnot (bands [bvar 602, bvar 612, bvar 1135, bvar 1145]),
    bnot (bands [bvar 603, bvar 604, bvar 1136, bvar 1137]),
    bnot (bands [bvar 603, bvar 608, bvar 1136, bvar 1141]),
    bnot (bands [bvar 603, bvar 609, bvar 1136, bvar 1142]),
    bnot (bands [bvar 603, bvar 610, bvar 1136, bvar 1143]),
    bnot (bands [bvar 603, bvar 611, bvar 1136, bvar 1144]),
    bnot (bands [bvar 603, bvar 612, bvar 1136, bvar 1145]),
    bnot (bands [bvar 604, bvar 608, bvar 1137, bvar 1141]),
    bnot (bands [bvar 604, bvar 609, bvar 1137, bvar 1142]),
    bnot (bands [bvar 604, bvar 610, bvar 1137, bvar 1143]),
    bnot (bands [bvar 604, bvar 611, bvar 1137, bvar 1144]),
    bnot (bands [bvar 604, bvar 612, bvar 1137, bvar 1145]),
    bnot (bands [bvar 608, bvar 609, bvar 1141, bvar 1142]),
    bnot (bands [bvar 608, bvar 610, bvar 1141, bvar 1143]),
    bnot (bands [bvar 608, bvar 611, bvar 1141, bvar 1144]),
    bnot (bands [bvar 608, bvar 612, bvar 1141, bvar 1145]),
    bnot (bands [bvar 609, bvar 610, bvar 1142, bvar 1143]),
    bnot (bands [bvar 609, bvar 611, bvar 1142, bvar 1144]),
    bnot (bands [bvar 609, bvar 612, bvar 1142, bvar 1145]),
    bnot (bands [bvar 610, bvar 611, bvar 1143, bvar 1144]),
    bnot (bands [bvar 610, bvar 612, bvar 1143, bvar 1145]),
    bnot (bands [bvar 611, bvar 612, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1107, bvar 1108, bvar 639, bvar 640]),
    bnot (bands [bvar 1107, bvar 1111, bvar 639, bvar 643]),
    bnot (bands [bvar 1107, bvar 1119, bvar 639, bvar 651]),
    bnot (bands [bvar 1108, bvar 1111, bvar 640, bvar 643]),
    bnot (bands [bvar 1108, bvar 1116, bvar 640, bvar 648]),
    bnot (bands [bvar 1108, bvar 1117, bvar 640, bvar 649]),
    bnot (bands [bvar 1108, bvar 1118, bvar 640, bvar 650]),
    bnot (bands [bvar 1108, bvar 1119, bvar 640, bvar 651]),
    bnot (bands [bvar 1111, bvar 1119, bvar 643, bvar 651]),
    bnot (bands [bvar 1107, bvar 1111, bvar 652, bvar 656]),
    bnot (bands [bvar 1107, bvar 1117, bvar 652, bvar 662]),
    bnot (bands [bvar 1108, bvar 1111, bvar 653, bvar 656]) ]

def reducedUnionChunk087 : BVLogicalExpr :=
  bands reducedUnionChunk087Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
