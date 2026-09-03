# B1 equal-blocker continuation lane

Date: 2026-08-29

Target:
`Problem97.ATailFrontierLiveClosure.b1_globalGapOrClosedTerminal_of_counterexample`

Immediate consumer:
`Problem97.ATailFrontierLiveClosure.false_of_twoDeletionOutcome`

Publish root: `Problem97.erdos97_rhs`

## Authority and diagnosis

This lane follows revision 4 of
`docs/plans/2026-08-18-b-family-closure-plan.md` and §§16.5.I4–I12 of
`docs/erdos-97-descent-prose-proof-atomic.md`.

The old positive terminal is not supplied by the local B1 geometry.  Its first
two arms contradict the exact two-point carrier bisector, and its universal
overlap arm contradicts the source-clean small-overlap escape.

Git archaeology found no historical source closure.  Commit `95cac9ed`
introduced `b1_globalGapOrClosedTerminal_of_counterexample` with `sorry`; the
predecessor blocker-collision theorem was already open.  Reachable history,
reflogs, stashes, and the inspected dangling commits contain no non-`sorry`
body for either declaration.

A bounded project-index search at source revision `5413bd4f4` found no reusable
consumer for the exact five/six residual described below.

## Source-clean reduction

`EqualBlockerContinuation.lean` and `TwoDeletionCollision.lean` now formalize
the following producer and dispatch chain:

1. `B1PhysicalClassFiveSixNormalForm` retains the absence of a third distinct
   joint deletion, exact physical-class cardinality five or six, and equality
   of that class with the deleted pair union the two live-row slices.
2. `b1_third_actualBlocker_ne_common` proves that any third distinct joint
   deletion has an actual blocker distinct from the common blocker.
3. `b1_thirdJointDeletion_or_physicalClassFiveSixNormalForm` exhaustively
   produces either that third deletion or the retained five/six normal form.
4. `false_of_b1_distinctBlocker_jointDeletions` sends the third-deletion arm
   through the checked directed cross-omission and four-center split to the
   two existing B2/B3 terminal leaves.
5. `false_of_b1ThirdJointDeletionOrPhysicalClassFiveSixNormalForm` consumes the
   split, and `false_of_b1GlobalTransportContext` composes producer and
   consumer.
6. `b1_globalGapOrClosedTerminal_of_counterexample` is now a source-closed
   compatibility wrapper over that coordinator.

Only `false_of_b1PhysicalClassFiveSixNormalForm` is a new open declaration.

## Frontier measure

The refinement measure for the B1 component is

```text
(third-deletion status, physical-class cardinality ambiguity,
 live-row cover ambiguity, open B1 consumers).
```

At the old leaf the third-deletion status was unsplit, class cardinality was
only bounded below by five, and no exact cover was retained.  At the new leaf
there is no third distinct joint deletion, the class cardinality belongs to
`{5, 6}`, and the deleted-pair-plus-two-slices cover is an equality.  The number
of open B1 consumers remains one.  This is a strict decrease without claiming
that the global mathematical consumer has been proved.

## Remaining obligation

The honest global consumer is

```lean
theorem false_of_b1PhysicalClassFiveSixNormalForm
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C) : False
```

The forced finite patterns are exact.  At cardinality five the two live slices
have sizes `(1,2)`, `(2,1)`, or `(2,2)` with one shared mate in the last case.
At cardinality six they are disjoint two-point slices.  The sharp cap bound
places at least three or four class points, respectively, in the strict cap.

The bare cover is not a contradiction at the current equality and cyclic-order
interface.  In particular, the five-point shared-mate pattern satisfies every
available `SurplusCOMPGBank.btw_sep` conclusion.  The first missing order input
is a forced named nonalternating placement, or a complete six/seven-role order
matching an existing Kalmanson schema.  A valid proof must derive such an input
from the full counterexample context, or use a different global incidence or
well-founded blocker transition.

## 2026-08-31 arbitrary-cardinality ingress update

`b1_live_slice_card_eq_two_of_physicalClassFiveSixNormalForm` now proves that
one of the two live physical slices has cardinality exactly two.  This is the
finite-selection half of the cardinality-free shared-pair consumer.  The same
source module now exposes the unlabeled exact-four completions: the common row
always has a two-point outside-class complement, and so does one live row.  If
the physical class has cardinality six, both live slices are disjoint
two-point sets and both live rows have two-point complements.  The
`B1RowCompletionPair` ingress now names each available complement by two
distinct ambient carrier labels; it packages the common row, one live row in
every normal form, and both live rows on the six-point branch.  These lemmas do
not fix the ambient carrier cardinality and do not assert cross-row
distinctness or any unproved metric relation.

The governed normal-form order Wave 1 then exhaustively tested the four exact
five/six trace shapes.  Every branch has a survivor in both boundary
orientations under the current source-proved cap and alternation atoms, even
with all named roles injective except the forced shared mate.  Therefore the
same-arc field required by
`false_of_freshThirdSharedPairNonalternationPacket` is not available from the
present interface.

