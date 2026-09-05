# `cardGeThirteen` ingress-coupling checkpoint v3

Date: 2026-09-03

Target:

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
```

## 1. Decisive source count

Let

```text
G := goodOutsideSources R
B := badOutsideSources R
O := outsideFirstApexFiber R.
```

The current source already proves all three ingredients of the exact count:

```text
O.card + 4 = D.A.card,
G.card + B.card = O.card,
B.card ≤ 2.
```

The first equality uses the exact four-point actual-blocker fiber at the first
apex. The second is the definition of `G` as the outside fiber with the bad
sources removed. The third is the source-clean global bad-source bound.
Consequently,

```text
D.A.card = G.card + B.card + 4
D.A.card ≤ G.card + 6.
```

Source locations reported by the current audit:

- `outsideFirstApexFiber`: `ExactFourPhysicalConsumer.lean:79-87`;
- `badOutsideSources_card_le_two`: `ExactFourPhysicalConsumer.lean:227-309`;
- exact outside-fiber cardinality calculation:
  `ExactFourPhysicalConsumer.lean:343-370`;
- good/bad partition calculation:
  `ExactFourPhysicalConsumer.lean:377-393`;
- first-apex blocker fiber has cardinality four:
  `UniqueFourLateChoiceTerminal.lean:275-294`.

Therefore the live hypothesis

```text
12 < D.A.card
```

gives

```text
7 ≤ G.card.
```

This includes exact cardinality 13. There is no separate `3+3` exception once
the sharp `+6` count is used.

A reusable theorem should expose this calculation directly, for example:

```lean
theorem carrier_card_le_goodOutsideSources_card_add_six
    (R : OriginalUniqueFourResidual F) :
    D.A.card ≤ (goodOutsideSources R).card + 6
```

and the immediate corollary

```lean
theorem seven_le_goodOutsideSources_card_of_card_gt_twelve
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card) :
    7 ≤ (goodOutsideSources R).card.
```

These facts do not use the two-radius rows or `hnoFive`; they belong above the
radius-classification split.

## 2. Correct deletion universe

The good-source definitions use the critical-frontier pair

```text
F.pair.q, F.pair.w,
```

not `R.interior_q, R.interior_w`. No equality between those two pairs is stored
in `OriginalUniqueFourResidual`. All source-normal coupling statements must use
`F.pair.q/w` unless an explicit bridge is added.

For a good source `s`, write

```text
β(s) := (lateFirstApexSystem R).centerAt s.1 s.2
C(s) := (lateFirstApexSystem R).selectedAt s.1 s.2
O(s) := {d ∈ {F.pair.q, F.pair.w} | d ∉ C(s).support}.
```

`good_source_survives_one`, together with
`cross_deletion_survives_iff_not_mem_selected_support`, proves that `O(s)` is
nonempty.

Equal blockers give equal selected supports, so `O(s)` is constant on each
actual-blocker fiber. Every such fiber has cardinality at most four, and every
source in the fiber belongs to its common selected support.

## 3. Seven-source coupling theorem

The following is a direct finite proof; exhaustive enumeration is unnecessary.

> If `7 ≤ G.card`, then there are distinct good sources `s,t`, with distinct
> actual blockers, and one `d ∈ {q,w}` omitted by both selected supports.

Assume no such pair exists.

1. Choose `s ∈ G`. Its blocker fiber has cardinality at most four, while
   `G.card ≥ 7`; hence choose `t ∈ G` with `β(t) ≠ β(s)`.
2. `O(s)` and `O(t)` are nonempty subsets of the two-element set `{q,w}`. The
   no-pair assumption makes them disjoint. After swapping `q,w`,
   `O(s)={q}` and `O(t)={w}`.
3. A third blocker value is impossible: its nonempty omission set would have
   to be disjoint from both `{q}` and `{w}`. Thus every good source lies in one
   of the two blocker fibers of `s` and `t`.
4. On the `β(s)` fiber, the common support omits `q`, hence contains `w`. It
   also contains every source in that fiber. Since `w ∉ G` and the support has
   cardinality four, the fiber has cardinality at most three. The same argument
   bounds the `β(t)` fiber by three.
5. Therefore `G.card ≤ 6`, contradiction.

A source-neutral theorem can be stated abstractly, followed by a source adapter
for `goodOutsideSources R`. A direct source-facing conclusion is:

```lean
∃ s t : CarrierVertex D.A,
  s ∈ goodOutsideSources R ∧
  t ∈ goodOutsideSources R ∧
  s ≠ t ∧
  β s ≠ β t ∧
  ∃ d,
    (d = F.pair.q ∨ d = F.pair.w) ∧
    d ∉ C(s).support ∧
    d ∉ C(t).support.
