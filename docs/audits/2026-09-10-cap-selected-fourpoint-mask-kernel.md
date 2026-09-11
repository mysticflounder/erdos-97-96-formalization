# Cap-selected four-point-mask kernel authentication

The general-cardinality cap-selected classifier enumerates four-point supports
as an explicit ascending list of 330 eleven-bit masks. Its proof-facing row
coverage theorem uses the fact that this list is the list of all masks below
2048 having exactly four set bits among the eleven labels.

`CapSelectedNativeClassifier.fourPointMasks_eq_reference` now proves that
identity with ordinary kernel reduction (`decide`). The declaration keeps the
same statement and consumers while dropping the compiler-backed
`native_decide` proof. This is table authentication, separate from the
mathematical replacement of the twelve placement checks.

The bounded reuse preflight found no existing structural theorem for this
project-specific explicit table. Replacing the proof with ordinary reduction
is appropriate for the finite table identity; the reusable geometric work
remains the placement-check replacement beginning with `p = 3, d = 4`.

Validation after the edit:

- Lean diagnostics for the changed declaration reported no errors or warnings.
- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier`
  completed all 3007 jobs; its log is
  `lean/.lake/lake-build-logs/6296-1789102748192107000.log`.
- `lake-build Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound`
  completed all 9005 jobs; its log is
  `lean/.lake/lake-build-logs/42732-1789102981426152000.log`.
- `#print axioms` reports only `propext` for
  `fourPointMasks_eq_reference`.
- The immediate row-coverage consumer still reaches two separate native facts,
  `localCandidateOK_maskOfFinset_iff` and `maskOfFinset_lt_2048`, as well as
  `propext`, `Classical.choice`, and `Quot.sound`. This checkpoint therefore
  removes one native dependency without claiming that the consumer is already
  compiler-trust-free.

The exact recapture is recorded in
[`2026-09-10-cap-selected-fourpoint-mask-kernel-axioms.json`](2026-09-10-cap-selected-fourpoint-mask-kernel-axioms.json).
