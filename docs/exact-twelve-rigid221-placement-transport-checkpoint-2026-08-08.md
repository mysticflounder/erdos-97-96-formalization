# Exact-twelve Rigid221 placement-transport checkpoint

Date: 2026-08-08

## Placement transport result

`ExactTwelveRigid221PlacementTransport.lean` now supplies the first checked
source-level placement transport for the pentagon-off-class exact-twelve lane.
It proves:

- `frozenPlacementDomain` is exactly the ordered pairs of distinct labels in
  the seven-label variable-role vocabulary;
- `frozenPlacementDomain_card` computes its cardinality as 42 by kernel
  reduction (`decide`, not `native_decide`);
- every source-produced `FrozenRoleLabeling` lies in that domain;
- composing a carrier labeling with an admissible label permutation produces
  another fully realized `FrozenRoleLabeling`; and
- `labeledRowPattern_trans` identifies the transported finite rows exactly
  with generic row-pattern reindexing.

The targeted module build passes.  Explicit axiom checks for the cardinality,
row transport, placement membership, and relabeling declarations report only
`propext`, `Classical.choice`, and `Quot.sound`.

The normalized extension now supplies the remaining source-side transport:

- `ExactTwelveRigid221PlacementOrbits.lean` reduces the unrestricted
  42-placement domain to 21 representatives under the admissible action on
  the unnamed labels `3,4,5`;
- after consuming the source-produced physical-pair separation facts, it
  kernel-computes a 24-placement live domain and a stable 12-representative
  list, without swapping the frozen named labels `10` and `11`;
- `ExactTwelveRigid221NormalizedSafeIngress.lean` rederives the interior,
  closed-cap, and safe-cube predicates after normalization;
- `ExactTwelveRigid221BranchTransport.lean` transports the six-arm predicate
  and both distinguished-`d` predicates; and
- `ExactTwelveRigid221NormalizedV14Ingress.lean` carries the physical row,
  actual blocker identities, five exact row traces, and all three v14 branch
  predicates to one of the 12 representatives.

A fresh targeted build of the aggregate normalized-v14 ingress module passes.
Explicit axiom checks for the aggregate transport theorem and the separated
12-representative cover report only `propext`, `Classical.choice`, and
`Quot.sound`; neither depends on `sorryAx`.

This is source ingress plus a placement-coordinate representative cover.  It
is not full finite branch/certificate coverage and not a contradiction.

## Computational status

The bounded v18 canary in the new `u/q`, `(jd,v)=(0,4)`, `d=4` cell classified
one additional model.  It produced an equality-duplicate-center certificate
already covered by the cardinality-independent `DuplicateCenterCore` consumer.
The cell remains `ITERATION_LIMIT`; this is not finite coverage and closes no
Lean obligation.  `ITERATION_LIMIT` is a fail-closed nonterminal/unknown
outcome, not a completed cell.  The stop-scaling rule therefore applies to a broad
arm-by-placement canary matrix.

`census/card_head/exact12_v14_schedule.py` now freezes the resulting
12 x 6 x 9 = 648 Cartesian coordinate schedule under schema
`p97_rigid221_exact12_full_v14_schedule.v1`.  Its canonical payload hash is
`b183cab096266e597362c6919df121cd311c7fc20e155f8b24ef12d23f4bd05b`.
The manifest also binds the supplying Lean source-file bytes.  Six focused
tests cover deterministic cardinalities plus omission, reorder, duplication,
Boolean/integer type confusion, and source-metadata drift; Ruff and the tests
pass.

The schedule is deliberately `ENUMERATION_ONLY`.  Its arm and center fields
are coordinates, not separately proved witnesses.  Cells may overlap or be
empty, and the schedule manifest does not validate theorem elaboration,
execute a solver, establish coverage, replay a certificate, or close a Lean
theorem.

`census/card_head/exact12_v14_jobs.py` now builds one deterministic descriptor
per schedule cell and authenticates the complete ordered 648-job set.  The v1
contract is intentionally `SOURCE_TO_CNF_UNVERIFIED`: every job has execution
`BLOCKED`, and validation rejects schedule/source drift, coordinate tampering,
type confusion, and missing, duplicated, or reordered job-set entries.  This
contract does not execute the solver.  It records the exact missing authority:
a reviewed source-predicate-to-SAT-literal valuation map, authenticated
compiler and variable-map artifacts, and independent model/proof replay.

