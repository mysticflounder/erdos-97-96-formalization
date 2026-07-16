# R unaligned handler

Date: 2026-07-16

Status: **CHECKED-SCRATCH REDUCTION. NO R BRANCH OR PRODUCTION `sorry` IS
UNCONDITIONALLY CLOSED.**

## Scope

This lane owns only:

- `scratch/atail-force/r-unaligned-handler/UnalignedHandler.lean`;
- `scratch/atail-force/r-unaligned-handler/RegressionGate.lean`;
- this report.

It does not edit production Lean, project closure docs, proof-blueprint state,
SurplusM44, `SevenPointTwinFourCircleCollision.lean`,
`CriticalPairFrontier.lean`, the unique-row lane, or any existing scratch
lane.

## Theorem-bank and indexed-corpus preflight

Before deriving the row reduction, the lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` banks;
- `certificates/p97_rvol_general_n_mining.md` and JSON;
- `certificates/erdos97_legacy_general_n_mining.md` and JSON;
- `certificates/erdos_general_theorem_p97_mining.md` and JSON; and
- current indexed Lean results through `nthdegree docs search --lean`.

The banks contain many U5 incidence incompatibilities, but every applicable
`False` theorem needs additional named cross-incidences or a cap/order packet.
No banked theorem consumes only:

```text
firstCenter != p
one q-deleted row at firstCenter
the exact live row at p
one q-deleted row at oppApex2
```

The existing ordered-cap theorem
`CapSelectedRowCounting.outsidePair_unique_capCenter` is the nearest direct
consumer. It closes once the two centers share a cap and two common row
points lie outside that cap.

## Implemented reduction

`firstRow_inter_live_card_le_two` uses the banked two-circle intersection
theorem on:

- `C.row₁`, the exact first common-deletion row; and
- `W.liveRow`, the exact live row at `p`.

Thus an unaligned first row meets `{q,t1,t2,t3}` in at most two points.
`nonempty_unalignedFirstRowOffLivePair` combines this with exact row
cardinality four and extracts two distinct first-row points outside the live
row, retaining ambient membership and their common first-center radius.

For coherent anchored and reciprocal origins,
`nonempty_coherentUnalignedSourceFan` additionally retains the exact
source-indexed U5 fan:

1. the coherent source is outside the live row;
2. it is q-critical at its actual first blocker;
3. the live row is an exact source-deleted row at `p`;
4. the retained second-apex row is an exact source-deleted row at
   `oppApex2`; and
5. all three relevant center separations and the off-live pair remain
   available.

For the spent origin, `spentUnalignedLiveStatus` gives the exact split:

- if the spent source lies in the live row, the live row is q-critical at
  `p`, and actual-blocker avoidance proves `p` differs from both opposite
  apices;
- otherwise the live row is a third exact q-deleted row, beside the two rows
  already carried by the common-deletion packet.

`nonempty_originTaggedUnalignedOutcome` covers all three source-current
origins without projecting away their provenance.

## Exact missing antecedent

The consumer-ready open field is:

```lean
UnalignedCommonCapLiveMultiplicity S W C
```

It asks for one indexed cap containing both `p` and `firstCenter`, with at
least two points in:

```text
C.B₁ ∩ ({q,t1,t2,t3} \ cap)
```

`false_of_unalignedCommonCapLiveMultiplicity` sends this packet directly to
the existing ordered-cap outside-pair theorem. This is a direct `False`
consumer, not another impossible existential producer on the proof spine.

The exact remaining research question is therefore not row existence or
two-circle counting. It is a global cap/order or cross-incidence theorem that
forces this multiplicity packet, or another already-banked U5 antecedent, from
one of the origin-specific fans.

## Regression boundary

`RegressionGate.lean` gives a kernel-checked `Fin 12` incidence model with:

- two four-point rows;
- row overlap at most two;
- two first-row points outside the live row;
- three five-point caps with pairwise one-point intersections;
- ambient cap coverage; and
- individual cap coverage of both centers;

but no cap containing both centers.

This is not a Euclidean counterexample and does not model convexity, MEC,
global K4, exact full filters, or a critical-shell system. It is a dependency
regression: the uniform finite row facts alone cannot prove the missing
common-cap field.

## Validation

Both owned Lean files were checked directly from `lean/` with the
repository-pinned toolchain:

```text
Lean 4.27.0
```

The source-faithful reduction used the current origin-tagged scratch olean
chain:

```bash
env LEAN_PATH="/private/tmp/p97-r-origin-tagged-coordinator-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-root-failure-parent-lift:/private/tmp/p97-r-failure-parent-lift-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-reciprocal-swap-reduction-oleans:/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans" \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/r-unaligned-handler/UnalignedHandler.lean
```

The regression gate was checked with:

```bash
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/r-unaligned-handler/RegressionGate.lean
```

Both commands exited `0`. Every printed endpoint in
`UnalignedHandler.lean` depends only on:

```text
propext
Classical.choice
Quot.sound
```

The regression endpoints have the same core closure, with
`no_common_center_cap` not needing `Classical.choice`.

The owned Lean files contain no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration. No full `lake-build`,
proof-blueprint refresh, production wiring, or publication gate was run.
