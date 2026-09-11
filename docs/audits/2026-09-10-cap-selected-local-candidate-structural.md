# Structural local-candidate mask semantics

Source/import baseline: `0167dd8efce9914dd2edb22a3ec5a016c88b3f8f`.

`CapSelectedNativeClassifierFacts.localCandidateOK_maskOfFinset_iff`
previously used `native_decide +revert` to enumerate centers, deleted labels,
and eleven-bit row masks. The theorem statement and its consumers are
unchanged.

The replacement first proves that `countPoints` is the length of a filtered
list. For lists of distinct `Fin 11` labels, `has_maskOfFinset` then converts
that filter into membership in the source finite set, whose length is the
cardinality of a finite-set intersection. Fixed label lists instantiate this
general lemma for the Moser and cap conditions. The only remaining case split
is over the eleven values of the center label.

The small `by decide` terms prove literal list identities and duplicate-free
facts by ordinary kernel reduction. This theorem contains no `native_decide`
and does not call the three native facts that remain in the module.

Validation after the edit:

- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierFacts`
  completed all 9004 jobs; its log is
  `lean/.lake/lake-build-logs/11848-1789106387006770000.log`.
- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound`
  completed all 9005 jobs; its log is
  `lean/.lake/lake-build-logs/52410-1789106646906198000.log`.
- `#print axioms` reports `propext`, `Classical.choice`, and `Quot.sound` for
  both the replacement theorem and
  `rowOfPattern_mem_candidateRows_of_localCandidateSpec`, with no `sorryAx`,
  `Lean.ofReduceBool`, or `Lean.trustCompiler`.
- Independent review found no correctness, circularity, or trust blocker. Lean
  reports a nonblocking flexible-tactic style warning for the final
  `simp`/`fin_cases` normalization.

The exact recapture is recorded in
[`2026-09-10-cap-selected-local-candidate-structural-axioms.json`](2026-09-10-cap-selected-local-candidate-structural-axioms.json).
