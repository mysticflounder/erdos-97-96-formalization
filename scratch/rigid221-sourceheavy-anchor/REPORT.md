# Rigid221 source-heavy named-C5 omission-cycle audit

Status: **conditional source-clean sharpening; no anchor closure**.  No
production Lean was edited.

## Bottom line

The anchor's five physical-class row traces are exactly

```text
u -> xu -> deleted -> v -> xv -> u
```

where `q -> r` means that `r` is in `q`'s retained actual critical row.
After an aligned `LargeCapUniqueFiveSecondApexRadius` and a production
`PhysicalActualCriticalOmissionCycle` are supplied, the named C5 gives this
sharp split:

- without `all_reverseMembership`, the production range remains
  `2 <= period <= 5`; the row traces alone exclude none of 2, 3, 4, 5;
- a mutual-omission cycle edge can only be one of the five C5 diagonals;
- `all_reverseMembership` is incidence-consistent, but it forces every cycle
  edge to be the reverse C5 and hence forces `period = 5`;
- consequently all five named class points are strict-cap physical vertices.

This does **not** currently apply unconditionally to the anchor.  The exact
missing constructor field is

```lean
LargeCapUniqueFiveSecondApexRadius.unique_K4_radius
```

at radius `P.rho`.  The anchor supplies `P.hrho` and `P.hclassFive`, but no
uniqueness of every second-apex K4 radius.  The nearest producer,
`ATailBiApexRobustCapBounds.nonempty_largeCapUniqueFiveSecondApexRadius_of_exactFiveSecondCap`,
requires `S.oppCap2.card = 5`, whereas this anchor has `_hsecond : 6 <=
S.oppCap2.card`.

## Exact premise map

Anchor:

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker
```

Let `Hlate := lateFirstApexSystem R` and
`C := SelectedClass D.A S.oppApex2 P.rho`.  Its five traces are obtained as
follows.

| source | exact `C`-trace | anchor producer |
|---|---|---|
| `P.u.1` | `{P.u.1, packet.xu}` | `packet.source_row_trace` |
| `packet.xu` | `{packet.xu, P.jointDeletion.deleted.1}` | `_hdeletedXuRow`, `_htraceBoundXu`, row self-membership |
| `P.jointDeletion.deleted.1` | `{deleted, P.v.1}` | `_hvDeletedRow`, `_huNotDeletedRow`, `_hxuNotDeletedRow`, `_hxvNotDeletedRow`, `_hclassFive`, row self-membership |
| `P.v.1` | `{P.v.1, packet.xv}` | `packet.opposite_row_trace` |
| `packet.xv` | `{packet.xv, P.u.1}` | `_huXvRow`, `_htraceBound`, row self-membership |

The parent-side private producers of the two non-packet trace bounds are

```lean
exactFourRigid221_sourceHeavy_pentagon_xvRow_trace_bound
exactFourRigid221_sourceHeavy_pentagon_xuRow_trace_bound
```

and their common pair classifier is

```lean
exactFourRigid221_sourceHeavy_row_class_pair
```

To enter the omission-cycle API one must additionally supply

```lean
profile : LargeCapUniqueFiveSecondApexRadius D S
hradius : profile.radius = P.rho
```

Equivalently, constructing `profile` directly from the anchor leaves exactly

```lean
{ radius := P.rho
  radius_pos := P.hrho
  class_card_eq_five := P.hclassFive
  unique_K4_radius := ?missing }
```

With those extra premises, use

```lean
ATailLargeCapUniqueFivePhysicalOmissionCycle.
  nonempty_physicalActualCriticalOmissionCycle Hlate profile
PhysicalActualCriticalOmissionCycle.two_le_period
PhysicalActualCriticalOmissionCycle.period_le_five
PhysicalActualCriticalOmissionCycle.source_injective
PhysicalActualCriticalOmissionCycle.successor_not_mem_actualCriticalSupport
ATailLargeCapUniqueFivePhysicalOmissionCycle.
  nonempty_mutualOmissionEdge_or_all_reverseMembership
