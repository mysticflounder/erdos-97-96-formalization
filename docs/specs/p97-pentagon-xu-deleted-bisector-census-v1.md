# The `{xu,deleted}` bisector census (v1)

Records four kernel-checked theorems added to
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`
in commit `5169fa2b`, and the open metric question they isolate.

**Status: PROVEN producers. No leaf closed, nothing promoted.** Spine open count
is unchanged at `126/36264`, and the module still carries the same eight
sorry-bearing declarations as before the change.

Lane: `pentagon-xu-deleted-bisector-20260817`.

## Motivation

The missing-incidence residual
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_uDeletion_fixedPhysicalPair_missingIncidence`
(`Rigid221SourceHeavy.lean:16207`) is a bare `sorry` whose hypothesis is the
negation of a five-part conjunction. Its complete-incidence sibling
`…_uDeletion_false_of_tetrahedron_incidences` (`:15406`) is closed and
core-axiom-clean, and takes no cardinality hypothesis. The five incidences are:

| | Incidence |
|---|---|
| I1 | `centerAt xu ∈ SelectedClass (D.A.erase u) oppApex2 rho` |
| I2 | `oppApex2 ∈ Kxu.support` |
| I3 | `centerAt deleted ∈ Kxu.support` |
| I4 | `oppApex2 ∈ Kdeleted.support` |
| I5 | `centerAt xu ∈ Kdeleted.support` |

An audit of all five found no producer for any of them, and no refutation. The
closure plan's own next-target list for this residual names forcing a third
bisector point as one of the admissible levers; the existing
`pentagonOffClassBlocker_xv_u_bisector_eq_pair` (`:12458`) is the `{xv,u}`
instance. The `{xu,deleted}` instance was untried. This work builds it.

## The theorems

All four report axioms `[propext, Classical.choice, Quot.sound]` — no
`sorryAx`, no `Lean.ofReduceBool`, no `Lean.trustCompiler`.

**`pentagonOffClassBlocker_xu_deleted_bisector_eq_pair`**

```
D.A.filter (fun z ↦ dist z packet.xu = dist z P.jointDeletion.deleted.1) =
  {(lateFirstApexSystem R).centerAt packet.xu Q.hxuA, S.oppApex2}
```

Both named points bisect for source-clean reasons. The `xu`-row centre is
equidistant from `xu` and `deleted` because both lie on that row
(`Kxu.q_mem_support` and `Q.hdeletedXuRow`). The apex is equidistant because
both lie in the physical class at radius `rho` (`packet.physical_class` and
`P.jointDeletion.deleted_mem_class`). They are distinct by
`P.surface.secondApex_robust.centerAt_ne`. `Dumitrescu.perpBisector_apex_bound`
(`P97/Dumitrescu/L1.lean:128`) caps the filter at two, so the census is exact.

**`pentagonOffClassBlocker_oppApex2_not_mem_physicalClass`** — the apex is not
in its own radius class, from `dist_self` against `P.hrho`.

**`pentagonOffClassBlocker_centerAt_xu_eq_v_iff_v_bisects`**

```
(lateFirstApexSystem R).centerAt packet.xu Q.hxuA = P.v.1 ↔
  dist P.v.1 packet.xu = dist P.v.1 P.jointDeletion.deleted.1
```

`v ≠ oppApex2` because `v` is in the physical class and the apex is not, so the
census leaves `centerAt xu` as the only possible match.

**`pentagonOffClassBlocker_xu_deleted_bisector_inter_physicalClass_card_le_one`**
— the bisector meets the physical class in at most one point. This is the `≤ 1`
class-intersection shape the source-clean cross-row consumers take.

## What this buys, and what it does not

I1 is equivalent to `centerAt xu = v`. The argument, which this lane audited but
did not formalize: `mem_selectedClass` puts `centerAt xu` in the class and off
`u`; `Q.hclassFive` narrows to five candidates; `centerAt_ne_source`
(`ATail/MinimalUniqueFourCover.lean:449`) excludes `xu`;
`CriticalFourShell.center_not_mem_support` (`U1CarrierInjection.lean:681`) with
`Q.hdeletedXuRow` excludes `deleted`; blocker injectivity (`:14774`) with
`packet.blocker_eq_xv` excludes `xv`. Only `v` survives. {{NEEDS_PROOF}} — this
equivalence is not yet a Lean theorem; only the census half of the reduction is.

Composing that with the third theorem above:

> **I1 ⟺ `dist v xu = dist v deleted`.**

A cross-centre membership becomes one distance equality among five points that
all lie on a circle of radius `rho` about `oppApex2`. On that circle, `v`
bisects the chord `[xu, deleted]` exactly when `v` is one of the two arc
midpoints.

It also follows that **I1 ⟹ I5**, since `centerAt xu = v` turns I5 into
`Q.hvDeletedRow`. So the case split feeding `:16207` is four-way, not five-way.
This is *not* banked as proof progress: `¬(I1∧…∧I5)` and `¬(I1∧…∧I4)` are
logically equivalent, and restating the leaf would be an equivalent
reformulation.

## Open

Whether `dist v xu = dist v deleted` holds is **undecided**. No exclusion of
`centerAt xu = v` exists anywhere in the tree, and no lemma forces it. Nothing
marks `v` robust — `P.surface.secondApex_robust` covers `oppApex2` only.

Dead for I2/I4: cap counting cannot reach them.
`selectedFourClass_inter_capByIndex_card_le_two` needs the row centre inside
`capByIndex oppIndex2`, but `oppApex2 ∉ capByIndex oppIndex2` — for each
`surplusIdx`, `oppApex2` is the vertex excluded from that cap
(`Cap/Structure.lean:173`, `:181`, `:189`). Reformulated via
`cross_deletion_survives_iff_not_mem_selected_support`
(`ATail/CriticalPairFrontier.lean:781`), I2 and I4 say the apex is a critical
deletion point for a fixed blocker; the tree has no producer and no refuter for
either.

These four theorems are producers. No open obligation consumes them yet.

## Closure-plan insertion — LANDED

Ownership of `docs/computational-closure-plan-2026-07-28.md` was transferred to
this lane on 2026-08-17 after the holding lane went inactive. The paragraph is
landed as "Bisector-lever update (2026-08-16)", immediately after the
"next mathematical target" paragraph of the pentagon `fixedPhysicalPair`
discussion, which names forcing a third bisector point as the first of three
admissible levers.

The landed text adds one qualifier the draft omitted: only the census half of
the I1 reduction is a Lean theorem, and the `I1 ↔ centerAt xu = v` half is
marked {{NEEDS_PROOF}} there as it is here.

## Verification log

- `lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy`
  — exit 0, zero errors.
- `proof-blueprint axioms` on each of the four declarations — core only.
- Sorry-bearing declarations in the module: eight before, eight after.
- `proof-blueprint spine` — `open: 126/36264`, unchanged.
