# Exact-five physical and uniform closure plan

This is the active execution order for the recovered exact-five handoffs.
It refines the [distinct-center continuation plan](2026-09-01-rigid221-exactfive-distinct-three-center.md).
Its evidence is the [cap-radius audit](../skeptic-cap-radius-drop-proofs-and-formalization-2026-09-05.md)
and [physical/uniform audit](../skeptic-exactfive-physical-handoff-2026-09-05.md),
committed in `c4ac26b1e` and `2ce4991cc`. Original handoffs remain immutable
reference inputs. This document specifies pending work and acceptance gates;
it does not assert a new proof-spine reduction.

## Target and measured frontier

The publish target is `Problem97.erdos97_rhs`. The physical residual is
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`.
Its coordinator is
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenterNormalForm`
in `FrontierLiveClosure/Rigid221Closure.lean`. The preceding plan also covers
the five-incidence residual and tight-twelve consumer. No admission elsewhere
in the publication spine is discharged by this plan.

The audited baseline coordinator has physical, five-incidence, and tight-twelve
outcomes; tight-twelve already has its separately trusted finite consumer.
The simultaneous-deletion rewrite in `bce36a53c` leaves physical and
tight-twelve as the coordinator's only source outcomes. Its helper and
coordinator builds pass, and the unused five-incidence declaration is deleted.
Count elimination of that dependency as an accepted proof-spine reduction
only after a fresh kernel mine confirms the built graph. A source edit or a
green helper alone is not that measurement.

After that rewrite, the physical terminal remains open. Measure subsequent
progress by a strict reduction of the source-entitled cases reaching this
named terminal, with exhaustive dispatch and checked consumers for eliminated
cases. Coordinate adapters, graph interfaces, and finite regressions receive
no terminal-closure credit on their own. Record any proposed finer
well-founded measure and its constructor fan-out before changing obligations.

## Ordered work and acceptance conditions

| Priority | Work | Present evidence | Required result |
| --- | --- | --- | --- |
| 1 | Simultaneous-deletion row replacement and strict-fresh reconstruction | Committed in `bce36a53c`; helper and coordinator builds pass; old five-incidence declaration deleted; ten production helpers have core-only axioms | Refresh the kernel mine and aggregate dependency/trust evidence before accepting a proof-spine reduction |
| 2 | Source geometry for radius drop | Source strict radius drop, circle-power exterior distance drop, and support-triangle exclusion have landed; actual-fresh-row adapter checked | Supply a contradiction for the omission or smaller-radius child, then apply an exhaustive split at the physical consumer |
| 3 | Admissible-pair selection and actual-blocker reconstruction | Minimum-pair producer called by live root in `777c0ba74`; downstream `.residual` projection still drops its extra payload | Carry minimum-pair evidence to the physical consumer and through reselection; close or strictly narrow a live case |
| 4 | Uniform row-replacement and return-cycle interface | Conditional graph reduction audited; finite regression reproduced | Five source-owned row replacements sharing the other rows, an explicit gauge condition, and a source return cycle |
| 5 | Uniform geometric barrier | OPEN MATHEMATICAL | A source-derived no-return cut, path invariant, or sound shortening theorem, with a contradiction consumer |
| 6 | Production validation | Required after each applicable source change | Intended aggregate build, literal axiom audit, independent mathematical audit, fresh source/kernel evidence, and applicable ingress binding |

### 1. Validate the completed source reselection

The `exactfive-double-deletion-reselection-20260905` lane owns
`ExactFiveRetainedDoubleDeletion.lean` and `Rigid221Closure.lean`.
Independent source inspection confirms that the strict selector is called
on the rebuilt packet and normal form. The unused five-incidence declaration
has been removed, and no Lean caller remains. The downstream build is green;
the fresh kernel dependency audit remains an acceptance gate. Do not duplicate
the implementation in a second module.

