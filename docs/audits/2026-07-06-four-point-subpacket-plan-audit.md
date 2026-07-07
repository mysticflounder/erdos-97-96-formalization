<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Plan audit: four-point-subpacket-plan.md (2026-07-06)

Audited document: `docs/four-point-subpacket-plan.md` (3,283 lines at snapshot).
Snapshot caveat: the file carries uncommitted working-tree modifications from
active agent sessions; line numbers are snapshot-stamped and will drift.
Companion audits: [`2026-07-06-slot3-certificate-closure-plan-audit.md`](2026-07-06-slot3-certificate-closure-plan-audit.md)
(the other active plan) and
[`2026-07-06-frontier-missed-angle-analysis.md`](2026-07-06-frontier-missed-angle-analysis.md)
(the math findings both plans respond to).

Scope of the plan: slot-2 machinery — the four-point subpacket reduction, the
six-fact Q-facing checklist, the endpoint escape route (obligation 1), the
pinned surplus COMP-G route (obligation 2), and the erased-pin triple residual
(obligation 3).

## Artifact verification performed for this audit

Claims below marked VERIFIED were checked directly; PLAN-CLAIM items are taken
from the plan's own log and not independently re-run.

| Claim in plan | Check | Result |
|---|---|---|
| lifted-support run: 134/135 rows solved, all using centers outside {v,w}; `s1_030` timeout | `jq .summary` on `certificates/surplus/reports/pinned_surplus_lift_support.json` | VERIFIED exactly (134 ok + 1 timeout; `rows_using_nonuniform_centers_count: 134`) |
| {v,w}+separator constrained test fails for all 135 rows | `jq .summary` on `.../pinned_surplus_uniform_center_test.json` | VERIFIED (status_counts: nonunit 135; no unit, no timeout) |
| singleton relaxed split: 135 leaves, all unit, none unresolved | `jq .summary` on `.../pinned_surplus_relaxed_split_singleton_probe.json` | VERIFIED (135 unit leaves, 17 cases, 15 relaxed rows, `unresolved_cases: []`) |
| 135 singleton certificate JSONs exist | file count in `certificates/surplus/relaxed_split_singleton/` | VERIFIED (135) |
| grouped 70-file pass retained as support artifact | file count in `certificates/surplus/relaxed_split/` | VERIFIED (70) |
| `SurplusCertificate.RelaxedSplit.All` builds | olean present | VERIFIED-BUILT (olean exists; proves a past build, not currency vs sources) |
| endpoint `Patterns.All`, `ShadowSearchShards.All`, `BankSoundness` build | oleans present | VERIFIED-BUILT (same caveat) |
| all intermediate probe/census reports exist | `ls certificates/surplus/reports/` | VERIFIED (all files named in the plan are present, including the s1_030 180 s retry) |

Not re-verified: the Singular verdicts themselves (the JSON summaries are the
emitter's own output; independent re-check would re-run the solver), and the
Lean statements' semantic content.

## Strengths

**S1. The checklist rule is the right spine guardrail.** "Any future lemma
should be judged by whether it proves one of these six facts … A reformulation
that does not shrink this checklist is not proof progress" (§Current Q-Facing
Interface Target). This is an enforceable anti-wrapper criterion, and the
progress ledger is in fact kept against those six facts.

**S2. Audit findings were absorbed with experiments, not prose.** The
2026-07-06 missed-angle F1 (m-uniformity gap at center `.u`) got a proper
escalation ladder, each step run and recorded: lifted support (optimistic
outcome dead) → {v,w}+separator constrained test (regeneration route dead) →
15-row relaxed projection → 17-case separator probe (5 unit / 5 nonunit / 7
timeout, projection too coarse) → recursive variable-incidence split (63 unit
leaves) → fully singleton split (135 unit leaves) → Lean bank + soundness
modules. Every negative result narrowed the next computation; all artifacts
verified above. The F4 falsifiability probe was likewise adopted as a hard
gate before the adjacent one-hit bounds ("Audit gate", §Current Q-Facing
Interface Target).

