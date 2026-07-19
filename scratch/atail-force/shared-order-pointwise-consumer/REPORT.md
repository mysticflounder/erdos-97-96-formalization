# Shared-order pointwise Kalmanson consumer

Date: 2026-07-17

Status: **PROVEN ON PAPER.  BOTH ORIENTATION BRANCHES REDUCE TO ONE LOCAL
FOUR-POINT LEMMA.  NO GLOBAL `phi` INJECTIVITY OR CCW FIELD IS NEEDED.  THE
ONLY MISSING LEAN API IS A POINTWISE FORM OF AN ALREADY-PROVED
CONVEX-HULL/LINE EXTREME-PAIR LEMMA.  NO PRODUCTION THEOREM OR `sorry` IS
CLOSED.**

This lane owns only
`scratch/atail-force/shared-order-pointwise-consumer/`.  It did not edit
production Lean, shared documents, blueprint state, `ShellCurvature`,
`SurplusM44`, card-five work, or protected census files.  No Lean or Lake
command was run.

## Required preflight

The audit checked the theorem-bank registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered strict cap order, subchord side
classification, proper diagonal crossing, strict Kalmanson inequalities, and
outside-pair overlap.  The load-bearing existing results are:

- `CGN.StrictCapOrder.subchord_open_side_iff_A`;
- `CGN.StrictCapBlockData.posSide_of_between_index`;
- `signedArea2_opposite_sign_openSegment_line_inter`;
- `convexHull_line_inter_eq_segment_of_extreme_pair`;
- `CapCrossingKalmansonBridge.{complementary_,}dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals`;
- `ConvexIndep.not_three_collinear`; and
- `CriticalFourShell.support_eq_radius`.

No theorem-bank entry already packages the pointwise `StrictCapBlockData`
consumer below.  The C5D3B crossing declarations concern a different
coordinate-pinned row surface.

## One local geometric lemma

The useful theorem should be stated directly on a retained strict cap block.
Here `C` is the block cap and `x` is an ambient vertex outside it.

```lean
theorem false_of_two_sameSide_capCenters_common_capOutside_pair
    {A C : Finset ℝ²} (hA : ConvexIndep A)
    (B : CGN.StrictCapBlockData A C)
    {q c d : Fin B.m} {x : ℝ²}
    (hcd : c ≠ d)
    (hsame : (q < c ∧ q < d) ∨ (c < q ∧ d < q))
    (hxA : x ∈ A) (hxOutside : x ∉ C)
    (hcEq : dist (B.L.points c) (B.L.points q) =
      dist (B.L.points c) x)
    (hdEq : dist (B.L.points d) (B.L.points q) =
      dist (B.L.points d) x) :
    False
```

This statement is sufficient for every required pair exclusion.  It needs no
selected-row structure: the two exact radius equalities are the complete row
payload consumed by the geometry.

### Pointwise diagonal crossing

The only helper not currently exposed with the right signature is:

```lean
theorem exists_mem_openSegment_capChord_and_outsideDiagonal
    {A C : Finset ℝ²} (hA : ConvexIndep A)
    (B : CGN.StrictCapBlockData A C)
    {r j s : Fin B.m} {x : ℝ²}
    (hrj : r < j) (hjs : j < s)
    (hxA : x ∈ A) (hxOutside : x ∉ C) :
    ∃ z : ℝ²,
      z ∈ openSegment ℝ (B.L.points r) (B.L.points s) ∧
      z ∈ openSegment ℝ (B.L.points j) x
```

Its proof is complete from current theorems.

1. `B.posSide_of_between_index hrj hjs` gives

   ```text
   0 < signedArea2 (L[r]) (L[s]) (L[j]).
   ```

2. If the same signed area at `x` were positive, the forward direction of
   `B.Hord.subchord_open_side_iff_A (hrj.trans hjs) hxA` would produce an
   index `t` with `L[t] = x`.  Then `x` belongs to `B.cap_image = C`,
   contradicting `hxOutside`.  Thus that area is nonpositive.

3. `B.Packet.mem_A` puts `L[r]` and `L[s]` in `A`.  They are distinct by
   `B.L.injective` and `r < s`.  Also `x` differs from both because both cap
   points lie in `C` whereas `x` does not.  Hence
   `hA.not_three_collinear` rules out zero signed area at `x`, using
   `collinear_of_signedArea2_eq_zero`.  The nonpositive area is therefore
   strictly negative.

4. `signedArea2_opposite_sign_openSegment_line_inter` now gives a point `z`
   in the open segment from `L[j]` to `x` and on the line through `L[r]` and
   `L[s]`.

5. Both endpoints of the first open segment lie in `A`, so convexity puts
   `z` in `convexHull ℝ A`.  The existing proof of
   `convexHull_line_inter_eq_segment_of_extreme_pair` uses its enumeration
   only to obtain membership and distinctness of its two endpoints.  Expose
   the pointwise form

   ```lean
   theorem convexHull_line_inter_eq_segment_of_mem
       {A : Finset ℝ²} (hA : ConvexIndep A)
       {a b : ℝ²} (ha : a ∈ A) (hb : b ∈ A) (hab : a ≠ b) :
       convexHull ℝ (A : Set ℝ²) ∩ line[ℝ, a, b] =
         segment ℝ a b
   ```

   by reusing the current extreme-point proof verbatim.  It yields
   `z ∈ segment ℝ (L[r]) (L[s])`.

