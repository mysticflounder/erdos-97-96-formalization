# B1 arbitrary-cardinality ingress and Wave 19 promotion gate

Date: 2026-08-31

## Objective

Close
`Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm`
without using the downstream theorem
`b1_globalGapOrClosedTerminal_of_counterexample` as an input.  The latter is
reached through `false_of_b1GlobalTransportContext`, so using it to justify a
finite packet would be circular.

Wave 19 and the arbitrary-cardinality lift are separate concurrent lanes.  A
Wave 19 verdict is an exact-12 diagnostic unless an upstream source theorem
supplies every clause hypothesis without an exact-cardinality assumption.

## History of the open obligation

The reachable history contains no earlier proof body to restore.  Commit
`95cac9ed776f805b28cacebf20f9ddd3727c717c` introduced
`b1_globalGapOrClosedTerminal_of_counterexample` with `by sorry`.  Commit
`5413bd4f40b0d1e681bafc6a5f108d5d36d51128` later added the complete
continuation producer while explicitly leaving its global consumer open.
Finally, commit `3f6a15deeb405d3a46bd0cc13524078b06552dd0` introduced
`false_of_b1PhysicalClassFiveSixNormalForm` with `by sorry` and rewired the
named global theorem through it.  The outer declaration thereby became
syntactically closed, but its proof obligation moved to the present normal-form
leaf.  Searches through reachable history and tracked attic/scratch sources
found no displaced non-circular proof.

## Carrier architecture

The intended reusable boundary is a finite, injectively labeled local packet:

```lean
structure B1LocalRolePacket (A : Finset ℝ²) (k : ℕ) where
  carrier : FaithfulCarrierPattern A
  labels : Fin k → GeneralCarrierBridge.CarrierLabel A
  labels_injective : Function.Injective labels
```

The eventual six- and seven-role adapters should derive their row pattern and
realization through `GeneralCarrierBridge`.  The packet must not contain
`A.card = 12`, a `Fin 12` ambient universe, global cell-cover fields, a terminal
disjunction, or a `Valid` field that merely restates the open proof obligation.

This structure is not yet landed in Lean.  On the current source spine it has
no producer and no consumer that would shrink the open frontier.  The first
Lean change must therefore land together with a source theorem producing role
distinctness and the row closures for at least one kernel.

Selecting an arbitrary 12-point subset is not a valid lift: the K4-free
complement condition used by the source argument is not hereditary under that
restriction.

### Order-sensitive ingress boundary

The arbitrary-cardinality consumer infrastructure already exists.
`GeneralCarrierBridge.BoundaryIndexing` enumerates the complete carrier and
maps every `CarrierLabel` to its boundary index.  Suitable generic consumers
include `SelectedRowOrdinalComparison` with `false_of_transGen_cycle`, and
`CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_of_index_size`.
They do not require a twelve-point ambient carrier.

What is missing is a B1 source producer for their hypotheses.  A usable packet
must provide actual carrier labels with an injective role map, the class/radius
and positive row memberships used by the selected consumer, compatibility
with a complete `BoundaryIndexing`, and the required strict role-index order.
Exact row exclusions should be present only when the chosen consumer needs
them.

`census/rigid221_pentagon_oracle.py` does not provide this ingress.  It
hardcodes a named five-cycle, a six- or seven-label local universe, gauge and
reflection choices, branch-specific blocker identities, and additional row
equalities from the strict exact-five Rigid221 branch.  Those facts are absent
from the generic B1 normal form and continuation packet.  Its external Z3
results and the exact-12 frozen-order tables therefore remain diagnostic and
must not be copied into the global B1 packet.

## Upstream source trace

The open declaration is in
`P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean`.  The existing proven
escape route is

```text
b1_live_exists_third_interior_escape
  -> b1_live_escape_small_overlap
  -> b1_live_false_of_escape_overlap_ge_three
```

The first two steps come from `SharedFrontierHelpers.lean`; the final consumer
expects a universal overlap-at-least-three premise.  That premise is not a
narrower missing source lemma.  In fact, `B1GlobalTransportContext` refutes it:
`nonempty_b1EscapeWitness` supplies an escape witness `E`, the universal
premise applied to `E.source` would give overlap at least three, and
`E.overlap_le_two` gives overlap at most two.  After unfolding
`b1EscapeRow` and `b1CommonRow`, `omega` closes the contradiction.  Thus any
proof of the universal lower bound from the normal-form context would already
carry the complete contradiction burden; it cannot serve as an independent
ingress theorem.

