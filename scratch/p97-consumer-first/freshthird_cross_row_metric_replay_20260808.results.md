# Corrected FreshThird first motif-free metric replay (2026-08-08)

trust: source-faithful fixed-structure exact-rational QF_LRA diagnostic; no Lean closure
configuration: outside_fresh_between_source_canonical; fresh_cap=1; row_cap=1; cap pair=0-1; mutual pair=0-1; exact Not(motif) query
metric_result: unsat; occupied=24; assertions=27835; active=cross:1->0,mutual:0->1,mutual:1->0
campaign_stats: {'occupied': 24, 'metric_assertions': 27835, 'active_directions': 'cross:1->0,mutual:0->1,mutual:1->0', 'cvc5_result': 'unsat', 'cvc5_smt2': '/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/p97-consumer-first/freshthird_cross_deletion_cegar_20260807.metric.smt2'}
tracked_subset_result: unsat; tracked_assertions=21266; raw_core_size=39; shrunk_core_size=39; cvc5_shrunk_result=unsat
versioned_cvc5_smt2: /Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/p97-consumer-first/freshthird_cross_row_metric_replay_20260808.smt2

## Frozen rank map

`0:b3, 1:f2/e1, 2:w0, 3:a1_2, 4:a1_1, 5:w1, 6:qOutside/pinnedCenter/a0_1/a1_0/a2_2, 7:a3_2, 8:e3, 9:a0_2/a3_1, 10:freshCenter/e2, 11:f1/w3, 12:a0_0, 13:qBetween/drowCenter, 14:c2, 15:e0/a2_1, 16:b1, 17:a3_0, 18:sourceCenter, 19:b0, 20:w2, 21:b2, 22:a2_0, 23:canonicalSource`

## Shrunken core

- `p20316_kalmanson` `kalmanson` — quad=w1,qOutside,w2,b2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p00433_blocker_slot_shell` `blocker_slot_shell` — blocker=b2,slot=a2_0. Source/provenance: CriticalFourShell.support_eq_radius on exact four-shell slot.
- `p13538_kalmanson` `kalmanson` — quad=w0,a1_2,b0,w2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p18394_kalmanson` `kalmanson` — quad=a1_1,w1,sourceCenter,b0;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p16150_kalmanson` `kalmanson` — quad=a1_2,a1_1,sourceCenter,b0;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p16168_kalmanson` `kalmanson` — quad=a1_2,a1_1,w2,b2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p20298_kalmanson` `kalmanson` — quad=w1,qOutside,sourceCenter,b0;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p13528_kalmanson` `kalmanson` — quad=w0,a1_2,sourceCenter,b0;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p13546_kalmanson` `kalmanson` — quad=w0,a1_2,w2,b2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p27806_kalmanson` `kalmanson` — quad=w2,b2,a2_0,canonicalSource;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p20286_kalmanson` `kalmanson` — quad=w1,qOutside,a3_0,sourceCenter;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p16124_kalmanson` `kalmanson` — quad=a1_2,a1_1,b1,a3_0;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p18404_kalmanson` `kalmanson` — quad=a1_1,w1,b0,w2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p27696_kalmanson` `kalmanson` — quad=b1,a3_0,a2_0,canonicalSource;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p16138_kalmanson` `kalmanson` — quad=a1_2,a1_1,a3_0,sourceCenter;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p27788_kalmanson` `kalmanson` — quad=sourceCenter,b0,a2_0,canonicalSource;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p18382_kalmanson` `kalmanson` — quad=a1_1,w1,a3_0,sourceCenter;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p10506_kalmanson` `kalmanson` — quad=f2,w0,w2,b2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p10498_kalmanson` `kalmanson` — quad=f2,w0,b0,w2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p10488_kalmanson` `kalmanson` — quad=f2,w0,sourceCenter,b0;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p18368_kalmanson` `kalmanson` — quad=a1_1,w1,b1,a3_0;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p10093_kalmanson` `kalmanson` — quad=b3,w2,b2,canonicalSource;second. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p10083_kalmanson` `kalmanson` — quad=b3,b0,w2,canonicalSource;second. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p10065_kalmanson` `kalmanson` — quad=b3,sourceCenter,b0,canonicalSource;second. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p10037_kalmanson` `kalmanson` — quad=b3,a3_0,sourceCenter,canonicalSource;second. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p09997_kalmanson` `kalmanson` — quad=b3,b1,a3_0,canonicalSource;second. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p20308_kalmanson` `kalmanson` — quad=w1,qOutside,b0,w2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p27809_cross_survivor_equal_radius` `cross_survivor_equal_radius` — 1->0,slot=0,point=qOutside. Source/provenance: survivor selectedAt(...).toCriticalFourShell.support_eq_radius.
- `p27802_kalmanson` `kalmanson` — quad=b0,w2,a2_0,canonicalSource;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p18412_kalmanson` `kalmanson` — quad=a1_1,w1,w2,b2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p16160_kalmanson` `kalmanson` — quad=a1_2,a1_1,b0,w2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p27756_kalmanson` `kalmanson` — quad=a3_0,sourceCenter,a2_0,canonicalSource;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p27811_cross_survivor_equal_radius` `cross_survivor_equal_radius` — 1->0,slot=1,point=a2_0. Source/provenance: survivor selectedAt(...).toCriticalFourShell.support_eq_radius.
- `p07764_kalmanson` `kalmanson` — quad=b3,a1_2,b1,sourceCenter;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p20272_kalmanson` `kalmanson` — quad=w1,qOutside,b1,a3_0;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p07006_kalmanson` `kalmanson` — quad=b3,f2,w2,b2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p06998_kalmanson` `kalmanson` — quad=b3,f2,b0,w2;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p06988_kalmanson` `kalmanson` — quad=b3,f2,sourceCenter,b0;first. Source/provenance: strict Kalmanson inequality for occupied cyclic order.
- `p00435_blocker_slot_shell` `blocker_slot_shell` — blocker=b2,slot=a2_2. Source/provenance: CriticalFourShell.support_eq_radius on exact four-shell slot.

