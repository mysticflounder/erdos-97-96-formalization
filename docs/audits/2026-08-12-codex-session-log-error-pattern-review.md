# Codex Session Log Error-Pattern Review — 2026-08-12

This audit reviews the Codex session logs written while work on this project
ran, and identifies the error sources that occur again and again. The audit is
a process review. It does not review the mathematics, and it does not change
the proof spine, the closure plan, or any Lean source.

The audit answers one question: which mistakes did the agent fleet repeat, and
how large is each one?

## Corpus

| Property | Value |
| --- | --- |
| Rollout logs | 4,699 |
| Total size | 35,952,109,749 bytes (33.48 GiB) |
| Period | 2026-07-01 to 2026-08-12 |
| Root (human-driven) sessions | 67 (37 `exec`, 30 `cli`) |
| Subagent sessions | 4,632 |
| Subagent roles | 3,440 `chore`, 690 unlabelled, 218 `worker`, 133 `guardian`, 82 `default`, 69 `explorer` |
| Live shell calls | 402,916 |
| Measured shell wall time | 187.6 h (process scan) / 198.5 h (Lean scan) |
| Human turns | 3,814 (2,757 unique; 1,623 unique short instructions) |
| Assistant-authored records | 1,061,115, giving 73,499 unique utterances (39.3 M chars) |

The logs are at `~/.codex/sessions/YYYY/MM/DD/rollout-*.jsonl`. A session
belongs to this project when the `session_meta` record has
`cwd = /Users/adam/projects/math-projects/erdos-97-96-formalization`.

## Method

Four independent scans ran over the full corpus: Lean and Lake failures,
solver and encoding failures, epistemic failures (overclaim and retraction),
and process, tooling, and coordination failures. Each scan used a literal
`grep` prefilter over the raw JSONL, then `jq` on the matching lines only.

The counting unit is **distinct sessions**, not raw match count. A single
session that loops on one error cannot dominate a rank.

### Counting hazards

A naive `grep` over this corpus gives wrong numbers. Three effects inflate the
counts. All figures in this audit are corrected for them.

1. **Seeded transcripts.** A subagent rollout starts with a copy of the parent
   transcript. Each copied record carries the child's start time. Example:
   `patch_apply_end` is 691,422 seeded against 28,381 live. Before the
   correction, one scan reported "470 sessions edited
   `census/atail_force/__init__.py`". The true number is a handful.
2. **Replayed messages.** A resumed thread re-emits the parent `agent_message`
   history with fresh timestamps. Measured amplification is 14.4x. One human
   line, *"we seem to be mining the wrong thing quite a bit lately"*, appears
   in 454 sessions but is one event.
3. **Injected rule text.** Instruction text matches the same words as an
   incident. The rule *"always validate the encoding first with a smoke
   test"* is in 1,395 sessions. `TYPE_MISMATCH` looked like 1,129 sessions
   until skill-document prose was removed; the true figure is 227. 187 of 188
   `index.lock` matches are agents reading the git skill that documents the
   error.

Also note: `<subagent_notification>` blocks carry `role:"user"` but are agent
output. An unfiltered pass gave 1,207 human pushbacks; filtering reduced it to
44.

---

## Executive result

The largest measured cost is not mathematics. It is environment setup, path
and tool-syntax guessing, and coordination. These affect thousands of sessions
and are mechanically fixable.

The class that can put a wrong claim into the proof is solver-verdict
misreading. It is smaller in volume and higher in consequence. Its shape is
specific: **the project already records the correct rules, and agents do not
apply them.** No unsound proof is demonstrated anywhere in the corpus, so the
guards work; but they work by causing re-work.

Several suspected failure modes have **no support** in the logs. They are
listed in "Checked and not supported" so that they are not carried forward.

---

## 1. Environment and path guessing

1,787 sessions (43% of the 4,131 sessions that ran a shell command) hit
`No such file or directory`. 3,351 distinct missing paths were extracted.
The sub-causes are mechanical.

