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
   through the checked directed cross-omission and four-center split to two
   older terminal leaves.  Those leaves remain open; the split and dispatch
   are source-clean, but their terminal `False` theorems are not.
5. `false_of_b1ThirdJointDeletionOrPhysicalClassFiveSixNormalForm` consumes the
   split, and `false_of_b1GlobalTransportContext` composes producer and
   consumer.
6. `b1_globalGapOrClosedTerminal_of_counterexample` is syntactically a
   compatibility wrapper over that coordinator.  It is not source-closed:
   its transitive axiom closure still reaches the three open declarations
   listed below.

The exact-five/six reduction introduced one new open declaration,
`false_of_b1PhysicalClassFiveSixNormalForm`.  The headline also continues to
depend on the pre-existing
`false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`
and
`false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`
leaves.  Closing only the new normal-form leaf would therefore not yet make
the headline promotable.

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

The fully live exact-card-five triple now has a further source-clean
elimination.  `b1_cardFive_freshDeletion_eq_originalSource` proves that its
fresh joint deletion is one of the original live sources `C.u` or `C.v`.  If
it were neither, exact exhaustion would force the two fresh endpoints to be
the original `C.u,C.v` pair in one of the two orientations.  The fresh
deletion is then in one of the corresponding original row traces, while its
joint-deletion packet says that it is omitted from both fresh endpoint rows,
a direct contradiction.  Thus the live-deletion arm has only two residual
forms: the fresh first endpoint is the chosen canonical source, or the fresh
deletion is an original live source.  This does not yet consume either form,
but it removes the generic three-role permutation residual without adding an
order or metric assumption.

`b1_cardFive_freshPair_role_split` wires that elimination into the complete
fresh-pair transport packet.  Its three remaining arms are now exact: (1) the
fresh first endpoint is the chosen canonical source and the fresh deletion is
live; (2) the fresh deletion is one of the original live sources and both
fresh endpoints are live; or (3) the fresh deletion is the canonical deletion
opposite the chosen source, both fresh endpoints are live, and the source and
fresh-first-endpoint blockers are distinct.  This is the current card-five
consumer boundary.  The next theorem must use row geometry or deletion
minimality to eliminate one of these three explicit arms; repeating the
cardinality split cannot sharpen it further.

The original-source deletion arm now carries an exact trace consequence.
`b1_cardFive_oppositeSlice_singleton_of_freshDeletion` uses the fresh mutual
omission and joint-deletion omission to prove that deleting `C.u` forces
`b1VSlice C = {C.v}`, while deleting `C.v` forces
`b1USlice C = {C.u}`.  This is the first direct bridge from the fresh-pair
recurrence back into the card-five trace constructors.  It makes the next
consumer concrete inside the canonical-source branch, but it cannot be
combined directly with the escape-source adapter.  The escape packet proves
its source is distinct from both canonical deleted sources, whereas
`b1_freshPair_crossSystem_split` and `b1_cardFive_freshPair_role_split`
require the fresh-pair source to be one of those canonical deletions.  A fresh
theorem-mining and import audit found no endpoint identification
`{u,v} = {C.u,C.v}` and no generalized no-third consumer for arbitrary fresh
pairs.  The current no-third hypothesis quantifies only joint-deletion packets
over the fixed pair `C.u,C.v`.  The next valid bridge must therefore produce
proof-relevant unordered endpoint identification, or strengthen the upstream
no-third theorem to arbitrary fresh pairs, before dependent packet transport;
do not mix the disjoint canonical-source and escape-source branches.

There is nevertheless a stronger source-clean split on the fresh pair that
should replace attempts to identify it prematurely.  At exact card five,
`exactFourMutualOmissionJointDeletion_exactFive_strongSplit` produces either a
second distinct joint deletion for that same fresh pair or its rigid disjoint
`2+2` row cover.  At card six,
`exists_two_exactFourMutualOmissionJointDeletions` always produces two distinct
joint deletions from the fresh pair's blocker inequality.  These theorems do
not yet close the escape arm: distinct actual blockers enter the still-open
blocker-coincidence/survival-square consumers, while equal actual blockers
construct another B1 global-transport context and are recursive unless the
retained noncanonical escape source supplies a strictly new terminal.  Audit
that source-rich equal-blocker arm and the exact-five rigid `2+2` arm before
formalizing another adapter.

The fresh-pair/escape-witness gap is now narrowed at the source-selection
boundary.  `b1_freshV_escapeStar_or_adjacentCap` starts from the fresh
endpoint `v`, whose source context says it is omitted from a canonical source
row.  That row is the canonical common row, so `v` is outside the common row
and distinct from both canonical deletions.  If `v` is strict second-cap
interior, `b1EscapeWitness_of_sourceData` supplies the complete local escape
witness and the theorem reuses the retained boundary to produce a new
`B1EscapeRowProvenanceStar` whose named source is explicitly equal to `v`.
If `v` is not strict-interior, the physical-class cap cover places it in an
adjacent cap.  The next immediate consumer is therefore the card-specific
endpoint-order producer applied to this replacement star; its adjacent arm
must then be compared with the fresh pair's row omissions, while its interior
arm has the fresh endpoint and named escape aligned.

