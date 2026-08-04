<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Closure-plan audit (2026-07-13)

Adversarial audit of `docs/closure-plan-full-spec-2026-07-09.md`,
`docs/closure-matrix-2026-07-09.md`, and
`docs/atail-force-producer-plan-2026-07-13.md` against the live repository
state. Method: three parallel audit passes (full-spec skeptic, ATAIL-plan
skeptic, artifact/anchor sweep), with every severity-bearing finding
re-verified directly against source before inclusion here. No build was run;
Lean checks are textual plus the fresh `proof-blueprint spine` dump
(`docs/live-blueprint.md`, 2026-07-13 13:33). Snapshot caveat: all three
target docs carried uncommitted working-tree edits during the audit and a
concurrent session landed four commits mid-audit; line numbers reference the
audited snapshot.

## Resolution status (same-day checkpoint)

The authoritative plans were corrected after this audit. The findings below
are retained as evidence of the pre-correction state, not as the current
dispatch surface:

- AUDIT-1: Front-A card 11 is again explicit and open. The primary ATAIL
  producer is required uniformly from card 11; a higher-threshold producer
  carries A11-CONSUME and its source-visible wiring as dependencies.
- AUDIT-2: the PIN rows are labeled closed route history and theorem-bank
  material, not active work.
- AUDIT-3: LIVE-T1/T3 use the checked relabel orbit reduction; the stale
  two-consumer instruction is removed.
- AUDIT-4: Census554 process statements are historical and no live consumer is
  claimed.
- AUDIT-5: LIVE-BANK-MATCH is recorded as DONE-NEGATIVE at its tested scope.
- AUDIT-6: the Singular result is labeled trusted exact CAS evidence within
  the saved algebraic subsystems; no replayed certificate or Lean theorem is
  claimed.

The current status and dependency graph are in
`docs/closure-matrix-2026-07-09.md`,
`docs/closure-plan-full-spec-2026-07-09.md`, and
`docs/atail-force-producer-plan-2026-07-13.md`.

**Verdict: NEEDS WORK.** The factual layer is strong — every referenced
artifact exists, every line anchor is exact, the 36-symbol/80-hole inventory
matches the live spine precisely, and negative-result scoping is exemplary.
Two findings are blocking; several majors are stale-dispatch traps.

## AUDIT-1 (BLOCKER): "Card 11 is closed" has no supporting theorem; the trail is circular

