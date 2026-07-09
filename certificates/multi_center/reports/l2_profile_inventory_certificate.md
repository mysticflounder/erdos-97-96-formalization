<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center L2 Profile Inventory Certificate

Schema: `multi_center_l2_profile_inventory_certificate.v1`

This report is generated from `census/multi_center/sweeps` by
`scripts/multi-center-sweep-certificate.py`.  It records one row for each
loaded `(n, profile)` summary selected by the sweep analyzer after resolving
overlapping artifacts.

Scope: `n=12..32`.  The certificate-level facts are:

- there are `489` loaded profile rows;
- every profile row has `UNSAT = 0` and `INDETERMINATE = 0`;
- every profile row has `local_classes = SAT`;
- every profile row has `tested = SAT + UNSAT + INDETERMINATE`.

| n | profiles |
|---:|---:|
| 12 | 2 |
| 13 | 3 |
| 14 | 4 |
| 15 | 6 |
| 16 | 7 |
| 17 | 9 |
| 18 | 11 |
| 19 | 13 |
| 20 | 15 |
| 21 | 18 |
| 22 | 20 |
| 23 | 23 |
| 24 | 26 |
| 25 | 29 |
| 26 | 32 |
| 27 | 36 |
| 28 | 39 |
| 29 | 43 |
| 30 | 47 |
| 31 | 51 |
| 32 | 55 |
