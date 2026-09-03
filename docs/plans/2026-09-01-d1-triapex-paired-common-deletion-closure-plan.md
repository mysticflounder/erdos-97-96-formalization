# TriApex paired common-deletion leaf closure plan

Date: 2026-09-01
Lane: `d1-triapex-plan-20260901`
Base head: `9a222da97112efc204a038ca2f71ff5a12078f94`

Status: ACTIVE COVERING PLAN. Nothing in this document closes a Lean
theorem. Every mathematical claim below carries a rigor label. Ambiguity
markers follow the house convention.

Label note. Project prose uses "D1" for three different things: this leaf
(the F1 TriApex lane), the two-radius leaf now called "D-R"
(`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`), and a 2026-07-06
rigidity literature scan about the card-12 census. This plan says "the
TriApex leaf".

## 1. Target

```text
Problem97.ATailFrontierLiveClosure.false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:2028
```

Publish target: `Problem97.erdos97_rhs`.

Immediate consumer:
`false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`
(`TriApexEndpointRetainedOmission.lean:2054`). It builds `Q` with the
kernel-checked producer `triApexFiveSurviveOneFailOfApexRich`
(`ATail/TriApexFiveSurviveOneFail.lean:71`) from `S`, `H`, `O.kept`,
`O.deleted`, `D.convex`, `G.apex_rich`, and forwards `J` and `G` unchanged.

Two proved ingress routes reach that consumer:

- source-return route: `false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core`
  (`:2569`) dispatches `PairedCommonDeletionOutcome`
  (`ATail/PairedCommonDeletionNormalForm.lean:237`). Its sibling arm
  `twoRadiusGrid` is kernel-closed by
  `false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core` (`:2395`,
  the "D2" grid). Only the `apexClassJointDeletion` arm is open.
- reverse-hit route: `false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core`
  (`:2076`) through `nonempty_pairedApexClassJointDeletion_of_reverseHit`
  (`:1922`).

Spine status at base head: on spine, one consumer, sole open TriApex
obligation, subtree of 11 nodes with 10 closed dependencies, 28 open
obligations project-wide. Files `TriApexEndpointRetainedOmission.lean`,
`TriApexFiveSurviveOneFail.lean`, and `PairedCommonDeletionNormalForm.lean`
are unchanged since the 2026-08-30 source extract
(`docs/checkpoints/d1-source-interface-extract-2026-08-30.md`, revision
`020e43bfc`); every line anchor in that extract was re-verified at base head.

## 2. Binder map

| Binder | Content | Reconstructible extras |
|---|---|---|
| `D : CounterexampleData` | carrier `A`, `convex : ConvexIndep A`, `K4`, `packet` (`U1TwoShortCapReduction.lean:83`) | `D.capSum` (`:98`): `surplus + opp1 + opp2 = card + 3`; `D.surplus_card_gt_four` |
| `S : SurplusCapPacket D.A` | MEC triangle, three closed caps, surplus index (`Cap/PartitionFromMEC.lean:332`) | `capByIndex`, `capInteriorByIndex` disjointness lemmas; complete ordered cap `capByIndex_cgn4g_capData_oriented` (`SurplusM44Packet/Shard01.lean:704`, needs `D.convex`) |
| `radius : ℝ` | frontier radius | `0 < radius` from `F.radius_pos` |
| `H : CriticalShellSystem D.A` | every `x ∈ A` has a blocker centre `c(x) ≠ x`, an exact four-point shell containing `x`, and `¬K4(A \ {x}, c(x))` (`U1CarrierInjection.lean:1116`) | `cross_deletion_survives_iff_not_mem_selected_support` (`ATail/CriticalPairFrontier.lean:781`); `SelectedFourClass.inter_card_le_two` (`U1CarrierInjection.lean:474`) |
| `F : CriticalPairFrontier D S radius H` | frontier pair packet (`ATail/CriticalPairFrontier.lean:568`) | only `F.radius_pos` reaches the leaf |
| `R : FrontierCommonDeletionParentResidual F` | `minimal : D.Minimal`, `noM44`, `9 < card`, `4 ≤ (SelectedClass D.A S.oppApex1 radius).card`, common-deletion residual (`ATail/OrientedPhysicalApexIngress.lean:251`) | `R.firstApexFullyDeletionRobust`, `R.actualBlocker_ne_firstApex`; `criticalShell_inter_frontierRadiusClass_card_le_two` (`ATail/FirstApexCriticalFiberRow.lean:178`) |
| `P`, `O` | two distinct sources `kept`, `deleted` on `Γ(oppApex1, radius)` in the strict first opposite cap, distinct blockers, `deleted ∉ shell(kept)`, packet certifying `A \ {deleted}` keeps K4 at `oppApex1` and at `c(kept)` (`ATail/RetainedMatchingLargeCapConsumer.lean:203`) | packet rows are chosen four-subsets with `overlap_le_two` (`ATail/CommonDeletionTwoCenter.lean:30`) |
| `J : PairedApexClassJointDeletion O` | `source` on `Γ(oppApex1, sourceRadius)`, class card `≥ 4`, omitted by both retained shells, two packets: `A \ {source}` keeps K4 at `oppApex1`, `c(kept)`, `c(deleted)` (`ATail/PairedCommonDeletionNormalForm.lean:93`) | `source ≠ kept, deleted`; `c(source) ∉ {c(kept), c(deleted)}` (`:140`, `:154`); four pairwise-distinct centres `oppApex1, c(kept), c(deleted), c(source)`. Both live producers instantiate `sourceRadius = radius` (`TriApexEndpointRetainedOmission.lean:2012`, `PairedCommonDeletionNormalForm.lean:556`), but `J` does not retain that equality (`sourceRadius` is a free field at `PairedCommonDeletionNormalForm.lean:93`), so a same-radius pair on the L6 row `K` is not proved to use the frontier radius of `kept` and `deleted` (Section 11 addendum, item 10) |
| `G : TriApexAllLargeContext D S` (`Prop`) | all three caps `≥ 6`; all three apices apex-rich; `card ≤ 4 · |notRobustCenters|`; no point equidistant from all three MEC vertices (`ATail/AllLargeCapCanonicalInterfaces.lean:297`) | `15 ≤ card` from `capSum`; every blocker centre lies in some strict cap (`AllLargeCapCanonicalInterfaces.lean:317`); one-hit rule on other rich cap slices (`TriApexEndpointRetainedOmission.lean:312`, `:718`); at card 15: `capByIndex_card_eq_six_of_card_eq_fifteen`, `capInteriorByIndex_card_eq_four_of_card_eq_fifteen`, `twoRichClassSlices_partition_of_capInterior_card_eq_four` (`ATail/ExactFifteenApexProfile.lean:134`, `:158`, `:170`) |
| `Q : TriApexFiveSurviveOneFail S H O.kept O.deleted …` | `W : StrictApexFourFamily`: three pairwise-disjoint four-point strict-cap supports, total twelve, each with `oneRadius`/`twoRadii` provenance (`ATail/ApexRichFourWitness.lean:30`, `ATail/TriApexFourWitness.lean:79`); `E ⊆ W.support \ (shell(kept) ∪ shell(deleted))`, `E.card = 4`; for every `x ∈ E`: K4 survives in `A \ {x}` at all three apices and both retained blockers, fails at `c(x)`, and `c(x)` differs from all five surviving centres (`ATail/TriApexFiveSurviveOneFail.lean:42`) | `Q.exists_distinct_same_index` (`:156`): two distinct points of `E` share one cap index. NOT reconstructible: `W.supportAt i = capInteriorByIndex i`, any `Fin 4` order of a support, any radius-class equality |

Provenance dropped at the leaf boundary (PROVEN facts that exist upstream but
are not fields of `J`, `G`, or `Q`):

- reverse-hit route: reverse blocker in the strict first cap and exact
  `reverseShell ∩ firstCap = {kept, deleted}`
  (`ATail/RetainedMatchingLargeCapConsumer.lean:288-294`); the complete
  ordered first cap with strict betweenness of the reverse blocker between
  `kept` and `deleted` (`exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit`,
  `TriApexEndpointRetainedOmission.lean:479`); both base-angle acuteness
  inequalities (`reverseHit_twoCenter_sqdist_acute`, `:606`, consumed
  nowhere); a fresh first-cap source outside the reverse row (`:705`).
- source-return route: the U5 ingress rows and dangerous blockers of
  `nonempty_sourceReturnU5Outcome`
  (`ATail/RetainedMatchingSourceReturnRadiusSplit.lean:670`); the paired
  normal form calls the weaker radius outcome (`:484`) and drops them at
  `PairedCommonDeletionNormalForm.lean:555-563`.

The two routes drop different data, so any adapter re-split must be stated
per route.

## 3. Recorded obstructions

All as labelled by their sources.

- O1 PROVEN. Polarity mismatch: the directed omission supplies survival
  (`v ∉ shell(u)`), the banked two-hit localizer needs failure (`v ∈ shell(u)`)
  (`docs/solve-prompts/2026-07-28-e-round1-response.md` §2).
- O2 PROVEN. The low-hit bound `≤ 2` on apex classes is the generic two-circle
  bound; it is not new information (same source §1).
- O3 PROVEN as a statement about the hypotheses. Rich interior patterns attach
  no point to any row; the missing object is a positive three-hit incidence
  producer (same source §4).
- O4 PROVEN. Minimality gives no removable vertex: deleting a safe source
  keeps K4 at three apices and both retained blockers but destroys K4 at its
  own blocker; `card ≤ 4 · |N|` bounds `|N|` from below only (same source §5).
- O5 EMPIRICALLY VERIFIED, exhaustive within the distance-equality/incidence
  abstraction only. A 15-point equality model realizes every incidence
  hypothesis of the E1 family at once (same source, "Exhaustive structural
  check"; corroborated by the cyclic block-incidence construction in
  `docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md:40-46`). A proof
  needs metric or convex-order content.
- O6 EMPIRICALLY VERIFIED at the incidence level. The global escape complement
  `Z = A \ (shell(kept) ∪ shell(deleted))` has `7 ≤ |Z|`, but safe counts
  `(2, 2, 0)` on the three strict supports realize `|Z| = 7` with no four safe
  points on one support; `Z` is not a sound ingress by itself
  (`checkpoint4-review.md:110-128`).
- O7 PROVEN source fact. `J` gives one source on a class of card `≥ 4`, not a
  same-radius pair and not four ordered sources.
- O8 PROVEN by a kernel-checked model. A generic `CriticalShellSystem`
  contradiction is false: the eight-point two-cycle geometry extends to a full
  shell system, so blocker cycles, radius potentials, and same-shell chord
  inequalities cannot close this leaf without `Q` and `G`
  (`scratch/retained-omission-e1/general-critical-shell-cover/REPORT.md`).
- O9 PROVEN source fact. `CommonDeletionTwoCenterPacket` rows are chosen
  four-subsets; their complements do not give nonmembership in a full
  `H.selectedAt` shell.
- O10 SOURCE-CHECKED. Provenance loss at the `J` adapter, listed in Section 2.
- O11 UNRESOLVED (ledger label). The F1 "preferred bypass" is architectural,
  not a closed route (`docs/dead-ends.md:1567-1594`).
- O12 EMPIRICALLY VERIFIED, exhaustive within the exact-15 incidence and
  boundary-order abstraction (Stages 1e to 1g in Section 7): 111 metric
  patterns in 20 dihedral orbits survive the complete boundary-order layer
  (closure-level rule, full strict Kalmanson form, triangle inequalities) on
  two SMT engines. L5 plus linear boundary-order inequalities is therefore
  not a terminal by itself; any refutation of the residue is metric.

## 4. Routes tried

Dead, with the killer:

| Route | Killed by |
|---|---|
| two-hit localization on the omission edge | O1 |
| pure counting from `card ≤ 4·|N|` plus low hits | O4, O5 |
| minimality gives a removable vertex | O4 |
| global complement `Z` as isolated ingress | O6 |
| generic blocker-graph / blocker-cycle / radius potential | O8; `docs/dead-ends.md:1417-1436` |
| power-matrix, Ptolemy/Plücker, Gram, EDM audits on packet rows | O9 |
| `false_of_frontierAllLargeCapsTriApex_all_low_hits` as alternate consumer | circular: its omission constructor calls the ancestor of this leaf |
| routing the transverse `2×2` packet to the D2 grid consumer | forbidden: the transverse packet is not the grid (`docs/erdos-97-descent-prose-proof-atomic.md:8586-8592`) |
| round-12 theorem-bank hunt for a positive cross-cap two-hit producer | none found; near candidates circular or stronger |

Partially proved (v87 route, `docs/erdos-97-descent-prose-proof-atomic.md:8544-8607`):
the twelve-witness producer, the four-source complement, per-source
five-survive/one-fail signatures, and the same-index pair are kernel-checked
(`Q` and `Q.exists_distinct_same_index`). The finite low-span kernel
`finFour_exists_nearby_mutualFalse_of_card_le_two`
(`ATail/FourVertexLowSpan.lean:28`) is kernel-clean with axioms `propext`,
`Classical.choice`, `Quot.sound`. Everything after that is conditional prose:

1. ingress from a same-cap safe pair to four ordered sources on one radius
   (missing);
2. the cross-radius transverse `2×2` saturation (no Lean statement);
3. the same-radius `μ = 0` paired fixed point (no consumer);
4. the same-radius strict two-cap disjoint `K2,2` plus global escapes (no
   consumer; the MEC-cap acute-visibility step has no Lean adapter).

CONJECTURED, all four. The 2026-08-30 extract adds: exact fifteen proves card
four strict interiors and the two-radius `2+2` partition but packages neither
`W.supportAt i = capInteriorByIndex i` nor a `Fin 4` order of that interior,
so the exact-15 one-radius arm produces no checked `μ = 0` packet
(`d1-source-interface-extract-2026-08-30.md:1193-1195`). The proposed
constructors `CrossApexExactFourPaired`, `ExactNonFirstSaturation`,
`TransverseTwoRadius` do not exist in Lean.

Historical v23 recursion (`erdos-97-descent-prose-proof-atomic.md:8681-8730`)
is a source-audited fallback with a stated lexicographic measure; it is not
the current frontier.

## 5. Reuse preflight

Search key: the leaf statement with `J`, `G`, `Q` as available hypotheses;
consumer `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`;
source revision `9a222da97`. Tools: `proof-blueprint search` and
`nthdegree docs search --corpus erdos-97-96-formalization-lean`. Re-run only
when the key changes. A prior search at revision `020e43bfc` is recorded in
`d1-source-interface-extract-2026-08-30.md:1141-1180` with the same
conclusion.

Direct contradiction consumer for the leaf as stated: none. Every
`False`-producing theorem of the joint-deletion family is stated over
`OriginalUniqueFourResidual` or physical-second-apex data, not over
`OrientedRetainedCommonDeletion`. Forty-three declarations reach the target
`sorry` (the reverse-hit wrapper and everything above it); nothing from that
set may be consumed.

