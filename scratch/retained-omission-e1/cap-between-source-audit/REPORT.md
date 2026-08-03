# Cap-between source audit for the retained-omission E1 core

Date: 2026-08-01

## Scope and trust boundary

This is a read-only source audit of
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6914-6926`).  No Lean,
Lake, solver, generator, proof-blueprint verification, or axiom gate was run.
Accordingly, the conclusions below establish source-level applicability and the
first absent hypotheses; they do not certify a newly written theorem or current
kernel closure.  The active core remains a load-bearing `sorry` at line 6926.

## Result

`CGN.index_strictly_between_of_equidistant` does **not** close either
constructor of `RetainedOmissionAllLargeNormalForm`.

It does, however, yield a strictly stronger and useful intermediate in the
`reverseHitFreshCommonDeletion` constructor: the reverse blocker lies strictly
between the retained points in the ordered first cap.  The
`pairedCommonDeletion` constructor cannot even supply a same-cap equidistant
triple for the new theorem.

## The new theorem and import reachability

The exact declaration is
`Problem97.CGN.index_strictly_between_of_equidistant` at
`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:49-68`:

```lean
theorem CGN.index_strictly_between_of_equidistant
    {A : Finset ℝ²} {m : ℕ} {L : OrderedCap m}
    (Packet : MecCapPacket A L)
    (Hside : MinorCapSideHypotheses Packet)
    (Hord : StrictCapOrder A L)
    {j r s : Fin m}
    (hrs : r < s) (hjr : j ≠ r) (hjs : j ≠ s)
    (heq : dist (L.points j) (L.points r) =
      dist (L.points j) (L.points s)) :
    r < j ∧ j < s
