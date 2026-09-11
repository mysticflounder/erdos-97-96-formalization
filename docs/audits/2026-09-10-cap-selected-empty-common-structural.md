# Structural empty-common block semantics

Source/import baseline: `d43cec76421e54f705339841ceefda20f6a8a64d`.
The principal source replacement landed in `77f6b7763`; this audit checkpoint
also removes its stale exhaustive-check options and unused duplicate-free
premise.

`CapSelectedNativeClassifierFacts.allEmptyCommon_capBlocks_iff` previously
used `native_decide +revert` for three fixed interior blocks. Its statement and
three projection theorems are unchanged.

The replacement proves a general list theorem. The executable `List.all` test
succeeds exactly when no label in the supplied list belongs to both source
finite sets, which is equivalent to emptiness of their triple intersection
with the list converted to a finite set. The three block statements follow by
instantiating that theorem with `[7, 8]`, `[9, 10]`, and `[3, 4, 5, 6]`.

The bounded project-index preflight found no nonnative theorem that already
connected `allEmptyCommon` to semantic finite-set intersections. The proof
uses the structural `has_maskOfFinset` interface directly. Its immediate
downstream consumer is `CapSelectedNativeClassifierSound.q3PairOK_rowOfPattern`.

Validation after the final cleanup:

- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierFacts`
  completed all 9004 jobs; its log is
  `lean/.lake/lake-build-logs/58244-1789108988295228000.log`.
- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound`
  completed all 9005 jobs; its log is
  `lean/.lake/lake-build-logs/62126-1789109024193879000.log`.
- `#print axioms` reports `propext`, `Classical.choice`, and `Quot.sound` for
  both the replacement theorem and `q3PairOK_rowOfPattern`, with no `sorryAx`,
  `Lean.ofReduceBool`, or `Lean.trustCompiler`.
- Independent review found no correctness, circularity, or trust blocker. It
  confirmed that the unused duplicate-free premise could be removed because
  `List.all` is insensitive to duplicate entries.

The exact recapture is recorded in
[`2026-09-10-cap-selected-empty-common-structural-axioms.json`](2026-09-10-cap-selected-empty-common-structural-axioms.json).
