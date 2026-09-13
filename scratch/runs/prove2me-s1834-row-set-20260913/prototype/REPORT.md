# Two-row depth-two coverage prototype

This governed run promotes the structural target-set certificate for the
`(s1, 834)` depth-two search cell. Its two terminal rows are the stored bank
rows `s1_000` and `s1_001`.

The candidate-choice instance has 256 variables and 19,495 clauses. The
structural tree contains 1,382 partial states, 1,380 split nodes, 47,963
explicit separation prunes, and two terminal assignments. Its 62 generated
Lean modules total 1,868,329 bytes. Their sorted path-and-content SHA-256 is
`54146b4ed6b7747b0e0fff596cc249e63c11c6e7956b7031a554ce722ae394a4`.

Fresh generation matches all 62 modules byte-for-byte. The three earlier
singleton certificate families also retain byte-for-byte parity. Lean LSP
elaborates the generated root and the four-cell stored-row dispatcher without
errors. A targeted `lake-build` compilation completed all 1,159 jobs, including
the generated root and the four-cell dispatcher. The Lean-ingress binding check
also passed its semantic probe; each exported declaration depends only on
`propext`, `Classical.choice`, and `Quot.sound`.
