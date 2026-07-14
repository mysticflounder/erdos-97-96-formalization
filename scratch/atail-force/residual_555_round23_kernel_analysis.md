# Round-23 `(5,5,5)` two-center same-side analysis

## Verdict

**PROVEN / EXISTING LEAN METRIC KERNEL.**  The round-23 survivor is
incompatible with its saved strict convex cyclic order.  No new Euclidean or
scalar theorem is needed.  It embeds in the public production theorem

```text
Problem97.twoCircle_sameSide_reflection_false
```

from
`lean/Erdos9796Proof/P97/U2/WitnessReflectionKernel.lean:200`.

The whole obstruction uses four labels and three rows:

```text
(O,D,E,F) = (0,3,4,5),
rows = {0,3,4}.
```

The row equalities say that `D` and `E` are the two common points of a circle
centered at `O` and a circle centered at `F`.  Distinct common points of two
circles lie on opposite sides of the line through their centers.  The saved
cyclic subsequence `O,D,E,F`, however, places both on the same strict side of
the chord `OF`.

**PROVEN / EXACT EMBEDDING, NOT YET ELABORATED AS A CENSUS ADAPTER.**  Every
hypothesis of the existing theorem is supplied below by six support-membership
facts, carrier injectivity, and the saved boundary order.  There is no missing
mathematical antecedent.

**NOT YET IMPLEMENTED.**  The `EqualityCore` wrapper, general-carrier boundary
adapter, round-23 matcher, and CEGAR regression have not been written or
Lean-checked in this analysis lane.  Therefore the saved checkpoint still
reports `formalized_structural_core: null`; that is now a matcher-registration
gap, not evidence that a new metric theorem is needed.

## Pinned checkpoint and sources

- checkpoint:
  `scratch/atail-force/common_system_metric_probe.json`;
- checkpoint SHA-256:
  `861d4a41141a26c0f6a1afb4fefe52156813c6890ad5eb3bc4b3a084d6b30ee9`;
- profile: `(5,5,5)` / `CARD-EQ-12`;
- round: `23`;
- assignment SHA-256:
  `d1c0773c0013f2e241949a3c8abed8025a18bcd02507af284df00df9be4e5971`;
- incidence search nodes: `39`;
- production-kernel source SHA-256:
  `55345ed8d39abbd44ed1a877fee4be45f9eb83441a66b38d73c089595a87e2d0`;
- `EqualityCore.lean` SHA-256:
  `d69d734942d6dfcfd7341a5d84c254f388e7be7be4fccf26926caf47100c4d82`;
- `GeneralCarrierBridge.lean` SHA-256:
  `d932e1904b29130dfe532b92a62733d6f861b6fb14fb661546be571c71a9277e`;
- current matcher source SHA-256:
  `29a2dbd08de7eefc0a3088271dde8ba80025c385f319bf1b0edb464863e1bfe9`.

The five rows are

```text
0:{1,2,3,4}
1:{0,2,6,7}
2:{3,8,9,10}
3:{1,4,5,6}
4:{2,3,5,11}.
```

The saved hull order used by the fixed frame is

```text
(0,9,10,11,1,3,4,5,2,6,7,8).
```

The checkpoint records

```text
formalized_structural_core = null
full_equality_ideal.status = CROSSCHECKED_NONUNIT
full_equality_ideal.verdicts = [NONUNIT, NONUNIT, NONUNIT]
reported_status =
  FOUND_NONUNIT_WITHOUT_FORMALIZED_CORE_REAL_FEASIBILITY_UNDECIDED.
```

A direct call to the current `scan_formalized_core` on these exact rows also
returned `null`.  Inspection of
`scratch/atail-force/common_system_metric_probe.py` confirms that the U2
two-circle same-side kernel is not among the registered matchers.

## Theorem-bank and indexed-search preflight

The required theorem-bank sources were checked before accepting a new
derivation:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The direct finite metric surfaces in those registries do not embed in the
round-23 equality closure.  In particular, the raw row supports do not present
three common points for `TwoCircleCrossing`, and the larger current
six-/seven-point order cores do not match.  That negative result is not the
end of the bank search: the smaller applicable theorem is a current production
U2 kernel rather than a sibling finite-certificate declaration.

Relevant indexed searches included equal-distance two-circle, common-chord,
convex-order, reflection, and exact-name queries.  The exact query

```text
nthdegree docs search --lean "twoCircle_sameSide_reflection_false"
```

returns the current production theorem.  Source inspection confirms the
public statement:

```lean
theorem twoCircle_sameSide_reflection_false
    {q v2 apex y u : ℝ²} {rq rv : ℝ}
    (huq : dist u q = rq) (hyq : dist y q = rq)
    (huv : dist u v2 = rv) (hyv : dist y v2 = rv)
    (hne : u ≠ y)
    (huside : 0 < signedArea2 u q v2 * signedArea2 apex q v2)
    (hyside : 0 < signedArea2 y q v2 * signedArea2 apex q v2) :
    False
```

The theorem is proved through the public midpoint/reflection chain
`twoCircle_midpoint_collinear` and `signedArea2_reflection_neg`.  Its module
records the standard project axiom closure
`{propext, Classical.choice, Quot.sound}`.

## Exact four-point embedding

Set

```text
q    = O = 0,
v2   = F = 5,
u    = D = 3,
y    = E = 4,
apex = D = 3,
rq   = dist D O,
rv   = dist D F.
```