```

## Edge and period classification under the named C5

For an omission transition, the possible named targets are:

| source | omitted named targets |
|---|---|
| `u` | `deleted`, `v`, `xv` |
| `xu` | `u`, `v`, `xv` |
| `deleted` | `u`, `xu`, `xv` |
| `v` | `u`, `xu`, `deleted` |
| `xv` | `xu`, `deleted`, `v` |

The unordered mutual-omission edges are exactly

```text
{u, deleted}, {u, v}, {xu, v}, {xu, xv}, {deleted, xv}.
```

In the all-reverse arm the only directed omission edges are

```text
u -> xv -> v -> deleted -> xu -> u.
```

Thus a normalized returning orbit with production period in `[2,5]` has
period 5.  This arm is **possible at the exact-row-incidence level**: the
scratch finite check includes the complete reverse-C5 witness.  This is not a
full Euclidean `CounterexampleData` model, so it establishes consistency with
the named traces, not geometric realizability of the active anchor.

The same finite check gives incidence shadows for periods 2, 3, and 4.  Hence
no smaller generic period can be eliminated from the non-all-reverse branch
using only these row traces.

## Common-deletion normal form and terminal audit

Given the additional aligned profile, `_hsecond` feeds

```lean
ATailLargeCapUniqueFiveLowHit.
  nonempty_twoCommonDeletionSources_of_largeCapUniqueFive
    Hlate _hsecond profile
```

The strongest relevant normal-form outputs are

```lean
ATailLargeCapUniqueFiveCommonDeletionNormalForm.
  firstPacket_B₁_eq_secondPacket_B₁
ATailLargeCapUniqueFiveCommonDeletionNormalForm.
  firstPacket_B₂_eq_physicalClass_erase_first
ATailLargeCapUniqueFiveCommonDeletionNormalForm.
  secondPacket_B₂_eq_physicalClass_erase_second
ATailLargeCapUniqueFiveCommonDeletionNormalForm.
  physical_support_inter_card_eq_three
ATailLargeCapUniqueFiveCommonDeletionNormalForm.
  exists_third_commonDeletionSource
```

Normally `exists_third_commonDeletionSource` does not place `third` in the
strict cap.  In the named-C5 all-reverse branch, period 5 forces the entire
five-point class into `physicalVertices profile`, so this `third` is also a
strict-cap physical vertex.  This is the strongest new coupling found.

No proved terminal consumes it.  The production split theorem and
`exists_third_commonDeletionSource` have no downstream production theorem
uses.  The nearest checked terminal is the scratch theorem

```lean
Problem97.ATailExactFiveReverseMembershipClosureScratch.
  false_of_two_reverseRows_common_outsidePair
```

which ultimately calls `Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter`.
It additionally needs two distinct reverse-row blocker centers and two
distinct points `a,b` lying in both rows and outside the physical cap.  The
named C5 plus common-deletion normal form supplies neither a repeated outside
pair nor an identification of the unused-row blocker with two cycle-row
blockers.  Three physical common-deletion sources still share only the same
unused-row support and physical-apex erasure normal form; that is not the
terminal's premise.

## Registry, corpus, and axiom checks

The six theorem-bank registries required by `AGENTS.md` contain no match for
`OmissionCycle`, `all_reverseMembership`, `reverseMembership`, or
`CommonDeletionNormalForm`.  Current-project `nthdegree docs` returned the
production cycle/profile/normal-form APIs above; the sibling `p97-rvol` search
returned only differently shaped U5/C5D3B incidence kernels, with no direct
consumer for this packet.

`C5IncidenceAudit.lean` elaborates with no `sorry`; its printed dependencies
are only `propext`, `Classical.choice`, and `Quot.sound`.  `AxiomAudit.lean`
confirms the cited production cycle, low-hit, and common-deletion theorems also
have no `sorryAx`.  The active anchor itself remains an explicit `sorry`, so
this audit is not closure.

Artifacts:

- `C5IncidenceAudit.lean` — finite named-C5 edge classification and period
  shadows;
- `AxiomAudit.lean` / `axiom-check.log` — transitive axiom audit;
- `lean-check.log` — elaboration and axiom output for the C5 check.