```

An exact source-neutral enumeration was also run as a regression. Under the
negation of the desired conclusion, survivors occur only with five or six
sources, in blocker-fiber sizes `3+2` or `3+3`; there are no survivors with
seven or eight sources.

## 4. Three-center common-deletion producer

Let `s,t,d` be supplied by the coupling theorem and put

```text
b₀ := β(s),
b₁ := β(t),
a  := S.oppApex2.
```

Then:

- `d` is omitted from the actual selected rows at `b₀` and `b₁`, so both rows
  survive deletion of `d`;
- `surface.secondApex_robust` supplies a four-point row at `a` after deleting
  `d`;
- `surface.secondApex_robust.centerAt_ne` gives `b₀ ≠ a` and `b₁ ≠ a`;
- the coupling theorem gives `b₀ ≠ b₁`.

Thus the existing generic constructor

```lean
Problem97.ATailThreeCenterCommonDeletion.
  nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
```

(`ThreeCenterCommonDeletion.lean:67-95`, according to the source audit) should
produce three exact rows surviving the same deletion at the pairwise-distinct
centers `b₀,b₁,a`.

The source-facing packet should retain more than the generic three-row object:

```lean
structure SourceRichThreeCenterCommonDeletion ... where
  deleted : ℝ²
  deleted_eq_q_or_w : deleted = F.pair.q ∨ deleted = F.pair.w
  source₀ source₁ : CarrierVertex D.A
  source₀_good : source₀ ∈ goodOutsideSources R
  source₁_good : source₁ ∈ goodOutsideSources R
  sources_ne : source₀ ≠ source₁
  blockers_ne : β source₀ ≠ β source₁
  source₀_mem_row : source₀.1 ∈ C(source₀).support
  source₁_mem_row : source₁.1 ∈ C(source₁).support
  deleted_not_mem_row₀ : deleted ∉ C(source₀).support
  deleted_not_mem_row₁ : deleted ∉ C(source₁).support
  rows : ThreeCenterCommonDeletionExactRows ...
```

The central source reduction is therefore expected to be:

```lean
theorem nonempty_sourceRichThreeCenterCommonDeletion_of_card_gt_twelve
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (hcard : 12 < D.A.card) :
    Nonempty (SourceRichThreeCenterCommonDeletion R surface).
```

## 5. Ingress-anchored refinement

The mandatory ingress source is itself good. Fix

```text
s₀ := surface.ingress.source,
b₀ := β(s₀).
```

A stronger finite split is available.

### Anchored arm

There is a good source `t` with `β(t) ≠ b₀` and a deletion common to
`O(s₀)` and `O(t)`. This gives a three-center common-deletion packet involving
the mandatory ingress blocker itself.

### Crossed arm

If no external blocker shares an admissible deletion with `b₀`, then, up to
swapping `q,w`:

```text
O(s₀) = {q},
every source outside the b₀-fiber has O = {w},
the b₀-fiber has card ≤ 3,
at least four good sources lie outside it,
every outside blocker fiber has card ≤ 3.
```

Hence two distinct external blockers `b₁,b₂` exist. Their rows both omit `w`
and contain `q`; `a,b₁,b₂` survive deletion of `w`, while `a,b₀` survives
deletion of `q`. This is a bounded crossed four-center/two-deletion network.

This anchored split has been sent for source audit. It is stronger than comparing
two arbitrarily selected ingress packets because the deletion witnesses are
chosen canonically from their nonempty omission sets.

## 6. Remaining mathematical blocker

The reduction is real but is not yet a contradiction.

No current source-clean theorem was found that consumes only a source-rich
`ThreeCenterCommonDeletionExactRows` packet. Existing consumers require further
exact-five, source-return, cyclic-order, common-pair, or survival-square data.

The next terminal-facing split should inspect the other retained member `e` of
`{q,w}` in the two non-A2 rows:

- `e` omitted from both rows: the same three centers survive both deletions;
- `e` omitted from exactly one row: a one-sided two-deletion rectangle;
- `e` contained in both rows: two distinct selected rows share `e` while both
  omit the deleted point.

The mandatory ingress packet should then be coupled to this three-center packet,
producing either an anchored three-center packet or the crossed four-center
network above.

## 7. Formalization status

Formalization requests have been routed to luna-swarm agents for:

1. the reusable `D.A.card ≤ goodOutsideSources.card + 6` theorem;
2. the source-neutral seven-source coupling theorem;
3. the source adapter to a source-rich three-center common-deletion packet;
4. the independent `IngressAlignedTwoRadiusRows` interface.

No live sorry has been edited or rewired, and no terminal theorem has been
claimed prematurely.
