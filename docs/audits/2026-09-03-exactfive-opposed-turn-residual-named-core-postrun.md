# Exact-five opposed-turn residual named-core postrun audit

## Verdict

PASS for the completed diagnostic lane. The terminal status remains
`NAMED_CORE_INCONCLUSIVE`; this audit establishes artifact custody and replay,
not source realization, theorem closure, Lean reachability, or promotion.

## Run and custody

- Run root: `scratch/runs/exactfive-opposed-turn-residual-named-core-20260903/run-0001`.
- Exact inventory: four root entries (`artifacts/`, `events/`, `run_manifest.json`,
  `tmp/`), eight query directories, two event files, 253 regular files, zero
  symlinks, and empty `tmp/`. Positive controls contain the additional semantic
  replay artifact; all other query trees have the expected 31-file inventory.
- Run manifest self-hash:
  `64df3eb804b1ee74f8edcd156a55ab47705426bd99d59e0d99dd17d7fb8aa9ad`.
  Launch self-hash:
  `b245d877d83ddac251188e936d9eeb7caa9516b8664ca6d3f1ac236427687f77`.
  Terminal self-hash:
  `4401514dff2ce768a97b9b92be0e320ca1b87e2017c70912fbfb2ec1259a646a`.
- The terminal replay command
  `uv run python scripts/run_exactfive_opposed_turn_residual_named_core_piqd.py --verbose`
  returned the stored terminal and revalidated all eight result trees,
  descriptors, original/journal SMT, source snapshots, named requests,
  frontiers, sessions, receipts, solver signatures, lifecycle records, and
  self-hashes. It constructed no transport and created no session. A replay
  with a mismatched server URL failed closed on launch mismatch before any
  transport call.

## Family collapse

The reconstructed family record has self-hash
`689ab5980aa0ba214f121db5bf081cf8fc924ce6034ff121b6bb411a378b3b6e`.

- `family-12`: profiles 360 and 467; exact set and multiset equality; 237
  assertion occurrences, 233 unique; set hash
  `d00e64bf85741b9c17617de71f2bce80c3a54e6e36e347a5a45db775657255fd` and
  multiset hash
  `a7a14098806456d967ba22dad05ed13f33fd641574af6f197defcf20857c54da`.
- `family-13`: profiles 363, 376, 470, and 483; exact set and multiset
  equality; 303 assertion occurrences, 299 unique; set hash
  `e5986432685e259a0f4644366378631e908ed6d121c15e0a74abc437eaa4576e` and
  multiset hash
  `40658cbf9375d5dfa342ec0abf1e79535ce26e0ad057f919810b9af4eea856c3`.
  Distinct role maps are retained in both families.

## Eight result records

All result self-hashes below were accepted by immutable replay.

| Cell | Result / effective status | Session | Solve time | Result self-hash |
|---|---|---|---:|---|
| z3-control-positive | SAT / `SAT_SEMANTICALLY_REPLAYED` | `09261552-d209-4259-a960-8fdfe5885063` | 5 ms | `9f1176a85910b1187410d0f7eb127a7c531714997373642811c0b7dd3b8d75c0` |
| z3-control-negative | UNSAT / `UNSAT_DISCOVERY_ONLY` | `ec39f008-8723-4906-b50a-36c36dcc83ac` | 6 ms | `f32a4bea2d1a3ac153c8d241490374582b747d58971a60398fc6e54f636c64c5` |
| z3-target-0360 | UNKNOWN / `INCONCLUSIVE_UNKNOWN` | `a8079fc8-e60d-422b-a378-7c05bbeda72e` | 60,013 ms | `22d3d231345595ce81716a9288ce9fb82eea7a52a14928aade40be10f0987e68` |
| z3-target-0363 | UNKNOWN / `INCONCLUSIVE_UNKNOWN` | `cf546595-4d3b-44cc-93b0-d1d1d5c2d865` | 70,669 ms | `69b75826e62e3ded68cd8a46ef8484200bb24218b6ab995c18829e9533fd34f7` |
| cvc5-control-positive | SAT / `SAT_SEMANTICALLY_REPLAYED` | `da998580-7a8b-4fd3-a371-2d2b5a8fc301` | 8 ms | `a3790dd2633c87e6e4590416e1498aee9d963e623401077c2ad7e258d93d15f4` |
| cvc5-control-negative | UNSAT / `UNSAT_DISCOVERY_ONLY` | `81e1179c-3c7d-4ea4-a64f-8d3700121058` | 5 ms | `725d76c3761e67eb3c0fa6e7b8dbb2cc55b64f8cb49a21155c1040ff9c998c53` |
| cvc5-target-0360 | UNSAT / `UNSAT_DISCOVERY_ONLY` | `f64fc66c-7533-481d-af97-f9704d081e57` | 22,199 ms | `7c9589c72f7e155c49e0f73fe312ef32b747ea194a95580d5ee4ce68978bb9a2` |
| cvc5-target-0363 | UNSAT / `UNSAT_DISCOVERY_ONLY` | `64c0c899-0071-4bca-9a88-1598b15fb1bd` | 2,110 ms | `1e15a9553ef01c0f9bbd6e69bba1073090cf101bf6f5d6298c5fa5e68b49f18a` |

## Target named cores and controls

- cvc5 family-12 core size 11:
  `assume_normalization_000`, `assume_row_003`, `assume_row_006`,
  `assume_area_011`, `assume_area_012`, `assume_area_015`, `assume_area_034`,
  `assume_area_041`, `assume_area_115`, `assume_area_164`, `assume_area_186`.
- cvc5 family-13 core size 5:
  `assume_normalization_000`, `assume_row_009`, `assume_area_091`,
  `assume_area_116`, `assume_area_271`.
- Both cvc5 cores are nonempty and nonterminal, with `named_core_support: true`;
  their ordered labels and source atom IDs reconstruct from the authenticated
  ledgers. Both cvc5 target sessions are fresh and have one solve.
- Both positive controls passed exact rational replay through the frozen parent
  verifier. Both negative controls returned the expected named UNSAT control
  cores. Z3 target UNKNOWN records have no core and remain inconclusive.
- Solver custody is pinned to cvc5 `1.3.3`
  (`fae4cef47a4e82e3b37f8928b5cb275c8a86d138a33e49d54a9933a157b57f74`) and Z3
  `4.17.0`
  (`b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`). The
  result records bind each solver SHA-256, request SHA-256, session identity,
  receipts, and lifecycle. No session IDs cross cells; no request was replayed
  or resumed.

## Validation

`uv run pytest -rA census/card_head/tests/test_exactfive_opposed_turn_residual_named_core_piqd.py`
passed all 46 tests in 57.50 seconds. This includes exact family collapse,
ledger expansion, controls, SAT replay, target UNKNOWN handling, transport-loss
handling, mutation fail-closed checks, session freshness/resume, inventory, and
false-claim boundary tests.

No implementation, target query, solver session, Lean file, promotion record,
or theorem claim was created by this audit.
