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