The provenance audit locates the information loss before the B1 context:
`exists_mutuallyOmittedSecondClassPair` chooses `u,v` arbitrarily, and the
joint-deletion constructors choose the deleted sources arbitrarily.  Neither
choice retains an extremal boundary witness.  Merely copying the older source
context into `B1GlobalTransportContext` cannot repair this.  The next gate is
a geometry-aware arbitrary-cardinality diagnostic followed, if justified, by
an upstream extremal/order producer before `TwoDeletionIngress`.

That first geometry-aware gate is now complete.  An exact-rational card-six
named projection satisfies the full three-pair metric and convex-order layer,
including the deleted/common-blocker pair omitted by the first order wave.
All three pairs alternate, so the local named geometry still does not provide
same-arc.  The next finite frontier is exact-four completion of the common and
two live rows.  The finite existence and cardinalities of those completions
are now proved in Lean.  Wave 3 supplies an exact rational strict-convex model
of three disjoint exact-four rows with six fresh completion supports, so row
completion and overlap bounds alone are not contradictory.  The full nested
common-circle/cap/MEC formula remains solver-unknown after independent
300-second Z3 and cvc5 runs; a 36-pattern moving-anchor numerical search found
no survivor but is neither UNSAT nor exhaustive outside one radial subclass.

The next staged computation must isolate the common six-point physical circle
plus the three completed rows while enumerating all source-permitted radial
gaps.  Add the cap and `A,U,V` circumdisk packet only after that reduced metric
coupling is classified, then add deletion-survival and late-system provenance.
Only a checked UNSAT core at one of those stages should be promoted to a Lean
obstruction; a survivor moves the frontier to the next stage.

Wave 4 has now discharged the two-row portion of that stage with an exact
rational Stage-B witness accepted by Z3 and cvc5.  The three-row Stage A
surface is still unknown; its order-free and targeted numerical searches
approached collapsed supports but did not prove UNSAT.  The next run should
hold the exact two-row witness fixed and search the third row in the five
parameters `(s,t,k,ℓ,r)` with exposing-normal and center-semicircle margins.
If that extension has no numerical survivor, release the first two rows in
expanding trust regions before considering alias graphs or stronger B1
provenance.

The later alias dispatcher is now finite at the source level: there are 12
completion-support equality orbits after within-pair swaps and the `u ↔ v`
source symmetry, with union-support sizes from two through six.  Wave 5 tested
the fresh-distinct size-six orbit with the exact two-row witness fixed and then
with trust radii `0.02`, `0.1`, and `0.5`; it remained numerically unknown and
reached at most 14 of 16 hull vertices.  Before another continuous wave, test
the exact center-semicircle and cyclic-order consequences.  That audit is now
complete and retains all 3,603,600 global merges and 8,000 local triples, so it
does not provide an obstruction.  The next fresh-distinct computation must use
a genuinely metric invariant or a stronger exact encoding; another order-only
wave has no target.  If a later checked obstruction is found, subsequent alias
runs should descend through support sizes five, four, three, and two rather
than enumerate labeled aliases separately.

The twelve-orbit census covers only equalities among the six completion slots.
The source currently also permits a completion to coincide with `A` or another
row's blocker, and a blocker to coincide with a foreign physical point.  The
full 16-role audit is now complete: 78 inequality edges leave 94,381 labeled
partitions and 7,287 conservative symmetry orbits.  Screen these orbits against
the installed collision kernels before opening the alias-aware metric wave.
The audited exterior-wing shadow identity can then prune forbidden completion
arcs, while inner-arc branches must remain.

The corrected installed-kernel screen removes 829 orbits through the existing
`DuplicateCenterCore`.  Field-exact SixPointFive A/B/C matching finds 76
orbits, all already inside that family, so it adds no further removal.  The
remaining card-six frontier has 82,605 labeled partitions in 6,458 orbits.
Wave 6 must first
retain a reproducible enumerator for these counts, because the exploratory
alias script was not preserved, and then apply unordered-edge consistency,
order masks, endpoint-shadow pruning, and quotient-coordinate metric checks.
This is a card-six wave only.  In parallel, derive separate source schemas for
the three card-five trace shapes and do not infer their coverage from the
16-role result.  For Lean promotion, reuse the cardinality-generic positive
row checker in `GenericRowNogoodCertificate`; the new obligation is the
B1-specific four-row role packet and its source coverage theorem.

The 2026-09-01 cross-wave raw-data audit checked the retained Wave 6 orbit
records directly.  All 433 orbits surviving exact-edge and endpoint-shadow
pruning have seven distinct physical labels because the screen explicitly
assumes the card-six physical `K6` inequalities, while 432 still contain an
auxiliary alias.  The cardinality half of the physical premise is now
formalized by
`B1CardSixPhysicalIngress.oppApex2_not_mem_selectedClass` and
`B1CardSixPhysicalIngress.physicalClassWithApex_card_eq_seven` in
`B1CardSixPhysicalRoleIngress.lean`: the physical apex together with a
six-element positive-radius class has seven elements.  This does not yet
identify six named packet roles with that class, and it imposes no condition
on completion roles.  It is a source-ingress improvement, not closure of the
normal-form consumer.  The remaining local-order frontier is 1,609 labeled
partitions in 134 orbits.

