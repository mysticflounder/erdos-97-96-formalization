# FreshThird coherent-cap normalization — 2026-08-17

Lane: `codex-freshthird-closure`

## Result

`TwoSourceFreshThirdFiber.lean` now contains two source-clean adapters:

- `freshThirdEqualCenter_distinctCaps_sharedLabels`
- `freshThirdEqualCenter_sameCap_sharedLabel`

Both use only disjointness of strict cap interiors.  Under the equal-center
hypothesis, the first adapter identifies the source-cap labels and the
fresh-cap labels in a coherent distinct-cap pair.  The second identifies the
cap labels in a coherent same-cap pair.

The module builds successfully with `lake-build`
(`Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber`,
build `4ed3428595fe`).

## Closure status

These adapters normalize the two coherent residuals but do not prove `False`.
The remaining missing producer is stronger: it must use the shared
noncanonical cap label together with the exact four-row/support data to create
an existing contradiction consumer (or supply an order/metric bridge).  The
current generic ingress still does not provide that bridge.

The target residual file is owned by `twelvefold-refiner`; no edits were made
to its existing `sorry`s.
