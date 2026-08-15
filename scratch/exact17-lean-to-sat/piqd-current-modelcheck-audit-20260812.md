# PIQD SAT model-check / runner-custody audit (2026-08-12)

## Scope and verdict

Read-only audit of `/Users/adam/projects/rustprojects/piqd`. The piqd
subdirectory is at clean `3e538c0` (`feat(piqd): check that a SAT model
satisfies the CNF it came from`); the superproject has unrelated uncommitted
`piqc/` files. The new model-check code is therefore committed HEAD, not a
working-tree diff.

**Verdict: HOLD child32 / the next exact17 CEGAR wave.** CNF byte custody,
clause evaluation, and SQLite claim locking are sound in the inspected path,
but malformed SAT-log input can be promoted as a satisfying model, and a
restart or retry can leave a stale/missing model-check row. Those are custody
and fail-closed gaps, not merely test omissions.

Severity below is relative to using `POSSIBLE_COUNTEREXAMPLE` as a trusted
child32 input.

## Findings

| ID | Severity | Finding | Blocks child32? |
|---|---|---|---|
| F1 | **HIGH** | The model parser is permissive where the model-check path needs fail-closed parsing. `parse_model_assignment` accepts every `v` line, silently drops non-integer tokens, and does not require a terminating `0` (`piqd/src/dimacs.rs:386-408`). `require_sound_model` checks only count and duplicate absolute variables (`piqd/src/http/model.rs:40-58,80-157`); it never checks `1 <= abs(lit) <= header.num_vars`. An out-of-range variable can therefore displace a declared variable while preserving the expected list length, so the gate can report a complete model that actually omits a declared variable. | **YES** |
| F2 | **HIGH** | Out-of-range literals are not bounded before evaluator allocation. `index_assignment` allocates through the maximum assignment variable (`piqd/src/modelcheck.rs:105-131`) rather than the verified CNF header. A syntactically accepted large variable can cause excessive allocation/OOM; a normal undeclared variable is instead reported as `INCOMPLETE`, even though the row says the model passed the declared-width check (`piqd/src/modelcheck.rs:336-347`). Runner `spawn_blocking` errors/panics are only logged (`piqd/src/runner.rs:542-551`), so this can leave no `ERROR` model-check row. | **YES** |
| F3 | **HIGH** | Retry leaves old findings attached to a new run. `reset_to_prepared` clears the job's result, blob, and run fields but does not delete/invalidate `model_checks` (`piqd/src/db/jobs.rs:273-287`). UNKNOWN re-submission invokes that reset (`piqd/src/http/prepare.rs:219-243`). `GET /model-checks`, `GET /jobs/:id/model-check`, and `POST .../announced` use the row without requiring the current job to still be terminal SAT or the row hash to match the current run (`piqd/src/http/model_check.rs:85-102,147-199`). A stale `POSSIBLE_COUNTEREXAMPLE` can therefore remain outstanding/announceable while the job is prepared or being rerun. | **YES** |
| F4 | **HIGH** | SAT status is committed before checking, with no recovery sweep. Runner intentionally calls `set_completed` and only then starts `check_and_record` (`piqd/src/runner.rs:521-545`). A daemon crash in that interval leaves `jobs.result = SAT` and no check; startup only resets `running` jobs to `confirmed` (`piqd/src/main.rs:108-118; piqd/src/db/jobs.rs:290-302`). Check failure/panic is logged, not represented in job state or a durable `ERROR` row (`piqd/src/runner.rs:547-551`). This is safe against falsely changing `jobs.result`, but not fail-closed for “every SAT has a checked model.” | **YES** if child32 consumes SAT without an explicit “checked” gate; otherwise a required recovery item. |
| F5 | **MEDIUM** | Model-check provenance is incomplete. `ModelCheck` persists job/project/CNF hash, outcome, clause data, counts, scope, and timestamps, but no assignment/model digest, log-tail digest, solver-run token, or snapshot identity (`piqd/src/db/model_checks.rs:27-71; piqd/src/db/schema.rs:308-345`). UPSERT is keyed only by `job_id` and resets `announced_at` (`piqd/src/db/model_checks.rs:82-109`), so concurrent manual/retry checks are last-writer-wins and cannot identify which run's model was checked. | **YES** for proof-carrying CE provenance; otherwise MEDIUM follow-up. |
| F6 | **LOW** | Announcement custody accepts `NONE`, even though `NONE` is never outstanding and therefore has no finding to announce (`piqd/src/http/model_check.rs:178-199; piqd/src/db/model_checks.rs:142-158`). `ERROR` is deliberately outstanding and announceable so a maintainer can retire a checker failure after resolving it; that behavior is intentional, not a soundness defect. | **NO** |
| F7 | **MEDIUM** | Recheck and retry are not serialized by a run identity. The POST recheck checks SAT, drops its connection, then calls `check_and_record`, which reloads the job (`piqd/src/http/model_check.rs:114-145; piqd/src/modelcheck.rs:233-267`). A reset/new run can occur between those operations; the resulting row can be an ERROR for the old state or be overwritten by a later run. F3/F5 make this observable rather than merely theoretical. | **YES** until F3/F5 or an equivalent run-token transaction is fixed. |

