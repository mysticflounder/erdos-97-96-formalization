# Frontier cube24 live-status refresh

Snapshot: 2026-08-01 09:16:37 PDT.

## Result

**The round is still running.** PID/PGID 67356 exists, has PPID 1, state `RNs`, and elapsed time 04:10:05. Its command is still the intended `phase3_structural_cegar.py` invocation for `phase3_projected_static_v2_frontier_cube24_20260801_050632`, with 24 workers, cube depth 5, compact artifacts, `--max-new-raw 100000`, learned-core limit 100000, survivor limit 1000, and the pinned 508-record cube19 bootstrap bank.

The manifest was rewritten at the snapshot second and reports:

- status `RUNNING`; null diagnostic and failure;
- manifest identity `9955e1def84107aa16bb44494679b02197b430326ba79e1d45c409d3d18a2249`;
- active antichain 23,569;
- learned 26,283 total = 472 bootstrap + 25,811 dynamic;
- 25,811 classified and 193,141 unclassified/stale raw SAT results (218,952 raw SAT total);
- zero survivors;
- 778,496 solver attempts, including 559,544 unverified per-cube local UNSAT results;
- null terminal clause count and `terminal_drat_verified: false`.

The round had advanced beyond the 09:06 audit, and its journals continued growing during this refresh. It has reached only 25,811/100,000 committed classifications, so the configured raw checkpoint and learned-core limit have not been reached. `survivors.jsonl` remains empty. No filename matching terminal, DRAT, LRAT, proof, or counterexample exists under the round directory as of this refresh.

Because the coordinator is live, there is no frozen final bank or final manifest to validate. A fail-closed final manifest/hash-chain/SHA audit was therefore not run; doing so against actively appended journals could only produce a racing, non-authoritative result. No solver, generator, Lean, Lake, resume, or checker command was invoked.
