# `noM44` versus the robust second-apex radius normal form

Date: 2026-07-17

Status: **SOURCE-GROUNDED NEGATIVE AUDIT. `R.noM44` DOES NOT CURRENTLY
ELIMINATE EITHER LARGE-CAP ROBUST RADIUS ARM. EVERY EXISTING `IsM44`
CONSTRUCTOR NEEDS A NEW MEC-BOUNDARY MOSER TRIANGLE AND A CAP TRIPLE WITH TWO
EXACT FOUR-CAPS. THE ROBUST RADIUS DATA SUPPLIES NEITHER MEC-BOUNDARY
MEMBERSHIP NOR EXACT CAP COUNTS. REINDEXING THE DISPLAYED TRIANGLE CANNOT
HELP, BECAUSE ALL THREE OF ITS CAPS HAVE CARDINALITY AT LEAST FIVE. NO NAMED
CROSS-ROW PAIR IS FORCED. NO PRODUCTION `sorry` IS CLOSED.**

## Scope

This audit targets the true live endpoint, not the already-consumed
card-at-least-fourteen survival cover.  Its inputs are schematically

```lean
R : FrontierCommonDeletionParentResidual F
B : FrontierBiApexRobustResidual R
L : FrontierLargeOppositeCapsBiApexRobustResidual B
```

with

```lean
R.noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
B.secondApex_robust : FullyDeletionRobustAt D S.oppApex2
L.firstOppCap_card_ge_six : 6 ≤ S.oppCap1.card
L.secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card.
```

`L` is the exact live source draft in
`../large-opposite-caps-biapex-surface/LargeOppositeCapsBiApexSurface.lean`.
The robust-radius normal form is the checked scratch result in
`../robust-second-apex-geometry/RobustSecondApexGeometry.lean`.

This lane writes only this report.  It did not edit or build production Lean,
`surplusM44`, `ShellCurvature`, card-five work, FA-UNIQ work, or shared docs.
No Lean or Lake command was run.

## Required theorem-bank preflight

Before assessing a new packet or row producer, the audit checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered:

- `FullyDeletionRobustAt` at the physical second apex together with
  no-`IsM44`;
- five-point physical-apex radius classes;
- two support-disjoint exact four-classes at one Moser apex;
- alternative Moser triangles and cap triples; and
- the orientation-free `IsM44` packet constructors.

The closest reusable declarations are:

- `isM44Packet_of_capTriple_two_exact_of_card_gt_nine`;
- `MEC.exists_capTriple_of_circumscribed`;
- `MEC.nonempty_surplusCapPacket_of_K4`;
- `exists_secondLargeCap_of_noM44`;
- `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two`;
- `oppositeVertex_distinct_K4_radii_force_cap_card_ge_six`; and
- `CapSelectedRowCounting.outsidePair_unique_capCenter`.

None turns a robust physical-apex radius class into a new cap triple with two
exact four-caps, or into a selected actual-blocker row through a prescribed
pair.  The archived U5 and general-n declarations remain contradiction
consumers after named row incidences have been supplied.

## Exact meaning of `noM44`

The current definition is

```lean
def SurplusCapPacket.IsM44 (T : SurplusCapPacket D.A) : Prop :=
  T.oppCap1.card = 4 ∧ T.oppCap2.card = 4
```

and `SurplusCapPacket` itself contains all of the following data:

1. a `MEC.NonObtuseCircumscribedMoserTriangle` on the whole carrier;
2. a witness that its underlying MEC dichotomy is in the circumscribed
   branch;
3. a `CapTriple` over the structural projection of that triangle; and
4. a designated cap of cardinality greater than four.

Consequently `R.noM44` is not a prohibition on selected radius rows, blocker
fibers, deletion-survival covers, or arbitrary triangles.  It can fire only
after constructing a second full same-carrier packet `T` whose two opposite
closed caps are proved to have cardinality exactly four.

The orientation-free endpoint

```lean
isM44Packet_of_capTriple_two_exact_of_card_gt_nine
```

