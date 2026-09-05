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
| 2 | Source geometry for radius drop | Six radius-drop and five circle-power scalar theorems check; source transport remains open | Derive all coordinate/sign hypotheses from the physical residual and apply them at its consumer |
| 3 | Admissible-pair selection and actual-blocker reconstruction | Conditional prose argument audited | Minimize among jointly admissible pairs, rebuild dependent source data, and close or strictly narrow a live physical case |
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

### 2. Start at the source geometry, before another scalar lemma

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

### 3. Reconstruct source roles after minimizing the pair

Admissibility means joint deletion preserves the second-apex row; survival
under each individual deletion is insufficient. Consecutiveness is within
the strict class slice, not the whole carrier. Rebuild the frontier, actual
blockers, canonical-support equalities, and strict freshness after reselection.
Apply the cap-five double-hit conclusion only to that newly selected pair.
The extra MEC-vertex blocker is a producer with an open contradiction
consumer. Retain the total critical-shell system in that argument.

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
