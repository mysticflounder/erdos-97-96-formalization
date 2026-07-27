# Exact-four / exact-five source-alignment audit

## Verdict

No checked theorem or definitional equality aligns
`ExactFourPhysicalCommonDeletionIngress.source` with a canonical exact-five
cycle source, and no existing producer turns the exact-four ingress into the
selected-shell incidence fields of `ReverseEdgeThirdCriticalReturn`.

For the current card-at-least-twelve exact-four frontier, this is more than a
missing equality: the retained production surface contains an exact-four
ingress and a radius **classification**, but it does not contain an exact-five
profile, continuation, cycle, or common critical-shell system
(`lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:198-210`).

## Source-by-source trace

### Exact-four ingress

`ExactFourPhysicalCommonDeletionIngress` stores an arbitrary carrier source in
`goodOutsideSources R`, its blocker inequality, and a common-deletion packet
over the separately constructed `lateFirstApexSystem R`
(`lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean:417-430`).
Here

```lean
goodOutsideSources R =
  outsideFirstApexFiber R \ badOutsideSources R
```

and `outsideFirstApexFiber` is the complement of the actual-blocker fiber at
the frontier point `F.pair.q`
(`ExactFourPhysicalConsumer.lean:78-109`).  The producer obtains five such
sources, chooses two with distinct blockers, and selects whichever blocker is
not `S.oppApex2`; it records no physical-radius-class or strict-cap membership
(`ExactFourPhysicalConsumer.lean:434-460`).  Its deletion is independently
chosen as `F.pair.q` or `F.pair.w` according to which deletion survives
(`ExactFourPhysicalConsumer.lean:460-488`).

Thus `ingress.source` is neither definitionally the deleted point nor
definitionally a physical exact-five source.

### Exact-five continuation and cycle

`LargeCapUniqueFiveTwoCommonDeletionSources` stores `first` and `second` in
the exact-five physical class and strict cap interior, and stores both as
outside the one selected shell at `unusedRow.unused.point`
(`lean/Erdos9796Proof/P97/ATail/LargeCapUniqueFiveLowHit.lean:91-124`).
Its producer chooses them from

```lean
(physical exact-five class ∩ strict cap interior) \
  selected support at unusedRow.unused.point
```

(`LargeCapUniqueFiveLowHit.lean:142-180`).  Nothing in this construction
mentions the exact-four ingress source or `lateFirstApexSystem R`.

`ExactFivePhysicalCycleParentResidual` retains only
`cycle_start_eq_first : cycle.start.1 = continuation.first`
(`lean/Erdos9796Proof/P97/ATail/PhysicalOmissionCycleParentResidual.lean:52-61`).
Canonical cycle sources are iterates from
`base = successor^[entryTime] start`
(`lean/Erdos9796Proof/P97/ATail/LargeCapUniqueFivePhysicalOmissionCycle.lean:173-197`).
Accordingly, even `continuation.first = cycle.source 0` needs the extra
assumption `entryTime = 0`
(`lean/Erdos9796Proof/P97/ATail/LargeCapUniqueFivePhysicalOmissionTransitionGlobal.lean:501-520`).

The stronger full-parent all-reverse packet does prove that
`continuation.second` occurs on a specially normalized period-three cycle
(`lean/Erdos9796Proof/P97/ATail/ParentExactFiveAssembler.lean:91-123`,
producer at `:138-164`), but still supplies no relation to the exact-four
ingress source.

Every actual cycle source is in `D.A`, the exact-five physical radius class,
and the strict physical cap interior
(`LargeCapUniqueFivePhysicalOmissionCycle.lean:268-289`).  The exact-four
ingress has none of the latter two facts.

### Blocker fibers and selected supports

The general blocker-fiber lemma says that equal blockers force equal selected
supports, and that a blocker fiber has cardinality at most four
(`lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean:39-113`).  It is only
conditional on an equality of blocker centers; neither exact-four nor
exact-five data supplies the needed cross-system equality.

The closest source-to-support theorem,
`source_mem_qBlockerShell_of_actualBlocker_eq`, likewise assumes equality of
two blockers in the **same** `CriticalShellSystem`
(`lean/Erdos9796Proof/P97/ATail/AnchoredDoubleDeletionProducer.lean:141-153`).
It cannot compare `lateFirstApexSystem R` with an unrelated exact-five `H`.

The exact-five normal-form theorems identify each continuation packet's
actual-blocker support with the selected support at its *unused row source*
(`lean/Erdos9796Proof/P97/ATail/LargeCapUniqueFiveCommonDeletionNormalForm.lean:75-111`).
They do not identify that source, support, or blocker with an exact-four
ingress.  The additional checked `exists_third_commonDeletionSource` produces
a third **deletion point outside** that same selected support, not a return
shell containing the cycle point and adjacent blockers
(`LargeCapUniqueFiveCommonDeletionNormalForm.lean:253-322`).

## Why the U5 bank does not finish the alignment

The required terminal theorem is already present:
`U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility`
(`lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean:367-412`).
`ReverseEdgeThirdCriticalReturn` was designed field-for-field to feed it:
one third selected shell must contain the cycle point and the two adjacent
blockers; the third shell's blocker must lie in both canonical erased rows;
and the two adjacent blockers must satisfy the adjacency incidence
(`scratch/atail-force/card12-reverse-edge-u5-adjacent/Card12ReverseEdgeU5Adjacent.lean:82-114`).
The checked adapter and closer are already at `:116-153`.

The theorem-bank registries contain the U5 incompatibility sink, but no
declaration named for or statement-shaped like the exact-four ingress,
physical omission cycle, or third critical return.  Targeted searches of:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- all three concise registries and their JSON inventories; and
- `nthdegree docs search --lean` for exact names, source equality,
  blocker-fiber alignment, and third-return support incidence

found no producer.  Indexed search's closest generic hit was
`source_mem_qBlockerShell_of_actualBlocker_eq`, whose same-system/equal-blocker
hypothesis is precisely data not present here.

## Smallest genuinely missing statement

At the exact-five reverse-edge surface, the smallest stable missing producer is

```lean
theorem nonempty_reverseEdgeThirdCriticalReturn
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (capacity : FrontierCoupledReverseOutsidePairCapacity R) :
    Nonempty (ReverseEdgeThirdCriticalReturn R)
```

(`capacity` may be omitted if the incidence can be proved from `R` alone).
This statement is exactly sufficient for the checked closer at
`Card12ReverseEdgeU5Adjacent.lean:143-153`; an equality
`ingress.source = (cycle.source i).1` alone would supply none of the five
support/adjacency conditions.

For the current exact-four production surface, a prior and genuinely separate
bridge would first be required to construct a compatible exact-five
`profile`/`continuation`/cycle over `lateFirstApexSystem R`.  No such bridge is
present, and the `fivePointRadius` constructor currently gives only
cardinality at least five, not the exact-five profile
(`ExactFourRobustCapExpansion.lean:62-86`).

## Epistemic boundary

This is a source/registry/index audit.  It establishes that no checked producer
was found in the searched production, scratch, sibling-bank, legacy-bank, or
indexed Lean surfaces.  It does not prove mathematical nonexistence of such an
alignment.
