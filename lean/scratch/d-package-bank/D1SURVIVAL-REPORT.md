# D1 global survival — report (2026-07-28)

**Artifact:** `lean/scratch/d-package-bank/D1GlobalSurvival.lean` (700 lines,
30 theorems, no defs, no axioms, no `sorry`, no `native_decide`).

**Gate:** `cd lean && lake env lean scratch/d-package-bank/D1GlobalSurvival.lean`
→ exit 0, zero errors, zero warnings. Inline `#print axioms` on all 30
declarations → exactly `[propext, Classical.choice, Quot.sound]` each. No
production file touched. Imports: `ATail.FrontierLiveClosure`,
`ATail.GlobalMinimalDeletion`, `ATail.TwoCenterCapLocalization`,
`Dumitrescu.L1` (production only — `DPackageBank.lean` has no `.olean`, so §1
re-derives its D1 prerequisites verbatim, exactly as `B2Arm3.lean` did for
`BFamilyBank.lean`).

**Statement fidelity:** the D1 leaf binder block
(`FrontierLiveClosure.lean:5976–5992`) and the binder block of
`d1_pairDeletion_obstruction_census` agree token-for-token after `_`-stripping
and whitespace normalisation.

---

## Headline: the assigned route is refuted, not merely unfinished

The task was: extend the two-apex survival of the D1 swapped common-deletion
pair `{z₁, z₂}` to survival at **every** center of `A ∖ {z₁, z₂}`, then
contradict minimality.

**PROVEN (`pairErase_blocked_at_centerAt`, `not_globalK4_pairErase_of_centerAt_ne`).**
That extension is false whenever `χ(z₁) ≠ z₂`, where `χ = H.centerAt` is the
ambient `CriticalShellSystem`'s chosen blocker map. Reason, in one line:

> `H.no_qfree_at z₁ : ¬ K4(A ∖ {z₁}, χ(z₁))`, and `K4` witnesses are monotone
> in the ambient set, so `¬ K4(A ∖ {z₁, z₂}, χ(z₁))`. Since `χ(z₁) ∈ A` and
> `χ(z₁) ≠ z₁`, that center still lies in `A ∖ {z₁, z₂}` unless `χ(z₁) = z₂`.

**PROVEN (`mutual_centerAt_of_globalK4_pairErase`).** Hence
`HasNEquidistantProperty 4 (A ∖ {z₁, z₂})` forces
`χ(z₁) = z₂ ∧ χ(z₂) = z₁` — the two deleted points must be each other's chosen
blocker centers.

**PROVEN (`singleErase_survives_of_globalK4_pairErase`).** Sharper: global
survival makes `z₂` the *only* carrier point at which the single deletion of
`z₁` destroys `K4` (and symmetrically). So the requirement is a *unique*
mutual blocker pair, not merely a mutual one.

This is not specific to D1, to the D1 pair, or to the particular `H`: it holds
for any `CriticalShellSystem` on any carrier. The single-vertex lever
(`B`-family `not_isRemovableVertex_of_criticalShellSystem`) is not just spent —
its underlying data obstructs every two-point deletion argument of this shape.

## What was delivered

### §2 — general blocker obstruction (11 theorems)

| Theorem | Statement |
|---|---|
| `centerAt_mem_A`, `centerAt_ne_self` | `χ(z) ∈ A`, `χ(z) ≠ z` |
| `pairErase_blocked_at_centerAt` | `¬ K4((A∖z₁)∖z₂, χ(z₁))`, for every `z₂` |
| `centerAt_mem_pairErase` | `χ(z₁) ≠ z₂ ⟹ χ(z₁) ∈ (A∖z₁)∖z₂` |
| `not_globalK4_pairErase_of_centerAt_ne` | `χ(z₁) ≠ z₂ ⟹ ¬ HasNEquidistantProperty 4 ((A∖z₁)∖z₂)` |
| `mutual_centerAt_of_globalK4_pairErase` | global survival ⟹ `χ(z₁)=z₂ ∧ χ(z₂)=z₁` |
| `singleErase_survives_of_globalK4_pairErase` | global survival ⟹ `z₂` is the unique blocker of `z₁` |
| `exists_pairErase_obstruction_center` | outside the mutual shape, a named obstruction center exists |
| `centerAt_ne_of_pairErase_survives` | a center where the pair deletion survives is not `χ(z₁)` |
| `centerAt_row_omits_or_bisects` | `Row(z₁) ∌ z₂`, or `χ(z₁) ∈ Bis(z₁,z₂)` |
| `false_of_globalK4_pairErase` | the minimality consumer: global survival ⟹ `False` |

`false_of_globalK4_pairErase` is the exact interface the route would have
consumed — it is proved, so if a global-survival proof ever appears, D1 closes
by one application. It is `false_of_globalK4_pairErase R.minimal …`; see
`d1_globalSurvival_closes_leaf`.

### §3 — residual census for the surviving (mutual-blocker) shape

