# FreshThird cross-deletion tracked core (2026-08-07)

`trust`: fixed-structure exact-rational QF_LRA diagnostic; no Lean closure.
`configuration`: order `qOutside < freshCenter < qBetween < sourceCenter < canonicalSource`; fresh_cap=1, row_cap=1; cap pair 0-1; independent mutual pair 0-1.
`metric_result`: unsat; occupied=22; assertions=19700; active=cross:1->0,mutual:0->1,mutual:1->0.
`raw_core_size`: 5; `shrunk_core_size`: 5; `cvc5_shrunk_result`: unsat.

## Frozen carrier/rank map

Roles are listed by structural rank (aliases are slash-separated); this is the cyclic order used by every Kalmanson premise:
`0:b3, 1:f2/e1, 2:w0, 3:a1_2, 4:a1_1, 5:w1, 6:qOutside/pinnedCenter/a0_1/a1_0/a2_2/a3_2, 7:e3, 8:a0_2/a3_1, 9:freshCenter/e2, 10:f1/w3/a0_0, 11:qBetween/drowCenter, 12:c2, 13:e0/a2_1, 14:b1, 15:a3_0, 16:sourceCenter, 17:b0, 18:w2, 19:b2, 20:a2_0, 21:canonicalSource`

The survivor supports are rank-backed: `cross 1→0` and `mutual 0→1`, `mutual 1→0`; each has four distinct slots and omits the opposite deleted source and blocker center.

## Shrunken tracked core

- `p00325_blocker_slot_shell` `blocker_slot_shell` — blocker=b0,slot=a0_1. ranks: b0=17, a0_1=6 Source/provenance: CriticalFourShell.support_eq_radius on exact four-shell slot.
- `p00403_blocker_slot_shell` `blocker_slot_shell` — blocker=b3,slot=a3_1. ranks: b3=0, a3_1=8 Source/provenance: CriticalFourShell.support_eq_radius on exact four-shell slot.
- `p00326_blocker_slot_shell` `blocker_slot_shell` — blocker=b0,slot=a0_2. ranks: b0=17, a0_2=8 Source/provenance: CriticalFourShell.support_eq_radius on exact four-shell slot.
- `p00404_blocker_slot_shell` `blocker_slot_shell` — blocker=b3,slot=a3_2. ranks: b3=0, a3_2=6 Source/provenance: CriticalFourShell.support_eq_radius on exact four-shell slot.
- `p06628_kalmanson` `kalmanson` — quad=b3,qOutside,a0_2,b0;second. ranks: b3=0, qOutside=6, a0_2=8, b0=17 Source/provenance: strict Kalmanson inequality for occupied cyclic order.

No `known_row_equal_radius` assertion survives shrinking: the replay includes sourceCenter `(qOutside,qBetween,canonicalSource,c2)`, freshCenter `(qOutside,qBetween,f1,f2)`, pinnedCenter `ROW`, and drowCenter `DROW`, but the five-premise core only needs the two exact blocker-shell slot equalities at ranks `(17,6,8)` and `(0,8,6)` plus the strict Kalmanson quadrilateral at ranks `0<6<8<17`.

## Consumer/producers boundary

The core is not an existing Lean consumer: it combines fixed rank aliases, all named-row equalities/exclusions, three exact survivor rows, and strict Kalmanson/triangle constraints in one finite replay. Existing consumers (`false_of_freshThird_four_order_arms` and the generic `CapCrossingKalmanson` schemas) need a universal CCW boundary-index adapter and source-produced equal-radius equations; they do not consume this independent-pair packet.

First missing source-level producer premise: a universal lift from the cross-deletion disjunction plus an independent mutual-cross pair to the *same* injective CCW carrier, assigning every survivor slot to a named physical point and exporting the two Kalmanson-ready equal-radius equations. The current Lean fields (`directed_crossDeletion_survival`, `mutual_cross_membership`) are residual/same-pair statements and do not provide that independent-pair lift.

Shrink probe statuses (label:result): [('p00325_blocker_slot_shell', 'sat'), ('p00403_blocker_slot_shell', 'sat'), ('p00326_blocker_slot_shell', 'sat'), ('p00404_blocker_slot_shell', 'sat'), ('p06628_kalmanson', 'sat')]