**S3. Boundaries are stated honestly.** "This establishes a useful target,
not a finished Lean theorem"; the `Lean.trustCompiler` closure note on
`pinnedSurplusCOMPGBankBridge`; §Remaining Risk states the reduction removes
bookkeeping but not the metric contradiction or non-IsM44 descent. No
overclaim found in the sections read.

## Findings

**FP1 (highest). The built pinned bridge is the m = 5 path; the general-m
split is named but buried.** The Lean surface constructed so far
(`ExactBridge.false_of_shadowInBank_of_payload_zeros`, matching by exact pid;
the `isValidPinnedFragment`/`pinnedSurplusCOMPGBankBridge` consumers) routes
through the exact ten-mask bank, whose faithfulness is automatic only in the
label-complete m = 5 case — the plan's own audit-update paragraph says so. The
honest fallback ("absent such a theorem, split the pinned residual into the
closed m = 5 bank case and a genuine general-m Q-shaped residual") is the last
bullet of a decision list ~1,030 lines in. Risk: obligation 2 gets wired
"closed" and the general-m residual surfaces as a surprise at the end.
Recommendation: pre-name the general-m residual now, and require any wiring
commit for `isM44PinnedSurplusResidualsExcluded` to state which m-range the
proved theorem covers.

**FP2. Status duplication has already produced drift — in both directions.**
(a) Plan-vs-plan: this plan's endpoint section still lists `EpQ1008` as "OPEN
… the next implementation step is therefore internal certificate sharding",
while the slot-3 plan records the sharding landed and `Patterns.All` building
(olean verified). (b) Plan-vs-tree: `RowZeros/Product/All.olean` exists in the
build directory, i.e. the product-sum row-zero step the slot-3 plan calls "the
next endpoint step" has already been built — even the freshest log entry lags
the tree. Recommendation: each obligation's status lives in exactly one doc;
the other plan cross-references. Treat build state, not either log, as truth
(which is what proof-blueprint is for, once its miner is repaired).

**FP3. The document has outgrown its function as an agent-facing plan.**
3,283 append-only lines; the live six-fact checklist sits at ~line 140; the
current frontier is split across at least three status blocks plus a
~1,900-line execution log; a superseded "next proof-facing target" (~line
1343) is corrected only by the paragraph after it. An agent skimming can grab
a stale instruction. Recommendation: split into a ≤150-line live-frontier doc
(six-fact checklist, open boundaries, gates, verification commands) and an
append-only history log.

**FP4. The F4 gate is adopted but the probe is not dispatched.** Four of the
six checklist facts (`leftAdjCount ≤ 1`, `rightAdjCount ≤ 1`, and both lower
bounds) are OPEN behind the exact-rational two-hit falsifiability probe,
which remains "not attempted" per the missed-angle solver table. The gate
correctly blocks proof attempts, but nothing schedules the probe itself (one
solver-day). Until it runs, the branch's checklist cannot move.

**FP5. Verification commands are currently unenforceable and no interim gate
is stated** (shared with the slot-3 plan; see companion audit SP5). While
proof-blueprint's miner is paused, on-spine claims should be gated by
`lake-build` plus `proof-blueprint axioms <target>` (live kernel query; does
not need the mined graph).

Out of scope here: the absence of a uniform-rigidity workstream is charged to
the slot-3 plan audit (this plan is slot-2-scoped and its obligations have no
known |A|-uniformity obstruction on the endpoint track, one decisively probed
gap on the pinned track).

## Verdict

Keep executing: the endpoint finish and the relaxed-vocabulary pinned bridge
are real, converging work with verified artifacts behind them. The required
changes are bookkeeping-shaped but consequential: name the general-m residual
before wiring (FP1), deduplicate status (FP2), split the live frontier from
the log (FP3), and actually dispatch the F4 probe (FP4).
