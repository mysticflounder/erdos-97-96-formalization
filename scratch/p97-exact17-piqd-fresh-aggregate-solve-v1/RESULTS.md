# Exact-17 Rank-Four PIQD refinement checkpoint

Status: finite source-faithful CEGAR checkpoint; exact-17 remains open.

## Frozen parent

- root aggregate: 74,813 variables and 4,254,176 clauses;
- root SHA-256: `2aa85c2368c3f271caebe47c4a6b861cc7e64d177cd349e58697a724c4b43605`;
- PIQD session: `b6715bff-6e85-48ea-988d-b7e081e69298`;
- solver: `cadical-3.0.0`;
- first solve: SAT, solve index 1, 9,785 ms.

The immediate session export was byte-identical to the frozen parent.  The
captured total model passed direct DIMACS replay, the source/Z3 validator, the
independent model checker, and the lane's source-semantic analyzer.  It exposed
the banked equality-convex two-Kalmanson cancellation.

## Refinement chain

| Round | Clauses | Ordered batch SHA-256 | Re-solve |
| --- | ---: | --- | --- |
| 1 | 120 | `47bdfd2a8db63a35e06d377c59dce0b58ff005721a3be989af6b9fc2fab1189d` | SAT, index 2, 6,428 ms |
| 2 | 86 | `f1c8baa53e0fffd4a23017ff1f3d00e4c08312f8d96e6da6ae602ab7aeb03bc4` | UNKNOWN at 50,000 conflicts; then SAT, index 4, 5,629 ms without the diagnostic limit |

For round 1, the admission audit scanned all 4,254,176 parent clauses and
proved that all 120 candidates were model-falsified and not subsumed.  Round 2
repeated the full-root audit and also checked the 120-clause parent receipt
before admitting its 86 candidates.

The final export contains 4,254,382 clauses, occupies 196,142,981 bytes, and
has SHA-256
`cf1787a45bb8d0e7b434cf2f733581b08b8a83baebbba22d7efae3aad8cf74bd`.
It was byte-compared with the frozen parent body followed by the two ordered
receipt batches.  The final total SAT model passed all 4,254,176 root clauses,
all 206 receipt clauses, and the source semantics.

## Durable small artifacts

- `cut-b6715bff-1.json` and `cut-b6715bff-2.json`: clause and admission receipts;
- `solve-b6715bff-{1,2,3,4}.json`: solve captures, including the bounded
  `UNKNOWN` canary;
- `model-b6715bff-{1,2,4}.log`: complete SAT assignments;
- `analysis-b6715bff-{1,2,4}.json`: source and formula replay results;
- `session-b6715bff-final.json` and `receipts-b6715bff-final.json`: final live
  daemon snapshot before cleanup;
- `close-b6715bff.json` and `session-b6715bff-closed.json`: clean close response
  and independently fetched closed-session state.

The three approximately 196 MB CNF exports were local comparison artifacts and
are intentionally not part of the checkpoint commit; the final formula is
reconstructible from the already frozen parent plus the two cut receipts.

## Claim boundary

The latest SAT model still has a bank hit.  Therefore this checkpoint proves
that the Rank-Four exact-17 lane can perform authenticated, source-connected,
nonredundant same-session refinement through PIQD.  It does not prove exact-17
UNSAT, close the Rigid221 universal child, or remove a Lean `sorry`.

No certificate-clause identity claim is made.  PIQD certificate preparation
may drop tautological root clauses and renumber subsequent inputs.  Any future
terminal UNSAT publication must bind the session journal to the prepared proof
formula with PIQD's explicit clause-ID map.  Both learned batches here are
independently checked to contain no tautologies or repeated literals.
