/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk011 : List DirectRowArcFiniteOccurrence := [
  -- compact 10368; core 35632; terminal 2606534
  { outputClauseIndex := 10368, coreClauseIndex := 35632, terminalClauseIndex := 2606534, datum := { row := ⟨5, {1, 7, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10370; core 35638; terminal 2606540
  { outputClauseIndex := 10370, coreClauseIndex := 35638, terminalClauseIndex := 2606540, datum := { row := ⟨5, {1, 7, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10371; core 35639; terminal 2606541
  { outputClauseIndex := 10371, coreClauseIndex := 35639, terminalClauseIndex := 2606541, datum := { row := ⟨5, {1, 7, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10373; core 35645; terminal 2606547
  { outputClauseIndex := 10373, coreClauseIndex := 35645, terminalClauseIndex := 2606547, datum := { row := ⟨5, {1, 7, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10374; core 35646; terminal 2606548
  { outputClauseIndex := 10374, coreClauseIndex := 35646, terminalClauseIndex := 2606548, datum := { row := ⟨5, {1, 7, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10375; core 35651; terminal 2606554
  { outputClauseIndex := 10375, coreClauseIndex := 35651, terminalClauseIndex := 2606554, datum := { row := ⟨5, {1, 8, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10377; core 35657; terminal 2606561
  { outputClauseIndex := 10377, coreClauseIndex := 35657, terminalClauseIndex := 2606561, datum := { row := ⟨5, {2, 3, 4, 6}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10378; core 35658; terminal 2606562
  { outputClauseIndex := 10378, coreClauseIndex := 35658, terminalClauseIndex := 2606562, datum := { row := ⟨5, {2, 3, 4, 6}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 10380; core 35664; terminal 2606568
  { outputClauseIndex := 10380, coreClauseIndex := 35664, terminalClauseIndex := 2606568, datum := { row := ⟨5, {2, 3, 4, 7}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10381; core 35665; terminal 2606569
  { outputClauseIndex := 10381, coreClauseIndex := 35665, terminalClauseIndex := 2606569, datum := { row := ⟨5, {2, 3, 4, 7}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 10383; core 35671; terminal 2606575
  { outputClauseIndex := 10383, coreClauseIndex := 35671, terminalClauseIndex := 2606575, datum := { row := ⟨5, {2, 3, 4, 8}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10384; core 35672; terminal 2606576
  { outputClauseIndex := 10384, coreClauseIndex := 35672, terminalClauseIndex := 2606576, datum := { row := ⟨5, {2, 3, 4, 8}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 10386; core 35678; terminal 2606582
  { outputClauseIndex := 10386, coreClauseIndex := 35678, terminalClauseIndex := 2606582, datum := { row := ⟨5, {2, 3, 4, 9}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10387; core 35679; terminal 2606583
  { outputClauseIndex := 10387, coreClauseIndex := 35679, terminalClauseIndex := 2606583, datum := { row := ⟨5, {2, 3, 4, 9}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 10389; core 35685; terminal 2606589
  { outputClauseIndex := 10389, coreClauseIndex := 35685, terminalClauseIndex := 2606589, datum := { row := ⟨5, {2, 3, 4, 10}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10390; core 35686; terminal 2606590
  { outputClauseIndex := 10390, coreClauseIndex := 35686, terminalClauseIndex := 2606590, datum := { row := ⟨5, {2, 3, 4, 10}⟩, arc := ⟨5, .right, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 10392; core 35692; terminal 2606596
  { outputClauseIndex := 10392, coreClauseIndex := 35692, terminalClauseIndex := 2606596, datum := { row := ⟨5, {2, 3, 6, 7}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10393; core 35693; terminal 2606597
  { outputClauseIndex := 10393, coreClauseIndex := 35693, terminalClauseIndex := 2606597, datum := { row := ⟨5, {2, 3, 6, 7}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10395; core 35699; terminal 2606603
  { outputClauseIndex := 10395, coreClauseIndex := 35699, terminalClauseIndex := 2606603, datum := { row := ⟨5, {2, 3, 6, 8}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10396; core 35700; terminal 2606604
  { outputClauseIndex := 10396, coreClauseIndex := 35700, terminalClauseIndex := 2606604, datum := { row := ⟨5, {2, 3, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10398; core 35706; terminal 2606610
  { outputClauseIndex := 10398, coreClauseIndex := 35706, terminalClauseIndex := 2606610, datum := { row := ⟨5, {2, 3, 6, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10399; core 35707; terminal 2606611
  { outputClauseIndex := 10399, coreClauseIndex := 35707, terminalClauseIndex := 2606611, datum := { row := ⟨5, {2, 3, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10401; core 35713; terminal 2606617
  { outputClauseIndex := 10401, coreClauseIndex := 35713, terminalClauseIndex := 2606617, datum := { row := ⟨5, {2, 3, 6, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10402; core 35714; terminal 2606618
  { outputClauseIndex := 10402, coreClauseIndex := 35714, terminalClauseIndex := 2606618, datum := { row := ⟨5, {2, 3, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10404; core 35720; terminal 2606624
  { outputClauseIndex := 10404, coreClauseIndex := 35720, terminalClauseIndex := 2606624, datum := { row := ⟨5, {2, 3, 7, 8}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10405; core 35721; terminal 2606625
  { outputClauseIndex := 10405, coreClauseIndex := 35721, terminalClauseIndex := 2606625, datum := { row := ⟨5, {2, 3, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10407; core 35727; terminal 2606631
  { outputClauseIndex := 10407, coreClauseIndex := 35727, terminalClauseIndex := 2606631, datum := { row := ⟨5, {2, 3, 7, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10408; core 35728; terminal 2606632
  { outputClauseIndex := 10408, coreClauseIndex := 35728, terminalClauseIndex := 2606632, datum := { row := ⟨5, {2, 3, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10410; core 35734; terminal 2606638
  { outputClauseIndex := 10410, coreClauseIndex := 35734, terminalClauseIndex := 2606638, datum := { row := ⟨5, {2, 3, 7, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10411; core 35735; terminal 2606639
  { outputClauseIndex := 10411, coreClauseIndex := 35735, terminalClauseIndex := 2606639, datum := { row := ⟨5, {2, 3, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10413; core 35741; terminal 2606645
  { outputClauseIndex := 10413, coreClauseIndex := 35741, terminalClauseIndex := 2606645, datum := { row := ⟨5, {2, 3, 8, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10414; core 35742; terminal 2606646
  { outputClauseIndex := 10414, coreClauseIndex := 35742, terminalClauseIndex := 2606646, datum := { row := ⟨5, {2, 3, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10416; core 35748; terminal 2606652
  { outputClauseIndex := 10416, coreClauseIndex := 35748, terminalClauseIndex := 2606652, datum := { row := ⟨5, {2, 3, 8, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10417; core 35749; terminal 2606653
  { outputClauseIndex := 10417, coreClauseIndex := 35749, terminalClauseIndex := 2606653, datum := { row := ⟨5, {2, 3, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10419; core 35755; terminal 2606659
  { outputClauseIndex := 10419, coreClauseIndex := 35755, terminalClauseIndex := 2606659, datum := { row := ⟨5, {2, 3, 9, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10420; core 35756; terminal 2606660
  { outputClauseIndex := 10420, coreClauseIndex := 35756, terminalClauseIndex := 2606660, datum := { row := ⟨5, {2, 3, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10421; core 35761; terminal 2606666
  { outputClauseIndex := 10421, coreClauseIndex := 35761, terminalClauseIndex := 2606666, datum := { row := ⟨5, {2, 4, 6, 7}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10423; core 35767; terminal 2606673
  { outputClauseIndex := 10423, coreClauseIndex := 35767, terminalClauseIndex := 2606673, datum := { row := ⟨5, {2, 4, 6, 8}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10424; core 35768; terminal 2606674
  { outputClauseIndex := 10424, coreClauseIndex := 35768, terminalClauseIndex := 2606674, datum := { row := ⟨5, {2, 4, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10426; core 35774; terminal 2606680
  { outputClauseIndex := 10426, coreClauseIndex := 35774, terminalClauseIndex := 2606680, datum := { row := ⟨5, {2, 4, 6, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10427; core 35775; terminal 2606681
  { outputClauseIndex := 10427, coreClauseIndex := 35775, terminalClauseIndex := 2606681, datum := { row := ⟨5, {2, 4, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10429; core 35781; terminal 2606687
  { outputClauseIndex := 10429, coreClauseIndex := 35781, terminalClauseIndex := 2606687, datum := { row := ⟨5, {2, 4, 6, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10430; core 35782; terminal 2606688
  { outputClauseIndex := 10430, coreClauseIndex := 35782, terminalClauseIndex := 2606688, datum := { row := ⟨5, {2, 4, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10432; core 35788; terminal 2606694
  { outputClauseIndex := 10432, coreClauseIndex := 35788, terminalClauseIndex := 2606694, datum := { row := ⟨5, {2, 4, 7, 8}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10433; core 35789; terminal 2606695
  { outputClauseIndex := 10433, coreClauseIndex := 35789, terminalClauseIndex := 2606695, datum := { row := ⟨5, {2, 4, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10435; core 35795; terminal 2606701
  { outputClauseIndex := 10435, coreClauseIndex := 35795, terminalClauseIndex := 2606701, datum := { row := ⟨5, {2, 4, 7, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10436; core 35796; terminal 2606702
  { outputClauseIndex := 10436, coreClauseIndex := 35796, terminalClauseIndex := 2606702, datum := { row := ⟨5, {2, 4, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10438; core 35802; terminal 2606708
  { outputClauseIndex := 10438, coreClauseIndex := 35802, terminalClauseIndex := 2606708, datum := { row := ⟨5, {2, 4, 7, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10439; core 35803; terminal 2606709
  { outputClauseIndex := 10439, coreClauseIndex := 35803, terminalClauseIndex := 2606709, datum := { row := ⟨5, {2, 4, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10441; core 35809; terminal 2606715
  { outputClauseIndex := 10441, coreClauseIndex := 35809, terminalClauseIndex := 2606715, datum := { row := ⟨5, {2, 4, 8, 9}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10442; core 35810; terminal 2606716
  { outputClauseIndex := 10442, coreClauseIndex := 35810, terminalClauseIndex := 2606716, datum := { row := ⟨5, {2, 4, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10444; core 35816; terminal 2606722
  { outputClauseIndex := 10444, coreClauseIndex := 35816, terminalClauseIndex := 2606722, datum := { row := ⟨5, {2, 4, 8, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10445; core 35817; terminal 2606723
  { outputClauseIndex := 10445, coreClauseIndex := 35817, terminalClauseIndex := 2606723, datum := { row := ⟨5, {2, 4, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10447; core 35823; terminal 2606729
  { outputClauseIndex := 10447, coreClauseIndex := 35823, terminalClauseIndex := 2606729, datum := { row := ⟨5, {2, 4, 9, 10}⟩, arc := ⟨5, .left, {6, 7}⟩ } },
  -- compact 10448; core 35824; terminal 2606730
  { outputClauseIndex := 10448, coreClauseIndex := 35824, terminalClauseIndex := 2606730, datum := { row := ⟨5, {2, 4, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10450; core 35830; terminal 2606736
  { outputClauseIndex := 10450, coreClauseIndex := 35830, terminalClauseIndex := 2606736, datum := { row := ⟨5, {2, 6, 7, 8}⟩, arc := ⟨5, .left, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10451; core 35831; terminal 2606737
  { outputClauseIndex := 10451, coreClauseIndex := 35831, terminalClauseIndex := 2606737, datum := { row := ⟨5, {2, 6, 7, 8}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10453; core 35837; terminal 2606743
  { outputClauseIndex := 10453, coreClauseIndex := 35837, terminalClauseIndex := 2606743, datum := { row := ⟨5, {2, 6, 7, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10454; core 35838; terminal 2606744
  { outputClauseIndex := 10454, coreClauseIndex := 35838, terminalClauseIndex := 2606744, datum := { row := ⟨5, {2, 6, 7, 9}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10456; core 35844; terminal 2606750
  { outputClauseIndex := 10456, coreClauseIndex := 35844, terminalClauseIndex := 2606750, datum := { row := ⟨5, {2, 6, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10457; core 35845; terminal 2606751
  { outputClauseIndex := 10457, coreClauseIndex := 35845, terminalClauseIndex := 2606751, datum := { row := ⟨5, {2, 6, 7, 10}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10459; core 35851; terminal 2606757
  { outputClauseIndex := 10459, coreClauseIndex := 35851, terminalClauseIndex := 2606757, datum := { row := ⟨5, {2, 6, 8, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10460; core 35852; terminal 2606758
  { outputClauseIndex := 10460, coreClauseIndex := 35852, terminalClauseIndex := 2606758, datum := { row := ⟨5, {2, 6, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10462; core 35858; terminal 2606764
  { outputClauseIndex := 10462, coreClauseIndex := 35858, terminalClauseIndex := 2606764, datum := { row := ⟨5, {2, 6, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10463; core 35859; terminal 2606765
  { outputClauseIndex := 10463, coreClauseIndex := 35859, terminalClauseIndex := 2606765, datum := { row := ⟨5, {2, 6, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10465; core 35865; terminal 2606771
  { outputClauseIndex := 10465, coreClauseIndex := 35865, terminalClauseIndex := 2606771, datum := { row := ⟨5, {2, 6, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10466; core 35866; terminal 2606772
  { outputClauseIndex := 10466, coreClauseIndex := 35866, terminalClauseIndex := 2606772, datum := { row := ⟨5, {2, 6, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10468; core 35872; terminal 2606778
  { outputClauseIndex := 10468, coreClauseIndex := 35872, terminalClauseIndex := 2606778, datum := { row := ⟨5, {2, 7, 8, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10469; core 35873; terminal 2606779
  { outputClauseIndex := 10469, coreClauseIndex := 35873, terminalClauseIndex := 2606779, datum := { row := ⟨5, {2, 7, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10471; core 35879; terminal 2606785
  { outputClauseIndex := 10471, coreClauseIndex := 35879, terminalClauseIndex := 2606785, datum := { row := ⟨5, {2, 7, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10472; core 35880; terminal 2606786
  { outputClauseIndex := 10472, coreClauseIndex := 35880, terminalClauseIndex := 2606786, datum := { row := ⟨5, {2, 7, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10474; core 35886; terminal 2606792
  { outputClauseIndex := 10474, coreClauseIndex := 35886, terminalClauseIndex := 2606792, datum := { row := ⟨5, {2, 7, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10475; core 35887; terminal 2606793
  { outputClauseIndex := 10475, coreClauseIndex := 35887, terminalClauseIndex := 2606793, datum := { row := ⟨5, {2, 7, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10476; core 35892; terminal 2606799
  { outputClauseIndex := 10476, coreClauseIndex := 35892, terminalClauseIndex := 2606799, datum := { row := ⟨5, {2, 8, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10477; core 35897; terminal 2606806
  { outputClauseIndex := 10477, coreClauseIndex := 35897, terminalClauseIndex := 2606806, datum := { row := ⟨5, {3, 4, 6, 7}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10479; core 35903; terminal 2606813
  { outputClauseIndex := 10479, coreClauseIndex := 35903, terminalClauseIndex := 2606813, datum := { row := ⟨5, {3, 4, 6, 8}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10480; core 35904; terminal 2606814
  { outputClauseIndex := 10480, coreClauseIndex := 35904, terminalClauseIndex := 2606814, datum := { row := ⟨5, {3, 4, 6, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10482; core 35910; terminal 2606820
  { outputClauseIndex := 10482, coreClauseIndex := 35910, terminalClauseIndex := 2606820, datum := { row := ⟨5, {3, 4, 6, 9}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10483; core 35911; terminal 2606821
  { outputClauseIndex := 10483, coreClauseIndex := 35911, terminalClauseIndex := 2606821, datum := { row := ⟨5, {3, 4, 6, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10485; core 35917; terminal 2606827
  { outputClauseIndex := 10485, coreClauseIndex := 35917, terminalClauseIndex := 2606827, datum := { row := ⟨5, {3, 4, 6, 10}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10486; core 35918; terminal 2606828
  { outputClauseIndex := 10486, coreClauseIndex := 35918, terminalClauseIndex := 2606828, datum := { row := ⟨5, {3, 4, 6, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10488; core 35924; terminal 2606834
  { outputClauseIndex := 10488, coreClauseIndex := 35924, terminalClauseIndex := 2606834, datum := { row := ⟨5, {3, 4, 7, 8}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10489; core 35925; terminal 2606835
  { outputClauseIndex := 10489, coreClauseIndex := 35925, terminalClauseIndex := 2606835, datum := { row := ⟨5, {3, 4, 7, 8}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10491; core 35931; terminal 2606841
  { outputClauseIndex := 10491, coreClauseIndex := 35931, terminalClauseIndex := 2606841, datum := { row := ⟨5, {3, 4, 7, 9}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10492; core 35932; terminal 2606842
  { outputClauseIndex := 10492, coreClauseIndex := 35932, terminalClauseIndex := 2606842, datum := { row := ⟨5, {3, 4, 7, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10494; core 35938; terminal 2606848
  { outputClauseIndex := 10494, coreClauseIndex := 35938, terminalClauseIndex := 2606848, datum := { row := ⟨5, {3, 4, 7, 10}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10495; core 35939; terminal 2606849
  { outputClauseIndex := 10495, coreClauseIndex := 35939, terminalClauseIndex := 2606849, datum := { row := ⟨5, {3, 4, 7, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10497; core 35945; terminal 2606855
  { outputClauseIndex := 10497, coreClauseIndex := 35945, terminalClauseIndex := 2606855, datum := { row := ⟨5, {3, 4, 8, 9}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10498; core 35946; terminal 2606856
  { outputClauseIndex := 10498, coreClauseIndex := 35946, terminalClauseIndex := 2606856, datum := { row := ⟨5, {3, 4, 8, 9}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10500; core 35952; terminal 2606862
  { outputClauseIndex := 10500, coreClauseIndex := 35952, terminalClauseIndex := 2606862, datum := { row := ⟨5, {3, 4, 8, 10}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10501; core 35953; terminal 2606863
  { outputClauseIndex := 10501, coreClauseIndex := 35953, terminalClauseIndex := 2606863, datum := { row := ⟨5, {3, 4, 8, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10503; core 35959; terminal 2606869
  { outputClauseIndex := 10503, coreClauseIndex := 35959, terminalClauseIndex := 2606869, datum := { row := ⟨5, {3, 4, 9, 10}⟩, arc := ⟨5, .left, {6}⟩ } },
  -- compact 10504; core 35960; terminal 2606870
  { outputClauseIndex := 10504, coreClauseIndex := 35960, terminalClauseIndex := 2606870, datum := { row := ⟨5, {3, 4, 9, 10}⟩, arc := ⟨5, .right, {1, 2, 3, 4}⟩ } },
  -- compact 10506; core 35966; terminal 2606876
  { outputClauseIndex := 10506, coreClauseIndex := 35966, terminalClauseIndex := 2606876, datum := { row := ⟨5, {3, 6, 7, 8}⟩, arc := ⟨5, .left, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10507; core 35967; terminal 2606877
  { outputClauseIndex := 10507, coreClauseIndex := 35967, terminalClauseIndex := 2606877, datum := { row := ⟨5, {3, 6, 7, 8}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10509; core 35973; terminal 2606883
  { outputClauseIndex := 10509, coreClauseIndex := 35973, terminalClauseIndex := 2606883, datum := { row := ⟨5, {3, 6, 7, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10510; core 35974; terminal 2606884
  { outputClauseIndex := 10510, coreClauseIndex := 35974, terminalClauseIndex := 2606884, datum := { row := ⟨5, {3, 6, 7, 9}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10512; core 35980; terminal 2606890
  { outputClauseIndex := 10512, coreClauseIndex := 35980, terminalClauseIndex := 2606890, datum := { row := ⟨5, {3, 6, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10513; core 35981; terminal 2606891
  { outputClauseIndex := 10513, coreClauseIndex := 35981, terminalClauseIndex := 2606891, datum := { row := ⟨5, {3, 6, 7, 10}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10515; core 35987; terminal 2606897
  { outputClauseIndex := 10515, coreClauseIndex := 35987, terminalClauseIndex := 2606897, datum := { row := ⟨5, {3, 6, 8, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10516; core 35988; terminal 2606898
  { outputClauseIndex := 10516, coreClauseIndex := 35988, terminalClauseIndex := 2606898, datum := { row := ⟨5, {3, 6, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10518; core 35994; terminal 2606904
  { outputClauseIndex := 10518, coreClauseIndex := 35994, terminalClauseIndex := 2606904, datum := { row := ⟨5, {3, 6, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10519; core 35995; terminal 2606905
  { outputClauseIndex := 10519, coreClauseIndex := 35995, terminalClauseIndex := 2606905, datum := { row := ⟨5, {3, 6, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10521; core 36001; terminal 2606911
  { outputClauseIndex := 10521, coreClauseIndex := 36001, terminalClauseIndex := 2606911, datum := { row := ⟨5, {3, 6, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10522; core 36002; terminal 2606912
  { outputClauseIndex := 10522, coreClauseIndex := 36002, terminalClauseIndex := 2606912, datum := { row := ⟨5, {3, 6, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10524; core 36008; terminal 2606918
  { outputClauseIndex := 10524, coreClauseIndex := 36008, terminalClauseIndex := 2606918, datum := { row := ⟨5, {3, 7, 8, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10525; core 36009; terminal 2606919
  { outputClauseIndex := 10525, coreClauseIndex := 36009, terminalClauseIndex := 2606919, datum := { row := ⟨5, {3, 7, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10527; core 36015; terminal 2606925
  { outputClauseIndex := 10527, coreClauseIndex := 36015, terminalClauseIndex := 2606925, datum := { row := ⟨5, {3, 7, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10528; core 36016; terminal 2606926
  { outputClauseIndex := 10528, coreClauseIndex := 36016, terminalClauseIndex := 2606926, datum := { row := ⟨5, {3, 7, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10530; core 36022; terminal 2606932
  { outputClauseIndex := 10530, coreClauseIndex := 36022, terminalClauseIndex := 2606932, datum := { row := ⟨5, {3, 7, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10531; core 36023; terminal 2606933
  { outputClauseIndex := 10531, coreClauseIndex := 36023, terminalClauseIndex := 2606933, datum := { row := ⟨5, {3, 7, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10532; core 36028; terminal 2606939
  { outputClauseIndex := 10532, coreClauseIndex := 36028, terminalClauseIndex := 2606939, datum := { row := ⟨5, {3, 8, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10533; core 36033; terminal 2606946
  { outputClauseIndex := 10533, coreClauseIndex := 36033, terminalClauseIndex := 2606946, datum := { row := ⟨5, {4, 6, 7, 8}⟩, arc := ⟨5, .left, {0, 1, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10534; core 36034; terminal 2606947
  { outputClauseIndex := 10534, coreClauseIndex := 36034, terminalClauseIndex := 2606947, datum := { row := ⟨5, {4, 6, 7, 8}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10535; core 36039; terminal 2606953
  { outputClauseIndex := 10535, coreClauseIndex := 36039, terminalClauseIndex := 2606953, datum := { row := ⟨5, {4, 6, 7, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10536; core 36044; terminal 2606960
  { outputClauseIndex := 10536, coreClauseIndex := 36044, terminalClauseIndex := 2606960, datum := { row := ⟨5, {4, 6, 7, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10537; core 36045; terminal 2606961
  { outputClauseIndex := 10537, coreClauseIndex := 36045, terminalClauseIndex := 2606961, datum := { row := ⟨5, {4, 6, 7, 10}⟩, arc := ⟨5, .right, {4}⟩ } },
  -- compact 10539; core 36051; terminal 2606967
  { outputClauseIndex := 10539, coreClauseIndex := 36051, terminalClauseIndex := 2606967, datum := { row := ⟨5, {4, 6, 8, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10540; core 36052; terminal 2606968
  { outputClauseIndex := 10540, coreClauseIndex := 36052, terminalClauseIndex := 2606968, datum := { row := ⟨5, {4, 6, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10542; core 36058; terminal 2606974
  { outputClauseIndex := 10542, coreClauseIndex := 36058, terminalClauseIndex := 2606974, datum := { row := ⟨5, {4, 6, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10543; core 36059; terminal 2606975
  { outputClauseIndex := 10543, coreClauseIndex := 36059, terminalClauseIndex := 2606975, datum := { row := ⟨5, {4, 6, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10545; core 36065; terminal 2606981
  { outputClauseIndex := 10545, coreClauseIndex := 36065, terminalClauseIndex := 2606981, datum := { row := ⟨5, {4, 6, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10546; core 36066; terminal 2606982
  { outputClauseIndex := 10546, coreClauseIndex := 36066, terminalClauseIndex := 2606982, datum := { row := ⟨5, {4, 6, 9, 10}⟩, arc := ⟨5, .right, {2, 3, 4}⟩ } },
  -- compact 10548; core 36072; terminal 2606988
  { outputClauseIndex := 10548, coreClauseIndex := 36072, terminalClauseIndex := 2606988, datum := { row := ⟨5, {4, 7, 8, 9}⟩, arc := ⟨5, .left, {0, 6, 7, 8, 9, 10}⟩ } },
  -- compact 10549; core 36073; terminal 2606989
  { outputClauseIndex := 10549, coreClauseIndex := 36073, terminalClauseIndex := 2606989, datum := { row := ⟨5, {4, 7, 8, 9}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10551; core 36079; terminal 2606995
  { outputClauseIndex := 10551, coreClauseIndex := 36079, terminalClauseIndex := 2606995, datum := { row := ⟨5, {4, 7, 8, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
  -- compact 10552; core 36080; terminal 2606996
  { outputClauseIndex := 10552, coreClauseIndex := 36080, terminalClauseIndex := 2606996, datum := { row := ⟨5, {4, 7, 8, 10}⟩, arc := ⟨5, .right, {3, 4}⟩ } },
  -- compact 10554; core 36086; terminal 2607002
  { outputClauseIndex := 10554, coreClauseIndex := 36086, terminalClauseIndex := 2607002, datum := { row := ⟨5, {4, 7, 9, 10}⟩, arc := ⟨5, .left, {6, 7, 8, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk011_batch_valid :
    directRowArcFiniteOccurrencesChunk011.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk011, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk011 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk011.map (·.datum)

theorem directRowArcFiniteDataChunk011_batch_valid :
    directRowArcFiniteDataChunk011.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk011, datum.Valid := by
  rw [directRowArcFiniteDataChunk011]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk011_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk011_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
