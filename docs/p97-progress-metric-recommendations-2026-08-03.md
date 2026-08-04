# P97 Progress Metric — Recommendations

**Date:** 2026-08-03
**Scope:** replace on-spine `sorry` count as the project's progress metric.
**Basis:** measurements against `data/proof-blueprint.db` (845,473 kernel-mined
call edges, 54,387 indexed symbols) and a review of 34 agent session
transcripts (569 MB) for this project.

---

## 1. The problem

On-spine `sorry` count is the metric every agent session has been reporting
against. It is the wrong metric for a project doing active research, and it has
been actively harmful.

Trajectory from git. Note the basis: this column is `sorry`-bearing lines
across `lean/Erdos9796Proof/`, which is *not* the on-spine count. The
authoritative on-spine figure comes from `proof-blueprint spine`, and on
2026-08-03 it is **28 open `sorry` theorems** (29 open obligations including
the induced `sorryAx`), all inside `ATailFrontierLiveClosure`. The repo-wide
column is used here because it is the one recoverable at historical commits by
`git grep`; treat it as a proxy for direction, not a spine measurement.

| date | repo-wide `sorry` lines | `.lean` files |
|---|---|---|
| 2026-07-06 | 104 | 1,498 |
| 2026-07-19 | 32 | 2,131 |
| 2026-08-03 | 56 | 4,621 |

Read as a scoreboard, 32 → 56 is a 75% regression. It is not. Part of that rise
is the FreshThird arm split, which was *forced by a real result*: the n=17
(6,8,6) incidence probe came back SAT in all three arms
(`firstNonHit`, `secondNonHit`, `equalCrossRowCenters`), proving no
incidence-level cut can close the aggregate leaf. Leaf count went up; knowledge
went up. The metric cannot tell those apart.

Two consequences, both observed in the transcripts:

1. **It penalises every research-driven refactor.** An agent scored on
   "sorries must not increase" will resist any restructuring that raises the
   count — which is nearly all of them. The observed pattern of agents
   declining open goals is downstream of the scoreboard, not of disposition.
   The project began moving when the standard was relaxed manually.

2. **It scores negative results at zero.** Eliminating the entire
   incidence-level route for FreshThird is a permanent, irreversible reduction
   of the search space. It moves no counter in the current system.

Supporting transcript measurements: of 2,653 file-writing operations across 34
sessions, 142 (5.4%) touched `lean/Erdos9796Proof`; 23 of 34 sessions made zero
edits to the proof tree. Those sessions were not idle — they produced docs,
probes, and scratch tooling, all of which scored the same as nothing (zero) and
therefore carried no penalty either.

---

## 2. Recommended metric: four numbers, not one

All four are computable today from existing tables. No new instrumentation.

### 2.1 Banked

Sorry-free theorems reachable from the publish target via `symbol_refs`.

**Measured 2026-08-03: 11,459 banked / 36,009 reachable nodes / 28 open leaves.**

```sql
WITH RECURSIVE cone(sym) AS (
  SELECT 'Problem97.erdos97_rhs'
  UNION SELECT r.to_symbol FROM symbol_refs r JOIN cone c ON r.from_symbol = c.sym)
SELECT COUNT(*) FROM cone
JOIN lean_symbols s ON s.fully_qualified_name = cone.sym
WHERE s.has_sorry = 0 AND s.kind IN ('theorem','lemma');
```

Properties:

- **Splitting a `sorry` cannot move this number.** Only proving can.
- Monotone up, except at deliberate retraction.
- A refactor that deletes 200 banked theorems and re-proves 260 reports as
  exactly that trade — `−200 / +260` — instead of as a `sorry` delta that
  hides both halves.

Retraction is an event, not a silent decrement: log
`(symbol, reason, superseding_symbol_or_null)`.

### 2.2 Support per open leaf — reported as a vector

For each open leaf, the count of banked declarations in its transitive
dependency cone. Measured 2026-08-03, range 5–40:

```
40  false_of_capSource_firstFiber_crossedThreeRowExactSupports
39  false_of_capSource_firstFiber_outsidePairDeletionExactRows
34  ...exactFourMutualOmissionRigid221_minimalCore
33  ...exactFourMutualOmissionRigid221_physicalApex_sourceNeU
28  ...freshThirdBlockerFiber_normalized_remaining
25  ...JInLeftAdjacentCap_triApexAllLarge_core
16  ...exactFourPostCardElevenTwoRadiusBranch
10  ...reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core
 5  firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual
 5  firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual
```

This is the "thin support (5 closed deps each)" judgement from
`docs/p97-spine-closure-audit-2026-08-03.md`, computed rather than eyeballed.

