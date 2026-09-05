# `cardGeThirteen`: A3 three-block global-K4 compression

Date: 2026-09-04

This sharpens the exact-card-13 shared-pair/global-K4 checkpoint.

## The compression

For the fixed source-like direct DR cell, challenge global K4 at the canonical surplus apex `A3=2`. The twelve possible non-center support points partition into three four-point blocks:

```text
Q0 = {0,1,3,6}
Q1 = {4,5,7,8}
Q2 = {9,10,11,12}.
```

Every pair inside each block is incompatible with the seven fixed row equalities and strict Kalmanson:

```text
6 pairs in Q0
6 pairs in Q1
6 pairs in Q2
----------------
18 pair certificates.
```

Of these, 10 use one strict Kalmanson inequality and 8 use two. No triangle inequality is used.

Any four-point support chosen from twelve endpoints contains at least two points in one of the three blocks. Therefore every selected four-row at center `2` contains one of the 18 forbidden pairs, giving `False`.

This replaces the earlier transparent classifier over all 495 supports by:

1. one three-block pigeonhole lemma;
2. an 18-entry pair certificate bank;
3. one dispatch from the resulting block and pair.

The exact verifier checks all 18 cancellations and all 495 instances of the pigeonhole conclusion.

## Lean-oriented theorem shape

```lean
structure A3ThreeBlockPairCertificate ... where
  pair : Finset (Fin 13)
  pair_card : pair.card = 2
  pair_subset_block :
    pair ⊆ Q0 ∨ pair ⊆ Q1 ∨ pair ⊆ Q2
  pair_subset_support : pair ⊆ R.support

theorem four_support_contains_A3_forbidden_pair
    (R : Center2FourSupportRow boundary support) :
    ∃ pair, A3ThreeBlockPairCertificate ... pair

theorem false_of_A3_threeBlock_fourSupportRow
    (fixed : FixedSevenRows boundary)
    (R : Center2FourSupportRow boundary support) : False
```

The first theorem is pure `Finset` arithmetic. The second dispatches the 18 pair cases to the existing weighted-Kalmanson cancellation endpoint.

This remains a fixed-cell terminal. It becomes relevant to the live `cardGeThirteen` branch only after a complete source classifier proves this cell or a symmetry-equivalent one.

## Verification summary

```text
candidate supports checked: 495
forbidden block pairs:       18
one-form pair certificates:  10
two-form pair certificates:  8
```

Verifier SHA-256:

```text
5184941b962167f5fbebeba13618b40e7439efbdb02139781322fab2b3e87502
```

Canonical payload SHA-256:

```text
94a182afee13966a355cd0effa5eb57deeca3250b4168bb228d3f6e86a59a9cd
```