# B1 coupled source-omission audit

Date: 2026-09-04  
Lane: `luna-swarm-slice-ingress-b1-coupled-source-omission-20260904`  
Assignment: #11777 from `@Codex-B1-Sorry-Monitor`

## Result

No source-clean theorem was found in the current indexed source that couples
the strict-interior source `other` with the mutually omitted pair `u,v` by
proving

```text
other ∉ row_u ∧ other ∉ row_v.
```

At the source boundary, the missing field is precisely this coupling.  The
current producer supplies `other` and `u,v` by two independent finite-selection
arguments.  Its packet fields do not contain a relation between `other` and
either pair row.  The requested exact rigid `2+2` alternative also needs
strict-interior placement data that is absent from the current source-context
structure.  The reduced projection below shows that the recorded incidence
fields alone do not force the coupling.  This is a source-availability result,
not a non-derivability claim under the full geometric hypotheses.  Therefore
no Lean module was added and no build was run.

## Scope and hypotheses checked

The audit used the source-clean ingress assumptions requested for this lane:

* `R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F`, with
  `F : CriticalPairFrontier D S radius H`;
* `surface : ExactFourPostCardElevenRobustSurface R`;
* `0 < rho` and
  `5 ≤ (SelectedClass D.A S.oppApex2 rho).card`;
* `source` in the selected physical class and in
  `S.capInteriorByIndex S.oppIndex2`;
* `source` outside the first-apex fiber; and
* the retained/survival hypotheses used by
  `exists_exactFourMutualOmissionSourceContext_of_fivePointInteriorSource`.

These are the convexity, robust-surface, cap-interior, and deletion-survival
conditions available at the producer boundary.  No additional geometric
independence or order hypothesis was silently added.

## Reuse preflight

One indexed repository search was run for the changed key:

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean \
  "ExactFourMutualOmissionSourceContext other omitted both actual u v rows coupled source choice exactFive strongSplit"
