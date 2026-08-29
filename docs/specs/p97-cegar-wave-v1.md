# P97 CEGAR wave contract v1

Status: implemented control-plane and CaDiCaL LRAT-replay contract; not a
theorem-closure claim.

`p97-cegar-wave/v1` is the immutable identity envelope for one P97 CEGAR
mining wave. It prevents a solver result from being detached from the Lean
source surface, exact encoding, execution profile, or intended promotion path.
The reference validator is
`census/p97_search/phase3_cegar_wave.py`.

## Wave identity

The manifest is canonical JSON and binds:

- `wave_id`, iteration, and an authenticated parent checkpoint for every
  nonzero iteration;
- live Lean leaf, ingress-hypothesis hash, finite schema, cardinality scope,
  and source theorem;
- exact CNF, variable-map, and producer-manifest hashes, DIMACS dimensions,
  and query polarity;
- backend, solver profile, shard identity, candidate order hash, and seed;
- evidence classification and the producer/lift/consumer theorem ownership
  needed for any promoted result.

Objects reject both missing and unknown fields. Digests are lowercase SHA-256
hex. A changed source surface, variable map, CNF, ordering, backend, profile,
or promotion contract therefore creates a different wave identity.

Evidence classifications are:

- `LOCAL_CERTIFICATE`: finite/local evidence only; never publication eligible;
- `UNIFORM_PRODUCER`: names both the universal producer and its Lean consumer;
- `LIFTED_CONSUMER`: additionally names the universal lift theorem.

## Attempt journal

Every oracle call or control-plane event is an immutable
`p97-cegar-wave-attempt/v1` record. Records have dense indices, unique attempt
IDs, the wave-manifest hash, the previous-record hash, backend/profile copies,
outcome-specific artifact hashes, and their own canonical-record hash. Retries
append attempts; they do not overwrite earlier results.

The validator checks record authentication, ordering, uniqueness, chain links,
and equality to the wave's CNF/backend/profile. A sealed journal additionally
records the expected count and terminal hash so suffix truncation is detectable.

## Outcome semantics

The taxonomy is deliberately non-collapsing:

- `STRUCTURAL_SAT`: a structural witness exists; requires a model artifact;
- `METRIC_SAT`: an independently checked metric witness is claimed; requires
  model, metric-witness, and metric-validation receipt artifacts;
- `METRIC_UNKNOWN`: metric validation did not decide; requires a reason;
- `DISCOVERY_UNSAT`: the solver reported UNSAT, with a solver log, but no checked
  proof is attached;
- `CERTIFIED_UNSAT`: requires solver log, proof, independent proof-checker, and
  successful replay-receipt artifact hashes;
- `CHECKPOINT`: requires an authenticated checkpoint artifact;
- `ERROR`: requires a reason and remains part of the attempt history.

These labels authenticate evidence classes; the contract does not itself check
a SAT assignment, replay LRAT, or prove a Lean theorem.

## Publication gate

The reference `publication_assessment` returns a custody-level *publication
candidate*, never semantic authority or a closure verdict. It fails closed
unless:

1. the terminal attempt is `CERTIFIED_UNSAT`;
2. the journal is sealed by both its expected record count and terminal hash;
3. the query polarity says UNSAT denotes the intended obstruction;
4. the evidence is not merely local; and
5. the manifest's source/producer/consumer contract is complete, including a
   lift theorem for `LIFTED_CONSUMER`.

Kernel-checked ingress, theorem provenance, universal lifting, and the direct
live consumer remain mandatory downstream gates.

Precedence: `publication_assessment`, evidence classification, query polarity,
and `CERTIFIED_UNSAT` authenticate wave custody only. They do not satisfy
R1--R4, F1--F7, survivor discharge, or terminal promotion under
`p97-cegar-semantic-contract/v2`. A machine consumer must require an accepted
`p97-cegar-semantic-terminal/v1` receipt; absent that receipt, a
`p97-cegar-semantic-authority-gate/v1` record keeps source, abstract, and
theorem promotion blocked.

## piqd boundary

piqd is a static raw-DIMACS oracle for this contract, not the authoritative P97
attempt ledger. The adapter must:

- submit exact CNF and canonical producer-manifest bytes;
- reject backend/profile pairs outside the supported execution vocabulary;
- verify returned CNF and identity hashes before confirming a job;
- re-read status after an ambiguous confirm retry;
- retrieve the stored CNF and compare exact bytes;
- independently validate SAT assignments against that CNF;
- treat solver UNSAT as `DISCOVERY_UNSAT`; only a separate semantic proof
  checker and replay receipt can support `CERTIFIED_UNSAT`;
- reject `march_cu` proof manifests until every cube proof has been retrieved
  and independently checked.

The one-shot adapter lives in
`census/p97_search/phase3_piqd_oracle.py`. The production lifecycle driver in
`census/p97_search/phase3_piqd_driver.py` adds bounded prepare, confirm, poll,
and result-retrieval loops around it. Before every retry or terminal return it
stores a canonical `p97-cegar-piqd-event/v1` artifact and appends the matching
hash-chained wave attempt. An append whose durability is uncertain stops all
further oracle calls and exposes the exact pending record.

The driver keeps these terminal cases distinct in the event artifact:

- a raw solver timeout reported as `completed/UNKNOWN` is `SOLVER_UNKNOWN`;
- a piqd lifecycle `failed` state is `DAEMON_FAILED`;
- exhausted nonterminal polling is `POLL_TIMEOUT`;
- checked SAT is `STRUCTURAL_SAT`;
- solver UNSAT plus an archived full log but no replayable proof is
  `DISCOVERY_UNSAT`; and
- only an archived compact LRAT accepted by the independent Lean replay is
  `CERTIFIED_UNSAT`.

The frozen wave-attempt vocabulary has no raw-solver-unknown label, so the
first three cases use outer outcome `ERROR`; they must not be mislabeled
`METRIC_UNKNOWN`, which has metric-validation semantics. The structured event
preserves the finer reason without changing the v1 schema.

The driver retrieves paginated solver logs as exact bytes, archives all event,
model-response, proof, checker, replay-receipt, and log artifacts by SHA-256,
and writes a deterministic
`p97-cegar-wave-journal-seal/v1` binding the manifest, record count, terminal
attempt, and journal bytes. Reopening or reusing a journal rehashes every
referenced artifact and revalidates the current journal and seal bytes. Append
and seal operations share an exclusive lock, so a sealed journal cannot be
extended or raced with a concurrent append.
This also preserves the containment tested for the now-fixed `PIQD-RAW-001`:
an HTTP 500 attempt is durable before re-prepare, so a later existing-job
success cannot erase the race.

For a terminal CaDiCaL UNSAT job, the driver downloads `/proof` and verifies the
response hash before replay. piqd's compact LRAT is relative to its
order-preserving normalization: tautological clauses are removed and repeated
literals in kept clauses are deduplicated. The independent replayer reproduces
that normalization from the exact submitted CNF, embeds both canonical kept
CNF and downloaded LRAT in a standalone Lean source, and applies
`Std.Tactic.BVDecide.Reflect.verifyCert_correct` with `native_decide`. It does
not use piqd's `/lean` emitter or a daemon replay verdict.

The canonical `p97-piqd-lean-lrat-replay/v1` receipt binds the submitted and
kept CNF hashes, the piqd job's CNF blob hash, proof hash, wave and remaining
job identities, generated checker-source hash, launcher and effective Lean
binary hashes, version output, exact argv and working directory, timeout,
return code, and stdout/stderr. Before certification, the driver independently
parses and validates this canonical receipt against the actual CNF, proof,
checker bytes, manifest, job, normalization, and execution verdict. It also
reconstructs the checker source from the actual CNF and proof. Only the
concrete `LeanLratReplayer` may produce a certified outcome; an injected
replayer's `verified` flag is never authoritative. Its replay command is the
non-configurable tuple `lake env lean`; the receipt records the resolved
launcher and effective Lean binary, their hashes, and the exact executed argv.
The use of
`native_decide` makes this Lean-checked finite evidence under the compiler
trust boundary; it is not a source-clean universal theorem. A missing proof,
including piqd's deliberate no-blob handling for an already-empty input clause,
remains `DISCOVERY_UNSAT`. A malformed proof, hash mismatch, checker failure,
or rejected replay is `ERROR`, never certified. `march_cu` remains unsupported
because its per-cube proof manifest needs a separate all-cubes replay protocol.

Example invocation:

```bash
PYTHONPATH=. uv run python -m census.p97_search.phase3_piqd_driver \
  --base-url http://127.0.0.1:7272 \
  --wave-manifest scratch/wave.json \
  --cnf scratch/wave.cnf \
  --producer-manifest scratch/producer.json \
  --journal scratch/wave-attempts.jsonl
```

The CLI returns 0 for a checked structural SAT counterexample, 3 for
discovery-only UNSAT, 4 for finite `CERTIFIED_UNSAT`, and 2 for operational
error, timeout, or unknown. Codes 3 and 4 are intentionally nonzero so a shell
wrapper cannot promote any UNSAT result merely by testing process success;
wrappers must parse the emitted outcome and apply the downstream publication
gate.

This driver closes the control-plane journaling gate and the independent replay
gate for one available CaDiCaL compact LRAT. No driver result supplies the
universal producer, lift, direct live consumer, or transitive axiom audit needed
to close the live Lean theorem.

piqd defects found while implementing this boundary are tracked in
`docs/audits/piqd-integration-bugs-2026-08-07.md`.

## Verification

Run the focused contract suite with:

```bash
PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_cegar_wave.py \
  census/p97_search/tests/test_phase3_piqd_oracle.py \
  census/p97_search/tests/test_phase3_piqd_driver.py \
  census/p97_search/tests/test_phase3_piqd_replay.py
```

Result on 2026-08-08 after command-pinning hardening: 56 focused
oracle/driver/replay tests passed. The earlier complete Phase 3 regression run
reported 421 tests and 2 subtests passed.

A live known-result smoke against piqd on `127.0.0.1:7272` submitted the
two-clause contradictory-unit CNF with SHA-256
`230ad9c8503ad9cb51d7aacab0d3b599374853b13e22aa92e78ce036f9d22230`.
Job `3c1d3805-71b5-486f-aafc-81bd0ba2a407` returned a compact LRAT which the
independent pinned Lean replay accepted, producing `CERTIFIED_UNSAT`. The
sealed 24-record journal has seal
`f2853d9ecb9c63697791cf8e6e506695814c5a29ecac01f13675686933848010`.
This is a synthetic finite integration smoke, not P97 theorem closure.