**Report the frontier as `(leaf_count, support_histogram)` and never collapse it
to a scalar.** A leaf count rising (as in §1's proxy table) with the histogram
shifting right is a healthy
refactor. Leaves up with support flat is leaf multiplication. That distinction
is the whole difference between the two readings of §1's table.

Working query: `scripts/` — see §4.

### 2.3 Dead ends

**The `dead_ends` table exists and has 0 rows.** So do `discoveries` and
`leads`. After a month of research, no ruled-out route has ever been recorded
in the tool that was built to hold them; every such result lives only in prose
docs that later docs supersede.

Record `(route, verdict, deciding_artifact)` for each terminal result.
Monotone up. Backfill candidates already sitting in existing audits:

- FreshThird `normalized_remaining` — SAT in all three arms at n=17 (6,8,6);
  no incidence-level cut exists. Sources:
  `scratch/freshthird-current-cegar-audit-20260803.md`.
- Round10 eleven DDD `unsat` artifacts — classified NO-GO for
  normalized-residual promotion by `GLOBAL-THEOREM-BANK-AUDIT.md`.
- Four-point Kalmanson cut — conditional on the equal-center both-hit arm plus
  a cyclic order `c < q < u < v` the FreshThird packet does not supply.
- Adapter route — no non-circular source-clean closure under the current C/Q
  interface; first missing producer is a common first-apex radius / mutual
  C-row incidence producer.

This is the metric that makes ruling-something-out count as work. Its absence
is why externally-sourced negative results have been invisible to the
scoreboard.

### 2.4 Producers landed

Newly-banked symbols inside some open leaf's dependency cone, per session or
per week. This is the currency
`docs/p97-spine-closure-audit-2026-08-03.md` already named:

> Splits without new producers multiply leaves without shrinking target freedom.

It is the number that correctly scores a session which generated 935 files
under `scratch/atail-force` and no producers at zero.

---

## 3. Design principle

> Splitting is currently free, and ruling-out currently pays nothing.
> Both are inverted from how research works.

Under the four-number scheme, a session reports four deltas: `banked`,
`support`, `dead_ends`, `producers`. There is no way to score by declining a
goal, and no way to score by generating scaffolding. Refactoring that raises
leaf count is neutral-to-positive when support and producers move with it.

**Consequent change to `CLAUDE.md`:** the current instruction file defines
progress almost entirely negatively — "is bookkeeping until", "does not by
itself count as closure", "must not be called current obligations or proof
progress", "Do not introduce orphan or off-spine sorries". That is a rubric for
declaring things insufficient, and agents comply with it by declining. Replace
the negative catalog with the positive definition above: what counts, which
command computes it, and what a session must report.

Note also that the seven-condition `sorry`-splitting rule in `CLAUDE.md` is
unenforceable as written — none of its conditions (notably (2), "an auditable
narrowing measure") is computable, so in practice only the permission survives.
§2.2's support vector is a computable stand-in for condition (2).

{{UNVALIDATED}} That fixing the metric measurably changes agent behaviour. The
causal story in §1 is consistent with the transcripts but has not been tested.
The cheap test is one session under the new reporting rule.

---

## 4. Implementation

Ship as `proof-blueprint progress`, or as `scripts/progress.sh` wrapping the
queries, emitting:

- the four-tuple with deltas against the last recorded snapshot;
- the per-leaf support table from §2.2;
- retraction and dead-end events since the last snapshot.

All queries above are verified working against the current DB. The recursive
cone query over 845k edges completes without special handling.

Snapshot storage: a new table, or reuse of the existing intent-half tables.
Snapshots must be derived at write time from `symbol_refs` + `lean_symbols`,
never agent-supplied — the tool's stated guarantee is "every status is derived
from the `.lean` source and the Lean kernel — never agent-stored", and this
metric must inherit it.

{{NEEDS_ADAM_INPUT}} Whether `dead_ends` entries require a machine-checkable
artifact (solver log, DRAT, `#print axioms` output) or accept a prose citation.
Prose-only entries reintroduce the failure mode the rest of this doc is
designed to remove; requiring artifacts makes some genuine negative results
unrecordable.

---

## 5. What this does not fix

The metric governs reporting. It does not by itself address the session-level
failures found in the transcripts — unbounded autonomous loops (two sessions
with 28 and 35 compactions respectively, one producing zero proof edits across
2,423 shell commands), or the 157 competing agent-authored plan documents that
make "the plan" unresolvable at session start. Those need harness-level gates,
not metric changes.

### FreshThird residual audit note (2026-08-03)

A parked, kernel-clean adapter now demonstrates a precise producer boundary:
the existing two-center equidistance terminal closes the noncanonical same-cap
shape when both fresh support points are outside the common cap, while the live
constructor guarantees only that at least one point is inside.  This is a
useful banked negative result (`support`/`dead_end` evidence), not a producer
or closure.  The normalized-remaining leaf remains open until a
one-inside/one-outside theorem or a source-entitled incidence/order producer is
landed.
