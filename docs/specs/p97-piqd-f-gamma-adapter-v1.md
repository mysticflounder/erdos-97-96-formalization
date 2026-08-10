# P97 PIQD F-Gamma adapter v1

Status: implemented as an additive base-discovery adapter. This is finite SAT
evidence, not a proof producer.

## Scope

`census.f_gamma.encoding.run_smoke` has three solver calls. This adapter may
replace only the first call, which discovers a model of the base F-Gamma CNF.
The two terminal gates continue to use the local `solve_cadical` path, each
with a non-null DRAT path and successful `drat-trim` verification. Supplying a
PIQD adapter does not weaken, replace, or reinterpret either gate.

There is no local fallback after a PIQD daemon error, `UNKNOWN`, or
observational `UNSAT`. Those outcomes fail closed before either certified local
gate starts. Local CaDiCaL and `drat-trim` are therefore required for the two
gates, but are not preconditions for attempting PIQD base discovery.

## Exact finite producer

The current base producer is exactly:

```text
FGammaInstance()
FGammaInstance.dimacs(extra_clauses=())
encode(ascii)
```

At this revision its result is 235 bytes with DIMACS dimensions 23 variables
and 27 clauses, and SHA-256
`e09d43157d638a381902dba2979dc80f4ee1d1f1e5021dc0e65f519765c49be5`.
The adapter regenerates and compares these exact bytes at every call; the
custody descriptor also records the observed dimensions, byte count, digest,
producer command and allocation order. It does not rely on this prose value as
an input.

The canonical variable map allocates:

| Variables | Meaning |
| --- | --- |
| 1--7 | `K(s1)` membership in `TRACKED_POINTS` order |
| 8--14 | `K(g)` membership in `TRACKED_POINTS` order |
| 15 | optional `c(g)`-in-first-cap gate premise |
| 16--23 | Sinz prefix counters, by `FIRST_FIBER` prefix and threshold 1, 2 |

The map is canonical JSON and total on variables 1--23. The known positive
primary variables 1, 2, 5, 6 and 14 decode to
`K(s1) = {s1, s2, e, o}` and `K(g) = {g}`.

## Identity and local custody

The adapter captures exact bytes for the CNF, semantic variable map, adapter
descriptor, static source and producer manifests, and the immediate source
dependencies used to produce, submit, validate, replay and decode the job.
Every entry has a digest and byte count in a canonical bundle seal. Files are
installed create-once beneath a content-addressed bundle directory. Reads use
descriptor-relative, no-follow opens and reject non-regular, multiply linked,
changed or substituted files. A restart with identical inputs reopens and
verifies the same bundle rather than rewriting it.

The exact `p97-piqd-static-producer/v1` manifest includes
`variable_map_sha256`. PIQD raw-DIMACS identity seals the entire producer
manifest digest, so changing the canonical variable-map digest changes the job
identity. This is not a missing map-seal defect. `GET /clause-map` concerns
proof clause numbering and is not used as a semantic variable map.

The identity chain is:

```text
exact source/dependency bytes + exact CNF + canonical variable map
        -> adapter descriptor and local bundle seal
        -> exact source manifest
        -> exact producer manifest (including variable_map_sha256)
        -> PIQD raw-DIMACS identity
        -> same-job CNF, status, model and bounded log reads
        -> static-runner journal, artifacts, seal and receipt
```

The static runner owns attempt custody for raw request/response artifacts,
status records, model response, bounded log, journal, seal and receipt. Runner
stdout is nevertheless treated as an untrusted claim at the injected adapter
boundary. Before reading any return attribute, the adapter requires the exact
`StaticSolverResult` runtime type: subclasses, duck-typed objects and results
with non-exact builtin field/container types are normalized to an adapter
error. Any unexpected ordinary exception raised by the injected runner is
likewise normalized to an adapter error before result validation; process
control exceptions are not intercepted. The adapter then requires the exact 38-key
`p97-piqd-static-solver-receipt/v1` schema, exact builtin container and scalar
types (so booleans cannot satisfy integer fields), bounded JSON bytes, depth
and node count, and the recomputed `receipt_sha256` of the unsigned receipt.

The adapter then opens the receipt-selected attempt by descending one
component at a time beneath the configured attempt root with no-follow
descriptor-relative operations. The attempt name and all four receipt paths
must be their deterministic exact values. Exactly six entries are allowed:
the journal, lock, content-addressed artifact directory, driver seal, installed
receipt and custody seal. Regular-file, single-link, pathname/inode stability,
byte bounds and the complete custody inventory are checked independently.
The installed receipt must equal stdout byte for byte.

The custody seal's exact schema, self-hash, receipt file hash/size/inode,
attempt-directory inode, journal and lock identities, driver-seal file hash,
artifact hashes/sizes/inodes and retry policy are recomputed. The driver seal's
exact schema and self-hash must bind the locally reconstructed static-wave
manifest, raw journal digest, record count and terminal record. The public
wave journal validator then rechecks canonical records, dense ordering,
previous-record hash chain, artifact requirements and terminal hash.

