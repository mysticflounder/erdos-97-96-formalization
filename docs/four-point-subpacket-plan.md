<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Four-Point Subpacket Reduction Plan

This plan turns the incidence deduplication observation into proof-facing Lean
infrastructure.

Scope: the reduction is a normalization lemma inside the existing convex-shell
framework.  The incidence census does not independently encode convexity; it
assumes the cap/Moser/cyclic setup already produced from `ConvexIndep A`.  This
plan does not rule out non-convex families, and it does not prove the remaining
metric exclusion for the primitive Q rows.

## Goal

Replace case splits over full same-radius classes

```text
4 <= (SelectedClass A x r).card
```

by case splits over a chosen four-point subpacket

```text
T <= SelectedClass A x r
T.card = 4.
```

This is valid for obligations whose target is the nonexistence of a four-point
equal-radius witness.  It is not valid for arguments that need the full radius
class to be maximal or exactly classified.

## Relation To The N9 Endpoint

`FiniteN9Closure` refutes any finset `B` with

```text
B.card = 9
ConvexIndep B
HasNEquidistantProperty 4 B.
```

Therefore a general-`n` escape would be eliminated immediately if it can be
reduced to a nine-point subset `B` that still carries the full internal K4
property.  This is stronger than merely finding nine points that contain the
escape witness: arbitrary subsets of a K4 configuration need not remain K4
because deleted vertices may have supplied some of the four same-radius
witnesses.

The four-point subpacket lemmas address exactly one local part of that problem:
they preserve a chosen same-radius witness packet for one apex.  A full
N9-descent reduction would have to preserve or rebuild suitable four-point
witness packets for every point of the chosen nine-point set.  Until that
global witness-preservation step is proved, the sanctioned route remains the
adapted `N4d -> N4e -> N8` machinery for the `(m,4,4)` non-surplus caps, not a
direct replay of the closed n = 9 endpoint.

## Proof Steps

1. Prove a generic selected-class extraction lemma:

   ```text
   4 <= (SelectedClass A x r).card
   ->
   exists T, T <= SelectedClass A x r and T.card = 4.
   ```

2. Prove the preserving version:

   ```text
   P <= SelectedClass A x r
   P.card <= 4
   4 <= (SelectedClass A x r).card
   ->
   exists T,
     P <= T and
     T <= SelectedClass A x r and
     T.card = 4.
   ```

   This is the version needed when the proof must keep a surplus escape point,
   a Moser endpoint pair, or another already-selected witness.

3. Define primitive N8 counts on `T`:

   ```text
   mT = #(T inter MoserVertices)
   sT = #(T inter sameCapInterior.erase x)
   lT = #(T inter leftAdjacentInterior)
   rT = #(T inter rightAdjacentInterior)
   ```

4. Prove the packet cover equality:

   ```text
   mT + sT + lT + rT = 4.
   ```

   This reuses the existing cap-partition reasoning behind
   `FiniteEndpointShell.selected_le_groupSum`, but with equality because
   `T.card = 4`.

5. Prove packet-to-full monotonicity:

   ```text
   mT <= mFull
   sT <= sFull
   lT <= lFull
   rT <= rFull.
   ```

   Existing branch eliminators still apply because any primitive-heavy packet
   forces the corresponding full class to be heavy.

6. Reframe the surplus incidence census around primitive rows:

   ```text
   Moser primitive rows: 5 ordered, 3 reflected for n >= 10.
   N8 primitive rows: 31 ordered, 19 reflected for n >= 12.
   N8 same-hit primitive rows: 21 ordered, 12 reflected for n >= 11.
   ```

7. Apply the reduction to Q:

   In an `(m,4,4)` frame, preserve one surplus escape point and classify the
   resulting four-point packet.  The incidence target remains the two primitive
   rows:

   ```text
   Iown(2) + surplus I + other E
   Iown(2) + surplus I + other I
   ```

## Current Q-Facing Interface Target

For a non-surplus cap apex `x` in an `(m,4,4)` frame, the packet reducer needs
exactly these six full selected-class facts:

```text
1 <= leftAdjCount
1 <= rightAdjCount
moserCount <= 2
sameCapCount <= 1
leftAdjCount <= 1
rightAdjCount <= 1
```

Once these are available, Lean can feed
`N8SelectedApex.exists_left_right_primitive_packet_cases_of_counts` and reduce
the selected class to the two primitive packet rows `(1,1,1,1)` and
`(2,0,1,1)`.

The expected proof sources are:

```text
sameCapCount <= 1
  Structural in an `IsM44` short cap: its strict interior has cardinality 2,
  and erasing the apex leaves cardinality 1.

moserCount <= 2
  Geometric port of the existing N8 apex-frame lemma: a strict cap-interior
  apex cannot have all three Moser vertices at the same selected radius.  The
  consumer is now formalized from an N4e-style
  `NonSurplusMoserCapContainment` interface; proving that containment interface
  for the two short caps in the general-`n` setting remains open.

leftAdjCount <= 1, rightAdjCount <= 1
  Adjacent-cap one-hit bounds.  These are not incidence consequences; they
  require the monotonicity / ordered-chain geometry in the general-`n`
  `SurplusCapPacket` setting.

1 <= leftAdjCount, 1 <= rightAdjCount
  Lower bounds from the Q escape hypothesis plus the `(m,4,4)` cover/placement
  interface.  One side should be the surplus escape side; the other side must
  be forced explicitly rather than assumed.
```

This is the live checklist.  Any future lemma should be judged by whether it
proves one of these six facts, transports the selected-apex vocabulary needed
to state them, or excludes one of the two primitive packet rows.  A reformulation
that does not shrink this checklist is not proof progress.

Current progress against the checklist:

```text
selected-apex vocabulary over SurplusCapPacket.IsM44  CLOSED
sameCapCount <= 1                                    CLOSED
moserCount <= 2                                      CLOSED assuming
                                                     NonSurplusMoserCapContainment;
                                                     N4c/N4d assembly CLOSED;
                                                     form-level assembly CLOSED;
                                                     form trichotomy CLOSED;
                                                     placement split CLOSED;
                                                     no-strict-escape interface/wiring CLOSED;
                                                     endpoint-radius no-strict wrapper CLOSED;
                                                     endpoint-radius/no-strict equivalence CLOSED;
                                                     private reflection kernel CLOSED;
                                                     indexed cap-side reflection bridge CLOSED;
                                                     endpoint escape residual
                                                     predicates/eliminators CLOSED;
                                                     side-specific endpoint squeeze/
                                                     classification CLOSED;
                                                     non-surplus other-cap
                                                     reduction CLOSED;
                                                     residual assembly to
                                                     containment CLOSED;
                                                     endpoint-radius production OPEN;
                                                     form exclusions OPEN;
                                                     surplus COMP-G shadow
                                                     alignment CHECKED;
                                                     local surplus COMP-G
                                                     bank materialized CHECKED;
                                                     pinned surplus residual
                                                     payload extraction CLOSED;
                                                     payload-to-COMP-G shadow
                                                     constructor partial:
                                                     `hasTenMasks` and
                                                     `.v` pinnedClassOK CLOSED;
                                                     classesShapeOK mask
                                                     interface CLOSED;
                                                     component-to-valid
                                                     assembly CLOSED;
                                                     exact cap masks for both
                                                     orientations CLOSED;
                                                     own/opposite private masks
                                                     for both orientations
                                                     CLOSED;
                                                     finite no-seed consumer
                                                     CLOSED;
                                                     exact-cap no-seed
                                                     specialization CLOSED;
                                                     trigger interface narrowed
                                                     to generated fragment
                                                     centers CLOSED;
                                                     private seed mask
                                                     card/no-self reduction
                                                     CLOSED;
                                                     remaining geometric
                                                     side-condition package OPEN
leftAdjCount <= 1                                    OPEN
rightAdjCount <= 1                                   OPEN
1 <= leftAdjCount                                    OPEN
1 <= rightAdjCount                                   OPEN
primitive-row metric exclusion                       OPEN
```

Current spine refinement:

```text
IsM44NonSurplusContainmentErasureWitnesses
  NOW CLOSED as an adapter except for the explicit residual theorem below.

IsM44NonSurplusContainmentResidualErasureWitnesses
  NOW CLOSED as an adapter from the exact-pin residual below.  It keeps the
  upstream endpoint and pinned-surplus residual exclusions as explicit inputs,
  instead of asking bare `S.NonSurplusMoserCapContainment` to produce every
  survivor witness.  The statement chooses an erased point x in
  S.capInteriorByIndex S.surplusIdx and provides erased selected-class
  witnesses for the four residual survivor categories listed below.  The broad
  erasure-witness theorem separately handles the two non-surplus opposite Moser
  vertices by exact short-cap survival:

    IsM44.exists_oppIndex1_erase_witness_of_surplusInterior
    IsM44.exists_oppIndex2_erase_witness_of_surplusInterior

  The U2-style exact-distance payload is also now packaged locally:

    IsM44.exists_nonSurplus_exact_cap_classes_at_side_of_moserCapContainment

  It proves that the two non-surplus short caps are exact selected classes at
  the common Moser side length.  This is the `SurplusCapPacket` analogue of the
  rvol `U2FullDistanceClasses` data used by the U3 parent-removable route.

  The ambient survivor census is now available as a closed structural cover:

    mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
    mem_triangle_verts_oppositeVertexByIndex_cases
    index_eq_surplusIdx_or_oppIndex1_or_oppIndex2

  Any `A`-point is either one of the three Moser vertices or lies in the strict
  interior of one indexed cap.  Together with the two exact non-surplus
  opposite-Moser cases in the broad erasure-witness adapter, this reduces the
  active residual theorem to exactly these categories:

    - the surplus-opposite Moser vertex;
    - surplus-cap strict interior survivors other than the erased point;
    - first non-surplus strict interior survivors;
    - second non-surplus strict interior survivors.

  This makes the remaining obstruction more precise:
  `NonSurplusMoserCapContainment` is enough to preserve the two non-surplus
  Moser-centered cap witnesses after deleting a surplus-interior point, while
  the residual leaf still has the endpoint and pinned exclusions available to
  produce witnesses for arbitrary surviving cap-interior centers and for the
  surplus-opposite Moser vertex.

IsM44NonSurplusContainmentExactPinResidualsExcluded
  NOW CLOSED as an adapter from the erased-pin triple residual below.  The
  generic selected-class erasure lemmas

    selectedClass_erase_witness_or_exact_erased_pin
    selectedClass_erase_witness_of_no_exact_erased_pin

  prove that if a global K4 witness at a survivor p does not survive erasing x,
  then p has an exact four-point selected class in A pinned through x.

IsM44NonSurplusContainmentErasedPinTripleResidualsExcluded
  OPEN.  This is now the active containment residual on the mined
  `RemovableVertexOfLarge` spine.  `WitnessPacketInterface` defines
  `ErasedPinTriple A x p` and proves

    erasedPinTriple_of_exact_erased_pin
    exact_erased_pin_of_erasedPinTriple

  which converts an exact four-point selected class through the erased point
  into the U5-style triple-circle normal form, and back again when the erased
  point is known to belong to `A`:

    0 < dist p x
    (((A.erase x).erase p).filter (fun y => dist p y = dist p x)).card = 3

  Thus the active residual no longer has to quantify over selected radii at all.
  It has to choose a surplus-interior eraser x and exclude these three-point
  residual circles for the surplus-opposite Moser vertex and the three strict
  cap-interior survivor families.

  Current reduction state: the two opposite non-surplus cap families can be
  fed into the local four-subpacket arithmetic.  With ordered-chain one-hit
  upper bounds and the erased surplus point's forced adjacent-side placement,
  the count split gives either a primitive packet row or a single one-sided
  obstruction row.  The obstruction rows are now also named payloads:

    right_one_sided_obstruction_payload
    left_one_sided_obstruction_payload
    IsM44.oppIndex1_surplusErasedPinTriple_payload_cases
    IsM44.oppIndex2_surplusErasedPinTriple_payload_cases
    IsM44.oppIndex1_surplusErasedPinTriple_payload_cases_chains
    IsM44.oppIndex2_surplusErasedPinTriple_payload_cases_chains
    IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases_chains
    IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases_chains
    AdjacentChainOneHitData
    IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases_chainData
    IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases_chainData

  These identify the entire selected four-class as two Moser vertices, one
  same-cap interior point, and exactly one adjacent-side point, with the other
  adjacent side empty.  The next proof work is therefore geometric: exclude
  those one-sided payloads, or route them into the endpoint/pinned residual
  exclusions already available to this spine leaf.

  Current COMP-G seeded-shadow status:

    - the finite one-sided seeded census is materialized in
      `SurplusSeededShadow` and closed by
      `false_of_isValidOneSidedSeedShadow_of_mem_seed`;
    - `SurplusCOMPGBankGeometry` now has a generic point-class contradiction
      consumer,
      `false_of_oneSidedSeedShadow_pointClasses_of_mask_interfaces`;
    - the exact-cap specialization
      `false_of_oneSidedSeedShadow_pointClasses_of_exact_cap_interfaces`
      removes the finite obligations attached to the fixed `.v` and `.w`
      exact caps;
    - the trigger-specialized consumer
      `false_of_oneSidedSeedShadow_pointClasses_of_exact_cap_trigger_interfaces`
      only asks for trigger facts at `.u`, `.Q1`, `.Q2`, previous surplus-star
      labels, and the final surplus-star bound;
    - the seed-facing consumer
      `false_of_oneSidedSeedShadow_pointClasses_of_seed_interfaces`
      also discharges finite card/no-self obligations for the private seed
      center from `seed ∈ oneSidedSeeds`;
    - the seed/circumcenter consumer
      `false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces`
      also discharges the private seed center's no-three-Moser-labels fact
      from the same finite seed table;
    - the first branch-facing package theorem
      `false_of_rightOwnPwErasedPayload_pointClasses_of_seed_interfaces`
      now turns a right-oriented own-`Pw` erased payload plus the shared
      seeded-shadow side-condition interface into the finite no-seed
      contradiction;
    - the right-oriented own-`Pu` package
      `false_of_rightOwnPuErasedPayload_pointClasses_of_seed_interfaces`
      closes the mirror private-center endpoint case with the same
      side-condition interface;
    - the right-oriented opposite-Moser packages
      `false_of_rightOppositePwErasedPayload_pointClasses_of_seed_interfaces`
      and
      `false_of_rightOppositePuErasedPayload_pointClasses_of_seed_interfaces`
      close the two right-oriented private-center opposite cases by splitting
      through the existing finite `oppositeU`/`oppositeW` mask adapters;
    - the left-oriented own-endpoint packages
      `false_of_leftOwnPwErasedPayload_pointClasses_of_seed_interfaces`
      and
      `false_of_leftOwnPuErasedPayload_pointClasses_of_seed_interfaces`
      close the mirror endpoint cases using the left exact-cap adapters;
    - the left-oriented opposite-Moser packages
      `false_of_leftOppositePwErasedPayload_pointClasses_of_seed_interfaces`
      and
      `false_of_leftOppositePuErasedPayload_pointClasses_of_seed_interfaces`
      close the final package cases by splitting through the existing finite
      `oppositeU`/`oppositeW` mask adapters;
    - right and left orientations both have exact-cap adapters for the two
      non-surplus caps;
    - right and left orientations both have payload-to-private-mask adapters
      for own endpoint and opposite endpoint one-sided payloads.

  The remaining bridge is not another finite enumeration.  It is the
  geometric side-condition package needed to instantiate the generic consumer
  for the actual ten point classes:

    - for the pinned generated DFS path, the per-center local Boolean package
      is now reduced to generated candidate-mask membership:
      `isValidPinnedFragment_shadowOfPointClasses_of_candidate_masks` consumes
      `pointMask pointOf (centerClass center) ∈ candidateMasks sstar center`
      for every center;
    - the exact-mask variants
      `isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_candidates` and
      `isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_seed_candidates`
      discharge the `.v`, `.w`, and listed seed-private candidate cases before
      entering that generic candidate interface;
    - the right/left pinned residual payloads now produce their own `.v/.w`
      candidate-membership facts through
      `pinnedRightSurplusResidual_exists_candidateMasks_vw` and
      `pinnedLeftSurplusResidual_exists_candidateMasks_vw`, using the pinned
      selected-class equality for `.v` and the exact non-surplus cap for `.w`;
    - the right/left pinned residual payloads now also produce a generated valid
      pinned fragment under exactly the remaining non-exact candidate/global
      interface, via
      `pinnedRightSurplusResidual_exists_validFragment_of_candidate_interfaces`
      and
      `pinnedLeftSurplusResidual_exists_validFragment_of_candidate_interfaces`;
      this interface now asks for the generated Boolean
      `noThreeOK (shadowOfPointClasses pointOf centerClass) = true`, not the
      stronger all-label `pointPairClassCount <= 2` proposition;
    - `.v` candidate membership is closed from the pinned selected-class mask;
      `.w` candidate membership is closed when the second opposite exact-cap
      mask is supplied; and a listed one-sided seed's private center is closed
      from its finite private mask;
    - the remaining pinned obligations are candidate-mask membership facts for
      the actual centers not covered by those exact masks, plus Boolean
      no-three, prefix pair-count, and separation/search-separation facts for
      the induced shadow;
    - the seeded one-sided adapter still uses the exact-cap/private-mask
      interface, so its local shape/no-self/one-hit/trigger facts remain the
      explicit interface unless the seeded candidate-membership analogue is
      added separately.

  Once those facts are supplied for a branch, the exact-cap and private-mask
  adapters feed directly into the generic finite no-seed consumer.
```

RVOL comparison:

```text
The sibling `../p97-rvol` spine does not prove a direct
containment-to-removable theorem.  Its `removable_of_isM44` route assembles U2
full-distance-class squeeze data with U3 parent-removability.  In particular,
the rvol branch preserves more structured information than bare
`NonSurplusMoserCapContainment`.

The local check against `U5ModeADeletion` / `U3ToU5DangerousTriple` confirms
that those files are statement and work-package scaffolding for this residual
shape, not an importable closer for
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`.  The
useful reusable payload is the data shape: triple-circle residuals should be
fed back into exact selected-class interfaces by
`exact_erased_pin_of_erasedPinTriple`, then into the selector/certificate
machinery that already handles finite incidence shadows.

