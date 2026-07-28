# B2 arm 3 — report (2026-07-28)

**Artifact:** `B2Arm3.lean` (902 lines, 15 theorems, no defs).

**Gate:** `cd lean && lake env lean scratch/b-family-bank/B2Arm3.lean` → zero
errors, zero warnings, zero sorries. Inline `#print axioms` on all 15
declarations → exactly `[propext, Classical.choice, Quot.sound]` each. No
`sorryAx`, no `Lean.ofReduceBool`, no `native_decide`, no project axiom. No
production file touched. Imports: `FrontierLiveClosure`, `SurvivalCover`,
`Dumitrescu.L1` (production only — `BFamilyBank.lean` has no `.olean` and is
not imported).

**Tree state:** verified against commit `a0f73bc1`. B1 (`:695`), B2 (`:1150`)
and B3 (`:1224`) all exist as live `sorry` leaves in
`Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.

## Statement fidelity

Whitespace-normalised, `_`-stripped substring match of each leaf's binder
block inside each bank signature: **9/9 pass**.

* B2 binder block `:1151–1209` matches in `b2_arm3_unique_row`,
  `b2_arm3_survives_iff`, `b2_arm3_blockerFiber`,
  `b2_collision_uniform_normalForm`, `b2_arm3_three_class_survivals`.
* Live B1 binder block `:696–726` matches in `b1_live_normalForm`,
  `b1_live_bisectorSet_eq_pair`, `b1_live_false_of_third_bisector_carrier`,
  `b1_live_survives_iff`.

Arm 3 is entered as the third disjunct of the leaf's `_hcollision`. That
disjunct is produced verbatim by
`exactFour_fourSurvivingCenters_survivalSquare_split` (`:915`) and passed at
the live call site `:1406–1413` as `Or.inr (Or.inr hqr)` with
`hqr : first.deleted.1 = (lateFirstApexSystem R).centerAt second.deleted.1
second.deleted.2`. My `hcollision` binder is that proposition, unchanged.

## Correction to the brief: the "missing input" was already in production

The deep-thinker's "strongest fully rigorous lemma" has two parts. Part (2),
the erase-iff corollary, **already exists in production, general and
kernel-checked**:

* `ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`
  (`CriticalPairFrontier.lean:781`) — `E₄(A∖{y}, β(q)) ↔ y ∉ Row(q)`, for any
  `CriticalShellSystem` and any `q ∈ A`. It is already load-bearing: the B2
  split at `:915` calls it.

Two further consequences are also already banked in production:

* `ATailCriticalPairFrontier.blocker_centers_ne_of_not_mem_other_selected_support`
  (`:833`) — the blocker-fiber containment, pointwise.
* `ATailSurvivalCover.actualBlockerFiber_card_le_four` (`SurvivalCover.lean:86`)
  and `selectedSupports_eq_of_actualBlockers_eq` (`:48`).

Part (1), radius uniqueness proper, exists only as
`private theorem criticalRadius_unique_of_blocked`
(`PhysicalSecondApexSwap.lean:96`) — unusable outside that module. `B2Arm3.lean`
banks a public general version.

So the REPORT's diagnosis "arm 3 needs radius-uniqueness at `β(z₂)` analogous
to `R.unique_K4_radius`" was right that the *input* is free, but the input was
not actually absent from the tree. Supplying it does **not** close arm 3.

## §1 — general bank (5 theorems)

| Theorem | Statement |
|---|---|
| `criticalShell_radius_unique` | at `β(q)`, `0 < s` and `4 ≤ \|Λ(β(q),s)\|` ⟹ `s = Row(q).radius` |
| `criticalShell_selectedClass_eq_support` | same hypotheses ⟹ `Λ(β(q),s) = Row(q)` |
| `criticalShell_survives_iff_not_mem_support` | `E₄(A∖{y}, β(q)) ↔ y ∉ Row(q)` (restates the production lemma) |
| `mem_support_of_centerAt_eq` | `β(y) = β(q)` ⟹ `y ∈ Row(q)` |
| `blockerFiber_card_le_four` | `\|{y ∈ A : β(y) = β(q)}\| ≤ 4` |
| `criticalShell_collision_normalForm` | `c = β(x)` ⟹ (`c ∉ Row(x)`) ∧ (unique-four at `c` is `Row(x)`) ∧ (erase-iff at `c`) |

Only `CriticalShellSystem.no_qfree` and shell exactness are used. No
minimality, no cap, no surface.

## §2 — B2, all three collision arms

`b2_collision_uniform_normalForm` takes the B2 leaf's **entire** binder list
including the three-way `_hcollision` and returns a single existential: there
is `x ∈ {u, v, z₂}` with `z₁ = β(x)`, and then

* `Row(x)` is the *only* ambient radius class of size ≥ 4 centred at `z₁`,
* `z₁ ∉ Row(x)`,
* `E₄(A∖{y}, z₁) ↔ y ∉ Row(x)`.

Arm-3 specialisations: `b2_arm3_unique_row` (adds `Row(z₂) = Λ(z₁, d(z₁,z₂))`),
`b2_arm3_survives_iff`, `b2_arm3_blockerFiber` (fiber of `z₁` ⊆ `Row(z₂)`,
card ≤ 4), `b2_arm3_three_class_survivals` (≥ 3 points of the physical
second-apex class lie off `Row(z₂)`, and deleting any of them preserves K4 at
`z₁`; uses `surface` via `actualLateRow_secondClass_card_le_two`).

### Arm 3 does not close — CONJECTURE with exact residual

Every `¬E₄(A∖{y}, z₁)` obtainable in the arm-3 binder context comes from
`no_qfree` at a source `y` with `β(y) = z₁`, and the fiber lemma already puts
every such `y` inside `Row(z₂)`; every `E₄(A∖{y}, z₁)` in context is at
`y = z₁`, which the erase-iff turns back into center exclusion `z₁ ∉ Row(z₂)`
— a fact `b2_collision_center_exclusion` already had. The arm is therefore
internally consistent under all of: `crossPacket`, `first.uPacket`,
`first.vPacket`, `second`'s packets, `no_qfree` at `u`, `v`, `z₁`, `z₂`, and
the seven separation hypotheses.

> **CONJECTURE (B2-arm3-gap).** Under the B2 binder list with
> `z₁ = β(z₂)`, the exact-five cap geometry, no-`(m,4,4)`, and global
> minimality force `False`.

No noncircular proof was found. The concrete shape of what is still missing:
a point `y ∉ Row(z₂)` with `¬E₄(A∖{y}, z₁)`, or a second carrier center
`c ≠ z₁` at which `Row(z₂)` is also a full row. Neither is produced by the
local packet data.

The same argument applies verbatim to arms 1 and 2 (`z₁ = β(u)`, `z₁ = β(v)`),
which is why `b2_collision_uniform_normalForm` is stated for the whole
disjunction: **B2 as a whole is one gap, not three.**

## §3 — the live B1 leaf: a genuine reduction

The live B1 leaf's docstring says support equality, cross-membership and the
exact intersection count "are deliberately reconstructed inside this leaf".
`b1_live_normalForm` performs that reconstruction from the leaf's own binders
in one step each:

| Reconstructed datum | Source |
|---|---|
| `Row(z₁) = Row(z₂)` | `selectedSupports_eq_of_actualBlockers_eq` + `_hblockersEq` |
| `z₁ ∈ Row(z₂)`, `z₂ ∈ Row(z₁)` | rewrite of `q_mem_support` along that equality |
| `\|Row(z₁) ∩ C\| = 2` | `actualLateRow_secondClass_card_le_two R surface first.deleted` (≤ 2) and the pair `{z₁,z₂}` (≥ 2) |

These are exactly the four hypotheses `BFamilyBank.lean`'s B1 theorems had to
**assume**. Consequently:

* `b1_live_bisectorSet_eq_pair` — from the live binders alone,
  `{c ∈ A : d(c,z₁) = d(c,z₂)} = {β(z₁), a₂}`.
* `b1_live_false_of_third_bisector_carrier` — from the live binders alone, any
  third carrier point on that bisector closes the leaf.
* `b1_live_survives_iff` — `E₄(A∖{y}, β(z₁)) ↔ y ∉ Row(z₁)`, a four-point set
  containing both deleted sources.

So the live B1 leaf is now **exactly** (B1-gap), with no reconstruction
overhead left.

## Spine bearing — precise

* **On B2 (`false_of_..._blockerCoincidence`, `:1150`):** `B2Arm3.lean`
  supplies no `False`. `b2_collision_uniform_normalForm` is wire-ready — it
  type-checks against the leaf's exact binder list — but it is a normal form,
  not a closure, so wiring it changes nothing about the leaf's `sorry`. Under
  the project's own promotion rules this is bank value, not spine value.
  It does delete target freedom: it shows the three `_hcollision` arms are one
  case, and it rules out "supply radius-uniqueness at `β(z₂)`" as a route.
* **On B1 (`false_of_twoDistinct..._blockerCollision`, `:695`):** also no
  `False`, but a real narrowing of the residual. The leaf's stated
  obligation drops from "reconstruct the normal form, then find the
  contradiction" to "find a third carrier bisector point (B1-gap)".
  `b1_live_false_of_third_bisector_carrier` is the closer, kernel-checked, in
  the leaf's own context. Round 1 already judged (B1-gap) to be
  task-equivalent to the leaf, and nothing here changes that judgement.
* **On B3 (`:1224`):** untouched; `b3_gap_refuted` in `BFamilyBank.lean`
  already refuted its gap route.

Honest summary: no leaf `sorry` shrinks. The deliverable is (a) a public
general radius-uniqueness/unique-four-center bank, (b) the finding that the
named "missing input" was already in production and does not close arm 3, and
(c) a kernel-checked collapse of live B1 to a single named gap.

## Could not verify

* That `Λ(z₁, r₂)`'s other three points admit any constraint in arm 3 — the
  binder context names none of them.
* Radius uniqueness at `S.oppApex2`: `surface.secondApex_robust.centerAt_ne`
  states `β(x) ≠ a₂` for every `x`, so `a₂` is never a blocker center and §1
  does not apply there. This is the precise reason the mechanism does not
  extend to the physical apex.
