# Pinned Lean facts backing the role-coverage gate

Date: 2026-07-18.  Source: fact-pinning sweep over
`lean/Erdos9796Proof/P97/` (two-part report, session fd7b0078).  Every
constraint family asserted by `gate_encoder.py` / `enumerate_l0.py` and
every landing-site table must trace to a PROVEN row here.  NOT-FOUND rows
are cases the enumerator must allow (they are NOT constraints).

## Constraint families (asserted)

| Constraint | Provenance | Status |
|---|---|---|
| class(O) card 5, members s0,s1,s2,e1,e2 | `LargeCapUniqueFiveSecondApexRadius.class_card_eq_five` (LargeCapUniqueFive.lean:30-39); sources are class∩interior members | PROVEN |
| class∩interior = exactly the 3 sources (all-reverse arm) | `physicalVertices_card_eq_three_of_all_omissions_reverseMembership` (LargeCapUniqueFivePhysicalOmissionTransitionGlobal.lean:376-388) + `source_injective` (PhysicalOmissionCycle.lean:218-226); `A.allReverse` supplies the hypothesis | PROVEN |
| O excluded from its own class | `mem_selectedClass` (WitnessPacketInterface.lean:53-58) + `radius_pos` | PROVEN (definitional) |
| unique_K4_radius at O → `uniq4` family (no other named 4-subset equiradial at O) | `LargeCapUniqueFiveSecondApexRadius.unique_K4_radius` (LargeCapUniqueFive.lean:36-39) | PROVEN |
| reverse rows: card 4, row ∩ CLOSED cap = {source, successor} | `transition_successor_actualCriticalSupport_inter_physicalCap_eq_pair` (TransitionGlobal.lean:215-228), `CriticalFourShell.support_card` (U1CarrierInjection.lean:559) | PROVEN |
| reverse-row outside pair: card 2, ⊆ D.A \ closed cap | `transitionReverseOutsidePair_card_eq_two` (:260-270), `_subset_complement` (:290-296) | PROVEN |
| reverse rows support-locked complete (cls_ne exclusions over named points) | rows are `H.selectedAt … toCriticalFourShell` complete critical supports | PROVEN |
| blockers b0,b1 strictly interior; straddle order; collision row at s1 | `transition_successor_actualBlocker_mem_physicalCapInterior` (:180-190); `sharedOrder.straddle` (SharedCapOrder.lean:36-52); Round 188 normal form (`aligned_namedInterior_normalForm`) | PROVEN |
| cap interior = exactly {s0,b0,s1,b1,s2}, chain order, s1 middle | Round 188 (`~/scratch/Round188ExactSevenNamedInteriorNormalForm.lean`, SHA 6424bc90…) | PROVEN |
| cycle period = 3 | `A.cycle_period` field, produced by `exists_entryZeroPeriodThreeCycle_containing_continuationSources` (SingleOrbit.lean:210-233) | PROVEN |
| orientation WLOG (one Round-188 chain direction) | dihedral reflection maps the two orientations onto each other; every asserted family (classes, rows, Kalmanson, triangle, lower) is reflection-invariant | PROVEN (meta-argument, document in coverage theorem) |
| strict triangle, strict Kalmanson on convex boundary order, unit-slack normalization | `CounterexampleData` convex position (production-standard families, same as sibling encoder); normalization sound for pairwise-distinct schema points | PROVEN |

## Landing-site tables (enumerated)

| Role | Sites | Reason |
|---|---|---|
| extras e1,e2 | S-arc, O1-arc, EA, W | interior excluded (=3 sources, PROVEN); O excluded (definitional); endpoints NOT-FOUND-excluded → enumerated; e1 ≠ e2 (card 5 − 3 sources) |
| outside points p·a,p·b | S-arc, O1-arc, O | closed cap excluded (PROVEN); ≠ first apex (EA ∈ closed cap, derived TransitionGlobal.lean:674-676); O NOT-FOUND-excluded → enumerated |

## NOT-FOUND cases the gate must allow (never filter)

- exact-five class member at a physical-cap endpoint (Moser vertex);
- outside-pair point = O;
- outside-pair point = frontier-pair member or first-apex row member;
- outside points of two different rows coinciding (single-point);
- frontier-pair member inside the CLOSED physical cap (`q_role`/`w_role`);
- continuation source = frontier-pair member relation: none stated;
- cap-endpoint blockers: NO production Round-152-style disjunction exists
  (search exhaustive) — endpoint-blocker constraints are OMITTED, and
  DESIGN.md dimension 5 is dropped;
- multiple radii carrying ≥4-classes at the first apex (no unique_K4
  analogue at oppApex1; `FirstApexShellRolePacket` explicitly contemplates
  two).

## L1 facts (first-apex rows; not yet encoded)

- retained row: card 4 ∋ frontier pair {q,w}; exactly 2 completion points
  (`retained_completion_card_eq_two`); ≥2 members in opp1 strict interior
  (`retainedInterior₁/₂_mem_cap`); q,w ∉ surplus cap
  (`SurvivorPairRelocationPacket.q/w_mem_marginal`,
  CriticalPairFrontier.lean:295-298); q,w each ∈ closed physical cap ∨
  strict opp1 (`q_role`/`w_role`); ≥1 of q,w strict opp1
  (`one_frontier_source_strict`).  All FirstApexShellRole.lean:48-129.
