<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-center joint census state

Started 2026-07-07 from
`docs/multi-center-joint-census-spec-2026-07-07.md`.

## Status

1. [x] Initial engine scaffold:
   `multi_center_census.py` imports the existing `q2_token`/`q3_token`
   model helpers, represents LOCAL L1/L2 classes as finite
   support-incidence types, canonicalizes by size-preserving profile
   automorphisms, and materializes concrete representatives for GLOBAL
   DFS checks.
2. [x] Smoke gates:
   `smoke.py` implements S1 composition reproduction, S2 kill
   observation, and S3 unequal-profile canonicalization. Run after the
   permanent-home move: all PASS; S1 checked 22 profiles, total DFS nodes
   54,919.
3. [x] Bounded sample artifacts:
   `local_summary_n12_14.json` records LOCAL counts for n = 12..14.
   `global_profile_456_l2_summary.json` and
   `global_profile_555_l2_summary.json` record full n = 12 L2 GLOBAL
   profile checks under PROVEN cuts.
4. [x] Performance pass:
   candidate-list construction is cached per `(profile, tier)`, fixed
   Moser assignments reuse the base non-Moser candidate bank, candidate
   pair/mask metadata is precomputed for DFS, profile automorphisms are
   cached, LOCAL dictionaries use tuple keys internally, and the LOCAL
   recursion precomputes mask/participant/pair relationships instead of
   rebuilding them in the inner loop. The `sweep-global` command also
   supports profile-level process parallelism with `--workers`; this
   requires running outside the restricted sandbox on this host because
   Python's process-pool semaphore check is sandbox-blocked. Benchmarks:
   `(4,5,6)` L2 GLOBAL: 523/523 SAT, 312,001 nodes, 0.48 s;
   `(5,5,5)` L2 GLOBAL: 177/177 SAT, 85,992 nodes, 0.15 s.
5. [ ] Full sweep:
   L2 GLOBAL under PROVEN cuts is complete for n = 12..28. Every tested
   LOCAL class is GLOBAL-realizable so far: 533,761/533,761 SAT, 0 UNSAT,
   0 INDETERMINATE. The project-level cumulative class inventory through
   n = 28 has 3,375 classes. Project-level fresh classes:
   n18 = 247, n19 = 31, n20 = 78, n21 = 69, n22 = 0, n23 = 9,
   n24 = 6, n25 = 0, n26 = 0, n27 = 0, n28 = 0. This gives a
   four-row zero-fresh window at n = 25..28, matching the spec's
   STABILIZED-EMPIRICAL detector condition. Rows n = 22..28 were run
   with 8 workers via the profile-parallel sweep artifacts
   `l2_global_proven_n22.json` through `l2_global_proven_n28.json`.
   `analyze_sweeps.py` recomputes the project-level inventory directly
   from `class_key` values, flags partial range artifacts, and should be
   used for the canonical fresh/stability readout; per-file fresh and
   cumulative fields reset when a sweep is restarted.

## Commands

```bash
uv run python census/multi_center/smoke.py
uv run python census/multi_center/multi_center_census.py local-summary --n-min 12 --n-max 14 --out census/multi_center/local_summary_n12_14.json
uv run python census/multi_center/multi_center_census.py global-profile --profile 4,5,6 --layer L2 --tier proven --summary-only --out census/multi_center/global_profile_456_l2_summary.json
uv run python census/multi_center/multi_center_census.py sweep-global --n-min 24 --n-max 24 --layer L2 --tier proven --workers 8 --out census/multi_center/sweeps/l2_global_proven_n24.json
uv run python census/multi_center/multi_center_census.py sweep-global --n-min 28 --n-max 28 --layer L2 --tier proven --workers 8 --out census/multi_center/sweeps/l2_global_proven_n28.json
uv run python census/multi_center/analyze_sweeps.py
```
