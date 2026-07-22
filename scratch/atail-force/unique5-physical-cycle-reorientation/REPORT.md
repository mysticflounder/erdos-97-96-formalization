# Original unique-five reorientation into the physical omission cycle

Date: 2026-07-22

Status: **REORIENTATION AND PRODUCTION CYCLE CONSTRUCTION ARE KERNEL-CHECKED.
NEITHER EXHAUSTIVE CYCLE ARM CLOSES UNCONDITIONALLY FROM THE CURRENT ORIGINAL
UNIQUE-FIVE RESIDUAL.**

## Checked adapter

`UniqueFivePhysicalCycleReorientation.lean` starts from

```lean
R : OriginalUniqueFiveInteriorResidual F
```

and constructs

```lean
Nonempty (ReorientedUniqueFivePhysicalCycle R)
```

The output retains `R` itself and therefore does not discard minimality,
`noM44`, the original frontier, the fixed critical system, either original
pair, or either double-deletion fact.  Its reoriented packet satisfies

```text
new oppApex1 = original oppApex2
new oppApex2 = original oppApex1
new oppCap1  = original oppCap2
new oppCap2  = original oppCap1
new surplusCap = original surplusCap
```

Consequently the original unique exact-five radius at `S.oppApex1` becomes a
production `LargeCapUniqueFiveSecondApexRadius` at the new physical
`oppApex2`.  The adapter then invokes
`nonempty_physicalActualCriticalOmissionCycle` with the same concrete
`CriticalShellSystem H`.

The output also reaches both existing exhaustive APIs:

- `cycleEdgeSplit`: a mutual-omission cycle edge or reverse membership on
  every edge of the selected cycle;
- `globalRelationSplit`: an arbitrary mutual-omission pair or the global
  all-omissions-reverse-membership relation on all physical vertices.

The global split is stronger for terminal routing because its all-reverse arm
applies to every production transition, not only the vertices occurring in
one normalized cycle.

## Existing direct-False consumer audit

The indexed Lean corpus was searched for the exact cycle outputs before
adding any contradiction theorem.  The relevant production terminal is

```lean
false_of_transitionReverseOutsidePair_coRadial_firstApex
```

from
`LargeCapUniqueFivePhysicalOmissionTransitionGlobal.lean`.  It closes one
global all-reverse transition as soon as the exact two-point reverse residual
is co-radial from the reoriented first apex.

The scratch abbreviation

```lean
OriginalSecondApexCoRadialReversePairOccurrence W T
```

states this missing antecedent in the original orientation:

```lean
∃ q a b,
  a ≠ b ∧
  a ∈ transitionReverseOutsidePair T q ∧
  b ∈ transitionReverseOutsidePair T q ∧
  dist S.oppApex2 a = dist S.oppApex2 b
```

The checked theorem

```lean
ReorientedUniqueFivePhysicalCycle
  .false_of_globalAllReverse_of_coRadialOccurrence
```

proves that the global all-reverse relation plus exactly this occurrence
yields `False` through the existing production terminal.

The original `F.secondApexDouble` and the strict-interior pair's second-apex
double-deletion witness do **not** produce this occurrence.  They provide a
K4 radius class at the original second apex after deleting one named pair;
they do not identify either point of a transition's reverse outside pair with
that class, nor even identify the transition pair with either retained pair.

### Global mutual-omission arm

No existing theorem found in the indexed corpus proves `False` from only

```lean
PhysicalActualCriticalMutualOmissionPair H W.profile
```

and the fields of `OriginalUniqueFiveInteriorResidual`.  The closest checked
route, `SourceTwoHitNormalForm.false_of_firstApex_coRadial`, additionally
requires:

1. an exact-five **closed physical cap** residual, not merely an exact-five
   ambient radius class;
2. a two-physical-hit row producing `SourceTwoHitNormalForm`; and
3. co-radiality of that row's two outside-cap points from the first physical
   apex.

After reorientation the required closed-cap equation would be

```lean
W.packet.oppCap2.card = 5
```

equivalently `S.oppCap1.card = 5`.  The original unique-five residual carries
no such equation: its exact-five assertion is about
`SelectedClass D.A S.oppApex1 radius`, not the cap cardinality.  Even adding
the cap equation would still leave the two-hit and co-radial producers.

Thus the mutual arm has no direct-False consumer under the present contract.
It should not be hidden behind a new nonterminal production adapter.

## Exact remaining producer boundary

On the global all-reverse arm, the first missing terminal field is precisely

```lean
∃ T : PhysicalActualCriticalOmissionTransition H W.profile,
  OriginalSecondApexCoRadialReversePairOccurrence W T
```

The all-reverse relation then supplies the reverse memberships for that `T`,
and the checked consumer closes immediately.

On the mutual arm, the current theorem bank has no comparably small terminal
antecedent derivable from the retained fields.  A valid next theorem must
either prove the mutual pair directly impossible while consuming the retained
minimality/`noM44`/double-deletion data, or genuinely produce all three extra
inputs of the exact-cap/two-hit/co-radial route above.

## Epistemic status

- **PROVEN / KERNEL-CHECKED:** packet role transport, production exact-five
  profile, production omission cycle, both exhaustive relation splits, and
  the all-reverse consumer map.
- **SOURCE-GROUNDED NEGATIVE AUDIT:** the two original second-apex
  double-deletion facts do not identify a transition reverse outside pair.
- **OPEN:** production of the co-radial reverse outside pair and a terminal
  for the global mutual-omission arm.
- **NOT CLAIMED:** closure of `OriginalUniqueFiveInteriorResidual`, closure of
  a production `sorry`, or a new countermodel.

## Validation

From `lean/`:

```bash
BASE=$(lake env printenv LEAN_PATH)
lake env env \
  LEAN_PATH="../scratch/atail-force/unique5-physical-cycle-reorientation:\
../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
../scratch/atail-force/blocker-distinct-radius:$BASE" \
  lean -M 8192 -s 16384 -DwarningAsError=true \
  -R ../scratch/atail-force/unique5-physical-cycle-reorientation \
  ../scratch/atail-force/unique5-physical-cycle-reorientation/\
UniqueFivePhysicalCycleReorientation.lean
```

All printed declarations depend only on `propext`, `Classical.choice`, and
`Quot.sound`; no `sorryAx` or custom axiom appears.
