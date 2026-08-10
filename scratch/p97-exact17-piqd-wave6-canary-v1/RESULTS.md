# Exact-17 PIQD accumulated-motif canary

Status: three authenticated SAT models rejected by a source-clean generic Lean
consumer. Exact-17 and the production `sorry` remain open.

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
