# Rigid221 pentagon-off-class direct-consumer audit

Date: 2026-08-06  
Scope: read-only search of the `Rigid221Placement` import closure, the six
registered theorem-bank artifacts, and the nthdegree Lean corpora. No
production file was edited.

## Verdict

**No direct consumer was found.** In particular, no imported or registered
theorem accepts the five exact C5 physical traces together with injectivity of
their five actual-blocker centers and returns `False`, an `IsM44` packet, a
third-bisector/three-hit row, or a terminal already usable by
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`.

The source fact is stronger than the existing blocker-multiplicity producers
but weaker in the wrong direction for the available consumers:

- fiber bounds close **five equal blockers**, whereas the source proves five
  distinct blockers;
- common-cap geometry closes **two cap centers bisecting one common outside
  pair**, but the C5 rows use five different physical edges and do not locate
  all blocker centers in one cap;
- U5 incidence consumers need a common deletion and positive cross-row
  incidences (usually a common third point or a dangerous-triple frame), none
  of which follows from the C5 traces.

## Source-clean input actually available

In `scratch/PentagonOffClassProducerProbe.lean`:

```lean
Problem97.ATailFrontierLiveClosure.
  pentagonOffClass_exact_physical_cycle_traces_probe
```

at line 1945 has the target packet and its row hypotheses as inputs and returns,
with `Hlate := lateFirstApexSystem R` and
`C := SelectedClass D.A S.oppApex2 P.rho`,

```lean
row(u)       ∩ C = {u, xu}       ∧
row(v)       ∩ C = {v, xv}       ∧
row(xv)      ∩ C = {xv, u}       ∧
row(xu)      ∩ C = {xu, deleted} ∧
row(deleted) ∩ C = {deleted, v}.
```

The exact signature is the declaration at lines 1945-2019; its explicit inputs
are `P`, `packet`, `hxuA`, `hxvA`, `huXvRow`, `huNotXuRow`, `hxvNotXuRow`,
`hdeletedXuRow`, `hvDeletedRow`, `huNotDeletedRow`, `hxuNotDeletedRow`,
`hxvNotDeletedRow`, `hclassFive`, `htraceBound`, and `htraceBoundXu`.

```lean
Problem97.ATailFrontierLiveClosure.
  pentagonOffClass_physical_cycle_actualBlockers_injective_probe
