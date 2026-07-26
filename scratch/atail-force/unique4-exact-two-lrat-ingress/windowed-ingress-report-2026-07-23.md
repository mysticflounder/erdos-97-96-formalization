# Bounded-window materializer for the p5 LRAT ingress — 2026-07-23

## Result

**STRUCTURALLY VALIDATED WINDOWED PURE-RUP SHARDS; LEAN REPLAY REQUIRED.**
`materialize_windowed_rup.py` subdivides the hash-verified two-shard package
`generated/p5-largest/` into bounded, independently rebased windows behind
shared canonical checkpoints. The real p5 windowed package is
`generated/p5-largest-windows/` (ignored generated data, 642 MiB), with
relocation-stable package SHA-256:

```text
cd818224ca4c418c084363f82c508460e4ed95c17d457ed04650fe4fa5e938d1
```

`--verify-package` independently re-verifies every artifact hash, the
checkpoint chain, the shard-boundary identities, the caps, and the window
roles, then semantically replays every window: it streams each window from
its shared start checkpoint through `actions.lrat`, reconstructs the active
clause state, and requires the result to equal the referenced end
checkpoint exactly. Map rows are authenticated against the actual start
clauses and dense in-window additions, with global ids re-derived (shard-1
identity, shard-2 addition offset) and range/monotonicity/cross-window
consistency checks for shard-2 checkpoint rows; recorded window counts and
addition spans must match the replay. RUP itself is not decided. The real
p5 package: **VERIFIED** (27 s).

## Real p5 window counts

Caps: 4,000 whole-line actions and 4 MiB of rebased LRAT text per window
(both configurable). The action cap binds everywhere; the largest window
action file is 1,075,488 bytes, so the byte cap never triggers at these caps.

| quantity | shard 1 | shard 2 |
|---|---:|---:|
| windows | 183 | 186 |
| source lines | 728,609 | 743,104 |
| additions | 492,102 | 492,103 |
| deletions / deleted ids | 236,507 / 476,948 | 251,001 / 515,932 |
| hints | 21,491,717 | 23,334,553 |
| max window lines | 4,000 | 4,000 |
| max window LRAT bytes | 1,075,488 | 997,998 |
| peak active clauses | 24,295 | 26,597 |

369 windows total, 370 shared checkpoint artifacts (indices 0–369; the
shard boundary is checkpoint 183). Endpoint-CNF size monitoring: checkpoint
files span 190 bytes (terminal region) to 744,991 bytes / 26,554 clauses.
The terminal window is `shard-2/window-0186` (3,104 actions); its end
checkpoint `checkpoint-0369.cnf` is `p cnf 616 28` and contains the empty
clause. All per-shard totals equal the parent package's shard counts
exactly.

## Full Lean replay checkpoint

All 369 windows, both shard coordinators, and the final checkpoint-0 UNSAT
composition have been emitted and kernel-checked under the project-pinned
Lean 4.27 toolchain with warnings as errors. The complete replay tree has
742 Lean modules. The structurally verified replay package digest is
`9238dc18ee65a0d1023c786d40b149591759dbafa91eb9d0cc2f75d4385328ad`.

The exact axiom closure of both shard theorems and
`WindowedRupReplay.startUnsatisfiable` is `propext`, `Classical.choice`,
`Quot.sound`, `Lean.ofReduceBool`, and the explicitly approved
`Lean.trustCompiler`. The closure contains no `sorryAx` or generated custom
axiom and therefore matches the repository trust profile.

## Package schema

`p97-windowed-pure-rup-package-v1`:

```text
generated/p5-largest-windows/
  manifest.json                      counts, caps, records, package_sha256
  checkpoints/checkpoint-NNNN.cnf    one canonical endpoint CNF per boundary
  shard-1/window-NNNN/actions.lrat   whole-line rebased LRAT slice
  shard-1/window-NNNN/map.tsv        window_local_id  shard_local_id  global_id
  shard-2/window-NNNN/...            same layout
```

- **Shared canonical checkpoints.** Adjacent windows use the identical
  shared canonical checkpoint array definition: window *k* records
  `start_checkpoint = i` and `end_checkpoint = i+1`, both indices into the
  single package-level `checkpoints/` sequence. No boundary CNF is
  materialized twice, so there is nothing to compare and nothing that can
  drift; the verifier additionally rejects any window pair that does not
  reference the same checkpoint index. The Lean emitter can bind one
  checkpoint definition per boundary and reference it from both adjacent
  window modules.
- **Window form.** Each window is exactly a `CheckpointedRup.TextIngress`
  `RebasePackage`: its start checkpoint lists the active clauses in
  increasing shard-local id order with dense local ids `1..N`, its actions
  use dense local addition ids from `N+1` with all hints and deletions
  translated through the window map, and its end checkpoint is the active
  list at close under the same ordering. The intended replay is one bounded
  `checkRebaseText = true` theorem per window, `checkTerminalText` for the
  terminal window, and transitive composition of the implications.
- **Maps.** Each `map.tsv` is total on the window's local ids (start
  clauses then in-window additions) and injective into both shard-local and
  global ids. Shard-1 shard-local ids are parent global ids; shard-2 rows
  translate through the parent `checkpoint-map.tsv`, with additions offset
  into parent global addition ids (window locals compose to original global
  clause ids in both shards).
- **Boundary identities.** Checkpoint 0 is byte-identical to the parent
  `start.cnf` and checkpoint 183 is byte-identical to the parent
  `checkpoint.cnf`, so the two major logical shards are preserved intact.
- **Provenance.** The manifest binds the parent package digest, the parent
  artifact hashes, the windowed and parent materializer sources, and the
  32,211-byte Lean checker record; `package_sha256` is relocation-stable.

## Fail-closed behavior and tests

Windowing refuses to start unless the parent two-shard package fully
verifies. Windows never split an LRAT line; a single action exceeding the
byte cap fails closed, as do unseen/inactive/unmapped references, non-dense
addition ids, noncanonical spellings, an empty clause outside the terminal
shard, any action after the empty clause, and overwrite of an existing
output directory. `test_materialize_windowed_rup.py` adds 27 deterministic
tests (drift of window artifacts, checkpoints, and the manifest digest;
decoupled shared-checkpoint references; invalid references; cap and
boundary errors; determinism and relocation stability; and coordinated
rehashes, where an artifact and its manifest record are tampered together
and the package digest recomputed — caught semantically by the replay and
map authentication). The directory suite is 60/60 with the full-package
emitter, forbidden-source injection, materializer, emitter, and attestation
tests.

## Claim boundary

This package re-encodes the already-validated pure-RUP proof into bounded
windows; its structural verifier does not decide RUP. The separate Lean build
establishes UNSAT of the exact checkpoint-0 trimmed CNF. The completed
`P5ExactTwoClosure.lean` composition now supplies the source-to-CNF bridge and
proves the geometric `(5,5,4)` exact-two p5 contradiction in scratch. The
ignored generated import closure is not yet clean-checkout production code,
so this still closes neither production `sorry`.