The card-five source packet is now Lean-checked and independently audited.  It
proves the three trace shapes and packages all four metric rows, including a
three-point completion packet for the singleton live slice.  Replace the old
13-role conservative asymmetric census with a new full-row alias screen based
on this packet; keep the two asymmetric orientations separate unless their
source symmetry is proved explicitly.  The remaining promotion problem is no
longer naming the rows, but covering every packet by a checked obstruction or
a complete metric residual.

The checked existential global ingress is `B1LiveSlicesSameBoundaryArc`: it
supplies one complete-carrier `BoundaryIndexing` and conditional
same-boundary-arc fields for whichever live slice has cardinality two.  The
consumer
`false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc`
checks that this ingress closes the normal-form leaf.  Wave 7 tested the fixed
near-survivor order cell with four deterministic numerical searches; the
verdict is `UNKNOWN`, with best margin `-0.04620695120742889`, and the
repeated collapse toward coincident physical parameters and blocker scale
one-half is `NO_NEW_PATTERN` (receipt
`58dae5365ceb6171d4ed73fa0fd5a6db4775765dff4291b683f5a69f7881dcf4`).  The
actual missing producer is same-boundary-arc order.  The next refinement needs
a new provenance/source family or an upstream extremal selection, not another
order-only fixed numerical wave.

The follow-up `B1WinningLiveSliceIngress.lean` narrows that contract further.
`B1WinningLiveSliceSameBoundaryArc` asks for only one named card-two live slice
and its same-arc bit, and `false_of_b1WinningLiveSliceSameBoundaryArc` consumes
it without any additional normal-form hypothesis.  `B1SourceProvenance`
restores the historical `ExactFourMutualOmissionSourceContext`; when its source
differs from `u`, `b1_uSlice_eq_source_u_of_sourceProvenance` proves that the
entire live `u`-slice is exactly `{source,u}` and has cardinality two.  Thus the
next emitter no longer chooses the winning pair: it must add genuinely new
escape-row/deletion-survival provenance and solve only the remaining cyclic
placement.  All three new theorems build with only `propext`,
`Classical.choice`, and `Quot.sound`.

`nonempty_b1EscapeRowProvenanceStar` now packages that next source boundary in
Lean.  From every five/six normal form it emits a complete-carrier boundary
indexing, the existing `B1EscapeWitness`, the winning card-two disjunction,
membership of the escape source in one live slice, and the original-deletion
cross-omission disjunction.  It remains label-polymorphic and makes no
same-arc assertion.  The theorem has only the three core axioms.  A bounded
reuse preflight over the project Lean corpus found no producer for the final
cyclic-placement field: the apparent search hit merely juxtaposed cross
omission, card two, deleted-pair bisector saturation, the target definition,
and the conditional consumer.

`b1_escapeSource_mem_escapeRow_inter_liveSlice` exposes the strongest immediate
row/slice incidence consequence separately: the escape source belongs to its
escape row intersected with one of the two live slices.  This is a useful typed
ingress field, but it still contains no same-boundary-arc assertion and is not a
closure result.

A refreshed cross-project reuse preflight for this stronger ingress found
`RVOL.P97.WitnessLapInterface.strictLapPacket_nonreturn` at RVOL source revision
`3380775`.  Its immediate use here would require producing a `StrictLapPacket`
from the escape-row star.  The first missing antecedent is exactly the three
strict boundary pushes and their global-order glue; the RVOL module labels that
production direction as open prose work.  Importing the terminal alone would
therefore move the same cyclic-placement obligation and would not reduce the B1
frontier.

The same source module now also exposes the escaped-deletion continuation
surface without choosing a finite ambient carrier.  From a
`B1EscapeCrossDeletionPacket`, `b1ContinuationCase_of_packet` proves an
exhaustive nine-constructor split: two escape-blocker coincidences, three
deleted-source coincidences, and four forward/reverse deletion-survival pairs.
`b1ContinuationCase_of_counterexample` produces such a packet and case directly
from every `B1GlobalTransportContext`.  These declarations are source producers,
not terminal consumers: no theorem currently rules out every constructor, and
they do not close `false_of_b1PhysicalClassFiveSixNormalForm` by themselves.

## 2026-09-02 fresh interior source routing

`b1_freshInteriorEscape_context_or_firstClass_or_bad` now routes the concrete
strict-second-cap-interior escape source produced by
`b1_live_exists_third_interior_escape`.  Under the five/six normal form and the
frontier pair identifications, it either constructs a neutral
`B1EscapeSourceContext`, or records that this source is in the first-apex class,
or records membership in `badOutsideSources`.  The context arm uses the
normal-form cover to recover live-row membership and derives retained-deletion
survival directly from the complement of the bad set.  The focused
`B1WinningSliceOrderOutcome` build is green and the file has no new `sorry`,
`axiom`, or `admit`.  This is an upstream producer refinement; the target
consumer remains open until the first-class and bad-source residuals receive
their own source-level consumers.