The source audit binds both clean files to `bce36a53c`. Its retained run is
`scratch/runs/exactfive-double-deletion-reselection-20260905/run-0001/`:
`events/helper-build.log` reports success for 8,762 jobs and
`events/rigid-build.log` for 11,947 jobs. `events/axiom-audit.log` reports only
`propext`, `Classical.choice`, and `Quot.sound` for all ten production helpers.
The coordinator still reaches `sorryAx` through the physical consumer and
`Lean.ofReduceBool`/`Lean.trustCompiler` through the existing finite branch.
The run's source digests match the committed files; its logs are local run
evidence, not a new publication binding. The cap-interior-at-least-six and
carrier-at-least-fifteen consequences retain the hard-source-swap hypotheses;
they do not supply a uniform carrier bound for the physical leaf.

The double-erased witness supplies a selected four-point subclass, not a claim
that the entire radius class has size four. Preserve both omissions. A weak
normal form may choose `fresh := deleted`; only the subsequent
`nonempty_strictThreeCenterAlternative` on the new packet supplies strict
freshness or the tight cover. The former fresh point is not reusable.

### 2. Consume the source geometry in a physical contradiction

The source geometry that was missing at the initial checkpoint is now in
`FirstApexInteriorPairGeometry.lean` and
`FirstApexInteriorPairCirclePower.lean`. In particular,
`bisectorCenter_radius_lt_of_selected_pair` proves strict radius drop;
`dist_firstApex_lt_of_interiorPair_circlePoint_outsideCap` proves the
exterior-point distance drop; and
`interiorPair_circleRadius_lt_dist_supportTriangle` excludes the three
Moser support vertices from that circle. The
[fresh-row checkpoint](../audits/2026-09-05-exactfive-physical-fresh-row-radius-drop.md)
records their source adapters and validation boundaries. The coordinate-free
production argument supersedes the pending coordinate-transport route below.

Read-only consumer inspection at source revision
`955ef2c465c8822b856b204eafeba7f3278c4e55` finds that the physical theorem
still has a bare `sorry` and does not call the fresh-row adapter. Let `q,w`
be `R.interior.frontier.pair` and let `K` be the canonical shell
`(H.selectedAt fresh packet.q_mem_A).toCriticalFourShell`. The physical
packet supplies carrier membership; `fresh_not_mem_firstApexSelectedClass`
supplies the other premise of `actualFreshBlocker_omission_or_twoOutside`.
Its alternatives are:

1. `q` is omitted by `K.support`;
2. `w` is omitted by `K.support`; or
3. `K.support = {q,w,fresh,t}` for four distinct points, with `fresh,t`
   outside the first cap and `K.radius < radius`.

No checked `False` consumer was found for these alternatives. The separate
high-radius double-hit contradiction needs both source memberships and
`radius ≤ K.radius`; the physical packet supplies none of these three
antecedents for the canonical fresh shell. Its old blocker row is a
different row. In the third alternative, both exterior points have
first-apex distance below `radius` and the fresh point is not a Moser
support vertex. These restrictions remain compatible with omission from
the selected radius class. The bounded indexed reuse search found the
existing radius-drop module, not an independent terminal consumer.

**Current proof blocker:** derive a contradiction for the source-entitled
omission cases and for the remaining smaller-radius configuration. Merely
dispatching this trichotomy into new admissions would repackage the open
physical theorem and is not an accepted frontier reduction. The minimum-pair
route below can eliminate a restricted double-hit case once its additional
source hypotheses are retained; it does not yet close this general split.

#### Historical source-geometry preflight

Run one indexed reuse preflight for the first concrete missing antecedent.
Record its immediate physical consumer, relevant source/import revision, and
any circularity. Establish which actual source roles correspond to the
common chord and opposite Moser apex; the MEC center is a different role.

The source bridge must retain strict positive heights, coordinate and metric
transport, both chord-side signs, and strict acute-apex hypotheses where the
disk exclusion uses them. Transport the global source/subchord containment
for every exterior carrier point. Endpoint exclusion additionally needs the
ordered placement and nonacute cap inequalities. None may be replaced by a
diagram or a hypothesis assumed only by a scalar theorem.

Test the first missing source antecedent before building a larger adapter.
If it is unavailable, record that exact obstruction and continue only with
work that supplies it or tests the proposed implication. Do not add a
disconnected collection of scalar lemmas.

