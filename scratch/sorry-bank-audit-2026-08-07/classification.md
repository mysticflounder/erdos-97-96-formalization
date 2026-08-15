# Current Lean `sorry` audit (2026-08-07)

The preferred analyzer was run report-only against the current checkout (no
build): `lean4-skills-sorry-analyzer --report-only --json`.

## Counts

| population | count |
|---|---:|
| analyzer source `sorry` tokens | 340 |
| files containing source `sorry` | 29 |
| raw `rg` `sorry` token matches | 415 |
| raw matches that are comment/string/mention only | 75 |
| source sorries under `lean/` | 43 |
| source sorries in FrontierLiveClosure production files | 40 |
| current headline/proof-spine open source declarations | 30 |
| imported production source declarations currently off-spine | 10 |

The complete per-file/per-line/declaration inventory is `inventory.tsv`; the
43 `lean/` rows are in `lean-inventory.tsv`; the 75 non-source matches are in
`comment-or-string.txt`; and per-file totals are in `by-file.txt`.

## Namespace and reachability classification

All 40 FrontierLiveClosure production rows are source sorries in namespace
`Problem97.ATailFrontierLiveClosure`. The four `TwoSource*` files add the
following nested namespaces:

* `TwoSourceCanonicalSurface`, `TwoSourceFirstFiberCollision`, and
  `TwoSourceFreshThirdFiber`: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`.
* `TwoSourceFreshThirdResidual`:
  `Problem97.ATailFrontierLiveClosure.FreshThirdTwoCapSourceObstruction`.

The generated blueprint snapshot (`docs/live-blueprint.md`) names 30 open
source declarations (plus a separate `sorryAx` obligation). In that snapshot
they are all reachable from the headline target
`Problem97.erdos97_rhs`; allocation is: Rigid221Closure 5, Rigid221Placement
5, Rigid221SourceHeavy 6, TriApexEndpointRetainedOmission 9,
TwoDeletionCollision 3, TwoSourceCanonicalSurface 1, and
TwoSourceFreshThirdFiber 1.

The ten imported-but-off-spine production rows are exactly: the
`Rigid221Closure` row at line 985; the two `Rigid221SourceHeavy` rows at
lines 10106 and 10142; both
`TwoSourceFirstFiberCollision` rows; and all five
`TwoSourceFreshThirdResidual` rows. They remain imported by the aggregate
FrontierLiveClosure module but are not among the 30 blueprint leaves in that
snapshot. The snapshot itself warns that `proof-blueprint spine` should be run
for a fresh reachability result; no build or refresh was run for this audit.

The remaining 300 source sorries are off-spine scratch/attic/comparator or
parked fidelity material: `comparator/Challenge.lean` (30), `attic/U2OppCap2Escape.lean`
(2), scratch clones/probes (265), and the two C-package plus one E-package
FidelityCheck declarations (3). Their exact rows and analyzer declaration
labels are in `inventory.tsv`.
