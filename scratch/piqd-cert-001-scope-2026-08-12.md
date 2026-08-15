CERT-001 scope correction / feature decision for P97

I checked the current PIQD proof contract before filing a product request. The broad
ledger label was underspecified and, for our immediate CaDiCaL terminal boundaries,
mostly wrong: a PIQD-run cadical UNSAT job already runs drat-trim, requires exit 0
and an exact `s VERIFIED` line, stores the kept CNF plus compacted LRAT, and serves
the verified proof at GET /jobs/:id/proof with X-Proof-Blob-Hash. Reads re-hash.

Immediate artifacts/producers:
- terminal CaDiCaL DRAT/LRAT for frontier B/C/DE/DR/E;
- the Phase-3 structural and five-omission terminal reruns;
- CardHead and F-Gamma terminal DRAT gates.

Decision: these callers should migrate the terminal rerun itself into a PIQD cadical
job and consume PIQD's existing proof/kept-CNF/clause-map artifacts. This is P97
adapter work, not a new PIQD feature. PIQD should attest exactly its existing
checker-backed job result and artifact custody; P97 still owns source entitlement,
variable-map/refinement-clause justification, and any Lean ingress. A proofless
discovery UNSAT remains diagnostic until this separate terminal job succeeds.

The genuinely missing optional case is narrower: an externally produced DRAT that
must be retained rather than rerun inside PIQD. If that use case survives migration,
the proposed product feature is an external DRAT-check/import operation:

1. Inputs: already banked exact CNF blob hash and external DRAT blob hash, plus a
   caller external_id/request id. Initial scope is DIMACS+DRAT only; not Singular,
   RUP, or arbitrary checker plugins.
2. PIQD action: run its pinned drat-trim/compaction path itself, requiring exit 0 and
   exact `s VERIFIED`; publish kept-CNF and nonempty compacted-LRAT blobs.
3. Attestation: immutable checker receipt/evidence record binding input hashes,
   checker binary identity/hash, argv/profile, verdict, output hashes, result digest,
   and replay/dedup identity. The claim is CHECKER_VERIFIED_EXTERNAL_DRAT, not that
   PIQD produced the solver verdict and not any theorem/source-entitlement claim.
4. Downstream: P97 adapters may replace local checker execution and archive the
   receipt/LRAT for an independent validator or Lean certificate ingress.

Current PUT /blobs + POST /evidence is insufficient for that optional case because
the evidence ledger explicitly attests custody/provenance, not proof validity. But
we should not build this unless a named caller remains external after the terminal
job migrations above. Please confirm that using ordinary PIQD cadical jobs for the
terminal reruns is the intended supported route, and whether their proof receipt is
already strong enough for offline adapters or needs a proof-artifact metadata route.
