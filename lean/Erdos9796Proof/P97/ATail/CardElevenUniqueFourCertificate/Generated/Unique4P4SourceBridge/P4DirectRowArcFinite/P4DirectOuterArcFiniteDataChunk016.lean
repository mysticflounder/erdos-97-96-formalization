/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk016 : List DirectRowArcFiniteOccurrence := [
  -- compact 11304; core 38130; terminal 2609578
  { outputClauseIndex := 11304, coreClauseIndex := 38130, terminalClauseIndex := 2609578, datum := { row := ⟨7, {2, 3, 6, 10}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11305; core 38131; terminal 2609579
  { outputClauseIndex := 11305, coreClauseIndex := 38131, terminalClauseIndex := 2609579, datum := { row := ⟨7, {2, 3, 6, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11306; core 38144; terminal 2609614
  { outputClauseIndex := 11306, coreClauseIndex := 38144, terminalClauseIndex := 2609614, datum := { row := ⟨7, {2, 4, 5, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11307; core 38147; terminal 2609621
  { outputClauseIndex := 11307, coreClauseIndex := 38147, terminalClauseIndex := 2609621, datum := { row := ⟨7, {2, 4, 5, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11308; core 38151; terminal 2609628
  { outputClauseIndex := 11308, coreClauseIndex := 38151, terminalClauseIndex := 2609628, datum := { row := ⟨7, {2, 4, 5, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11309; core 38155; terminal 2609635
  { outputClauseIndex := 11309, coreClauseIndex := 38155, terminalClauseIndex := 2609635, datum := { row := ⟨7, {2, 4, 6, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11310; core 38159; terminal 2609642
  { outputClauseIndex := 11310, coreClauseIndex := 38159, terminalClauseIndex := 2609642, datum := { row := ⟨7, {2, 4, 6, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11311; core 38163; terminal 2609649
  { outputClauseIndex := 11311, coreClauseIndex := 38163, terminalClauseIndex := 2609649, datum := { row := ⟨7, {2, 4, 6, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11312; core 38175; terminal 2609677
  { outputClauseIndex := 11312, coreClauseIndex := 38175, terminalClauseIndex := 2609677, datum := { row := ⟨7, {2, 5, 6, 8}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11313; core 38179; terminal 2609684
  { outputClauseIndex := 11313, coreClauseIndex := 38179, terminalClauseIndex := 2609684, datum := { row := ⟨7, {2, 5, 6, 9}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11314; core 38183; terminal 2609691
  { outputClauseIndex := 11314, coreClauseIndex := 38183, terminalClauseIndex := 2609691, datum := { row := ⟨7, {2, 5, 6, 10}⟩, arc := ⟨7, .right, {0, 1, 2, 9, 10}⟩ } },
  -- compact 11315; core 38223; terminal 2609795
  { outputClauseIndex := 11315, coreClauseIndex := 38223, terminalClauseIndex := 2609795, datum := { row := ⟨7, {3, 4, 8, 9}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11316; core 38244; terminal 2609837
  { outputClauseIndex := 11316, coreClauseIndex := 38244, terminalClauseIndex := 2609837, datum := { row := ⟨7, {3, 5, 8, 9}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11317; core 38257; terminal 2609858
  { outputClauseIndex := 11317, coreClauseIndex := 38257, terminalClauseIndex := 2609858, datum := { row := ⟨7, {3, 6, 8, 9}⟩, arc := ⟨7, .left, {4, 5, 6}⟩ } },
  -- compact 11318; core 38304; terminal 2609991
  { outputClauseIndex := 11318, coreClauseIndex := 38304, terminalClauseIndex := 2609991, datum := { row := ⟨8, {0, 1, 2, 3}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11319; core 38305; terminal 2609992
  { outputClauseIndex := 11319, coreClauseIndex := 38305, terminalClauseIndex := 2609992, datum := { row := ⟨8, {0, 1, 2, 3}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11321; core 38311; terminal 2609998
  { outputClauseIndex := 11321, coreClauseIndex := 38311, terminalClauseIndex := 2609998, datum := { row := ⟨8, {0, 1, 2, 4}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11322; core 38312; terminal 2609999
  { outputClauseIndex := 11322, coreClauseIndex := 38312, terminalClauseIndex := 2609999, datum := { row := ⟨8, {0, 1, 2, 4}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11324; core 38318; terminal 2610005
  { outputClauseIndex := 11324, coreClauseIndex := 38318, terminalClauseIndex := 2610005, datum := { row := ⟨8, {0, 1, 2, 5}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11325; core 38319; terminal 2610006
  { outputClauseIndex := 11325, coreClauseIndex := 38319, terminalClauseIndex := 2610006, datum := { row := ⟨8, {0, 1, 2, 5}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11327; core 38325; terminal 2610012
  { outputClauseIndex := 11327, coreClauseIndex := 38325, terminalClauseIndex := 2610012, datum := { row := ⟨8, {0, 1, 2, 6}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11328; core 38326; terminal 2610013
  { outputClauseIndex := 11328, coreClauseIndex := 38326, terminalClauseIndex := 2610013, datum := { row := ⟨8, {0, 1, 2, 6}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11330; core 38332; terminal 2610019
  { outputClauseIndex := 11330, coreClauseIndex := 38332, terminalClauseIndex := 2610019, datum := { row := ⟨8, {0, 1, 2, 7}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11331; core 38333; terminal 2610020
  { outputClauseIndex := 11331, coreClauseIndex := 38333, terminalClauseIndex := 2610020, datum := { row := ⟨8, {0, 1, 2, 7}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11333; core 38339; terminal 2610026
  { outputClauseIndex := 11333, coreClauseIndex := 38339, terminalClauseIndex := 2610026, datum := { row := ⟨8, {0, 1, 2, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11334; core 38340; terminal 2610027
  { outputClauseIndex := 11334, coreClauseIndex := 38340, terminalClauseIndex := 2610027, datum := { row := ⟨8, {0, 1, 2, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11336; core 38346; terminal 2610033
  { outputClauseIndex := 11336, coreClauseIndex := 38346, terminalClauseIndex := 2610033, datum := { row := ⟨8, {0, 1, 2, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11337; core 38347; terminal 2610034
  { outputClauseIndex := 11337, coreClauseIndex := 38347, terminalClauseIndex := 2610034, datum := { row := ⟨8, {0, 1, 2, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11339; core 38353; terminal 2610040
  { outputClauseIndex := 11339, coreClauseIndex := 38353, terminalClauseIndex := 2610040, datum := { row := ⟨8, {0, 1, 3, 4}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11340; core 38354; terminal 2610041
  { outputClauseIndex := 11340, coreClauseIndex := 38354, terminalClauseIndex := 2610041, datum := { row := ⟨8, {0, 1, 3, 4}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11342; core 38360; terminal 2610047
  { outputClauseIndex := 11342, coreClauseIndex := 38360, terminalClauseIndex := 2610047, datum := { row := ⟨8, {0, 1, 3, 5}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11343; core 38361; terminal 2610048
  { outputClauseIndex := 11343, coreClauseIndex := 38361, terminalClauseIndex := 2610048, datum := { row := ⟨8, {0, 1, 3, 5}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11345; core 38367; terminal 2610054
  { outputClauseIndex := 11345, coreClauseIndex := 38367, terminalClauseIndex := 2610054, datum := { row := ⟨8, {0, 1, 3, 6}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11346; core 38368; terminal 2610055
  { outputClauseIndex := 11346, coreClauseIndex := 38368, terminalClauseIndex := 2610055, datum := { row := ⟨8, {0, 1, 3, 6}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11348; core 38374; terminal 2610061
  { outputClauseIndex := 11348, coreClauseIndex := 38374, terminalClauseIndex := 2610061, datum := { row := ⟨8, {0, 1, 3, 7}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11349; core 38375; terminal 2610062
  { outputClauseIndex := 11349, coreClauseIndex := 38375, terminalClauseIndex := 2610062, datum := { row := ⟨8, {0, 1, 3, 7}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11351; core 38381; terminal 2610068
  { outputClauseIndex := 11351, coreClauseIndex := 38381, terminalClauseIndex := 2610068, datum := { row := ⟨8, {0, 1, 3, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11352; core 38382; terminal 2610069
  { outputClauseIndex := 11352, coreClauseIndex := 38382, terminalClauseIndex := 2610069, datum := { row := ⟨8, {0, 1, 3, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11354; core 38388; terminal 2610075
  { outputClauseIndex := 11354, coreClauseIndex := 38388, terminalClauseIndex := 2610075, datum := { row := ⟨8, {0, 1, 3, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11355; core 38389; terminal 2610076
  { outputClauseIndex := 11355, coreClauseIndex := 38389, terminalClauseIndex := 2610076, datum := { row := ⟨8, {0, 1, 3, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11357; core 38395; terminal 2610082
  { outputClauseIndex := 11357, coreClauseIndex := 38395, terminalClauseIndex := 2610082, datum := { row := ⟨8, {0, 1, 4, 5}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11358; core 38396; terminal 2610083
  { outputClauseIndex := 11358, coreClauseIndex := 38396, terminalClauseIndex := 2610083, datum := { row := ⟨8, {0, 1, 4, 5}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11360; core 38402; terminal 2610089
  { outputClauseIndex := 11360, coreClauseIndex := 38402, terminalClauseIndex := 2610089, datum := { row := ⟨8, {0, 1, 4, 6}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11361; core 38403; terminal 2610090
  { outputClauseIndex := 11361, coreClauseIndex := 38403, terminalClauseIndex := 2610090, datum := { row := ⟨8, {0, 1, 4, 6}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11363; core 38409; terminal 2610096
  { outputClauseIndex := 11363, coreClauseIndex := 38409, terminalClauseIndex := 2610096, datum := { row := ⟨8, {0, 1, 4, 7}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11364; core 38410; terminal 2610097
  { outputClauseIndex := 11364, coreClauseIndex := 38410, terminalClauseIndex := 2610097, datum := { row := ⟨8, {0, 1, 4, 7}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11366; core 38416; terminal 2610103
  { outputClauseIndex := 11366, coreClauseIndex := 38416, terminalClauseIndex := 2610103, datum := { row := ⟨8, {0, 1, 4, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11367; core 38417; terminal 2610104
  { outputClauseIndex := 11367, coreClauseIndex := 38417, terminalClauseIndex := 2610104, datum := { row := ⟨8, {0, 1, 4, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11369; core 38423; terminal 2610110
  { outputClauseIndex := 11369, coreClauseIndex := 38423, terminalClauseIndex := 2610110, datum := { row := ⟨8, {0, 1, 4, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11370; core 38424; terminal 2610111
  { outputClauseIndex := 11370, coreClauseIndex := 38424, terminalClauseIndex := 2610111, datum := { row := ⟨8, {0, 1, 4, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11371; core 38429; terminal 2610118
  { outputClauseIndex := 11371, coreClauseIndex := 38429, terminalClauseIndex := 2610118, datum := { row := ⟨8, {0, 1, 5, 6}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11373; core 38435; terminal 2610124
  { outputClauseIndex := 11373, coreClauseIndex := 38435, terminalClauseIndex := 2610124, datum := { row := ⟨8, {0, 1, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11374; core 38436; terminal 2610125
  { outputClauseIndex := 11374, coreClauseIndex := 38436, terminalClauseIndex := 2610125, datum := { row := ⟨8, {0, 1, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11376; core 38442; terminal 2610131
  { outputClauseIndex := 11376, coreClauseIndex := 38442, terminalClauseIndex := 2610131, datum := { row := ⟨8, {0, 1, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11377; core 38443; terminal 2610132
  { outputClauseIndex := 11377, coreClauseIndex := 38443, terminalClauseIndex := 2610132, datum := { row := ⟨8, {0, 1, 5, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11379; core 38449; terminal 2610138
  { outputClauseIndex := 11379, coreClauseIndex := 38449, terminalClauseIndex := 2610138, datum := { row := ⟨8, {0, 1, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11380; core 38450; terminal 2610139
  { outputClauseIndex := 11380, coreClauseIndex := 38450, terminalClauseIndex := 2610139, datum := { row := ⟨8, {0, 1, 5, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11382; core 38456; terminal 2610145
  { outputClauseIndex := 11382, coreClauseIndex := 38456, terminalClauseIndex := 2610145, datum := { row := ⟨8, {0, 1, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11383; core 38457; terminal 2610146
  { outputClauseIndex := 11383, coreClauseIndex := 38457, terminalClauseIndex := 2610146, datum := { row := ⟨8, {0, 1, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 10}⟩ } },
  -- compact 11385; core 38463; terminal 2610152
  { outputClauseIndex := 11385, coreClauseIndex := 38463, terminalClauseIndex := 2610152, datum := { row := ⟨8, {0, 1, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11386; core 38464; terminal 2610153
  { outputClauseIndex := 11386, coreClauseIndex := 38464, terminalClauseIndex := 2610153, datum := { row := ⟨8, {0, 1, 6, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11388; core 38470; terminal 2610159
  { outputClauseIndex := 11388, coreClauseIndex := 38470, terminalClauseIndex := 2610159, datum := { row := ⟨8, {0, 1, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11389; core 38471; terminal 2610160
  { outputClauseIndex := 11389, coreClauseIndex := 38471, terminalClauseIndex := 2610160, datum := { row := ⟨8, {0, 1, 6, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11390; core 38476; terminal 2610166
  { outputClauseIndex := 11390, coreClauseIndex := 38476, terminalClauseIndex := 2610166, datum := { row := ⟨8, {0, 1, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11391; core 38477; terminal 2610167
  { outputClauseIndex := 11391, coreClauseIndex := 38477, terminalClauseIndex := 2610167, datum := { row := ⟨8, {0, 1, 7, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11392; core 38482; terminal 2610173
  { outputClauseIndex := 11392, coreClauseIndex := 38482, terminalClauseIndex := 2610173, datum := { row := ⟨8, {0, 1, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8}⟩ } },
  -- compact 11393; core 38483; terminal 2610174
  { outputClauseIndex := 11393, coreClauseIndex := 38483, terminalClauseIndex := 2610174, datum := { row := ⟨8, {0, 1, 7, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11394; core 38487; terminal 2610180
  { outputClauseIndex := 11394, coreClauseIndex := 38487, terminalClauseIndex := 2610180, datum := { row := ⟨8, {0, 1, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8, 9}⟩ } },
  -- compact 11395; core 38488; terminal 2610181
  { outputClauseIndex := 11395, coreClauseIndex := 38488, terminalClauseIndex := 2610181, datum := { row := ⟨8, {0, 1, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11397; core 38494; terminal 2610187
  { outputClauseIndex := 11397, coreClauseIndex := 38494, terminalClauseIndex := 2610187, datum := { row := ⟨8, {0, 2, 3, 4}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11398; core 38495; terminal 2610188
  { outputClauseIndex := 11398, coreClauseIndex := 38495, terminalClauseIndex := 2610188, datum := { row := ⟨8, {0, 2, 3, 4}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11400; core 38501; terminal 2610194
  { outputClauseIndex := 11400, coreClauseIndex := 38501, terminalClauseIndex := 2610194, datum := { row := ⟨8, {0, 2, 3, 5}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11401; core 38502; terminal 2610195
  { outputClauseIndex := 11401, coreClauseIndex := 38502, terminalClauseIndex := 2610195, datum := { row := ⟨8, {0, 2, 3, 5}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11403; core 38508; terminal 2610201
  { outputClauseIndex := 11403, coreClauseIndex := 38508, terminalClauseIndex := 2610201, datum := { row := ⟨8, {0, 2, 3, 6}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11404; core 38509; terminal 2610202
  { outputClauseIndex := 11404, coreClauseIndex := 38509, terminalClauseIndex := 2610202, datum := { row := ⟨8, {0, 2, 3, 6}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11406; core 38515; terminal 2610208
  { outputClauseIndex := 11406, coreClauseIndex := 38515, terminalClauseIndex := 2610208, datum := { row := ⟨8, {0, 2, 3, 7}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11407; core 38516; terminal 2610209
  { outputClauseIndex := 11407, coreClauseIndex := 38516, terminalClauseIndex := 2610209, datum := { row := ⟨8, {0, 2, 3, 7}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11409; core 38522; terminal 2610215
  { outputClauseIndex := 11409, coreClauseIndex := 38522, terminalClauseIndex := 2610215, datum := { row := ⟨8, {0, 2, 3, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11410; core 38523; terminal 2610216
  { outputClauseIndex := 11410, coreClauseIndex := 38523, terminalClauseIndex := 2610216, datum := { row := ⟨8, {0, 2, 3, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11412; core 38529; terminal 2610222
  { outputClauseIndex := 11412, coreClauseIndex := 38529, terminalClauseIndex := 2610222, datum := { row := ⟨8, {0, 2, 3, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11413; core 38530; terminal 2610223
  { outputClauseIndex := 11413, coreClauseIndex := 38530, terminalClauseIndex := 2610223, datum := { row := ⟨8, {0, 2, 3, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11415; core 38536; terminal 2610229
  { outputClauseIndex := 11415, coreClauseIndex := 38536, terminalClauseIndex := 2610229, datum := { row := ⟨8, {0, 2, 4, 5}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11416; core 38537; terminal 2610230
  { outputClauseIndex := 11416, coreClauseIndex := 38537, terminalClauseIndex := 2610230, datum := { row := ⟨8, {0, 2, 4, 5}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11418; core 38543; terminal 2610236
  { outputClauseIndex := 11418, coreClauseIndex := 38543, terminalClauseIndex := 2610236, datum := { row := ⟨8, {0, 2, 4, 6}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11419; core 38544; terminal 2610237
  { outputClauseIndex := 11419, coreClauseIndex := 38544, terminalClauseIndex := 2610237, datum := { row := ⟨8, {0, 2, 4, 6}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11421; core 38550; terminal 2610243
  { outputClauseIndex := 11421, coreClauseIndex := 38550, terminalClauseIndex := 2610243, datum := { row := ⟨8, {0, 2, 4, 7}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11422; core 38551; terminal 2610244
  { outputClauseIndex := 11422, coreClauseIndex := 38551, terminalClauseIndex := 2610244, datum := { row := ⟨8, {0, 2, 4, 7}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11424; core 38557; terminal 2610250
  { outputClauseIndex := 11424, coreClauseIndex := 38557, terminalClauseIndex := 2610250, datum := { row := ⟨8, {0, 2, 4, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11425; core 38558; terminal 2610251
  { outputClauseIndex := 11425, coreClauseIndex := 38558, terminalClauseIndex := 2610251, datum := { row := ⟨8, {0, 2, 4, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11427; core 38564; terminal 2610257
  { outputClauseIndex := 11427, coreClauseIndex := 38564, terminalClauseIndex := 2610257, datum := { row := ⟨8, {0, 2, 4, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11428; core 38565; terminal 2610258
  { outputClauseIndex := 11428, coreClauseIndex := 38565, terminalClauseIndex := 2610258, datum := { row := ⟨8, {0, 2, 4, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11429; core 38570; terminal 2610265
  { outputClauseIndex := 11429, coreClauseIndex := 38570, terminalClauseIndex := 2610265, datum := { row := ⟨8, {0, 2, 5, 6}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11431; core 38576; terminal 2610271
  { outputClauseIndex := 11431, coreClauseIndex := 38576, terminalClauseIndex := 2610271, datum := { row := ⟨8, {0, 2, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11432; core 38577; terminal 2610272
  { outputClauseIndex := 11432, coreClauseIndex := 38577, terminalClauseIndex := 2610272, datum := { row := ⟨8, {0, 2, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11434; core 38583; terminal 2610278
  { outputClauseIndex := 11434, coreClauseIndex := 38583, terminalClauseIndex := 2610278, datum := { row := ⟨8, {0, 2, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11435; core 38584; terminal 2610279
  { outputClauseIndex := 11435, coreClauseIndex := 38584, terminalClauseIndex := 2610279, datum := { row := ⟨8, {0, 2, 5, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11437; core 38590; terminal 2610285
  { outputClauseIndex := 11437, coreClauseIndex := 38590, terminalClauseIndex := 2610285, datum := { row := ⟨8, {0, 2, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11438; core 38591; terminal 2610286
  { outputClauseIndex := 11438, coreClauseIndex := 38591, terminalClauseIndex := 2610286, datum := { row := ⟨8, {0, 2, 5, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11440; core 38597; terminal 2610292
  { outputClauseIndex := 11440, coreClauseIndex := 38597, terminalClauseIndex := 2610292, datum := { row := ⟨8, {0, 2, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11441; core 38598; terminal 2610293
  { outputClauseIndex := 11441, coreClauseIndex := 38598, terminalClauseIndex := 2610293, datum := { row := ⟨8, {0, 2, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 9, 10}⟩ } },
  -- compact 11443; core 38604; terminal 2610299
  { outputClauseIndex := 11443, coreClauseIndex := 38604, terminalClauseIndex := 2610299, datum := { row := ⟨8, {0, 2, 6, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11444; core 38605; terminal 2610300
  { outputClauseIndex := 11444, coreClauseIndex := 38605, terminalClauseIndex := 2610300, datum := { row := ⟨8, {0, 2, 6, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11446; core 38611; terminal 2610306
  { outputClauseIndex := 11446, coreClauseIndex := 38611, terminalClauseIndex := 2610306, datum := { row := ⟨8, {0, 2, 6, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11447; core 38612; terminal 2610307
  { outputClauseIndex := 11447, coreClauseIndex := 38612, terminalClauseIndex := 2610307, datum := { row := ⟨8, {0, 2, 6, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11448; core 38617; terminal 2610313
  { outputClauseIndex := 11448, coreClauseIndex := 38617, terminalClauseIndex := 2610313, datum := { row := ⟨8, {0, 2, 7, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11449; core 38618; terminal 2610314
  { outputClauseIndex := 11449, coreClauseIndex := 38618, terminalClauseIndex := 2610314, datum := { row := ⟨8, {0, 2, 7, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11450; core 38623; terminal 2610320
  { outputClauseIndex := 11450, coreClauseIndex := 38623, terminalClauseIndex := 2610320, datum := { row := ⟨8, {0, 2, 7, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7}⟩ } },
  -- compact 11451; core 38624; terminal 2610321
  { outputClauseIndex := 11451, coreClauseIndex := 38624, terminalClauseIndex := 2610321, datum := { row := ⟨8, {0, 2, 7, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11452; core 38629; terminal 2610327
  { outputClauseIndex := 11452, coreClauseIndex := 38629, terminalClauseIndex := 2610327, datum := { row := ⟨8, {0, 2, 9, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6, 7, 8, 9}⟩ } },
  -- compact 11453; core 38630; terminal 2610328
  { outputClauseIndex := 11453, coreClauseIndex := 38630, terminalClauseIndex := 2610328, datum := { row := ⟨8, {0, 2, 9, 10}⟩, arc := ⟨8, .right, {1}⟩ } },
  -- compact 11455; core 38636; terminal 2610334
  { outputClauseIndex := 11455, coreClauseIndex := 38636, terminalClauseIndex := 2610334, datum := { row := ⟨8, {0, 3, 4, 5}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11456; core 38637; terminal 2610335
  { outputClauseIndex := 11456, coreClauseIndex := 38637, terminalClauseIndex := 2610335, datum := { row := ⟨8, {0, 3, 4, 5}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11458; core 38643; terminal 2610341
  { outputClauseIndex := 11458, coreClauseIndex := 38643, terminalClauseIndex := 2610341, datum := { row := ⟨8, {0, 3, 4, 6}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11459; core 38644; terminal 2610342
  { outputClauseIndex := 11459, coreClauseIndex := 38644, terminalClauseIndex := 2610342, datum := { row := ⟨8, {0, 3, 4, 6}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11461; core 38650; terminal 2610348
  { outputClauseIndex := 11461, coreClauseIndex := 38650, terminalClauseIndex := 2610348, datum := { row := ⟨8, {0, 3, 4, 7}⟩, arc := ⟨8, .left, {3, 4, 5}⟩ } },
  -- compact 11462; core 38651; terminal 2610349
  { outputClauseIndex := 11462, coreClauseIndex := 38651, terminalClauseIndex := 2610349, datum := { row := ⟨8, {0, 3, 4, 7}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11464; core 38657; terminal 2610355
  { outputClauseIndex := 11464, coreClauseIndex := 38657, terminalClauseIndex := 2610355, datum := { row := ⟨8, {0, 3, 4, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11465; core 38658; terminal 2610356
  { outputClauseIndex := 11465, coreClauseIndex := 38658, terminalClauseIndex := 2610356, datum := { row := ⟨8, {0, 3, 4, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11467; core 38664; terminal 2610362
  { outputClauseIndex := 11467, coreClauseIndex := 38664, terminalClauseIndex := 2610362, datum := { row := ⟨8, {0, 3, 4, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11468; core 38665; terminal 2610363
  { outputClauseIndex := 11468, coreClauseIndex := 38665, terminalClauseIndex := 2610363, datum := { row := ⟨8, {0, 3, 4, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11470; core 38675; terminal 2610376
  { outputClauseIndex := 11470, coreClauseIndex := 38675, terminalClauseIndex := 2610376, datum := { row := ⟨8, {0, 3, 5, 7}⟩, arc := ⟨8, .left, {3, 4}⟩ } },
  -- compact 11471; core 38676; terminal 2610377
  { outputClauseIndex := 11471, coreClauseIndex := 38676, terminalClauseIndex := 2610377, datum := { row := ⟨8, {0, 3, 5, 7}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
  -- compact 11473; core 38682; terminal 2610383
  { outputClauseIndex := 11473, coreClauseIndex := 38682, terminalClauseIndex := 2610383, datum := { row := ⟨8, {0, 3, 5, 9}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11474; core 38683; terminal 2610384
  { outputClauseIndex := 11474, coreClauseIndex := 38683, terminalClauseIndex := 2610384, datum := { row := ⟨8, {0, 3, 5, 9}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11476; core 38689; terminal 2610390
  { outputClauseIndex := 11476, coreClauseIndex := 38689, terminalClauseIndex := 2610390, datum := { row := ⟨8, {0, 3, 5, 10}⟩, arc := ⟨8, .left, {3, 4, 5, 6}⟩ } },
  -- compact 11477; core 38690; terminal 2610391
  { outputClauseIndex := 11477, coreClauseIndex := 38690, terminalClauseIndex := 2610391, datum := { row := ⟨8, {0, 3, 5, 10}⟩, arc := ⟨8, .right, {0, 1}⟩ } },
  -- compact 11479; core 38696; terminal 2610397
  { outputClauseIndex := 11479, coreClauseIndex := 38696, terminalClauseIndex := 2610397, datum := { row := ⟨8, {0, 3, 6, 7}⟩, arc := ⟨8, .left, {3}⟩ } },
  -- compact 11480; core 38697; terminal 2610398
  { outputClauseIndex := 11480, coreClauseIndex := 38697, terminalClauseIndex := 2610398, datum := { row := ⟨8, {0, 3, 6, 7}⟩, arc := ⟨8, .right, {0, 1, 8, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk016_batch_valid :
    directRowArcFiniteOccurrencesChunk016.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk016, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk016 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk016.map (·.datum)

theorem directRowArcFiniteDataChunk016_batch_valid :
    directRowArcFiniteDataChunk016.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk016, datum.Valid := by
  rw [directRowArcFiniteDataChunk016]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk016_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk016_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