| Sub-cause | Sessions |
| --- | ---: |
| Stale version-pinned skill or plugin paths | 623 |
| Missing `lean/` prefix on `Erdos9796Proof/...` | 257 |
| Read of `lakefile.lean`; the project uses `lakefile.toml` | 146 |
| Bare `python` instead of `uv run` | 265 |
| `No module named 'census'` (repo code run without `PYTHONPATH`) | 323 sess / 883 hits |

The stale plugin paths break down as `lean-usage/0.1.37` 85 sessions,
`math-toolchain/0.2.66` 70, `lean4-skills/4.6.1` 69, `lean-usage/0.1.42` 50,
`lean-usage/0.1.43` 45, `math-toolchain/0.2.59` 39, `nthdegree/0.1.48` 30,
plus 12 more. An agent copies a pinned path from memory or from an inherited
transcript after the version moves.

The same fault is the **first-ranked Lean error class**.
`LAKE_UNKNOWN_MODULE` occurs 1,104 times in **469 sessions**. 499 occurrences
in 312 sessions show a search path that holds only the elan toolchain, which
means `lean` ran without the project `LEAN_PATH`. 171 occurrences in 71
sessions point at `/Users/adam/projects/math-projects/erdos-97-96/lean/.lake/`
— the wrong repository. The downstream symptom is
`Function expected at FrontierCommonDeletionParentResidual but this term has
type ?m.1`, which reaches 154 more sessions.

Missing-path targets by top directory: `lean/` 896 sessions, `scratch/` 505,
`Erdos9796Proof/...` 257, `census/` 140, `Problem97/...` 118.

## 2. Invented command syntax on the project's own tools

| Wrong form | Correct form | Sessions | Hits |
| --- | --- | ---: | ---: |
| `p97-rvol ...` | binary does not exist (369 sessions invoke it) | 147 | 151 |
| `nthdegree recall --json` | `--format json` | 46 | 68 |
| `nthdegree convo send` | `convo post` | 34 | 107 |
| `nthdgree` | `nthdegree` (misspelling) | 29 | 29 |
| `nthdegree ... search` | subcommand does not exist | 25 | 72 |
| `lean4-skills-{check-axioms-inline,sorry-analyzer}` | binary absent | 22 / 21 | 48 |
| `proof-blueprint anchor show` | `set` / `clear` / `list` only | 18 | 66 |
| `--no-refresh` | not accepted | 15 | 21 |
| `--limit` / `--project` / `--name` (nthdegree) | not accepted | 14 / 12 / 11 | 100 |
| `--no-sink` | not accepted | 9 | 19 |
| `clonse` | `clone` (typo) | 9 | 9 |
| `--channel` / `--message` | not accepted | 7 / 4 | 31 |

Failure rate by binary, restricted to simple single-command calls:
`lean4-skills-check-axioms-inline` 73.3% (11 of 15), `pytest` 31.8%,
`ls` 18.4%, `python3` 17.6%, `python` 9.7%, `uv` 6.6%,
`proof-blueprint` 1.7%, `nthdegree` 1.2%, `git` 1.1%, `sed` 0.9%.
`lake` is the cleanest tool at 0.5%.

## 3. Coordination: agents broadcast but do not listen

All 4,699 sessions share one working directory. Worktree isolation appears in
51 sessions and 166 commands.

| Measure | Value |
| --- | ---: |
| Files written live | 7,577 |
| Files written by two or more sessions | 811 |
| Cross-session writes 30 min apart or less | 400 files |
| Cross-session writes 5 min apart or less | 102 files |
| Colliding session pairs (30 min) | 349 |
| **Sessions in a 30-min collision** | **330 of 1,522 editing sessions (21.7%)** |

Collisions by area: `scratch/` 242, `lean/` 73, `census/` 55, `docs/` 24.

The worst collision targets are the shared planning documents, not code.

| File | Pairs | Editors |
| --- | ---: | ---: |
| `docs/computational-closure-plan-2026-07-28.md` | 18 | 15 |
| `docs/closure-matrix-2026-07-09.md` | 16 | 16 |
| `docs/closure-plan-full-spec-2026-07-09.md` | 11 | 11 |
| `lean/.../ATail/FrontierLiveClosure.lean` | 10 | 13 |
| `lean/.../ATail/CriticalPairFrontier.lean` | 10 | 9 |
| `census/p97_search/phase3_structural_cegar.py` | 8 | 12 |
| `lean/.../U1LargeCapRouteBTail.lean` | 6 | 11 |

