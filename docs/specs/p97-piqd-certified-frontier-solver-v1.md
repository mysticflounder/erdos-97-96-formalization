# P97 PIQD certified frontier solver v1

Status: implemented as **P97 ADAPTER DEBT**, not as proof closure.  The
proof-blueprint anchor `019fdf9c` remains open and off-spine.  This seam can
produce a verified finite local `CadicalResult`; it establishes neither source
entitlement, frontier coverage, a universal lift, nor a Lean theorem.

The implementation is `census/card_head/piqd_certified_solver.py`.  It is an
explicit certified alternative to the observational
`CardHeadPiqdAdapter`.  Selecting neither `PiqdCertifiedSolver` nor
`PiqdPerQueryCertifiedSolver` preserves the prior SAT/UNKNOWN behavior and the
prior non-promotable UNSAT handoff.

## Public construction contract

One fixed effective CNF uses:

```python
package = AuthenticatedPackageSnapshot(
    cnf=exact_effective_dimacs,
    producer_manifest=canonical_producer_manifest,
    wave_manifest_bytes=canonical_wave_manifest,
)
packet_transport = make_current_piqd_packet_transport(
    package,
    output_root=fresh_attempt_journal_root,
    base_url=piqd_base_url,
)
solver = PiqdCertifiedSolver(package, packet_transport, concrete_replayer)
result = solver(instance, cnf_path, extra_clauses=..., proof_path=...)
```

`output_root.parent` must already exist as a real no-follow directory and
`output_root` must not exist.  The public transport constructor validates its
configuration and creates/owns that root once with mode 0700.  It defaults to
the standard HTTP transport and to fetching the certified kept-CNF blob.
Injected transports are an explicit test/integration boundary, not a local
solver fallback.

A fixed `PiqdCertifiedSolver` accepts only calls whose complete
`instance.dimacs(extra_clauses)` bytes equal `package.cnf`.  Multi-query B, C,
DE, DR, and E lanes therefore use one solve-compatible dispatcher:

```python
def query_factory(cnf: bytes, cnf_path: Path) -> PiqdCertifiedSolver:
    package = build_profile_package_for_exact_cnf(cnf)
    transport = make_current_piqd_packet_transport(
        package,
        output_root=fresh_attempt_root_for(cnf_path),
        base_url=piqd_base_url,
    )
    return PiqdCertifiedSolver(package, transport, concrete_replayer)

solver = PiqdPerQueryCertifiedSolver(query_factory)
```

The dispatcher computes the effective DIMACS before invoking the factory,
requires the exact concrete fixed solver type, and rechecks byte equality with
its returned package before transport.  Package derivation is intentionally a
profile-owned production function: the generic trust seam does not infer or
weaken producer/wave semantics.

## Current PIQD ingress

The only certified kept-CNF byte route is the bounded, job-reference-bound
`GET /jobs/{safe_job_id}/blobs/{lowercase_64_hex_sha256}`.  It requires HTTP
200, exactly one `Content-Type: application/octet-stream`, and the configured
CNF byte limit.  Extra path components, unsafe job identifiers, wrong digest
shape/case, response type, status, content type, or size fail closed.  The
returned bytes are SHA-256 checked locally even though PIQD binds the route to
the job reference.

The maintained PIQD contract was confirmed in nthdegree conversation
`#erdos-97-96-formalization`, message `#5616`:

- `kept_cnf_blob_hash` is deliberately null for `march_cu`; the certified seam
  rejects a `march_cu` prepared job or status explicitly and does not report a
  missing CaDiCaL binding;
- CaDiCaL mints the kept CNF, and the clause-map route already requires its
  hash and checks the recomputed kept CNF;
- status exposes `identity_hash`, optional `cnf_blob_hash`,
  `producer_manifest_hash`, and `kept_cnf_blob_hash`, but no solver-profile or
  proof-hash field; and
- the proof hash exists only in `X-Proof-Blob-Hash` on the proof response.

The certified seam does not invent absent status fields.  For CaDiCaL UNSAT it
requires exact status bindings for job ID, backend, project, raw identity,
submitted CNF hash, producer-manifest hash, kept-CNF hash, terminal state, and
result.  It also binds the concrete prepared job and sealed driver terminal
record.

## Result gates

SAT requires a canonical exact model receipt, job/result binding, the sealed
journal model hash, and a total assignment of every DIMACS variable exactly
once.  The assignment is replayed against the exact effective CNF and passed
through `instance.decode_model`.  Partial, duplicate, typed, out-of-range,
false, or undecodable models fail closed.

UNKNOWN, failed status, transport loss, malformed responses, and internal
errors never invoke a local solver and never fall back.  UNKNOWN carries no
model or proof artifacts and returns `proof_verified=False`.

UNSAT requires all of the following:

1. an exact CaDiCaL job and status identity/CNF/producer/kept binding;
2. fetched kept-CNF bytes whose local SHA-256 equals the status/packet hash;
3. `consume_clause_map` success, with both its canonical kept bytes and kept
   hash equal to the fetched blob;
4. syntactically bounded compact LRAT bytes whose SHA-256 equals the exact
   `X-Proof-Blob-Hash` value; and
5. a concrete local `LeanLratReplayer` result accepted by
   `validate_replay_result` and marked verified.

A fake or merely shape-compatible replayer cannot set
`CadicalResult.proof_verified=True`.  No live Lean execution is part of the
unit tests; the concrete replayer call is injected there with an exact replay
receipt.

## Custody and claim boundary

The caller's requested proof path is a legacy compatibility argument only.
Compact LRAT is never written there when it has a `.drat` suffix.  Certified
custody derives create-once siblings:

- `.lrat` compact proof;
- `.kept.cnf` fetched canonical kept CNF;
- `.clause-map.json` exact response;
- `.replay.lean` local checker source;
- `.replay.json` replay receipt; and
- `.piqd-certified.json` structural binding receipt.

All targets share one existing no-follow parent, are preflighted as absent,
and are installed with `O_EXCL|O_NOFOLLOW`, bounded readback, file and directory
fsync.  An existing receipt or any crossed target aborts before publication.
The structural receipt binds the package, job, status, journal, kept CNF,
clause map, compact LRAT, checker, and replay hashes while recording every
non-established global claim as false.
