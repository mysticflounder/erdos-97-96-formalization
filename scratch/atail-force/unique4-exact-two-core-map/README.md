# Exact-two p4/p5 authenticated DRAT input-core provenance

This directory contains a deterministic, solver-free provenance mapper for the
two hash-pinned fixed-`n = 11` terminal CNFs:

| profile | terminal CNF | checkpoint SHA-256 | variables | clauses |
|---|---|---:|---:|---:|
| p4 | `/tmp/p97_u4_full_linear_cegar_p4.cnf` | `d1ff6359442edebbafa2ea9a01aa77c439a681b62a186e73cdbf528028fdb536` | 12,672 | 2,765,403 |
| p5 | `/tmp/p97_u4_seeded_v3_full_linear_p5.cnf` | `cbfd6ad9559dce5c9da5874a15da0ba7b5c876dfbaa056fc6eb009fc107119a1` | 12,672 | 2,768,417 |

`reconstruct_core_map.py` imports the exact current encoder modules, replaces
only their in-memory `CNF` class with a subclass that records each successful
`CNF.add` family, and replays the terminal build. It never invokes CaDiCaL,
`drat-trim`, Z3 solving, or a native classifier.

## Required authenticated extraction

A core is rejected unless it has the adjacent authenticated extraction
manifest:

- `p4.input-core-extraction.json`; or
- `p5.input-core-extraction.json`.

The accepted schema is `p97-exacttwo-drat-core-extraction-v1`. The mapper
verifies all of these bindings before the expensive reconstruction:

- exact profile and `n = 11`;
- terminal path, SHA-256, byte count, variable count, and clause count;
- proof path, SHA-256, and byte count;
- `drat-trim` checker path and SHA-256;
- exact `drat-trim` command, including the terminal, proof, and `-c` target;
- return code `0`, verdict `s VERIFIED`, and the transcript verdict;
- exact core path, SHA-256, byte count, variable count, and clause count; and
- checker-summary input/core clause counts.

The extraction manifest is an explicit trust boundary: it is a local
attestation generated after `drat-trim` exits, not a signature or a
kernel-checked object. The mapper authenticates its bound files against current
bytes but cannot prove that a dishonest actor did not fabricate the manifest.

## Terminal reconstruction gates

No map is written unless:

1. the checkpoint schema, `n`, profile, terminal status, and profile-specific
   refinement count are exact;
2. every checkpointed encoder/bank/source hash is current;
3. every variable name matches the terminal DIMACS comment at the same ID;
4. every rebuilt clause equals the DIMACS clause at the same one-based index,
   with exact literal order and duplicate occurrences preserved;
5. header counts match the reconstruction and checkpoint; and
6. the full terminal file SHA-256 matches the checkpoint.

Negative/zero/malformed headers, duplicate headers, empty cores, and empty
core clauses are rejected.

## Occurrence matching policy

The fixed publication policy is recorded in every successful output:

```json
{
  "clause_identity": "sorted_signed_literal_multiset",
  "duplicate_literal_policy": "reject",
  "duplicate_occurrence_policy": "allocate_canonical_input_occurrences_in_index_order",
  "schema_orientation_ambiguity_policy": "report_all_candidates",
  "unmatched_clause_policy": "reject",
  "unclassified_orientation_policy": "reject"
}
```

`drat-trim -c` may reorder a clause's literals, so core occurrence matching
uses the sorted tuple of signed literals—the Boolean clause's canonical
multiset semantics. Duplicate literals are rejected in both the core and
terminal/reconstruction, preventing canonicalization from hiding multiplicity.

For a duplicate canonical clause, core occurrences are allocated injectively
to terminal occurrences in increasing one-based input-index order. Every
candidate retains its original terminal literal order, the selected occurrence
reports whether its order was exact or reordered, the allocation is marked
ambiguous, and no terminal occurrence can be reused. Core multiplicity greater
than terminal multiplicity is rejected.

Any canonically unmatched clause aborts publication. Multiple valid
schema/orientation interpretations are reported as candidates; an orientation
that is neither forward, reflected, nor symmetric is rejected.

## Atomic fixed-name publication

Successful output is atomically replaced at exactly one of:

- `p4.input-core-map.json`; or
- `p5.input-core-map.json`.

There is no arbitrary `--output` option. On any failed profile run, an existing
success artifact is atomically quarantined as
`pN.input-core-map.rejected-stale-<nonce>.json`. Thus a failed rerun cannot
leave a stale file at the success name or overwrite source/documentation.