Claim locations: matrix K-A-PAIR/K-A-LIVE rows ("card 11 is closed
independently of Census554") and A11 preamble ("Card 11 is already closed by
the current theorem stack"); plan:265-266 ("Card 11 is independently
closed"); spec:858/:889 (A.2 step 5 SUPERSEDED "because card 11 is closed
independently").

Verified evidence against the claim:

- No closing declaration is named anywhere, and none exists:
  `grep -rn "false_of_cardEleven" lean/` returns zero hits. The designed
  discharge theorem `Census554.false_of_cardEleven_twoLargeCaps`
  (A11-CONSUME) was never built; its dependencies A11-COVER-CHECK and
  A11-COVER-DEAD are OPEN and now marked OPTIONAL.
- `Census554/MotifTransfer.lean:41-44` (in-tree, current) states the card-11
  `D.A.card = 11 → False` packaging is "Not yet imported by the leaf …
  consumed at plan step A.2.5" — the exact step the spec supersedes on the
  strength of the claim under audit. The justification is circular.
- The consumer chain has no card split: `removableVertexOfLarge_of_nonIsM44`
  (`RemovableVertexAxiom/Continuation.lean:743`) passes `hgt : 9 < A.card`
  straight into the leaf. The K-A-PAIR sorry spans all cards > 9.
- The ERASE card-11 closure (652fdfcb) cannot absorb this slice:
  `SurplusCapPacket.IsM44` (`Cap/PartitionFromMEC.lean:443`) requires both
  opposite caps of card 4, while the K-A leaf is the `hNoM44` branch with a
  second cap ≥ 5 (profile (5,5,4) at card 11). Plausible root cause of the
  flip: the 652fdfcb commit title "complete ERASE card-10 and card-11
  closure" was read as a global card-11 closure. {{UNVALIDATED}}
- The status flip from "card-11 slice TRACTABLE-with-route via the A11 lane"
  (`docs/audits/2026-07-12-ka-route-scoping.md:51-57`, cited by the matrix as
  its scoping authority) to "closed independently" occurred in docs-only
  commit 4f097be7 (three doc files, zero Lean).

Consequence: the open K-A-PAIR surface is **card ≥ 11**, not card ≥ 12.
Card 10 is dischargeable via the proved
`Census554.card_ge_eleven_of_twoLargeCaps` (`GeometryBridge.lean:1301`)
modulo constructing the `CircumscribedMECPacket` at the leaf — a step the
plan should state explicitly. A producer proved uniformly from card 12
cannot make `DoubleApexOffSurplusSharedRadiusPair` sorry-free; the ATAIL
plan's acceptance gate ("the existing shared-radius declaration is
sorry-free") is unreachable as scoped. Required: either the ATAIL-ROW
producer covers card 11, or A11-CONSUME (or an equivalent named theorem)
returns to the critical path, and all four doc locations are downgraded to
OPEN until a closing declaration is cited by name and file:line.

## AUDIT-2 (BLOCKER): Front-B PIN rows dispatch onto a sorry that no longer exists

Matrix PIN-GENERAL ("remove the sole declaration-level sorry") and the OPEN
clause of PIN-METRIC-BRIDGE (plus PIN-KQ35, PIN-EXACT-CLOSURE as its
feeders), and spec:1503-1512 ("PIN-GENERAL owns the open leaf. Acceptance:
prove …"), all target the general-m pinned leaf that K-B-PIN closed on
2026-07-12. Verified: zero code-level `sorry` exists anywhere in `lean/`
outside `U1LargeCapRouteBTail.lean`; the declaration is absent from the live
spine open list. The spec passage is self-contradictory within one
paragraph ("… owns the open leaf … The terminal source is now sorry-free").
An agent taking these rows performs off-spine work by definition. Required:
retag the four rows DONE-via-K-B-PIN or historical; past-tense
spec:1503-1512.

## AUDIT-3 (MAJOR): Spec A.2b routes LIVE-T1 onto a superseded two-consumer plan

spec:872-874 ("Matrix LIVE-T1 therefore requires two consumers, not one
overgeneralized lemma") predates ATAIL-TRIPLE-RELABEL; the matrix LIVE-T1
row and the spec's own later ordering text agree the polarity split is
bypassed by the checked relabel adapters. A reader following A.2b builds
superseded consumers.

## AUDIT-4 (MAJOR): Present-tense live-process claims for a quiescent census

spec:394 asserts `frontier_loop.py` "is live" in tmux `census554-loop` with
a 5,916-row bank; spec:478-487 and :546-548 assert live leases/locks/hosts.
Verified now: zero census processes, no census tmux session, bank at 5,939
rows (digest matches A11-OUTCOME exactly). The 11:00 PDT paused checkpoint
(spec:363-379) is the truth; the block needs past-tensing or per-item
timestamps.

## AUDIT-5 (MAJOR): LIVE-BANK-MATCH written as pending; it is DONE-NEGATIVE

spec:892-898 presents the bank-match decider as a precondition to run;
matrix LIVE-BANK-MATCH is DONE 2026-07-12 (dd2f91c1), negative terminal
(1,422 pairs, 0 MATCH). A spec-only reader re-runs a finished decider.

## AUDIT-6 (MAJOR, label hygiene): Singular `UNIT` phrased beyond its evidence

plan:461-463 states an eight-row subsystem verdict as "proves UNIT … both
full 36-equality systems are algebraically impossible" while plan:467
records that the certificate lift timed out — no independently replayed
certificate exists. This violates the plan's own acceptance gate 3. The
working tree already softens this to TRUSTED EXACT-CAS (correct label), but
HEAD (0269a00c) still carries the overclaim; the correction must be
committed. Off-spine (discovery-tier), hence MAJOR not BLOCKER.

## Minor findings

- "kernel-checked" unqualified for the triple-relabel adapters (plan:229):
  they import the leaf and inherit `sorryAx`; the matrix row says so, the
  plan's verb should too.
- W16/W20 falsifier-bank gate (plan:483-485) names no runnable
  procedure/harness; witnesses exist (`scratch/d3-formulation/`) but "was
  run against the bank" is currently unauditable.
- Matrix cites `bank-audits/…` without its `scratch/census-554/` prefix.
- Spec "current inventory" repeats the dated "3 uncommitted Lean paths"
  recheck (now 1) without its 10:09 timestamp; A.0 carries pre-restructure
  line anchors beside current-status prose; Front-B headings still say
  "current ERASE cluster" after closure; "active-run provenance" for the
  terminal oracle-13 run.
- The 2026-07-12 ka-route-scoping audit internally describes the pre-P1b
  file layout (5,475 lines, old anchors) and is cited by the matrix as
  current scoping authority; it is dated evidence.

## What passed

- Referenced-artifact existence: 36/36 matrix paths exist (plus all ATAIL
  plan artifacts: pilots' JSON match claimed numbers, digests match,
  scratch kernels sorry-free textually, preflight counts 3,375/167,782/343/
  590/30,997 verified in `census/atail_force/surface_checkpoint.json`).
- Line anchors: 18/18 exact in `U1LargeCapRouteBTail.lean` (K-A-PAIR
  :2516/:2561; all 35 liveData helpers; umbrella :7764).
- Hole inventory: exactly 80 tactic holes, all in that one file; zero code
  sorries elsewhere in `lean/`; matches the matrix reconciliation table and
  the live 36-symbol spine exactly. `sorryAx` correctly documented as the
  kernel marker.
- ATAIL producer target ↔ sorry interface: exact match, full filters over
  `D.A` (no selected-four truncation drift);
  `exists_doubleApex_pair_of_joint_filter_card_ge_two` emits the sorry's
  conclusion shape verbatim.
- Negative-result scoping (Q3 token-SAT, msolve/Z3/cvc5 tractability
  pilots, distinct-witness replay): consistently labeled, no
  over-conclusion; cvc5's raw `ERROR(-6)` → TIMEOUT normalization is
  disclosed accurately.
- Coverage: all 36 sorry symbols have named owning rows; publication gates
  present; A11-WIRE-* correctly absent from the spec; weasel-word scan
  clean.

## Required actions

1. AUDIT-1: name the card-11 closing declaration or downgrade the claim in
   all four locations; restore card 11 to the producer obligation or the
   A11-CONSUME route to the critical path; state the card-10 discharge
   (`card_ge_eleven_of_twoLargeCaps` + packet construction) in the plan.
2. AUDIT-2: retag PIN-GENERAL / PIN-METRIC-BRIDGE-OPEN / PIN-KQ35 /
   PIN-EXACT-CLOSURE; past-tense spec:1503-1512.
3. AUDIT-3/4/5: delete the two-consumer sentence; past-tense the process
   block; record the LIVE-BANK-MATCH negative terminal in the spec.
4. AUDIT-6: commit the working-tree label corrections promptly.
5. Minors as listed.
