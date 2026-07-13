# Census workspace

This directory is the permanent home for the finite census tooling that
used to live under `scratch/` and `scripts/`.

## Layout

- `incidence/` contains the original incidence escape census.  The
  canonical entrypoint is `census/incidence/escape_census.py`; the old
  `scripts/escape-census.py` path is a compatibility wrapper.
- `candidate_d_probe/` contains the one-center and candidate-d token
  probes, including the q2 token classifier and solver artifacts.
- `q3_two_center/` contains the two-center q3 token probes, kill notes,
  witnesses, generated solver inputs/outputs, and the permanent fail-closed
  negative checkpoint (`checkpoint.py` / `checkpoint.json`).
- `atail_force/` contains the exact three-center geometric successor to Q3.
  It replays the pinned 3,375-row L2 joint-class inventory, restores every
  membership-distinct global cap-block order, and exposes a 167,782-system
  polynomial decision surface plus a deterministic no-solver checkpoint. The
  exact finite reduction has 590 S3 class orbits / 30,997 representative-order
  cases and 343 raw / 70 S3 equality skeletons. Exact constructive replay gives
  every bare and separator-saturated skeleton a real algebraic witness, so the
  equality-only route is a negative terminal; only the omitted
  disk/nonobtuse/cap/global-order inequalities or stronger live hypotheses can
  still decide a case. A manifest-bound full-inequality pilot over seven fixed
  support-size strata returned 7/7 timeouts in 219.901 seconds, a negative
  tractability result with no row classification. This is selected-four window
  infrastructure, not the full-filter producer.
- `multi_center/` contains the multi-center joint census implementation
  for `docs/multi-center-joint-census-spec-2026-07-07.md`.
- `census_554/` contains the permanent locking, transaction, terminal-proof,
  and regression-test infrastructure for the `(5,5,4)` card-11 census. The
  large historical bank and certificate payload remain external migration
  artifacts until their normalized audit is complete.
- `card_head/` contains the labeled profile and post-SUB2 PROVEN per-center
  candidate surface for the authorized card-12--14 head research lane, plus
  immutable run manifests, a hash-chained append-only run-event protocol, and
  a fail-closed runner preflight/status command. Exact pattern certificates are
  reconstructed and replayed in rational arithmetic before a proposal can
  cross the CEGAR adapter, and one recovery journal couples certificate, bank,
  and run-event publication. The three declared policy stops are derived from
  strict event measurements. The heavy mining/generation worker is not yet
  enabled, and no conjectured cut is admitted to the proof tier.
- `global_confinement/` contains the general-`m` pinned-surplus incidence
  probes. They separate q-critical row compatibility, simultaneous q-deleted
  survival, and eight-point confinement; cover every ordered surplus placement
  at `n = 11,12`, recheck the two stable zero-extension types at every `n = 13`
  placement, extract their node-zero fixed-pair/empty-domain cores, and couple a
  source-indexed no-q-free critical-shell shadow to all audit alternatives,
  while keeping SAT explicitly weaker than Euclidean realizability. The saved
  relaxed systems have a complete five-family metric-core partition. The active
  surplus-source follow-up checks six additional generic equality cores, for
  eleven proved consumers total. The direct surplus-source, six-row-anchor, and
  seven-point-orbit theorems exclude the saved assignments that first exposed
  those motifs. The complete v4 nine-core checkpoint is archived separately;
  v5 is rerunning every v4 `SAT` or `INDETERMINATE` packet under the eleven-core
  detector while inheriting only monotone v4 `UNSAT` rows. These assignments are
  incidence shadows, not Euclidean realizations.
  The arbitrary-`n` geometric producer therefore remains open;
  `metric_core_dependencies.py`
  audits exactly which packet-local assumptions each saved core uses.
  `equality_ideal_probe.py` independently mines exact QQ unit-ideal candidates
  from saved core-free assignments without promoting `NONUNIT` to real
  realizability.

## Multi-center checkpoint (2026-07-09)