Producers whose antecedents the leaf supplies now (all `sorry`-free, none
circular):

| Candidate | Location | Gives | First missing antecedent |
|---|---|---|---|
| `nonempty_selectedFourClass_preserving_point` | `ATail/FirstApexCriticalFiberRow.lean:45` | a `SelectedFourClass D.A S.oppApex1` row `K` with `J.source ∈ K.support` | none: `J.sourceRadius_pos`, `J.source_mem_class`, `J.sourceClass_card_ge_four` |
| `sourceFaithfulDeletionFan_of_triApexAllLargeContext` | `ATail/SourceFaithfulSelectedFourFan.lean:133` | a source-faithful deletion fan on `K`: every row point's blocker is cap-localized and blocking, with the equal-support/small-overlap dichotomy | none once `K` exists; `G` is the only other input |
| `exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker` | `ATail/SourceFaithfulSelectedFourFan.lean:446` | two points of `K` mutually omitting one another, with distinct blockers and both cross-deletions surviving | `∀ w ∈ K.support, S.oppApex1 ≠ H.centerAt w`; follows from `G.apex_rich` through `not_isUniqueFourCenter_of_fullyDeletionRobust` (`MinimalUniqueFourCover.lean:210`) {{NEEDS_PROOF}} as an elaborated term |
| `exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge` | `ATail/AllLargeCapCanonicalInterfaces.lean:317` | every blocker centre in some strict cap | none |
| `Q.exists_distinct_same_index` | `ATail/TriApexFiveSurviveOneFail.lean:156` | same-index pair in `E` | none; zero consumers today |

The first three chain into a same-radius mutually omitting pair on a
four-row at the first apex containing `J.source`, from `J` and `G` alone;
the chain is now the proved theorem
`exists_firstApex_mutualCrossDeletion_pair_through_source` (Phase 1 item
L6; its binders are `J` and `G` only). Freshness of the pair relative to
`{kept, deleted}` and its connection to the selected slice remain unproved
({{NEEDS_PROOF}}, Section 11 addendum, items 9 and 11).

Consumers whose antecedents the leaf does not supply (recorded so they are
not re-derived):

| Candidate | Location | First missing antecedent |
|---|---|---|
| `selectedFourClass_three_rows_tetrahedron_incompatibility` | `ATail/RobustApexCommonDeletion.lean:33` | the saturated three-row incidence pattern between centres |
| `u5_unit_triangle_on_p_circle_incompatibility` | `U5GlobalIncidenceKernels.lean:318` | six explicit distance equalities |
| `finFour_exists_nearby_mutualFalse_of_card_le_two` | `ATail/FourVertexLowSpan.lean:28` | an order-faithful `Fin 4` indexing of four sources (Phase 1 L5) |
| `false_of_selectedFourClass_common_actualCenter_pair_outside_cap` | `ATail/SourceFaithfulSelectedFourFan.lean:661` | two row points with the same blocker plus cap placement of centre, blocker, and both points |
| `false_of_orderedCap_three/four_equidistant_betweenness_cycle` | `FrontierLiveClosure/Rigid221SourceHeavy.lean:3601`, `:3664` | `MecCapPacket`, `MinorCapSideHypotheses`, `StrictCapOrder`, and cap indices for the sources (the same order lift) |
| `exists_fourHits_strict_cross_distance_oppIndex1` | `ATail/ExactFourAdjacentGridKalmanson.lean:1107` | an `ExactFourTwoRadiusAdjacentCapGrid` at `oppIndex1` |
| `capInteriorByIndex_card_eq_four_of_card_eq_fifteen`, `twoRichClassSlices_partition_of_capInterior_card_eq_four` | `ATail/ExactFifteenApexProfile.lean:158`, `:170` | `D.A.card = 15` (Phase 3 cardinality split) |
| `not_exists_distinct_actualBlocker_with_both_frontierDeletions_blocked` | `ATail/AnchoredDoubleDeletionProducer.lean:323` | a `SurvivorPairRelocationPacket`, which `O` and `P` do not expose |

Infrastructure imported by the target file and currently orphaned on the
spine, all `sorry`-free: `pairedGrid_exists_fourHits_radialCyclicOrder`
(`TriApexEndpointRetainedOmission.lean:1088`, zero consumers) and through it
the `ExactFourAdjacentGridKalmanson` cyclic-order chain; `FourVertexLowSpan`;
`TwoRadiusGridCapBoundarySigns.boundary_escape_sign_packet` (`:268`, zero
consumers); `EndpointFreshTwoShellSeed` top result (off-spine consumers only);
`SourceFaithfulSelectedFourFan.exists_distinct_outsideCap_fan_escape_or_crossDeletion`
(`:723`, off-spine consumer only).

Cross-project: the RVOL bank's q-deleted three-class tetrahedron
incompatibility and `eq_of_equidistant_three_noncollinear` have local
analogues already in the import cone; nothing in mathlib or the other
configured corpora matches the leaf's shape.

Search keys that returned nothing useful: "four centre circle infeasibility";
"Kalmanson" (only SAT-clause names; the content lives in
`ExactFourAdjacentGridKalmanson.lean`); `--name 'false_*'` combined with
`--sig` on packet names (the flags conjoin); "seven distinct centers"; "five
survive one fail"; "reverse row cap intersection". `proof-blueprint search
--uses` needs the fully qualified name, and `--used-by … --with-sorry` is one
hop only.

## 6. Highest-risk assumption and measure

Highest-risk load-bearing assumption: that the leaf is refutable from `J`,
`G`, `Q` at all. Incidence content alone is satisfiable (O5, O6), every v87
terminal is conditional, and no terminal has a contradiction consumer. The
plan tests this assumption before investing in adapters, with one exception:
the Phase 1 controls are cheap and are consumed by the leaf prefix; L5 and
L6 serve the Lean route only and do no work after a faithful metric
countermodel (Section 11 addendum, item 13).

Cell classification (Phase 1 checkpoint of 2026-09-01; theorem names are in
`TriApexEndpointRetainedOmission.lean`). Two index choices are available and
they carry different proven facts:

- Pair index `i` (PROVEN): two of the four sources of `E` lie on one indexed
  support `W.supportAt i`, and both avoid both retained shells
  (`exists_index_safe_pair_of_fiveSurviveOneFail`). Hence at `i` the
  `oneRadius` arm has safe count `s ∈ {2, 3, 4}` and the `twoRadii` arm has
  safe pair `(s₁, s₂)` with `s₁ + s₂ ≥ 2`
  (`strictApexFourWitness_safe_counts_of_pair`). The nine cells below are
  exhaustive at `i`. Every safe point carries the full five-survive/one-fail
  signature (`deletionSignature_of_not_mem_two_retainedShells`).
- Blocker-free index `j` (PROVEN): every blocker centre lies in some strict
  cap (`AllLargeCapCanonicalInterfaces.lean:317`), and some `j` avoids both
  retained blocker centres (`exists_capIndex_avoiding_two_blockers`). The
  one-hit rule (`:312`) then bounds each retained shell by one point per
  radius slice of cap `j` (`strictApexFourWitness_safe_counts_of_oneHit`).
  In the `oneRadius` arm this gives `s ≥ 2`. In the `twoRadii` arm it gives
  only one hit per shell per slice, so the safe pairs `(1,0)`, `(0,1)`,
  `(0,0)` are not excluded at `j`. The 2026-08-23 audit
  (`docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md`) already listed
  zero-safe slices. The first version of this section claimed `s₁ + s₂ ≥ 2`
  at `j` from the one-hit rule alone; that claim was wrong for the `twoRadii`
  arm and is withdrawn.

The measure below is anchored at the pair index `i`. When `i = j` both fact
sets hold at once; whether Phase 3 needs `i = j` is open {{NEEDS_PROOF}}.
Recorded route (Section 11 addendum, item 14): split on `i = j`; when
`i ≠ j` the safe pair lies in a cap that holds a retained blocker centre,
and at exact 15 L4 puts that centre inside the four-point witness support
of that cap.

Cells at `i`:

- `oneRadius` at `i`: safe count `s ∈ {2, 3, 4}` on one radius (3 cells);
- `twoRadii` at `i`: safe pair `(s₁, s₂)` on the two two-point slices with
  `s₁ + s₂ ≥ 2`: `(2,2), (2,1), (1,2), (2,0), (0,2), (1,1)` (6 cells). The
  cell `(1,1)` is the transverse saturation of item 2 above; every other cell
  carries a same-radius safe pair.

Measure `M` = number of (cardinality class, cell) pairs not covered by a
checked terminal or replayed certificate, with cardinality classes
`{15, ≥ 16}`. At base head `M = 18`. The count is sound only while every
cell theorem is uniform in the pair index `i` (the cover theorem
`strictApexFourWitness_safe_counts_of_pair` is stated for an arbitrary
index, and every Phase 3a cell theorem takes `i : Fin 3` as a parameter); a
cell theorem that fixes the role of `i` (first opposite cap, second
opposite cap, surplus cap) refines the measure by that role (Section 11
addendum, item 4). A checkpoint counts as proof progress
only if `M` strictly decreases and the raw on-spine `sorry` count does not
increase, except as allowed by the split rule in Phase 3.

## 7. Phases

### Phase 0 — coverage and lane (this checkpoint)

- Anchor the blueprint session on the target.
- Lane checkpoint `.codex/worktree-checkpoints/d1-triapex-plan-20260901.json`.
- This document; index entry; ledger pointer.

### Phase 1 — Lean positive controls (on spine, cheap)

Each item is proved as a kernel-checked lemma that the leaf consumes in its
proof prefix. No wrapper networks. None of these reduces `M`; they are
infrastructure every later phase needs.

Status (2026-09-01): L1 to L6 are proved in
`TriApexEndpointRetainedOmission.lean` (section `TriApexLeafControls`) and
consumed in the leaf's proof prefix; the leaf's single `sorry` is unchanged
and `M = 18` is unchanged. Phase 1 is complete.

- L1 same-index pair: done, `exists_index_safe_pair_of_fiveSurviveOneFail`
  (consumes `Q.exists_distinct_same_index`; adds that both pair points avoid
  both retained shells).
- L2 blocker localization: done for `O.kept` and `O.deleted`,
  `exists_capIndex_avoiding_two_blockers` (consumes
  `exists_criticalShell_center_with_otherRichCapSlice_card_le_one`, `:718`).
  `J.source` and the pair points localize through the same producer when a
  Phase 3 cell needs them; the prefix does not bind them yet.
- L3 safe-slice classifier (checkpoint-4 step 1): done in two forms, see
  Section 6: `strictApexFourWitness_safe_counts_of_pair` at the pair index
  and `strictApexFourWitness_safe_counts_of_oneHit` at the blocker-free
  index. The earlier {{NEEDS_PROOF}} on per-point signatures is closed by
  `deletionSignature_of_not_mem_two_retainedShells`, which gives the full
  signature for any carrier point outside both retained shells.
- L4 exact-15 identity: done,
  `strictApexFourFamily_supportAt_eq_capInteriorByIndex_of_card_eq_fifteen`
  (reuses `ATailExactFifteenApexProfile.capInteriorByIndex_card_eq_four_of_card_eq_fifteen`,
  reachable through the existing `EndpointFreshTwoShellSeed` import).
- L6 first-apex mutual-omission pair: done,
  `exists_firstApex_mutualCrossDeletion_pair_through_source`: a four-row
  `K ∋ J.source` at `oppApex1` with `K.radius = J.sourceRadius`, carrying a
  mutually omitting pair `z ≠ w` with distinct blockers and both
  cross-deletions surviving. {{NEEDS_PROOF}} that the pair is not
  `{kept, deleted}` again; `K` may contain them. The minimum fresh
  conclusion is that one endpoint is `J.source` or the unordered pair
  differs from `{O.kept, O.deleted}`; for Phase 3 use the endpoints must
  also connect to the selected strict-cap slice and its order (Section 11
  addendum, item 9).
- L5 order adapter (the 2026-08-30 extract's next interface test): done,
  `exists_orderedCap_six_of_card_eq_fifteen`. At card 15 the oriented
  complete cap order of every cap has exactly six slots
  (`orderedCap_card_eq_of_image_eq_capByIndex`), slots `0` and `5` are the
  two Moser vertices of the cap, and a slot lies in the strict interior
  exactly when it is not an endpoint slot
  (`orderedCap_points_mem_capInteriorByIndex_iff`, cardinality-generic).
  The four middle slots `1..4` are therefore consecutive and enumerate
  `capInteriorByIndex i` injectively; with L4 they enumerate
  `W.supportAt i`, which in the `oneRadius` arm is the full same-radius
  slice. `StrictCapOrder` supplies the chord-projection order and the
  between-slot characterization that the interval count `μ` of Phase 3a
  needs. The decision point did not trigger. Not retained here: the
  reverse-hit provenance of Section 2, which lives in `J`'s producer, not in
  this cap-order adapter.

### Phase 2 — kill-test (computational, discovery gate only)

Question: is each Section 6 cell refutable from its own binders at
`card = 15`? At card 15 the carrier is the three apices plus the twelve
strict-interior points, so the named-role quotient and the full carrier
coincide; one encoding suffices. {{NEEDS_PROOF}}: cite a checked carrier-decomposition theorem;
`capInteriorByIndex_card_eq_four_of_card_eq_fifteen` gives four
strict-interior points per cap, and the partition of the twelve non-apex
points into the three strict interiors is the missing citation (Section 11
addendum, item 13).

Solver lane and approvals (sat-solvers skill policy):

- every SAT stage runs through `piqd`; the metric stage is the existing
  `piqd` Z3 `QF_NRA` profile; no local solver fallback;
- any non-`piqd` engine (cvc5, Singular, msolve, SymPy replay) needs Adam's
  per-task approval before it runs; {{NEEDS_ADAM_INPUT}};
- every run carries a wall-clock timeout; no cube-and-conquer without a cube
  cap.

Known limit: the D-R lane found Z3 `QF_NRA` through `piqd` compute-blocked on
an 18-atom geometric negative control
(`docs/plans/2026-09-01-dr-two-radius-branch-closure.md` Phase 1 status). A
15-point convex encoding is larger. Expect the metric stage to be
inconclusive; the equality-only stage is already known SAT (O5), so the
decision rule below treats `UNKNOWN` as the likely outcome.

Encoding: the full binder block of Section 2, at `card = 15`, profile
`(6, 6, 6)`, per cell:

- roles: three apices; strict interiors `I₀, I₁, I₂` of four points each;
  `kept`, `deleted`, `source ∈ I₁ ∩ Γ(a₁, radius)`; the witness radii at `j`
  per cell; blockers `c(x)` for all fifteen points, each an exact four-shell
  containing `x`, blockers avoiding apices, apex-rich classes at all three
  apices; the four common-deletion packets of `O` and `J` as chosen four-rows
  with overlap `≤ 2`; deletion survival and failure per `Q`; convex cyclic
  order; no point equidistant from all three MEC vertices; `card ≤ 4·|N|`.

Guardrails:

- Smoke tests before any verdict is trusted: re-encode the kernel-closed D2
  sibling context `PairedTwoRadiusGrid` and confirm the metric stage reports
  UNSAT; re-encode the 15-point equality shadow and confirm the equality-only
  stage reports SAT.
- Cut admission record: every hard-clause block names the Lean theorem or
  definition it images, or declares itself a relaxation. No block may image
  an open `sorry`.
- Every verdict is CONJECTURE until the encoding-to-claim map is
  adversarially audited by a second reader.
- SAT models are read back and replayed in exact rational arithmetic or by
  a certified real-algebraic replay (the equalities can force algebraic
  coordinates, so rational-only replay can discard a valid witness); a
  model that fails replay is not a witness. A countermodel claim needs every
  field of `D`, `S`, `R`, `G`, `Q` encoded: the cap-side and partition
  semantics of `SurplusCapPacket`, the residual and minimality fields of `R`
  the target uses, exact `SelectedClass` membership including nonmembers,
  deletion failure in `CriticalShellSystem` as the absence of every
  four-point fiber after deletion, the definition of `notRobustCenters`, and
  the class and radius semantics of the two witness constructors. A SAT
  model of any relaxation is diagnostic only (Section 11 addendum, item 8).
- UNSAT is reported only at scope `card = 15`.

Decision rule:

- a cell metrically SAT with every hypothesis encoded and an exact rational
  or certified real-algebraic witness: that cell does not close from its binders at 15. Stop, report, and
  propose an upstream re-split. First re-split candidate: retain the dropped
  provenance of Section 2 in `J` at both adapters (reverse-hit order,
  betweenness, acuteness; source-return U5 rows), because those facts are
  already proved and cost no new obligation. Preferred form (Section 11
  addendum, item 12): route-specific terminal calls at the existing ingress
  wrappers (a reverse-hit core receiving the reverse row, strict
  betweenness, the acute inequalities and the fresh source; a source-return
  core receiving the U5 rows and dangerous blockers) rather than optional
  route data on the shared `J` interface, and only in the change that
  closes that route or a child. Before either, run the route-delta sequence
  on the surviving exact-15 patterns (item 7): the base `J, G, Q` cell; plus
  the reverse-row exact intersection; plus reverse-hit betweenness and
  order; plus the two acute inequalities; plus the fresh first-cap source;
  separately plus the source-return U5 packet, recording which addition, if
  any, changes satisfiability.
- every cell UNSAT with certificate: Phase 3 certificate ingress at 15, then
  Phase 4.
- `UNKNOWN` or compute-blocked: Phase 3 proceeds by Lean order and counting
  per cell, starting with the cells that carry a same-radius safe pair.

Bridge and stop rule (review triage, Section 11): the only route from
Phase 2 evidence to the leaf is

```text
source role packet (Section 2 binders at the pair index i and the
blocker-free index j)
  → exhaustive finite/order cells (Section 6)
  → checked certificate, or a Lean order/counting proof, per cell
  → the leaf
