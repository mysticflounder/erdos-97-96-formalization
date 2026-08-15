# Card>=13 five-cross-incidence producer attempt

Bounded, read-only audit. No production Lean file was edited and no commit was
made. The only new artifacts are this note and the adjacent scratch Lean file.

## Indexed search first

The required corpus search was run first:

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean \
  "endpoint-parametric five cross-incidence producer rigid221 card>=13"
```

The closest indexed hits were `LargeCapUniqueFiveCrossIncidence`,
`card_five_interior_critical_frontier`,
`card_five_cross_blocker_localization`, and the U5 tetrahedron consumer. None
was a card>=13 producer of the five live incidences.

## Weakest shared endpoint-parametric terminal

The scratch file defines `FiveCrossIncidences` at lines 22-29 and checks:

```lean
false_of_endpoint_parametric_five_cross
  (hK₁ : U5QDeletedK4Class D q center₁ K₁)
  (hK₂ : U5QDeletedK4Class D q center₂ K₂)
  (hBO : U5QDeletedK4Class D q apex BO)
  (hcommon : a ∈ K₁ ∧ a ∈ K₂ ∧ a ∈ BO)
  (hcross : FiveCrossIncidences center₁ center₂ apex K₁ K₂ BO) : False
```

It is at scratch lines 37-49. The endpoint `q` is arbitrary, so it covers
both live arms:

* `u` arm: `q = P.u.1`, with the common deletion point `a` supplied by the
  common-`xv` three-row producer.
* `xv` arm: `q = packet.xv`, with the common deletion point `a` supplied by
  the common-`u` three-row producer.

The checked U5 consumer is applied as `(hBO, hK₁, hK₂)`, with `a` providing
the three common memberships. The remaining five fields are exactly:

```text
center₁ ∈ BO
apex   ∈ K₁
center₂ ∈ K₁
apex   ∈ K₂
center₁ ∈ K₂
```

Thus the smallest producer obligation is the proposition
`EndpointParametricFiveCrossProducerTarget` at scratch lines 54-57. It is a
target declaration, not a proved producer.

## Live declarations and classification

* **Producer, conditional on the source-heavy parent packet:**
  `pentagonOffClassBlocker_threeCenterDeletion_or_card_eq_twelve`,
  `Rigid221SourceHeavy.lean:13114-13153`. Under the live `hxvA` and `huXvRow`
  hypotheses it supplies `D.A.card = 12` or `13 ≤ D.A.card`, an endpoint
  deletion, two distinct actual blocker centers, their endpoint-deletion
  survival, and physical-apex survival. It does not supply any of the five
  cross-incidences.

* **Producer, source-clean three-row exports:**
  `pentagonOffClassBlocker_xvDeletion_threeExactRows_common_u`,
  `Rigid221SourceHeavy.lean:12777`, and its symmetric
  `pentagonOffClassBlocker_uDeletion_threeExactRows_common_xv`,
  `Rigid221SourceHeavy.lean:12883`. They export three exact q-deleted rows
  and the common deletion point; they stop before the directed cross hits.

* **Consumer, source-clean and checked:**
  `pentagonOffClassBlocker_xvDeletion_false_of_tetrahedron_incidences`,
  `Rigid221SourceHeavy.lean:12989-13047`, and
  `pentagonOffClassBlocker_uDeletion_false_of_tetrahedron_incidences`,
  `Rigid221SourceHeavy.lean:13052-13110`. They consume exactly the five
  live cross fields plus the three common memberships.

* **Consumer, source-clean theorem-bank core:**
  `U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`,
  `U5GlobalIncidenceQDeletedTetrahedron.lean:23-62`. The scratch terminal is
  an endpoint-parametric adapter to this declaration.

* **Conditional obstruction, not a producer for this lane:**
  `LargeCapUniqueFiveTwoHitCriticalRow` and
  `false_of_largeCapUniqueFiveTwoHitCriticalRow`,
  `ATail/LargeCapUniqueFiveCrossIncidence.lean:37-59` and `:59-144`.
  It proves impossibility after a critical row already has two physical hits;
  the module explicitly leaves construction of that packet open.

* **Conditional obstruction/localization, not a producer:**
  `q_blocker_mem_firstInterior_of_cross` and
  `w_blocker_mem_firstInterior_of_cross`,
  `CardElevenUniqueFourCertificate/Support/UniqueRowProducer/
  card_five_cross_blocker_localization.lean:129` and `:226`. These turn an
  already-given directed cross hit into cap localization.

* **Conditional exact-card-five producer, not card>=13:**
  `exists_cardFiveInteriorDoubleDeletionPair` and
  `exists_cardFiveInteriorCriticalPairFrontier`,
  `card_five_interior_critical_frontier.lean:80` and `:258`. These establish
  an exact-card-five strict-interior frontier, not the retained third-center
  or five-cross packet at card>=13.

* **Generic combinatorial producer, insufficient here:**
  `third_fiber_or_larger_known_fiber_of_three_omissions`,
  `BiApexBlockerMultiplicity.lean:111`, and
  `FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber`,
  `BiApexBlockerMultiplicity.lean:250`. They produce fiber/card alternatives
  but no metric survival or membership in `BO`.

* **Conditional fresh-third producer, not retained-center closure:**
  `exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_of_not_retained`,
  `TwoSourceFreshThirdFiber.lean:1145` (packet adapter at `:1182`). This
  supplies a new-radius surface under a non-retention hypothesis, not the
  current retained `d`; its module also contains unrelated open material, so
  it is not treated as a transitive source-clean promotion here.

## First genuinely missing incidence

The first load-bearing missing field is `center₁ ∈ BO` in both open leaves:

* `Rigid221SourceHeavy.lean:16021-16047` (`u` arm fixed pair), and
* `Rigid221SourceHeavy.lean:16113-16166` (`xv` arm).

Unfolding `BO` reduces this to the center surviving the endpoint deletion,
belonging to `D.A`, and satisfying
`dist S.oppApex2 center₁ = P.rho`. The live producer supplies survival as
`HasNEquidistantPointsAt 4 (D.A.erase q) center₁`, but supplies no theorem
identifying that center's radius with `P.rho`. The inequalities saying the
centers are distinct from `S.oppApex2` do not imply this distance equality.

The other four fields are likewise not exported, but this first field already
blocks the consumer and is the smallest concrete missing metric bridge.

## Independence witness

Scratch lines 67-99 give a checked incidence-layer model on `Fin 8`:

```text
K₁ = {0,1,3,4},  K₂ = {0,1,2,5},  BO = {0,1,6,7}
center₁ = 2, center₂ = 3, apex = 1, common = 0.
```

All three rows have cardinality four and contain the common point, while
`center₁ ∉ BO`; the five-cross conjunction is false. This is deliberately a
model of the exported incidence/card interface, not a claim of a full
Euclidean `CounterexampleData` model. It establishes the logical gap in the
available interface: a geometric theorem connecting endpoint survival to the
physical radius class is required before the five-cross target can be proved.

## Targeted elaboration and trust audit

The isolated command was run from the Lean package root (not a full build):

```text
cd lean
lake env lean ../scratch/rigid221-sourceheavy-anchor/\
  card13-five-cross-incidence-producer-attempt.lean
```

It succeeds. The file imports only
`Erdos9796Proof.P97.U5GlobalIncidenceQDeletedTetrahedron`; it does not import
`FrontierLiveClosure.Rigid221SourceHeavy`. The `#print axioms` output for
`Problem97.false_of_endpoint_parametric_five_cross` is:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx` in the elaborated terminal. This audits the isolated
terminal's transitive dependencies; it does not promote the open leaves or
claim that the card>=13 lane is closed.

## Verdict

The strongest reusable endpoint-parametric result found is a source-clean
five-cross **consumer**, not a producer. The smallest genuinely missing
theorem is a card>=13 endpoint-survival-to-physical-radius bridge proving at
least `center₁ ∈ BO` (and, for closure, the remaining four directed hits), or
an equivalent retained-third-center/third-bisector/fiber-card theorem that
feeds those incidences. The lane remains open.
