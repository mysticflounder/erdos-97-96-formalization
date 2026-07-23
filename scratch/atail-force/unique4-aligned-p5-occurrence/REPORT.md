# Aligned-p5 source occurrence closure

Date: 2026-07-22

## Result

The aligned `(5,5,4)` constructor of the fixed-card-eleven exact-four split is
closed in Lean, in both source-valid cyclic macro orientations.

The final theorem is:

```lean
Problem97.ATailUniqueFourAlignedP5BoundaryScratch
  .false_of_alignedInteriorFrontier
```

It consumes the actual `OriginalUniqueFourResidual`, the exact cap profile, and
the `AlignedInteriorFrontier`; it does not assume a preselected finite row
assignment. The source boundary normalization produces either a direct or
mirror packet. Each packet supplies an actual `FaithfulCarrierPattern`, traces
its selected rows through a closed native finite search, extracts one of the
four Kalmanson schemas `1, 4, 6, 9`, and feeds the occurrence to a
kernel-checked geometric consumer.

## Native finite identities

- Direct extras: `1, 2, 3, 4, 8, 9, 10`.
- Mirror extras: `1, 2, 3, 7, 8, 9, 10`.
- Every leaf theorem was evaluated with `native_decide`.
- Both aggregate `placementCheck_eq_true` theorems compile from the seven real
  leaf modules.
- Schema 6 uses six ordered roles. The earlier five-role draft was rejected
  because its sixth vertex is an order anchor used by the geometric consumer.

The native search uses only:

- the exact first-apex four-class;
- one selected four-row at every carrier center;
- the proved closed-cap and endpoint row bounds;
- two-circle intersection and cyclic-separation compatibility;
- source-valid local metric cores; and
- Kalmanson schemas `1, 4, 6, 9`.

It does not use the critical map, minimality, retained-pair data, the
second-apex deletion row, curvature, planarity, U5, or strong connectivity.

## Build and axiom gate

The complete direct and mirror chains were compiled with Lean 4.27 from the
repository `lean/` project, with warnings treated as errors. The final axiom
query reports:

```text
[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
```

There is no `sorry`, `admit`, declared project axiom, or temporary interface
axiom in the delivered source.

## Scope

This closes the aligned-p5 constructor only. It does not yet close
`false_of_originalFrontierUniqueRadiusArm` or another production `sorry`,
because the fixed-card-eleven dispatcher still has the p4 exact-two and p5
exact-two constructors. Their external DRAT certificates remain exact for the
hashed formulas but still lack source-to-Lean occurrence ingress.

The next fixed-card task is to extract provenance-preserving DRAT input-core
maps for those two formulas, then decide the smallest source-faithful native
schema cover. The arbitrary-card unique-radius terminal remains independently
open.