Finally, accepted SAT requires the terminal journal record and event to be a
same-job successful `MODEL` event; its CNF artifact must equal the exact base
CNF; its model artifact hash must equal the receipt model-response hash and
decode to the exact runner assignment; its raw status artifact must match both
raw and canonical receipt hashes and the embedded terminal status; and the
CNF, status, model and bounded log endpoint trace must contain only permitted
same-job endpoints in valid stage order. Extra, malformed or crossed endpoints
are rejected. The input bundle is checked again after the runner returns,
detecting a during-run substitution.

The current PIQD status/list/prepare schemas do not echo enough source
descriptor, manifest and identity fields for independent third-party readback.
Accordingly the exact manifest, descriptor and variable-map bytes remain under
local custody, with their binding supplied by the raw-DIMACS identity and an
independently fetched exact CNF. This schema-echo limitation does not justify
source entitlement or an independent-third-party claim.

## Outcome rules

| PIQD observation | Adapter result |
| --- | --- |
| SAT with one same-job exact total model | replay, map decode, return the existing `CadicalResult`-shaped SAT boundary |
| SAT with partial, duplicate, non-integer, out-of-range, crossed or CNF-falsifying model | fail closed |
| UNKNOWN or daemon/transport/custody error | fail closed; no local fallback |
| UNSAT | observational only; fail closed; do not request a proof or populate a proof path |

SAT is checked three ways: the static runner replays the total assignment
against the exact fetched CNF, the adapter decodes through the canonical map
and compares with the encoder's canonical decode, and
`FGammaInstance.validates_total_assignment` accepts the positive variables.

## Epistemic classification

The only positive classification is `SAT_FINITE_ABSTRACTION`. All of the
following claims are explicitly false in the adapter descriptor or exact
static manifests:

- source entitlement and independent third-party readback;
- theorem, counterexample, theorem-coverage and Lean-closure claims;
- aggregate and universal claims or lifts; and
- one-process and one-core proof claims (the one-core value is merely a
  requested and checked execution-policy field).

The adapter neither proves nor refutes the geometric F-Gamma leaf. It provides
a replayed model of one exact finite abstraction. An observational PIQD UNSAT
would not be a certificate.

Proof-blueprint session `019fdf9c` remains unchanged, open, off-spine, and is
not moved or promoted by this adapter.

## Live qualification, 2026-08-10

One base-only canary ran through the production adapter in
`scratch/p97-piqd-f-gamma-base-canary-2026-08-10-v1`. It called the injected
base-discovery boundary directly, so neither local DRAT gate ran. Job
`5b9afcf1-792d-4a42-a6fd-1866ae998cd1` completed `SAT` for project
`erdos-97-96-formalization/f-gamma-base`. The daemon served the exact 235-byte
CNF with SHA-256
`e09d43157d638a381902dba2979dc80f4ee1d1f1e5021dc0e65f519765c49be5`
and a total 23-variable model whose positive variables are exactly
`[1, 2, 5, 6, 14]`.

A separate process revalidated all seven current source snapshots, the bundle
`3e11a0212203c45314b12299e2606078e7b53f751f66c06ccb975a82b23d448a`,
the total variable map
`9daff0c6b5422a10f1db4bbb181e7d6936cefedc6bf67a09ab5f986949ef119f`,
all 27 clauses, the canonical decode, the six-record journal, both seals and
the complete inode/hash inventory. The local static-runner receipt self-hash is
`cf28c7d9f2b61f07fab5925f425e379ef4a5e0143a358644c96deec983352eb5`;
the journal SHA-256 is
`56f6a3f8e6bfda867847f1810978fb2c13a1b8825125a139ccf2bea63048a6bf`;
and the custody-seal self-hash is
`996009d6e38730b08bbe65f3e1584d81ea94d13126e7ac53984419f4d9308f3d`.
No proof endpoint was called, no DRAT path was populated and no DRAT artifact
exists. See nthdegree convo `#4628` and `#4629`.

The daemon independently exposed `requested_core_limit = 1`, one attested
solver process with basis `SINGLE_PROCESS_NO_PARALLEL_FLAG`, the exact CNF and
total model, and HTTP 404 for a proof. This does not establish CPU affinity or
thread count, so the `one_process` and `one_core` claims remain false. The
daemon does not mint or know the local static-runner receipt, does not echo the
CNF identity or producer/map fields in job status, and does not bind its own
build in the job record. The exact manifest and map connection therefore
remains a locally custodied, raw-identity binding rather than independent
third-party readback.

## Verification contract

Focused tests use a fake transport and one pytest worker. They cover SAT total
model replay and decode; `UNKNOWN`; observational `UNSAT` without proof access;
daemon failure; partial, duplicate, out-of-range, non-integer and falsifying
models; CNF, identity, status-JSON, map, descriptor, source and manifest
tampering; symlink, hardlink, during-run substitution and crossed-query
custody; create-once restart behavior; exact receipt keys and builtin types;
oversized and over-deep receipts; malformed and crossed endpoint traces;
re-signed terminal-status and custody substitutions; rehashed crossed model,
journal, event, driver-seal, receipt and custody artifacts; receipt inode
replacement; non-result objects, result subclasses and malformed exact-result
fields; unexpected injected-runner exceptions; and preservation of the two
local proof-producing gates with non-null DRAT paths.