For exact card five, that replacement star is now consumed immediately by
`b1_freshV_cardFiveEndpoint_or_originalSource_or_adjacentCap`.  The resulting
fresh-`v` placement split is: a two-point endpoint-order residual with the
named escape explicitly equal to `v`; `v = C.u`; `v = C.v`; or `v` in an
adjacent second-cap block.  This is stronger than the earlier anonymous
escape residual because the row omissions of the fresh pair remain available
to the caller under an exact endpoint identity.  The next geometric step is
to eliminate or exploit the adjacent placement and blocker-between arms using
those fresh cross-row omissions.

Verification checkpoint (2026-09-03): the three exact-card-five role/trace
theorems and the fresh-`v` replacement-star theorem compile from source and
passed independent source/axiom/circularity audits.  The governed
`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision`
completed successfully with 10,871 jobs.  Its subsequent best-effort
proof-blueprint resync encountered the repository's unrelated stale indexed
`ATailSevenSourcesOutsideTwoShells` declaration; the wrapper reported the
module build itself as successful.

The same replacement-star bridge is now connected to card six by
`b1_freshV_cardSixEndpoint_or_adjacentCap`.  Because the card-six local packet
certifies both live slices have cardinality two, an interior fresh `v` always
produces a named `B1CardSixEndpointOrderResidual`; otherwise `v` lies in an
adjacent cap.  There is no singleton-source alternative in this branch.  The
remaining card-six problem is therefore purely geometric: consume the
fresh-`v` adjacent placement or its mate/blocker-between endpoint packet using
the retained fresh-pair omissions.

The card-six refinement passed focused compilation, independent axiom and
circularity audit, and the governed 10,871-job module build.  Its dependency
closure contains only Lean's standard `propext`, `Classical.choice`, and
`Quot.sound` axioms.

## 2026-09-05 transitive-frontier reconciliation

The current source contains exactly three textual `sorry`s on the proof path
used by `b1_globalGapOrClosedTerminal_of_counterexample`:

1. the blocker-coincidence leaf at the common-deletion split;
2. the four-center survival-square leaf; and
3. `false_of_b1PhysicalClassFiveSixNormalForm`.

The actual-blocker refinement in
`TwoDeletion/ActualBlockerSquareRefinement.lean` source-cleanly recovers, for
an erased center `X`, the canonical actual blocker `pX := centerAt X`, the
directed omission `X ∉ selectedAt(q).support`, and the exhaustive alternative
that `pX` is one of the three named square centers or is fresh from all three.
`TwoDeletionCollision.lean` specializes this to the physical-apex square.  In
the `pX = bu` cell it derives the positive reverse incidence
`oppApex2 ∈ selectedAt(u).support`.

This is a genuine provenance improvement for the survival-square branch, but
it does not close that branch and does not feed the separate five/six
normal-form branch.  The exact rational local certificate in
`B1ApexUBlockerCell.lean` realizes the currently encoded apex/`bu` incidences,
deletion survivals, convex independence, convex boundary order, and an
alternating placement.  It does not construct `CounterexampleData`, so it is
a local negative control rather than a satisfiability result for the full
source cell.  Consequently no unconditional terminal may be inferred from
the refined packet alone.

An exact squared-distance census of that 13-point rational carrier makes the
missing global content concrete.  Only the physical apex (multiplicity six),
the `u` blocker (multiplicity four), and the common blocker (multiplicity
four) have four equidistant carrier points.  At each of the other ten carrier
points all twelve squared distances are distinct.  This shows that the local
cell omits the source-centered rows forced by `D.K4`, but a follow-up source
audit also rules out generic `D.K4` access as a sufficient next theorem.  The
available card-six dichotomy gives deletion survival at each live mate's
actual blocker, while `B1EscapeSourceContext` gives `q`/`w`-deletion survival
at an existential source.  Neither result has an on-spine consumer, and the
clean shared-pair contradiction instead requires a positive
`B1SliceSameBoundaryArc` witness; the rational cell realizes its negation.
The missing ingress must therefore relate a source-centered row to the live
pair through genuinely joint global incidence/order data.  Adding more
blocker-centered selected-row or cyclic-order atoms to this fixed pattern
would not test that missing `CounterexampleData` obligation.

The nearest raw-order bridge is also not an import-ready consumer chain.
`B1CardSixRawOrderBridge.RawCardSixBad` and
`B1CardSixRawOrderIngress.RawCardSixBad` are distinct namespace declarations
with different role-index encodings.  The bridge theorem
`rawCardSixBad_of_b1PhysicalClassFiveSixNormalForm` uses the former only in an
internal contradiction from `rawCardSixGood`; the ingress theorem
`false_of_b1PhysicalClassFiveSixNormalForm_of_not_rawCardSixBad` assumes the
negation of the latter.  No adapter connects them, and no producer exists for
`RoleBoundaryRestriction`.  Similar theorem names must not be treated as a
source-clean call chain without checking their fully qualified types.

Current frontier measure:

```text
(normal-form global producer absent,
 blocker-coincidence consumer absent,
 survival-square named/fresh consumer absent)
```

