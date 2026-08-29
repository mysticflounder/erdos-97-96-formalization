# P97 PIQD exact17 semantic ingress v1

> **Superseded for proof-producing ingress (2026-08-10).** This specification
> remains the contract for finite Python source custody and semantic replay of
> the pinned v19 artifact. It is not the source of truth for the exact-17 Lean
> theorem. The production route is
> `docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md`, which requires a proved
> Lean finite normal form, checked SAT export, and aggregate placement consumer
> before these PIQD checks can contribute to theorem closure. In particular,
> the variable map and deterministic center in this v1 adapter are
> Python-validated, not Lean-proved.

Status: implemented as an off-spine, finite source-custody and semantic-replay
adapter. The proof-blueprint anchor
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier` remains open
and unchanged. This adapter does not close, narrow, or promote that Lean
obligation.

## Claim boundary

The adapter distinguishes three results:

1. a structural decode checks the total variable allocation and all XOR helper
   formulas, but explicitly reports that source replay was not run;
2. finite source-semantic evidence additionally checks exact custody, every CNF
   clause, and the pinned source predicates; and
3. a self-hashed semantic receipt binds all inputs and the resulting evidence.

None is aggregate case coverage, a universal lift, theorem closure, or Lean
checking. Every bundle, package, decoded object, evidence object, audit, and
receipt fixes exactly these mathematical claims to false:

```json
{
  "aggregate_coverage": false,
  "lean_checked": false,
  "theorem_closure": false,
  "universal_lift": false
}
```

Finite evidence uses a separate `evidence` object. Only after all finite checks
pass may it state:

```json
{
  "all_cnf_clauses_satisfied": true,
  "finite_source_custody": true,
  "source_predicates_replayed": true,
  "total_model": true
}
```

These are properties of one byte-bound finite package and model, not theorem
claims.

## Exact source custody

All paths are canonical repository-relative POSIX labels. Files are opened one
path component at a time with no-follow flags, must be regular files, are size
bounded, and are checked for identity changes before and after the exact-byte
read. Each embedded snapshot contains its label, byte count, SHA-256, and
canonical base64 bytes. Validation decodes and re-encodes each base64 string,
so encodings with nonzero unused pad bits are rejected even when a permissive
decoder would produce the same bytes. Bundle validation operates from those
embedded bytes; it does not reopen mutable live source.

Production adapter v1 accepts one reviewed source-entitled artifact, fresh
v19, and its exact nine-key producer dependency set:

- `source_runner`;
- `direct_exporter`;
- `base_cnf_exporter`;
- `fullcover`;
- `order_base`;
- `producer_bank`;
- `shared_late_pair`;
- `direct_row_consumers`; and
- `static_schema_lean_consumers`.

Logical source names and source paths must both be unique. The manifest,
provenance-sidecar, CNF, source, artifact, and analysis labels must be mutually
disjoint. The manifest must declare exactly one artifact and 44 ordered
analyses; all 45 input bytes are captured in manifest order. Individual and
aggregate byte limits apply to sources and inputs, and the CNF is capped at 256
MiB.

## Runner-recorded provenance sidecar

The raw producer manifest does not contain an invocation or runtime object. A
fresh runner therefore records canonical `producer-provenance.json` bytes with
exactly:

```json
{
  "case": {"anonymous_positions": [0, 1], "order_index": 0},
  "command": ["exact", "producer", "argv"],
  "manifest": {
    "label": "repo/relative/candidate.manifest.json",
    "sha256": "raw manifest byte SHA-256"
  },
  "order": [0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14],
  "runtime": {
    "executable": "exact executable identity",
    "interpreter_version": "exact version string",
    "one_core": true
  },
  "schema": "p97-piqd-exact17-producer-provenance-v1",
  "source_hashes": {"producer logical name": "source byte SHA-256"}
}
```

Missing or extra keys, noncanonical JSON, duplicate keys, nonfinite numbers,
bad builtin types, or disagreement with the raw manifest are fatal. Booleans do
not pass integer checks.

This sidecar is runner-recorded observational provenance. Custody proves the
bytes and their internal agreement; it does not cryptographically authenticate
that the recorded command was executed. The sidecar is never described as a
producer-emitted field or execution attestation.

The v1 case is fixed to `order_index = 0`, anonymous positions `[0, 1]`, and the
17-point order above. A different case or order requires another adapter
contract.

## Manifest and CNF gate

The production trust root is artifact-specific. It pins:

- raw manifest SHA-256
  `19fe9d3ee8e24e9bdcefc2a0dfb62c81e484d784d3ff37fe5b291d8d7081d63a`;
- CNF SHA-256
  `ebca3272a22c945a235a3f1141c1646f1a9780f39eefec6164f57e48bbe84c7c`;
- exactly 74,813 variables and 2,875,629 clauses;
- canonical full `clause_blocks` inventory hash
  `f3be2c68037d2ad7754e424f6acfae329043a410732f84f774201b402f5762f5`;
- canonical `learned_record_kinds` hash
  `8ec7a136ae1b9ba10a469efc880bb172d1d6a7c5f6f85bb1b6292c250b559e32`;
- canonical `cut_admission` hash
  `7f970f29db05397a2fcfb3151c31f321c671546b6c90b68e46a14a689ba3d81b`;
  and
- exact scope text: `one normalized cap-nine case; nogood soundness and Lean
  lift remain separate`.

The subobject hashes bind the exact types, keys, nesting, values, and all 30
clause-block counts, rather than only requiring selected block names to have
positive counts. Thus a one-clause or tautological CNF cannot be substituted
while retaining plausible-looking block metadata. Test fixtures may replace
the private module trust root under `monkeypatch`; no production entry point
accepts a caller-selected contract.

The accepted manifest must additionally bind:

- schema
  `p97-rigid221-exact17-source-faithful-boolean-cnf-transitive-two-circle-candidate-v4`;
- `transitive_two_circle = true`;
- `learned_replay = "verified"`;
- exactly 74,813 variables and 2,875,629 clauses;
- the canonical CNF label and raw-byte SHA-256;
- the exact transitive metadata for 1,088 label variables, 73,440 XOR helpers,
  9,180 edge-pair comparisons, 61,880 five-point forbidden cores, and 9,520
  forbidden cores; and
- the exact full structural, source, learned, and transitive block inventory,
  including:
  `exact_four`, `source_coverage`, `two_center_common_hit`,
  `old_row_cap_units`, `old_row_outside_partition`,
  `fifth_center_exactly_one`, `fifth_row_source_and_one_hit`,
  `transitive_convex_five_point`, `transitive_label_selected_equality`,
  `transitive_label_xor_definition`, and
  `transitive_two_circle_bisector`.

The adapter independently parses the exact ASCII DIMACS bytes. It requires one
`p cnf 74813 2875629` header, in-range integer literals, terminating zeros, and
an actual clause count equal to both the header and manifest. Before source
replay or receipt issuance, it evaluates every clause against the total model.
An unsatisfied clause is fatal. This is the vacuous-SAT gate; a SAT status line
or a structurally plausible decoded object is not enough.

## Deterministic variable map and structural decode

The production map reconstructs every variable with no unnamed gap:

| Region | Variables | Count | Meaning |
|---|---:|---:|---|
| selected incidence | 1-272 | 272 | `selected(center, point)` for ordered distinct points |
| fifth choice | 273-285 | 13 | legal `fifth_source(point)` candidates |
| distance-label bits | 286-1373 | 1,088 | eight little-endian bits for each unordered edge |
| comparison XOR helpers | 1374-74813 | 73,440 | eight helpers for each unordered edge pair |

Each helper records and validates `helper = left XOR right` and its exact
four-clause CNF formula. Map validation rebuilds the expected allocation and
requires canonical byte equality, exact keys 1 through 74,813, exact region
counts, and exact coverage.

A model must be total: every variable 1 through 74,813 appears exactly once,
with no zero, duplicate, omission, or out-of-range literal. DIMACS model text
must contain exactly one `s SATISFIABLE` status and one final assignment zero.
Only after all helper formulas pass does the structural decoder expose all 17
supports, the fifth-choice list, and all edge label bits and integers. Its
source replay status is `NOT_RUN_BY_STRUCTURAL_DECODER`; it cannot issue a
semantic receipt.

## Pinned finite source replay

Adapter v1 pins the authenticated `source_runner` bytes to:

```text
exact17_source_faithful_cegar.py
SHA-256 9bb7ae8193b6c427273802b850bf8628a6a6a6762a6798afb30b9c138eee55a2
```

The adapter does not execute embedded Python. It locally reimplements the pure
`verify_model` contract associated with that exact hash and names a predicate
as replayed only after all predicates pass:

1. all 17 support keys are present;
2. each support has exact size four;
3. no support contains its own center;
4. the support union covers all 17 points;
5. every pairwise support intersection has size at most two;
6. old centers 8 through 11 have the fixed second-cap slices;
7. every outside point has old-row multiplicity exactly one;
8. exactly one legal fifth center is chosen;
9. its support contains deleted source 11; and
10. its physical-class intersection has size at most one.

A changed source-runner hash, manifest byte, CNF byte, clause-block inventory,
learned-record inventory, cut-admission object, or scope is not accepted
generically. Any future successor requires an explicit reviewed adapter
contract update. This prevents another artifact from inheriting v19's replay
claim merely because it uses the same schema or reports similar metadata.

## Canonical package and semantic receipt

`p97-piqd-exact17-semantic-package-v1` is built directly from an accepted
source bundle, the exact CNF bytes, and the exact production variable-map
bytes. It binds the raw manifest label and SHA, sidecar label and SHA, source
bundle SHA, CNF label/SHA/variable/clause counts, map SHA/count, and exact
case/order. Package validation rebuilds it from embedded bundle bytes and
requires byte equality. It does not depend on a historical v12t-only package.

`p97-piqd-exact17-semantic-receipt-v1` is available only after package
validation, a total production model, every XOR helper, every CNF clause, and
all ten pinned source predicates pass. It binds the package, CNF, model, source
bundle, variable map, decoded object, and semantic-evidence hashes. Its
`receipt_sha256` covers the complete canonical payload before the self-hash is
added. Receipt validation reruns every check and requires exact receipt-byte
equality with the recomputed result.

## Historical v12t remains rejected

The historical v12t audit is separate from fresh source entitlement. It
captures its eight legacy source entries and all 45 inputs, but rejects three
recorded/current byte disagreements:

| Source | Recorded digest prefix | Current-byte digest prefix |
|---|---|---|
| `base_cnf_exporter` | `8082ce7f` | `5a544227` |
| `direct_exporter` | `0dfe147b` | `6a480862` |
| `producer_bank` | `df0e5815` | `e2c63a11` |

It also lacks the required canonical provenance sidecar. Recovery found no
local copies of those three historical byte snapshots. The adapter never
substitutes current bytes or retroactively blesses the manifest. v12t therefore
remains a structured `PROVENANCE_MISMATCH` audit result and cannot produce a
semantic package, replay result, or receipt.

## Verification surface

Focused one-worker tests cover strict JSON and builtin types, canonical base64
snapshots, exact source/input counts, label duplication and cross-category
collisions, no-follow paths, symlinks, byte bounds and TOCTOU, sidecar
disagreement, pinned-runner and manifest-field changes, required clause-block
changes, one-clause advertised-block substitution, manifest/CNF rehashing,
malformed pinned metadata, unused base64 pad bits, the complete allocation,
map/formula/model tampering, partial and
duplicate assignments, package binding changes, CNF header/count/hash and
unsatisfied-clause failures, source-predicate failures, receipt self-hash
tampering, and the exact live v12t provenance-mismatch preflight.
