# P97 exact-17 committed direct-row consumer census

Date: 2026-08-08

## Scope

This census measures four kernel-clean selected-row contradictions in the
source-faithful exact-17 cap-nine lane.  The clauses use only the one frozen
increasing boundary order.  Cyclic recuts are deliberately excluded because
this packet does not yet have a checked boundary-recut adapter.

The checked Lean consumers are:

- `Problem97.CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`;
- `Problem97.CapCrossingKalmansonBridge.false_of_two_selected_middle_rows_shared_endpoint_pair`;
- `Problem97.CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`;
- `Problem97.CapCrossingKalmansonBridge.false_of_six_ccw_two_k2_three_selected_rows`.

Lean LSP reports the same axiom closure for all four declarations:
`[propext, Classical.choice, Quot.sound]`.  None depends on `sorryAx` or
compiler trust.

## Clause families

At carrier size 17 the increasing-order instances are:

| family | instances |
| --- | ---: |
| shared late pair | `C(17,4) = 2,380` |
| shared middle endpoint pair | `C(17,4) = 2,380` |
| five-point three-row pattern | `C(17,5) = 6,188` |
| six-point two-K2 three-row pattern | `C(17,6) = 12,376` |
| total | `23,324` |

Every instance becomes one negative clause forbidding exactly the selected-row
incidence core consumed by its Lean theorem.  The helper smoke tests check a
canonical complete motif, all one-incidence deletions, and the optimized
matchers against exhaustive enumeration on 200 deterministic random systems.

## Historical replay

The replay deduplicated 22,981 row systems from 70 historical artifacts, with
no parse errors.

| family | systems hit | distinct witnesses |
| --- | ---: | ---: |
| shared late pair | 2,455 | 1,086 |
| shared middle endpoint pair | 2,727 | 913 |
| five-point three-row pattern | 208 | 149 |
| six-point two-K2 three-row pattern | 158 | 155 |

The three newly audited consumers hit 3,058 systems.  Only 38 overlap the
shared-late family, so they add 3,020 new rejections.  All four consumers
together hit 5,475 of 22,981 systems, approximately 23.8 percent.

## Status and integration contract

These are reusable static CEGAR accelerators, not exact-17 coverage, a live
`sorry` closure, or a full-P97 result.  None occurs in the current hardest
cap-nine sample.  The source-frozen predecessor run must terminate before its
runner or producer bank is changed.

The successor must fail closed unless all four exact Lean declarations are
present, regenerate the clauses independently in its validator, authenticate
the clause-family digests, and retain the source-model and one-incidence
deletion smoke tests.  Only then may the families be counted as admitted
static cuts in a fresh source snapshot.

The source file is named `CapCrossingKalmanson.lean`, but the declarations live
in namespace `Problem97.CapCrossingKalmansonBridge`; helper provenance strings
use the declaration namespace rather than the filename stem.
