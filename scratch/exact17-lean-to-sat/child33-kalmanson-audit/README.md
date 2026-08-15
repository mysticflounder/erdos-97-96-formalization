# CHILD33 Kalmanson diagnostic audit

Status: `DIAGNOSTIC` (the child32 SAT job had `requested_core_limit=null`).

Source/model inputs:

- model: `../child32-diagnostic-model-replay/model.json`, job
  `2506986e-0445-465f-9b05-eff6bb9a5983`;
- model metadata: `SAT`, CaDiCaL, 308/308 signed assignments; the pinned CNF
  is SHA-256 `c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d`
  with 5,847,240 clauses (independently checked in the sibling replay);
- source producer: `census/atail_force/producer_bank.py`,
  `enumerate_two_kalmanson_cancellations` and
  `certify_two_kalmanson_cancellation`;
- source-faithful projection: `scripts/generate_exact17_twenty_eighth_all_cancellation_refinements.py`,
  `referenced_row_choices` and `project_record_for_lean`;
- Lean consumer named by the producer:
  `GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`.

## Exhaustive producer replay

The model decodes to 17 rows of four selected points.  Exhaustive replay
checked all 470 records across the four order/orientation calls:

| named order | orientation | order passed to producer | records | distinct supports | target support |
|---:|---|---|---:|---:|---|
| 0 | forward | order 0 | 123 | 76 | present |
| 0 | reverse | reverse(order 0) | 123 | 76 | reflected target present |
| 1 | forward | order 1 | 112 | 70 | present |
| 1 | reverse | reverse(order 1) | 112 | 70 | reflected target present |

Target forward support is
`{(3,15),(3,16),(0,13),(0,16),(7,13),(7,15)}`.  Reverse-orientation
support is its source reflection
`{(13,1),(13,0),(16,3),(16,0),(9,3),(9,1)}`.

For each named order, the target has two independently checked forward
records (same six-edge support):

1. `firstQuad=[0,3,13,16]`, `secondQuad=[3,7,13,15]`, both `innerOuter`;
2. `firstQuad=[0,7,13,15]`, `secondQuad=[0,3,15,16]`, both `innerOuter`.

The projected path-row-choice certificate for record (1) has exactly the
three choices `{0:{13,16}, 3:{15,16}, 7:{13,15}}`; replay through
`certify_two_kalmanson_cancellation` and `lean_occurrence_check` succeeds for
both named orders.  The reflected projection likewise has exactly
`{9:{1,3}, 13:{0,1}, 16:{0,3}}` and succeeds.  Thus this smaller,
source-valid support can feed the named generic Lean consumer (subject to the
usual diagnostic/non-production status of the model).

## First-quad discrepancy verdict

There is no producer, metadata, or choice-projection defect.  The diagnostic
inventory's `firstQuad=[0,3,15,16]` is the canonical first-hit record emitted
by `scan_all_formalized_cores`; exhaustive enumeration also contains the
different valid record with `firstQuad=[0,3,13,16]`.  Projection preserves the
selected record's quads exactly while reducing only `row_choices`.  The
discrepancy is therefore non-uniqueness/first-hit extractor choice, not an
unsupported motif.

## Wave-only general-theorem scan

`scan_all_formalized_cores` found the usual two-circle, convex-five, and
two-Kalmanson families in all calls.  One additional concrete family appears
only for reverse(order 0):

- `equality-convex-five-point-three-selected-row-kalmanson`, consumer
  `CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`,
  core `{A=12,C=16,E=1,O=15,Y=9}`.

This is a diagnostic candidate, not a promoted/general closure theorem.
