# Oriented large-physical-radius ingress audit

Date: 2026-07-17

Status: **EXHAUSTIVE PARENT CLASSIFICATION KERNEL-CHECKED. THE LARGE-RADIUS
INGRESS IS NOT UNCONDITIONAL. ONE FRONTIER-COUPLED TWO-EXACT-FOUR-RADII
COMPLEMENT REMAINS OPEN. NO PRODUCTION `sorry` IS CLOSED.**

## Question

The production `RobustLargeRadiusParentSurface` needs:

```text
6 <= S.oppCap2.card
exists radius > 0,
  5 <= (SelectedClass D.A S.oppApex2 radius).card.
```

The current U1 leaf supplies the concrete packet `leafSurplusPacket`, global
K4, cardinal minimality, one common `CriticalShellSystem`, no-`IsM44`, and the
full convex/MEC cap surface, but it does not state either ingress field.

This audit asks whether those fields follow outright, or whether their
complement already routes to the protected unique-radius or common-deletion
consumers.

## Result

`OrientedLargePhysicalRadiusIngress.lean` proves the exhaustive theorem:

```text
classify_largeRadiusParent
```

For the exact current leaf packet, the specialization is:

```text
currentU1Leaf_largeRadiusParentOutcome
```

It returns exactly one of five cases.

1. **Original first cap has cardinality four or five.**

   The result includes a concrete `CriticalPairFrontier`, positive radius,
   and ambient class cardinality at least four. These are exactly the inputs
   of the checked theorem
   `firstApexSplit_unique_of_small_opposite_cap`, hence this routes to the
   protected original `FA-UNIQ4/FA-UNIQ5` arm.

2. **Physical second cap has cardinality four or five.**

   This is exactly the input of the checked fixed-surplus reorientation
   `secondSmallCap_reorients_to_swappedUnique`, hence it routes to protected
   swapped `FA-UNIQ4` or `FA-UNIQ5`.

3. **The physical second apex has a critical deletion.**

   The classifier strengthens this to an actual
   `CriticalSelectedFourClass` with the prescribed deletion blocked. These
   are exactly the inputs of
   `secondApexCritical_reorients_to_firstApexUniqueFour`, hence this routes to
   protected swapped `FA-UNIQ4`.

4. **Large physical radius.**

   Both non-surplus caps have cardinality at least six, the carrier has
   cardinality at least fourteen, and there is a positive radius class of
   cardinality at least five at `S.oppApex2`. Together with the leaf's
   `hmin` and `hNoM44`, the theorem directly constructs the production
   `RobustLargeRadiusParentSurface`. This branch therefore feeds the existing
   common-deletion/frontier-coupled-exact-five reduction without any further
   ingress theorem.

5. **Two exact four-point physical-apex radii.**

   This is the sole remaining complement. The checked residual retains:

   ```text
   6 <= S.oppCap1.card
   6 <= S.oppCap2.card
   14 <= D.A.card
   FullyDeletionRobustAt D S.oppApex2
   radius != otherRadius
   card (SelectedClass ... radius) = 4
   card (SelectedClass ... otherRadius) = 4
   two selected four-rows with disjoint supports
   D.Minimal
   no IsM44 packet
   one concrete CriticalShellSystem H
   one first-apex CriticalPairFrontier indexed by the same H.
   ```

   The parent wrapper is
   `FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual`.

Thus the old `U1LeafLargePhysicalRadiusIngress` is too strong as an
unconditional bridge. The cap-orientation issue is completely resolved; the
only missing ingress content is the coupled two-exact-four-radii case.

## Why the complement is not already closed

The checked robust-second-apex work confirms that two disjoint exact
four-point radii are compatible with the local cap-capacity bounds once the
opposite cap has six points. The robust minimal-deletion reduction sends this
surface to collision, multi-core, or installed-singleton endpoints, but none
is currently terminal. In particular:

- full deletion robustness is not itself a common-deletion packet;
- the two disjoint physical rows do not identify a second actual center;
- the shell-curvature adapter reaches two shells only in the later
  multi-core arm, and its angle-chart/cross-cap consumer remains open; and
- the finite critical-map shadow is SAT on the represented local surface.

Therefore no checked theorem currently routes constructor 5 to an existing
common-deletion or protected unique-radius consumer.

## First missing producer

The next theorem must consume the **frontier-coupled** residual, not the bare
two-row marginal. A sound target is:

```text
frontierCoupledExactTwoFourRadii_commonDeletion_or_protected
  (R : FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual D S H) :
    Nonempty (CommonDeletionParentResidual H)
    or protected original/swapped FA-UNIQ4/FA-UNIQ5.
```

Equivalently, a direct `False` theorem on the same full residual is sufficient.
Any proposed producer must visibly use at least one field absent from the SAT
marginal abstraction: global minimality, the shared critical map, the actual
first-apex frontier/source rows, convex/MEC cap order, or no-`IsM44`.

Do not target a theorem on only two abstract disjoint selected four-classes;
that statement is overstrong and the existing local capacity audit already
shows why it cannot close the branch.

## Bank and indexed-corpus preflight

Checked before formalizing:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for a five-point physical
  apex radius, two disjoint exact-four radii, prescribed deletion at a Moser
  apex, and common-deletion routing.

No banked theorem consumes the full constructor-5 surface. The useful hits
were the current production large-radius reduction and the already-checked
scratch small-cap, reciprocal-swap, robust-radius, and minimal-deletion
adapters used in the routing audit above.

## Validation

Focused scratch compile from `lean/`:

```text
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/oriented-large-physical-radius-ingress/\
    OrientedLargePhysicalRadiusIngress.lean
```

Result: exit 0. Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.
