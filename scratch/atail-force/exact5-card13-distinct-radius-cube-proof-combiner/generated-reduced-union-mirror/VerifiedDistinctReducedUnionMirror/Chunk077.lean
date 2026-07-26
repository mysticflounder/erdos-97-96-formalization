import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk077Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1045, bvar 1048, bvar 629, bvar 632]),
    bnot (bands [bvar 1046, bvar 1047, bvar 630, bvar 631]),
    bnot (bands [bvar 1046, bvar 1048, bvar 630, bvar 632]),
    bnot (bands [bvar 1047, bvar 1048, bvar 631, bvar 632]),
    bnot (bands [bvar 1050, bvar 1053, bvar 634, bvar 637]),
    bnot (bands [bvar 1050, bvar 1054, bvar 634, bvar 638]),
    bnot (bands [bvar 1051, bvar 1052, bvar 635, bvar 636]),
    bnot (bands [bvar 1051, bvar 1053, bvar 635, bvar 637]),
    bnot (bands [bvar 1052, bvar 1053, bvar 636, bvar 637]),
    bnot (bands [bvar 536, bvar 540, bvar 1134, bvar 1138]),
    bnot (bands [bvar 536, bvar 541, bvar 1134, bvar 1139]),
    bnot (bands [bvar 537, bvar 541, bvar 1135, bvar 1139]),
    bnot (bands [bvar 538, bvar 541, bvar 1136, bvar 1139]),
    bnot (bands [bvar 539, bvar 540, bvar 1137, bvar 1138]),
    bnot (bands [bvar 539, bvar 541, bvar 1137, bvar 1139]),
    bnot (bands [bvar 540, bvar 541, bvar 1138, bvar 1139]),
    bnot (bands [bvar 1043, bvar 1046, bvar 640, bvar 643]),
    bnot (bands [bvar 1043, bvar 1047, bvar 640, bvar 644]),
    bnot (bands [bvar 1043, bvar 1048, bvar 640, bvar 645]),
    bnot (bands [bvar 1043, bvar 1049, bvar 640, bvar 646]),
    bnot (bands [bvar 1044, bvar 1048, bvar 641, bvar 645]),
    bnot (bands [bvar 1045, bvar 1049, bvar 642, bvar 646]),
    bnot (bands [bvar 1046, bvar 1048, bvar 643, bvar 645]),
    bnot (bands [bvar 1046, bvar 1049, bvar 643, bvar 646]),
    bnot (bands [bvar 1048, bvar 1049, bvar 645, bvar 646]),
    bnot (bands [bvar 1043, bvar 1046, bvar 653, bvar 656]),
    bnot (bands [bvar 1043, bvar 1047, bvar 653, bvar 657]),
    bnot (bands [bvar 1043, bvar 1048, bvar 653, bvar 658]),
    bnot (bands [bvar 1043, bvar 1049, bvar 653, bvar 659]),
    bnot (bands [bvar 1043, bvar 1050, bvar 653, bvar 660]),
    bnot (bands [bvar 1044, bvar 1046, bvar 654, bvar 656]),
    bnot (bands [bvar 1044, bvar 1047, bvar 654, bvar 657]),
    bnot (bands [bvar 1044, bvar 1048, bvar 654, bvar 658]),
    bnot (bands [bvar 1044, bvar 1049, bvar 654, bvar 659]),
    bnot (bands [bvar 1044, bvar 1050, bvar 654, bvar 660]),
    bnot (bands [bvar 1045, bvar 1047, bvar 655, bvar 657]),
    bnot (bands [bvar 1045, bvar 1048, bvar 655, bvar 658]),
    bnot (bands [bvar 1045, bvar 1049, bvar 655, bvar 659]),
    bnot (bands [bvar 1045, bvar 1050, bvar 655, bvar 660]),
    bnot (bands [bvar 1046, bvar 1047, bvar 656, bvar 657]),
    bnot (bands [bvar 1046, bvar 1048, bvar 656, bvar 658]),
    bnot (bands [bvar 1046, bvar 1049, bvar 656, bvar 659]),
    bnot (bands [bvar 1046, bvar 1050, bvar 656, bvar 660]),
    bnot (bands [bvar 1047, bvar 1048, bvar 657, bvar 658]),
    bnot (bands [bvar 1047, bvar 1049, bvar 657, bvar 659]),
    bnot (bands [bvar 1047, bvar 1050, bvar 657, bvar 660]),
    bnot (bands [bvar 1048, bvar 1049, bvar 658, bvar 659]),
    bnot (bands [bvar 1048, bvar 1050, bvar 658, bvar 660]),
    bnot (bands [bvar 1049, bvar 1050, bvar 659, bvar 660]),
    bnot (bands [bvar 1052, bvar 1053, bvar 662, bvar 663]),
    bnot (bands [bvar 1053, bvar 1054, bvar 663, bvar 664]),
    bnot (bands [bvar 1043, bvar 1046, bvar 666, bvar 669]),
    bnot (bands [bvar 1043, bvar 1047, bvar 666, bvar 670]),
    bnot (bands [bvar 1043, bvar 1048, bvar 666, bvar 671]),
    bnot (bands [bvar 1043, bvar 1049, bvar 666, bvar 672]),
    bnot (bands [bvar 1043, bvar 1050, bvar 666, bvar 673]),
    bnot (bands [bvar 1043, bvar 1051, bvar 666, bvar 674]),
    bnot (bands [bvar 1044, bvar 1047, bvar 667, bvar 670]),
    bnot (bands [bvar 1044, bvar 1048, bvar 667, bvar 671]),
    bnot (bands [bvar 1044, bvar 1049, bvar 667, bvar 672]),
    bnot (bands [bvar 1044, bvar 1050, bvar 667, bvar 673]),
    bnot (bands [bvar 1044, bvar 1051, bvar 667, bvar 674]),
    bnot (bands [bvar 1045, bvar 1047, bvar 668, bvar 670]),
    bnot (bands [bvar 1045, bvar 1048, bvar 668, bvar 671]) ]

def reducedUnionChunk077 : BVLogicalExpr :=
  bands reducedUnionChunk077Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