* `pairErase_obstruction_row_normalForm` — at any center `c` where the pair
  deletion destroys `K4`, every ambient row `Λ(c,s)` with `|Λ| ≥ 4` satisfies
  either `dist c z₁ = s ∧ dist c z₂ = s` (so `c ∈ Bis(z₁,z₂)`), or
  `|Λ(c,s)| = 4` with exactly one of `z₁, z₂` on it.
* `pair_bisector_carrier_card_le_two` — `|A ∩ Bis(z₁,z₂)| ≤ 2` (Dumitrescu L1).
* `pair_bisector_carrier_mem_secondCapInterior` — every carrier bisector point
  other than `a₂` lies in `Γ₂°` (two-center cap localization).

### §4 — D1 leaf instantiation (3 theorems)

* `d1_pairDeletion_obstruction_census` — over the leaf's **verbatim** binders,
  produces `z₁ ≠ z₂` in `Γ₂°`, co-radial about `a₂`, surviving at `a₁` and
  `a₂`, together with: the bisector bound `≤ 2`, `a₂` on that bisector, every
  other bisector carrier point in `Γ₂°`, the mutual-blocker normal form, and —
  outside it — a named obstruction center with its row normal form.
* `d1_blockerCenter_dichotomy` — `χ(z₁) ∉ {a₁, a₂}`, and either
  `z₂ ∉ Row(z₁)` or `χ(z₁)` is the unique non-`a₂` carrier bisector point and
  lies in `Γ₂°`.
* `d1_globalSurvival_closes_leaf` — global survival for any carrier pair
  closes the leaf, via `R.minimal`.

## PROVEN / CONJECTURE ledger

**PROVEN (kernel-checked, this file).** Everything in the tables above.

**CONJECTURE — D1 itself.** `False` over the D1 leaf binders. Unchanged; no
`sorry` was removed and none can be on the basis of this work.

**CONJECTURE — mutual-blocker impossibility.**
> Under the D1 hypotheses the swapped common-deletion pair `{z₁, z₂}` produced
> by `d1_swappedCommonDeletion_pair` is never a mutual blocker pair, i.e.
> `¬(χ(z₁) = z₂ ∧ χ(z₂) = z₁)`.

I did not prove this. Note that proving it would **not** close D1 — it would
only complete the refutation of the route, turning "the route needs a
coincidence" into "the route is impossible". The mutual shape is highly
constrained (`Row(z₁)` is the exact four-row at `z₂` through `z₁`,
`Row(z₂)` the exact four-row at `z₁` through `z₂`, both of radius
`d = dist z₁ z₂`, and both centers lie in `Γ₂°`), but nothing in the D1 packet
refutes it.

**CONJECTURE — survival at every remaining center, in the mutual shape.**
Even granting `χ(z₁)=z₂ ∧ χ(z₂)=z₁`, nothing here establishes
`∀ c ∈ A ∖ {z₁,z₂}, K4(A∖{z₁,z₂}, c)`. `d1_pairDeletion_obstruction_census`
gives the constraints an obstruction center would have to satisfy, not their
inconsistency.

## Corrections to the brief

1. **`CounterexampleData` has no `Minimal` field.** `Minimal` is a *definition*
   (`U1TwoShortCapReduction.lean:158`),
   `∀ B, B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → D.A.card ≤ B.card`
   (note: `B` need not be a subset of `A`). In the D1 context minimality
   arrives as the field `R.minimal` on
   `ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual`, not on `D`.
2. **`Finset.erase_comm` does not exist** in mathlib v4.27; the name is
   `Finset.erase_right_comm`.
3. **Run B's warning was understated.** The brief and run B say the minimal
   deletion machinery "may return a singleton blocking subdeletion". It is
   stronger than that: for any prescribed pair, `H` *names* a singleton
   blocking center in advance, and `exists_fresh_sharedRadiusPair_or_minimalDeletionCore`
   can never do better than it. The two-point purification is not merely
   unavailable — it is unavailable *for a reason internal to `H`*.

## Consequence for D4 (not formalized here)

Run B's D4 bridge (3) is
`∃ x ∈ {q,w}, ∀ c ∈ A∖{b,x}, K4(A∖{b,x}, c)`, i.e.
`HasNEquidistantProperty 4 ((A ∖ b) ∖ x)`. Applying the banked general theorem
`mutual_centerAt_of_globalK4_pairErase` to the pair `(b, x)` gives
`χ(b) = x ∧ χ(x) = b`. In D4, `b = χ(q) = χ(w)`, so `χ(x) = b` is **free** for
either choice of `x`. The whole of D4's conjectured bridge (3) therefore
reduces to the single condition

> `χ(b) ∈ {q, w}`,

which is a decidable-looking statement about one value of the blocker map
rather than a global survival claim. This is a one-step instantiation of a
theorem in this file; I state it as a **derivation, not a banked theorem** —
it is not compiled here.

## What a next attempt should not do

Do not re-attempt "delete two points, show global survival, contradict
minimality" on any leaf while a `CriticalShellSystem` is in the binder block,
unless the two points are first shown to be a unique mutual blocker pair.
`not_globalK4_pairErase_of_centerAt_ne` refutes the goal outright otherwise.
