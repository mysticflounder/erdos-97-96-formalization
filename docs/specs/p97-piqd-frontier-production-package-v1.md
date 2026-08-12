# P97 PIQD frontier production package v1

Status: frozen finite-evidence custody boundary for frontier lanes B, C, DE, DR,
and E. This boundary does not promote a theorem and does not establish a PIQD
product result.

## Purpose and composition

`census.card_head.piqd_frontier_package` constructs one authenticated package
for one already-materialized effective DIMACS query. It imports no frontier
lane and invokes no daemon, solver, proof checker, Lean process, or Git process.
The caller supplies all lane metadata and exact CNF bytes.

The supported multi-query composition is the existing
`PiqdPerQueryCertifiedSolver(query_factory)` seam. For every
`solve_cadical(instance, extra_clauses=...)` call, that seam materializes
`instance.dimacs(extra_clauses).encode("ascii")` and calls:

```python
query_factory(cnf: bytes, cnf_path: Path) -> PiqdCertifiedSolver
```

The factory constructs a fresh `FrontierAuthenticatedPackage` from that exact
`cnf`, then constructs the fixed certified solver from `package.snapshot`, the
packet transport, and the replayer. `PiqdPerQueryCertifiedSolver` independently
requires `solver.package.cnf == cnf` before any transport. A base query, C1
query, C2 query, or any other different effective CNF therefore has a distinct
authenticated package identity; reusing a package for changed extra clauses is
invalid.

## Frozen public Python API

The module exports these constants:

- `FRONTIER_PACKAGE_SCHEMA = "p97-piqd-frontier-production-package/v1"`
- `FRONTIER_PROFILE_SCHEMA = "p97-piqd-frontier-lane-profile/v1"`
- `VARIABLE_MAP_SCHEMA = "p97-piqd-frontier-total-variable-map/v1"`
- `SOURCE_MANIFEST_SCHEMA = "p97-piqd-frontier-source-manifest/v1"`
- `BUILD_PHASE_LEDGER_SCHEMA = "p97-piqd-frontier-build-phase-ledger/v1"`
- `DEFAULT_FRONTIER_LIMITS`

It exports these frozen, slotted records:

```python
FrontierPackageLimits(
    endpoint_limits: EndpointLimits = DEFAULT_LIMITS,
    source_file_bytes: int = 8 * 1024 * 1024,
    source_total_bytes: int = 64 * 1024 * 1024,
    source_files: int = 256,
)

FileIdentity(
    device: int,
    inode: int,
    mode: int,
    uid: int,
    gid: int,
    link_count: int,
    size: int,
    mtime_ns: int,
    ctime_ns: int,
)

MemorySourceSnapshot(logical_path: str, content: bytes)

PathSourceSnapshot(
    logical_path: str,
    capture_root: str,
    relative_path: str,
    content: bytes,
    identity: FileIdentity,
)

BuildAllocation(first_id: int, last_id: int, purpose: str)

BuildQuery(
    query_id: str,
    cnf_sha256: str,
    num_variables: int,
    num_clauses: int,
)

BuildPhase(
    phase_name: str,
    allocations: tuple[BuildAllocation, ...],
    allocator_num_variables: int,
    query: BuildQuery | None = None,
)

FrontierLaneProfile(
    lane: str,
    query_id: str,
    wave_id: str,
    live_leaf: str,
    finite_schema: str,
    cardinality_scope: str,
    source_theorem: str,
    query_polarity: str,
)

FrontierAuthenticatedPackage(
    cnf: bytes,
    variable_map_bytes: bytes,
    source_manifest_bytes: bytes,
    source_snapshots: tuple[MemorySourceSnapshot | PathSourceSnapshot, ...],
    build_phase_ledger_bytes: bytes,
    lane_profile_bytes: bytes,
    producer_manifest_bytes: bytes,
    wave_manifest_bytes: bytes,
    limits: FrontierPackageLimits,
    snapshot: AuthenticatedPackageSnapshot,
)
```

`FrontierAuthenticatedPackage` is returned by the builder rather than directly
constructed by callers. Its `snapshot` is the existing
`census.p97_search.phase3_piqd_card_head_adapter.AuthenticatedPackageSnapshot`;
this module neither duplicates nor replaces that validator.

It exports these functions and error:

```python
FrontierPackageError

snapshot_source_bytes(
    logical_path: str,
    content: bytes,
    *,
    limits: FrontierPackageLimits = DEFAULT_FRONTIER_LIMITS,
) -> MemorySourceSnapshot

capture_source_file(
    root: Path,
    relative_path: str,
    *,
    logical_path: str | None = None,
    limits: FrontierPackageLimits = DEFAULT_FRONTIER_LIMITS,
) -> PathSourceSnapshot

build_complete_variable_map(
    cnf: bytes,
    named_variables: dict[str, int],
    *,
    limits: EndpointLimits = DEFAULT_LIMITS,
) -> bytes

BuildQuery.from_cnf(
    query_id: str,
    cnf: bytes,
    *,
    limits: EndpointLimits = DEFAULT_LIMITS,
) -> BuildQuery

build_phase_ledger(
    phases: tuple[BuildPhase, ...],
    target_query: str,
) -> bytes

build_frontier_authenticated_package(
    *,
    cnf: bytes,
    variable_map_bytes: bytes,
    source_snapshots: tuple[MemorySourceSnapshot | PathSourceSnapshot, ...],
    build_phase_ledger_bytes: bytes,
    lane_profile: FrontierLaneProfile,
    limits: FrontierPackageLimits = DEFAULT_FRONTIER_LIMITS,
) -> FrontierAuthenticatedPackage
```