The companion producer `b1_goodOutsideInteriorSource_context_or_deleted`
reuses the checked good-outside strict-interior source theorem.  It constructs
the same neutral context whenever that source is distinct from both deleted
roles, and otherwise records the exact deleted-source coincidence together
with its retained-deletion witness.  This removes the need to rediscover the
goodness split downstream; it does not remove the coincidence residual.

The favorable source arm now has a sound ingress adapter in
`TwoDeletionCollision.lean`: `exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext`
feeds the retained source class/interior/outside/survival fields into
`exists_exactFourMutualOmissionSourceContext_of_fivePointInteriorSource`.
It deliberately stops before `false_of_exactFourMutualOmissionJointDeletion`,
whose current rigid-221 dependency chain still carries `sorryAx`.  The
remaining work is to produce the source context (or a direct order
contradiction) from every five/six normal-form branch and then close the
sound downstream consumer.

## 2026-09-01 PiQD producer update

The claimed declarative `piqc campaign run <plan.json>` surface is not currently
usable.  PiQD message 8527 retracted its earlier Phase A completion claim after
a whole-branch review found three end-to-end defects: the client reads a
nonexistent top-level `campaign_id` instead of the daemon's nested
`campaign.id`; the daemon refuses campaign records for failed or still-running
jobs, so `ERROR` and `UNKNOWN` abort the run; and the plan's default
`caller_checked` policy conflicts with the daemon default, preventing a default
plan from minting complete coverage.  The hermetic client mocks did not model
the daemon's actual response contract.  Treat Phase A as unavailable until the
fixing commits land and a real client-to-daemon contract test passes.  Stateful
SMT sessions' exact same-solver ground-formula replay, including per-solve
assumptions, is unaffected, but it does not provide the missing campaign
producer.

Therefore Wave 8 must not reintroduce a project-local Python runner.  Its next
admissible computational checkpoint is a typed B1 ingress plus a declarative
source packet derived from the Lean producers above.  The typed contract must
require strict convexity/`ConvexIndep`, retain arbitrary ambient cardinality,
model aliases through role-to-physical-point bindings, and require only the
within-slice, within-completion, and explicit escape-star inequalities already
proved in Lean.  In particular, `B1WinningLiveSliceSameBoundaryArc` is the
desired order conclusion consumed by the checked contradiction theorem; it is
not an input atom.

Implementation of that typed PiQD ingress was claimed in `#piqd` message 8485
and remains unverified here until its source schema, producer invocation, tests,
and live `GET /version` identity are checked.  Until then, the Lean-side work is
to retain the source-complete role and continuation packets and avoid encoding
stronger aliases or cyclic-order facts than their constructors provide.

The committed packet checkpoint `aec7bc08f` is now wired into
`TwoDeletionCollision` through `B1FiveSixWaveIngress`; that module transitively
reaches all four new B1 modules without a cycle.  Its
`nonempty_b1FiveSixWaveIngress` theorem packages one escape-row provenance star
together with exactly one card-five or card-six local-role packet, directly
from the active residual's `C` and `hnormal`.  Focused builds of the ingress,
`TwoDeletionCollision`, and the `FrontierLiveClosure` root pass.  The spine
still has exactly one open B1 obligation: no current theorem consumes this
combined packet to prove the missing global cyclic-placement contradiction.

The bounded reuse preflight for this combined-ingress candidate used the
repository Lean index at source revision `aec7bc08f`.  It found no existing
theorem pairing the escape-row star with the five/six local-role case; the
closest hit, `B1CardSixPhysicalIngress.physicalClassWithApex_card_eq_seven`,
supplies only the card-six physical-apex cardinality fact.  The immediate
consumer is the typed campaign producer, and the first missing antecedent after
this packaging remains its globally checked cyclic-placement conclusion.

The pro-model exact-five bundle
`p97-exact-five-closure-push-complete-2026-09-01.tar.gz` was audited at outer
SHA-256 `09beda297ce10a4530dd3ac5801efc6432b95eb3c249f3cf760aaaf5f96aeb4b`.
Its 53 regular files and all outer/nested checksum lists are byte-consistent,
but the bundle contains no Lean build, axiom audit, solver input, executable
validation source, PiQD receipt, or kernel certificate.  Its most important
correction is valid: the proposed arbitrary flexible source pair does not
supply the physical-class source fields required by the current B1 packet.

The corrected exact-five trace split proposes a physical good pair or a
fixed-point-free physical trace permutation of cycle type `2+3` or `5`; the
included 3,125-map enumeration is regression evidence for that finite claim,
not proof evidence.  This split is upstream of the present residual: the active
B1 context already carries the physical good pair `u,v` and two distinct
physical deletions omitted from both rows.  Formalizing the split would not
consume `B1FiveSixWaveIngress` or narrow the current `sorry`.  The bundle's
adjacent-boundary-edge center-uniqueness proposal is likewise only a supporting
order lemma; without a source proof that the winning live pair is adjacent (or
an equivalent global incidence argument), it does not produce
`B1WinningLiveSliceSameBoundaryArc`.

