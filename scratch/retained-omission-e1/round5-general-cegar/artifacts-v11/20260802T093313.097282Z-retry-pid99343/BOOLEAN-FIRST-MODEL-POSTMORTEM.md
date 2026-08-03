# V11 saved-Boolean first-model postmortem

Date: 2026-08-02

This is a bounded diagnostic over the sixteen `boolean_encoding.smt2.gz`
artifacts left by the stopped v11 canary.  It is **not** a terminal CEGAR
matrix and does not change any full-case verdict.

## Method

- Replay each saved Boolean relaxation with Z3, seed 97 and a 30-second check
  timeout.
- For each SAT first model, reconstruct the corresponding v9 `Encoding` and
  run `round5_cegar_v9.mine_power_cut` with a 120-second / 2,000,000-candidate
  budget.
- Use eight local processes at nice level 8.

Inputs and classifier:

- 16 saved Boolean formulas; sorted per-file-SHA manifest aggregate SHA-256
  `b1400fcf6842240c0b998c52a3cfa6f3f52f77472aeeb8dd389a507db8a5fd02`.
- `round5_cegar_v9.py` SHA-256
  `f0bcb74f5117cd0fc47e524fc222e7c1a435bc8a85785f7e4dbbc504f35cc25e`.
- `diagnose_v11_boolean_models.py` SHA-256
  `3090c1157241c8a4d36ec934ed8fb9ff27d92d22a3ffa84b0307911e18b741f1`.

## Result

- Boolean replay: 16/16 SAT.
- First-model power scan: 16/16 `no_cut`.
- Total candidate submatrices checked: 3,132,943.
- Per-case scan counts ranged from 25,410 to 340,340.
- Wall time: 17.353 seconds with eight workers.

Thus the v11 setup-cost bug masked a second limitation: after a fast Boolean
build, the current five-full-shell power-pattern miner does not exclude the
first Boolean model in any of the sixteen saved cases.  Since the v11 loop
terminates its Boolean prepass at `sat_no_cut`, these cases would immediately
fall through to the existing nonlinear full solver.  A broad v12 matrix using
only this refinement is therefore not warranted by this sample.

This does not refute the power-matrix theorem or rule out other theorem-sound
Boolean refinements.  It only establishes that the current v9 cut family is
absent from these sixteen first abstraction models.
