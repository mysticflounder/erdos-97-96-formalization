<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center L2 Class Inventory Certificate

Schema: `multi_center_l2_class_inventory_certificate.v1`

This report is generated from `census/multi_center/sweeps` by
`scripts/multi-center-sweep-certificate.py`.  It records one digest-identified
row for every distinct class key in the recomputed L2 sweep inventory.

Scope: `n=12..32`.  The certificate-level facts are:

- there are `3,375` distinct class keys;
- every class is present at terminal row `n=32`;
- every class has zero UNSAT and INDETERMINATE status counts;
- the full-inventory digest is
  `888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40`;
- the terminal-inventory digest is
  `888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40`.

The JSON report includes the raw class keys and their per-class seen `n`
values.  The Lean bank uses only the digest identifiers and finite metadata, so
it is a class-imprint certificate rather than a raw class-key parser.

| first `n` | new classes |
|---:|---:|
| 12 | 619 |
| 13 | 531 |
| 14 | 609 |
| 15 | 574 |
| 16 | 280 |
| 17 | 322 |
| 18 | 247 |
| 19 | 31 |
| 20 | 78 |
| 21 | 69 |
| 22 | 0 |
| 23 | 9 |
| 24 | 6 |
| 25 | 0 |
| 26 | 0 |
| 27 | 0 |
| 28 | 0 |
| 29 | 0 |
| 30 | 0 |
| 31 | 0 |
| 32 | 0 |
