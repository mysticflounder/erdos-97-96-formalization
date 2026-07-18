# Exact-six mutual equal-blocker bisector audit

Date: 2026-07-18

Status: **NO DIRECT `FALSE`. THE PRODUCTION TWO-OMITTED-BLOCKER THEOREM HAS
BEEN INSTANTIATED AT THE CURRENT EQUAL-BLOCKER FIBER. ITS SECOND-FIBER ARM
CHANGES THE CENTER BUT NOT THE PAIR; ITS LARGER-FIBER ARM RETAINS THE PAIR
BUT NOT A DISTINCT CENTER. EXACT CAP SIX DOES NOT CHANGE EITHER OUTPUT. A
KERNEL-CHECKED EXACT FINITE BOUNDARY RETAINS ALL-CENTER FOUR-POINT ROWS,
TOTAL SUPPORT LOCKING, THE SELECTED-ROW MINIMALITY CONSEQUENCE, AND CAP SIX,
YET THE PRODUCTION THEOREM SELECTS A SECOND FIBER WHILE NO DISTINCT BLOCKER
ROW CONTAINS THE OLD PAIR. NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/exact6-mutual-equal-blocker-bisector/`. It does not edit
production Lean, closure docs, proof-blueprint state, git state,
`ShellCurvature`, `SurplusM44`, or protected card-five/555/654 files.

## Exact target

The input is

```lean
M : FullParentExactFiveMutualData L profile
Q : FullParentMutualEqualBlockerShell M
hcap : S.oppCap2.card = 6
```

and the requested terminal needs a source `J` whose actual selected row
contains both sources of `Q.criticalFiber`, with

```text
centerAt J != centerAt Q.criticalFiber.source1.
```

After cap placement, those fields instantiate the existing
`SameCapCollisionPairCore.false` consumer. The audit introduces no new
conditional producer packet.

## Required theorem-bank preflight

Before deriving the finite-map specialization, the lane checked all
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered equal-blocker support
locking, distinct actual centers through a prescribed pair, global
minimality/strong connectivity, perpendicular-bisector same-cap consumers,
and exact-six mutual omission. The relevant production hits are:

- `ATailBiApexBlockerMultiplicity.second_fiber_or_larger_first_fiber_of_two_omissions`;
- `ATailCriticalFiberClosingCore.SameCapCollisionPairCore.false`;
- `ATailRetainedCollisionCapLocalization.actualRow_center_eq_commonBlocker_of_sameCap_outside_sources`;
- `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair`; and
- `ATailGlobalMinimalDeletion.exists_fresh_sharedRadiusPair_or_minimalDeletionCore`.

No indexed theorem turns the multiplicity output into reuse of the old pair
at a distinct actual blocker.

## Production multiplicity theorem: exact instantiation

`EqualBlockerBisectorMultiplicity.lean` kernel-checks

```lean
exactSix_secondFiber_or_thirdSource_at_commonBlocker
```

by applying

```lean
second_fiber_or_larger_first_fiber_of_two_omissions
```

to

```text
f         = H.blockerVertex
omitted1  = S.oppApex1
omitted2  = S.oppApex2
source1   = Q.criticalFiber.source1
source2   = Q.criticalFiber.source2.
```

The two omitted-value hypotheses come from `B.firstApex_robust` and
`B.secondApex_robust`; the physical apices are distinct by the retained
common-deletion packet. This is the requested source-faithful use of the
generic theorem, not the anonymous fiber chosen by the wrapper
`exists_two_fibers_or_larger_fiber`.

The exact-six premise is retained in the statement but is unused by the
proof. That is mathematically informative: the theorem is purely a finite
self-map argument, and the equality `S.oppCap2.card = 6` supplies no
additional incidence.

### Larger old fiber

The branch returns a third source with the same blocker value as the old
fiber. The checked theorem

```lean
thirdSource_at_commonBlocker_center_stutters
```

proves that its actual center is literally the old common blocker. Equal
blocker support locking can therefore put the old pair in this selected row,
but it is the same row at the same center. It cannot satisfy the terminal's
distinct-center field.

### Second fiber

The checked theorem

```lean
secondFiber_center_ne_commonBlocker
```

proves that the second fiber's center is genuinely different from the old
common blocker. But the production multiplicity theorem puts the **new
fiber's own two sources** in that row. It contains no premise relating either
of those sources, or their row, to the two old fiber sources. Thus this arm
changes the center but loses the prescribed pair.

This is the exact quantifier mismatch:

```text
larger old fiber:  old pair, old center
second fiber:      new pair, new center
needed terminal:   old pair, new center.
```

## Exact all-center/minimal-row-closure boundary

`MultiplicityFiniteBoundary.lean` applies the production theorem to the
existing fourteen-label full-parent incidence boundary. It kernel-checks:

```lean
production_multiplicity_selects_secondFiber_checked
every_secondFiber_misses_oldPair_checked
exactSix_allCenter_minimality_multiplicity_boundary_checked
```

The combined theorem simultaneously retains:

- an exact six-point physical second cap;
- one exact four-point selected row at every represented center;
- own-source membership in every source-indexed critical support;
- equal-blocker support locking;
- two blocker values omitted by the total map;
- the exact old equal-blocker source pair; and
- the selected-witness consequence of global minimality: every nonempty
  selected-row-closed subset is the whole carrier.

The production two-omitted-values theorem selects its second-fiber arm in
this boundary. Nevertheless, every genuinely different blocker row misses
at least one old fiber source, and globally no distinct blocker row contains
the old pair.

This result is **exact within the displayed finite incidence/cap
abstraction**. It is not a Euclidean `CounterexampleData` realization and
does not model the full quantified `R.noM44` hypothesis. It rejects a proof
which uses only totality, support locking, all-center selected K4,
strong-connectivity/row-closure minimality, blocker multiplicity, and exact
cap cardinality.

## Stronger global minimality audit

The already checked production/scratch bridge

```lean
equalBlocker_globalMinimalDeletion_pairSelectorSplit
```

was freshly re-elaborated against the current tree. Applied to deletion of
the two old fiber sources, global minimality returns exactly one of:

1. a fresh carrier center already equidistant from the pair;
2. a singleton minimal-deletion core; or
3. a nontrivial core whose other disjoint shell survives the proposed
   pointwise deletion.

This still does not force the requested actual row.

- In the co-radial arm, the metric equality is useful, but no current theorem
  puts the fresh center in one nonphysical cap with the old common blocker
  while keeping both pair points outside that cap. Without that placement,
  `outsidePair_unique_capCenter` cannot consume it.
- A singleton pointwise override at a genuinely new center changes only one
  old fiber source's blocker and therefore destroys the old equal-blocker
  fiber.
- A nontrivial core cannot be installed pointwise: another disjoint exact
  shell survives the deletion, contradicting the blocker premise required
  by `overrideAt`.

So full cardinal minimality improves the output from an unrelated second
fiber to a possible raw second bisector center, but it still lacks the global
cap/MEC placement that would make that center terminal.

## Sharp missing global premise

The smallest remaining premise is not another row-count or blocker-fiber
lemma. A direct proof must visibly obtain one of:

1. **Bisector placement:** the fresh co-radial center returned by global
   minimality and the old common blocker lie in one indexed nonphysical cap,
   while both old fiber sources lie outside it. The existing outside-pair
   consumer then gives `False` directly; actual-row provenance is no longer
   needed.
2. **Prescribed-pair reuse:** one source in the second blocker fiber has an
   actual selected row containing both old fiber sources, together with the
   same favorable cap placement.
3. **Direct global geometry:** nonlinear MEC/full-filter geometry, or a new
   support-triangle construction consumed immediately by `R.noM44`, rules out
   the equal-blocker shell without manufacturing a local packet.

The first is the narrowest new target exposed by this audit. It uses the one
new fact supplied by full minimality—a raw second bisector center—rather than
asking blocker multiplicity to preserve both the center and the pair, which
the exact boundary shows it does not do.

## Validation

The scratch predecessor and both owned files were freshly elaborated from
`lean/` through isolated temporary oleans. The global-minimality selector
audit was also re-elaborated. Every command exited zero with warnings treated
as errors for the owned files.

Every printed owned theorem has axiom closure contained in:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean sources contain no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.

## Epistemic ledger

- **PROVED / KERNEL-CHECKED:** the live equal-blocker instantiation of the
  production multiplicity theorem; same-center stuttering on the larger
  fiber; distinct-center polarity on the second fiber.
- **EXACT WITHIN A FINITE ABSTRACTION:** exact cap six, total all-center rows,
  support locking, selected-row closure/minimality projection, a production
  second fiber, and no distinct blocker row through the old pair coexist.
- **PROVED IN RECHECKED SCRATCH:** global minimal deletion of the old pair
  reaches the co-radial/singleton/nontrivial-core selector split, with the
  pointwise override obstructions described above.
- **OPEN:** favorable cap/MEC placement of the fresh co-radial center, or a
  direct full-parent equal-blocker contradiction.
- **PRODUCTION `sorry` CLOSED:** none.
