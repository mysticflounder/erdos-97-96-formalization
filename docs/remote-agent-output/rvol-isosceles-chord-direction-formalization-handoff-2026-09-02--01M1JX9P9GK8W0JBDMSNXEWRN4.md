# Lean handoff: isosceles chord directions and integer certificates

## 1. Exact geometric identities

Let `θ(i,j)` be a real lift of the unoriented chord direction for a strictly convex CCW boundary, with `i<j`. For `i<j<k`, convexity supplies

```text
θ(i,j) < θ(i,k) < θ(j,k) < θ(i,j) + π.
```

Equal incident lengths give the following exact identities.

### First apex

If `dist(i,j)=dist(i,k)`, then

```text
2*θ(j,k) = θ(i,j) + θ(i,k) + π.
```

The source audit maps this to `chart_first_isosceles_chord_identity` plus the chord-lift/arc-angle identification.

### Middle apex

If `dist(j,i)=dist(j,k)`, then

```text
2*θ(i,k) = θ(i,j) + θ(j,k).
```

This is the currently missing exported real-lift wrapper. The shortest source derivation uses `two_zsmul_first_chord_turn_eq_pi_add_apex_oangle`, `arcAngle_first_chord_turn`, oriented-angle rewrites, and the principal-branch chord-lift bounds.

### Last apex

If `dist(k,i)=dist(k,j)`, then

```text
θ(i,k) + θ(j,k) = 2*θ(i,j) + π.
```

The source audit maps this to `chart_last_isosceles_chord_identity`.

These identities do not require three equal sides or equal radii across different row centers. They apply to every pair of support points in one selected equal-radius row.

## 2. Recommended declarations

```lean
theorem chordLift_first_isosceles_identity ... :
  2 * θ j k = θ i j + θ i k + Real.pi

theorem chordLift_middle_isosceles_identity ... :
  2 * θ i k = θ i j + θ j k

theorem chordLift_last_isosceles_identity ... :
  θ i k + θ j k = 2 * θ i j + Real.pi
```

The first and last may be thin wrappers around current source declarations. The middle theorem is the only genuinely missing API item.

## 3. Generic certificate consumer

The computational certificates use three strict inequality forms:

```text
order1:   θ(i,j) - θ(i,k) < 0
order2:   θ(i,k) - θ(j,k) < 0
halfturn: θ(j,k) - θ(i,j) < π
```

and the three isosceles equality forms above. A certificate contains:

- nonnegative integer weights on strict inequalities;
- signed integer weights on equalities;
- a checked coefficient-balance identity for every chord variable;
- a strictly negative total right-hand side in units of `π`.

A reusable theorem should state that such a balanced certificate is impossible. Its final proof is finite-sum linear arithmetic; the difficult work is only producing each geometric inequality/equality.

Suggested interface:

```lean
structure ChordDirectionFarkasCertificate (n : Nat) where
  ineqWeight : ChordOrderInequality n → Nat
  eqWeight   : IsoscelesChordEquality n → Int
  balanced   : ...
  rhs_neg    : ... < 0

theorem false_of_chordDirectionFarkasCertificate ... : False
```

For small generated certificates, an alternate implementation can emit a direct `linarith` proof instead of formalizing a general checker.

## 4. Promotion order

1. Export/generalize the first and last chord-lift identities.
2. Add the middle-apex real-lift identity.
3. Prove the generic integer certificate consumer.
4. Add the three-monotone-transition theorem as a small corollary.
5. Promote finite equality-cell certificate banks only after endpoint-hit and owner-order ingress is source-complete.
