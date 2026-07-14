# Round-19 five-row consumer integration map

Date: 2026-07-13

Status: **PROVEN in checked scratch; deterministic finite-shadow replay
integrated. No live `sorry` is closed by this artifact alone.**

## Exact label and row map

The saved round-19 labels are

```text
(O,A,C,D,E,X5,X6,X9) = (0,1,2,3,4,5,6,9).
```

The five selected rows map to the label-generic
`FiveRowCircleIntersectionOrderCore.Core` fields as follows.

| Saved row | Direct equality | Core field |
|---|---|---|
| `0:{1,2,3,4}` | `OA=OC` | `OA_OC` |
| `0:{1,2,3,4}` | `OA=OD` | `OA_OD` |
| `0:{1,2,3,4}` | `OA=OE` | `OA_OE` |
| `1:{0,2,6,7}` plus edge reversal | `OA=AC` | `OA_AC` |
| `3:{1,5,6,8}` | `DA=DX5` | `DA_DX5` |
| rows `0` and `4:{0,5,9,11}` plus edge reversal | `OA=EX5` | `OA_EX5` |
| `1:{0,2,6,7}` plus edge reversal | `OA=AX6` | `OA_AX6` |
| `3:{1,5,6,8}` | `DA=DX6` | `DA_DX6` |
| `2:{3,8,9,10}` | `CD=CX9` | `CD_CX9` |
| rows `0` and `4:{0,5,9,11}` plus edge reversal | `OA=EX9` | `OA_EX9` |

The saved hull order

```text
0,9,10,11,1,3,4,5,2,6,7,8
```

restricts to the cyclic spine `O,A,D,E,C`. It supplies the six orientations
`OAC`, `OAD`, `OAE`, `ODE`, `ODC`, and `OEC`. The arbitrary-carrier boundary
convention makes these signs negative, so the carrier adapter invokes the
reflected consumer `false_of_core_of_neg`.

## Checked artifacts

- `residual_555_round19_five_row_order_core.lean` packages the ten
  `EdgeClosure` equalities and proves positive and reflected consumers.
- `residual_555_round19_general_carrier_adapter.lean` converts fifteen
  selected-support memberships plus the cyclic spine into the generic core.
- Both public consumers kernel-check with axiom closure exactly
  `[propext, Classical.choice, Quot.sound]`; source scans find no `sorry`,
  `admit`, or `native_decide`.

## Deterministic replay consequence

The monotone matcher in `common_system_metric_probe.py` recognizes the same
closure pattern under arbitrary relabeling and reflection. The normal replay
now banks two five-row cuts:

1. old round 19, with `X9=9`;
2. round 20, with `X9=10`.

The first post-cut survivor is round 21:

```text
digest: 2854f002275620851be4b86b064d3f0fb02cb60099c6a60d36f241dd19fb82ec
rows:   0:{1,2,3,4}; 1:{0,2,6,7}; 2:{3,8,9,10};
        3:{1,5,6,8}; 4:{1,2,9,11}
oracle: [NONUNIT, NONUNIT, NONUNIT]
```

This is **EMPIRICALLY VERIFIED, exact within the finite common-system
shadow**. It is a new diagnostic survivor, not evidence that blind extra
rounds are required.

## Bounded live-proof handoff

1. Treat the five-row core and carrier adapter as a completed Stage-II
   alternate consumer.
2. At the live producer boundary, either construct the fifteen support
   memberships and cyclic spine needed by `FiveRowSupportData`, or produce an
   already-consumed alternate.
3. Keep Stage-I aligned-incidence production separate: this consumer does not
   derive the five selected rows from full-filter/critical/cap/no-`M44` data.
4. Use round 21 only to audit whether this same live producer surface yields a
   second named alternate; do not make further census rounds a prerequisite.