```

A further structural SAT/UNSAT wave is admitted only when it strengthens one
arrow of that chain: a new source fact imaged by a hard clause, a cell removed
by certificate, or a cell closed in Lean. A wave that repeats a verdict at the
same scope with the same cut set is rejected.

Deliverables: manifests under `scratch/runs/d1-triapex-plan-20260901/<run-id>/`
with `run_manifest.json`, `promotion_eligible = false` until Phase 3.

Status 2026-09-01 (Phase 2 assessment; no solver run was executed):

- Instrument. The metric stage's only unapproved engine is Z3 `QF_NRA`
  one-shot through `piqd`. The D-R lane ran that engine on an 18-atom genuine
  geometric negative control (two distinct circles share at most two points)
  and got `UNKNOWN` at 300 s twice, and `UNKNOWN` on its 717-atom generic
  cell at 900 s (`docs/audits/2026-09-01-dr-two-radius-quotient-wave.md`,
  "Runs"). The D2 smoke test of this plan is a larger genuine geometric
  UNSAT: the kernel proof of the grid refutation uses chord reflections,
  signed areas, and a polynomial escape lemma. Under the stop rule above, a
  run of the same engine on a larger instance of the same kind repeats a
  verdict at the same scope, so it was not executed. The metric stage is
  instrument-blocked before the smoke gate; by the decision rule, Phase 3
  proceeds by Lean order and counting per cell.
- Dimension count (HEURISTIC; assumes generic independence of the
  equalities). Fifteen points carry 30 coordinates and the similarity group
  has dimension 4, so 26 degrees of freedom. The binders impose at least 27
  polynomial equalities. `G.apex_rich` gives at each apex either one class of
  six points (5 equalities) or two classes of four (6), so at least 15. The
  critical shell system gives every point an exact four-point shell at a
  non-apex blocker: `fullyDeletionRobustAt_of_apexRichClassStructure` makes
  the apices robust, `isUniqueFourCenter_centerAt` and
  `not_isUniqueFourCenter_of_fullyDeletionRobust` keep them out of the
  blocker set. Each blocker centre carries exactly one four-point circle,
  because a second one would survive the deletion of the blocked point,
  against `no_qfree`. Covering fifteen points by four-point shells needs at
  least four shells, so at least 12 equalities. At card 16 the same count
  gives at least 27 equalities against 28 degrees of freedom. Reading: exact
  15 is the cheapest complete saturated falsification test (the
  minimum-cardinality saturated case, not shown to be the hardest; Section
  11 addendum, item 6), in the direction the plan assumed (review question
  2), and the risk of a genuine witness family sits at card 16 and above,
  in Phase 4. A dimension count is not a refutation and does not change `M`.
- Sharper SAT-side test, deferred. The D-R lane's solver-free constructive
  witness search (`census/card_head/dr_two_radius_quotient.py`,
  `witness_search`: float least squares on the atom margins, then exact
  rational replay of every atom) is the sharper instrument for the
  non-refutability side. Its obstacle here is the discrete skeleton: the
  blocker assignment of all fifteen points, the shell memberships, and the
  packet rows are not fixed by the nine Section 6 cells, so a witness search
  needs a skeleton enumeration first. Deferred until a Phase 3 cell resists,
  or until Adam authorizes a Gröbner engine for the pinned-skeleton
  equalities. {{NEEDS_ADAM_INPUT}}.
- No run root was created under `scratch/runs/d1-triapex-plan-20260901/`;
  the lane checkpoint keeps `generated_roots` empty.

### Phase 3 — exact-15 closure per cell

- 3a `oneRadius` cells at exact 15: after L4 and L5 (the four middle slots
  enumerate the full same-radius slice), wire
  `finFour_exists_nearby_mutualFalse_of_card_le_two` and the interval
  descent. The `twoRadii` cells with a same-radius safe pair (`(2,2)`,
  `(2,1)`, `(1,2)`, `(2,0)`, `(0,2)`) get only two selected safe points on
  one radius; at exact 15 `selectedClass_card_eq_four_of_twoRadii_card_eq_fifteen`
  completes that radius class to four points with one in each adjacent
  cap, which is not a four-point strict slice of cap `i`, so neither L5 nor
  the `Fin 4` low-span kernel applies there and the same-cap-pair-to-four-
  ordered-sources ingress stays missing (Section 11 addendum, item 5). The descent terminals (`μ = 0` fixed point, disjoint `K2,2` plus
  escapes) get Lean statements only in the change that also supplies their
  contradiction; until then they are `SKETCH — NOT PROMOTABLE`.
  {{NEEDS_PROOF}} for both terminals; {{NEEDS_PROOF}} for the MEC-cap
  acute-visibility adapter of the `μ = 1` shared-support arm.
- 3b transverse cell `(1,1)`: the D1-specific transverse saturation
  contradiction (checkpoint-4 step 2). Not the D2 grid consumer. No source
  object exists. {{NEEDS_PROOF}}.
- 3c certificates: for any cell with a Phase 2 UNSAT certificate, emit through
  `census/p97_search/phase3_qq_certificate_lean_emitter.py` and pass the
  Lean-ingress publication gate. A Z3 UNSAT with no certificate stays
  diagnostic.
- Split rule: the leaf is split into `card = 15` and `16 ≤ card`, or into
  cells, only in the same change that closes at least one resulting child, so
  the on-spine `sorry` count does not rise. This is the standing E1
  do-not-fan-out constraint
  (`docs/computational-closure-plan-2026-07-28.md:5491`).
- Independent promotion verifier plus a math-skeptic audit before any
  promotion claim.

Status 2026-09-01 (Phase 3a, first checkpoint: the cap-order lift of the
finite low-span kernel is proved and consumed by the leaf; no cell is closed):

- `LowSpanMutualOmissionPairAt D S H i` names the Phase 3a state at
  `card = 15`: the oriented complete cap order of cap `i` from L5, its four
  middle slots enumerating `capInteriorByIndex i`, and slots `a < b ≤ a + 2`
  whose points mutually omit one another from their actual critical shells,
  with both cross-deletions surviving and distinct blocker centres. At most
  one strict-interior point lies between the pair, so the interval count of
  Phase 3a starts at `0` or `1`.
- `lowSpanMutualOmissionPairAt_of_oneRadius_card_eq_fifteen` proves that
  state in the `oneRadius` arm. Inputs: the L5 slots, the source-faithful
  fan bound (each actual shell meets the same-radius slice in at most two
  points, because the apex is never a blocker centre, as in L6), and
  `finFour_exists_nearby_mutualFalse_of_card_le_two`. It retains the slot
  order that `exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker`
  discards.
- `twoRadii_or_lowSpanMutualOmissionPairAt_of_card_eq_fifteen` dispatches on
  the witness constructor and returns the raw `twoRadii` data otherwise. The
  leaf binds it as `hlowSpanAtPair` at the pair index `i` through L4.
- Axiom closure of both theorems: `propext`, `Classical.choice`,
  `Quot.sound`. The leaf's single `sorry` is unchanged, the on-spine open
  obligation count is 28 (unchanged), and `M = 18` is unchanged. Of the
  seven missing ingress fields listed in the 2026-08-30 extract (Section 5),
  items 1 to 5 are now supplied at `card = 15` in the `oneRadius` arm; item
  6 (the interval count and its strict decrease) and item 7 (the provenance
  a terminal needs) are not.
- Not done: the descent one-step and both terminals. No descent state,
  successor, or terminal is defined in Lean, per the rule above. The prose
  scheme (`docs/erdos-97-descent-prose-proof-atomic.md`, F3.37 to F3.39) is
  marked superseded there; only its shrink lemmas are reusable. The `μ = 0`
  paired fixed point still has no contradiction consumer. {{NEEDS_PROOF}}.
- The `twoRadii` cells at `i` are untouched by this checkpoint; the fan
  bound gives no two-point bound across two slices.

Status 2026-09-01 (Phase 3a, second checkpoint: `μ = 0` terminal assessment;
no Lean change, no build, no solver run; full record in
`docs/audits/2026-09-01-d1-mu0-terminal-analysis.md`):

- Verdict (HEURISTIC): the `μ = 0` paired fixed point is not refutable from
  the hypotheses the leaf binds. An incidence witness satisfies every listed
  constraint: the four same-radius interior points of cap `i` each carry a
  distinct blocker centre in another cap, each actual shell meets cap `i`
  only in its own source, so every pair (adjacent pairs included) mutually
  omits, both cross-deletions survive, and the cover bound
  `15 ≤ 4 · |centres|` holds with four centres. This is the O5/O6 finding of
  Section 3, specialized to the `μ = 0` cell. A contradiction, if one
  exists, is metric: realizability of that incidence pattern by points in
  convex position with the three apices on the enclosing circle.
- Route B (DERIVABLE; CONJECTURED until compiled): from
  `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`
  (`AllLargeCapCanonicalInterfaces.lean:85`), `isUniqueFourCenter_centerAt`,
  `G.apex_rich i`, and `CGN.index_strictly_between_of_equidistant`
  (`CapSelectedRowCounting.lean:51`): if one interior slot's shell contains
  another interior slot of cap `i`, the blocker centre is itself an interior
  slot strictly between them. So adjacent interior slots never contain one
  another in the `oneRadius` arm at `card = 15`. Consequences: `μ = 0` is
  forced, the `μ = 1` arm of the prose descent is empty in this cell,
  `finFour_exists_nearby_mutualFalse_of_card_le_two` is not needed here (the
  pair can be taken as slots `1, 2`), and ingress item 6 collapses to
  `μ = 0` with no step to take. The first-checkpoint statement above that the
  interval count "starts at `0` or `1`" is therefore `0` once Route B is
  compiled. First missing antecedent for a contradiction: any fact forcing
  one shell to meet the slice in two points; the fan bound is an upper bound
  only.
- Route C (DERIVABLE; CONJECTURED until compiled): the private
  `selectedClass_capInteriorByIndex_card_ge_two_of_card_four`
  (`FirstApexInteriorPairGeometry.lean:232`) uses `card = 4` only in its
  closing arithmetic, so it generalizes to `4 ≤ card`. Classes at one centre
  with distinct radii are disjoint, and the interior of cap `i` lies in the
  radius-`r` class, so the two-radii branch of `G.apex_rich i` is impossible
  and the apex class at `i` has exactly six points: the four interior points
  plus one point in each adjacent cap. First missing antecedent for a
  contradiction: a fact excluding or locating those two adjacent-cap points.
- Routes A, D, E, F are dead ends with named missing antecedents: A
  (adjacent-slot bisector uniqueness) needs a second carrier bisector point
  the binders deny; D (capacity count) is arithmetically slack without a
  lower bound on fibre size; E (cap-interior equidistance kernels of
  `Rigid221SourceHeavy.lean:3601` to `:3800`) needs a third co-cap shell
  point or a bisector cycle, and the arrow-free witness shows no arrow set is
  forced; F (a second circle through the pair) does not exist.
- Smallest deciding experiment, not run: Stage 1, a named-role incidence SAT
  at `card = 15` (predicted SAT; machine-checks the negative); Stage 2, a
  `QF_NRA` realizability check of the returned model (needs Z3 or cvc5,
  which needs per-task approval). UNSAT at Stage 2 with a usable core names
  the metric identity a Lean consumer must encode. {{NEEDS_ADAM_INPUT}} on
  whether to run Stage 1, Stage 2, or neither.
- Allowed continuation without a decision: Route B and Route C as
  infrastructure checkpoints (no cell closed, `M = 18` unchanged). Neither
  is a terminal statement, so the Phase 3a rule above does not block them.

Status 2026-09-01 (Phase 3a, third checkpoint: Route B compiled; the
adjacent-slot pair replaces the low-span pair; no cell is closed):

- `not_mem_selected_support_of_adjacent_interior_slots_of_oneRadius` is
  proved: in the `oneRadius` arm, a strict-interior point of cap `i` never
  lies on the actual critical shell of a strict-interior point at an
  adjacent slot of the oriented complete cap order. Inputs:
  `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`,
  `isUniqueFourCenter_centerAt`, `G.apex_rich i`, and
  `CGN.index_strictly_between_of_equidistant`. Route B of the assessment
  above is therefore PROVEN, not DERIVABLE.
- `LowSpanMutualOmissionPairAt` is replaced by
  `AdjacentMutualOmissionPairAt D S H i`: the same cap-order data, and slots
  `s, t` of the strict interior with `t = s + 1` that mutually omit one
  another, with both cross-deletions surviving and distinct blocker centres.
  `adjacentMutualOmissionPairAt_of_oneRadius_card_eq_fifteen` proves it at
  slots `1, 2` without `finFour_exists_nearby_mutualFalse_of_card_le_two`;
  the dispatcher is `twoRadii_or_adjacentMutualOmissionPairAt_of_card_eq_fifteen`
  and the leaf binds it as `hadjacentAtPair`. The interval count of the
  first checkpoint is now `0` by construction; ingress item 6 has nothing
  left to decrease.
- Axiom closure of all three declarations: `propext`, `Classical.choice`,
  `Quot.sound`. The leaf's single `sorry` is unchanged, the on-spine open
  obligation count is 28 (unchanged), and `M = 18` is unchanged.
- Still open: the `μ = 0` terminal has no contradiction consumer; the
  incidence witness of the assessment above satisfies the new statement
  too. Route C (exact six-point apex class) is the next infrastructure
  candidate; the solver stages wait on the decision recorded above.

Status 2026-09-01 (Phase 3a, fourth checkpoint: Route C compiled; the
adjacent-slot state carries the circle and the exact six-point apex class;
no cell is closed):

- `selectedClass_card_eq_six_of_oneRadius_card_eq_fifteen` is proved: at
  carrier size fifteen, when the four strict-interior points of cap `i` lie
  on one circle about the apex opposite cap `i`, that apex's class at that
  radius has exactly six points, with exactly one point in each adjacent
  cap. Inputs: `capInteriorByIndex_card_eq_four_of_card_eq_fifteen`, the
  public adjacent-cap one-point bounds and the sdiff cover from the
  `SurplusM44Packet` shards, and `G.apex_rich i`. The private card-4 lemma
  in `FirstApexInteriorPairGeometry.lean` was not touched; the `4 ≤ card`
  bound is proved locally. Route C of the assessment above is therefore
  PROVEN; the two-radii branch of `G.apex_rich i` is impossible in this
  cell.
- `AdjacentMutualOmissionPairAt` now also records a radius `r > 0` with the
  strict interior of cap `i` in the apex class at `r`, that class of card
  exactly six, and one point in each adjacent cap. The producer takes the
  `oneRadius` positivity `hr` again; the dispatcher and the leaf binding
  `hadjacentAtPair` are unchanged in shape.
- Axiom closure of the three declarations: `propext`, `Classical.choice`,
  `Quot.sound`. The leaf's single `sorry` is unchanged, the on-spine open
  obligation count is 28 (unchanged), and `M = 18` is unchanged.
- Still open: no contradiction consumer for the `μ = 0` terminal. The
  incidence witness of the assessment satisfies the extended state as well
  once the two adjacent-cap points at distance `r` from the apex are added.
  Any consumer must now be written against a six-point cocircular class
  about a Moser vertex: four points in the opposite cap and one in each
  incident cap. {{NEEDS_ADAM_INPUT}} on the solver stages stays open.

Status 2026-09-01 (Phase 3a, fifth checkpoint: the smallest metric question
on the pinned object, stated for the solver decision; read-only, no run):

- The pinned object at the pair index `i` in the `oneRadius` arm at
  `card = 15` (all PROVEN, `AdjacentMutualOmissionPairAt`): the six-slot
  strict cap order of cap `i` with the two chord apices at slots `0, 5`;
  the four interior points at slots `1..4` on one circle of radius `r`
  about the opposite apex; that apex's class at `r` of exactly six points,
  one in each incident cap; slots `1, 2` mutually omitting with distinct
  non-apex blocker centres, each centre carrying an exact four-point shell
  through its source and no four-point class after that source is deleted.
- There is no small refuting metric question. The pinned object alone
  imposes 11 polynomial equalities (five for the six-point class, three per
  shell) on the 26 degrees of freedom of the Phase 2 count, so on its own it
  is a 15-parameter family (HEURISTIC, generic count) and Stage 2 on it is
  predicted SAT. Refuting power only comes from the whole card-15 system:
  the three apex classes (at least 15 equalities; at index `i` now exactly
  the six-point class, so the two-radii branch is gone there) and the at
  least four blocker shells covering all fifteen points (at least 12), that
  is at least 27 equalities against 26 degrees of freedom. Generic counting
  therefore predicts no witness family at card 15, but it cannot exclude a
  non-generic (dependent) real solution, which is exactly the question a
  solver has to answer.
- Shape of the decisive question. Per incidence pattern (which twelve
  interior labels are blocker centres, which four-point shells they carry,
  and which points lie in which cap and slot), a degree-two polynomial
  system of at least 27 equations in 26 normalized coordinates, expected to
  be zero-dimensional or empty; the open conditions (convex position, cap
  order, the deletion-survival disequalities, the unique-four-centre facts)
  are then checked on the finitely many real solutions. This is
  Gröbner-plus-real-root territory (msolve and Singular, cross-checked per
  Guardrail 7), not `QF_NRA` search. The cost driver is the number of
  incidence patterns that survive the PROVEN incidence bounds, which is
  what Stage 1 (a piqd census of the named-role quotient at card 15) would
  count; no encoder for that quotient has been verified to exist.
  {{NEEDS_ADAM_INPUT}}: run Stage 1 to count patterns, run a per-pattern
  algebra stage (needs per-task approval), or neither.
- Lean leaf unchanged by this checkpoint: single `sorry`, on-spine open
  obligations 28, `M = 18`.

Status 2026-09-01 (Phase 3a, sixth checkpoint: the two-radii analogue of
Route C compiled; no cell is closed):

- `selectedClass_card_eq_four_of_twoRadii_card_eq_fifteen` is proved: when
  the strict interior of cap `i` splits into two pairs at distinct radii
  about the opposite apex, that apex's classes at those radii have exactly
  four points each, the pair plus one point of each adjacent cap; the
  six-point branch of `G.apex_rich i` is impossible there and the two-radii
  branch is at exactly these radii. The private helpers
  `selectedClass_adjacent_bounds` and
  `selectedClass_capInteriorByIndex_card_ge_two_of_four_le_card` now serve
  both Route C theorems. The dispatcher's `twoRadii` disjunct returns these
  two exact four-point classes, so the leaf binding `hadjacentAtPair`
  carries the apex class structure in both arms.
- Axiom closure: `propext`, `Classical.choice`, `Quot.sound`. Leaf `sorry`
  unchanged, `M = 18`. The on-spine open count is 36 at `eadc775d4`; the
  eight new obligations belong to the D-R lane exact-12 mirror, not D1.
- Direction change (Adam, 2026-09-01): stop gating on decisions. Non-piqd
  solver runs stay unapproved; the algebra stage goes through piqd, and the
  D1 use case was posted to the piqd maintainer (#8669 on `#piqd`, #8670
  here) against PIQD-BACKEND-002: `piqc singular run` exists on daemon
  0.1.0, a second engine for the Guardrail 7 cross-check does not. Stage 1
  (piqd cadical incidence census at card 15, encoder
  `census/card_head/d1_mu0_incidence_census.py`) is being built and run by a
  background agent; its verdicts are CONJECTURE at the encoded scope until
  the encoding-to-claim map is audited.

