# FreshThird aligned common-deletion pair packet — v2 contract

Status: diagnostic theorem mining only.  This packet is a fresh finite schema
under `scratch/p97-consumer-first/freshthird_aligned_common_deletion_v2/`.
It does not import, call, or mutate the v1 canary, metric encoders, or learned
cuts.  It does not prove a geometric statement, provide a universal lift, or
close any Lean obligation.

## Origin

The source declaration is
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean`:
`FreshThirdAlignedCommonDeletionCorePairPacket` (the declaration around lines
566–588 in the current checkout).  Its two source rows are the fields
`C.firstSource` and `C.secondSource` of
`TwoCapSourceThirdCanonicalRowSurface P Pρ`.

The v2 schema keeps only the following source facts:

1. Each row has an exact four-member finite support and contains both labelled
   source points.  The latter is the mutual-incidence ingress represented by
   `TwoCapSourcesMutualCrossMembership`.
2. First-apex radii are unequal, and each first-apex slice is exactly the
   singleton owned by its row.
3. Row 0 chooses `(x0,y0)` and row 1 chooses `(x1,y1)`, where each `xi` is
   one endpoint of the first retained pair and each `yi` is one endpoint of
   the other retained pair.  The chosen endpoints are absent from their row.
4. Each selected double deletion has source-row survival as an exact surviving
   support-cardinality fact.  First-apex failure and nonempty minimal-core are
   explicit packet fields asserted as source facts; no finite geometry is
   invented to derive them.
5. The common omission is exactly the disjunction `x0 = x1 ∨ y0 = y1`.

There are `2⁴ = 16` joint endpoint tuples and exactly 12 satisfy that
disjunction.  The campaign fixes each of those 12 tuples and checks it
individually.  Four tuples satisfy both equalities; they are retained once,
not duplicated.

## Landing contract

The generated SMT is QF_LIA with Boolean row/slice predicates and integer
endpoint-choice indices.  Each arm is expected SAT in this abstraction; SAT
means only that the listed source facts are jointly consistent in the finite
model.  The positive smoke test checks the unfixed disjunctive schema.  The
negative smoke tests add either an impossible five-member row or a fixed
non-common arm while requiring the common disjunction; both are expected
UNSAT.

The Python harness fails closed on Z3 or cvc5 `unknown`, timeout, malformed
status, or a status mismatch.  cvc5 independently replays every generated SMT
file when available.  Solver output is bounded to one status line per smoke
test and arm; full formulas remain in the per-case `.smt2` files.

No conclusion is drawn about Euclidean realizability, arbitrary carrier size,
the universal first-fiber consumer, a producer-to-consumer lift, or Lean
kernel closure.  This is a source-contract diagnostic only.