`B1GlobalTransportContext` already carries the live residual/surface data,
`12 ≤ D.A.card`, positivity of the radius, class size at least five, mutual
omission, two joint deletions, distinct deletions, and equal blockers.  It does
not carry the full role distinctness or the nine/eleven `EdgeClosure` relations
required by the mined kernels.  Its visible row information supplies only the
common-blocker links for the two deleted-source rows.

The legitimate upstream attack points are therefore:

1. derive a direct contradiction or a forced third joint deletion from the
   physical class-five/six normal form; or
2. prove a concrete finite-kernel producer from B1 source rows,
   then introduce the local-role packet and kernel dispatcher in the same
   change.

### Smallest current order producer

The sharpest existing cardinality-free consumer is
`false_of_freshThirdSharedPairNonalternationPacket` in
`TwoSourceFreshThirdFiber.lean`.  Finite counting in the normal form forces at
least one of the two live physical slices to have cardinality two.  From that
slice, the complete carrier boundary, two distinct shared points, the physical
radius-class row, the live selected four-row, and distinct row centers can all
be constructed from existing source data.

The sole missing packet field is the same-arc statement

```lean
SurplusCOMPGBank.btw ic id ix ↔
  SurplusCOMPGBank.btw ic id iy
```

for the forced shared pair.  `SurplusCOMPGBank.btw_sep` proves the opposite
arc behavior from the two row equalities, so this one new order bit would
immediately close the normal-form leaf.  A candidate producer theorem is

```lean
theorem b1_live_sharedPairNonalternationPacket_of_normalForm
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C) :
    FreshThirdSharedPairNonalternationPacket D.A
```

No current source declaration proves its final order field.  The governed
normal-form order wave tests whether the existing cap-block constraints force
it before any Lean packet is added.

That wave is now complete.  All four card-five/card-six trace shapes remain
satisfiable in both boundary orientations, even when all named roles are
injective except the forced shared mate.  Eight witnesses replay, while adding
the target same-arc condition eliminates every enumerated assignment.  Thus
the current cap/order interface cannot prove the missing field; an upstream
extremal or boundary-order choice has to be retained explicitly.

The source-clean counting theorem
`b1_live_slice_card_eq_two_of_physicalClassFiveSixNormalForm` has nevertheless
landed in `EqualBlockerContinuation.lean`.  It proves that the normal form
always supplies a two-point live slice.  The arbitrary-cardinality ingress now
also proves two unlabeled outside-class supports for the common row and for one
live row.  On the card-six branch both live slices are disjoint two-point sets
and both live rows have two-point complements.  Thus the six named physical
roles and all three unlabeled row-completion pairs used by the card-six
diagnostic have source-clean finite provenance; no fixed carrier cardinality
or label enumeration is assumed.  The governed diagnostic and hashes are recorded in
`docs/audits/2026-08-31-b1-normalform-order-wave.md`.

The next label-polymorphic ingress step is also Lean-checked.
`B1RowCompletionPair` names a two-point row complement by two distinct
`CarrierVertex` values, and the three `nonempty_b1*RowCompletionPair*`
theorems construct these labels for the common row, for one live row in every
five/six normal form, and for both live rows on the six-point branch.  The
packet deliberately asserts no distinctness between different completion
pairs.  A source audit of the nearest six-role interlock found only two of its
nine metric relations currently produced, so no collision-kernel packet or
cross-row injectivity has been added.

The card-five branch now has a complete companion packet rather than that
one-live-row projection.  `B1CardFiveLocalRolePacket.lean` proves the exact
three-way trace split, names the three outside-class supports of a singleton
live slice, and packages both complete live rows in every branch.  Its
physical-K5/common/u/v row pattern is canonically realized and positively
matches the exported source choices.  The focused build and an independent
source audit pass; its public declarations use only `propext`,
`Classical.choice`, and `Quot.sound`.  A new card-five alias census must use
this complete packet, so the earlier 13-role asymmetric counts are retained
only as conservative historical diagnostics.

The permitted cross-pair aliases are nevertheless finite and independently
audited.  The six completion slots have 87 labeled equality partitions, 16
orbits under the three within-pair swaps, and 12 after also quotienting the
source symmetry between the two live rows.  No additional cross-pair equality
or inequality is currently produced upstream.  This census supplies a finite
completion-to-completion dispatcher, but not a full role dispatcher: present
ingress also leaves open a completion equaling `A` or another row's blocker.
The completed 16-role source audit records exactly 78 inequality edges and
leaves blocker/foreign-physical, completion/`A`, completion/foreign-blocker,
and cross-completion equalities open.  This produces 94,381 labeled partitions
or 7,287 orbits under the conservative completion-pair and `u ↔ v`
symmetries.  It remains bookkeeping until the kernel screen or a metric
consumer covers each retained family.