### First circle: row 0

The two support facts

```text
D = 3 ∈ row(0),
E = 4 ∈ row(0)
```

give

```text
dist O D = dist O E,
```

hence, by symmetry of distance,

```text
dist D O = dist E O.
```

These are `huq` and `hyq` with `rq = dist D O`.

### Second circle: rows 3 and 4

The four support facts

```text
E = 4 ∈ row(3),   F = 5 ∈ row(3),
D = 3 ∈ row(4),   F = 5 ∈ row(4)
```

give

```text
dist D E = dist D F,
dist E D = dist E F.
```

Since `dist D E = dist E D`, transitivity gives

```text
dist D F = dist E F.
```

These are `huv` and `hyv` with `rv = dist D F`.

In `EqualityCore.EdgeClosure`, the second equality is exactly the chain

```text
(D,F) = (D,E) = (E,D) = (E,F),
```

using `row`, `flip`, and `trans`.  No off-support or exact-row fact is used.

### Distinct intersections

The strict boundary subsequence has distinct indices for `D` and `E`.
`BoundaryIndexing` and the canonical carrier realization therefore supply

```text
pointOf D ≠ pointOf E.
```

This is `hne`.

### Same-side products from the cyclic order

The four selected labels occur as

```text
O,D,E,F
```

in the saved cyclic order.  With the repository's `signedArea2` convention,
increasing cyclic triples satisfy

```text
signedArea2 O D F < 0,
signedArea2 O E F < 0.
```

Swapping the first two arguments gives

```text
A_D := signedArea2 D O F > 0,
A_E := signedArea2 E O F > 0.
```

Taking `apex = D`, the two side hypotheses are

```text
huside : 0 < A_D * A_D,
hyside : 0 < A_E * A_D.
```

Both follow immediately from `A_D > 0` and `A_E > 0`.  The public theorem now
returns `False`.

This argument is invariant under a global reflection: both signed areas flip,
but their product remains positive.  A generic wrapper should therefore use a
single same-side-product premise rather than duplicate positive and reflected
consumers.

## Why `CROSSCHECKED_NONUNIT` is expected

**PROVEN for the four-point core only.**  The equalities without cyclic order
are realizable.  For example,

```text
O = (0,0),
F = (2,0),
D = (1,1),
E = (1,-1)
```

satisfy

```text
OD² = OE² = 2,
FD² = FE² = 2,
D ≠ E.
```

Here `D` and `E` lie on opposite sides of `OF`, exactly as the reflection
kernel requires.  This does **not** claim a real realization of all five
round-23 exact rows; the checkpoint correctly leaves that larger real
feasibility question undecided.  It does prove that this minimal contradiction
is intrinsically order-sensitive, so an equality-ideal `NONUNIT` result is not
an obstruction to closure.

## General pattern emerging from the census

The reusable statement is cardinality-independent:

> In a strictly convex cyclic carrier, two distinct common points of two
> centered circles cannot both lie in the same open boundary arc between the
> two centers.

Equivalently, for distinct `u,y`, the conjunction

```text
dist u q = dist y q,
dist u v = dist y v,
cyclic order q,u,y,v
```

is impossible.  The metric half is already
`Problem97.twoCircle_sameSide_reflection_false`; only the generic
equality/order packaging is absent.

This is smaller than the bespoke six- and seven-point cores used in earlier
rounds.  It also explains why raw support-intersection searches can miss a
closure: the second shared-circle equality in round 23 is generated
transitively across two rows through the reversed edge `D-E`, rather than
appearing as two identical supports of one row pair.

The matcher should therefore search equality-closure classes, not just row
support intersections.  This theorem has no dependence on `card = 12`; once
registered, it is a genuine `card ≥ 12` (indeed arbitrary finite-cardinality)
cut.

## Minimal production work

1. Add a production module such as
   `P97/Census554/FourPointTwoCircleSameSideCore.lean`, importing
   `Census554.EqualityCore` and `U2.WitnessReflectionKernel`.
2. Define a generic core with labels `q,v,u,y`, `u ≠ y`, and two closure
   witnesses

   ```text
   (u,q) = (y,q),
   (u,v) = (y,v).
   ```

3. Prove one orientation-free consumer taking

   ```text
   0 < signedArea2 u q v * signedArea2 y q v
   ```

   and call `twoCircle_sameSide_reflection_false` with `apex = u`.  The first
   theorem-side product is a positive square; the second is the supplied
   product up to commutativity.
4. Add a `GeneralCarrierBridge` adapter with exactly six membership fields:

   ```text
   u,y ∈ row(q),
   y,v ∈ row(u),
   u,v ∈ row(y),
   ```

   plus the cyclic subsequence `q,u,y,v`.  The round-23 instantiation is
   `(q,u,y,v) = (0,3,4,5)`.
5. Register a monotone matcher that enumerates four distinct cyclic labels and
   tests the two equalities in the transitive, flip-closed distance-edge
   closure.  The accepted round-23 cut should minimize to rows `{0,3,4}`.
6. Add regressions for the exact pinned assignment and digest, the three-row
   minimization, and a negative control with one of the two closure equalities
   removed.

After those gates pass, rerun the CEGAR census.  Round 23 should be reported as
a formalized structural cut, and only its newly exposed successor should be
treated as the next mathematical residual.