The missing post-wave theorem mines have now been backfilled for exact-12
Waves 14--20 and normal-form Waves 1--6.  The normal-form campaign scan over
Waves 1--7 reports `PASS` with seven `VALID_RECEIPT` rows; the exact-12
campaign scan also passes.  Waves 1--6 remain historical backfills and Wave 7
is the current-gate receipt.  Across both campaigns there are 14 records; the
receipts repair the audit history but
authorize no successor by themselves.  They record four exact QQ-core
candidates, the normal-form Wave 4 weaker three-row obstruction key, and the
Wave 6 open-minor-endpoint-arc adapter; Wave 7 records `NO_NEW_PATTERN`.
Historical bounded reuse preflights and later exact classifications remain
distinct from this gate.  Future bespoke SAT, SMT, exact-algebra,
enumeration, UNKNOWN, timeout, and budget-stop runs must emit a validated
current-wave receipt before their output can launch a successor.

## Verification gates

```bash
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.EqualBlockerContinuation
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletion.Coordinator
proof-blueprint refs --refresh
proof-blueprint spine
proof-blueprint axioms Problem97.erdos97_rhs
uv run python scripts/check_worktree_hygiene.py report --lane b1-global-continuation-20260829
```

All three targeted builds and the full 12,052-job repository build passed at
proof-blueprint build `e373ee042532`. The producer reported only the three core
axioms. The old public target reached `sorryAx` only through the new
exact-five/six leaf, which was the sole B1 open obligation shown by that spine.
As of 2026-08-30 the cached reference mine has one stale reference; refresh it
before treating this paragraph as evidence about newer source.

After the expanded two-point-slice and row-completion ingress landed, the downstream
`TwoDeletionCollision` target rebuilt successfully on 2026-08-31.  Its
pre-existing open declarations, including the five/six consumer, remain
visible as `sorry` warnings; the new theorem itself has only the three core
axioms.

The card-five local-role packet now exports the same source-metric validation
already available for card six: any `DuplicateCenterCore` over its four named
rows is ruled out by the canonical carrier realization, both for a checked
`DuplicateCenterData` record and for an assumed core.  This is a kernel-clean
local certificate consumer, but it does not manufacture a certificate and does
not close `false_of_b1PhysicalClassFiveSixNormalForm`; the missing global
order/source-context producer remains the sole open B1 leaf.  A fresh history
audit found no earlier source-clean proof of that leaf, including unreachable
refactor commits.

The source ingress now also has a residual split that uses the residual's own
`interior_q`/`interior_w` fields: the named escape source either yields a full
`B1EscapeSourceContext`, lies in the first-apex class, or belongs to the
interior-pair-bad set.  This removes the optional frontier-pair identification
from that adapter; it still does not discharge the first-class/bad alternatives
or provide the missing boundary order.

The B1-only invocation of the registry's own `BlueprintBackend`, alias planner,
and factorization checker accepts the stable-ID migration and verifies the five
roles with zero violations.  The canonical all-project generator currently
refused transactionally at this checkpoint because of 83 then-pre-existing
Rigid221 factorization violations; it wrote none of its three generated files.
The independently verified B1 registry and ID-assignment delta was therefore
applied narrowly. The 2026-08-30 registry re-anchor subsequently incorporated
the validated B1 and Rigid221 factorization records. Historical receipts remain
immutable.

## 2026-09-02 closure audit

The remaining leaf was rechecked against the current source and bounded
theorem-mining results. No source-clean consumer derives `False` from the
five/six normal form when both canonical deleted sources are strict
second-cap-interior; the strongest available consequence is
`b1_live_common_blocker_mem_secondCapInterior`, which places the common blocker
in that cap. The tempting theorem
`b1_live_two_interior_sources_or_third_interior_joint_deletion` is inside a
parked block comment in `B1Live.lean` and is not an active declaration. The
active cover producer adds a small-cover alternative and therefore does not
close the residual.

The target remains the sole open spine declaration:
`false_of_b1PhysicalClassFiveSixNormalForm` at
`TwoDeletionCollision.lean:932`. The positive
`B1GlobalGapOrClosedTerminal` disjunction cannot replace it: its three arms
are separately refuted by exact two-point bisector saturation, the carrier
bisector bound, and the strict-interior escape with overlap at most two.
Closing the leaf now requires one new global center/order/minimality theorem
or a validated certificate beyond the present B1 interface; no such theorem
has been found.

## 2026-09-02 card-six cap residual checkpoint

The zero-cut escape ingress now retains the boundary indices and cap-block
certificate needed to prove that the strict second cap is order-convex.  The
resulting cap-to-order adapter is intentionally conditional: a two-point slice
inside the strict cap lies on one boundary arc only when its blocker is outside
that cap.

