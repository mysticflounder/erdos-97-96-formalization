# Kernel proof of the pinned classifier row

Source/import baseline: `5d5a0e0c7542e135bed1bfa55cfe5b2ba8873220`.

`CapSelectedNativeClassifierFacts.maskOfFinset_pinnedRow` previously used
`native_decide +revert` to check the four admissible pinned surplus-interior
labels. Its statement and consumer are unchanged.

The replacement applies `fin_cases` to the eleven possible `Fin 11` labels.
The hypothesis `pinSource ∈ intS` eliminates seven cases, and ordinary `simp`
kernel reduction verifies the four literal masks for labels 3, 4, 5, and 6.
No native theorem or compiler evaluation is used.

The bounded project-index preflight found the target and its immediate consumer
but no reusable nonnative theorem for the literal seed-row equality. The small
case split is therefore the complete structural interface. Its immediate
consumer is `CapSelectedNativeClassifierSound.rowOfPattern_eq_fixedPinnedRow`.

Validation after the edit:

- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierFacts`
  completed all 9004 jobs; its log is
  `lean/.lake/lake-build-logs/80490-1789109153829977000.log`.
- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound`
  completed all 9005 jobs; its log is
  `lean/.lake/lake-build-logs/89192-1789109194068340000.log`.
- `#print axioms` reports `propext`, `Classical.choice`, and `Quot.sound` for
  both the replacement theorem and `rowOfPattern_eq_fixedPinnedRow`, with no
  `sorryAx`, `Lean.ofReduceBool`, or `Lean.trustCompiler`.
- A source scan finds no `native_decide` or native-decide linter suppression
  anywhere in `CapSelectedNativeClassifierFacts.lean`.
- Independent review found no correctness, circularity, or trust blocker.

The exact recapture is recorded in
[`2026-09-10-cap-selected-pinned-row-kernel-axioms.json`](2026-09-10-cap-selected-pinned-row-kernel-axioms.json).