Consequently the current local residual should be attacked in one of two ways:

1. port/mirror the needed U2/U3 survivor-witness machinery into the current
   `SurplusCapPacket` vocabulary; or
2. keep endpoint/pinned residual exclusions available as inputs to the
   erasure-witness production theorem instead of discarding them after deriving
   `NonSurplusMoserCapContainment`.  DONE for the interface wiring:
   `IsM44NonSurplusContainmentRemovableStatement`,
   `IsM44NonSurplusContainmentErasureWitnessesStatement`, and
   `IsM44NonSurplusContainmentResidualErasureWitnessesStatement` all consume
   the two endpoint exclusions and the two pinned-surplus exclusions.

The new residual split records that issue on the proof spine without reopening
the two already-closed exact-cap survivor cases.

Proposition E / n = 10 base-case note:

  `../p97-rvol` has a kernel-clean card-10 contradiction

    propositionE_n10 :
      ∀ D : CounterexampleData, D.A.card = 10 →
        D.IsM44 → U2Statement D → False

  and uses it to close the `D.A.card = 10` branch of
  `u3ParentRemovable_holds`.  The remaining RVOL leaf is the genuinely larger
  `10 < D.A.card` branch (`u3ParentRemovable_card11plus`).  Porting
  `propositionE_n10` into this repo is useful as a base-case branch if the
  local IsM44 route is split into `A.card = 10` and `10 < A.card`, but it will
  not close the current general-n residual by itself.

  Do not add `../p97-rvol` as a Lake dependency here: `p97-rvol` imports this
  repo, so a direct dependency would create a cycle.  The sane route is to copy
  or port the minimal RVOL `CounterexampleData`/`U2Statement`/Proposition-E
  surface, or write a local adapter from `SurplusCapPacket` data into that
  surface and then copy the verified core.
```

## Endpoint Escape Route

Endpoint escape is a narrower residual than Q.  It is the strict adjacent-cap
escape subcase left after the private two-circle reflection branch has been
removed: the shared hit in the neighboring cap collapses to the shared Moser
endpoint, but that endpoint is not on the original selected radius, so the
reflection kernel has no second point on the first circle.

The sibling `../p97-rvol` target is
`U2NonSurplusSqueeze.oppCap2_endpointEscape_false`.  In current
`SurplusCapPacket` vocabulary, the route should be split into these proof-facing
targets:

```text
EndpointEscapeRightAt / EndpointEscapeLeftAt
  Side-specific residual predicates for a strict adjacent escape at an indexed
  short cap.  Data should include:
    - first K4 radius r around S.oppositeVertexByIndex i;
    - escape point x in the strict/private adjacent side;
    - second K4 radius rho around the opposite vertex of that adjacent cap;
    - x and the shared endpoint both on the second rho-circle;
    - the shared endpoint off the first r-circle.

  Status: CLOSED in `SurplusM44Packet` as
  `EndpointEscapeRightAt` and `EndpointEscapeLeftAt`.

endpointEscapeData_elim
  For side-specific endpoint-structured data, it is enough to refute the
  endpoint residual.  If the shared endpoint is also on the first radius, the
  side-specific reflection lemmas kill the branch immediately:

  ```text
  rightEndpointOnFirstRadius_false
  leftEndpointOnFirstRadius_false
  rightEndpointEscapeData_elim
  leftEndpointEscapeData_elim
  ```

  Status: CLOSED.

strictAdjacentEscapeAt_reduces_to_endpointEscapeData
  For a raw strict adjacent escape, we still need the upstream orientation and
  squeeze/placement theorem that supplies the second radius and puts the escape
  point on that side-adjacent K4 circle.  Once the side-adjacent cap is known to
  be a four-point cap and the second selected class has card at least four, the
  selected-cap hit is now classified: a private hit is killed by reflection, and
  a shared-endpoint hit is handed to the endpoint residual eliminator.

  Current Lean progress: the cyclic adjacent-index dictionary, the first
  squeeze bridge, and the side-specific unique-hit/reflection classification are
  CLOSED:

  ```text
  leftAdjacentCapByIndex_rightAdjacentIndex
  rightAdjacentCapByIndex_leftAdjacentIndex
  leftStrictEscape_mem_secondSelectedClass
  rightStrictEscape_mem_secondSelectedClass
  rightPrivateSecondHit_reflection_false
  leftPrivateSecondHit_reflection_false
  rightSecondSelectedClass_selectedCap_singleton
  leftSecondSelectedClass_selectedCap_singleton
  rightStrictEscape_endpointData_elim
  leftStrictEscape_endpointData_elim
  ```

  These prove the side-specific conditional reducer: if the escape side is an
  adjacent four-point cap and the second K4 radius/card hypothesis is supplied,
  then the branch reduces to the relevant
  `EndpointEscapeRightAt`/`EndpointEscapeLeftAt` residual.  For an `(m,4,4)`
  packet, this is the "other non-surplus cap" side at each non-surplus index.
  The surplus side remains part of the pinned-family residual.

  The `IsM44` non-surplus instantiation is also CLOSED for the other-cap side:

  ```text
  leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2
  rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1
  IsM44.leftStrictEscape_oppIndex1_endpointData_elim
  IsM44.rightStrictEscape_oppIndex2_endpointData_elim
  IsM44.strictAdjacentEscapeAt_oppIndex1_reduces_to_right_surplus
  IsM44.strictAdjacentEscapeAt_oppIndex2_reduces_to_left_surplus
  ```

  These show that, after the endpoint residual is excluded, a raw strict escape
  at `oppIndex1` or `oppIndex2` can only remain on the surplus-adjacent side.
  Thus the endpoint route now reduces the non-surplus other-cap escape to the
  pinned surplus-family residual plus the endpoint certificate.

  Status: OTHER-CAP NON-SURPLUS REDUCTION CLOSED; endpoint residual OPEN;
  surplus-side pinned-family residual OPEN.

The endpoint/surplus split is now assembled into the Q-facing containment
interface:

```text
IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals
IsM44.nonSurplusMoserCapContainment_of_endpoint_surplus_residuals
```

Thus `NonSurplusMoserCapContainment` no longer needs a monolithic no-strict
adjacent-escape theorem.  It follows from exactly four residual exclusions:
endpoint-left at `oppIndex1`, endpoint-right at `oppIndex2`, the right
surplus-adjacent side at `oppIndex1`, and the left surplus-adjacent side at
`oppIndex2`.

endpointEscapeAt_false
  The endpoint residual itself is impossible.
```

The finite-pattern algebraic certificate data is now in this repo under
`certificates/endpoint/`.  The intended certificate target is the rvol
endpoint-tier result: the residual's combinatorial shadow has 117 endpoint
patterns, and the exact metric follow-up kills all of them.  The chosen proof
vehicle is a committed endpoint certificate set with one uniform
Lean-checkable shape:

```text
sum_i coeff_i * generator_i = 1
```

The certificate set has two kinds:

```text
base_empty
  Direct Nullstellensatz certificates for the two endpoint patterns whose base
  metric systems are already C-empty.

forced_collapse
  Rabinowitsch-augmented Nullstellensatz certificates for the remaining 115
  endpoint patterns.  The checked-in certificates use the globally forced pair
  s1 = s3: add `t * dist2(s1, s3) - 1` to the base generators and certify that
  the augmented ideal contains 1.  This proves there is no base solution with
  s1 != s3, so every base solution collapses the named distinct points and the
  endpoint pattern is invalid.
```

The implementation route is:

```text
1. Vendor or regenerate the 117 endpoint pattern systems from the rvol endpoint
   fragment artifact.  DONE: `certificates/endpoint/*.json` contains 117 rows.
2. Use Singular over characteristic 0 to emit exact coefficient witnesses for
   the two direct empty systems and the 115 Rabinowitsch-augmented systems.
   DONE: `scripts/endpoint-certificate.py` extracts `lift(I, std(I))`.
3. Add a small exact rational-polynomial checker that verifies the identity
   data independently of Singular's transcript.  DONE for the Python checker:
   `UV_CACHE_DIR=/private/tmp/uv-cache-endpoint uv run python
   scripts/endpoint-certificate.py --check certificates/endpoint --quiet`
   checked all 117 certificate files.
4. Port that checker to Lean, or emit Lean data against the same checker, so the
   endpoint residual can be closed by checked polynomial identities rather than
   a trusted external solver result.
5. Prove the faithfulness bridge from the formal `EndpointEscapeLeftAt` /
   `EndpointEscapeRightAt` residuals to one of the 117 certified endpoint
   patterns.
```

Lean vertical-slice status:

```text
Endpoint certificate Lean vertical slice
  DONE.  `Erdos9796Proof.P97.EndpointCertificate.Checker` defines the pure
  sparse rational-polynomial checker, and
  `Erdos9796Proof.P97.EndpointCertificate.EpQ2000` emits the small base-empty
  certificate `ep_Q2_000` as Lean data.

  Verification:

  - `lake-build Erdos9796Proof.P97.EndpointCertificate.EpQ2000` succeeds;
  - `#print axioms Problem97.EndpointCertificate.ep_Q2_000_valid` reports
    `[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler,
    Quot.sound]`;
  - the endpoint-certificate Lean directory has no actual `unsafe`, `extern`,
    or `implemented_by` declarations; the only hits are audit prose;
  - no endpoint-residual theorem is claimed closed until the 117-pattern
    faithfulness bridge is proved.

  Active scaling step:

  - DONE: the certificate emitter can generate one Lean module per checked JSON
    certificate under `EndpointCertificate.Patterns`;
  - DONE: it also generates an aggregate module that imports every pattern module
    and records a list of the 117 `checkCertificate ... = true` facts;
  - DONE: a representative small row builds:
    `lake-build Erdos9796Proof.P97.EndpointCertificate.Patterns.EpQ2000`;
  - OPEN: the largest row `EpQ1008` does not finish within the practical
    generated-file budget as one monolithic `native_decide` theorem.  After a
    checker fast-path optimization, it was still manually stopped after several
    minutes with no result.  The next implementation step is therefore internal
    certificate sharding for large rows:

      1. emit per-generator product checks
         `mulPoly coefficient_i generator_i = product_i`;
      2. emit a final small sum check
         `sum_i product_i = 1`;
      3. split the product checks across per-row shard modules for large
         certificates, then import those shards from the row coordinator.

    The checker now exposes `checkProductSum` for step 2, so the remaining
    implementation work is in the emitter: generate per-product data/theorems
    and row coordinators for certificates above the one-module budget.

  - only after the 117 Lean certificate facts build should the work move to the
    formal faithfulness bridge from endpoint residuals to certified patterns.
```

`docs/escape-census-bugcheck.md` is relevant hygiene for this step.  It verifies
that the closed-form incidence counts used in the tables are correct, but it
also found a latent under-enumeration bug in `n8_tuples_for_labeled_vector` for
surplus `p >= 3`.  That script bug is now fixed by using all distinct labeled
permutations rather than cyclic rotations.  Endpoint-pattern work must depend on
explicit pattern/certificate data or the closed-form/corrected enumeration, not
on the old cyclic tuple enumerator.

This endpoint route does not address the pinned surplus-family residual.  The
two residuals should stay separate in both docs and Lean names:

```text
endpoint escape         -> 117-pattern endpoint certificate route
pinned surplus-family   -> separate residual, not closed by endpoint work
```

## Pinned Surplus COMP-G Reduction Diagnostic

Status on 2026-07-05: `scripts/surplus-compg-shadow.py` now checks the exact
alignment between the rvol pinned surplus-shadow enumeration and the banked
COMP-G algebraic verdicts, and emits a local versioned pattern bank at
`certificates/surplus/pinned_surplus_comp_g_bank.json`.

Reproduction:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint uv run python \
  scripts/surplus-compg-shadow.py \
    --emit-bank certificates/surplus/pinned_surplus_comp_g_bank.json

UV_CACHE_DIR=/private/tmp/uv-cache-endpoint uv run python \
  scripts/surplus-compg-shadow.py \
    --check-bank certificates/surplus/pinned_surplus_comp_g_bank.json
```

Observed output:

```text
Pinned surplus COMP-G shadow check: PASS
model rows: 135 {'s1': 41, 's2': 71, 's3': 23}
pinned class: every row has K_v = {Pu, Pw, u, s*}
COMP-G final verdicts: {'C_EMPTY': 2, 'NO_VALID_REAL': 133}
final forced pairs: {'u=s1': 6, 'u=v': 127}
pairscan forced pairs: {'u=s1': 6, 'u=v': 129}
Singular flips: {False: 135}
C-empty rows: s1_000, s1_001
u=s1 forced-collapse rows: s2_030, s2_043, s2_044, s2_053, s2_061, s2_062
emitted/checked bank: certificates/surplus/pinned_surplus_comp_g_bank.json
```

This establishes a useful target, not a finished Lean theorem:

```text
rvol pinned surplus shadow     CHECKED: 135 rows, ids stable
K_v = {Pu, Pw, u, s*}          CHECKED in every row
COMP-G verdict coverage        CHECKED: 2 C-empty + 133 no-distinct-real
Singular revalidation          CHECKED: 0 flips
local JSON bank                CHECKED: schema
                                `pinned_surplus_comp_g_bank.v2`, source
                                hashes, all ten classes per row, canonical
                                bitset shadow signature
Lean finite shadow bank        CHECKED: generated module
                                `Erdos9796Proof.P97.SurplusCOMPGBank`
local residual -> pinned class CHECKED in Lean
local residual -> pinned payload
  with separator facts        CHECKED in Lean by
                                `PinnedRightSurplusResidualAt`,
                                `PinnedLeftSurplusResidualAt`,
                                `IsM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus`,
                                `IsM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus`,
                                `IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_pinnedSurplusResiduals`,
                                and
                                `IsM44.nonSurplusMoserCapContainment_of_endpoint_pinnedSurplusResiduals`
finite ten-label dictionary   CHECKED in Lean by
                                `capInteriorByIndex_not_mem_capByIndex_of_ne`,
                                `capInteriorByIndex_ne_of_mem_of_mem_ne`,
                                `capInteriorByIndex_not_mem_triangle_verts`,
                                `capInteriorByIndex_ne_oppositeVertexByIndex_of_mem`,
                                `oppositeVertexByIndex_ne_of_ne`,
                                `surplusIdx_ne_oppIndex1`,
                                `surplusIdx_ne_oppIndex2`,
                                `oppIndex1_ne_oppIndex2`, and
                                `pinnedSurplusTenLabels_pairwise_of_mem`
pinned fragment enumeration
  -> 135-row bank              CHECKED in Lean by
                                `shadowInBank_of_fragmentShadowInEnumeration`
pinned fragment search
  -> 135-row bank              CHECKED by the generated finite-search
                                certificate:
                                `candidate_masks_match_filter`,
                                `raw_fragment_search_entries_length`,
                                `raw_fragment_search_entries_all_valid`,
                                `raw_fragment_search_shadow_keys_unique`,
                                `fragment_search_entries_eq_validFragmentEntries`,
                                and
                                `shadowInBank_of_fragmentShadowAcceptedBySearch`
geometric residual
  -> pinned fragment row       OPEN
```

Consequently, if the current two surplus-adjacent residual hypotheses in
`IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals` can be
relabelled and strengthened to the rvol pinned family, no new surplus algebra is
needed.  The remaining work is the faithfulness bridge:

```text
hsurplus1 / hsurplus2 local side residual
  -> choose the rvol orientation
  -> identify v = selected non-surplus apex,
              u = surplus apex,
              w = opposite non-surplus apex,
              Pu/Pw = the two private interiors of the selected non-surplus cap,
              s* = the surplus-side escape point
  -> prove the selected class is exactly {u, Pu, Pw, s*}
     (the `K_v` pin, using the IsM44 squeeze and endpoint/other-side exclusions)
     DONE as an exact selected-class equality by:
       `IsM44.oppIndex1_pin_of_right_surplus`
       `IsM44.oppIndex2_pin_of_left_surplus`
       `pinnedRightSurplusResidual_selectedClass_eq`
       `pinnedLeftSurplusResidual_selectedClass_eq`
  -> normalize the labelled pinned class to the generated bank's expected
     `.v` mask
     DONE by:
       `IsM44.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx`
       `IsM44.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2`
       `IsM44.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx`
       `IsM44.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1`
       `IsM44.pinnedRightSurplusResidual_selectedClass_eq_surplusApex`
       `IsM44.pinnedLeftSurplusResidual_selectedClass_eq_surplusApex`
       `SurplusCOMPGBank.pinnedMaskOf_eq_expectedPinnedMask_of_isSurplusStar`
       `SurplusCOMPGBank.pinnedClassOK_of_centerMask_eq_pinnedMaskOf`
  -> recover the chord-separated private pair data
     (`hU1w` and `hU1u`, matching the rvol `sep_false` leaf)
     DONE in generic indexed form by:
       `capInterior_pair_dist_ne_rightOuter_of_selectedClass`
       `capInterior_pair_dist_ne_leftOuter_of_selectedClass`
  -> choose a three-point surplus-interior subpacket containing the actual
     surplus-side escape point, so the general-`m` surplus cap can be labelled by
     the finite-bank symbols `s1,s2,s3` without assuming `m = 5`
     DONE by:
       `IsM44.surplusInterior_card_ge_three`
       `IsM44.exists_surplusInterior_triple_preserving`
       `mem_surplusInterior_of_oppIndex1_right_surplus`
       `mem_surplusInterior_of_oppIndex2_left_surplus`
       `IsM44.exists_surplusInterior_triple_of_oppIndex1_right_surplus`
       `IsM44.exists_surplusInterior_triple_of_oppIndex2_left_surplus`
       `IsM44.oppIndex1_pinnedRightResidual_and_surplusTriple_of_right_surplus`
       `IsM44.oppIndex2_pinnedLeftResidual_and_surplusTriple_of_left_surplus`
  -> prove the ten finite-bank labels are geometrically distinct:
       the three Moser vertices, the selected surplus triple, and the two
       private pairs in the two non-surplus caps
     DONE generically by:
       `capInteriorByIndex_not_mem_capByIndex_of_ne`
       `capInteriorByIndex_ne_of_mem_of_mem_ne`
       `capInteriorByIndex_not_mem_triangle_verts`
       `capInteriorByIndex_ne_oppositeVertexByIndex_of_mem`
       `oppositeVertexByIndex_ne_of_ne`
       `surplusIdx_ne_oppIndex1`
       `surplusIdx_ne_oppIndex2`
       `oppIndex1_ne_oppIndex2`
       `pinnedSurplusTenLabels_pairwise_of_mem`
  -> prove the resulting ten-class shadow lies in the checked fragment
     enumeration
  -> use the COMP-G forced-collapse/C-empty certificate for that row.
```