Production work must reduce one of these entries on the kernel-reachable
spine.  Repackaging the actual-blocker alternatives or adding another
conditional card-arc/source-context wrapper does not count.  The active
bounded searches are (a) a consumer for a named actual-blocker row hit or the
fresh-center arm, and (b) a genuinely global producer from the five/six wave
ingress.  The latter may use live-pair order, a third deleted-pair bisector
carrier, or the escape/common-row overlap terminal, but must retain the source
field that proves it.

### Auxiliary-leaf audit

Independent source audits and Luna lanes C/D found no terminal consumer for
either auxiliary leaf.  The blocker-coincidence disjunction
`first.deleted = blocker(u) ∨ first.deleted = blocker(v) ∨
first.deleted = blocker(second.deleted)` source-cleanly normalizes to a row
centered at the collided source, with the source omitted from that row.  This
is a coherent local normal form, not a contradiction obtainable by unpacking
the current packet.  Excluding it first requires a global cap, blocker-fibre,
or cyclic-incidence obstruction.

Applying `actualBlocker_alias_or_fresh_of_survivalSquare` to all four square
centers removes the three self-alias cases by `centerAt_ne_source`, but leaves
thirteen genuine subbranches: four for the physical apex and three each for
the `u` blocker, `v` blocker, and second-deletion blocker.  Every remaining
branch needs either a terminal for a named positive row incidence or a way to
exclude a fresh actual blocker.  The original `u`/`v` mutual omissions do not
constrain those centers.  The theorem-bank reuse preflight found no compatible
consumer: `BiSurvivalCanonicalRows` needs a two-deletion rectangle at the same
two centers, `interiorPairBad_source_blockers_eq` needs two deletion-failure
memberships, and the apparent six-center and retained-omission consumers are
both data-incompatible and downstream-circular.

Accordingly, all three textual leaves now share the same strict frontier:
global source/row incidence or order has not yet been connected to the local
normal forms.  The next computational refinement must include the relevant
source-centered `D.K4` rows and their incidences with the named live/blocker
roles, then mine a concrete minimal obstruction with an immediate geometric
consumer.  A proof that merely dispatches the three collision arms or the
thirteen square subbranches without adding such an obstruction does not reduce
the frontier.

This common information gap does not make the branch packets composable.
The survival-square and blocker-coincidence leaves occur in the explicit
third-joint-deletion arm.  By definition,
`B1PhysicalClassFiveSixNormalForm` is the opposite arm and retains the
negation of any such third deletion.  Consequently its five/six wave ingress,
escape star, and card-specific slice packets cannot be imported into either
third-deletion terminal.  Any shared theorem must be produced upstream from
`B1GlobalTransportContext` or proved separately in both branches.

The representative physical-apex alias `centerAt(oppApex2) = blocker(u)`
cannot be closed by the existing shared-pair theorem.  The selected row at the
physical apex, the first joint-deletion row at `blocker(u)`, and the canonical
row selected from source `u` all identify with the same support and the same
geometric center `blocker(u)`.  Their common points therefore do not furnish
the two distinct center labels required by
`selectedFourClass_shared_pair_separated`.  The other immediately available
rows omit one of the candidate pair points.  A useful refinement must produce
a genuinely second center whose row contains the same two named carriers; a
second presentation of the canonical `u` row is not new incidence.

### Declarative computational boundary

The deployed PIQD `PointConfiguration/v1` ingress now covers source-labelled
roles, strict convexity, named metric constraints, exact SAT-model replay, and
`piqc campaign run` custody.  It must be used for subsequent finite metric
probes instead of another wave-specific Python runner.  Its current schema,
however, takes `common_radius.members` as a static JSON array, and campaign
axes substitute only scalar strings.  It cannot declaratively select four
distinct equidistant witnesses from the boundary or enumerate their aliases.
Consequently a full `D.K4` refinement still requires an external support-case
generator, which is precisely the behavior this lane must avoid.

The active exact-thirteen campaign already carries one existential K4 witness
row per raw center, but its sole terminal core is pinned to a different role
cell and cannot project source-faithfully onto the three collision plus
thirteen square branches.  Its unpinned runs remain SAT-refining.  A focused
PIQD follow-up request was posted as conversation message `#14877`: add a
typed existential equidistant-witness-set constraint, deterministic witness
selection/replay, and source-bound alias handling so the sixteen cells can be
expressed as one declarative campaign plan.  Formula results remain diagnostic
until a label-polymorphic Lean kernel and source bridge are identified.

### Survival-square recurrence audit

The survival square does not currently yield a useful two-core recurrence.
For a square center `X`, its second conjunct does construct a source-clean
`JointDeletionCore` with source `first.deleted`, deleted point `X`, and blocker
`centerAt(first.deleted)`.  The attempted reverse core, with source `X` and
deleted point `first.deleted`, fails first at
`omitted_of_mem_fixedOmissions`: that core's canonical blocker is
`pX := centerAt X`, while the square supplies survival after deleting
`first.deleted` at the geometric point `X`, not at `pX`.

`actualBlocker_alias_or_fresh_of_survivalSquare` can repair this mismatch in
the named-alias branches, where `pX` is one of the existing packet blockers,
but not in the fresh-blocker branch.  Moreover, the current theorem bank has
no consumer of two mutually oriented `JointDeletionCore` packets:
`JointDeletionCore.Agree` requires the same source and deletion, while
`BiSurvivalCanonicalRows` requires a full two-deletion rectangle rather than
the two crossed survivals supplied here.  A one-way or conditionally paired
core constructor would therefore be off-spine.  Do not formalize it unless a
new immediate consumer excludes the fresh blocker or turns the crossed
survivals into a strict frontier reduction.

