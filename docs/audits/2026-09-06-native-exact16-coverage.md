# Exact-sixteen structural coverage

## Scope and target

This audit reviews the exact-sixteen four-row core at source snapshot
`00942f94e83c5ad6bd3dc01e6d73532a28f92958`. The target proposition is the
following signature from the [`BlockerVExactSixteenFourRowCoverage` module](../../lean/Erdos9796Proof/P97/ATail/BlockerVExactSixteenFourRowCoverage.lean):

```lean
theorem metricObstructionOccurs_of_pairwiseSeparated :
    ∀ (order : Fin 2) (insertion : Fin 7) (rows : Fin 4 → OutsidePair),
      PairwiseSeparated order insertion rows →
        MetricObstructionOccurs order insertion rows
```

Here `OutsidePair` is a two-element finset in `Fin 7`, and
`MetricObstructionOccurs` is the disjunction of the existing declarations
`OldCMotifOccurs`, `OldBMotifOccurs`, `NewAMotifOccurs`, and
`NewBMotifOccurs`. The replacement removes this one native leaf and introduces
no `sorry`, while preserving the theorem signature and original theorem
docstring. It is integrated in the current shared source; the validation
evidence below is for that source state.

The source module also contains the immediate geometric consumer
`false_of_pairwiseSeparated_realizedRows` and its position-embedding consumers
`false_of_positionEmbedding_realizedRows` and
`false_of_positionEmbedding_membershipRows`. The geometric producer
`pairwiseSeparated_of_positionEmbedding_realizesRows` is an existing premise
boundary, not an assumption added by this finite argument.

## Fixed finite model

Fix `order`, `insertion`, `rows`, and a hypothesis
`hsep : PairwiseSeparated order insertion rows`. Put

\[
A=(rows\ 0).1,\quad B=(rows\ 1).1,\quad
C=(rows\ 2).1,\quad D=(rows\ 3).1.
\]

Each is a two-element subset of \(U=\operatorname{Fin}7\). The seven outside
labels are `1, 3, 4, 5, 13, 14, 15`. Inserting label 15 occurs at one of the
seven positions after the named cap packet. Consequently every outside label
has position at least 9. The positions of the four centers remain

\[
(2,5,4,3)\quad\text{for }order=0,
\qquad (2,6,4,3)\quad\text{for }order=1.
\]

The fixed hits are

\[
row\ 0:\{6,9\},\quad row\ 1:\{6,7\},\quad
row\ 2:\{8,9\},\quad row\ 3:\{8,10\}.
\]

Their relevant positions are `position 6 = 1`, `position 7 = 7`,
`position 8 = 2`, `position 9 = 5 or 6`, and `position 10 = 4`; insertion
does not move any of these labels. These facts are evaluations of the named
`outsideLabel`, `centerLabel`, `fixedHit₁`, `fixedHit₂`, and `position`
declarations in the linked module.

## Three forced disjointness relations

We first prove

\[
A\cap B=\varnothing,\qquad A\cap C=\varnothing,\qquad C\cap D=\varnothing. \tag{1}
\]

If \(i\in A\cap B\), both rows hit the outside label
`x = outsideLabel i` and the fixed label 6. Split on the numerical order of
`x` and 6 so that the two points meet the `point₁ < point₂` premise of
`PairwiseSeparated`. Their positions are 1 and at least 9, while the row
centers have positions 2 and 5 or 6. Neither point is strictly between the
centers, so the separation condition has the form `False ↔ ¬False`, a
contradiction. Thus \(A\cap B=\varnothing\).

For \(A\cap C\), use the common fixed label 9. Its position is 5 or 6,
the outside point has position at least 9, and the centers have positions 2
and 4. Again both points lie outside the strict center interval. For
\(C\cap D\), use their common fixed label 8, whose position is 2; the
centers have positions 4 and 3 and the outside point is at least 9. In both
cases the same order split and `False ↔ ¬False` contradiction apply. No
geometric or strengthened hypothesis is used.

## One of three cross-family overlaps

If all six pairwise intersections among \(A,B,C,D\) were empty, their union
would have cardinality \(4\cdot2=8\), impossible inside the seven-element
universe \(U\). Combining this elementary pigeonhole fact with (1) gives

\[
(A\cap D)\ne\varnothing\quad\lor\quad
(B\cap C)\ne\varnothing\quad\lor\quad
(B\cap D)\ne\varnothing. \tag{2}
\]

This is the only finite combinatorial step. It is a direct seven-element
argument and does not enumerate the
`2 * 7 * choose(7, 2)^4` assignments.

## Conversion to the existing obstruction families

If \(i\in A\cap D\), put `y = outsideLabel i` and choose \(x=9\).
Row 0 hits both 9 and \(y\), row 3
hits \(y\), and row 2 hits 9. Since

