# P97 PIQD structural CEGAR route v1

## Status and frozen-driver boundary

This is an additive launcher for the non-v3 structural CEGAR driver. The
launcher is `phase3_piqd_structural_cegar_launcher.py`; the caller-specific
composite is `phase3_piqd_structural_cegar_route.py`. The frozen
`phase3_structural_cegar.py` v2 source remains byte-for-byte unchanged at
SHA-256
`8d09e3fb72522a7e9ed111cab8a33b56afcf739434fe54e79619c00290358e9d`.
Consequently its ordinary CLI and Python API still default directly to the
local `sat.run_cadical` path. PIQD is used only through the additive launcher.

This route is finite-search infrastructure. PIQD UNSAT is observational; it
does not establish a proof, source entitlement, a universal lift, or Lean
closure. It does not migrate cube batching. Proof-blueprint session
`019fdf9c` remains unchanged, open, and off-spine.

## Launcher inputs and admitted mode

The additive launcher requires all four inputs together:

- `--piqd-base-url`;
- `--piqd-journal-root`;
- `--piqd-source-manifest`, naming the exact canonical source-manifest bytes;
  and
- `--piqd-producer-manifest`, naming the exact canonical producer-manifest
  bytes.

A missing member of the group is an error. The launcher admits only one
worker in `sequential` mode. It rejects `cube-batch`, `workers != 1`,
`--resume`, fixed shards (`--shard-depth` or `--shard-index`), and
`--verify-shards`. The same checks run after argument parsing in
`run_piqd_launch`, so constructing a `PiqdLaunchArguments` value directly does
not bypass them. No authenticated PIQD custody contract has been established
for resume, shard, shard-verification, parallel, or cube-batch continuity.

Both manifests are captured before route construction as nonempty regular
files with an exact 64 KiB bound. Capture opens the filesystem root, each
parent component, and the final component without following links; it holds
the descriptors while reading and revalidates the component chain, final
device/inode, metadata, byte count, and content digest. Final-component
symlinks, non-regular files, oversized files, and observed TOCTOU drift are
rejected. The exact captured bytes, not a parsed or rewritten representation,
are passed to the static PIQD runner.

## Composite solver contract

The frozen driver invokes its solver boundary with `.solver.cnf` and a
non-null `.solver.drat` path. The composite requires that non-null legacy path,
but calls its internal PIQD discovery runner with `proof_path=None`. PIQD is
therefore never asked to produce or return a DRAT file.

The outcomes are:

- PIQD SAT is accepted only after exact total-model replay by the existing
  static runner. The composite returns that replayed SAT result unchanged.
- PIQD UNKNOWN, transport/authentication/custody failure, or malformed output
  is terminal UNKNOWN/error for that frozen-driver attempt. No local discovery
  fallback runs and no learned clause is added.
- PIQD UNSAT is observational. The composite makes exactly one fresh local
  proof-producing call on the same `.solver.cnf`, using the non-null
  `.solver.drat` path supplied by the frozen driver. It returns the local
  result only when that result is UNSAT.
- A local exception propagates to the frozen driver, which records
  `SOLVER_EXCEPTION`. A local SAT, UNKNOWN, or other non-UNSAT answer after
  observational PIQD UNSAT is an explicit route-level disagreement error; it
  also reaches the frozen driver as `SOLVER_EXCEPTION`, without SAT decoding,
  learning, or fallback. A local UNSAT result without a nonempty proof records
  `MISSING_DRAT`.
- Only after local UNSAT does the frozen driver write the exact CNF bytes as
  `terminal.cnf`, move the local proof to `terminal.drat`, and invoke its
  existing DRAT checker. Only that checker can produce a verified terminal
  status. PIQD's observational answer is never the proof authority.

The route configuration truthfully uses a generic fresh-local-proof-runner
label. It records a callable name only as diagnostic, unauthenticated
identity, plus either `factory-default-sat.run_cadical` or `caller-supplied`.
The launcher uses the factory default. Python API callers may inject an
arbitrary runner, so their configuration does not claim CaDiCaL provenance.
The caller-specific PIQD project label is
`erdos-97-96-formalization/phase3-structural-cegar`.

