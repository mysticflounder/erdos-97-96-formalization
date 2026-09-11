# Structural membership for eleven-label bitmasks

Source/import baseline: `a004371854ed77229212ff065f717091d6e0cc44`.

`CapSelectedNativeClassifierFacts.has_maskOfFinset` previously enumerated all
finite subsets of `Fin 11` and all eleven queried labels with `native_decide`.
The replacement maps the labels injectively to natural-number indices and uses
`Finset.toFinset_bitIndices_sum_two_pow`: the set of bit indices in a sum of
distinct powers of two is exactly the original finite set of indices.

The theorem keeps the same statement and consumers. Its proof works from the
finite-set encoding itself and does not enumerate the possible masks or labels.

The bounded reuse preflight found the general binary-expansion theorem in
`Mathlib.Combinatorics.Colex`; no project-specific wrapper already connected it
to this `Fin 11` encoding. This theorem supplies the missing ordinary foundation
for replacing `localCandidateOK_maskOfFinset_iff` next.

Validation after the edit:

- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierFacts`
  completed all 9004 jobs; its log is
  `lean/.lake/lake-build-logs/91233-1789105113372657000.log`.
- `#print axioms` reports `propext`, `Classical.choice`, and `Quot.sound`, with
  no `sorryAx`, `Lean.ofReduceBool`, or `Lean.trustCompiler`.

The exact recapture is recorded in
[`2026-09-10-cap-selected-mask-membership-structural-axioms.json`](2026-09-10-cap-selected-mask-membership-structural-axioms.json).
