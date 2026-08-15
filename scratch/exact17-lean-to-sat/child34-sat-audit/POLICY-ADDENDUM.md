# Child34 reconciliation-policy addendum

Date: 2026-08-13. Read-only policy audit; no production files changed.

## Correct classification

`submission_mode=reconciled_after_prepare_response_failure` is an allowed,
fail-closed custody recovery under the current exact17 runner. It is not, by
itself, a production-promotion blocker. The earlier `REPORT.md` called it a
possible strict-gate blocker; this addendum supersedes that conditional
wording after tracing the governing route and tests.

The relevant distinction is:

- Submission-response reconciliation recovers one already-created job by
  known job ID, without submitting again.
- A solver/run recovery or replacement is forbidden for promotion. The live
  child34 terminal has `run_epoch=1`, `recovery_action=null`, one attested
  solver process, and the PIQD database contains exactly one matching job.

## Governing text and implementation

- `docs/p97-piqd-exact17-onboarding-plan-2026-08-09.md:751-756` says the
  known-job recovery path revalidates intent, status, and both stored inputs
  before direct job-ID confirmation; recovery is fail-closed when no job ID or
  identity lookup exists.
- `docs/computational-closure-plan-2026-07-28.md:10864-10875` records the
  prepare-response schema failure, explicitly authorizes recovery by known job
  ID and direct confirmation, and says “do not submit another.”
- `scripts/run_piqd_exact17_thirty_second_root.py:1673-1760` implements this
  path: it requires a job ID and persisted intent, refuses existing local
  custody, revalidates live identity/status, and compares PIQD CNF and manifest
  bytes to held intended snapshots before writing the reconciled record.
- `scripts/run_piqd_exact17_thirty_second_root.py:1066-1068` explicitly accepts
  `reconciled_after_prepare_response_failure` only with canonical binding and
  `submitted=null`. Finalization calls the same prepared-record checker; there
  is no hidden rejection of this mode.
- `scripts/run_piqd_exact17_thirty_second_root.py:813-860` is the terminal
  promotion guard: it requires the exact identity, epoch 0 for prepared/
  confirmed and epoch 1 for terminal states, and an explicit null
  `recovery_action`. `scripts/run_piqd_exact17_thirty_second_root.py:1183-1198`
  separately requires the one-process
  attestation and log hash. Neither guard treats submission-mode reconciliation
  as solver recovery.
- Focused tests pass: `28 passed, 184 deselected` in
  `reconciliation-policy-tests.txt`. In particular,
  `scripts/test_run_piqd_exact17_thirty_second_root.py:969-1001` verifies
  response-loss reconciliation confirms the same job with exactly one submit
  and one confirm; lines 953-966 verify an existing/unattributable job is
  never resubmitted; lines 829-860 reject every non-null or omitted terminal
  `recovery_action`.

## Smallest compliant remedy

No clean rerun is required or desirable. Preserve the current prepared,
reconcile, state, final, model, and log artifacts, and record the policy
disposition that known-job prepare-response reconciliation is permitted while
terminal `recovery_action` must remain null. A rerun would need a new identity
and a fresh job; reusing this identity would contradict the runner's
no-resubmit guard and the documented “do not submit another” rule.

## Use of the SAT model

The independently replayed SAT model remains usable solely as finite theorem
discovery evidence. The closure plan requires exact replay of every clause and
then wave-only mining before a source bridge; the model is not a counterexample
and does not close exact17. Child34's final artifact itself sets
`next_gate=mandatory_general_theorem_search`, `ce_scope=null`, and
`announcement=NONE`. Any mined motif still needs a source-valid Lean bridge
before promotion.