Keep the two inequalities and their consumers separate. Strict radius drop
gives `dist c q < r` for the bisecting row center; it closes a double-hit
case only when that row also has radius at least `r`. The circle-power
exterior-hit consequence gives `dist O z < r`. That is compatible with
`z` lying outside the radius-`r` selected class and does not close the
lower-radius child without a further source inequality or contradiction.
Neither inequality alone is a recursive descent.

The first source preflight at revision
`376140d6697ff9da1699147ba3703105815a2019` identifies this proposed bridge
(statement sketch, not an installed theorem):

```lean
theorem inner_pos_of_oppApex1_capInterior_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {q w : ℝ²}
    (hq : q ∈ S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ S.capInteriorByIndex S.oppIndex1) :
    0 < inner ℝ (q - S.oppApex1) (w - S.oppApex1)
```

The immediate geometric consumer is the strict radius-drop implication,
whose intended production consumer is the physical residual named above.
The bounded reuse search found
`CGN.CGN6norm_minorCapChainModel_of_mecCapPacket` in `CGN/CGN6.lean`.
It exports a normalized cap model and `SimilarityTransportData`, but not the
image of `S.oppApex1` or the strict positive heights of these two points.
The indexed corpus was at `1fcfe8a1b`; the candidate's current source was
inspected separately.

Start from `SurplusCapPacket.capByIndex_cgn4g_capData_oriented` in
`SurplusM44Packet/Shard01.lean`. It supplies the ordered cap, actual Moser
endpoints, MEC packet, side data, and strict cap order. The required adapter
must transport the actual apex, use the nonobtuse MEC triangle for its
coordinate inequalities, and use convex independence plus strict interior
membership to exclude zero heights. A weak cap-Thales inequality alone is
insufficient. No circular dependence on the physical contradiction was
identified in this preflight; the source bridge itself remains unproved.

The first transport experiment is now checked in the
[inner-product prototype](../references/exactfive-source-geometry-2026-09-05/SimilarityInnerTransport.lean).
`SimilarityTransportData.inner_eq_scale_sq` derives inner-product scaling
from the existing global `dist_image` field by polarization;
`inner_pos_image` transfers strict positivity using the positive scale.
The parent independently replayed both statements with Lean LSP and literal
axiom probes: only `propext`, `Classical.choice`, and `Quot.sound`, with no
errors or warnings. The [validation receipt](../audits/2026-09-05-exactfive-inner-transport-prototype.json)
binds the tested source and direct import sources at its captured source
head. Later production edits changed those imports; this receipt is
historical prototype evidence, not a binding of their current bytes.

This is a retained prototype, not production integration or physical closure.
No extra inner-product field is needed in the normalization interface.
At that checkpoint the next proposed task was to derive normalized
actual-apex bounds and strict side signs. The subsequent source geometry
above supplies the needed production radius and distance inequalities by a
coordinate-free route. The prototype itself preserves strictness once
proved; it does not supply that strictness.

### 3. Reconstruct source roles after minimizing the pair

Admissibility means joint deletion preserves the second-apex row; survival
under each individual deletion is insufficient. Consecutiveness is within
the strict class slice, not the whole carrier. Rebuild the frontier, actual
blockers, canonical-support equalities, and strict freshness after reselection.
Apply the cap-five double-hit conclusion only to that newly selected pair.
The extra MEC-vertex blocker is a producer with an open contradiction
consumer. Retain the total critical-shell system in that argument.

`MinimalAdmissibleInteriorPair.lean` now minimizes the chord distance
`dist p.1 p.2` over ordered, jointly admissible interior pairs. Its
`no_interiorPoint_closer_to_both` needs independent second-apex full
deletion robustness. It establishes a metric no-shortening property;
indexed consecutiveness still needs a source/order bridge. The current
physical adapter
`false_of_actualFreshBlocker_doubleHit_of_minimalPair_capFive` additionally
requires `M.frontier = R.interior` and first closed-cap cardinality five.
Exact cardinality five of the selected radius class does not by itself
supply that cap-cardinality hypothesis.

