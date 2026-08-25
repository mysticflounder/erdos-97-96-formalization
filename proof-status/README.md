# proof-status — generated obligation registry (consolidation refactor)

Program: docs/audits/2026-08-23-consolidation-refactor-audit.md, lane
`consolidation-refactor-20260823`. Everything here except `obligations-meta.json`
is generated; do not hand-edit generated files.

## Files

- `obligations.json` — the obligation registry (`p97-obligation-registry/v1`),
  generated from the built spine: one entry per open declaration (28 reachable +
  6 off-spine at the recorded `source_head`), with stable IDs. Each entry also
  carries the reviewed fields joined from `obligations-meta.json`:
  `meta_status` (the reviewed `prose_status`), `terminal_family`,
  `mathematical_packet`, `latest_checkpoint`, `implementation_effect`,
  `evidence_note`, `legacy_labels`.
- `id-assignments.json` — authoritative symbol→ID ledger. IDs never change or get
  reissued; vanished symbols move to its `retired` map. A W3-0 factorization
  rename adds an `aliases` map (see "Factorization entries (W3-0)"); the key is
  written only when it is non-empty.
- `obligations-meta.json` — the ONE hand-reviewed file (a JSON object keyed by
  obligation ID): per-ID cluster, packet, controlled `prose_status` vocabulary,
  citations. The generator reads this file by name; the join is validated on
  every `check` (see "Metadata validation" below). An entry MAY also carry an
  optional `factorization` block (see "Factorization entries (W3-0)").
- `frontier-table.generated.md` — README-shaped frontier table, generated.
- `receipts/` — `p97-registry-check-receipt/v1` receipts, one per `check` run.
  Each pins the revision the verdict was computed against: git HEAD, the
  working-tree sha256 and dirty flag of every roster source file, the Lean
  toolchain digest (`lean/lean-toolchain`), the `proof-blueprint refs --check`
  build id with its stale / never-mined / fresh counts, both roster counts, the
  metadata violation list, and the verdict with its reasons. It also records
  `source_head_matches_git_head` report-only — the registry is regenerated only
  on an intentional roster change, so a `source_head` behind HEAD is expected
  and is not a failure.
  The same directory holds the per-wave gate receipts (`p97-gate-receipt/v1`,
  e.g. `w1c-gate-receipt.json`): one record per refactor wave binding git HEAD,
  the working-tree sha256 of every changed Lean file and script, the toolchain
  digest, the blueprint build id, and each gate's verdict. `w1c-gate-receipt.json`
  supersedes the Phase 0 gate (`phase0-gate-resolution.json` points at it). The
  strict `--require-fresh-refs` FAIL recorded there is a documented
  proof-blueprint miner exception (36 stale + 1 never-mined symbols, unchanged
  since the baseline and after a forced re-mine), not wave drift.
- `cluster-import-edges.json` / `import-waivers.json` — frozen import graph of
  `FrontierLiveClosure/` and the waived pre-existing forbidden edges (with
  planned retirement phases). The frozen graph is the waiver authentication
  basis and is IMMUTABLE.
- `legacy-import-exceptions.json` / `cluster-import-edges-live-2026-08-24.json`
  — the per-edge Legacy wrapper exception manifest and the dated current graph;
  see "Legacy import exceptions and dated graph (W3-0)".
- `baseline/` — frozen Phase 0 measurement (spine/off-spine exports, axioms,
  module hashes, dirty snapshot, re-anchor note).
- `phase0-gate.json` / `phase0-gate-resolution.json` — the independent Phase 0
  gate report and the main-session resolution record.

## Standing gates (run from repo root)

