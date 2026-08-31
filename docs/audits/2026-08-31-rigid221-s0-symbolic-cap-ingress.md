# Rigid221 S0 symbolic cap ingress

**Date:** 2026-08-31

**Lane:** `rigid221-s0-symbolic-cap-ingress-20260831`

**Base:** `b1002c756d483d588a709fef7177c5f1e038545f`

**Status:** bounded off-spine compatibility result; no live-frontier reduction

## Result

The coordinate-dependent radial-support step from the minimized S0 fixed cell
has a coordinate-free cap interpretation.  The new module
`P97/Cap/OrientedCapDeterminantCone.lean` proves:

- `Problem97.radialSupport_of_cap_region_thales`: the Thales inner-product
  conclusion for the cap opposite `apex` is exactly the radial support
  inequality for that cap's chord `O m`;
- `Problem97.CircumscribedMECPacket.radialSupport_of_onArcOpposite`: the same
  fact with boundary, disk, non-obtuse, and non-degeneracy data discharged by
  a circumscribed-MEC packet; and
- `Problem97.CircumscribedMECPacket.false_of_equalRadius_detCone_of_onArcOpposite`:
  a positively oriented MEC cap closes
  `Erdos9796Proof.Geometry.false_of_equalRadius_detCone` from only cap
  membership and the three determinant-cone hypotheses.

The companion module
`P97/SurplusM44Packet/OrientedCapDeterminantCone.lean` supplies indexed wrappers:

- `Problem97.SurplusCapPacket.signedArea2_mul_pos_of_mem_capInteriorByIndex_of_ne`;
- `Problem97.SurplusCapPacket.signedArea2_mul_pos_at_oppIndex1_of_mem_oppIndex2Interior`;
- `Problem97.SurplusCapPacket.not_onArcOpposite_oppIndex1_of_mem_oppIndex2Interior`;
- `Problem97.SurplusCapPacket.radialSupport_of_mem_capByIndex`; and
- `Problem97.SurplusCapPacket.false_of_equalRadius_detCone_of_mem_capByIndex`.

The index occurs in every endpoint role.  Consequently the type records which
support chord is controlled and prevents silently substituting a neighboring
cap.

The algebraic bridge used by the first theorem is

```text
dist O v ^ 2 - inner (m - O) (v - O) = inner (O - v) (m - v).
```

`inner_nonpos_of_cap_region_thales` makes the right-hand side nonpositive.
Positive apex orientation turns the orientation-free `OnArcOpposite` product
into `signedArea2 O m v <= 0`, after which the existing determinant-cone kernel
applies directly.

## Exact S0 cap boundary

For the bounded M0/S0 naming

```text
(triangle.v1, triangle.v2, triangle.v3) = (m1, m2, O)
surplusIdx = 0
```

the two relevant indexed frames are different:

| index | `triangleByIndex` | controlled chord |
|---:|---|---|
| `1` | `(m2, O, m1)` | `O -- m1` |
| `2 = oppIndex2` | `(O, m1, m2)` | `m1 -- m2` |

The invariant determinant kernel needs radial support from base `O` toward
`m1`, hence the index-`1`/`C2` cap.  The live source-row-heavy theorem supplies
`v` in the **strict interior** of the physical second cap, index `2`/`C3`.
Existing cap separation therefore proves that `v` is not in either neighboring
closed cap.  The new indexed strict-sign wrapper states the relevant
consequence directly: the index-`1` signed-area product is strictly positive.
Thus source-heavy data proves the negation of the index-`1` cap condition; it
does not merely fail to supply it.

The minimized fixed-cell assertion at source index `349` is exactly the
index-`1` cap product

```text
signedArea2 v O m1 * signedArea2 m2 O m1 <= 0.
```

Its assertion ledger classifies it as a `CELL_RESTRICTION`, not a
source-universal consequence.  When combined with the source-derived strict
`C3` interior fact, it contradicts cap separation before any metric algebra.
Consequently these experimental `C2` fixed cells are not viable cells of the
source-row-heavy branch.  The determinant theorem remains valid reusable
infrastructure, but it is not a live ingress for this branch.

## Counterexample audit

An initial adversarial audit proposed a rational counterexample to the radial
support implication.  Exact relabeling refuted it as a source counterexample:
the failed inequality used `O = triangle.v3`, while the selected `C3` cap's
support endpoint is `triangle.v1`.  Under the actual indexed frame, the same
witness satisfies the Thales conclusion.  Under the mistaken frame its first
failed hypothesis is the required `OnArcOpposite` product.

This mismatch motivated the indexed wrapper rather than an unindexed
source-specific lemma.

## Reuse preflight and remaining ingress

At base revision `b1002c756d483d588a709fef7177c5f1e038545f`, the bounded
project-index search found `Problem97.inner_nonpos_of_cap_region_thales` as the
exact metric producer and
`Erdos9796Proof.Geometry.false_of_equalRadius_detCone` as the immediate
consumer.  No existing declaration packaged their radial identity or an
indexed-cap wrapper.

The named eventual live consumer remains

```text
false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy.
```

This route is now refuted for the source-row-heavy branch rather than merely
blocked: that branch proves the neighboring index-`1` cap condition false.
Using the actual index-`2` cap changes the determinant base from physical `O`
to `surplusApex`, so the selected-class equal-radius producer no longer matches.
The live context also supplies neither triangle polarity nor either strict turn.
The next source route must therefore use the actual `C3` geometry (or a
different invariant kernel), not seek an index-`1` membership producer.

## Build, trust, and frontier accounting

Both focused builds pass with `LAKE_BUILD_NO_REFRESH=1`; the generic module
built in 3.9 seconds and the indexed wrapper in 3.6 seconds on the warm tree.
The only build warnings are inherited from imported modules.

All eight declarations are registered as deliberate off-spine infrastructure
or compatibility results.  The refreshed call-graph mine verified them
off-spine against `Problem97.erdos97_rhs`.  The repository-wide refs command
still exits nonzero because of pre-existing duplicate-name diagnostics outside
this lane; its batch for the new symbols completed and committed successfully.

An independent read-only verifier rebuilt both modules (8071 jobs), checked the
radial identity, cyclic-area rewrite, sign extraction, determinant roles, and
all three indexed-cap frames, and classified the result as an **independently
verified bounded candidate**.  Source scans found no `sorry`, custom axiom,
`native_decide`, unsafe declaration, or external implementation.  The exact
kernel axiom closure of every public theorem is

```text
propext, Classical.choice, Quot.sound
```

The verifier separately confirmed that no theorem here derives neighboring
`C2` membership from physical second-cap membership.  The live frontier
remains unchanged.
