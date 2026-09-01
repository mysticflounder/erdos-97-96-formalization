# B1 cross-wave raw-data theorem mine

Date: 2026-09-01

Source revision: `bc7a5e90dd3f44c5973226d7183c763ccb39db64`

Lane: `b1-crosswave-formalization-20260901`

## Scope and claim status

This audit jointly inspects retained artifacts from the exact-12 structural
campaign and the arbitrary-cardinality normal-form campaign.  It is the first
cross-wave pass over these two current B1 campaigns that reads retained raw
fields rather than treating the wave-local theorem-mine receipts as semantic
summaries.

All recurrence claims below are **EMPIRICALLY VERIFIED** over the named retained
artifacts.  They are not Lean theorems and do not by themselves supply hypotheses
to the active B1 consumer.

The active Lean obligation remains
`Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm`.
Its immediate coordinator is
`false_of_b1ThirdJointDeletionOrPhysicalClassFiveSixNormalForm`; the compatibility
wrapper is `b1_globalGapOrClosedTerminal_of_counterexample`, and the publish root
is `Problem97.erdos97_rhs`.  The active frontier measure is

```text
(third-deletion status, physical-class cardinality ambiguity,
 live-row cover ambiguity, open B1 consumers).
```

Any promoted theorem from this mine must be produced by the source context, be
consumed by the normal-form leaf, and strictly decrease that frontier.

## Audit-history correction

The latest earlier genuine cross-wave mine was the 2026-08-14 cube-level audit in
`scratch/rigid221-sourceheavy-anchor/cross-wave-audit-20260814/`.  It jointly
mined 91 preserved witnesses, reduced them to 47 distinct cubes, and found 3,488
order-independent cores in 323 role structures.  Its scope was older exact-12
canary/live/cell data and did not cover the present campaigns.

The 2026-08-31 receipts under
`scratch/runs/b1-normalform-order-20260831/wave-{1..7}/artifacts/` and
`scratch/runs/b1-exact12-structural-20260830/wave-{14..20}/artifacts/` all declare
`scope: CURRENT_WAVE_ONLY`.  Their campaign `PASS` results validate receipt shape,
paths, and digests.  They do not compare waves.  In particular, the Wave 15, 17,
and 19 `NO_NEW_PATTERN` inputs each contain one observation that repeats the
single-wave terminal summary.

`scripts/b1_postwave_theorem_mine.py` validates the artifact bindings and receipt
schema but does not parse or semantically score the retained raw artifact fields.
Therefore those receipts are not a substitute for a cross-wave raw-data mine.

## Exact-12 cube recurrence

The `raw-00000002.json` cubes in Waves 4, 6, 7, 9, 11, 13, 15, 17, and 19 all
begin with the same five rows:

```text
0 : {1, 3, 4, 6}
1 : {0, 2, 6, 7}
2 : {0, 1, 9, 10}
3 : {0, 2, 4, 5}
4 : {1, 5, 7, 8}
```

This is recurrence in the solver-selected survivors, not a source theorem.
Before using it as mathematics, either derive the five rows from the B1 source
hypotheses or deliberately diversify the SAT selection and show the recurrence is
not a branch-selection artifact.

The later survivor sequence is even more localized:

- Waves 15 and 17 agree on 11 of 12 rows; only row 5 changes from
  `{0,4,8,9}` to `{0,7,8,9}`.
- Waves 17 and 19 agree on 11 of 12 rows; only row 11 changes from
  `{2,3,8,9}` to `{3,4,5,7}`.
- Waves 15 and 19 therefore retain a ten-row common backbone.

The three artifacts retain the same 15 successful semantic checks.  Their SAT
positive-variable counts fall from 30,908 to 30,739 and then 30,733 while one
theorem-backed clause is added per wave.  This suggests an asymmetric refinement
effect concentrated in one escape row, but the full positive SAT assignment was
discarded when the cube payload was produced, so auxiliary-relation deltas cannot
now be reconstructed from these files.

## Exact equality-system recurrence

The canonical full-equality summaries in Waves 12, 14, 16, 18-v2, and 20-v2 each
contain 36 squared-distance relation triples over `QQ` and report terminal status
`UNIT`.  Exactly 28 triples recur in all five systems.  They contain all triples
from rows 0--4 and 6--8, plus two targets each from rows 5 and 9.

