# Shared-fourth crossed-three-row census (scratch only)

Date: 2026-08-08.  Namespace: `freshthird_crossed_shared_fourth_v1`.

## Scope and source admission

The source target is `FirstFiberCrossedThreeRowExactSupports` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean:534-565`.
The six symbolic roles are the three selected-row centers
`firstCenter`, `commonCenter`, `oppositeCenter`, and the three points
`commonOutside`, `oppositeOutside`, `sharedFourth` (the shared arm identifies
`commonFourth = oppositeFourth`).

The model adds only the three licensed equalities:

* first row: `d(firstCenter,commonOutside) = d(firstCenter,oppositeOutside)`;
* common row: `d(commonCenter,commonOutside) = d(commonCenter,sharedFourth)`;
* opposite row: `d(oppositeCenter,oppositeOutside) = d(oppositeCenter,sharedFourth)`.

Source-proved nonaliases used in the admission audit:

* all three centers are pairwise distinct: the canonical source witness gives
  `commonCenter ≠ firstCenter` and `commonCenter ≠ oppositeCenter`, while the
  enclosing packet assumes `oppositeCenter ≠ firstCenter` (lines 83-85);
* `commonOutside ≠ oppositeOutside` follows from the first exact support and
  its two-point outside pair;
* each row center is outside its own exact support (`center_not_mem_support`),
  giving the center/non-support-point exclusions listed in the source rows;
* `commonOutside` is omitted from the opposite row and `oppositeOutside` is
  omitted from the common row (fields at lines 556-560), and `sharedFourth` is
  fresh from both named row triples (lines 541-548).

The structure does **not** expose the following three center/support
nonaliases, so they are not silently assumed:

`commonCenter = oppositeOutside`, `oppositeCenter = commonOutside`, and
`firstCenter = sharedFourth`.  The eight bit patterns in the JSON enumerate
these three optional aliases.  Any bit pattern containing an alias is marked
`blocked_missing_distinctness_for_strict_six_boundary`: a strict six-index
boundary/Kalmanson order cannot admit duplicate physical points.  This is an
admission result, not a claim that the aliases are realizable.

No source theorem in this structure supplies a cyclic boundary order or the
injective/CCW lift needed by a Euclidean Kalmanson consumer.  Therefore the 60
all-distinct orders (modulo rotation and reversal) are labelled
`candidate_order_missing_source_boundary_lift`; they are diagnostic linear
orders, not source-admitted proof arms.

## Encoding and controls

`census.py` uses `SolverFor("QF_LRA")`, positive symmetric pair distances,
strict triangle inequalities on distinct triples, and both strict Kalmanson
inequalities for every increasing quadruple of each six-role order.  The
SMT-LIB2 artifacts remove z3-only `model-add` commands before cvc5 replay.

Controls ran first and matched exactly:

* unconstrained metric plus the three equalities: `sat` / `sat`;
* full strict Kalmanson order 1: `unsat` / `unsat`.

## Result

`results/census.json` contains 8 alias admissions × 60 order candidates.
All 60 all-distinct candidate arms replayed with exact z3/cvc5 status:

* 20 `unsat`;
* 40 `sat` survivors;
* 60 exact solver matches; no `unknown` or disagreement.

The recurring survivor motif is only the three independent equal-radius
constraints (one pair at each selected center).  Strict metric/Kalmanson
linear arithmetic leaves 40 cyclic orders feasible; it does not close the
shared-fourth arm.  Because all 60 orders lack source boundary admission, the
survivors are empirical QF_LRA diagnostics, not a Lean or Euclidean result.

Files:

* `census.py` — reproducible producer and fail-closed replay;
* `artifacts/*.smt2` — portable cvc5 inputs (controls plus 60 arms);
* `results/census.json` — per-alias/order statuses and SAT models;
* `results/summary.json` — aggregate counts.
