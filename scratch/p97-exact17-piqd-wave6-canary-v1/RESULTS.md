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

## Waves 26--31: repeated-core audit and lazy continuation

The next six waves again added exactly one authenticated clause apiece:

| Wave | Solve time | Family hits | Bank hits | Linear core rows | Refinement | Successor clauses |
| ---: | ---: | ---: | ---: | ---: | --- | ---: |
| 26 | 14.015 s | 0 | 1 | 4 | generic two-Kalmanson witness | 5,895,189 |
| 27 | 1.659 s | 0 | 1 | 4 | generic two-Kalmanson witness | 5,895,190 |
| 28 | 0.155 s | 0 | 1 | 4 | generic two-Kalmanson witness | 5,895,191 |
| 29 | 6.383 s | 0 | 1 | 5 | weighted Kalmanson witness | 5,895,192 |
| 30 | 1.946 s | 0 | 1 | 5 | generic two-Kalmanson witness | 5,895,193 |
| 31 | 13.829 s | 1 | 1 | 7 | generic two-Kalmanson witness | 5,895,194 |

Waves 27 and 28 had the same minimized four-row strict-LRA core even though the
bank matcher selected different two-Kalmanson presentations. This establishes a
useful repeated-core diagnostic: if a bank witness does not remove a stable
linear support pattern, the weighted consumer can block that minimized support
directly. Wave 29 used that route on its distinct five-row core; its exact
certificate contains 46 Kalmanson terms with positive integer weights at most
two. Wave 30's five-row core did not embed into the existing named increasing or
decreasing schema M, but it did admit a shorter eight-atom generic-bank witness.

Wave 31 is the first model in this segment already hit by the accumulated generic
family. Its survival was therefore a consequence of lazy orbit materialization,
not a new theorem gap. The mandatory indexed general-theorem search was run after
every wave and is recorded in `wave26-general-theorem-search.txt` through
`wave31-general-theorem-search.txt`.

The current root is `postgate-wave31-witness.cnf`, with 5,895,194 clauses and
SHA-256
`1333770e0ed5eb5df7bea029ccaf08816fe785505a6fdbba80e06b9936d0ea27`.
PIQD exported this root byte-for-byte after the final append. Exact 17 remains
SAT and open; no production `sorry` is closed by these six refinements.

## Wave 32: lazy continuation

Wave 32 solved SAT in 0.340 seconds. The total assignment satisfied the exact
Wave 31 root, missed the accumulated 13-motif family, and was rejected by exact
linear arithmetic. The theorem gate found one existing source-clean generic
two-Kalmanson cancellation instance. The mandatory indexed theorem search also
found the named five-row schema M, but an exact check of both cyclic orientations
found no schema-M embedding in this model. One certified eight-atom bank clause
was therefore appended:

`-270 -259 -240 -238 -219 -211 -64 -58 0`

The current root is `postgate-wave32-witness.cnf`, with 5,895,195 clauses and
SHA-256
`d803aa8cb7ca712fd9247c10b27e1c8509df6ca42fddbb7d0b68d4e7a5f34640`.
PIQD exported it byte-for-byte. Exact 17 remains SAT and open.

## Wave 33: stronger sparse six-point consumer

Wave 33 solved SAT in 27.871 seconds. The total assignment satisfied the exact
Wave 32 root, missed the accumulated 13-motif family, hit one generic theorem-
bank instance, and was rejected by exact linear arithmetic.

The mandatory indexed general-theorem search found a strictly stronger existing
consumer:
`Problem97.SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows`.
In the authenticated cyclic order the model contains the six-point occurrence
`(0, 8, 11, 3, 1, 13)`. Its two selected rows produce the six-atom clause

`-185 -180 -178 -13 -8 -3 0`

rather than the generic bank's eight-atom clause. A targeted Lean axiom audit
found only `propext`, `Classical.choice`, and `Quot.sound`; in particular, the
consumer does not depend on `sorryAx` or compiler trust. This occurrence also
identifies a matcher-coverage gap: the source-clean sparse consumer is not yet
recognized by the accumulated 13-motif family.

The current root is
`postgate-wave33-sparse-six-point-witness.cnf`, with 5,895,196 clauses and
SHA-256
`66ca91799491e1514dc178331fc1ae3b675aa5c10a7d6c97133c61be4ac06fdc`.
PIQD exported it byte-for-byte after the one-clause append. Exact 17 remains SAT
and open; no production `sorry` is closed.

## Wave 34: generic witness after named-consumer audit

Wave 34 solved SAT in 0.509 seconds. Its total model satisfied the exact Wave 33
root, missed the accumulated 13-motif family, hit one existing generic theorem-
bank instance, and was rejected by exact linear arithmetic on five selected
rows.

The mandatory indexed theorem search found the normalized five-point
three-shell-equality theorem and the four-point shared-endpoint theorem. Exact
enumeration over every cyclic rotation and both orientations found no embedding
of either named consumer in this model, so the agentic search's suggested
normalization was rejected. The generic two-Kalmanson consumer applies and
yields the eight-atom clause

`-229 -226 -135 -133 -104 -98 -8 -6 0`.

The current root is `postgate-wave34-witness.cnf`, with 5,895,197 clauses and
SHA-256
`277a220b52d8168dc06adef03c1c64775610643bef654f1f50967fe2bea39488`.
PIQD exported it byte-for-byte after the one-clause append. Exact 17 remains SAT
and open; no production `sorry` is closed.

## Wave 35: accumulated-family hit shortened by theorem search

Wave 35 solved SAT in 0.111 seconds. Its total model satisfied the exact Wave 34
root, but was already rejected by one clause from the accumulated 13-motif
family, one existing generic theorem-bank instance, and exact linear arithmetic.
Its survival was therefore caused by lazy orbit materialization, not by a new
mathematical gap.

The mandatory indexed theorem search found sixteen embeddings of the stronger
source-clean sparse six-point/two-row consumer and no embedding of the simpler
shared-pair consumers. The authenticated occurrence
`(0, 10, 7, 16, 1, 13)` yields the six-atom clause

`-128 -122 -114 -16 -13 -10 0`.

The current root is
`postgate-wave35-sparse-six-point-witness.cnf`, with 5,895,198 clauses and
SHA-256
`13be01413c42a4310a8d85e21fd00105ec410a4994c14bd3047e23c4d4ab7937`.
PIQD exported it byte-for-byte after the one-clause append. Exact 17 remains SAT
and open; no production `sorry` is closed.

## Wave 36: repeated sparse-six strengthening

Wave 36 solved SAT in 10.257 seconds. Its total model satisfied the exact Wave
35 root, but was already rejected by one accumulated-family clause, one generic
theorem-bank instance, and exact linear arithmetic. As in Wave 35, this is lazy
orbit materialization rather than a new theorem gap.

The mandatory indexed theorem search found twelve embeddings of the stronger
sparse six-point/two-row consumer and no embedding of the simpler shared-pair
consumers. The authenticated occurrence `(8, 9, 15, 16, 4, 5)` yields the
six-atom clause

`-256 -250 -245 -144 -137 -134 0`.

The current root is
`postgate-wave36-sparse-six-point-witness.cnf`, with 5,895,199 clauses and
SHA-256
`3b81ad37b9fb45882b76ac535ac3598596366ad03a94f36776f87c9e33b9885b`.
PIQD exported it byte-for-byte after the one-clause append. Exact 17 remains SAT
and open; no production `sorry` is closed.
