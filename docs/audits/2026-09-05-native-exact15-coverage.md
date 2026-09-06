# Exact-fifteen structural coverage

## Exact target

The exact Lean statement under review is:

```lean
theorem exists_metricMotif_of_pairwiseSeparated :
    ∀ (order : Fin 2) (rows : Fin 4 → OutsidePair),
      PairwiseSeparated order rows → ∃ index : Fin 16, MotifOccurs rows index
```

Here `OutsidePair` is `{s : Finset (Fin 6) // s.card = 2}`. The declarations
`OutsidePair`, `outsideLabel`, `centerLabel`, `fixedHit₁`, `fixedHit₂`,
`position`, `motif`, `MotifOccurs`, and
`exists_metricMotif_of_pairwiseSeparated` are in the
[`BlockerVExactFifteenFourRowCoverage` module](../../lean/Erdos9796Proof/P97/ATail/BlockerVExactFifteenFourRowCoverage.lean).
The paper argument below is now implemented on task branch
`codex/native-exact15-coverage-20260905`. The shared main source remains
frozen and unchanged; branch integration does not imply that the change is
merged into main.

## Fixed data

For a given `rows`, write

\[
A=(rows\ 0).1,\quad B=(rows\ 1).1,\quad
C=(rows\ 2).1,\quad D=(rows\ 3).1.
\]

Each of these four finsets has cardinality two and is contained in
\(U=\operatorname{univ}\subseteq\operatorname{Fin}6\), where \(|U|=6\).
The six outside labels, in outside-index order, are

\[
1,3,4,5,13,14.
\]

The source position table gives these labels positions
\(12,9,10,11,13,14\), for either value of `order`. The four row centers
have positions

\[
(2,5,4,3)\quad\text{when }order=0,
\qquad
(2,6,4,3)\quad\text{when }order=1.
\]

The fixed row hits are

\[
row\ 0:\{6,9\},\quad row\ 1:\{6,7\},\quad
row\ 2:\{8,9\},\quad row\ 3:\{8,10\}.
\]

These are direct evaluations of the named `outsideLabel`, `position`,
`centerLabel`, `fixedHit₁`, and `fixedHit₂` declarations in the linked module.

## The three disjointness relations

Label `\(X\perp Y\)` means `Disjoint X Y`. We prove

\[
A\perp B,\qquad A\perp C,\qquad C\perp D. \tag{1}
\]

The proof uses only the given `PairwiseSeparated` hypothesis. Suppose first
that an outside index `i` belongs to both `A` and `B`, and put
\(x=outsideLabel(i)\). Both rows then hit `x`, and both rows also hit the
fixed label `6`. Since `x` is one of `1,3,4,5,13,14`, either `x < 6` or
`6 < x` in the label order. Apply `PairwiseSeparated` to rows 0 and 1,
using the two points in whichever order satisfies its `point₁ < point₂`
hypothesis. Their center positions are 2 and 5 or 6; the positions of `6`
and `x` are 1 and at least 9. Thus neither point is strictly between the two
centers. The required equivalence is therefore `False ↔ ¬False`, a
contradiction. Hence `A ⟂ B`.

For `A ⟂ C`, repeat the argument with the common fixed label `9`. The center
positions are 2 and 4, while label `9` has position 5 or 6 and every outside
label has position at least 9. Again both candidate points lie outside the
strict interval, regardless of which one is `point₁` after the numerical
order split.

For `C ⟂ D`, use their common fixed label `8`. The center positions are 4
and 3, label `8` has position 2, and the outside point has position at least
9. The same `False ↔ ¬False` contradiction follows. This proves (1).

## The two remaining sets cannot be equal

We prove

\[
B\ne D. \tag{2}
\]

If `B = D`, their two-element cardinalities provide distinct outside indices
`i` and `j` in both sets. Order their outside labels numerically, calling
them `p < q`. Rows 1 and 3 then both hit `p` and `q`, so `PairwiseSeparated`
applies. Their center positions are 5 or 6 and 3, while both `p` and `q`
have positions at least 9. Neither is between the centers, contradicting the
required betweenness equivalence. Therefore (2) holds.

## Complement pigeonhole

Assume, for contradiction, that both

\[
A\cap D=\varnothing\quad\text{and}\quad B\cap C=\varnothing. \tag{3}
\]

By (1), `A` and `C` are disjoint, so their union has cardinality four. Set

\[
V=U\setminus(A\cup C).
\]

Then \(|V|=6-4=2\). The first relation in (1) and the second assumption in
(3) give `B ⊆ V`; the first assumption in (3) and the third relation in (1)
give `D ⊆ V`. Since both `B` and `D` have cardinality two, both equal `V`.
This contradicts (2). Consequently,

\[
(A\cap D)\ne\varnothing\quad\text{or}\quad(B\cap C)\ne\varnothing. \tag{4}
\]

## Conversion to the existing motifs

If `i ∈ A ∩ D`, the shared outside label is `outsideLabel i`. Rows 0 and 3
also contain their fixed labels 9 and 8, respectively, while row 2 contains
its fixed labels 8 and 9. Evaluating the existing `motif` definition gives
the following complete map:

\[
i=0,1,2,3,4,5
\longmapsto
4,5,6,7,14,15.
\]

The corresponding three `PairHit` pairs are therefore all present, so the
selected motif occurs.

If `i ∈ B ∩ C`, rows 1 and 2 share `outsideLabel i`; row 1 contains fixed
label 6, row 2 contains fixed label 9, and row 0 contains fixed labels 6 and
9. The exact map is

\[
i=0,1,2,3,4,5
\longmapsto
8,9,10,11,12,13.
\]

Again all three pairs in the selected motif occur. By (4), one of these two
cases holds, so some `index : Fin 16` satisfies `MotifOccurs rows index`.
This proves the exact target proposition on paper. Motifs 0–3 are not needed
for this argument; retaining them preserves the existing sixteen-motif
interface.

## Completion matrix

| Obligation | Rigor and scope | Status | Evidence |
|---|---|---|---|
| Decode the four two-point supports and six outside labels | PROVEN (pen-and-paper, fixed finite definitions) | Done | `OutsidePair`, `outsideLabel`, `outsideHits`, and `outsideHits_card_eq_two` in the linked module |
| Position and fixed-hit table for both orders | PROVEN (pen-and-paper, finite evaluation) | Done | `position`, `centerLabel`, `fixedHit₁`, and `fixedHit₂` in the linked module |
| `A ⟂ B`, `A ⟂ C`, `C ⟂ D` | PROVEN (pen-and-paper, from `PairwiseSeparated`) | Done | This note, §The three disjointness relations |
| `B ≠ D` | PROVEN (pen-and-paper, from two shared outside hits) | Done | This note, §The two remaining sets cannot be equal |
| Six-element complement pigeonhole | PROVEN (pen-and-paper) | Done | This note, §Complement pigeonhole |
| AD and BC overlap-to-motif maps | PROVEN (pen-and-paper, all six outside indices) | Done | `motif` and `MotifOccurs` in the linked module; this note, §Conversion |
| `exists_metricMotif_of_pairwiseSeparated` | PROVEN (pen-and-paper; independently reviewed) | Complete argument | This note |
| Lean replacement and generic helper | Validated on task branch | Done | Isolated full-module check and exact-15 rebuild; see [validation receipt](2026-09-05-native-exact15-coverage-validation.json) |
| Governed two-target build | Validated on task branch | Done | PASS, 38.63 s; source closure unchanged (59) |
| Fresh axiom probe | Validated on task branch | Done | All five named declarations have exactly `[propext, Classical.choice, Quot.sound]`; see [validation receipt](2026-09-05-native-exact15-coverage-validation.json) |
| Exact-16 coverage and card-10/card-11 banks | Out of scope here | Open | These wider banks are not addressed by this exact-15 audit |

## Search and scope record

The reuse preflight searched for a general theorem about four two-point finsets
on six elements with `A ⟂ B`, `A ⟂ C`, `C ⟂ D`, `B ≠ D`, and an AD/BC overlap
cover. No suitable generic combinatorial result surfaced. The exact-15 native
classifier was not used as evidence for this proof; using it would be circular.
The indexed corpus was `erdos-97-96-formalization-lean`, indexed 2026-09-06
05:25 UTC at source `328a9577c43956974ecf629b20dcd1e13acc6e3b`. Its top hits were unrelated or out of scope:
`offDiagonalShift_k2_iff`, `NewAMotifOccurs`/`NewBMotifOccurs` for exact-16,
and `false_of_three_selected_rows_four_role_K2_collapse`.

This audit covers exact-fifteen motif coverage only. It makes no claim about
exact-sixteen coverage, the card-10 or card-11 banks, the geometric producer of
`PairwiseSeparated`, or the P97 publication root.

## Validation and source boundaries

The isolated full-module check compiled the new generic lemma and the complete
modified exact-fifteen module against a copied snapshot of its first-party
dependency artifacts. The governed two-target build passed in 38.63 seconds,
with source closure unchanged at 59; the exact-fifteen rebuild took 29 seconds.
The classifier and all three existing geometric consumers had exactly the axiom set
`[propext, Classical.choice, Quot.sound]`:

- `exists_metricMotif_of_pairwiseSeparated`;
- `false_of_pairwiseSeparated_realizedRows`;
- `false_of_positionEmbedding_realizedRows`;
- `false_of_positionEmbedding_membershipRows`.

The generic `FourPairCoverage.overlap_of_disjoint_pairs` had the same axiom set.
The fresh probe completed with no source changes after probing. This is branch
validation; the shared main source remains untouched. The generated evidence is under
`scratch/runs/native-exact15-coverage-20260905/run-0001/`.

The current frozen census/card-head `source_manifest` and
`LEAN_DEPENDENCY_MODULES` sets do not list the exact-fifteen module, so this
replacement does not require a bank refreeze. Broad source hashes in the
archived exact-12 canary discovery descriptors would become stale for replay;
those descriptors explicitly claim no Lean closure or theorem coverage. The
dated package-1 validation receipt remains evidence of its recorded source state.