## Verified strengths

* **DIMACS/CNF semantics:** `validate_dimacs` and `for_each_clause` enforce a
  single `p cnf` header, representable/in-range literals, zero-terminated
  clauses, and declared clause count (`piqd/src/dimacs.rs:128-327`). Empty,
  partial, false, and satisfied-literal precedence are covered by evaluator
  tests (`piqd/src/modelcheck.rs:354-435`).
* **Partial versus total handling:** evaluator semantics are correct: a clause
  with no true literal and an unassigned variable is `INCOMPLETE`, while all
  assigned-false is `UNSATISFIED` (`piqd/src/modelcheck.rs:134-195`). The HTTP
  model route separately requires exactly one value per declared variable, but
  F1 shows that “one value” is not currently “one declared variable.”
* **CNF byte identity:** the runner snapshots and verifies the blob before
  solver execution and re-verifies after execution (`piqd/src/runner.rs:196-225,
  336-359`). The model checker reads the content-addressed blob with
  `read_verified` (`piqd/src/modelcheck.rs:272-280`). This protects against a
  changed CNF being silently checked under the old hash.
* **Claim concurrency:** `claim_next_confirmed` uses `BEGIN IMMEDIATE` and a
  conditional status update (`piqd/src/db/jobs.rs:205-243`), so worker races do
  not claim the same confirmed job. Per-job log truncation/start stamping also
  separates runs (`piqd/src/runner.rs:94-130`). This does not solve the
  post-completion/retry races above.
* **Promotion ordering:** model checking never rewrites `jobs.result`; an
  evaluated SAT model becomes `POSSIBLE_COUNTEREXAMPLE` only after a complete
  satisfied evaluation and only when project `ce_scope` exists
  (`piqd/src/modelcheck.rs:290-351`). This is a good separation of solver
  verdict and arithmetic adjudication, but F4 means the separation lacks a
  durable “check completed” gate.

## Test evidence and missing coverage

Read-only commands run from the Rust workspace:

* `cargo test -p piqd modelcheck -- --nocapture`: **7 passed**, 0 failed.
* `cargo test -p piqd dimacs::tests -- --nocapture`: **24 passed**, 0 failed.

These tests cover valid parser examples and evaluator cases, but no test
covers malformed `v` tokens, missing terminators, undeclared variables, huge
variables, runner completion/check crash recovery, stale rows after
`reset_to_prepared`, concurrent recheck versus retry, or API announcement of
`NONE`. Add the blocking cases before child32.

## Minimum release gate

1. Make model parsing reject malformed tokens, require a terminating `0`, and
   validate every literal against the CNF header before allocation; bound the
   evaluator by header width.
2. Invalidate/delete model-check rows on retry/reset, and require current
   terminal SAT plus matching blob/run identity on read/announce.
3. Persist a model/log digest and run token; make post-SAT checking restartable
   (or make an un-checked SAT state durable) and record failures durably.
4. Refuse the meaningless `POST .../announced` transition for `NONE`, and add
   integration/race/recovery tests for the blocking findings above.
