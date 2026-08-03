# Finite set-system Lean route (R2)

## Audit status

This is a source-only audit.  No production Lean file, Lake build, solver,
DRAT check, or kernel gate was run.  The 31 clauses are the Boolean core
reported by `scratch/retained-omission-e1/round5-core-mining/MINIMIZATION-REPORT.md`;
they are a stronger rerun-bank core, not a literal subset of the original
284-clause Z3 core.

The finite universe is

```
U = (13,0,1,2,3,14,4,5,6,7,12,8,9,10,11)
R0 = {x | rich_0_0_x}   R1 = {x | rich_1_0_x}   R2 = {x | rich_2_0_x}
K7 = {x | k4_7_x}       K8 = {x | k4_8_x}.
```

## Exact 31-clause core

The 18 rich-profile clauses are:

| family | clause indices | normalized content |
|---|---:|---|
| `R0` | 12, 16, 17--20 | `12 ∉ R0`; `|R0| = 6`; `{0,1,2,3} ⊆ R0` |
| `R1` | 48, 51, 52--55 | `13 ∉ R1`; `|R1| = 6`; `{4,5,6,7} ⊆ R1` |
| `R2` | 84, 86, 87--90 | `14 ∉ R2`; `|R2| = 6`; `{8,9,10,11} ⊆ R2` |

The four `K4` clauses are indices `231, 247, 264, 278`:

```
7 ∉ K7, |K7| = 4,   8 ∉ K8, |K8| = 4.
```

The nine cyclic alternation cuts are AtMost-1 intersection bounds (the
listed domain is the cut's universe):

| index | pair | domain |
|---:|---|---|
| 1332 | `K7,R0` | `U \ {7,12}` |
| 1334 | `K7,R1` | `{0,1,2,3,4,5,6,14}` |
| 1335 | `K7,R2` | `{0,1,2,3,8,9,10,11,12,13}` |
| 1381 | `K8,R0` | `U \ {8,12}` |
| 1383 | `K8,R1` | `{0,1,2,3,4,5,6,7,12,14}` |
| 1384 | `K8,R2` | `{0,1,2,3,9,10,11,13}` |
| 1569 | `R0,R1` | `{0,1,2,3,4,5,6,7,14}` |
| 1570 | `R0,R2` | `{0,1,2,3,8,9,10,11,13}` |
| 1613 | `R1,R2` | `{4,5,6,7,8,9,10,11,12}` |

The finite contradiction is the apex-cover split.  The rich--rich cuts force
`12 ∈ R1 ∪ R2`, `13 ∈ R0 ∪ R2`, and `14 ∈ R0 ∪ R1`.  If `12 ∈ R2`, the
three `K7` domains cover `U \ {7}`; the profile interiors and the two other
apex facts therefore cover every point of `K7`.  Each cut contributes at most
one point, so `|K7| ≤ 3`, contradicting `|K7| = 4`.  If `12 ∈ R1`, the
analogous `K8` domains cover `U \ {8}`, yielding `|K8| ≤ 3` against
`|K8| = 4`.

## Smallest source-clean Lean bridge

The first lemma worth formalizing is the generic three-cover counting step,
independent of geometry or the particular 15 labels:

```lean
theorem Finset.card_le_three_of_three_cover_atMostOne
    {α : Type*} [DecidableEq α]
    {K T₁ T₂ T₃ : Finset α}
    (hcover : K ⊆ T₁ ∪ T₂ ∪ T₃)
    (h₁ : (K ∩ T₁).card ≤ 1)
    (h₂ : (K ∩ T₂).card ≤ 1)
    (h₃ : (K ∩ T₃).card ≤ 1) :
    K.card ≤ 3 := by
  -- `Finset.card_le_card`, `Finset.card_union_le`, and `omega` suffice.
```

The proof constructs `K ⊆ (K ∩ T₁) ∪ (K ∩ T₂) ∪ (K ∩ T₃)`, applies
`Finset.card_le_card`, chains `Finset.card_union_le`, and closes the natural
number inequality from `h₁--h₃`.  This is the smallest useful interface: it
is exactly the branch endpoint and is reusable for either `K7` or `K8`.

The next (larger) source-clean layer would package the explicit 15-label
profile/apex-cover bookkeeping and invoke this lemma twice.  It should not be
the first target: it mixes label normalization, finite enumeration, and the
nine cut domains, obscuring the reusable cardinality producer.

## Existing theorem-bank check

No indexed theorem with this exact three-cover/AtMost-1 shape was found.  The
nearest reusable declarations are:

* `CapSelectedRowCounting.lean`: `Finset.card_le_one`, `Finset.card_union_le`,
  and selected-cap intersection bounds (`..._card_le_one`, `..._card_le_two`).
* `N8/N8aArcTwoCircle.lean`: `selectedClass_inter_card_le_one` and
  `selectedClass_inter_card_le_two`.
* `ATail/.../Unique4P4CriticalSupportOccurrenceBridge/Core.lean`:
  `criticalSupport_card_le_of_cover` (a generic support-to-cover card bound),
  but it does not express three separate AtMost-1 cuts.

Thus the proposed lemma is a genuinely small missing bridge rather than a
re-proving of an existing bank result.

## Live exact-15 packet plausibility and trust boundary

`ATail/ExactFifteenApexProfile.lean` supplies exact-cardinality/profile
lemmas (`exactCapProfile_of_card_eq_fifteen`,
`selectedClass_card_eq_six_of_cap_card_eq_six`, and related support bounds).
The finite lemma can therefore be instantiated once a producer supplies three
rich six-element classes with the required four-point interior blocks and
translates the nine metric cuts to the listed finite domains.

That producer is not currently present as a drop-in theorem.  The packet gives
cardinality six and, in places, only “at least two interior points”; it does
not yet prove the exact `{0,1,2,3}`, `{4,5,6,7}`, `{8,9,10,11}` containment
needed by this Boolean core.  The nine alternation cuts also require the live
two-center metric/parity terminals.  Consequently the instantiation is
**plausible but not presently source-complete**.  Formalizing the generic
cardinality lemma is safe progress; claiming the 31-clause obstruction as a
Lean closure would cross the current producer and transitive-axiom boundary.

Supporting artifacts: `mine_combinatorial_core.py`,
`verify_combinatorial_obstruction.py`, and
`v3-combinatorial-core.json` under `round5-core-mining/`.  Their exhaustive
enumeration is finite Boolean discovery only.
