# Adaptive order/NRA run-0001 result audit — 2026-09-03

Status: completed, replayed, and inconclusive at the planar stage.

## Outcome

All four positive/negative controls passed with agreement between Z3 and cvc5.
The blocked-order structural QF_LIRA target was `SAT/SAT` and both exact local
replays produced a genuinely fresh full class order:

- Z3: `c000,c010,c009,c005,c008,c007,c001,c006,c002,c004,c003`;
- cvc5: `c000,c008,c009,c007,c005,c010,c001,c006,c002,c004,c003`.

The two authenticated orders were tested by independently reconstructed planar
QF_NRA cells. Both engines returned `UNKNOWN` for both cells. Z3 returned after
306–321 seconds; cvc5 reached the daemon's effective 330-second deadline. No
coordinate model exists in the retained output, and `UNKNOWN` supplies no
mathematical evidence. The terminal status is therefore `PLANAR_UNKNOWN`.

## New-data mine

The fresh orders share

`c000 < c009 < c001 < c006 < c002 < c004 < c003`,

or in source roles,

`U+c1 < x < O < t+e < c2+q < d < a`.

They vary only in the early placement of the `p+s`, `u`, `v`, and `y`
classes. The common `d<a` tail reinforces the already recorded conditional
direct-branch endpoint order, but the wave does not prove a new source theorem
or a stable planar obstruction. Consequently no new concrete theorem candidate
was produced and the repository Lean-corpus search was not triggered.

## Custody

The run is bound to profile 1697, one round, two workers, a 300-second requested
timeout, the initialized run manifest, and implementation commit
`13eb8ca6e9e884f7bfe77c69b57fde8e3b4ab106`. The terminal self-hash is
`e783b4a715dffaf73079381f3d5e978b0cdb7de0c2c1044a1424b4a5217f1af4`.
An immediate completed resume replayed the entire retained tree in 1.01 seconds
without constructing a transport or making a solver request.

The outer launcher used 659.97 seconds wall time, 1.18 seconds user CPU, 0.18
seconds system CPU, and about 46 MB peak RSS. Solver CPU belongs to the shared
PIQD daemon and is not represented by those launcher CPU figures.

The machine-readable receipt is
`docs/computation/exactfive-hard-source-swap-adaptive-order-nra-20260903/run-0001-summary.json`.
All theorem, source-realization, all-order, live-closure, and promotion claims
remain false.

## Next step

Do not extend the QF_NRA timeout. The next computation should strip each fresh
cell to the gauge plus its 13 squared-distance row equalities and run an exact
characteristic-zero algebraic probe through PIQD's Singular service. A unit
ideal would exclude that fixed cell even over the complex numbers. A nonunit
result remains diagnostic and must be followed by real feasibility and
orientation checks. Direct `msolve` use is not permitted by this repository's
PIQD-only solver policy unless that engine is first integrated into PIQD.