Lean bridge progress:

```text
IsM44.oppIndex1_pin_of_right_surplus
  Under `IsM44`, global `K4`, convexity, endpoint-left exclusion, and a
  right-surplus residual point at `oppIndex1`, the selected class has card 4,
  contains the selected cap's two strict interiors, has the other-adjacent
  singleton equal to the shared endpoint, and has the surplus-side singleton
  equal to the residual point.

IsM44.oppIndex2_pin_of_left_surplus
  The reflected statement for `oppIndex2`: endpoint-right exclusion plus a
  left-surplus residual point pins the selected class in the same way.

PinnedRightSurplusResidualAt / PinnedLeftSurplusResidualAt
  The proof-facing residual payloads for the two surplus-adjacent sides.  Each
  payload packages the selected short-cap private pair, the pinned four-class,
  the shared-endpoint and escape singleton intersections, and the two
  reflection-produced private-pair non-equidistance facts.

IsM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus
IsM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus
  The side-specific extraction lemmas from an actual surplus-side residual
  point to the corresponding pinned payload.

IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_pinnedSurplusResiduals
IsM44.nonSurplusMoserCapContainment_of_endpoint_pinnedSurplusResiduals
  The Q-facing assembly can now consume endpoint residual exclusions plus the
  two pinned-payload exclusions instead of the raw surplus-side impossibility
  hypotheses.

pinnedSurplusTenLabels_pairwise_of_mem
  Once the two non-surplus private pairs and the three-point surplus subpacket
  have been chosen, the ten labels used by the finite COMP-G bank are pairwise
  geometrically distinct.  The proof uses strict-interior privacy across
  indexed caps, the fact that strict interiors avoid all Moser vertices, and
  the indexed dictionary identifying the surplus cap and the two opposite
  non-surplus caps as distinct.

Verification:
  `lake-build Erdos9796Proof.P97.SurplusM44Packet`
```

Separator bridge progress:

```text
capInterior_pair_dist_ne_rightOuter_of_selectedClass
  If two distinct strict-interior points of the selected cap are both in the
  selected Moser-centered radius class, they cannot also be equidistant from
  the right outer Moser endpoint.  This is the indexed form of the rvol
  `hU1w` separator when the right outer endpoint is the other non-surplus apex.

capInterior_pair_dist_ne_leftOuter_of_selectedClass
  The reflected indexed form: the same private pair cannot also be equidistant
  from the left outer Moser endpoint.  This supplies the rvol `hU1u` separator
  when the left outer endpoint is the surplus apex.

Verification:
  `lake-build Erdos9796Proof.P97.SurplusM44Packet`
```

Local bank artifact:

```text
certificates/surplus/pinned_surplus_comp_g_bank.json
  schema: pinned_surplus_comp_g_bank.v2
  rows: 135
  source hashes: rvol fragment, COMP-G patterns, pairscan, Singular recheck,
                 COMP-G summary
  row data: all ten K4 classes plus final verdict/forced-pair metadata
  shadow signature: ten class bitsets over label order
                    u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2
  unique shadow count: 135
```

Lean finite shadow module:

```text
lean/Erdos9796Proof/P97/SurplusCOMPGBank.lean
  generated from the v2 JSON bank
  row masks: 135 ten-class shadows
  fragment vocabulary:
    `isValidPinnedFragment : Label -> Shadow -> Bool`
    `validFragmentEntries : List (Label × List Nat)`
    `validFragmentShadowKeys : List (List Nat)`
    `fragmentShadowInEnumeration : Shadow -> Bool`
    `fragmentShadowAcceptedBySearch : Shadow -> Bool`
  generated finite-search certificate:
    `candidateMasks` is checked against the normalized-mask filter by
      `candidate_masks_match_filter`
    `rawFragmentSearchEntries` is the emitted DFS census from the same finite
      rules; it is checked for length 135, row validity, unique shadow keys, and
      equality to `validFragmentEntries`
  checked facts:
    rows_length
    rows_all_have_ten_masks
    rows_all_pinned
    rows_shadow_keys_unique
    rows_all_valid_pinned_fragment
    valid_fragment_entries_length
    valid_fragment_entries_all_valid
    candidate_masks_match_filter
    Label.beq_eq_decide_eq
    maskNormalized_of_candidateMaskOK
    mem_allNormalizedMasks_of_maskNormalized
    candidateMasks_eq_filter_of_isSurplusStar
    mem_candidateMasks_of_candidateMaskOK
    candidateMaskOK_of_isValidPinnedFragment
    isSurplusStar_of_isValidPinnedFragment
    mem_candidateMasks_of_isValidPinnedFragment
    raw_fragment_search_entries_length
    raw_fragment_search_entries_all_valid
    raw_fragment_search_shadow_keys_unique
    fragment_search_entries_eq_validFragmentEntries
    fragment_search_shadow_keys_eq_validFragmentShadowKeys
    valid_fragment_shadow_keys_unique
    valid_fragment_shadow_keys_eq_rowShadowKeys
    valid_fragment_shadow_keys_all_in_bank
    fragment_search_shadow_keys_eq_rowShadowKeys
    fragment_search_shadow_keys_all_in_bank
    rows_c_empty_count
    rows_no_valid_real_count
    rows_forced_uv_count
    rows_forced_us1_count
    rows_s1_count
    rows_s2_count
    rows_s3_count
    pinnedMaskOf_eq_expectedPinnedMask_of_isSurplusStar
    pinnedClassOK_of_centerMask_eq_pinnedMaskOf
    fragmentShadowAcceptedBySearch_of_isValidPinnedFragment
  proof-facing predicate:
    `SurplusCOMPGBank.shadowInBank : Shadow -> Bool`
  proof-facing bank bridge:
    `SurplusCOMPGBank.shadowInBank_of_fragmentShadowInEnumeration`
    `SurplusCOMPGBank.shadowInBank_of_fragmentShadowAcceptedBySearch`
  spine consumer:
    `Problem97.pinnedSurplusCOMPGBankBridge` now consumes
    `isValidPinnedFragment sstar shadow = true`, not only an already accepted
    search key.
    `Problem97.RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank`
  axiom closure:
    `proof-blueprint axioms Problem97.pinnedSurplusCOMPGBankBridge`
    currently reports `propext`, `Lean.ofReduceBool`, and
    `Lean.trustCompiler`.  The generated decision procedure has no `unsafe`,
    `extern`, or `implemented_by` declarations in the generated module or
    emitter, but blueprint still treats `Lean.trustCompiler` as a custom
    unsanctioned axiom.  A future pure-kernel/sharded incidence certificate
    would be needed to remove that trust surface.
```

Verification:

```text
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint uv run python -m py_compile \
  scripts/surplus-compg-shadow.py

UV_CACHE_DIR=/private/tmp/uv-cache-endpoint uv run python \
  scripts/surplus-compg-shadow.py \
    --check-bank certificates/surplus/pinned_surplus_comp_g_bank.json

UV_CACHE_DIR=/private/tmp/uv-cache-endpoint uv run python \
  scripts/surplus-compg-shadow.py \
    --emit-lean-shadow lean/Erdos9796Proof/P97/SurplusCOMPGBank.lean \
    --check-bank certificates/surplus/pinned_surplus_comp_g_bank.json

lake-build Erdos9796Proof.P97.SurplusCOMPGBank
```

The remaining risk is now narrower: the local residual can be pinned to the
four-class shape, the finite target bank is local and Lean-checkable at the
incidence-mask level, and the finite fragment search certificate now rewrites
into bank membership in Lean.  The next exact Lean target is to construct a
`SurplusCOMPGBank.Shadow` from the pinned geometric residual and prove:

```text
SurplusCOMPGBank.fragmentShadowAcceptedBySearch shadow = true
```

Then `SurplusCOMPGBank.shadowInBank_of_fragmentShadowAcceptedBySearch` gives
`SurplusCOMPGBank.shadowInBank shadow = true`.  The open faithfulness bridge is
now exactly the combination of two facts:

```text
geometric residual -> a ten-mask shadow satisfying the pinned fragment rules
pinned fragment rules -> `fragmentShadowAcceptedBySearch = true`
```

The generated bank currently proves that every emitted row is valid and that the
emitted DFS search rows match the 135-row bank.  It does not yet expose a
generic completeness theorem of the form

```text
isValidPinnedFragment sstar shadow = true
  -> fragmentShadowAcceptedBySearch shadow = true
```

Current finite-completeness progress:

```text
candidate-table completeness CLOSED.
  From `isValidPinnedFragment sstar shadow = true`, Lean now proves
  `shadow.centerMask center ∈ candidateMasks sstar center` for every center.
  This is the first semantic input to the generated DFS completeness proof.

search-separation prefix completeness CLOSED.
  The generated bank now uses the same point-pair separation guard as the
  Python DFS and includes `searchSeparationOK` in `isValidPinnedFragment`.
  Lean proves:
    1. `searchSeparationOK_of_isValidPinnedFragment`;
    2. `crossSeparationOKForMasks_of_searchSeparationOK`;
    3. `assignedSeparationOK_of_isValidPinnedFragment`.

search-pair-count prefix interface CLOSED.
  The generated bank now also exposes the DFS count vector following a shadow:
  `shadowPairCountsForAssigned`.  `searchPairCountsOK` checks the exact fixed
  assigned-prefix vectors used by the generated DFS, and
  `pairCountsOK_shadowPairCountsForAssigned_of_isValidPinnedFragment` projects
  the guard for any listed prefix.  The recurrence
  `incrementPairCounts_eq_shadowPairCountsForAssigned_cons` rewrites one DFS
  increment into the corresponding shadow-prefix count vector.

fixed-order mask accumulation CLOSED.
  The generated bank now exposes `shadowMasksForAssigned`, the mask vector
  obtained by following a shadow's actual center masks through the same consed
  assignment order used by the DFS.  Lean proves the one-step rewrite
  `setCenterMask_eq_shadowMasksForAssigned_cons` and the terminal equality
  `shadowMasksForFullFragmentSearchAssigned_eq_of_hasTenMasks`.

literal accepted-key bridge CLOSED.
  The generated invariants now cover the three DFS state checks: candidate
  membership, separation, and pair-count/mask recurrence.
  `shadow_mem_fragmentSearchAux_of_isValidPinnedFragment` proves that the
  computed DFS can follow any valid shadow's own masks to a leaf, and the
  generated companion module `SurplusCOMPGBankDFS` proves the emitted literal
  key-list bridge:

    `fragmentShadowAcceptedBySearch_of_isValidPinnedFragment`.

  The certificate is sharded into three generated depth-2 modules, one per
  surplus star, rather than one large `native_decide` recomputation.
```

The next proof-facing target is now explicit:

```text
geometric pinned residual payload
  -> isValidPinnedFragment sstar shadow = true
```

This is the geometric payload-to-shadow faithfulness bridge.  After bank
acceptance, the rvol redundancy assessment
`../p97-rvol/docs/u-lane/97-u1-2-census-route-redundancy-assessment-2026-07-05.md`
still applies: the pure incidence bank is not an independent closure route for
the whole removable-vertex theorem.  Full closure still needs metric content
wired to the spine, either through Lean-checkable COMP-G
forced-collapse/C-empty certificates or an explicitly accepted
external-certificate boundary.

## Execution Status

- Started: `2026-07-05`.
- `2026-07-05`: generated `SurplusCOMPGBank` now includes the Boolean pinned
  fragment vocabulary, validates all 135 fragment entries against that
  vocabulary, proves `validFragmentShadowKeys = rowShadowKeys`, and exposes
  `shadowInBank_of_fragmentShadowInEnumeration`.
- `2026-07-05`: the same generated module now includes the finite-search
  certificate bridge.  The generator computes the DFS census from the local
  candidate/separation/no-three rules, verifies that the result is the same
  135 tagged rows as the bank before emission, and Lean checks the emitted
  certificate via `candidate_masks_match_filter`,
  `fragment_search_entries_eq_validFragmentEntries`, and
  `shadowInBank_of_fragmentShadowAcceptedBySearch`.
