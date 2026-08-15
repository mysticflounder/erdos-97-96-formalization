# SMT one-shot caller census (read-only)

Scope: active non-test Python under `census/` and `scripts/`, excluding saved
`.smt2`/JSON artifacts. The neutral engine is
`census/p97_search/phase3_piqd_smt_source_adapter.py`; its public one-shot
boundary is `run_authenticated_single_solver_query` (one fresh PIQD session,
one solve, durable receipt reconciliation, and SAT semantic replay). The
neutral module's `run_source_semantic_query` is a two-solver `z3 -> cvc5`
diagnostic route, but no active caller invokes it directly.

## Direct neutral-adapter callers

All rows below construct a `SourceSemanticQuery`, preserve producer bytes in
an immutable output tree, and supply a producer-specific exact-rational
`verify_sat_model`; SAT is therefore semantically replayed, while UNSAT is
diagnostic. “Registry” means the producer could eventually register a data
record plus verifier/custody callbacks in a shared `SMT_ONESHOT` engine; it
does not mean the producer's source preparation or validator can disappear.

| Caller (import/call anchors) | Solver(s) | Source custody / semantic replay | CLI/default route | Registry fit |
|---|---|---|---|---|
| `census/p97_search/a_core_metric_piqd.py:612` (driver dispatch at `a_core_metric_driver.py:919`) | Z3, one session/order | Captures manifest, RESULTS, encoding spec, five physical leaves; `metric_piqd.verify_sat_model` replays every atom | Driver has `piqd` default; `legacy-local-z3` explicit | **Yes**, canonical Z3 metric row |
| `census/p97_search/phase3_survivor_metric_piqd.py:644` (driver at `phase3_survivor_metric_driver.py:948`) | Z3, one session/order | Captures source manifest/record/survivor packet; exact-rational metric replay | Driver has `piqd` default; `legacy-local-z3` explicit | **Yes**, same metric family as A-core |
| `census/endpoint_confinement/metric_realizability_piqd.py:2121` (probe dispatch at `metric_realizability_probe.py:1529`) | Z3, one session/stage | Captures source record plus producer Python/JSON snapshots; exact-rational row replay | Probe has `piqd` default; `legacy-local-z3` explicit; PIQD requires workers=1 | **Yes**, generalized staged metric row |
| `census/global_confinement/metric_realizability_piqd_cvc5.py:1041` | cvc5, one session/system | Captures `system-record.json` and exact original/journal SMT2; exact-rational replay | CLI execution (`--system-id`/`--input`/`--out`) defaults to this PIQD cvc5 path; `--check` is standalone | **Yes**, cvc5 metric row with profile `nl-cov` |
| `census/atail_force/piqd_cvc5_adapter.py:1373` | cvc5, one session/query | Captures required ATAIL source Python files and query bytes; exact-rational polynomial replay | Library adapter (no production `main`); invoked by ATAIL tooling | **Yes**, cvc5 geometry row, but source verifier is ATAIL-specific |
| `census/global_confinement/pinned_generalm_piqd.py:1553` (script dispatch at `scripts/pinned-generalm-certificate-coverage.py:387`) | Z3, one session/query | Captures pinned-generalm source record, incidence/context bytes; exact-rational replay | Script backend defaults `piqd`; `legacy-local` explicit | **Yes**, source-bound Z3 row |
| `census/rigid221_pentagon_piqd.py:341,778` (named-core engine at `:1215`) | Z3, one fresh session for metric/stage5/named-core query | Captures ledger/source records and exact SMT2; separate metric, stage5, and named-core replay validators | CLI `--output` runs PIQD; `--check` is standalone; no local fallback | **Partial**: shared engine can replace each inner one-shot, but campaign/named-core validator remains specialized |

## Direct imports that are wrappers/validators, not a neutral one-shot call

These are active and must be included in consolidation planning even though
they call neutral private helpers or transport rather than the public engine.

