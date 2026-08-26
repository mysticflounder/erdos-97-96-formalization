# Theorem-facing candidates

Evidence labels in this file have their ordinary audit meaning: **PROVEN** is
checked in Lean or by an authenticated proof object; **EMPIRICALLY VERIFIED**
is a replayed finite computation; **CONJECTURED** is a precise unproved
statement; **HEURISTIC** is only a search lead. No relaxed SAT model below is a
countermodel to a Lean packet.

## 1. Direct large residual

**Name.**
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_eighteen`

**Status.** CONJECTURED; this is the existing open declaration at
`Rigid221SourceHeavy.lean:12003`. Confidence is low because the corpus contains
no in-domain model at cardinality at least 18.

**Quantified statement.** Under the implicit
`D S radius H F R P packet` parameters used by the declaration:

```lean
(Q : ExactFourRigid221PentagonBlockerVResidual P packet) ->
((lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
  P.jointDeletion.deleted.1) ->
((lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
  P.jointDeletion.deleted.2 ∈ S.capInteriorByIndex S.oppIndex2) ->
((lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
  P.jointDeletion.deleted.2 ∉ SelectedClass D.A S.oppApex2 P.rho) ->
18 ≤ D.A.card ->
(let Hlate := lateFirstApexSystem R
 let c := Hlate.centerAt P.jointDeletion.deleted.1
   P.jointDeletion.deleted.2
 let hcA : c ∈ D.A := Finset.mem_of_mem_erase
   (Hlate.selectedAt P.jointDeletion.deleted.1
     P.jointDeletion.deleted.2).toCriticalFourShell.center_mem
 ((Hlate.selectedAt c hcA).toCriticalFourShell.support ∩
   SelectedClass D.A S.oppApex2 P.rho).card ≤ 1) ->
False
```

**Hypothesis provenance.** `Q` carries all 17 fields of
`ExactFourRigid221PentagonBlockerVResidual`; its `packet` parameter carries the
nine fields of
`ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket`. The center
identities, interior/off-class facts, cardinality bound, and next-row physical
hit bound are additional branch hypotheses, not fields inferred by the CEGAR
corpus.

**Immediate consumer.** The cardinality/cap split beginning at
`Rigid221SourceHeavy.lean:12110`, with the application near line 12160.

**First missing antecedent.** A cardinality-uniform producer of the needed
cross-centre incidences, or a theorem forcing `D.A.card ≤ 17`. Current cap
arithmetic gives only `9 ≤ |oppCap2| ≤ |A| - 6`. The repository's
`RemovableVertexOfLarge` route cannot be used recursively here.

**Stored-model boundary.** No stored model satisfies the hypotheses. The n=16
probe is below the bound and weaker; exact-17 data is below the bound and uses
a cardinality-fixed adapter. Thus there is no known countermodel boundary in
scope.

**Cardinality and dependencies.** Cardinality-uniform for all `|A| ≥ 18`.
Plausible reusable inputs are
`ATailSurvivalCover.actualBlockerFiber_card_le_four`,
`exists_pair_distinct_actualBlockers_of_five_le_card`, and
`pentagonOffClassBlocker_largeCard_threeColor_pair`, but they currently have no
closing consumer for this packet.

**Reuse preflight.** A bounded project-index search for
`ExactFourRigid221PentagonBlockerVResidual card_ge_eighteen` returned only this
open declaration. No theorem-bank replacement was found.

## 2. Exact-17 cap-nine endpoint

**Name.**
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine`

**Status.** CONJECTURED as a Lean theorem; the current unconditional CNF-UNSAT
proof subgoal is empirically refuted by retained structural SAT assignments.
The declaration is at `Rigid221SourceHeavy.lean:11946`.

**Quantified statement.** It has Candidate 1's `Q` and three center hypotheses,
then assumes:

```lean
D.A.card = 17
(S.capByIndex S.oppIndex2).card = 9
nextRowPhysicalHits ≤ 1
```

and concludes `False`.

**Hypothesis provenance.** The outside-unused/exact-cover split at line 10915
and the source-realization producer at line 11099 construct the exact finite
normal form. `SourceRealization.boundary : Fin 17 -> ℝ²` and
`SourceRealization.card_eq` make this endpoint definitionally bounded.

**Immediate consumer.** The same cardinality/cap split, application near line
12156.

**First missing antecedent.** In the exact-cover arm, the proof asks for
unconditional UNSAT of `extendedCocircularPentagonOrderCnf`. Replayed decoded
assignments show the Boolean abstraction is SAT, while explicitly recording
`source_realizable=false`. The next viable proof must therefore use a refined
source-entitled terminal plus a checked bridge from `SourceRealization`, not the
current base-UNSAT subgoal.

**Stored-model boundary.** Two full decoded row assignments and 251 canonical
row/order shadows survive the retained Boolean encodings. They do not carry a
source realization or Euclidean coordinates and do not refute the Lean
statement. The order-0 audit found 8,259 strict-linear rejections and 21 metric
unknowns among 8,280 Boolean models.

**Cardinality and dependencies.** Strictly fixed to 17. Expected dependencies
are the outside-unused closer, exact-cover adapter, source-normal-form
constructor, and a future refined certificate ingress.

**Reuse preflight.** A bounded project-index search for the declaration plus
`secondCapNine` found only this open leaf. No closing bank theorem was found.

## 3. Uniform missing-incidence eliminator

**Name.**
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_pentagonOffClassBlocker_threeCenterDeletion_xv_missingIncidence`

**Status.** CONJECTURED at `Rigid221SourceHeavy.lean:16691`. Confidence is
low-to-moderate: the positive-incidence terminal is PROVEN, but no producer or
eliminator covers each failed incidence.

**Quantified statement.** For
`Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet` and
`13 ≤ D.A.card`, choose two carrier sources omitted from the `xv` row. Assume
their actual blockers are distinct and both differ from the opposite apex;
assume the two relevant four-point classes fail after deleting `u` but both,
together with the opposite-apex class, survive after deleting `xv`. Finally
assume the five-incidence tetrahedron conjunction fails. The conclusion is
`False`.

The five-incidence conjunction is the exact input expected by the checked
consumer `pentagonOffClassBlocker_xvDeletion_false_of_tetrahedron_incidences`
at line 13254; this candidate handles its complementary branch.

**Hypothesis provenance.** The three exact rows come from
`pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u`. The tetrahedron
kernel is
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`. The missing
piece is a source-level producer for all five cross-centre memberships or an
eliminator for each failed membership.

**Immediate consumer.** `..._threeCenterDeletion` at line 16750, application
near line 16820.

**Stored-model boundary.** Exact-12 incidence survivors lie below the
cardinality bound and omit the global/source hypotheses, so they are not
countermodels. No in-domain full-packet countermodel is known.

**Cardinality and dependencies.** Uniform above 13; the tetrahedron kernel has
no cardinality hypothesis. Expected dependencies are the existing exact-row
constructor and tetrahedron incompatibility theorem.

**Reuse preflight.** A bounded project-index search for
`pentagonOffClassBlocker xv missingIncidence tetrahedron` returned this open
declaration and an exact-12 open sibling, but no closing theorem.

## Recommendation

Attack Candidate 1 next, with the first proof milestone phrased as a precise
cardinality-independent incidence producer. Candidate 2 is a bounded endpoint
and must not be used as a surrogate for Candidate 1. Candidate 3 is the closest
existing reusable theorem shape for learning how to produce or eliminate the
five incidence failures, but closing it alone would not prove the current
`card_ge_eighteen` leaf.
