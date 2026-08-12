# P97 PIQD clause-map consumer v1

Status: additive strict consumer implemented in
`census/p97_search/phase3_piqd_clause_map.py`.

This module consumes the bytes returned by PIQD
`GET /jobs/:id/clause-map`. It does not trust the daemon's interpretation of
the submitted formula. It independently parses the exact submitted DIMACS
bytes, recomputes the complete sparse normalization exception list, and
reconstructs the canonical kept-CNF hash and count.

The authoritative producer contract is PIQD Rust `piqd-clause-map/v1` as of
2026-08-09. The pure entrypoint is:

```python
consume_clause_map(
    response_bytes: bytes,
    submitted_cnf: bytes,
    job: PreparedJob,
) -> ValidatedClauseMap
```

The result is a frozen, slotted dataclass. Its
`certificate_id(submitted_id)` method performs a binary search over dropped
clause IDs. It does not construct a dense array with one entry per submitted
clause.

## Accepted response

The response root must have exactly these keys:

| Key | Required v1 type |
|---|---|
| `version` | builtin string, exactly `piqd-clause-map/v1` |
| `submitted_sha256` | lowercase 64-character SHA-256 string |
| `submitted_clauses` | nonnegative builtin integer |
| `kept_sha256` | lowercase 64-character SHA-256 string |
| `kept_clauses` | nonnegative builtin integer |
| `exceptions` | array |
| `expansion_rule` | builtin string, byte-for-byte fixed v1 text |
| `boundary` | builtin string, byte-for-byte fixed v1 text |

Unknown or missing keys, duplicate JSON object keys, non-finite JSON constants,
non-object roots, scalar subclasses at the Python job boundary, booleans used
as integers, and future versions or fixed-string drift fail closed.

A `dropped_tautology` exception has exactly:

```json
{
  "submitted_id": 23,
  "kind": "dropped_tautology",
  "submitted_sha256": "..."
}
```

A `deduped_literals` exception has exactly:

```json
{
  "submitted_id": 19,
  "kind": "deduped_literals",
  "submitted_sha256": "...",
  "normalized_sha256": "...",
  "normalized_literals": [-1, 9]
}
```

Normalized fields must be absent, rather than null, for a dropped clause. The
exceptions must have strictly increasing, unique, in-range `submitted_id`
values.

## Independent semantics

The submitted artifact is bound three ways:

1. `submitted_sha256` must equal SHA-256 of `submitted_cnf` exactly, including
   comments and whitespace.
2. The same digest must equal `job.cnf_blob_hash`.
3. Parsed variable and clause counts must equal the exact builtin integer
   counts in the `PreparedJob`; parsed clause count must also equal the response.

Only a `cadical` job with a recognized CaDiCaL profile is accepted. Job ID,
identity hash, CNF hash, counts, `existing`, and optional core limit are checked
for their exact builtin types and ranges. This binds the checked object to the
provided prepared-job identity; it does not authenticate where that job record
came from.

Every submitted clause is normalized from left to right:

- the first occurrence of a literal is kept;
- a repeated identical literal is omitted;
- encountering a literal whose complement was already seen drops the entire
  clause as a tautology.

The consumer recomputes the submitted and normalized clause-body hashes. A
clause body is its decimal literals in order, each followed by one ASCII space,
then `0`, with no newline. It then compares the locally produced exception tuple
to the response tuple exactly. This establishes that there is no missing,
spurious, reordered, duplicated, or altered exception.

A second pass reconstructs PIQD's canonical kept DIMACS bytes:

```text
p cnf <num_vars> <kept_clauses>\n
<normalized literals separated by one space> 0\n
...
```

The resulting digest and kept count must equal the response. The immutable
`canonical_kept_cnf` field carries those reconstructed bytes for downstream
artifact custody. Scanning retains only the current clause plus the sparse
exceptions and the required output byte string; it does not retain clause
objects or construct the expanded submitted-to-certificate map.

## Identity predicates and lookup

Artifact byte identity and clause identity are different predicates. Comments
or noncanonical submitted whitespace are removed by canonical kept-CNF
rendering, so `submitted_sha256 != kept_sha256` does not imply any clause
change.

- `numbering_identity` is true exactly when there are no
  `dropped_tautology` exceptions. A deduplicated clause changes content but does
  not shift numbering.
- `content_identity` is true exactly when the complete exception tuple is
  empty.

For an in-range 1-based submitted ID `n`, `certificate_id(n)` returns `None` if
`n` was dropped. Otherwise it returns `n` minus the number of dropped IDs
strictly smaller than `n`. Lookup costs logarithmic time in the number of
dropped exceptions and constant additional memory.

## Artifact and proof boundary

`response_sha256` binds the exact raw HTTP response bytes, including their JSON
formatting. The validated result also carries PIQD's fixed boundary verbatim:

> LRAT proves the final strengthened CNF unsatisfiable. It does not by itself
> prove that CEGAR-added clauses follow from the original encoding.

The following result fields are unconditionally false:

- `producer_provenance_authenticated`;
- `certificate_proof_linkage_authenticated`;
- `source_entitlement_established`;
- `source_coverage_established`;
- `universal_result_established`; and
- `lean_closure_established`.

This local consumer therefore checks clause-map syntax and semantics only. It
does not authenticate PIQD as the producer, connect the map to proof bytes or a
solve receipt, show that refinement clauses follow from the source encoding,
establish universal P97 coverage, or establish Lean closure. CERT-001 was
requested separately in project conversation message 4276 to provide an
immutable source-to-certificate handoff manifest. This module does not emulate
or pre-approve that unshipped producer feature.

The proof-blueprint session `019fdf9c` is unchanged, open, and off-spine.

## Focused validation

Run in one process:

```bash
PYTHONPATH=. uvx --from pytest pytest -q \
  census/p97_search/tests/test_phase3_piqd_clause_map.py
uvx ruff check \
  census/p97_search/phase3_piqd_clause_map.py \
  census/p97_search/tests/test_phase3_piqd_clause_map.py
uvx ruff format --check \
  census/p97_search/phase3_piqd_clause_map.py \
  census/p97_search/tests/test_phase3_piqd_clause_map.py
```

The focused tests cover clean commented/noncanonical input, deduplication,
tautology shifts, all response hashes/literals/counts, malformed and incomplete
exception lists, duplicate/non-finite JSON, unknown keys, scalar subclasses,
fixed-string drift, job bindings, explicit false claims, and a two-million
clause empty-exception lookup without dense materialization.

## Known producer parser mismatch

The audit found that PIQD raw-DIMACS ingest accepts the DIMACS token stream when
a clause spans physical lines or several zero-terminated clauses share one
line. The current `piqd-lrat` parser used by proof minting and the clause-map
route instead treats each body line as one clause and stops at its first zero.
Thus some CNFs accepted by `prepare-cnf` cannot be interpreted consistently by
the certificate lane. This was reported in project conversation message 4279.

The P97 consumer follows the exact submitted DIMACS token stream and will fail
closed when a producer response reflects different parsing. PIQD must either
unify the parsers or reject the wider forms at ingest; this local consumer does
not repair the daemon or authenticate an affected certificate.
