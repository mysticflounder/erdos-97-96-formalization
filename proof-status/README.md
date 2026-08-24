# proof-status — generated obligation registry (consolidation refactor)

Program: docs/audits/2026-08-23-consolidation-refactor-audit.md, lane
`consolidation-refactor-20260823`. Everything here except `obligations-meta.json`
is generated; do not hand-edit generated files.

## Files

- `obligations.json` — the obligation registry (`p97-obligation-registry/v1`),
  generated from the built spine: one entry per open declaration (28 reachable +
  6 off-spine at the recorded `source_head`), with stable IDs.
- `id-assignments.json` — authoritative symbol→ID ledger. IDs never change or get
  reissued; vanished symbols move to its `retired` map.
- `obligations-meta.json` — the ONE hand-reviewed file: per-ID cluster, packet,
  controlled prose_status vocabulary (see the audit), citations.
- `frontier-table.generated.md` — README-shaped frontier table, generated.
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
# exit 0 = live roster matches the registry; exit 1 = drift; exit 2 = operational error (retry once)

uv run python scripts/lint_cluster_imports.py
# exit 0 = no NEW cross-cluster import under FrontierLiveClosure/ (existing edges are waived)
```

Regenerate after an intentional roster change:

```bash
uv run python scripts/gen_obligation_registry.py generate --baseline proof-status/baseline --out proof-status
```