6. If `z` were either endpoint, its membership in
   `openSegment ℝ (L[j]) x` would make one of the distinct triples
   `{L[r],L[j],x}` or `{L[s],L[j],x}` collinear.  Convex independence rules
   this out.  `mem_openSegment_of_ne_left_right` upgrades the closed chord
   membership to the required open chord membership.

Therefore the missing helper is an **API refactor, not new geometry**.  The
current globally enumerated extreme-pair theorem is strictly stronger in
irrelevant interface data and already contains the proof.

### Cancellation when the centers follow the cap point

Assume `q < c` and `q < d`.  Split on `c < d` versus `d < c`; write the
earlier center as `e` and the later as `f`.  The diagonal-crossing helper with

```text
r = q,  j = e,  s = f
```

gives crossed open diagonals `q--f` and `e--x`.  Apply
`complementary_dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals` to

```text
a = L[q],  b = L[e],  c = L[f],  d = x.
```

It gives

```text
dist(q,e) + dist(f,x) < dist(q,f) + dist(e,x).
```

The two row equalities, plus `dist_comm`, rewrite this to

```text
dist(e,x) + dist(q,f) < dist(q,f) + dist(e,x),
```

contradicting `lt_irrefl`/`linarith`.

### Cancellation when the centers precede the cap point

Assume `c < q` and `d < q`; again name the earlier center `e` and later
center `f`.  Use the diagonal-crossing helper with

```text
r = e,  j = f,  s = q.
```

Apply `dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals` to

```text
a = L[e],  b = L[f],  c = L[q],  d = x.
```

It gives

```text
dist(f,q) + dist(e,x) < dist(e,q) + dist(f,x).
```

Both sides are equal after the two row-radius rewrites.  This closes the
second side of `hsame`.

## Exact period-three consumers

Let

```text
P0 = reverseOutsidePair K P.i0
P1 = reverseOutsidePair K P.i1
P2 = reverseOutsidePair K P.i2.
```

The branch-specific theorem surface should be:

```lean
theorem reverseOutsidePair_disjoint_zero_two
    (P : PeriodThreeReverseSharedCapOrder K)
    (hreverse : AllReverseMembership K) :
    Disjoint (reverseOutsidePair K P.i0)
      (reverseOutsidePair K P.i2)

theorem reverseOutsidePair_disjoint_one_two_of_forward
    (P : PeriodThreeReverseSharedCapOrder K)
    (hreverse : AllReverseMembership K)
    (hforward : P.q1 < P.c1 ∧ P.c1 < P.q2) :
    Disjoint (reverseOutsidePair K P.i1)
      (reverseOutsidePair K P.i2)

theorem reverseOutsidePair_disjoint_zero_one_of_reflected
    (P : PeriodThreeReverseSharedCapOrder K)
    (hreverse : AllReverseMembership K)
    (hreflected : P.q2 < P.c1 ∧ P.c1 < P.q1) :
    Disjoint (reverseOutsidePair K P.i0)
      (reverseOutsidePair K P.i1)
```

Equivalently, the orientation consumer may return the invariant disjunction

```lean
Disjoint P0 P2 ∧
  (Disjoint P1 P2 ∨ Disjoint P0 P1).
```

The exact identities are:

| branch | common pair tested | same-side centers | conclusion |
|---|---|---|---|
| both | `{q0,x}` from rows 0 and 2 | `q0 < c0`, `q0 < c2` | `Disjoint P0 P2` |
| forward | `{q2,x}` from rows 1 and 2 | `c1 < q2`, `c2 < q2` | `Disjoint P1 P2` |
| reflected | `{q1,x}` from rows 0 and 1 | `c0 < q1`, `c1 < q1` | `Disjoint P0 P1` |

### Row-radius rewrites

Each disjointness proof is pointwise.  For a hypothetical common `x`:

1. `Finset.mem_sdiff.mp` on each `reverseOutsidePair` membership supplies
   membership in both actual critical supports and `x ∉ C`.
2. `reverseOutsidePair_subset_complement` supplies `x ∈ D.A`.
3. The common cap source is in each row by the appropriate combination of
   `hreverse P.i*`, `CriticalFourShell.q_mem_support`, and the stored
   `P.successor_i*` identity.
4. For each row `R`,

   ```lean
   (R.support_eq_radius common hcommon).trans
     (R.support_eq_radius x hx).symm
   ```

   is exactly the equality required by the local four-point lemma, after
   rewriting `P.c*_point` and `P.q*_point`.
5. The two center indices are distinct.  Their point identities and
   `reverseRowCenter_injective K hreverse` reduce equality to equality of the
   two cycle indices; the strict source order stored in `P` rules that out
   (`q0 < q2` in the 0/2 case, `q1 < q2` forward, and `q0 < q1` reflected).

No support cardinality fact is used by the geometric contradiction itself;
cardinality two is needed only by the later finite union normal form.

## Conclusion

The correct producer/consumer contract is now exact:

- **forward orientation:** `P2` is disjoint from both `P0` and `P1`;
- **reflected orientation:** `P0` is disjoint from both `P1` and `P2`.

The earlier expectation that the pointwise route needed global
`Function.Injective B.phi` and `IsCcwConvexPolygon B.phi` was an interface
artifact.  `B.Hord`, convex independence, cap-complement membership, and the
two shell equalities suffice.  The only implementation precursor is the
pointwise extreme-pair hull-line wrapper (or the equivalent direct
cap-chord/outside-diagonal theorem).  This proves pruning, not `False`, and it
does not itself close a production `sorry`.
