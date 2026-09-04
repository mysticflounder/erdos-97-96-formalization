# Exact-five opposed-turn residual named-core internal prelaunch audit

## Verdict

PASS for prelaunch readiness. This audit covers custody and readiness only; no
target PIQD solver cell was launched and no theorem, source-realization, Lean,
promotion, or live-closure claim is made.

## Evidence

- The lane checkpoint is
  `.codex/worktree-checkpoints/exactfive-opposed-turn-residual-named-core-20260903.json`,
  with base head `47d9d140eb65434f336788f1caf093e98e36d7a6` and self-hash
  `c2970de5660e1a84a6fc908035f5096a9eb11f412e162a381d760a8a56d19503`.
- The refreshed pristine run root
  `scratch/runs/exactfive-opposed-turn-residual-named-core-20260903/run-0001`
  contains only `run_manifest.json`, `artifacts/`, `events/`, and `tmp/`.
  Its manifest binds the current implementation, test, specification, runner,
  checkpoint, adapter, parent producer, and all eleven parent result/event
  inputs. Manifest self-hash is
  `64df3eb804b1ee74f8edcd156a55ab47705426bd99d59e0d99dd17d7fb8aa9ad`.
- Two consecutive default CLI `--init-only` replays exited 0 with empty
  stdout/stderr. They contacted no PIQD server and created no solver session.
- Parent run-0005 authentication reconstructs the parent result trees and
  terminal `TARGET_INCONCLUSIVE`, with producer hash
  `47a1fbb12d337877197c0293694dcb1d38796b564161f491cef9b209db81a856`,
  parent manifest hash `c93b7bcf02abb8b90676470863aa8a60210652d6a2edea3ea5e70d93463c2deb`,
  launch hash `f5fc5ad777c026765051d23b060cf1722c11a6bc25e74408d3bd27ae642d27ad`,
  and terminal hash `eabfb133d705fc82582d4fd35d2814050f58b4fcc405a1218336f1a4bf4ab485`.
- Formula-family custody records exact assertion collapse `360=467` and
  `363=376=470=483`. Counts are 237 assertion occurrences/233 unique for the
  first family and 303/299 for the second; representatives are 360 and 363.
- Named ledgers bind 236 assumptions for representative 360 and 302 for 363:
  one normalization group, 13 row equalities, one radius disequality, one
  source-strict inequality, and the strict signed-area entries. Expansion is
  checked against the unguarded source assertion multiset.
- The query plan has eight fresh single-solver cells: Z3 and cvc5 controls plus
  one target per representative per solver. Controls, SAT exact-rational
  replay, nonempty nonterminal UNSAT core custody, UNKNOWN, unreconciled
  transport loss, fresh-session identity, resume, terminal replay, failure
  custody, and strict inventory mutations are covered by the lane tests.
- The focused suite reports `46 passed in 68.52s`; Ruff reports `All checks
  passed!`. The implementation contains no direct subprocess solver launch and
  routes execution through the maintained PIQD HTTP SMT adapter.

## Hygiene

The read-only lane hygiene report has `issues: 0`. Its global `blocking: true`
is caused by shared-worktree entries (foreign dirty paths and unrelated
unregistered/generated or durable-untracked paths), not by this audit lane.

This audit owns only its checkpoint and this document. No implementation files
were modified, no generated roots are declared, and nothing was staged or
committed.
