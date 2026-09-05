# `cardGeThirteen`: Fin-13 I₂ chart defect and repair checkpoint

Date: 2026-09-04

Affected source:

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
  DRExactThirteenValuation.lean
```

## 1. Confirmed defect

The current declaration is:

```lean
def secondOppositeInterior : Profile → Finset (Fin 13)
| .secondOpposite => Finset.Ico 8 13
| .surplus        => Finset.Ico 9 13
| .firstOpposite  => Finset.Ico 9 13
```

In the type `Fin 13`, the numeral `13` reduces modulo 13 to `0`. Therefore all
three half-open intervals are empty.

The intended sets, as witnessed by `directOrder`, `mirrorOrder`, and
`HasStrictProfile`, are:

```text
.secondOpposite : {8,9,10,11,12}   card 5
.surplus        : {9,10,11,12}     card 4
.firstOpposite  : {9,10,11,12}     card 4.
```

A non-wrapping repair is:

```lean
def secondOppositeInterior : Profile → Finset (Fin 13)
| .secondOpposite => Finset.Icc 8 12
| .surplus        => Finset.Icc 9 12
| .firstOpposite  => Finset.Icc 9 12
```

An explicit finite literal or a `univ.filter` definition is also acceptable.

## 2. Why this is proof-relevant

Under the current definition:

- `directIndex_secondOpposite_order` is true only vacuously;
- `mirrorIndex_secondOpposite_order` is true only vacuously;
- `LabelMap.secondOppositeInterior_mem` carries no actual memberships;
- any theorem that treats raw labels `8..12` or `9..12` as source-certified
  second-opposite-interior points is not justified by the current Lean object.

The exact-card-13 fixed-cell certificates remain valid source-neutral
strict-Kalmanson theorems. What is blocked is their promotion from
`ExactThirteenBranchIngress.LabelMap` to a source-faithful finite cell.

## 3. Required regression surface

The repair should pin at least:

```lean
theorem secondOppositeInterior_card :
  (secondOppositeInterior p).card =
    match p with
    | .secondOpposite => 5
    | .surplus => 4
    | .firstOpposite => 4

theorem nine_mem_secondOppositeInterior :
  (9 : Fin 13) ∈ secondOppositeInterior p

theorem eight_mem_secondOppositeInterior_iff :
  (8 : Fin 13) ∈ secondOppositeInterior p ↔ p = .secondOpposite

theorem twelve_mem_secondOppositeInterior :
  (12 : Fin 13) ∈ secondOppositeInterior p
```

It should also recheck:

- direct and mirror order lemmas for every actual member;
- every direct/mirror `LabelMap` constructor;
- the finite profile boundary-block constructors;
- all source-localization transports using
  `LabelMap.secondOppositeInterior_mem`;
- exact-card-13 K4 ingress modules that select positional labels from I₂.

No compatibility alias should preserve the empty semantics.

## 4. Post-repair profile collapse in the uncovered large arm

The `cardGeThirteen` uncovered branch originates in the large-interior side:

```text
5 ≤
  ((firstRow.support ∩ S.oppInterior2) ∪
   (secondRow.support ∩ S.oppInterior2)).card.
```

This union is a subset of `S.oppInterior2`. The exact-thirteen profile gives:

```text
.secondOpposite : S.oppInterior2.card = 5
.surplus        : S.oppInterior2.card = 4
.firstOpposite  : S.oppInterior2.card = 4.
```

Hence the large arm forces:

```text
profile = .secondOpposite.
```

After repair, the exact-tight classifier therefore needs only the direct and
mirror orders of `.secondOpposite`, not all six profile/orientation cells.

The raw source labels are then:

```text
A2 = 0
A1 = 1
A3 = 2
IS = {3,4,5}
I1 = {6,7}
I2 = {8,9,10,11,12}.
```

## 5. Source deductions expected after repair

With the newly provenance-preserving exact-tight outcome, outer two-radius
data, and the repaired `LabelMap`, the following should be derived rather than
assumed by the finite classifier.

### Tight three-row partition

For:

```text
C0 = W.row₁.support
C1 = W.row₂.support
K  = thirdRow.support
```

retain:

```text
PairwiseDisjoint C0 C1 K
D.A = insert z ((C0 ∪ C1) ∪ K)
D.A.card = 13.
```

### Opposite A₂ class

Let `L` be the named outer A₂ row opposite `K`, using `thirdRow_named`.
Then:

```text
z ∈ L
Disjoint K L.
```

With `hnoFive`, both `K` and `L` are their complete A₂ selected classes.

### I₂ profile

Each A₂ class contributes at least two strict I₂ points. Their classes are
disjoint and the large arm covers a five-point I₂ block. Thus:

```text
{|K ∩ I2|, |L ∩ I2|} = {2,3}
(K ∩ I2) ∪ (L ∩ I2) = I2.
```

### Fourth-row trace

Since `L.erase z` has cardinality three, is disjoint from `K`, and the tight
cover partitions the other twelve points:

```text
L.erase z ⊆ C0 ∪ C1.
```

Distinct-center circle intersection bounds give each trace cardinality at most
two, hence:

```text
(|L ∩ C0|, |L ∩ C1|) = (1,2) or (2,1),
```

after accounting for `z ∉ C0 ∪ C1`.

### First-apex class

The exact first-apex four-class `T` contains the two residual interior points
`R.interior_q` and `R.interior_w`. Since `I1={6,7}` and both source and finite
sets have cardinality two, the label map should identify those two physical
points with raw labels `6,7`, up to swapping. Therefore:

```text
{6,7} ⊆ T.
```

The other two labels of `T` remain finite choices.

### Frontier deletion

`W.deleted` is a carrier point omitted from `C0` and `C1`. The exact tight
cover therefore yields:

```text
W.deleted = z ∨ W.deleted ∈ K.
```

This relation is a theorem of the tight packet; it should not be an additional
finite-cell assumption.

## 6. Computational claim boundary

The current fixed-cell certificates and exact controls used the intended I₂
sets and remain valid as source-neutral finite mathematics. They should not be
wired to the live theorem until:

1. the I₂ definition is repaired;
2. every `LabelMap` constructor proves the nonvacuous memberships;
3. the profile collapse to `.secondOpposite` is formalized;
4. the tight source packet exposes the deductions in §5;
5. a finite completeness theorem maps every such packet to a checked
   global-K4 terminal or a preserved survivor.

This follows the project audit's central rule: fixed-cardinality certificates
are theorem-discovery tools until a source-complete occurrence map is proved.
