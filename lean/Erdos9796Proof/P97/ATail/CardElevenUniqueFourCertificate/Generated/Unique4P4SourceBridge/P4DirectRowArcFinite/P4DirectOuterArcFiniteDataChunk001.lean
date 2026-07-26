/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcFinite

/-! Generated bounded finite-data chunk by materialize_p4_direct_row_arc_finite.py. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteOccurrencesChunk001 : List DirectRowArcFiniteOccurrence := [
  -- compact 8582; core 30438; terminal 2600191
  { outputClauseIndex := 8582, coreClauseIndex := 30438, terminalClauseIndex := 2600191, datum := { row := ⟨1, {0, 5, 7, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8584; core 30444; terminal 2600198
  { outputClauseIndex := 8584, coreClauseIndex := 30444, terminalClauseIndex := 2600198, datum := { row := ⟨1, {0, 5, 8, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8586; core 30450; terminal 2600205
  { outputClauseIndex := 8586, coreClauseIndex := 30450, terminalClauseIndex := 2600205, datum := { row := ⟨1, {0, 5, 8, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8588; core 30456; terminal 2600212
  { outputClauseIndex := 8588, coreClauseIndex := 30456, terminalClauseIndex := 2600212, datum := { row := ⟨1, {0, 5, 9, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8590; core 30462; terminal 2600219
  { outputClauseIndex := 8590, coreClauseIndex := 30462, terminalClauseIndex := 2600219, datum := { row := ⟨1, {0, 6, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8592; core 30468; terminal 2600226
  { outputClauseIndex := 8592, coreClauseIndex := 30468, terminalClauseIndex := 2600226, datum := { row := ⟨1, {0, 6, 7, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8593; core 30473; terminal 2600233
  { outputClauseIndex := 8593, coreClauseIndex := 30473, terminalClauseIndex := 2600233, datum := { row := ⟨1, {0, 6, 7, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8594; core 30478; terminal 2600240
  { outputClauseIndex := 8594, coreClauseIndex := 30478, terminalClauseIndex := 2600240, datum := { row := ⟨1, {0, 6, 8, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8595; core 30483; terminal 2600247
  { outputClauseIndex := 8595, coreClauseIndex := 30483, terminalClauseIndex := 2600247, datum := { row := ⟨1, {0, 6, 8, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8596; core 30488; terminal 2600254
  { outputClauseIndex := 8596, coreClauseIndex := 30488, terminalClauseIndex := 2600254, datum := { row := ⟨1, {0, 6, 9, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8598; core 30494; terminal 2600261
  { outputClauseIndex := 8598, coreClauseIndex := 30494, terminalClauseIndex := 2600261, datum := { row := ⟨1, {0, 7, 8, 9}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8600; core 30500; terminal 2600268
  { outputClauseIndex := 8600, coreClauseIndex := 30500, terminalClauseIndex := 2600268, datum := { row := ⟨1, {0, 7, 8, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8601; core 30505; terminal 2600275
  { outputClauseIndex := 8601, coreClauseIndex := 30505, terminalClauseIndex := 2600275, datum := { row := ⟨1, {0, 7, 9, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8602; core 30510; terminal 2600282
  { outputClauseIndex := 8602, coreClauseIndex := 30510, terminalClauseIndex := 2600282, datum := { row := ⟨1, {0, 8, 9, 10}⟩, arc := ⟨1, .left, {10}⟩ } },
  -- compact 8603; core 30513; terminal 2600290
  { outputClauseIndex := 8603, coreClauseIndex := 30513, terminalClauseIndex := 2600290, datum := { row := ⟨1, {2, 3, 4, 5}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8604; core 30516; terminal 2600297
  { outputClauseIndex := 8604, coreClauseIndex := 30516, terminalClauseIndex := 2600297, datum := { row := ⟨1, {2, 3, 4, 6}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8605; core 30519; terminal 2600304
  { outputClauseIndex := 8605, coreClauseIndex := 30519, terminalClauseIndex := 2600304, datum := { row := ⟨1, {2, 3, 4, 7}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8606; core 30522; terminal 2600311
  { outputClauseIndex := 8606, coreClauseIndex := 30522, terminalClauseIndex := 2600311, datum := { row := ⟨1, {2, 3, 4, 8}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8607; core 30525; terminal 2600318
  { outputClauseIndex := 8607, coreClauseIndex := 30525, terminalClauseIndex := 2600318, datum := { row := ⟨1, {2, 3, 4, 9}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8608; core 30528; terminal 2600325
  { outputClauseIndex := 8608, coreClauseIndex := 30528, terminalClauseIndex := 2600325, datum := { row := ⟨1, {2, 3, 4, 10}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8609; core 30533; terminal 2600332
  { outputClauseIndex := 8609, coreClauseIndex := 30533, terminalClauseIndex := 2600332, datum := { row := ⟨1, {2, 3, 5, 6}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8610; core 30537; terminal 2600338
  { outputClauseIndex := 8610, coreClauseIndex := 30537, terminalClauseIndex := 2600338, datum := { row := ⟨1, {2, 3, 5, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8611; core 30538; terminal 2600339
  { outputClauseIndex := 8611, coreClauseIndex := 30538, terminalClauseIndex := 2600339, datum := { row := ⟨1, {2, 3, 5, 7}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8613; core 30544; terminal 2600345
  { outputClauseIndex := 8613, coreClauseIndex := 30544, terminalClauseIndex := 2600345, datum := { row := ⟨1, {2, 3, 5, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8614; core 30545; terminal 2600346
  { outputClauseIndex := 8614, coreClauseIndex := 30545, terminalClauseIndex := 2600346, datum := { row := ⟨1, {2, 3, 5, 8}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8615; core 30549; terminal 2600352
  { outputClauseIndex := 8615, coreClauseIndex := 30549, terminalClauseIndex := 2600352, datum := { row := ⟨1, {2, 3, 5, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8616; core 30550; terminal 2600353
  { outputClauseIndex := 8616, coreClauseIndex := 30550, terminalClauseIndex := 2600353, datum := { row := ⟨1, {2, 3, 5, 9}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8617; core 30555; terminal 2600359
  { outputClauseIndex := 8617, coreClauseIndex := 30555, terminalClauseIndex := 2600359, datum := { row := ⟨1, {2, 3, 5, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8618; core 30556; terminal 2600360
  { outputClauseIndex := 8618, coreClauseIndex := 30556, terminalClauseIndex := 2600360, datum := { row := ⟨1, {2, 3, 5, 10}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8619; core 30560; terminal 2600366
  { outputClauseIndex := 8619, coreClauseIndex := 30560, terminalClauseIndex := 2600366, datum := { row := ⟨1, {2, 3, 6, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8620; core 30561; terminal 2600367
  { outputClauseIndex := 8620, coreClauseIndex := 30561, terminalClauseIndex := 2600367, datum := { row := ⟨1, {2, 3, 6, 7}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8621; core 30566; terminal 2600373
  { outputClauseIndex := 8621, coreClauseIndex := 30566, terminalClauseIndex := 2600373, datum := { row := ⟨1, {2, 3, 6, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8622; core 30567; terminal 2600374
  { outputClauseIndex := 8622, coreClauseIndex := 30567, terminalClauseIndex := 2600374, datum := { row := ⟨1, {2, 3, 6, 8}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8623; core 30571; terminal 2600380
  { outputClauseIndex := 8623, coreClauseIndex := 30571, terminalClauseIndex := 2600380, datum := { row := ⟨1, {2, 3, 6, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8624; core 30572; terminal 2600381
  { outputClauseIndex := 8624, coreClauseIndex := 30572, terminalClauseIndex := 2600381, datum := { row := ⟨1, {2, 3, 6, 9}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8625; core 30577; terminal 2600387
  { outputClauseIndex := 8625, coreClauseIndex := 30577, terminalClauseIndex := 2600387, datum := { row := ⟨1, {2, 3, 6, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8626; core 30578; terminal 2600388
  { outputClauseIndex := 8626, coreClauseIndex := 30578, terminalClauseIndex := 2600388, datum := { row := ⟨1, {2, 3, 6, 10}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8627; core 30583; terminal 2600394
  { outputClauseIndex := 8627, coreClauseIndex := 30583, terminalClauseIndex := 2600394, datum := { row := ⟨1, {2, 3, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8628; core 30584; terminal 2600395
  { outputClauseIndex := 8628, coreClauseIndex := 30584, terminalClauseIndex := 2600395, datum := { row := ⟨1, {2, 3, 7, 8}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8629; core 30589; terminal 2600401
  { outputClauseIndex := 8629, coreClauseIndex := 30589, terminalClauseIndex := 2600401, datum := { row := ⟨1, {2, 3, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8630; core 30590; terminal 2600402
  { outputClauseIndex := 8630, coreClauseIndex := 30590, terminalClauseIndex := 2600402, datum := { row := ⟨1, {2, 3, 7, 9}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8631; core 30595; terminal 2600408
  { outputClauseIndex := 8631, coreClauseIndex := 30595, terminalClauseIndex := 2600408, datum := { row := ⟨1, {2, 3, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8632; core 30596; terminal 2600409
  { outputClauseIndex := 8632, coreClauseIndex := 30596, terminalClauseIndex := 2600409, datum := { row := ⟨1, {2, 3, 7, 10}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8633; core 30601; terminal 2600415
  { outputClauseIndex := 8633, coreClauseIndex := 30601, terminalClauseIndex := 2600415, datum := { row := ⟨1, {2, 3, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8634; core 30602; terminal 2600416
  { outputClauseIndex := 8634, coreClauseIndex := 30602, terminalClauseIndex := 2600416, datum := { row := ⟨1, {2, 3, 8, 9}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8635; core 30607; terminal 2600422
  { outputClauseIndex := 8635, coreClauseIndex := 30607, terminalClauseIndex := 2600422, datum := { row := ⟨1, {2, 3, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8636; core 30608; terminal 2600423
  { outputClauseIndex := 8636, coreClauseIndex := 30608, terminalClauseIndex := 2600423, datum := { row := ⟨1, {2, 3, 8, 10}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8637; core 30613; terminal 2600429
  { outputClauseIndex := 8637, coreClauseIndex := 30613, terminalClauseIndex := 2600429, datum := { row := ⟨1, {2, 3, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8638; core 30614; terminal 2600430
  { outputClauseIndex := 8638, coreClauseIndex := 30614, terminalClauseIndex := 2600430, datum := { row := ⟨1, {2, 3, 9, 10}⟩, arc := ⟨1, .right, {8}⟩ } },
  -- compact 8639; core 30619; terminal 2600437
  { outputClauseIndex := 8639, coreClauseIndex := 30619, terminalClauseIndex := 2600437, datum := { row := ⟨1, {2, 4, 5, 6}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8641; core 30624; terminal 2600443
  { outputClauseIndex := 8641, coreClauseIndex := 30624, terminalClauseIndex := 2600443, datum := { row := ⟨1, {2, 4, 5, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8642; core 30625; terminal 2600444
  { outputClauseIndex := 8642, coreClauseIndex := 30625, terminalClauseIndex := 2600444, datum := { row := ⟨1, {2, 4, 5, 7}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8643; core 30630; terminal 2600450
  { outputClauseIndex := 8643, coreClauseIndex := 30630, terminalClauseIndex := 2600450, datum := { row := ⟨1, {2, 4, 5, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8644; core 30631; terminal 2600451
  { outputClauseIndex := 8644, coreClauseIndex := 30631, terminalClauseIndex := 2600451, datum := { row := ⟨1, {2, 4, 5, 8}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8646; core 30636; terminal 2600457
  { outputClauseIndex := 8646, coreClauseIndex := 30636, terminalClauseIndex := 2600457, datum := { row := ⟨1, {2, 4, 5, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8647; core 30637; terminal 2600458
  { outputClauseIndex := 8647, coreClauseIndex := 30637, terminalClauseIndex := 2600458, datum := { row := ⟨1, {2, 4, 5, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8648; core 30642; terminal 2600464
  { outputClauseIndex := 8648, coreClauseIndex := 30642, terminalClauseIndex := 2600464, datum := { row := ⟨1, {2, 4, 5, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8649; core 30643; terminal 2600465
  { outputClauseIndex := 8649, coreClauseIndex := 30643, terminalClauseIndex := 2600465, datum := { row := ⟨1, {2, 4, 5, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8651; core 30648; terminal 2600471
  { outputClauseIndex := 8651, coreClauseIndex := 30648, terminalClauseIndex := 2600471, datum := { row := ⟨1, {2, 4, 6, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8652; core 30649; terminal 2600472
  { outputClauseIndex := 8652, coreClauseIndex := 30649, terminalClauseIndex := 2600472, datum := { row := ⟨1, {2, 4, 6, 7}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8653; core 30654; terminal 2600478
  { outputClauseIndex := 8653, coreClauseIndex := 30654, terminalClauseIndex := 2600478, datum := { row := ⟨1, {2, 4, 6, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8654; core 30655; terminal 2600479
  { outputClauseIndex := 8654, coreClauseIndex := 30655, terminalClauseIndex := 2600479, datum := { row := ⟨1, {2, 4, 6, 8}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8656; core 30660; terminal 2600485
  { outputClauseIndex := 8656, coreClauseIndex := 30660, terminalClauseIndex := 2600485, datum := { row := ⟨1, {2, 4, 6, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8657; core 30661; terminal 2600486
  { outputClauseIndex := 8657, coreClauseIndex := 30661, terminalClauseIndex := 2600486, datum := { row := ⟨1, {2, 4, 6, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8658; core 30666; terminal 2600492
  { outputClauseIndex := 8658, coreClauseIndex := 30666, terminalClauseIndex := 2600492, datum := { row := ⟨1, {2, 4, 6, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8659; core 30667; terminal 2600493
  { outputClauseIndex := 8659, coreClauseIndex := 30667, terminalClauseIndex := 2600493, datum := { row := ⟨1, {2, 4, 6, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8660; core 30672; terminal 2600499
  { outputClauseIndex := 8660, coreClauseIndex := 30672, terminalClauseIndex := 2600499, datum := { row := ⟨1, {2, 4, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8661; core 30673; terminal 2600500
  { outputClauseIndex := 8661, coreClauseIndex := 30673, terminalClauseIndex := 2600500, datum := { row := ⟨1, {2, 4, 7, 8}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8663; core 30679; terminal 2600506
  { outputClauseIndex := 8663, coreClauseIndex := 30679, terminalClauseIndex := 2600506, datum := { row := ⟨1, {2, 4, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8664; core 30680; terminal 2600507
  { outputClauseIndex := 8664, coreClauseIndex := 30680, terminalClauseIndex := 2600507, datum := { row := ⟨1, {2, 4, 7, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8665; core 30685; terminal 2600513
  { outputClauseIndex := 8665, coreClauseIndex := 30685, terminalClauseIndex := 2600513, datum := { row := ⟨1, {2, 4, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8666; core 30686; terminal 2600514
  { outputClauseIndex := 8666, coreClauseIndex := 30686, terminalClauseIndex := 2600514, datum := { row := ⟨1, {2, 4, 7, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8667; core 30691; terminal 2600520
  { outputClauseIndex := 8667, coreClauseIndex := 30691, terminalClauseIndex := 2600520, datum := { row := ⟨1, {2, 4, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8668; core 30692; terminal 2600521
  { outputClauseIndex := 8668, coreClauseIndex := 30692, terminalClauseIndex := 2600521, datum := { row := ⟨1, {2, 4, 8, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8670; core 30698; terminal 2600527
  { outputClauseIndex := 8670, coreClauseIndex := 30698, terminalClauseIndex := 2600527, datum := { row := ⟨1, {2, 4, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8671; core 30699; terminal 2600528
  { outputClauseIndex := 8671, coreClauseIndex := 30699, terminalClauseIndex := 2600528, datum := { row := ⟨1, {2, 4, 8, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8672; core 30704; terminal 2600534
  { outputClauseIndex := 8672, coreClauseIndex := 30704, terminalClauseIndex := 2600534, datum := { row := ⟨1, {2, 4, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8673; core 30705; terminal 2600535
  { outputClauseIndex := 8673, coreClauseIndex := 30705, terminalClauseIndex := 2600535, datum := { row := ⟨1, {2, 4, 9, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8674; core 30709; terminal 2600542
  { outputClauseIndex := 8674, coreClauseIndex := 30709, terminalClauseIndex := 2600542, datum := { row := ⟨1, {2, 5, 6, 7}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8675; core 30713; terminal 2600549
  { outputClauseIndex := 8675, coreClauseIndex := 30713, terminalClauseIndex := 2600549, datum := { row := ⟨1, {2, 5, 6, 8}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8676; core 30717; terminal 2600556
  { outputClauseIndex := 8676, coreClauseIndex := 30717, terminalClauseIndex := 2600556, datum := { row := ⟨1, {2, 5, 6, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8677; core 30720; terminal 2600563
  { outputClauseIndex := 8677, coreClauseIndex := 30720, terminalClauseIndex := 2600563, datum := { row := ⟨1, {2, 5, 6, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8678; core 30725; terminal 2600569
  { outputClauseIndex := 8678, coreClauseIndex := 30725, terminalClauseIndex := 2600569, datum := { row := ⟨1, {2, 5, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8679; core 30726; terminal 2600570
  { outputClauseIndex := 8679, coreClauseIndex := 30726, terminalClauseIndex := 2600570, datum := { row := ⟨1, {2, 5, 7, 8}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8681; core 30732; terminal 2600576
  { outputClauseIndex := 8681, coreClauseIndex := 30732, terminalClauseIndex := 2600576, datum := { row := ⟨1, {2, 5, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8682; core 30733; terminal 2600577
  { outputClauseIndex := 8682, coreClauseIndex := 30733, terminalClauseIndex := 2600577, datum := { row := ⟨1, {2, 5, 7, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8684; core 30739; terminal 2600583
  { outputClauseIndex := 8684, coreClauseIndex := 30739, terminalClauseIndex := 2600583, datum := { row := ⟨1, {2, 5, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8685; core 30740; terminal 2600584
  { outputClauseIndex := 8685, coreClauseIndex := 30740, terminalClauseIndex := 2600584, datum := { row := ⟨1, {2, 5, 7, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8687; core 30746; terminal 2600590
  { outputClauseIndex := 8687, coreClauseIndex := 30746, terminalClauseIndex := 2600590, datum := { row := ⟨1, {2, 5, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8688; core 30747; terminal 2600591
  { outputClauseIndex := 8688, coreClauseIndex := 30747, terminalClauseIndex := 2600591, datum := { row := ⟨1, {2, 5, 8, 9}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8690; core 30753; terminal 2600597
  { outputClauseIndex := 8690, coreClauseIndex := 30753, terminalClauseIndex := 2600597, datum := { row := ⟨1, {2, 5, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8691; core 30754; terminal 2600598
  { outputClauseIndex := 8691, coreClauseIndex := 30754, terminalClauseIndex := 2600598, datum := { row := ⟨1, {2, 5, 8, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8693; core 30760; terminal 2600604
  { outputClauseIndex := 8693, coreClauseIndex := 30760, terminalClauseIndex := 2600604, datum := { row := ⟨1, {2, 5, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8694; core 30761; terminal 2600605
  { outputClauseIndex := 8694, coreClauseIndex := 30761, terminalClauseIndex := 2600605, datum := { row := ⟨1, {2, 5, 9, 10}⟩, arc := ⟨1, .right, {6, 7, 8}⟩ } },
  -- compact 8696; core 30766; terminal 2600611
  { outputClauseIndex := 8696, coreClauseIndex := 30766, terminalClauseIndex := 2600611, datum := { row := ⟨1, {2, 6, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8697; core 30767; terminal 2600612
  { outputClauseIndex := 8697, coreClauseIndex := 30767, terminalClauseIndex := 2600612, datum := { row := ⟨1, {2, 6, 7, 8}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8699; core 30772; terminal 2600618
  { outputClauseIndex := 8699, coreClauseIndex := 30772, terminalClauseIndex := 2600618, datum := { row := ⟨1, {2, 6, 7, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8700; core 30773; terminal 2600619
  { outputClauseIndex := 8700, coreClauseIndex := 30773, terminalClauseIndex := 2600619, datum := { row := ⟨1, {2, 6, 7, 9}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8702; core 30778; terminal 2600625
  { outputClauseIndex := 8702, coreClauseIndex := 30778, terminalClauseIndex := 2600625, datum := { row := ⟨1, {2, 6, 7, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
  -- compact 8703; core 30779; terminal 2600626
  { outputClauseIndex := 8703, coreClauseIndex := 30779, terminalClauseIndex := 2600626, datum := { row := ⟨1, {2, 6, 7, 10}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8705; core 30785; terminal 2600632
  { outputClauseIndex := 8705, coreClauseIndex := 30785, terminalClauseIndex := 2600632, datum := { row := ⟨1, {2, 6, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8706; core 30786; terminal 2600633
  { outputClauseIndex := 8706, coreClauseIndex := 30786, terminalClauseIndex := 2600633, datum := { row := ⟨1, {2, 6, 8, 9}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8708; core 30792; terminal 2600639
  { outputClauseIndex := 8708, coreClauseIndex := 30792, terminalClauseIndex := 2600639, datum := { row := ⟨1, {2, 6, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8709; core 30793; terminal 2600640
  { outputClauseIndex := 8709, coreClauseIndex := 30793, terminalClauseIndex := 2600640, datum := { row := ⟨1, {2, 6, 8, 10}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8710; core 30798; terminal 2600646
  { outputClauseIndex := 8710, coreClauseIndex := 30798, terminalClauseIndex := 2600646, datum := { row := ⟨1, {2, 6, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8711; core 30799; terminal 2600647
  { outputClauseIndex := 8711, coreClauseIndex := 30799, terminalClauseIndex := 2600647, datum := { row := ⟨1, {2, 6, 9, 10}⟩, arc := ⟨1, .right, {5, 6, 7, 8}⟩ } },
  -- compact 8712; core 30804; terminal 2600653
  { outputClauseIndex := 8712, coreClauseIndex := 30804, terminalClauseIndex := 2600653, datum := { row := ⟨1, {2, 7, 8, 9}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8714; core 30810; terminal 2600660
  { outputClauseIndex := 8714, coreClauseIndex := 30810, terminalClauseIndex := 2600660, datum := { row := ⟨1, {2, 7, 8, 10}⟩, arc := ⟨1, .left, {0, 1, 10}⟩ } },
  -- compact 8716; core 30816; terminal 2600667
  { outputClauseIndex := 8716, coreClauseIndex := 30816, terminalClauseIndex := 2600667, datum := { row := ⟨1, {2, 7, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8717; core 30821; terminal 2600674
  { outputClauseIndex := 8717, coreClauseIndex := 30821, terminalClauseIndex := 2600674, datum := { row := ⟨1, {2, 8, 9, 10}⟩, arc := ⟨1, .left, {0, 10}⟩ } },
  -- compact 8718; core 30826; terminal 2600682
  { outputClauseIndex := 8718, coreClauseIndex := 30826, terminalClauseIndex := 2600682, datum := { row := ⟨1, {3, 4, 5, 6}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8720; core 30831; terminal 2600688
  { outputClauseIndex := 8720, coreClauseIndex := 30831, terminalClauseIndex := 2600688, datum := { row := ⟨1, {3, 4, 5, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8721; core 30832; terminal 2600689
  { outputClauseIndex := 8721, coreClauseIndex := 30832, terminalClauseIndex := 2600689, datum := { row := ⟨1, {3, 4, 5, 7}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8722; core 30837; terminal 2600695
  { outputClauseIndex := 8722, coreClauseIndex := 30837, terminalClauseIndex := 2600695, datum := { row := ⟨1, {3, 4, 5, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8723; core 30838; terminal 2600696
  { outputClauseIndex := 8723, coreClauseIndex := 30838, terminalClauseIndex := 2600696, datum := { row := ⟨1, {3, 4, 5, 8}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8725; core 30843; terminal 2600702
  { outputClauseIndex := 8725, coreClauseIndex := 30843, terminalClauseIndex := 2600702, datum := { row := ⟨1, {3, 4, 5, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8726; core 30844; terminal 2600703
  { outputClauseIndex := 8726, coreClauseIndex := 30844, terminalClauseIndex := 2600703, datum := { row := ⟨1, {3, 4, 5, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8727; core 30849; terminal 2600709
  { outputClauseIndex := 8727, coreClauseIndex := 30849, terminalClauseIndex := 2600709, datum := { row := ⟨1, {3, 4, 5, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 4, 10}⟩ } },
  -- compact 8728; core 30850; terminal 2600710
  { outputClauseIndex := 8728, coreClauseIndex := 30850, terminalClauseIndex := 2600710, datum := { row := ⟨1, {3, 4, 5, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8730; core 30855; terminal 2600716
  { outputClauseIndex := 8730, coreClauseIndex := 30855, terminalClauseIndex := 2600716, datum := { row := ⟨1, {3, 4, 6, 7}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8731; core 30856; terminal 2600717
  { outputClauseIndex := 8731, coreClauseIndex := 30856, terminalClauseIndex := 2600717, datum := { row := ⟨1, {3, 4, 6, 7}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8732; core 30861; terminal 2600723
  { outputClauseIndex := 8732, coreClauseIndex := 30861, terminalClauseIndex := 2600723, datum := { row := ⟨1, {3, 4, 6, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8733; core 30862; terminal 2600724
  { outputClauseIndex := 8733, coreClauseIndex := 30862, terminalClauseIndex := 2600724, datum := { row := ⟨1, {3, 4, 6, 8}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8735; core 30867; terminal 2600730
  { outputClauseIndex := 8735, coreClauseIndex := 30867, terminalClauseIndex := 2600730, datum := { row := ⟨1, {3, 4, 6, 9}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8736; core 30868; terminal 2600731
  { outputClauseIndex := 8736, coreClauseIndex := 30868, terminalClauseIndex := 2600731, datum := { row := ⟨1, {3, 4, 6, 9}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8737; core 30873; terminal 2600737
  { outputClauseIndex := 8737, coreClauseIndex := 30873, terminalClauseIndex := 2600737, datum := { row := ⟨1, {3, 4, 6, 10}⟩, arc := ⟨1, .left, {0, 1, 2, 3, 10}⟩ } },
  -- compact 8738; core 30874; terminal 2600738
  { outputClauseIndex := 8738, coreClauseIndex := 30874, terminalClauseIndex := 2600738, datum := { row := ⟨1, {3, 4, 6, 10}⟩, arc := ⟨1, .right, {7, 8}⟩ } },
  -- compact 8739; core 30879; terminal 2600744
  { outputClauseIndex := 8739, coreClauseIndex := 30879, terminalClauseIndex := 2600744, datum := { row := ⟨1, {3, 4, 7, 8}⟩, arc := ⟨1, .left, {0, 1, 2, 10}⟩ } },
]

theorem directRowArcFiniteOccurrencesChunk001_batch_valid :
    directRowArcFiniteOccurrencesChunk001.length = 128 ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrencesChunk001, occurrence.datum.Valid := by
  native_decide

def directRowArcFiniteDataChunk001 : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrencesChunk001.map (·.datum)

theorem directRowArcFiniteDataChunk001_batch_valid :
    directRowArcFiniteDataChunk001.length = 128 ∧
      ∀ datum ∈ directRowArcFiniteDataChunk001, datum.Valid := by
  rw [directRowArcFiniteDataChunk001]
  constructor
  · simpa using directRowArcFiniteOccurrencesChunk001_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrencesChunk001_batch_valid.2 occurrence hoccurrence

end P4DirectOuterArcAdapterScratch
end Problem97