The coordination mechanisms are used far less than the collisions require.

| Mechanism | Sessions | % of 4,131 |
| --- | ---: | ---: |
| `nthdegree docs search` | 2,081 | 50.4 |
| `nthdegree recall` | 1,939 | 46.9 |
| `nthdegree convo` (any) | 992 | 24.0 |
| `proof-blueprint` (any) | 623 | 15.1 |
| `nthdegree convo post` | 539 | 13.0 |
| `nthdegree convo read` | 215 | 5.2 |
| `proof-blueprint anchor` (any) | 155 | 3.8 |
| **`proof-blueprint anchor set`** | **49** | **1.2** |
| `flock` | 15 | 0.4 |

Two structural results follow. **Anchors are not set** — 49 sessions against
330 that collided. **Agents write more than they read** — 4,216 convo posts
against 1,027 convo reads, a ratio of 4:1. **834 sessions edited the
repository without ever running `nthdegree recall`.**

Concurrent-edit breakage is measurable but small. Of 7,577 located Lean error
events, 4,889 are in files the session itself patched; **338 events in 104
sessions and 145 files** are in files only another session patched within 6 h.
The worst are `DirectSourceExactFiveCoordinator.lean` (24) and
`ATail/FrontierLiveClosure.lean` (15).

The agent-authored language about collisions is anticipatory, not reactive:
"concurrent" 770 sessions, "ownership" 663, "other agent" 590, "in parallel"
524, against "overwritten" 51, "clobber" 6, "wrong anchor" 3, "same sorry" 1.

## 4. Solver-verdict misreading

This class is smaller in volume than items 1 to 3 and higher in consequence,
because it is the class that can put a wrong claim into the proof.

**Dominant form: UNSAT of an over-constrained instance read as an
impossibility.** The project already records the correct rule — *"over-constrained
SAT is decisive ... over-constrained UNSAT is not"*, and *"under-constrained
SAT => no conclusion, re-encode"*. The failure is non-application of a rule
that exists.

**UNKNOWN folded into UNSAT.** 456 sessions return `UNKNOWN`. Only 4 carry the
rule that separates `UNKNOWN` from `UNSAT`. One audit found a live path that
promoted a bare `status: "UNSAT"` with, in its own words, *"no core shape or
solver provenance required"*.

**Direction-of-implication error.** From the logs:

~~~text
What decides the direction is whether the thing actually encoded implies the
proved fact or is merely implied by it. The grid encoding trips exactly that
distinction.
~~~

**Encoding-error kinds that recurred**, in rank order:

1. scope over-reach — a hypothesis the source does not license. Example: a
   repaired *"unsound hidden `n <= 24` scope on live leaves that assume only
   `12 <= D.A.card`"*.
2. direction-of-implication error (above);
3. polarity and role errors in geometric predicates (619 sessions carry
   "wrong polarity");
4. incomplete schema preload that admits carriers it must reject. Example:
   *"the 218-schema preload is incomplete: it admitted a Boolean carrier
   containing an eight-role schema already refutable by the generic production
   ordinal-cycle consumer"*;
5. degenerate instances (empty or contradictory clauses) that make a verdict
   meaningless;
6. off-by-one errors in DIMACS counts and in window or arc conventions.

The corpus states the underlying principle clearly:

~~~text
An encoder bug produces a confident, well-certified verdict for the *wrong*
formula; a DRAT proof certifies the CNF, not that the CNF means what you
intended. Only the smoke test closes that gap.
~~~

`docs/dead-ends.md` already records the same class for other engines: a
positive-dimensional Groebner output is not a contradiction; partial-K4 QF_NRA
SATs are artifacts, not counterexamples; decimal-literal frames give spurious
SAT. The pattern repeats across engines, which is why it belongs in a process
audit and not only in a per-engine note.

