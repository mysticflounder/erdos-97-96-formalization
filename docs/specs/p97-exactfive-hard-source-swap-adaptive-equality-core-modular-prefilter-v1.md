# P97 exact-five adaptive equality-core modular prefilter v1

Status: implementation specification. No target computation has been launched by
this document.

## Purpose and claim boundary

This lane asks PIQD-managed Singular to compare two basis commands over
`GF(32003)` for each of the two affine gauges already used by the completed
characteristic-zero equality-core run. Its sole purpose is to choose a basis
route for a possible later computation. A modular `UNIT` or `NONUNIT`
diagnostic is not a conclusion over `QQ`.

Every mathematical, source, theorem, Lean, and promotion claim is false. The
lane does not prove complex infeasibility or real feasibility and does not
establish a source realization.

## Authenticated predecessor

Before creating a launch record or submitting a query, the producer imports
`census/card_head/exactfive_hard_source_swap_adaptive_equality_core_piqd.py`
and replays its completed run locally. A runner factory that always raises is
passed to that replay, so any missing predecessor artifact fails before a
transport can be constructed.

The predecessor producer source, its specification, `run_manifest.json`,
`events/launch.json`, `events/terminal.json`, and durable summary are checked
against exact SHA-256 constants. Their internal self-hashes are recomputed.
The durable summary must bind the three run files, record
`PASSED_NO_TRANSPORT`, show all four controls passing, and show both
characteristic-zero targets timing out. Its authenticated source core supplies
the class map, rows, orders, origins, and gauges used here.

## Fixed query matrix

The run contains eight sequential queries with one worker:

1. `control-unit-linear`, using `slimgb`, expected `UNIT`;
2. `control-nonunit-linear`, using `slimgb`, expected `NONUNIT`;
3. `control-unit-distance`, using `slimgb`, expected `UNIT`;
4. `control-nonunit-distance`, using `slimgb`, expected `NONUNIT`;
5. gauge `z3`, using `slimgb`;
6. gauge `z3`, using `std`;
7. gauge `cvc5`, using `slimgb`;
8. gauge `cvc5`, using `std`.

Each target is reconstructed through the current characteristic-zero producer.
For a fixed gauge, the `slimgb` and `std` queries have byte-for-byte identical
variable and polynomial lists. Each has exactly 18 variables and 13
polynomials. The two gauges carry the same order-independent template from the
predecessor. There are no inequalities, saturation factors, `lp` rings, or
elimination computations.

Every ring is declared over characteristic `32003` with order `dp`.

## Renderer and transcript

For a chosen basis command the producer emits `ideal G = slimgb(I);` or
`ideal G = std(I);`, followed by exactly one marked result block:

```text
P97_MODULAR_PREFILTER_RESULT_BEGIN
basis_size <integer>
dim <integer>
vdim <integer>                 # present exactly when dim is zero
reduce_one <zero-or-one>
P97_MODULAR_PREFILTER_RESULT_END
```

The `vdim` line is absent when `dim` is not zero. No blank, indented,
trailing-space, carriage-return, or other stdout line is allowed. The block has
one final newline. Values use bounded canonical decimal syntax.
The parser requires a positive basis size, `dim >= -1`, positive `vdim` when
present, and `reduce_one` in `{0,1}`. A zero remainder requires `dim = -1`, no
`vdim`, and basis size one. A remainder of one requires nonnegative dimension.

All completed transcripts must be strict UTF-8. The PIQD receipt must be
untruncated, have status `RAN`, exit code zero, and empty stderr. A malformed
transcript or any other completed-process defect fails closed. A clean PIQD
`TIMED_OUT` result with empty streams becomes `MOD_TIMEOUT`.

## Controls, agreement, and selection

Controls execute first and stop the lane on the first mismatch or timeout.
For each gauge, if both basis commands complete, their `MOD_UNIT` or
`MOD_NONUNIT` diagnostics must agree. Disagreement fails closed without a
terminal record.

If one command completes, it is selected. If both complete, the producer
selects lower authenticated PIQD `wall_ms`, then smaller `basis_size`, then the
algorithm name as a deterministic final tie break. If neither command
completes for one gauge, that gauge has no selection and the terminal status is
`MOD_PARTIAL_TIMEOUT` provided the other gauge has a selection. If all four
targets time out, the authenticated terminal status is `MOD_ALL_TIMEOUT`.

The terminal may otherwise record `MOD_BOTH_GAUGES_UNIT`,
`MOD_BOTH_GAUGES_NONUNIT`, or `MOD_GAUGE_DISAGREEMENT`. These names describe
finite-field diagnostics only.

## PIQD custody and replay

Execution goes only through
`census/global_confinement/piqd_singular_backend.py`. There is no local solver,
subprocess runner, or fallback. Request IDs are deterministic UUIDv5 values
derived from the complete source context. The context binds the coefficient
field, `dp`, basis command, variables, polynomials, script hash, predecessor
custody, timeout, one-worker sequential profile, omitted ledger, and false
claims.

The governed run root is
`scratch/runs/exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-20260903/run-0001/`.
Its inventory is exactly immutable `run_manifest.json`, `artifacts/`,
`events/`, and empty `tmp/`. The manifest repeats checkpoint base head
`24f982d5e1d56525719cc6b499e044451ea921ac`, and pins the current producer,
runner, backend, specification, checkpoint, predecessor source/specification,
and predecessor run files.

Events contain only immutable self-hashed, canonical-byte `launch.json` and,
after a successful lane, immutable self-hashed, canonical-byte `terminal.json`.
Every existing directory component from the repository root through the run
root is checked as a real directory rather than a symlink. Artifact directories use the
eight fixed query keys and inherit the backend's exact inventory and hash
checks. A completed replay constructs no runner, performs no transport, checks
all artifacts and transcripts, reconstructs both selections and the terminal,
and requires exact identity.

The CLI prints nothing on success unless `--verbose` is passed, in which case
it prints compact sorted JSON. It exposes only `--server`, `--timeout`, and
`--verbose`.
