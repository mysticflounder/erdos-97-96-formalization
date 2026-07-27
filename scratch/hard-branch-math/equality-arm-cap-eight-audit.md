# Cap-eight arm audit for the source-exact two-row leaf

## Scope and verdict

This audits only the left arm

```lean
8 ≤ (S.capByIndex S.oppIndex1).card
```

of
`Problem97.ATailFrontierLiveClosure.exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
at `FrontierLiveClosure.lean:5118-5187`.

**Verdict:** no imported, source-clean checked theorem found in the current
repository or indexed Lean corpora turns this cap-cardinality arm, together
with the displayed global packets, into a three-hit shell, a named cross hit,
or `False`.  The arm does force at least two additional strict-cap points and
hence at least one new first-apex radius/source.  It does **not** force that
radius to have four points, or connect either extra point positively to any
canonical critical shell.  That positive incidence/metric connection is the
first missing premise.

## Exact checked consequence of `cap ≥ 8`

Write

```text
I = S.capInteriorByIndex S.oppIndex1
U = {P.source₁,P.source₂} ∪ {Pρ.source₁,Pρ.source₂}.
```

1. `ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two`
   (`CapApexRadiusRigidity.lean:29-31`) and `cap.card ≥ 8` give `I.card ≥ 6`.
2. `hpairsDisjoint`, both `sources_ne` fields, and the two exact-intersection
   hypotheses give `U.card = 4` and `U ⊆ I`.
3. Therefore `(I \ U).card ≥ 2`.
4. For any `z ∈ I \ U`, `S.capInteriorByIndex_subset` gives `z ∈ D.A`.
   Put `σ = dist S.oppApex1 z`.  Then
   `mem_selectedClass` gives
   `z ∈ SelectedClass D.A S.oppApex1 σ`.  If `σ = radius` or `σ = ρ`,
   the corresponding exact-intersection equality puts `z` in `U`, a
   contradiction.  Thus `σ` is a third first-apex radius.

This is the strongest unconditional finite consequence visible at the
interface.  The two extra points may have the same new radius (a two-point
class) or two different singleton radii.

The provenance confirms why this is sharp.  The only producer of the
cap-eight disjunct is
`six_interior_or_cross_blocker_coincidence`
(`FrontierLiveClosure.lean:4767-4817`): absent a cross blocker/source
coincidence, the six accounted interior points are exactly the four sources
and the two distinct blocker centers.  The coordinator converts its
`I.card ≥ 6` result to `cap.card ≥ 8` at lines 5499-5522.  No seventh point is
encoded.

## Why the global hypotheses do not close it

* `T.oppApex1_rich` need add nothing: the two given distinct exact-four radii
  already witness the second disjunct of `ApexRichClassStructure`
  (`ApexRichClassStructure.lean:50-53`).  In the alternative six-point-class
  disjunct there would be a third large radius, but the theorem must also
  handle the already-satisfied two-K4-radii disjunct.
* More strongly,
  `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`
  (`ApexRichClassStructure.lean:129-142`) proves that, at every apex whose
  richness field comes from `T`, every canonical critical shell has at most
  two points in every indexed apex-radius strict-cap class.  Hence the
  requested three-hit alternative is itself inconsistent with `T`; a proof
  of the cap-eight arm must actually derive `False` or a named cross hit and
  then use ex falso.
* `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`
  (`FrontierLiveClosure.lean:4247ff`) localizes a blocker after two hits; it
  does not create a hit.
* `false_of_centerAt_selectedFourClass_inter_card_ge_three`
  (`MinimalUniqueFourCover.lean:375-389`) consumes an already-proved
  three-hit intersection; it does not produce one.
* The two `LocalizedCollisionMutualOmissionCycle` arguments contain cross
  **nonmembership**, blocker equalities/inequalities, and common-deletion
  packets (`LocalizedCollisionMutualOmissionCycle.lean:131-163`).  They expose
  no positive support membership for either surplus cap point.
* The sharp radius/cap theorems in `CapApexRadiusRigidity.lean:151-222` run
  from known large radius classes to lower bounds on cap size.  There is no
  checked converse from cap size eight to a K4 radius.

## Finite incidence shadow showing the gap

The following is a precise model of the cap/class/shell facts exposed by this
arm (not a claimed Euclidean realization of every opaque packet field):

```text
C = {e0,e1,p1,p2,u,v,b0,b1}                  closed cap, |C| = 8
I = {p1,p2,u,v,b0,b1}                        strict interior, |I| = 6
Kr ∩ I = {p1,p2},    Kρ ∩ I = {u,v}
Kr = {p1,p2,o1,o2},  Kρ = {u,v,o3,o4}        exact-four classes
Qp = {p1,p2,a0,a1},  Qu = {u,v,c0,c1}        critical-shell supports
u,v ∉ Qp,            p1,p2 ∉ Qu              all four cross hits false
```

Take `b0,b1` distinct from all four sources and assign them either one common
new first-apex radius (class size two) or two singleton radii.  The first-apex
richness predicate is already witnessed by `Kr,Kρ`.  Nothing in the exposed
finite interface places `b0` or `b1` in `Qp`, `Qu`, or any same-radius
three-point subset of another canonical shell.  Thus cap eight plus the
exact-two rows has no incidence-theoretic route to the conclusion.

The closest sibling-bank result,
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
(`certificates/p97_rvol_general_n_mining.md:97`), is not import-reachable here
and requires seven named distance equalities.  The cap-eight arm and omission
cycles do not supply those equalities.  The U5/general-n registries likewise
require concrete row-slot/incidence packets absent from this interface.

## First missing premise

The first missing input is a **positive geometric bridge** from an extra point
of `I \ U` (in the sharp producer, a blocker center) and the common-deletion
packets to either:

1. one of the four named cross-shell memberships; or
2. three explicit, distinct support points on one common radius about one of
   the three indexed apices (equivalently, the concrete distance equalities
   needed by an imported terminal); or
3. a checked direct contradiction.

Additional cap cardinality, a third singleton/two-point radius, or the existing
negative omission fields cannot substitute for this premise.

## Searches performed

Checked the current imports and the required registries:

* `docs/general-n-certificate-bank-mining-2026-07-09.md`;
* `certificates/p97_rvol_general_n_mining.{md,json}`;
* `certificates/erdos97_legacy_general_n_mining.{md,json}`;
* `certificates/erdos_general_theorem_p97_mining.{md,json}`;
* indexed `nthdegree docs search --lean` queries for cap-eight/two-exact-K4,
  three-hit, cross-blocker, rich-apex, and large-cap obstruction statements.

The nearest checked imported hits were the upper-bound/localization consumers
listed above, not a producer.  No production files were edited.
