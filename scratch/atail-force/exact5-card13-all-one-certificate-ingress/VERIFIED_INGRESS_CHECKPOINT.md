# Three-orbit verified-ingress checkpoint

Date: 2026-07-22

This checkpoint covers only certificate ingress.  It does not claim source
composition or close a production theorem.  The current post-rename validation
below supersedes the earlier pending split-validation gate.

## Historical pre-rename endpoint replay

Before the import-safety rename, the persisted multipart modules

- `certificates/left/AllOneLeftVerified.lean`; and
- `certificates/right/AllOneRightVerified.lean`

both replayed under the authoritative `lean/` Lean 4.27 toolchain with
warnings treated as errors.  Their endpoint oleans were written to
`/tmp/exact5-card13-all-one-certificate-endpoints/` before testing the packed
ingresses.

| Orbit | Olean bytes | Olean SHA-256 | Result |
| --- | ---: | --- | --- |
| left | 118,979,992 | `335bb63dceb55d6fa7d0bf67a382844b250d8b58b55f94e309d892c7f1235ead` | PASS |
| right | 118,762,944 | `1962c4d0e50c815f3baf43984648f3bb887cf030cf1938c3fa2837762eb01e80` | PASS |

The exact printed axiom closure for both `sourceExpr_unsat` endpoints is:

```text
[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
```

There is no `sorryAx`.  These hashes are retained as historical evidence; the
current post-rename endpoint hashes appear below.

## Generated monolithic ingresses: engineering-aborted

The left and right monolithic packed ingresses were generated successfully:

| Orbit | Lean bytes | Lean SHA-256 | Obligations bytes | Obligations SHA-256 |
| --- | ---: | --- | ---: | --- |
| left | 3,928,702 | `b7cd20ddbe03cd9ac179652e6f0dfd765145b5eca663c05a170d7d0498a3f6bf` | 3,060,641 | `28e961dcb78784046119778b557eca3b15a74fb969f213f2f1b34502df276ef0` |
| right | 3,928,706 | `aaf33ceecf21cdc07045c0bf99cf33de5100727233ae1c2d5eed3bb5676bb281` | 3,060,648 | `b3719c26be25455b809bb7d6df97c839d5b2c99e493ae9456ebb0a5d6fac470f` |

Each obligations file records:

- `complete = true`;
- `has_certificate_endpoint = true`;
- 45,865 total source assertions; and
- exactly 7,256 selected source obligations.

Both generated files are textually free of `sorry` and `admit`.

The full warning-as-error checks against the `/tmp` endpoint oleans were
stopped deliberately after about 39 minutes.  At that point each Lean process
was still running at approximately 100% CPU with approximately 10 GB resident
memory and had emitted no warning or error.  A stack sample placed Lean in the
snapshot-tree run/report traversal of the giant monolithic command.  The
processes were interrupted explicitly and exited with status 130.

This status is **ENGINEERING-ABORTED**, not a failed proof check.  No Lean
diagnostic rejected either ingress.

## Scalable split ingresses: generated and validated

`split_verified_ingress.py` parameterizes the already-used middle-orbit split
over `left`, `middle`, and `right`.  Regenerating the middle split into `/tmp`
and comparing it with `generated-middle-verified-ingress-split/` produced no
differences.

The new left and right trees each contain:

- one assignment module;
- 114 independent bridge modules; and
- one itemwise endpoint module.

| Orbit | Files | Total bytes | Tree digest |
| --- | ---: | ---: | --- |
| left | 116 | 2,947,221 | `285c1b4df3c755325726e22b8bacd594439ee2f260cf90e22df2575f51546a14` |
| right | 116 | 2,947,685 | `39c36a49240250416df622fd97b5b6dd1ac1d67c595ad28a9214a56dbab738db` |

The tree digest is the SHA-256 of the sorted per-file `shasum -a 256` output,
including paths.  Both trees are textually free of `sorry` and `admit`.

After the raw verifier entrypoints were made import-safe, all three split trees
were rebuilt from the persisted sources and validated under Lean 4.27 with
warnings as errors.  The current result is recorded in the next section.

## Current post-rename validation

The raw generator formerly emitted a root declaration named `main` in every
orbit.  Each orbit compiled separately, but importing all three collided at
that shared name.  The generator and persisted modules now expose:

```text
Problem97.ATailExactFiveCard13AllOneCertificate.Left.verifierMain
Problem97.ATailExactFiveCard13AllOneCertificate.Middle.verifierMain
Problem97.ATailExactFiveCard13AllOneCertificate.Right.verifierMain
```

This is an engineering import correction only.  Regenerating and rechunking
left, middle, and right left all LRAT part hashes and whole-stream hashes
unchanged.

The three raw modules pass the warning-as-error check and have current olean
artifacts under
`/tmp/exact5-card13-all-one-certificate-endpoints-current/`:

| Orbit | Olean bytes | Olean SHA-256 |
| --- | ---: | --- |
| left | 118,979,960 | `c58b60c84f7b8de0dadb16a07c2511b6e55abceaea772b5661d463b6dc9d21e2` |
| middle | 116,653,832 | `a602d9ebcc9ec441fa3b487980f5613efadf342230ee2a75650986e8d5e1a3ac` |
| right | 118,762,912 | `b83a0ce39372dc98e52e3e2894586e5a599ae88d461183243c6ba1aad698d611` |

The full split check compiled 348 core modules: three assignments, 342 bridge
chunks, and three endpoints.  All 348 passed.  The run began at
`2026-07-22T12:06:42.714808+00:00` and finished at
`2026-07-22T12:15:01.855209+00:00`, about 8 minutes 19 seconds wall clock with
24 workers.

| Orbit | Core modules | Sum of module times | Longest module |
| --- | ---: | ---: | --- |
| left | 116 | 1,793.26 s | chunk 29, 436.69 s |
| middle | 116 | 1,551.27 s | chunk 29, 425.98 s |
| right | 116 | 1,457.38 s | chunk 29, 420.68 s |

The generated axiom audits then passed for all three orbits.  Each audit covers
114 bridge theorems plus `false_of_sourceChunks_each`.  In each orbit, 102
declarations depend exactly on `[propext, Quot.sound]`; 13 depend exactly on
`[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler,
Quot.sound]`.  No declaration reaches `sorryAx`.

A final combined smoke module imports the left, middle, and right split audit
modules simultaneously, checks all three qualified command-line entrypoints,
and prints the axiom closure of all three itemwise endpoints.  The validator
now emits and compiles this smoke automatically whenever all three orbits are
selected.  Its latest warning-as-error run passed in 2.70 seconds.  Its olean
SHA-256 is
`a716c337f82430cf9408f95c44c77b6501a855b123d3cd2ae31d3e9c3c4c1499`.

The original full validator summary contains three failed audit jobs after its
348 passing core jobs because those generated audit sources were initially
placed under `/tmp` and rejected by Lean's source-containment check.  Moving
the generated audit sources into this scratch directory and rerunning
`--audit-only` produced three passes.  Those superseded failures are an
engineering-preflight artifact, not proof failures.

The ephemeral logs for this checkpoint are:

- `/tmp/exact5-card13-all-one-certificate-ingress/validation-results.json`;
- `/tmp/exact5-card13-all-one-certificate-ingress/validation-axiom-audit-results.json`;
- per-module logs under each `*-ingress-split-current/logs/`; and
- `/tmp/exact5-card13-all-one-certificate-ingress/combined-ingress-split-current/logs/AllOneCombinedVerifiedSplitImportSmoke.log`.

## Exact orbit obligation delta

The left, middle, and right obligations arrays have the same length, 7,256.
Pairwise comparison shows that exactly three positions differ: core positions
1947, 1948, and 1949.  All other obligation entries are identical.

All three entries lie in chunk 30:

### Core position 1947

- chunk offset 27; source index 37,311
- middle source: `(not (and g0_8_2 g0_8_1))`
- middle packed: `!((rowBit rows 1 8 2 && rowBit rows 1 8 1))`
- left source: `(not (and g0_8_1 g0_8_2))`
- left packed: `!((rowBit rows 1 8 1 && rowBit rows 1 8 2))`
- right source: `(not (and g0_8_3 g0_8_1))`
- right packed: `!((rowBit rows 1 8 3 && rowBit rows 1 8 1))`

### Core position 1948

- chunk offset 28; source index 37,324
- middle source: `(not (and g1_8_2 g1_8_3))`
- middle packed: `!((rowBit rows 2 8 2 && rowBit rows 2 8 3))`
- left source: `(not (and g1_8_1 g1_8_3))`
- left packed: `!((rowBit rows 2 8 1 && rowBit rows 2 8 3))`
- right source: `(not (and g1_8_3 g1_8_2))`
- right packed: `!((rowBit rows 2 8 3 && rowBit rows 2 8 2))`

### Core position 1949

- chunk offset 29; source index 37,325
- middle source: `(not (and g1_9_2 g1_9_3))`
- middle packed: `!((rowBit rows 2 9 2 && rowBit rows 2 9 3))`
- left source: `(not (and g1_9_1 g1_9_3))`
- left packed: `!((rowBit rows 2 9 1 && rowBit rows 2 9 3))`
- right source: `(not (and g1_9_3 g1_9_2))`
- right packed: `!((rowBit rows 2 9 3 && rowBit rows 2 9 2))`

## Next layer

There is no remaining certificate-ingress validation gate.  Source composition
and final three-orbit dispatch are a separate lane.  They should use the raw
current endpoint root together with all three current split roots so that the
combined import graph is exercised, not three isolated orbit environments.
