# V15 terminal authentication

Audit time: `2026-08-02T06:05:14-07:00`

Run directory: `scratch/retained-omission-e1/round5-general-cegar/artifacts-v15/20260802T123740.570422Z-v11-16-replay-pid90447`

## Verdict

**AUTHENTICATED TERMINAL INCOMPLETE — NO CASE CLOSED.** The run is a coherent, immutable 16-case replay artifact whose recorded source, selection, formula, auxiliary-artifact, and summary hashes agree with the live files checked at audit time. Every case ended `unknown` with reason `canceled` after one approximately 600-second full check. No result is SAT or UNSAT, and the summary has `complete: false`.

This is an artifact/provenance authentication, not a solver replay or a Lean verification. No solver, Lean command, Lake build, or network access was used.

## Invocation and live-file provenance

The invocation records `argv = ["run_v15_v11_16_replay.py"]`, 16 cases, 8 workers, a 30,000 ms Boolean-prepass timeout, and a 600,000 ms full-check timeout. Both phases permit at most 2,000,000 candidate cuts and 256 learned cuts. Its own SHA-256 is `7c14a0de5e7e0e928422ec6106fe6130e4590389b14d9da9ac16372c865bc59b`.

Every file named in the invocation provenance existed and matched its recorded SHA-256 byte-for-byte:

| Recorded input | SHA-256 |
|---|---|
| `run_v15_v11_16_replay.py` | `35e5a85cae57034708c6f58edab2883eacbc62422f050a6f06e9aea2887c8822` |
| `run_v14_adversarial_replay.py` | `7ca615a837c7bbc11d121658d30c4f1555c6c37bf7df7c1b54145ddb1822f33c` |
| `run_v13_global_k4_lift.py` | `45470dd8282be615c90a3a324306e35d73452dbd281473d377b3a26415345849` |
| `run_v12_power_cegar.py` | `8da7127a36dafdbce667edcd44ebef0db62eb2245ad832f373817c4bc28df1c9` |
| `run_v8_exact_full.py` | `e0c98be80b2729cf50ee1d9da6c081fc4db2095e66abfb3c85abfbf5799b7162` |
| `mine_power_cuts_v9.py` | `f0bcb74f5117cd0fc47e524fc222e7c1a435bc8a85785f7e4dbbc504f35cc25e` |
| `schema_v15.json` | `54dc8e54fb86f024deaae5ea60a7f2f46f31fd08e5ccc794b4398cf3b211a262` |
| `uv.lock` | `a942a01001ddeeb51124fc84740bc6ae5b6221fdda605a83509a3cff1bef399c` |

All recorded theorem/source-contract hashes also matched the current bytes:

| Lean source | SHA-256 |
|---|---|
| `CirclePowerMatrix.lean` | `95c472f2384f9100049eed0b8d7361ddbe5d05ab72503e20b15949d6c6b81497` |
| `U1CarrierInjection.lean` | `deb69ae2ef2ab63cd0737d0e0f28268734523696fd9f045853ac3683d4823293` |
| `ExactFifteenApexProfile.lean` | `2f5bbeef6e7731e6a8052a72b526d3cf11bed874ed59574eb923ff43bdb5e9cc` |
| `Foundation.lean` | `a391c93c43d33614d2c04166d97d6a5d88b750a5691b6c682233c1d1c9de9bd3` |
| `FrontierLiveClosure.lean` | `ca0a4d33259f78ed2acdd75dac404116c41319e7eb2384a8ae9d5a539c4e53ee` |
| `SameShellSuperadditivity.lean` | `c4851c89b672132603fc7473ab1104cffd9237a602d326f4f75f108ded56a124` |
| `PhysicalSecondApexCommonDeletion.lean` | `98da3a4bbf8a6b70f5068d2faef8105216936edc6077d75e08910acfbab02dc3` |
| `SmallSReductions.lean` | `af3345fb5d0e302eba2da8410392fbc292b6e66b7cd5e3c527196406bf80dcad` |

The provenance record freezes `schema_v15.json` but does **not** freeze the inherited `schema_v14.json`, `schema_v13.json`, `schema_v12.json`, or `schema_v8.json`. Consequently, this invocation cannot authenticate the exact historical bytes of those inherited schema files. The formula-defining parent scripts themselves are frozen and matched live. This omission is part of the trust boundary.

## Immutable selection audit

The selection manifest is `artifacts-v15/v11-16-selection-20260802T093313.097282Z.json`; its live SHA-256 matches the invocation at `f69310476ba03c33179bda3c2461162bdeeaf7f5f54bf8d8e7f654ef0ce1e0af`. Its builder script matches the manifest at `31bd10653a552464b879f8c01e2961ed8470cc7c11c532c543b0c11f9797b3a3`, its source-invocation hash matches at `2a7af78eac6f2949b2ce9dc4d5808fffd6b87d3af1cb3ab9118cfb28ed76d4b5`, and the selection and run invocation contain the same canonical destination-provenance hash, `dadae044e649076426906bf7cff316db42429f66d0f5f93d0898328fb87e4aaf`.

There are exactly 16 distinct selected IDs, 16 distinct run result directories, and 16 distinct summary IDs. The three sets are equal: no selected case is missing, no extra case appears, and no ID is duplicated. Every selected source-result byte hash matches the manifest; each source result has the recorded ID and seed and was itself `unknown`. Every destination result has the same recorded ID and seed.

