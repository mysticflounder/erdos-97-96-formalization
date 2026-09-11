# Structural common-support counting

Source/import baseline: `22a92b60bc724eb789aea136547c1a3fdcd04046`.

`CapSelectedNativeClassifierFacts.countPoints_supportPoints_maskOfFinset`
previously used `native_decide +revert` over all pairs of finite subsets of
`Fin 11`. Its statement and immediate consumer are unchanged.

The replacement writes `supportPoints` as the canonical list of all eleven
labels filtered by membership in the right finite set. The general structural
counting lemma then turns the left mask count into the cardinality of an
intersection. Since the canonical label list represents `Finset.univ`, its
filtered finite set is exactly the right set.

The bounded project-index preflight found `interCard_classMask` and a sibling
`commonPoints_length_maskOfFinset`, but both still use `native_decide`; neither
was imported. The replacement instead reuses the structural membership and
counting lemmas established in this module. Its immediate consumer is
`CapSelectedNativeClassifierSound.rowIntersectionBound_of_incidenceOK`.

Validation after the edit:

- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierFacts`
  completed all 9004 jobs; its log is
  `lean/.lake/lake-build-logs/33858-1789108103856747000.log`.
- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound`
  completed all 9005 jobs; its log is
  `lean/.lake/lake-build-logs/47419-1789108228690144000.log`.
- `#print axioms` reports `propext`, `Classical.choice`, and `Quot.sound` for
  both the replacement theorem and `rowIntersectionBound_of_incidenceOK`, with
  no `sorryAx`, `Lean.ofReduceBool`, or `Lean.trustCompiler`.
- Independent review found no correctness, circularity, or trust blocker.

The exact recapture is recorded in
[`2026-09-10-cap-selected-common-support-structural-axioms.json`](2026-09-10-cap-selected-common-support-structural-axioms.json).
