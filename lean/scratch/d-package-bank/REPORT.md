# D-package bank — REPORT

Written by the orchestrating session from the banking agent's delivered report
(the agent's own REPORT.md write was blocked by its harness; the content below
is the agent's report of record, 2026-07-28). Source math: the two independent
deep-thinker runs `docs/solve-prompts/2026-07-28-d-round1-response-{a,b}.md`
against the four D leaves in `FrontierLiveClosure.lean`, landed tree
`a0f73bc1`.

## Deliverable

`DPackageBank.lean` — 1524 lines, 65 theorems, no defs, no axioms, no
`sorry`, no `native_decide`.

## Validation

- Gate: `lake env lean scratch/d-package-bank/DPackageBank.lean` — exit 0,
  zero errors, zero warnings (re-run independently by the orchestrator).
- Inline `#print axioms` on all 65 declarations: every one exactly
  `[propext, Classical.choice, Quot.sound]`; 0 hits for
  `sorryAx`/`ofReduceBool`/`trustCompiler`.
- No production file touched; only `lean/scratch/d-package-bank/` written.

## Statement fidelity

Each leaf-indexed theorem carries the leaf's own binder block verbatim, up to
removal of the `_` linter prefix on binders the proof consumes:
D1 `false_of_exactFourPostCardElevenTwoRadiusBranch` (:5976),
D2 `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` (:6041),
D3 `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual`
(:6121), D4
`false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`
(:6132).

## Inventory (by target; line numbers in DPackageBank.lean)

### Target 1 — unique-four-center helper (general; reusable by B/C packages)

- `mem_selectedClass_of_card_ge_four_of_erase_blocked` (53):
  `¬K4(A∖{x},c) → 0<s → 4 ≤ ‖Λ(c,s)‖ → x ∈ Λ(c,s)`
- `eq_dist_of_card_ge_four_of_erase_blocked` (71): same → `s = d(c,x)` (run A (1))
- `hasNEquidistantPointsAt_erase_iff_not_mem_exactFourRow` (83): with
  `‖Λ(c,r)‖=4`, `x∈Λ(c,r)`, `¬K4(A∖{x},c)`: `K4(A∖{y},c) ↔ y ∉ Λ(c,r)` (run A (2))
- `criticalShell_support_eq_selectedClass` (117), `criticalShell_unique_four_radius`
  (126), `criticalShell_erase_survives_iff_not_mem_support` (140) — shell-level forms
- `equidistantAt_mono` (156), `selectedClass_inter_card_le_two` (167)

### Packet plumbing (public copies of production-`private` facts)

`oppApex1_mem_A` (206), `oppApex2_mem_A` (215), `oppApex1_ne_oppApex2` (224),
`oppApex{1,2}_eq_oppositeVertex_oppIndex{1,2}` (236/245),
`oppCap{1,2}_eq_capByIndex_oppIndex{1,2}` (254/263),
`leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2` (273).

### Target 2 — D4 global one-defect two-deletion cover (run B (1)–(2))

`d4_commonObstructionCenter_mem_A` (287), `_ne_firstApex` (300),
`_ne_secondApex` (316), `d4_global_twoDeletion_cover` (333),
`d4_no_survival_at_commonObstructionCenter_q` (377) / `_w` (389, transported
along `obstructionCenters_eq`),
`d4_global_twoDeletion_cover_with_unique_common_defect` (403) — the boxed
(1) ∧ (2). Run B's sketched field names all verified correct against
`FirstApexUniqueRadiusResidual.lean:184–225`; the proof skeleton went through
unchanged.

### Target 3 — D4 shared-row normal form (run A (6)–(8))

`d4_sharedRow_radius_eq` (426), `d4_sharedRow_support_eq` (457),
`d4_sharedRow_inter_firstOppCap_eq_pair` (494),
`d4_sharedRow_inter_oppCap1_eq_pair` (549),
`d4_carrier_bisector_eq_pair` (564): `A ∩ Bis(q̃,w̃) = {a₁, b}`.
`|K| = 4` is already the field `…toCriticalFourShell.support_card`.

### Target 5 — D3 three-center packet (run A (3)–(5))

`d3_secondApex_survives_erase_{q,w}` (614/627),
`d3_obstructionCenter_{q,w}_ne_{first,second}Apex` (640–684),
`d3_fourCenters_pairwise_ne` (700) — unconditional,
`d3_{left,right}Branch_partner_not_mem_row` (727/743),
`d3_leftBranch_threeCenter_packet` (761) / `d3_rightBranch_threeCenter_packet`
(789), `d3_firstApexRow_erase_card_eq_four` (816),
`d3_secondApexRow_avoiding_pair` (830), `d3_blockerRow_q_card_and_mem` (846),
`d3_threeRow_pairwise_inter_le_two` (865).

### Target 4 — D2 protected pairs (run A (9)–(12) + ingress rows)

`pair_not_mem_of_exactFour_unique_radius_doubleSurvival` (900, general),
`d2_swappedClass_card_eq_four` (938), `d2_swappedClass_unique_radius` (947),
`d2_originalPair_not_mem_swappedClass` (961) — (9),
`d2_swappedPair_not_mem_firstClass` (978) — (10),
`d2_originalPair_mem_firstClass` (995), `d2_swappedPair_mem_swappedClass`
(1010), `d2_protectedPairs_directions` (1022) — (11),
`d2_classes_inter_card_le_two` (1055) — (12),
`d2_ingress_secondApexRow_eq_swappedClass` (1065) — B₂ = V,
`d2_ingress_firstRow_eq_criticalShell` (1102) — B₁ = R_u,
`d2_ingress_firstRow_inter_swappedClass_card_le_two` (1152).
Run A's full three-row `U, V, R_u` reduction, kernel-checked.

### Target 6 — D1 cardinality

`firstApexClass_inter_secondOppCap_card_le_one` (1174) — `‖Λ(a₁,r) ∩ Γ₂‖ ≤ 1`
for EVERY r, `d1_firstApexClass_inter_secondCapInterior_card_le_one` (1186),
`d1_rho_pos` (1198), `selectedFourClass_support_subset_selectedClass` (1208),
`d1_class_card_eq_four` (1219), `d1_strictInterior_double_hit` (1236) —
(D1.7) reconstructed, `d1_secondOppCap_card_ge_six` (1253) — `6 ≤ ‖Γ₂‖`.

### Stretch goal — delivered

`d1_rigid_two_by_two_split_impossible` (1292): `‖Λ(a₁,r) ∩ Γ₂°‖ ≠ 2`;
`twoDeletion_survives_at_both_apexes` (1301);
`d1_swappedCommonDeletion_pair` (1342): in the D1 leaf context there ALWAYS
exist two distinct strict-Γ₂ points on one a₂-row, both outside U, whose
joint deletion preserves K4 at both apexes.

## Corrections to the informal runs (both proved)

1. **Run A's D1 bound (13) is not sharp.** Run A derived `|U ∩ Γ₂°| ≤ 2`;
   the true bound is `|U ∩ Γ₂| ≤ 1` for every radius at a₁, via the existing
   ordered-cap one-hit bound
   `leftAdjacentCap_at_opposite_card_le_one_of_convexIndep`.
2. **Run A's "rigid 2×2 split" residual case is vacuous** (it requires
   `|U ∩ Γ₂°| = 2`). Hence the swapped common-deletion construction is
   unconditional in the D1 leaf context.