## Per-case terminal results

Every Boolean prepass returned `sat_no_cut` with reason `Boolean model contains no mined full-shell cut`, one Boolean model, and zero learned cuts. Every full phase returned `unknown`, reason `canceled`, after one solver check. Times are seconds.

| Case | Seed | Boolean | Full check | Total |
|---|---:|---:|---:|---:|
| `fresh_DDD_k0_d2_f1` | 1 | 9.592302 | 600.043662 | 618.378520 |
| `fresh_DDD_k0_d2_f3` | 2 | 6.699857 | 600.040229 | 615.342351 |
| `fresh_DDD_k0_d3_f1` | 3 | 7.946227 | 600.010767 | 616.639250 |
| `fresh_DDD_k0_d3_f2` | 4 | 7.935116 | 600.026942 | 616.547477 |
| `fresh_DDD_k1_d3_f0` | 5 | 4.766129 | 600.052734 | 613.398361 |
| `fresh_DDD_k1_d3_f2` | 6 | 7.999342 | 600.045729 | 616.687929 |
| `fresh_DDD_k2_d0_f1` | 7 | 9.661475 | 600.039866 | 618.464790 |
| `fresh_DDD_k2_d0_f3` | 8 | 7.962105 | 600.042411 | 616.590319 |
| `fresh_DDD_k3_d0_f1` | 9 | 5.230631 | 600.045977 | 613.641523 |
| `fresh_DDD_k3_d0_f2` | 10 | 6.718639 | 600.037646 | 615.215427 |
| `fresh_DDD_k3_d1_f0` | 11 | 6.669578 | 600.068058 | 615.222884 |
| `fresh_DDD_k3_d1_f2` | 12 | 5.815661 | 600.048584 | 614.406664 |
| `fresh_SDD_k0_d2_f1` | 13 | 8.592992 | 600.026966 | 617.040430 |
| `fresh_SDD_k0_d2_f3` | 14 | 6.123438 | 600.044674 | 614.480952 |
| `fresh_SDD_k0_d3_f1` | 15 | 6.005206 | 600.023365 | 614.343222 |
| `fresh_SDD_k0_d3_f2` | 16 | 7.087334 | 600.009234 | 615.424666 |

The summary wall time is `1234.1055272498634` seconds, consistent with 16 roughly ten-minute cases executed by 8 workers in two waves.

## New-family and artifact consistency

Each full encoding records exactly **4,368** assertions in the new family `nonapex_global_k4_squared_superadditivity`; each Boolean prepass records exactly 4,368 exclusions for that family. This count agrees with the checked generator structure: 12 non-apex choices times `C(14,3)` triples, namely `12 * 364 = 4368`. Thus the family is present in every full problem and absent from every Boolean relaxation as intended.

For all 16 cases:

- `power_cut_count = 0` and `pre_first_check_power_cut_count = 0`; each `power_cuts_v12.json` contains an empty cut array and has SHA-256 `ba1d2af3e4537fb69c862fe1fa838e6cc3d4ead0c63d430ac2336f9bfc42549a`.
- The recorded compressed and decompressed full-encoding hashes match `encoding.smt2.gz` and its text.
- The recorded compressed Boolean-encoding hash matches `boolean_encoding.smt2.gz`.
- The recorded Boolean-prepass JSON hash matches `boolean_prepass.json`, and the embedded prepass object equals that file's object.
- The recorded power-cut JSON hash matches `power_cuts_v12.json`, and its cut-array length agrees with the result count.
- The per-result provenance and resolved budgets equal the invocation's values.
- The summary's result object is exactly the corresponding `result.json`, and its formula-hash map agrees with the result.

All 32 gzip artifacts pass structural gzip validation. The 16 decompressed full-formula hashes are distinct. Across the 82 files in the run directory (80 case artifacts plus invocation and summary), the SHA-256 of the lexicographically sorted lines `SHA256  relative_path` is `34c7d76e6e66847a6e71b092b17384f0fae37e4839dd5cf9f8932449c0e94bde`. The summary SHA-256 is `8270ef13414adcbe950a3e78d770586cd3601c0d55b3add35c7c5b221f69108f`.

## Terminal-process check

PID 90447 is absent from the process table. `summary.json` exists and records all 16 results. The checked runner source writes that summary only after its `ProcessPoolExecutor.map` has returned every result, then returns exit code 0 if complete and 2 otherwise. Because this summary is incomplete, exit code 2 is the source-implied outcome; the historical shell exit status was not persisted and therefore was not directly observed.

## Trust boundary and mathematical status

- `sat_no_cut` authenticates only a model of the deliberately weakened Boolean prepass. It is not a SAT result for the full encoding.
- `unknown` with reason `canceled` is neither SAT nor UNSAT. There is no SAT witness, UNSAT proof/core, or other terminal solver certificate here.
- Zero learned cuts means the prepass contributed no mined full-shell cut in any case.
- Hash agreement with Lean source authenticates bytes only. It does not establish compilation, kernel checking, transitive axiom cleanliness, or that the encoded constraints are a proved-complete image of the mathematical theorem.
- The inherited-schema omission described above prevents full historical schema-byte authentication from the invocation alone.
- No solver replay and no Lean/kernel gate was run during this audit.

Accordingly, **0 of 16 cases are closed**, and this run establishes no theorem closure.
