/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk013 : List DirectRowArcFiniteOccurrence := [
  -- compact 10745; core 36537; terminal 2607457
  { outputClauseIndex := 10745, coreClauseIndex := 36537, terminalClauseIndex := 2607457, datum := { row := ⟨6, {0, 3, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10746; core 36538; terminal 2607458
  { outputClauseIndex := 10746, coreClauseIndex := 36538, terminalClauseIndex := 2607458, datum := { row := ⟨6, {0, 3, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10748; core 36544; terminal 2607464
  { outputClauseIndex := 10748, coreClauseIndex := 36544, terminalClauseIndex := 2607464, datum := { row := ⟨6, {0, 3, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10749; core 36545; terminal 2607465
  { outputClauseIndex := 10749, coreClauseIndex := 36545, terminalClauseIndex := 2607465, datum := { row := ⟨6, {0, 3, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10751; core 36551; terminal 2607471
  { outputClauseIndex := 10751, coreClauseIndex := 36551, terminalClauseIndex := 2607471, datum := { row := ⟨6, {0, 3, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10752; core 36552; terminal 2607472
  { outputClauseIndex := 10752, coreClauseIndex := 36552, terminalClauseIndex := 2607472, datum := { row := ⟨6, {0, 3, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10754; core 36558; terminal 2607478
  { outputClauseIndex := 10754, coreClauseIndex := 36558, terminalClauseIndex := 2607478, datum := { row := ⟨6, {0, 3, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10755; core 36559; terminal 2607479
  { outputClauseIndex := 10755, coreClauseIndex := 36559, terminalClauseIndex := 2607479, datum := { row := ⟨6, {0, 3, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10757; core 36565; terminal 2607485
  { outputClauseIndex := 10757, coreClauseIndex := 36565, terminalClauseIndex := 2607485, datum := { row := ⟨6, {0, 3, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10758; core 36566; terminal 2607486
  { outputClauseIndex := 10758, coreClauseIndex := 36566, terminalClauseIndex := 2607486, datum := { row := ⟨6, {0, 3, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10760; core 36572; terminal 2607492
  { outputClauseIndex := 10760, coreClauseIndex := 36572, terminalClauseIndex := 2607492, datum := { row := ⟨6, {0, 3, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10761; core 36573; terminal 2607493
  { outputClauseIndex := 10761, coreClauseIndex := 36573, terminalClauseIndex := 2607493, datum := { row := ⟨6, {0, 3, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10762; core 36578; terminal 2607499
  { outputClauseIndex := 10762, coreClauseIndex := 36578, terminalClauseIndex := 2607499, datum := { row := ⟨6, {0, 4, 5, 7}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10763; core 36579; terminal 2607500
  { outputClauseIndex := 10763, coreClauseIndex := 36579, terminalClauseIndex := 2607500, datum := { row := ⟨6, {0, 4, 5, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10765; core 36585; terminal 2607506
  { outputClauseIndex := 10765, coreClauseIndex := 36585, terminalClauseIndex := 2607506, datum := { row := ⟨6, {0, 4, 5, 8}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10766; core 36586; terminal 2607507
  { outputClauseIndex := 10766, coreClauseIndex := 36586, terminalClauseIndex := 2607507, datum := { row := ⟨6, {0, 4, 5, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10768; core 36592; terminal 2607513
  { outputClauseIndex := 10768, coreClauseIndex := 36592, terminalClauseIndex := 2607513, datum := { row := ⟨6, {0, 4, 5, 9}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10769; core 36593; terminal 2607514
  { outputClauseIndex := 10769, coreClauseIndex := 36593, terminalClauseIndex := 2607514, datum := { row := ⟨6, {0, 4, 5, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10771; core 36599; terminal 2607520
  { outputClauseIndex := 10771, coreClauseIndex := 36599, terminalClauseIndex := 2607520, datum := { row := ⟨6, {0, 4, 5, 10}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10772; core 36600; terminal 2607521
  { outputClauseIndex := 10772, coreClauseIndex := 36600, terminalClauseIndex := 2607521, datum := { row := ⟨6, {0, 4, 5, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3}⟩ } },
  -- compact 10774; core 36606; terminal 2607527
  { outputClauseIndex := 10774, coreClauseIndex := 36606, terminalClauseIndex := 2607527, datum := { row := ⟨6, {0, 4, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10775; core 36607; terminal 2607528
  { outputClauseIndex := 10775, coreClauseIndex := 36607, terminalClauseIndex := 2607528, datum := { row := ⟨6, {0, 4, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10777; core 36613; terminal 2607534
  { outputClauseIndex := 10777, coreClauseIndex := 36613, terminalClauseIndex := 2607534, datum := { row := ⟨6, {0, 4, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10778; core 36614; terminal 2607535
  { outputClauseIndex := 10778, coreClauseIndex := 36614, terminalClauseIndex := 2607535, datum := { row := ⟨6, {0, 4, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10780; core 36620; terminal 2607541
  { outputClauseIndex := 10780, coreClauseIndex := 36620, terminalClauseIndex := 2607541, datum := { row := ⟨6, {0, 4, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10781; core 36621; terminal 2607542
  { outputClauseIndex := 10781, coreClauseIndex := 36621, terminalClauseIndex := 2607542, datum := { row := ⟨6, {0, 4, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10783; core 36627; terminal 2607548
  { outputClauseIndex := 10783, coreClauseIndex := 36627, terminalClauseIndex := 2607548, datum := { row := ⟨6, {0, 4, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10784; core 36628; terminal 2607549
  { outputClauseIndex := 10784, coreClauseIndex := 36628, terminalClauseIndex := 2607549, datum := { row := ⟨6, {0, 4, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10786; core 36634; terminal 2607555
  { outputClauseIndex := 10786, coreClauseIndex := 36634, terminalClauseIndex := 2607555, datum := { row := ⟨6, {0, 4, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10787; core 36635; terminal 2607556
  { outputClauseIndex := 10787, coreClauseIndex := 36635, terminalClauseIndex := 2607556, datum := { row := ⟨6, {0, 4, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10789; core 36641; terminal 2607562
  { outputClauseIndex := 10789, coreClauseIndex := 36641, terminalClauseIndex := 2607562, datum := { row := ⟨6, {0, 4, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10790; core 36642; terminal 2607563
  { outputClauseIndex := 10790, coreClauseIndex := 36642, terminalClauseIndex := 2607563, datum := { row := ⟨6, {0, 4, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10792; core 36648; terminal 2607569
  { outputClauseIndex := 10792, coreClauseIndex := 36648, terminalClauseIndex := 2607569, datum := { row := ⟨6, {0, 5, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10793; core 36649; terminal 2607570
  { outputClauseIndex := 10793, coreClauseIndex := 36649, terminalClauseIndex := 2607570, datum := { row := ⟨6, {0, 5, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10795; core 36655; terminal 2607576
  { outputClauseIndex := 10795, coreClauseIndex := 36655, terminalClauseIndex := 2607576, datum := { row := ⟨6, {0, 5, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10796; core 36656; terminal 2607577
  { outputClauseIndex := 10796, coreClauseIndex := 36656, terminalClauseIndex := 2607577, datum := { row := ⟨6, {0, 5, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10798; core 36662; terminal 2607583
  { outputClauseIndex := 10798, coreClauseIndex := 36662, terminalClauseIndex := 2607583, datum := { row := ⟨6, {0, 5, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10799; core 36663; terminal 2607584
  { outputClauseIndex := 10799, coreClauseIndex := 36663, terminalClauseIndex := 2607584, datum := { row := ⟨6, {0, 5, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10801; core 36669; terminal 2607590
  { outputClauseIndex := 10801, coreClauseIndex := 36669, terminalClauseIndex := 2607590, datum := { row := ⟨6, {0, 5, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10802; core 36670; terminal 2607591
  { outputClauseIndex := 10802, coreClauseIndex := 36670, terminalClauseIndex := 2607591, datum := { row := ⟨6, {0, 5, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10804; core 36676; terminal 2607597
  { outputClauseIndex := 10804, coreClauseIndex := 36676, terminalClauseIndex := 2607597, datum := { row := ⟨6, {0, 5, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10805; core 36677; terminal 2607598
  { outputClauseIndex := 10805, coreClauseIndex := 36677, terminalClauseIndex := 2607598, datum := { row := ⟨6, {0, 5, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10807; core 36683; terminal 2607604
  { outputClauseIndex := 10807, coreClauseIndex := 36683, terminalClauseIndex := 2607604, datum := { row := ⟨6, {0, 5, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9}⟩ } },
  -- compact 10808; core 36684; terminal 2607605
  { outputClauseIndex := 10808, coreClauseIndex := 36684, terminalClauseIndex := 2607605, datum := { row := ⟨6, {0, 5, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10810; core 36690; terminal 2607611
  { outputClauseIndex := 10810, coreClauseIndex := 36690, terminalClauseIndex := 2607611, datum := { row := ⟨6, {0, 7, 8, 9}⟩, arc := ⟨6, .left, {0, 5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10811; core 36691; terminal 2607612
  { outputClauseIndex := 10811, coreClauseIndex := 36691, terminalClauseIndex := 2607612, datum := { row := ⟨6, {0, 7, 8, 9}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10813; core 36697; terminal 2607618
  { outputClauseIndex := 10813, coreClauseIndex := 36697, terminalClauseIndex := 2607618, datum := { row := ⟨6, {0, 7, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10814; core 36698; terminal 2607619
  { outputClauseIndex := 10814, coreClauseIndex := 36698, terminalClauseIndex := 2607619, datum := { row := ⟨6, {0, 7, 8, 10}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10816; core 36704; terminal 2607625
  { outputClauseIndex := 10816, coreClauseIndex := 36704, terminalClauseIndex := 2607625, datum := { row := ⟨6, {0, 7, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10817; core 36705; terminal 2607626
  { outputClauseIndex := 10817, coreClauseIndex := 36705, terminalClauseIndex := 2607626, datum := { row := ⟨6, {0, 7, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10819; core 36711; terminal 2607632
  { outputClauseIndex := 10819, coreClauseIndex := 36711, terminalClauseIndex := 2607632, datum := { row := ⟨6, {0, 8, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10820; core 36712; terminal 2607633
  { outputClauseIndex := 10820, coreClauseIndex := 36712, terminalClauseIndex := 2607633, datum := { row := ⟨6, {0, 8, 9, 10}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10821; core 36717; terminal 2607639
  { outputClauseIndex := 10821, coreClauseIndex := 36717, terminalClauseIndex := 2607639, datum := { row := ⟨6, {1, 2, 3, 4}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10822; core 36718; terminal 2607640
  { outputClauseIndex := 10822, coreClauseIndex := 36718, terminalClauseIndex := 2607640, datum := { row := ⟨6, {1, 2, 3, 4}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10823; core 36723; terminal 2607646
  { outputClauseIndex := 10823, coreClauseIndex := 36723, terminalClauseIndex := 2607646, datum := { row := ⟨6, {1, 2, 3, 5}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10824; core 36724; terminal 2607647
  { outputClauseIndex := 10824, coreClauseIndex := 36724, terminalClauseIndex := 2607647, datum := { row := ⟨6, {1, 2, 3, 5}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10825; core 36729; terminal 2607653
  { outputClauseIndex := 10825, coreClauseIndex := 36729, terminalClauseIndex := 2607653, datum := { row := ⟨6, {1, 2, 3, 7}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10826; core 36730; terminal 2607654
  { outputClauseIndex := 10826, coreClauseIndex := 36730, terminalClauseIndex := 2607654, datum := { row := ⟨6, {1, 2, 3, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10827; core 36734; terminal 2607660
  { outputClauseIndex := 10827, coreClauseIndex := 36734, terminalClauseIndex := 2607660, datum := { row := ⟨6, {1, 2, 3, 8}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10828; core 36735; terminal 2607661
  { outputClauseIndex := 10828, coreClauseIndex := 36735, terminalClauseIndex := 2607661, datum := { row := ⟨6, {1, 2, 3, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10829; core 36740; terminal 2607667
  { outputClauseIndex := 10829, coreClauseIndex := 36740, terminalClauseIndex := 2607667, datum := { row := ⟨6, {1, 2, 3, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10830; core 36741; terminal 2607668
  { outputClauseIndex := 10830, coreClauseIndex := 36741, terminalClauseIndex := 2607668, datum := { row := ⟨6, {1, 2, 3, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10831; core 36746; terminal 2607674
  { outputClauseIndex := 10831, coreClauseIndex := 36746, terminalClauseIndex := 2607674, datum := { row := ⟨6, {1, 2, 3, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10832; core 36747; terminal 2607675
  { outputClauseIndex := 10832, coreClauseIndex := 36747, terminalClauseIndex := 2607675, datum := { row := ⟨6, {1, 2, 3, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10833; core 36752; terminal 2607682
  { outputClauseIndex := 10833, coreClauseIndex := 36752, terminalClauseIndex := 2607682, datum := { row := ⟨6, {1, 2, 4, 5}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 10835; core 36758; terminal 2607688
  { outputClauseIndex := 10835, coreClauseIndex := 36758, terminalClauseIndex := 2607688, datum := { row := ⟨6, {1, 2, 4, 7}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10836; core 36759; terminal 2607689
  { outputClauseIndex := 10836, coreClauseIndex := 36759, terminalClauseIndex := 2607689, datum := { row := ⟨6, {1, 2, 4, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10838; core 36765; terminal 2607695
  { outputClauseIndex := 10838, coreClauseIndex := 36765, terminalClauseIndex := 2607695, datum := { row := ⟨6, {1, 2, 4, 8}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10839; core 36766; terminal 2607696
  { outputClauseIndex := 10839, coreClauseIndex := 36766, terminalClauseIndex := 2607696, datum := { row := ⟨6, {1, 2, 4, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10841; core 36772; terminal 2607702
  { outputClauseIndex := 10841, coreClauseIndex := 36772, terminalClauseIndex := 2607702, datum := { row := ⟨6, {1, 2, 4, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10842; core 36773; terminal 2607703
  { outputClauseIndex := 10842, coreClauseIndex := 36773, terminalClauseIndex := 2607703, datum := { row := ⟨6, {1, 2, 4, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10844; core 36779; terminal 2607709
  { outputClauseIndex := 10844, coreClauseIndex := 36779, terminalClauseIndex := 2607709, datum := { row := ⟨6, {1, 2, 4, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10845; core 36780; terminal 2607710
  { outputClauseIndex := 10845, coreClauseIndex := 36780, terminalClauseIndex := 2607710, datum := { row := ⟨6, {1, 2, 4, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10847; core 36786; terminal 2607716
  { outputClauseIndex := 10847, coreClauseIndex := 36786, terminalClauseIndex := 2607716, datum := { row := ⟨6, {1, 2, 5, 7}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10848; core 36787; terminal 2607717
  { outputClauseIndex := 10848, coreClauseIndex := 36787, terminalClauseIndex := 2607717, datum := { row := ⟨6, {1, 2, 5, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10850; core 36793; terminal 2607723
  { outputClauseIndex := 10850, coreClauseIndex := 36793, terminalClauseIndex := 2607723, datum := { row := ⟨6, {1, 2, 5, 8}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10851; core 36794; terminal 2607724
  { outputClauseIndex := 10851, coreClauseIndex := 36794, terminalClauseIndex := 2607724, datum := { row := ⟨6, {1, 2, 5, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10853; core 36800; terminal 2607730
  { outputClauseIndex := 10853, coreClauseIndex := 36800, terminalClauseIndex := 2607730, datum := { row := ⟨6, {1, 2, 5, 9}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10854; core 36801; terminal 2607731
  { outputClauseIndex := 10854, coreClauseIndex := 36801, terminalClauseIndex := 2607731, datum := { row := ⟨6, {1, 2, 5, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10856; core 36807; terminal 2607737
  { outputClauseIndex := 10856, coreClauseIndex := 36807, terminalClauseIndex := 2607737, datum := { row := ⟨6, {1, 2, 5, 10}⟩, arc := ⟨6, .left, {5, 6, 7}⟩ } },
  -- compact 10857; core 36808; terminal 2607738
  { outputClauseIndex := 10857, coreClauseIndex := 36808, terminalClauseIndex := 2607738, datum := { row := ⟨6, {1, 2, 5, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10859; core 36814; terminal 2607744
  { outputClauseIndex := 10859, coreClauseIndex := 36814, terminalClauseIndex := 2607744, datum := { row := ⟨6, {1, 2, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10860; core 36815; terminal 2607745
  { outputClauseIndex := 10860, coreClauseIndex := 36815, terminalClauseIndex := 2607745, datum := { row := ⟨6, {1, 2, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10862; core 36821; terminal 2607751
  { outputClauseIndex := 10862, coreClauseIndex := 36821, terminalClauseIndex := 2607751, datum := { row := ⟨6, {1, 2, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10863; core 36822; terminal 2607752
  { outputClauseIndex := 10863, coreClauseIndex := 36822, terminalClauseIndex := 2607752, datum := { row := ⟨6, {1, 2, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10865; core 36828; terminal 2607758
  { outputClauseIndex := 10865, coreClauseIndex := 36828, terminalClauseIndex := 2607758, datum := { row := ⟨6, {1, 2, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10866; core 36829; terminal 2607759
  { outputClauseIndex := 10866, coreClauseIndex := 36829, terminalClauseIndex := 2607759, datum := { row := ⟨6, {1, 2, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10868; core 36835; terminal 2607765
  { outputClauseIndex := 10868, coreClauseIndex := 36835, terminalClauseIndex := 2607765, datum := { row := ⟨6, {1, 2, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10869; core 36836; terminal 2607766
  { outputClauseIndex := 10869, coreClauseIndex := 36836, terminalClauseIndex := 2607766, datum := { row := ⟨6, {1, 2, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10871; core 36842; terminal 2607772
  { outputClauseIndex := 10871, coreClauseIndex := 36842, terminalClauseIndex := 2607772, datum := { row := ⟨6, {1, 2, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10872; core 36843; terminal 2607773
  { outputClauseIndex := 10872, coreClauseIndex := 36843, terminalClauseIndex := 2607773, datum := { row := ⟨6, {1, 2, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10874; core 36849; terminal 2607779
  { outputClauseIndex := 10874, coreClauseIndex := 36849, terminalClauseIndex := 2607779, datum := { row := ⟨6, {1, 2, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10875; core 36850; terminal 2607780
  { outputClauseIndex := 10875, coreClauseIndex := 36850, terminalClauseIndex := 2607780, datum := { row := ⟨6, {1, 2, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10877; core 36856; terminal 2607786
  { outputClauseIndex := 10877, coreClauseIndex := 36856, terminalClauseIndex := 2607786, datum := { row := ⟨6, {1, 3, 4, 5}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10879; core 36862; terminal 2607793
  { outputClauseIndex := 10879, coreClauseIndex := 36862, terminalClauseIndex := 2607793, datum := { row := ⟨6, {1, 3, 4, 7}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10880; core 36863; terminal 2607794
  { outputClauseIndex := 10880, coreClauseIndex := 36863, terminalClauseIndex := 2607794, datum := { row := ⟨6, {1, 3, 4, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10882; core 36869; terminal 2607800
  { outputClauseIndex := 10882, coreClauseIndex := 36869, terminalClauseIndex := 2607800, datum := { row := ⟨6, {1, 3, 4, 8}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10883; core 36870; terminal 2607801
  { outputClauseIndex := 10883, coreClauseIndex := 36870, terminalClauseIndex := 2607801, datum := { row := ⟨6, {1, 3, 4, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10885; core 36876; terminal 2607807
  { outputClauseIndex := 10885, coreClauseIndex := 36876, terminalClauseIndex := 2607807, datum := { row := ⟨6, {1, 3, 4, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10886; core 36877; terminal 2607808
  { outputClauseIndex := 10886, coreClauseIndex := 36877, terminalClauseIndex := 2607808, datum := { row := ⟨6, {1, 3, 4, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10888; core 36883; terminal 2607814
  { outputClauseIndex := 10888, coreClauseIndex := 36883, terminalClauseIndex := 2607814, datum := { row := ⟨6, {1, 3, 4, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10889; core 36884; terminal 2607815
  { outputClauseIndex := 10889, coreClauseIndex := 36884, terminalClauseIndex := 2607815, datum := { row := ⟨6, {1, 3, 4, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10891; core 36890; terminal 2607821
  { outputClauseIndex := 10891, coreClauseIndex := 36890, terminalClauseIndex := 2607821, datum := { row := ⟨6, {1, 3, 5, 7}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10892; core 36891; terminal 2607822
  { outputClauseIndex := 10892, coreClauseIndex := 36891, terminalClauseIndex := 2607822, datum := { row := ⟨6, {1, 3, 5, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10894; core 36897; terminal 2607828
  { outputClauseIndex := 10894, coreClauseIndex := 36897, terminalClauseIndex := 2607828, datum := { row := ⟨6, {1, 3, 5, 8}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10895; core 36898; terminal 2607829
  { outputClauseIndex := 10895, coreClauseIndex := 36898, terminalClauseIndex := 2607829, datum := { row := ⟨6, {1, 3, 5, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10897; core 36904; terminal 2607835
  { outputClauseIndex := 10897, coreClauseIndex := 36904, terminalClauseIndex := 2607835, datum := { row := ⟨6, {1, 3, 5, 9}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10898; core 36905; terminal 2607836
  { outputClauseIndex := 10898, coreClauseIndex := 36905, terminalClauseIndex := 2607836, datum := { row := ⟨6, {1, 3, 5, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10900; core 36911; terminal 2607842
  { outputClauseIndex := 10900, coreClauseIndex := 36911, terminalClauseIndex := 2607842, datum := { row := ⟨6, {1, 3, 5, 10}⟩, arc := ⟨6, .left, {5, 6}⟩ } },
  -- compact 10901; core 36912; terminal 2607843
  { outputClauseIndex := 10901, coreClauseIndex := 36912, terminalClauseIndex := 2607843, datum := { row := ⟨6, {1, 3, 5, 10}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10903; core 36918; terminal 2607849
  { outputClauseIndex := 10903, coreClauseIndex := 36918, terminalClauseIndex := 2607849, datum := { row := ⟨6, {1, 3, 7, 8}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10904; core 36919; terminal 2607850
  { outputClauseIndex := 10904, coreClauseIndex := 36919, terminalClauseIndex := 2607850, datum := { row := ⟨6, {1, 3, 7, 8}⟩, arc := ⟨6, .right, {3}⟩ } },
  -- compact 10906; core 36925; terminal 2607856
  { outputClauseIndex := 10906, coreClauseIndex := 36925, terminalClauseIndex := 2607856, datum := { row := ⟨6, {1, 3, 7, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10907; core 36926; terminal 2607857
  { outputClauseIndex := 10907, coreClauseIndex := 36926, terminalClauseIndex := 2607857, datum := { row := ⟨6, {1, 3, 7, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10909; core 36932; terminal 2607863
  { outputClauseIndex := 10909, coreClauseIndex := 36932, terminalClauseIndex := 2607863, datum := { row := ⟨6, {1, 3, 7, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10910; core 36933; terminal 2607864
  { outputClauseIndex := 10910, coreClauseIndex := 36933, terminalClauseIndex := 2607864, datum := { row := ⟨6, {1, 3, 7, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10912; core 36939; terminal 2607870
  { outputClauseIndex := 10912, coreClauseIndex := 36939, terminalClauseIndex := 2607870, datum := { row := ⟨6, {1, 3, 8, 9}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10913; core 36940; terminal 2607871
  { outputClauseIndex := 10913, coreClauseIndex := 36940, terminalClauseIndex := 2607871, datum := { row := ⟨6, {1, 3, 8, 9}⟩, arc := ⟨6, .right, {2, 3}⟩ } },
  -- compact 10915; core 36946; terminal 2607877
  { outputClauseIndex := 10915, coreClauseIndex := 36946, terminalClauseIndex := 2607877, datum := { row := ⟨6, {1, 3, 8, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10916; core 36947; terminal 2607878
  { outputClauseIndex := 10916, coreClauseIndex := 36947, terminalClauseIndex := 2607878, datum := { row := ⟨6, {1, 3, 8, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10918; core 36953; terminal 2607884
  { outputClauseIndex := 10918, coreClauseIndex := 36953, terminalClauseIndex := 2607884, datum := { row := ⟨6, {1, 3, 9, 10}⟩, arc := ⟨6, .left, {5, 6, 7, 8}⟩ } },
  -- compact 10919; core 36954; terminal 2607885
  { outputClauseIndex := 10919, coreClauseIndex := 36954, terminalClauseIndex := 2607885, datum := { row := ⟨6, {1, 3, 9, 10}⟩, arc := ⟨6, .right, {1, 2, 3}⟩ } },
  -- compact 10920; core 36959; terminal 2607891
  { outputClauseIndex := 10920, coreClauseIndex := 36959, terminalClauseIndex := 2607891, datum := { row := ⟨6, {1, 4, 5, 7}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10921; core 36960; terminal 2607892
  { outputClauseIndex := 10921, coreClauseIndex := 36960, terminalClauseIndex := 2607892, datum := { row := ⟨6, {1, 4, 5, 7}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10923; core 36966; terminal 2607898
  { outputClauseIndex := 10923, coreClauseIndex := 36966, terminalClauseIndex := 2607898, datum := { row := ⟨6, {1, 4, 5, 8}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10924; core 36967; terminal 2607899
  { outputClauseIndex := 10924, coreClauseIndex := 36967, terminalClauseIndex := 2607899, datum := { row := ⟨6, {1, 4, 5, 8}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
  -- compact 10926; core 36973; terminal 2607905
  { outputClauseIndex := 10926, coreClauseIndex := 36973, terminalClauseIndex := 2607905, datum := { row := ⟨6, {1, 4, 5, 9}⟩, arc := ⟨6, .left, {5}⟩ } },
  -- compact 10927; core 36974; terminal 2607906
  { outputClauseIndex := 10927, coreClauseIndex := 36974, terminalClauseIndex := 2607906, datum := { row := ⟨6, {1, 4, 5, 9}⟩, arc := ⟨6, .right, {0, 1, 2, 3, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk013_batch_valid :
    directRowArcFiniteOccurrencesChunk013.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk013, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk013 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk013.map (·.datum)

theorem directRowArcFiniteDataChunk013_batch_valid :
    directRowArcFiniteDataChunk013.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk013, datum.Valid := by
  rw [directRowArcFiniteDataChunk013]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk013_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk013_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