| Caller | Actual route | Custody/replay and CLI | Registry fit |
|---|---|---|---|
| `census/p97_search/phase3_piqd_survivor_cvc5.py:902,1245` | Custom cvc5 wave engine (`neutral._run_solver`), one fresh session per survivor system; no Z3 | Source system records + exact SMT2; `neutral._semantic_replay` and a custom wave validator; CLI defaults PIQD cvc5, `--check` validates | **Partial**: data rows can feed shared cvc5 engine, but wave aggregation and validator are producer-specific |
| `census/p97_search/phase3_piqd_freshthird_smt_session.py:2739` | Custom sequential Z3 then cvc5 engine over 12 fixed cases | Frozen source-root authentication, current-source hash comparison, per-solver journals/receipts, independent offline replay; CLI `--output` runs, `--check` validates | **Partial/no immediate**: shared engine covers sessions, but frozen-wave suffix normalization, download route, and fixed-case validator are bespoke |
| `census/global_confinement/metric_realizability_piqd_core_miner.py:1044+` (neutral transport/helpers at `:570,1928`) | Custom cvc5 deletion-mining plus two Z3 validation solves; sequential PIQD | Source system/input packet custody and custom solve/receipt replay; CLI `--check` standalone or `--system-id` mining, workers forced 1 | **No for one-shot registry as a whole**; only individual solves could be registered; deletion/minimization orchestration stays |
| `census/endpoint_confinement/metric_realizability_probe.py:1497` | PIQD branch delegates to the metric adapter; legacy branch is local Z3 (`z3.SolverFor`) | PIQD branch has source/replay/custody; local branch has no PIQD custody | **Partial**: registry only for PIQD branch; retain explicit legacy route until separately retired |
| `census/p97_search/phase3_survivor_metric_driver.py:874` | PIQD branch delegates to metric adapter; legacy branch is local Z3 | PIQD branch source/replay; local route is explicit and non-custodial | **Partial**, same split as probe |
| `scripts/run-p97-piqd-survivor-cvc5-canary.py:398` | Orchestration/canary around the custom Phase-3 cvc5 wave | Captures/validates canary leaf and immediately revalidates publication; CLI is always PIQD (`--server`, `--output-dir`) | **No as data row**; retain as a live canary, but it should call the shared wave/registry entrypoint |
| `scripts/pinned-generalm-certificate-coverage.py:363` | Orchestrates pinned-generalm PIQD or explicit legacy-local backend | Calls `pinned_generalm_piqd` and standalone publication validator | **No as data row**; retain as CLI orchestration after backend migration |

## Standalone/adjacent SMT wrappers found by one-shot search

`census/global_confinement/metric_realizability_cvc5.py` and
`metric_realizability_cvc5_core_miner.py` are legacy local cvc5/subprocess
producer/miner code (the latter also invokes local Z3); they do not import the
neutral adapter and are not PIQD custody routes. They are the clearest legacy
solver wrappers to retire once their PIQD replacements and saved-artifact
validators are authoritative. `census/endpoint_confinement/metric_realizability_probe.py`
also contains the explicit local-Z3 fallback described above.

`census/p97_search/phase3_piqd_freshthird_smt_session.py` is the only active
standalone two-solver SMT session wrapper with its own transport/session
protocol; it is not a thin alias of the neutral engine.

## Candidate legacy files for eventual retirement

After producer data and replay/custody callbacks are registered, the thin
one-shot wrappers whose execution bodies can be retired/consolidated are:

* `census/p97_search/a_core_metric_piqd.py`
* `census/p97_search/phase3_survivor_metric_piqd.py`
* `census/endpoint_confinement/metric_realizability_piqd.py`
* `census/global_confinement/metric_realizability_piqd_cvc5.py`
* `census/atail_force/piqd_cvc5_adapter.py`
* `census/global_confinement/pinned_generalm_piqd.py`
* `census/rigid221_pentagon_piqd.py` (only its inner one-shot runners; keep
  campaign/source-specific validators until split out)

Do **not** retire wholesale in the first migration: `phase3_piqd_survivor_cvc5.py`,
`phase3_piqd_freshthird_smt_session.py`, and
`metric_realizability_piqd_core_miner.py`; their wave/mining/offline replay
contracts exceed the current one-shot API. Keep the two CLI orchestration
scripts and the explicit local-Z3 fallback until their callers are migrated.

## Shared-engine requirements exposed by the census

The registry needs at least: solver/profile (`z3`/`cvc5`, including `nl-cov`),
exact source-file descriptors and bytes, state-only journal normalization,
assumption/readback IDs, producer semantic verifier, immutable output layout,
PIQD transport, and a standalone validator hook. A single common engine is
data-only for the seven direct one-shot producers above; wave/campaign
aggregators, deletion miners, frozen fresh-third replay, and local fallback
routes remain control code.