**No unsound proof is demonstrated in the corpus, and no solver verdict was
retracted because of an encoding fault.** Both unsoundness investigations end
with "no unsound proof is demonstrated and none is confirmed".

## 5. Certificate custody and stale checkpoints

- **`CERTIFY FAILED` is the highest-volume real failure event**: 1,839
  occurrences in 61 sessions. 16 sessions have 10 or more. Two single sessions
  hold 600 and 597. It pairs with *"7 certify job(s) unreturned by queue
  deadline; falling back to local certification"*.
- **`selection ids drift`** is the recurring stale-checkpoint signature: 442
  sessions, up to 146 occurrences in one session. The corpus calls it *"a
  stale-checkpoint stop sign"*.
- One concrete checker defect: **a zero-byte LRAT file was accepted on
  failure**, 53 sessions. The fix requires exit code 0 plus an exact
  `s VERIFIED` line.

Related counts: `hash mismatch` 1,023 sessions, `verification failed` 913,
`digest mismatch` 673, `checkpoint --check` 508, `stale checkpoint` 481,
`drat check` 464, `lrat check` 266, `manifest mismatch` 123.

## 6. CEGAR aimed at the wrong object

- **Producers with no consumer.** 794 sessions carry "no consumer"; 336 carry
  "without a consumer"; 1,928 carry "unconsumed". The human raised it
  directly: *"we seem to be flailing here, why are we creating producers that
  have no consumers"*.
- **Mining the wrong object.** 509 sessions carry "mining the wrong"; 379
  carry "wrong object". The human raised it at least three separate times,
  including *"How can we make sure we are mining the correct object? ... every
  other time I look at this window, we're correcting something"*.
- **Non-convergence is handled by abandonment, not by divergence.** 314
  sessions carry *"not converging to the live producer. Do not continue
  unstructured CEGAR on this map; retain the residual as a regression case"*.
  Related: `budget exhausted` 197, `cegar_exhausted` 140, `iteration cap` 85.

The prior process review stored in nthdegree (`PPR:v1`, 2026-08-07, verdict
NARROWING) already named five recurring CEGAR control-plane failure classes:
`source-encoding-fidelity-drift`, `coarse-outcome-taxonomy`,
`checkpoint-retry-replay-lifecycle`, `finite-mining-promotion-disconnect`, and
`weak-stopping-rules`. This log evidence independently confirms four of the
five (all but `coarse-outcome-taxonomy`, which this audit did not test
directly).

## 7. Route and status corrections

526 unique correction messages occur in 183 originating sessions (3.9%).

| Kind | Unique messages | Sessions |
| --- | ---: | ---: |
| ROUTE | 206 | 85 |
| STATUS | 133 | 76 |
| COVERAGE | 71 | 46 |
| SORRY | 71 | 42 |
| SCOPE | 45 | 34 |
| BUILD | 29 | 19 |
| CONJECTURE | 13 | 7 |
| NOEXIST | 7 | 6 |

Two examples:

~~~text
Correction: the live spine has six `sorry`-bearing declarations, not one. I
was wrong to call this the sole project `sorry`.
~~~

~~~text
Total sorries closed: 0 ... the remaining obligations were recombined rather
than closed. I was wrong to call it a genuine closure.
~~~

184 of 736 unique subagent final reports (25%) flag a defect; 117 (16%) are
clean.

**One structural note on register.** First-person admissions total about 16
utterances in 39.3 M chars of agent text. Corrections are written impersonally
— "route correction", "the audit found an important correction". The record is
kept, but the authorship is erased. This makes a repeated mistake hard to see
from inside a single session, and it is one reason this audit needed a
corpus-wide scan.

## 8. Context loss and re-derivation

- **10,140 live compactions across 2,713 sessions.** Distribution: 455
  sessions 0, 1,967 exactly 1, 385 two, 133 three, 77 four, 46 five, 105 six
  or more.
- **The 67 root sessions hold 5,638 of the 10,140 compactions (56%)**, a mean
  of 84 each. The worst root session compacted **1,853 times** between
  2026-07-29 and 2026-08-12 (1.24 GB, 341,659 records).
