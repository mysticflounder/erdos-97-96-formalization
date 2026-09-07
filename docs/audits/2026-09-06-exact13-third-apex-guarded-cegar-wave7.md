# Exact13 third-apex guarded CEGAR Wave7 audit

Status: NONTERMINAL partial evidence. This is a solver/certificate lane only;
it makes no Lean, UNSAT, closure, promotion, or survivor claim.

## Identity and inputs

- Lane: `exact13-third-apex-guarded-cegar-wave7-20260906`.
- Recorded lane base: `427d96c66139235abc05ce12edbca3845c4d1b4e`.
- The worktree advanced through foreign descendant commits during the lane;
  no reset, rebase, amend, or history mutation was performed. The producer's
  top-level reseal did not complete, so its `execution_head` field is null;
  the recorded base remains the authenticated lane identity.
- Independent Wave6 replay input: commit `31ffc3a38`, audit
  `docs/audits/2026-09-06-exact13-wave6-partial-replay.md` (SHA-256
  `2f22645dec2bad1e5b3b8f129cfd6c194e91a51c3e74518954db910ac4fa6983`), and
  receipt `scratch/runs/exact13-wave6-partial-replay-20260906/run-0001/partial-replay-receipt.json`
  (SHA-256 `328919a9ff0501621231094fd529b1ec4f15b6c3f75af7140549d2d5d12f3c11`).
- Historical Wave6 bank: exactly 63,509 rows, SHA-256
  `2f18fb2f8930767e641049286dbe40da7d6fb0b8543f20fc8abd519483c8b8c2`.
- Source theorem: `CardGeThirteenExact13ThirdApexSourceCoverage`; source file
  SHA-256 `45bc7b77df0d110237f79ccc27ba0458a45390129a7233ecead117cc5b98edce`.

## Fresh root and import replay

The fresh root preserved the 432-variable Wave6 root and added exactly 550
source-entitled third-apex clauses. It added no variables and has 31,833
clauses. Each new clause contains both the source-row and target-`G2`
activation guards. The inherited root SHA-256 is
`238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f`; the
fresh emitted CNF SHA-256 is
`fa62c407aafb75eae710acea7c3dfc15ccb1fa9303fade3d80a6985fb01dfc8a`, and
the PIQD-normalized journal SHA-256 is
`4225a942bd65ab83a2f352492d79e2e62d8b77dbd7d62f2079fbaf330d732267`.

All 63,509 imported certificates, source paths, zero-sum projections, and
parent-model relations were replayed. The replay retained historical
StrongValid semantics rather than using them as a new cut antecedent. The
import event records 4,431 first-6,000 outside-StrongValid parents, 1,569
first-6,000 StrongValid parents, and 59,078 aggregate StrongValid replays.
Its separately recorded `later_strongvalid` field is 57,000, which does not
sum with the first-6,000 fields to 59,078 (the implied later count is 57,509).
This internal partition inconsistency is retained and is a reason this lane
is not promotable.

## PIQD run and retained evidence

The isolated PIQD session was
`08e99ab9-66fd-4bbf-9209-9500e0b5fceb`, using
`piqd-satworker-cadical-3.0.1` (solver SHA-256
`d2cb8bd4440f2fae71d9d03373dd471b185aec26b5b5f3488f1fbed701c16736`). It
performed 14,288 SAT solves and produced 14,288 new model/cut pairs. The
configured additional-refinement limit was 20,000, solve timeout 120,000 ms,
and loop wall budget 3,600 seconds. The recorded total wall elapsed was
4,246.772 seconds, so this is not a strict total-wall-compliant run; setup and
terminal overhead are not hidden. The PIQD terminal status was `WALL_BUDGET`
with final solve status `SAT`; no survivor was recorded.

The run recorded 67,057 one-form cuts and 10,740 two-form cuts. The configured
strict-form universe is 1,430 forms. No full exact-rational 1,430-form cone
diagnostic was triggered because the retained refinement path used one/two-form
cancellation; therefore no cone certificate is claimed.

The retained new-model replay event reports all 14,288 models passing root
satisfaction, `Key.Valid`, `GlobalOneBoundaryValid`,
`GlobalThirdApexValid`/`ThirdApexStrongValid`, and selected-decoder replay. A
separate exhaustive cut-file audit found all 14,288 new cuts carrying source,
path, zero-sum, and F1–F7 evidence. These are formula-scoped checks only.

The producer exited nonzero during its required post-loop verifier because the
Wave5 adapter supplied the historical Wave6 root hash to the Wave7 new-model
verifier. The first model was consequently rejected against the wrong hash.
An immediate local replay against the recorded fresh emitted-root hash passed
all 14,288 models; this repaired diagnostic does not turn the PIQD run into a
closure result. The delegated PIQD `events/run.json`, session state, root,
import report, model/cut events, receipts, and run manifest are retained. No
fabricated terminal or closure artifact was added.

## Retained paths and validation boundary

The generated root is
`scratch/runs/exact13-third-apex-guarded-cegar-wave7-20260906/run-0001/`.
Its durable manifest is `run_manifest.json`; the stopped isolated PIQD
database, lock, journal, and receipt stream are retained as exact runtime
durable paths in the checkpoint. The producer, five-test module, checkpoint,
and this audit are the only Wave7 source/document paths in scope.

Validation completed: five tests passed; Ruff passed; Python syntax compilation
passed; the checkpoint self-hash was recomputed; cut and model replay audits
passed. Worktree hygiene remains globally blocked by pre-existing foreign
dirty/staged/untracked paths, while the Wave7 generated-root scope is recorded
with its exact PIQD runtime files. No foreign path was staged or modified, and
there was no commit or push.
