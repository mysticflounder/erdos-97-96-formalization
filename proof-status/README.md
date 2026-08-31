# proof-status — generated obligation registry (consolidation refactor)

Program: docs/audits/2026-08-23-consolidation-refactor-audit.md, lane
`consolidation-refactor-20260823`. The registry, ID ledger, frontier table, and
receipts are generated; `obligations-meta.json` and
`private-edge-reachability.json` are hand-reviewed inputs, and this README
documents their gates. Do not hand-edit files identified below as generated.
The [current proof checkpoint](../docs/proof/CURRENT.md) is the short pointer to
the latest accepted refactor delta and its explicit predecessor; this directory
remains the machine-readable evidence authority.

## Files

- `obligations.json` — the obligation registry (`p97-obligation-registry/v1`),
  generated from the built spine: one stable-ID entry per registered open
  declaration. The current reachable/off-spine counts, per-module table,
  reviewed-status tally, and off-spine FQNs live in the marker-delimited
  [generated authority block](../README.md#the-open-frontier). Each entry also
  carries the reviewed fields joined from `obligations-meta.json`:
  `meta_status` (the reviewed `prose_status`), `terminal_family`,
  `mathematical_packet`, `latest_checkpoint`, `implementation_effect`,
  `evidence_note`, `legacy_labels`.
- `id-assignments.json` — authoritative symbol→ID ledger. IDs never change or get
  reissued; vanished symbols move to its `retired` map. A W3-0 factorization
  rename adds an `aliases` map (see "Factorization entries (W3-0)"); the key is
  written only when it is non-empty. A reachability correction likewise does
  not rename an ID, so the two promoted private-edge leaves retain their
  historical `P97-OFF-` prefixes.
- `obligations-meta.json` — the reviewed metadata file (a JSON object keyed by
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
  planned retirement phases), plus the `retired_waivers` rows for the edges a
  wave has already removed; see "Retired waivers (W3-0d)". The frozen graph is
  the waiver authentication basis and is IMMUTABLE.
- `legacy-import-exceptions.json` / `cluster-import-edges-live-2026-08-24.json`
  — the per-edge Legacy wrapper exception manifest and the dated current graph;
  see "Legacy import exceptions and dated graph (W3-0)".
- `baseline/` — frozen Phase 0 measurement (spine/off-spine exports, axioms,
  module hashes, dirty snapshot, re-anchor note).
- `private-edge-reachability.json` — reviewed `p97-private-edge-reachability/v1`
  manifest for the two private-helper call paths that the public
  `proof-blueprint` spine export cannot see. It is a closed-world, fail-closed
  override: generation accepts exactly the authenticated leaves and only when
  each appears once in the off-spine export. A missing entry, duplicate,
  already-visible, malformed, or unregistered override fails generation,
  checking, and the status gate; overrides never mask unrelated roster drift.
- `phase0-gate.json` / `phase0-gate-resolution.json` — the independent Phase 0
  gate report and the main-session resolution record.

## Standing gates (run from repo root)

```bash
uv run python scripts/gen_obligation_registry.py status --check
# strict read-only authority gate: byte-checks frontier-table.generated.md and
# the README block, validates the live spine target/count/unique reachable FQN
# set, and requires docs/live-blueprint.md to byte-match `spine --banner`.
# Exit 0/1 from proof-blueprint is accepted only after strict output parsing.
# This command writes no files and no receipts.

uv run python scripts/gen_obligation_registry.py status --sync
# runs the same fail-closed gates, then atomically replaces ONLY the one
# marker-delimited README block; every byte outside the markers is preserved.
# A missing, duplicate, reversed, or malformed marker refuses the sync.

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

uv run pytest -q scripts/test_gen_obligation_registry_status.py
# adversarial status fixtures injected through the command-level spine runner;
# no live blueprint database, status file, or receipt is touched

uv run python scripts/lint_cluster_imports.py
# exit 0 = no NEW cross-cluster import under FrontierLiveClosure/ (existing edges are waived)
# The scanner reads only the import header of each module (blank, comment, and
# import lines up to the first other command), tolerates leading whitespace and
# trailing `--` comments, and ignores prose inside docstrings.  import-waivers.json
# is schema `import-waivers/v2`: a live `waivers` list plus a `retired_waivers`
# list, and any other `schema` value is exit 2.  Every waiver is authenticated:
# its (from, to) pair must exist in the frozen cluster-import-edges.json, its
# `reason` must be non-empty, its `planned_retirement` must be one of
# W1b/W2/W3/W4/unassigned, and the `summary` counts (retirements included) must
# match.  A waiver for an edge that is no longer live (stale), an unknown pair,
# a duplicate row, or a summary mismatch is exit 1.  The two lists are a CLOSED
# WORLD over the frozen record: a forbidden pair of cluster-import-edges.json
# named by neither list is exit 1, and so is a pair named by both, a retired
# pair whose edge is present again in the live tree, and a retired row whose
# `retired_head` is malformed, names no commit or names a commit that is not an
# ancestor of HEAD (a ROW failure, exit 1 -- not the exit 2 the manifest's
# `base_head` gets).  See "Retired waivers (W3-0d)".
# --waivers FILE substitutes another waiver file; --list-waived prints the
# waived edges and the retired rows; --scan-file PATH prints the header imports
# the scanner sees for one file (diagnostic).
# The OK line reads: N import edges scanned, F forbidden edges, all waived by W
# authenticated waivers; R retired; L legacy edges, all listed.
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

Regenerate from the live roster after an intentional roster change:

```bash
uv run python scripts/gen_obligation_registry.py generate --fresh --out proof-status
# warns on METADATA JOIN violations but still writes, so a new obligation can be
# reviewed afterwards; --strict-meta turns those warnings into exit 1.
# An alias-migration or factorization violation is NOT on that path: it is a
# hard error in both modes and nothing is written (see "Generator gate").
```

Once the live result is reviewed, refresh only the recorded roster exports and
their head anchor, then prove that the deterministic baseline replay reproduces
the same three generated files:

```bash
proof-blueprint search --with-sorry --spine --json --all \
  > proof-status/baseline/spine-sorry.json
proof-blueprint search --with-sorry --off-spine --json --all \
  > proof-status/baseline/offspine-sorry.json
git rev-parse HEAD > proof-status/baseline/base-head.txt
uv run python scripts/gen_obligation_registry.py generate \
  --baseline proof-status/baseline --out proof-status --strict-meta
```

This roster re-anchor does not refresh `baseline/axioms.txt`; that file is the
separately reviewed consumer-trust authority and moves only when the publish
target's accepted axiom closure intentionally changes.

A new obligation therefore needs two edits: regenerate (which assigns its ID),
then add the reviewed `obligations-meta.json` entry for that ID. `check` stays
red until both are done.

### Generator gate (W3-0c)

`generate` validates before it writes, and it writes only a registry that
passed. The order is: load the exports and the reviewed metadata, PLAN the
alias migrations, build the registry in memory, run `validate_meta` and the
live factorization check, and only then touch disk.

Two classes of violation, two behaviours:

- **Alias-migration and factorization violations are HARD errors in every
  mode.** `--strict-meta` has no say over them. Each is printed to stderr as
  `ERROR: factorization: <reason>`, followed by a one-line refusal summary, and
  the exit code is 1.
- **Ordinary reviewed-metadata join violations keep the soft path.** A missing
  meta entry, an orphan entry, a missing or unknown `prose_status` and a
  cluster disagreement are warnings that still write, and `--strict-meta` is
  the only thing that turns them into exit 1. That is the whole scope of the
  flag.

The hard gate is TRANSACTIONAL. When it fails, `obligations.json`,
`id-assignments.json` and `frontier-table.generated.md` keep the bytes they
had, and one that does not exist yet is not created — so a rejected rename
cannot retire an ID, cannot allocate a new one, and cannot leave a
half-migrated ledger behind. (Under `--fresh` the output directory itself is
still created before the gate runs, because it is the scratch parent the live
re-export writes into; none of the three generated files is written there.)

Materialization obeys the same rule: `build_registry` takes a `verified_ids`
argument and `generate` passes exactly the set the live check reports as
VERIFIED, so a `verified_at_build` stamp is only ever written onto a block that
passed live validation. An unverified block is never written to the registry.

This closes auditor finding #7468: before W3-0c the three files were written
BEFORE the violations were inspected, and the violations then shared the soft
warning path, so a default-mode `generate` exited 0 after retiring the old ID
and allocating a new one, or after stamping a block whose producer closure
carried `Lean.ofReduceNat`. The command-level fixtures in
`scripts/test_gen_obligation_registry_factorization.py` pin both scenarios in
both modes, with the ACTUAL renamed exports, comparing file bytes around the
call.

## Factorization entries (W3-0)

Phase 3 of the consolidation refactor ("cluster coordinators") gates on *every
old leaf has a machine-checked factorization entry in the obligation registry*.
The reviewed half is an OPTIONAL `factorization` block on an
`obligations-meta.json` entry, checked by
`scripts/gen_obligation_registry.py` against kernel-mined truth — never against
prose. The generated half is a normalized copy of that block MATERIALIZED onto
the matching `obligations.json` entry (section 2), so the canonical registry
carries every verified factorization itself.

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
  "consumer_trust": ["Lean.ofReduceBool"],
  "note": "free prose"
}
```

- `obligation_id` must name the entry's own ID.
- `transitive`, `consumer_trust` and `note` are optional; `schema`,
  `obligation_id`, `roles` and `pinned` are required. Any other key inside the
  block — or inside `roles`, `pinned` or a `transitive` row — is a metadata
  violation, as is an unknown `schema`. `consumer_trust` (W3-0e) is a v2 key
  only: inside a v1 block it is an unknown key.
- **Legacy v1.** A meta file with NO factorization block loads exactly as
  before. A block marked `"schema": "p97-factorization/v1"` is the same block
  WITHOUT the `pinned` digests: it still loads, it is counted as a WARNING
  (`v1_warnings`) in the check receipt, and it is NEVER reported as a verified
  factorization — without pinned digests nothing binds the block to the
  statements it claims to factor. A `pinned` key inside a v1 block is an
  unknown key, not a silent upgrade.

**Roles and via hops.** The five roles must be DISTINCT, exact, fully
qualified, PUBLIC declarations, each resolving to exactly one index record.
Resolution is `proof-blueprint search --name <symbol> --json --all --private`
filtered to an exact fully-qualified match (`--name` matches substrings, so the
exactness is imposed by the checker, not trusted from the query). Zero or more
than one record is ambiguous and is a violation; `private == true` is a
violation.

EVERY `via` declaration obeys exactly the same rule (W3-0b): a via hop that is
missing, ambiguous or private is a violation naming that via symbol, and a via
symbol equal to any of the five roles is a violation
(`transitive coordinator -> eliminator via[0] (Namespace.hop) is also the
producer role`). A via hop is a first-class vertex of the block: it is
resolved, freshness-checked, trust-checked and included in the cycle detection
exactly like a role.

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

**Cycles.** The direct-call relation RESTRICTED to the five role symbols UNION
every declared `via` declaration must be acyclic. Any cycle is a violation, and
the failure line names each vertex by its role or via label.

**Leaf identity.** `open_leaf` must be the registry entry's `lean_decl` (after
the alias migration below) and must have `has_sorry == true`. The pinned
`open_leaf` digest must equal its current digest ("open leaf statement
changed" otherwise), and the pinned `legacy_wrapper` digest must equal the
current digest of `legacy_wrapper`.

### 2. What the canonical registry carries (W3-0b)

`obligations.json` is the file downstream consumers read, so it CARRIES each
verified factorization rather than pointing at the reviewed file. `generate`
materializes a normalized copy of every reviewed v2 block onto its own registry
entry:

```json
"factorization": {
  "schema": "p97-factorization/v2",
  "roles": { "...the five roles..." },
  "transitive": [
    {"from": "coordinator", "to": "eliminator", "via": ["Namespace.hop"]}
  ],
  "pinned": { "...the two digests..." },
  "verified_at_build": "<current mined build fingerprint>"
}
```

- Keys are sorted, `transitive` rows are sorted (and the key is omitted when
  the reviewed block declares no rows); the `via` order inside a row is the
  path and is preserved.
- `obligation_id` and `note` are dropped: the ID is the key of the entry the
  block sits on, and prose is not machine-checkable.
- An entry whose reviewed metadata carries no v2 block gets NO `factorization`
  key, and a v1 block is never materialized (it is never a verified
  factorization). An entry whose block PASSED the live check of sections 3
  and 4 carries the materialized copy described in this section; the census
  line of `check` (section 5) reports how many reachable leaves are
  factorized.
- Only a block that PASSED the live check of sections 3 and 4 is materialized
  (W3-0c): `generate` hands `build_registry` the VERIFIED ID set, and an
  unverified block fails the generator gate rather than reaching the registry
  with a `verified_at_build` stamp.

`check` then compares the materialized block on the COMMITTED registry entry
with the normalized reviewed block stamped with the CURRENT build. Each of the
following is registry drift and exits 1 naming the ID and the differing key:

- the registry entry carries no materialized block for a reviewed v2 block;
- the registry entry carries a block the reviewed metadata does not declare;
- any field differs (`materialized factorization key 'roles' is … on the
  registry but … in the reviewed metadata`) — PRESENCE counts as well as value,
  so an optional key (`transitive`, `consumer_trust`) that only one side carries
  is drift even when both sides read back as `null`, and the side that does not
  carry the key at all is rendered `(absent)` (auditor #7524);
- `verified_at_build` is not the current mined build — including the case where
  the current build cannot be read at all, which is never treated as fresh.

The fix is always to regenerate:
`uv run python scripts/gen_obligation_registry.py generate --fresh --out proof-status`.
That run re-exports the ROSTER live and nothing else. The trust authority for a
`consumer_trust` declaration is the RECORDED closure in BOTH modes (auditor
#7524): `generate --baseline DIR` and `check` read `DIR/axioms.txt`, and
`generate --fresh --out OUT` reads `OUT/baseline/axioms.txt` — so the command
above gates against the reviewed `proof-status/baseline/axioms.txt`. No live
axioms export is ever consulted for trust, and a recorded closure that cannot be
read refuses the run BEFORE anything is written.

### 3. Stable identity and the alias migration

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

### 4. Freshness and trust

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

**Trust boundary (W3-0b).** Trust is decided by an EXPLICIT allowed baseline
and by nothing else:

```text
ALLOWED_AXIOMS = propext, Classical.choice, Quot.sound
CLEAN        := every axiom of the closure is in ALLOWED_AXIOMS
CONSUMER-OK  := every axiom is in ALLOWED_AXIOMS or is sorryAx
```

The tag `proof-blueprint axioms` prints next to an axiom is ADVISORY and is
never a trust decision: a `core`-tagged `Lean.ofReduceNat` is rejected exactly
like an untagged custom axiom. `Lean.ofReduceBool`, `Lean.trustCompiler`, any
custom axiom and any unknown name are forbidden on EVERY hop. Each violation
line prints the tag as advisory, e.g. `producer (…) axiom closure contains
Lean.ofReduceNat (tool tag 'core', advisory); the producer path must be kernel
clean`.

- **Producer path** — the `producer` itself and every `via` hop on the
  `coordinator -> producer` row — must be CLEAN.
- **Consumer side** — `legacy_wrapper`, `coordinator`, `eliminator` and every
  `via` hop on the `legacy_wrapper -> coordinator`,
  `coordinator -> eliminator` and `eliminator -> open_leaf` rows — must be
  CONSUMER-OK, and `sorryAx` is permitted on such a hop ONLY when that hop
  actually consumes the open leaf. Consumption is decided from the call graph,
  never from prose: a bounded backwards walk from `open_leaf` over `callers`,
  restricted to the role and `via` symbols. A consumer hop carrying `sorryAx`
  that does not reach the open leaf is reported as
  `<ID>: <role> carries sorryAx without consuming the open leaf`. A broken
  chain therefore reports one line per orphaned hop as well as the broken edge
  — under that call graph each of those hops really does carry an unexplained
  `sorryAx`.
- **The open leaf itself** (auditor #7462) — `open_leaf` is audited on the same
  boundary and must be CONSUMER-OK: `propext`, `Classical.choice`, `Quot.sound`
  and `sorryAx`, nothing else. `has_sorry == true` proves the leaf is OPEN; it
  does NOT prove the leaf adds nothing else, so an extra custom, native or
  unknown axiom on the leaf — whatever tag the tool prints — is reported as
  `<ID>: open_leaf (<Sym>) carries forbidden axiom <name>`. `sorryAx` is ALWAYS
  permitted there and is the one consumer-side case that needs no consumption
  justification: the leaf IS the open leaf every other consumer hop has to
  reach, so it consumes itself.

**Declared consumer trust (W3-0e).** A v2 block MAY carry one optional key,
`"consumer_trust": [<axiom name>, ...]` — a non-empty list of unique non-empty
strings. Only an ABSENT key declares nothing; a key that is present with any
other value, an explicit `null` included, is `<ID>: consumer_trust must be a
non-empty list of unique axiom names` (auditor #7518). A listed name is ACCEPTED only when all of the following
hold, and each failure prints its own violation line naming the ID and the
name:

- it is not `sorryAx` — an open obligation is never declarable trust;
- it is not already in `ALLOWED_AXIOMS` — such a name declares nothing;
- the publish target's RECORDED closure carries it. The trust authority is the
  reviewed `proof-blueprint axioms` export of `Problem97.erdos97_rhs`, kept in
  the repository under the name `axioms.txt`, in BOTH source modes (auditor
  #7524) — no live export is ever consulted for trust:
  - `generate --baseline DIR` and every `check` read `DIR/axioms.txt`
    (`proof-status/baseline/axioms.txt` for the committed baseline);
  - `generate --fresh --out OUT`, which cannot be given a baseline directory at
    all, reads `OUT/baseline/axioms.txt` — the same reviewed file, kept with the
    output tree the run is regenerating.

  A closure that could not be read — an absent or unparseable recorded file — is
  reported as `<ID>: cannot verify consumer_trust: the recorded closure
  <path>/axioms.txt could not be read` and accepts nothing. The message names
  the file and is the same in both modes. The rule is fail-closed, exactly like
  an unreadable build fingerprint, and under `generate` the hard gate refuses
  before `obligations.json`, `id-assignments.json` or
  `frontier-table.generated.md` is written.

An ACCEPTED name is acceptable on CONSUMER-SIDE hops ONLY: `legacy_wrapper`,
`coordinator`, `eliminator`, every `via` hop on the three consumer rows, and the
`open_leaf` audit. The producer path is UNCHANGED — the `producer` and every
`via` hop on the `coordinator -> producer` row must be CLEAN with no opt-in, and
the refusal there says `the producer path must be kernel clean; consumer_trust
does not apply to the producer path`. A consumer-hop refusal names the hop and
the axiom exactly as before and adds `unless the block declares it in
consumer_trust`. A declaration that NO consumer-side hop actually carries is
itself a violation (`<ID>: consumer_trust declares <name> but no consumer-side
hop carries it`), so the key cannot be a blanket widening; that one audit is
skipped only for a block whose consumer-side closure could not be read, which
already reports "cannot verify".

The key is MATERIALIZED onto the registry entry (sorted, omitted when the
reviewed block declares none), so an added, removed or drifted declaration is
registry drift like any other materialized field. `check_factorizations`
reports `"declared_trust": {"blocks": <n>, "axioms": [...]}` in its summary and
in the check receipt, and the console census line appends
`; <n> with declared consumer_trust (<names>)` when `n > 0`.

Why the key exists: the TwoSource consumer chain carries `Lean.ofReduceBool` and
`Lean.trustCompiler`, which enter it at `TwoSourceClosure.lean:2378` through the
U3 exact-radius audit certificate and propagate up to the legacy wrapper. The
publish target's recorded closure already carries both as core-allowed
native-reduction trust, while the producers and the open leaves of that cluster
are clean of the pair. `consumer_trust` records that per block, on the consumer
side only, instead of widening `ALLOWED_AXIOMS` for every hop of every cluster.

A `has_sorry` source scan is deliberately NOT used anywhere and is not
sufficient: it cannot see a `sorry` reached through a helper. The `axioms` exit
code is not trusted either — the tool exits nonzero for some symbols by design
— the printed closure lines are parsed instead, and that parse is STRICT
(auditor #7521): the header must be exactly
``axioms reported by `#print axioms <the symbol that was queried>` (<N>):`` with
a mandatory integer count, and exactly `N` indented entry lines must follow,
each an optional marker token plus a `core` / `core*` / `custom` tag plus a Lean
identifier, terminated by a blank line, an unindented line or EOF. A header
naming another symbol, a missing count, an entry line that does not match, and a
count that disagrees with the parsed lines are all refused and reported as
"cannot verify" rather than accepted as a closure.

All of this is read through one injectable seam (`FactorizationBackend`:
`resolve`, `callers`, `axioms`, `mined_build`, `current_build`).
`BlueprintBackend` backs it with the CLI plus the read-only database read;
`scripts/test_gen_obligation_registry_factorization.py` backs it with
dictionaries, so every adversarial case is exercised without touching live
data. A reviewed metadata file with no factorization block constructs no
backend at all and costs no extra CLI invocation.

### 5. Per-cluster requirement (fail-closed)

```bash
uv run python scripts/gen_obligation_registry.py check --baseline proof-status/baseline \
  --require-factorized TD
# exit 1 while any REACHABLE leaf of that cluster lacks a VERIFIED
# p97-factorization/v2 block, listing each ID by name
```

`--require-factorized` takes a cluster CODE (`R221`, `TA`, `TS`, `TD`, `B1`,
`X`) and is repeatable. The committed registry now carries a verified v2 block
for every reachable TD entry, so `--require-factorized TD` is expected to pass
when the live roster/build agrees. WITHOUT the flag a missing block never
fails: it is only counted, and the check prints `factorized k/n reachable
leaves`. This factorization status is bookkeeping and does not claim a leaf was
proved.

Every `check` receipt gains:

```json
"factorization": {
  "schema_versions": {"p97-factorization/v2": 1},
  "checked": 1, "verified": 1, "v1_warnings": 0, "missing": 27,
  "required_clusters": ["TD"], "violations": [],
  "registry_drift": [], "build_id": "<current mined build fingerprint>"
}
```

`checked` counts blocks examined, `verified` counts v2 blocks that passed every
check above, `v1_warnings` counts legacy v1 blocks (never verified), and
`missing` counts REACHABLE leaves carrying no block at all. `registry_drift`
holds the section-2 comparison against the committed registry and `build_id` is
the build every `verified_at_build` was compared with. A non-empty `violations`
OR `registry_drift` list fails the check (exit 1) whether or not
`--require-factorized` was passed.

### 6. Command-level test seams (W3-0b)

`main(argv, backend_factory=..., export_source=...)` in
`scripts/gen_obligation_registry.py` exposes two keyword-only seams so a test
can drive the REAL `generate` / `check` entry point over a COPY of
`proof-status` without reading live data:

- `backend_factory()` returns a `FactorizationBackend` (a `MappingBackend` in
  the tests) and is consulted only when a reviewed block actually needs one;
- `export_source()` returns the `(spine, offspine)` record lists that would
  otherwise be read from the baseline exports or re-exported live.

Both default to `None`, which is the live behaviour, and NEITHER can be set
from the command line — no CLI flag weakens the gate. The command-level
fixtures in `scripts/test_gen_obligation_registry_factorization.py` use them to
pin a rename on one entry of a copied `proof-status`, run `generate` and then
`check` on the copy, and assert that the roster shows no add/remove drift, that
the ID follows the new open leaf, that `id-assignments.json` in the copy gains
the alias record, and that a second `check` is byte-stable. The negative
fixture pins the same rename with a `legacy_wrapper` that is not the old name
and asserts exit 1 with `would allocate a new id` and an unchanged ledger.
Every receipt those fixtures write lands inside the copy.

The W3-0c fixtures reuse the same seams for the hard generator gate: a rejected
wrapper and a producer whose axiom closure carries `Lean.ofReduceNat`, each run
BOTH with and without `--strict-meta` over the ACTUAL renamed exports, asserting
exit 1 and the three generated files byte-unchanged around the call.

## Legacy import exceptions and dated graph (W3-0)

The Legacy compatibility-wrapper modules introduced by the cluster-coordinator
waves re-export across cluster boundaries by construction, so they need a
per-edge exception manifest rather than a waiver. This is the specification the
W3 lint author implements; the manifest itself is
`proof-status/legacy-import-exceptions.json`.

- **Schema** `legacy-import-exceptions/v1`.
- **Fields**
  - `base_head` — the git HEAD the manifest was authored against, checked as a
    claim git can refute (`base_head_binding_failure` in
    `scripts/lint_cluster_imports.py`): 8 lowercase hex characters, naming a
    commit that EXISTS in this repository (`git cat-file -e <base_head>^{commit}`),
    and that is an ancestor of — or equal to — HEAD
    (`git merge-base --is-ancestor <base_head> HEAD`, which is reflexive, so a
    manifest authored at the current HEAD passes). A `base_head` naming no
    commit, or naming a commit on a discarded line of history, pins the manifest
    to nothing; both failures are exit 2, because the manifest cannot be
    authenticated and the lint then does not run. Git is reached only through
    the module's `git_status` seam, and a git that cannot be run is a failure,
    not a pass.
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
      exception supersedes, or `null`. A non-null pair is a claim with three
      parts, and `waiver_pair_link_failure` checks all three: the pair must be
      a row of `import-waivers.json` — either a LIVE `waivers` row (the wrapper
      has landed, the direct edge is still there) or a `retired_waivers` row
      (the edge is gone); `waiver_pair[0]` must EQUAL this
      manifest row's own `from` (the cluster module that now reaches the
      retired target through the wrapper); and `waiver_pair[1]` must be a
      DIRECT header import of this row's `wrapper_module` (the retired target
      must really be reached through this wrapper). A wrapper module the tree
      scan never saw has no imports at all, so the third check fails closed
      rather than being skipped. Any of the three is exit 1. Only a pair that
      passes all three is credited with retiring its waiver row, so a
      misidentified pair cannot rename another wrapper's stale waiver. When the
      pair names a RETIRED row, a fourth part holds: that row's
      `retired_by_wrapper` must be this row's `wrapper_module`, and the link is
      checked in the other direction too — a retired row naming a wrapper must
      be named back by EXACTLY ONE manifest row carrying that `wrapper_module`
      (zero rows and two rows are both exit 1);
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

### Retired waivers

`import-waivers.json` is schema `import-waivers/v2`. Beside `waivers` it
carries `retired_waivers`, one row per waiver a wave has already retired, so a
retirement is a machine-checked record rather than prose in a commit message.
Retiring a waiver is a MOVE, not a delete, and the stale-waiver message says so:
it names `retired_wave`, `retired_head` and `retired_by_wrapper` instead of
telling the author to delete the row.

- **Row fields** (exactly these eight; any other key set is exit 1):
  - `from`, `to`, `class`, `reason`, `planned_retirement` — the waiver row as it
    stood when the edge was removed. `class` must be the class the FROZEN record
    recorded for the pair, so a retired row cannot rewrite the history it
    preserves;
  - `retired_wave` — one of `W1b`, `W2`, `W3`, `W4`. `unassigned` is rejected:
    a plan may leave a live row unassigned, but a retirement that happened was
    carried out by some wave;
  - `retired_head` — the 8-lowercase-hex commit that removed the edge, bound to
    history through the same `base_head_binding_failure` and `git_status` seam
    the Legacy manifest's `base_head` uses (the commit must exist and be an
    ancestor of, or equal to, HEAD). A malformed, unknown or unreachable value
    is a ROW failure, exit 1: the lint can still run, so the rest of the file is
    still checked;
  - `retired_by_wrapper` — the Legacy wrapper the edge now runs through, or
    `null` when the edge was simply deleted. A non-null value must be a module
    under `Erdos9796Proof.P97.ATail.FrontierLiveClosure.Legacy` that the tree
    scan saw and that DIRECTLY imports the retired `to`, and exactly one
    `legacy-import-exceptions.json` row must name the pair back through
    `waiver_pair` with that same `wrapper_module`.
- **Closed world.** `waivers` and `retired_waivers` together cover the frozen
  record: every forbidden pair of `cluster-import-edges.json` must appear in
  exactly one of the two lists. A pair in neither is exit 1
  (`frozen forbidden pair X -> Y is neither waived nor retired`), and so is a
  pair in both. Before v2 a deleted waiver row left no trace at all, so the
  frozen record's forbidden pairs and the waiver file could drift apart in
  silence.
- **Refutable by the tree.** A retired pair whose edge is present again in the
  live tree fails, and the message gives the file and line where it came back.
  A retirement is therefore not a licence to re-add the edge.
- **Summary.** `summary.retired_waivers` and `summary.by_retired_wave` are
  recomputed and compared exactly like `summary.waivers`,
  `summary.by_class` and `summary.by_planned_retirement`.
- **Reporting.** The OK line ends `...; R retired; L legacy edges, all listed.`;
  `--list-waived` prints a `retired waivers (R):` section with each pair, wave,
  head and wrapper (`-` when null); `--json` carries the rows under
  `retired_waivers` with the authenticated count in
  `retired_waivers_authenticated`. `--write-record` is untouched: it reads the
  tree and HEAD alone and never opens the waiver file.
- **Recorded retirements.** Five rows are authenticated by the lint. W1b
  retired `TwoDeletionCollision -> B1Live`; W3 retired
  `Rigid221Placement -> TwoDeletionCollision` through
  `Legacy.TwoDeletionWrappers` and `TriApexEndpointRetainedOmission ->
  Rigid221Closure` through `Legacy.Rigid221Wrappers`; W4 retired both
  `FreshThirdPinnedFanPacket -> TriApexEndpointRetainedOmission` directly and
  `TwoSourceCanonicalSurface -> TriApexEndpointRetainedOmission` through
  `Legacy.TriApexWrappers`. At source commit `bef49689` the linter authenticates
  25 live waivers, 5 retired waivers, and all 7 listed Legacy edges.
- **Tests.** `scripts/test_lint_cluster_imports_legacy.py` covers each rule
  above against synthetic fixture trees and a throwaway fixture git repository;
  no test reads this repository's records.