That finite binding is now implemented under a separate schema instead of
retrofitting the blocked v1 descriptors.  `exact12_v14_valuation.py` compiles
the physical five-cycle, the six named-deletion arms, and distinguished `d`,
pins the exact candidate-table and base-CNF hashes, and independently replays
the added predicates.  All 648 cells compile in the focused regression.  The
72 cells with `d = xu` correctly omit `blocker(xu) != xu`, since the source
blocker domain already excludes its own source; an earlier draft rejected
those cells.

`exact12_v14_bound_jobs.py` authenticates the compiler sources, variable map,
and exact DIMACS bytes.  `exact12_v14_cell_run.py` performs no-proof SAT
discovery, exact CNF and semantic replay for SAT witnesses, and a fresh
identical-CNF DRAT-producing rerun before accepting UNSAT.  Cell 0 is a real
`SAT_WITNESS_REPLAYED` canary.  Thus the incidence compiler is producing
authenticated survivor data, but it is not itself a contradiction or a
coverage result.

`exact12_v14_structural_cegar.py` now supplies the first source-entitled
geometric refinement adapter over that binding.  It accepts a learned clause
only after the existing order-independent metric detector exports a certificate
which the independent structural-certificate validator replays.  Each cut is
then compiled to the exact selected-row variables and written to an
append-only hash chain bound to the cell job and the detector implementation.
The first cell-0 run learned a five-row equality-duplicate-center cut; a fresh
run seeded from that journal authenticated the prior record and learned a
second distinct cut.  Complete journal replay, certificate/chain tamper tests,
SAT source/added-predicate/exact-CNF replay, and focused runner tests pass.
Both canaries ended at `ITERATION_LIMIT`: neither is a terminal cell or a
coverage result.  The pre-contract draft canary is explicitly marked invalid
and must not be used for promotion.

## Exact remaining gate

Source transport is complete for the listed v14 predicates and justifies
replacing the source-separated 24-placement domain by the 12 checked
representatives.  Replay-check equivariance and finite coverage are still
open.  `ExactTwelveV14DuplicateCenterCanary.lean` now translates the first
authenticated structural record to `DuplicateCenterNogood (Fin 12)`, proves
its checker by kernel reduction, and supplies exact- and positive-match source
consumers.  `ExactTwelveRigid221LearnedClauseBridge.lean` now also proves the
missing literal-reflection step: if the canonical source `finalAssign`
falsifies the emitted negative selected-row clause, every recorded support is
the source-selected candidate, hence the duplicate-center record
`PositivelyMatches` the source row pattern.  The canary proves all five record
rows are encodable and composes that exact Boolean premise to `False`.  A
targeted build passes, and proof-blueprint mines 94 dependency edges for the
eight canary declarations with zero edges into axioms.  This is still a
conditional record-ingress/reflection canary, not proof that a terminal bank
forces the Boolean premise.

The source-to-schedule semantic seam is now kernel checked as well.
`ExactTwelveRigid221V14JobSemantics.lean` defines the six named-deletion arms,
the nine admissible distinguished-`d` values, the 648-element semantic job
coordinate type, and the exact `FrozenV14AddedConstraintsHold` predicate.
`ExactTwelveRigid221V14SourceJobBridge.lean` proves that the geometric physical
class and its `xu`-erasure are exactly the frozen compiler sets, translates all
five geometric cycle edges and source labels, and packages every normalized
source packet as one concrete schedule cell satisfying the complete semantic
predicate.  Its targeted build passes; `#print axioms` for
`exists_source_normalized_v14_semanticJob` reports only `propext`,
`Classical.choice`, and `Quot.sound`.  Thus the 648-cell schedule is now
source-entitled at the semantic-predicate level.  This still does not prove
that the corresponding DIMACS/Sinz extension satisfies every emitted clause,
and it supplies no terminal coverage.

The next production target is therefore:

1. prove that the normalized source packet's canonical assignment extends to
   the per-cell auxiliary blocker variables and satisfies every added v14 job
   clause;
2. generate a checked Lean bank from authenticated terminal journals and prove
   that terminal CNF coverage forces one learned clause to be false under that
   source assignment (the learned-clause bridge then supplies the
   `PositivelyMatches` witness);
3. execute the authenticated CEGAR loop to verified terminal outcomes over every
   required cell in the frozen 648-coordinate schedule;
4. aggregate immutable terminal records while rejecting missing, duplicated,
   nonterminal, or unverified cells; and
5. land an aggregate Lean consumer connecting that coverage to the two live
   exact-twelve residual leaves.

The historical eight-placement schedule swapped frozen named roles and remains
only a search heuristic.  No terminal exact-twelve UNSAT certificate,
aggregate 648-cell coverage theorem, or live-leaf closure currently exists.
