# Rigid221 S0 full-L1 prerequisite: exact cap semantics

**Date:** 2026-08-29
**Lane:** `rigid221-s0-cap-semantics-pc-20260829`
**Run:** `cap-pc-v1`
**Base HEAD:** `55687ab3e1d47a0f8a5a3646031faf912e28ac80`
**Status:** SOURCE-EXACT POSITIVE/NEGATIVE CONTROLS COMPLETE

## Purpose and boundary

This wave implements the exact cap predicates needed before the coupled
two-row search can make an L1 claim. It is a predicate conformance test, not an
L1/S0 satisfiability run, a counterexample, a Lean proof, or a promotion
artifact.

The preceding twelve-role row computation is retained only as
`SAT_12_ROLE_POSITIVE_CONTROL_EXACT`. It cannot be upgraded by this wave
unless a later run combines cap semantics with a closed ambient carrier, legal
incidence cells, both selected rows, and every other active L1 obligation.

## Source-exact predicate map

1. `signedArea2(v,vj,vk)` is the exact determinant
   `(vj.x-v.x)(vk.y-v.y) - (vk.x-v.x)(vj.y-v.y)`.
2. `OnArcOpposite(vi,vj,vk,x)` is exactly
   `signedArea2(x,vj,vk) * signedArea2(vi,vj,vk) ≤ 0`.
   Equality is included; there is no circle or cyclic-order premise in the
   definition.
3. A structural `MoserTriangle A` supplies three carrier members and pairwise
   distinctness, but does not by itself exclude collinearity.
4. A `CapTriple A M` has `Ci ⊆ A`, the cyclic endpoint membership pattern,
   exactly one cap for every non-Moser carrier point, and three global
   membership equivalences with `OnArcOpposite`. Therefore each cap must be
   derived by filtering the closed carrier, never supplied by hand.
5. `capInteriorByIndex` is endpoint erasure from the selected closed cap, not
   a separately defined open half-plane.
6. `oppIndex2` rotates with `surplusIdx`:

   | `surplusIdx` | `oppIndex2` | apex | interior |
   |---:|---:|---|---|
   | 0 | 2 | `v3` | `C3 \ {v1,v2}` |
   | 1 | 0 | `v1` | `C1 \ {v2,v3}` |
   | 2 | 1 | `v2` | `C2 \ {v3,v1}` |

7. A source `SurplusCapPacket` also needs a genuine Moser/MEC entitlement.
   For exact external replay, the certificate will provide center `m` and
   `R²>0`, prove every carrier point lies in the closed disk, put all three
   Moser vertices on its boundary, and check the three non-obtuse dot-product
   inequalities.
8. Source convex independence is the order-free condition that no carrier
   point lies in the convex hull of the others. A strict all-edge orientation
   certificate is accepted only when the order is injective and its image is
   exactly the closed carrier.

Primary source definitions are in:

- `lean/Erdos9796Proof/P97/Foundation.lean`;
- `lean/Erdos9796Proof/P97/Cap/Structure.lean`;
- `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean`;
- `lean/Erdos9796Proof/P97/Moser/Triangle.lean`;
- `lean/Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean`; and
- `lean/Erdos9796Proof/P97/ConvexCyclicOrder/Construct.lean`.

## First executable fixture

The first exact positive control is a rational twelve-point unit-circle
fixture:

```text
v1=(0,-1), v2=(1,0), v3=(-1,0)
upper:       (±4/5,3/5), (±3/5,4/5), (0,1)
lower-right: (4/5,-3/5), (3/5,-4/5)
lower-left:  (-4/5,-3/5), (-3/5,-4/5)
surplusIdx=0
```

Expected exact caps are

```text
|C1|=7, |C2|=4, |C3|=4
oppIndex2=2
J=C3\{v1,v2}={the two lower-right points}.
```

The checker must also validate the unit-disk MEC certificate, the non-obtuse
Moser triangle, exact carrier closure, and convex independence.

## Required negative controls

- replacing `≤ 0` by `< 0` loses required endpoints;
- hard-coding cap index 1 for the second opposite cap selects the wrong side;
- failing to erase endpoints gives an interior of cardinality four, not two;
- collinear distinct Moser vertices make the reference determinant zero and
  must be rejected;