The exact-five physical omission-cycle bank does not repair this recurrence.
`PhysicalActualCriticalMutualOmissionEdge` is indexed by a
`LargeCapUniqueFiveSecondApexRadius` profile, and both endpoints of its cycle
edge are `PhysicalVertex` values in that profile.  The survival square gives
neither this physical source typing for `first.deleted` and `X` nor the
reverse selected-row omission required by the edge.  The cycle module also
has no decreasing on-spine consumer for such a square pair.  Transporting the
square into a generic cycle packet would therefore add another unsupported
producer rather than reduce the terminal.

There is likewise no existing source-clean theorem excluding the fresh
actual blocker `pX`.  The strongest compatible contradiction exposes the
missing data precisely:
`false_of_centerAt_selectedFourClass_inter_card_ge_three` would close from a
three-point overlap with a selected four-class.
`b1_liveRowBlocker_mem_secondCapInterior_of_two_points` is weaker: it would
only localize `pX` from two distinct strict-cap physical points in its
selected row, and there is no follow-on terminal for that conclusion in the
third-deletion branch.  The square packet supplies neither overlap/incidence
antecedent.  Other cap-localization bounds require the same absent common-pair
data, and downstream Rigid221 or headline consumers are import-circular.  The
fresh branch must therefore be attacked by producing new source/row
incidence, not by further alias or cycle packaging.

Per square center this gap is sharp.  The physical apex is not in the
positive-radius physical class; `u` and `v` contribute only their canonical
self-hit and the square's deletion omission; the second deleted source also
contributes only its self-hit/class membership.  None is known strict-cap
interior.  Although `hfive` forces at least three strict-cap points in the
physical class, no theorem transfers any of them into an arbitrary
`selectedAt X` support.  A directly sufficient new antecedent is therefore
cardinality at least two for the intersection of that selected support, the
physical class, and the strict second-cap interior.

A sharp exact-thirteen incidence model realizes all currently exported
equal-blocker, third-deletion, survival-square, convex-intersection upper
bounds, and seven-good-source row data while keeping every fresh
`selectedAt X` row's physical/strict-interior intersection at cardinality
one.  This is a combinatorial model of the exported incidence abstraction,
not a full Euclidean counterexample, but it proves that no Lean argument using
only those incidence fields can derive the desired two-point lower bound.
The missing lower bound must come from additional metric/order ingress.

The current exact-thirteen 100-cell catalog is complete only for its fixed-label
coarse signature.  Its direct/mirror construction makes no label-permutation
symmetry assumption, and the Boolean CEGAR event explicitly records
`source_coverage = false`; the latest retained event ended
`REFINEMENT_BUDGET` with a SAT Boolean incidence model and contains no real
distance assignment.  The separate metric CSP declares free pair-distance
variables and imposes row equalities plus strict Kalmanson inequalities, but
not positivity or triangle inequalities.  Positivity is a source-valid
strengthening because the exact-thirteen label map is injective, although it
would still not establish planar/source realization.  The optional coordinate
check is diagnostic-only, and no current artifact-to-`ProviderRealizes` Lean
bridge consumes either result.  Treat positivity as encoding hardening rather
than a B1 frontier reduction; retain formula-scoped claim labels until the
source bridge and a named Lean consumer exist.

The exhaustive two-form batch contributes 317 distinct provider-incidence
cuts.  Together with the three prior cell-zero events this gives 4,567 unique
seed clauses; the four one-form batch cuts are already contained in the
two-form batch.  The proposed cumulative resume has now been run: 501
replay-checked SAT solves learned 500 further clauses and ended
`REFINEMENT_BUDGET`, with the last model exposing 175 additional two-form
clauses.  Therefore do not repeat the old one-solve 4,567-cut experiment.  If
this formula lane continues, batch the full novel two-form set after each
replayed model.  This remains formula-scoped, and several hashed producer and
Lean dependencies are not yet commit-reachable, so the local artifact digests
are not a publication or source-pinning result.