- `2026-07-05`: the finite bank bridge is now wired into the P97/P96 proof
  spines through `Problem97.pinnedSurplusCOMPGBankBridge` and the open residual
  `Problem97.RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank`.  After
  `proof-blueprint index --refresh` and `proof-blueprint refs --refresh`,
  `proof-blueprint spine Problem97.erdos97_rhs --max-depth 12` and the
  analogous P96 spine both show that residual, not an off-spine placeholder.
  This residual has since been split into the three branch obligations recorded
  below.
  - `2026-07-05`: `SurplusM44Packet` now extracts the pinned surplus residual
    payload on both non-surplus sides.  The new closed lemmas package the pinned
    selected four-class and the two private-pair non-equidistance facts, matching
    the rvol `surplusEscape_pinnedFamily_sep_false` boundary.  The remaining
    surplus COMP-G bridge is the payload-to-`SurplusCOMPGBank.Shadow`
    faithfulness theorem.
  - `2026-07-05`: the surplus-side escape can now be relabelled into a
    three-point surplus-interior subpacket in both orientations.  This closes the
    general-`m` to `s1,s2,s3` finite-label step for the actual escape point:
    `IsM44.exists_surplusInterior_triple_of_oppIndex1_right_surplus` and
    `IsM44.exists_surplusInterior_triple_of_oppIndex2_left_surplus`.
  - `2026-07-05`: the pinned residual payload now identifies the whole selected
    four-class in both orientations:
    `pinnedRightSurplusResidual_selectedClass_eq` and
    `pinnedLeftSurplusResidual_selectedClass_eq`.  These lemmas turn the
    containment/cardinality payload into the exact labelled class
    `{private point 1, private point 2, shared endpoint, surplus escape}` needed
    by the COMP-G shadow constructor.
  - `2026-07-05`: `SurplusCOMPGBank` now has the finite pinned-mask
    normalization helpers `pinnedMaskOf_eq_expectedPinnedMask_of_isSurplusStar`
    and `pinnedClassOK_of_centerMask_eq_pinnedMaskOf`.  This closes the purely
    finite part of the pinned `.v` class check once the geometric equality has
    been transported to labels.
  - `2026-07-05`: `SurplusM44Packet` now also transports the selected-class
    equality into the generated bank labels.  The four orientation equalities
    identify the selected non-surplus cap's shared endpoint with the surplus
    apex `u` and the opposite non-surplus apex with `w`; the corollaries
    `pinnedRightSurplusResidual_selectedClass_eq_surplusApex` and
    `pinnedLeftSurplusResidual_selectedClass_eq_surplusApex` give the pinned
    `.v` class as `{Pu, Pw, u, s*}` in bank notation.
    The two combined producers
    `IsM44.oppIndex1_pinnedRightResidual_and_surplusTriple_of_right_surplus`
    and
    `IsM44.oppIndex2_pinnedLeftResidual_and_surplusTriple_of_left_surplus`
    are now the preferred input shape for the next shadow-construction lemma.
  - `2026-07-05`: `SurplusM44Packet` now closes the finite ten-label
    distinctness dictionary needed by the pinned surplus COMP-G shadow.  The
    key theorem is `pinnedSurplusTenLabels_pairwise_of_mem`, supported by
    indexed strict-interior privacy, strict-interior/Moser separation, Moser
    endpoint distinctness, and the surplus/opposite-index dictionary.  The
    remaining pinned bridge is still the construction of the ten center masks
    and the proof that the resulting shadow is accepted by the generated
    135-row fragment search.
  - `2026-07-05`: finite completeness for the generated DFS is now started in
    `SurplusCOMPGBank`.  The generated module proves candidate-table
    completeness:
    `candidateMaskOK_of_isValidPinnedFragment` and
    `mem_candidateMasks_of_isValidPinnedFragment` show that a valid pinned
    fragment's actual center mask is present in the generated candidate list
    for every center.
  - `2026-07-06`: `SurplusCOMPGBankGeometry` now proves the converse direction
    needed by the geometry bridge:
    `candidateMaskOK_of_mem_candidateMasks` turns generated candidate-table
    membership into the local predicate, and
    `isValidPinnedFragment_shadowOfPointClasses_of_candidate_masks` assembles
    an induced geometric shadow into `isValidPinnedFragment` from candidate
    membership plus the remaining Boolean no-three, prefix-count, and
    separation/search-separation facts.  The `.v` candidate membership is also
    reduced to the existing pinned-mask equality by
    `pinnedMaskOf_mem_candidateMasks_v` and
    `mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf`.
  - `2026-07-06`: the exact-mask candidate-membership bridge now also covers
    the generated `.w` class and the one-sided seed private center.  The lemmas
    `secondOppExactCapMask_mem_candidateMasks_w` and
    `mem_candidateMasks_w_of_pointMask_eq_secondOppExactCapMask` close `.w`
    from the second-opposite exact-cap mask.  The lemmas
    `isSurplusStar_oneSidedSeed_sstar_of_mem`,
    `oneSidedSeed_privateMask_mem_candidateMasks`, and
    `mem_candidateMasks_privateCenter_of_pointMask_eq_oneSidedSeed` close the
    seed private center from `seed ∈ oneSidedSeeds` and the geometric
    private-mask equality.
  - `2026-07-06`: the candidate-mask assembler now has exact-mask variants.
    `isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_candidates` removes
    `.v` and `.w` from the remaining candidate-membership hypotheses, and
    `isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_seed_candidates`
    also removes the listed one-sided seed private center.  The live geometric
    bridge can now focus candidate-membership work on centers not covered by
    the pinned, exact-cap, or seed-private mask equalities.
  - `2026-07-06`: the actual right/left pinned residual payloads now expose
    `.v/.w` candidate-membership producers:
    `pinnedRightSurplusResidual_exists_candidateMasks_vw` and
    `pinnedLeftSurplusResidual_exists_candidateMasks_vw`.  These combine the
    residual's pinned `.v` mask with the appropriate exact non-surplus `.w`
    cap after orientation relabelling, so the branch-level bridge does not need
    to rediscover those two candidate cases.
  - `2026-07-06`: the right/left pinned residual payloads now have
    payload-to-valid-fragment implications:
    `pinnedRightSurplusResidual_exists_validFragment_of_candidate_interfaces`
    and
    `pinnedLeftSurplusResidual_exists_validFragment_of_candidate_interfaces`.
    Each theorem chooses the bank surplus label and private pair from the
    actual residual, discharges the `.v/.w` exact-mask candidate cases
    internally, and leaves only non-exact candidate membership plus the global
    no-three, prefix-count, separation, and search-separation checks.
  - `2026-07-06`: the pinned candidate-mask/valid-fragment interface was
    weakened from the all-label proposition
    `∀ a b, pointPairClassCount ... a b <= 2` to the exact generated Boolean
    `noThreeOK ... = true`.  This matches the finite bank predicate and avoids
    carrying diagonal or ordered-pair count obligations that the generated DFS
    does not consume.
  - `2026-07-06`: deriving `noThreeOK` directly from the full prefix
    `pairCountsOK (shadowPairCountsForAssigned ... fullFragmentSearchAssigned)`
    is not a one-step simplification: the DFS count vector and
    `pointPairClassCount` compute the same non-diagonal counts in different
    center orders.  The next proof-facing route is a count-vector alignment
    lemma, or a finite candidate-constrained lemma, rather than an expanded
    symbolic `simp` proof over all 45 pair-count entries.
  - `2026-07-05`: the generated DFS finite-completeness bridge now closes the
    search-separation prefix invariant.  `searchSeparationOK` is part of
    `isValidPinnedFragment`, `crossSeparationOKForMasks` matches the Python DFS
    point-pair guard, and `assignedSeparationOK_of_isValidPinnedFragment`
    proves the recursive separation check for any assigned prefix whose masks
    agree with the valid shadow.  At this checkpoint the pair-count/no-three
    and final mask-accumulation invariants were still open; later entries below
    close both.
  - `2026-07-05`: the generated DFS bridge now also has a checked pair-count
    prefix interface.  `searchPairCountsOK` is part of
    `isValidPinnedFragment`, `shadowPairCountsForAssigned` follows the actual
    recursive count vector, and the generated lemmas project `pairCountsOK` for
    every fixed DFS prefix and rewrite one increment step into the next shadow
    count vector.  At this checkpoint the fixed-order mask accumulation theorem
    and final accepted-key bridge were still open; later entries below close
    mask accumulation and computed DFS acceptance.
  - `2026-07-05`: fixed-order mask accumulation is now kernel-checked.
    `shadowMasksForAssigned` mirrors the DFS `setCenterMask` updates, and
    `shadowMasksForFullFragmentSearchAssigned_eq_of_hasTenMasks` proves that
    the full ten-step assignment reconstructs `shadow.masks`.  The only
    remaining generated-DFS bridge is the final membership/certificate step
    from the computed valid-shadow path to the literal accepted key list.
  - `2026-07-05`: the computed DFS path is now kernel-checked.  The generated
    theorem `shadow_mem_fragmentSearchAux_of_isValidPinnedFragment` chains the
    fixed search order and proves that any `isValidPinnedFragment` shadow is a
    member of the computed `fragmentSearchAux` result.  The remaining finite
    task is only to certify that computed result against the emitted literal
    `fragmentSearchShadowKeys`/bank key list.
  - `2026-07-05`: computed DFS acceptance is now kernel-checked without a heavy
    global `native_decide`.  `computedRawFragmentSearchEntries`,
    `computedFragmentSearchShadowKeys`, and
    `computedFragmentShadowAcceptedBySearch` expose the computed DFS key list,
    and `computedFragmentShadowAcceptedBySearch_of_isValidPinnedFragment`
    proves every valid pinned fragment is accepted by that computed list.  A
    per-`sstar` raw computed-vs-literal equality was tested: `.s1` succeeds but
    takes about 150 seconds in the LSP, while the all-`sstar` version timed out
    at 300 seconds.  The next certificate should therefore be generated in a
    smaller form instead of relying on one large recomputation.
  - `2026-07-05`: the final finite DFS accepted-key bridge is now sharded and
    wired to the spine.  The generator emits
    `Erdos9796Proof.P97.SurplusCOMPGBankDFS` plus three depth-2 certificate
    shards.  The coordinator proves
    `SurplusCOMPGBank.fragmentShadowAcceptedBySearch_of_isValidPinnedFragment`,
    and `RemovableVertexAxiom` now exposes
    `Problem97.pinnedSurplusCOMPGBankBridge` as the closed handoff from
    `isValidPinnedFragment` to `shadowInBank`.  Verification:
    `lake-build Erdos9796Proof.P97.SurplusCOMPGBankDFS` succeeds; shard build
    times were about 153s, 157s, and 163s, with the coordinator under one
    second.  `lake-build Erdos9796Proof.P97.RemovableVertexAxiom` succeeds with
    only the pre-existing spine `sorry`.
  - `2026-07-05`: reviewed the rvol redundancy assessment at
    `../p97-rvol/docs/u-lane/97-u1-2-census-route-redundancy-assessment-2026-07-05.md`.
    Its warning still governs the full proof tree: this finite incidence/DFS
    handoff is useful and now spine-wired, but it is not an independent closure
    of the metric realizability core.  The remaining pinned-surplus work is the
    geometric payload-to-shadow proof and the metric COMP-G verdict boundary.
  - `2026-07-06`: `SurplusCOMPGBankGeometry` now exposes compiled finite
    mask/prefix interfaces for all generated pinned-fragment component
    Booleans: `wSqueezeOK`, `oneHitOK`, `circumcenterOK`, `noThreeOK`,
    `searchPairCountsOK`, `separationOK`, `searchSeparationOK`, and
    `fragmentTriggersOK`.  The aggregate theorem
    `isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces` now turns
    those explicit finite facts directly into `isValidPinnedFragment`.  The
    bridge no longer has an opaque generated Boolean layer; the remaining
    pinned-surplus work is to prove the geometric mask facts that feed this
    interface and then use the closed DFS completeness handoff.
  - `2026-07-06`: the pinned `.v` class-shape obligation is now discharged
    from the pinned mask equality.  The finite facts
    `maskNormalized_pinnedMaskOf_of_isSurplusStar`,
    `maskCard_pinnedMaskOf_of_isSurplusStar`, and
    `maskHas_pinnedMaskOf_v_eq_false_of_isSurplusStar` prove the generated
    pinned mask is normalized, has cardinality four, and has no `.v` self-hit.
    `classesShapeOK_shadowOfPointClasses_of_pinned_v_and_other_shapes` uses
    those facts to remove `.v` from the geometric class-shape input list, and
    `isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v`
    is now the preferred aggregate interface for pinned residuals.
  - `2026-07-06`: point-mask normalization is now closed for every geometric
    mask induced by `shadowOfPointClasses`.  The lemmas
    `pointMask_foldl_le_add_maskOfLabels`, `pointMask_le_maskOfLabels`, and
    `maskNormalized_pointMask` prove that any `pointMask` only uses the ten
    generated label bits.  Consequently the class-shape and aggregate
    mask-interface lemmas no longer require normalization hypotheses; only
    cardinality-four and no-self facts remain as geometric inputs.
  - `2026-07-06`: the removable-vertex spine now has a three-way split in
    `RemovableVertexAxiom`.  The adapter
    `RemovableVertexOfLarge_from_threeWaySplit` is closed and immediately
    consumed by `RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank`.  The
    original split exposed packet extraction, the `IsM44` pinned-surplus
    branch, and the parallel non-`IsM44` descent branch.  The non-`IsM44`
    contract is now pinned at configuration level, matching the p97-rvol
    U-lane import shape: `NonIsM44DescentStatement` takes the top-level
    hypotheses plus `¬ ∃ S : SurplusCapPacket A, S.IsM44` and returns a
    removable vertex.  The adapter branches on `∃ S, S.IsM44`; the witness is
    passed to the `IsM44` branch, while the negated existence hypothesis is
    passed to the U-lane-owned fallback.
  - `2026-07-06`: the broad `IsM44` pinned-surplus branch has been split into
    three narrower spine contracts.  The closed adapter
    `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit` uses
    `IsM44.nonSurplusMoserCapContainment_of_endpoint_pinnedSurplusResiduals` to
    reduce `removableVertexOfLarge_of_isM44PinnedSurplus` to:
    `isM44EndpointResidualsExcluded` for the two endpoint-certificate residuals,
    `isM44PinnedSurplusResidualsExcluded` for the pinned surplus-family
    COMP-G/metric verdict boundary, and
    `isM44NonSurplusContainmentRemovable` for the final extraction of a
    removable vertex from non-surplus Moser-cap containment.  This confirms that
    the finite bank handoff has not by itself closed Q; it is one input to the
    pinned-residual exclusion branch.
  - `2026-07-06`: the packet-extraction spine obligation
    `largeK4SurplusCapPacket` is now closed by
    `MEC.nonempty_surplusCapPacket_of_K4`.  After the config-level U-lane slot
    restatement, it is retained as a harmless argument to the three-way adapter
    for interface stability, but the adapter no longer needs it to route the
    no-`IsM44` branch.  The containment-to-removable
    branch has also been reduced one level further: the closed helper
    `removableVertex_of_selectedClass_erase_witnesses` packages an erased-set
    selected-class witness family as an `IsRemovableVertex`, and the adapter
    `isM44NonSurplusContainmentRemovable` now depends only on
    `isM44NonSurplusContainmentErasureWitnesses`.  The remaining pure
    containment contract is therefore concrete: from
    `S.NonSurplusMoserCapContainment`, produce some `x ∈ A` such that every
    `p ∈ A.erase x` has a positive-radius selected class in `A.erase x` with
    cardinality at least four.
  - `2026-07-06`: the erased-set survival algebra has started.  In
    `WitnessPacketInterface`, `selectedClass_erase_eq`,
    `selectedClass_erase_card_eq_of_not_mem`, and
    `selectedClass_erase_card_ge_of_succ_le` now prove that erasing one ambient
    point is exactly erasing that point from the selected class, so a selected
    class that avoids the erased point is unchanged and a five-point class
    remains four-point.  In `SurplusM44Packet`, exact four-point short-cap
    classes now survive erasing a strict interior point from another cap via
    `selectedClass_erase_card_eq_of_exact_cap_of_capInterior_ne` and
    `four_le_selectedClass_erase_of_exact_cap_of_capInterior_ne`.  The packaged
    `IsM44` consequences
    `IsM44.exists_oppIndex1_erase_witness_of_surplusInterior` and
    `IsM44.exists_oppIndex2_erase_witness_of_surplusInterior` close the two
    non-surplus opposite-Moser survivor subcases for any surplus-interior erase
    candidate.  The remaining survivor cases are the surplus-opposite Moser
    vertex and the non-Moser cap-interior points; those appear to require either
    the generalized N8 adjacent one-hit/budget machinery or the endpoint/pinned
    residual exclusions directly, not just the bare
    `S.NonSurplusMoserCapContainment` interface.
  - `2026-07-06`: the residual survivor census is now formalized on the spine.
    `SurplusM44Packet` exposes
    `mem_triangle_verts_oppositeVertexByIndex_cases` and
    `index_eq_surplusIdx_or_oppIndex1_or_oppIndex2`; together with
    `mem_triangle_verts_or_exists_capInteriorByIndex_of_mem`, these split any
    residual survivor into the surplus-opposite Moser vertex or one of the
    three strict cap-interior categories.  The generic residual theorem
    `isM44NonSurplusContainmentResidualErasureWitnesses` now carries the
    categorized residual statement directly, so it stayed on the mined proof
    spine.  The broad erasure-witness theorem adapts from that residual plus
    the two exact non-surplus opposite-Moser survivor lemmas.
  - `2026-07-06`: survivor production was narrowed once more to exact pinned
    four-classes.  `WitnessPacketInterface` now proves
    `selectedClass_erase_witness_or_exact_erased_pin` and
    `selectedClass_erase_witness_of_no_exact_erased_pin`: a failed erased-set
    witness forces an exact size-four selected class through the erased point.
    `Problem97.isM44NonSurplusContainmentResidualErasureWitnesses` is now a
    closed adapter from
    `Problem97.isM44NonSurplusContainmentExactPinResidualsExcluded`.
  - `2026-07-06`: the exact-pin residual was normalized to the U5-style
    triple-circle form.  `WitnessPacketInterface` now defines
    `ErasedPinTriple` and proves `erasedPinTriple_of_exact_erased_pin`.
    `Problem97.isM44NonSurplusContainmentExactPinResidualsExcluded` is now a
    closed adapter from
    `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`,
    which is the current open spine leaf.
  - `2026-07-06`: the U5-style triple bridge is now bidirectional at the
    selected-class interface.  `exact_erased_pin_of_erasedPinTriple` proves
    that `ErasedPinTriple A x p` plus `x ∈ A` reconstructs
    `0 < dist p x`, exact selected-class cardinality four at radius
    `dist p x`, and membership of the erased point in that selected class.
    This gives the residual branch a finite-set path back into the existing
    selector and certificate consumers whenever they require exact
    selected-class data instead of the triple-circle normal form.
  - `2026-07-06`: after the p97-rvol coordination-slot restatement, the active
    GPT/formalization work remains on the `IsM44` containment branch, not on
    the U-lane-owned no-`IsM44` slot.  The current target is
    `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`.
    Its inputs are exactly the `IsM44` packet, endpoint residual exclusions,
    pinned surplus-family residual exclusions, and
    `S.NonSurplusMoserCapContainment`.  The next proof work is to inspect the
    existing U5/N8 selected-apex and p97-rvol placement machinery, then derive
    load-bearing local contradictions for the `ErasedPinTriple A x p` cases
    consumed by this spine leaf.
  - `2026-07-06`: the sibling p97-rvol U5 files have been checked as shape
    references for this residual.  `U5ModeADeletion` and
    `U3ToU5DangerousTriple` describe the right triple-circle and deletion
    vocabulary, but they are not a direct closer for the local
    `SurplusCapPacket` residual; the local route still needs to feed the
    reconstructed exact selected-class data into the existing
    selector/certificate machinery or port the minimal rvol payload.
  - `2026-07-06`: the first local port of the N8 four-subpacket arithmetic is
    now proved in `SurplusM44Packet`.  The surplus vocabulary has packet-local
    Moser, same-cap, left-adjacent, and right-adjacent counts, the exact
    positive-radius disjoint-cover budget
    `packet_groupSum_eq_four_of_card`, and
    `M44SelectedApex.exists_fourSubpacket_with_packet_budget`.  This is the
    finite incidence bridge needed after an `ErasedPinTriple` is converted back
    to exact selected-class data: the branch can now produce a four-point
    `SurplusCapPacket` packet with an exact `(m,s,l,r)` row budget without
    passing through `FiniteEndpointShell`.
  - `2026-07-06`: the surplus packet arithmetic now includes the primitive row
    extractor.  `M44SelectedApex.exists_left_right_primitive_packet_cases` and
    the count-facing `_of_counts` version preserve chosen left/right adjacent
    selected points, use the full one-hit bounds to force packet left/right
    rows to singletons, and split the exact four-point budget into the two
    primitive incidence rows `(1,1,1,1)` and `(2,0,1,1)`.  This is the local
    `SurplusCapPacket` analogue of the N8 primitive packet interface needed to
    feed reconstructed erased-pin selected classes into the finite
    selector/certificate rows.
  - `2026-07-06`: the erased-pin residual now has a non-surplus-cap packet
    reducer.  `M44SelectedApex.of_erasedPinTriple` reconstructs the selected
    apex from `ErasedPinTriple A x p`, and
    `IsM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple` plus
    the `oppIndex2` analogue automatically discharge the Moser and same-cap
    upper bounds from `S.NonSurplusMoserCapContainment` and the `IsM44` short
    cap facts.  For the two opposite-cap residual families, the remaining
    inputs are now the adjacent lower/upper bounds and exclusion of the two
    primitive packet rows.
  - `2026-07-06`: the adjacent upper-bound input has also been reduced to the
    existing U2 ordered-chain one-hit interface.  The new
    `adjacentCount_le_one_of_adjacent_chains` wrapper consumes
    `N8a3AdjacentCapDistanceStrict` plus support containment for the left and
    right adjacent interiors, and the `..._erasedPinTriple_chains` wrappers feed
    those bounds into the primitive packet reducer.  For the two opposite-cap
    erased-pin residuals, the remaining proof-facing inputs are now adjacent
    lower bounds, construction of the ordered chains/support containments, and
    exclusion of the two primitive rows.
  - `2026-07-06`: one adjacent lower bound is now closed directly from the
    erased surplus point's placement.  If `x ∈ S.capInteriorByIndex
    S.surplusIdx`, then `x` lies in the right-adjacent interior for
    `S.oppIndex1` and in the left-adjacent interior for `S.oppIndex2`, so the
    corresponding full selected-class adjacent counts are automatically at
    least one at radius `dist p x`.  The surplus-aware erased-pin reducers
    therefore remove `hxA` and one lower-bound hypothesis: for `oppIndex1`,
    only the left-adjacent lower bound remains explicit; for `oppIndex2`, only
    the right-adjacent lower bound remains explicit.
  - `2026-07-06`: the missing adjacent lower bound has been isolated as a
    one-sided count obstruction instead of a vague hypothesis.  The exact
    full selected-class budget now splits the `oppIndex1` erased-pin branch
    into primitive packet rows or the row `(m,s,l,r) = (2,1,0,1)`, and the
    `oppIndex2` branch into primitive packet rows or `(2,1,1,0)`.  The
    chain-facing split consumes only ordered-chain one-hit upper bounds plus
    the erased surplus point placement; the next proof obligation is therefore
    to exclude these one-sided obstruction rows or to show they reduce to the
    endpoint/pinned residual families.
  - `2026-07-06`: the one-sided obstruction rows now have concrete selected
    four-class payloads.  `selectedClass_subset_groupUnion` factors the
    positive-radius selected-class cover by Moser, same cap, left-adjacent, and
    right-adjacent groups.  `right_one_sided_obstruction_payload` and
    `left_one_sided_obstruction_payload` turn the two remaining count rows into
    named points and prove the whole selected class is exactly the named
    four-point set.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusM44Packet` succeeds.
  - `2026-07-06`: the erased-pin splitters now expose those named payloads
    directly.  `RightOneSidedObstructionPayload` and
    `LeftOneSidedObstructionPayload` are stable propositions for the two
    residual one-sided rows, and the new
    `IsM44.oppIndex1_surplusErasedPinTriple_payload_cases`,
    `IsM44.oppIndex2_surplusErasedPinTriple_payload_cases`, plus their
    ordered-chain variants return either a primitive packet row or the named
    payload.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusM44Packet` succeeds.
  - `2026-07-06`: the opposite-cap erased-pin branches now also have consumer
    lemmas.  `IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases`
    and `IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases`, plus
    their ordered-chain variants, refute an erased-pin triple once supplied
    with exclusions for the primitive packet rows and the one-sided payload.
    This makes the remaining inputs explicit rather than hidden in the count
    split: construct the ordered-chain/support data, prove the primitive-row
    exclusions, and exclude or reroute the one-sided payloads.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusM44Packet` succeeds.
  - `2026-07-06`: the ordered-chain input has been compressed to a single
    proof-facing proposition.  `AdjacentChainOneHitData S i p r` packages the
    two side chains, both `N8a3AdjacentCapDistanceStrict` monotonicity proofs,
    and both selected-class support containments.  The new
    `..._payload_cases_chainData` and
    `..._false_of_payload_cases_chainData` wrappers consume this aggregate
    target.  The next chain-production work is therefore no longer an
    eight-argument plumbing problem: prove `AdjacentChainOneHitData` for
    `S.oppIndex1` and `S.oppIndex2` at radius `dist p x`.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusM44Packet` succeeds.
  - `2026-07-06`: the one-sided payloads now split their two Moser hits into
    the indexed cap's own endpoint pair or a branch where the selected class
    contains the opposite Moser vertex.  The reusable finite enumeration is
    `triangle_pair_own_or_opposite`; the payload projections are
    `rightOneSidedObstructionPayload_own_or_opposite` and
    `leftOneSidedObstructionPayload_own_or_opposite`.  This gives the next
    residual decision a concrete fork: close the own-endpoint one-sided packet
    directly, or route the opposite-Moser-present branch into the endpoint or
    pinned residual interfaces.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusM44Packet` succeeds.
  - `2026-07-06`: the one-sided payloads now also have erased-pin refinements.
    `RightOneSidedErasedPayload` and `LeftOneSidedErasedPayload` identify the
    lone surplus-adjacent selected point as the erased surplus point `x`, not an
    anonymous adjacent witness.  The new
    `..._erasedPayload_cases_chainData` splitters and
    `..._false_of_erasedPayload_cases_chainData` consumers let the residual
    exclusion target the stronger pinned four-class directly.  This is the
    handoff shape needed before deciding whether the one-sided branch closes by
    a direct metric contradiction or by conversion into the endpoint/pinned
    residual interfaces.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusM44Packet` succeeds.
  - `2026-07-06`: the erased one-sided payload now has an explicit second-stage
    consumer split.  `rightOneSidedErasedPayload_own_or_opposite` and
    `leftOneSidedErasedPayload_own_or_opposite` inherit the Moser-pair split for
    erased payloads, while
    `..._false_of_erasedPayload_split_chainData` reduces each opposite-cap
    erased-pin triple to three concrete residual exclusions: the primitive
    packet rows, the own-endpoint erased payload, and the
    opposite-Moser-present erased payload.  The next proof work should target
    those two one-sided subcases separately rather than the undifferentiated
    payload.
  - `2026-07-06`: the opposite-Moser-present erased payload has been
    strengthened.  `IsM44.oppIndex1_exactCapClass_at_erasedPayload_oppositeRadius`
    and its `oppIndex2` mirror prove that once the interior-centered erased
    payload also selects the corresponding opposite Moser vertex, the radius
    `dist p x` is exactly the non-surplus Moser-centered cap radius, so
    `SelectedClass A (S.oppositeVertexByIndex S.oppIndex*) (dist p x)` is the
    exact four-point non-surplus cap.  The new
    `...ErasedPayload_own_or_exactOpposite` and
    `...false_of_own_or_exactOpposite` consumers replace the raw
    opposite-Moser branch with this exact-cap branch.  This does not close the
    one-sided residual by itself; it sharpens the handoff target for the finite
    or COMP-G bridge.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusM44Packet` succeeds.
  - `2026-07-06`: the selected route for the erased one-sided residual is now
    the finite seeded-shadow route, not the old pinned COMP-G bank.  The seed
    fixes the two non-surplus exact-cap classes in bank labels as
    `.v = {u,w,Pw,Pu}` and `.w = {u,v,Q1,Q2}`, then fixes the private-centered
    one-sided class for each surplus-star label, private-center choice, and
    own/opposite endpoint branch.  A scratch enumeration of the 18 seed
    variants against the generated mask rules found zero surviving shadows.
    The Lean module `Erdos9796Proof.P97.SurplusSeededShadow` now contains the
    matching Boolean DFS and proves `oneSidedSeedSearchEntries_eq_nil` plus the
    18-entry zero count table by `native_decide`.  It also proves the
    exhaustiveness bridge
    `false_of_isValidOneSidedSeedShadow_of_mem_seed`: any listed finite seed
    whose induced shadow satisfies `isValidOneSidedSeedShadow` is contradictory.
    The six seed-membership lemmas (`ownPw...`, `ownPu...`,
    `oppositeUPw...`, `oppositeUPu...`, `oppositeWPw...`,
    `oppositeWPu...`) cover the own-endpoint and opposite-endpoint private
    center cases once the geometry adapter identifies the surplus-star label.
    A kernel-only `decide` proof was attempted and does not reduce the search
    far enough.  The native audit found no `unsafe`, `implemented_by`, or
    `extern` in the seeded module or generated bank module; `#print axioms` for
    the usable no-seed theorem reports `propext`, `Quot.sound`,
    `Lean.ofReduceBool`, and `Lean.trustCompiler` on Lean 4.27.  The next
    geometry-facing mask interface is also in place:
    `isValidOneSidedSeedShadow_shadowOfPointClasses_of_mask_interfaces` in
    `SurplusCOMPGBankGeometry` assembles explicit point-mask facts into the
    seeded validity predicate.  The next geometry work is the adapter from
    `...ErasedPayload_own_or_exactOpposite` into that mask interface for one of
    these finite seeds.
  - `2026-07-06`: the first geometry-to-seeded-mask adapters are now proved in
    `SurplusCOMPGBankGeometry`.  The closed-cap reconstruction lemma
    `capByIndex_eq_outer_vertices_insert_interior_pair` turns a named
    two-point strict interior into the four-point closed cap consisting of the
    two Moser endpoints plus that pair.  The point-mask normalization lemmas
    `pointMask_eq_firstOppExactCapMask`,
    `pointMask_eq_secondOppExactCapMask`, and the six
    `pointMask_eq_*SeedPrivateMask` lemmas identify the generated finite masks
    for exact non-surplus caps and for each one-sided private seed.  The
    right-oriented cap corollaries
    `rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair` and
    `rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair` show that
    the two non-surplus exact caps supply the fixed `.v`/`.w` seed masks once
    `IsM44.exists_oppInterior_pairs` has named their interiors.  A scratch
    attempt to enumerate the fully relaxed own-branch census was stopped after
    it failed to reduce quickly; it is not the active route.  The active route
    uses the separate exact cap center classes supplied by
    `IsM44.exists_nonSurplus_exact_cap_classes_at_side_of_moserCapContainment`,
    while the erased-payload selected class supplies only the private seed
    mask.
  - `2026-07-06`: the right-oriented own-endpoint private seed bridge is now
    formalized.  `rightOwnPwSeedPrivateMask_of_erasedPayload` and
    `rightOwnPuSeedPrivateMask_of_erasedPayload` consume a
    `RightOneSidedErasedPayload`, the own-Moser endpoint branch, a named
    `oppInterior1 = {p₁,p₂}` pair, and the surplus-star label for the erased
    point, then identify the `Pw`/`Pu` centered selected class with the
    generated private seed mask.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusCOMPGBankGeometry`
    succeeds.
  - `2026-07-06`: the right-oriented opposite-Moser private seed bridge is also
    formalized.  The private helper
    `triangle_pair_eq_opposite_left_or_opposite_right_of_mem` proves that a
    two-point Moser intersection containing the indexed opposite Moser vertex
    has the other Moser hit on one of the two own endpoints.
    `rightOppositePwSeedPrivateMask_cases_of_erasedPayload` and
    `rightOppositePuSeedPrivateMask_cases_of_erasedPayload` apply this to a
    `RightOneSidedErasedPayload`, producing exactly the generated
    opposite-`u` or opposite-`w` private seed masks.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusCOMPGBankGeometry`
    succeeds.
  - `2026-07-06`: the left-oriented mirror private seed bridge is now
    formalized too.  `leftOwnPwSeedPrivateMask_of_erasedPayload`,
    `leftOwnPuSeedPrivateMask_of_erasedPayload`,
    `leftOppositePwSeedPrivateMask_cases_of_erasedPayload`, and
    `leftOppositePuSeedPrivateMask_cases_of_erasedPayload` provide the
    `oppIndex2` mirrors of the right-oriented private seed facts, using
    `LeftOneSidedErasedPayload`, `oppInterior2 = {p₁,p₂}`, and the left label
    map.  Verification:
    `cd lean && lake-build Erdos9796Proof.P97.SurplusCOMPGBankGeometry`
    succeeds.
