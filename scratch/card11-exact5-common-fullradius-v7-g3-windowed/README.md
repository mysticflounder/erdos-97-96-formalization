# Frozen-G3 windowed pure-RUP replay

This directory adapts the exact frozen G3 core certificate to the existing P5
checkpoint/window replay machinery.  It does not modify production Lean and it
does not claim the source-valuation or selector-coverage bridge.

## Authenticated ingress

- frozen core: 273,017 clauses, SHA-256
  `310b30d0b9ad2787599ee9b0edce999edfb333934901ca578734182076771683`
- raw DRAT: SHA-256
  `85d5fde40d58a64e58daac312933c38b26cc027b1b60289bde6204434d55ae69`
- raw LRAT: 612,853 lines, SHA-256
  `6c9d62e8a3b46054f61bcd17b6faf8695604f8e9635231c3dc9eef2e5fd61c4f`
- drat-trim: `s VERIFIED`, 0 RAT lemmas, 1 redundant literal
- normalized LRAT: 421,331 dense additions, 191,522 deletions,
  IDs `273019..694349`, SHA-256
  `34ab8181df08a9a45594d58347a7a859e71d515e4efcd6f901d8dfebe69abf5b`
- checker padding: fresh positive unit on variable 96,418; normalized
  certificate maximum variable is 49,360

`finalize_pure_rup_ingress.py` authenticates and normalizes the external proof.
`prepare_g3_windowed_replay.py` authenticates the original G3 ingress, occurrence
map, pure-RUP report, padding/base counts, and all exact hashes.  It adds a
domain-separated adapter binding to the inherited checkpoint package digest.

The emitted package is `g3-windowed-replay-package/`:

- checkpoint package SHA-256:
  `e2b2b108c9f417167101f832a768721104890fd601b1b4ba432e45bae5b499ef`
- window package SHA-256:
  `fe7c29b79ef1ad1e4d0e1d6563ebc65c739cf0e59d7f997238adf0ace59bab02`
- compact replay package SHA-256:
  `cedb325b55aa7ac10034884b1748eb2b54597416e406479687e596f3011c850b`
- 166 checkpoints, 165 windows, 334 Lean modules

The compact replay was compiled successfully on 2026-07-30 with the command
below: 334 modules completed in dependency layers `1 / 165 / 165 / 2 / 1`,
with warnings treated as errors.  The compiler recorded package SHA-256
`cedb325b55aa7ac10034884b1748eb2b54597416e406479687e596f3011c850b`
and state `COMPLETE` in
`g3-windowed-oleans/compact-replay-compile-manifest.json`.

This establishes Lean elaboration of the compact replay package only.  It does
not establish the source-valuation or selector-coverage bridge, transitive
axiom closure of a production theorem, or production ingress.

## Dependency-level compiler

`compile_layered_compact_replay.py` reuses the P5 compiler's package,
toolchain, lock, warning, and artifact checks, but schedules independent modules
in five authenticated dependency layers:

1. Common (1)
2. checkpoints (165 in parallel)
3. windows (165 in parallel)
4. shard coordinators (2 in parallel)
5. Compose (1)

Resume is fail-closed: a missing or hash-invalid dependency invalidates every
internal dependent artifact.

Recommended launch (4 workers, 4 GiB Lean cap per worker):

```bash
uv run python -B \
  scratch/card11-exact5-common-fullradius-v7-g3-windowed/compile_layered_compact_replay.py \
  --package-dir scratch/card11-exact5-common-fullradius-v7-g3-windowed/g3-windowed-replay-package/compact \
  --olean-output-dir scratch/card11-exact5-common-fullradius-v7-g3-windowed/g3-windowed-oleans \
  --lean-root lean \
  --jobs 4 \
  --memory-mb-per-worker 4096
```

Add `--resume` only when continuing an existing output directory produced by
the same package, toolchain, layer graph, and compiler options.
