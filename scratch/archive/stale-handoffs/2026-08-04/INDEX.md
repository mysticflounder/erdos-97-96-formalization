# Archived scratch handoffs

These files are retained for provenance but are no longer current project
state. They had no references from the live docs, Lean sources, or certificate
registries at the time of archival.

| Original path | Reason archived |
|---|---|
| `scratch/current-status-20260802.txt` | Superseded repository-status snapshot. |
| `scratch/post-push-status.txt` | Large pre/post-push status capture; superseded. |
| `scratch/staged-lean-name-status.txt` | Old staging-name snapshot. |
| `scratch/post11320_status.txt` | Old symbol-window status excerpt. |
| `scratch/run-tmp/obligation-census-status-20260725.txt` | July obligation dashboard superseded by later inventories. |
| `scratch/p97-open-leaf-cardinality-support-2026-07-30/status-current.txt` | Failed/stale-index lane dashboard. |
| `scratch/audit_refresh_latest.txt` | July audit superseded by the August audit refresh. |

## Round 2 (worktree-hygiene sweep, later same day)

Confirmed via `diff`/`diff -q` — not guessed — to be either byte-identical
duplicates or pure contiguous-subset matches with zero unique content versus
another file that stays live in `scratch/`.

| Original path | Reason archived |
|---|---|
| `scratch/actual_line_sorries.txt` | Strict subset of `scratch/sorry-body-lines-20260804.txt` (later capture). |
| `scratch/actual_sorry_by_file.txt` | Byte-identical (sorted) to `scratch/sorry-body-counts-20260804.txt`. |
| `scratch/current-spine-20260804.txt` | Same spine tree as `scratch/spine-after-inventory-20260804.txt`, missing only a header/tag. |
| `scratch/spine_now.txt` | 2-line diff (one ownership tag) vs `scratch/spine-after-inventory-20260804.txt`. |
| `scratch/proof-blueprint-spine-20260804.txt` | Byte-identical to `scratch/spine-after-inventory-20260804.txt`. |
| `scratch/spine_files_now.txt` | Byte-identical to `scratch/spine-files-20260804.txt`. |
| `scratch/verify_publish_sorries.txt` | Byte-identical to `scratch/verify-publish-20260804.txt`. |
| `scratch/untracked-lean-inventory-refresh.txt` | Byte-identical to `scratch/untracked-lean-inventory-raw.txt`. |
| `scratch/excluded-untracked-lean.txt` | Byte-identical to `scratch/untracked-lean-inventory-raw.txt`. |
| `scratch/left-disposable-lean.txt` | Byte-identical to `scratch/final-left-disposable-lean.txt` (canonical name). |
| `scratch/v3_core_audit_lean_skill.txt` | Byte-identical to `scratch/lean_usage_skill.txt`; mislabeled under an unrelated topic name. |
| `scratch/symbols-sorry-20260804.txt` | Byte-identical to `scratch/current-sorry-symbols-20260804.txt` (later mtime). |
| `scratch/current-freshthird-block.txt` | Exact contiguous subset of `scratch/current-freshthird-10340-11440.txt`. |
| `scratch/cap-mutual-later.txt` | Exact contiguous subset of `scratch/mutual-context.txt`. |
| `scratch/key-lemmas-9680-10190.txt` | Exact contiguous subset of `scratch/pre-residual-producers.txt`. |
| `scratch/terminal-8120-9055.txt` | Exact contiguous subset of `scratch/pre-residual-producers.txt`. |
| `scratch/two-cap-defs.txt` | Exact contiguous subset of `scratch/pre-residual-producers.txt`. |
| `scratch/first-fiber-terminal-source.txt` | Exact contiguous subset of `scratch/current-first-fiber-window.txt`. |
| `scratch/old-freshthird-main-20260803.txt` | Exact contiguous subset of `scratch/downstream-freshthird-terminals.txt`. |
| `scratch/frontier-override-closures.txt` | Exact contiguous subset of `scratch/frontier-firstfiber-late-window.txt`. |
| `scratch/frontier-override-window.txt` | Exact prefix subset of `scratch/frontier-firstfiber-late-window.txt`. |
| `scratch/frontier-branch-window.txt` | Exact contiguous subset of `scratch/frontier-after-core.txt`. |
| `scratch/frontier-bridge-later.txt` | Exact contiguous subset of `scratch/frontier-after-core.txt`. |
| `scratch/frontier-normal-form.txt` | Exact contiguous subset of `scratch/frontier-core-window.txt`. |
| `scratch/terminal-region.txt` | Contiguous subset of `scratch/later-terminals.txt` (remaining lines are boundary continuation). |
| `scratch/current-shared-blocker-defs-20260803.txt` | Contiguous subset of `scratch/shared-blocker-role-context-20260803.txt` (boundary continuation). |
| `scratch/frontier-freshthird-window.txt` | In-order line match (pure deletions only) vs `scratch/frontier-freshthird-window-20260803.txt`. |
| `scratch/q1-power-search/REPORT.txt` | Self-declared `# STALE — invalid shifted QQ certificate metrics` (e2 substitution typo); superseded by `scratch/q1-power-search/compact_shifted_relation.txt` and the already-tracked `x_subst_qq_corrected.out`. |

The original directory structure is preserved below this directory.