The common 28-triple packet is the strongest immediate exact-algebra candidate.
The first formalization gate is to determine whether it already contains a
kernel-checked contradiction core.  If it does not, the useful result is the
minimal list of extra triples required by each known core, not a theorem claiming
that empirical recurrence is source-forced.  The relation `[1,0,2]` deserves
priority because it occurs in three of the four later minimized cores.

The exact common packet, written as `[pivot, base, target]`, is:

```text
[0,1,3]  [0,1,4]  [0,1,6]
[1,0,2]  [1,0,6]  [1,0,7]
[2,0,1]  [2,0,9]  [2,0,10]
[3,0,2]  [3,0,4]  [3,0,5]
[4,1,5]  [4,1,7]  [4,1,8]
[5,0,8]  [5,0,9]
[6,0,1]  [6,0,5]  [6,0,11]
[7,0,8]  [7,0,10] [7,0,11]
[8,1,2]  [8,1,7]  [8,1,9]
[9,1,4]  [9,1,10]
```

The relevant retained summaries are:

- `wave-12/artifacts/singular-wave11-full-equality-1a428aeaf477a664cdbf/`;
- `wave-14/artifacts/singular-wave13-full-equality-5a9cc9e980f458e39ed/`;
- `wave-16/artifacts/singular-wave15-full-equality-8c5cc840cf1b8e10b309/`;
- `wave-18/artifacts/singular-wave17-full-equality-f663c379e8a6b21046-v2/`;
- `wave-20/artifacts/singular-wave19-full-equality-8886e33919689fed27c1a-v2/`.

Each path is below `scratch/runs/b1-exact12-structural-20260830/` and contains
`full-probe-summary.json`.

## Normal-form structural recurrence

Wave 6 begins with 94,381 labeled partitions in 7,287 conservative symmetry
orbits.  The installed duplicate-center and exact-edge screens leave 74,157
partitions in 5,792 orbits.  Endpoint-shadow pruning leaves 5,679 partitions in
433 orbits, and local-order consistency leaves 1,609 partitions in 134 orbits.
The raw `alias-orbits.jsonl` retains labels, orbit sizes, individual collision
witnesses, and local-order masks; the summary retains only aggregate counts and
digests.

At the 433-orbit endpoint-shadow checkpoint, every survivor has seven distinct
physical labels, while 432 retain at least one auxiliary alias.  Frequent alias
pairs include `A=uL` (188), `Bu=c0` (181), `A=c0` (147), `Bc=uL` (112), and
`uL=vL` (106).  This suggests a physical-role injectivity lemma only if the
installed screens can be expressed and produced from the B1 source packet.  It
does not justify globally assuming injectivity of all sixteen roles.

Wave 7 records four numerical searches.  Three leave the required
`u1 < v0` order domain; the best record stays inside the physical-order guards
but fails near edge slacks involving `cR -> cL`.  A future shared metric encoder
should parameterize the ordered physical coordinates by positive gaps so invalid
order is impossible by construction.  Repeated near-active edges should be
classified across seeds rather than reduced to one scalar `best_margin`.

## Script/data coverage gaps

Direct source comparison found the following retained-information losses:

1. The exact-12 runner selects one profile, one physical class, and one raw cell;
   other profiles, card-six arms, and cell indices are outside those runs.
2. Exact-12 payload construction drops the complete positive SAT assignment and
   retains only the decoded cube and aggregate positive-variable count.
3. Wave 1 checks every live pair for alternation but aggregates the same-arc count
   only for the first pair, although both pairs remain in the raw witness.
4. Wave 6 summaries discard alias/order co-occurrence data and actual intervening
   role multiplicity; endpoint-shadow witnesses always report an empty
   `open_interval_roles` list.
5. Wave 7 retains individual edge and guard slacks in four records but does not
   classify repeated near-active constraints.
6. The Wave 14--20 algebra probes rebuild only the 36 equality relations from the
   cube.  They deliberately omit distinctness, convexity and cyclic order, and all
   non-equality CNF clauses.

## Candidate formalization order

