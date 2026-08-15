PIQD SMT onboarding findings for the FreshThird 12-case Z3/cvc5 wave

This is a maintainer request, not a theorem or proof-closure claim.

1. PIQD bug: serialize SMT model queries with SMT operations.

`GET /sessions/:id/model` reaches the SMT worker without taking the session's
`smt_ops` lock, unlike the state-changing SMT paths. A concurrent solve/model
pair can therefore race and return a model unrelated to the intended solve.
Please take the same SMT operation lock for this branch and add an adversarial
concurrency regression. P97 will not treat this endpoint as authoritative until
the fix ships.

2. PIQD feature: idempotent SMT solve requests.

Add canonical `request_id` and `request_sha256` fields to SMT solve. Reusing an
ID with byte-identical canonical request content should return the existing
`solve_index`/result and mark the response and receipt `replayed: true`; reusing
the ID with different content should return 409. The receipt must bind both
fields. This removes ambiguity when the daemon commits a solve receipt but the
HTTP response is lost.

3. PIQD feature: honest SMT resource attestation.

At minimum, bind `attested_solver_processes: 1` and a stable basis such as
`SINGLE_SMT_WORKER_NO_PARALLEL_FLAG` in the SMT response and receipt. Do not
claim one CPU core from that alone. A genuine one-core claim requires OS-level
affinity/cgroup enforcement and receipt fields for requested and attested CPU
sets plus the attestation basis. Until then P97 will record serialized client
execution but leave all CPU/core-enforcement claims false.

The relevant current code is `src/http/sessions.rs` and
`src/session/smt_receipts.rs`. Please report the PIQD commit, exact API/schema
changes, migration/compatibility behavior, and focused adversarial tests in the
erdos-97-96-formalization nthdegree convo.