- One sentence is replayed in 343 sessions: *"I lost the settled theorem
  boundary across compaction."*
- Only 46.9% of sessions ever ran `nthdegree recall`.
- **`nthdegree docs search` is the largest single command shape by wall time —
  47,717 s (13.3 h) over 3,841 commands in 717 sessions, a mean of 12.4 s
  each.** With the agentic variant it is about 15 h. All `lake-build` together
  is 2.8 h.

The instruction-file history records the same problem. The 2026-07-09 and
2026-07-10 edits to `CLAUDE.md` added "check the already-mined theorem-bank
registry before deriving a new ... contradiction". That rule exists because
work was re-derived.

## 9. Naming drift on the central open object

`docs/dead-ends.md` states that the single open obligation behind U1.3, U2.B,
and the c5d3b family has appeared under many names — **NEW-1, L6c,
producer-payload, `U5GlobalIncidence`, OQ-1, and "the surplus-cap escape"** —
and that they are all the same object. A renamed obstruction invites a new
attack on ground that is already mapped.

The related circularity is also recorded: proving a cap concyclic **is** U1.3,
so using it to unblock U1.3 is circular. "circular" appears in 10 of the 35
audit files.

## 10. Documentation drift

- 203 documents were created under `docs/` in six weeks. 34 are active, 52 are
  archived, 35 are audits, 13 are solve prompts.
- 56 of 1,226 commits since 2026-07-01 are corrective. **39 of the 56 touch
  `docs/`** (12 doc-only, 27 mixed) against 17 code-only. Examples:
  "correct stale counts", "correct closure evidence claims", "fix stale root
  comment", "correct exact witness status".
- 59 of 1,623 unique short human turns ask whether a plan is current.
- "stale" appears in 12 of 35 audit files; "drift" in 9; "does not close" in
  6; "vacuous" in 4; "conflat*" in 4.

---

## Checked and not supported

These failure modes were suspected. The evidence does not support them. They
are listed so that they are not carried forward as assumptions.

| Suspicion | Finding |
| --- | --- |
| Rebuild after every one-line edit | **Not confirmed.** 41,844 `.lean` patch round-trips against 14,722 build or check round-trips = 0.35 checks per edit. Of 665 sessions doing both, 398 checked less than 0.5x per edit. Only 23 sessions ran more than 10 full builds. |
| olean / mathlib version mismatch | **Zero** occurrences in command output corpus-wide. All 231 file matches are one replayed human question. What does occur is a missing olean (`...CrossedArmQ1G7Producer.olean ... does not exist`), 132 occurrences in 55 sessions. |
| Merge conflicts | **Zero** `CONFLICT (content)`, `Automatic merge failed`, `needs merge`. |
| Rejected or non-fast-forward pushes | **Zero**. One `failed to push`, caused by the GitHub 100 MB file limit. |
| Wrong-tree or wrong-branch commits | Not found. `detached HEAD` in 4 sessions. |
| Lost `git stash` work | **Zero** `would be overwritten`, zero `commit your changes or stash them`. |
| Real concurrent git lock contention | 4 sessions only. The other 187 matches are agents reading the git skill text. |
| `apply_patch` failures | **0** of 719,794 patch events carry `"success":false`. |
| Sorry-count inflation in the library | Near balanced. Over 81,424 patch diffs: `lean/` +2,552 / -2,247 = net **+305** (103 sessions up, 91 down, 228 even). `scratch/` net **+1,295** (403 up, 4 down). The increase is probe scaffolding, not spine growth. |
| `native_decide` abuse | Light. The mathlib linter `Using 'native_decide' is not allowed` fires 24 times in 17 sessions. |
| Deterministic timeouts driven by `decide` | Weak. 94 occurrences in 34 sessions; only 13 of those outputs mention `decide` and 10 mention `native_decide`. |
| Build-lock contention | The `flock` build lock is used in 15 sessions. `another Lean build is already running` fired **once** corpus-wide. |
| OOM as a coordination failure | Rare. `OOM` matched 2,623 sessions, but the ranked contexts are skill boilerplate. Word-bounded, it is 758 sessions; `oom-killed` 8, `exit code 137` 5, `bad_alloc` 1. One agent-authored report of a real OOM-killed Lean worker. |
| Status inflation across sessions (claimed closed, later open) | **Not confirmed.** The loose detector gave 32 candidate reversals from 2,275 labelled mentions; manual check falsified the top candidate as a context-window artifact. The tight detector gave 1, and it is a status enum, not a lemma. Names claimed CLOSED in prose intersected with names Lean rejected as unknown is **empty**. |
| Unsound proof shipped | **None demonstrated.** Both unsoundness investigations end "none is confirmed". |
| `piqd` / `piqc` CLI misuse | No ranked failure class. 435 sessions and 29,568 commands for `piqd`; only `unrecognized subcommand 'prepare-cnf'` in 3 sessions. |
| `lean-shard` failures | 13 sessions, 66 commands, no failure class. |
| Duplicate Lean declarations | Real but small: 11 occurrences in 7 sessions. Ambiguous names: 1. |

