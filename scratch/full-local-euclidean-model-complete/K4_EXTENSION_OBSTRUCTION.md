# Finite K4-extension obstruction

## Result

Let `A₀` be the exact rational 15-point carrier checked by
`check_model.py`.  If a finite planar carrier `B` contains `A₀` and has
`HasNEquidistantProperty 4 B`, then

```text
6 ≤ (B \ A₀).card.
```

Thus the complete local witness has no all-center K4 extension obtained by
adding at most five vertices.  Convexity is not needed for this obstruction,
so the same conclusion holds a fortiori for convex-independent
supercarriers.

This is a finite extension lower bound, not a proof that no larger K4
extension exists.

## Exact premise on the rational model

At the following twelve old centers every positive-radius distance class
inside `A₀` is a singleton:

```text
e f a u b v j k l i g h
```

The remaining three centers are exactly the centers carrying the four
designated local classes:

```text
O c d
```

The singleton assertion is checked over exact rational squared distances by
`check_model.py`; `check_k4_extension_bound.py` independently extracts the
same twelve centers and checks the final binomial arithmetic.

## Injection proof

Write `N = B \ A₀`.  Fix one of the twelve distance-generic old centers `q`.
K4 on `B` supplies a positive-radius class `Cq` with at least four points.
Since `Cq ∩ A₀` has at most one point, `Cq ∩ N` has at least three points.
Choose a three-element subset

```text
Tq ⊆ Cq ∩ N.
```

The map `q ↦ Tq` is injective.  Indeed, if distinct old centers `q₁,q₂`
had the same triple `{x,y,z}`, both centers would be equidistant from the
three pairwise-distinct points `x,y,z`.  The existing proved theorem

```text
Problem97.eq_of_dist_eq_three_of_pairwise_ne
```

in `lean/Erdos9796Proof/P97/N4d/SmallSReductions.lean` then gives
`q₁ = q₂`, a contradiction.

Consequently

```text
12 ≤ Nat.choose N.card 3.
```

But `Nat.choose 5 3 = 10`, and `Nat.choose m 3` is monotone in `m`, so
`N.card ≥ 6`.

## Proposed Lean producer and terminal

The reusable producer should be stated independently of this coordinate
model.

```lean
theorem genericCenters_inject_threeSubsets_new
    {A B G : Finset ℝ²}
    (hAB : A ⊆ B)
    (hG : G ⊆ A)
    (hgeneric :
      ∀ q ∈ G, ∀ r : ℝ, 0 < r →
        (A.filter fun x ↦ dist q x = r).card ≤ 1)
    (hK4 : HasNEquidistantProperty 4 B) :
    G.card ≤ Nat.choose (B \ A).card 3
```

The model-specific terminal is:

```lean
theorem fullLocalModel_six_le_card_sdiff_of_K4
    {B : Finset ℝ²}
    (hA₀B : fullLocalModelCarrier ⊆ B)
    (hK4 : HasNEquidistantProperty 4 B) :
    6 ≤ (B \ fullLocalModelCarrier).card
```

For the live route, the first producer is the generic-centers injection, and
the first terminal is the six-new-vertices lower bound.  A
`CriticalShellSystem` audit is downstream: it is only forced from K4 after
the relevant no-removable/minimality hypothesis, whereas this obstruction
already applies at the raw all-center K4 layer.