The next checked-certificate candidate is the equal-weight three-form family.
On the latest replayed cell-zero model, 1,065 nonzero projected vectors yield
1,637 zero-sum vector triples; all admit six provider paths and atom-set
deduplication leaves 648 Boolean cuts.  One triple repeats a form, so terms,
edge occurrences, and pairing records must remain multiplicity-sensitive.
Independent and Luna audits agree that one representative raw form per
projected vector gives a sound cut, but only under a strict Lean compiler
contract: transport raw labels through the live direct/mirror positional map;
map the two Kalmanson arms correctly; reverse or swap each Python
diagonal-to-side path because Lean pairs side edges to diagonal edges; insert
explicit edge-flip steps after transport; preserve provider identities and
all role/membership atoms; and require the emitted
`ProviderWeightedKalmansonCancellationData.check` to evaluate to `true`.
The governed batch artifact now exists at commit `e376c9010`, with 648 cuts
and 407 novel cuts relative to the corrected prior bank; its file, canonical
event, manifest, and source-event hashes have been independently checked, and
the lane hygiene report has zero owned-path issues.  Luna lane `#15116`
produced the isolated
`CardGeThirteenExact13ThreeFormCheckProbe` at commit `64b2ec58f`.  Independent
verification confirms that its three unit terms, six reversed provider paths,
provider identities, explicit flips, and direct positional transport match the
authenticated representative; the governed module build succeeds and
`representativeData_check` and `representativeData_valid` use only Lean's
standard axioms.  This remains one representative checker certificate: it
does not bind the source event's `is_b1_12` activation atom, prove live-cell
coverage or `False`, or enter an aggregate.  The full-cell normalized
nonnegative-cone run reported in audit lane
`cardge13-exact13-conic-batch-20260905` independently replays as SAT and
reduces to one unit-weight form with two provider paths and nine source atoms;
it rediscovers the outstanding one-form transitive-incidence conflict rather
than closing the cell.  Its six focused producer tests pass, but its new
Python orchestration is not itself a Lean or source-coverage result.  The
subsequent authenticated checkpoints have now executed the proposed resume:
the nine-atom clause excludes its intended model but leaves the Boolean cell
SAT with a new one-form conflict; excluding zero projected forms then exposes
a two-unit-weight, two-form cancellation; and requiring support at least four
produces a dense cone witness with 940 positive terms, total primitive weight
2,236, 4,472 provider pairings, and a 58-atom clause.  Independent file hashes
match all three audits and the current 13 focused resume/cone tests pass.
These remain one-cell, formula-scoped results with no live source coverage or
Lean terminal.  A final bounded-support PIQD query at commit `fecc059ce`
replaces the dense witness by 24 positive terms with total primitive weight
2,388, 4,776 expanded provider pairings, and 38 source atoms.  Its file hashes
and the updated focused tests have been independently checked.  This witness
is small enough at the term level for a Lean checker probe, but source binding
still depends on the broken provider ingress and the expanded pairing payload
remains large.  A direct PIQD capability audit confirms
that the daemon can custody and replay a precomputed workflow but cannot yet
own the model-driven Boolean-to-cone iteration or validate the cone equations,
primitive-weight reduction, and provider paths.  This needs a durable
declarative transition plus a typed certificate verifier bound to the exact
formula and session digests; the request is recorded in the PIQD coordination
channel as `#15134`.  Freeze rather than extend the bespoke Python
orchestration until that capability exists.  The foreign-owned provider
ingress has a validated nine-part repair: a Luna disposable-copy check at
`#15278` compiled after supplying executable subtype equality and `Repr`, a
Prop-to-Type `Classical.choose`/`choice` row selection, the missing namespace,
explicit dependent binders, qualified positional conversion, and structural
singleton-list elimination.  The live file remains unmodified and held by an
inactive owner, so this is empirical file-level repair evidence rather than a
governed build or promotion.  After handoff, apply the exact patch, run the
focused governed build and axiom audit, and retain the activation and
source-row hypotheses before any emitted certificate can reach the
cancellation terminal.

### Card-at-least-thirteen global producer candidate

`exists_good_sources_distinctBlockers_commonDeletion` is a genuine
source-clean producer available under `12 < D.A.card`.  From the original
unique-four residual it returns two distinct good outside sources with
distinct actual blockers, one common deleted frontier point, K4 survival at
both blockers after that deletion, and the two canonical selected rows
omitting the deleted point.  Since `B1GlobalTransportContext` retains the
original residual but only assumes `12 ≤ D.A.card`, this theorem potentially
splits B1 into an exact-card-twelve branch and a card-at-least-thirteen branch.

That split is not yet ready for formalization.  The current consumers add a
third row only when it is supplied explicitly, while
`CardGeThirteenTerminalSplitV2` and
`CardGeThirteenThreeRowsTightAdapter` stop at uncovered-three-center,
adjacent-grid, overlap, fresh, or exact-thirteen-tight residuals.  None is an
existing `False` consumer.  More decisively, the terminal-split route assumes
the no-five two-radius branch, whereas B1's physical normal form retains a
positive five/six class.  Its raw/provider continuation still needs checked
`ProviderWeightedKalmansonCancellationData`; row realization alone does not
supply that certificate.

The source-clean `false_of_mecBoundary_selectedRows_sharedPair` terminal does
not close the common-deletion packet either.  It requires a directional
center-in-row occurrence and two distinct points in the same pairwise support
intersection.  The packet retains only pairwise intersection-cardinality
upper bounds, so the first missing direct-geometric producer is a
source-faithful occurrence/classification theorem supplying that center
incidence and shared pair.  A terminal-sufficient form can choose one actual
blocker row `K` and prove: its blocker lies on the relevant MEC boundary,
`S.oppApex2 ∈ K.support`, and
`2 ≤ (K.support ∩ thirdRow.support).card`.  The MEC closed-disk facts and two
distinct shared witnesses can then be recovered for
`false_of_mecBoundary_selectedRows_sharedPair`; none of these three added
facts follows from the current packet.