---

## Wasted effort, measured

- **Lean re-attempts.** 6,115 exec round-trips produced at least one Lean
  diagnostic (393 min measured). **2,494 of them (40.8%) re-emitted a
  signature that the same session had already seen — 180.7 min (3.0 h).** 60
  sessions had more than 10 error-producing round-trips; 18 had more than 25.
  Redundant re-emissions by class: `LINTER_MODULE_DOCSTRING` 1,071,
  `SORRY_DECLARATION` 626, `LINTER_UNUSED` 605, `LAKE_UNKNOWN_MODULE` 310,
  `FUNCTION_EXPECTED` 307. **About half of all repeated output is
  information-free linter and sorry noise from throwaway scratch probes**,
  re-read into agent context on every later check.
- **Failed commands.** 16,293 calls carrying a failure marker cost 7,916 s
  (1.2% of shell wall time). Failed commands cost turns and context, not CPU.
- **Approval friction.** 2,486 escalation requests from 102 sessions, a mean of
  24 per session. Three `ps` command shapes account for 471 requests; the git
  write path accounts for 386. Nothing learns that these always need
  escalation.

Both time figures are floors. `yield_time_ms: 10000` caps a long command's
reported wall time at "11.0 seconds" — this affects 15.3% of builds and 12.7%
of checks. Backgrounded `lake-build ... &` runs are not measured at all.

## Ranked Lean error classes

Occurrences / sessions, after the doc-prose filter.

| Rank | Class | Occ | Sessions |
| ---: | --- | ---: | ---: |
| 1 | `LAKE_UNKNOWN_MODULE` | 1,104 | 469 |
| 2 | `LINTER_MODULE_DOCSTRING` | 1,445 | 307 |
| 3 | `UNKNOWN_IDENTIFIER` | 666 | 241 |
| 4 | `UNKNOWN_CONSTANT` | 550 | 232 |
| 5 | `TYPE_MISMATCH` | 718 | 227 |
| 6 | `UNSOLVED_GOALS` | 575 | 171 |
| 7 | `LINTER_UNUSED` | 672 | 165 |
| 8 | `FUNCTION_EXPECTED` | 333 | 154 |
| 9 | `PARSE_UNEXPECTED_TOKEN` | 321 | 151 |
| 10 | `APP_TYPE_MISMATCH` | 385 | 144 |
| 11 | `TACTIC_OTHER_FAILED` | 235 | 111 |
| 12 | `SORRY_DECLARATION` | 747 | 110 |

Below rank 12: `INSTANCE_SYNTH_FAILED` 93, `OMEGA_FAILED` 82,
`LINTER_SIMP_STYLE` 75, `TACTIC_REWRITE_FAILED` 74, `OLEAN_STALE_OBJECT` 55,
`MAX_RECURSION_DEPTH` 42, `LAKE_LEAN_EXITED` 41, `NO_GOALS` 37,
`DETERMINISTIC_TIMEOUT` 34, `MOTIVE_NOT_TYPE_CORRECT` 33, `COMPILER_IR_CHECK`
22, `LINARITH_FAILED` 19, `NATIVE_DECIDE_BANNED` 17, `DUPLICATE_DECLARATION`
7, `UNIVERSE_STUCK` 4, `AMBIGUOUS_NAME` 1.

