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
`TwoDeletionCollision` by importing `B1CardFiveLocalRolePacket` and
`B1WinningLiveSliceIngress`; those imports transitively reach all four new B1
modules without a cycle.  Focused builds of `TwoDeletionCollision` and the
`FrontierLiveClosure` root pass.  From the active residual's `C` and `hnormal`,
Lean can therefore construct the card-five/card-six local-role packet and the
escape-row provenance star directly.  The spine still has exactly one open B1
obligation: no current theorem consumes those packets to prove the missing
global cyclic-placement contradiction.

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

The B1-only invocation of the registry's own `BlueprintBackend`, alias planner,
and factorization checker accepts the stable-ID migration and verifies the five
roles with zero violations.  The canonical all-project generator currently
refused transactionally at this checkpoint because of 83 then-pre-existing
Rigid221 factorization violations; it wrote none of its three generated files.
The independently verified B1 registry and ID-assignment delta was therefore
applied narrowly. The 2026-08-30 registry re-anchor subsequently incorporated
the validated B1 and Rigid221 factorization records. Historical receipts remain
immutable.