- Lean module added: `Erdos9796Proof.P97.N8.FourSubpacket`.
- General-`n` module added: `Erdos9796Proof.P97.SurplusM44Packet`.
- Implemented:

  ```text
  exists_fourSubpacket_of_selected_card_ge_four
  N8SelectedApex.exists_fourSubpacket
  exists_fourSubpacket_preserving_of_selected_card_ge_four
  exists_fourSubpacket_preserving_point_of_selected_card_ge_four
  N8SelectedApex.exists_fourSubpacket_preserving_point
  packetMoserCount
  packetSameCapCount
  packetLeftAdjCount
  packetRightAdjCount
  packetMoserCount_le_selected
  packetSameCapCount_le_selected
  packetLeftAdjCount_le_selected
  packetRightAdjCount_le_selected
  one_le_packetMoserCount_of_mem
  one_le_packetSameCapCount_of_mem
  one_le_packetLeftAdjCount_of_mem
  one_le_packetRightAdjCount_of_mem
  packet_card_le_groupSum
  packet_groupSum_le_card
  packet_groupSum_eq_card
  four_le_packet_groupSum_of_card
  packet_groupSum_eq_four_of_card
  SurplusCapPacket.exists_fourSubpacket_preserving_of_selected_card_ge_four
  SurplusCapPacket.exists_fourSubpacket_preserving_point_of_selected_card_ge_four
  SurplusCapPacket.M44SelectedApex.exists_fourSubpacket_preserving_point
  SurplusCapPacket.packetMoserCount_le_moserCount
  SurplusCapPacket.packetSameCapCount_le_sameCapCount
  SurplusCapPacket.packetLeftAdjCount_le_leftAdjCount
  SurplusCapPacket.packetRightAdjCount_le_rightAdjCount
  SurplusCapPacket.packetSameCapCount_eq_one_of_le_one
  SurplusCapPacket.packetLeftAdjCount_eq_one_of_le_one
  SurplusCapPacket.packetRightAdjCount_eq_one_of_le_one
  SurplusCapPacket.M44SelectedApex.
    exists_fourSubpacket_preserving_point_with_packet_budget
  SurplusCapPacket.M44SelectedApex.
    exists_fourSubpacket_preserving_left_point_with_packet_budget
  SurplusCapPacket.M44SelectedApex.
    exists_fourSubpacket_preserving_right_point_with_packet_budget
  SurplusCapPacket.M44SelectedApex.
    exists_fourSubpacket_preserving_left_right_points_with_packet_budget
  SurplusCapPacket.packet_left_right_primitive_cases
  SurplusCapPacket.selectedCount_groupSum_eq_four_of_card
  SurplusCapPacket.rightAdjCount_one_sided_count_cases
  SurplusCapPacket.leftAdjCount_one_sided_count_cases
  SurplusCapPacket.M44SelectedApex.exists_left_right_primitive_packet_cases
  SurplusCapPacket.M44SelectedApex.exists_left_right_primitive_packet_cases_of_counts
  SurplusCapPacket.M44SelectedApex.of_erasedPinTriple
  SurplusCapPacket.exists_left_right_primitive_packet_cases_of_erasedPinTriple_counts
  SurplusCapPacket.IsM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple
  SurplusCapPacket.IsM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple
  SurplusCapPacket.adjacentCount_le_one_of_adjacent_chains
  SurplusCapPacket.one_le_rightAdjCount_oppIndex1_of_surplus_mem
  SurplusCapPacket.one_le_leftAdjCount_oppIndex2_of_surplus_mem
  SurplusCapPacket.exists_left_right_primitive_packet_cases_of_erasedPinTriple_chains
  SurplusCapPacket.IsM44.exists_oppIndex1_primitive_packet_cases_of_erasedPinTriple_chains
  SurplusCapPacket.IsM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple_chains
  SurplusCapPacket.IsM44.
    exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple
  SurplusCapPacket.IsM44.
    exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple
  SurplusCapPacket.IsM44.
    exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple_chains
  SurplusCapPacket.IsM44.
    exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple_chains
  SurplusCapPacket.IsM44.oppIndex1_surplusErasedPinTriple_cases
  SurplusCapPacket.IsM44.oppIndex2_surplusErasedPinTriple_cases
  SurplusCapPacket.IsM44.oppIndex1_surplusErasedPinTriple_cases_chains
  SurplusCapPacket.IsM44.oppIndex2_surplusErasedPinTriple_cases_chains
  N8SelectedApex.exists_fourSubpacket_with_packet_budget
  N8SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget
  N8SelectedApex.exists_fourSubpacket_preserving_left_point_with_packet_budget
  N8SelectedApex.exists_fourSubpacket_preserving_right_point_with_packet_budget
  N8SelectedApex.exists_fourSubpacket_preserving_left_right_points_with_packet_budget
  packet_left_right_primitive_cases
  packetMoserCount_le_moserCount
  packetSameCapCount_le_sameCapCount
  packetLeftAdjCount_le_leftAdjCount
  packetRightAdjCount_le_rightAdjCount
  packetSameCapCount_eq_one_of_le_one
  packetLeftAdjCount_eq_one_of_le_one
  packetRightAdjCount_eq_one_of_le_one
  N8SelectedApex.exists_left_right_primitive_packet_cases
  N8SelectedApex.exists_left_right_primitive_packet_cases_of_counts
  exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
  exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
  FiniteEndpointShell.capInteriorByIndex_subset
  N8SelectedApex.nonempty_of_hasNEquidistantProperty
  FiniteEndpointShell.N8k_capInterior_false_of_hasNEquidistantProperty
  SurplusCapPacket.triangleByIndex
  SurplusCapPacket.circPacket
  SurplusCapPacket.circPacket2
  SurplusCapPacket.circPacket3
  SurplusCapPacket.capByIndex
  SurplusCapPacket.capByIndex_subset
  SurplusCapPacket.capInteriorByIndex_subset_capByIndex
  SurplusCapPacket.exists_capInteriorByIndex_pair_of_cap_card_eq_four
  SurplusCapPacket.capByIndex_arc_membership
  SurplusCapPacket.signedArea2_mul_pos_of_not_mem_capByIndex
  SurplusCapPacket.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex
  SurplusCapPacket.triangleByIndex_v2_mem_capByIndex
  SurplusCapPacket.triangleByIndex_v3_mem_capByIndex
  SurplusCapPacket.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep
  SurplusCapPacket.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep
  SurplusCapPacket.capInteriorByIndex
  SurplusCapPacket.capInteriorByIndex_subset
  SurplusCapPacket.capInteriorByIndex_card_eq_two_of_cap_card_eq_four
  SurplusCapPacket.oppIndex1
  SurplusCapPacket.oppIndex2
  SurplusCapPacket.oppInterior1
  SurplusCapPacket.oppInterior2
  SurplusCapPacket.IsM44.oppIndex1_cap_card_eq_four
  SurplusCapPacket.IsM44.oppIndex2_cap_card_eq_four
  SurplusCapPacket.IsM44.oppInterior1_card_eq_two
  SurplusCapPacket.IsM44.oppInterior2_card_eq_two
  SurplusCapPacket.leftAdjacentInteriorByIndex
  SurplusCapPacket.rightAdjacentInteriorByIndex
  SurplusCapPacket.leftAdjacentCapByIndex
  SurplusCapPacket.rightAdjacentCapByIndex
  SurplusCapPacket.leftAdjacentIndex
  SurplusCapPacket.rightAdjacentIndex
  SurplusCapPacket.leftAdjacentInteriorByIndex_eq_capInteriorByIndex
  SurplusCapPacket.rightAdjacentInteriorByIndex_eq_capInteriorByIndex
  SurplusCapPacket.leftAdjacentCapByIndex_eq_capByIndex
  SurplusCapPacket.rightAdjacentCapByIndex_eq_capByIndex
  SurplusCapPacket.leftAdjacentCapByIndex_rightAdjacentIndex
  SurplusCapPacket.rightAdjacentCapByIndex_leftAdjacentIndex
  SurplusCapPacket.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
  SurplusCapPacket.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
  SurplusCapPacket.moserCount
  SurplusCapPacket.sameCapCount
  SurplusCapPacket.leftAdjCount
  SurplusCapPacket.rightAdjCount
  SurplusCapPacket.oppositeVertexByIndex
  SurplusCapPacket.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
  SurplusCapPacket.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
  SurplusCapPacket.leftAdjCount_at_opposite_le_one_of_convexIndep
  SurplusCapPacket.rightAdjCount_at_opposite_le_one_of_convexIndep
  SurplusCapPacket.leftOuterVertexByIndex
  SurplusCapPacket.rightOuterVertexByIndex
  SurplusCapPacket.oppositeVertexByIndex_leftAdjacentIndex
  SurplusCapPacket.oppositeVertexByIndex_rightAdjacentIndex
  SurplusCapPacket.rightOuterVertexByIndex_leftAdjacentIndex
  SurplusCapPacket.leftOuterVertexByIndex_rightAdjacentIndex
  SurplusCapPacket.leftOuterVertexByIndex_mem_leftAdjacentCapByIndex
  SurplusCapPacket.rightOuterVertexByIndex_mem_rightAdjacentCapByIndex
  SurplusCapPacket.leftOuterVertexByIndex_mem_capByIndex
  SurplusCapPacket.rightOuterVertexByIndex_mem_capByIndex
  SurplusCapPacket.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer
  SurplusCapPacket.capInteriorByIndex_mem_private
  SurplusCapPacket.leftAdjacentInteriorByIndex_mem_strict
  SurplusCapPacket.rightAdjacentInteriorByIndex_mem_strict
  SurplusCapPacket.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
  SurplusCapPacket.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
  SurplusCapPacket.mem_leftAdjacentInteriorByIndex_of_left_strict_escape
  SurplusCapPacket.mem_rightAdjacentInteriorByIndex_of_right_strict_escape
  SurplusCapPacket.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
  SurplusCapPacket.moserCapCoreSelectorAt
  SurplusCapPacket.leftStrictEscape_mem_secondSelectedClass
  SurplusCapPacket.rightStrictEscape_mem_secondSelectedClass
  SurplusCapPacket.MoserSelectorShapeAt
  SurplusCapPacket.MoserSubpacketSelectorShapeAt
  SurplusCapPacket.moserSelectorShapeAt_of_convexIndep
  SurplusCapPacket.rightSecondSelectedClass_selectedCap_singleton
  SurplusCapPacket.leftSecondSelectedClass_selectedCap_singleton
  SurplusCapPacket.exists_moserSubpacketSelectorShapeAt_preserving_adjacent
  SurplusCapPacket.exists_surplusMoserSubpacketSelectorShape_preserving_adjacent
  SurplusCapPacket.moserSubpacketSelectorShapeAt_adjacent_named_or_outer
  SurplusCapPacket.MoserCapContainmentAt
  SurplusCapPacket.MoserCapContainment
  SurplusCapPacket.NonSurplusMoserCapContainment
  SurplusCapPacket.nonSurplusMoserCapContainment_of_moserCapContainment
  SurplusCapPacket.MoserCapEscapedForm
  SurplusCapPacket.IsMoserCapFormAAt
  SurplusCapPacket.IsMoserCapFormBAt
  SurplusCapPacket.IsMoserCapFormCAt
  SurplusCapPacket.StrictAdjacentEscapeAt
  SurplusCapPacket.EndpointEscapeRightAt
  SurplusCapPacket.EndpointEscapeLeftAt
  SurplusCapPacket.rightEndpointOnFirstRadius_false
  SurplusCapPacket.leftEndpointOnFirstRadius_false
  SurplusCapPacket.rightPrivateSecondHit_reflection_false
  SurplusCapPacket.leftPrivateSecondHit_reflection_false
  SurplusCapPacket.rightEndpointEscapeData_elim
  SurplusCapPacket.leftEndpointEscapeData_elim
  SurplusCapPacket.rightStrictEscape_endpointData_elim
  SurplusCapPacket.leftStrictEscape_endpointData_elim
  SurplusCapPacket.EndpointRadiusAt
  SurplusCapPacket.NoStrictAdjacentEscapeAt
  SurplusCapPacket.NonSurplusNoStrictAdjacentEscape
  SurplusCapPacket.isMoserCapFormAAt_left_named_split
  SurplusCapPacket.isMoserCapFormAAt_right_named_split
  SurplusCapPacket.isMoserCapFormBAt_left_named_split
  SurplusCapPacket.isMoserCapFormCAt_right_named_split
  SurplusCapPacket.MoserCapFormsAt
  SurplusCapPacket.MoserCapClassifiesAt
  SurplusCapPacket.MoserCapExcludesAt
  SurplusCapPacket.MoserCapExcludesFormAAt
  SurplusCapPacket.MoserCapExcludesFormBAt
  SurplusCapPacket.MoserCapExcludesFormCAt
  SurplusCapPacket.moserCapFormsAt_of_convexIndep
  SurplusCapPacket.moserCapClassifiesAt_of_forms
  SurplusCapPacket.moserCapExcludesAt_of_form_excludes
  SurplusCapPacket.NonSurplusMoserCapClassifies
  SurplusCapPacket.NonSurplusMoserCapForms
  SurplusCapPacket.IsM44.nonSurplusMoserCapForms_of_convexIndep
  SurplusCapPacket.IsM44.exists_oppInterior_pairs
  SurplusCapPacket.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2
  SurplusCapPacket.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior
  SurplusCapPacket.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior
  SurplusCapPacket.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1
  SurplusCapPacket.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2
  SurplusCapPacket.rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1
  SurplusCapPacket.IsM44.leftStrictEscape_oppIndex1_endpointData_elim
  SurplusCapPacket.IsM44.rightStrictEscape_oppIndex2_endpointData_elim
  SurplusCapPacket.IsM44.strictAdjacentEscapeAt_oppIndex1_reduces_to_right_surplus
  SurplusCapPacket.IsM44.strictAdjacentEscapeAt_oppIndex2_reduces_to_left_surplus
  SurplusCapPacket.IsM44.oppIndex1_pin_of_right_surplus
  SurplusCapPacket.IsM44.oppIndex2_pin_of_left_surplus
  SurplusCapPacket.IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals
  SurplusCapPacket.IsM44.nonSurplusMoserCapContainment_of_endpoint_surplus_residuals
  SurplusCapPacket.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1
  SurplusCapPacket.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2
  SurplusCapPacket.IsM44.exists_surplusAdjacentInterior_pairs
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_selected_adjacent
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
  SurplusCapPacket.isMoserCapFormAAt_adjacentClosedCounts_pos
  SurplusCapPacket.isMoserCapFormBAt_adjacentClosedCounts_pos
  SurplusCapPacket.isMoserCapFormCAt_adjacentClosedCounts_pos
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_formA
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_formB
  SurplusCapPacket.IsM44.exists_surplusSelectorNamedSplit_of_formC
  SurplusCapPacket.NonSurplusMoserCapExcludes
  SurplusCapPacket.NonSurplusMoserCapFormExcludes
  SurplusCapPacket.strictAdjacentEscapeAt_of_moserCapFormsAt
  SurplusCapPacket.containment_or_strictAdjacentEscapeAt_of_moserCapFormsAt
  SurplusCapPacket.containment_or_strictAdjacentEscapeAt_of_convexIndep
  Problem97.onArcOpposite_of_sameDist_apex_of_mem_mecDisk
  SurplusCapPacket.selectedClass_subset_capByIndex_of_endpointRadius
  SurplusCapPacket.not_strictAdjacentEscapeAt_of_endpointRadius
  SurplusCapPacket.noStrictAdjacentEscapeAt_of_endpointRadiusAt
  SurplusCapPacket.endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four
  SurplusCapPacket.endpointRadiusAt_of_moserCapContainmentAt_of_cap_card_eq_four
  SurplusCapPacket.endpointRadius_or_strictAdjacentEscapeAt_of_convexIndep
  SurplusCapPacket.endpointRadiusAt_of_noStrictAdjacentEscapeAt_of_convexIndep
  SurplusCapPacket.endpointRadiusAt_iff_noStrictAdjacentEscapeAt_of_convexIndep
  Problem97.twoCircle_sameSide_reflection_false
  SurplusCapPacket.moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep
  SurplusCapPacket.IsM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape
  SurplusCapPacket.nonSurplusMoserCapClassifies_of_forms
  SurplusCapPacket.nonSurplusMoserCapExcludes_of_form_excludes
  SurplusCapPacket.nonSurplusMoserCapContainment_of_classifies_excludes
  SurplusCapPacket.nonSurplusMoserCapContainment_of_forms_excludes
  SurplusCapPacket.IsM44.nonSurplusMoserCapContainment_of_convexIndep_form_excludes
  SurplusCapPacket.oppositeVertexByIndex_mem
  SurplusCapPacket.exists_moserSelectorShapeAt_of_hasNEquidistantProperty
  SurplusCapPacket.IsM44.exists_nonSurplusMoserSelectorShapes
  SurplusCapPacket.exact_cap_class_at_index_of_cap_card_eq_four
  SurplusCapPacket.dist_opposite_eq_of_mem_capByIndex_of_exact
  SurplusCapPacket.M44SelectedApex
  SurplusCapPacket.M44SelectedApex.nonempty_of_hasNEquidistantProperty
  SurplusCapPacket.M44SelectedApex.nonempty_oppIndex1_of_hasNEquidistantProperty
  SurplusCapPacket.M44SelectedApex.nonempty_oppIndex2_of_hasNEquidistantProperty
  SurplusCapPacket.sameCapCount_le_one_of_cap_card_eq_four
  SurplusCapPacket.M44SelectedApex.sameCapCount_le_one
  SurplusCapPacket.moserCount_le_two_of_opposite_vertex_at_side
  SurplusCapPacket.IsM44.exists_oppInterior_side_placement_of_moserCapContainment
  SurplusCapPacket.IsM44.moserCount_oppIndex1_le_two_of_moserCapContainment
  SurplusCapPacket.IsM44.moserCount_oppIndex2_le_two_of_moserCapContainment
  SurplusCapPacket.IsM44.sameCapCount_oppIndex1_le_one
  SurplusCapPacket.IsM44.sameCapCount_oppIndex2_le_one
  ```

  The packet budget is now exact: for any positive-radius selected packet
  `T <= SelectedClass A x r`,

  ```text
  mT + sT + lT + rT = T.card.
  ```

  Therefore a four-point packet gives the exact primitive incidence equation
  `mT + sT + lT + rT = 4`, not only a lower bound.

  The preserving-left/right extractors are the first Q-facing consumers: a
  selected adjacent-cap escape point can be forced into the packet, and the
  resulting primitive row records the corresponding adjacent count as at least
  one.

  The combined left-right extractor now preserves one selected point from each
  adjacent side in the same four-point packet.  With a Moser bound `mT <= 2`,
  a same-cap bound `sT <= 1`, and exact adjacent singleton bounds, the packet
  arithmetic collapses to the two primitive rows:

  ```text
  (mT, sT, lT, rT) = (1, 1, 1, 1)
  (mT, sT, lT, rT) = (2, 0, 1, 1)
  ```

  In `N8kDistribution`, the exact-one bridge lemmas combine this packet lower
  bound with a full selected-class one-hit bound, giving packet counts exactly
  equal to `1` on the same-cap, left-adjacent, or right-adjacent row.

  The first bundled consumer is now also formalized: given a selected apex, one
  selected left-adjacent witness, one selected right-adjacent witness, and the
  full bounds

  ```text
  moserCount <= 2
  sameCapCount <= 1
  leftAdjCount <= 1
  rightAdjCount <= 1
  ```

  Lean extracts a four-point packet preserving both adjacent witnesses and
  returns exactly the two primitive cases above.  This is deliberately
  conditional on the full one-hit bounds, so it reduces the Q incidence surface
  without assuming the surplus-side geometric input.

  A count-facing wrapper now removes the need to choose those adjacent
  witnesses manually: if the full left and right adjacent counts are both
  positive, Lean extracts witnesses by finite-set nonemptiness and returns the
  same two primitive packet rows.  This is the form later `(m,4,4)` code should
  feed once it has honest adjacent lower bounds and one-hit upper bounds.

  In `WitnessPacketInterface`, the upstream K4 predicate is now bridged to the
  local `SelectedClass` vocabulary: from `HasNEquidistantPointsAt n A p` Lean
  extracts a positive radius with `n <= (SelectedClass A p r).card`, and from
  `HasNEquidistantProperty 4 A` plus `p ∈ A` it extracts the four-point version.
  This is the entry point for an upstream `(m,4,4)` selected-apex interface.

  In `N8bEndpointPair`, cap-interior membership is now bridged back to the
  ambient set, so any `x ∈ S.capInteriorByIndex i` under global `K4` produces a
  nonempty `N8SelectedApex S i x`.  In `N8kDistribution`, this is consumed by
  `FiniteEndpointShell.N8k_capInterior_false_of_hasNEquidistantProperty`, which
  packages the K4-facing single-apex contradiction without manually unpacking a
  selected radius.  `FiniteN9Closure` now calls this named interface directly.

  The first general-`n` seam is now also in place on `SurplusCapPacket`: it has
  N8-style cap and cap-interior selectors, ambient-subset lemmas, and
  `IsM44` consequences saying the two non-surplus opposite-cap interiors have
  cardinality `2`.  This keeps the general-`n` work out of
  `FiniteEndpointShell`, whose structure is explicitly tied to `A.card = 9`.

  The support-cap bridge is also formalized.  A surplus packet now exposes the
  cyclic Moser triangle at each cap index, the corresponding circumscribed MEC
  packet, closed-cap membership/arc-membership, and the endpoint one-hit bounds
  for a selected class centered at either support endpoint of that indexed cap.
  This is the reusable input for the Moser-apex side bounds in the non-surplus
  core selector.

  The Moser-apex side one-hit bounds are now closed at both the closed-cap and
  count-facing levels.  The endpoint core-selector route has also been ported
  to a general indexed theorem, `moserCapCoreSelectorAt`: under `ConvexIndep A`,
  positive radius, indexed short-cap cardinality `4`, and a selected class of
  cardinality at least `4`, the selected class has exactly four points, contains
  the two strict own-cap interior points, and hits each adjacent closed cap at
  most once.  This is the proof-facing input for the escaped-form trichotomy.

  The general indexed escaped-form trichotomy is now closed as
  `moserCapFormsAt_of_convexIndep`.  The proof uses the core selector to force
  the two adjacent closed-cap intersections to be singletons, splits each
  singleton into strict-interior versus outer-Moser-endpoint cases, and rules
  out the both-outer-endpoints case by contradicting the escaped-containment
  hypothesis.  Consequently, an `IsM44` packet under `ConvexIndep A` supplies
  `NonSurplusMoserCapForms` automatically, and non-surplus Moser-cap containment
  now reduces to the six form-level exclusions.

  The rvol-style upstream placement split is now closed in this repo in generic
  indexed form.  `StrictAdjacentEscapeAt i radius` records the residual branch:
  a selected point lies in one adjacent closed cap and in neither the indexed
  cap nor the other adjacent cap.  The private-interior lemmas prove that any
  strict adjacent interior point is such a residual point, and
  `containment_or_strictAdjacentEscapeAt_of_convexIndep` proves:

  ```text
  SelectedClass A (S.oppositeVertexByIndex i) radius <= S.capByIndex i
  or
  S.StrictAdjacentEscapeAt i radius.
  ```

  This removes the missing placement-split blocker.  It does not rule out the
  strict branch and it does not supply both adjacent lower bounds for the N8
  two-side primitive reducer.  The next containment step is therefore a
  no-strict-adjacent-escape theorem for the relevant non-surplus short-cap
  indices, analogous to the `NoStrictAdjacentEscapeAtOppApex*` interface found
  in `../p97-rvol`.

  The no-strict-escape interface and containment wiring are now formalized.
  `NoStrictAdjacentEscapeAt i` states that every positive-radius K4-sized
  selected class at index `i` avoids `StrictAdjacentEscapeAt i radius`.
  `NonSurplusNoStrictAdjacentEscape` pairs this hypothesis at `oppIndex1` and
  `oppIndex2`, and
  `IsM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape`
  proves that these two no-strict hypotheses imply
  `NonSurplusMoserCapContainment`.  The open work is now only the proof of the
  no-strict hypotheses themselves, not their wiring into containment.

  The first no-strict proof layer is also formalized.  The local geometry lemma
  `onArcOpposite_of_sameDist_apex_of_mem_mecDisk` has been ported into
  `Erdos9796Proof.P97.U2.SameDistanceArcContainment`; it says that if the
  opposite apex and both cap endpoints lie on the MEC boundary, and a selected
  point in the MEC disk has the same distance from the apex as those endpoints,
  then the point lies in the indexed closed cap.  `SurplusM44Packet` packages
  this as `selectedClass_subset_capByIndex_of_endpointRadius`, then proves
  `not_strictAdjacentEscapeAt_of_endpointRadius` and
  `noStrictAdjacentEscapeAt_of_endpointRadiusAt`.  Thus strict adjacent escape is
  closed once the two endpoint-radius equalities are available for the queried
  selected class.  The remaining open work is to produce those endpoint-radius
  equalities for every relevant K4-sized class.

  The finite-set readout from containment is also formalized.  If a K4-sized
  selected class is contained in a four-point indexed cap, then it equals that
  cap, so the two Moser endpoints of the cap lie on the selected radius.  This
  gives `endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four`
  and `endpointRadiusAt_of_moserCapContainmentAt_of_cap_card_eq_four`.  Combining
  this with the placement split gives
  `endpointRadius_or_strictAdjacentEscapeAt_of_convexIndep`, and therefore
  `endpointRadiusAt_iff_noStrictAdjacentEscapeAt_of_convexIndep` for any
  four-point indexed cap under convexity.  This is useful bookkeeping, but it is
  not a closure: endpoint-radius production and no-strict escape are now known
  to be equivalent at this interface.

  The reusable reflection-kernel part of the strict-escape residual is also
  closed.  `twoCircle_sameSide_reflection_false` packages the clean rvol private
  subcase: two distinct points on the same two centered circles cannot both lie
  strictly on the same side of the chord joining the centers.  This is the
  kernel used in the sibling `oppCap2_escape_private_false` and in the paired
  surplus-apex-circle reflection kill.  It does not discharge the endpoint
  escape or pinned surplus-family residuals; it only isolates the part that is
  pure two-circle reflection geometry.

  The packet-side cap dictionary for that kernel is now closed as well.
  `signedArea2_mul_pos_of_not_mem_capByIndex` ports the rvol same-side bridge
  from surplus-cap membership to an arbitrary indexed closed cap:
  a carrier point outside `S.capByIndex i` is strictly on the same side of the
  support chord as `(S.triangleByIndex i).v1`.  Combining that with the pure
  kernel gives
  `twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`: two carrier
  points outside the same indexed cap cannot also share both endpoint-centered
  circle radii.  This is a genuine bridge from the cap vocabulary to the
  reflection contradiction, but it still only closes the private two-circle
  branch; endpoint escape and pinned surplus-family residuals remain open.

  `SurplusM44Packet` now adds the selected-class/count vocabulary on top of
  that seam.  It proves that global `K4` supplies a selected-apex packet in
  either non-surplus cap, and it closes the structural same-cap one-hit fact
  `sameCapCount <= 1` for those short caps.  It also proves the Moser-count
  consumer `moserCount <= 2` from explicit equilateral side-length hypotheses
  plus the fact that the selected cap-interior apex is at that side length from
  the opposite Moser vertex.

  The module now factors the side-distance producer through the weaker
  `NonSurplusMoserCapContainment` interface, the two-short-cap analogue of the
  N8/N9 `N4e` containment packet.  Under `HasNEquidistantProperty 4 A`, `IsM44`,
  and `NonSurplusMoserCapContainment`, the two non-surplus short caps become exact
  Moser-centered four-classes; this forces the Moser triangle side lengths to
  agree and gives `moserCount <= 2` for either non-surplus cap interior.  The
  remaining Moser-row obligation is therefore to prove non-surplus containment
  upstream, not to redo the side-distance or circumradius contradiction.  This
  deliberately avoids asking for a surplus-cap containment theorem.  The
  adjacent rows are not closed by this module.

  The non-surplus containment producer is now split in the same theorem-facing
  shape as endpoint `N4e`: `MoserCapClassifiesAt` records the local escaped-form
  classifier, `MoserCapExcludesAt` records the geometric exclusion of such an
  escaped class, and
  `nonSurplusMoserCapContainment_of_classifies_excludes` assembles the two
  non-surplus short-cap classifiers/exclusions into
  `NonSurplusMoserCapContainment`.  This closes only the packaging layer; the
  actual escaped-form trichotomy and exclusions remain open.

  The same module now exposes the general-`n` Form `a/b/c` predicates at a
  cyclic cap index and proves the endpoint-style form assembly:
  `MoserCapFormsAt` plus `MoserCapExcludesForm{A,B,C}At` gives
  `MoserCapExcludesAt`; paired non-surplus form trichotomies and exclusions
  give `NonSurplusMoserCapContainment` directly.  Since the form trichotomies
  now follow from `IsM44` plus convexity, the remaining non-surplus containment
  work is the corresponding Form `a/b/c` metric exclusions.

  A follow-up audit of the endpoint `N4d` modules shows that those exclusions
  are not direct corollaries of `MoserCapFormsAt`.  The endpoint proofs also
  consume zero-defect names for the two strict interior points in each short cap
  and forced selector packets at neighboring Moser vertices.  In a general
  `(m,4,4)` surplus packet, one neighboring cap can be the surplus cap, so the
  endpoint `FiniteEndpointShell` exclusions cannot be invoked wholesale.  The
  next formal interface should isolate the selector data needed by the row
  closers, using the four-point subpacket machinery on any surplus-side
  selector before porting the metric contradictions.

  The first piece of that selector interface is formalized: any indexed short
  cap has two named strict-interior points, and an `IsM44` packet supplies such
  pairs for both non-surplus caps.

  The short-cap selector packet is also formalized.  `MoserSelectorShapeAt`
  records the endpoint-style selector shape at a Moser vertex: a four-point
  selected class, containment of the two strict interior points of the indexed
  short cap, and singleton intersections with both adjacent closed caps.  Under
  `ConvexIndep A`, global `K4`, and indexed cap cardinality `4`, Lean now
  produces such a selector shape.  For an `IsM44` packet, this gives selector
  shapes for the two non-surplus short caps.  The remaining selector-interface
  work was therefore the surplus-side selector packet, where the cap itself is
  not a short cap and the four-point subpacket extraction must preserve the
  needed named witnesses.

  The surplus-side selector packet is now formalized conditionally on honest
  selected adjacent witnesses.  `MoserSubpacketSelectorShapeAt` records a
  four-point packet `T <= SelectedClass A (oppositeVertexByIndex i) r` with
  singleton left/right adjacent closed-cap rows, but without claiming that `T`
  contains the whole own cap.  Under convexity, if one selected point from each
  adjacent closed cap is supplied, Lean extracts such a four-point packet while
  preserving both points.  The specialization
  `exists_surplusMoserSubpacketSelectorShape_preserving_adjacent` applies this
  directly at `S.surplusIdx`.  This is exactly the finite-subpacket replacement
  for endpoint selector rows whose own cap is the surplus cap.

  The first row-split wiring layer is also formalized.  Given a
  `MoserSubpacketSelectorShapeAt` packet and named two-point adjacent interiors,
  `moserSubpacketSelectorShapeAt_adjacent_named_or_outer` splits each adjacent
  singleton into one of the two named interior points or the corresponding outer
  Moser endpoint.  For an `IsM44` packet, the adjacent interiors of
  `S.surplusIdx` are definitionally the two non-surplus interiors:
  `leftAdjacentInteriorByIndex S.surplusIdx = oppInterior1` and
  `rightAdjacentInteriorByIndex S.surplusIdx = oppInterior2`.  Thus
  `IsM44.exists_surplusAdjacentInterior_pairs` supplies the named adjacent pairs
  needed by the surplus-side selector split.

  The selector-row split is now packaged in the endpoint-facing form:
  `IsM44.exists_surplusSelectorNamedSplit_of_selected_adjacent` takes selected
  witnesses in the two adjacent closed caps, extracts the surplus-side
  four-point subpacket, and returns both singleton rows as elements of the
  corresponding finite named sets

  ```text
  {left-interior-1, left-interior-2, left-outer-Moser-endpoint}
  {right-interior-1, right-interior-2, right-outer-Moser-endpoint}.
  ```

  This closes the formal row-splitting step conditional on selected adjacent
  witnesses.  The remaining upstream gap is to produce those witnesses from the
  escaped-form branch data, then feed the resulting finite alternatives into
  the Form `a/b/c` metric closers.

  A count-facing version is also closed:
  `IsM44.exists_surplusSelectorNamedSplit_of_adjacent_counts` replaces the
  explicit selected witnesses by positive cardinality hypotheses for the two
  adjacent closed-cap intersections.  Thus the surplus selector row no longer
  needs manual witness choices; it needs the same kind of adjacent lower bounds
  already tracked in the Q-facing checklist.

  The Form-row-to-count bridge is now also closed.  Each indexed Form `a/b/c`
  predicate implies positive left and right adjacent closed-cap counts, and at
  `S.surplusIdx` those counts feed directly into the surplus selector named
  split:

  ```text
  Form `a/b/c` row at `S.surplusIdx`
    -> positive adjacent closed-cap counts
    -> `IsM44.exists_surplusSelectorNamedSplit_of_formA/B/C`
  ```

  This removes the manual count hypotheses once a Form row is available.  It
  does not prove that the Q escape placement supplies such a row; no existing
  Lean declaration in this checkout states the full Q placement hypothesis.

  The cyclic orientation for the two non-surplus cap indices is now explicit:
  at `oppIndex1`, the left-adjacent side is `oppInterior2` and the right side is
  the surplus interior; at `oppIndex2`, the left side is the surplus interior
  and the right-adjacent side is `oppInterior1`.  This is the general-`n`
  replacement for endpoint code that could split all three adjacent interiors
  using a zero-defect layout.

  The general Form `a/b/c` row splitters are also formalized.  Whenever a left
  or right adjacent strict interior is already named as a two-point set, the
  corresponding Form row splits into the two named singleton alternatives:
  Form `a` can split on either side, Form `b` splits on the left side, and Form
  `c` splits on the right side.  In an `(m,4,4)` packet, these combine with the
  non-surplus orientation lemmas above to recover the endpoint-style finite
  row splits on the short adjacent side while leaving the surplus side as the
  remaining explicit witness.