Notes on the ranking:

- Rank 1 is environmental, not mathematical (see item 1).
- Rank 2 and rank 7 are linter noise on scratch probes.
- Rank 9 is mostly shell quoting, for example `unexpected token '²'`. Only 46
  of the 151 sessions reached Lean at all.
- Rank 3 and rank 4 are invented names, for example
  `Unknown constant 'Matrix.cons_val_five'` and invented Problem97 bank names.
  38 distinct Lean names were rejected as unknown; **12 of them also appear in
  assistant prose**.
- Rank 5 and rank 10 concentrate on BitVec and `Fin n` certificate ingress, and
  on a `RowPattern Label` against
  `RowPattern ExactTwelveCarrierIngress.Label` shadowing defect.
- Rank 6 and rank 11 are the real mathematical stall. They occur in the
  `CriticalPairFrontier` and `FrontierCommonDeletionParentResidual` context.

---

## Evidence limits

- Human pushback after an agent reported completion is rare: 44 of 2,059
  (assistant-tail, human-turn) pairs (2.1%), and about 0.9% of unique human
  turns carry a doubt marker. **The logs therefore cannot separate "the claims
  were accurate" from "the claims were not audited".** Item 7 measures the
  corrections that agents made themselves, not corrections that were needed
  and missed. {{NEEDS_PROOF}}
- The adjacency proxy for hallucinated artefacts (17.5% of failing calls sit
  within 5 records of the preceding assistant message, 50.2% within 20) does
  not establish that the preceding message was a confident claim.
  {{UNVALIDATED}}
- The audit classifies logged artefacts. It did not re-run any solver, build,
  or replay to confirm a mathematical statement.
- Session counts in the solver scan measure vocabulary prevalence, not
  incident count, wherever the phrase is also project rule text. Those rows are
  marked in context in item 4 and item 6.
- `coarse-outcome-taxonomy`, one of the five `PPR:v1` classes, was not tested
  by this audit.

## What the ranking implies

Items 1, 2, 3, and 8 are mechanical. They affect thousands of sessions and are
fixed by environment and tooling changes, not by instruction.

Item 4 is the class that can damage the proof, and its cause is not a missing
rule. The correct rules for over-constrained UNSAT, for UNKNOWN, for msolve
tuples, and for QF_NRA artifacts are already written in `docs/dead-ends.md`
and in the solver skills. They are not applied. A further rule document is
therefore unlikely to change the outcome. The prior review stored in nthdegree
(`S8A5FS`) reached the same conclusion from a different direction: advisory
process is ignored, and only non-ignorable changes work.

## Data locations

Intermediate data is under the session scratchpad
`/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/0668cc80-d41b-40d4-bbc5-29fa96e44d9f/scratchpad/`:

| Path | Content |
| --- | --- |
| `erdos_sessions.txt` | the 4,699 project rollout paths |
| `sizes.txt`, `session_src.tsv`, `session_kinds.tsv` | per-session size and origin |
| `human_msgs.tsv`, `hm_short_uniq.txt`, `hm_corrective.txt` | extracted human turns |
| `lean/` | Lean scan: `ev.tsv`, `cls.tsv`, `final_rank.tsv`, `x4-x6.tsv`, scanners |
| `solver/` | solver scan: `pat1-4_summary.tsv`, `root_summary.tsv`, scanners |
| `ep/` | epistemic scan and `report-epistemic.md` |
| `an/` | process scan: `pass1-3.py`, tables under `an/agg/` |

This is a temporary directory. Copy anything that must survive the session.

A practical note for a repeat run: the `/usr/bin/grep` on this machine is a
`ugrep` build that is very slow on this corpus (100 small files in 2m14s). A
full 33.48 GiB pass with about 50 literals runs in 32-81 s through the fast
path. When extracting context, put the literal first — `PHRASE.{0,220}` runs a
set in 1.2 s where `.{0,N}PHRASE` takes 3m38s, because a leading wildcard
disables the literal prefilter.