```

at line 2168 has signature

```lean
(P : ExactFourRigid221PhysicalApexSourceEqUContext R)
(packet : ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
(hxuA : packet.xu ∈ D.A) (hxvA : packet.xv ∈ D.A)
(htraces : <the five equalities above>) :
  let Hlate := lateFirstApexSystem R
  let sources : Fin 5 → CarrierVertex D.A := fun i => ![
    P.u, ⟨packet.xu,hxuA⟩, P.jointDeletion.deleted,
    P.v, ⟨packet.xv,hxvA⟩] i
  Function.Injective fun i =>
    Hlate.centerAt (sources i).1 (sources i).2
```

A fresh direct elaboration succeeded. Both declarations print only
`propext`, `Classical.choice`, and `Quot.sound`; neither depends on `sorryAx`.
The production target at `Rigid221SourceHeavy.lean:3591` remains an explicit
`sorry`, so these probes are producers, not closure.

## Imported near-consumers and exact missing hypotheses

All declarations in this section were accepted by Lean after importing only
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement`.

### 1. Distinct blockers give survival, not a terminal

`Problem97.ATailUniqueRowProducerScratch.cross_survival_of_distinct_blockers`
(`card_five_interior_bisector_localization.lean:252`):

```lean
(P : SurvivorPairRelocationPacket D S r H) (hr : 0 < r)
(hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card)
(hcenters : H.centerAt P.q P.q_mem_A ≠ H.centerAt P.w P.w_mem_A) :
  HasNEquidistantPointsAt 4 (D.A.erase P.w) (H.centerAt P.q P.q_mem_A) ∨
  HasNEquidistantPointsAt 4 (D.A.erase P.q) (H.centerAt P.w P.w_mem_A)
```

Missing: a `SurvivorPairRelocationPacket` for a chosen C5 pair at the theorem's
first-apex radius. Even after packaging, the result is only a directed
deletion-survival disjunction. It does not yield `False`, `IsM44`, or a
three-hit row.

### 2. Distinctness contradicts mutual cross-membership, but C5 has none

`Problem97.ATailCriticalPairFrontier.
blocker_centers_eq_of_five_le_of_mutual_cross_membership`
(`CriticalPairFrontier.lean:1176`):

```lean
(P : SurvivorPairRelocationPacket D S r H) (hr : 0 < r)
(hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card)
(hwq : P.w ∈ row(P.q)) (hqw : P.q ∈ row(P.w)) :
  H.centerAt P.q P.q_mem_A = H.centerAt P.w P.w_mem_A
```

Missing: the relocation packet and reciprocal membership for one named pair.
The exact C5 traces rule reciprocal membership out for every pair of named
physical sources: each C5 edge occurs in one direction only. Thus injectivity
cannot be contradicted through this API.

### 3. Common cap closes only with a common outside pair

`Problem97.ATailUniqueRowProducerScratch.
false_of_two_cap_centers_equidistant_outside_pair`
(`card_five_cross_blocker_localization.lean:68`):

```lean
(S : SurplusCapPacket D.A) (k : Fin 3) {c apex a b : ℝ²}
(hcCap : c ∈ S.capByIndex k) (hapexCap : apex ∈ S.capByIndex k)
(hc_ne_apex : c ≠ apex)
(haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
(haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
(hcEq : dist c a = dist c b) (hapexEq : dist apex a = dist apex b) : False
```

Missing: localization of two distinct blocker centers in the same indexed cap
and two distinct points outside that cap bisected by both. The source-clean
profile localizes only the `xv` blocker in the second-cap interior. The five C5
trace pairs are different and are physical cap points, not one repeated
outside pair.

### 4. A common blocker fiber is bounded, but the source proves different fibers

`Problem97.ATailSurvivalCover.actualBlockerFiber_card_le_four`
(`SurvivalCover.lean:86`):

```lean
(H : CriticalShellSystem A) (anchor : CarrierVertex A) :
  (actualBlockerFiber H anchor).card ≤ 4
```

and the packet-specialized
`Problem97.ATailAnchoredDoubleDeletionProducer.qBlockerFiber_card_le_four`
(`AnchoredDoubleDeletionProducer.lean:166`):

```lean
(P : SurvivorPairRelocationPacket D S r H) : (qBlockerFiber P).card ≤ 4
```

These close five sources only after proving that all five have the **same**
actual blocker. Injectivity proves the opposite. The related
`exists_pair_distinct_actualBlockers_of_five_le_card` merely produces one
distinct pair from five sources and is strictly weaker than the probe.

### 5. Third-center and three-hit terminals require positive incidences

`Problem97.ATailThirdCenterCommonPair.
false_of_thirdActualCenter_selectedRow_contains_frontierPair`
(`ThirdCenterCommonPair.lean:81`):

```lean
(P : SurvivorPairRelocationPacket D S r H)
(hwSupport : P.w ∈ row(P.q))
(hqBlocker_ne_first : H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
(hsource : source ∈ D.A)
(hthird_ne_first : H.centerAt source hsource ≠ S.oppApex1)
(hthird_ne_qBlocker : H.centerAt source hsource ≠ H.centerAt P.q P.q_mem_A)
(hqThird : P.q ∈ row(source)) (hwThird : P.w ∈ row(source)) : False
```

Missing: a third source row containing the same pair `P.q,P.w`, plus the
relocation packet and apex inequalities. Every physical C5 edge occurs in
exactly one named row, so no other named physical source supplies this row.
An off-class third source is not produced.

`Problem97.u5_common_bisector_triple_incompatibility`
(`U5GlobalIncidenceKernels.lean:146`):

```lean
(hr_pos : 0 < dist p q) (hT_noncol : ¬ Collinear ℝ {t1,t2,t3})
(ht1_radius : dist p t1 = dist p q)
(ht2_radius : dist p t2 = dist p q)
(ht3_radius : dist p t3 = dist p q)
(Kx : U5QDeletedK4Class D q x Bx)
(hpBx : p ∈ Bx) (ht1Bx : t1 ∈ Bx)
(ht2Bx : t2 ∈ Bx) (ht3Bx : t3 ∈ Bx) : False
```

Missing: one common-deletion exact row containing `p,t1,t2,t3`, three
noncollinear points on the same positive-radius `p`-circle, and all positive
memberships. Each named C5 row has exactly two physical-class hits; the fact
does not produce an external three-hit row.

The stronger three-hit producer
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.
exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions`
(`TwoSourceAlignedLowHits.lean:515`) is **not current-import reachable**. Its
signature requires two distinct-radius `RetainedInteriorBlockerCollision`
packets, both exact-four classes with two strict-interior hits, and the full
bi-apex/all-large/tri-apex residual chain. None is supplied by the one
second-apex exact-five C5 fact.

### 6. The available `IsM44` constructor has the wrong cap profile

`Problem97.isM44Packet_of_capTriple_C1_surplus`
(`U1TwoShortCapReduction.lean:472`):

```lean
(MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
(hCirc : ∃ h12 h23 h13, MT.toMoserTriangle.case_split =
  Or.inl ⟨h12,h23,h13⟩)
(CP : CapTriple A (MT.toMoserTriangle.toStructural hCirc))
(hC1 : 4 < CP.C1.card) (hC2 : CP.C2.card = 4)
(hC3 : CP.C3.card = 4) : ∃ S : SurplusCapPacket A, S.IsM44
```

Missing: a cap triple with sizes `(>4,4,4)` for an appropriate Moser triangle.
The source-clean exact-card-12 profile is `(5,4,6)`, so its given cap triple
fails one exact-four hypothesis. No theorem found converts blocker injectivity
or C5 traces into a different `(m,4,4)` cap triple.

### 7. Five-center exact-row API is normalization only

`Problem97.ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary`
(`FiveCenterDeletionBoundary.lean:90`):

```lean
(H : CriticalShellSystem D.A) (hq : q ∈ D.A)
(h : FiveCenterDeletionSurvival D q c0 c1 c2 c3 c4) :
  Nonempty (FiveSurvivorExactRowsBoundary D H q hq c0 c1 c2 c3 c4)
```

It requires five K4 survivals after **one common deletion** `q`, which the five
C5 traces alone do not provide. Its result exposes five exact q-deleted rows
and the deleted source's distinct failed actual blocker. Searches of all uses
found only packet projections/normalization, notably
`collisionFiveCenterExactRows_of_deletionResidual`; no proved downstream
terminal consumes this boundary.

## Registered bank results

The `p97-rvol` registry's closest source-proved theorem is
`Problem97.U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`
(`U5GlobalIncidenceQCriticalExactTetrahedron.lean:29`):

```lean
(Kx : U5QDeletedK4Class D q x Bx)
(Ky : U5QDeletedK4Class D q y By)
(Kb : U5QDeletedK4Class D q b Bb)
(hyBx : y ∈ Bx) (haBx : a ∈ Bx)
(hxBy : x ∈ By) (haBy : a ∈ By) (hbBy : b ∈ By)
(hxBb : x ∈ Bb) (hyBb : y ∈ Bb) (haBb : a ∈ Bb) : False
```

Missing: three exact rows for one common deletion and all eight displayed
cross-support memberships, including one common auxiliary point `a`. The C5
trace fact supplies neither. Lean reports this declaration as unknown in the
current anchored import; the registry's `source_reachable = true` refers to
the sibling `RVOL` import root, not this target.

Another close bank theorem is
`Problem97.U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility`
(`U5QCriticalMutualNoPExactCenter.lean:127`):

```lean
(htriple : U5DangerousTriple D q p T) (ha : a ∈ T) (hb : b ∈ T)
(Ka : U5QCriticalTripleClass D q a Ba)
(Kb : U5QCriticalTripleClass D q b Bb)
(Ku : U5QDeletedK4Class D q u Bu)
(hbBa : b ∈ Ba) (huBa : u ∈ Ba)
(haBb : a ∈ Bb) (huBb : u ∈ Bb)
(hpBu : p ∈ Bu) (haBu : a ∈ Bu) : False
```

Missing: a dangerous triple, two q-critical classes, a common q-deleted row,
and all six positive incidences. It is also absent from the current import.

The imported bound
`Problem97.U5QDeletedK4Class.inter_card_le_two`

```lean
(Kx : U5QDeletedK4Class D q x Bx)
(Ky : U5QDeletedK4Class D q y By) (hxy : x ≠ y) :
  (Bx ∩ By).card ≤ 2
```

is compatible with C5 edge intersections and has no converse/terminal at
equality. Also, the probe controls `row(source) ∩ C`; it does not identify the
full intersections `Bx ∩ By` of common-q deleted rows.

The two legacy JSON registries have zero candidates matching blocker, fiber,
bisector, C5/cycle, or blocker-center injectivity. The sibling registry has 13
generic `Function.Injective` declarations, but none consumes injectivity of
actual blockers. The registry overview itself records that the U5 banks still
lack the geometric packet-classification/incidence producer needed to feed
their contradiction consumers.

## Search conclusion / exact missing bridge

A usable direct bridge would need to prove at least one of:

1. two of the five actual blockers lie in one indexed cap and bisect the same
   two distinct points outside it;
2. one named pair is mutually cross-incident (impossible among the five named
   rows under the exact C5 traces), or an off-class third row contains that
   pair;
3. three of the rows survive one common deletion and satisfy a bank theorem's
   positive tetrahedral/dangerous-triple incidences;
4. a new Moser cap triple has cardinalities `(m,4,4)`; or
5. a genuinely new finite-geometric consumer of five distinct actual blockers
   with exact C5 physical traces.

Without one of these producers, the source-clean fact is an incidence
normal form and a blocker-injectivity result, not a closure theorem.

## Search evidence

- Current-import reachability was checked by `#check` under the sole target
  import `Rigid221Placement`; the two sibling consumers and the later
  two-collision three-hit producer were rejected as unknown.
- Searched all registered Markdown/JSON banks named in `AGENTS.md`.
- Searched merged and current-project nthdegree Lean corpora for five-center
  deletion, blocker fibers, common cap/outside-pair consumers, C5 row
  intersections, `IsM44`, third bisectors, and three-hit rows. Corpora were
  indexed 2026-08-06; all report-relevant current declarations were then
  verified against live source/imports.
