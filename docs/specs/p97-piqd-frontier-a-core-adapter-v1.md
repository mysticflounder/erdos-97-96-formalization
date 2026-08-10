# P97 PIQD Frontier A-core adapter v1

Status: bounded finite-canary ingress specification. This document does not
claim a theorem, a universal result, Euclidean validity, source entitlement,
theorem-bank promotion, or Lean closure.

The adapter is an additive producer/runner boundary for
`census/frontier-packages/a_core`. It never edits the legacy package. The
selected case is exactly `base+P`, with `requested_core_limit = 1` and a
strictly positive timeout. A run has one prepare and one confirmation. A
separate status read is permitted only after a 201/200 confirmation that
returns the nonterminal string `confirmed`; when the PIQD client handles HTTP
409 by reading status internally, the returned terminal payload is consumed
directly and is never status-read a second time. Ambiguous retries are
forbidden. The exact PIQD identity binds backend `cadical`, profile `sat`, the
CNF digest, producer-manifest digest, dimensions, and core limit.

## Authenticated package

The producer must provide:

* exact bounded regular-file captures of `encoding.py`, `run.py`, `smoke.py`,
  and `RESULTS.md`;
* a source-faithful reconstruction of the selected `base+P` CNF from those
  captured bytes, plus a canonical producer manifest with no unknown keys,
  exact builtin scalar types, exact source/CNF/map hashes, and dimensions
  matching DIMACS;
* a canonical map under source contract
  `a-core-incidence/base+P-source-v2`. It has exactly 889 variables and
  21,101 clauses, preserves the encoder's sparse real IDs for all 432 named
  atoms, and labels every absent ID `aux_N` (including 880--889). Variable 1
  is the source atom `eq(a0,f1)`, not a caller-defined ordering. Caller-
  invented labels, duplicate labels, reordered named atoms, and partial maps
  are rejected. Clause families use the exact
  `a-core-incidence/base+P-clause-families-v2` allowlist and count contract
  (`base: 21074`, `DEL2: 5`, `C10: 1`, `DEL3: 21`), rather than arbitrary
  caller-provided strings; and
* a complete atom-to-builtin-Boolean model. The PIQD-returned SAT assignment
  must cover all 889 variables. Every clause is evaluated independently after
  mapping atom values back to DIMACS ids. The adapter does not trust
  `model_true_atoms` or a solver response as a substitute for this check.

`build_source_package()` and `packet_from_source_package()` are the strict
additive producer seam. They authenticate source/CNF/map bytes without
requiring the stale legacy model to be accepted; PIQD's total SAT assignment
is the first complete model. The separate legacy loader may inspect
`out/manifest.json`, `out/base+P.cnf`, `out/base+P.model.json`, and its map
sidecar for diagnostics, but those legacy artifacts are not inputs to the
production source-package contract.

The producer manifest is a self-describing SHA-256 record over every captured
source/artifact. The package identity additionally binds the exact CNF bytes.
Symlinked components, path traversal in every manifest artifact (including
nonselected records), changed-size/metadata captures, oversized bytes,
excessive JSON depth/nodes, oversized integer tokens, noncanonical JSON
(`allow_nan=False`), duplicate keys, dimensions above explicit limits, missing
variables, malformed source atoms, and unknown manifest keys fail closed. A
legacy tree without an authenticated map is intentionally rejected; its
current 432-key model is diagnostic/stale and is not total over its 889 DIMACS
variables. This is a P97 package defect, not a PIQD defect.

## Results and custody

`SAT` means only that the selected finite CNF canary was independently checked
and that PIQD returned a complete checked model. `UNKNOWN` and transport
failures remain honest. `UNSAT` is discovery-only and cannot be promoted
without the current `CERT-001` (which is absent). Receipts are canonical,
self-hashed JSON files written create-once beneath an existing rooted
directory with no-follow custody.

The durable entry point is `run_durable_packet(packet, output_root, client)`.
`output_root` must already be an absolute, non-symlink directory and must be
empty on first use. The runner uses `PiqdCegarDriver` with one prepare, one
confirm, one result retrieval, `requested_core_limit = 1`, a positive packet
timeout, and a bounded poll count. It archives the exact CNF, producer
manifest, checkpoint responses, terminal status, solver log, and (for SAT)
the raw model response in the driver's content-addressed artifact directory.
The prepare response's `existing` field must be an exact JSON boolean and is
archived as response evidence; it is not independently attested by the
terminal response. PIQD model-response bytes are compact but are not required
to have sorted-key canonical order. The adapter therefore preserves and hashes
those bytes exactly, parses them with duplicate-key, size, integer, and depth
limits, and accepts them only after independent total-assignment and
every-clause replay. It never substitutes a canonical reserialization for the
raw response hash.
The sealed output contains exactly:

```
receipt.json
attempt.jsonl
attempt.jsonl.seal.json
attempt.jsonl.lock
attempt.jsonl.artifacts/<sha256>...
```

`replay_durable_output(output_root, packet=None)` is a standalone, idempotent
validator. It opens every path with no-follow and bounded capture, rejects
missing, extra, crossed, or symlinked files, verifies the journal chain and
seal, recomputes all artifact and receipt hashes, and rebinds prepare/status
job identity, backend/profile, dimensions, producer/CNF identity, timeout,
and core limit. SAT replay requires the archived total 889-variable model and
re-evaluates all 21,101 clauses and the source-derived named-atom map. The
module's `durable_replay_main` provides the solver-free command-line replay;
it never resumes or mutates a partial custody tree.

When no packet is supplied, replay first authenticates the self-hashed receipt
and its exact content-addressed producer manifest. It accepts only the source
package v1 schema or the v2 retry schema, rebuilds the current source package
with the archived strict retry object when present, and requires exact
producer-byte equality before deriving the packet ID and timeout. Thus a
sealed retry generation replays without caller memory, while changed sources,
malformed retry metadata, a substituted producer, or a changed packet ID fail
closed before any finite-evidence claim.

The related proof-blueprint session is `019fdf9c`; anchor
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier` remains
unchanged, open, and off-spine. No adapter output changes that status.

## Offline acceptance tests

`test_phase3_piqd_a_core_adapter.py` uses one-process fake clients only. Its
solver-free fixture is live-sized (889 variables and 21,101 clauses) but uses
fresh synthetic DIMACS bytes rather than copying mutable legacy bytes. It
covers live-artifact preflight, canonical/type/unknown-key and bounded-parser
rejection, source-derived map uniqueness and auxiliary separation,
source/CNF/map/model binding, exact family counts, per-clause replay, all
artifact path safety, identity/dimension/backend/profile/core binding,
201/200 and 409 terminal-confirmation lifecycles, honest SAT/UNKNOWN/UNSAT
outcomes, symlink custody, and create-once receipt hashing. It does not start a
daemon, invoke a solver or Lean, use git, or write `/tmp`.