- Used `nthdegree docs search --lean` to locate the mathlib finite-set lemma:

  ```text
  Finset.exists_subsuperset_card_eq
  ```

- Wired `FourSubpacket` into `N8kDistribution`.
- Verified:

  ```bash
  cd lean && lake-build Erdos9796Proof.P97.WitnessPacketInterface
  cd lean && lake-build Erdos9796Proof.P97.Cap.PartitionFromMEC
  cd lean && lake-build Erdos9796Proof.P97.SurplusM44Packet
  cd lean && lake-build Erdos9796Proof.P97.N8.FourSubpacket
  cd lean && lake-build Erdos9796Proof.P97.N8.N8bEndpointPair
  cd lean && lake-build Erdos9796Proof.P97.N8.N8kDistribution
  cd lean && lake-build Erdos9796Proof.P97.N9Endpoint.Closure
  ```

  These builds completed successfully.  The N8 distribution build still reports
  pre-existing style warnings in older code.  The `SurplusM44Packet` build was
  re-run successfully after adding the non-surplus `N4c/N4d` assembly layer and
  again after adding the support-cap bridge, indexed endpoint one-hit bounds,
  Moser-apex adjacent side bounds, the indexed core selector, and the general
  indexed form trichotomy.  It was re-run again after adding the short-interior
  pair extraction lemmas and the short-cap selector-shape interface.  The
  current `SurplusM44Packet` build was re-run again after adding the
  Form-row-to-count bridge and the `exists_surplusSelectorNamedSplit_of_form*`
  consumers, and again after adding the indexed cap-side reflection bridge.
  It has no local warning in that file; remaining warning output comes from
  imported older modules.