Status 2026-09-01 (Phase 3a, seventh checkpoint: Singular through piqd
validated for the algebra stage; infrastructure only, no cell is closed):

- Guardrail 1 smoke runs of the piqd Singular lane (`piqc singular run`,
  daemon 0.1.0, receipts under
  `scratch/runs/d1-triapex-plan-20260901/singular-smoke-01/artifacts/`):
  `std`/`dim`/`vdim` on four known ideals (a nonempty complex curve with no
  real point, a zero-dimensional ideal of two complex points, the unit
  ideal, and a Rabinowitsch non-forcing instance) and `nrRootsDeterm` from
  `rootsmr.lib` on four zero-dimensional ideals with 0, 2, 1, 0 real roots.
  All eight verdicts match the hand-known answers. Each run is attested
  (`SINGLE_SPAWN_UNCONFINED_CHILDREN`, binary and script hashes on the
  receipt), so the algebra stage's per-pattern scripts have a validated
  execution path and a validated real-root count.
- What this does not give: the Guardrail 7 second engine. Singular is one
  engine; a decisive emptiness verdict on a surviving pattern still needs an
  independent engine, and the only approved route to one is the piqd
  maintainer (request #8669 on `#piqd`, no reply yet). Until it exists, a
  Singular-only emptiness verdict is CONJECTURE at the encoded scope and is
  recorded as one-engine evidence, not banked.
- Stage 2 generator `census/card_head/d1_mu0_pattern_algebra.py`: projects a
  Stage 1 model record to its metric content (distinct `(centre, shell)`
  pairs and apex classes; roles and slices dropped), pins `A0 = (0, 0)`
  and `A1 = (1, 0)` (26 variables), emits one Singular script per metric
  pattern (`std`, `dim`, `vdim`, `nrRootsDeterm`, optional saturation by
  named coincidences), and submits it only through `piqc singular run`.
  Known-answer tests in `tests/test_d1_mu0_pattern_algebra.py` (11 pass):
  a free class is a curve, one concyclic shell is a three-parameter
  family, the non-concyclic four-set with a forced centre is finite
  before and empty after saturating the coincidence, and the
  equilateral apex triangle has exactly two real solutions. Verdict
  labels: `EMPTY_COMPLEX`, `POSITIVE_DIMENSIONAL`, `FINITE_NO_REAL`,
  `FINITE_REAL_CANDIDATES`; all one-engine CONJECTURE at encoded scope.
- Stage 1 (piqd cadical incidence census) is still running in the
  background agent; its encoder and run tree are validated and committed
  when it reports. Leaf `sorry` unchanged, `M = 18`.

Status 2026-09-01 (Phase 3a, eighth checkpoint: Stage 1 census delivered,
Stage 2 first verdicts; all solver evidence CONJECTURE at encoded scope):

- Stage 1 (`census/card_head/d1_mu0_incidence_census.py`, run root
  `scratch/runs/d1-triapex-plan-20260901/stage1-incidence-01/`, report in
  `artifacts/REPORT.md`): 15 labels (three apices, three caps of four
  ordered slots), one centre and one four-point shell per modelled point,
  22 clause blocks with cut-admission records (all `PROVEN` except R13
  `DERIVED`, R7/Q1 `IMPLIED`, C1/C2 selectors); 59 of the 60 named Lean
  sources resolve to declarations, the sixtieth is a selector description.
  Every solver call went through piqd (raw-DIMACS jobs with automatic LRAT
  on UNSAT, SAT sessions for queries and enumeration). Guardrail 1 smoke
  tests passed: the audit witness is SAT with a clean replay, and the
  adjacent-slot arrow, the centre-at-apex, and the same-centre-different-
  shell instances are UNSAT with LRAT proofs (the first matches Route B).
- Verdicts: all 32 cells (pair index 0 or 1, eight arm combinations,
  `in12`/`ax15`) are SAT at the incidence level. In the 16 target cells all
  six adjacent arrows are UNSAT and all six far arrows SAT; all nine
  pair-centre cap placements are SAT; the minimum number of distinct
  blocker centres is 3 (`in12`) and 4 (`ax15`). Every enumeration (`full`
  and `capi` projections) hit the 3000-model cap, so pattern counts are
  lower bounds; the incidence abstraction does not refute the leaf and does
  not exhaust its pattern space. The encoding is a survivor superset
  (Section 2 of the report lists the omitted binders).
- Stage 2 on the target cell `i0-1R1R1R-in12` (one engine, Singular via
  piqd, run root `stage2-probe-01`): the 3000 sampled models are 3000
  distinct metric patterns over only 11 centre maps and 7 apex-class
  systems; the variation is in the filler points of the shells. Every
  pattern decided so far is EMPTY over the complex numbers once all fifteen
  points are saturated distinct (unsaturated they are 4- to 6-dimensional,
  all coincidence components), typically in well under a second, with rare
  patterns near 90 s. A core-mining pass (deletion-minimal inconsistent
  sub-pattern per refuted pattern, coverage counted) is running on a sample.
- Consequence for the route. Per-pattern algebra over the full projection
  is unbounded case splitting (Guardrail 3). The closure route is core
  mining: recurring small inconsistent sub-patterns become circle-
  intersection lemmas, proved in Lean and fed back to Stage 1 as `PROVEN`
  cuts, until the incidence census turns UNSAT or a cell is refuted by a
  Lean-provable core. Banking any Stage 2 emptiness verdict needs the
  Guardrail 7 second engine (piqd maintainer, #8669, no reply yet).
- Lean leaf unchanged: single `sorry`, `M = 18`.

Status 2026-09-01 (Phase 3a, ninth checkpoint: the distance-equality closure
rule; solver-free measurement, Stage 1b delegated):

- Observation (EMPIRICALLY VERIFIED on the Stage 1 samples, no solver): a
  union-find closure over unordered point pairs, seeded by the equalities
  every shell and every apex class asserts, followed by the exactness of
  both objects (`mem_selectedClass`: a carrier point at the class radius is
  in the class; `CriticalFourShell.support_eq`: a carrier point at the shell
  radius is in the shell), refutes 2997 of 3000 sampled patterns in
  `i0-1R1R1R-in12`, 3000 of 3000 in `i1-1R1R1R-in12`, 2993 of 3000 in
  `i0-1R2R2R-in12`, and 3000 of 3000 in `i0-1R1R1R-ax15`. The audit witness
  dies this way: `A1, A2` in class `A0` and `A0, A2` in class `A1` make the
  apex triangle equilateral, so `A1` is at the radius of class `A2` but is
  not a member.
- Every ingredient is PROVEN in Lean (transitivity of real equality plus the
  two exactness statements), so the rule is a `PROVEN` cut for Stage 1, not
  a solver verdict. Shape census of the shortest explanation chains: length
  2 in 3000/3000, 2992/2993 and 2872/3000 of the violations, always the
  equilateral triangle (`q` on `p`'s exact circle, `p, r` on `q`'s, `p, q`
  on `r`'s, hence `r` on `p`'s); the rest have length 3. Reuse preflight
  (key: the equilateral closure, consumer: Stage 1 block `CL0`, revision
  `1f7e28811`): the metric core already exists as
  `dist_eq_dist_of_mutual_bisector` (`ATail/TwoCenterBisectorParity.lean`,
  PROVEN: two mutual equidistances give the third), and the membership step
  is `mem_selectedClass` or `CriticalFourShell.support_eq`; no missing
  antecedent, no circularity. It explains most of the Stage 2 emptiness verdicts
  without algebra. The remaining consistent patterns (7 in the sampled
  `i0-1R2R2R-in12`) are where Stage 2 still has work.
- Stage 1b (delegated to the census agent, run root `stage1b-closure-01`):
  the closure oracle inside the piqd session enumeration, blocking the
  explanation chain of each violation rather than the full pattern; a cell
  that goes UNSAT is re-run as one raw-DIMACS job (base CNF plus the learned
  cuts) so the UNSAT carries an LRAT proof; survivors are recorded with
  their full patterns. Outcome not yet known.
- Stage 2 driver (`161bb1335`): polls piqd to completion (the daemon runs
  Singular one at a time and the client's wait gives up on queued runs),
  modular prefilter over `GF(32003)` with `MOD_` verdicts and a `TIMEOUT`
  verdict, core mining with modular deletion steps and a characteristic-0
  confirmation. The characteristic-0 batch on `i0-1R1R1R-in12` refuted 71 of
  72 patterns before one pattern exceeded eight minutes; the modular batch
  over all 3000 is running.
- Lean leaf unchanged: single `sorry`, `M = 18`.

Status 2026-09-01 (Phase 3a, tenth checkpoint: Stage 1b closure census
delivered; the closure rule refutes no cell):

- Stage 1b (`census/card_head/d1_mu0_incidence_census.py --cl0 --closure`,
  run root `stage1b-closure-01`, every solver call through piqd): block
  `CL0_equilateral_closure` (ROOT_STATIC, PROVEN; Lean sources
  `dist_eq_dist_of_mutual_bisector`, `mem_selectedClass`,
  `CriticalFourShell.support_eq`, `support_eq_radius`) adds, for every
  interior label `z`, a membership variable `M(z, y)` tied to the shell of
  every modelled source centred at `z` (sound under R5: same centre, same
  shell; unrealized centres leave `M` free, which only weakens the clause),
  and the six-literal equilateral clause over every ordered triple of
  distinct exact objects (interior shells and apex classes). The oracle
  `closure_violation` (block `CL1_distance_equality_closure`, DERIVED_CUT,
  PROVEN) searches breadth-first over unordered label pairs through the
  equalities each exact object asserts and blocks the shortest explanation
  chain, not the pattern. Validation: 15 tests pass (the audit witness has
  no violation; the witness with class `A2` enlarged by `A0, P0.1` forces
  `A1` into class `A2` by a length-2 chain and the explanation clause is
  falsified by exactly that assignment; the CL0 block agrees with the
  oracle on length-2 chains), ruff clean; the admission records name the
  four Lean sources above.
- Outcome (CONJECTURE at the encoded incidence scope, card = 15): all 32
  cells stay SAT with CL0 in the base formula; every enumeration hit the
  3000 cap; CL1 cuts per cell 2 to 213, survivors 2787 to 2998 (target
  cell `i0-1R1R1R-in12`: 213 cuts with chain lengths 3:136, 4:62, 5:14,
  6:1, and 2787 survivors). No cell goes UNSAT, so no LRAT certificate
  exists and no Lean route follows from Stage 1b. Survivor structure of the
  target cell: 4 to 12 distinct centres, mode 10 (1253 of 2787), then 11
  (753) and 12 (242); the closure rule pushes the survivors towards
  patterns whose shells are pairwise distinct, which no admitted incidence
  rule refutes.
- Consequence: the mu = 0 refutation is not visible at the incidence layer
  with the admitted rules plus distance-equality closure. Per Guardrail 3,
  per-pattern algebra over at least 2787 survivors per cell is runaway
  splitting, so the next probe is bounded: the modular Stage 2 batch on the
  Stage 1 sample of `i0-1R1R1R-in12` was stopped at 610 of 3000 patterns,
  all `MOD_EMPTY_COMPLEX` over `GF(32003)` after all-pairs distinctness
  saturation (one engine, modular, sampled; not banked); a 40-pattern
  modular batch and a 4-pattern core mine on the closure survivors of the
  same cell are running, to find the smallest metrically inconsistent
  sub-pattern, the candidate for the next universal Lean lemma.
- Lean leaf unchanged: single `sorry`, `M = 18`. The Guardrail 7 second
  engine is still pending the piqd maintainer.

Status 2026-09-02 (Phase 3a, eleventh checkpoint: Stage 2 on the closure
survivors; the mined obstructions are global six- to eight-point rigidities):

- Survivor batch (`--char 32003 --saturate-all-distinct --timeout 120`, the
  first 40 closure survivors of `i0-1R1R1R-in12` by key): 33
  `MOD_EMPTY_COMPLEX`, 7 `MOD_TIMEOUT`. 22 of the 33 are empty before
  saturation (`dim_raw = -1`: no complex solution even with coincident
  points); the other 11 carry a 3- to 8-dimensional coincidence component
  that the distinctness saturation removes. One engine, modular, sampled:
  CONJECTURE.
- Core mining (`c4cb00bf5`: raw mode; this checkpoint: member level; steps
  over `GF(32003)` at 120 s, confirmation over the rationals) on seven
  raw-empty survivors: four object-level cores confirmed over the rationals
  (3 to 4 shells plus 2 to 3 apex classes); the other three came back
  unconfirmed because non-empty trials and the confirmation exceeded 120 s.
  Refined member by member, the four cores have 6, 8, 8 and 8 points with
  9, 13, 13 and 13 equations; three are confirmed over the rationals, one
  only modulo 32003. The six-point core (`091c948a10b60a73`):
  `|A1 A0| = |A1 A2| = |A1 P1.2|`; `P1.2` equidistant from `A1, A2`; `P0.4`
  equidistant from `A1, A2, P1.2`; `|P1.2 P2.4| = |P1.2 A1|`; `P2.4`
  equidistant from `A1, P0.4`; `A0` equidistant from `P0.4, P1.2, P2.4`.
  The four cores share no sub-configuration; each is a rigid chain that
  uses at least two apex classes and shells through two apices.
- Reading (CONJECTURE at the encoded scope): the mu = 0 refutation at card
  15 is metric and global. No admitted incidence or order rule and no
  closure rule sees it, and every mined obstruction needs the apex circles
  and three or four shells jointly, so a Lean route by order and counting
  alone (the `UNKNOWN` branch of the Phase 2 decision rule) has no support
  in the evidence. A certificate route exists in the repository:
  `census/p97_search/phase3_qq_certificate_lean_emitter.py` accepts a
  generic metric Nullstellensatz certificate
  (`p97-generic-metric-qq-nullstellensatz-certificate-v1`, gauge
  `A0 = (0, 0)`, `A1 = (1, 0)`, one `1 = sum cofactor * generator` identity
  replayed over the rationals) and emits Lean data; each member core is such
  a system of 9 to 13 quadrics. Its cost is the number of cores: the
  incidence enumeration hits the 3000 cap in every cell, so the CEGAR loop
  (mine a core, certify it, block its incidence sub-pattern, re-enumerate)
  has no known bound, and every core is its own certificate.
- Goal reassessment (three checkpoints since the last one): the exact-15
  kill-test has answered the plan's highest-risk question with sampled,
  one-engine evidence: the leaf's binders at card 15 are refutable, but
  only metrically. Routes, with cost stated as work: (a) certified CEGAR at
  card 15 with Nullstellensatz cuts through the existing emitter (unbounded
  core count, then the card-15 ingress and the Phase 4 lift); (b) the first
  re-split candidate of the decision rule, retaining the provenance dropped
  at the leaf boundary (Section 2: reverse-hit rows, betweenness of the
  reverse blocker, the base-angle acuteness inequalities, source-return U5
  rows), then a census of the re-split cells (cheaper per cell; no evidence
  yet that it removes survivors); (c) Lean order and counting per cell as
  scheduled, which the evidence does not support. The lane continues with
  the cheapest decisive test, Stage 1c: encode the dropped reverse-hit
  provenance as census rules per route and measure the survivors; it needs
  no new Lean and its outcome decides between (a) and (b).
  {{NEEDS_ADAM_INPUT}} only if (a) is preferred despite the unbounded core
  count; work does not wait on it.
- Lean leaf unchanged: single `sorry`, `M = 18`. Guardrail 7 second engine:
  follow-up posted to the piqd maintainer (#8762), unanswered.

Status 2026-09-02 (Phase 3a, twelfth checkpoint: Stage 1c re-split census
on the reverse-hit route; the survivors do not vanish):

- Encoder: `Cell.route` (`rh` reverse hit, `sr` source return, none = the
  leaf census), `--route none|rh|sr|both`. Blocks with admission records:
  `C3` SELECTOR (the exhaustive PROVEN split
  `nonempty_retainedReverseCouplingOutcome`,
  `RetainedMatchingLargeCapConsumer.lean:313`); `RH2` PROVEN
  (`reverseBlocker_mem_capInterior`: c(deleted) in the strict first cap);
  `RH3` IMPLIED (`reverseShell_inter_cap_eq`; follows from C3, RH2, R1,
  R7); `RH4` IMPLIED (`exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit`;
  follows from R6); `RH5` IMPLIED at card 15
  (`exists_fresh_firstCap_commonDeletion_of_reverseHit`); `RH6` PROVEN
  (`actualRow_center_eq_reverseBlocker_of_reverseHit`: every modelled shell
  through kept and deleted has centre c(deleted); the only reverse-hit block
  not implied by the admitted rules); `SR2` PROVEN (twoRadii arm at cap 0
  only: `nonempty_sourceReturnRadiusOutcome`, joint deletion or exact-four
  partition). The omitted route provenance is recorded per route
  (`ROUTE_OMITTED_BINDERS`: the acuteness inequalities
  `reverseHit_twoCenter_sqdist_acute`, the signed-area sidedness inside
  their proof, the packet rows, the U5 ingress rows). Route-free CNFs are
  byte-identical to the Stage 1 and Stage 1b records. Tests: 21 (15 plus a
  positive reverse-hit witness, six negative controls, source-return
  controls, a piqd SAT-and-replay test).
- Run `stage1c-reversehit-01` (16 target cells, route `rh`, CL0 on, CL1
  oracle, cap 3000): every cell SAT and cap hit; CL1 cuts 8 to 122;
  survivors 2878 to 2992 (905 cuts, 47095 survivors in total); no UNSAT,
  no LRAT. Target cell `i0-1R1R1R-in12-rh`: 65 cuts, 2935 survivors; the
  reverse blocker sits at slot `P0.3` in every sampled pattern; distinct
  centres 9 to 12, mode 11. CONJECTURE at the encoded scope.
- Source-return route: for the twelve target cells with cap 0 in the
  oneRadius arm the `sr` CNF is the Stage 1b CNF plus the twelve C3
  clauses, and a split of the Stage 1b samples (no solver) puts most Stage
  1b survivors on that route (target cell: 2787 of 2787 with kept notin
  shell(deleted)), so `sr` keeps survivors without a run. The four `i1-2R*`
  cells carrying the new SR2 block were not run.
- Decision-rule outcome: route (b), the re-split at the incidence level,
  removes no survivors; apart from RH6 the reverse-hit provenance is
  redundant with the admitted rules. Wave mine of the Stage 1c data (one
  bounded reuse preflight): the general form of RH6,
  `perpBisector_carrier_card_le_two`
  (`ATail/ConvexPerpendicularBisectorSides.lean:25`, from
  `Dumitrescu.perpBisector_apex_bound` with `D.convex`), is a
  route-independent PROVEN incidence rule that the census still omits
  (at most two carrier points are equidistant from two distinct carrier
  points; listed in Section 2 under "D.convex beyond R6 and R10"). Next,
  Stage 1d: encode it as a static block over the CL0 membership variables
  and the apex classes, re-run the 32 route-free cells, and read the
  survivors. It is the last admitted incidence rule known to be missing;
  if survivors remain, route (a), certified CEGAR with an unbounded core
  count, is the only route the evidence supports.
- Lean leaf unchanged: single `sorry`, `M = 18`. Guardrail 7: the piqd
  maintainer is triaging #8762.

Status 2026-09-02 (Phase 3a, thirteenth checkpoint: Stage 1d convexity
bisector bound; the incidence layer is exhausted, and the known metric
cores cover about one percent of the survivors):

- Encoder: static block `BI1_bisector_carrier_card_le_two` (`--bisector`;
  ROOT_STATIC, PROVEN; `ConvexPerpendicularBisectorSides.perpBisector_carrier_card_le_two`
  from `Dumitrescu.perpBisector_apex_bound` with `CounterexampleData.convex`):
  no two labels are equidistant from three modelled objects with pairwise
  distinct centres, over the CL0 membership variables and the apex classes
  (30030 six-literal clauses in `i0-1R1R1R-in12`, 42900 in
  `i0-1R2R2R-ax15`); the membership definition is shared with CL0 and the
  CL0 CNF is byte-identical (test pins the Stage 1b sha256). Replay adds
  `bisector_violations`. Tests: 24 (21 plus the CNF pin, the positive
  control, and a three-centre negative control).
- Run `stage1d-bisector-01` (all 32 route-free cells, CL0 + BI1 + CL1
  oracle, cap 3000): every cell SAT and cap hit; base-model replays clean;
  CL1 cuts 15 to 197; survivors 2803 to 2985 (3422 cuts, 92578 survivors
  in total; target cell `i0-1R1R1R-in12`: 52 cuts, 2948 survivors, 2941
  distinct metric patterns). No UNSAT, no LRAT. CONJECTURE at the encoded
  scope.
- Coverage measurement (no solver; `core_cover.py`, backtracking embedding
  of a core's equidistance objects into a survivor's modelled shells and
  apex classes, injective on labels): the four member cores of the eleventh
  checkpoint refute, up to relabelling, 36 of the 2948 Stage 1d target-cell
  survivors (all by the six-point core), 118 of the 2787 Stage 1b survivors
  (55, 23, 21, 19 per core; 99 label-exact), and 251 of the 2935 Stage 1c
  reverse-hit survivors. Each core class covers about one to four percent
  of a capped sample, so the certified CEGAR of route (a) needs at least
  tens of core classes per cell before the enumeration cap is even reached.
- Second engine: the piqd maintainer answered #8762 (#8804): piqd has no
  independent algebra engine, wrapping msolve through the Singular lane
  would not be independent, and a direct msolve backend with hashes,
  custody and timeouts is a separate implementation scope. Feature request
  posted (#8815). Every Stage 2 verdict stays one-engine CONJECTURE.
- Goal reassessment (evidence and tradeoff; no goal change): the four
  incidence censuses (admitted rules, distance-equality closure, reverse-hit
  provenance, convexity bisector bound) leave 2800 to 3000 survivors per
  cell at the cap in all 32 cells, so no admitted incidence, order, or
  closure rule refutes the mu = 0 terminal at card 15; the sampled metric
  refutations are global rigidities of six to eight points with low
  coverage per class. Route (b) is closed by Stage 1c and 1d, route (c) has
  no support, and route (a) is unbounded unless the core classes saturate.
  The next bounded probe answers exactly that: a raw member-core mine of
  twelve Stage 1d target-cell survivors not covered by the known cores
  (keys `0060d928b2c4b704` .. `0186bf5ac1c7611f`, chain launched in
  `stage2-probe-01`, tag `rawmembers12-stage1d-i0-1R1R1R-in12`), followed
  by the coverage measurement over the enlarged core set. If the classes
  saturate, route (a) becomes bounded and continues with the certificate
  emitter; if they do not, the exact-15 computational kill-test ends with a
  quantified negative result and the leaf needs a uniform metric lemma or
  an upstream re-split. {{NEEDS_ADAM_INPUT}} on that choice only when the
  saturation probe has answered; work does not wait on it.
- Lean leaf unchanged: single `sorry`, `M = 18`.

Status 2026-09-02 (Phase 3a, fourteenth checkpoint, interim: the core
classes do not saturate):

- Saturation probe, chain 1 (twelve Stage 1d target-cell survivors not
  covered by the four known cores; raw member-core mine through piqd
  Singular, `summary-rawmembers12-stage1d-i0-1R1R1R-in12.json`): 6
  `MOD_EMPTY_COMPLEX` with member cores confirmed over the rationals
  (`11183807e73ec597` 7 points 16 equations, `287dd005d92303db` 8/19,
  `2bf599a8350a41d5` 8/19, `6da2da721f039a7e` 8/18, `8d26a24bdb0e8dcf`
  6/13, `9f3ee2c0b0f70e93` 7/16), 5 `MOD_TIMEOUT` at 120 s, 1
  `MOD_POSITIVE_DIMENSIONAL` (raw ideal, coincidence component).
- Chain 2 (twelve known raw-empty uncovered Stage 1b survivors) died at the
  15:21Z piqd restart after 7 of 12: three came back as unconfirmed
  full-pattern cores, four member cores were recovered from their
  confirmation scripts (`recovered-member-cores-1b-partial.json`:
  `9a5f1531ba3123c4` 7/11, `f0d283ad9046fb07` 6/9, `6ce1cb0ec2b7f37e`
  7/11, `76f82b2b3411ba8a` 9/15); the five remaining keys run as chain
  2b.
- Isomorphism classes and coverage (no solver; `core_cover2.py`): the 14
  cores form 14 classes (no two embed into each other). Coverage of the
  2948 Stage 1d target-cell survivors up to relabelling: 4 cores 36, 10
  cores 592, 14 cores 596. The four cores mined from Stage 1b survivors add
  four patterns to the Stage 1d sample; three of them cover none. Core
  classes are sample-specific, so route (a) has no visible bound: a
  certified CEGAR would need a core per few tens of survivors, each core
  costing 10 to 30 minutes of one-engine Singular time before any
  certificate or Lean emission. CONJECTURE at the encoded scope, one engine.
- Wave-data mine of the 14 member cores (structural census, no solver,
  `core_census.py`): 6 to 9 points, 8 to 15 equidistance equations, 2 to 4
  shells and 2 to 3 apex classes each; every core uses at least two apexes
  as shell or class members, none contains an equilateral triple (three
  points each equidistant from the other two) and none contains a point
  equidistant from all three apexes. Each core is a minimal member set, so
  no proper sub-gadget is empty, and no two cores embed into each other;
  hence no equidistance-only statement common to the cores is available as
  a uniform lemma. Only `A0` and `A1` are pinned, and every equation is a
  difference of squared distances, so a raw empty ideal says that the
  core's equidistances force `A0 = A1` in every real configuration; a
  uniform metric lemma must therefore carry order or convexity
  inequalities, which the equidistance algebra does not see. No general
  theorem candidate; no corpus search triggered.
- Reading: the exact-15 computational kill-test ends with a quantified
  negative result unless chain 2b changes the curve. The leaf needs a
  uniform metric lemma or an upstream re-split. {{NEEDS_ADAM_INPUT}} on
  that choice; the lane records the final chain 2b numbers and stops the
  probe. Chain 2b final numbers (2026-09-02, log
  `stage2-probe-01/events/rawmembers-1b-uncovered-b-i0-1R1R1R-in12.log`):
  4 of the 5 keys decided, all `MOD_EMPTY_COMPLEX` (raw ideal empty mod
  32003; 45 to 48 equations): `01855bb4623c7663`, `01cbe1c2cc89e065` and
  `01f7394fddd7adf2` are their own deletion-minimal cores (no member
  refinement), `01dfdc3c7f766c71` shrinks to core `83dbdd32ae218a6c` with
  member core `3932fbd27295c6cc`. The fifth key `01fa29493f7d2c99` was
  stopped during its core shrink (37 trial scripts, most at the 120 s
  timeout) because the daemon runs Singular scripts one at a time and the
  timed-out trials blocked the residue run of the fifteenth checkpoint; its
  base verdict receipt is in `stage2-probe-01/artifacts`, its core is not
  mined. The probe is stopped.
- Lean leaf unchanged: single `sorry`, `M = 18`. Guardrail 7: msolve
  backend request #8815 pending with the piqd maintainer.

Status 2026-09-02 (Phase 3a, fifteenth checkpoint: the convexity bisector
side rule refutes every sampled Stage 1d survivor; Stage 1e census launched):

- Wave-data mine, second pass (no solver, `kalmanson_probe.py` in the lane
  scratchpad): each Stage 1d survivor's metric pattern (shells and apex
  classes as distance equalities) was quotiented into equality classes and
  tested against the strict convex-quadrilateral inequalities
  `dist_add_dist_lt_diagonal_sum_of_ccw` and its complementary form
  (`ATail/CapCrossingKalmanson.lean:240`, `:273`) for every quadruple of the
  fifteen labels in the boundary order the label convention fixes (every cap
  counterclockwise from apex `(k+1)%3` to apex `(k+2)%3`; `CYCLIC_ORDER` in
  the encoder). Controls: the six-vertex two-`K2` triangle of
  `false_of_six_ccw_two_k2_three_selected_rows` is rejected by a length-two
  cycle; the regular 15-gon and a reflection-symmetric co-circular 15-gon are
  not rejected.
- Result: all 2941 distinct metric patterns of the target cell and every
  sampled survivor of all 32 Stage 1d cells (2191 to 2967 patterns per cell,
  capped enumeration) are rejected, and every rejection has one shape: two
  carrier points equidistant from both endpoints of a chord and lying on the
  same open arc of that chord (the diagonal sum of the quadruple cancels
  against a side sum). That shape is PROVEN in Lean for a four-point
  counterclockwise enumeration:
  `false_of_four_ccw_endpoint_centers_bisect_middle_pair`,
  `false_of_four_ccw_middle_centers_bisect_endpoint_pair`,
  `false_of_four_ccw_late_centers_bisect_early_pair`
  (`ATail/CapCrossingKalmanson.lean:504`, `:535`, `:569`). Witness scope on
  the target cell (smallest point set containing some witness): 88 patterns
  inside one closed cap, 483 inside one closed cap plus its opposite apex,
  2370 inside two adjacent closed caps, none needing all three caps; 2927 of
  2941 patterns carry at least ten witnesses. Cap-local witnesses alone
  reject 116 of 2941 (88 immediate, 28 cycles), so the two-cap boundary
  order is the load-bearing order fact.
- Encoder: Stage 1e block `BS1_bisector_same_arc_<scope>` (`--bisector-sides
  cap|two|all`, ROOT_STATIC, admission DERIVED with sources
  `BISECTOR_SIDES_LEAN_SOURCES`): two modelled objects with distinct centres
  on one open arc of `{x, y}` cannot both contain `x` and `y`, over the shared
  membership variables of CL0/BI1; scope `cap` 180 clauses, `two` 3540, `all`
  5460 at the target cell. Replay `bisector_side_violations`. Tests (28
  total): boundary order and scopes, BI1 clause prefix unchanged, hand
  witness clean at every scope, the BI1 negative-control witness (`A0` and
  `P2.3` share `{P0.1, P0.3}` on one arc) silent at scope `cap` and rejected
  at scopes `two` and `all` with the expected four-literal clauses.
  Admission is DERIVED, not PROVEN, because no compiled Lean adapter yet
  states the boundary order of a quadruple from the cap data: scope `cap`
  needs the oriented complete cap order restricted to four points, scope
  `two` the concatenation of two adjacent oriented caps at their shared apex,
  scope `all` the global enumeration.
- Lean order infrastructure (read-only trace, all already in the leaf's import
  closure through `ExactFourAdjacentGridKalmanson`,
  `TwoRadiusGridCapBoundarySigns` and `TwoRadiusGridEscapeSynchronization`):
  `exists_isCcwConvexPolygon_of_convexIndep`
  (`ConvexCyclicOrder/Construct.lean:1936`) gives the global
  counterclockwise enumeration; `ZeroCutBoundaryIndexing.exists_with_capBlocks S`
  (`Census554/ZeroCutBoundaryIndexing.lean:206`) gives a `BoundaryIndexing`
  cut at the surplus apex whose three cap interiors occupy three disjoint
  index blocks between the apex indices (`DirectBoundaryBlocks` or
  `MirrorBoundaryBlocks`, `Census554/CapSelectedGeometry.lean:59`, `:75`);
  `isCcwConvexPolygon_subsequence` (`ConvexCyclicOrder/Basic.lean:63`)
  restricts to any strictly increasing index choice. Not proved: the slot
  order of one cap's interior inside its block on a common boundary (only one
  cap's `BoundaryCapBlock` is retained by
  `strictCapBlockData_of_supportCap_on_boundary`), a cross-cap slot
  comparison lemma, and the fourth `bisect` variant (early centres bisect the
  late pair; one `linarith` from `dist_add_dist_lt_diagonal_sum_of_ccw`).
- Block-distinct witnesses (`kal_blocks.py`): restricting to quadruples with
  at most one interior point per cap (348 of the 1365 quadruples), every one
  of the 2941 target-cell patterns still has a witness (2925 have at least
  five). For such a quadruple the boundary order follows from the block
  placement alone, so the only unproved order antecedent is a four-point
  order lemma over `DirectBoundaryBlocks`/`MirrorBoundaryBlocks` (the same-arc
  relation is invariant under the mirror). Encoder scope `blocks`
  (`--bisector-sides blocks`) encodes exactly this family.
- Stage 1e census launched: 32 route-free cells, `--cl0 --bisector
  --bisector-sides two --closure`, run root `stage1e-bisector-sides-01`
  (registered; manifests re-pinned to the new encoder and test digests), and
  the same 32 cells at scope `blocks`, run root `stage1e-bisector-sides-02`.
  The scope-two CNF of the target cell is pinned in the tests
  (`STAGE1E_TARGET_TWO_CNF_SHA256`). Per-cell verdicts: 15 scope-`two` and
  6 scope-`blocks` cells finished before the piqd lock incident of the
  fifteenth checkpoint, all cap-hit with 2861 to 2966 survivors; the other
  loops crashed and were not relaunched, because the static rule closed no
  cell and the KS1 oracle superseded it.
- Stage 1e outcome (static rule, scope `two`, target cell): base SAT, then
  the closure loop hit the 3000 cap with 2949 survivors and 51 CL1 cuts, the
  same profile as Stage 1d. The probe's total rejection was a property of the
  capped Stage 1d sample, not of the survivor space: the 2510 distinct metric
  patterns of the new sample are again all rejected by the probe at scope
  `two` (1859 immediate, 651 length-two cycles), and every one of those
  immediate witnesses uses a derived equality (a chain through two or more
  objects), never two direct memberships (`kal_direct.py`). The static block
  only sees direct memberships; the probe applies the same inequality to the
  transitive closure of the equalities, exactly the closure the CL1 oracle
  computes for its cuts. At scope `blocks` the same sample gives 2440
  immediate, 59 cycles, 11 unrejected.
- Encoder, Stage 1f: KS1 oracle `kalmanson_violation(pattern, scope)`
  (`--kalmanson-oracle cap|two|all|blocks`, run inside the closure loop after
  CL1 finds nothing): distances are quotiented by the closure of the object
  equalities; for every quadruple in boundary order at the scope, an
  immediate contradiction (both diagonal classes cancel against side classes)
  or a comparison cycle yields the cut that negates the memberships along the
  equality chains used (`kalmanson_clause`, record `KS1_kalmanson_cancellation`,
  DERIVED_CUT, admission DERIVED, sources `BISECTOR_SIDES_LEAN_SOURCES` plus
  the closure sources). The cut is checked to be falsified by the model it
  explains, like a CL1 cut, and the certified formula includes it. Tests (31
  total): on the BI1 negative-control pattern the KS1 cut is the immediate
  chain of length two whose literals are the primary-variable image of the
  static BS1 clause; the hand incidence witness `witness_i1` is refuted at
  scope `two` by a length-two comparison cycle through `A1-P0.1-P0.2-A0` and
  `A1-P0.2-A2-P2.1` (chain length three) and is clean at scopes `cap` and
  `blocks`; scope validation. Censuses launched: `stage1f-kalmanson-01`
  (scope `blocks`) and `stage1f-kalmanson-02` (scope `two`), 32 cells each,
  `--cl0 --bisector --bisector-sides <scope> --kalmanson-oracle <scope>
  --closure`; 33 concurrent piqd session clients then produced HTTP 500
  `database is locked` replies that killed 20 of the 33 loops (noted on
  #piqd, #8896), so the static runs stopped at 15 (scope `two`) and 6 (scope
  `blocks`) cells, all cap-hit with 2861 to 2966 survivors, and the KS1
  scope-`blocks` run was stopped deliberately (about one model in five
  survives there). KS1 scope `two`, 24 of 32 cells completed: every cell hit
  the 3000-cut cap with 0 survivors (2493 to 2937 of the 3000 cuts are KS1).
  Long uncapped run on the target cell (`stage1f-kalmanson-03`, cap 200000,
  6 h budget, scope `two`): complete after 22 min with 15543 CL1 cuts
  (15246 KS1) and 387 survivors, which are 111 distinct metric patterns
  (shells plus apex classes); the certified formula base + CL1 + KS1 cuts
  is UNSAT (piqd job 96f9da83, proof 63e443a9). So the closure-level rule at
  scope `two` is not a complete refutation, and the residue is the set of
  patterns whose equality closure is consistent with every strict
  convex-quadrilateral inequality inside two adjacent caps. Probe
  (`kalmanson_probe.py`, no solver) on the 111 residue patterns: 0 rejected
  at scope `all` (1365 quadruples) and, as the consistency check, 0 at scope
  `two` (885). So the residue survives the closure-level rule over the whole
  boundary; the gap is the rule's strength, not its scope: the rule tests
  only two-class comparisons and comparison cycles, not a general positive
  combination of the strict inequalities (a Farkas certificate over the
  distance classes). Wave-data mine of the 15246 KS1 cuts: 9637 are
  two-quadruple comparison cycles at scope (`two`,`two`) that are not
  block-distinct, 2275 are block-distinct two-quadruple cycles, 1774 and 787
  are single immediate chains (787 block-distinct), 567 mix a `cap` and a
  `two` quadruple, 123 use three quadruples, 78 are inside one cap; chain
  lengths 2 (57), 3 (9318), 4 (2932), 5 (2371), 6 (467), 7 or more (101).
  Only 20 percent of the cuts are block-distinct, so the Lean route needs the
  within-cap slot order inside the global boundary order and not only the
  three-cap block placement. Metric layer on the 111 residue patterns
  (`d1_mu0_pattern_algebra.py`, piqd Singular, modular prefilter
  `--char 32003`, artifacts `stage1f-kalmanson-03/artifacts/metric-residue`,
  log `events/metric-residue-mod.log`; serialized behind chain 2b in the
  daemon's Singular lane; chain 2b stopped to free it): after 9 patterns,
  1 `MOD_EMPTY_COMPLEX`, 1 `MOD_FINITE_UNKNOWN_REAL` (`0e31c5c5d735a779`,
  raw ideal of dimension 0, vector-space dimension 1536, so finitely many
  complex configurations and the real question open), 7 `MOD_TIMEOUT` at
  120 s. The pass was then restarted on the 17 undecided representatives
  of the 20 dihedral orbits (3 orbits of size 3, 17 of size 6; keys in
  `tmp/dihedral-reps.txt`) with a 300 s limit, and the zero-dimensional
  pattern runs separately in characteristic 0 with a 1800 s limit, where
  the driver counts real roots (`nrRootsDeterm`; `FINITE_NO_REAL` would
  refute it over the reals without any convexity). The characteristic-0
  run timed out at 1800 s (the rational Gröbner basis of the 26-coordinate
  form does not finish), and the representative pass was stopped after
  deciding nothing while the serial lane was busy.
- Angle form (metric encoder variant for the residue; scratch tool
  `kal_angles.py`, copied to `stage1f-kalmanson-03/artifacts/tools/`,
  artifacts `artifacts/metric-residue-angle`, piqd Singular lane only).
  Because every residue pattern forces the three selected radii equal and
  puts each cap's interior on the circle of that radius about the opposite
  apex, the pattern is written with the special apex X at the origin, the
  next apex Y at (1,0), the third apex Z on the unit circle about X, and
  every interior point as its apex plus a unit vector (cap Z measured from
  the direction Z to X): 26 circle variables with 13 circle relations and
  the 27 pattern equalities as equal squared distances (40 equations, degree
  at most 4, no chart gaps). Differential check against the coordinate form
  on the two decided patterns: `0128294791aad010` empty over the complex
  numbers in both forms, `0e31c5c5d735a779` zero-dimensional with vector
  space dimension 1536 in both forms, in 6 s of Singular time where the
  coordinate form needed 37 s (1.4 s against 1.7 s on the empty one). Verdicts
  of the angle form on the 20 dihedral-orbit representatives (mod 32003,
  300 s limit, `events/angle-reps-mod.log` and `events/angle-proto.log`):
  4 empty over the complex numbers (`0128294791aad010`, `0a55d4c3c9ce4aaf`,
  `3f5944d10bef23b7`, `6df4c7a8d7bf40b6`); 4 of dimension 2
  (`0af6e34c9d121f64`, `353e5cf5d9489e5e`, `3642476c22a03be4`,
  `60cd5309f72bf0e5`); 5 zero-dimensional with vector-space dimension 1536
  (`0e31c5c5d735a779`, `172327e48f4004fb`, `32263a5344416a02`) or 2048
  (`0d6996160cc83aab`, `3826b8a0dec4a6b0`); 7 undecided at 300 s
  (`09de935481f89fcb`, `0ba2f8339583ff96`, `1412a71e2b2792b3`,
  `4196eb64fac564cc`, `5815b1f6a42dcb08`, `5d4f4968fac1e0d5`,
  `60e1264c2096add9`). Saturating `0af6e34c9d121f64` by every pairwise
  squared distance (`--saturate`, `events/angle-sat-0af6.log`, 447 s) turns
  its dimension-2 component into the empty set: that component consists of
  configurations with coincident points only. A follow-up chain
  (`artifacts/tools/angle_chain.sh` for the saturation pass, then
  `angle_chain_v2.sh`; serial Singular lane) runs the saturation on the
  other three positive-dimensional and the five zero-dimensional
  representatives at 900 s (`events/angle-sat-mod.log`; first results:
  `0d6996160cc83aab` keeps 192 of its 2048 solutions after saturation,
  `0e31c5c5d735a779` does not finish the 105 saturations in 900 s), reruns
  the seven undecided representatives at 900 s
  (`events/angle-timeouts-900.log`), and then runs characteristic 0 at
  1800 s by verdict class: the raw ideal for the empty representatives
  (`events/angle-char0-empty.log`), the raw ideal with the real-root count
  for the zero-dimensional ones (`--real`, `events/angle-char0-finite.log`;
  `FINITE_NO_REAL` refutes without any saturation), and the saturated ideal
  for the positive-dimensional ones whose saturation reached a verdict
  (`events/angle-char0-sat-{empty,finite}.log`). Chain results so far: saturation at 900 s decides
  3 of the 8 queued representatives (`0d6996160cc83aab` and
  `3826b8a0dec4a6b0` keep exactly 192 of their 2048 solutions with all
  points distinct; `3642476c22a03be4` becomes empty like `0af6e34c9d121f64`,
  so its dimension-2 component is degenerate only) and times out on the
  other 5 (`0e31c5c5d735a779`, `172327e48f4004fb`, `32263a5344416a02`,
  `353e5cf5d9489e5e`, `60cd5309f72bf0e5`); the 900 s rerun decides only
  `09de935481f89fcb` (dimension 2), and `0ba2f8339583ff96`,
  `1412a71e2b2792b3`, `4196eb64fac564cc`, `5815b1f6a42dcb08`,
  `5d4f4968fac1e0d5`, `60e1264c2096add9` stay undecided. So after the
  mod-32003 passes: 4 orbits empty, 2 orbits empty after saturation, 2
  orbits with 192 nondegenerate solutions, 3 orbits of dimension 2 with no
  saturation verdict, 3 orbits zero-dimensional with no saturation verdict,
  6 orbits with no verdict at all. Characteristic 0 runs on the 11
  representatives with a usable mod-p verdict; a `slimgb` variant is queued
  for the other 9. Characteristic-0 results (1800 s): the
  four raw-empty representatives are empty over the rationals
  (`0128294791aad010` 250 s, `0a55d4c3c9ce4aaf` 3 s, `3f5944d10bef23b7`
  1030 s, `6df4c7a8d7bf40b6` 152 s), so those 4 orbits are refuted at the
  encoded scope on one engine; the saturated runs on `0af6e34c9d121f64` and
  `3642476c22a03be4` and the raw real-root count on `0d6996160cc83aab`
  (vector-space dimension 2048) all time out, and the remaining raw counts
  were stopped. The `slimgb` variant (`--slimgb`) decides all six
  representatives that `std` could not, in 6 s to 40 s each: all
  zero-dimensional, vector-space dimension 2048 (`0ba2f8339583ff96`,
  `4196eb64fac564cc`, `5815b1f6a42dcb08`, `60e1264c2096add9`), 3072
  (`1412a71e2b2792b3`), 1536 (`5d4f4968fac1e0d5`). Mod 32003 the 20 orbits
  therefore read: 4 empty, 5 of dimension 2 (2 of them empty after
  saturation), 11 zero-dimensional.
  A first queue of chains (`angle_chain_v{3,4,5,6,7,8}`) traced the
  saturation pair by pair (`--sat-trace`, `--sat-pairs`, `--sat-pre`) so
  that a rational run could saturate by the effective pairs only. That
  queue was withdrawn on 2026-09-03 and its chains stopped. The trace
  recomputes a Gröbner basis after every one of the 105 pairs, so no trace
  finished: 51 pairs on `0af6e34c9d121f64`, 71 on `3826b8a0dec4a6b0`, and
  42 on `0d6996160cc83aab` with no reduction of the vector-space dimension
  in those 42, each cut at its 900 s limit. Two rational real-root counts
  on unsaturated ideals (`0d6996160cc83aab`, `3826b8a0dec4a6b0`, both of
  vector-space dimension near 2048) also timed out at 1800 s. Plain
  saturation, which performs the whole sequence in one pass, had already
  completed for several representatives inside the same budget.
  The replacement chain `artifacts/tools/angle_chain_v9.py` uses plain
  `--saturate` and orders the work by decisiveness: first the rational
  modular-Gröbner run with full saturation and real-root count on the two
  representatives whose saturated ideal is finite mod p with 192 points
  (`0d6996160cc83aab`, `3826b8a0dec4a6b0`); then the rational confirmation
  of the two mod-p empty saturations (`0af6e34c9d121f64`,
  `3642476c22a03be4`); then the mod-p saturated picture for the remaining
  twelve, `slimgb` where `std` does not decide. Logs:
  `events/angle-v9-char0-real.log`, `events/angle-v9-char0-empty.log`,
  `events/angle-v9-modp.log`.
  Direction of the modular evidence: reduction can only enlarge the initial
  ideal, so a nonempty saturated ideal mod p gives a nonempty variety over
  the rationals, while a mod-p emptiness is evidence only and needs the
  characteristic-0 run.
  Chain v9 was stopped on 2026-09-03 after its first run, which located the
  real obstruction. The rational run on `0d6996160cc83aab` returned no
  verdict at its 3600 s limit, and the captured output shows why: it stops
  after `equations 40`, before the saturation begins. All four rational
  attempts on that representative behave the same way — plain `std`,
  `modStd`, `modStd` with full saturation, and the pair variant each print
  `equations 40` and nothing further. The wall is therefore the FIRST
  Gröbner basis over the rationals, not the saturation: the same raw ideal
  takes 8 s mod 32003, and its full mod-p saturation takes 280 s to 604 s.
  With 2048 points over the rationals the coefficients explode, and the
  saturated ideal has only 192.
  The replacement chain `artifacts/tools/angle_chain_v10.py` therefore
  saturates INSIDE the ideal, so that the rational basis is computed once at
  the smaller dimension. Two new modes in `artifacts/tools/kal_angles.py`
  support this. `--relevant` asks, mod 32003 and for each of the 105 point
  pairs, whether the squared distance can vanish on the variety at all:
  `dim(I + d(a,b)) = -1` means saturating by that pair is a no-op. `--rabin`
  then adds one variable u and one equation `u*d(a,b)-1` per selected pair,
  so the ideal handed to `modStd` is already saturated by them. Using a
  SUBSET of the pairs is sound for refutation: the resulting ideal J
  satisfies I ⊆ J ⊆ I:(∏d)^∞, so V(J) contains the saturated variety, and no
  real point of J gives no non-degenerate real configuration. The subset is
  chosen greedily by the size of the degenerate component each pair carries,
  which is a heuristic only and carries no part of the soundness. Logs:
  `events/angle-v10-relevant.log`, `events/angle-v10-char0-rabin.log`.
  {{NEEDS_UPDATE}}: the relevant-pair sets, and the rational real-root
  verdicts from chain v10. Any real solution still needs the strict
  convexity check of Guardrail 6, and the full-pattern check, before it is a
  candidate configuration.
  {{NEEDS_UPDATE}}: the mod-p saturated picture for the twelve
  representatives chain v9 did not reach. That work is triage evidence, not
  a decision: a mod-p emptiness is evidence only, by the direction recorded
  above.
- Residue structure (solver-free census of the 111 metric patterns): every
  pattern has exactly 4 shells and 3 apex classes (27 equidistance
  equations in the 26 pinned coordinates); the apex-class triple is one of
  three label rotations of a single shape (37 patterns each): one apex has
  both other apexes in its class, the other two apexes each have that apex
  in their class, so all three selected radii equal the two apex distances
  to the special apex, and each apex class also contains one interior point
  of a neighbouring cap. The residue is closed under the label rotation
  (37 orbits of size 3) and under the reflection that swaps A1 with A2 and
  reverses the slot order; so the metric layer needs only orbit
  representatives. No shell is common to all patterns (96 distinct shells,
  the most frequent in 15 patterns).
- Stage 1g (order layer, linear form; run root `stage1g-farkas-01`, tools
  copied to `artifacts/tools/`, receipts in the daemon's SMT sessions):
  the full linear form of the strict convex-quadrilateral rule. One real
  variable per distance class of the pattern (the 105 pairs of the 15
  boundary points modulo the shell and apex-class equalities), every class
  positive, and for every counterclockwise quadruple at scope `all` both
  strict inequalities `d(a,c)+d(b,d) > d(a,b)+d(c,d)` and
  `> d(a,d)+d(b,c)` (2730 constraints), as QF_LRA through `piqc session`
  (z3 and cvc5, the two engines of Guardrail 7, both piqd lanes). UNSAT
  would mean a Farkas certificate over the classes, that is a refutation by
  boundary order alone. Controls (both engines): the six-point two-K2
  triangle UNSAT; the regular 15-gon (7 classes), the reflection-symmetric
  co-circular 15-gon (56 classes) and the empty pattern (105 classes) SAT;
  three Stage 1d survivors, which the closure-level probe rejects, UNSAT.
  Result on the 111 residue patterns: SAT on z3 and SAT on cvc5 for all
  111 (each has exactly 78 distance classes; z3 at most 107 ms). Adding the
  strict triangle inequalities over the classes (455 triples, 1365 more
  constraints) leaves all 111 SAT as well (z3).
  So the order layer, in its complete linear form, does not refute the
  residue: the residue is consistent with an abstract positive metric that
  satisfies every strict Kalmanson and triangle inequality of the boundary
  order. Reading: the Lean route for the residue cannot be a four-point
  order lemma plus `linarith`; it needs planar metric algebra (the
  equidistances are quadratic in coordinates) or a real-geometry
  refutation. Next kill-test (running, `artifacts/nra-probe`): real
  realizability with strict convexity as QF_NRA through the same SMT lane,
  A0 = (0,0) and A1 = (1,0) pinned, all shell and apex-class equalities as
  equal squared distances, and every directed boundary edge strictly left
  of every other point (195 orientation inequalities); z3 finds the empty
  convex control in 14 s; the two-K2 control and the zero-dimensional
  pattern `0e31c5c5d735a779` follow with a 600 s limit. A SAT answer there
  is a candidate real configuration and must be checked against the full
  pattern and the leaf hypotheses (Guardrail 6); UNSAT on both engines
  refutes the pattern in real strictly convex geometry at the encoded
  boundary order. Result: not usable at this size. With a 600 s limit z3
  answers UNKNOWN on the two-K2 control (six points with three equalities,
  which the linear layer refutes in milliseconds), on the zero-dimensional
  pattern and on the pattern `0128294791aad010` that is empty over the
  complex numbers; cvc5 is cut off by the daemon deadline on the
  zero-dimensional pattern. So real algebra with 26 coordinates and 195
  orientation inequalities is beyond both engines here, and the metric
  kill-test stays with Gröbner bases over the equalities.
- Reading (CONJECTURE at the encoded scope): the target cell does not go
  UNSAT under KS1 at scope `two`, and the 111-pattern residue survives the
  closure-level rule at scope `all`; so route (a) is not bounded by the
  closure-level Kalmanson rule alone. The next kill-test object is the
  residue in the metric layer (running). If the metric layer refutes the
  residue, the exact-15 census closes at the metric layer and the Lean route
  needs either metric certificates for the residue or a stronger order rule
  (positive combinations of the strict inequalities) that closes it at the
  order layer; the fourteenth checkpoint's `{{NEEDS_ADAM_INPUT}}` stands
  until that choice is made. Earlier reading, kept for the record: the
  exact-15 kill-test is not exhausted at the incidence layer;
  the rule the survivors violate is the strict convex-quadrilateral
  inequality applied to the equality closure, which needs boundary order and
  not metric algebra. If the Stage 1f cells go UNSAT (certified formula
  base + CL1 + KS1 cuts), route (a) is bounded by one oracle rule and the
  Lean route is a four-point block-order lemma over
  `DirectBoundaryBlocks`/`MirrorBoundaryBlocks` feeding
  `dist_add_dist_lt_diagonal_sum_of_ccw`, with the certified census as the
  exhaustiveness argument at card 15; the saturation-probe verdict of the
  fourteenth checkpoint (route (a) unbounded) would be superseded and its
  `{{NEEDS_ADAM_INPUT}}` withdrawn. If survivors remain at the cap, the
  residual is measured by the probe's remaining families.
- Lean leaf unchanged: single `sorry`, `M = 18`.

### Phase 4 — carrier size at least 16

- Extract from the card-15 closures the smallest infeasible sub-pattern and
  state it as a cardinality-generic core over boundary indices, in the style
  of `false_of_one_k1_three_cyclic_selected_rows`.
- Prove an occurrence theorem from the leaf binders. `R.minimal` is available
  at the leaf, so a deletion descent is a second option; O4 shows the safe
  sources themselves are not removable, so the descent needs a different
  vertex. {{NEEDS_RESEARCH}}.
- If the core does not occur, report the exact missing incidence and stop; do
  not add off-spine lemmas.

## 8. Effort

In sessions: Phase 0 + Phase 1 (L1 to L6), one, done 2026-09-01. Phase 2,
assessed without a run on 2026-09-01 (instrument-blocked; dimension count
recorded). Phase 3, two to four; the first Phase 3a checkpoint (cap-order lift,
no cell closed), the `μ = 0` terminal assessment (no route closes
from proven facts), the Route B checkpoint (adjacent-slot pair), and the
Route C checkpoint (exact six-point apex class), none closing a cell, are
done 2026-09-01. Phase 4, unknown, at least three.
{{UNVALIDATED}} until Phase 3 reports its first cell.

## 9. Gates

- `uv run python scripts/check_worktree_hygiene.py check --lane d1-triapex-plan-20260901 --staged`
  before every commit; stage exact owned paths only.
- Fresh `proof-blueprint spine` after every Lean change; a green `lake-build`
  alone is not evidence.
- Solver results are diagnostic until replayed through the Lean-ingress gate.
- No wrapper networks; no split without a closed child; no new declaration
  named for the pipeline rather than the mathematics.
- Reuse preflight is re-run only when the candidate statement, ingress,
  consumer, imports, or source revision materially changes.

## 10. Documents to synchronize at the first frontier-changing checkpoint

These carry the superseded v23 plan or an unresolved status and must be
updated in the same change as the first Lean checkpoint under this plan that
changes the obligation frontier (a closed child, or a strict decrease of
`M`). The Phase 1 checkpoint of 2026-09-01 changed no frontier and left them
untouched.

- `docs/erdos-97-descent-prose-proof-atomic.md` §16.5.D1;
- `docs/dead-ends.md:1567-1594` (F1 bypass, `UNRESOLVED`);
- `docs/closure-evidence-status-ledger-2026-08-05.md` F1 TriApex row;
- `docs/computational-closure-plan-2026-07-28.md` E1 section;
- `docs/closure-matrix-2026-07-09.md` row K-A-LIVE-E1-SPLIT;
- `docs/proof/CURRENT.md` and `docs/README.md`, whose reachable and off-spine
  counts are anchored at an older revision than the registry and the live
  spine (Section 11);
- `proof-status/obligations.json`, regenerated at the same revision with
  `scripts/gen_obligation_registry.py`.

## 11. Review triage (2026-09-01)

The Pro consult `01M1FNKRDFWNTAFJRYA7N79FPC` was answered out of band as a
repository-wide audit (`/tmp/p97-closure-plan-audit-2026-09-01.md`, audited
public head `e6245182b`, the Phase 1 L5 commit), not as the six-question
review requested. The six plan-specific questions (soundness of the Section 6
cells, tightness of the exact-15 cell, the value of L6, the Phase 2 re-split
rule, house-rule violations, omitted obstructions) remain unanswered.
Adam pointed to the audit file as the response on 2026-09-01; this plan
proceeds with it as the review. The six questions stay open as the
{{NEEDS_PROOF}} items of Sections 6 and 7; question 2 is partly addressed
by the Phase 2 dimension count (HEURISTIC).

| Audit finding | Verification at HEAD | Action |
|---|---|---|
| §4.2: the plan must name the exact remaining bridge and reject structural waves that do not strengthen it | not stated before this triage | applied: Phase 2 "Bridge and stop rule" |
| §1: `docs/proof/CURRENT.md` and `docs/README.md` report 25 reachable and 6 off-spine; the registry reports 27 at `020e43bfc`; Section 1 of this plan reports 28 at base head | confirmed by reading the three files | outside lane ownership; added to Section 10; reported to Adam |
| §2: the plan index omits this plan | wrong at the audited head: `docs/plans/README.md:15` lists it since `f61b3b817` | none |
| §2: the plan index omits the exact-five plan `2026-09-01-rigid221-exactfive-distinct-three-center.md` | confirmed | outside lane; reported to Adam |
| §4.2 credits "structural UNSAT for selected D-R cells" to the TriApex lane | those cells belong to the D-R lane (label note above) | none |
| §7: positive controls, structural UNSAT, and exact local models are not terminals | the Phase 1 status and Section 10 already record no frontier change | none |
| §8 TriApex row: open input "end-to-end source-to-finite terminal", next result "close role map and certificate ingress" | matches Phases 2 and 3 | none |
| §4.2 and §7: a structural SAT/UNSAT wave that does not strengthen the bridge is rejected | the Phase 2 metric stage was assessed as instrument-blocked and not run (Phase 2 status) | applied: no run; Phase 3 next |

### Addendum (2026-09-02): the six-question review arrived

The Pro consult `01M1FNKRDFWNTAFJRYA7N79FPC` response reached the lane
through the project channel (message 8990, relayed by an external agent;
untrusted content, every item verified against the working tree at
`7592fdbd5e9` before action). It reviewed the plan at its 2026-09-01 state,
before the Phase 1 checkpoint that rewrote Section 6.

| Item | Claim | Verification at HEAD | Action |
|---|---|---|---|
| 1 to 3 | the centre-free classifier is unsound in the `twoRadii` arm; nine cells not exhaustive at `j`; classify `E ∩ W.supportAt i` at the pair index | already applied: Section 6 anchors the cells at the pair index `i` from `Q.exists_distinct_same_index`; the cover theorem `strictApexFourWitness_safe_counts_of_pair` and the four companion theorems are kernel-checked (`TriApexEndpointRetainedOmission.lean:2079` to `:2230`); the `j` claim is withdrawn in Section 6 | none |
| 4 | `M = 18` unsound before a checked cover uniform in `i`; first-opposite-cap asymmetry | cover theorem exists and is index-generic; Phase 3a cell theorems take `i : Fin 3`; L6 is first-apex-specific but is a control, not a cell terminal | uniformity condition added to Section 6 |
| 5 | Phase 3a applies L5 to `twoRadii` cells without a four-source ingress | confirmed: `selectedClass_card_eq_four_of_twoRadii_card_eq_fifteen` completes the radius class with one point in each adjacent cap, not a four-point strict slice | Phase 3 row 3a split by arm |
| 6 | exact 15 is the minimum saturated case, not shown tight | confirmed; Phase 4 already covers `card ≥ 16` | wording changed in Phase 2 |
| 7 | run the order and incidence quotient first; record the 111-pattern survival; then route-delta tests | matches Stages 1e to 1g | O12 recorded; route-delta sequence added to the Phase 2 decision rule |
| 8 | Phase 2 encoding contract underspecified; rational-only replay too strict | confirmed | field list and real-algebraic replay added to Phase 2 |
| 9 | L6 does not give a second independent pair | the plan already carries the `{{NEEDS_PROOF}}`; no "independent pair" claim remains | freshness criterion added to the L6 bullet |
| 10 | binder map: `J` does not retain `sourceRadius = radius` | confirmed: `sourceRadius` is a free field of `PairedApexClassJointDeletion` | binder map row corrected |
| 11 | the L6 chain paragraph overstates; check for `R.firstApexFullyDeletionRobust` | the chain is the proved theorem `exists_firstApex_mutualCrossDeletion_pair_through_source` with binders `J` and `G` only; the paragraph predates it | paragraph rewritten with the residual `{{NEEDS_PROOF}}` |
| 12 | do not enlarge `J`; prefer route-specific terminal calls | agreed | recorded in the Phase 2 re-split candidate |
| 13 | rigor-label violations | classification wording already fixed; L4 identity now proved; carrier decomposition at 15 has no cited theorem | `{{NEEDS_PROOF}}` added at the carrier sentence; Phase 1 control sentence relabelled |
| 14 | add the `i = j` split as a route | agreed | recorded in Section 6 |
| 15 | summary of 1 to 8 | covered above | none |

None of the items changes the leaf, the measure, or the running exact-15
kill-test; items 5, 8 and 13 tighten what a Phase 2 verdict may claim.

### Addendum (2026-09-03): artifact-hygiene and orbit-reduction gates

An adversarial audit of the lane's artifacts (channel message 9116) raised
three items that gate what a Phase 3a verdict may claim. All three are
accepted and recorded here.

1. **`probe02sat` is excluded from evidence.** Its `summary-probe02sat.json`
   records `dim_raw` 4 and 5 with `dim_sat` 25 for `00097ad` and `0010f`,
   while the current `pattern-<key>.stdout`/`receipt` files for those keys
   show `dim_sat` −1; the earlier run identifiers and outputs are gone, so
   the summary cannot be replayed. A saturated dimension above the raw
   dimension is rejected by `parse_output` in any case. No verdict may cite
   that probe.
2. **Receipt-to-output hash binding.** Before any angle-form verdict is
   promoted, each cited artifact must carry a receipt whose recorded output
   digest matches the stored stdout bytes, and each run must write to a
   distinct name. The angle-form runs already use one artifact name per
   (representative, flag set) and no queued run overwrites an earlier one,
   but the digest binding is not yet enforced by the tool.
3. **Orbit reduction needs its own falsifier.** The reduction of the 111
   metric patterns to 20 dihedral representatives assumes the group action
   preserves the source predicates, the boundary order, and the angle gauge
   (including renormalization), commutes with saturation, and transports
   certificates. Minimal falsifier, to run before the reduction is cited:
   take one pattern, generate its six label permutations, and compare the
   normalized ideals (dimension and vector-space dimension mod 32003) and
   the pattern metadata. A disagreement refutes the reduction; agreement is
   evidence for it, not a proof.

None of the three changes the leaf or the measure. Items 1 and 3 bound what
the exact-15 metric layer may claim: without item 3 the angle results are
statements about the 20 representatives, not about all 111 patterns.

### 16. Characteristic 0 is unreachable on the raw angle system; the elimpart reduction (2026-09-03)

Chain v9 phase 1 ran representative `0d6996160cc83aab` over the rationals with
`modStd`, full saturation and `nrRootsDeterm`, with a 3600 s budget. It reached
the budget having printed only `equations 40`. The first Gröbner basis over the
rationals never returned, so saturation and the real-root count were never
attempted. Two earlier characteristic-0 attempts at 1800 s (chain v5, on the
unsaturated ideal) failed the same way. Recorded conclusion: on the raw
26-variable angle system, `modStd` over the rationals does not return a first
basis inside an hour, and every characteristic-0 verdict in the queue as written
was unreachable. Chain v9 was stopped for that reason; its second phase-1 run on
`3826b8a0dec4a6b0` had already been queued and cannot be cancelled, so it runs to
its own budget and supplies a second data point for free.

The bottleneck is variable count, not saturation. `kal_angles.py` gained an
`--elimpart` mode: `presolve.lib`'s `elimpart` substitutes every variable the
ideal determines linearly and returns an isomorphism

    k[x_1..x_26]/I  →  k[remaining vars]/EL[1] ,

and the generated script pins the substituted variables `EL[2]` to zero in the
same ring. `V(EL[1] + EL[2])` is then the graph of that isomorphism, so
dimension, vector-space dimension and real points are unchanged while the
Gröbner engine works in the reduced variable set. The reduction is exact and
loses no point; it is not a rational parametrization of the unit circles, which
would have dropped the antipodal point of each circle and broken a kill test.

A second session was found driving the same lane and the same wall from the
other side, with a Rabinowitsch pre-saturation: adjoin u and u*d(a,b)-1 for a
subset of point pairs. That construction needs no validation, because
I ⊆ J ⊆ I:(∏d)^∞ for any subset of pairs, so V(J) contains the saturated
variety and no real point of J refutes a non-degenerate real configuration.
Agreed division of the serial Singular lane: that session keeps the
characteristic-0 route on `0d6996160cc83aab` and `3826b8a0dec4a6b0`; this lane
runs no characteristic-0 job and keeps the mod-32003 work.

Chain v11 is that half. It gates on a differential check before the remaining
saturations: three representatives are re-run mod 32003 with `--elimpart`, and
the observed dimension and vector-space dimension must both match the stored
stdout of the first angle-form wave —

    0128294791aad010   dim -1              empty over the complex numbers
    0d6996160cc83aab   dim  0, vdim 2048   finite
    09de935481f89fcb   dim  2              positive dimensional

Both fields are compared, not the dimension alone: `0d6996160cc83aab` and
`3826b8a0dec4a6b0` both read dimension 0 raw and dimension 0 saturated, so a
transform that silently dropped points would still agree on the dimension.
Any disagreement stops the chain. Agreement is evidence for the reduction on
three representatives, not a proof of it.

Banking rule for the reduced system, agreed with the peer session. A faulty
reduction can fail two ways and the two are not symmetric. If it adds points,
the spurious ones are caught downstream: any real solution is substituted back
into the original angle-form system and must pass the strict-convexity and
full-pattern checks (Guardrail 6). If it drops points, nothing catches it — a
refutation carries no witness, so there is no object to substitute and no check
to fail. Therefore a refutation is banked only from a run on the unreduced
system, or from a reduced run that an unreduced run corroborates; the reduction
may carry a positive count, which the Guardrail 6 checks then police, and may be
used freely for triage. Three representatives agreeing is evidence of exactness,
not a proof, and a refutation would be the one claim resting entirely on that
evidence.

{{NEEDS_UPDATE}}: elimpart differential result, the saturated mod-p verdicts
from chain v11, and the characteristic-0 Rabinowitsch verdicts from the peer
session.
