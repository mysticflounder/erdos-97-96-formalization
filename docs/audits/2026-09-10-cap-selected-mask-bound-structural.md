# Structural bound for eleven-label bitmasks

Source/import baseline: `61cc049337459ae9db6f5bb61140daec182c4941`.

`CapSelectedNativeClassifierFacts.maskOfFinset_lt_2048` previously checked all
finite subsets of `Fin 11` with `native_decide`. The replacement maps the set
of labels to its set of natural-number indices and applies `Nat.geomSum_lt`.
Each index is below eleven, so the selected sum of powers of two is strictly
below `2 ^ 11 = 2048`.

The theorem statement and consumers are unchanged. This proof is general in
the input finite set and does not enumerate its 2,048 possible values.

The bounded theorem-bank preflight found no existing project theorem that
bounded this `maskOfFinset` definition by `2 ^ 11`; the nearest bitmask results
were other project-specific native checks. The immediate row-coverage consumer also uses
`localCandidateOK_maskOfFinset_iff`, whose ordinary proof still depends on a
structural replacement for `has_maskOfFinset`; those are separate checkpoints.

This checkpoint supersedes the earlier audit's snapshot that listed
`maskOfFinset_lt_2048` among the immediate consumer's native dependencies.

Validation after the edit:

- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierFacts`
  completed all 9004 jobs; its log is
  `lean/.lake/lake-build-logs/74244-1789104412370838000.log`.
- `#print axioms` reports `propext`, `Classical.choice`, and `Quot.sound`, with
  no native-decision axiom, for `maskOfFinset_lt_2048`.

The exact recapture is recorded in
[`2026-09-10-cap-selected-mask-bound-structural-axioms.json`](2026-09-10-cap-selected-mask-bound-structural-axioms.json).