- Next implementation targets:

  ```text
  0. Continue the active erased-pin containment residual:
       - prove the geometry-to-seeded-shadow adapter for the one-sided erased
         payloads using `SurplusSeededShadow.oneSidedSeedSearchEntries_eq_nil`:
         exact non-surplus cap masks for `.v`/`.w` are now available from
         named opposite interiors and exact-cap containment; the remaining
         local work is to finish the opposite-endpoint private seed masks and
         then feed those masks plus the erased-payload private-centered
         one-sided seed into
         `isValidOneSidedSeedShadow_shadowOfPointClasses_of_mask_interfaces`;
       - right-oriented own-endpoint private seed masks CLOSED by
         `rightOwnPwSeedPrivateMask_of_erasedPayload` and
         `rightOwnPuSeedPrivateMask_of_erasedPayload`;
       - right-oriented opposite-Moser private seed masks CLOSED by
         `rightOppositePwSeedPrivateMask_cases_of_erasedPayload` and
         `rightOppositePuSeedPrivateMask_cases_of_erasedPayload`;
       - left-oriented own/opposite private seed masks CLOSED by
         `leftOwnPwSeedPrivateMask_of_erasedPayload`,
         `leftOwnPuSeedPrivateMask_of_erasedPayload`,
         `leftOppositePwSeedPrivateMask_cases_of_erasedPayload`, and
         `leftOppositePuSeedPrivateMask_cases_of_erasedPayload`;
       - right-oriented own-`Pw` packaging CLOSED by
         `false_of_rightOwnPwErasedPayload_pointClasses_of_seed_interfaces`;
       - right-oriented own-`Pu` packaging CLOSED by
         `false_of_rightOwnPuErasedPayload_pointClasses_of_seed_interfaces`;
       - right-oriented opposite-`Pw`/`Pu` packaging CLOSED by
         `false_of_rightOppositePwErasedPayload_pointClasses_of_seed_interfaces`
         and
         `false_of_rightOppositePuErasedPayload_pointClasses_of_seed_interfaces`;
       - left-oriented own-`Pw`/`Pu` packaging CLOSED by
         `false_of_leftOwnPwErasedPayload_pointClasses_of_seed_interfaces`
         and
         `false_of_leftOwnPuErasedPayload_pointClasses_of_seed_interfaces`;
       - left-oriented opposite-`Pw`/`Pu` packaging CLOSED by
         `false_of_leftOppositePwErasedPayload_pointClasses_of_seed_interfaces`
         and
         `false_of_leftOppositePuErasedPayload_pointClasses_of_seed_interfaces`;
      - pinned candidate-mask assembler CLOSED by
        `isValidPinnedFragment_shadowOfPointClasses_of_candidate_masks`;
      - next, prove candidate-mask membership for the actual ten point
         classes and the remaining Boolean no-three, pair-count/prefix-count,
         and separation/search-separation facts for the induced shadow;
       - for the opposite-Moser-present branch, use the exact-cap-radius
         handoff (`...own_or_exactOpposite`) rather than the weaker raw
         selected-opposite predicate;
       - do not pursue the fully relaxed own-branch finite census as the next
         step unless the exact-cap-centered adapter fails: exact cap centers
         are separate classes and need not share the erased private radius;
       - do not import the N8 own-endpoint adjacent-empty proof blindly: its
         adjacent-circle input comes from exact short-cap placement, while the
         live side here is the surplus cap, so the missing theorem must either
         be a surplus-side geometric argument or the seeded finite-shadow
         bridge;
       - then feed the primitive packet alternatives into the already-planned
         finite selector/certificate row exclusions.
  1. Finish the endpoint certificate route:
       - make the largest endpoint row (`EpQ1008`) build via internal
         certificate sharding;
       - after all 117 Lean certificate facts build, prove the formal
         faithfulness bridge from `EndpointEscapeRightAt` /
         `EndpointEscapeLeftAt` to one certified endpoint pattern.
  2. Continue the pinned surplus COMP-G bridge:
       - close the spine contract
         `Problem97.isM44PinnedSurplusResidualsExcluded`;
       - use the side-specific payload lemmas
         `IsM44.oppIndex1_pinnedRightSurplusResidual_of_right_surplus` and
         `IsM44.oppIndex2_pinnedLeftSurplusResidual_of_left_surplus` as the
         local pinned-family boundary;
       - surplus-interior subpacket selector CLOSED by
         `IsM44.exists_surplusInterior_triple_preserving`;
       - exact selected-class equality CLOSED by
         `pinnedRightSurplusResidual_selectedClass_eq` and
         `pinnedLeftSurplusResidual_selectedClass_eq`;
       - pinned `.v` mask normalization CLOSED in `SurplusM44Packet` and
         `SurplusCOMPGBank`;
       - ten finite-label pairwise distinctness CLOSED by
         `pinnedSurplusTenLabels_pairwise_of_mem`;
       - candidate-mask membership bridge CLOSED by
         `candidateMaskOK_of_mem_candidateMasks` and
         `isValidPinnedFragment_shadowOfPointClasses_of_candidate_masks`;
      - `.v` candidate membership CLOSED from the generated pinned-mask
        equality by `mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf`;
      - `.w` candidate membership CLOSED when the exact second-opposite cap
        mask is supplied by `mem_candidateMasks_w_of_pointMask_eq_secondOppExactCapMask`;
      - one-sided seed private-center candidate membership CLOSED when the
        private mask equality is supplied by
        `mem_candidateMasks_privateCenter_of_pointMask_eq_oneSidedSeed`;
      - exact-mask candidate assemblers CLOSED by
        `isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_candidates`
        and
        `isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_seed_candidates`;
      - right/left residual-level `.v/.w` candidate producers CLOSED by
        `pinnedRightSurplusResidual_exists_candidateMasks_vw` and
        `pinnedLeftSurplusResidual_exists_candidateMasks_vw`;
      - right/left residual-level valid-fragment implications CLOSED by
        `pinnedRightSurplusResidual_exists_validFragment_of_candidate_interfaces`
        and
        `pinnedLeftSurplusResidual_exists_validFragment_of_candidate_interfaces`;
      - residual no-three interface WEAKENED to the generated Boolean
        `noThreeOK ... = true`, removing the previous surplus all-label
        `pointPairClassCount` obligation from the active pinned bridge;
      - to remove Boolean no-three as a separate assumption, first prove a
        count-vector alignment lemma between `shadowPairCountsForAssigned` at
        `fullFragmentSearchAssigned` and `pointPairClassCount` on `labelPairs`;
      - construct the local `SurplusCOMPGBank.Shadow`, prove candidate-mask
        membership for the actual centers not covered by those exact masks and
        the Boolean no-three/prefix/separation facts, then prove
        `fragmentShadowAcceptedBySearch = true`.
  3. Wire the selector-packet interface into the Form `a/b/c` exclusions:
       - connect the named non-surplus interior pairs to the row splitters used
         by the Form `a/b/c` exclusions; this is now closed for the surplus
         selector row itself;
       - use the new Form-row-to-count bridge when the surplus selector row is
         already known to satisfy Form `a/b/c`;
       - translate the short-cap `MoserSelectorShapeAt` and surplus-cap
         `MoserSubpacketSelectorShapeAt` rows into the endpoint closer
         hypotheses.
  4. Prove the corresponding Form `a/b/c` metric exclusions, reusing the
     existing N4d branch closers where their hypotheses are cap-local and do not
     depend on `A.card = 9`.
  5. Build the upstream `(m,4,4)` interface that supplies the selected
     left/right witnesses and the honest full one-hit bounds needed by
     `N8SelectedApex.exists_left_right_primitive_packet_cases`.
     After the count-facing selector wrapper, this should be stated as positive
     adjacent counts plus the corresponding one-hit upper bounds, not as manual
     witness choices.
  6. Close
     `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`:
       - start from `S.NonSurplusMoserCapContainment` plus the threaded
         endpoint and pinned-surplus residual exclusions;
       - use the existing `IsM44` count/placement lemmas
         `IsM44.exists_oppInterior_side_placement_of_moserCapContainment`,
         `IsM44.moserCount_oppIndex1_le_two_of_moserCapContainment`,
         `IsM44.moserCount_oppIndex2_le_two_of_moserCapContainment`,
         `IsM44.sameCapCount_oppIndex1_le_one`, and
         `IsM44.sameCapCount_oppIndex2_le_one`;
       - choose an actual eraser
         `x ∈ S.capInteriorByIndex S.surplusIdx`;
       - exclude `ErasedPinTriple A x p` for the surplus-opposite Moser vertex,
         surviving surplus-cap interior centers, and the two non-surplus
         strict-interior families;
       - let the closed adapters turn those triple-circle exclusions into
         exact-pin exclusions and then erased-set selected-class witnesses for
         every categorized survivor.
  ```

