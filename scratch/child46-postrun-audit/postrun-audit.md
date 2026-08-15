# Child46 post-run recovery audit

Date: 2026-08-14. Scope was read-only: no Git, network, solver, retry, Lean,
Rigid221, or source edits.

## Evidence

The preserved run is
`scratch/exact17-child46-production-8205802e`, attempt directory
`journals/attempt-00000000-106a8f682212cb76`. The journal has 376 records and
ends at attempt 375 with `STRUCTURAL_SAT` for job
`6f031597-70aa-4c22-bb3b-b222dbb7871f`; its final record is
`a97a87e8fada5c2d2d5d1140e73ed81b7d663abb96068122ccad9d8c8155fd5b`.
The sealed receipt reports `SAT`, return code 10, `failure_detail: null`,
model SHA256
`f84a36a1d709a3c65fafa4a6a43c6d7b47a26c858e5fcde6320f408556c99072`, and
solver-log SHA256
`b2e6569421ae488d621194a7a9f789ba22e0442f79c43d911148170b8e8b7253`.

At audit start, contrary to the task's stated “absent” condition,
`engine-output.json` existed (regular file, 574141 bytes, mtime
2026-08-14 20:58:13 -0700), later than the journal seal (20:49:21). It is
therefore recorded as concurrent/new evidence, not attributed to the original
failed process. Its SHA256 was
`847a20bc0b34a9fc391c09a0c1a7d4bb6ac9547c6e5af6ab53249915932d54ad`.
The output is internally canonical: unsigned canonical JSON SHA256 equals
the claimed envelope hash
`6fe96b8dda4b0f637d28889a7e9f52c852006aa6d362f7ecdde94b363b08c4ae`, and it
contains a 308-variable total assignment. This demonstrates a recovery
publication occurred or was materialized after the stated failure, but does
not identify its actor or prove the original run reached publication.

Evidence hashes (captured after the audit; all remained stable during the
read-only inspection):

| artifact | bytes | SHA256 |
| --- | ---: | --- |
| `engine-output.json` | 574141 | `847a20bc0b34a9fc391c09a0c1a7d4bb6ac9547c6e5af6ab53249915932d54ad` |
| `journals/.../attempt.jsonl` | 342131 | `e390ffe10c58fc20590ea8844f018903af5d8cc21019ecb951340169212c0519` |
| `journals/.../attempt.jsonl.seal.json` | 411 | `c70d70b6cdcba0f6e372fc10ab1b807e7f4a99a0b38fb2460e5a421acf9ef1cc` |
| `journals/.../custody-seal.json` | 95712 | `c7a55670c8a7ae2bf1b03e84bd22e6d5cf8426ba38f1bdf79e145303dfc0c7a3` |
| `journals/.../solver-receipt.json` | 31161 | `2e74b4a384fc23fe4b280243c0bb5209902ae7d879fd4cc28328458d4c7d737f` |
| sealed model artifact | 1503 | `f84a36a1d709a3c65fafa4a6a43c6d7b47a26c858e5fcde6320f408556c99072` |
| sealed solver-log artifact | 8006 | `b2e6569421ae488d621194a7a9f789ba22e0442f79c43d911148170b8e8b7253` |

All listed evidence files are regular non-symlink files. The solver log ends
with CaDiCaL `c exit 10`; no separate stderr stream is preserved. The sealed
receipt has `failure_detail: null`, and no journal record contains an error or
stderr field. Consequently the exact stderr/error of a hypothetical failure
after result validation cannot be recovered from sealed custody. Only the
solver log's normal terminal text and final `STRUCTURAL_SAT` detail are
recoverable.

## First possible post-validation failure

In `census/p97_search/phase3_cegar_wave_engine.py`,
`_receipt_bundle` is called at lines 1197–1202 and
`_validate_serialized_result` completes at lines 1221–1231. The next offline
stages are `_unsigned_envelope` (1232–1245), envelope hashing (1246),
create-once publication (1247–1249), parent identity checks (1250–1259), and
final `_validate_static_cnf_engine_output` (1260 onward). The custody journal
cannot distinguish which of these would have failed because none writes an
error record and the original process stderr is not in the package.

## Recovery API decision

There is an existing public zero-network path, so a new API is not required:

* CLI command `recover-static` (`census/p97_search/cegar_wave_cli.py:227–242`);
* registry entry point `recover_registered_static_output`
  (`census/p97_search/cegar_wave_registry.py:508–534`), which sets
  `offline://sealed-receipt`, calls `StaticCnfWaveEngine.recover_from_receipt`,
  then validates the registered output;
* engine recovery calls the same sealed `_receipt_bundle` and
  `_validate_serialized_result` path (`phase3_cegar_wave_engine.py:1149–1177,
  1187–1265`) and never calls the solver transport.

The focused regression test
`test_recover_from_receipt_publishes_offline_without_second_solver_call`
(`tests/test_phase3_cegar_wave_engine.py:859–874`) requires byte-identical
recovery and unchanged API call count; the copied-receipt rejection test
(`:877–891`) requires the receipt path to cross-bind its payload and leaves no
output on rejection.

Conclusion: **PASS for safe offline recovery capability; NOT PROVEN for the
original run's missing-output failure cause.** The currently materialized
engine output is complete-looking and canonically self-hashed, but because it
appeared after the sealed journal, treat it as concurrent recovery evidence
until its provenance is recorded. Do not rerun the solver. If the output is
not accepted as that recovery, invoke only the existing `recover-static`
command against the sealed receipt and a create-once destination, then perform
the registered offline validation; no new Child46-specific runner is needed.
