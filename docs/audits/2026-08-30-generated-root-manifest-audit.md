<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Generated-root manifest audit — 2026-08-30

- Date: 2026-08-30 (America/Los_Angeles)
- Audit lane: `generated-root-manifest-repair-20260830`
- Base HEAD: `c5b7259dced01866935a38de2c1e2994e5786ee8`
- Scope: the 13 roots in the opening audit census; declarations created by
  concurrent lanes after that census are outside this audit
- Status: 12 of 13 declarations resolved; one retained root is blocked on
  missing source data

This is a dated custody audit, not a current proof-status or dispatch
authority. It changes no mathematical result and authorizes no theorem
promotion.

## Outcome

The initial 13-root list was produced by checking only for
`run_manifest.json`. The repository hygiene checker accepts both that standard
name and the governed P97 name `run-manifest.json`. Six roots already had valid
P97 manifests and required no repair.

Of the remaining seven declarations:

- two populated export roots remain needed and now have reconstructed,
  validated standard manifests;
- four absent, empty, or superseded roots were removed from their checkpoint
  `generated_roots` arrays; and
- one planned V8 refrozen portfolio remains declared but cannot receive an
  honest manifest because its output root and most of its source packet are
  absent.

No payload file or directory was deleted. The only payload-side additions are
the two standard manifests for retained export roots.

## Disposition of the 13 roots

| # | Declared root | Finding and action |
|---:|---|---|
| 1 | `firstnonhit-all-large-caps-v4/n17-one-shot-audit-approved` | Retained unchanged. Its governed `run-manifest.json` is accepted and the lane hygiene check passes. |
| 2 | `firstnonhit-cap-endpoint-v3/n17-one-shot-audit-approved` | Retained unchanged. Its governed `run-manifest.json` is accepted and the lane hygiene check passes. |
| 3 | `firstnonhit-common-only-v7/n17-one-shot-audit-approved` | Retained unchanged. Its governed `run-manifest.json` is accepted and the lane hygiene check passes. |
| 4 | `firstnonhit-common-payload-v6/n17-one-shot-audit-approved` | Retained unchanged. Its governed `run-manifest.json` is accepted and the lane hygiene check passes. |
| 5 | `firstnonhit-complete-cnf-v2/n17-one-shot-audit-approved` | Retained unchanged. Its governed `run-manifest.json` is accepted and the lane hygiene check passes. |
| 6 | `firstnonhit-overlap-v5/n17-one-shot-audit-approved` | Retained unchanged. Its governed `run-manifest.json` is accepted and the lane hygiene check passes. |
| 7 | `exact17-canary-perp-bisector-model-refinements-preparer-20260822/preparation-v1` | Retired from the checkpoint. The root is absent, has no retained receipt or consumer, and three already-missing owned paths were pruned from the same checkpoint. The three extant preparer scripts remain durable. |
| 8 | `exact17-forty-ninth-wave-v5-five-size8-20260817/export-v1` | Retained. The 12-file, 339,168,014-byte export has `PASS` validation and `PROVISIONED` publication receipts. A standard manifest was reconstructed from the present source, input, and receipt hashes. |
| 9 | `exact17-forty-ninth-wave-v6-five-size8-20260817/export-v1` | Retained. The 9-file, 338,942,684-byte export has `PASS` validation and `PROVISIONED` publication receipts. A standard manifest was reconstructed, and custody moved from the publication checkpoint to the checkpoint whose lane ID matches the root. |
| 10 | `exact17-v8-canary-diagnostic-mine-20260824/canary-a785104c` | Retired from the checkpoint. The root is empty, its two declared result files were already absent, and the canonical route records this canary as historical diagnostic work rather than an authorized production run. |
| 11 | `piqd-scratch-ignore-audit-20260815/` | Retired from the legacy checkpoint. The root is absent and has no run evidence. Missing modern checkpoint fields were not fabricated. |
| 12 | `scratch-runs-cleanup-20260824/cleanup-v1` | Retired as a generated root. It contains only the 25,438-byte `cleanup.py` prototype, which remains declared as durable evidence and is protected by the later preservation closure. |
| 13 | `exact17-canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-sat-portfolio-v8-refrozen-20260824/sat-profile-portfolio-v8-refrozen` | Retained but blocked. The output root is absent. The nearest surviving source packet authenticates only 6 of 237 dependencies; 3 mismatch and 228 are missing. A manifest was not fabricated. |

All shortened roots in the table are below `scratch/runs/`.

## Reconstructed manifests

The retained export manifests are:

- `scratch/runs/exact17-forty-ninth-wave-v5-five-size8-20260817/export-v1/run_manifest.json`
  with manifest SHA-256
  `97a0641267eedf15b8c5e4e54f1008ad542c27c36c8983858516114b7644742b`;
- `scratch/runs/exact17-forty-ninth-wave-v6-five-size8-20260817/export-v1/run_manifest.json`
  with manifest SHA-256
  `67fafd5f671a1495254d7fac133d374de86c5813b689539c87bf0f92c358b10d`.

Each manifest binds the matching lane checkpoint base HEAD, the source files
used by the publisher and validator, the preceding-wave CNF input, and the
retained export evidence. The manifests describe existing artifacts; no
publisher or solver was rerun.

## Remaining blocker and replay scope

The refrozen V8 root is still the canonical next-run target, so removing its
declaration would erase useful custody intent. Its runner creates the campaign
and per-cell records together with the run manifest; creating only a manifest
would falsely claim that those outputs exist.

The missing 228 dependencies account for about 26.3 GB of source packet data.
Restoring that packet and rebuilding the governed 76-cell portfolio would use
roughly 52 GB across inputs and generated outputs. This is portfolio
reconstruction, not a requirement to solve or replay all 76 cells.

The immediate authorized execution is one fresh official center-2,
physical-`none` V8 canary under the repaired and refrozen identities. If that
canary returns a SAT assignment, independent exact replay must check the
assignment against all 7,409,845 physical-cell clauses. A complete official
wave-only theorem mine must then run on the accepted result. Only those gates
may authorize V9 promotion or execution of the other 75 V8 cells.

The earlier V8-labelled diagnostic canary already passed its clause replay,
but its pre-repair miner did not bind the V8 runner's private base-module
contract. It therefore remains theorem-discovery material rather than
production evidence. Source recovery, portfolio reconstruction, the single
official canary, its independent replay, and the wave-only mine are a separate
storage and execution decision, not a manifest-only repair.

## Validation

The final census over the frozen 13-root input accepted either manifest
filename and reports only the refrozen V8 root above as unresolved. A later
whole-worktree rerun also reports
`scratch/runs/b1-exact12-structural-20260830/wave-6`, which a concurrent lane
declared after this audit began. That active lane is outside this audit and was
left untouched. Exact staged hygiene checks pass for:

- all six retained `firstnonhit-*` lanes;
- both retained forty-ninth-wave export lanes;
- the retired model-preparer, V8 diagnostic, and cleanup lanes; and
- the V6 publication checkpoint after removal of its mismatched declaration.

The legacy PIQD checkpoint predates the current checkpoint schema. This audit
removed its stale root declaration but deliberately did not invent historical
owner, base, time, or self-hash fields.