That kernel screen has now been corrected against the exact Lean fields.  The
initial SixPointFive-B hits were false positives from clique-closing a row's
supports, while an intermediate zero result imposed unsupported six-role
injectivity.  The final unordered-edge screen uses only the kernel field
`A ≠ E`: the union of SixPointFive A/B/C hits 1,216 partitions in 76 orbits,
all already covered by `DuplicateCenterCore`.  The latter covers 11,776
partitions in 829 orbits; 82,605 partitions in 6,458 orbits remain, with digest
`c97af327af7f63dd7f9a1dfb0006a889193ee9eede56c79b290da8e5c77d93cf`.
The full schema applies only to the card-six branch.

The bounded reuse preflight for the concrete duplicate-center adapter found
`GenericRowNogoodCertificate.nonempty_duplicateCenterCore_of_positiveCheck`
and `DuplicateCenterNogood.not_realizes_of_positiveCheck`.  The immediate
consumer is `false_of_b1PhysicalClassFiveSixNormalForm`.  The first missing
antecedent is not certificate soundness: it is a source theorem packaging the
physical-radius row and the three blocker rows over canonical carrier labels,
together with the actual cross-row aliases.  No indexed declaration supplied
that B1-specific packet.  The current source revision for this preflight is
the expanded `EqualBlockerContinuation.lean` digest
`ca5e374309f761ebc39569e796b7eb20345eb7d62f814df377e1929d95b03d21`.

The follow-up metric wave also remains satisfiable.  It adds the previously
omitted deleted/common-blocker pair and gives exact rational coordinates for a
strictly convex card-six named projection satisfying the anchor circumdisk,
strict-cap, physical-circle, three exact named blocker intersections, named
bisector-fiber, and live-omission constraints.  All three shared pairs
alternate and none is same-arc.  The first untested source family is therefore
the joint geometry, cross-incidence, and late-system provenance of the six
unlabeled completion supports, not their finite existence and not another
boundary-order refinement of the named roles.  A bounded theorem-bank audit
found no installed three-row consumer for the resulting star: every close
candidate needs a shared endpoint pair, triangle cross-incidences, or another
cross-row relation not supplied by the B1 source spine.

Wave 3 now proves a sharper completion boundary.  An independently audited
exact rational parabola model realizes three pairwise-disjoint exact-four rows
with six fresh completion supports in strict convex position; Z3 and cvc5 both
accept the ground replay.  Therefore exact-four completion, row negatives,
convexity, and the overlap bound alone do not provide a terminal.  The model
does not carry the common physical circle, cap/circumdisk, three pair-bisector
fibers, omissions, or late-system provenance, so it is not a full B1 survivor.

The full 18-role nested named formula remains unresolved: Z3 returned
`unknown` and cvc5 timed out at 300 seconds.  A moving-anchor search over six
laminar and 36 same-slot orders found no numerical survivor, but those runs are
not UNSAT and cover only one radial-order subclass.  The next finite family
must enumerate the other source-permitted completion radial gaps.  This moves
the structural frontier from mere row completion to the coupling between the
six-point physical circle and the three completed rows; cap/MEC and global
provenance should be added only after that reduced coupling is classified.

Wave 4 classifies the first proper subcase of that coupling.  A two-row
common-circle configuration is exact rational SAT through the named finite
row negatives, pair-bisector fibers, and mutual omissions, including local
orders outside the earlier restricted subclass.  The fresh-distinct third-row
extension remains unknown: broad and targeted searches found only collapsing
numerical non-witnesses, and the metric search does not exhaust the 3,603,600
global order merges.  Accordingly Wave 4 supplies neither a global terminal
nor a source-level kernel.  It isolates the next five-parameter computation
and leaves cap/MEC and provenance disabled until that Stage A surface is
classified.

Wave 5 then searched that fresh-distinct Stage-A surface without fixing a
boundary order.  The exact two-row witness and three expanding trust regions
all reached at most 14 of 16 hull vertices; the limiting candidates collapsed
an endpoint/support pair or drove a blocker to the midpoint degeneracy.  The
authenticated verdict remains `UNKNOWN`, so no kernel or Lean terminal is
available.  The next gate is an exact cyclic-order/center-semicircle analysis,
not promotion of the numerical non-witnesses.