confirms the exact missing input.  It accepts a concrete
`MEC.NonObtuseCircumscribedMoserTriangle`, its circumscribed witness, a
compatible `CapTriple`, and the assertion that two of that triple's caps are
exact four-caps.  It does no geometry that would manufacture those data from
radius classes.

## Why the displayed packet cannot be repurposed

For the displayed packet `S`, the three closed caps already satisfy

```text
surplusCap.card >= 5
oppCap1.card   >= 6
oppCap2.card   >= 6.
```

Thus no choice of surplus designation and no permutation of the same support
triangle can make the other two caps exact four-caps.  At exact carrier card
fourteen, `SurplusCapPacket.capSum` sharpens the profile to `(5,6,6)` up to
permutation; at larger cardinality the same lower-bound obstruction remains.

The only current source constructions that change the ordering of an
existing support triangle are the private `swap23NonObtuse`,
`swap13NonObtuse`, and `swap12NonObtuse` family in
`U2NonSurplusOneHit.lean`, together with their permuted cap triples.  Their
definitions literally permute `S.partition.C1`, `C2`, and `C3`; they do not
change the cap-cardinality multiset.  Hence none can produce the witness
forbidden by `R.noM44` on `L`.

A successful `noM44` proof must therefore construct a **genuinely different
MEC-boundary triple**, not merely reorient the current one.

## Audit of the two robust-radius arms

The checked theorem

```lean
fullyDeletionRobustAt_secondApex_radiusClassification
```

splits `B.secondApex_robust` into the following alternatives.

### 1. One radius class has cardinality at least five

The arm retains

```lean
∃ radius, 0 < radius ∧
  5 ≤ (SelectedClass D.A S.oppApex2 radius).card.
```

The existing Moser-cap one-hit theorems place enough members in the closed or
strict opposite cap to explain why the cap must be large.  They do not show
that any class member lies on the minimum-enclosing-circle boundary.  They
also do not turn three class members into a non-obtuse circumscribed Moser
triangle or compute the cap sizes for the triangle that would result.

The equality `dist S.oppApex2 x = radius` is a circle centered at a carrier
Moser vertex.  It is unrelated in the current interface to the predicate

```lean
dist x (MEC.mec D.A D.nonempty).center =
  (MEC.mec D.A D.nonempty).radius
```

required of a new Moser-triangle vertex.  Confusing these two circles would
be an invalid bridge.

### 2. Two distinct K4 radii with disjoint exact rows

The arm retains two positive radii, two selected four-classes centered at
`S.oppApex2`, and disjoint supports.  The production/scratch cap theorem

```lean
oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
```

uses precisely this information to prove that the displayed opposite cap has
cardinality at least six.  This is the opposite direction from an `IsM44`
witness: it explains the live large cap rather than creating two exact
four-caps for another cap triple.

Again, no support point is known to lie on the MEC boundary.  Even adding
MEC-boundary membership for three support points would still leave two
substantial obligations: non-obtuseness/circumscribed compatibility of the
chosen triple and exact cardinality four for two of its boundary-chain caps.

Therefore neither robust-radius constructor supplies even the first field of
an alternative `SurplusCapPacket` constructor that depends on the selected
row points.

## Why generic packet existence does not bridge the gap

`MEC.nonempty_surplusCapPacket_of_K4` can construct some same-carrier surplus
packet from global K4, convexity, and cardinality.  Equivalently,
`MEC.exists_capTriple_of_circumscribed` chooses some non-obtuse MEC-boundary
triple and builds its cap triple.

Those existential choices are independent of the robust radius supports.
They provide no theorem that two resulting cap sizes are four.  Applying
`R.noM44` to the chosen packet only says it is not `IsM44`; the standard
consequence is another large cap, as expressed by
`exists_secondLargeCap_of_noM44`.  On `L`, additional large-cap information
is already present and is not contradictory.

Thus the combination

```text
generic packet existence + R.noM44
```

does not select a useful alternative packet.  It merely reproduces the
large-cap regime.

