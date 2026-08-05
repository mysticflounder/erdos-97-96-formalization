# Common-radius geometry call-site audit (2026-08-05)

Target checked theorem:
`FrontierLiveClosure.lean:10216-10296`
`equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair`.

## The reusable call pattern

Both call sites first normalize the physical apex to the indexed cap apex:

```lean
have hcenter : S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]
```

For each carrier source `x`, the source-radius fact and the source witness's
strict-cap fact are combined into exactly the theorem's indexed input:

```lean
have hxIndexed :
    x.1 ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
      S.capInteriorByIndex S.oppIndex1 := by
  simpa only [← hcenter] using
    Finset.mem_inter.mpr ⟨hxRadius, hx.2.1⟩
```

The same construction is made for `y`; the witness fields used are only
`x.2.1`/`y.2.1` (strict-cap interior membership), while `x.2` and `y.2`
provide the `D.A` proofs required by `H.centerAt`.

The equal-blocker hypothesis is converted from subtype vertices to their
underlying centers by:

```lean
have hcentersEq : H.centerAt x.1 x.2 = H.centerAt y.1 y.2 := by
  simpa [CriticalShellSystem.blockerVertex] using
    congrArg Subtype.val hblockersEq
```

The complete source-clean call is then:

```lean
have hgeometry :=
  equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
    x.2 y.2 hxIndexed hyIndexed hxy hcentersEq
    (by simpa only [← hcenter] using T.oppApex1_rich)
    (isUniqueFourCenter_centerAt H x.1 x.2)
```

Its output is the two-field packet

```lean
H.centerAt x.1 x.2 ∈ S.capInteriorByIndex S.oppIndex1
∧ (H.selectedAt x.1 x.2).toCriticalFourShell.support ∩
    S.capByIndex S.oppIndex1 = {x.1, y.1}
```

The first field is the common blocker interior witness; the second is the
exact two-point shell/cap intersection.  No additional metric argument is
needed at the call site.

## Call site 1: first-fiber common-radius branch

`FrontierLiveClosure.lean:15414-15480`, inside
`false_of_twoCapSources_firstFiber`, invokes the theorem at `:15469-15473`.
Inputs are `source source'`, their common-radius memberships, their two
`FirstFiberCapSourceWitness` values, distinctness, and equal actual blockers.
After obtaining `hgeometry`, it immediately feeds the second component to
`allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq`
(`:11216-11225`, called at `:15475-15477`).  The final residual constructor is

```lean
.sameBlockerAllEndpointOmission Q source source' hsourcesNe
  hsourceRadius hsourceRadius' hsource hsource' hmutual
  hblockersEq hallEndpointOmission hgeometry.1 hgeometry.2
```

Thus the smallest complete packet for this route is:

* `Q : FreshOutsideFirstBlockerFiber P Pρ`;
* two distinct carrier sources;
* common-radius membership for both;
* two `FirstFiberCapSourceWitness` values;
* mutual cross-membership and equal blocker vertices;
* `hgeometry.1` (common blocker in strict cap) and `hgeometry.2` (exact shell
  intersection), with the latter also yielding all-four endpoint omission.

The source-clean producer for the first two source witnesses is private
`exists_two_firstFiberCapSourceWitness_of_commonRadius`
(`:11051-11078`).  It requires only

* `hcap : 8 ≤ (S.capByIndex S.oppIndex1).card`;
* `hcommonCard : 2 ≤ (SelectedClass ... commonRadius ∩ capInterior).card`;
* `commonRadius ≠ radius` and `commonRadius ≠ ρ`.

It delegates to
`exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals_of_commonRadius`
and wraps each survival packet with
`firstFiberCapSourceWitness_of_crossPairSurvivals` (`:10980-10999`).

## Call site 2: second-radius collision branch

`FrontierLiveClosure.lean:18027-18178`, inside
`false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`,
invokes the theorem at `:18174-18177` for `u,v`.  Here `hu`/`hv` already are
intersections of the ρ-radius class with the strict cap, so the indexed facts
are just `simpa only [← hcenter]` rewrites of `Finset.mem_inter` projections.
The call uses the same `T.oppApex1_rich` and unique-four-center hypotheses.
It returns

```lean
⟨huBlockerNe, hgeometry⟩
```

where `huBlockerNe` is the separately proved
`H.centerAt u huA ≠ H.centerAt P.source₁ ...`, and `hgeometry` supplies the
same blocker-interior/exact-shell pair.  The packet is then consumed by the
cross-omission rectangle (`:18179-18205`) and later six-interior/cross-blocker
case split; it does not construct `FreshThirdBlockerFiber`.

## Recommendation for the new common-radius adapter

Reuse the first call-site shape verbatim.  The adapter should expose, for
source points `x,y`, the six assumptions needed to invoke the theorem:

```lean
x.2 : x.1 ∈ D.A          y.2 : y.1 ∈ D.A
hxRadius                  hyRadius
hx.2.1                    hy.2.1       -- strict-cap interiors
x.1 ≠ y.1                 hblockersEq
```

plus `T.oppApex1_rich` and
`isUniqueFourCenter_centerAt H x.1 x.2`.  The adapter's result should retain
both components of `hgeometry`; erasing the exact shell/cap equality loses the
only input accepted by `allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq`
and by the `sameBlockerAllEndpointOmission` constructor.  In particular,
`FreshThirdBlockerFiber` alone cannot be coerced to this packet: it lacks
common-radius membership, the fixed first-fiber witness fields, and the
source-row mutual incidence used at `:15474-15480`.
