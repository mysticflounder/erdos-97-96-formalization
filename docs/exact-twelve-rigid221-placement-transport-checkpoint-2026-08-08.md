# Exact-twelve Rigid221 placement-transport checkpoint

Date: 2026-08-08

## Result

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

## Computational status

The bounded v18 canary in the new `u/q`, `(jd,v)=(0,4)`, `d=4` cell classified
one additional model.  It produced an equality-duplicate-center certificate
already covered by the cardinality-independent `DuplicateCenterCore` consumer.
The cell remains `ITERATION_LIMIT`; this is not finite coverage and closes no
Lean obligation.  The stop-scaling rule therefore applies to a broad
arm-by-placement canary matrix.

## Exact remaining gate

The relabeling theorem transports source geometry and row patterns, but it does
not yet prove that the source-safe candidate predicate, six named-deletion
arms, distinguished-`d` predicate, or replayed certificate checks are
equivariant.  It therefore does not transport one fixed-cell result across all
42 placements.

The next target is:

1. prove equivariance for each of those finite predicates under the admissible
   relabelings;
2. define and kernel-check a finite placement-orbit representative set; and
3. prove every member of `frozenPlacementDomain` is transported from one of
   those representatives.

Only after those statements land can the CEGAR scheduler replace the raw
42-placement matrix by a justified representative search.  No current theorem
supports the earlier plan language about eight checked placement orbits.
