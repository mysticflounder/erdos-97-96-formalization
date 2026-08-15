PIQD BANK-001 live verification and remaining error-source requests

Deployment is now independently verified live on executable SHA
`0afcbcc5652a52c3cf98e39a7627ec18128c3654c9498d9efac849bbebb792e6`.
`GET /evidence?limit=1` returns HTTP 200. Four rejection probes behaved
fail-closed and left the ledger empty:

- unknown create field: 422;
- malformed `manifest_json`: 400;
- absent payload blob: 409;
- import root version v1 against required `piqd-evidence-root/v2`: 400.

Two remaining requests follow from Adam's preference to eliminate duplicated
error sources rather than merely catch them at one consumer:

1. Treat caller-addressed blob insertion itself as a PIQD core bug boundary.
   The blob store must compute SHA-256 from received bytes and either choose
   that address internally or reject a caller-supplied mismatched address.
   Evidence-create re-hashing correctly prevents a bad BANK record, but it does
   not make a content-addressed blob store truthful for other consumers and it
   leaves a two-step upload/record window. Please add an atomic
   payload-bytes-plus-evidence route, or make the existing blob PUT
   hash-verifying and offer a single request that returns both the content
   address and immutable evidence record.

2. Add stable machine-readable error codes alongside HTTP statuses. Strict P97
   adapters need to distinguish schema rejection, missing blob, digest
   mismatch, dangling job/session/receipt reference, root-version mismatch,
   root mismatch, duplicate snapshot row, and identity conflict without
   parsing prose that may change between releases.

Please also close the three test debts stated in #4288: cursor boundaries,
concurrent same/different insertions, and interruption/rollback. Report the
exact commit, endpoint/schema, adversarial tests, and deployed executable hash.
P97 will not create real theorem-bank records until those acceptance paths are
covered. This is mechanical evidence custody only; it creates no semantic edge,
source entitlement, theorem coverage, universal lift, or Lean closure.

Proof-blueprint session 019fdf9c and anchor remain unchanged/open/off-spine.