## Fidelity notes / discrepancies

- The D1 leaf carries fewer hypotheses than §2.1 of the prompt doc: (D1.3),
  (D1.5), (D1.7) are producer-side facts dropped at the call site
  (`interiorPairGood_or_twoDistinctExactFourInteriorRows`,
  `ExactFourRobustCapExpansion.lean:1085`); all three are reconstructed from
  the leaf binders here rather than assumed.
- Run B's Lean sketch is field-accurate; only shape difference is going
  through `selectedClass_erase_eq`/`selectedClass_erase_card_eq_of_not_mem`.
- Run A's D4 (7) needs `b ∈ Γ₁` (not just `Γ₁°`) — closed by
  `capInteriorByIndex_subset_capByIndex`; no gap.
- Run A's D3 (5) is presented as branch-dependent but is not — banked
  unconditionally.
- Several production facts are `private`; public copies included (see packet
  plumbing). On promotion, de-privatize upstream rather than duplicate.

## Residual gaps — CONJECTURE / OPEN (not stated in Lean)

1. CONJECTURED — D4 deletion purification (run B (3)):
   `∃ x ∈ {q̃,w̃}, ∀ c ∈ A∖{b,x}: K4(A∖{b,x}, c)`. Not banked, not shelled,
   not axiomatized.
2. CONJECTURED — "one-defect two-deletion cover ⟹ removable vertex"
   (abstract implication). Flagged unjustified by run B. Not banked.
3. OPEN — D4 terminal: (6)–(8) + global cover jointly consistent with convex
   independence (run A coordinate models); needs global
   K4/minimality/no-(m,4,4).
4. OPEN — D3 terminal: the three-center packet does not contradict
   minimality; χ(w̃) legitimately witnesses a failure in A∖{w̃}.
5. OPEN — D2 terminal: three-row incidence pattern fully banked; no
   contradiction proved; re-running the physical consumer supplies no
   well-founded descent.
6. OPEN — D1 terminal: `d1_swappedCommonDeletion_pair` yields the two-point
   deletion preserving K4 at both apexes, but A∖{z₁,z₂} is not shown to
   retain K4 at EVERY center; extending the two apex survivals to global
   survival is the remaining D1 gap.
   UPDATE 2026-07-28: this route is refuted, not open — global survival
   after any pair deletion forces a mutual-blocker pair
   (`χ(z₁)=z₂ ∧ χ(z₂)=z₁`); see `D1SURVIVAL-REPORT.md` /
   `D1GlobalSurvival.lean` (30 kernel-clean theorems incl. the census).

No leaf `sorry` was touched.
