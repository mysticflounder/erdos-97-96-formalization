# B1 card-six raw-order bridge

Lane: `luna-swarm-slice-ingress-b1-card6-raw-bridge-20260904`  
Owner: `luna-swarm-slice-ingress`  
Base head: `a064cc226de1946c79101388bfbd0fccd4620899`  
Current build head: `30393754d3bf84021134553749a168cade04be95`

## Source

The owned source is
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixRawOrderBridge.lean`.
Its frozen SHA-256 is
`dc9a31b304dee8229e59583ead8a9e49d2fd69be68f65b050af5c4e93e08d702` and it
contains 532 lines.  It imports only
`B1CardSixPointConfigurationIngress` and
`B1LiveSharedPairNonalternationIngress`; it does not import the retained
RoleProjection WIP or the superseded RawOrderIngress lane.

The source provides:

- a seven-role `RawCardSixRole` carrier;
- `ambientRoleIndices`, its exact finite cardinality, and the sorted
  `orderedRoleEmbedding`;
- the inverse `orderedRoleIndex` and
  `orderedRoleEmbedding_orderedRoleIndex`;
- `raw_btw_iff_ambient` for the sorted ambient indices;
- the corrected six-role predicate `RawCardSixBad` and
  `rawCardSixBad_iff_ambient`;
- endpoint-case transports from raw good data to both
  `B1SliceSameBoundaryArc` witnesses, using
  `P.uPhysical.slice_eq`, `P.vPhysical.slice_eq`, and the source distinctness
  fields; and
- `rawCardSixBad_of_b1PhysicalClassFiveSixNormalForm`, obtained by applying
  the existing checked shared-pair consumer.

## Verification

Focused Lean verification:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixRawOrderBridge.lean
```

exited 0 with only the existing unnecessary-`simpa` linter suggestion at line
128.  The source marker scan for `sorry`, `admit`, `axiom`, `unsafe`,
`native_decide`, `implemented_by`, and `extern` found no matches.

The governed exact-module command was:

```text
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixRawOrderBridge
```

It completed successfully after replaying 10,862 jobs.  The retained log is
`scratch/runs/luna-swarm-slice-ingress-b1-card6-raw-bridge-20260904/run-0001/governed-build.log`
with SHA-256
`a5025052aaad23a6884ae7eddb3a370713d7421201b064d63d2234cd1f26eb78`.
The wrapper's optional proof-blueprint resync reported a pre-existing failure
because the retained RoleProjection WIP has a private indexed declaration
absent from the imported environment; the exact module build itself passed.

The axiom probe imports the owned module and prints axioms for the carrier,
sorted-index, `btw`, corrected target, bridge, and source target declarations.
Every listed declaration reports only `[propext, Classical.choice, Quot.sound]`.
The probe source and output are retained at
`scratch/runs/luna-swarm-slice-ingress-b1-card6-raw-bridge-20260904/run-0001/axiom_probe.lean`
and `axiom_probe.log`; their SHA-256 values are respectively
`40c4bf04e9b4b2aa4adb31e932ff460a79728a41b92b420d65e6e83f5adf5d37` and
`4ea283856345273ba47a288ff391184a7af2fc5d303a07496a06b7a53ccf653f`.

No solver or PIQD launch was made.  No import, promotion, or commit has been
made pending the monitor's semantic audit.