That exact order gate is SAT.  The center-semicircle lemma is valid, but two
independent enumerations show that it and the common-chord bisector axes retain
all 20 local types, all 8,000 triples, and all 3,603,600 global merges.  Hence
the current gap is a metric coupling or a later source relation; no finite
order dispatcher can be promoted from this condition alone.

The first audited metric cut is an exterior-wing shadow determinant.  It
eliminates a completion placed beyond a physical endpoint when another common-
circle endpoint precedes it on the required boundary arc.  It uses the short-
arc orientation and the source-proved fact that each blocker is a carrier
vertex.  Inner-arc placements remain possible, so the lemma narrows a future
solver packet but does not close a complete alias family by itself.

The Wave 6 post-wave theorem mine sharpens that cut into the concrete
`unit-blocker-open-minor-endpoint-arc-adapter` candidate.  The exact card-six
screen leaves 1,609 partitions in 134 orbits after installed kernels,
endpoint-shadow, and local-order closure.  Project and cross-project Lean
searches found useful bisector-direction, closer-side, and MEC arc-containment
lemmas, but no declaration directly consumes the B1 packet.  The first missing
antecedent is an ingress adapter that turns the B1 role/alias data into the
global injective convex-order and MEC packet, with endpoint distinctness,
common radius, directed order, and sign hypotheses.  This is now a theorem
lane, not a reason to launch another metric canary.

The comment-disabled
`b1_live_two_interior_sources_or_third_interior_joint_deletion` is not a route
around this gap.  Its attempted proof established omission from the two
deleted-source/common rows, while
`exactFourMutualOmissionJointDeletion_of_prescribed` requires omission from
the live `u` and `v` rows.  The active
`b1_live_interior_joint_deletion_or_small_cover` correctly stops at the cover
already retained by the normal form.

## Clause liftability

The current exact-12 compiler remains diagnostic and non-promotable.

| Clause family | Liftability | Missing source work |
| --- | --- | --- |
| Equality transitivity | projection-safe | generic relation valuation |
| Duplicate three-point center | projection-safe | generic labels and membership |
| Generic equilateral-bisector core | projection-safe | labeled metric/row ingress |
| Generic q-critical chain core | projection-safe | labeled metric/row ingress |
| Convex perpendicular-bisector core | projection-safe under `ConvexIndep A` | labeled convex ingress |
| Selected-row six equalities | globally exact only after a source row-support theorem | exact-row producer |
| Physical-apex radius unit | cell-restricted in the current compiler | source role adapter |
| Finite Wave 14/16/18 clauses | fixed-label cell instances | generic kernel producer and role injection |
| Moser/profile/cap-count rules | ambient-cardinality and cell dependent | do not use for a global lift |
| `range(12)` support/negation checks | ambient-cardinality and global-cover dependent | do not use for a global lift |

The largest immediately identifiable projection-safe suffix has 913,440
clauses:

```text
137,280 equality-transitivity
  7,920 duplicate-center
 95,040 generic equilateral-bisector
665,280 generic q-critical chain
  7,920 convex perpendicular-bisector
```

With a proved generic selected-row ingress, 18,396 row implications and the
single apex-radius fact can be considered separately, for a 931,837-clause
role-packet formula.  Neither count includes ambient profile, exact-12 cover,
or fixed-cell clauses.

## Kernel coverage matrix

| Wave | Kernel | Roles / relations | Immediate missing producer |
| --- | --- | --- | --- |
| 14 | `SevenPointSevenRowInterlockCollisionCore` | 7 / 11 | injective roles and eleven source row closures |
| 16 | `SixPointSixRowInterlockCollisionCore` | 6 / 9 | injective roles and nine source row closures |
| 18 | `SevenPointEquilateralMedianInterlockCollisionCore` | 7 / 11 | injective roles and eleven source row closures |

The Wave 18 role assignment is
`p=0, q=2, t=1, a=8, v=9, b=10, u=11`.  Its ordered relations are

```text
tp=tq, qp=qt, qp=qv, qp=qb, at=aq,
vt=vb, vt=vu, bq=ba, bq=bu, uq=ua, uq=uv.
```

The checked Lean consumer is
`Problem97.Census554.EqualityCore.not_realizes_of_sevenPointEquilateralMedianInterlockCollisionCore`.
The handwritten public core consumes all eleven fields.  Its underlying metric
lemma does not need `tp=tq`; the generated polynomial certificate does use all
eleven facts.  Generator v8 therefore retains the complete ordered relation
stream.

## Wave 19 reuse preflight

