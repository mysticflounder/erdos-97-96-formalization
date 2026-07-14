# Five-row equilateral-hinge kernels

## Kernel result

`FivePointHingeCycle.lean` proves one shared orientation-free normalization
and all four collision contracts found by the exact five-row synthesis:

```text
normalized_equilateralHinge_coordinates
normSim_equilateralHinge_coordinates
five_point_hinge_cycle_collision
six_point_hinge_tail_collision
six_point_hinge_double_spoke_collision
seven_point_hinge_closed_tail_collision
```

Every public endpoint has axiom closure exactly

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, custom axiom, `native_decide`, or trusted solver call.
The nonlinear `grobner` steps construct ordinary Lean proof terms checked by
the kernel.

## Shared normalization

For anchors `A != B`, if

```text
AB = AH
BA = BH,
```

then the normalizing similarity `normSim A B` sends `H` to a point satisfying

```text
H.x = 1/2
H.y^2 = 3/4.
```

No orientation is selected.  Each tail proof uses only these two coordinate
identities, squares its remaining metric equalities, and derives a polynomial
contradiction.

## Exact fixed-core consumption maps

The input is
`scratch/atail-force/second_center_query/multi_order_unit_core_clusters.json`.
The following maps show that every theorem hypothesis is supplied by one of
the five four-point rows.  Supports not named below are unused.

### Shard 2, core 0

Consumed by `six_point_hinge_tail_collision` with

```text
(A,B,C,D,H,T) = (0,1,2,3,5,9)

center 0, support {1,3,4,5}: AB = AD = AH
center 1, support {0,2,5,6}: BA = BC = BH
center 2, support {0,3,8,9}: CA = CD = CT
center 3, support {1,5,9,10}: DB = DH = DT
center 5, support {2,6,7,9}: HC = HT
```

This is the nine-equality, six-role theorem.

### Shard 3, core 0

Consumed by `five_point_hinge_cycle_collision` with

```text
(A,B,C,D,H) = (0,1,2,3,5)

center 0, support {1,3,4,5}: AB = AD = AH
center 1, support {0,2,5,6}: BA = BC = BH
center 2, support {0,3,8,9}: CA = CD
center 3, support {1,5,7,8}: DB = DH
center 5, support {2,3,6,11}: HC = HD
```

This is the seven-equality, five-role theorem.

### Shard 3, core 1

Consumed by `six_point_hinge_double_spoke_collision` with

```text
(A,B,C,L,H,R) = (0,1,2,4,5,6)

center 0, support {1,3,4,5}: AB = AL = AH
center 1, support {0,2,5,6}: BA = BC = BH = BR
center 4, support {1,2,9,10}: LB = LC
center 5, support {2,3,6,11}: HC = HR
center 6, support {0,2,4,10}: RA = RC = RL
```

This is the second nine-equality, six-role theorem.

### Shard 6, core 0

Consumed by `seven_point_hinge_closed_tail_collision` with

```text
(A,B,L,M,H,R,T) = (0,1,3,4,5,6,7)

center 0, support {1,3,4,5}: AB = AL = AM = AH
center 1, support {0,2,5,6}: BA = BH = BR
center 3, support {1,5,7,11}: LB = LH = LT
center 5, support {4,6,7,9}: HM = HR = HT
center 7, support {0,4,6,11}: TA = TM = TR
```

This is the eleven-equality, seven-role theorem.

## Validation

From the Lake root `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/five-row-hinge-kernels/FivePointHingeCycle.lean
```

The complete check succeeds.  This direct invocation is deliberate because
the module is an isolated unimported scratch file.

## Scope

The collision statements themselves are uniform Euclidean theorems; their
proofs no longer trust the finite search or CAS run that discovered them.
However, the four row-to-role maps above apply to four fixed card-12 shadows.
They do not prove that the live K-A-PAIR hypotheses produce any one of those
row networks.  Consequently these files close four metric consumers, no live
producer, and no named on-spine `sorry` by themselves.
