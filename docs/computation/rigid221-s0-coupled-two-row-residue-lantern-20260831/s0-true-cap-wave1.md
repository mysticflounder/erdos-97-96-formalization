# Rigid221 S0 L1 true-cap repair, wave 1

**Base HEAD:** `f26de746bc16d15d891c42ad8cfb42876a63ab06`
**Lane:** `rigid221-s0-coupled-two-row-residue-lantern-20260831`
**Arithmetic policy:** exact rational or exact real-algebraic replay only

## Corrected starting verdict

The displayed twelve-role coordinates are a
`ROW_CORE_POSITIVE_CONTROL`. Their source status is `SOURCE_INVALID`:
their minimum enclosing circle has boundary `{v,xv}`, while physical
`O = S.oppApex2` is strictly inside that disk. The old manual cap is not a
source cap. S0-I and S0-N therefore remain separately `OPEN`.

This wave does not enter L2 or L3.

## Exact finite L1 contract

A candidate reaches source cap ingress only if its retained exact certificate
reconstructs all of the following data.

1. The carrier is nonempty and noncollinear.
2. Three pairwise-distinct carrier roles form a minimum-enclosing-circle
   Moser triangle. All three lie on the MEC boundary, every carrier role lies
   in its closed disk, and the three vertex angle dot products are
   nonnegative.
3. `case_split` is the circumscribed `Or.inl` branch.
4. All three `CapTriple` subsets are the exact `OnArcOpposite` filters, using
   the signed-area product test, including endpoint and opposite-apex
   membership data and the non-Moser one-cap count.
5. A selected surplus cap has cardinality greater than four.
6. `oppIndex2` is the required non-surplus index, its opposite Moser vertex is
   physical `O = S.oppApex2`, and the rotated cap interior `J` is obtained by
   erasing its two Moser endpoints.
7. The exact physical five-fiber, complete `Ku` and `Kv`, rigid `2+2+1`
   traces, mutual omissions, deletion role, strict convexity, and modeled
   singleton blocking checks all hold.
8. S0-I records `xu in J`; S0-N records `xu not in J`. S0-N adds no endpoint
   or closed-cap conclusion.

Finite coordinates do not by themselves reconstruct later `surface`, blocker
provenance, q/w survival, row packets, or `MinimalDeletionCore` fields. Those
interfaces are outside this L1 wave.

## Wave-1 branches

### Coordinate repair

The search retains the existing two-row support/order cell as its baseline and
may add at most two source-legal roles. A successful result must be accompanied
by a standalone exact certificate and an independent exact verifier. No
floating-point tolerance can upgrade a candidate to `SAT_EXACT`.

### Obstruction extraction

The obstruction branch first minimizes the fixed-coordinate failure. Its
smallest source bridge is:

```text
O = S.oppApex2
implies O is one of the three Moser vertices
implies O lies on the MEC boundary.
```

The fixed positive control instead has strict positive MEC slack at `O`.
Any stronger formula result must state its exact bounded coordinate/order/role
scope. It cannot be promoted to a source-universal claim without covering all
source-legal cells and retaining an exact contradiction certificate.

## Results

**EMPIRICALLY VERIFIED (finite exact replay).** The fixed twelve-role cell is
`UNSAT_FIXED_CELL_EXACT` for both S0-I and S0-N: its MEC boundary is exactly
`{v,xv}`, and physical `O = S.oppApex2` has strict interior slack
`3051/6749`. The full packet first fails `hCirc` because only two boundary
roles exist. Relative to the fixed-coordinate MEC background, the independent
one-line minimized source core is the conditional consequence that physical
`O = S.oppApex2` must lie on the MEC boundary.

**EMPIRICALLY VERIFIED (finite exact grid exhaustion).** The bounded
coordinate-preserving repair search retained all twelve coordinates and added
at most two Moser-only roles. It checked:

- one-role branch: 45 enclosing circles, 40,455 slope values, and 3,394
  strict-convex insertions;
- two-role branch: 8 enclosing circles, 7,192 slope values, 273
  strict-convex single insertions, and 16,385 unordered boundary pairs.

Neither branch produced a non-obtuse three-point MEC boundary containing `O`,
so no enumerated candidate reached `CapTriple`, surplus selection, or S0
membership. The retained search status is `ENCODING_BLOCKED`; the unrestricted
addition-only family, deformations of old coordinates, S0-I, and S0-N remain
`OPEN`.

The standalone verifier independently reconstructs the fixed MEC and its
slacks, checks the minimized source core and separate fixed-cell branch
verdicts, and rejects any `SAT_EXACT` or universal-status upgrade. It reports
`VERIFIED_SCOPED_OBSTRUCTION`; no exact surplus-cap witness was reconstructed.

An adversarial proof audit returned `PASS WITH REQUIRED EDITS`. The retained
artifacts incorporate all required edits: `TC-02` is identified as the first
full-packet failure, `TC-03` is retained only as the independent minimized
consequence conditional on the physical-role assignment, and the bounded-grid
language no longer suggests coverage outside its declared centers and slopes.
