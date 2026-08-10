# Exact-17 PIQD accumulated-motif canary

Status: authenticated SAT refinement through Wave 20. Every model has been
rejected by a source-clean cardinality-generic Lean consumer, but exact-17 and
the production `sorry` remain open.

## Root and custody

The campaign starts from
`scratch/p97-exact17-piqd-refinement-round3-v1/postwave-wave6-base.cnf`:

- variables: 74,813;
- clauses: 4,286,333;
- SHA-256:
  `8d63c8058da1959bce5cb5e86b5459314386c23f6168eed53cd227ea58627ed5`.

PIQD session `66835651-f5f2-4034-8de7-f047524fa305` exported each refined
root byte-for-byte before its successor solve.

## Mandatory theorem gates

The first fresh model hit accumulated motifs 0 and 8. Their complete orbits
added 297,024 novel clauses and produced a 4,583,357-clause root with SHA-256
`85e4e15acb914ef1e0b21499b0ca3d6d60d32f7f3b103ca87af2a69957304fa7`.

Wave 7 then hit motif 3. Its orbit added 148,512 novel clauses and produced a
4,731,869-clause root with SHA-256
`082ba16211c9e516db51088cf6437e552a0f36b8f4d23751484b9d73e7a272ef`.

Wave 8 hit motif 1. Its orbit added 148,512 novel clauses. The next frozen
root has 4,880,381 clauses and SHA-256
`8547bd6b3675e7db0dc7088bdba19ba28ec9851f7f0616c518d87b1870616250`.

Each model was:

1. total over all 74,813 variables;
2. checked against every clause in its exact root;
3. replayed through the source-faithful semantic checker;
4. rejected by exact linear arithmetic;
5. searched against the accumulated motif family and existing theorem bank.

All four hit motifs are accepted by
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`.
A fresh `#print axioms` reports only `propext`, `Classical.choice`, and
`Quot.sound`.

The gate reports are `canary-report.json`,
`wave7-theorem-gate-report.json`, and `wave8-theorem-gate-report.json`.
The refinement receipts are `hit-orbits.receipt.json`,
`wave7-motif3.receipt.json`, and `wave8-motif1.receipt.json`.

This is reusable cardinality-independent theorem-bank refinement, not an
exact-17 coverage certificate or a universal lifting theorem.

## Waves 9--14: complete-orbit refinement

Waves 9--14 continued the same authenticated theorem gate. Their six complete
orbit refinements added 1,014,796 clauses, ending at 5,895,177 clauses with
SHA-256
`a80691d577e02e063a4f3fd8eca3d0e60089c92b57d3f75ba9cc252472fee4ea`.
Every accepted orbit was checked by the same source-clean generic
two-Kalmanson consumer. These waves established useful theorem reuse, but the
growing orbit cost made eager expansion a poor default.

## Waves 15--20: lazy witnessed-instance refinement

Wave 15 exposed the scaling problem directly: its complete generic orbit would
have added 437,580 clauses. The campaign therefore switched to lazy refinement.
The theorem checker still authenticates the complete generic theorem and its
orbit, but the live SAT session receives only one clause that is false in the
current total model. This preserves the proof meaning of the cut while avoiding
eager symmetry expansion.

The lazy refinements were:

| Wave | Gate result | Clauses added | Successor clause count |
| ---: | --- | ---: | ---: |
| 15 | fresh generic two-Kalmanson motif | 1 | 5,895,178 |
| 16 | seven-row weighted Kalmanson certificate | 1 | 5,895,179 |
| 17 | banked generic two-Kalmanson motif | 1 | 5,895,180 |
| 18 | accumulated-family and banked generic motif | 1 | 5,895,181 |
| 19 | accumulated-family and banked generic motif | 1 | 5,895,182 |
| 20 | seven-row weighted Kalmanson certificate | 1 | 5,895,183 |

The Wave 16 certificate uses 49 strict Kalmanson inequalities, ten row
equalities, and positive integer weights of at most two. The Wave 20 certificate
uses 18 strict Kalmanson inequalities, nine row equalities, and unit weights.
Both replay through
`Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check`.

The mandatory general-theorem search after Wave 20 found this existing generic
weighted consumer and several specialized cardinality-independent adapters; no
new theorem was required. The next frozen root is
`postgate-wave20-weighted-witness.cnf`, with SHA-256
`6983368794c5b8b737c23956d9f0452e5734f1b2e81697cdcea5d0585d520656`.
PIQD exported that root byte-for-byte after the one-clause append.

Lazy refinement keeps formula growth essentially flat, but it does not by
itself prove convergence: the campaign remains SAT after Wave 20. The next
step is Wave 21 followed by the same mandatory theorem-bank and general-theorem
gate.

## Waves 21--25: continued lazy refinement

The next five waves preserved the one-witness-clause policy:

| Wave | Solve time | Family hits | Bank hits | Linear core rows | Refinement | Successor clauses |
| ---: | ---: | ---: | ---: | ---: | --- | ---: |
| 21 | 0.121 s | 0 | 0 | 8 | weighted Kalmanson witness | 5,895,184 |
| 22 | 6.429 s | 0 | 1 | 7 | generic two-Kalmanson witness | 5,895,185 |
| 23 | 13.387 s | 0 | 0 | 4 | weighted Kalmanson witness | 5,895,186 |
| 24 | 0.515 s | 2 | 2 | 6 | generic two-Kalmanson witness | 5,895,187 |
| 25 | 12.320 s | 0 | 1 | 9 | generic two-Kalmanson witness | 5,895,188 |

All five total models satisfied their exact predecessor CNFs and were rejected
by exact linear arithmetic. Waves 21 and 23 use the existing source-clean
weighted cancellation consumer; Waves 22, 24, and 25 use the existing
source-clean generic two-Kalmanson consumer. A mandatory indexed general-theorem
search followed every wave. Wave 23's notably small four-row core is retained as
a candidate for later named-theorem mining, but the existing generic weighted
consumer already suffices for its admitted cut.

The current root is `postgate-wave25-witness.cnf`, with 5,895,188 clauses and
SHA-256
`546069bb7406f3f766dad5b111f9e80c0d03a51fb0e8484dcf74ee7043b740ec`.
PIQD exported this root byte-for-byte after the final one-clause append. Relative
to the 5,895,177-clause eager checkpoint, eleven lazy waves have added only eleven
clauses. Exact 17 remains SAT and open; these refinements are theorem-bank reuse,
not a coverage certificate or a production-`sorry` closure.
