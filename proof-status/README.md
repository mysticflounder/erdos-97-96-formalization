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
  reissued; vanished symbols move to its `retired` map.
- `obligations-meta.json` — the ONE hand-reviewed file (a JSON object keyed by
  obligation ID): per-ID cluster, packet, controlled `prose_status` vocabulary,
  citations. The generator reads this file by name; the join is validated on
  every `check` (see "Metadata validation" below).
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
- `cluster-import-edges.json` / `import-waivers.json` — frozen import graph of
  `FrontierLiveClosure/` and the waived pre-existing forbidden edges (with
  planned retirement phases).
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

uv run python scripts/lint_cluster_imports.py
# exit 0 = no NEW cross-cluster import under FrontierLiveClosure/ (existing edges are waived)
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