The corrected motif-free model has 24 occupied representatives (the prior arbitrary first model had 22); the metric UNSAT therefore depends on the exact negated-motif survivor aliases and is not a replay of the arbitrary-model packet.

## Consumer ingress audit

A scratch Lean signature probe checks `FivePointEuclideanObstruction.false_of_five_ccw_second_three_row_equalities` and `KalmansonRadiusOrderReversal.false_of_seven_ccw_radius_order_reversal_equalities`. Both elaborate, but this rank-only packet supplies no injective `boundary`/`phi`, CCW convexity, finite-carrier image, or ordered seven-index lift; hence neither production consumer is applicable to this replay without a new universal source-level adapter.

shrink_probe_statuses: [('p20316_kalmanson', 'sat'), ('p00433_blocker_slot_shell', 'sat'), ('p13538_kalmanson', 'sat'), ('p18394_kalmanson', 'sat'), ('p16150_kalmanson', 'sat'), ('p16168_kalmanson', 'sat'), ('p20298_kalmanson', 'sat'), ('p13528_kalmanson', 'sat'), ('p13546_kalmanson', 'sat'), ('p27806_kalmanson', 'sat'), ('p20286_kalmanson', 'sat'), ('p16124_kalmanson', 'sat'), ('p18404_kalmanson', 'sat'), ('p27696_kalmanson', 'sat'), ('p16138_kalmanson', 'sat'), ('p27788_kalmanson', 'sat'), ('p18382_kalmanson', 'sat'), ('p10506_kalmanson', 'sat'), ('p10498_kalmanson', 'sat'), ('p10488_kalmanson', 'sat'), ('p18368_kalmanson', 'sat'), ('p10093_kalmanson', 'sat'), ('p10083_kalmanson', 'sat'), ('p10065_kalmanson', 'sat'), ('p10037_kalmanson', 'sat'), ('p09997_kalmanson', 'sat'), ('p20308_kalmanson', 'sat'), ('p27809_cross_survivor_equal_radius', 'sat'), ('p27802_kalmanson', 'sat'), ('p18412_kalmanson', 'sat'), ('p16160_kalmanson', 'sat'), ('p27756_kalmanson', 'sat'), ('p27811_cross_survivor_equal_radius', 'sat'), ('p07764_kalmanson', 'sat'), ('p20272_kalmanson', 'sat'), ('p07006_kalmanson', 'sat'), ('p06998_kalmanson', 'sat'), ('p06988_kalmanson', 'sat'), ('p00435_blocker_slot_shell', 'sat')]