```bash
uv run python scripts/gen_obligation_registry.py check --baseline proof-status/baseline
# exit 0 = live roster matches the registry AND the reviewed metadata join is valid
# exit 1 = roster drift or metadata violation; exit 2 = operational error (retry once)
# writes proof-status/receipts/registry-check-<UTC timestamp>.json on every run,
# including failures; --receipts-dir DIR redirects it

uv run python scripts/gen_obligation_registry.py check --baseline proof-status/baseline --require-fresh-refs
# additionally exit 1 when `proof-blueprint refs --check` reports a nonzero
# stale or never-mined count (fix with `proof-blueprint refs --refresh`)

uv run python scripts/gen_obligation_registry.py check --baseline proof-status/baseline --require-factorized TD
# additionally exit 1 while any REACHABLE leaf of that cluster lacks a VERIFIED
# p97-factorization/v2 block; repeatable, see "Factorization entries (W3-0)"

uv run pytest -q scripts/test_gen_obligation_registry_factorization.py
# the adversarial factorization suite: synthetic fixtures injected through the
# FactorizationBackend seam, never the live blueprint database

uv run python scripts/lint_cluster_imports.py
# exit 0 = no NEW cross-cluster import under FrontierLiveClosure/ (existing edges are waived)
# The scanner reads only the import header of each module (blank, comment, and
# import lines up to the first other command), tolerates leading whitespace and
# trailing `--` comments, and ignores prose inside docstrings.  Every waiver in
# import-waivers.json is authenticated: its (from, to) pair must exist in the
# frozen cluster-import-edges.json, its `reason` must be non-empty, its
# `planned_retirement` must be one of W1b/W2/W3/W4/unassigned, and the
# `summary` counts must match.  A waiver for an edge that is no longer live
# (stale), an unknown pair, a duplicate row, or a summary mismatch is exit 1.
# --waivers FILE substitutes another waiver file; --scan-file PATH prints the
# header imports the scanner sees for one file (diagnostic).
```

### Metadata validation

`check` fails (exit 1) on any of:

- a registry ID with no `obligations-meta.json` entry;
- an `obligations-meta.json` entry naming no live registry ID (orphan);
- a missing `prose_status`, or one outside the controlled vocabulary;
- a reviewed `cluster` disagreeing with the generated cluster.

