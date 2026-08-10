# Ingress contract: retained-core 128

The wave records the retained structural ingress represented by
`FreshThirdAlignedRetainedConsumerPacket` and
`FreshThirdAlignedSourceDeletionCorePacket` in
`TwoSourceFreshThirdRetainedProducer.lean`.

Admitted structural objects are:

- two labelled source rows with exact support cardinality four;
- one singleton first-apex slice per source row and unequal first-apex
  radii;
- one bounded x-endpoint and one bounded y-endpoint deletion choice per row;
- selected endpoint absence, exact-four post-deletion survival, explicit
  first-apex-failure, and nonempty-core fields;
- first-non-hit and second-interaction constructor names plus their source
  field lists as metadata.

All 16 endpoint tuples are retained. For reporting only, each tuple gets the
derived tag `x`, `y`, `x+y`, or `none` according to whether the two rows share
an x endpoint or y endpoint. This tag is never asserted in the solver, so
common omission is conditional metadata rather than universal ingress.

No named consumer query is licensed by this package. Cap geometry, metric or
NRA constraints, Euclidean realizability, arbitrary-carrier extraction/lift,
counterexample interpretation, and Lean closure are explicitly outside the
contract. The package therefore reports structural SAT only.

Current source hashes are recorded in `manifest.json` for Fiber, Residual, and
RetainedProducer. `SHA256SUMS` excludes transient `latest-run.stdout` and
`file-list.actual.txt` outputs so reruns remain deterministic.