At the consumer checkpoint above, the ordinary residual producer and
adaptive common-center reselection choose arbitrary admissible pairs.
Their outputs cannot inherit minimality by assertion. The source owner has
now committed the exact-five split with explicit minimum-pair custody in
`FirstApexUniqueRadiusResidual.lean` (`9120a9609`) and the
cap-five/cardinality-at-least-thirteen/omission adapter (`fa9bba544`). Their
LSP checks pass. Commit `777c0ba74` calls the minimum-pair producer from the
live root, with a successful focused coordinator compile reported by its
owner. Downstream consumers still project `.residual`, discarding the extra
minimum-pair evidence. Carry that evidence into the physical consumer and
through adaptive reselection before treating the minimum-aware route as
complete. This checkpoint is not a fresh kernel reachability audit. The
omission and larger-cap cases remain open even after the conditional cap-five
double-hit consumer applies.

### 3a. Test omission transitions before assuming descent

The [one-hit transition audit](../audits/2026-09-05-exactfive-onehit-omission-transition.md)
records a checked prototype that rechooses the retained endpoint's canonical
blocker from a fresh shell containing it, preserving other chosen centers
and the full support. This repairs orientation by changing `H`; it does not
identify different centers in the old system. Reconstruct the pair and its
dependent residual under the new system before using a physical consumer.
Zero-hit omission cannot use this override.

The transition preserves the chord and first-apex radius. The new
[27-point rational geometric control](../audits/2026-09-05-exactfive-geometric-return.md)
strengthens the incidence-only return test: strict convexity, an acute MEC
support triangle, the exact five-point anchor class, a unique shortest
admissible pair, single-deletion robustness at both selected apices, and
actual critical blockers of both original endpoints still permit `U → C → U`.
The omitted endpoint's chosen blocker stays fixed. Three old-row points
remain outside the first-apex, new-blocker, and preserved second-apex rows.
Thus these local geometric hypotheses do not imply the proposed row cover.

The control fails global K4 at 21 centers and leaves 12 sources without any
actual critical row; it supplies neither total `H` nor `D.Minimal`. Its first
closed cap has 16 points, so it says nothing against the conditional cap-five
consumer. The next proof must use missing full-source hypotheses or a proved
stronger fresh-source selection rule. The bounded source preflight found only
separate support-triangle omissions for individual rows; it found no existing
API guaranteeing a common MEC-vertex omission or a fresh blocker. Supply such
a common-omission theorem or derive an applicable boundary/fiber packet before
requesting its blocker from total `H`.
Another E anchor lies in the first row and supplies no strict freshness.
The inspected `boundary_deletionPacket` producer requires an exact-three-fiber
boundary packet not yet obtained in this residual. No such source selection,
row cover, or well-founded decrease is established. Do not make a recursive
call or replace the open terminal with new admissions on the strength of the
one-hit transition alone.

### 3b. Global deletion and an actual critical row across a new cut

The [global-source cut note](../audits/2026-09-06-exactfive-global-source-cut.md)
audits Pro response `01M1TWK4EP57RK85782ETSAFR4` and proves an intermediate
global statement on paper. It does not close or reduce the physical terminal.
The source puts at least three E members, including q,w, in the first-cap interior;
full containment of E was an unsupported premise in the Pro request and is
not used in the corrected argument.

Deleting U = E ∪ B ∪ L uses global minimality correctly, but its outside
center can be the old retained blocker with a singleton deletion, or O with
a two-anchor deletion. The audited radial formula also shows that a minimal
blocking deletion of size at least two has a robust center. Its restored
four-classes must not be treated as ambient actual-blocker rows.

The different cut X = N ∖ {bq,bw}, where N is the set of all nonrobust
carrier centers, produces an actual critical row. The cover bound
|A| ≤ 4|N| and |A| > 9 make X nonempty. Minimality forces the unique
four-class at some c ∈ X to contain t outside X. Thus c differs from both
original blockers and both robust apices, while t is robust or one of the
two old blocker centers. Deleting t destroys every K4 witness at c, so its
row may be installed as H's choice for t.

