# C-package bank — REPORT

Written by the orchestrating session from the banking agent's delivered report
(the agent's own REPORT.md write was blocked by its harness; the content below
is the agent's report of record, 2026-07-28). Source math:
`docs/solve-prompts/2026-07-28-c-round1-response.md` against the leaf
interfaces of `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU`
(C1) and `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision` (C2)
in `FrontierLiveClosure.lean`, landed tree `a0f73bc1`.

## Deliverables

- `CPackageBank.lean` — 18 kernel-checked, `sorry`-free theorems. All eight
  requested targets landed; none dropped or weakened.
- [`FidelityCheck.lean`](../../../attic/p97-package-bank-fidelity-2026-08-30/c-package-bank/FidelityCheck.lean)
  — archived harness, NOT a bank deliverable, deliberately
  contains two `sorry`s: two `False`-goal theorems whose binder lists are
  copied character-for-character from the two leaves; each body applies every
  bank theorem of its leaf. It compiles, which is machine proof that every
  bank hypothesis is derivable verbatim in the leaf context. PARKED-SPEC:
  the harness `sorry`s are not obligations.

## Validation

- Gate: `lake env lean scratch/c-package-bank/CPackageBank.lean` — zero
  errors, zero warnings, exit 0 (re-run independently by the orchestrator).
- All 18 `#print axioms` read exactly
  `[propext, Classical.choice, Quot.sound]` — no `sorryAx`, no
  `Lean.ofReduceBool`/`Lean.trustCompiler`, no project axioms.
- Fidelity harness compiles with only the two intended `sorry` warnings.
- Nothing outside `lean/scratch/c-package-bank/` touched.

## Theorem inventory

Shared helpers:

| Name | Statement |
|---|---|
| `selectedClass_sdiff` | `((A \ E).filter (dist P · = r)) = SelectedClass A P r \ E` |
| `selectedClass_inter_card_le_two` | two-circle bound: `p ≠ q → (Γ(p,r₁) ∩ Γ(q,r₂)).card ≤ 2`, any radii |
| `restored_class_card_ge_four` | blocking at `E` + restoration at `E.erase s` forces `0 < dist P s` and `4 ≤ (Γ(P, dist P s) \ E.erase s).card` |
| `commonDeletion_B₁_eq_lateRow` | a CD certificate's `B₁` around `Hs.centerAt x hx` is exactly that source's full late row |
| `firstApex_mem_A` | `S.oppApex1 ∈ A` (local restatement; project copies are `private`) |
| `oppApex1_ne_oppApex2` | `S.oppApex1 ≠ S.oppApex2` (same) |

Leaf C1 (verbatim C1 binders, `globalDeletion.center = S.oppApex2`):

| Target | Name | Statement |
|---|---|---|
| C1.1 | `c1_globalDeletion_card_eq_two` | `globalDeletion.deleted.card = 2` |
| C1.2 | `c1_unique_K4_radius_at_secondApex` | `∀ r > 0, 4 ≤ (Γ(a₂,r)).card → r = rho` |
| C1.3 | `c1_apexWitness_exactification` | for `z ∈ Γ(a₂,rho)`, `r > 0`, `4 ≤ (Γ_{A∖{z}}(a₂,r)).card` → that class `= Γ(a₂,rho).erase z` |
| C1.3 cor. | `c1_jointDeletion_certificates_saturated` | `uPacket.B₂ = vPacket.B₂ = Γ(a₂,rho).erase z★`; `uPacket.B₁ = Σ'(u)`, `vPacket.B₁ = Σ'(v)`; `uPacket.B₁ ∩ uPacket.B₂ = Σ'(u) ∩ Γ(a₂,rho) = I_u`, likewise for `v` |

Leaf C2 (verbatim C2 binders, `globalDeletion.center ≠ S.oppApex2`; collision
destructured as `s t : ℝ²`, `hs ht`, `hst : s ≠ t`, `hdist : dist P s = dist P t`):

| Target | Name | Statement |
|---|---|---|
| C2.1 | `c2_collisionClass_exact` | `0 < dist P s`, `(Γ(P, dist P s)).card = 5`, `Γ(P,·) ∩ Γ(a₂,rho) = {s,t}`, `Γ(P,·) ∩ D₀ = {s,t}` |
| C2.2a | `c2_center_fullyDeletionRobust` | `FullyDeletionRobustAt D globalDeletion.center` |
| C2.2b | `c2_lateBlocker_ne_center_and_secondApex` | `∀ x hx, c'(x) ≠ P ∧ c'(x) ≠ a₂` |
| C2.3 | `c2_center_ne_firstApex` | `globalDeletion.center ≠ S.oppApex1` |
| C2.3 cor. | `c2_apexPair_distinct_carrier_centers` | `P, a₁, a₂ ∈ A`, pairwise distinct |
| C2.4a | `c2_no_lateRow_contains_collisionPair` | `∀ x hx, s ∈ Σ'(x) → t ∉ Σ'(x)` |
| C2.4b | `c2_collision_mutual_omission` | `t ∉ Σ'(s) ∧ s ∉ Σ'(t) ∧ c'(s) ≠ c'(t)` |
| C2.5 | `c2_collision_placement` | `¬(s,t ∈ I_u)`, `¬(s,t ∈ I_v)`, census `(s∈I_u ∧ t∈I_v) ∨ (s∈I_v ∧ t∈I_u) ∨ (s = z★ ∧ t ∈ I_u∪I_v) ∨ (t = z★ ∧ s ∈ I_u∪I_v)` |

## Fidelity notes

1. Collision witnesses as binders (C2): the leaf's `_hcollision` existential is
   destructured, not strengthened; exercised in the harness.
2. `hsA htA` in `c2_collision_mutual_omission` derive in-leaf from
   `globalDeletion.deleted_subset_class`; exercised in the harness.
3. `SelectedClass X p r` is definitionally `X.filter (fun q ↦ dist p q = r)`,
   so C1.3/C2.1 instantiate against unfolded `HasNEquidistantPointsAt` data
   with no bridging lemma.
4. `firstApex_mem_A` / `oppApex1_ne_oppApex2` exist upstream but are `private`
   (`ExactFourRobustCapExpansion.lean:230,236`,
   `OrientedPhysicalApexIngress.lean:56`); reproved locally by the identical
   `interval_cases` on `S.surplusIdx`. On promotion, de-privatize upstream
   rather than duplicate.
5. Reused, not reproved: `isUniqueFourCenter_centerAt`,
   `not_isUniqueFourCenter_of_fullyDeletionRobust`,
   `fullyDeletionRobustAt_of_large_class`,
   `uniqueFourClass_centerAt_eq_selectedAt_support` (MinimalUniqueFourCover),
   `Problem97.Dumitrescu.perpBisector_apex_bound`,
   `Problem97.two_circle_common_point_eq_endpoint`,
   `surface.secondApex_robust` (C4.2), `selectedClass_erase_eq`.
6. `B₁ = Σ'(u)` is stronger than the response document's overlap-saturation
   claim: `c'(u)` is a unique-four center, so the certificate's chosen
   4-subset must be the whole class `Σ'(u)`. Conclusion-strengthening only.
7. No discrepancy found: every step of C1.1–C1.3 and C2.1–C2.5 went through
   against the actual leaf interfaces; nothing forced or patched.
8. C1.1/C1.2 minimal dependencies: `hrho`, `hclassFive`, `globalDeletion`'s
   `deleted_subset_class`/`deleted_nonempty`/`blocked`/`restores`, `hcenter`.
   Full leaf binder lists retained for verbatim instantiation; unused binders
   carry the `_` prefix.

## Residual gaps — CONJECTURE (nothing below is proved)

- **CONJECTURE (C1 residual).** The C1 hypothesis bundle is contradictory.
  None of the four (C9.4) placements of `b = c'(source)` (`z★`, `u`, `v`,
  `x`) is eliminated. The exact-two deletion result does not constrain which
  two members of `Γ(a₂,rho)` form `D₀`: with a unique five-point class at
  `a₂`, every two-element subset has exactly the (C8.4)–(C8.5)
  blocking/restoration behavior. `c1_globalDeletion_card_eq_two` is not by
  itself a step toward `False`.
- **CONJECTURE (C2 residual).** The C2 hypothesis bundle is contradictory.
  `c2_no_lateRow_contains_collisionPair` closes every case where a canonical
  late row is forced through both `s` and `t`; unproved that the
  cross-row / `z★`-singleton placements produce such a row or otherwise
  contradict cap, minimality, ingress, or certificate data. Local geometry
  cannot supply this (two five-point circles meeting in exactly two points
  are realizable in convex position); the finish must use the
  blocker/certificate system, cap ordering, or global minimality.
- **CONJECTURE (branch B, either leaf).** No realizability certificate
  attempted or found; neither leaf is known provable or refutable.

Neither leaf `sorry` was touched.