The card-six branch has been reduced further without adding an axiom.  Convex
independence bounds the physical class outside the strict second cap by two,
so an exact six-point class has at least four strict-interior members.  Since
the normal form partitions that class into three disjoint two-point packets
(the deleted pair and the two live slices), a finite pigeonhole lemma forces
one complete packet into the strict cap.  The theorem
`b1_cardSix_interior_pair_and_blocker` then localizes the corresponding actual
blocker there as well: the common blocker for the deleted pair, or the `u`/`v`
row blocker for the matching live pair.

This corrects the tempting but invalid favorable split.  If the escape
source's live mate is also strict-interior, the live-row blocker is forced
strict-interior rather than outside, so the same-arc adapter does not apply.
If the mate is outside, it is localized to one of the two adjacent closed
caps.  `B1CardSixCapOrderResidual` records exactly those two placements.
Current theorem mining found no source-clean consumer of a physical pair and
its blocker all in one strict cap, and the distinct-cap shell consumers do not
apply.

Verification at this checkpoint used two artifact-free source checks because
an unrelated shared-worktree `lake build` still held the global build lock.
`B1WinningLiveSliceIngress.lean` compiled directly with no errors; its temporary
`.olean` was then supplied through a copied Lean setup manifest while
`B1WinningSliceOrderOutcome.lean` was compiled, also with no errors.  The pure
three-pair pigeonhole theorem was separately checked from `import Mathlib`.
An authoritative locked `lake-build` remains required before promotion beyond
this checkpoint.

## 2026-09-02 endpoint-order residual refinement

The strict-cap branch now has a checked order consequence rather than only a
placement statement.  `separatedPair_exchange` proves the order-only symmetry
of alternating pairs.  Combined with strict-cap order convexity and the exact
two-center separation theorem, this yields
`B1EscapeRowProvenanceStar.liveRowBlocker_btw_of_two_points`: whenever two
distinct points of one live row lie in both the physical second-apex class and
the strict second cap, the live-row blocker lies strictly between their two
indices in the retained linear boundary order.  This is only the linear-order
component of Wave 6's `UNIT_BLOCKER_LIES_IN_OPEN_MINOR_ENDPOINT_ARC`; it does
not identify the shorter cyclic arc.

`B1EscapeSliceEndpointOrderResidual` packages the resulting exact split for
any two-point live slice containing the escape source.  Its mate either lies
in one of the two adjacent closed caps or the corresponding row blocker lies
strictly between source and mate.  Card six always emits this sharpened packet
via `nonempty_b1CardSixEndpointOrderResidual`.  Independently,
`b1_cardSix_some_pair_blocker_btw` combines the six-point cap count with the
three-pair pigeonhole theorem and proves that at least one of the deleted,
`u`-live, or `v`-live physical pairs has its corresponding blocker between its
endpoints.

The same generic adapter also consumes both two-point arms of the exact
card-five trace.  `nonempty_b1CardFiveEndpointOrderResidual` leaves only an
endpoint-order packet or the explicit alternatives that the escape source is
exactly `C.u` or exactly `C.v`: a singleton live slice already contains its
canonical source, so its other member cannot be the escape source.  Thus the
order formalization is no longer specific to card six, and the card-five
singleton branch has been reduced from a cardinality fact to a role identity.
`b1_fiveSixEndpointResidual_of_normalForm` now packages these two branches in
one dependent residual directly from the original normal form, retaining the
card-five/card-six role packet selected by the combined ingress.

A bounded consumer audit found no active theorem that turns either the
blocker-between packet or the adjacent-cap mate into `False`, a winning
same-arc packet, or a source context.  The adjacent-cap audit does recover
directed source/mate order separately in the direct/mirror and left/right cap
cases, but the blocker remains unlocalized there.  The next mathematical
consumer must therefore supply one of two genuinely global facts: locate the
row blocker in the adjacent-mate branch, or combine the directed boundary
crossing/blocker-between alternatives with deletion survival, mutual omission,
or a proof-carrying endpoint certificate.  The top-level B1 theorem remains
open at this checkpoint; no new `sorry` was introduced.

The singleton-role follow-up mine found no hidden source-context bridge for
`C.u` or `C.v`.  `B1GlobalTransportContext` gives their second-class
membership, mutual row omissions, and joint-deletion packets, but not
outside-first-apex-fiber membership or retained `interior_q`/`interior_w`
survival.  The existing source-context adapter therefore still needs two
source-specific antecedents: first-apex-class nonmembership and either one
retained deletion survival or nonmembership in
`interiorPairBadOutsideSources`.  The theorem that chooses some good outside
source cannot identify that source with `C.u` or `C.v`, and the two-source
first-apex split additionally requires both live sources to be strict
second-cap-interior.

## 2026-09-02 cross-incidence residual reduction