## No cross-row producer follows from `noM44`

The robust rows are physical-apex rows.  A named cross-row pair would require
some source `s` and distinct physical-row members `x,y` with

```lean
x ∈ (H.selectedAt s hs).toCriticalFourShell.support
y ∈ (H.selectedAt s hs).toCriticalFourShell.support.
```

Then `S.oppApex2` and the actual blocker `H.centerAt s hs` would both bisect
the pair.  Existing cap-localization and outside-pair consumers could begin
from such positive memberships.

`R.noM44` is only the negation of existence of a geometry-rich cap packet.
No current classifier has the contrapositive shape

```text
absence of a prescribed cross-row pair
  -> existence of an alternative IsM44 packet.
```

Nor does either robust-radius arm mention `H.selectedAt`.  Hence applying
`noM44` cannot directly produce the positive support memberships required by
`CapSelectedRowCounting.outsidePair_unique_capCenter`, the third-center
common-pair terminal, or the U5 bank.

This is not merely an import or packaging gap: a proof of the displayed
contrapositive would itself be the missing global geometric coupling.

## Exact theorem that would make the route work

The honest `noM44` bridge must expose the genuinely new geometry rather than
hide it behind `False`.  For either robust-radius constructor `C`, it would
have to prove a statement of the following shape:

```lean
theorem exists_alternative_twoExactCapTriple_of_robustSecondApex
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (C : SecondApexDeletionRobustRadiusClassification D S) :
    ∃ (MT : MEC.NonObtuseCircumscribedMoserTriangle
          D.A D.nonempty S.hncol)
      (hCirc : ∃ h12 h23 h13,
        MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
      (CP : CapTriple D.A
        (MT.toMoserTriangle.toStructural hCirc)),
      (CP.C1.card = 4 ∧ CP.C2.card = 4) ∨
      (CP.C1.card = 4 ∧ CP.C3.card = 4) ∨
      (CP.C2.card = 4 ∧ CP.C3.card = 4)
```

After that theorem,
`isM44Packet_of_capTriple_two_exact_of_card_gt_nine` and `R.noM44` would
close the branch routinely.

No current theorem supplies any of the load-bearing relationship between
`C`'s radius supports and the new `MT`/`CP`.  As currently stated, this target
is therefore not a simplification of the direct parent contradiction; it is
a precise description of the same missing global geometry.

The alternative cross-row route needs an equally explicit theorem relating a
named pair from `C` to one actual critical row.  `noM44` supplies no part of
that relation.

## Recommendation

Do not make `R.noM44` the primary consumer of the robust second-apex normal
form unless a new theorem first connects physical-apex radius supports to a
different MEC-boundary triple and proves two exact cap counts.  The current
source surface gives no sign of such a connection, and all same-triangle
reindexings are ruled out immediately by the three large cap bounds.

Keep `R.noM44` in the parent because it remains globally valid and may become
useful after a future alternative-triangle construction.  For present
closure work, the live missing ingredient remains a source-indexed cross-row
or another direct geometric coupling of the robust radius arm, not additional
packet packaging.

## Epistemic status

- **PROVEN IN CURRENT SOURCE/CHECKED SCRATCH:** the exact definitions and
  constructor requirements cited above; the robust radius classification;
  the cap-at-least-six consequence; the same-triangle permutation behavior;
  and the cap-strengthened carrier lower bound.
- **SOURCE-GROUNDED NEGATIVE AUDIT:** no registered or current declaration
  connects either robust-radius arm to an alternative two-exact-cap triple or
  to a named actual-blocker cross row.
- **NOT CLAIMED:** consistency of the complete `L` hypotheses; impossibility
  of every future `noM44` argument; or a counterexample to the intended parent
  theorem.
- **OPEN:** the displayed alternative-triple theorem and every direct
  large-cap robust-radius contradiction.
- **NOT RUN:** Lean/Lake build, axiom audit, production edits, shared-doc
  edits, or proof-blueprint mutation.
