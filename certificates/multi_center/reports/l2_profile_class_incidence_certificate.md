<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center L2 Profile/Class Incidence Certificate

Schema: `multi_center_l2_profile_class_incidence_certificate.v1`

This report is generated from `census/multi_center/sweeps` by
`scripts/multi-center-sweep-certificate.py`.  It records the selected
profile/class incidence relation after resolving overlapping sweep artifacts.

Scope: `n=12..32`.  The certificate-level facts are:

- there are `489` generated profile rows;
- there are `977,975` profile/class pairs;
- those pairs are represented in Lean by
  `40,369` contiguous class-id ranges;
- every recorded incidence cell is `SAT`;
- every class key maps to the generated class bank;
- each profile row's incidence count matches `ProfileInventory.localClasses`;
- the incidence-pair digest is `34a266c63e0545033088e65216a591b48b9e5143d6ae2c46aba08f861c72fca6`.

This generated report alone is a finite incidence certificate for the imported
sweep rows.  In the full Lean certificate stack, the independent LOCAL
enumerator and typed-bank equality close enumerator completeness for the
L2/full-participant representative surface modulo profile automorphisms.  They
do not prove geometric GLOBAL realization or any claim about unscanned `n`.

| n | profiles | profile/class pairs | compressed ranges |
|---:|---:|---:|---:|
| 12 | 2 | 700 | 305 |
| 13 | 3 | 1,736 | 559 |
| 14 | 4 | 3,311 | 746 |
| 15 | 6 | 5,476 | 942 |
| 16 | 7 | 8,171 | 1,078 |
| 17 | 9 | 11,456 | 1,233 |
| 18 | 11 | 15,286 | 1,363 |
| 19 | 13 | 19,691 | 1,528 |
| 20 | 15 | 24,641 | 1,642 |
| 21 | 18 | 30,181 | 1,808 |
| 22 | 20 | 36,251 | 1,932 |
| 23 | 23 | 42,911 | 2,089 |
| 24 | 26 | 50,116 | 2,213 |
| 25 | 29 | 57,896 | 2,380 |
| 26 | 32 | 66,221 | 2,495 |
| 27 | 36 | 75,136 | 2,662 |
| 28 | 39 | 84,581 | 2,787 |
| 29 | 43 | 94,616 | 2,945 |
| 30 | 47 | 105,196 | 3,070 |
| 31 | 51 | 116,351 | 3,238 |
| 32 | 55 | 128,051 | 3,354 |