This proves existence of an additional actual blocker center. It does not
make t fresh relative to U, put c in the original cap, identify a q,w pair
incidence, or preserve a dependent residual under override. The next
geometric step must treat the robust-source and old-blocker-source arms and
supply an existing consumer's antecedents. No iteration or radius descent
is justified by the cut alone. Keep the physical admission open until that
consumer and its source transport are proved and checked.

### 3c. Exclude mutual double hits when the chord is short

The [mutual-return chord proof](../audits/2026-09-06-exactfive-mutual-return-chord.md)
audits Pro response `01M1VP82R698EMZ83S7EADX101` and strengthens its
old-center return exclusion. Raw pair geometry applies to any selected row
containing two authenticated interior points; it does not require changing
H or choosing a fresh source. The global cut still does not supply those
two incidences.

For an actual double-hit row Kc, assume it contains an old endpoint blocker
b and that the old actual row Kb contains c. Mutual incidence forces equal
radii and an equilateral triangle. The audited paper proof then gives
dist(q,w) > r by convex independence and cap separation. Thus a proved
source chord bound dist(q,w) ≤ r eliminates this mutual-return case.

The same note proves short-pair existence when |I| ≥ 4. Distances from V
to distinct I points are distinct, so at most one unordered I pair can
fail joint deletion survival. Four I rays in the at-most-90-degree MEC
cap cone give two short adjacent pairs; one is admissible. A minimum
admissible pair then has chord at most r.

The remaining short-pair case has |I| = 3. If its only short pair is bad,
V has exactly two rich four-classes, meeting I once each; the third I
point belongs to neither. Exclude this configuration or give it its own
consumer, and thread the minimum-pair payload into the physical leaf.
Mere nearest-pair selection does not establish joint survival.
The omitted-endpoint and non-mutual cases remain open, and this paper
exclusion has not been promoted to Lean or a live terminal reduction.

### 4–5. Keep the uniform reduction separate from its missing geometry

Start with one baseline `FaithfulCarrierPattern` whose gauge center differs
from `O`; replace only the row at `O` by each `E.erase e`. Retain the gauge
equality or inequality explicitly: the existing prescribed-row constructor's
public conclusion does not expose its internally chosen gauge center.
All rows away from `O` must agree across the five systems. Minimality and
strong connectivity then provide the return paths used by the audited graph
argument.

Before using the ten-bisector bound to count distinct actual blockers,
exclude `O` as an anchor's blocker using deletion survival and `H.no_qfree_at`.
Prove the angular boundary-order statement before asserting the eleven sign
intervals. A cycle of at most five anchors does not bound the lengths or
overlap of its return paths. Repeated sign labels alone do not justify
deleting or contracting a path. That missing geometric theorem remains the
research target even if the graph interface is formalized.

## Evidence boundaries and validation

The thirty-point rational control fails global K4 at 23 points; it cannot
supply total `H` or `CounterexampleData`. The strategy replay covers 65,536
abstract graphs and 2,296 coefficient identities. These finite checks do not
establish an all-cardinality theorem. No independently checked n=12 or n=13
UNSAT certificate was validated in these handoff audits. A larger census has
no uniform closure force without a proved bound or lifting theorem.

Validate a bounded helper with Lean LSP or a focused governed target as
required by the lane. A caller change requires its intended aggregate,
independent review, and a transitive axiom check; report any approved native
trust inherited from the tight-twelve consumer. Re-mine kernel references
after the build and state any failed freshness gate. The initial anchor probe
for this execution found no graph for the current build after its automatic
refresh timed out. The later `refs --check` also reports stale/unmined
declarations. Neither probe supplies a current obligation count or closure
claim, and the old generated snapshot still mentions the retired declaration.
Do not hand-edit `docs/live-blueprint.md` or the generated obligation registry.

Before calling solver/certificate evidence promoted or consumer-reachable,
generate and check the project's current ingress-binding record against the
named aggregate, declarations, parent evidence, and successful build log.
Stage only lane-owned paths after hygiene checks. Preserve concurrent lanes'
source and evidence ownership.
