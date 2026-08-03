# Phase 3 canonical depth-5 terminal-shard launch audit (2026-08-01)

Source-only audit. No solver, generator, Lean, or Lake command was run.

## Decision

Use `launch_phase3_shared_pair_depth5_wave.py` for exactly two non-overlapping
waves: canonical indices `0..23`, then (only after every first-wave process has
exited) `24..31`. Feed both waves the same immutable completed
`learned-certificates.jsonl` using `--bootstrap`; the launcher translates that
to the driver's `--bootstrap-results`. Do not use `--resume` for new shard
directories.

The currently active source round
`phase3_projected_static_v2_frontier_cube24_20260801_050632` still had status
`RUNNING` when audited, so its final learned-bank SHA-256 is not yet knowable.
It must not be used in place while it is changing. Freeze/copy its completed
`learned-certificates.jsonl` after all writers have exited, record the digest,
and use that exact frozen path for both waves and subsequent replay.

## Pinned source and encoding expectations

Current file SHA-256 values for the complete dependency map replayed by the
driver (plus the launcher):

```text
8d09e3fb72522a7e9ed111cab8a33b56afcf739434fe54e79619c00290358e9d  census/p97_search/phase3_structural_cegar.py
5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817  census/p97_search/sat_generate.py
fd92ccd22911de389bc1310e0c862c8199f1c34c0a92b1b2381cba66414cb41a  census/p97_search/realize.py
e44f1452b240b8bbe39f2389311312ac02ef9bef8ddbb5b08dc4ffa06adea396  census/global_confinement/metric_realizability_probe.py
ab1ad8c4f3a7ec77e5c35f0232094e23cf9a8f8ea56a73d369b752f204da41c5  census/global_confinement/cap_selected_nogood_certificate_probe.py
bf2721022dd1523c15a1b33592d572013848e2e6a2f81970ce63fbcb667d53b7  census/global_confinement/equality_ideal_probe.py
8eba2b66ed984f1123ea242b569d0a92b5acc3872fbc6e4ca67d17bd72e2e893  census/p97_search/phase3_ordered_metric_rules.py
484510cafb79a1256a0dcd030958e57145229654cabd245aa29030543b1cf8cb  census/atail_force/producer_bank.py
84b4ed57ffa2ad4d9c8f13c6c15c7ad4882411b7813e2096318500b54513a56f  census/p97_search/phase3_shared_pair_separation.py
c48c09543f96ca1fbef4c4e1bcb1869151aa726b43e9cacd71f462606ba9580c  lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean
eb31b3cf6b7294aff42f4a56cb16ae70b765e5bff2a883ef2ac37e41aec91047  lean/Erdos9796Proof/P97/Census554/ConvexRhombusCore.lean
e0bf9cf10cdbee39e5034575ea6fb80685cc265c1b8ffa5930e7f819f6481b4f  lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean
cd6af40c90ce6aff789caf7dca08ac6467f00be7112f31540d3c992dad9a9537  lean/Erdos9796Proof/P97/Phase3SharedPairSeparation.lean
e404f50f1e1ddc13a5c4b6e8b3e2fbd1848b5a40ddcef24387eaeca544ecfbcd  lean/Erdos9796Proof/P97/EndpointCertificate/OrderedCoreSigns.lean
fa9fa07d376b464163882f21403aa60518bd6505a0a3779d702c34df78899419  scratch/p97-distinct-distance-lane/launch_phase3_shared_pair_depth5_wave.py
```

Expected mode/schema and canonical partition:

```text
mode                         cap+blocker-projected
learned_record_schema        p97-phase3-structural-cegar-learned-projected-static-v2
projected_static_v2          true
shard depth/count            5 / 32
semantic variables           91..95 = f[3,0], f[3,1], f[3,2], f[4,0], f[4,1]
partition_sha256             7ecca6e18ee177012bafe94ed6f4d8c25f7ae07b5d5b38cde52f9935bc526df3
global_base_cnf_sha256       8a615006f2019137797b962947e2fa6620b3c8419be24809e3a0074bb9eb896f
```

The launcher pins the following driver flags for every shard:

```text
--projected-static-v2
--timeout 86400
--learned-core-limit 100000
--survivor-limit 1000
--workers 1
--parallel-mode sequential
--shard-depth 5
--shard-index INDEX
--bootstrap-results FROZEN_BANK
```

The omitted flags therefore use the current defaults `--cube-depth 4` and
`--cube-artifact-mode full`. The launcher refuses duplicate/out-of-range
indices, more than 24 indices, an existing output root, or a missing bank.

## Bootstrap without schema drift

Use only a completed projected-static-v2 `learned-certificates.jsonl`, not
`results.jsonl`, a shard-local partial journal, or a legacy b-bearing bank. The
driver strictly checks every JSONL record's exact field set, hash chain,
zero-based index, schema, assignment, certificate replay, clause, and
supersession metadata, then canonicalizes/deduplicates it into bootstrap
clauses for the current encoding. This is a bootstrap replay, not a resume of
the source run.

After the source round has stopped, authenticate its manifest and freeze it
once (the destination must be a new directory). For this bounded run the
expected nonterminal completion is exactly `CHECKPOINT`; a verified terminal
status must instead be handled as a candidate terminal result. `UNKNOWN`, a
missing status, or merely `status != RUNNING` is not a freeze gate. Confirm
that PID/PGID 67356 and every source worker have exited before running this:

```bash
ROUND=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_frontier_cube24_20260801_050632
FROZEN=scratch/p97-distinct-distance-lane/phase3_projected_static_v2_frontier_cube24_completed_bank_20260801

test "$(jq -r '.status' "$ROUND/manifest.json")" = CHECKPOINT
test "$(jq -r '.configuration.learned_record_schema' "$ROUND/manifest.json")" = p97-phase3-structural-cegar-learned-projected-static-v2
test -s "$ROUND/learned-certificates.jsonl"
SOURCE_SHA_BEFORE=$(shasum -a 256 "$ROUND/learned-certificates.jsonl" | awk '{print $1}')
mkdir "$FROZEN"
cp "$ROUND/learned-certificates.jsonl" "$FROZEN/learned-certificates.jsonl"
SOURCE_SHA_AFTER=$(shasum -a 256 "$ROUND/learned-certificates.jsonl" | awk '{print $1}')
FROZEN_SHA=$(shasum -a 256 "$FROZEN/learned-certificates.jsonl" | awk '{print $1}')
test "$SOURCE_SHA_BEFORE" = "$SOURCE_SHA_AFTER"
test "$SOURCE_SHA_BEFORE" = "$FROZEN_SHA"
shasum -a 256 "$FROZEN/learned-certificates.jsonl" | tee "$FROZEN/learned-certificates.sha256"
```

Record the resulting digest as `FINAL_BANK_SHA256`. Before each launch, and
before aggregation, rerun `shasum -a 256` and require exactly that digest. Both
`launch-manifest.json` files must record the same repository-relative bank path
and SHA; shard configurations record the same path after absolute resolution.

## Exact launch commands

Wave 1 (24 local solver workers):

```bash
.venv/bin/python3 scratch/p97-distinct-distance-lane/launch_phase3_shared_pair_depth5_wave.py \
  scratch/p97-distinct-distance-lane/phase3_terminal_depth5_wave1_20260801 \
  0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 \
  --bootstrap scratch/p97-distinct-distance-lane/phase3_projected_static_v2_frontier_cube24_completed_bank_20260801/learned-certificates.jsonl
```

Do not start wave 2 until all 24 PIDs/PGIDs recorded in wave 1's
`launch-manifest.json` have exited. This is what enforces the total local cap
of 24; merely launching in different directories does not.

Wave 2 (8 local solver workers):

```bash
.venv/bin/python3 scratch/p97-distinct-distance-lane/launch_phase3_shared_pair_depth5_wave.py \
  scratch/p97-distinct-distance-lane/phase3_terminal_depth5_wave2_20260801 \
  24 25 26 27 28 29 30 31 \
  --bootstrap scratch/p97-distinct-distance-lane/phase3_projected_static_v2_frontier_cube24_completed_bank_20260801/learned-certificates.jsonl
```

These are fresh output roots. A pre-existing root is evidence requiring audit,
not permission to add `--resume` or overwrite it.

## Exact aggregation command

Run only after every one of the 32 shard processes has exited:

```bash
for proof in \
  scratch/p97-distinct-distance-lane/phase3_terminal_depth5_wave1_20260801/shard-{00..23}/terminal.drat \
  scratch/p97-distinct-distance-lane/phase3_terminal_depth5_wave2_20260801/shard-{24..31}/terminal.drat; do
  test -s "$proof" || exit 1
done

.venv/bin/python3 census/p97_search/phase3_structural_cegar.py \
  --verify-shards \
  scratch/p97-distinct-distance-lane/phase3_terminal_depth5_wave1_20260801/shard-{00..23} \
  scratch/p97-distinct-distance-lane/phase3_terminal_depth5_wave2_20260801/shard-{24..31} \
  > scratch/p97-distinct-distance-lane/phase3_terminal_depth5_coverage_20260801.json
```

The explicit preflight rejects empty or missing DRAT files. Do not combine
`--verify-shards` with run flags; the parser itself rejects shard flags, while
this broader prohibition is the fail-closed operating policy. The verifier rehashes
and replays every shard manifest using its recorded configuration, reruns the
independent DRAT checker on that shard's exact `terminal.cnf` and
`terminal.drat`, checks common provenance, rejects duplicate indices, and
requires the exact index set `0..31`.

## Fail-closed terminal acceptance

Accept the fleet only if all of the following hold:

1. Every shard is the exact canonical `(depth=5,index=i)` specification for
   its index and has the pinned partition/global-base hashes above.
2. All 32 manifests have identical configuration (apart from shard index and
   its derived literals/hashes), dependency provenance, algebraic bootstrap
   provenance, and the same frozen learned-bank path/SHA.
3. Every shard status is a verifier-accepted terminal status:
   `SHARD_STRUCTURAL_UNSAT_VERIFIED` or, if algebraic records are load-bearing,
   `SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED`.
4. Every shard has `structural_survivor_count = 0` and
   `terminal_drat_verified = true`. Reject `RUNNING`, `UNKNOWN`, any limit or
   enumeration status, any survivor, and any missing/partial manifest.
5. Every shard has its exact hashed `terminal.cnf` and a present, nonempty,
   exact hashed `terminal.drat`; its original check and the aggregation-time
   independent `drat-trim` recheck must both report exactly `s VERIFIED`.
6. Aggregation exits zero, reports `shard_count = 32`, exact coverage with no
   duplicate/missing/extra index, zero survivors throughout, and status
   `STRUCTURAL_SHARD_COVERAGE_UNSAT_VERIFIED` or (when applicable)
   `P97_EUCLIDEAN_GAUGE_SHARD_COVERAGE_UNSAT_VERIFIED`.

Anything less is not terminal coverage. Even an accepted aggregate is an
external Python/CNF/DRAT result, not Lean-kernel closure; the Euclidean-gauge
status additionally carries the recorded algebraic/distinct-point trust
boundary.
