# Off-frontier two-hit geometry audit

Date: 2026-07-14

## Verdict

The positive off-frontier two-hit is **not yet proved from the live K-A
hypotheses**.  It is also not a consequence of the exact Euclidean/global-K4/
deletion/full-filter/common-critical-system fragment alone.

The pinned checker
`exact_euclidean_selection_countermodel.py` constructs a legal common
critical-shell selection on the existing 33-point exact integer-coordinate
carrier for which

```text
max selected off-frontier dangerous hits = 1.
```

The same carrier admits another legal blocker-shell selection with the shared
pair `{(0,0),(5,5)}` at center `(5,0)`.  Thus the two-hit is
selection-sensitive: Euclidean two-circle geometry permits it, but the current
critical-system API does not force the fixed chosen system to select it.

This is **not a counterexample to K-A-PAIR**.  The carrier is non-convex (it
contains `(3,3)` as the midpoint of `(3,1)` and `(3,5)`) and therefore does not
instantiate the live convex/MEC/surplus-cap/no-`IsM44` packet.

## Exact certificate

Run:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/off-frontier-two-hit-geometry/\
exact_euclidean_selection_countermodel.py
```

Pinned digests:

- base construction:
  `a78922fbf1a30e7642019a65859c93d34d45f668e06e0f60310bf780b45c55c5`;
- common-system selection:
  `e55aa316518bdb7912922d96eaa8d142e972927cfb00cba51942279e19c273fe`.

The checker uses exact integer squared distances and exhaustively verifies:

- carrier cardinality `33`;
- global K4 at every carrier center;
- every single deletion destroys global K4;
- every chosen row is an exact positive-radius four-point full filter;
- every chosen center is a genuine deletion blocker for its source;
- sources choosing the same center have the same exact support;
- the dangerous row at `p=(0,5)` is exactly
  `{(0,0),(3,1),(4,2),(5,5)}`;
- all four dangerous sources choose `p` and that exact row;
- among the `29` selected rows whose center is not `p`, `27` have zero
  dangerous hits and `2` have one dangerous hit;
- the selected live-shaped source `u=(0,1)` has zero dangerous hits; and
- a different legal selection at center `(5,0)` has exactly the dangerous
  pair `{(0,0),(5,5)}`.

Trust boundary: this is exhaustive exact arithmetic in Python, not a Lean
kernel proof.

## Current theorem-bank boundary

Search of the current tree and the indexed banks found no theorem
which combines `ConvexIndep`, MEC/cap order, `hNoM44`, and full-filter data to
force a non-`p` critical shell to meet `{q,t1,t2,t3}` in at least two points.
Within `U1LargeCapRouteBTail`'s actual import closure the negative result is
stronger: the live `CriticalPairFrontier` material supplies only a
one-cross-hit-or-survival split, while U5 supplies upper dangerous-overlap and
lower off-dangerous counts.

The available statements split as follows.

- `SelectedFourClass.inter_card_le_two` and
  `U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two` provide only the
  sharp **upper** bound `≤ 2`.
- The imported U5 multiplicity statements provide at least two points
  **outside** the dangerous row, not inside it.
- `CapSelectedRowCounting.outsidePair_unique_capCenter` immediately closes
  once two dangerous points and their common-cap/outside placement are known.
- `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two` is the best
  positive candidate present in the current tree: a K4 class centered at a
  Moser apex contains at least two points of its own opposite-cap interior.
  It lives in `PinnedSurplusGeneralM`, which is not currently in
  `U1LargeCapRouteBTail`'s import closure.  Importing the underlying cap-counting
  material would still leave the dangerous-row alignment missing.
- `orderedCap_selected_support_inter_card_eq_of_six_five` and
  `selectedClass_support_inter_surplusCap_card_eq` give exact two-point
  information only in the six-cap/five-outside card-11 `IsM44` regime.  That
  regime is unavailable under the live `hNoM44` assumption.

## First absent live field

The first useful missing bridge is now precise.  One needs either:

1. an **apex alignment plus interior localization** theorem: the chosen
   off-frontier blocker center is a relevant Moser apex and at least two points
   of that apex's opposite-cap interior belong to the dangerous exact row; or
2. a direct **adaptive critical-shell multiplicity** theorem: some actual
   chosen blocker shell distinct from `p` meets `{q,t1,t2,t3}` in exactly two
   points and those points lie outside a cap containing both centers.

The second formulation feeds the already kernel-checked
`false_of_hasNonalternatingSharedPair` / `outsidePair_unique_capCenter` sinks.
The first formulation is the shortest visible route from an existing positive
bank theorem.

Until one of those bridges is proved, K-A-PAIR is not at the wiring stage; it
remains one substantive convex/MEC/no-`IsM44` producer lemma away.