- Current attempt (`2026-07-05`):

  ```text
  Target A:
    Finish the pinned surplus COMP-G shadow constructor.  The closed inputs are
    now pinned residual payload extraction, exact selected-class equality for
    the pinned `.v` class, surplus escape relabelling into a three-point
    `s1/s2/s3` subpacket, orientation into the bank labels
    `{u,w,Pu,Pw}`, finite `.v` mask normalization in `SurplusCOMPGBank`, and
    pairwise geometric distinctness of the ten finite labels.

    Progress (`2026-07-05`): added the hand-written bridge module
    `Erdos9796Proof.P97.SurplusCOMPGBankGeometry`, imported by
    `RemovableVertexAxiom`.  It keeps generated-bank code regenerable and
    proves the first geometric-to-finite payload fact:

      - `SurplusCOMPGBank.pointMask`: finite label mask induced by a geometric
        selected class and a ten-label point map;
      - `SurplusCOMPGBank.rightPinnedLabelPoint`: right-oriented geometric
        interpretation of the bank labels, with `.v = S.oppIndex1`;
      - `SurplusCOMPGBank.rightPinnedLabelPoint_injective_of_mem`: the existing
        `pinnedSurplusTenLabels_pairwise_of_mem` theorem gives an injective
        ten-label model;
      - `SurplusCOMPGBank.pinnedRightSurplusResidual_exists_pinnedPointMask`:
        a right-surplus pinned residual plus a surplus triple containing the
        escape produces a surplus star `sstar` and proves that the geometric
        selected class at `.v` has finite mask `pinnedMaskOf sstar`.
      - `SurplusCOMPGBank.leftPinnedToRightLabel` and
        `SurplusCOMPGBank.leftPinnedLabelPoint`: the mirror orientation is
        reduced to the generated right-oriented bank convention by swapping
        `.v/.w` and the private-pair labels;
      - `SurplusCOMPGBank.pinnedLeftSurplusResidual_exists_pinnedPointMask`:
        the left-surplus mirror residual now proves the same generated `.v`
        pinned mask after relabelling.
      - `SurplusCOMPGBank.shadowOfPointClasses`: constructs a generated
        `SurplusCOMPGBank.Shadow` from ten geometric selected classes;
      - `SurplusCOMPGBank.shadowOfPointClasses_hasTenMasks`: proves the
        generated shadow always satisfies the ten-mask Boolean;
      - `SurplusCOMPGBank.pinnedRightSurplusResidual_exists_pinnedClassOK` and
        `SurplusCOMPGBank.pinnedLeftSurplusResidual_exists_pinnedClassOK`:
        package the right/left residual point-mask facts into
        `pinnedClassOK sstar (shadowOfPointClasses ...) = true`, once the
        `.v` class is identified with the pinned selected class.
      - `SurplusCOMPGBank.classShapeOKAt_shadowOfPointClasses_of_maskCard_not_mem`
        and `SurplusCOMPGBank.classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem`:
        reduce the generated class-shape Boolean to two pointwise finite-mask
        facts for each center: mask cardinality four and false self-bit.
        Normalization is automatic for point masks via
        `SurplusCOMPGBank.maskNormalized_pointMask`.
      - `SurplusCOMPGBank.maskNormalized_pinnedMaskOf_of_isSurplusStar`,
        `SurplusCOMPGBank.maskCard_pinnedMaskOf_of_isSurplusStar`, and
        `SurplusCOMPGBank.maskHas_pinnedMaskOf_v_eq_false_of_isSurplusStar`:
        close the finite pinned-mask normalization/cardinality/no-self facts.
        `SurplusCOMPGBank.classesShapeOK_shadowOfPointClasses_of_pinned_v_and_other_shapes`
        therefore leaves cardinality/no-self inputs only for the nine centers
        other than `.v`.
      - `SurplusCOMPGBank.isValidPinnedFragment_shadowOfPointClasses_of_components`:
        assembles `isSurplusStar`, generated `hasTenMasks`, `classesShapeOK`,
        `pinnedClassOK`, and the remaining component Booleans into the full
        `isValidPinnedFragment` predicate consumed by the generated DFS
        completeness theorem.
      - The generated component Booleans now have compiled mask/prefix
        interfaces in `SurplusCOMPGBankGeometry`:
        `wSqueezeOK_shadowOfPointClasses_of_mask_facts`,
        `oneHitOK_shadowOfPointClasses_of_mask_bounds`,
        `circumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple`,
        `noThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two`,
        `searchPairCountsOK_shadowOfPointClasses_of_prefixes`,
        `separationOK_shadowOfPointClasses_of_sepOKFor`,
        `searchSeparationOK_shadowOfPointClasses_of_crossSeparation`,
        `triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition`, and
        `fragmentTriggersOK_shadowOfPointClasses_of_components`.
      - `SurplusCOMPGBank.isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces`:
        assembles those finite facts directly into
        `isValidPinnedFragment`, so the next geometric proof only has to feed
        one compiled mask/prefix interface.
      - `SurplusCOMPGBank.isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v`:
        strengthens the aggregate interface for pinned residuals by taking the
        `.v` pinned-mask equality as input and discharging the `.v` class-shape
        facts internally.

    This closes the generated shadow constructor, `hasTenMasks`, and the `.v`
    `pinnedClassOK` translation for both surplus-side residual orientations.
    It also gives a compiled mask-level interface for `classesShapeOK`; for
    pinned residuals the `.v` cardinality/no-self facts come from the pinned
    mask equality, and normalization is automatic for every point mask.  The
    remaining center masks still need geometric cardinality/no-self inputs.
    The final Boolean conjunction assembly is closed, and every generated
    component rule has a finite mask/prefix interface.  The aggregate
    mask-interface theorem is also closed.  This does not yet prove the
    geometric facts that supply those interfaces.

  Target B:
    Add or identify the finite completeness step that turns a proved-valid
    pinned fragment into `fragmentShadowAcceptedBySearch = true`.  The generated
    module currently checks emitted-row soundness and row-bank agreement, but it
    does not expose arbitrary-shadow completeness.  Do not replace this by a
    wrapper that assumes `fragmentShadowAcceptedBySearch = true`.

  Target C:
    Prove or source the geometric facts that supply the finite component
    interfaces, starting with the smallest local rule whose facts can be
    obtained from existing cap/placement lemmas.  The current explicit
    obligations are the `wSqueezeOK` mask hits/intersections, the `oneHitOK`
    one-hit bounds, the non-Moser no-three-Moser-hit condition, pair-count and
    separation prefix checks, and the private-trigger/final surplus-star
    one-hit conditions.

  Success criterion:
    A compiled Lean lemma that constructs the local
    `SurplusCOMPGBank.Shadow`, proves the pinned fragment rules, and either
    applies a generated finite completeness theorem or directly proves
    `fragmentShadowAcceptedBySearch = true`; or a documented blocker naming the
    exact missing finite-completeness or geometric rule.

  Previous count-placement search result:
    No existing Lean declaration was found that states the full Q escape
    placement hypothesis for a non-surplus selected apex.  The present formal
    branch data closest to that role is the indexed Form `a/b/c` row predicates.
    The next bridge to try is therefore:

      Form `a/b/c` row predicate at an index
      -> positive left/right adjacent closed-cap counts
      -> `IsM44.exists_surplusSelectorNamedSplit_of_adjacent_counts`

    This does not prove that the Q placement exists; it removes the manual
    count hypotheses once a row predicate is available.

  Outcome:
    The bridge above is now implemented and built in
    `Erdos9796Proof.P97.SurplusM44Packet`:

      `isMoserCapFormAAt_adjacentClosedCounts_pos`
      `isMoserCapFormBAt_adjacentClosedCounts_pos`
      `isMoserCapFormCAt_adjacentClosedCounts_pos`
      `IsM44.exists_surplusSelectorNamedSplit_of_formA`
      `IsM44.exists_surplusSelectorNamedSplit_of_formB`
      `IsM44.exists_surplusSelectorNamedSplit_of_formC`

    Follow-up outcome:
      The upstream placement split itself is now implemented and built in
      `Erdos9796Proof.P97.SurplusM44Packet`:

        `StrictAdjacentEscapeAt`
        `strictAdjacentEscapeAt_of_moserCapFormsAt`
        `containment_or_strictAdjacentEscapeAt_of_moserCapFormsAt`
        `containment_or_strictAdjacentEscapeAt_of_convexIndep`

      Thus a failed short-cap containment branch is no longer an unstructured
      Q placement hypothesis: it is exactly a strict adjacent-cap escape.

    Wiring outcome:
      The no-strict-escape containment interface is now implemented and built:

        `NoStrictAdjacentEscapeAt`
        `NonSurplusNoStrictAdjacentEscape`
        `moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep`
        `IsM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape`

      Therefore the next proof obligation can be stated directly as
      `S.NonSurplusNoStrictAdjacentEscape`; Lean will then produce
      `S.NonSurplusMoserCapContainment`.

    Endpoint-radius wrapper outcome:
      The first route-B no-strict layer is now implemented and built:

        `Problem97.onArcOpposite_of_sameDist_apex_of_mem_mecDisk`
        `EndpointRadiusAt`
        `selectedClass_subset_capByIndex_of_endpointRadius`
        `not_strictAdjacentEscapeAt_of_endpointRadius`
        `noStrictAdjacentEscapeAt_of_endpointRadiusAt`

      Therefore no-strict-adjacent-escape no longer has to be attacked directly.
      It is enough to prove `EndpointRadiusAt` at the two non-surplus short-cap
      indices; the endpoint-radius wrapper then gives
      `NonSurplusNoStrictAdjacentEscape`, and the existing containment wiring
      gives `NonSurplusMoserCapContainment`.

    Endpoint-radius equivalence outcome:
      The containment-to-radius readout is now implemented and built:

        `endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four`
        `endpointRadiusAt_of_moserCapContainmentAt_of_cap_card_eq_four`
        `endpointRadius_or_strictAdjacentEscapeAt_of_convexIndep`
        `endpointRadiusAt_of_noStrictAdjacentEscapeAt_of_convexIndep`
        `endpointRadiusAt_iff_noStrictAdjacentEscapeAt_of_convexIndep`

      This shows that, under convexity and four-point cap cardinality,
      endpoint-radius production and no-strict-adjacent-escape are equivalent at
      the indexed-cap interface.  The equivalence sharpens the blocker; it does
      not remove it.

    Reflection-kernel outcome:
      The reusable same-side two-circle reflection contradiction is implemented
      and built:

        `Problem97.twoCircle_sameSide_reflection_false`

      This matches the kernel-clean private subcase in `../p97-rvol`; the
      remaining no-strict work is now specifically the endpoint escape and
      pinned surplus-family residuals, not the reflection algebra.

    Indexed cap-side bridge outcome:
      The same-side dictionary needed to use that kernel in
      `SurplusCapPacket` is now implemented and built:

        `signedArea2_mul_pos_of_not_mem_capByIndex`
        `twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`

      This ports the rvol `signedArea2_mul_pos_of_not_mem_surplusCap` step to
      arbitrary indexed caps and immediately derives the packet-level private
      reflection contradiction.  It does not prove no-strict escape; the open
      residuals are still endpoint escape and pinned surplus-family cases.

    Endpoint-data outcome:
      The side-specific endpoint residual vocabulary and endpoint-data
      eliminators are now implemented and built:

        `EndpointEscapeRightAt`
        `EndpointEscapeLeftAt`
        `rightEndpointOnFirstRadius_false`
        `leftEndpointOnFirstRadius_false`
        `rightEndpointEscapeData_elim`
        `leftEndpointEscapeData_elim`

      The eliminators close the branch where the shared endpoint is also on the
      first radius by the indexed reflection bridge, and otherwise hand off
      exactly the endpoint residual.  This is downstream of the still-open
      squeeze/placement theorem: `StrictAdjacentEscapeAt` alone does not supply
      the second radius or the shared-endpoint classification.

    Adjacent squeeze bridge outcome:
      The cyclic adjacent-index dictionary and the first strict-escape squeeze
      bridge are now implemented and built:

        `leftAdjacentIndex`
        `rightAdjacentIndex`
        `leftAdjacentInteriorByIndex_eq_capInteriorByIndex`
        `rightAdjacentInteriorByIndex_eq_capInteriorByIndex`
        `leftAdjacentCapByIndex_eq_capByIndex`
        `rightAdjacentCapByIndex_eq_capByIndex`
        `leftAdjacentCapByIndex_rightAdjacentIndex`
        `rightAdjacentCapByIndex_leftAdjacentIndex`
        `oppositeVertexByIndex_leftAdjacentIndex`
        `oppositeVertexByIndex_rightAdjacentIndex`
        `rightOuterVertexByIndex_leftAdjacentIndex`
        `leftOuterVertexByIndex_rightAdjacentIndex`
        `mem_leftAdjacentInteriorByIndex_of_left_strict_escape`
        `mem_rightAdjacentInteriorByIndex_of_right_strict_escape`
        `leftStrictEscape_mem_secondSelectedClass`
        `rightStrictEscape_mem_secondSelectedClass`

      These lemmas use `moserCapCoreSelectorAt` to port the first part of the
      rvol squeeze: if the side-adjacent cap is a four-point cap and the second
      K4 radius is available, then the strict escape point is on the
      side-adjacent K4 circle.  The second selected class's unique-hit
      classification against the original selected cap is handled in the
      side-specific endpoint squeeze step below.

    Side-specific endpoint squeeze outcome:
      The unique-hit/shared-endpoint classification is now implemented for the
      side-adjacent four-point cap case:

        `rightSecondSelectedClass_selectedCap_singleton`
        `leftSecondSelectedClass_selectedCap_singleton`
        `rightPrivateSecondHit_reflection_false`
        `leftPrivateSecondHit_reflection_false`
        `rightStrictEscape_endpointData_elim`
        `leftStrictEscape_endpointData_elim`

      These lemmas close the branch where the escape side is the adjacent cap
      with card four and a second K4 selected-radius/card hypothesis is
      supplied.  The unique hit in the original cap is either private, in which
      case the two-circle reflection lemma contradicts the strict escape, or it
      is the shared endpoint, in which case the branch is exactly the
      side-specific endpoint residual.  This does not close arbitrary
      `StrictAdjacentEscapeAt`; it is the conditional reducer needed for the
      non-surplus "other cap" side of an `(m,4,4)` packet.  The surplus side
      remains part of the pinned-family residual.

    Non-surplus endpoint-to-surplus reduction outcome:
      The side-specific reducer is now instantiated at the two non-surplus
      indices:

        `leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2`
        `rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1`
        `IsM44.leftStrictEscape_oppIndex1_endpointData_elim`
        `IsM44.rightStrictEscape_oppIndex2_endpointData_elim`
        `IsM44.strictAdjacentEscapeAt_oppIndex1_reduces_to_right_surplus`
        `IsM44.strictAdjacentEscapeAt_oppIndex2_reduces_to_left_surplus`

      Under `IsM44`, global `K4`, and convexity, excluding the endpoint
      residual eliminates the other non-surplus adjacent cap side of a strict
      escape at `oppIndex1`/`oppIndex2`.  Therefore any remaining raw strict
      escape at those indices is forced onto the surplus-adjacent side.  This is
      the formal separation between endpoint escape and the pinned surplus-family
      residual.

    Residual assembly outcome:
      The non-surplus containment interface now follows from the endpoint and
      surplus-side residual exclusions:

        `IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals`
        `IsM44.nonSurplusMoserCapContainment_of_endpoint_surplus_residuals`

      Concretely, the remaining hypotheses are endpoint-left at `oppIndex1`,
      endpoint-right at `oppIndex2`, the right surplus-adjacent side at
      `oppIndex1`, and the left surplus-adjacent side at `oppIndex2`.  This is
      the current formal reduction of the Q-facing
      `NonSurplusMoserCapContainment` obligation.

    Remaining blocker:
      Discharge `EndpointEscapeRightAt` / `EndpointEscapeLeftAt` with a
      committed 117-pattern endpoint certificate artifact, and separately prove
      the pinned surplus-family residual.  Endpoint escape work now pushes all
      non-surplus other-cap strict escapes into that two-part split; it does not
      close the surplus-side residual.
  ```

## Remaining Risk

The reduction removes growing incidence bookkeeping.  It does not remove the
need for a metric contradiction for the primitive Q rows, nor does it prove that
non-`IsM44` configurations descend.
