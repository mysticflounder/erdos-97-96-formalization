# Global Kalmanson 14-role family check

This directory records the targeted, solver-free validation of
`global_kalmanson_14role_16eq` added to `crossed_arm_cegar.py`.

Inputs:

- exact core: `crossed-arm-qf-nra-v4/global-kalmanson-lp-v8/minimal-core.json`
- replay witness: `source-at-common-full-metric-bank-v8-convex-five-point-import-v7-shared-fourth-600s/witness.json`
- Lean consumer: `Problem97.CapCrossingKalmansonBridge.false_of_fourteen_ccw_sixteen_shell_equalities_global_core`

Commands run from the repository root:

```text
uv run python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py \
  --self-check \
  --self-check-output scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/global-kalmanson-14role-16eq-v9-check/self-check.json

uv run python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py \
  --replay-global-kalmanson-witness scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/source-at-common-full-metric-bank-v8-convex-five-point-import-v7-shared-fourth-600s/witness.json \
  --replay-global-kalmanson-output scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/global-kalmanson-14role-16eq-v9-check/v8-witness-replay.json
```

Results:

- self-check: `SMOKE_OK`
- schema roundtrip: `ROUNDTRIP_OK`, including v8/v6 to v9/v7 migration
- guarded family: all 14 rotations and 14 reflected rotations rejected
- guard sharpness: 91 noncyclic transpositions and all 16 single-missing-equality valuations accepted
- current v8 witness: `GLOBAL_KALMANSON_14ROLE_MATCH_KILLS`

Follow-up ordinary-resume regression:

- the original synthetic v8/v6 check called the payload helper with an
  explicit allowed pair and therefore did not exercise the production wrapper;
- ordinary resume now accepts only the current v9/v7 pair and its immediate
  v8/v6 predecessor;
- the wrapper/file regression reports `ROUNDTRIP_OK` with the v8/v6 source pair;
- loading the actual v8/v6 `result.json` reports
  `ACTUAL_ORDINARY_RESUME_OK` and reconstructs 203,687 packet cuts (8,313
  structural and 195,374 theorem cuts; zero connectivity cuts).

Trust boundary: these checks validate the matcher, guarded-cut reconstruction,
schema migration, and one serialized witness replay. They invoke no CEGAR
enumeration and do not establish or rebuild the Lean theorem.