The next residual pass works from the physical second-apex class rather than
adding another endpoint-order packet.  Convex independence gives a generic
blocker-rigidity lemma: if two distinct physical-class sources occur in each
other's actual late rows, their blockers coincide.  Consequently, distinct
blockers force the reverse row hit to be absent.  This closes the
reverse-hit/distinct-blocker combination that remained unconstrained by the
cardinality-only role packets.  In metric form every named live pair therefore
gives either blocker equality or survival of the mate's exact-four row after
deleting the distinguished live source.  Both card-six live pairs now emit
that dichotomy directly.

The first nontrivial application is the exact card-five shared-pair trace.
Its two named non-source endpoints are one common mate: the one-point overlap,
the exact two-point slice identities, and the original `u`/`v` mutual
omissions exclude every other intersection.  That mate's actual row cannot
then contain both `u` and `v`; reciprocal membership with both would identify
the mate blocker with each of the two canonical live blockers, contradicting
the blocker inequality stored in either canonical joint deletion.  The
remaining shared-pair residual is therefore a genuine directed omission

```text
u ∉ row(mate)  ∨  v ∉ row(mate).
```

The source-clean survival adapter immediately converts this to the more useful
metric disjunction that the mate's exact-four row survives deletion of `u` or
survives deletion of `v`.

This is a strict reduction of the card-five incidence surface, not yet the
top-level B1 contradiction.  Its immediate next consumer must use the
resulting cross-deletion survival or reindex the joint-deletion walk without
calling the still-open rigid terminal.  The adjacent-cap card-six route was
also checked against `firstApex_marginal_inter_secondClass_card_le_one`; it
cannot force the escape source outside the first-apex class because the B1
interface supplies no second distinct cross-class point.

A source-clean consumer audit rules out a tempting but nonproductive next
wrapper.  Pairing this mate-row survival with physical-second-apex robustness
does construct `CommonDeletionTwoCenterPacket`, but the only import-reachable
generic consumer, `physicalSecondApex_commonDeletion_robust_or_critical`,
merely returns a robustness/critical-shell residual.  The paired and
bi-survival consumers require a retained-first-apex orientation or two packets
at a common blocker pair that B1 does not supply.  The existing
`B1EscapeCrossDeletionPacket` is already constructible directly from a
canonical-deletion omission and therefore does not consume the new `u`/`v`
mate survival.  No common-deletion packet wrapper is added at this checkpoint;
the first missing antecedent is still a global order/cross-role fact, not the
local packet constructor.

The global good-source count does, however, sharpen the source branch itself.
`b1_escapeSourceContext_or_goodCanonicalDeletion` applies
`exists_interiorPairGoodOutsideSource_mem_secondClassInterior` directly to the
B1 physical class.  If its counted source is distinct from both known
deletions, the normal-form cover constructs `B1EscapeSourceContext`.  Otherwise
the new `B1GoodCanonicalDeletionResidual` records that at least one canonical
deletion is strict second-cap-interior, both canonical deletions lie outside
the first-apex blocker fibre, and their common blocker survives deletion of
`R.interior_q` or `R.interior_w`.  The transfer to both sources uses their
stored actual-blocker equality.  This eliminates the earlier broad
first-class/interior-pair-bad alternatives for the globally counted source;
the remaining source residual is now pinned to one of the two canonical
deletions.  It does not remove the separately defined `badOutsideSources`
alternative without identifying `R.interior_q/R.interior_w` with the frontier
pair.  A direct source elaboration check accepts this theorem without new
axioms; authoritative locked build verification remains part of the checkpoint
gate.

The equal canonical blockers also transfer outside-first-fibre membership
between the two deletions, so the residual records both sources outside that
fibre rather than only the counted one.  Its boundary refinement,
`B1GoodCanonicalDeletionResidual.toEndpointResidual`, uses the zero-cut
boundary retained by the wave ingress.  If the other deletion is not strict
second-cap-interior, convex cap localization places it in an adjacent cap.  If
both deletions are strict-interior, equality of their selected supports and
the shared-pair separation theorem put their common blocker strictly between
their boundary indices.  Thus the remaining canonical branch now carries the
retained deletion survival and the exact adjacent-or-between order split; an
active terminal consuming that combined packet is still missing.
`b1_escapeSourceContext_or_goodCanonicalDeletionEndpoint` is the single
normal-form/wave-ingress producer for this final dichotomy.

The canonical residual exactly matches the hypotheses of
`false_of_exactFourPostCardElevenInteriorDeletionBranch` in
`Rigid221Closure.lean`: choose whichever canonical deletion is strict-interior,
use its physical-class and outside-fibre fields, and rewrite the retained
survival through the common-blocker equality.  This is not yet a legal B1
consumer.  `Rigid221Closure` reaches `TwoDeletionCollision` through the
source-heavy/legacy/two-deletion coordinator import chain, so importing it here
would be circular; its terminal chain also still contains open sorry leaves.
The source-clean part of that chain only reconstructs a mutually omitted pair
and a joint deletion.  The remaining closure work is therefore to factor or
prove an upstream canonical-deletion terminal, not to produce more local B1
packets.

