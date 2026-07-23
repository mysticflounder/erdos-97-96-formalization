# Trimmed occurrence generator

## Status

This directory contains deterministic authenticated mapping infrastructure for
the `p5` largest-order, seed-0 exact-two trimmed certificate. The production
trimmed-certificate report is not present as of 2026-07-23, so no production
mapping JSON is claimed here yet. The embedded synthetic end-to-end self-test
is available now. The upstream
`unique4-exact-two-core-map/materialize_trimmed_reduced_core.py` draft still
has undefined publication-stage names and must be repaired and revalidated
before it can publish the report consumed here; that unfinished draft is not
part of this checkpoint.

## Commands

From the repository root:

```bash
UV_CACHE_DIR=/tmp/trimmed-occurrence-uv-cache uv run python \
  scratch/atail-force/unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/build_trimmed_occurrence_map.py \
  --self-test
```

After `materialize_trimmed_reduced_core.py` publishes
`p5-largest.trimmed-certificate.json` and its hashed trimmed core:

```bash
UV_CACHE_DIR=/tmp/trimmed-occurrence-uv-cache uv run python \
  scratch/atail-force/unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/build_trimmed_occurrence_map.py
```

The production default output is the compact, deterministically key-sorted
`p5-largest.trimmed-occurrence-map.json` in this directory. A data-only Lean
module containing the exact dense signed clauses can also be requested:

```bash
UV_CACHE_DIR=/tmp/trimmed-occurrence-uv-cache uv run python \
  scratch/atail-force/unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/build_trimmed_occurrence_map.py \
  --lean-output scratch/atail-force/unique4-exact-two-source-bridge/TrimmedOccurrenceGenerator/P5LargestTrimmedClauses.lean
```

Explicit `--report`, `--greedy`, `--input-core-map`, `--input-core-cnf`,
`--dense-cnf`, and `--trimmed-core-cnf` options support audited relocation
without weakening hash checks.

## Occurrence chain

For each trimmed clause, the generator follows:

1. its one-based entry in the exact trimmed-core CNF;
2. `clause_numbering.core_to_input_clause_id` in the certificate report;
3. that one-based occurrence in the retained dense input, whose order is the
   original input-core order filtered by the recorded retained families;
4. the corresponding `core_clauses` entry in `p5.input-core-map.json`; and
5. that entry's allocated original input occurrence, unique allocated
   provenance candidate, semantic parameters, named literals, and schema
   orientation candidates.

The trimmed clause's literal order is preserved exactly. Named source atoms
are reordered occurrence-wise into that exact trimmed order. The retained
dense-input order and original source-core order are also retained as separate
fields so an audit does not confuse order equality with multiset identity.

## Enforced invariants

The generator rejects unless:

- all recorded report, greedy, map, source-core, and trimmed-core hashes agree;
- the input-core map has contiguous clause indices and exact source literal
  order, canonical signed multisets, complete named-literal coverage, and one
  allocated provenance candidate per occurrence;
- the greedy family partition and retained counts agree with the map;
- `old_to_new` is exactly the sorted retained source-variable bijection onto
  contiguous one-based dense variables;
- the hashed dense CNF is exactly the retained source clauses after that
  renaming, including clause and literal order;
- every `core_to_input_clause_id` is in range, unique, and covers exactly one
  emitted trimmed clause;
- every trimmed clause has the same signed-literal multiset as its bound dense
  input occurrence, with no duplicate literals;
- every bound source entry belongs to a retained family;
- every trimmed literal maps to exactly one named source atom; and
- no trimmed literal uses a variable outside the authenticated dense mapping.

The self-test accepts a fixture with duplicate source-clause semantics and
literal reordering, then checks rejection of non-bijective renaming, repeated
occurrence allocation, incomplete coverage, auxiliary variables, literal
drift, and artifact-hash drift. It also audits the live pre-report greedy/map/
core trio when those files are present. On 2026-07-23 this live audit passed
for all 61,065 input-core clauses.

## Epistemic scope

The output authenticates a fixed finite mapping only. It does **not** prove
that live geometric hypotheses generate these clauses, does **not**
independently verify UNSAT, does **not** claim a source-to-CNF closure bridge,
and does **not** close a production `sorry`. The optional Lean file is data,
not a theorem.