- double row: card 4; ≥2 in opp1 strict interior; excludes q,w
  (`doubleRow_subset_doubleErase`); same-radius arm → class(EA) card ≥ 6
  (`sameRadius_six`); distinct arm → rows disjoint
  (`distinctRadius_disjoint`).
- first-apex row ∩ closed physical cap ≤ 2: PROVEN-COMPOSABLE —
  `selectedFourClass_inter_capByIndex_card_le_two`
  (CapSelectedRowCounting.lean:257-262) applies because
  `oppApex1 ∈ capByIndex oppIndex2` (endpoint membership, derived at
  TransitionGlobal.lean:674-676); the instantiation is not yet in the
  codebase — cite both lemmas if a core uses this bound.
- first-apex row ∩ own opp1 cap: only ≥ 2 available
  (`selectedClass_capInteriorByIndex_card_ge_two`,
  CapInteriorRadiusCounting.lean:27-34); NO ≤ 2 there.

## L1 additions (pinned 2026-07-19, exact statements read; see DESIGN-L1.md)

| Constraint | Provenance | Status |
|---|---|---|
| one-hit at EA: exact-radius class ∩ closed surplus cap ≤ 1 | `U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit` (U2NonSurplusOneHit.lean:213); generic-S composition CriticalPairFrontier.lean:1296-1306 | PROVEN |
| one-hit at EA: exact-radius class ∩ closed physical cap ≤ 1 | `oppApex1_otherCap_one_hit` (:312); generic-S `selectedClass_inter_oppCap2_card_le_one` (FirstApexShellRoleExtractor.lean:111-117) | PROVEN |
| one-hit at O: exact-radius class ∩ closed surplus ≤ 1, ∩ closed opp1 ≤ 1 | `oppApex2_surplusCap_one_hit` (:352), `oppApex2_otherCap_one_hit` (:392); same `withPacket`/DS rebuild (pattern also at FrontierCommonDeletionSurplusEscape.lean:93) | PROVEN-COMPOSABLE (5-line packet rebuild) |
| ⇒ e-landing patterns restricted to S-O1, S-W, EA-O1, EA-W | one-hit at O applied to class(O) = exactly {s0,s1,s2,e1,e2} | PROVEN (solver cores: 2 cls_eq + 1 rad_ne) |
| L1 rows are `SelectedFourClass D.A oppApex1`: card 4, equal radius, center ∉ support, 4-SUBSET of ambient class | U1CarrierInjection.lean:405-423; `sameRadius_six` shows ambient class can exceed the support → row_eqs ONLY, never exact_classes | PROVEN |
| q,w ∉ closed surplus cap; dist(EA,q)=dist(EA,w)=retained radius | `SurvivorPairRelocationPacket.q/w_mem_marginal` (CriticalPairFrontier.lean:295-298) | PROVEN |
| retained row = {q,w} + exactly 2 completions; role cover; ≥2 strict opp1 | FirstApexShellRole.lean:48-129 (subsumed by one-hit budgets + role cover) | PROVEN |
| any EA-radius class ⊆ surplus ∪ physical ∪ O1-bag | `selectedClass_subset_roleCover` (FirstApexShellRoleExtractor.lean:95) | PROVEN |
| at most one of q,w ∈ class(O) | `CriticalPairFrontier.secondApexDouble` (:573-575, unconditional field) + `unique_K4_radius` + `class_card_eq_five` | PROVEN-COMPOSABLE |
| outside-pair rad_ne at EA (all-reverse arm): dist(EA,p·a) ≠ dist(EA,p·b) per reverse row | `false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence` (ParentExactFiveAssembler.lean:335) via `false_of_transitionReverseOutsidePair_coRadial_firstApex` | PROVEN (terminal) |
| outside pair of one row ⊆ retainedRow ∨ ⊆ doubleRow ⇒ False | `false_of_fullParentExactFiveAllReverseData_of_namedRowOccurrence` (ParentExactFiveAssembler.lean) | PROVEN (citation kill for those identification patterns) |
| `FirstApexSplit`/`SecondApexSplit` disjunctions | resolved by unconditional residual fields in the all-reverse context | REDUNDANT (nothing to encode) |
| W-centered one-hit analogue | searched, does not exist | NOT-FOUND (families not asserted) |

## Unused critical row (not encoded; L2 candidate)

`LargeCapUniqueFiveUnusedCriticalRow` (LargeCapUniqueFive.lean:204-223):
`unused.point` ∈ CLOSED physical cap ∖ exact-five class — at exact-seven
that means one of {EA, W, b0, b1} (minus endpoints carrying extras), an
enumerable dimension.  Row card 4 ∋ unused.point;
`(class∩interior) ∩ row ≤ 1` (`actualUnusedRow_physicalInterior_inter_
card_le_one`, LowHit.lean:46-54).  Center: only ≠ O and ∈ D.A — fully
unlocalized, so the row is toothless until its center/members are
identified with named points (refinement dimension, not a base family).
Continuation sources are themselves cycle sources (`cycle_start`,
`continuationSecond_occurs`) — no new points.