The candidates are ordered by source honesty and likely frontier value:

1. Determine whether the common 28-relation packet contains an already proved
   exact metric contradiction.  Reuse and wire it if every premise has an
   upstream B1 producer.
2. Otherwise formalize the smallest exact conditional consumer exposed by the
   28-relation comparison and record its first missing B1 producer.
3. Check whether physical-role injectivity after the installed Wave 6 screens can
   be proved as a general source lemma.  Auxiliary aliases must remain explicit.
4. Treat the five-row and ten-row cube backbones as diagnostic until an upstream
   source theorem produces them.

No new solver wave is authorized by this audit.  The bounded theorem-reuse and
source-producer preflights below decide which, if any, candidate proceeds to Lean.

## Reuse and formalization decision

The bounded in-project search used `proof-blueprint search`; the cross-project
search used `nthdegree docs search --lean`.  No declaration outside this project
matched the common-28 packet or supplied its missing B1 bridge.  The relevant
in-project consumers are the generic six-point five-row, seven-point seven-row,
six-point six-row, and seven-point equilateral-median collision cores under
`Problem97.Census554.EqualityCore`.  At source revision `bc7a5e90d` their files
are working-tree additions, not tracked declarations, and none is imported by
`TwoDeletionCollision.lean`.

The common 28 triples contain no complete known collision core, including after
injective role relabeling.  The nearest fixed-label overlaps are:

- Wave 14 seven-row core: 10 of 11, missing `[9,1,8]`;
- Wave 16 six-row core: 8 of 9, missing `[5,0,4]`;
- Wave 18 equilateral-median core: 6 of 11, missing `[9,1,11]`,
  `[10,2,8]`, `[10,2,11]`, `[11,2,8]`, and `[11,2,9]`;
- Wave 20 diagnostic core: nearest overlap 7 of 11, no complete role map, and
  ten relations without an upstream B1 `EdgeClosure` producer.

The reusable bridge lemmas
`CapSelectedNativeClosureSound.edgeClosure_of_semanticRows_edgesEqual` and
`GenericRowNogoodCertificate.edgeClosure_of_reindexRowPattern` still require a
source-certified row pattern and checked equal-edge facts.  The normal-form
hypothesis supplies deletion provenance, cardinality, and a finite cover, but not
those equality closures.  Formalizing another conditional collision wrapper would
therefore be orphan work and would not decrease the active B1 frontier.

The Wave 6 audit did expose a source-provable ingress fact.  Its 433
post-endpoint-shadow orbits all have seven distinct physical labels because
the screen explicitly assumes the card-six physical `K6` inequalities.  The
source can already prove the cardinality half of that premise: the physical
apex lies outside its positive-radius selected class, so a six-element class
together with that apex has seven elements.  A bounded Lean-corpus search at
source revision `46bd274fe` found no reusable declaration.  The formalization
therefore adds, in `B1CardSixPhysicalRoleIngress.lean`:

- `B1CardSixPhysicalIngress.oppApex2_not_mem_selectedClass`; and
- `B1CardSixPhysicalIngress.physicalClassWithApex_card_eq_seven`.

This is source-ingress infrastructure, not closure of
`false_of_b1PhysicalClassFiveSixNormalForm`.  It does not yet identify six
named packet roles with the physical class, and it adds no injectivity claim
for completion roles.  The richer named-role bridge was Lean-checked and
independently approved, but a custody audit found that it depends on the
uncommitted `B1LocalRolePacket.lean` and its pending
`EqualBlockerContinuation.lean` ingress.  It was therefore not published in
this self-contained lane.

The self-contained module passed its targeted `lake-build` at proof-blueprint
build `077453850014`.  Kernel axiom audits for both declarations report only
`propext`, `Classical.choice`, and `Quot.sound`.  The cardinality theorem is
deliberately registered as off-spine `infra`: no current declaration consumes
it, and this audit makes no B1-closure claim from it.  The remaining first
missing producer is still a complete named-role source packet followed by an
endpoint-order or equality-core packet for one of the 134 local-order survivor
orbits.  An independent review approved the final proof and confirmed by a
2,921-module recursive import scan that `B1LocalRolePacket` is unreachable.
