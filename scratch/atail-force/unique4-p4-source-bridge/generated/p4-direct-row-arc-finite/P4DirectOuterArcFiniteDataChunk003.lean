/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk003 : List DirectRowArcFiniteOccurrence := [
  -- compact 8893; core 31352; terminal 2601347
  { outputClauseIndex := 8893, coreClauseIndex := 31352, terminalClauseIndex := 2601347, datum := { row := ⟨2, {0, 1, 8, 9}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8895; core 31357; terminal 2601353
  { outputClauseIndex := 8895, coreClauseIndex := 31357, terminalClauseIndex := 2601353, datum := { row := ⟨2, {0, 1, 8, 10}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8896; core 31358; terminal 2601354
  { outputClauseIndex := 8896, coreClauseIndex := 31358, terminalClauseIndex := 2601354, datum := { row := ⟨2, {0, 1, 8, 10}⟩, arc := ⟨2, .right, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8898; core 31363; terminal 2601360
  { outputClauseIndex := 8898, coreClauseIndex := 31363, terminalClauseIndex := 2601360, datum := { row := ⟨2, {0, 1, 9, 10}⟩, arc := ⟨2, .left, {9}⟩ } },
  -- compact 8899; core 31364; terminal 2601361
  { outputClauseIndex := 8899, coreClauseIndex := 31364, terminalClauseIndex := 2601361, datum := { row := ⟨2, {0, 1, 9, 10}⟩, arc := ⟨2, .right, {1, 2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8900; core 31368; terminal 2601367
  { outputClauseIndex := 8900, coreClauseIndex := 31368, terminalClauseIndex := 2601367, datum := { row := ⟨2, {0, 3, 4, 5}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 8901; core 31369; terminal 2601368
  { outputClauseIndex := 8901, coreClauseIndex := 31369, terminalClauseIndex := 2601368, datum := { row := ⟨2, {0, 3, 4, 5}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 8902; core 31374; terminal 2601374
  { outputClauseIndex := 8902, coreClauseIndex := 31374, terminalClauseIndex := 2601374, datum := { row := ⟨2, {0, 3, 4, 6}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 8903; core 31379; terminal 2601381
  { outputClauseIndex := 8903, coreClauseIndex := 31379, terminalClauseIndex := 2601381, datum := { row := ⟨2, {0, 3, 4, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 8904; core 31384; terminal 2601388
  { outputClauseIndex := 8904, coreClauseIndex := 31384, terminalClauseIndex := 2601388, datum := { row := ⟨2, {0, 3, 4, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 8905; core 31389; terminal 2601395
  { outputClauseIndex := 8905, coreClauseIndex := 31389, terminalClauseIndex := 2601395, datum := { row := ⟨2, {0, 3, 4, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8906; core 31394; terminal 2601402
  { outputClauseIndex := 8906, coreClauseIndex := 31394, terminalClauseIndex := 2601402, datum := { row := ⟨2, {0, 3, 4, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8908; core 31404; terminal 2601416
  { outputClauseIndex := 8908, coreClauseIndex := 31404, terminalClauseIndex := 2601416, datum := { row := ⟨2, {0, 3, 5, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 8909; core 31405; terminal 2601417
  { outputClauseIndex := 8909, coreClauseIndex := 31405, terminalClauseIndex := 2601417, datum := { row := ⟨2, {0, 3, 5, 7}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8911; core 31411; terminal 2601423
  { outputClauseIndex := 8911, coreClauseIndex := 31411, terminalClauseIndex := 2601423, datum := { row := ⟨2, {0, 3, 5, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 8912; core 31412; terminal 2601424
  { outputClauseIndex := 8912, coreClauseIndex := 31412, terminalClauseIndex := 2601424, datum := { row := ⟨2, {0, 3, 5, 8}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8914; core 31418; terminal 2601430
  { outputClauseIndex := 8914, coreClauseIndex := 31418, terminalClauseIndex := 2601430, datum := { row := ⟨2, {0, 3, 5, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8915; core 31419; terminal 2601431
  { outputClauseIndex := 8915, coreClauseIndex := 31419, terminalClauseIndex := 2601431, datum := { row := ⟨2, {0, 3, 5, 9}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8917; core 31425; terminal 2601437
  { outputClauseIndex := 8917, coreClauseIndex := 31425, terminalClauseIndex := 2601437, datum := { row := ⟨2, {0, 3, 5, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8918; core 31426; terminal 2601438
  { outputClauseIndex := 8918, coreClauseIndex := 31426, terminalClauseIndex := 2601438, datum := { row := ⟨2, {0, 3, 5, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8920; core 31432; terminal 2601444
  { outputClauseIndex := 8920, coreClauseIndex := 31432, terminalClauseIndex := 2601444, datum := { row := ⟨2, {0, 3, 6, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 8921; core 31433; terminal 2601445
  { outputClauseIndex := 8921, coreClauseIndex := 31433, terminalClauseIndex := 2601445, datum := { row := ⟨2, {0, 3, 6, 7}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8923; core 31439; terminal 2601451
  { outputClauseIndex := 8923, coreClauseIndex := 31439, terminalClauseIndex := 2601451, datum := { row := ⟨2, {0, 3, 6, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 8924; core 31440; terminal 2601452
  { outputClauseIndex := 8924, coreClauseIndex := 31440, terminalClauseIndex := 2601452, datum := { row := ⟨2, {0, 3, 6, 8}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8926; core 31446; terminal 2601458
  { outputClauseIndex := 8926, coreClauseIndex := 31446, terminalClauseIndex := 2601458, datum := { row := ⟨2, {0, 3, 6, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8927; core 31447; terminal 2601459
  { outputClauseIndex := 8927, coreClauseIndex := 31447, terminalClauseIndex := 2601459, datum := { row := ⟨2, {0, 3, 6, 9}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8929; core 31453; terminal 2601465
  { outputClauseIndex := 8929, coreClauseIndex := 31453, terminalClauseIndex := 2601465, datum := { row := ⟨2, {0, 3, 6, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8930; core 31454; terminal 2601466
  { outputClauseIndex := 8930, coreClauseIndex := 31454, terminalClauseIndex := 2601466, datum := { row := ⟨2, {0, 3, 6, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8932; core 31460; terminal 2601472
  { outputClauseIndex := 8932, coreClauseIndex := 31460, terminalClauseIndex := 2601472, datum := { row := ⟨2, {0, 3, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 8933; core 31461; terminal 2601473
  { outputClauseIndex := 8933, coreClauseIndex := 31461, terminalClauseIndex := 2601473, datum := { row := ⟨2, {0, 3, 7, 8}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8935; core 31467; terminal 2601479
  { outputClauseIndex := 8935, coreClauseIndex := 31467, terminalClauseIndex := 2601479, datum := { row := ⟨2, {0, 3, 7, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8936; core 31468; terminal 2601480
  { outputClauseIndex := 8936, coreClauseIndex := 31468, terminalClauseIndex := 2601480, datum := { row := ⟨2, {0, 3, 7, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8938; core 31474; terminal 2601486
  { outputClauseIndex := 8938, coreClauseIndex := 31474, terminalClauseIndex := 2601486, datum := { row := ⟨2, {0, 3, 7, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8939; core 31475; terminal 2601487
  { outputClauseIndex := 8939, coreClauseIndex := 31475, terminalClauseIndex := 2601487, datum := { row := ⟨2, {0, 3, 7, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8941; core 31481; terminal 2601493
  { outputClauseIndex := 8941, coreClauseIndex := 31481, terminalClauseIndex := 2601493, datum := { row := ⟨2, {0, 3, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8942; core 31482; terminal 2601494
  { outputClauseIndex := 8942, coreClauseIndex := 31482, terminalClauseIndex := 2601494, datum := { row := ⟨2, {0, 3, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 8944; core 31488; terminal 2601500
  { outputClauseIndex := 8944, coreClauseIndex := 31488, terminalClauseIndex := 2601500, datum := { row := ⟨2, {0, 3, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8945; core 31489; terminal 2601501
  { outputClauseIndex := 8945, coreClauseIndex := 31489, terminalClauseIndex := 2601501, datum := { row := ⟨2, {0, 3, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 8947; core 31495; terminal 2601507
  { outputClauseIndex := 8947, coreClauseIndex := 31495, terminalClauseIndex := 2601507, datum := { row := ⟨2, {0, 3, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8948; core 31496; terminal 2601508
  { outputClauseIndex := 8948, coreClauseIndex := 31496, terminalClauseIndex := 2601508, datum := { row := ⟨2, {0, 3, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8950; core 31505; terminal 2601521
  { outputClauseIndex := 8950, coreClauseIndex := 31505, terminalClauseIndex := 2601521, datum := { row := ⟨2, {0, 4, 5, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 8951; core 31506; terminal 2601522
  { outputClauseIndex := 8951, coreClauseIndex := 31506, terminalClauseIndex := 2601522, datum := { row := ⟨2, {0, 4, 5, 7}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8953; core 31512; terminal 2601528
  { outputClauseIndex := 8953, coreClauseIndex := 31512, terminalClauseIndex := 2601528, datum := { row := ⟨2, {0, 4, 5, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 8954; core 31513; terminal 2601529
  { outputClauseIndex := 8954, coreClauseIndex := 31513, terminalClauseIndex := 2601529, datum := { row := ⟨2, {0, 4, 5, 8}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8956; core 31519; terminal 2601535
  { outputClauseIndex := 8956, coreClauseIndex := 31519, terminalClauseIndex := 2601535, datum := { row := ⟨2, {0, 4, 5, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8957; core 31520; terminal 2601536
  { outputClauseIndex := 8957, coreClauseIndex := 31520, terminalClauseIndex := 2601536, datum := { row := ⟨2, {0, 4, 5, 9}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8959; core 31526; terminal 2601542
  { outputClauseIndex := 8959, coreClauseIndex := 31526, terminalClauseIndex := 2601542, datum := { row := ⟨2, {0, 4, 5, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8960; core 31527; terminal 2601543
  { outputClauseIndex := 8960, coreClauseIndex := 31527, terminalClauseIndex := 2601543, datum := { row := ⟨2, {0, 4, 5, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 8962; core 31533; terminal 2601549
  { outputClauseIndex := 8962, coreClauseIndex := 31533, terminalClauseIndex := 2601549, datum := { row := ⟨2, {0, 4, 6, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 8963; core 31534; terminal 2601550
  { outputClauseIndex := 8963, coreClauseIndex := 31534, terminalClauseIndex := 2601550, datum := { row := ⟨2, {0, 4, 6, 7}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8965; core 31540; terminal 2601556
  { outputClauseIndex := 8965, coreClauseIndex := 31540, terminalClauseIndex := 2601556, datum := { row := ⟨2, {0, 4, 6, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 8966; core 31541; terminal 2601557
  { outputClauseIndex := 8966, coreClauseIndex := 31541, terminalClauseIndex := 2601557, datum := { row := ⟨2, {0, 4, 6, 8}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8968; core 31547; terminal 2601563
  { outputClauseIndex := 8968, coreClauseIndex := 31547, terminalClauseIndex := 2601563, datum := { row := ⟨2, {0, 4, 6, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8969; core 31548; terminal 2601564
  { outputClauseIndex := 8969, coreClauseIndex := 31548, terminalClauseIndex := 2601564, datum := { row := ⟨2, {0, 4, 6, 9}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8971; core 31554; terminal 2601570
  { outputClauseIndex := 8971, coreClauseIndex := 31554, terminalClauseIndex := 2601570, datum := { row := ⟨2, {0, 4, 6, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8972; core 31555; terminal 2601571
  { outputClauseIndex := 8972, coreClauseIndex := 31555, terminalClauseIndex := 2601571, datum := { row := ⟨2, {0, 4, 6, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 8974; core 31561; terminal 2601577
  { outputClauseIndex := 8974, coreClauseIndex := 31561, terminalClauseIndex := 2601577, datum := { row := ⟨2, {0, 4, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 8975; core 31562; terminal 2601578
  { outputClauseIndex := 8975, coreClauseIndex := 31562, terminalClauseIndex := 2601578, datum := { row := ⟨2, {0, 4, 7, 8}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8977; core 31568; terminal 2601584
  { outputClauseIndex := 8977, coreClauseIndex := 31568, terminalClauseIndex := 2601584, datum := { row := ⟨2, {0, 4, 7, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8978; core 31569; terminal 2601585
  { outputClauseIndex := 8978, coreClauseIndex := 31569, terminalClauseIndex := 2601585, datum := { row := ⟨2, {0, 4, 7, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8980; core 31575; terminal 2601591
  { outputClauseIndex := 8980, coreClauseIndex := 31575, terminalClauseIndex := 2601591, datum := { row := ⟨2, {0, 4, 7, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8981; core 31576; terminal 2601592
  { outputClauseIndex := 8981, coreClauseIndex := 31576, terminalClauseIndex := 2601592, datum := { row := ⟨2, {0, 4, 7, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8983; core 31582; terminal 2601598
  { outputClauseIndex := 8983, coreClauseIndex := 31582, terminalClauseIndex := 2601598, datum := { row := ⟨2, {0, 4, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8984; core 31583; terminal 2601599
  { outputClauseIndex := 8984, coreClauseIndex := 31583, terminalClauseIndex := 2601599, datum := { row := ⟨2, {0, 4, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 8986; core 31589; terminal 2601605
  { outputClauseIndex := 8986, coreClauseIndex := 31589, terminalClauseIndex := 2601605, datum := { row := ⟨2, {0, 4, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8987; core 31590; terminal 2601606
  { outputClauseIndex := 8987, coreClauseIndex := 31590, terminalClauseIndex := 2601606, datum := { row := ⟨2, {0, 4, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 8989; core 31596; terminal 2601612
  { outputClauseIndex := 8989, coreClauseIndex := 31596, terminalClauseIndex := 2601612, datum := { row := ⟨2, {0, 4, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8990; core 31597; terminal 2601613
  { outputClauseIndex := 8990, coreClauseIndex := 31597, terminalClauseIndex := 2601613, datum := { row := ⟨2, {0, 4, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 8991; core 31601; terminal 2601619
  { outputClauseIndex := 8991, coreClauseIndex := 31601, terminalClauseIndex := 2601619, datum := { row := ⟨2, {0, 5, 6, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 8992; core 31605; terminal 2601626
  { outputClauseIndex := 8992, coreClauseIndex := 31605, terminalClauseIndex := 2601626, datum := { row := ⟨2, {0, 5, 6, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 8993; core 31610; terminal 2601633
  { outputClauseIndex := 8993, coreClauseIndex := 31610, terminalClauseIndex := 2601633, datum := { row := ⟨2, {0, 5, 6, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 8994; core 31615; terminal 2601640
  { outputClauseIndex := 8994, coreClauseIndex := 31615, terminalClauseIndex := 2601640, datum := { row := ⟨2, {0, 5, 6, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 8996; core 31621; terminal 2601647
  { outputClauseIndex := 8996, coreClauseIndex := 31621, terminalClauseIndex := 2601647, datum := { row := ⟨2, {0, 5, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 8997; core 31622; terminal 2601648
  { outputClauseIndex := 8997, coreClauseIndex := 31622, terminalClauseIndex := 2601648, datum := { row := ⟨2, {0, 5, 7, 8}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 8999; core 31628; terminal 2601654
  { outputClauseIndex := 8999, coreClauseIndex := 31628, terminalClauseIndex := 2601654, datum := { row := ⟨2, {0, 5, 7, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9000; core 31629; terminal 2601655
  { outputClauseIndex := 9000, coreClauseIndex := 31629, terminalClauseIndex := 2601655, datum := { row := ⟨2, {0, 5, 7, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9002; core 31635; terminal 2601661
  { outputClauseIndex := 9002, coreClauseIndex := 31635, terminalClauseIndex := 2601661, datum := { row := ⟨2, {0, 5, 7, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9003; core 31636; terminal 2601662
  { outputClauseIndex := 9003, coreClauseIndex := 31636, terminalClauseIndex := 2601662, datum := { row := ⟨2, {0, 5, 7, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9005; core 31642; terminal 2601668
  { outputClauseIndex := 9005, coreClauseIndex := 31642, terminalClauseIndex := 2601668, datum := { row := ⟨2, {0, 5, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9006; core 31643; terminal 2601669
  { outputClauseIndex := 9006, coreClauseIndex := 31643, terminalClauseIndex := 2601669, datum := { row := ⟨2, {0, 5, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9008; core 31649; terminal 2601675
  { outputClauseIndex := 9008, coreClauseIndex := 31649, terminalClauseIndex := 2601675, datum := { row := ⟨2, {0, 5, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9009; core 31650; terminal 2601676
  { outputClauseIndex := 9009, coreClauseIndex := 31650, terminalClauseIndex := 2601676, datum := { row := ⟨2, {0, 5, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9011; core 31656; terminal 2601682
  { outputClauseIndex := 9011, coreClauseIndex := 31656, terminalClauseIndex := 2601682, datum := { row := ⟨2, {0, 5, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9012; core 31657; terminal 2601683
  { outputClauseIndex := 9012, coreClauseIndex := 31657, terminalClauseIndex := 2601683, datum := { row := ⟨2, {0, 5, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9014; core 31663; terminal 2601689
  { outputClauseIndex := 9014, coreClauseIndex := 31663, terminalClauseIndex := 2601689, datum := { row := ⟨2, {0, 6, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9015; core 31664; terminal 2601690
  { outputClauseIndex := 9015, coreClauseIndex := 31664, terminalClauseIndex := 2601690, datum := { row := ⟨2, {0, 6, 7, 8}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9017; core 31670; terminal 2601696
  { outputClauseIndex := 9017, coreClauseIndex := 31670, terminalClauseIndex := 2601696, datum := { row := ⟨2, {0, 6, 7, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9018; core 31671; terminal 2601697
  { outputClauseIndex := 9018, coreClauseIndex := 31671, terminalClauseIndex := 2601697, datum := { row := ⟨2, {0, 6, 7, 9}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9020; core 31677; terminal 2601703
  { outputClauseIndex := 9020, coreClauseIndex := 31677, terminalClauseIndex := 2601703, datum := { row := ⟨2, {0, 6, 7, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9021; core 31678; terminal 2601704
  { outputClauseIndex := 9021, coreClauseIndex := 31678, terminalClauseIndex := 2601704, datum := { row := ⟨2, {0, 6, 7, 10}⟩, arc := ⟨2, .right, {4, 5, 6, 7}⟩ } },
  -- compact 9023; core 31684; terminal 2601710
  { outputClauseIndex := 9023, coreClauseIndex := 31684, terminalClauseIndex := 2601710, datum := { row := ⟨2, {0, 6, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9024; core 31685; terminal 2601711
  { outputClauseIndex := 9024, coreClauseIndex := 31685, terminalClauseIndex := 2601711, datum := { row := ⟨2, {0, 6, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9026; core 31691; terminal 2601717
  { outputClauseIndex := 9026, coreClauseIndex := 31691, terminalClauseIndex := 2601717, datum := { row := ⟨2, {0, 6, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9027; core 31692; terminal 2601718
  { outputClauseIndex := 9027, coreClauseIndex := 31692, terminalClauseIndex := 2601718, datum := { row := ⟨2, {0, 6, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9029; core 31698; terminal 2601724
  { outputClauseIndex := 9029, coreClauseIndex := 31698, terminalClauseIndex := 2601724, datum := { row := ⟨2, {0, 6, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9030; core 31699; terminal 2601725
  { outputClauseIndex := 9030, coreClauseIndex := 31699, terminalClauseIndex := 2601725, datum := { row := ⟨2, {0, 6, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9032; core 31705; terminal 2601731
  { outputClauseIndex := 9032, coreClauseIndex := 31705, terminalClauseIndex := 2601731, datum := { row := ⟨2, {0, 7, 8, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9033; core 31706; terminal 2601732
  { outputClauseIndex := 9033, coreClauseIndex := 31706, terminalClauseIndex := 2601732, datum := { row := ⟨2, {0, 7, 8, 9}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9035; core 31712; terminal 2601738
  { outputClauseIndex := 9035, coreClauseIndex := 31712, terminalClauseIndex := 2601738, datum := { row := ⟨2, {0, 7, 8, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9036; core 31713; terminal 2601739
  { outputClauseIndex := 9036, coreClauseIndex := 31713, terminalClauseIndex := 2601739, datum := { row := ⟨2, {0, 7, 8, 10}⟩, arc := ⟨2, .right, {3, 4, 5, 6, 7}⟩ } },
  -- compact 9038; core 31719; terminal 2601745
  { outputClauseIndex := 9038, coreClauseIndex := 31719, terminalClauseIndex := 2601745, datum := { row := ⟨2, {0, 7, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9039; core 31720; terminal 2601746
  { outputClauseIndex := 9039, coreClauseIndex := 31720, terminalClauseIndex := 2601746, datum := { row := ⟨2, {0, 7, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9041; core 31726; terminal 2601752
  { outputClauseIndex := 9041, coreClauseIndex := 31726, terminalClauseIndex := 2601752, datum := { row := ⟨2, {0, 8, 9, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9042; core 31727; terminal 2601753
  { outputClauseIndex := 9042, coreClauseIndex := 31727, terminalClauseIndex := 2601753, datum := { row := ⟨2, {0, 8, 9, 10}⟩, arc := ⟨2, .right, {2, 3, 4, 5, 6, 7}⟩ } },
  -- compact 9043; core 31731; terminal 2601759
  { outputClauseIndex := 9043, coreClauseIndex := 31731, terminalClauseIndex := 2601759, datum := { row := ⟨2, {1, 3, 4, 5}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 4, 9, 10}⟩ } },
  -- compact 9044; core 31732; terminal 2601760
  { outputClauseIndex := 9044, coreClauseIndex := 31732, terminalClauseIndex := 2601760, datum := { row := ⟨2, {1, 3, 4, 5}⟩, arc := ⟨2, .right, {7}⟩ } },
  -- compact 9045; core 31737; terminal 2601766
  { outputClauseIndex := 9045, coreClauseIndex := 31737, terminalClauseIndex := 2601766, datum := { row := ⟨2, {1, 3, 4, 6}⟩, arc := ⟨2, .left, {0, 1, 2, 3, 9, 10}⟩ } },
  -- compact 9046; core 31742; terminal 2601773
  { outputClauseIndex := 9046, coreClauseIndex := 31742, terminalClauseIndex := 2601773, datum := { row := ⟨2, {1, 3, 4, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9047; core 31747; terminal 2601780
  { outputClauseIndex := 9047, coreClauseIndex := 31747, terminalClauseIndex := 2601780, datum := { row := ⟨2, {1, 3, 4, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9048; core 31752; terminal 2601787
  { outputClauseIndex := 9048, coreClauseIndex := 31752, terminalClauseIndex := 2601787, datum := { row := ⟨2, {1, 3, 4, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9049; core 31757; terminal 2601794
  { outputClauseIndex := 9049, coreClauseIndex := 31757, terminalClauseIndex := 2601794, datum := { row := ⟨2, {1, 3, 4, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9051; core 31767; terminal 2601808
  { outputClauseIndex := 9051, coreClauseIndex := 31767, terminalClauseIndex := 2601808, datum := { row := ⟨2, {1, 3, 5, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9052; core 31768; terminal 2601809
  { outputClauseIndex := 9052, coreClauseIndex := 31768, terminalClauseIndex := 2601809, datum := { row := ⟨2, {1, 3, 5, 7}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9054; core 31774; terminal 2601815
  { outputClauseIndex := 9054, coreClauseIndex := 31774, terminalClauseIndex := 2601815, datum := { row := ⟨2, {1, 3, 5, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9055; core 31775; terminal 2601816
  { outputClauseIndex := 9055, coreClauseIndex := 31775, terminalClauseIndex := 2601816, datum := { row := ⟨2, {1, 3, 5, 8}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9057; core 31781; terminal 2601822
  { outputClauseIndex := 9057, coreClauseIndex := 31781, terminalClauseIndex := 2601822, datum := { row := ⟨2, {1, 3, 5, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9058; core 31782; terminal 2601823
  { outputClauseIndex := 9058, coreClauseIndex := 31782, terminalClauseIndex := 2601823, datum := { row := ⟨2, {1, 3, 5, 9}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9060; core 31788; terminal 2601829
  { outputClauseIndex := 9060, coreClauseIndex := 31788, terminalClauseIndex := 2601829, datum := { row := ⟨2, {1, 3, 5, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9061; core 31789; terminal 2601830
  { outputClauseIndex := 9061, coreClauseIndex := 31789, terminalClauseIndex := 2601830, datum := { row := ⟨2, {1, 3, 5, 10}⟩, arc := ⟨2, .right, {6, 7}⟩ } },
  -- compact 9063; core 31795; terminal 2601836
  { outputClauseIndex := 9063, coreClauseIndex := 31795, terminalClauseIndex := 2601836, datum := { row := ⟨2, {1, 3, 6, 7}⟩, arc := ⟨2, .left, {0, 1, 2, 9, 10}⟩ } },
  -- compact 9064; core 31796; terminal 2601837
  { outputClauseIndex := 9064, coreClauseIndex := 31796, terminalClauseIndex := 2601837, datum := { row := ⟨2, {1, 3, 6, 7}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9066; core 31802; terminal 2601843
  { outputClauseIndex := 9066, coreClauseIndex := 31802, terminalClauseIndex := 2601843, datum := { row := ⟨2, {1, 3, 6, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
  -- compact 9067; core 31803; terminal 2601844
  { outputClauseIndex := 9067, coreClauseIndex := 31803, terminalClauseIndex := 2601844, datum := { row := ⟨2, {1, 3, 6, 8}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9069; core 31809; terminal 2601850
  { outputClauseIndex := 9069, coreClauseIndex := 31809, terminalClauseIndex := 2601850, datum := { row := ⟨2, {1, 3, 6, 9}⟩, arc := ⟨2, .left, {0, 9, 10}⟩ } },
  -- compact 9070; core 31810; terminal 2601851
  { outputClauseIndex := 9070, coreClauseIndex := 31810, terminalClauseIndex := 2601851, datum := { row := ⟨2, {1, 3, 6, 9}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9072; core 31816; terminal 2601857
  { outputClauseIndex := 9072, coreClauseIndex := 31816, terminalClauseIndex := 2601857, datum := { row := ⟨2, {1, 3, 6, 10}⟩, arc := ⟨2, .left, {9, 10}⟩ } },
  -- compact 9073; core 31817; terminal 2601858
  { outputClauseIndex := 9073, coreClauseIndex := 31817, terminalClauseIndex := 2601858, datum := { row := ⟨2, {1, 3, 6, 10}⟩, arc := ⟨2, .right, {5, 6, 7}⟩ } },
  -- compact 9075; core 31823; terminal 2601864
  { outputClauseIndex := 9075, coreClauseIndex := 31823, terminalClauseIndex := 2601864, datum := { row := ⟨2, {1, 3, 7, 8}⟩, arc := ⟨2, .left, {0, 1, 9, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk003_batch_valid :
    directRowArcFiniteOccurrencesChunk003.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk003, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk003 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk003.map (·.datum)

theorem directRowArcFiniteDataChunk003_batch_valid :
    directRowArcFiniteDataChunk003.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk003, datum.Valid := by
  rw [directRowArcFiniteDataChunk003]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk003_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk003_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
