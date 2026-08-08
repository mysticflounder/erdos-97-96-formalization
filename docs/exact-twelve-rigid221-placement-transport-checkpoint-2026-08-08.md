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
Lean obligation.  The stop-scaling rule therefore applies to a broad
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
empty, and the manifest does not validate theorem elaboration, execute a
solver, establish coverage, replay a certificate, or close a Lean theorem.

## Exact remaining gate

Source transport is complete for the listed v14 predicates and justifies
replacing the source-separated 24-placement domain by the 12 checked
representatives.  Replay-check equivariance and finite coverage are still
open.  The next production target is therefore:

1. execute a source-faithful CNF valuation for every required cell in the
   frozen 648-coordinate schedule;
2. record authenticated terminal outcomes rather than iteration-limited
   canaries;
3. independently replay every detector family used by those outcomes; and
4. land an aggregate Lean consumer connecting that coverage to the two live
   exact-twelve residual leaves.

The historical eight-placement schedule swapped frozen named roles and remains
only a search heuristic.  No terminal exact-twelve UNSAT certificate,
aggregate 648-cell coverage theorem, or live-leaf closure currently exists.
