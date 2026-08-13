<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# P97 Exact12 next-row static PIQD discovery protocol

## Status and scope

This document records the discovery-only PIQD adapter first used for cell 1
of the Exact12 next-row static-convex CEGAR continuation and its current v21
extension. It implements the boundary recorded in
nthdegree discussions `#5047` and `#5053`. It does not change the finite
detector, terminal certificate path, or Lean consumer. Relative to v8-r13, the
finite root formula now installs the complete authenticated 74-entry
source-order bank as one exact clause suffix before the root job, CNF identity,
or any PIQD descriptor is constructed. That installation is the intended
formula change in this revision.

The current v21 extension is a cell-6 canary over runner schema v8, not a
continuation of the historical r15 formula.  It adds an authenticated
source-proved 24-role reciprocal-first-opposite/surplus-second-opposite
common-five family: 120 implication clauses and 24 role-blocking clauses,
with exact Python-to-Lean clause parity checked in the focused bank suite.
After that 144-clause bridge, the prefix has 45,357 variables and 644,207
clauses (DIMACS SHA-256
`ee31f59067eb0dc9140e0a9a4cc1a5fd077154c2b8f54910ed42162ff95adc9c`).
The current 81-entry source-order bank is installed after the unchanged named
arm; the final formula has 645,155 clauses and DIMACS SHA-256
`a69826e5588cad4f42ab1d23edd3e20378ae4a21ff8dc43b616c4e9c4be53c6d`.
These identities supersede the r14/r15 dimensions below only for v21.  The
older identities remain historical replay data, not current capability
advertisements or valid v21 continuation inputs.

The completed v8-r13 request was a genuinely fresh 600-second PIQD request.
It returned `SAT` in 1.3 seconds, with survivor SHA-256
`35c79bde18367524958963519ba46a72ed14434d17d4c4530799cd1b60c3b86b` and
assignment SHA-256
`0d5197f4f0ced33cfe7f935e74b2388ed949343ca58258f86e3c7d22d5daea08`.
It produced no terminal UNSAT, aggregate coverage, universal producer/lift,
or live closure. No r13 artifact is valid continuation input for this r14
route.

The fresh r14 route appends entry 74,
`ExactTwelveRigid221StaticCell1R13MixedSourceOrderPositiveCut.lean`. Direct
Lean elaboration is green. Its seven centers are `0,2,3,4,5,10,11`, its
source-order clause is `[-1,-155,-175,-554,-924,-2672,-2958]`, and its source
is 10,233 bytes with SHA-256
`5371965813d8d53001975d2a6a7a1bea3febd0c36250881b730785cbd4fde207`.
The exact 74-entry installation identities are: bank SHA-256
`23ba74539463389b7665f3b100646e95496b6c2dc0addbb8cbeb5f1542c3f0fc`;
base 44,902 variables / 635,440 clauses, SHA-256
`5cdfec59aae93a18a667338e7d412a01f1e3162d8f5685cc7a9285b9711d5c4a`;
74-clause suffix SHA-256
`2d17f16177376b1b5ed954dc715b846d29ac0a1d6d5dfa43bf3fe9c502b27b96`;
final 44,902 variables / 635,514 clauses, SHA-256
`d1a9f992afc89420c12bd42524f7b3f49a05390f33fc9c350455df232f18c2db`;
and installation SHA-256
`68fde4133262449bd2826ec5c8a395b89364fd2d3777ecb2cb4783f4b324f3d8`.

That r14 request returned `SAT`. Its authenticated survivor has SHA-256
`32b2dd81231f7b01bfd89328c4da56821e637a7c1f2cf3d78e9d395ed28d33b9`.
The resulting three-row common-five obstruction is now entry 75,
`ExactTwelveRigid221StaticCell1R14CommonFivePositiveCut.lean`: core
`(a,x,b,c,y) = (4,7,10,5,9)`, centers `5,7,9`, and clause
`[-924,-1748,-2308]`. Its source is 4,756 bytes with SHA-256
`689479a9b53010de095632125883da286705e90fac0aad84d7a04f3472f1bf4e`.
The r15 request installed the resulting 75-entry bank (bank SHA-256
`7a7c7711563fe0fd082b6980718216b6f2f2b0d25eebe1b48d39b85becf1b716`),
whose 75-clause suffix has SHA-256
`89829efe56c1f57f671e1b26b21b999b4ca1b6a78caf9bf6a7718120f4ce7454`.
Its 44,902-variable / 635,515-clause formula has SHA-256
`a9653b9070a0237d476845d35ba194e91455e06d0308db1b1d6c7e9d2b3d4d38`.

