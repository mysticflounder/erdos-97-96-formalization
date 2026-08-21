# Bi-apex schema formalization notes (2026-08-20)

Scope: reuse preflight, dedup resolution, and first formalization for the
schemas of `docs/exact-twelve-biapex-schemas-2026-08-20.md` (at the time
of writing that file and its companion
`docs/pentagon-circumfan-schemas-2026-08-19.md` are present in the tree
but not yet committed by their author).  Labels per repository policy.

## Dedup results (reuse preflight per candidate)

**S2 (apex witness budget) — content already in Lean.**
`selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers`
(`lean/Erdos9796Proof/P97/ATail/ThirdCenterCommonPair.lean:144`) is the
general statement: two centers equidistant from a pair saturate
`Dumitrescu.perpBisector_apex_bound`, so any third center's selected
class meets the pair in at most one point.  S2 is the instantiation
`c₀ := apex` (apex equidistance is one line from the common-radius
pinning).  Per the no-wrapper rule this is recorded as a dedup, not
reproved.  The doc's `{{NEEDS-BANK-DEDUP}}` flag on S2 resolves to:
duplicate, consume the existing theorem.

**S4 (fiber trace bound) — already instantiated.**
`criticalShell_inter_frontierRadiusClass_card_le_two`
(`FirstApexCriticalFiberRow`) and
`firstFiber_globalRow_inter_firstShell_card_le_two`
(`TwoSourceRetainedMinimalCore`) are first-apex (Γ₁) trace bounds; the
`{{NEEDS-LEAN}}`/`{{NEEDS-BANK-DEDUP}}` flags on S4 resolve to: present,
no new bank.

**K0/K1 (half-plane, no antipodal pair) — already in Lean.**
`exists_strict_separating_vector_of_convexIndep_cocircular` and
`strict_separating_vector_no_antipodal_pair`
(`lean/Erdos9796Proof/P97/ATail/ConvexCocircularHalfPlane.lean`).

## S2 empirical check against the live model space

EMPIRICAL, exhaustive over the stated sets.  S2's class-pair Boolean
budget (class C = {0,3,6,8,9}, apex label 1, at most one non-apex host
per pair) tested against the v26 artifacts:

- authenticated v26 survivor: 0 violations (S2 would not remove it);
- 300 enumerated projected models
  (`docs/exact12-v26-projected-model-space-2026-08-20.md`): **99 of 300
  violate** (100 violating pairs total).

S2 is the first constraint family found that prunes the live projected
space, and it is membership-vocabulary — outside the orientation-family
refutation of 2026-08-20.  Installing it as CNF clauses requires the
physical bridge (pair-in-row implies center equidistance), which holds
in the physical-radius leaf but is deliberately absent from the
source-faithful candidate surface; a bank would need the metric
provenance A5.17 names.

## S1 formalization (new Lean)

New module `lean/Erdos9796Proof/P97/ATail/CocircularEquidistantWitness.lean`:
the K2(2)/S1(1) mid-angle identity in vector form (no angle coordinates)
plus S1(3) uniqueness.

- `vsub_eq_smul_chordResultant_of_dist_eq` — branch-free dichotomy
  `z - P = ± (ρ/‖u‖) • u`, `u = (p-P)+(q-P)`;
- `vsub_eq_radius_smul_chordResultant_of_separating_vector` — the strict
  half-plane witness selects the positive branch (exact mid-angle
  position);
- `equidistant_classPoint_unique_of_convexIndep` — at most one class
  point equidistant from a given class pair, on a convex-independent
  carrier (consumes the K0/K1 producer).

Intended consumer: deletion-arm trace-table pruning for the exact-twelve
`pentagonOffClassBlocker` missing-incidence leaves (biapex doc §4.2).
No `sorry` introduced; the obligation frontier is unchanged.  S1(2)'s
consecutive-pair corollary needs the class angular order and is not
formalized yet.
