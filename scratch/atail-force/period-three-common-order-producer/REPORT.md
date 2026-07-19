# Common-cap-order producer audit

Date: 2026-07-17

Status: **THE SHARED-CAP-ORDER PACKET IS CONSTRUCTIBLE FROM THE ACTUAL COMMON
CAP, THE PHYSICAL OMISSION CYCLE, AND ALL-REVERSE MEMBERSHIP.  IT DOES NOT
NEED TO BE A PUBLIC PREMISE.  THE COMPLETE SCRATCH PROOF ELABORATES AGAINST A
FRESH CURRENT DEPENDENCY CHAIN, HAS NO `sorry`, AND USES ONLY THE STANDARD
AXIOMS `propext`, `Classical.choice`, AND `Quot.sound`.  NO PRODUCTION `sorry`
IS CLOSED.**

The producer itself remains confined to
`scratch/atail-force/period-three-common-order-producer/`.  Clean validation
also required two mechanical repairs to its scratch interface dependencies:
individual dependent structure fields in `CandidateAdapter.lean` and the
namespace opening for `FrontierCommonDeletionParentResidual` in
`PeriodThreeSharedOrderPacket.lean`.  No production Lean, shared documents,
blueprint state, `ShellCurvature`, `SurplusM44`, protected census files, or git
state were changed.

## Required preflight

The audit checked all theorem-bank registries required by `AGENTS.md` and ran
focused `nthdegree docs search --lean` queries for:

- a shared reverse-cycle cap order;
- a retained global cap block;
- fixed-block reverse-row straddling; and
- reflected cap-order normalization.

No banked theorem already derives the requested source-indexed packet.  The
reusable production endpoints are:

- `SurplusCapPacket.capByIndex_cgn4g_strictCapBlockData`;
- `CGN.StrictCapBlockData.exists_index_of_mem_cap`;
- `CGN.oneSidedDistanceInjective_of_mecCapPacket`; and
- the physical-cycle source/interior facts.

The scratch theorem
`nonempty_reverseRowCapStraddle` contains the exact one-row mathematical
argument, but it chooses a fresh ordered-cap presentation for each row.  The
new draft factors that argument through one cap block chosen once.

## Exact result

`ReverseCycleSharedCapOrderProducer.lean` drafts:

```lean
theorem nonempty_reverseCycleSharedCapOrder
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : AllReverseMembership K) :
    Nonempty (ReverseCycleSharedCapOrder K)
```

The theorem is period-parametric.  In particular, `K.period = 3` is not
needed to produce the common order; it is needed only by the later
period-three consumer.

## Implication ledger

| Output field | Producer | Exact implication |
| --- | --- | --- |
| one `block` | `S.capByIndex_cgn4g_strictCapBlockData D.convex S.oppIndex2` | The actual physical cap has one retained strict ordered block. |
| `sourceIndex i` | `K.source_mem_capInterior i`, cap-interior inclusion, then `block.exists_index_of_mem_cap` | Every cycle source is indexed in that same block. |
| `blockerIndex i` | `successor_actualBlocker_mem_physicalCapInterior K hreverse i`, cap-interior inclusion, then the same index extractor | Every reverse-row blocker is indexed in the same block. |
| `source_point`, `blocker_point` | `Classical.choose_spec` for the two preceding index choices | The indices retain the actual source and actual CSS blocker identities. |
| adjacent-source equal radius | `hreverse i` plus the selected row's `q_mem_support` and `support_eq_radius` | The actual blocker sees the current and successor sources at equal radius. |
| blocker differs from both incident sources | `CriticalFourShell.center_not_mem_support` | Only the two incident source identities are excluded. |
| current and successor source indices differ | `K.successor_source_ne i`, `Subtype.ext` | The transition edge remains nontrivial. |
| `straddle i` | `CGN.oneSidedDistanceInjective_of_mecCapPacket` | Equal-distance points cannot lie on the same side of their cap center, so either order orientation is retained. |

The output deliberately does **not** assert that a blocker differs from every
nonincident source.  It also does not choose a global chirality.  Thus legal
blocker/nonincident-source identifications and both boundary orientations
are preserved.

## Construction detail

The important factoring is:

1. choose one `B : CGN.StrictCapBlockData` for the physical cap;
2. choose `sourceIndex i` and `blockerIndex i` in `B.L` for every cycle row;
3. rewrite the actual row-radius equality through those point identities;
4. rule out equality with the two incident sources only; and
5. use the two one-sided distance-injectivity directions to prove the
   orientation disjunction.

Choosing source indices globally is essential.  Constructing independent
per-row straddle packets and then merely collecting them would leave two
potentially different local indices for the same successor source.  The
single source-index function avoids that coherence gap.

## First remaining proof boundary

The producer has no mathematical API or elaboration gap.  The next proof task
is the pointwise local-extremum/Kalmanson consumer that uses this shared order.
No theorem currently turns that consumer into the final T0/T1 metric
contradiction.

Even after elaboration, this producer is not a contradiction.  It removes
`hsharedOrder` as an independent premise and supplies an honest input to the
local-extremum/Kalmanson consumer.  That consumer and the final T0/T1 metric
contradiction remain the live mathematical work.

## Validation status

- theorem-bank and indexed-corpus preflight: completed;
- source implication audit: completed;
- clean scratch dependency chain: freshly elaborated in
  `/private/tmp/p97-common-order-fresh.XUt39M`;
- `CandidateAdapter.lean`: direct scoped Lean check passed;
- `PeriodThreeSharedOrderPacket.lean`: direct scoped Lean check passed;
- `ReverseCycleSharedCapOrderProducer.lean`: direct scoped Lean check passed;
- source scan: no `sorry`, `admit`, or `axiom` commands in the three checked
  files;
- axiom audit for `nonempty_reverseCycleSharedCapOrder`: exactly `propext`,
  `Classical.choice`, and `Quot.sound`;
- full project `lake-build`: not run because these scratch modules are not
  Lake targets;
- production `sorry` closure: none.
