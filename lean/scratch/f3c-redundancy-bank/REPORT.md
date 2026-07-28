# F3c-redundancy bank — report (2026-07-27)

Written by the coordinating session on behalf of the prover agent (whose
harness blocked file writes to this path); content is the agent's delivered
report, verbatim in substance.

## Verdict

CONJECTURE-(i) (F3c-redundancy) is **PROVEN**, kernel-checked, core axioms
only. F3's unresolved core is Γ + (F3a) + (F3b), and the (F3c) part needs
only Γ + (F3b) — (F3a) is not used at all.

## Files

- `F3cRedundancy.lean` — the bank (9 theorems, inline `#print axioms` +
  `#check` fidelity block)
- `Probe.lean`, `Probe2.lean` — signature probes against the built
  environment; not load-bearing

Gate: `cd lean && lake env lean scratch/f3c-redundancy-bank/F3cRedundancy.lean`
→ exit 0, 0 errors (warnings are style/linter only). No existing file edited,
no commit, nothing built on the F4 side.

## Status per arm

(F3c) = `FirstFiberCollisionFiveCenterDeletionResidual P Pρ source S.oppApex2
S.surplusApex` — a 4-arm disjunction; each arm is `FiveCenterDeletionSurvival`
at `c(g), a₀, {b′ or b}, a₁, a₂`. Arms: 1 = delete s₁ (third centre b′),
2 = delete t₁ (b), 3 = delete s₂ (b′), 4 = delete t₂ (b).

| Theorem | Content | Status |
|---|---|---|
| `fiveCenterDeletionSurvival_of_capSourceOmission_sSide` | one-point arm builder, third centre b′ | PROVEN |
| `fiveCenterDeletionSurvival_of_capSourceOmission_tSide` | mirrored builder, third centre b | PROVEN |
| `f3c_sArms_sharp` | arms 1 ∨ 3 (sharper than F3c) | PROVEN |
| `f3c_tArms_sharp` | arms 2 ∨ 4 (sharper than F3c) | PROVEN |
| `f3c_joint_sharp` | (1∨3) ∧ (2∨4) — two survivals at once | PROVEN |
| `f3c_of_f3b_sArms` | full (F3c) via s-arms | PROVEN |
| `f3c_of_f3b_tArms` | full (F3c) via t-arms, independent | PROVEN |
| `f3c_of_leaf_hypotheses` | full (F3c) from the leaf's verbatim hypothesis list minus (F3c) | PROVEN |
| `leaf_F3c_hypothesis_redundant` | leaf-with-F3c ↔ leaf-without-F3c | PROVEN |

No partial result, no residual gap — the full disjunction is derived twice
over.

## Axiom sets

All nine: `[propext, Classical.choice, Quot.sound]`. No `sorryAx`, no
`Lean.ofReduceBool`/`trustCompiler`, no project axiom.
`leaf_F3c_hypothesis_redundant` is stated *about* the leaf shapes and proved
without invoking the still-sorried leaf.

## Statement fidelity

Section variables are not exported across files, so the Γ block
(`FrontierLiveClosure.lean:7421–7469`) was restated verbatim; the only textual
difference is two lines of continuation indentation inside
`hcriticalShellUniqueFourCover`, plus splitting the `include` list across
theorems. Checked at the elaborated level: normalising whitespace on the two
`#check @…` outputs, `@f3c_of_leaf_hypotheses` ==
`@false_of_capSource_firstFiber_collisionFiveCenterDeletion` minus the
trailing `→ False`, character-for-character. This is precisely "leaf
hypotheses minus (F3c) ⟹ (F3c)", with (F3c) verbatim.

## The chain as checked, vs bridge-2 §7.1 as written

Steps map cleanly: (X3)+(D4)+(X10) → cap membership +
`RetainedInteriorBlockerCollision.shell_inter_cap_eq_sources` +
`hpairsDisjoint`; (D1) → `cross_deletion_survives_iff_not_mem_selected_support`
(twice); (D6)/(T4) → `R.firstApexFullyDeletionRobust` and
`fullyDeletionRobustAt_of_apexRichClassStructure` on
`T.oppApex2_rich`/`T.surplusApex_rich`. (F3b).8/.9 of the doc are conjuncts
10/11 of the Lean `FirstFiberCapSourceWitness`.

Two deviations, both weakening hypothesis use:
- Robustness at a₀ comes from `R.firstApexFullyDeletionRobust`, not
  `T.oppApex1_rich` (either works; matches existing usage at `:7601`).
- **(F3a) is not used at all.** `Q : FreshOutsideFirstBlockerFiber P Pρ`
  appears only as an unused binder in the fidelity wrapper. "Γ+(F3a)+(F3b)"
  over-states what the derivation needs; "modulo Γ and F3b" is accurate.

Load-bearing Γ: `R`, `T`, `hpairsDisjoint`, plus the structural content of
`P`, `Pρ`, `S`, `H`, `D`. Unused (confirmed by `unusedSectionVars` linter):
`hρne`, `hfrontierFour`, `hρfour`, `hfrontierInteriorEq`, `hρInteriorEq`,
`hcriticalShellUniqueFourCover`, `hblockersNe`, `hLPρ`, `MPρ`, `hLP`, `MP`,
`Q`. The derivation needs **no** localized common-deletion packet and **no**
mutual-omission cycle — strictly weaker than the existing producer
`capSource_firstFiber_descent`.

## Consequence

(F3c) is a redundant leaf hypothesis. A Branch-A attempt that plans to *use*
(F3c) as new positive data gains nothing. The refactor dropping `hdeletion`
was NOT performed (GPT refactor in flight owns that surface).

Not established, do not overclaim: this says nothing about whether Γ + (F3b)
is consistent (if contradictory the leaf is vacuous), and it does not close
the leaf — the F3 leaf is still `sorry`.

## Environment caveat (concurrency)

Verification ran against `FrontierLiveClosure.olean` built 18:58 from the
17:08 source. A concurrent agent edited that source ~23:46 (F4 leaf
`false_of_capSource_freshOutsideSecondBlockerFiber` sorry replaced by a
`P ↔ Pρ` swap reduction to the F3-side leaf, `:7648–7667`). Verified
unchanged by source comparison: the Γ block (`:7421–7469`),
`FirstFiberCapSourceWitness` (`:7521–7545`), the F3 leaf (`:7620–7628`, still
`sorry`), `FrontierAllLargeCapsTriApexRobustResidual`. Unverified: that the
bank still compiles after the tree is rebuilt with that edit — re-run the
gate once the rebuild lands.

## Follow-ups (ranked, from the agent)

1. Aim future closure attempts at `f3c_joint_sharp`, not (F3c) — (F3b) gives
   two simultaneous five-center surviving deletions, strictly more than
   (F3c)'s single four-arm disjunction.
2. Re-aim `LPρ/MPρ/LP/MP`: spent by `capSource_firstFiber_descent` to produce
   (F3c) but not needed for the deletion arms; their content bites on the
   cycle-aligned arm (`FirstFiberCycleAlignedResidual`) instead.
3. Re-run the gate after the F4 refactor lands; if `hdeletion` is then
   dropped from the leaf, re-point the F4-side consumer at the reduced leaf.
4. Do not dispatch further agents on "derive (F3c)" or "F3 reduces to
   Γ+(F3a)+(F3b)" — both settled.
