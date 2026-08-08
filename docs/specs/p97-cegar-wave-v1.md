# P97 CEGAR wave contract v1

Status: implemented control-plane contract; not a theorem-closure claim.

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

The reference `publication_assessment` returns a *publication candidate*, never
a closure verdict. It fails closed unless:

1. the terminal attempt is `CERTIFIED_UNSAT`;
2. the journal is sealed by both its expected record count and terminal hash;
3. the query polarity says UNSAT denotes the intended obstruction;
4. the evidence is not merely local; and
5. the manifest's source/producer/consumer contract is complete, including a
   lift theorem for `LIFTED_CONSUMER`.

Kernel-checked ingress, theorem provenance, universal lifting, and the direct
live consumer remain mandatory downstream gates.

## piqd boundary

piqd is a static raw-DIMACS oracle for this contract, not the authoritative P97
attempt ledger. The adapter must:

- submit exact CNF and canonical producer-manifest bytes;
- reject backend/profile pairs that piqd would silently normalize;
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
- checked SAT is `STRUCTURAL_SAT`; and
- solver UNSAT plus an archived full log is only `DISCOVERY_UNSAT`.

The frozen wave-attempt vocabulary has no raw-solver-unknown label, so the
first three cases use outer outcome `ERROR`; they must not be mislabeled
`METRIC_UNKNOWN`, which has metric-validation semantics. The structured event
preserves the finer reason without changing the v1 schema.

The driver retrieves paginated solver logs as exact bytes, archives all event,
model-response, and log artifacts by SHA-256, and writes a deterministic
`p97-cegar-wave-journal-seal/v1` binding the manifest, record count, terminal
attempt, and journal bytes. Reopening or reusing a journal rehashes every
referenced artifact and revalidates the current journal and seal bytes. Append
and seal operations share an exclusive lock, so a sealed journal cannot be
extended or raced with a concurrent append.
This recovers safely from `PIQD-RAW-001`: the HTTP 500 attempt is durable before
re-prepare, so the later existing-job success cannot erase the race.

Example invocation:

```bash
PYTHONPATH=. uv run python -m census.p97_search.phase3_piqd_driver \
  --base-url http://127.0.0.1:8080 \
  --wave-manifest scratch/wave.json \
  --cnf scratch/wave.cnf \
  --producer-manifest scratch/producer.json \
  --journal scratch/wave-attempts.jsonl
```

The CLI returns 0 for a checked structural SAT counterexample, 3 for
discovery-only UNSAT, and 2 for operational error, timeout, or unknown. Code 3
is intentionally nonzero so a shell wrapper cannot promote an unchecked UNSAT
merely by testing process success; wrappers should parse the emitted outcome.

This driver closes the control-plane journaling gate only. `DISCOVERY_UNSAT`
still needs independent proof checking and replay before publication, and no
driver result closes the live Lean theorem by itself.

piqd defects found while implementing this boundary are tracked in
`docs/audits/piqd-integration-bugs-2026-08-07.md`.

## Verification

Run the focused contract suite with:

```bash
PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_cegar_wave.py \
  census/p97_search/tests/test_phase3_piqd_oracle.py \
  census/p97_search/tests/test_phase3_piqd_driver.py
```