The controlled vocabulary is fixed by
`docs/audits/2026-08-23-consolidation-refactor-audit.md` ("P1 refactor —
controlled status vocabulary") and encoded as `PROSE_STATUS_VOCABULARY` in the
generator: `KERNEL_CLEAN`, `CERTIFIED_APPROVED_TRUST`,
`SOURCE_CLEAN_TRANSITIVELY_OPEN`, `PROSE_CLOSED_LEAN_UNIMPLEMENTED`,
`NORMAL_FORM_CLOSED_TERMINAL_OPEN`, `OPEN_MATHEMATICAL`,
`REFUTED_LOCAL_STATEMENT`, `OFF_SPINE_DIAGNOSTIC`, `SUPERSEDED`. Extend the
tuple only together with that audit section.

Regenerate after an intentional roster change:

```bash
uv run python scripts/gen_obligation_registry.py generate --baseline proof-status/baseline --out proof-status
# warns on metadata violations but still writes, so a new obligation can be
# reviewed afterwards; --strict-meta turns those warnings into exit 1
```

A new obligation therefore needs two edits: regenerate (which assigns its ID),
then add the reviewed `obligations-meta.json` entry for that ID. `check` stays
red until both are done.

## Factorization entries (W3-0)

Phase 3 of the consolidation refactor ("cluster coordinators") gates on *every
old leaf has a machine-checked factorization entry in the obligation registry*.
The entry is an OPTIONAL `factorization` block on a reviewed
`obligations-meta.json` entry, checked by
`scripts/gen_obligation_registry.py` against kernel-mined truth — never against
prose.

### 1. The versioned block

```json
"factorization": {
  "schema": "p97-factorization/v2",
  "obligation_id": "P97-XX-EXAMPLE",
  "roles": {
    "legacy_wrapper": "Namespace.old_public_theorem",
    "coordinator":    "Namespace.cluster_coordinator",
    "producer":       "Namespace.intrinsic_producer",
    "eliminator":     "Namespace.terminal_eliminator",
    "open_leaf":      "Namespace.the_open_leaf"
  },
  "transitive": [
    {"from": "coordinator", "to": "eliminator", "via": ["Namespace.hop"]}
  ],
  "pinned": {
    "legacy_wrapper_statement_sha256": "<64 lowercase hex>",
    "open_leaf_statement_sha256": "<64 lowercase hex>"
  },
  "note": "free prose"
}
```

- `obligation_id` must name the entry's own ID.
- `transitive` and `note` are optional; `schema`, `obligation_id`, `roles` and
  `pinned` are required. Any other key inside the block — or inside `roles`,
  `pinned` or a `transitive` row — is a metadata violation, as is an unknown
  `schema`.
- **Legacy v1.** A meta file with NO factorization block loads exactly as
  before. A block marked `"schema": "p97-factorization/v1"` is the same block
  WITHOUT the `pinned` digests: it still loads, it is counted as a WARNING
  (`v1_warnings`) in the check receipt, and it is NEVER reported as a verified
  factorization — without pinned digests nothing binds the block to the
  statements it claims to factor. A `pinned` key inside a v1 block is an
  unknown key, not a silent upgrade.

**Roles.** The five roles must be DISTINCT, exact, fully qualified, PUBLIC
declarations, each resolving to exactly one index record. Resolution is
`proof-blueprint search --name <symbol> --json --all --private` filtered to an
exact fully-qualified match (`--name` matches substrings, so the exactness is
imposed by the checker, not trusted from the query). Zero or more than one
record is ambiguous and is a violation; `private == true` is a violation.

**Statement digest.** `sha256` of the index record's `signature` string after
collapsing every whitespace run to a single space and stripping leading and
trailing whitespace (`" ".join(text.split())` — no regex), encoded UTF-8,
lowercase hex. Re-indenting a Lean statement therefore does not read as a
statement change; a token change does.

**Chain.** In the kernel-mined call graph, "A directly calls B" is decided as
`A ∈ callers(B)`, where `callers(B)` is exactly what
`proof-blueprint search --uses B` returns (the declarations whose proofs use
B). The required direct edges are

```text
legacy_wrapper -> coordinator
coordinator    -> producer
coordinator    -> eliminator
eliminator     -> open_leaf
```

A `transitive` row REPLACES the direct check for its `(from, to)` pair by
checking every consecutive hop of `from -> via[0] -> ... -> via[-1] -> to`
directly; a pair with no row must be direct. A row naming a pair that is not
one of the four chain edges, an empty `via`, or a repeated pair is a violation.
Every failure line names both endpoints and the direction explicitly:

```text
P97-XX-EXAMPLE: eliminator (Namespace.terminal_eliminator) does not directly call open_leaf (Namespace.the_open_leaf)
```

**Cycles.** The direct-call relation RESTRICTED to the five role symbols must be
acyclic. Any cycle is a violation.

**Leaf identity.** `open_leaf` must be the registry entry's `lean_decl` (after
the alias migration below) and must have `has_sorry == true`. The pinned
`open_leaf` digest must equal its current digest ("open leaf statement
changed" otherwise), and the pinned `legacy_wrapper` digest must equal the
current digest of `legacy_wrapper`.

### 2. Stable identity and the alias migration

When a v2 block names an `open_leaf` different from the symbol the ID ledger
currently assigns to that ID, that is a RENAME, not drift: the `P97-*` ID
FOLLOWS the new `open_leaf`, and the old public name is recorded in
`id-assignments.json` under a top-level `aliases` map, per affected ID:

```json
"aliases": {
  "P97-XX-EXAMPLE": {
    "aliases": ["Namespace.old_public_theorem"],
    "renamed_from": "Namespace.old_public_theorem",
    "renamed_at_head": "<git HEAD short>"
  }
}
```

A rename is accepted only when the old name still resolves to exactly one
PUBLIC index record (the compatibility wrapper) and is exactly the
`legacy_wrapper` role. It may not allocate a new ID, may not retire the old ID,
may not reuse an ID another entry holds, and may not alias a symbol another ID
already claims. Each of those is a violation and the ledger is left untouched —
which makes the rename surface as ordinary drift instead, exactly as it does
today. WITHOUT a factorization block a `lean_decl` change is still ordinary
drift. The `aliases` key is written only when it is non-empty, so a ledger that
has never been migrated stays byte-identical.

### 3. Freshness and trust

Every symbol a live (v2) block names — the five roles AND every `transitive`
hop — must be mined for the CURRENT build: never-mined and stale are both
violations, and a build that cannot be identified is reported as "cannot
verify", never as fresh.

The freshness method has no CLI surface: `proof-blueprint refs --check` reports
GLOBAL counts only. Per-symbol freshness is therefore read from the blueprint
database named by `[paths] db` in `.blueprint.toml`, opened READ-ONLY:

- `symbol_mined(symbol, file_hash, mined_at)` — `file_hash` is the build
  fingerprint the symbol was mined against; no row at all means never mined;
- `module_mined(module_name, olean_hash, global_fp, mined_at)` — consulted only
  to expand the short `current build: <id>` prefix that `refs --check` prints
  into the full fingerprint those tables store. Zero or several matching full
  fingerprints means the build cannot be identified.

**Trust.** The `producer` must be kernel clean: its TRANSITIVE kernel axiom
closure, read from `proof-blueprint axioms <producer>`, may contain no
`sorryAx`, no `Lean.ofReduceBool`, no `Lean.trustCompiler`, and no axiom the
tool does not tag `core`. A `has_sorry` source scan is deliberately NOT used
and is not sufficient: it cannot see a `sorry` reached through a helper. The
`coordinator` and the `eliminator` consume the open leaf and therefore carry
`sorryAx` BY DESIGN, so for those two the closure may add nothing beyond core
axioms and `sorryAx`; any other custom or native trust is a violation. The
`axioms` exit code is not trusted — the tool exits nonzero for some symbols by
design — the printed closure lines are parsed instead, and a header count that
disagrees with the parsed lines is reported as "cannot verify".

All of this is read through one injectable seam (`FactorizationBackend`:
`resolve`, `callers`, `axioms`, `mined_build`, `current_build`).
`BlueprintBackend` backs it with the CLI plus the read-only database read;
`scripts/test_gen_obligation_registry_factorization.py` backs it with
dictionaries, so every adversarial case is exercised without touching live
data. A reviewed metadata file with no factorization block constructs no
backend at all and costs no extra CLI invocation.

### 4. Per-cluster requirement (fail-closed)

```bash
uv run python scripts/gen_obligation_registry.py check --baseline proof-status/baseline \
  --require-factorized TD
# exit 1 while any REACHABLE leaf of that cluster lacks a VERIFIED
# p97-factorization/v2 block, listing each ID by name
```

`--require-factorized` takes a cluster CODE (`R221`, `TA`, `TS`, `TD`, `B1`,
`X`) and is repeatable. Today `--require-factorized TD` exits 1 naming
`P97-TD-BLOCKERCOINCIDENCE`, `P97-TD-GLOBALGAPORCLOSED` and
`P97-TD-SURVIVALSQUARE`. WITHOUT the flag a missing block never fails: it is
only counted, and the check prints `factorized k/n reachable leaves`.

Every `check` receipt gains:

```json
"factorization": {
  "schema_versions": {"p97-factorization/v2": 1},
  "checked": 1, "verified": 1, "v1_warnings": 0, "missing": 27,
  "required_clusters": ["TD"], "violations": []
}
```

`checked` counts blocks examined, `verified` counts v2 blocks that passed every
check above, `v1_warnings` counts legacy v1 blocks (never verified), and
`missing` counts REACHABLE leaves carrying no block at all. A non-empty
`violations` list fails the check (exit 1) whether or not
`--require-factorized` was passed.

## Legacy import exceptions and dated graph (W3-0)

The Legacy compatibility-wrapper modules introduced by the cluster-coordinator
waves re-export across cluster boundaries by construction, so they need a
per-edge exception manifest rather than a waiver. This is the specification the
W3 lint author implements; the manifest itself is
`proof-status/legacy-import-exceptions.json`.

- **Schema** `legacy-import-exceptions/v1`.
- **Fields**
  - `base_head` — 8-hex git HEAD the manifest was authored against.
  - `frozen_graph_sha256` — sha256 of the BYTES of
    `proof-status/cluster-import-edges.json`.
  - `exceptions` — a list of objects, each carrying:
    - `wrapper_module` — the exact fully-qualified module name, under
      `Erdos9796Proof.P97.ATail.FrontierLiveClosure.Legacy`, that owns the edge;
    - `from` — fully-qualified module name;
    - `to` — fully-qualified module name;
    - `class` — the RECOMPUTED edge class (recomputed by the lint from the live
      module names, never copied from the manifest);
    - `reason` — non-empty prose;
    - `waiver_pair` — `[from, to]` of the `import-waivers.json` row this
      exception supersedes, or `null`. When non-null, that row MUST exist in
      `import-waivers.json`;
    - `added_wave` — `"W3"`.
- **Exactness.** Every Legacy-module edge in the LIVE tree must be listed
  exactly. An unlisted live Legacy edge is a lint FAILURE. There is no prefix,
  glob, basename or directory-wide exemption — one row per edge, nothing else.
- **Reporting.** Each exception is printed with its file, line, `from`, `to`
  and recomputed `class`.
- **Frozen versus dated.** `proof-status/cluster-import-edges.json` stays the
  waiver authentication basis and is IMMUTABLE (the frozen Phase 0 record).
  `proof-status/cluster-import-edges-live-2026-08-24.json` is the dated current
  graph and is DOCUMENTATION ONLY: nothing authenticates against it.
