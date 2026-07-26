import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk042Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 622, bvar 624, bvar 648, bvar 650]),
    bnot (bands [bvar 622, bvar 625, bvar 648, bvar 651]),
    bnot (bands [bvar 623, bvar 624, bvar 649, bvar 650]),
    bnot (bands [bvar 624, bvar 625, bvar 650, bvar 651]),
    bnot (bands [bvar 613, bvar 617, bvar 652, bvar 656]),
    bnot (bands [bvar 614, bvar 617, bvar 653, bvar 656]),
    bnot (bands [bvar 614, bvar 623, bvar 653, bvar 662]),
    bnot (bands [bvar 614, bvar 624, bvar 653, bvar 663]),
    bnot (bands [bvar 614, bvar 625, bvar 653, bvar 664]),
    bnot (bands [bvar 615, bvar 617, bvar 654, bvar 656]),
    bnot (bands [bvar 615, bvar 623, bvar 654, bvar 662]),
    bnot (bands [bvar 615, bvar 625, bvar 654, bvar 664]),
    bnot (bands [bvar 616, bvar 617, bvar 655, bvar 656]),
    bnot (bands [bvar 616, bvar 623, bvar 655, bvar 662]),
    bnot (bands [bvar 616, bvar 624, bvar 655, bvar 663]),
    bnot (bands [bvar 616, bvar 625, bvar 655, bvar 664]),
    bnot (bands [bvar 617, bvar 618, bvar 656, bvar 657]),
    bnot (bands [bvar 617, bvar 623, bvar 656, bvar 662]),
    bnot (bands [bvar 617, bvar 624, bvar 656, bvar 663]),
    bnot (bands [bvar 617, bvar 625, bvar 656, bvar 664]),
    bnot (bands [bvar 618, bvar 623, bvar 657, bvar 662]),
    bnot (bands [bvar 618, bvar 624, bvar 657, bvar 663]),
    bnot (bands [bvar 618, bvar 625, bvar 657, bvar 664]),
    bnot (bands [bvar 620, bvar 621, bvar 659, bvar 660]),
    bnot (bands [bvar 623, bvar 624, bvar 662, bvar 663]),
    bnot (bands [bvar 623, bvar 625, bvar 662, bvar 664]),
    bnot (bands [bvar 624, bvar 625, bvar 663, bvar 664]),
    bnot (bands [bvar 613, bvar 614, bvar 665, bvar 666]),
    bnot (bands [bvar 613, bvar 615, bvar 665, bvar 667]),
    bnot (bands [bvar 613, bvar 616, bvar 665, bvar 668]),
    bnot (bands [bvar 613, bvar 617, bvar 665, bvar 669]),
    bnot (bands [bvar 613, bvar 618, bvar 665, bvar 670]),
    bnot (bands [bvar 613, bvar 624, bvar 665, bvar 676]),
    bnot (bands [bvar 613, bvar 625, bvar 665, bvar 677]),
    bnot (bands [bvar 614, bvar 617, bvar 666, bvar 669]),
    bnot (bands [bvar 614, bvar 618, bvar 666, bvar 670]),
    bnot (bands [bvar 614, bvar 624, bvar 666, bvar 676]),
    bnot (bands [bvar 614, bvar 625, bvar 666, bvar 677]),
    bnot (bands [bvar 615, bvar 617, bvar 667, bvar 669]),
    bnot (bands [bvar 615, bvar 618, bvar 667, bvar 670]),
    bnot (bands [bvar 615, bvar 624, bvar 667, bvar 676]),
    bnot (bands [bvar 615, bvar 625, bvar 667, bvar 677]),
    bnot (bands [bvar 616, bvar 617, bvar 668, bvar 669]),
    bnot (bands [bvar 616, bvar 618, bvar 668, bvar 670]),
    bnot (bands [bvar 616, bvar 624, bvar 668, bvar 676]),
    bnot (bands [bvar 616, bvar 625, bvar 668, bvar 677]),
    bnot (bands [bvar 617, bvar 618, bvar 669, bvar 670]),
    bnot (bands [bvar 617, bvar 624, bvar 669, bvar 676]),
    bnot (bands [bvar 617, bvar 625, bvar 669, bvar 677]),
    bnot (bands [bvar 618, bvar 624, bvar 670, bvar 676]),
    bnot (bands [bvar 618, bvar 625, bvar 670, bvar 677]),
    bnot (bands [bvar 620, bvar 621, bvar 672, bvar 673]),
    bnot (bands [bvar 620, bvar 622, bvar 672, bvar 674]),
    bnot (bands [bvar 621, bvar 622, bvar 673, bvar 674]),
    bnot (bands [bvar 624, bvar 625, bvar 676, bvar 677]),
    bnot (bands [bvar 613, bvar 614, bvar 678, bvar 679]),
    bnot (bands [bvar 613, bvar 618, bvar 678, bvar 683]),
    bnot (bands [bvar 614, bvar 618, bvar 679, bvar 683]),
    bnot (bands [bvar 614, bvar 625, bvar 679, bvar 690]),
    bnot (bands [bvar 615, bvar 618, bvar 680, bvar 683]),
    bnot (bands [bvar 615, bvar 625, bvar 680, bvar 690]),
    bnot (bands [bvar 618, bvar 625, bvar 683, bvar 690]),
    bnot (bands [bvar 620, bvar 621, bvar 685, bvar 686]),
    bnot (bands [bvar 614, bvar 617, bvar 692, bvar 695]) ]

def reducedUnionChunk042 : BVLogicalExpr :=
  bands reducedUnionChunk042Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