## Additive sidecar

After the frozen driver returns, the launcher writes a separate canonical
`piqd-route-manifest.json`. It records the route configuration and exact
hashes/counts of the frozen structural manifest and solver log; it does not
modify the frozen manifest schema or its semantics. The sidecar temporary is
captured as a nonempty singly-linked regular file, then published using the
native atomic no-replace seam described below. Publication preserves its
inode/content and revalidates the structural artifacts. An existing sidecar is
not overwritten.

Sidecar failure disposition is deliberately preservation-only. Once
`mkstemp` has created a name, a write, fsync, capture, identity, or no-replace
publication failure leaves that temporary pathname untouched. POSIX has no
portable atomic operation meaning "unlink this name only if it still denotes
the inode I observed", so an `lstat`-then-`unlink` cleanup would be raceable.
A successful no-replace rename consumes the temporary name. If a later
published-sidecar or structural-artifact revalidation fails, the published
sidecar remains untouched. These remnants require inspection/manual cleanup
in the already-required trusted output directory; the launcher never deletes
an ambiguous or failed sidecar artifact.

## Shared successor-runtime custody hardening

`FilesystemTerminalPublisher`, used by successor drivers such as
projected-static-v3 but not by the frozen v2 driver, has a stronger terminal
publication boundary:

- after the atomic terminal-CNF write it captures exact bounded bytes plus
  device/inode, and reopens no-follow after the proof solver and after the
  checker; any identity or content change is `TERMINAL_CNF_DRIFT`;
- proof temporary and destination captures require nonempty singly-linked
  regular files without following links;
- proof publication uses a native same-directory atomic no-replace rename:
  macOS `renameatx_np(RENAME_EXCL)` or Linux
  `renameat2(RENAME_NOREPLACE)`. Unsupported platforms fail closed. The
  destination can never be overwritten by this seam, even if it appears after
  the solver/capture and immediately before publication;
- the published proof must retain the temporary's device/inode, size, link
  count, and digest, and is recaptured after the checker. Symlink, mutation,
  replacement, or identity drift fails closed. The publisher does not attempt
  raceable pathname cleanup of ambiguous proof artifacts.

The native rename is anchored to a held no-follow descriptor for the final
output directory. Unlike exact file capture, that helper does not hold and
revalidate every ancestor component. Both facilities assume an output tree
trusted to the invoking user. They detect the tested accidental/concurrent
substitutions, but they are not a hostile-filesystem or hostile-same-user
sandbox.

## Frozen-v2 custody non-claim

The frozen driver predates `FilesystemTerminalPublisher`. It rewrites
`terminal.cnf`, so `.solver.cnf` to `terminal.cnf` inode continuity is not
claimed. It also checks `.solver.drat` and then publishes with `os.replace`.
A concurrent same-user writer in the output directory can therefore create a
`terminal.drat` after the check and have that path overwritten. The additive
launcher cannot close that race without changing the frozen driver or
interposing on its process-global filesystem operations, neither of which this
route does. The outer checker still checks the resulting terminal CNF/proof
bytes, but callers must treat the frozen output directory as a trusted
same-user boundary. This route makes no stronger hostile-filesystem custody
claim.

The static adapter also does not independently take custody of the source file
named inside the source manifest or an external variable-map artifact named
only by hash. These are P97 adapter/runtime custody limits, not PIQD daemon
defects.

## Regression contract

Fake-transport and frozen-driver integration tests cover replayed SAT,
UNKNOWN/transport/custody failure without local fallback, observational UNSAT
followed by exactly one local proof rerun, authoritative outer checking, and
local disagreement/exception/missing-proof failure. Launcher tests cover exact
manifest-byte forwarding; all-or-none flags; one-worker/sequential gates;
explicit `--verify-shards`, resume, fixed-shard, and direct-API bypass
rejection; literal-`None` PIQD proof-path routing; sidecar no-replace
publication; write/fsync failure remnants; ambiguous replacement preservation;
and preservation of the frozen local default. Runtime tests inject terminal
replacement/mutation, proof
symlink/replacement/identity drift, and a concurrent destination created at
the publication seam whose sentinel bytes must remain unchanged.