Fresh reuse preflights also rule out the tempting existing generic terminals.
The uncovered packet does not retain the same-shell pair, distance equality,
deletion-survivor families, or retained-collision inputs required by the
two-point-row and two-source-fresh-third consumers.  The adjacent-grid packet
places four hits only in radius classes and adjacent-cap cells: it does not put
two selected hits in a named source row, retain the radius inequality and
apex/source boundary placement, or supply the reciprocal incidences required
by the checked five-role and cap-crossing Kalmanson terminals.  The first
honest adjacent-grid ingress is therefore a source-derived packet placing two
chosen grid hits in the source actual row together with their boundary roles;
do not add a downstream adapter until that producer exists.
The closest existing positive ingress,
`nonempty_radiusAnchoredPhysicalRowCrossHit`, supplies only one carrier source
shared by a late blocker row and an unspecified second-apex row.  It neither
identifies that row with a grid-radius row nor supplies a second common hit.
Consequently the smallest direct Kalmanson producer must strengthen this to
two hits from one grid-radius row lying in one late selected row and retain
their boundary order relative to the second apex and late blocker.  The richer
paired-grid/tri-apex terminal cannot be used backward: the generic adjacent
grid has no source-clean adapter to its shell-partition and cap-placement
hypotheses.

The high-cardinality `Rigid221SourceHeavy` endpoints are also unavailable to
this no-five branch.  They first require an
`ExactFourRigid221PhysicalApexSourceEqUContext`, whose positive-radius
`hfive` field asserts cardinality at least five and whose `hclassFive` field
asserts cardinality exactly five.  The dispatcher hypothesis `hnoFive`
directly rules out `hfive`; `12 < D.A.card` also supplies none of the separate
cardinality-15/16/17/18 premises.  Moreover the surrounding source-heavy and
placement modules retain executable `sorry` leaves.  Treat these theorems as
auxiliary high-cardinality consumers only, not as a reuse path from the
current card-at-least-thirteen no-five packet or as B1 closure.

The good-source packet's sources and frontier deletion are also unrelated to
the two joint deletions fixed by the B1 context.  It implies none of the three
current `B1GlobalGapOrClosedTerminal` arms, and it does not by itself put two
physical points in the fresh `pX` row or produce a three-point row overlap.
Thus exact twelve versus card at least thirteen is currently only conditional
routing, not a strict B1 frontier reduction.  A focused Pro consult,
`01M1RMRGPBFNRV3GZX19F2ZMX1`, is checking whether a different import-acyclic
terminal exists.  Until an immediate consumer is identified, do not add a B1
wrapper for the packet.

### Current full-geometric exact-five and card-six pipelines

The current tree contains a stronger normal-form producer not previously
recorded here.  `nonempty_b1FullGeometricCoupledSourceResidual` retains
convex independence, the robust surface, escape provenance, a good source and
peer in the strict physical cap, their exact rows and omissions, a new joint
deletion, and the exact-five split.  Its source-context adapter is complete
and source-clean.

For exact class cardinality five,
`nonempty_b1ExactFiveBlockerOutcome` classifies this packet into a second
deletion and four source-equality/third-row, blocker-inside/outside arms.  It
cannot currently be imported by `TwoDeletionCollision`: the dispatcher
imports `Rigid221Placement`, whose path through
`Legacy/TwoDeletionWrappers` returns to `TwoDeletionCollision`.  The five
placement lemmas used by the dispatcher can be factored into a neutral module
without any dependency on the three open B1 leaves, but that refactor alone
would close no arm.  The second-deletion arm still lacks a rebase plus a proof
that its actual blocker differs from the current one.  Both blocker-outside
arms terminate only in the existing open minimal-core theorem, and both
blocker-inside arms terminate only in open Rigid221 placement/closure leaves.
Do not perform the neutral factor until one of those consumers becomes
source-clean.

Two independent source audits at revision `7d6bf3e81` ruled out treating
`false_of_exactFourMutualOmissionRigid221_minimalCore` as such a clean
consumer.  Its signature retains only an off-physical-apex global deletion
and a `MinimalDeletionCore`; it has already discarded the equations identifying
that deletion's center with the source's actual blocker and its deleted set
with the singleton source.  More importantly, even retaining those equations
does not supply a contradiction: the source-clean theorem
`exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class`
constructs exactly this singleton off-apex core, whose pairwise-disjoint
condition is vacuous.  The generic core-to-cap bounds require the core center
to equal an indexed Moser opposite and, for the useful six-point bound, two
distinct deleted sources; neither antecedent is available here.  No indexed
theorem-bank search found a source-clean source-facing terminal that excludes
the outside-class actual blocker.  Therefore do not attack the current
minimal-core `False` statement or merely restore the discarded equations.
The next viable use of the outside arms requires a genuinely new geometric
terminal relating the source blocker/core center to an indexed cap, boundary
order, or a second source incidence.

Independent audits at revision `ac9a1f89b` likewise ruled out direct work on
the current blocker-inside leaves.  In the genuine third-source-row arm,
`exactFourRigid221_context_u_ne_source_normalForm` reaches only the consistent
finite alternatives in which the source blocker is the distinguished deleted
point, `u`, or one of the two `v`-slice points.  The packet has no second
source-row companion, reverse/cyclic incidence, or source-faithful cap order
with which to eliminate those alternatives.  In the source-equals-`u` arm,
the blocker-deleted, source-row-heavy, opposite-row-heavy, and sparse-row
terminals are also compatible with their current interfaces.  The strongest
common source-clean endpoint,
`exactFourRigid221_sourceEqU_oppositeRowPartner`, names the second `v`-row
point and an equal-distance edge but does not place that point or its center
in the required ordered strict-cap geometry.  Indexed searches for each leaf
found no source-clean `False` consumer.  Do not attack these five `sorry`s as
local set/cardinality proofs; a producer must first retain exact carrier-label
incidence plus boundary order, or furnish an independent second-source
geometric relation.

