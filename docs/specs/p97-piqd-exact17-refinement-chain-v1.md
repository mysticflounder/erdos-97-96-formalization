# P97 exact-17 PIQD root-refinement lane v1

> **Historical finite-refinement contract (2026-08-10).** Preserve this root
> and its receipts for replay and regression. Do not extend it as the
> proof-producing exact-17 route. A new PIQD root may enter production only
> through the Lean finite-normal-form and checked-export gates in
> `docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md`.

## Purpose

This contract onboards one existing exact-17 Rigid221/BlockerV computation into
PIQD without changing its mathematical scope.  It freezes one normalized
cap-nine root CNF and eight append-only refinements:

1. seven model-derived two-Kalmanson cut rounds; and
2. the complete pair-closure fragment generated from the selected-pair receipt.

The contract is a finite custody and replay artifact.  It is not source
entitlement, aggregate order-case coverage, a universal lift, theorem closure,
a Lean proof, or a daemon-signed attestation.

## Canonical manifest

The manifest schema is
`p97-exact17-cap9-root-refinement-lane/v1`.  JSON is UTF-8 canonical compact
JSON with sorted keys, no duplicate keys, no non-finite numbers, and no
trailing newline.  Its exact top-level keys are:

```text
schema
lane
producer
root
variable_map
refinements
aggregate
replay
resource
claims
```

The lane records the normalized order index, anonymous positions, complete
17-point order, finite scope, and terminal semantics.  The producer records an
exact Git commit, invocation, executable version, and byte-count/SHA-256
identity for every direct generation source.

The root binds the DIMACS file, its producer manifest, its independent
validation record, and the dimensions.  The variable-map artifact contains
exactly one entry for each DIMACS identifier, in identifier order:

- 272 selected-row variables;
- 13 fifth-center choice variables;
- 1,088 eight-bit edge-label variables; and
- 73,440 eight-bit pairwise edge-XOR variables.

That is the complete 74,813-variable domain.  No refinement may introduce a
larger variable identifier.

## Refinement chain

Refinement ordinals are dense from zero.  Every entry binds:

- its kind (`cut_round` or terminal `pair_closure`);
- the original receipt and receipt schema;
- one raw zero-terminated DIMACS clause fragment with no `p cnf` header;
- exact fragment byte count, SHA-256, and clause count;
- the parent formula SHA-256 and clause count;
- the result formula SHA-256 and clause count; and
- the source session/model/analysis or selected-pair provenance.

The parent identity at ordinal zero is the root identity.  Thereafter each
parent identity must equal the preceding result identity.

## Byte-exact reconstruction

The aggregate algorithm is
`root-body-plus-ordered-raw-fragments/v1`:

1. read and validate the root `p cnf` header;
2. retain every byte after that header unchanged;
3. append all raw fragments in ordinal order, unchanged; and
4. replace only the first header's clause count with the cumulative count.

The validator parses every fragment clause, requires one terminal zero,
forbids embedded zeros, headers, comments, blank lines, and variables above the
root domain, and checks the declared clause count.  It reconstructs and hashes
every cumulative stage, then the final aggregate.  PIQD ingestion must reject
the package unless the reconstructed aggregate has exactly the manifest's
SHA-256, byte count, and dimensions and is at most 256 MiB.

## Current frozen instance

The local frozen manifest is:

```text
scratch/rigid221-blockerv-exact17-20260806/
  piqd-exact17-cap9-root-refinement-lane-v1/manifest.json
```

Its offline-validated aggregate is:

| Field | Value |
|---|---:|
| Variables | 74,813 |
| Clauses | 4,254,176 |
| Bytes | 196,106,545 |
| SHA-256 | `2aa85c2368c3f271caebe47c4a6b861cc7e64d177cd349e58697a724c4b43605` |

The manifest SHA-256 is
`e025d750cee5cddcb42dd42776df7c35106542f34bb7ee95d8eedc7875d64d1b`.
The full variable-map SHA-256 is
`40e4c5639a2ab0a253ed7e4029695f9a240a0c7043e60dbd6629933f9cdce84b`.

These hashes describe the current local finite package.  They do not promote
its root exporter to source-entitled status: the root producer snapshot
contains untracked source that later drifted and is not recoverable from Git.
Accordingly the manifest deliberately keeps `source_entitlement` false.

## Required claims

`normalized_case_only` must be true.  All of the following must remain false
unless a separate authenticated artifact establishes them:

- `source_entitlement`;
- `aggregate_case_coverage`;
- `universal_lift`;
- `theorem_closure`;
- `lean_checked`; and
- `daemon_signed_attestation`.

The production resource policy is one core, one solver process, no internal
parallelism.  A PIQD result becomes a daemon attestation only after the PIQD
adapter validates this manifest, reconstructs the exact aggregate, uploads it,
and binds the returned immutable session/result receipt to that aggregate.

## Implementation and tests

- `census/p97_search/phase3_piqd_exact17_refinement_chain.py` validates and
  reconstructs the package.
- `census/p97_search/freeze_exact17_piqd_refinement_chain.py` deterministically
  freezes the existing receipts and variable map.
- `census/p97_search/tests/test_phase3_piqd_exact17_refinement_chain.py` checks
  valid reconstruction and fail-closed behavior for ordinal, hash, count,
  variable-range, embedded-header, termination, and schema tampering.

The PIQD-side adapter is additive.  It must consume this contract without
weakening the existing claim separation or treating a SAT/UNSAT solver result
as a Lean or universal P97 conclusion.