The L2 GLOBAL / PROVEN sweep is complete through `n = 32`, and the exact
L2 LOCAL frontier scan is flat through `n = 64`: every scanned row from
`n = 29` onward has the same 3,375 class keys as the `n <= 28` baseline.
The certificate stack in `certificates/multi_center/` now proves completeness
of that L2/full-participant representative surface modulo profile
automorphisms. This is not yet a geometric GLOBAL-realization theorem.

## Current commands

```bash
uv run python census/incidence/escape_census.py --min-n 9 --max-n 9
uv run python census/multi_center/smoke.py
uv run python census/multi_center/multi_center_census.py local-summary --n-min 12 --n-max 14 --out census/multi_center/local_summary_n12_14.json
uv run python census/multi_center/multi_center_census.py global-profile --profile 4,5,6 --layer L2 --tier proven --summary-only --out census/multi_center/global_profile_456_l2_summary.json
UV_CACHE_DIR=/tmp/codex-uv-cache uv run --with sympy python -m census.q3_two_center.checkpoint --check
UV_CACHE_DIR=/tmp/codex-uv-cache uv run --with sympy python -m census.atail_force.checkpoint --check
uv run python -m census.card_head.profiles --n-min 12 --n-max 14
uv run python -m census.card_head.candidate_surface --n-min 12 --n-max 14
uv run python -m census.card_head.run_manifest contract
uv run python -m census.card_head.runner status census/card_head/runs/<run-id>/run_manifest.json
uv run python -m census.card_head.sat_encoding summary --cardinality 12 --profile 6,5,4
uv run python -m census.card_head.sat_encoding smoke-card12-654 --timeout-seconds 30
uv run python -m census.card_head.historical_bank scratch/census-12-gate
uv run python -m census.global_confinement.probe --n-min 11 --n-max 12 --workers 8 --out census/global_confinement/results_n11_12.json --markdown census/global_confinement/results_n11_12.md
uv run python -m census.global_confinement.placement_scan --n-min 11 --n-max 12 --workers 8 --out census/global_confinement/placement_results_n11_12.json --markdown census/global_confinement/placement_results_n11_12.md
uv run python -m census.global_confinement.placement_scan --n-min 13 --n-max 13 --workers 8 --max-nodes 300000 --row-type '(0, 0, 2, 2)' --row-type '(0, 2, 0, 2)' --out census/global_confinement/placement_zero_types_n13.json --markdown census/global_confinement/placement_zero_types_n13.md
uv run python -m census.global_confinement.zero_type_core_probe census/global_confinement/placement_results_n11_12.json census/global_confinement/placement_zero_types_n13.json --out census/global_confinement/zero_type_cores_n11_13.json --markdown census/global_confinement/zero_type_cores_n11_13.md
uv run python -m census.global_confinement.critical_shell_probe --n-min 11 --n-max 12 --all-placements --per-type 1 --workers 8 --max-nodes 300000 --out census/global_confinement/critical_shell_results_all_placements_n11_12.json --markdown census/global_confinement/critical_shell_results_all_placements_n11_12.md
uv run python -m census.global_confinement.shell_audit_probe --n-min 11 --n-max 12 --all-survival-frames --workers 8 --max-nodes 300000 --out census/global_confinement/shell_audit_results_all_frames_n11_12.json --markdown census/global_confinement/shell_audit_results_all_frames_n11_12.md
UV_CACHE_DIR=/tmp/uv-cache uv run python -m census.global_confinement.surplus_source_metric_core_probe --workers 7 --max-nodes 300000 --resume --out census/global_confinement/surplus_source_metric_core_results_n11_12.json
uv run python -m census.census_554.cover_probe_smoke
uv run python -m census.census_554.verify_completion --root scratch/census-554
uv run python -m unittest discover -s census/census_554/tests -t . -v
uv run --with sympy python -m unittest discover -s census/atail_force/tests -t . -v
uv run python -m unittest discover -s census/card_head/tests -t . -v
uv run python -m unittest discover -s census/global_confinement/tests -t . -v
```

When running in a restricted sandbox, set `UV_CACHE_DIR=.uv-cache` so
`uv` does not try to write to the user-level cache.
