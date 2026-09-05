# `cardGeThirteen` exact-13 global-K4 row-domain checkpoint

Date: 2026-09-04

Target context:

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
```

Immediate residual:

```lean
false_of_cardGeThirteenUncoveredThreeCenterPacket
```

## Result

A corrected source-like exact-card-13 tight-cover cell survives the five-row strict-metric relaxation, including all strict triangle and strict Kalmanson inequalities. However, the cell cannot satisfy global K4: at carrier center `9`, every possible four-point selected support is excluded by a cancellation of at most three strict Kalmanson inequalities.

This separates two facts that had previously been conflated:

1. the local tight-cover/four-circle surface is not enough for contradiction;
2. a single omitted global-K4 row can already close a particular surviving cell without nonlinear Euclidean solving.

## Canonical cell

Use the direct DR second-opposite order

```text
[2,8,9,10,11,12,1,3,4,5,0,6,7].
```

Roles and supports:

```text
A2 = 0       A1 = 1       A3 = 2
I2 = {8,9,10,11,12}       I1 = {6,7}

z  = 10
d  = 4
s0 = 3       s1 = 9
b0 = 11      b1 = 10 = z

C0@b0 = {0,2,3,5}
C1@b1 = {1,6,9,12}
K@A2  = {4,7,8,11}
L@A2  = {3,9,10,12}
T@A1  = {2,6,7,10}
```

The exact finite properties checked are:

- `C0`, `C1`, and `K` are pairwise disjoint and partition `Fin 13 \ {z}`;
- `K ∩ L = ∅`;
- `L \ {z}` has traces `1+2` across `C0,C1`;
- `K,L` have the strict-second-cap profile `2+3`;
- `A2 ∈ C0`, `b0 ∈ K`, and `b1=z`;
- `b0,b1` are pairwise distinct and avoid `A1,A2`;
- `T` contains the two required first-opposite interior labels `6,7`;
- sources `s0∈C0` and `s1∈C1` lie outside `T` and are mutually omitted;
- `d∈K` and is omitted by `C0,C1,L`;
- the additional frontier point `8` is also omitted by both source rows;
- each of `C0,C1,K,L,T` is the complete four-point distance class of its displayed center;
- deleting `s0` or `s1` leaves maximum multiplicity three at its displayed blocker;
- deleting any member of `T` leaves maximum multiplicity three at `A1`.

Thus the cell models the local first-apex exact-four residual and the two named good-source blocker failures, in addition to the tight-cover rows.

## Exact metric

```text
  0  63  50  70  46  32  37  46  46  70  70  46  70
 63   0  69  16  21  31  69  69  61  81  69  32  11
 50  69   0  79  58  54  15   6  13  40  63  46  73
 70  16  79   0  26  37  77  78  72  93  82  46  26
 46  21  58  26   0  12  54  56  52  74  64  38  30
 32  31  54  37  12   0  43  51  49  72  71  46  39
 37  69  15  77  54  43   0  10  23  48  69  50  75
 46  69   6  78  56  51  10   0  18  44  66  48  74
 46  61  13  72  52  49  23  18   0  28  52  36  64
 70  81  40  93  74  72  48  44  28   0  69  54  83
 70  69  63  82  64  71  69  66  52  69   0  39  69
 46  32  46  46  38  46  50  48  36  54  39   0  31
 70  11  73  26  30  39  75  74  64  83  69  31   0
```

The verifier checks:

```text
positive off-diagonal distances:       yes
strict triangle inequalities:          858 / 858
minimum triangle slack:                 1
strict Kalmanson inequalities:        1430 / 1430
minimum Kalmanson slack:                1
K/L radii at A2:                       46 and 70
```

This metric is deliberately an abstract metric, not a planar realization. The Cayley–Menger determinant on labels `{1,4,9,11}` is exactly `-141512`, so the cell is not realizable by four points in the Euclidean plane.

## Exact global-K4 obstruction

Global K4 at center `9` would select one of `C(12,4)=495` supports. The verifier quotients distance edges by the five fixed row equalities and searches exact strict-Kalmanson cancellations.

```text
455 supports  — one strict Kalmanson inequality becomes 0 > 0
 32 supports  — two strict inequalities sum to 0 > 0
  8 supports  — three strict inequalities sum to 0 > 0
```

No triangle inequality is used in any of the 495 row-domain certificates. Therefore the exact cell cannot extend to `D.K4 9`, even at the abstract strict-Kalmanson level.

## Formalization consequence

The next exact-card-13 campaign should add all-center K4 rows before sending survivors to planar QF_NRA. The current four/five-row metric relaxation is intentionally too weak.

```text
exact tight-cover source packet
  → Fin 13 label map and boundary order
  → fixed tight-cell row facts
  → arbitrary SelectedFourClass from D.K4 at each unnamed center
  → exact Kalmanson row-domain classifier
  → checked one/two/three-form cancellation bank
  → only remaining cells enter MEC/planar geometry.
```

For the displayed cell, a compact terminal needs only:

```lean
theorem no_selectedFourClass_at_center9_of_cell11558
    (R9 : SelectedFourClass carrier (point 9)) : False
```

followed by the source bridge obtaining `R9` from global K4. This fixed-cell theorem is useful only after the full exact-13 cell classifier proves the occurrence; it should not be wired as an isolated wrapper.

## Claim boundary

This checkpoint does not prove the full exact-card-13 tight branch UNSAT. It proves that a strong local relaxation has an exact integer survivor, that the survivor is nonplanar, and that it is already excluded by one global-K4 row with certificates of length at most three.

The remaining high-value computation is an authenticated all-center row-system census over every source-compatible tight-cover cell.

## Reproduction

Verifier file: `cardge13_exact13_global_k4_row_domain_verifier.py`

Verifier SHA-256:

```text
813afccd7957f1932ac1d18ed3f849879bc0d0cb6201b5e7a8e1d9d48972c232
```

Canonical verified payload SHA-256:

```text
a62333ff77c30f9f76e8052f679f1d390d2d5aff36a4db6b369f8d4e8b9da041
```
