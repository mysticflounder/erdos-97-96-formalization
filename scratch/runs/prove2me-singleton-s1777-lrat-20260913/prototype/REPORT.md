# Singleton cell coverage prototype

This governed run tested proof-carrying classification of the `(s1, 777)`
depth-two cell.

The candidate-choice CNF has 248 variables and 18,819 clauses. CaDiCaL and
`drat-trim` established that blocking the target row is unsatisfiable, but the
compact replay package retained seven `native_decide` window axioms. Kernel
`decide` timed out even with one LRAT action per window, a direct proof-term
replay expanded to about 26 MB, and `bv_decide` could not reify the list-heavy
formula. Those replay artifacts remain diagnostic and are not promoted.

The promoted route is a structural compatibility certificate. Its generic
checker requires every candidate-domain value to appear at each split, accepts
a prune only with a concrete failed cross-separation witness against an earlier
assignment, and accepts the sole terminal only when all chosen masks equal the
target. The `(s1, 777)` certificate has 1,115 split states, 37,862 prunes, and
one terminal. Its 31 generated Lean modules contain 1,411,627 bytes and have
path-and-content aggregate SHA-256
`92a6a97caa7965d8951e6eef5094b54581561a3148c7a2c35c565fba647297df`.
The generated root theorem compiles and its final depth-two classifier depends
only on `propext`, `Classical.choice`, and `Quot.sound`.