- a carrier point in the central triangle yields zero cap memberships;
- a carrier point in a corner region yields two cap memberships;
- an outside-of-carrier point passing the sign test must not enter a cap;
- moving a carrier point into the convex hull must fail convex independence;
- three adjacent unit-circle Moser vertices may pass boundary/cap checks but
  must fail the non-obtuse Moser certificate.

## Source-legal L1 incidence cells

The later coupled-row run must not inherit the positive control's global
pairwise-distinctness assumption. With

```text
Ku={u,xu,au,bu}, Kv={v,xv,av,bv},
C={u,xu,delta,v,xv},
```

the five physical roles are distinct, each row has four distinct support
points, every auxiliary is outside `C`, each center is outside its own
support, `cu∉C`, and `cu≠cv`. The deletion obstruction also rules out
`cu=O` and `cv=O`: deleting the relevant source would otherwise leave the
other four physical-class points equidistant from that center.

The source still permits all of the following:

- zero, one, or two shared auxiliary points between `Ku` and `Kv`;
- `cu=av`, `cu=bv`, or neither;
- `cv=u`, `cv=xu`, `cv=delta`, `cv=au`, `cv=bu`, or none;
- the physical center `O` to coincide with an auxiliary point; and
- either center to lie in the opposite row when not excluded above.

The two-circle overlap theorem gives `|Ku∩Kv|≤2`; because the physical traces
are disjoint, the overlap cells are exactly `M0`, `M1`, and `M2` shared
auxiliaries. Arbitrary swaps within each auxiliary pair identify the two
perfect-match presentations of `M2`. No row swap or dihedral quotient is used.
`O`--auxiliary equalities remain solver-visible inside those cells rather
than being silently forbidden.

Thus the minimal full-L1 partition is

```text
(S0-I or S0-N)
× (M0, M1, or M2)
× legal cu placement
× legal cv placement,
```

with every returned model additionally classified by any `O`--auxiliary
equalities. The later `q,w,other` roles belong to L2, not this L1 partition.

## Verdict vocabulary

```text
CAP_SEMANTICS_POSITIVE_CONTROL_EXACT
UNKNOWN
ENCODING_BLOCKED
```

The positive verdict means only that the external predicates and controls
match the stated source definitions on the fixture. It carries
`full_L1_claim=false`, `s0_claim=false`, `source_binding_claim=false`, and
`promotion_claim=false`.

## Accepted result

The governed run returned

```text
CAP_SEMANTICS_POSITIVE_CONTROL_EXACT
```

with exact cap sizes `(7,4,4)`, interiors of cardinalities `(5,2,2)`,
`surplusIdx=0`, `oppIndex2=2`, and the expected lower-right two-point `J`.
All twelve carrier points have exact squared distance one from the supplied MEC
center. The three Moser dot products are `(0,2,2)`, all 120 edge/nonincident
orientations are positive, and the minimum signed area is `2/25`.

All eleven diagnostic controls pass. An independent exact `Fraction`
implementation reproduced every cap, interior, membership count, disk
equality, dot product, and orientation margin. Strict serialized replay passes,
and an independent repeat is byte-identical. The focused suite has 29 passing
tests; Ruff lint and format checks pass.

The accepted artifact is

```text
scratch/runs/rigid221-s0-cap-semantics-pc-20260829/cap-pc-v1/
  artifacts/accepted-primary/cap_semantics_result.json
SHA-256:
  931ea6bf7f1f782038f89ac7b922d244a475f14214d12e22cf3b75106b6512e4
```

Runtime was 0.062 seconds real / 0.043 seconds user CPU / 0.014 seconds
system. The checker records Git HEAD as informational metadata and pins its
own script SHA-256 for replay; unrelated future commits do not invalidate
unchanged predicate bytes.

The source declaration ledger was audited and pins the actual names
`Problem97.signedArea2`, `Problem97.OnArcOpposite`,
`Problem97.MoserTriangle`, `Problem97.CapTriple`,
`Problem97.SurplusCapPacket.capInteriorByIndex`,
`Problem97.SurplusCapPacket.oppIndex2`, and
`Problem97.MEC.NonObtuseCircumscribedMoserTriangle`.

This completes the predicate-conformance prerequisite only. The next run must
apply it to the coupled-row carrier across the source-legal incidence partition
above before either L1 S0 cell can receive a satisfiability verdict.