The r15 request also returned `SAT`; its authenticated survivor has SHA-256
`c03359b36af09c5a2f6bf641f6b131a2e586e46e14af973264dc9aa8276c5017`.
Its single 48-order common-five core is
`(a,x,b,c,y) = (4,7,8,9,10)`. Entry 76,
`ExactTwelveRigid221StaticCell1R15CommonFivePositiveCut.lean`, packages the
three-row clause `[-1748,-2362,-2487]`; its source is 4,622 bytes with SHA-256
`f86d3ba815b41162d8370b690feade1dc971d7352c12c202a0fb5e97c460e811`.
Direct Lean elaboration, exact 48-order replay, focused registry/bank tests, and
Ruff are green. No v8-r16 PIQD request has been launched: another unchanged
wave would only discover another finite common-five instance. An exact
source-transport audit rejected the proposed reading of the r15 core as a
two-incidence `Kc` consumer. Its labels are `(4,7,8,9,10)`; label `4` has no
fixed named source role, and the selected rows centered at `9` and `10` remain
rows of the generic faithful carrier pattern. The checked ingress supplies no
identification reducing this cut to `O ∈ Kc.support` and `u ∈ Kc.support`.
The source-ingress audit subsequently found a genuine omitted predicate: the
live leaf's named source, outside-first-apex-fiber fact, and `q`-or-`w`
survival alternative imply `FrozenNamedDeletionSixArm` for the actual physical
blockers. The Lean theorem
`exists_source_normalized_nextRowNamedDeletionJob` and a separate additive
72-cell placement-by-arm compiler/replay are now green. The next gate is an
authenticated arm-cell runner and bounded stronger wave, not an r16 request
against this unchanged r15 PIQD formula. The r15 artifacts remain valid finite
discovery evidence but do not themselves identify source geometry.

This lane supplies finite discovery evidence only. It establishes no PIQD
proof, PIQD-core classification, aggregate cell coverage, source entitlement,
universal lift, or Lean closure. Proof-blueprint session `019fdf9c` remains
unchanged, open, and off-spine.

PIQD observational UNSAT remains blocked by `CERT-001`. Until that blocker is
closed, the only promotable finite terminal outcome is the existing fresh
local CaDiCaL rerun followed by DRAT/drat-trim authentication.

The ordinary static cell-1 command selects PIQD discovery by default. Its
operational defaults are the loopback daemon URL, a PIQD journal below the
selected work directory, one worker, and sequential execution. These values
do not supply new formula, source, or custody authority: the authenticated
manifests and exact DIMACS remain derived from the live request. Local
discovery is retained only behind the explicit `--solver-backend legacy-local`
selection.

## Additive coordinator seam

`run_static_cegar` has one optional keyword-only `discovery_solver_factory`.
This low-level injection seam remains available to tests and to the explicitly
selected legacy-local route. The ordinary CLI constructs the PIQD factory by
default. When present, the factory is called once for each current formula and
receives an immutable `StaticDiscoveryRequest` containing:

- the exact current in-memory instance and DIMACS bytes;
- current SHA-256 and DIMACS variable/clause dimensions;
- root canonical v8 job and job ID;
- detector-contract SHA-256;
- exact cell, global journal iteration, local iteration, and parent record; and
- the compiler, static-convex, positive-membership, source-order, candidate,
  and source identities transitively carried by the root job.

Only the discovery call is replaced. The callback must receive
`proof_path=None` and must return an exact `CadicalResult`. The terminal branch
continues to call the original `solver` exactly once with `terminal.drat`.
Promotion still requires an authenticated terminal UNSAT, an existing proof,
and byte-identical discovery, terminal, and journal-reconstructed CNFs.

After a SAT witness produces an authenticated cut, the coordinator mutates the
CNF and invokes the factory again. A runner or descriptor is never reused for a
changed formula.

## Canonical discovery descriptor

For every invocation, the adapter validates and publishes a canonical
content-addressed descriptor with schema
`p97_rigid221_exact12_next_row_static_piqd_descriptor.v2`. It binds:

- the canonical root `job_id` and v8 job schema;
- current CNF bytes, SHA-256, variable count, and clause count;
- the root CNF identity and dimensions;
- cell 1, global and local iterations, and journal parent;
- detector contract text and its source-bound SHA-256;
- exact candidate profile and schema;
- compiler and static-convex schemas, manifests, and manifest hashes;
- positive-membership and source-order bank identities;
- the source-order installation schema, base/suffix/final clause counts, and
  base/suffix/final CNF hashes;
- the ordered v8 source manifest and its hash;
- `SAT_MEANS_SURVIVING_STATIC_CUBE`, `CERT-001`; and
- explicit false source-entitlement, theorem-coverage, universal-lift, and
  Lean-closure claims.

The existing v8 source list contains one repeated path with the same exact
size and digest. The adapter preserves that ordered root-job identity and
rejects only a repeated path whose identities disagree.

For the historical r14 request, the coordinator authenticates and installs the
exact 74-clause suffix before
constructing the root job. The PIQD boundary revalidates the installation hash,
bank schema and hash, suffix count, and final root-CNF dimensions and hash. The
literal suffix is therefore bound by the submitted root CNF rather than copied
into the descriptor as a second representation.