\[
position(10)=4 < position(9)=5\text{ or }6 < position(y),
\]

the witnesses `x=9`, `y` satisfy `OldBMotifOccurs`.

If \(i\in B\cap C\), put `x = outsideLabel i`. Then

\[
position(9)=5\text{ or }6 < position(x).
\]

Rows 1 and 2 both hit \(x\), which gives `OldCMotifOccurs`.

Finally, if \(i\in B\cap D\), put `g = outsideLabel i`
and choose the intermediate witness `f=7`.
Then

\[
position(9)=5\text{ or }6 < position(7)=7 < position(g).
\]

Rows 1 and 3 both hit \(g\), giving `NewBMotifOccurs`. The formal
`NewBMotifOccurs` declaration requires no `Hits` conjunct for its intermediate
`f`, so no additional no-hit hypothesis is being smuggled into this case.
`NewAMotifOccurs` is unused. The three cases in (2) therefore establish the
target disjunction.

## Completion matrix

| Obligation | Rigor and scope | Status | Evidence |
|---|---|---|---|
| Two-element supports in `Fin 7` and seven outside labels | PROVEN on paper from fixed definitions | Complete | `OutsidePair`, `outsideLabel`, `outsideHits`, `outsideHits_card_eq_two` in the linked module |
| Insertion preserves cap positions and puts every outside point at position ≥9 | PROVEN by the definition of `position` | Complete | `position`, `centerLabel`, `fixedHit₁`, `fixedHit₂` |
| `A ∩ B`, `A ∩ C`, and `C ∩ D` are empty | PROVEN from `PairwiseSeparated` | Complete | The three interval contradictions above |
| At least one of `A ∩ D`, `B ∩ C`, `B ∩ D` is nonempty | PROVEN by the 8-versus-7 pigeonhole | Complete | The union argument above |
| `A ∩ D` yields `OldBMotifOccurs` | PROVEN by witnesses `9` and the shared outside point | Complete | `OldBMotifOccurs` in the linked module |
| `B ∩ C` yields `OldCMotifOccurs` | PROVEN by the shared outside point | Complete | `OldCMotifOccurs` in the linked module |
| `B ∩ D` yields `NewBMotifOccurs` | PROVEN by witnesses `7` and the shared outside point | Complete | `NewBMotifOccurs` in the linked module |
| `metricObstructionOccurs_of_pairwiseSeparated` | Paper proof independently reviewed | Complete argument | This audit |
| Native leaf replacement | Lean source integration | Complete | Source-only native leaf count is 1→0 at the same consumers; signature and original theorem docstring are preserved |
| Governed build | Lean validation | Complete | PASS in 9.71 s (exact-sixteen module 7.3 s); 63 source hashes unchanged during and after the build |
| Fresh axiom probe | Trust validation | Complete | 8/8 named declarations have exactly `[propext, Classical.choice, Quot.sound]`; see [validation receipt](2026-09-06-native-exact16-coverage-validation.json) |
| Independent exact-byte verification | Static validation | PASS | `codex-exact16-independent`, conversation #16646: all 63 source hashes, aggregate digest, build/probe/configuration hashes, eight axiom sets, preserved classifier statement/docstring, and consumer edges verified |
| Universal P97/card-10/card-11 closure | Outside this finite audit | Out of scope | No broadened closure claim is made |

The eight probe targets were `FourPairCoverage.overlap_of_three_disjoint_pairs`,
`metricObstructionOccurs_of_pairwiseSeparated`, the three exact-sixteen
geometric consumers named above, `FourPairCoverage.overlap_of_disjoint_pairs`,
`BlockerVExactFifteenFourRowCoverage.exists_metricMotif_of_pairwiseSeparated`,
and `BlockerVExactFifteenFourRowCoverage.false_of_positionEmbedding_membershipRows`.

## Reuse and provenance record

One bounded reuse query searched the indexed Lean corpus for a generic
seven-label lemma with the needed four two-point overlap conclusion. No
suitable result surfaced. The exact-fifteen helper
`FourPairCoverage.overlap_of_disjoint_pairs` is cardinality-specific to a
six-element universe and cannot be reused for this seven-label pigeonhole.
The corpus was `erdos-97-96-formalization-lean`, indexed 2026-09-06 16:00 UTC
at source `ec13064a5`.

The target module imports the shared separation layer, the finite row
cardinality helper, the exact-fifteen coverage module, and
`KalmansonFourEqualitySchemas`. The current frozen bank sets contain neither
the exact-sixteen module nor `FourPairCoverage`, so no bank refreeze is needed.
The governed build and fresh probe covered the named source closure only; the
whole graph was not rebuilt. This audit makes no headline, P97 publication-root,
or exact-cardinality lift claim beyond the exact-sixteen model.
