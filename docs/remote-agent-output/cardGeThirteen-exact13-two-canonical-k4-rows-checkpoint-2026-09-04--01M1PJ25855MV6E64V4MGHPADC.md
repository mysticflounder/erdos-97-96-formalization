# `cardGeThirteen`: two canonical global-K4 rows cannot coexist

Date: 2026-09-04

## Exact fixed-cell result

For the direct DR order

```text
[2,8,9,10,11,12,1,3,4,5,0,6,7],
```

fix only four source rows:

```text
C0@6 = {0,1,4,9}
K@0  = {2,8,10,11}
C1@7 = {3,5,6,12}
T@1  = {0,6,7,8}.
```

Then no selected four-row can exist simultaneously at:

```text
center 2 = the canonical surplus apex A3,
center 5 = a canonical surplus-interior label.
```

The proof uses strict Kalmanson only.

## Row-domain reductions

At center `2`, 18 one-form pair no-goods reduce all 495 supports to exactly 27:

```text
{7,a,b,c},
a ∈ {1,4,9},
b ∈ {3,5,12},
c ∈ {8,10,11}.
```

At center `5`, 27 one/two-form pair no-goods reduce all 495 supports to 16 explicit supports.

Every one of the remaining

```text
27 × 16 = 432
```

support pairs is contradicted by at most three Kalmanson forms:

```text
144 pairs: one form
176 pairs: two forms
112 pairs: three forms
```

There are 63 unique cancellation tuples. No triangle inequality or nonlinear geometry is used.

## Significance

The previous shared-pair checkpoint selected three additional global rows and then challenged one center. This theorem needs none of those choices. The tight-cover rows plus the first-apex row already make two source-canonical K4 obligations incompatible.

A live source adapter for this fixed DR cell needs only:

1. identification of `C0`, `K`, `C1`, and `T` with the four displayed raw supports;
2. `D.K4` at the carrier points represented by raw labels `2` and `5`;
3. direct/mirror cell coverage.

## Lean architecture

```lean
center2_support_domain :
  arbitrary four-support at 2 → one of 27 supports

center5_support_domain :
  arbitrary four-support at 5 → one of 16 supports

false_of_center2_center5_normal_supports :
  one of 27 → one of 16 → False
```

The first two are pair-bank dispatchers. The final theorem can use an ordinary kernel classifier over 432 pairs or a 63-entry data table feeding the existing weighted-Kalmanson endpoint.

This is still a fixed-cell theorem until finite source coverage is proved.

## Verification

```text
center-2 candidate supports: 495
center-2 normal supports:      27
center-5 candidate supports: 495
center-5 normal supports:      16
joint normal pairs:           432
unique cancellation tuples:    63
```

Standalone exact verifier SHA-256:

```text
3e83d41122beb4b16799356ec701bd7c7c8850e22c0d587ed78fe607128edd10
```

Canonical payload SHA-256:

```text
c00b213fbcce3737b39e68f16e168e3d1e14a9900d4d3e62ec45d7911ae1f77c
```