The first canonical-deletion residual reduction now stays with the original
B1 pair.  `B1GoodCanonicalDeletionResidual.exists_omittedPeer_mem_liveSlice`
chooses the canonical deletion supplied by the residual and applies
`exists_omittedSecondClassInteriorPeer` to its actual row.  The omitted peer
has a distinct blocker, so it cannot be either canonical deletion: it differs
from the chosen source directly, and equality with the other deletion would
contradict `C.hblockersEq`.  The normal-form cover then forces the peer into
`b1USlice C` or `b1VSlice C` of the original `C.u, C.v` pair.  The strengthened
`B1GoodCanonicalDeletionEndpointResidual` retains this witness together with
the retained survival and adjacent-or-between endpoint data.  This strictly
reduces the free role of the omitted strict-interior peer before invoking the
broader mutually-omitted-pair producer.

Do not infer that a joint deletion generated later by
`exists_exactFourMutualOmissionSourceContext_of_fivePointInteriorSource` is one
of the original canonical deletions.  That theorem chooses a fresh mutually
omitted pair `u, v`; its joint deletion is absent from the fresh `u`- and
`v`-rows, whereas `B1PhysicalClassFiveSixNormalForm` covers the physical class
using the original rows of `C.u` and `C.v`.  No current equality or row-support
transport identifies those pairs.  The first missing antecedent in both the
exact-five and card-at-least-six recurrence remains that pair transport.

The first cross-system residual is now formalized rather than left implicit.
`B1GoodCanonicalDeletionResidual.exists_freshPair_deletion_role` runs the
source-clean mutually-omitted-pair producer at whichever canonical deletion
is strict-interior, transporting the residual's outside-first-fibre and
retained-survival facts to that exact source.  The fresh joint deletion cannot
equal the chosen canonical source: its packet omits the deletion from the
fresh `u`-row, while the source context puts the chosen source in that row.
The original normal-form cover then leaves only two roles for the fresh
deletion: it is one of the two canonical deletions, or it lies in an original
`b1USlice C`/`b1VSlice C`.  This removes the chosen-source coincidence from
the fresh-pair recurrence without making the invalid fresh/original pair
identification.  A bounded indexed search found no existing theorem already
packaging this split.  The next split should distinguish the other-canonical
case from the original-live-slice case and exploit the extra row omission in
each branch.

The fresh pair itself is now transported before that deletion-role split.
`b1_freshPair_source_or_mem_original_liveSlices` uses the source context's
`v_not_mem_source_row` and `u_eq_source_or_not_mem_source_row`.  A canonical
source row is the common canonical row and contains both canonical deletions,
so any physical-class endpoint omitted from it is noncanonical; the original
normal-form cover then puts it in an original live slice.  Therefore fresh
`v` is always in `b1USlice C` or `b1VSlice C`, and fresh `u` is either the
chosen canonical source or in one of those slices.  The fresh pair is no
longer arbitrary relative to the original B1 trace.

The other-canonical branch now has that transport.  In
`b1_freshPair_mem_original_liveSlices_of_deletion_eq_otherCanonical`, the
fresh joint deletion is assumed to be the canonical deletion opposite the
chosen good source.  If the fresh `u` were the source, the joint-deletion
packet would omit the opposite canonical deletion from the source row,
contradicting the equal-canonical-support normal form.  Hence the source
context's second alternative puts `u` outside the source/common row; its
explicit `v` omission does the same for `v`.  Since both canonical deletions
belong to that common row, neither fresh endpoint is canonical, and the
original normal-form cover puts both in `b1USlice C` or `b1VSlice C`.
Equality of the fresh `u` blocker with the common blocker would identify the
two supports and contradict the same omission, so blocker inequality is
retained as well.  This closes pair transport for the entire
fresh-deletion-equals-other-canonical branch.  The remaining cross-system
branch is now specifically that the fresh deletion itself lies in an
original live slice.

`b1_freshPair_crossSystem_split` exposes this as the exact two-arm consumer
contract.  Given the generated source context and deletion-role split, either
the fresh deletion lies in an original live slice, or both fresh mutually
omitted endpoints do and the source/`u` blockers are distinct.  There is no
remaining unclassified fresh carrier in this recurrence.  Subsequent work
should use the exact card-five/card-six live-slice traces to identify the
allowed endpoint roles in these two arms; returning to an arbitrary fresh
pair would discard the transport just proved.

The exact-card-five count is now exposed independently of the three trace
constructors.  `b1_liveSlices_union_card_eq_three` proves that the original
live-slice union consists of exactly the three noncanonical physical-class
points: the normal-form cover has a disjoint two-point canonical-deletion
part and the whole physical class has cardinality five.  Consequently,
`b1_cardFive_freshTriple_eq_originalLiveSlices` upgrades membership to exact
identity whenever fresh `u`, fresh `v`, and the fresh joint deletion all lie
in that union.  Their packet inequalities make those three points distinct,
so they exhaust the original live union.  The unresolved exact-five cases are
now the other-canonical deletion arm, and the live-deletion arm with
`u = source`; the fully live triple has no further cardinal-role ambiguity.
