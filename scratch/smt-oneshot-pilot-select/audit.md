# SMT_ONESHOT pilot selection audit

Date: 2026-08-14
Scope: read-only selection for the first shared `SMT_ONESHOT` registry-engine
migration. No live PIQD daemon or solver was invoked.

## Selection

Select **ATail named-polynomial geometry** as the pilot:

`census/atail_force/piqd_cvc5_adapter.py`

This is the lowest-risk representative of the current callers that already use
`census.p97_search.phase3_piqd_smt_source_adapter`:

- one producer packet (`PreparedGeometryQuery`), one fresh cvc5 SMT session,
  one assertion batch, and one solve (`run_prepared_query`, lines 90, 1350--1407);
- no staged control flow, batch loop, second solver, named-core route, local
  fallback, or campaign scheduler;
- the existing neutral adapter already owns session/receipt/result-digest
  authentication, so the migration seam is the bespoke output wrapper and
  launcher, not PIQD protocol behavior;
- SAT is accepted only after exact-rational replay of every enabled polynomial
  relation, while empty-assumption UNSAT is explicitly
  `UNSAT_DISCOVERY_ONLY` (`piqd_cvc5_adapter.py`, lines 1380--1403 and
  2074--2112);
- the wrapper has a complete standalone descriptor-based validator,
  `validate_run_directory`, which reconstructs the packet from persisted bytes
  and performs a final no-follow recapture (`piqd_cvc5_adapter.py`, lines
  2153--2173);
- the source custody boundary is already finite and explicit: exactly five
  maintained producer files in `REQUIRED_SOURCE_PATHS` (lines 43--51), with
  exact bytes and identity checks before and after execution; and
- the fake transport models the exact current SMT routes, including response
  loss/reconciliation and durable receipt state
  (`census/atail_force/tests/test_piqd_cvc5_adapter.py`, lines 133--300).

The data-only profile can therefore carry the existing cvc5/SMT state-journal,
empty-assumption, complete-readback, timeout, source-manifest, and semantic
validator identity fields without changing the producer's polynomial ledger.
The generic engine should preserve the current result labels and false-claim
boundary; it must not infer theorem or proof meaning from cvc5 UNSAT.

## Active-caller comparison

| Caller | Current topology | Focused test surface | Pilot risk |
|---|---|---:|---|
| `census/atail_force/piqd_cvc5_adapter.py` | one cvc5 session/solve; exact polynomial replay; source snapshots; standalone validator | 30 adapter tests; ATAIL script selects 6 additional guard tests (36 total) | **Lowest** |
| `census/global_confinement/metric_realizability_piqd_cvc5.py` | one cvc5 session/solve, but frontier selection/source reauthentication, deadline extensions, and `phase3_piqd_freshthird_smt_session` dependency | 30 metric + 33 neutral tests = 63 in `scripts/test-p97-piqd-global-metric-cvc5.sh` | medium |
| `census/endpoint_confinement/metric_realizability_piqd.py` | one system with 2--3 ordered Z3 stages and stage-dependent control flow | 40 tests in `scripts/test-p97-piqd-endpoint-metric.sh` | high: not a one-shot profile |
| `census/p97_search/phase3_piqd_survivor_cvc5.py` | wave publication around many systems, each with cvc5 one-shot sessions | 21 adapter + 22 canary + 9 driver + 33 neutral = 85 in the focused script | high: wave/canary lifecycle |
| `census/p97_search/a_core_metric_piqd.py` | endpoint-derived multi-stage Z3 route per A-core order | 6 direct tests; shares endpoint staged semantics | high |
| `census/p97_search/phase3_survivor_metric_piqd.py` | endpoint-derived multi-stage Z3 route per survivor/order | 21 direct tests; source-stream and staged replay | high |
| `census/global_confinement/metric_realizability_piqd_core_miner.py` | core-mining orchestration over the global metric adapter | 18 direct tests | high: assumption/core mining and campaign artifacts |
| `census/global_confinement/pinned_generalm_piqd.py` | 45 fresh Z3 queries with bit-vector replay | 17 tests | highest: repeated campaign and coverage custody |
| `census/rigid221_pentagon_piqd.py` | multi-stage finite campaign, optional named-core follow-up, many one-shot Z3 sessions | 19 tests | highest: campaign + named-core/source surface |

The comparison uses static source/test inspection only. The neutral adapter
itself has 33 focused tests (`test_phase3_piqd_smt_source_adapter.py`).

## Baseline focused commands (not executed here)

The existing ATAIL baseline is:

```text
scripts/test-p97-piqd-atail-geometry.sh
```

Its pytest invocation is fake-transport-only and collects 30 tests from
`census/atail_force/tests/test_piqd_cvc5_adapter.py` plus six selected guard
tests from `test_cvc5_pilot.py`, `test_inequality_pilot.py`, and
`test_producer_geometry.py`; it then runs py_compile, Ruff check, and Ruff
format checks. The script explicitly caps native thread pools and does not
contact PIQD or a solver.

## Pilot ownership and compatibility boundary

The pilot owns these current files:

- `census/atail_force/piqd_cvc5_adapter.py` — bespoke packet runner,
  publication wrapper, and standalone validator;
- `census/atail_force/tests/test_piqd_cvc5_adapter.py` — fake transport,
  semantic replay, custody, reconciliation, and offline-validator tests;
- `docs/specs/atail-piqd-cvc5-geometry-v1.md` — current trust/result contract;
- `scripts/test-p97-piqd-atail-geometry.sh` — focused compatibility gate; and
- the five source-custody inputs declared by the adapter:
  `census/atail_force/producer_bank.py`,
  `census/atail_force/producer_geometry.py`,
  `census/atail_force/producer_mus.py`,
  `census/atail_force/producer_probe.py`, and
  `census/atail_force/producer_surface.py`.

The shared-engine change should add an authenticated data profile for this
packet (profile/semantic data and source references) and a registry entry for
`SMT_ONESHOT`; it should not rewrite historical ATAIL outputs or alter the
five producer files merely to fit the registry.

After a compatibility window that reproduces the current descriptor, journal,
SAT replay evidence, UNSAT classification, and offline-validator result, the
sole bespoke execution wrapper that becomes a removal/deprecation candidate is
`census/atail_force/piqd_cvc5_adapter.py` (specifically its
`run_prepared_query`/publication orchestration and duplicated persisted-run
validator). The test file and script should first be retained as the
compatibility oracle, then reduced or redirected to the shared engine. The
five producer source files and the semantic verifier remain owned inputs, not
removal candidates. The spec remains the historical contract/receipt
compatibility record; it is not a deletion candidate.

## Non-goals / gates

- Do not make cvc5 UNSAT a proof, named core, or theorem result.
- Do not broaden the pilot to endpoint staged routes, wave campaigns, or the
  45-query pinned-generalm surface.
- Before retiring the wrapper, shadow-validate normal SAT, diagnostic UNSAT,
  committed-response reconciliation, source replacement/custody failures,
  semantic replay rejection, and the complete offline inventory through the
  registry engine using the existing fake transport.

