# RVOL Wave 2b PiQD canary specification v1

This is a discovery-only, compatibility-class-C lane. It does not reuse or
authenticate the missing upstream Wave-2 producer. Its exact claim identity is
`rvol-wave2b-fin9-natural-order-all-row-atomic-kalmanson-v1`.

## Declared finite cell

The carrier is `Fin 9`, represented by labels `0,...,8` in their natural cyclic
order. The only SAT variables are the 72 membership propositions `x(c,p)` with
`c != p`. A decoded row is exactly the set of positive memberships at its
center. There are no auxiliary variables and hence no decoder ambiguity.

The root CNF requires four members per row, source coverage, pairwise row
intersection at most two, pair codegree at most two, strong connectivity of
the directed support graph, and shared-pair alternation in the fixed cyclic
order. Center exclusion is enforced by omitting `x(c,c)` from the variable
universe. These clauses define the finite abstract cell; they are not presented
as a complete source-level `CounterexampleData` encoding.

## Atomic Kalmanson refinement

Each row equates the four distance pairs from its center. For every
`i < j < k < l`, reduce the two strict Kalmanson vectors

```text
K1 = +d(i,k) + d(j,l) - d(i,j) - d(k,l)
K2 = +d(i,k) + d(j,l) - d(i,l) - d(j,k)
```

through the equality classes. A zero reduced vector is an exact `0 > 0`
contradiction. Two nonzero opposite vectors are an exact contradiction after
addition. Detector order is canonical: lexicographic inequalities, `K1` before
`K2`, first zero vector before first lexicographic opposite pair.

Every admitted lazy clause negates only the positive memberships used by an
explicit equality-path witness. The independent verifier reconstructs the
equality graph from those antecedents and checks cancellation without calling
the producer's detector. A clause that fails this replay is `CERTFAIL` and is
not sent to PiQD.

The strict Kalmanson interfaces are the generic declarations in
`Erdos9796Proof.P97.ATail.CapCrossingKalmanson`. Their geometric hypotheses are
not encoded here, so these clauses are semantic refinements only for the named
finite boundary-order abstraction. No source-preservation or theorem-promotion
claim is made.

## Fail-closed loop

PiQD is the only solver interface. Each SAT assignment is replayed against the
root CNF and decoded cell predicates before inspection. An atomic certificate
is recorded as `SPURIOUS_WITH_REFINEMENT`; a model without one stops as
`ALIVE_UNRESOLVED_ABSTRACT_MODEL` and is never silently blocked. `UNKNOWN`, a
malformed/incomplete model, a replay failure, budget exhaustion, and any PiQD
error are distinct terminal states.

Discovery UNSAT means only that the current authenticated augmented CNF is
unsatisfiable. Abstract-cell coverage additionally requires a fresh terminal
proof over the exact final CNF and independent replay of every refinement.
Neither verdict implies source-level, arbitrary-cardinality, Card18, cap/MEC,
or Lean closure.

The canonical machine-readable contract is
`docs/specs/rvol-wave2b-piqd-canary-v1.json`; every run record binds its
self-hash.

## Controls

Before the canary launches, tests must check DIMACS syntax and replay, reject
partial/contradictory assignments, validate a known atomic contradiction,
validate a detector non-vacuity input with no atomic certificate, reject a
forged local cut, and exercise SAT, UNSAT, UNKNOWN, `MAXITER`, and resume/no-op
states through an injected transport. The live root formula must be previewed
before confirmation.
