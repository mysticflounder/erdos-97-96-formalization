/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk005 : List DirectRowArcFiniteOccurrence := [
  -- compact 9264; core 32283; terminal 2602362
  { outputClauseIndex := 9264, coreClauseIndex := 32283, terminalClauseIndex := 2602362, datum := { row := ⟨2, {3, 6, 9, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9266; core 32289; terminal 2602368
  { outputClauseIndex := 9266, coreClauseIndex := 32289, terminalClauseIndex := 2602368, datum := { row := ⟨2, {3, 7, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9267; core 32290; terminal 2602369
  { outputClauseIndex := 9267, coreClauseIndex := 32290, terminalClauseIndex := 2602369, datum := { row := ⟨2, {3, 7, 8, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9269; core 32296; terminal 2602375
  { outputClauseIndex := 9269, coreClauseIndex := 32296, terminalClauseIndex := 2602375, datum := { row := ⟨2, {3, 7, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9270; core 32297; terminal 2602376
  { outputClauseIndex := 9270, coreClauseIndex := 32297, terminalClauseIndex := 2602376, datum := { row := ⟨2, {3, 7, 8, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9272; core 32303; terminal 2602382
  { outputClauseIndex := 9272, coreClauseIndex := 32303, terminalClauseIndex := 2602382, datum := { row := ⟨2, {3, 7, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9273; core 32304; terminal 2602383
  { outputClauseIndex := 9273, coreClauseIndex := 32304, terminalClauseIndex := 2602383, datum := { row := ⟨2, {3, 7, 9, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9274; core 32309; terminal 2602389
  { outputClauseIndex := 9274, coreClauseIndex := 32309, terminalClauseIndex := 2602389, datum := { row := ⟨2, {3, 8, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9275; core 32310; terminal 2602390
  { outputClauseIndex := 9275, coreClauseIndex := 32310, terminalClauseIndex := 2602390, datum := { row := ⟨2, {3, 8, 9, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9277; core 32328; terminal 2602424
  { outputClauseIndex := 9277, coreClauseIndex := 32328, terminalClauseIndex := 2602424, datum := { row := ⟨2, {4, 5, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9278; core 32329; terminal 2602425
  { outputClauseIndex := 9278, coreClauseIndex := 32329, terminalClauseIndex := 2602425, datum := { row := ⟨2, {4, 5, 7, 8}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9280; core 32335; terminal 2602431
  { outputClauseIndex := 9280, coreClauseIndex := 32335, terminalClauseIndex := 2602431, datum := { row := ⟨2, {4, 5, 7, 9}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9281; core 32336; terminal 2602432
  { outputClauseIndex := 9281, coreClauseIndex := 32336, terminalClauseIndex := 2602432, datum := { row := ⟨2, {4, 5, 7, 9}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9283; core 32342; terminal 2602438
  { outputClauseIndex := 9283, coreClauseIndex := 32342, terminalClauseIndex := 2602438, datum := { row := ⟨2, {4, 5, 7, 10}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9284; core 32343; terminal 2602439
  { outputClauseIndex := 9284, coreClauseIndex := 32343, terminalClauseIndex := 2602439, datum := { row := ⟨2, {4, 5, 7, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9286; core 32349; terminal 2602445
  { outputClauseIndex := 9286, coreClauseIndex := 32349, terminalClauseIndex := 2602445, datum := { row := ⟨2, {4, 5, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9287; core 32350; terminal 2602446
  { outputClauseIndex := 9287, coreClauseIndex := 32350, terminalClauseIndex := 2602446, datum := { row := ⟨2, {4, 5, 8, 9}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9289; core 32356; terminal 2602452
  { outputClauseIndex := 9289, coreClauseIndex := 32356, terminalClauseIndex := 2602452, datum := { row := ⟨2, {4, 5, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9290; core 32357; terminal 2602453
  { outputClauseIndex := 9290, coreClauseIndex := 32357, terminalClauseIndex := 2602453, datum := { row := ⟨2, {4, 5, 8, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9292; core 32363; terminal 2602459
  { outputClauseIndex := 9292, coreClauseIndex := 32363, terminalClauseIndex := 2602459, datum := { row := ⟨2, {4, 5, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9293; core 32364; terminal 2602460
  { outputClauseIndex := 9293, coreClauseIndex := 32364, terminalClauseIndex := 2602460, datum := { row := ⟨2, {4, 5, 9, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9295; core 32370; terminal 2602466
  { outputClauseIndex := 9295, coreClauseIndex := 32370, terminalClauseIndex := 2602466, datum := { row := ⟨2, {4, 6, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9296; core 32371; terminal 2602467
  { outputClauseIndex := 9296, coreClauseIndex := 32371, terminalClauseIndex := 2602467, datum := { row := ⟨2, {4, 6, 7, 8}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9298; core 32377; terminal 2602473
  { outputClauseIndex := 9298, coreClauseIndex := 32377, terminalClauseIndex := 2602473, datum := { row := ⟨2, {4, 6, 7, 9}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9299; core 32378; terminal 2602474
  { outputClauseIndex := 9299, coreClauseIndex := 32378, terminalClauseIndex := 2602474, datum := { row := ⟨2, {4, 6, 7, 9}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9301; core 32384; terminal 2602480
  { outputClauseIndex := 9301, coreClauseIndex := 32384, terminalClauseIndex := 2602480, datum := { row := ⟨2, {4, 6, 7, 10}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9302; core 32385; terminal 2602481
  { outputClauseIndex := 9302, coreClauseIndex := 32385, terminalClauseIndex := 2602481, datum := { row := ⟨2, {4, 6, 7, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9304; core 32391; terminal 2602487
  { outputClauseIndex := 9304, coreClauseIndex := 32391, terminalClauseIndex := 2602487, datum := { row := ⟨2, {4, 6, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9305; core 32392; terminal 2602488
  { outputClauseIndex := 9305, coreClauseIndex := 32392, terminalClauseIndex := 2602488, datum := { row := ⟨2, {4, 6, 8, 9}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9307; core 32398; terminal 2602494
  { outputClauseIndex := 9307, coreClauseIndex := 32398, terminalClauseIndex := 2602494, datum := { row := ⟨2, {4, 6, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9308; core 32399; terminal 2602495
  { outputClauseIndex := 9308, coreClauseIndex := 32399, terminalClauseIndex := 2602495, datum := { row := ⟨2, {4, 6, 8, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9310; core 32405; terminal 2602501
  { outputClauseIndex := 9310, coreClauseIndex := 32405, terminalClauseIndex := 2602501, datum := { row := ⟨2, {4, 6, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9311; core 32406; terminal 2602502
  { outputClauseIndex := 9311, coreClauseIndex := 32406, terminalClauseIndex := 2602502, datum := { row := ⟨2, {4, 6, 9, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9313; core 32412; terminal 2602508
  { outputClauseIndex := 9313, coreClauseIndex := 32412, terminalClauseIndex := 2602508, datum := { row := ⟨2, {4, 7, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9314; core 32413; terminal 2602509
  { outputClauseIndex := 9314, coreClauseIndex := 32413, terminalClauseIndex := 2602509, datum := { row := ⟨2, {4, 7, 8, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9316; core 32419; terminal 2602515
  { outputClauseIndex := 9316, coreClauseIndex := 32419, terminalClauseIndex := 2602515, datum := { row := ⟨2, {4, 7, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9317; core 32420; terminal 2602516
  { outputClauseIndex := 9317, coreClauseIndex := 32420, terminalClauseIndex := 2602516, datum := { row := ⟨2, {4, 7, 8, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9319; core 32426; terminal 2602522
  { outputClauseIndex := 9319, coreClauseIndex := 32426, terminalClauseIndex := 2602522, datum := { row := ⟨2, {4, 7, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9320; core 32427; terminal 2602523
  { outputClauseIndex := 9320, coreClauseIndex := 32427, terminalClauseIndex := 2602523, datum := { row := ⟨2, {4, 7, 9, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9321; core 32432; terminal 2602529
  { outputClauseIndex := 9321, coreClauseIndex := 32432, terminalClauseIndex := 2602529, datum := { row := ⟨2, {4, 8, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9322; core 32433; terminal 2602530
  { outputClauseIndex := 9322, coreClauseIndex := 32433, terminalClauseIndex := 2602530, datum := { row := ⟨2, {4, 8, 9, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9323; core 32438; terminal 2602536
  { outputClauseIndex := 9323, coreClauseIndex := 32438, terminalClauseIndex := 2602536, datum := { row := ⟨2, {5, 6, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9324; core 32443; terminal 2602543
  { outputClauseIndex := 9324, coreClauseIndex := 32443, terminalClauseIndex := 2602543, datum := { row := ⟨2, {5, 6, 7, 9}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9325; core 32447; terminal 2602550
  { outputClauseIndex := 9325, coreClauseIndex := 32447, terminalClauseIndex := 2602550, datum := { row := ⟨2, {5, 6, 7, 10}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9326; core 32452; terminal 2602557
  { outputClauseIndex := 9326, coreClauseIndex := 32452, terminalClauseIndex := 2602557, datum := { row := ⟨2, {5, 6, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9327; core 32457; terminal 2602564
  { outputClauseIndex := 9327, coreClauseIndex := 32457, terminalClauseIndex := 2602564, datum := { row := ⟨2, {5, 6, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9328; core 32462; terminal 2602571
  { outputClauseIndex := 9328, coreClauseIndex := 32462, terminalClauseIndex := 2602571, datum := { row := ⟨2, {5, 6, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9329; core 32467; terminal 2602578
  { outputClauseIndex := 9329, coreClauseIndex := 32467, terminalClauseIndex := 2602578, datum := { row := ⟨2, {5, 7, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9330; core 32468; terminal 2602579
  { outputClauseIndex := 9330, coreClauseIndex := 32468, terminalClauseIndex := 2602579, datum := { row := ⟨2, {5, 7, 8, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9331; core 32473; terminal 2602585
  { outputClauseIndex := 9331, coreClauseIndex := 32473, terminalClauseIndex := 2602585, datum := { row := ⟨2, {5, 7, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9332; core 32474; terminal 2602586
  { outputClauseIndex := 9332, coreClauseIndex := 32474, terminalClauseIndex := 2602586, datum := { row := ⟨2, {5, 7, 8, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9333; core 32479; terminal 2602592
  { outputClauseIndex := 9333, coreClauseIndex := 32479, terminalClauseIndex := 2602592, datum := { row := ⟨2, {5, 7, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9334; core 32480; terminal 2602593
  { outputClauseIndex := 9334, coreClauseIndex := 32480, terminalClauseIndex := 2602593, datum := { row := ⟨2, {5, 7, 9, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9335; core 32485; terminal 2602599
  { outputClauseIndex := 9335, coreClauseIndex := 32485, terminalClauseIndex := 2602599, datum := { row := ⟨2, {5, 8, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9336; core 32486; terminal 2602600
  { outputClauseIndex := 9336, coreClauseIndex := 32486, terminalClauseIndex := 2602600, datum := { row := ⟨2, {5, 8, 9, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9337; core 32491; terminal 2602606
  { outputClauseIndex := 9337, coreClauseIndex := 32491, terminalClauseIndex := 2602606, datum := { row := ⟨2, {6, 7, 8, 9}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9338; core 32492; terminal 2602607
  { outputClauseIndex := 9338, coreClauseIndex := 32492, terminalClauseIndex := 2602607, datum := { row := ⟨2, {6, 7, 8, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9339; core 32497; terminal 2602613
  { outputClauseIndex := 9339, coreClauseIndex := 32497, terminalClauseIndex := 2602613, datum := { row := ⟨2, {6, 7, 8, 10}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9340; core 32498; terminal 2602614
  { outputClauseIndex := 9340, coreClauseIndex := 32498, terminalClauseIndex := 2602614, datum := { row := ⟨2, {6, 7, 8, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9341; core 32503; terminal 2602620
  { outputClauseIndex := 9341, coreClauseIndex := 32503, terminalClauseIndex := 2602620, datum := { row := ⟨2, {6, 7, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9342; core 32504; terminal 2602621
  { outputClauseIndex := 9342, coreClauseIndex := 32504, terminalClauseIndex := 2602621, datum := { row := ⟨2, {6, 7, 9, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9343; core 32509; terminal 2602627
  { outputClauseIndex := 9343, coreClauseIndex := 32509, terminalClauseIndex := 2602627, datum := { row := ⟨2, {6, 8, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9344; core 32510; terminal 2602628
  { outputClauseIndex := 9344, coreClauseIndex := 32510, terminalClauseIndex := 2602628, datum := { row := ⟨2, {6, 8, 9, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9345; core 32515; terminal 2602634
  { outputClauseIndex := 9345, coreClauseIndex := 32515, terminalClauseIndex := 2602634, datum := { row := ⟨2, {7, 8, 9, 10}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9346; core 32516; terminal 2602635
  { outputClauseIndex := 9346, coreClauseIndex := 32516, terminalClauseIndex := 2602635, datum := { row := ⟨2, {7, 8, 9, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9347; core 32520; terminal 2602642
  { outputClauseIndex := 9347, coreClauseIndex := 32520, terminalClauseIndex := 2602642, datum := { row := ⟨3, {0, 1, 2, 4}⟩, arc := ⟨3, .right, {0, 1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9348; core 32524; terminal 2602649
  { outputClauseIndex := 9348, coreClauseIndex := 32524, terminalClauseIndex := 2602649, datum := { row := ⟨3, {0, 1, 2, 5}⟩, arc := ⟨3, .right, {0, 1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9349; core 32528; terminal 2602656
  { outputClauseIndex := 9349, coreClauseIndex := 32528, terminalClauseIndex := 2602656, datum := { row := ⟨3, {0, 1, 2, 6}⟩, arc := ⟨3, .right, {0, 1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9350; core 32532; terminal 2602663
  { outputClauseIndex := 9350, coreClauseIndex := 32532, terminalClauseIndex := 2602663, datum := { row := ⟨3, {0, 1, 2, 7}⟩, arc := ⟨3, .right, {0, 1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9351; core 32536; terminal 2602670
  { outputClauseIndex := 9351, coreClauseIndex := 32536, terminalClauseIndex := 2602670, datum := { row := ⟨3, {0, 1, 2, 8}⟩, arc := ⟨3, .right, {0, 1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9352; core 32540; terminal 2602677
  { outputClauseIndex := 9352, coreClauseIndex := 32540, terminalClauseIndex := 2602677, datum := { row := ⟨3, {0, 1, 2, 9}⟩, arc := ⟨3, .right, {0, 1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9353; core 32544; terminal 2602684
  { outputClauseIndex := 9353, coreClauseIndex := 32544, terminalClauseIndex := 2602684, datum := { row := ⟨3, {0, 1, 2, 10}⟩, arc := ⟨3, .right, {0, 1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9354; core 32549; terminal 2602690
  { outputClauseIndex := 9354, coreClauseIndex := 32549, terminalClauseIndex := 2602690, datum := { row := ⟨3, {0, 1, 4, 5}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9355; core 32550; terminal 2602691
  { outputClauseIndex := 9355, coreClauseIndex := 32550, terminalClauseIndex := 2602691, datum := { row := ⟨3, {0, 1, 4, 5}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9356; core 32555; terminal 2602697
  { outputClauseIndex := 9356, coreClauseIndex := 32555, terminalClauseIndex := 2602697, datum := { row := ⟨3, {0, 1, 4, 6}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9357; core 32556; terminal 2602698
  { outputClauseIndex := 9357, coreClauseIndex := 32556, terminalClauseIndex := 2602698, datum := { row := ⟨3, {0, 1, 4, 6}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9358; core 32561; terminal 2602704
  { outputClauseIndex := 9358, coreClauseIndex := 32561, terminalClauseIndex := 2602704, datum := { row := ⟨3, {0, 1, 4, 7}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9359; core 32562; terminal 2602705
  { outputClauseIndex := 9359, coreClauseIndex := 32562, terminalClauseIndex := 2602705, datum := { row := ⟨3, {0, 1, 4, 7}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9360; core 32567; terminal 2602711
  { outputClauseIndex := 9360, coreClauseIndex := 32567, terminalClauseIndex := 2602711, datum := { row := ⟨3, {0, 1, 4, 8}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9361; core 32568; terminal 2602712
  { outputClauseIndex := 9361, coreClauseIndex := 32568, terminalClauseIndex := 2602712, datum := { row := ⟨3, {0, 1, 4, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9362; core 32573; terminal 2602718
  { outputClauseIndex := 9362, coreClauseIndex := 32573, terminalClauseIndex := 2602718, datum := { row := ⟨3, {0, 1, 4, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9363; core 32574; terminal 2602719
  { outputClauseIndex := 9363, coreClauseIndex := 32574, terminalClauseIndex := 2602719, datum := { row := ⟨3, {0, 1, 4, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9364; core 32579; terminal 2602725
  { outputClauseIndex := 9364, coreClauseIndex := 32579, terminalClauseIndex := 2602725, datum := { row := ⟨3, {0, 1, 4, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9365; core 32580; terminal 2602726
  { outputClauseIndex := 9365, coreClauseIndex := 32580, terminalClauseIndex := 2602726, datum := { row := ⟨3, {0, 1, 4, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9366; core 32585; terminal 2602732
  { outputClauseIndex := 9366, coreClauseIndex := 32585, terminalClauseIndex := 2602732, datum := { row := ⟨3, {0, 1, 5, 6}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9368; core 32591; terminal 2602739
  { outputClauseIndex := 9368, coreClauseIndex := 32591, terminalClauseIndex := 2602739, datum := { row := ⟨3, {0, 1, 5, 7}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9369; core 32592; terminal 2602740
  { outputClauseIndex := 9369, coreClauseIndex := 32592, terminalClauseIndex := 2602740, datum := { row := ⟨3, {0, 1, 5, 7}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9371; core 32598; terminal 2602746
  { outputClauseIndex := 9371, coreClauseIndex := 32598, terminalClauseIndex := 2602746, datum := { row := ⟨3, {0, 1, 5, 8}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9372; core 32599; terminal 2602747
  { outputClauseIndex := 9372, coreClauseIndex := 32599, terminalClauseIndex := 2602747, datum := { row := ⟨3, {0, 1, 5, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9374; core 32605; terminal 2602753
  { outputClauseIndex := 9374, coreClauseIndex := 32605, terminalClauseIndex := 2602753, datum := { row := ⟨3, {0, 1, 5, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9375; core 32606; terminal 2602754
  { outputClauseIndex := 9375, coreClauseIndex := 32606, terminalClauseIndex := 2602754, datum := { row := ⟨3, {0, 1, 5, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9377; core 32612; terminal 2602760
  { outputClauseIndex := 9377, coreClauseIndex := 32612, terminalClauseIndex := 2602760, datum := { row := ⟨3, {0, 1, 5, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9378; core 32613; terminal 2602761
  { outputClauseIndex := 9378, coreClauseIndex := 32613, terminalClauseIndex := 2602761, datum := { row := ⟨3, {0, 1, 5, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9380; core 32619; terminal 2602767
  { outputClauseIndex := 9380, coreClauseIndex := 32619, terminalClauseIndex := 2602767, datum := { row := ⟨3, {0, 1, 6, 7}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9381; core 32620; terminal 2602768
  { outputClauseIndex := 9381, coreClauseIndex := 32620, terminalClauseIndex := 2602768, datum := { row := ⟨3, {0, 1, 6, 7}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9383; core 32626; terminal 2602774
  { outputClauseIndex := 9383, coreClauseIndex := 32626, terminalClauseIndex := 2602774, datum := { row := ⟨3, {0, 1, 6, 8}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9384; core 32627; terminal 2602775
  { outputClauseIndex := 9384, coreClauseIndex := 32627, terminalClauseIndex := 2602775, datum := { row := ⟨3, {0, 1, 6, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9386; core 32633; terminal 2602781
  { outputClauseIndex := 9386, coreClauseIndex := 32633, terminalClauseIndex := 2602781, datum := { row := ⟨3, {0, 1, 6, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9387; core 32634; terminal 2602782
  { outputClauseIndex := 9387, coreClauseIndex := 32634, terminalClauseIndex := 2602782, datum := { row := ⟨3, {0, 1, 6, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9389; core 32640; terminal 2602788
  { outputClauseIndex := 9389, coreClauseIndex := 32640, terminalClauseIndex := 2602788, datum := { row := ⟨3, {0, 1, 6, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9390; core 32641; terminal 2602789
  { outputClauseIndex := 9390, coreClauseIndex := 32641, terminalClauseIndex := 2602789, datum := { row := ⟨3, {0, 1, 6, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9392; core 32647; terminal 2602795
  { outputClauseIndex := 9392, coreClauseIndex := 32647, terminalClauseIndex := 2602795, datum := { row := ⟨3, {0, 1, 7, 8}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9393; core 32648; terminal 2602796
  { outputClauseIndex := 9393, coreClauseIndex := 32648, terminalClauseIndex := 2602796, datum := { row := ⟨3, {0, 1, 7, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9395; core 32654; terminal 2602802
  { outputClauseIndex := 9395, coreClauseIndex := 32654, terminalClauseIndex := 2602802, datum := { row := ⟨3, {0, 1, 7, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9396; core 32655; terminal 2602803
  { outputClauseIndex := 9396, coreClauseIndex := 32655, terminalClauseIndex := 2602803, datum := { row := ⟨3, {0, 1, 7, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9398; core 32661; terminal 2602809
  { outputClauseIndex := 9398, coreClauseIndex := 32661, terminalClauseIndex := 2602809, datum := { row := ⟨3, {0, 1, 7, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9399; core 32662; terminal 2602810
  { outputClauseIndex := 9399, coreClauseIndex := 32662, terminalClauseIndex := 2602810, datum := { row := ⟨3, {0, 1, 7, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9401; core 32668; terminal 2602816
  { outputClauseIndex := 9401, coreClauseIndex := 32668, terminalClauseIndex := 2602816, datum := { row := ⟨3, {0, 1, 8, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9402; core 32669; terminal 2602817
  { outputClauseIndex := 9402, coreClauseIndex := 32669, terminalClauseIndex := 2602817, datum := { row := ⟨3, {0, 1, 8, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9404; core 32675; terminal 2602823
  { outputClauseIndex := 9404, coreClauseIndex := 32675, terminalClauseIndex := 2602823, datum := { row := ⟨3, {0, 1, 8, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9405; core 32676; terminal 2602824
  { outputClauseIndex := 9405, coreClauseIndex := 32676, terminalClauseIndex := 2602824, datum := { row := ⟨3, {0, 1, 8, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9407; core 32682; terminal 2602830
  { outputClauseIndex := 9407, coreClauseIndex := 32682, terminalClauseIndex := 2602830, datum := { row := ⟨3, {0, 1, 9, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9408; core 32683; terminal 2602831
  { outputClauseIndex := 9408, coreClauseIndex := 32683, terminalClauseIndex := 2602831, datum := { row := ⟨3, {0, 1, 9, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9409; core 32688; terminal 2602837
  { outputClauseIndex := 9409, coreClauseIndex := 32688, terminalClauseIndex := 2602837, datum := { row := ⟨3, {0, 2, 4, 5}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9410; core 32689; terminal 2602838
  { outputClauseIndex := 9410, coreClauseIndex := 32689, terminalClauseIndex := 2602838, datum := { row := ⟨3, {0, 2, 4, 5}⟩, arc := ⟨3, .right, {6}⟩ } },
  -- compact 9411; core 32694; terminal 2602844
  { outputClauseIndex := 9411, coreClauseIndex := 32694, terminalClauseIndex := 2602844, datum := { row := ⟨3, {0, 2, 4, 6}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9412; core 32695; terminal 2602845
  { outputClauseIndex := 9412, coreClauseIndex := 32695, terminalClauseIndex := 2602845, datum := { row := ⟨3, {0, 2, 4, 6}⟩, arc := ⟨3, .right, {5, 6}⟩ } },
  -- compact 9413; core 32700; terminal 2602851
  { outputClauseIndex := 9413, coreClauseIndex := 32700, terminalClauseIndex := 2602851, datum := { row := ⟨3, {0, 2, 4, 7}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9414; core 32701; terminal 2602852
  { outputClauseIndex := 9414, coreClauseIndex := 32701, terminalClauseIndex := 2602852, datum := { row := ⟨3, {0, 2, 4, 7}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
  -- compact 9415; core 32706; terminal 2602858
  { outputClauseIndex := 9415, coreClauseIndex := 32706, terminalClauseIndex := 2602858, datum := { row := ⟨3, {0, 2, 4, 8}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9416; core 32707; terminal 2602859
  { outputClauseIndex := 9416, coreClauseIndex := 32707, terminalClauseIndex := 2602859, datum := { row := ⟨3, {0, 2, 4, 8}⟩, arc := ⟨3, .right, {3, 4, 5, 6}⟩ } },
  -- compact 9417; core 32712; terminal 2602865
  { outputClauseIndex := 9417, coreClauseIndex := 32712, terminalClauseIndex := 2602865, datum := { row := ⟨3, {0, 2, 4, 9}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9418; core 32713; terminal 2602866
  { outputClauseIndex := 9418, coreClauseIndex := 32713, terminalClauseIndex := 2602866, datum := { row := ⟨3, {0, 2, 4, 9}⟩, arc := ⟨3, .right, {2, 3, 4, 5, 6}⟩ } },
  -- compact 9419; core 32718; terminal 2602872
  { outputClauseIndex := 9419, coreClauseIndex := 32718, terminalClauseIndex := 2602872, datum := { row := ⟨3, {0, 2, 4, 10}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9420; core 32719; terminal 2602873
  { outputClauseIndex := 9420, coreClauseIndex := 32719, terminalClauseIndex := 2602873, datum := { row := ⟨3, {0, 2, 4, 10}⟩, arc := ⟨3, .right, {1, 2, 3, 4, 5, 6}⟩ } },
  -- compact 9421; core 32724; terminal 2602879
  { outputClauseIndex := 9421, coreClauseIndex := 32724, terminalClauseIndex := 2602879, datum := { row := ⟨3, {0, 2, 5, 6}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9423; core 32730; terminal 2602886
  { outputClauseIndex := 9423, coreClauseIndex := 32730, terminalClauseIndex := 2602886, datum := { row := ⟨3, {0, 2, 5, 7}⟩, arc := ⟨3, .left, {8, 9}⟩ } },
  -- compact 9424; core 32731; terminal 2602887
  { outputClauseIndex := 9424, coreClauseIndex := 32731, terminalClauseIndex := 2602887, datum := { row := ⟨3, {0, 2, 5, 7}⟩, arc := ⟨3, .right, {4, 5, 6}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk005_batch_valid :
    directRowArcFiniteOccurrencesChunk005.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk005, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk005 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk005.map (·.datum)

theorem directRowArcFiniteDataChunk005_batch_valid :
    directRowArcFiniteDataChunk005.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk005, datum.Valid := by
  rw [directRowArcFiniteDataChunk005]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk005_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk005_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