## Commands

Synthetic regression suite:

```bash
env UV_CACHE_DIR=/tmp/uv-cache-unique4-core-map \
  PYTHONDONTWRITEBYTECODE=1 \
  uv run python \
  scratch/atail-force/unique4-exact-two-core-map/reconstruct_core_map.py \
  --self-test
```

Authenticate the landed extraction without rebuilding the terminal or writing
a map:

```bash
env UV_CACHE_DIR=/tmp/uv-cache-unique4-core-map \
  PYTHONDONTWRITEBYTECODE=1 \
  uv run python \
  scratch/atail-force/unique4-exact-two-core-map/reconstruct_core_map.py \
  --profile 4 --authenticate-only
```

Authenticated mappings:

```bash
env UV_CACHE_DIR=/tmp/uv-cache-unique4-core-map \
  PYTHONDONTWRITEBYTECODE=1 \
  uv run python \
  scratch/atail-force/unique4-exact-two-core-map/reconstruct_core_map.py \
  --profile 4

env UV_CACHE_DIR=/tmp/uv-cache-unique4-core-map \
  PYTHONDONTWRITEBYTECODE=1 \
  uv run python \
  scratch/atail-force/unique4-exact-two-core-map/reconstruct_core_map.py \
  --profile 5
```

The default lookup checks this directory and `/tmp` for the core. Alternate
read-only inputs may be supplied with `--core`, `--terminal`, `--proof`, and
`--extraction-manifest`; the output name and location cannot be changed.

## Epistemic scope

An exact authenticated map establishes provenance inside the two named hashed
Boolean projections. It does not establish arbitrary-cardinality coverage,
source-to-CNF faithfulness beyond the already encoded contracts, a terminal
occurrence theorem, or a Lean proof.

## 2026-07-23 p5 bridge checkpoint

The selected p5 finite target is
`p5.greedy-family-largest-seed0.json`: 18 retained families, 9,412 clauses,
and 616 dense variables.  The dense renaming contains only the source atoms
for selected-row membership, complete-radius equality, and membership in the
distinguished first-apex class; it introduces no auxiliary variables.
External CaDiCaL UNSAT is discovery evidence only.  The previous untrimmed
LRAT replays were too large to use as the Lean endpoint.

The source side now has:

- source-faithful direct and mirror card-eleven boundary packets in
  `../unique4-exact-two-occurrence/`;
- the four seeded-schema terminals in
  `../unique4-exact-two-schema-decoder/`;
- retained-Kalmanson source adapters in
  `../unique4-exact-two-source-bridge/Kalmanson/`; and
- the missing normalized schema-5/schema-8 mirror terminals in
  `../unique4-exact-two-source-bridge/MirrorSchema58/`.

The authenticated trimmed-core mapper in
`../unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/` passes its
synthetic rejection suite and audits the complete 61,065-clause p5 input-core
map.  It fails closed until `p5-largest.trimmed-certificate.json` and its
hashed trimmed CNF are published.

The authenticated p4 and p5 occurrence maps are tracked as
`p4.input-core-map.json.gz` and `p5.input-core-map.json.gz`; the uncompressed
114 MB and 144 MB JSON files are intentionally not committed. On a fresh
checkout, `gzip -dk <map>.json.gz` reconstructs the raw input expected by the
current audit scripts.

The next replayable endpoint is:

1. repair and revalidate the unstaged `materialize_trimmed_reduced_core.py`
   draft, whose publication stage currently references undefined names;
2. generate and Lean-check the trimmed p5 LRAT;
3. emit the authenticated trimmed occurrence map;
4. finish the direct/mirror indexed source valuation, including the explicit
   reflection transport `i ↦ -i mod 11`; and
5. derive the p5 exact-two contradiction by combining source satisfiability
   with the verified trimmed-CNF UNSAT theorem.

No production `sorry` is closed by this checkpoint.  The analogous p4 bridge
starts only after p5 is complete.

## 2026-07-23 p5 trimmed-replay result

`materialize_trimmed_reduced_core.py` now passes its isolated fallback
self-test and accepts an optional deterministic CaDiCaL seed.  It publishes a
production package with explicit clause-numbering provenance.  For
`p5.greedy-family-largest-seed0.json`, the externally checked seed-7 pipeline
(`--factor=false --no-binary --seed=7`) produced:

- 9,412 dense input clauses and an 8,703-clause trimmed core;
- a core-relative, normalized 334,607,857-byte LRAT;
- 984,205 pure-RUP additions, 487,508 deletions, and 44,826,270 hint
  occurrences; and
- an authenticated 8,703-clause occurrence map with bindings SHA-256
  `992588fb49758399b5ce0a0fa16385a7e0f347c2d6332a292fbf8effdfebf330`
  and artifact SHA-256
  `7ddd7a6fcdf46a8185bab0672a54130776322d24ad1dd74828b1d3812d4a6249`.

CaDiCaL and both `drat-trim` verification passes succeeded.  The generated
one-shot `Std.Sat.Reflect.verifyCert` theorem for the preceding seed-0
363,172,369-byte certificate did not fail logically, but its Lean process
timed out after 7,200 seconds with no diagnostic output while still consuming
approximately one CPU core.  The seed-7 certificate has 7.5% fewer hint
occurrences, but was not sent through another two-hour one-shot replay.  Its
published report therefore correctly says `LEAN REPLAY SKIPPED`; this is not
a kernel-checked UNSAT endpoint.

Dependency slicing retains every addition and saves only about 2.9% by
discarding deletions.  The remaining bottleneck is the monolithic Std LRAT
path, which parses the whole proof and retains all actions before checking.
Newline file chunking alone still rejoins one proof and is not expected to
remove that bottleneck.  A successful revision needs either a substantially
smaller certificate or a sound state-threaded/checkpointed checker
representation.

The occurrence map is source-name and occurrence provenance only.  The
direct/reflected `IndexedSource` valuation, a kernel-checked UNSAT theorem, and
their composition are all still required before the p5 exact-two constructor
is closed.  Neither live production `sorry` is discharged here.

## 2026-07-23 two-shard checkpointed RUP prototype

`lean/Erdos9796Proof/P97/Certificate/CheckpointedRup.lean` is an importable,
sound checker for splitting a pure-RUP certificate across one compact
checkpoint. The first shard checks
RUP additions and deletions against the original clause identifiers, then
requires its active semantic clause list to equal the checkpoint clause list.
The second shard starts from that compact array with fresh local identifiers
and must derive the empty clause.

The proved composition theorem is `checkTwo_sound`.  Its first-shard invariant
is logical implication, not equivalence: a successful RUP addition preserves
the formula, while deletion weakens it.  Exact semantic clause-list equality
at the rebase boundary transfers the checkpoint result soundly.  The
`Action` type has no RAT constructor, so unsupported RAT additions are
rejected structurally.

The in-file kernel-decided self-test exercises all four required operations:

1. derive a RUP unit;
2. delete the two clauses consumed by that derivation;
3. rebase the two surviving units onto compact local identifiers; and
4. derive the empty clause in the second shard.

It also checks that a checkpoint missing one active clause is rejected.
Running

```bash
cd lean
lake-build Erdos9796Proof.P97.Certificate.CheckpointedRup
```

currently succeeds.

An audit of the current `piqd`/`piqd-lrat` implementation found reusable
whole-proof parsing, dense renumbering, content-addressed blob storage, and
manifest patterns, but no sound resumable checker or sequential shard state.
Its existing chunking only splits emitted Lean clause definitions; it does not
split LRAT checking.

The streaming materializer now lives in
`../unique4-exact-two-lrat-ingress/`. It emits only pure-RUP actions,
computes and checks the active checkpoint and local-ID rebase, hash-binds the
package and exact checker, and rejects structural drift. Its 23-test suite and
the bounded Lean text-ingress replay pass.

The real seed-7 package has also been generated and independently reverified:

- package SHA-256
  `4229c86fd26f38e812d20467c68fbefa04838101611b6e73b00210cb0a444232`;
- 8,703 base clauses and 23,857 checkpoint clauses;
- shard 1: 492,102 additions and 21,491,717 hints; and
- shard 2: 492,103 additions and 23,334,553 hints.

This is still `STRUCTURALLY VALIDATED PURE-RUP SHARDS; LEAN REPLAY REQUIRED`.
The checker now has separate sound text entry points for the first and second
shards. A real first-shard one-shot replay nevertheless retained more than
23 GiB without producing an `olean` and was interrupted after more than
20 minutes. The next endpoint is therefore independently rebased windows
inside each logical shard, initially capped at 4,000 actions and 4 MiB of LRAT
text. Therefore this work does not yet establish the p5 UNSAT theorem and does
not close either production `sorry`.