```

The index reported source revision `@59342b9b5` (index time
`2026-09-04 10:28 UTC`).  Relevant hits were `431HAB`
(`ExactFourMutualOmissionSourceContext`), `G6WDP4`, `D98KHH`, `Q2WHKF`,
`TE6PTK`, and `9CRRXV` (provenance readers/adapters).  The other high-ranked
hits were Rigid221 or Rigid221Closure declarations (`X3XSN0`, `HM47ND`,
`3FYAXP`, `7NPAAD`), which are outside this lane and were not used.

## Existing producer boundary

`TwoDeletionCollision.lean:59-145`, theorem
`exists_exactFourMutualOmissionSourceContext_of_fivePointInteriorSource`,
first invokes `exists_omittedSecondClassInteriorPeer`.  That theorem chooses
`other` with class membership, strict-cap interior membership, omission from
the source row, and source/other blocker inequality.

The same producer then invokes `exists_mutuallyOmittedSecondClassPair`.  That
independently chooses `u,v` with `u ≠ v`, class membership, mutual row
omission, `source ∈ row_u`, `v ∉ row_source`, and
`u = source ∨ u ∉ row_source`.  The resulting
`ExactFourMutualOmissionSourceContext` records those facts, but it has no
field asserting `other ∉ row_u` or `other ∉ row_v`.

`JointDeletion/Types.lean:75-121` confirms the same boundary: the context
stores `other_not_mem_source_row`, while the joint packet stores only that its
deleted source is omitted from both pair rows.  It does not relate `other` to
the packet's deleted source or to either pair row.

`B1Live.lean:43-56` explicitly describes the available cardinality theorem as
a producer-side constraint and says it does not assert that an interior member
is omitted from both live rows.  Its later row-cover theorem
(`B1Live.lean:516-662`) narrows an interior cover to a deleted interior point,
a third packet, or an interior live source; it does not select a common
source-clean `other` for both rows.

## Directed cross-deletion edge check

The requested consumer-facing strengthening is a directed edge between two
prospective deleted sources, for example

```text
P.deleted.1 ∉ row(Q.deleted)  ∨  Q.deleted.1 ∉ row(P.deleted).
```

The source-clean producer creates only one `ExactFourMutualOmissionJointDeletion`
packet.  Its exact-five split (`JointDeletion/ExactFiveSplit.lean:147-241`)
offers a second packet with a different deleted source, but supplies no
cross-row omission.  The six-point producer likewise separates deleted
sources but does not supply the actual-blocker separation needed by the
consumer.

The existing consumer boundary is explicit.  `TwoDeletionCollision.lean:1064-1099`,
`exactFour_twoDeletion_crossOmission`, derives a directed omission only after
receiving two packets, distinct deleted sources, and distinct actual blockers.
The blocker-equality route used by the producer is
`TwoDeletionCollision.lean:105-116`, where
`ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` identifies the
two supports and the second row's own-source membership contradicts a
directed omission.  Conversely, once a directed omission is supplied,
`SharedFrontierHelpers.lean:131-144` shows that equal blockers would identify
supports and contradict that omission via the two `q_mem_support` witnesses.

For the survival formulation, `SharedFrontierHelpers.lean:417-422` uses
`cross_deletion_survives_iff_not_mem_selected_support` followed by
`Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives`.
The current source context has neither a second packet nor either directed
cross-deletion edge, so this consumer bridge cannot be instantiated from the
producer boundary.

## Reduced incidence projection

The following finite incidence pattern is a reduced projection of the
row/cardinality fields consumed by the existing producer.  It is a
heuristic/conditional obstruction for the full hypotheses, not a model of
`CounterexampleData`, `ConvexIndep`, `R`, the robust surface, survival, or a
full `ExactFourMutualOmissionJointDeletion` packet.  In particular, it does
not claim a Euclidean realization.

Let the selected class be

```text
C = {s,p,u,v,w},       |C| = 5,
row_s ∩ C = {s,p},      capInterior ∩ C = {s,p,u}.
```

Then `C \\ row_s = {u,v,w}`, and the only strict-interior class member outside
`row_s` is `u`.  Choose the independent mutually omitted pair as

```text
row_u ∩ C = {s,u},      row_v ∩ C = {v,w}.
```

The pair conditions used by the producer hold:

```text
u ≠ v,
v ∉ row_u,
u ∉ row_v,
s ∈ row_u,
v ∉ row_s,
u ∉ row_s.
```

Within this reduced projection, the source-context choice is forced to
`other = u`, since `u` is the only strict-interior peer available outside
`row_s`.  But `other ∈ row_u`, so the desired simultaneous omission fails.
Abstract blocker labels can be assigned to the projected source/other and
pair-row inequalities; the projected constraints do not forbid this pattern.

This identifies the missing source-level antecedent without conflating a
reduced incidence projection with a full geometric counterexample.

The unmodeled obligations are substantial: a realization would need an
actual finite carrier `D.A`, `D.convex : ConvexIndep D.A`, a valid frontier
residual `R`, an `ExactFourPostCardElevenRobustSurface R`, actual Euclidean
distance equalities defining every selected row, the selected centers and
their blocker inequalities, the retained deletion-survival witnesses, and
the packet fields and cardinality proof required by
`ExactFourMutualOmissionJointDeletion`.  None of these obligations is
discharged by the projection.

## Rigid `2+2` branch

`JointDeletion/ExactFiveSplit.lean:147-241` can split an exact-card-five
joint packet into a second packet or a rigid class decomposition with two
class points in each pair row.  That decomposition is about class-row
incidences.  It does not say which of the three source-row-omitted points is
strict-cap interior, nor does it force the context's strict-interior `other`
to be outside both pair rows.

The projection above has the exact five-point and two-point row bounds, while
the strict-interior set places the unique source-row-omitted interior peer at
`u`, a member of `row_u`.  Thus an exact `2+2` incidence split alone does not
supply the requested source-clean alternative at the recorded source level.
It does not rule out a future geometric theorem using additional hypotheses.
A successful future theorem needs one of:

1. a coupled selector that chooses `other` after both rows are known;
2. a strict-interior complement/order lemma forcing an interior point outside
   both rows; or
3. an explicit added antecedent `other ∉ row_u ∧ other ∉ row_v`;
4. two joint packets plus a directed cross-deletion edge, or a separate
   geometric theorem that supplies the blocker separation needed to derive
   that edge.

No such antecedent is present in the current producer boundary.

## Lane artifacts

* Checkpoint: `.codex/worktree-checkpoints/luna-swarm-slice-ingress-b1-coupled-source-omission-20260904.json`
* This audit is the only source artifact for the lane.
* No `B1CoupledSourceOmission.lean` module was justified.
* No `lake-build`, axiom probe, or no-sorry probe was run because no proof
  source was added.
