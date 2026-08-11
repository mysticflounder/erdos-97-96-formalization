# RemovableVertexOfLarge decomposition review — 2026-08-10

Review of why the `Problem97.RemovableVertexOfLarge` branch of the Lean spine
is disproportionately hard to close. Analysis only; no code was changed.
Evidence comes from three audits run 2026-08-10: a spine-shape analysis, a
git growth census, and a source-level mathematical critique. Claim labels
follow project rigor policy: VERIFIED = read directly in source or computed
from the repo; HEURISTIC = judgment from partial evidence; CONJECTURED =
unproven mathematics.

## 1. Verdict

The trouble is disproportionate, and most of it is the decomposition, not
the mathematics. The branch contains roughly 8 genuine mathematical
obligations (HEURISTIC). The current decomposition presents them as 35
sorried leaves under 86 open interior nodes. One obligation is intrinsically
hard open combinatorics; no restructuring removes it. The rest of the
frontier size is structural inflation from three identifiable mechanisms
(§5).

## 2. Branch structure (VERIFIED)

- The branch's own three-way split is healthy: two arms are closed
  (`largeK4SurplusCapPacket`, `removableVertexOfLarge_of_isM44PinnedSurplus`).
  All open weight passes through `removableVertexOfLarge_of_nonIsM44`
  (`Erdos9796Proof/P97/RemovableVertexAxiom/Continuation.lean:737`).
- That theorem builds a `CounterexampleData`, splits on `card = 11` — closed
  through the FiniteN11 clause-bank route
  (`FiniteN11Frontier.lean:166-210`) — and sends every other size into
  `ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap` →
  `false_of_criticalPairFrontier`
  (`ATail/FrontierLiveClosure/Coordinator.lean:778,796`).
- `CriticalPairFrontier` (`ATail/CriticalPairFrontier.lean:568`) is a
  4-field bookkeeping packet: a survivor pair (q, w), a first-apex split, a
  second-apex 4-equidistant fact, and a second-apex split. The whole open
  frontier is the attempt to refute this packet by nested case analysis.
- Cards 10 and 11 discharge in closed interior nodes; every live leaf packet
  carries `12 ≤ |A|`.

## 3. Shape statistics (VERIFIED, from `proof-blueprint spine`)

| Metric | Value |
| --- | --- |
| Sorried leaf theorems | 35 |
| Open interior nodes | 86 |
| Interior nodes with exactly one open child | 45 |
| Leaf depth below branch root | min 6, median 21, max 34 |
| Leaf clusters | Rigid221 mutual-omission 9 · pentagon sourceHeavy 8 · triApex retained-omission 9 · TwoSource terminal 5 · one-offs 4 |

More than half of the open tree is linear towers: each case split closed
some cases and renamed the residual case with one more name suffix (the
deepest name carries 9 suffixes). Scale: `Rigid221SourceHeavy.lean` is
17,999 lines for one family; single case-leaf proofs run 400-500 lines;
the context token `OriginalUniqueFourResidual F` repeats 116 times in that
one file; the four cluster files total ≈ 32,800 lines.

## 4. Growth history (VERIFIED, git census)

The frontier is young. It was born as one file on 2026-07-20 (`74fb6ccc`)
and sharded into a directory on 2026-08-05 (`9feb86f6`).

| Date | Frontier sorry tokens |
| --- | --- |
| 2026-07-27 | 23 |
| 2026-08-03 | 29 |
| 2026-08-10 | 42 |

- Last 12 frontier commits (08-05 → 08-08): 24 sorry lines added, 13
  removed; 7 commits net-added, 2 net-removed, 3 neutral. Commits labeled
  as closures still net-added when the closed leaf split into several new
  leaves (one commit was +7/−2).
- The named-theorem inventory grew 28 (2026-08-04 snapshot) → 35
  (2026-08-10), net +7 in six days.
- The two hinge theorems at the top of the tower
  (`false_of_criticalPairFrontier`, `false_of_originalFrontierUniqueRadiusArm`)
  are three weeks old and still open; all work has gone into fan-out below
  them.

## 5. Inflation mechanisms (VERIFIED in source)

1. **Cardinality stratum towers that cannot terminate.** The pentagon tower
   (`Rigid221SourceHeavy.lean:11825-12092`) closes |A| = 15 (~660 lines of
   finite convex-order exhaustion), |A| = 16 (two cap-card certificates),
   |A| = 17 cap-11 and cap-10 (cap-9 half-open: the `exactCover` arm is a
   mid-proof sorry at :11872) — and then states `card_ge_eighteen` as a
   residual that is verbatim the parent with 17 → 18. The card hypothesis
   does not interact with the contradiction mechanism; it only sets the
   census size. Measured cost: 500-2,500 proof lines per stratum, with no
   terminating index. The file's own docstring records: "This is a
   narrowing decomposition, not closure" (:15749).