The authenticated Wave 19 cube contains no full injective embedding of any
installed interlock kernel:

```text
Wave 14 SevenPointSevenRowInterlockCollisionCore:              0 / 3,991,680
Wave 16 SixPointSixRowInterlockCollisionCore:                   0 /   665,280
Wave 18 SevenPointEquilateralMedianInterlockCollisionCore:      0 / 3,991,680
```

The nearest completions are:

| Kernel | Role assignment | Present | Missing |
| --- | --- | --- | --- |
| Wave 14 | `(p,q,t,u,v,a,b)=(0,1,2,4,7,8,9)` | 10/11 | `bq=ba` |
| Wave 16 | `(p,q,t,u,a,b)=(1,0,4,2,3,5)` | 8/9 | `bq=bt` |
| Wave 18 | `(p,q,t,a,v,b,u)=(0,2,1,8,9,10,11)` | 9/11 | `uq=ua`, `uq=uv` |

The project Lean index and the three existing general-n banks contain the
kernel consumers, but no upstream source producer for those missing relations.
`B1GlobalTransportContext` still supplies only the common-blocker data, not an
injective role packet or the complete row closures.

Therefore Wave 19 triggers the CEGAR stop rule for promotion: do not install a
v9 refinement from a relation unsupported by the source spine.  A bounded
Wave 20 equality classification may be retained as diagnostic evidence, but it
cannot by itself improve the arbitrary-cardinality lift.

## Wave 20 exact equality diagnostic

The canonical Singular `std` probe timed out after 180 seconds and the Z3
QF_NRA probe returned `unknown` after 330 seconds.  An audited `slimgb` probe
with the seed-4 `dp` variable order proved the full Wave 19 equality ideal
unit over `QQ` in 0.062 seconds.  The governed minimizer then replayed a
certificate and retained the source labels

```text
{0, 1, 3, 4, 5, 7, 11}
```

with source relation indices

```text
{1, 6, 11, 12, 13, 14, 16, 24, 34, 35, 36}.
```

Under the canonical label map
`0->0, 1->1, 3->2, 4->3, 5->4, 7->5, 11->6`, the eleven relations are

```text
(0,1,2), (1,0,5), (2,0,3), (2,0,4), (3,1,4), (3,1,5),
(4,0,5), (5,0,6), (6,2,3), (6,2,4), (6,2,5).
```

The minimizer made 12 relation-deletion attempts and 11 label-deletion
attempts, then proved every one of the retained relations individually
necessary.  Its pair audit checked all 55 deletions directly and found every
pair non-unit.  The final exact core is therefore deletion-minimal at relation
width one and two for this audit.

The retained certificate SHA-256 is
`91f44a66dbd6fb73d2856c9a146161af9d4ba1bc6efdca5b3530e57b456edfc5`;
the minimization summary SHA-256 is
`cfd3e4d1c27c41739524d9584c431b79807d467a722682ee9b8168930df34345`.
The machine-readable source classification SHA-256 is
`5e6ec48405489b4a38ed540cc002241457eded7190df6b71d0b4c6b9baa0a2e6`.
All 320 entries in the artifact `SHA256SUMS` replay successfully.

One bounded indexed Lean/bank search found no full relabeling match.  The
closest installed seven-point, eleven-row declarations overlap in at most
seven relations.  On the B1 source spine, only the first retained relation
could potentially be aligned with the physical-apex radius fact, and even
that needs a missing role map.  The other ten relations have no upstream
`EdgeClosure` producer.  Wave 20 is consequently a new algebraic pattern but
not a source-entitled structural family.  It does not authorize generator v9
and does not change the global promotion gate.

## Wave 19 decision gate

- If full v8 is UNSAT, rerun or minimize the projection-safe formula.  Only a
  contradiction there can directly support a label-polymorphic obstruction.
- If the UNSAT core needs ambient-cardinality, global-cover, or fixed-cell
  clauses, land at most an exact-12 terminal and continue this lift separately.
- If v8 is SAT, authenticate the survivor and continue only if its next kernel
  has source producers for every relation and removes a new source-level
  structural family.
- Stop the CEGAR loop when the available refinements become model-specific or
  fail to shrink a source-level residual.

## Promotion checks

Before any global use, require:

1. a strictly upstream source-to-packet theorem;
2. injective label roles and membership in the full carrier;
3. a source producer for every relation used by the selected kernel;
4. a dependency audit excluding the open B1 leaf and all downstream global
   terminal declarations;
5. checked packet-to-formula semantics and, for an exact-12 terminal, checked
   all-cell coverage and certificate replay.
