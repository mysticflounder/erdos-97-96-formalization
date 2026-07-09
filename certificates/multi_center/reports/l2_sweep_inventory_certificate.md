<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center L2 Sweep Inventory Certificate

Schema: `multi_center_l2_sweep_inventory_certificate.v1`

This report is generated from `census/multi_center/sweeps` by
`scripts/multi-center-sweep-certificate.py`.  It records the project-level
inventory recomputed from class keys across overlapping sweep artifacts.

Scope: `n=12..32`.  The certificate-level facts are:

- every loaded row has `UNSAT = 0` and `INDETERMINATE = 0`;
- every loaded row has `LOCAL = SAT` at distinct class-key count and
  SHA-256 inventory-digest level;
- no SAT class disappears between consecutive loaded `n` rows;
- the exact inventory is stable from the previous row at
  `22, 25, 26, 27, 28, 29, 30, 31, 32`.

This is a finite metadata certificate for the imported sweep rows.  It does
not certify the Python search code, the semantic meaning of the class-key
encoding, or any unscanned `n`.

| n | profiles | LOCAL | SAT | fresh | new-vs-prev | missing-prev | UNSAT | INDET | class digest | cells | DFS nodes | sources |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|---:|---:|---:|
| 12 | 2 | 619 | 619 | 619 | 619 | 0 | 0 | 0 | `1dd43ce87e05244a` | 700 | 397,993 | 2 |
| 13 | 3 | 1,150 | 1,150 | 531 | 531 | 0 | 0 | 0 | `2a691308c0fc5002` | 1,736 | 1,549,535 | 1 |
| 14 | 4 | 1,759 | 1,759 | 609 | 609 | 0 | 0 | 0 | `ffb2c15f36e3b275` | 3,311 | 4,570,307 | 1 |
| 15 | 6 | 2,333 | 2,333 | 574 | 574 | 0 | 0 | 0 | `61429689d60970aa` | 5,476 | 11,048,054 | 1 |
| 16 | 7 | 2,613 | 2,613 | 280 | 280 | 0 | 0 | 0 | `7134324d7d59a077` | 8,171 | 24,381,275 | 1 |
| 17 | 9 | 2,935 | 2,935 | 322 | 322 | 0 | 0 | 0 | `3226b812c949b3a6` | 11,456 | 48,257,057 | 1 |
| 18 | 11 | 3,182 | 3,182 | 247 | 247 | 0 | 0 | 0 | `e7aa258571c5f5bb` | 15,286 | 86,998,269 | 1 |
| 19 | 13 | 3,213 | 3,213 | 31 | 31 | 0 | 0 | 0 | `9118910926696932` | 19,691 | 143,385,137 | 1 |
| 20 | 15 | 3,291 | 3,291 | 78 | 78 | 0 | 0 | 0 | `e90e3300d2a9e5e8` | 24,641 | 236,386,113 | 1 |
| 21 | 18 | 3,360 | 3,360 | 69 | 69 | 0 | 0 | 0 | `3c523271607e9ef6` | 30,181 | 375,445,745 | 1 |
| 22 | 20 | 3,360 | 3,360 | 0 | 0 | 0 | 0 | 0 | `3c523271607e9ef6` | 36,251 | 574,883,663 | 1 |
| 23 | 23 | 3,369 | 3,369 | 9 | 9 | 0 | 0 | 0 | `fde4d097d2d77d0b` | 42,911 | 855,806,285 | 1 |
| 24 | 26 | 3,375 | 3,375 | 6 | 6 | 0 | 0 | 0 | `888df36a194fd54a` | 50,116 | 1,232,474,553 | 1 |
| 25 | 29 | 3,375 | 3,375 | 0 | 0 | 0 | 0 | 0 | `888df36a194fd54a` | 57,896 | 1,690,868,064 | 1 |
| 26 | 32 | 3,375 | 3,375 | 0 | 0 | 0 | 0 | 0 | `888df36a194fd54a` | 66,221 | 2,356,657,465 | 1 |
| 27 | 36 | 3,375 | 3,375 | 0 | 0 | 0 | 0 | 0 | `888df36a194fd54a` | 75,136 | 3,244,409,704 | 1 |
| 28 | 39 | 3,375 | 3,375 | 0 | 0 | 0 | 0 | 0 | `888df36a194fd54a` | 84,581 | 4,355,073,653 | 1 |
| 29 | 43 | 3,375 | 3,375 | 0 | 0 | 0 | 0 | 0 | `888df36a194fd54a` | 94,616 | 5,795,498,263 | 1 |
| 30 | 47 | 3,375 | 3,375 | 0 | 0 | 0 | 0 | 0 | `888df36a194fd54a` | 105,196 | 7,555,701,066 | 1 |
| 31 | 51 | 3,375 | 3,375 | 0 | 0 | 0 | 0 | 0 | `888df36a194fd54a` | 116,351 | 9,524,326,062 | 1 |
| 32 | 55 | 3,375 | 3,375 | 0 | 0 | 0 | 0 | 0 | `888df36a194fd54a` | 128,051 | 12,234,247,376 | 1 |
