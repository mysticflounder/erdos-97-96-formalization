# B1 endpoint finite negative control

`lake env lean ../scratch/B1EndpointProducerFiniteCountermodel.lean` passes from
the `lean/` Lake root (Lean 4.27.0).

The file kernel-checks the exact production order predicates
`Problem97.SurplusCOMPGBank.btw` and
`Problem97.ATailFrontierLiveClosure.separatedPair` on the 18-position order
`s,d1,bc,d2,u0,v0,o1,bu,u1,apex,v1,bv,c0,c1,uL,uR,vL,vR`:

* the three disjoint physical pairs cover a six-element class;
* each completed row has four positions;
* all three `separatedPair` facts and their exchange forms hold;
* `btw d1 d2 bc` supplies the deleted-pair blocker-between witness;
* the two-point `u` and `v` same-arc projections are both false; and
* the abstract normal-form third-deletion output bit is false.

This is intentionally not a full `B1GlobalTransportContext`: importing the
production `B1SliceSameBoundaryArc` and endpoint residual would import the
metric/context spine.  The local `finiteSameBoundaryArc` has exactly the
order body of that predicate.  Thus the artifact is a kernel-checked
order/incidence negative control, not a Euclidean realization or a proof that
the full B1 hypotheses are jointly satisfiable.