The profile0034 singleton-deletion grid does not supply that producer.
`SINGLETON_DELETION_GRID_COMPLETE` records all nineteen planned cells rather
than certifying all targets.  Its two `UNSAT_CUSTODY_VALID` target cells delete
the source-row equality `D(O,a) = D(O,p)`, not the B1 blocker-deleted equality
`centerAt(source) = jointDeletion.deleted`.  They remain discovery-only and
have no source realization, B1 transport, Lean ingress, or theorem candidate.

The profile0034 source-adapter work belongs to a separate Rigid exact-five
branch, not to the anchored B1 chain.  Direct source and import tracing at
revision `10e4d33f8` found no call edge from
`false_of_b1PhysicalClassFiveSixNormalForm` into `Rigid221Closure`,
`ExactFiveDistinctThreeCenterNormalForm`, or the profile0034 adapter; indeed,
the adapter is not imported by any Lean module.  A complete profile0034
classifier would integrate at
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` in
`Rigid221Closure.lean`, while B1 would still require a new source-clean bridge
from `B1PhysicalClassFiveSixNormalForm` to that Rigid packet.  Do not count the
profile0034 consumers as progress on the B1 `sorry` without such a bridge.

Within that off-spine Rigid branch, commits `974d6126c` and `a7c6860e4` are
nevertheless checked reductions: they handle the direct and reflected middle
orders and prove `a < c < O` or `O < c < a` after cutting at the blocker.
Focused builds pass, and direct axiom probes report only `propext`,
`Classical.choice`, and `Quot.sound`.  They do not place deleted point `d` or
the residual row points `p,s`.  Exact coordinate examples realize every
cyclic slot for `d` under the current metric equalities, so the desired
between-position is not a consequence of that packet.  The cap-block packets
also place retained and deleted points only in one common interval and do not
order them.  This Rigid branch therefore needs genuinely stronger
source-faithful order ingress.

The same off-spine trace found one partial Rigid consumer: in the fourth
`RobustApexFourIncidenceContinuation` constructor, the hard-source-swap arm
with `¬ 5 ≤ S.oppInterior2.card` reaches
`HardSourceSwapExactGridRoles.false_of_fourthIncidence_exactGrid` using the
original normal-form common-deletion packet.  The physical source-swap arm,
large-second-interior arm, and constructors one through three remain open.

Focused Pro consult `01M1RSXD38KCFTCK2AH96PGEF6` is checking the remaining
source-rich route: iterate
`exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext` while
retaining the five/six normal form and exact deleted-source identities, and
decide whether the no-third-deletion arm forces a finite cycle or which
additional upstream incidence is missing.

The current escape-source adapter cannot itself enter the canonical B1
no-third-deletion clause.  It reselects a joint deletion over fresh carrier
parameters `u, v`, whereas `B1PhysicalClassFiveSixNormalForm` quantifies only
packets over the fixed `C.u, C.v`.  It supplies no equality identifying the
fresh pair, deleted source, or actual blocker with the canonical B1 data.
Luna trace `#15061` and direct source validation found no existing comparison
theorem that repairs this dependent-type/provenance mismatch.

Luna re-audit `#15312` sharpened the interface failure.  The first required
field is unordered endpoint normalization of the fresh pair to
`{C.u, C.v}`.  Even with that normalization, the adapter currently hides its
joint-deletion witness behind an existential and supplies no proof that its
deleted point differs from both canonical deletions.  Those are separate
producer obligations; `ExactFourMutualOmissionJointDeletion.swap` preserves
the deleted point and only reverses the endpoint orientation.

The parallel canonical-endpoint audit `#15316` found no hidden arc producer.
`B1GoodCanonicalDeletionEndpointResidual` carries no live-row-blocker arc
field.  The only existing cap-to-arc theorem additionally requires a chosen
live slice to lie in the second cap interior and its row blocker to lie
outside that interior; neither premise follows from the current ingress, and
the two-point interior lemma instead puts the blocker inside.  A bounded
project-index search returned only that known conditional theorem.  The
canonical arm therefore still needs a genuinely new one-slice boundary-arc
producer, not an equality or dispatch wrapper.

A separate indexed search suggested reusing the two-deletion collision with
different fresh and canonical endpoint pairs, but direct signature inspection
rejected that suggestion: every cited theorem quantifies both joint deletions
over the same `u,v`.  A source audit of whether the collision proof can be
generalized to heterogeneous endpoint pairs found the shared pair embedded in
the joint-deletion packet, two-deletion ingress, outcome packet, coordinator,
and the first cross-omission reduction.  No heterogeneous consumer exists, and
the downstream blocker-coincidence and survival-square terminals are
themselves still `sorry`-backed.  This route cannot presently bypass endpoint
normalization and would require a new ingress and new geometric proof rather
than a wrapper generalization.