2. **Coincidence fan-out with zero immediate closures.** The triApex
   `endpointCrossHit` node split 1 → 5 open leaves (role coincidences, then
   left/right blocker placement) with nothing closed at split time
   (`TriApexEndpointRetainedOmission.lean:3466-3596`). This violates the
   recorded standing rule: a split that grows the publish-reachable
   frontier without closing a child is bookkeeping, not progress.
3. **Packet duplication.** Sibling leaves repeat ~18-item verbatim
   hypothesis prefixes and differ by 1-3 trailing hypotheses
   (`Rigid221Closure.lean:52-267`); dispatchers re-pass ~20 arguments
   unchanged. No sorried leaf uses its packet yet (all hypotheses are
   underscore-bound). Closed siblings show what a terminal actually
   consumes: a named-point core of ~7-13 points, row memberships,
   convexity, and exact cardinalities — the tower above each terminal is
   scaffolding (HEURISTIC). The duplication also blocks the SAT lane from
   abstracting per-record instead of per-leaf.

Cleared worry: the spine render's repeated
`false_of_twoDistinctExactFourMutualOmissionJointDeletions` links are not a
cycle. It is one constant, upstream of the whole Rigid221 family
(`TwoDeletionCollision.lean:1103`), consumed from five sites (one shallow
hub, four deep pentagon-tower leaves that construct joint-deletion
witnesses and invoke it). It is a genuine bottleneck theorem and is itself
open — its arms carry the `b1_globalGapOrClosedTerminal` and
`fourCenterCommonDeletion` sorries. Import order proves acyclicity
(VERIFIED).

Positive pattern worth keeping: the producer/consumer splits
(`b1_globalGapOrClosedTerminal_of_counterexample`,
`exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three`) isolate
the remaining content as one positive existence statement feeding an
already-closed consumer. That converts case analysis into one named
mathematical gap — the right shape.

## 6. The intrinsic core (CONJECTURED)

One obligation survives every restructuring: a size-uniform contradiction
for the pentagon five-cycle record — the `deletedRowBlockerOffClass`
configuration (5-point selected class {u, v, deleted, xu, xv} on the circle
of radius ρ centered at apex₂, the five-cycle blocker map, deleted's
blocker in the cap interior off the class, next-row overlap ≤ 1) refuted
with no cardinality hypothesis. The closed strata prove exactly this for
|A| = 15, 16, 17 by finite census; the uniform statement is open
combinatorics. No solver pipeline has produced a kernel-checkable producer
for it (as of the 2026-08-04 inventory and the live anchors). This is the
hardest-part-first target.

## 7. Restructuring options

Subsumption estimates are HEURISTIC (fractions of the current 35 leaves).

| # | Option | Effect | Risk / contingency |
| --- | --- | --- | --- |
| R1 | Configuration-record normal form: one record structure per cluster, case tags as data, leaves become instances | 35 statements → ~8; makes every later option cheaper | Pure refactor plus one extraction lemma per cluster |
| R5 | Reflection/role transport (pilot of R1's equivariance layer) | Merges 2-4 mirror leaves (e.g. `JInLeftAdjacentCap` / `JInRightAdjacentCap`) | Equivariance of stacked oriented structures must be proven; partial machinery exists with 5 sorries in `Rigid221Placement.lean` |
| R2 | Finish exact-12 placement-orbit transport → universal SAT lift per record at fixed card | 9-12 leaves; converts existing kernel-checked cuts into closures | Bridge theorems unwritten; card-11 precedent works end-to-end |
| R3 | Uniform tail theorem per record (no card hypothesis) | Terminates all towers permanently | The intrinsic open core (§6) |
| R4 | Confinement bound: Minimal ∧ no-IsM44 ∧ CriticalPairFrontier → |A| ≤ N₀, then bounded census | ~20 leaves | Unproven global bound; likely as hard as R3 |

Recommended order: enforce the existing fan-out freeze first (no new
exact-card or coincidence splits unless at least one child closes at split
time — this costs nothing and stops the +7/week growth); then R1; R5 as
R1's equivariance pilot; R2 to convert SAT-lane diagnostics into reusable
kernel closures; then concentrate mathematical effort on R3 for the
pentagon record. {{NEEDS_ADAM_INPUT}} — choice and sequencing of R1-R5.

## 8. Hygiene notes (minor, VERIFIED)

- 3 off-spine sorries (`Rigid221Closure.lean`,
  `TwoSourceFreshThirdFiber.lean`, `TwoSourceFreshThirdResidual.lean`)
  violate the no-placeholder policy.
- 41 fully-qualified name collisions, mostly `scratch/` copies of
  production declarations, add audit noise.
- 862 files (4,614 symbols) are unreached by any lake import chain.

## 9. Provenance

- Spine snapshot: `proof-blueprint spine Problem97.RemovableVertexOfLarge`
  at build 520e0a6f9c66 (2026-08-10).
- Growth census: read-only git audit over
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/`, commits
  `74fb6ccc`..`1666eabc`.
- Dependency trace and statement reading: session audits, 2026-08-10;
  key sites cited inline above.
