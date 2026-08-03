# FreshThird CEGAR route audit (2026-08-03)

Scope: retained-omission/FreshThird external scripts and the current
`false_of_capSourceThirdCanonicalRowSurface` refactor plan.  No Lean source,
certificate, or theorem-bank file was edited.

## Weakest source-faithful cut

The smallest honest candidate is a branch-preserving adapter for the
`equalCrossRowCenters` constructor only:

```text
c := H.centerAt C.firstSource
q := H.centerAt Q.source₁
u,v := Q.source₁.1,Q.source₂.1
ConvexCyclicOrder D.A c q u v
```

The adapter would export blocker-center subtype values, prove the convex
boundary/index transport, convert the two exact four-point shells to selected
four-class rows, and then call
`CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`.
This is the weakest available metric cut because it adds only the missing
strict order/boundary interface; it does not invent common-radius, five-center,
or first-apex hypotheses.  The order is not present in the live packet and
must be proved or carried by a new producer.  It cannot address
`firstNonHit`/`secondNonHit`, whose packets retain only one-sided deletion
survival/equal support data.  Thus this is a producer/adapter target, not a
closure theorem.

Evidence: `round6-global-bank-audit-20260803.md`,
`freshthird-kalmanson-audit.md`, and the 2026-08-03 refactor-plan checkpoints
(ShellCurvatureRows and retained-opposite-interaction sections) all classify
this bridge as missing and reject wrapper/SAT promotion.

## Bounded smoke

Script: `scratch/retained-omission-e1/round5-general-cegar/n17_freshthird_incidence_probe.py`

SHA-256: `2f53ebdf1c6d7d14ecce02a9cec430dda09a84e1e1697863746860f3bb1c9a59`

The self-check passed for the fixed `(n, cap profile) = (17, 6,8,6)` model.
The targeted equal-center arm was forced externally by adding
`residual["equalCrossRowCenters"]` to the solver; this does not modify the
script or production source.

| run | timeout | overlay | result | artifact |
|---|---:|---|---|---|
| equal-center baseline | 5 s | incidence only | **SAT**, 1.855 s | `artifacts-n17-generic/smoke-equal_base/result.json` |
| equal-center candidate cut | 3 s | cyclic/metric + guarded Kalmanson | **UNKNOWN**, 3.243 s | `artifacts-n17-generic/smoke-equal_kalmanson_overlay/result.json` |

For context, an unconstrained residual smoke at 5 s was **SAT** in the
`firstNonHit` mode (2.262 s); a 1 s incidence run and a 3 s cyclic run both
returned `UNKNOWN` on timeout.  The smoke produced no UNSAT result or learned
cut.

Every result is explicitly external bounded evidence only:
`lean_kernel_proof = false`, `external_solver_only = true`,
`universal_n_claim = false`; coordinates, QF_NRA Euclidean realization, and
Lean ingress are omitted.  The SAT/UNKNOWN statuses therefore do not narrow
the live `FreshThirdNormalizedResidualRemainingCase` obligation.

## Status

No source-clean consumer was found.  The next implementation step is the
order/boundary adapter above (or an equivalent third-incidence/common-radius
producer); keep `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
as the explicit open leaf.  The retained-omission triApex/all-large artifacts
remain out of scope and provide no evidence for this leaf.
