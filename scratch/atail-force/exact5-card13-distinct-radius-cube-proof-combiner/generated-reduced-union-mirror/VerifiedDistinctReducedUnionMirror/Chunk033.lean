import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk033Assertions : List BVLogicalExpr :=
  [ bnot (bvar 689),
    exactly [bvar 678, bvar 679, bvar 680, bvar 681, bvar 682, bvar 683, bvar 684, bvar 685, bvar 686, bvar 687, bvar 688, bvar 689, bvar 690] 4,
    bnot (bvar 703),
    exactly [bvar 691, bvar 692, bvar 693, bvar 694, bvar 695, bvar 696, bvar 697, bvar 698, bvar 699, bvar 700, bvar 701, bvar 702, bvar 703] 4,
    atMost [bands [bvar 613, bvar 678], bands [bvar 614, bvar 679], bands [bvar 615, bvar 680], bands [bvar 616, bvar 681], bands [bvar 617, bvar 682], bands [bvar 618, bvar 683], bands [bvar 619, bvar 684], bands [bvar 620, bvar 685], bands [bvar 621, bvar 686], bands [bvar 622, bvar 687], bands [bvar 623, bvar 688], bands [bvar 624, bvar 689], bands [bvar 625, bvar 690]] 2,
    atMost [bands [bvar 613, bvar 691], bands [bvar 614, bvar 692], bands [bvar 615, bvar 693], bands [bvar 616, bvar 694], bands [bvar 617, bvar 695], bands [bvar 618, bvar 696], bands [bvar 619, bvar 697], bands [bvar 620, bvar 698], bands [bvar 621, bvar 699], bands [bvar 622, bvar 700], bands [bvar 623, bvar 701], bands [bvar 624, bvar 702], bands [bvar 625, bvar 703]] 2,
    atMost [bands [bvar 652, bvar 691], bands [bvar 653, bvar 692], bands [bvar 654, bvar 693], bands [bvar 655, bvar 694], bands [bvar 656, bvar 695], bands [bvar 657, bvar 696], bands [bvar 658, bvar 697], bands [bvar 659, bvar 698], bands [bvar 660, bvar 699], bands [bvar 661, bvar 700], bands [bvar 662, bvar 701], bands [bvar 663, bvar 702], bands [bvar 664, bvar 703]] 2,
    atMost [bands [bvar 536, bvar 541], bands [bvar 549, bvar 554], bands [bvar 562, bvar 567], bands [bvar 575, bvar 580], bands [bvar 588, bvar 593], bands [bvar 601, bvar 606], bands [bvar 614, bvar 619], bands [bvar 627, bvar 632], bands [bvar 640, bvar 645], bands [bvar 653, bvar 658], bands [bvar 666, bvar 671], bands [bvar 679, bvar 684], bands [bvar 692, bvar 697]] 2,
    atMost [bands [bvar 536, bvar 542], bands [bvar 549, bvar 555], bands [bvar 562, bvar 568], bands [bvar 575, bvar 581], bands [bvar 588, bvar 594], bands [bvar 601, bvar 607], bands [bvar 614, bvar 620], bands [bvar 627, bvar 633], bands [bvar 640, bvar 646], bands [bvar 653, bvar 659], bands [bvar 666, bvar 672], bands [bvar 679, bvar 685], bands [bvar 692, bvar 698]] 2,
    atMost [bands [bvar 536, bvar 543], bands [bvar 549, bvar 556], bands [bvar 562, bvar 569], bands [bvar 575, bvar 582], bands [bvar 588, bvar 595], bands [bvar 601, bvar 608], bands [bvar 614, bvar 621], bands [bvar 627, bvar 634], bands [bvar 640, bvar 647], bands [bvar 653, bvar 660], bands [bvar 666, bvar 673], bands [bvar 679, bvar 686], bands [bvar 692, bvar 699]] 2,
    atMost [bands [bvar 538, bvar 543], bands [bvar 551, bvar 556], bands [bvar 564, bvar 569], bands [bvar 577, bvar 582], bands [bvar 590, bvar 595], bands [bvar 603, bvar 608], bands [bvar 616, bvar 621], bands [bvar 629, bvar 634], bands [bvar 642, bvar 647], bands [bvar 655, bvar 660], bands [bvar 668, bvar 673], bands [bvar 681, bvar 686], bands [bvar 694, bvar 699]] 2,
    atMost [bands [bvar 538, bvar 544], bands [bvar 551, bvar 557], bands [bvar 564, bvar 570], bands [bvar 577, bvar 583], bands [bvar 590, bvar 596], bands [bvar 603, bvar 609], bands [bvar 616, bvar 622], bands [bvar 629, bvar 635], bands [bvar 642, bvar 648], bands [bvar 655, bvar 661], bands [bvar 668, bvar 674], bands [bvar 681, bvar 687], bands [bvar 694, bvar 700]] 2,
    atMost [bands [bvar 539, bvar 542], bands [bvar 552, bvar 555], bands [bvar 565, bvar 568], bands [bvar 578, bvar 581], bands [bvar 591, bvar 594], bands [bvar 604, bvar 607], bands [bvar 617, bvar 620], bands [bvar 630, bvar 633], bands [bvar 643, bvar 646], bands [bvar 656, bvar 659], bands [bvar 669, bvar 672], bands [bvar 682, bvar 685], bands [bvar 695, bvar 698]] 2,
    bnot (bands [bvar 538, bvar 540, bvar 564, bvar 566]),
    bnot (bands [bvar 538, bvar 541, bvar 564, bvar 567]),
    bnot (bands [bvar 538, bvar 542, bvar 564, bvar 568]),
    bnot (bands [bvar 538, bvar 543, bvar 564, bvar 569]),
    bnot (bands [bvar 538, bvar 544, bvar 564, bvar 570]),
    bnot (bands [bvar 538, bvar 545, bvar 564, bvar 571]),
    bnot (bands [bvar 538, bvar 546, bvar 564, bvar 572]),
    bnot (bands [bvar 538, bvar 547, bvar 564, bvar 573]),
    bnot (bands [bvar 540, bvar 543, bvar 566, bvar 569]),
    bnot (bands [bvar 540, bvar 547, bvar 566, bvar 573]),
    bnot (bands [bvar 541, bvar 545, bvar 567, bvar 571]),
    bnot (bands [bvar 541, bvar 546, bvar 567, bvar 572]),
    bnot (bands [bvar 542, bvar 543, bvar 568, bvar 569]),
    bnot (bands [bvar 542, bvar 544, bvar 568, bvar 570]),
    bnot (bands [bvar 542, bvar 545, bvar 568, bvar 571]),
    bnot (bands [bvar 543, bvar 547, bvar 569, bvar 573]),
    bnot (bands [bvar 544, bvar 546, bvar 570, bvar 572]),
    bnot (bands [bvar 545, bvar 546, bvar 571, bvar 572]),
    bnot (bands [bvar 539, bvar 540, bvar 578, bvar 579]),
    bnot (bands [bvar 540, bvar 541, bvar 579, bvar 580]),
    bnot (bands [bvar 540, bvar 542, bvar 579, bvar 581]),
    bnot (bands [bvar 540, bvar 543, bvar 579, bvar 582]),
    bnot (bands [bvar 540, bvar 546, bvar 579, bvar 585]),
    bnot (bands [bvar 540, bvar 547, bvar 579, bvar 586]),
    bnot (bands [bvar 541, bvar 547, bvar 580, bvar 586]),
    bnot (bands [bvar 542, bvar 543, bvar 581, bvar 582]),
    bnot (bands [bvar 542, bvar 546, bvar 581, bvar 585]),
    bnot (bands [bvar 542, bvar 547, bvar 581, bvar 586]),
    bnot (bands [bvar 541, bvar 542, bvar 606, bvar 607]),
    bnot (bands [bvar 541, bvar 543, bvar 606, bvar 608]),
    bnot (bands [bvar 541, bvar 544, bvar 606, bvar 609]),
    bnot (bands [bvar 541, bvar 545, bvar 606, bvar 610]),
    bnot (bands [bvar 541, bvar 546, bvar 606, bvar 611]),
    bnot (bands [bvar 541, bvar 547, bvar 606, bvar 612]),
    bnot (bands [bvar 542, bvar 543, bvar 607, bvar 608]),
    bnot (bands [bvar 542, bvar 544, bvar 607, bvar 609]),
    bnot (bands [bvar 542, bvar 546, bvar 607, bvar 611]),
    bnot (bands [bvar 542, bvar 547, bvar 607, bvar 612]),
    bnot (bands [bvar 536, bvar 540, bvar 614, bvar 618]),
    bnot (bands [bvar 537, bvar 539, bvar 615, bvar 617]),
    bnot (bands [bvar 537, bvar 540, bvar 615, bvar 618]),
    bnot (bands [bvar 539, bvar 540, bvar 617, bvar 618]),
    bnot (bands [bvar 542, bvar 543, bvar 620, bvar 621]),
    bnot (bands [bvar 542, bvar 544, bvar 620, bvar 622]),
    bnot (bands [bvar 542, bvar 545, bvar 620, bvar 623]),
    bnot (bands [bvar 542, bvar 546, bvar 620, bvar 624]),
    bnot (bands [bvar 542, bvar 547, bvar 620, bvar 625]),
    bnot (bands [bvar 544, bvar 545, bvar 622, bvar 623]),
    bnot (bands [bvar 544, bvar 546, bvar 622, bvar 624]),
    bnot (bands [bvar 536, bvar 540, bvar 627, bvar 631]),
    bnot (bands [bvar 536, bvar 541, bvar 627, bvar 632]) ]

def reducedUnionChunk033 : BVLogicalExpr :=
  bands reducedUnionChunk033Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