No transport, result record, legacy-local mode, replayer, or test fake is part
of this package module. Those belong to the existing certified solver seam and
the lane caller. This separation prevents the custody builder from importing a
frontier lane or selecting an execution mode.

## Total DIMACS variable map

The map is canonical JSON with schema
`p97-piqd-frontier-total-variable-map/v1`, coverage marker
`COMPLETE_1_TO_NUM_VARIABLES`, the exact DIMACS `num_variables`, and exactly one
entry for every ID in the ordered range `1..num_variables`.

Each entry contains exactly `id`, `kind`, `name`, and `used_in_cnf`. Named IDs
use `kind = "named"`. Every ID absent from the caller's exact builtin
`dict[str, int]` becomes:

```json
{"id":17,"kind":"anonymous_auxiliary","name":"anonymous_auxiliary:17","used_in_cnf":false}
```

The suffix is the decimal ID, so anonymous auxiliary naming is deterministic.
Declared but unused variables remain represented with `used_in_cnf = false`.
The validator reparses the exact CNF and rejects a missing, repeated, reordered,
out-of-range, Boolean, integer-subclass, or otherwise drifted ID; duplicate
names; a non-deterministic anonymous name; or an incorrect use flag. Thus an
encoder map that omits anonymous Sinz variables is not package-complete until
this helper fills those IDs.

## Build-phase ledger

The ledger is canonical JSON with a general ordered phase list. Allocation
intervals must form a single gap-free, overlap-free sequence beginning at ID 1.
Every phase records the exact allocator high-water mark after its allocations.
A query record authenticates its query ID, CNF SHA-256, variables, and clauses;
its DIMACS variable count must equal that phase's allocator high-water mark.
The final phase must close `target_query`, and package construction requires
that final record to match the supplied CNF byte-for-byte by digest and exactly
by dimensions.

The C lane can represent its necessary chronology as:

```python
(
    BuildPhase("base", (BuildAllocation(1, base_n, "base"),), base_n,
               BuildQuery.from_cnf("C.base", base_cnf)),
    BuildPhase("DEL3 auxiliary allocation",
               (BuildAllocation(base_n + 1, del3_n, "DEL3 Sinz"),), del3_n),
    BuildPhase("C1", (), del3_n, BuildQuery.from_cnf("C.C1", c1_cnf)),
    BuildPhase("C2 P interval/final dimensions",
               (BuildAllocation(del3_n + 1, final_n, "C2 P interval"),), final_n,
               BuildQuery.from_cnf("C.C2", c2_cnf)),
)
```

The C2 map still covers the DEL3 interval even if no C2 clause mentions those
IDs. Its entries then carry `used_in_cnf = false`. A package for an earlier
query uses the chronological ledger prefix ending at that query, not a future
allocation record.

## Source custody

In-memory and filesystem custody have separate entry points and concrete
snapshot types. Caller-supplied in-memory content must be exact builtin bytes.
Source snapshots must be an exact nonempty tuple, uniquely sorted by
`logical_path`; mixed snapshot kinds are allowed. The generated canonical
manifest records exact byte counts and SHA-256 identities, and the package
retains both its manifest bytes and the source snapshots containing their exact
content bytes.

Filesystem capture requires an absolute root and a safe relative path. It opens
the root and every path component with no-follow directory descriptors, then
opens the final component no-follow. The final file must be regular, have
exactly one link, and fit the per-file bound. Capture compares `fstat` before
and after the bounded read, then reopens and rereads the file to compare exact
identity, bytes, and hash. Package construction performs another live identity
and byte recheck. Symlinks, hard links, non-regular files, path traversal,
oversize input, and post-capture drift fail closed.

Default source bounds are 8 MiB per file, 64 MiB total, and 256 files. JSON and
CNF bounds are inherited from `EndpointLimits`: canonical JSON is at most 8
MiB, depth 32, and 1,000,000 nodes; CNF is at most 512 MiB. All bounds are
positive exact builtin integers, not Booleans or subclasses.

## Producer and wave claims

The canonical producer binds the exact SHA-256 identities of the CNF, complete
variable map, source manifest, build ledger, and lane profile, plus the exact
DIMACS dimensions. Because the existing snapshot authenticates the CNF,
producer, and wave, these custody records are transitively bound to the
snapshot identity.

The generated `p97-cegar-wave/v1` record always has backend `cadical`, solver
profile `sat`, shard `0/1`, iteration 0, ledger digest as the order identity,
and the caller-supplied valid query polarity. Its promotion record is exactly
`LOCAL_CERTIFICATE` with all theorem fields null. The producer and lane profile
say `semantic_status = "FINITE_LOCAL"`; all theorem-promotion, entitlement,
coverage, universal-lift, Lean-closure, source-link, and replay claims are
false. A successful package or finite solver result is evidence custody only,
not universal proof closure.

## Verification

The fake-only test entry point is:

```bash
./scripts/test-p97-piqd-frontier-package.sh
```

It caps common native thread pools at one, disables pytest plugin autoload,
runs Ruff, and runs only the frontier package tests in one pytest process. It
does not contact PIQD, invoke a SAT solver, run Lean, or use Git.
