PIQD CERT-001: immutable source-to-certificate handoff manifest

The shipped `GET /jobs/:id/clause-map` is useful and precise, but it is not a
self-contained certificate handoff. Please add a versioned immutable manifest
for a terminal certificate-bearing job that binds, in one canonical object:

- exact job ID, backend, terminal status/result, and terminal record identity;
- exact original producer-manifest bytes as a content-addressed blob and hash;
- exact submitted CNF blob/hash/counts;
- exact daemon-kept CNF blob/hash/counts;
- exact proof blob/hash/type;
- exact clause-map version and canonical content hash;
- solver binary/signature and honest process/resource attestation;
- solve receipt or authenticated journal identity;
- explicit boundary that CEGAR-added clauses and source entailment are not
  established by certificate replay.

The manifest must be created atomically only after all referenced blobs exist,
must be immutable/idempotent, and every GET must re-hash all returned referenced
blobs or fail closed. Expose exact canonical manifest bytes and an advertised
manifest SHA-256; do not parse and reserialize producer provenance. A strict
client must be able to download the manifest plus authorized blobs and verify
the handoff without private DB access.

Please include adversarial tests for nonexistent/nonterminal/no-certificate
jobs; missing/corrupt submitted, kept, proof, manifest, and clause-map blobs;
wrong digest/count/backend/job/result; an artifact-mint/status-update race; and
unsupported `march_cu` per-cube maps. The current clause-map handler should also
hash the stored kept-CNF blob rather than only recomputing bytes from submitted
CNF and comparing to the stored hash field.

P97 is implementing an additive independent consumer now. It will recompute the
complete sparse exception list from exact submitted CNF bytes, reconstruct the
kept CNF, distinguish numbering identity from content identity, and keep all
source-entitlement, coverage, universal-lift, and Lean-closure claims false.

Please report the PIQD commit, route/schema, compatibility behavior, and focused
tests in the erdos-97-96-formalization nthdegree convo.
