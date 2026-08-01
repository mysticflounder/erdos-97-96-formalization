# Recovered three-certificate global theorem-bank audit

Date: 2026-07-29  
Mode: read-only audit; no Lean, generator, certificate, or git changes

## Verdict

All three equality-only contradictions in
`phase3_new_survivors_singular_cert_3_recovered_20260729` are already banked
in live Lean as reusable geometric obstruction consumers. They are not merely
external Singular certificates, and no additional import-only banking action
is needed.

This does **not** establish Phase-3 coverage or terminal Problem 97 closure.
The first missing mathematical bridge is a producer/classifier proving that a
live carrier/Phase-3 branch contains one of the banked core structures. The
valid recovered manifest itself explicitly records
`lean_kernel_checked = false`, `phase3_completeness_claimed = false`, and
`p97_closure_claimed = false`; those flags describe the external artifact, not
the separately checked Lean consumers.

Validated manifest:

- path:
  `scratch/p97-distinct-distance-lane/phase3_new_survivors_singular_cert_3_recovered_20260729/manifest.json`
- SHA-256:
  `18383c3fc3dfb40730b18552cdb2bf141f20bfa0989bdb7f12b2a8a5e94c25f5`
- scope: equality-only; no blockers, inequalities, or off-support exactness

## Exact system-to-bank mapping

| recovered system | matching Lean ingress | theorem-facing geometric consumer | status |
|---|---|---|---|
| S00, row hash `398b59017a31…`, payload `ac94fbf0cfa…` | `Census554/NineCenterEighteenEqualityCertificate.lean` | `EqualityCore.not_realizes_of_nineCenterEighteenEqualityCollisionCore` | Banked. The core retains the 18 algebraically active equalities from the 30 generated row equalities. |
| S02, row hash `b66cc99cc9ed…`, payload `1e8658c4b504…` | `Census554/SixPointFifteenIncidenceCertificate.lean` | `SixPointAlgebraicRowCollisions.FifteenIncidenceCore.not_realizes` | Banked. The generic six-label core uses 15 row memberships, yielding the 9 retained equality facts. |
| S03, row hash `540659aed8ba…`, payload `54e13b10908c…` | `Census554/SixPointSixteenIncidenceCertificate.lean` | `SixPointAlgebraicRowCollisions.SixteenIncidenceCore.not_realizes` | Banked. The generic six-label core uses 16 row memberships, yielding the 10 retained equality facts. |

The three payload, source-system, and source-row hashes in the generated Lean
headers agree with the valid recovered manifest. The geometric statements are
stronger for reuse than a concrete ten-label enumeration: they rule out any
ambient row pattern containing the stated subsystem.

## Live import and consumer status

`Census554/AlgebraicRowCollisionBank.lean` imports both theorem-facing adapter
modules, includes all three cores in
`EqualityCore.AlgebraicRowCollisionAlternative`, and dispatches them through
`not_realizes_of_algebraicRowCollisionAlternative`.

`Census554/GeneralCarrierBridge.lean` imports that bank and exposes the
algebraic alternative as the last branch of `MetricCoreAlternative`. Its own
module documentation and theorem signature make the boundary explicit:

- it constructs `rowPattern F` and a genuine geometric `Realizes`;
- it consumes `MetricCoreAlternative F` in
  `false_of_metricCoreAlternative`;
- it **does not** prove that an arbitrary carrier contains a banked core.

The source import graph reaches the aggregate from the public root:

```text
Erdos9796Proof
  -> P97.UpstreamBridge
  -> ... -> P97.RemovableVertexAxiom.PinnedSurplusGeneralM
  -> P97.Census554.PinnedCarrierBridge
  -> P97.Census554.GeneralCarrierBridge
  -> P97.Census554.AlgebraicRowCollisionBank
```

Thus importing the recovered certificate modules into the older
`Phase3SurvivorSingularCertificates.lean` ingress would be redundant and
would not prove coverage.

## Trust and closure audit

`lean_verify` succeeded for:

- `FifteenIncidenceCore.not_realizes`;
- `SixteenIncidenceCore.not_realizes`;
- `not_realizes_of_nineCenterEighteenEqualityCollisionCore`; and
- `not_realizes_of_algebraicRowCollisionAlternative`.

Each has transitive axiom set:

```text
propext
Classical.choice
Quot.sound
Lean.ofReduceBool
Lean.trustCompiler
```

The source scans returned no warnings and no `sorryAx`. Therefore:

1. **Finite certificate ingress:** present as exact generated `SparsePoly`
   data and Boolean unit-ideal checks.
2. **Source-clean geometry wrappers:** present and verified, but transitively
   rely on the `native_decide` trust boundary (`Lean.trustCompiler` and
   `Lean.ofReduceBool`).
3. **Bank aggregate:** present and source-reachable from the public root.
4. **Coverage producer:** absent.
5. **Terminal P97 closure:** absent.

A direct `import Erdos9796Proof` check reported that imports were out of date,
so this audit does not claim a fresh full-root rebuild. Individual theorem
verification and the source import graph establish the current theorem and
reachability facts above.

## Global theorem-bank search

The indexed Lean corpora were searched before the registries. Current-project
results directly surfaced:

- `NineCenterEighteenEqualityCollisionCore` and its no-realization theorem;
- `FifteenIncidenceCore.not_realizes`; and
- `SixteenIncidenceCore.not_realizes`.

Exact names and all three row hashes were then searched across every named
registry and JSON companion:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Those frozen registries contain no exact name or hash match for this recovered
round. They do not supply a duplicate theorem or a missing coverage theorem.
Their closest reusable banks have the same boundary:

- sibling `p97-rvol`: 96 U5 class-level incidence families, 88 metric kernels,
  and 112 scalar kernels, but no arbitrary-packet classifier;
- unimported U1 source-unit consumers: genuine finite contradictions, but no
  row-slot placement/equality producer;
- legacy and older general-theorem archives: bounded scalar/Radon reserves or
  external computational artifacts requiring an exact current producer.

## First missing bridge and cheapest next action

There is no useful import-only action left.

The lowest-cost proof action is to construct one of the already-defined core
structures from a live row packet:

```lean
Nonempty (FifteenIncidenceCore (GeneralCarrierBridge.rowPattern F))
```

or the analogous `SixteenIncidenceCore` /
`NineCenterEighteenEqualityCollisionCore`, then inject it into
`AlgebraicRowCollisionAlternative`. This is a mechanical membership bridge
only when the live branch already provides the required labels and row
memberships.

The first genuinely global missing theorem is a coverage/classification
producer of the shape

```lean
... live Phase-3 or carrier hypotheses ... ->
  AlgebraicRowCollisionAlternative (GeneralCarrierBridge.rowPattern F)
```

or a larger `MetricCoreAlternative F`. It cannot currently be justified from
the recovered three-system manifest, because that manifest expressly makes no
Phase-3 completeness claim.

## Provenance defect to correct separately

The headers of
`SixPointFifteenIncidenceCertificate.lean` and
`SixPointSixteenIncidenceCertificate.lean` still say their validated source is
the old non-recovered directory
`phase3_new_survivors_singular_cert_3_20260729`. That directory is invalid
mixed provenance and must not be treated as the source of record.

The embedded payload/system/row hashes do match the valid recovered manifest,
so this is a stale path annotation rather than a hash mismatch. A later
generator/header-only correction should point both modules at
`phase3_new_survivors_singular_cert_3_recovered_20260729`.