```

The target file reaches it transitively and unambiguously:

- `FrontierLiveClosure.lean:24` imports
  `ATail.TwoCenterCapLocalization`;
- `ATail/TwoCenterCapLocalization.lean:7` imports
  `P97.CapSelectedRowCounting`.

For the cap-order packet, use
`SurplusCapPacket.capByIndex_cgn4g_strictCapBlockData` at
`SurplusM44Packet/Shard01.lean:761-793`, instantiated with `D.convex`
(`CounterexampleData.convex`, `U1TwoShortCapReduction.lean:83-93`) and
`S.oppIndex1`.  Its result is
`Nonempty (CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex1))`.
The packet fields `L`, `Packet`, `Hside`, and `Hord` are at
`CGN/CGN4g.lean:78-94`; `exists_index_of_mem_cap` is at lines 118-125,
and `posSide_of_between_index` is at lines 135-148.  Point-index uniqueness is
provided by `OrderedCap.injective` (`CGN/CGN.lean:26-31`).

## Constructor 1: `pairedCommonDeletion`

The constructor is at `FrontierLiveClosure.lean:6768-6776`.  Its data are:

- an `OrientedRetainedCommonDeletion O`;
- `O.kept` is absent from the exact critical shell centered at the blocker of
  `O.deleted` (`reverse_omission`);
- a `CommonDeletionTwoCenterPacket` after deleting `O.kept`.

The oriented record (`RetainedMatchingLargeCapConsumer.lean:203-223`) puts
`O.kept` and `O.deleted` in both the first-cap interior (lines 216-217) and the
same selected class centered at `S.oppApex1` (lines 214-215).  Thus it proves

```lean
dist S.oppApex1 O.kept = dist S.oppApex1 O.deleted
```

by `mem_selectedClass` (`WitnessPacketInterface.lean:60-65`).  But this cannot
instantiate the new theorem: `S.oppApex1` is the vertex opposite
`S.capByIndex S.oppIndex1`, hence is not a member of that cap.  The relevant
definitions are `oppApex1` (`U1TwoShortCapReduction.lean:294-302`),
`oppIndex1` (`Cap/PartitionFromMEC.lean:520-525`), `capByIndex`
(`Cap/PartitionFromMEC.lean:465-471`), and `oppositeVertexByIndex`
(`SurplusM44Packet/Shard01.lean:1012-1018`); the three exact exclusion fields
are `CapTriple.v1_notin_C1`, `.v2_notin_C2`, and `.v3_notin_C3`
(`Cap/Structure.lean:172-189`).  A finite case split gives

```lean
S.oppApex1 ∉ S.capByIndex S.oppIndex1.
```

Trying the reverse blocker as `j` also fails earlier.  The deleted point is in
its shell (`CriticalFourShell.q_mem_support`,
`U1CarrierInjection.lean:542-556`), while `reverse_omission` says the kept point
is not.  Since the support is the exact positive-radius filter
(`CriticalFourShell.support_eq`, lines 550-552), the constructor does not
provide—and in fact its omission data excludes at that shell radius—the needed
equality between blocker-to-kept and blocker-to-deleted distances.  It also
does not locate this blocker in the first cap.

`CommonDeletionTwoCenterPacket` does not repair either gap.  Its exact fields at
`ATail/CommonDeletionTwoCenter.lean:29-46` record ambient membership, distinct
centers, two deletion-survival rows, blocker avoidance, row cardinalities, and
an overlap bound; they do not say that the deleted point is equidistant from
the two centers or locate either arbitrary center in this cap.

**First missing premise:** a point `c` in
`S.capByIndex S.oppIndex1`, distinct from `O.kept` and `O.deleted`, satisfying

```lean
dist c O.kept = dist c O.deleted.
```

The only equality already present uses `c = S.oppApex1`, for which the cap
membership premise is false.  Therefore this constructor yields no cap-between
intermediate from the new theorem.

## Constructor 2: `reverseHitFreshCommonDeletion`

This constructor is at `FrontierLiveClosure.lean:6777-6800`.  Let

```lean
c := H.centerAt O.deleted O.deleted_mem_A
K := (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell
C := S.capByIndex S.oppIndex1.
```

It supplies all premises needed for the cap-between theorem:

1. `O.kept ∈ C` and `O.deleted ∈ C` follow from the oriented record's interior
   fields (`RetainedMatchingLargeCapConsumer.lean:216-217`) and
   `capInteriorByIndex_subset_capByIndex`
   (`SurplusM44Packet/Shard01.lean:343-359`).
2. `c ∈ C` follows from `reverseBlocker_mem_capInterior`
   (`FrontierLiveClosure.lean:6782-6784`) and the same subset theorem.
3. `dist c O.kept = dist c O.deleted` follows from `reverse_mem`
   (lines 6779-6781), `K.q_mem_support`, and
   `CriticalFourShell.support_eq_radius`
   (`U1CarrierInjection.lean:569-576`).
4. `c` is distinct from both retained points by
   `CriticalFourShell.center_not_mem_support`
   (`U1CarrierInjection.lean:584-595`), since both are in `K.support`.
5. `O.kept ≠ O.deleted` is `O.sources_ne`
   (`RetainedMatchingLargeCapConsumer.lean:213`).

After obtaining cap indices `ik`, `ic`, `id` from
`StrictCapBlockData.exists_index_of_mem_cap`, injectivity supplies their
pairwise inequalities.  Splitting the order of `ik` and `id`, applying
`index_strictly_between_of_equidistant` (with endpoints swapped in the reverse
order), gives the following source-derivable intermediate:

```lean
∃ ik ic id : Fin B.m,
  B.L.points ik = O.kept ∧
  B.L.points ic = c ∧
  B.L.points id = O.deleted ∧
  ((ik < ic ∧ ic < id) ∨ (id < ic ∧ ic < ik))
```

Equivalently, `B.posSide_of_between_index` gives the corresponding positive
side statement in whichever endpoint orientation is increasing.
`reverseShell_inter_cap_eq` and the fresh point/packet are not needed for this
intermediate.

There is still no contradiction.  Neither this constructor nor
`TriApexAllLargeContext` supplies an incompatible order or side fact.
`TriApexAllLargeContext` contains only cap lower bounds, apex-rich radius-class
data, a global center-count inequality, and the no-three-apex-cover condition
(`FrontierLiveClosure.lean:6831-6845`).

**First missing premise after the new intermediate:** in the orientation
`ik < id`, an incompatible localization such as

```lean
ic ≤ ik ∨ id ≤ ic
```

or, geometrically and equivalently for the available strict-cap interface,

```lean
signedArea2 O.kept O.deleted c ≤ 0.
```

The current inputs prove the opposite strict sign.  No field states that the
reverse blocker is outside the open retained subchord, on its nonpositive
side, or at an endpoint.  Producing one of those facts is the first genuinely
missing bridge if this cap-between route is to close the constructor.

## Theorem-bank check

The mandated registries were searched before deriving the local result:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The registry explicitly warns that the old `RVOL.P97.CGN.CGN4gExt`
`StrictCapBlockData` surface is stale because those declarations already exist
canonically (`docs/general-n-certificate-bank-mining-2026-07-09.md:444-450`).
The relevant canonical current declarations are therefore the ones cited
above, not the stale extension.

The closest archived contradiction kernels are
`Problem97.three_common_equidistant_centers_eq`
(`certificates/erdos97_legacy_general_n_mining.json:3049-3061`) and
`Problem97.C5D3B.eq_of_equidistant_three_noncollinear`
(`certificates/p97_rvol_general_n_mining.json:123847-123873`).  Both need three
noncollinear common equidistant points for two centers; neither constructor
supplies that shape.  The registry's current equality-closure families likewise
start from duplicate centers over three points or stronger five/six-point
motifs (`docs/general-n-certificate-bank-mining-2026-07-09.md:656-678`).

One indexed Lean-corpus search for equidistant/between declarations returned
the current `index_strictly_between_of_equidistant` and its side/order helpers,
but no theorem providing the missing incompatible side premise.  No bank theorem
therefore closes either constructor from the present inputs.

## Bottom line

- `pairedCommonDeletion`: no application; first missing premise is a
  **same-cap** equidistant center.  The apparent center `oppApex1` is provably
  outside that cap.
- `reverseHitFreshCommonDeletion`: application succeeds source-theoretically
  and yields the strict blocker-between-retained-points intermediate; the first
  missing closure premise is an **opposite order/side localization** for that
  blocker.
- The target remains open and no kernel/trust status changed in this audit.
