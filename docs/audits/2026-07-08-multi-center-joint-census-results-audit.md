<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Audit note: multi-center joint census results + proof plan (2026-07-08)

Audited documents:

- `docs/multi-center-joint-census-2026-07-08.md` (results note)
- `docs/multi-center-joint-census-proof-plan-2026-07-08.md` (proof plan)
- [archived 2026-07-06 closure plan](../../archive/2026-07-10-closure-plan-consolidation/closure-plan-2026-07-06.md)
  (§7 census paragraph + U4 register row,
  uncommitted at audit time)

Auditor: Claude (orchestrating session), independent of the authoring
session. All numeric claims were re-derived from the raw sweep artifacts,
not read from the documents.

## Independent verification performed

1. **Per-artifact SAT/UNSAT/INDETERMINATE tally.** Summed
   `.n[].summary` across all nine sweep artifacts
   (`l2_global_proven_n12_30.json`, `_n21_30.json`, `_n22.json` …
   `_n28.json`): 533,761 SAT / 0 UNSAT / 0 INDETERMINATE, matching the
   results note exactly. `indeterminate_ratio` is 0.0 at every n.
2. **Stabilization re-derived from raw class keys**, not from the
   documents' fresh-count diffs. Extracted every `class_key` per
   artifact; the cumulative inventory through n = 24 is exactly 3,375
   distinct keys; each of n = 25, 26, 27, 28 realizes **exactly that
   same set** (per-n distinct = 3,375 and set difference vs the
   cumulative inventory is empty). The four-row zero-fresh window is
   CONFIRMED, and is a set identity, not merely a count coincidence.
3. **Fresh-count column re-checked** against local/cumulative
   distinct counts at every swept n (consistent throughout, including
   the n = 22 zero row followed by 9 fresh classes at n = 23).
4. **Smoke gates** re-read from `census/multi_center/smoke_results.json`:
   S1 (composition reproduction, 22 profiles), S2 (K-Q3-1/K-Q3-5 kill
   observation), S3 (unequal-profile canonicalization) all PASS.

## Verdicts per document

### Results note — ACCURATE

Every checked claim holds. The note correctly labels the verdict
STABILIZED-EMPIRICAL, states plainly that the data does not prove
eventual constancy, and flags the missing spec-mandated
CONJECTURED-tier appendix under "Pending". The per-n table matches the
artifacts cell-for-cell (spot-checked all rows for the class/fresh/SAT
columns).

One addition the data supports that the note does not state: the table
shows `L2 GLOBAL = cumulative GLOBAL` at **every** swept n, which
forces classes(m) ⊆ classes(n) for all m < n — full per-step empirical
monotonicity across the entire range, not only survival of the n ≤ 24
inventory on n = 25..28. This strengthens the empirical case for the
persistence conjecture (T2) and is worth recording.

### Proof plan — ONE LOGICAL DEFECT (Phase 3), otherwise sound

**Defect (must fix before dispatching Phase 3): Phase 3 overclaims what
T2 buys.** The plan states:

> Once T2 is proved, the census through n = 28 becomes enough to deduce
> inventory(n) = inventory(25) for all n ≥ 25.

That does not follow. T2 (one-step persistence) yields
inventory(n) ⊇ inventory(25) for n ≥ 25 — surviving classes only. It
places no upper bound: fresh classes may still appear at n ≥ 29. The
sweep itself exhibits this failure shape — n = 22 had zero fresh
classes, then 9 fresh classes arrived at n = 23 — so a zero-fresh
window plus persistence cannot pin the inventory.

What T2 + the finite class alphabet actually yield is T3 **as
literally stated** (eventual constancy at some unspecified n*): a
monotone, bounded, integer-valued inventory is eventually constant.
Notably this derivation does not use the zero-fresh window at all.

To prove the quantitative statement (constant = 3,375, threshold
n = 25) an **upper-bound direction** is required, either:

- (a) reverse persistence: every class realizable at n + 1 is already
  realizable at n (for n ≥ some n₀ ≤ 25); or
- (b) LOCAL-alphabet constancy above some n₀ (the set of
  LOCAL-admissible classes is n-independent for n ≥ n₀, a finite
  check plus an argument that LOCAL admissibility stops depending on
  the caps) combined with T1 (LOCAL ⇒ GLOBAL completion).

Consequently the plan's claim that T1 is "not required to upgrade the
stabilization verdict if T2 already lands" is wrong for the
quantitative verdict: T1 (or an equivalent cap, route (a)) is
REQUIRED, not optional, for `inventory(n) = inventory(25)`. T2 alone
upgrades only the qualitative "eventually constant".

Recommended repair: split Phase 3 into
(3a) T2 + finite alphabet ⇒ eventual constancy (no census window
needed), and
(3b) quantitative window-locking via route (a) or (b), with T1
promoted from optional to required-for-(b).

**Sound parts.** The empirical-facts section is verified (including
fact 5, confirmed by the set-identity check above). T1 and T2 are the
right candidate theorems; the Phase 2 proof sketch (inert interior
point in a cap with slack; C4 saturation as the obstruction to watch)
matches the token model. The "what should not be formalized first"
list is correct, including the citation of the Q3 probe's
two-center-insufficiency result.

### Closure plan edits — ACCURATE, ONE REGRESSION

The §7 paragraph and the U4 row's census sentence match the verified
data. The scratch/ → census/ path updates are mechanical and correct.

**Regression:** the U4 register row rewrite dropped the sentence
recording the C-split gate — "C-split DECIDED 2026-07-07 (Adam):
gated go — k=4 bank + n = 12 window-shape convergence gate dispatched;
full 12–14 commitment pending the gate readout." The gate is still
running (its convergence signal is FLAT through 57 iterations as of
this audit) and its readout still gates a standing decision, so the
register row should carry it. §7 retains the decision, so this is a
register-completeness fix, not a data loss.

## Standing gaps (both documents already acknowledge or imply)

1. The spec's mandatory CONJECTURED-tier appendix (L2 GLOBAL under
   PROVEN + CONJECTURED, side-by-side) has not been run; all artifacts
   are tier=proven. The results note flags this.
2. First-pass sweep ceiling: n = 29–32 extension in flight at audit
   time; per-n DFS nodes (4.4 × 10⁹ at n = 28) are far beyond the
   spec's 10⁸ auto-extend budget, so extension past 32 is Adam's call.
3. Verdicts remain empirical pending the proof plan's theorems; no
   claim audited here asserts otherwise.

## 2026-07-09 formalization addendum

The finite L2/full-participant enumerator-completeness concern is now closed in
Lean.  An independent 21-cell LOCAL enumerator is proved complete, its accepted
support-data keys are checked equal to all 3,375 typed-bank rows, all six
profile-preserving center permutations are checked semantically, and the finite
coverage check ranges over all 489 profile rows and 3,375 typed classes.  The
resulting theorems are
`ProfileClassIncidence.finiteCodeWitnesses`,
`ProfileClassIncidence.coversL2FullLocalModuloFrom`, and
`ProfileClassIncidence.completesL2FullFrom_representativeSurface`.

This does not alter the audit's warning about quantitative stabilization.  The
proved target is the generated representative surface modulo profile
automorphisms, not geometric GLOBAL realization.  T1 still requires a sound
configuration-level realization bridge, and the upper-bound direction needed
to identify an eventual inventory with exactly 3,375 classes remains separate.

The empirical record has also advanced without changing that conclusion. The
GLOBAL sweep is complete through `n = 32` at `977,975 / 977,975 SAT`, and the
exact LOCAL frontier is flat against the 3,375-class baseline through
`n = 64`, with no new or missing class keys on `n = 29..64`. These are bounded
verified computations, not a general-`n` theorem.