Descriptors are create-once, single-link regular files. Descriptor, source, and
current-CNF paths are anchored component-by-component from the filesystem root
with `O_NOFOLLOW` directory and file descriptors. An existing symlink in a
descriptor root or discovery work-directory path is rejected before transport;
missing directory components are created and then reopened with the same
nofollow checks. A missing source, symlink, hardlink, changed byte count,
changed hash, crossed duplicate, changed descriptor, stale instance, stale
DIMACS, wrong dimensions, noncanonical job, wrong detector binding, or wrong
iteration/parent relationship fails closed before PIQD evidence is accepted.

## Shared PIQD runner and receipt

The adapter delegates transport, raw-DIMACS custody, attempt journals, status
attestation, and solver receipts to
`phase3_piqd_static_solver_runner.make_static_piqd_solver_runner`. Every
formula gets a fresh runner invocation under a revision-specific project; r14
used `p97-exact12-next-row-static-cell1-v8-r14` with requested core limit one.
The caller and driver require one worker and sequential dispatch, while the
receipt separately authenticates the processes PIQD actually attests. A
requested core limit is not a claim about the daemon host's physical cores.

Every appended cut changes the authenticated bank, suffix, root CNF, source
manifest, and root job identities. Consequently no r13 root, job, descriptor,
or journal is a valid continuation input for v8-r14, and neither the r14 nor
r15 artifacts are valid inputs for a hypothetical r16 request, even if they
previously passed all replay gates.

The static source manifest binds the descriptor hash. The producer manifest
embeds that source manifest and binds the compiler-manifest hash as its
variable-map identity. After the call, the adapter independently validates the
canonical receipt hash and cross-checks the adapter verdict/return code, exact
CNF hash and dimensions, source and producer hashes, raw job identity,
backend, profile, project, requested core limit, absence of a proof endpoint,
absence of a legacy proof path, and `CERT-001`.

For raw-DIMACS jobs prepared after PIQD commit `773ccde`, the daemon also
stores the exact submitted producer-manifest bytes. `GET /jobs/:id` exposes
their content address as `producer_manifest_blob_hash`, and the generic blob
route returns bytes verified against that address. This strengthens artifact
custody only: PIQD still does not validate the manifest's Python-to-Lean
semantics or retain the source files named by it. A null blob hash is expected
for pre-change jobs, jobs submitted without a manifest, and non-raw-DIMACS
jobs, and old manifest bytes are not recoverable from PIQD. The identity-bound
`producer_manifest_hash` and the retrievable `producer_manifest_blob_hash`
therefore have different contracts and must not be conflated.

PIQD commit `3cff11c` additionally enforces one daemon owner per data
directory with an advisory lock acquired before database recovery. This
removes the unsupported two-daemon/shared-directory mode that could produce
duplicate solver ownership and crossed log lines; it does not alter this
adapter's job identity, route, receipt, or deduplication checks.

The descriptor, live v8 sources, and exact current CNF are checked again after
the call. A non-exact `StaticSolverResult`, invalid verdict/return-code pair,
partial or ill-typed model, malformed receipt, crossed job, or custody change
raises a fail-closed adapter error.

## Outcome protocol

SAT requires a total assignment for variables `1..n`. The shared runner first
replays it against the exact submitted DIMACS. The adapter independently
replays the positive-variable set against the current instance clauses and
decodes the cube with the current instance. The unchanged coordinator then
performs its existing full static witness replay and detector admission.

UNSAT is observational only. The adapter returns an unproved discovery UNSAT,
does not call a PIQD proof endpoint, and does not write a DRAT path. The
unchanged coordinator performs exactly one fresh local solve over the
identical formula, supplies `terminal.drat`, and requires its existing
CaDiCaL/DRAT/drat-trim authentication before the finite terminal-pending-Lean
status can be emitted.

UNKNOWN, deployment failure, transport failure, malformed output, custody
failure, and adapter exceptions have no local discovery fallback. In
particular, none of them reaches the terminal proof branch.

## Entry point and offline check

The ordinary production entry point is
`census.card_head.exact12_next_row_static_cegar`. For cell 1 it defaults to
PIQD discovery at `http://127.0.0.1:7272`, stores the discovery journal below
`WORKDIR/piqd-discovery`, and requires `--workers 1 --parallel-mode
sequential`. The URL and journal root may be overridden explicitly. The
legacy-local route must be selected explicitly and rejects PIQD-only inputs.
The dedicated `census.card_head.exact12_next_row_static_piqd` entry point has
the same defaults and single-worker/sequential gates. Neither entry point has
a local discovery fallback after PIQD construction, transport, UNKNOWN,
custody, or validation failure.

The offline focused check is:

```bash
scripts/test-p97-piqd-exact12-next-row-static.sh
```

It runs the focused coordinator and PIQD-adapter tests against fake transports,
caps common software thread pools at one, and checks the owned Python files
with Ruff. It invokes no PIQD daemon, Lean build, or Git command.