The finer terminal trace `#15325` shows that the local two-cycle and initial
cross-omission helpers could accept heterogeneous endpoint pairs, but the next
survival-square split needs four cross-pair actual-blocker inequalities.  Even
supplying those would only reach the same open blocker-coincidence and
survival-square consumers.  Generalizing the local types is therefore not a
kernel-clean terminal and is not the next B1 proof target.

Three independent source audits, including Luna `#15080`, checked whether the
mismatch could be bypassed by generalizing the pair-insensitive geometry.
`b1_third_actualBlocker_ne_common`,
`false_of_exactFour_twoDeletion_blockerTwoCycle`, and
`exactFour_twoDeletion_crossOmission` do not use equality of their packets'
omitted-pair parameters and admit heterogeneous-pair statement variants.
Those variants do not reduce the B1 frontier.  The first actual consumer,
`false_of_b1_oneWayCrossOmission`, calls the survival-square split with the
second blocker's inequalities against the first packet's two row centers;
the existing packet fields provide these only when both packets share
`C.u, C.v`.  A heterogeneous call therefore needs new cross-pair blocker
inequalities.  Even with those added, every branch dispatches to the open
`blockerCoincidence` or `survivalSquare` auxiliary theorem.  Do not implement
the heterogeneous helper refactor without a new producer for those
inequalities and a kernel-clean terminal beyond the two existing leaves.

For exact class cardinality six,
`B1CardSixPointConfigurationPayload.ofSource` already packages the strongest
source-clean positive boundary, metric, row, role-alias, and physical-support
data.  Its downstream pipeline is nevertheless diagnostic.  The raw-order
ingress uses a sixteen-role insertion carrier, the role-projection ingress
uses an image of `roleUniverse`, and the older raw bridge uses a distinct
seven-role carrier; no theorem relates these types.  In addition,
`RoleBoundaryRestriction` has no producer and the payload omits the negative
metric constraints for carriers absent from a row.  Raw badness yields a
same-arc conclusion only conditionally and supplies no global-gap terminal.
No card-six module contains a new sorry, but none currently reduces the open
B1 terminal to `False`.

### 2026-09-05 escape recurrence and signed-area checkpoint

The escape-source reselection now retains its first exact cross-system role
fact in Lean.  Commit `577d39f58` adds
`B1EscapeSourceContext.exists_freshPair_deletion_role`: the chosen fresh joint
deletion is exposed proof-relevantly, is distinct from the retained escape
source, and is either one of the two canonical deletions or lies in one of the
original live slices.  The proof uses the source-context membership in the
fresh `u` row, the joint-deletion omission from that row, and the exact
five/six normal-form cover.  Focused source compilation and the governed
10,873-job module build pass; its axiom probe reports only `propext`,
`Classical.choice`, and `Quot.sound`.

This does not create an iteration.  The escape adapter's source remains a
noncanonical live source, while `b1_freshPair_source_or_mem_original_liveSlices`
and `b1_freshV_escapeStar_or_adjacentCap` require a canonical deleted source.
Moreover, the replacement-star theorem relates the new star only to fresh
`v`; it supplies no inequality, order, rank, or visited-set relation between
`v` and the old escape source.  The current B1 files contain no recursive
transition, monotone finite measure, or cycle contradiction.  The reusable
exact-five physical omission-cycle framework is being audited separately,
because its proofs appear to use less than the stronger unique-radius profile
carried by their present signatures.

Pro consult `01M1QSB3Y0CX58HPPWGZ3ZYRHE` gives a smaller terminal contract for
the missing order producer.  For distinct centers `a,b` and distinct points
`x,y` equidistant from both centers, the repository's `signedArea2` convention
satisfies

```text
signedArea2 x a b * signedArea2 y a b
  = -dist(a,b)^2 * dist(x,y)^2 / 4 < 0.
```

A genuine two-point B1 live row supplies both equal-distance premises with
`a = S.oppApex2` and `b` its actual late-row blocker.  Therefore the clean
contradiction interface is only one actual live pair whose signed-area product
is nonnegative; no boundary enumeration, orientation packet, or whole-slice
positivity assumption is needed.  The algebraic negativity lemma and this
minimal B1 consumer are being formalized.  The hard producer remains global:
it must derive the nonnegative placement from deletion/escape compatibility.
The adjacent-cap and blocker-between residuals do not provide that sign.

The existing exact-five physical omission-cycle code does not supply the
missing producer.  Source audit `#15352` confirms that the successor and
finite-cycle proofs never use the `unique_K4_radius` field of
`LargeCapUniqueFiveSecondApexRadius`; they could be refactored over a weak
profile carrying only a positive radius and exact class cardinality five.
That is not presently useful enough to implement.  Neither arm of
`nonempty_mutualOmissionEdge_or_all_reverseMembership` has any concrete
consumer outside its defining module.  In addition, the cycle vertices carry
only strict-cap source membership, actual-row omission, and deletion survival;
they do not identify their endpoints, rows, or deletion packets with
`C.u,C.v,C.first,C.second`.  A B1 consumer would still need strict-cap
membership for the canonical endpoints plus this proof-relevant alignment.
The weak-cycle refactor is therefore deferred until one of those two cycle
outcomes has an on-spine terminal.
