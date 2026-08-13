# P97 Exact12 next-row arm-static PIQD discovery v1

Status: active finite-diagnostic transport specification. This is not a proof,
Lean ingress, aggregate arm coverage, or a universal result.

## Scope

This route onboards only the frozen Exact12 placement-1, named arm-cell-6
static canary. PIQD replaces one proof-free discovery call. The historical
local CaDiCaL/DRAT terminal call, its exact DIMACS bytes, and its local proof
authentication remain unchanged.

The production CLI defaults to PIQD discovery. `--legacy-local-discovery` is
the only supported route back to the historical local discovery call. PIQD is
configured as one sequential job with `requested_core_limit = 1`; the request
is not by itself a one-process or one-core attestation. Terminal SAT/UNSAT
acceptance still requires the maintained runner's solver-process attestation.
There is no discovery fallback.

## Frozen identity and custody

Before transport, the adapter publishes a canonical, content-addressed
descriptor under a no-follow custody chain. It binds:

- the canonical v9 arm-static `job_id` and the complete job hash;
- arm cell 6 and placement 1;
- exact raw DIMACS bytes, SHA-256 digest, variable count, and clause count;
- the arm compiler/variable-map manifest;
- the independently hashed named-arm clause-suffix record and post-arm CNF;
- the source-order bank and its installation against the final CNF; and
- every exact source path, byte count, and live SHA-256 digest.

The adapter rereads the live sources when reconstructing the descriptor and
rereads both the content-addressed descriptor and discovery CNF before and
after PIQD. Symlinked output roots, non-regular or multiply linked custody
files, crossed identities, stale source bytes, noncanonical JSON, and changed
artifacts fail closed without invoking local discovery.

The producer-owned root-job and arm-suffix identities retain the canary's
established sorted, indented JSON plus trailing-newline digest convention.
The PIQD discovery descriptor is serialized as compact canonical JSON plus one
trailing newline before hashing and storage.  PIQD manifest and receipt
self-hashes use compact canonical JSON without that descriptor newline.  The
adapter validates each object with its owner's exact byte convention; these
hashes are not interchangeable.

The shared static PIQD runner receives the raw DIMACS unchanged. It owns the
prepare/upload/confirm/status/model-or-log lifecycle, a sealed per-attempt
journal, and the canonical receipt. The receipt must bind the exact CNF,
dimensions, source and producer manifests, PIQD project, backend/profile,
requested core limit, verdict/return code, `CERT-001`, and both
`proof_endpoint_called = false` and
`legacy_drat_proof_path_written = false`.

For eligible newly prepared raw-DIMACS jobs, the deployed PIQD build also
stores the exact submitted producer-manifest bytes and advertises their
content address as `producer_manifest_blob_hash`; the generic blob route
returns bytes only after rehashing them against that address. This is byte
custody, not semantic validation. PIQD does not validate the manifest's
Python-to-Lean variable meaning, retain the source files named inside it,
validate a proof, or backfill historical manifest bytes. The identity-bound
`producer_manifest_hash` is distinct from the retrievable blob hash, and the
blob hash may correctly be null for older jobs, jobs without a submitted
manifest, or non-raw-DIMACS jobs.

The fresh production namespace is
`p97-exact12-next-row-arm-static-cell6-v9-r1`. A short-timeout probe must not be
run in this namespace: PIQD job identity is content-addressed, so a terminal
UNKNOWN from a probe could be reused by a later identical request.

## Verdict handling

| PIQD observation | Required local action | Result class |
| --- | --- | --- |
| SAT with a total same-job model | Replay every CNF clause, decode the complete assignment, then run the canary's existing candidate/arm/static replay | finite SAT diagnostic |
| observational UNSAT | Run exactly one local terminal call on byte-identical DIMACS with the existing DRAT path and certifier | finite proof-authenticated diagnostic only if local authentication succeeds |
| UNKNOWN, deployment no-solver, invalid attestation, transport error, malformed response, or custody error | No local discovery or terminal fallback | fail closed |

PIQD never fetches a proof and never turns observational UNSAT into a theorem.
Only the unchanged local terminal branch may produce
`UNSAT_DRAT_VERIFIED_AWAITING_ARM_STATIC_LEAN_INGRESS`, which explicitly still
awaits exact Lean formula-order ingress and complete arm/placement coverage.

## Verification boundary

`scripts/test-p97-piqd-exact12-next-row-arm-static.sh` runs one pytest process
with native thread pools capped at one and checks formatting/lint for the
owned seam. The dedicated adapter cases use only a fake PIQD transport and
fake local terminal solver; the added production-seam regression materializes
the real frozen formula and passes its real producer job into the descriptor
builder. None of these tests contacts a daemon, invokes a SAT solver, runs
Lean, or supports any mathematical closure claim.
