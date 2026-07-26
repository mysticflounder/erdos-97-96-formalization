import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk034Assertions : List BVLogicalExpr :=
  [ exactly [bvar 600, bvar 601, bvar 602, bvar 603, bvar 604, bvar 605, bvar 606, bvar 607, bvar 608, bvar 609, bvar 610, bvar 611, bvar 612] 4,
    bnot (bvar 619),
    exactly [bvar 613, bvar 614, bvar 615, bvar 616, bvar 617, bvar 618, bvar 619, bvar 620, bvar 621, bvar 622, bvar 623, bvar 624, bvar 625] 4,
    bnot (bvar 633),
    exactly [bvar 626, bvar 627, bvar 628, bvar 629, bvar 630, bvar 631, bvar 632, bvar 633, bvar 634, bvar 635, bvar 636, bvar 637, bvar 638] 4,
    bnot (bvar 647),
    exactly [bvar 639, bvar 640, bvar 641, bvar 642, bvar 643, bvar 644, bvar 645, bvar 646, bvar 647, bvar 648, bvar 649, bvar 650, bvar 651] 4,
    bnot (bvar 661),
    exactly [bvar 652, bvar 653, bvar 654, bvar 655, bvar 656, bvar 657, bvar 658, bvar 659, bvar 660, bvar 661, bvar 662, bvar 663, bvar 664] 4,
    bnot (bvar 675),
    exactly [bvar 665, bvar 666, bvar 667, bvar 668, bvar 669, bvar 670, bvar 671, bvar 672, bvar 673, bvar 674, bvar 675, bvar 676, bvar 677] 4,
    bnot (bvar 689),
    exactly [bvar 678, bvar 679, bvar 680, bvar 681, bvar 682, bvar 683, bvar 684, bvar 685, bvar 686, bvar 687, bvar 688, bvar 689, bvar 690] 4,
    bnot (bvar 703),
    exactly [bvar 691, bvar 692, bvar 693, bvar 694, bvar 695, bvar 696, bvar 697, bvar 698, bvar 699, bvar 700, bvar 701, bvar 702, bvar 703] 4,
    atMost [bands [bvar 535, bvar 613], bands [bvar 536, bvar 614], bands [bvar 537, bvar 615], bands [bvar 538, bvar 616], bands [bvar 539, bvar 617], bands [bvar 540, bvar 618], bands [bvar 541, bvar 619], bands [bvar 542, bvar 620], bands [bvar 543, bvar 621], bands [bvar 544, bvar 622], bands [bvar 545, bvar 623], bands [bvar 546, bvar 624], bands [bvar 547, bvar 625]] 2,
    atMost [bands [bvar 600, bvar 691], bands [bvar 601, bvar 692], bands [bvar 602, bvar 693], bands [bvar 603, bvar 694], bands [bvar 604, bvar 695], bands [bvar 605, bvar 696], bands [bvar 606, bvar 697], bands [bvar 607, bvar 698], bands [bvar 608, bvar 699], bands [bvar 609, bvar 700], bands [bvar 610, bvar 701], bands [bvar 611, bvar 702], bands [bvar 612, bvar 703]] 2,
    atMost [bands [bvar 613, bvar 639], bands [bvar 614, bvar 640], bands [bvar 615, bvar 641], bands [bvar 616, bvar 642], bands [bvar 617, bvar 643], bands [bvar 618, bvar 644], bands [bvar 619, bvar 645], bands [bvar 620, bvar 646], bands [bvar 621, bvar 647], bands [bvar 622, bvar 648], bands [bvar 623, bvar 649], bands [bvar 624, bvar 650], bands [bvar 625, bvar 651]] 2,
    atMost [bands [bvar 613, bvar 652], bands [bvar 614, bvar 653], bands [bvar 615, bvar 654], bands [bvar 616, bvar 655], bands [bvar 617, bvar 656], bands [bvar 618, bvar 657], bands [bvar 619, bvar 658], bands [bvar 620, bvar 659], bands [bvar 621, bvar 660], bands [bvar 622, bvar 661], bands [bvar 623, bvar 662], bands [bvar 624, bvar 663], bands [bvar 625, bvar 664]] 2,
    atMost [bands [bvar 613, bvar 665], bands [bvar 614, bvar 666], bands [bvar 615, bvar 667], bands [bvar 616, bvar 668], bands [bvar 617, bvar 669], bands [bvar 618, bvar 670], bands [bvar 619, bvar 671], bands [bvar 620, bvar 672], bands [bvar 621, bvar 673], bands [bvar 622, bvar 674], bands [bvar 623, bvar 675], bands [bvar 624, bvar 676], bands [bvar 625, bvar 677]] 2,
    atMost [bands [bvar 613, bvar 678], bands [bvar 614, bvar 679], bands [bvar 615, bvar 680], bands [bvar 616, bvar 681], bands [bvar 617, bvar 682], bands [bvar 618, bvar 683], bands [bvar 619, bvar 684], bands [bvar 620, bvar 685], bands [bvar 621, bvar 686], bands [bvar 622, bvar 687], bands [bvar 623, bvar 688], bands [bvar 624, bvar 689], bands [bvar 625, bvar 690]] 2,
    atMost [bands [bvar 536, bvar 540], bands [bvar 549, bvar 553], bands [bvar 562, bvar 566], bands [bvar 575, bvar 579], bands [bvar 588, bvar 592], bands [bvar 601, bvar 605], bands [bvar 614, bvar 618], bands [bvar 627, bvar 631], bands [bvar 640, bvar 644], bands [bvar 653, bvar 657], bands [bvar 666, bvar 670], bands [bvar 679, bvar 683], bands [bvar 692, bvar 696]] 2,
    atMost [bands [bvar 536, bvar 541], bands [bvar 549, bvar 554], bands [bvar 562, bvar 567], bands [bvar 575, bvar 580], bands [bvar 588, bvar 593], bands [bvar 601, bvar 606], bands [bvar 614, bvar 619], bands [bvar 627, bvar 632], bands [bvar 640, bvar 645], bands [bvar 653, bvar 658], bands [bvar 666, bvar 671], bands [bvar 679, bvar 684], bands [bvar 692, bvar 697]] 2,
    atMost [bands [bvar 536, bvar 542], bands [bvar 549, bvar 555], bands [bvar 562, bvar 568], bands [bvar 575, bvar 581], bands [bvar 588, bvar 594], bands [bvar 601, bvar 607], bands [bvar 614, bvar 620], bands [bvar 627, bvar 633], bands [bvar 640, bvar 646], bands [bvar 653, bvar 659], bands [bvar 666, bvar 672], bands [bvar 679, bvar 685], bands [bvar 692, bvar 698]] 2,
    atMost [bands [bvar 536, bvar 543], bands [bvar 549, bvar 556], bands [bvar 562, bvar 569], bands [bvar 575, bvar 582], bands [bvar 588, bvar 595], bands [bvar 601, bvar 608], bands [bvar 614, bvar 621], bands [bvar 627, bvar 634], bands [bvar 640, bvar 647], bands [bvar 653, bvar 660], bands [bvar 666, bvar 673], bands [bvar 679, bvar 686], bands [bvar 692, bvar 699]] 2,
    atMost [bands [bvar 536, bvar 544], bands [bvar 549, bvar 557], bands [bvar 562, bvar 570], bands [bvar 575, bvar 583], bands [bvar 588, bvar 596], bands [bvar 601, bvar 609], bands [bvar 614, bvar 622], bands [bvar 627, bvar 635], bands [bvar 640, bvar 648], bands [bvar 653, bvar 661], bands [bvar 666, bvar 674], bands [bvar 679, bvar 687], bands [bvar 692, bvar 700]] 2,
    atMost [bands [bvar 536, bvar 545], bands [bvar 549, bvar 558], bands [bvar 562, bvar 571], bands [bvar 575, bvar 584], bands [bvar 588, bvar 597], bands [bvar 601, bvar 610], bands [bvar 614, bvar 623], bands [bvar 627, bvar 636], bands [bvar 640, bvar 649], bands [bvar 653, bvar 662], bands [bvar 666, bvar 675], bands [bvar 679, bvar 688], bands [bvar 692, bvar 701]] 2,
    atMost [bands [bvar 536, bvar 546], bands [bvar 549, bvar 559], bands [bvar 562, bvar 572], bands [bvar 575, bvar 585], bands [bvar 588, bvar 598], bands [bvar 601, bvar 611], bands [bvar 614, bvar 624], bands [bvar 627, bvar 637], bands [bvar 640, bvar 650], bands [bvar 653, bvar 663], bands [bvar 666, bvar 676], bands [bvar 679, bvar 689], bands [bvar 692, bvar 702]] 2,
    atMost [bands [bvar 538, bvar 545], bands [bvar 551, bvar 558], bands [bvar 564, bvar 571], bands [bvar 577, bvar 584], bands [bvar 590, bvar 597], bands [bvar 603, bvar 610], bands [bvar 616, bvar 623], bands [bvar 629, bvar 636], bands [bvar 642, bvar 649], bands [bvar 655, bvar 662], bands [bvar 668, bvar 675], bands [bvar 681, bvar 688], bands [bvar 694, bvar 701]] 2,
    atMost [bands [bvar 538, bvar 547], bands [bvar 551, bvar 560], bands [bvar 564, bvar 573], bands [bvar 577, bvar 586], bands [bvar 590, bvar 599], bands [bvar 603, bvar 612], bands [bvar 616, bvar 625], bands [bvar 629, bvar 638], bands [bvar 642, bvar 651], bands [bvar 655, bvar 664], bands [bvar 668, bvar 677], bands [bvar 681, bvar 690], bands [bvar 694, bvar 703]] 2,
    atMost [bands [bvar 539, bvar 543], bands [bvar 552, bvar 556], bands [bvar 565, bvar 569], bands [bvar 578, bvar 582], bands [bvar 591, bvar 595], bands [bvar 604, bvar 608], bands [bvar 617, bvar 621], bands [bvar 630, bvar 634], bands [bvar 643, bvar 647], bands [bvar 656, bvar 660], bands [bvar 669, bvar 673], bands [bvar 682, bvar 686], bands [bvar 695, bvar 699]] 2,
    atMost [bands [bvar 539, bvar 544], bands [bvar 552, bvar 557], bands [bvar 565, bvar 570], bands [bvar 578, bvar 583], bands [bvar 591, bvar 596], bands [bvar 604, bvar 609], bands [bvar 617, bvar 622], bands [bvar 630, bvar 635], bands [bvar 643, bvar 648], bands [bvar 656, bvar 661], bands [bvar 669, bvar 674], bands [bvar 682, bvar 687], bands [bvar 695, bvar 700]] 2,
    atMost [bands [bvar 541, bvar 545], bands [bvar 554, bvar 558], bands [bvar 567, bvar 571], bands [bvar 580, bvar 584], bands [bvar 593, bvar 597], bands [bvar 606, bvar 610], bands [bvar 619, bvar 623], bands [bvar 632, bvar 636], bands [bvar 645, bvar 649], bands [bvar 658, bvar 662], bands [bvar 671, bvar 675], bands [bvar 684, bvar 688], bands [bvar 697, bvar 701]] 2,
    bnot (bands [bvar 537, bvar 541, bvar 550, bvar 554]),
    bnot (bands [bvar 537, bvar 542, bvar 550, bvar 555]),
    bnot (bands [bvar 538, bvar 540, bvar 551, bvar 553]),
    bnot (bands [bvar 538, bvar 541, bvar 551, bvar 554]),
    bnot (bands [bvar 539, bvar 540, bvar 552, bvar 553]),
    bnot (bands [bvar 540, bvar 542, bvar 553, bvar 555]),
    bnot (bands [bvar 540, bvar 543, bvar 553, bvar 556]),
    bnot (bands [bvar 540, bvar 544, bvar 553, bvar 557]),
    bnot (bands [bvar 540, bvar 546, bvar 553, bvar 559]),
    bnot (bands [bvar 540, bvar 547, bvar 553, bvar 560]),
    bnot (bands [bvar 541, bvar 542, bvar 554, bvar 555]),
    bnot (bands [bvar 541, bvar 543, bvar 554, bvar 556]),
    bnot (bands [bvar 542, bvar 543, bvar 555, bvar 556]),
    bnot (bands [bvar 542, bvar 544, bvar 555, bvar 557]),
    bnot (bands [bvar 542, bvar 546, bvar 555, bvar 559]),
    bnot (bands [bvar 538, bvar 540, bvar 564, bvar 566]),
    bnot (bands [bvar 538, bvar 541, bvar 564, bvar 567]),
    bnot (bands [bvar 538, bvar 542, bvar 564, bvar 568]),
    bnot (bands [bvar 538, bvar 543, bvar 564, bvar 569]),
    bnot (bands [bvar 538, bvar 544, bvar 564, bvar 570]),
    bnot (bands [bvar 538, bvar 545, bvar 564, bvar 571]),
    bnot (bands [bvar 538, bvar 546, bvar 564, bvar 572]),
    bnot (bands [bvar 538, bvar 547, bvar 564, bvar 573]),
    bnot (bands [bvar 540, bvar 541, bvar 566, bvar 567]),
    bnot (bands [bvar 540, bvar 543, bvar 566, bvar 569]),
    bnot (bands [bvar 541, bvar 542, bvar 567, bvar 568]),
    bnot (bands [bvar 541, bvar 544, bvar 567, bvar 570]),
    bnot (bands [bvar 541, bvar 545, bvar 567, bvar 571]),
    bnot (bands [bvar 541, bvar 547, bvar 567, bvar 573]),
    bnot (bands [bvar 542, bvar 547, bvar 568, bvar 573]),
    bnot (bands [bvar 543, bvar 545, bvar 569, bvar 571]) ]

def reducedUnionChunk034 : BVLogicalExpr :=
  bands reducedUnionChunk034Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
