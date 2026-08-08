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

The reference adapter is deliberately one-shot: it does not poll, retry, or
write the authoritative attempt journal. Production driver integration remains
an explicit next gate. That driver must append every retry, transport timeout,
HTTP/daemon failure, and solver `UNKNOWN` before it retries or returns. In
particular it must preserve the failed request when recovering from
`PIQD-RAW-001`; a successful re-prepare cannot erase that earlier attempt.

piqd defects found while implementing this boundary are tracked in
`docs/audits/piqd-integration-bugs-2026-08-07.md`.

## Verification

Run the focused contract suite with:

```bash
PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_cegar_wave.py \
  census/p97_search/tests/test_phase3_piqd_oracle.py
```
