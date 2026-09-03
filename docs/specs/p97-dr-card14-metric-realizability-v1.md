# P97 D-R card-14 metric-realizability diagnostic v1

This bounded diagnostic tests the authenticated `firstOppositeO1Six` Boolean
survivor from the card-14 profile probe.  It asserts every positive
edge-length equality in PIQD job
`2c036e4c-d8ce-4d0a-a6ed-e4465569207e`, fixes translation/rotation/scale by
`p₀=(0,0)` and `p₁=(1,0)`, and imposes the recorded cyclic order by requiring
every other point to lie strictly left of every directed boundary edge.
The emitted journal replaces each complete positive equality class by a
spanning star; equality transitivity makes this exactly equivalent while
removing redundant nonlinear atoms.

The query intentionally omits negative equality literals.  Therefore UNSAT
would refute the Boolean survivor's positive equality pattern; SAT establishes
only a strictly convex realization of those positive equalities.  Neither
verdict is a Lean proof, a Problem 97 counterexample, or promotion evidence.

The SMT journal contains state commands only.  Solving and model custody are
performed by PIQD; the exact query and receipts are retained under the lane's
registered generated root.

## Result

The uncompressed 172-equality query returned `UNKNOWN` in Z3 4.17.0 and
cvc5 1.3.3.  The equivalent 53-equality basis query also returned `UNKNOWN`
in both engines after the bounded 300-second requests (330-second effective
daemon deadlines).  This supplies neither a realization nor an infeasibility
claim.  In particular it does not discharge the live Lean obligation; a new
source theorem controlling arbitrary carrier cardinality is still required.
