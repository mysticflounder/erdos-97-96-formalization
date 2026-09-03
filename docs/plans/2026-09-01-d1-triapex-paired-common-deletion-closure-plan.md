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
  Relevance triage, `0d6996160cc83aab`, mod 32003, complete over all 105
  pairs in 53 s of solver time: exactly FOUR distances can vanish on the
  variety, `P0.1:P1.4` (vector-space dimension 512), `P0.1:P2.2` (1024),
  `P0.2:P0.3` (512) and `P1.1:P2.3` (1024), against 2048 for the raw ideal.
  The other 101 distances can never vanish there. This explains why the
  withdrawn pair-by-pair trace made no progress: it recomputed a Gröbner
  basis 105 times to discover 101 no-ops.
  What the triage does and does not license. It is a statement mod 32003,
  and reduction can only enlarge the initial ideal, so "this distance
  cannot vanish mod p" does not give "cannot vanish over the rationals":
  over the rationals more than four pairs may be live. The two directions
  therefore differ.
  Refutation is unconditional. The four-pair Rabinowitsch ideal J satisfies
  I ⊆ J ⊆ I:(∏d)^∞ whatever the true live set is, because the four-pair
  product divides the full one, so V(J) contains the fully saturated
  variety and no real point of J gives no non-degenerate real
  configuration. The greedy choice of pairs carries no part of this.
  A positive result is NOT free of the distinctness check. If the run
  returns a real point, pairwise distinctness of the 15 points rests on the
  mod-p triage alone until it is confirmed either by a characteristic-0
  triage or, more cheaply, by evaluating all 105 squared distances at an
  explicit witness. Note that `nrRootsDeterm` only counts real roots and
  returns none, so obtaining that witness is extra work. The strict
  convexity check of Guardrail 6 and the full-pattern check apply on top:
  pairwise distinctness is not convex position.
  The four degenerate components overlap, since 2048 minus
  512+1024+512+1024 is not the saturated 192, so only the saturated
  vector-space dimension is comparable across representatives.
  Linear-reduction probe (solver-free, exact rational arithmetic): reducing
  every generator modulo the circle relations and substituting to a fixed
  point pins exactly ONE of the 26 variables, `c22 = 1/2`, in two rounds,
  for `0d6996160cc83aab` and `3826b8a0dec4a6b0` alike, leaving 13
  nontrivial generators. A variable-elimination reduction of this encoding
  can therefore remove at most one variable, which is why `elimpart`
  substitutes none as written and would gain almost nothing after
  `interred`. That route is closed; the saturation lever is the live one.
  Relevance triage, `3826b8a0dec4a6b0`, mod 32003: raw dimension 0 and
  vector-space dimension 2048, four live pairs of 105, `P1.3:P2.3`,
  `P0.4:P2.2`, `P1.2:P1.4` and `P0.1:P1.3`. Four live pairs again, as on
  `0d6996160cc83aab`.
  Guardrail 1 smoke test for `--rabin`, which the mode had never had: the
  four-pair Rabinowitsch system for `0d6996160cc83aab` returns dimension 0
  and vector-space dimension 192 mod 32003, the same value `--saturate`
  gives on that key. The Rabinowitsch encoding therefore reproduces the
  saturated ideal rather than approximating it.
  The characteristic-0 wall survives Rabinowitsch pre-saturation. The
  rational run on the four-pair system stopped at `equations 44` and reached
  its 3600 s budget, exactly as the unsaturated attempts did. In hindsight
  it could not have helped: the construction makes the system LARGER, 30
  variables and 44 generators against 26 and 40, even though its solution
  set is smaller. Four rational runs have now died in the first Gröbner
  basis, one by plain `std` and three by `modStd`, so the accurate statement
  is that Singular produces no first basis over the rationals for this
  system by any route tried, modular or direct, saturated or not, against 8
  to 53 s mod 32003.
  Collapse test (peer session, adopted here): a triage line whose
  vector-space dimension EQUALS the raw one refutes the key immediately.
  R/I surjects onto R/(I + <d>), both are finite-dimensional, and equal
  dimensions force the surjection to be an isomorphism, so d lies in I,
  every point of the variety has that pair coincident, and the saturated
  variety is empty. Neither `0d6996160cc83aab` (512, 1024, 512, 1024 against
  2048) nor `3826b8a0dec4a6b0` (the same profile) collapses this way;
  `0e31c5c5d735a779` does, at `P0.1:P0.4` with 1536 against a raw 1536.
  Membership certificate route (this session's proposal, peer implementing).
  The collapse test is a mod-32003 statement, but ideal membership has a
  certificate: d = Σ fᵢgᵢ against the ORIGINAL generators is checkable by
  exact expansion, with no Gröbner basis and no solver. Cofactors are
  computed mod a large prime, reconstructed over the rationals, and the
  identity is then verified exactly; a wrong reconstruction simply fails the
  check, so the mod-p provenance drops out. If it verifies, the key is
  refuted over the complex numbers, and hence over the reals, with no
  dependence on the rational Gröbner basis, on `elimpart`, or on a second
  engine. Guardrail 2 still applies: it proves a statement about the
  encoding. The open risk is that the cofactor coefficients are themselves
  large enough to defeat reconstruction, which is visible immediately.
  Composition gate, PASSED. `interred` followed by `elimpart` followed by
  the four Rabinowitsch pairs, for `0d6996160cc83aab` mod 32003, returns
  dimension 0 and vector-space dimension 192, the value `--saturate` gives
  on that key, in 1543 s of daemon wall time (run `e0999b14`). The three
  reductions therefore compose without changing the ideal's quotient
  dimension at that characteristic, which is the Guardrail 1 condition for
  spending the last rational slot on the composed system. Note the cost:
  the composed mod-p run takes 1543 s against 8 s for the raw basis and
  280 to 604 s for full saturation, so the reductions are not free even
  where they succeed.
  {{NEEDS_UPDATE}}: the rational real-root count that gate authorized, on
  the composed system with `modStd` and a 3600 s budget. A zero real count
  there would carry three qualifications, and none of them is discharged by
  the gate above: `elimpart` exactness over the rationals, the missing
  Guardrail 7 second engine, and the mod-32003 provenance of the four live
  pairs. The gate licenses the attempt, not the verdict.
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

### 17. The reduction route is dead; relevance-first saturation replaces it (2026-09-03)

The differential ran and agreed on dimension and vector-space dimension for
`0128294791aad010` (dim -1) and `0d6996160cc83aab` (dim 0, vdim 2048), but the
agreement carries no information: `elimpart` substituted zero variables, so the
reduced ideal is the original ideal and the differential compared a system
against itself. Cause: `elimpart` reads the generators as written, and the
angle-form generators acquire a linear part only after being reduced against one
another. The apex-class equality between the special apex and a foreign-cap
interior point does collapse to 2c - 1 once the circle relations are used, but
there is one such equality per pattern, not one per apex.

CORRECTION (same day). An earlier revision of this block recorded a peer
session's solver-free measurement that the whole route can pin only one variable
of 26 (c22 = 1/2), and concluded on that basis that no variable-elimination
reduction is worth pursuing. That conclusion was wrong, and recording it without
checking it against a measurement already queued was an error. The peer's
procedure reduced generators modulo the circle relations only. Singular's
`interred` interreduces against the whole generating set and reaches further:

    angle-0d6996160cc83aab-ired-elim   elimpart 5   dim 0, vdim 2048   20.958 s

Five variables of 26 are substituted, not one, and dimension and vector-space
dimension are both unchanged. That also makes the differential informative for
the first time: with five genuine substitutions the invariants still agree, which
is evidence the transform is exact, rather than a comparison of a system against
itself. Whether 26 down to 21 moves the characteristic-0 wall is untested.

What replaced it is cheaper and unrelated to reduction. For each point pair, ask
whether that squared distance can vanish on the variety at all, by testing
dim(I + d(a,b)). On `0d6996160cc83aab` exactly four of the 105 pairs can:

    P0.1:P1.4   dim 0, vdim  512
    P0.1:P2.2   dim 0, vdim 1024
    P0.2:P0.3   dim 0, vdim  512
    P1.1:P2.3   dim 0, vdim 1024

against dim 0, vdim 2048 for the raw ideal, at 53 s of daemon wall for the whole
triage. Saturating by the other 101 is a no-op. This is why the pair-by-pair
trace never finished: it recomputed a basis 105 times to discover 101 no-ops.
The four component sizes must not be summed — 512 + 1024 + 512 + 1024 does not
reach 2048 - 192, so the degenerate components overlap and only the saturated
vector-space dimension is comparable.

The characteristic-0 wall is independent of what is saturated away. The peer's
four-pair Rabinowitsch run on `0d6996160cc83aab` printed only `equations 44` and
reached its 3600 s budget, exactly as the plain and fully saturated runs did.
Rabinowitsch enlarges the system — 27 variables and 44 equations against 26 and
40 — so it cannot help with a first basis that is already out of reach. Four
characteristic-0 routes have now died in the first basis on `0d6996160cc83aab`,
each printing its first line and nothing else before reaching its budget:

    -char0                 std      "equations 40"   wall 1800.087 s / 1800 s
    -pairs-modstd-char0    modStd   "equations 40"   wall 1800.016 s / 1800 s
    -sat-modstd-char0      modStd   "equations 40"   wall 3600.038 s / 3600 s
    -modstd-rab-char0      modStd   "equations 44"   wall 3600.038 s / 3600 s

One of them is plain Buchberger, so the accurate statement is not that the
modular algorithm fails but that Singular produces no first basis over the
rationals for this system by any route tried, modular or direct, saturated or
not, on a system that finishes mod 32003 in 8 to 53 seconds. The untried
combination is
interreduction and elimination together with the four live pairs, which would
run at 22 variables; beyond that, this encoding needs an engine built for real
solutions of zero-dimensional systems over the rationals, which is the standing
piqd msolve request.

Chain v12 applies the triage to the eleven unresolved representatives: triage first,
then saturate by the live pairs only; a key with no live pair needs no
saturation run, its raw ideal already being saturated.

Two scope limits on what the triage licenses. The refutation direction is
unconditional: the live-pair product divides the full one, so I <= J <=
I:(prod d)^oo holds whatever the true live set is over the rationals, and V(J)
contains the fully saturated variety. The distinctness direction is not: over
the rationals more pairs may be live than mod 32003, so "all fifteen points
pairwise distinct" is supported mod p only. If a characteristic-0 run ever
returns a positive real count, distinctness is established by evaluating all 105
squared distances at an explicit real point, not by a characteristic-0 triage —
but `nrRootsDeterm` counts real roots without returning any, so obtaining that
witness is its own step and distinctness is not free.

### 18. The triage refutes a representative outright (2026-09-03)

The relevance triage does more than order the saturation. For
`0e31c5c5d735a779` it reports seven live pairs of 105, and one of them carries
the raw vector-space dimension:

    P0.1:P0.4   dim 0, vdim 1536     <- equal to the raw vdim
    P0.2:P1.4   dim 0, vdim  768
    P0.3:P2.1   dim 0, vdim  768
    P0.3:P2.4   dim 0, vdim  768
    P1.1:P1.4   dim 0, vdim  384
    P2.1:P2.3   dim 0, vdim  384
    P2.1:P2.4   dim 0, vdim  384

I is contained in I + <d(P0.1,P0.4)>, so R/(I + <d>) is a quotient of R/I; both
are finite-dimensional of dimension 1536, and a surjection between
finite-dimensional spaces of equal dimension is an isomorphism, so the two
ideals are equal and d lies in I. Then V(I) is contained in V(d): every solution
has P0.1 = P0.4, and the saturated variety — where the fifteen points are
distinct — is empty. This was posted as a falsifiable prediction that the
pending saturation run must return dim -1, and that run then returned
`dim_raw 0, dim_sat -1, dim -1`. `0e31c5c5d735a779` is refuted at the encoded
scope, from a 35 s triage rather than a 280-604 s saturation.

The equal-vdim collapse is now a standing test on every triage: a live pair
whose vector-space dimension equals the raw one refutes the representative
immediately, and names the coinciding pair. It is discriminating rather than
universal — `0d6996160cc83aab` (512, 1024, 512, 1024 against 2048) and
`3826b8a0dec4a6b0` (512, 1024, 512, 1024 against 2048) both fail the test, and
of the three keys triaged so far only `0e31c5c5d735a779` collapses.

Scope: mod 32003. Over the rationals the vector-space dimension can only be
larger, so equality mod p does not give equality over the rationals, and this
stands at the same strength as the other mod-p emptiness results.

That last limit may be removable, and unlike everything else today the route
does not need a rational Groebner basis. Ideal membership has a certificate: if
d lies in I over the rationals then d = sum f_q g_q for the encoder's own
generators g_q, and that identity is checkable by pure expansion in exact
rational arithmetic. Singular's `lift` supplies candidate cofactors modulo a
large prime, where the computation is fast; rational reconstruction lifts each
coefficient; and the identity is then verified exactly. The modular provenance
drops out, because a wrong reconstruction simply fails the check — the same
asymmetry as Guardrail 6, applied to a refutation that happens to have a
witness. `kal_angles.py` gained `--lift a:b` for the certificate and
`scratch/.../verify_lift.py` performs the rational check, re-deriving the
generators from the encoder rather than trusting Singular's echo. The honest
risk is coefficient growth, which is the same wall in another guise; the failure
is immediate and visible.

### Numbering note: sections 19 to 22 appear twice (2026-09-03)

Two sessions appended to this document at the same time and both continued the
numbering from 18, so the headings 19, 20, 21 and 22 each occur twice. The
first block of four (this heading onwards, from `71b6eb05b`) records the
fail-open parser, the certificate degree bounds, the reduced characteristic-0
composition and the interreduction differential. The second block (from
`48a4e0117`) starts the orbit sequence: five orbits, verifier audit and
labeling cost, the named prediction, the completed falsifier, and then 23
onwards with no further collision.

Every numeric cross-reference in this document points at the SECOND block:
"section 19" means the orbit partition, "section 20" the labeling cost,
"section 21" the named prediction, "section 22" the falsifier. Nothing cites
the first block by number. The headings are left as written rather than
renumbered, because both sessions' notes and commit messages already use the
numbers they used.

### 19. A fail-open triage parser manufactured a survivor (2026-09-03)

A chain on the other half of this lane recorded, for `1412a71e2b2792b3`,
`raw vdim None, 0 live pairs []` and then concluded that the raw ideal is
already saturated and its solutions all have the fifteen points distinct. None
of that happened: the stdout artifact is 0 bytes and the daemon job was still
queued with `started_at` null, so the triage had not run at all. The client gave
up waiting, wrote an empty stdout, the parser found no `relevant` lines, and
"no lines matched" was read as "zero pairs are live".

The failure direction is what makes this serious. An empty triage reads as a
fully saturated ideal, which reads as a representative whose solutions have all
fifteen points distinct — a survivor. A missing run must never be able to
manufacture one.

The same hole was present in this lane's chain v12. Its `live_pairs` returned
None only when the file was absent, but `kal_angles.py` writes the stdout file
even when the daemon job never ran, so an existing empty file parsed to an empty
list and took the "already saturated" branch. It had not yet bitten only because
the one key triaged so far returned real output. Fixed: a triage is trusted only
when its stdout carries both a `dim_raw` and a `dim` line, and their absence is
recorded as NO OUTPUT with no conclusion drawn. The guard is tested against the
empty 1412 artifact (None), the real 0e31 artifact (7 live pairs), and an absent
key (None).

General rule for this lane, and the reason it belongs in the plan rather than in
a commit message: a parser that turns missing evidence into an empty result set
must fail closed wherever an empty result set is the permissive branch. Checking
the daemon state is a cheap second belt — a run whose `started_at` is null cannot
have produced output, whatever the file says.

### 20. Certificate degree bounds (2026-09-03)

Exact linear algebra over the rationals, with no solver, settles the low degrees
for the `0e31c5c5d735a779` membership certificate. Writing each cofactor with
unknown rational coefficients turns d = sum f_q g_q into one linear system:

    degree 0    40 unknowns, 103 equations     inconsistent
    degree 1  1080 unknowns, 2513 equations    inconsistent

Both are proofs of non-existence at that degree, not failed searches. Singular's
`lift` over p = 2147483647 also reached its 900 s budget without returning, so
the certificate needs degree-2 cofactors or a larger budget. Degree 2 is 15120
unknowns, beyond the dense exact elimination used here. Next step is a `lift`
mod 32003, where the basis is cheap, purely to learn the true cofactor degree
and coefficient size; that decides between a targeted linear-algebra search and
a longer large-prime lift.

One simplification, derived by hand and used to validate the checker's
arithmetic on the encoder's real generators:

    d(P0.1,P0.4) = (c01^2+s01^2-1) + (c04^2+s04^2-1) + 2 - 2*(c01*c04 + s01*s04)

The first two brackets are two of the encoder's own circle generators, so the
membership question reduces to 1 - (c01*c04 + s01*s04), three terms rather than
six; geometrically, the two unit vectors have inner product 1.

### 21. The reduced composition also fails; five characteristic-0 routes dead (2026-09-03)

The composition that the mod-p gate authorized — interreduction, elimination and
the four-pair Rabinowitsch generator together, at 22 variables instead of 26 —
ran over the rationals with `modStd` and a real-root count on a 3600 s budget.
It printed `equations 44` and `elimpart 5`, confirming the reduction fired, and
then reached the budget with no first basis. The gate had passed cleanly at
dim 0, vdim 192 mod 32003, so the composition is correct; it is the
characteristic-0 basis that is out of reach, and eliminating five variables does
not change that.

Five routes are now dead in the first Gröbner basis over the rationals for this
encoding: plain `std`, `modStd`, `modStd` with full saturation, `modStd` with a
four-pair Rabinowitsch generator, and that last one on the reduced system. The
same ideal finishes mod 32003 in 8 to 53 seconds. Recorded conclusion: this
encoding is not characteristic-0 tractable in Singular by any route available to
this lane, and no further characteristic-0 slot should be spent on it.

What follows from that for the metric layer. Every emptiness verdict it can
currently produce — the four originally empty representatives, the two empty
saturations, and `0e31c5c5d735a779` — is a mod-32003 statement. Reduction can
only enlarge the initial ideal, so vdim over the rationals is at least vdim mod
p, and emptiness mod p is evidence rather than proof. Two routes out remain, and
they are independent of each other:

1. The membership certificate of block 20, which needs no rational Gröbner basis
   because the identity is checkable by expansion. Blocked on learning the true
   cofactor degree, which one cheap mod-32003 `lift` would settle.
2. An engine built for real solutions of zero-dimensional systems over the
   rationals. Requested from the piqd maintainer as #9229 and #9231 against
   msolve request #8815, with the timing table above. This would also supply the
   Guardrail 7 second engine, which this lane does not currently have for any
   algebra verdict.

A third possibility, not attempted and recorded here only so it is not
rediscovered as new: re-encoding. The 26 variables come from giving every
interior point its own (c, s) pair on a unit circle. All the constraints are
equal squared distances, hence statements about inner products, so a
distance-geometry or Gram-matrix formulation may be markedly smaller. That is a
materially different route rather than a tuning change, and it should not be
started without weighing it against simply waiting for msolve.

### 22. Interreduction is not uniformly beneficial (2026-09-03)

The interred+elimpart differential returned enough to settle the reduction's
value, and the answer is worse than "harmless but useless". Daemon wall, mod
32003:

    0128294791aad010   elimpart 4   dim -1                    1.3 s
    0d6996160cc83aab   elimpart 5   dim 0, vdim 2048         21.0 s
    32263a5344416a02   elimpart 5   no dim line             900.1 s, budget reached

`32263a5344416a02` completes without the reduction and times out with it. So
interreduction can turn a terminating computation into a non-terminating one:
five fewer variables is bought with a denser generating set, and on this key the
density costs more than the variables save. The reduction is therefore not a
free preprocessing step and must not be applied by default.

What the differential established, stated exactly: one key where both invariants
are defined and agree across a transform that genuinely changed the system
(`0d6996160cc83aab`, five substitutions, dimension and vector-space dimension
preserved); one key where the transform lands on the unit ideal, which any
destructive transform would also do, so it is not a test; and three keys with no
output. That is one informative confirmation, not four. The plan for four
informative keys was not achieved, and the evidence for exactness remains a
single data point.

This does not retroactively weaken the characteristic-0 conclusion of block 21,
since four of the five dead routes never used the reduction at all.

{{NEEDS_UPDATE}}: the remaining mod-p verdicts from chain v12, and the
certificate verification for `0e31c5c5d735a779`.

### 19. The 111 patterns form five orbits, not twenty (2026-09-03)

Every solver verdict in this layer is computed on representatives and claimed
for all 111 residue metric patterns, so the reduction is the load-bearing
assumption underneath the whole exact-15 metric argument. The producer of
`tmp/dihedral-reps.txt` is not among the retained tools, so it was re-derived
from the pattern algebra rather than trusted
(`artifacts/tools/orbit_falsifier.py`, `orbit_reflection.py`, `orbit_full.py`;
no solver involved).

A first pass acted with the six bare apex relabelings, `A_k -> A_sigma(k)` and
`P{k}.s -> P{sigma(k)}.s` with the within-cap index held fixed. Under that
action the pattern set is NOT closed: all 333 odd relabelings — every
transposition, on every one of the 111 patterns — leave the set, and only the
three rotations preserve it. The defect was in the action, not the data. The
labels `P{k}.1..4` inside one cap are arbitrary names, so the honest group is
the six apex permutations composed with an independent relabeling of the four
points inside each cap, of order `6 * 24^3`. Searching those relabelings shows
each transposed image does land back in the set, 4 to 8 within-cap maps at a
time.

Under the honest group the 111 patterns form **five** orbits, of sizes 3, 24,
24, 24 and 36. The twenty declared representatives all lie inside them and no
orbit is left uncovered, so the twenty-representative pass was conservative
rather than wrong: it ran twenty representatives where five suffice.

The partition is confirmed, not assumed. Nineteen independent solver runs are
spread across the five orbits, and no orbit contains two different verdicts:

| orbit | representatives run | verdict |
|---|---|---|
| 36 | `0ba2f8339583ff96`, `0d6996160cc83aab`, `3826b8a0dec4a6b0`, `4196eb64fac564cc`, `5815b1f6a42dcb08`, `60e1264c2096add9` | dim 0, vdim 2048; saturates to 192 with all points distinct |
| 24 | `0128294791aad010`, `0a55d4c3c9ce4aaf`, `3f5944d10bef23b7`, `6df4c7a8d7bf40b6` | empty over the complex numbers, and over the rationals |
| 24 | `09de935481f89fcb`, `0af6e34c9d121f64`, `353e5cf5d9489e5e`, `3642476c22a03be4`, `60cd5309f72bf0e5` | dimension 2, empty after saturation |
| 24 | `0e31c5c5d735a779`, `172327e48f4004fb`, `32263a5344416a02`, `5d4f4968fac1e0d5` | dim 0, vdim 1536; collapses at `P0.1:P0.4` |
| 3 | `1412a71e2b2792b3` | dim 0, vdim 3072; never saturated or triaged |

Six runs agree on the first row and four on the second; a partition that merged
two genuinely different classes would have to survive that by coincidence.

Soundness direction. Two patterns in one orbit differ by a permutation of the
point labels, so their encoded ideals differ by a ring automorphism: dimension,
vector-space dimension, emptiness and the real-root count are the same for
both. Refuting one refutes the orbit. The risk in a partition of this kind is
merging patterns no symmetry relates, and the explicit relabeling that realizes
each merge is what rules that out here; it is exhibited, not inferred from the
verdicts agreeing.

What this changes in the queue. The layer has one orbit that is open after
testing and one that was never tested:

- the 36-orbit is the open one — 192 nondegenerate solutions mod 32003, and the
  characteristic-0 wall recorded in section 15 is entirely about it;
- the 3-orbit (`1412a71e2b2792b3`) has never been triaged or saturated, and is
  the only untested part of the layer;
- the other three orbits, 72 of the 111 patterns, are decided. The 24-orbit of
  empty patterns is refuted over the rationals. The other two are refuted mod
  32003 only, and the collapse orbit is the one the membership certificate can
  upgrade to an exact refutation.

So every remaining key in the twenty-representative list except
`1412a71e2b2792b3` sits in an orbit whose verdict is already known, and running
it again reconfirms a ring isomorphism. Chains v12 and v15 were stopped for
that reason and replaced by v16, which triages `1412a71e2b2792b3` alone. The
in-flight `172327e48f4004fb` triage was deliberately left running as a
falsifier: it shares an orbit with `0e31c5c5d735a779` and must collapse at a
live pair of vector-space dimension 1536.

{{NEEDS_UPDATE}}: the `1412a71e2b2792b3` triage, the `172327e48f4004fb`
falsifier, the certificate verification for `0e31c5c5d735a779`, and the
characteristic-0 real-root count for the 36-orbit.

### 20. Certificate verifier audit, and labeling cost inside one orbit (2026-09-03)

**Verifier audit.** `artifacts/tools/verify_lift.py` (peer session) is the only
route in this lane to a refutation rather than mod-p evidence, so it was read
adversarially: the question is whether a FALSE certificate can pass, not
whether a true one does.

It cannot, and the reason is structural. The verifier never trusts the
certificate's own text for anything load-bearing. Both the generators and the
target squared distance are re-derived from the encoder (`kal_angles.coords`
and `d2`) and expanded exactly over the rationals; each printed generator must
equal one of those re-derived generators before it is used; and the final
identity `d = sum I[q]*C[q]` is checked by exact rational expansion. So a
passing check exhibits `d` as a rational combination of the encoder's own
generators, which is a proof of membership independent of Singular, of the
prime, and of the reconstruction. Every failure mode found — a wrong rational
reconstruction, a mismatched prime, a generator that is not the encoder's, a
polynomial that will not parse — makes the check fail rather than pass. It is
fail-closed in the direction that matters.

Two remarks, neither a soundness defect:

- The generator check does not require the printed generators to be a
  *bijection* onto the encoder's. A certificate repeating one generator and
  omitting another would pass the count and the membership test. This is
  harmless: a rational combination of genuine generators still lies in the
  ideal, whichever ones appear.
- The success message says the two points are "equal" at every solution. Over
  the reals that is right, and the reals are the scope the refutation is about.
  Over the complex numbers it is not: `(x1-x2)^2 + (y1-y2)^2 = 0` has nonzero
  isotropic solutions, so `d` vanishing does not make the points coincide
  there. The conclusion the certificate supports without qualification is that
  the squared distance vanishes identically on the variety, hence no REAL
  configuration has all fifteen points distinct.

A false-reject to watch for rather than a defect: the verifier compares against
the encoder's generators after dropping zero entries, matching `simplify(I,2)`.
If that Singular call normalizes leading coefficients rather than only deleting
zero generators, legitimate certificates would fail the generator comparison by
a scalar. If a certificate that should verify reports "certificate generator q
is not one of the encoder's generators", that is the first thing to check.

**Labeling cost inside one orbit.** Section 19 established that patterns in one
orbit have isomorphic ideals. Their *encoded* ideals differ by a permutation of
the variables, and Gröbner cost is not invariant under that. The recorded
receipts for the open 36-orbit show the spread is not small:

| key | raw `std` mod 32003 |
|---|---|
| `3826b8a0dec4a6b0` | 3.7 s |
| `0d6996160cc83aab` | 8.2 s |
| `0ba2f8339583ff96`, `4196eb64fac564cc`, `5815b1f6a42dcb08`, `60e1264c2096add9` | all hit the 900 s cap |

A factor of at least 245 between labelings of one and the same variety. This
also explains retroactively why `slimgb` "decides all six representatives that
`std` could not" in 6 to 40 s: several of those six are relabelings of ideals
`std` had already solved quickly under a different name, so the comparison was
never between algorithms alone.

The consequence for the characteristic-0 wall is a genuine and previously
unavailable lever, and also a caution. Every rational attempt so far has used
`0d6996160cc83aab`, with one on `3826b8a0dec4a6b0`; the orbit has 36 members
and 30 are unmeasured even mod p. A cheaper labeling is a different rational
computation, not the same one retried. The caution is that the mod-p spread is
dominated by monomial-order effects while the rational wall is coefficient
growth in the lift, and the two need not track: `3826b8a0dec4a6b0` is 2.2 times
cheaper than `0d6996160cc83aab` mod p and its characteristic-0 run died at the
same first basis. So this is worth one bounded ranking sweep mod p, not another
open-ended rational campaign, and it does not reopen the rule that the layer
gets no further 3600 s rational slots without a specific reason.

{{NEEDS_UPDATE}}: whether a mod-p ranking sweep over the unmeasured labelings
of the 36-orbit finds one materially cheaper than 3.7 s, and if so whether its
rational behaviour differs at all.

### 21. The orbit claim as a named prediction, before the triage runs (2026-09-03)

Section 19's partition should not be leaned on because nineteen verdicts happen
to agree by orbit; agreement of coarse labels is weak evidence. The relabeling
that realizes each merge is explicit, so it predicts far more than a label. It
carries `0e31c5c5d735a779`'s collapsing pair to a NAMED pair of each orbit
sibling, and carries its whole live set, with vector-space dimensions, onto
theirs. Recorded here before the triages run
(`artifacts/tools/orbit_predict.py`, solver-free):

| key | raw vdim | predicted live pairs (vdim) |
|---|---|---|
| `172327e48f4004fb` | 1536 | **P0.1:P0.4 = 1536 (collapse)**, P0.2:P1.2 = 768, P0.2:P1.4 = 768, P0.3:P2.1 = 768, P1.2:P1.4 = 384, P1.3:P1.4 = 384, P2.1:P2.4 = 384 |
| `32263a5344416a02` | 1536 | **P1.1:P1.4 = 1536 (collapse)**, P0.1:P1.3 = 768, P0.4:P1.3 = 768, P1.2:P2.4 = 768, P0.1:P0.2 = 384, P0.1:P0.4 = 384, P2.1:P2.4 = 384 |
| `5d4f4968fac1e0d5` | 1536 | **P1.1:P1.4 = 1536 (collapse)**, P0.1:P1.3 = 768, P1.2:P2.1 = 768, P1.2:P2.3 = 768, P0.1:P0.4 = 384, P2.1:P2.3 = 384, P2.2:P2.3 = 384 |

The collapsing pair is unique for each target: over every group element that
maps `0e31c5c5d735a779` to that key, the image of `P0.1:P0.4` is the same one
pair. So the prediction names 1 of 105 pairs and the full seven-element live
set with its dimension profile, in advance. A triage that collapses at a
different pair, or produces a different live set, refutes section 19 exactly as
firmly as one that does not collapse at all. This is the falsifier the
partition deserves, and it costs no solver time to state.

Note also that the existing `-trace` artifacts for `172327e48f4004fb` and
`1412a71e2b2792b3` do NOT bear on this. `sattrace` reports the quotient after
saturating by a pair, so an unchanged vector-space dimension there means that
saturation was a no-op; the collapse test is about `dim(I + d)`, a different
computation. Those files were checked and set aside for that reason.

{{NEEDS_UPDATE}}: the `172327e48f4004fb` triage against this table.

### 22. Section 19 passes a completed falsifier, unfitted (2026-09-03)

The prediction in section 21 is still pending a solver run, but an equivalent
test was already complete and had been overlooked. `0d6996160cc83aab` and
`3826b8a0dec4a6b0` both lie in the open 36-orbit and BOTH already have a
measured relevance triage, run days before the orbit partition existed. So the
partition can be tested against them with no solver and no possibility of
fitting (`artifacts/tools/orbit_retrodict.py`).

Exactly one group element carries `0d6996160cc83aab` to `3826b8a0dec4a6b0`.
Pushing the first key's four live pairs forward along it gives:

| pushed forward | measured on `3826b8a0dec4a6b0` |
|---|---|
| P0.4:P2.2 vdim 1024 | P0.4:P2.2 vdim 1024 |
| P1.3:P2.3 vdim 1024 | P1.3:P2.3 vdim 1024 |
| P0.1:P1.3 vdim 512 | P0.1:P1.3 vdim 512 |
| P1.2:P1.4 vdim 512 | P1.2:P1.4 vdim 512 |

Exact agreement, including which pairs carry 1024 and which carry 512. The live
set is 4 pairs of 105 and the map is unique, so there was one way for this to
come out right and a very large number of ways for it to come out wrong.

This is stronger evidence than the verdict-class agreement in section 19,
because a coarse label like "vdim 2048" could match by accident across genuinely
different patterns, whereas a named 4-element subset of 105 with its dimension
profile could not. Section 19's partition now rests on an exhibited relabeling
(which is what makes it sound), plus a quantitative prediction it satisfies on
data collected before the prediction existed.

The section 21 predictions remain open and are still worth running, since they
test a DIFFERENT orbit (the 1536 one) and would extend the check from the open
orbit to a refuted one.

### 23. The certificate target reduces, and the reduction is exact in every case (2026-09-03)

The peer session reported that `0e31c5c5d735a779`'s saturation returned
`dim_sat -1`, confirming the collapse test's prediction: that orbit is refuted
at the encoded scope mod 32003. It also observed that the certificate target
simplifies, since

    d(P0.1,P0.4) = (c01^2+s01^2-1) + (c04^2+s04^2-1) + 2 - 2*(c01*c04+s01*s04)

and the first two brackets are encoder circle generators, so membership of `d`
reduces to membership of a three-term polynomial with the two circle generators
added back at cofactor 1. Verified here by exact expansion over the encoder's
own coordinates: residual exactly zero
(`artifacts/tools/check_reduction.py`).

The reduction is not case-free in principle, and the missing case analysis is
worth recording because it decides whether the identity is exact. The encoder
writes cap X points as `(c,s)`, cap Y points as `(1+c,s)`, and cap Z points as
a rotation of `(1+c,s)` by `(cf,sf)`. In the Y case the translation cancels in
a difference, so the identity is still exact; in the Z case it would hold only
modulo the `cf` circle relation as well, and the certificate would need that
generator too. All four collapsing pairs predicted in section 21 lie in the X
cap:

| key | collapsing pair | cap role |
|---|---|---|
| `0e31c5c5d735a779` | P0.1:P0.4 | cap 0 = X |
| `172327e48f4004fb` | P0.1:P0.4 | cap 0 = X |
| `32263a5344416a02` | P1.1:P1.4 | cap 1 = X |
| `5d4f4968fac1e0d5` | P1.1:P1.4 | cap 1 = X |

so the reduction is exact for the whole orbit.

Geometrically `1 - (c01*c04 + s01*s04) = 0` says two unit vectors have inner
product 1. Over the reals that is `P0.1 = P0.4` restated. Over the complex
numbers it is NOT: `|u-v|^2 = 0` admits a nonzero isotropic difference. The
consequence is a limit on a tempting shortcut. One would like to certify the
LINEAR polynomials `c01 - c04` and `s01 - s04` instead, which would give a
smaller certificate and a stronger statement, and in the peer's linear-algebra
formulation those cost only an extra right-hand side against the same matrix.
But `d` lying in the ideal does not imply they do, precisely because of the
isotropic case, so a failure at every degree would be a true fact about the
variety rather than a defect in the search.

{{NEEDS_UPDATE}}: the cofactor degree reported by the mod-p `lift` run, which
bounds the peer's rational linear-algebra search instead of leaving it to
escalate degree by degree.

### 24. Singular's `lift` is itself blocked on this system (2026-09-03)

The mod-p membership certificate for `0e31c5c5d735a779` was to come from
Singular's `lift`, run at a large prime and then reconstructed over the
rationals. That job finished as `TIMED_OUT`: wall 900484 ms against a 900 s
budget, null exit code, and a complete stdout of

    equations 40
    gens 40

so it never reached the `lift` output at all.

That is a substantive negative result rather than a scheduling accident.
`lift` fails to complete in 900 s mod 32003 on a system whose raw Gröbner
basis finishes in 3.7 to 8.2 s and whose full 105-pair saturation finishes in
280 to 604 s. So the certificate-by-`lift` route is blocked by the computation
itself, not merely queued behind other work, and it is blocked at the
characteristic where everything else in this layer is cheap.

Two consequences. First, the peer session's decision to abandon Singular and
solve for the cofactors as an exact rational linear system was not only faster,
it was the only route that was going to finish; a certificate is a solution of a
linear system, and writing each cofactor with unknown rational coefficients
turns membership into linear algebra that needs no Gröbner basis and no lane
slot. Second, an earlier suggestion recorded here — that the cofactor degree
be read off the mod-p `lift` instead of escalating degree by degree — is void,
since no degree information exists in a run that never reached the call.

What survives is the target-independence of that linear system: the matrix
depends only on the generators and the chosen degree, so one factorization
tests every right-hand side at the cost of an extra column solve. The targets
worth testing together are `d` itself, the three-term reduction of section 23,
and the linear polynomials `c01 - c04` and `s01 - s04`, with the isotropy
caveat of section 23 attached to the last two.

{{NEEDS_UPDATE}}: whether the rational linear-algebra search reaches a
certificate, and at what degree.

### 25. A missing run manufactured a survivor claim (2026-09-03)

Chain v16 wrote two lines to `events/angle-chain.log` reporting that
`1412a71e2b2792b3` has no live pair, hence an already saturated ideal, hence
solutions whose fifteen points are all distinct. **Both lines are retracted.**
That triage never ran. Daemon job `9592f915` is still queued with `started_at`
null, the client gave up after 5431 s, `kal_angles` recorded
`NO_VERDICT(queued/None/Nonems)` with an empty field set, and the artifact
`angle-1412a71e2b2792b3-rel.stdout.txt` is 0 bytes.

The defect. The chain's `read_triage` guarded only on the stdout file being
ABSENT, but `kal_angles` writes the file even when the run produced nothing. An
empty file therefore parsed to zero `relevant` lines, zero lines was read as
"no pair can vanish", and that took the branch concluding the raw ideal is
already saturated. The retracted line's own "raw vdim None" was the parser
reporting that it had nothing, and the conclusion was drawn past it.

Why this one matters more than an ordinary bug: it fails toward a POSITIVE
claim. Every other failure in this layer has produced a timeout or a missing
verdict, which is visibly nothing. This one turns a run that did not happen
into a surviving representative — the one outcome that would keep the TriApex
leaf open — and it did so in the only orbit that has never been tested. A
missing run must never be able to manufacture a survivor.

Fix: a triage is accepted only if its output carries both a `dim_raw` and a
`dim` line; their absence is recorded as no verdict rather than as an empty
result. Applied to `artifacts/tools/angle_chain_v15.py` and `v16.py` and
checked against the three stdout files on disk — the empty `1412a71e2b2792b3`
file is now refused, while `0d6996160cc83aab` (raw 2048, 4 live) and
`0e31c5c5d735a779` (raw 1536, 7 live) still parse correctly. The peer session
found the defect and reports the same hole in its own chain v12; a second belt
available to both is that a daemon run with `started_at` null cannot have
produced anything, whatever the file says.

Containment: the false conclusion never reached this document. Section 19 still
records `1412a71e2b2792b3` as never triaged or saturated, and its
`{{NEEDS_UPDATE}}` is still open. No verdict of any kind is established for that
orbit.

Also recorded, from chain v15's death: piqd rejects a byte-identical
resubmission with `script blob <hash> was already stored` rather than
deduplicating it to the existing run, so retrying an unchanged query fails
instead of returning the earlier result.

### 26. The last characteristic-0 slot is spent, with no verdict (2026-09-03)

The run the section 15 composition gate authorized has finished:
`TIMED_OUT` at 3600023 ms against its 3600 s budget, recorded by the driver as
`NO_VERDICT(finished/None/3600023ms)` with `Singular output has no dim line`.
Its complete stdout is

    equations 44
    elimpart 5

That second line is the informative one. `elimpart` substituted five variables
over the rationals, the same five it substitutes mod 32003, so the run reached
the fully reduced system and then died in the Gröbner basis anyway. The failure
is not the reduction failing to apply; it is the maximally reduced rational
system still not finishing.

Five rational runs have now died on this orbit — plain `std`, `modStd`,
`modStd` with saturation, `modStd` on the four-pair Rabinowitsch system, and
now `modStd` on `interred` + `elimpart` + Rabinowitsch — against 3.7 to 8.2 s
for the raw basis mod 32003 and 20.958 s for the reduced one. The
characteristic-0 route on this encoding is exhausted, and the gate it passed
turned out to license an attempt that failed exactly where its predecessors
did. Recording that plainly: the gate was correctly specified and correctly
passed, and it bought nothing.

Where this leaves the layer. The five orbits of section 19 stand as:

- three orbits, 72 of the 111 patterns, refuted — one of them over the
  rationals, two mod 32003;
- one orbit of 3 patterns never tested, and section 25 retracts the only claim
  ever made about it;
- the 36-orbit **open**, and now open with no route in view.

The open orbit is the hard case for a specific structural reason worth stating,
because it also rules out the technique that settled the others. Its saturated
ideal has vector-space dimension 192 mod 32003 with all fifteen points
distinct, so it does NOT collapse: no live pair's quotient dimension equals the
raw one. The membership certificate — the one method in this lane that yields a
proof rather than mod-p evidence — certifies that a squared distance lies in the
ideal, which is exactly what a collapse asserts and exactly what this orbit
denies. So the certificate route cannot be pointed at the open orbit at all. It
upgrades the 1536-orbit and would upgrade the 3-orbit if that one collapses; it
has nothing to say here.

What remains for the open orbit, honestly: the 192 solutions mod 32003 are a
genuine survivor at the encoded scope, and deciding whether any is real needs
the rational real-root count that five runs have failed to produce. The only
concrete untried lever is the labeling spread of section 20 — 30 of the 36
labelings are unmeasured even mod p, and a materially cheaper one is a
different rational computation rather than the same one retried. Its weakness
is unchanged and now better evidenced: `3826b8a0dec4a6b0` is 2.2 times cheaper
than `0d6996160cc83aab` mod p and both died rationally, so the mod-p spread
does not obviously predict rational tractability.

No further 3600 s rational slot is authorized on this orbit. A bounded mod-p
ranking sweep over the unmeasured labelings is the next thing worth spending
lane time on, and only once the lane is free.

### 27. The section 21 prediction lands exactly (2026-09-03)

`172327e48f4004fb`'s relevance triage ran (47.3 s of daemon wall) and matches
the section 21 prediction in every element. The prediction was committed as
`e6f33f36a` before the run, and the triage output is:

    dim_raw 0
    relevant P0.1:P0.4 0 1536      <- predicted 1536, COLLAPSE
    relevant P0.2:P1.2 0 768       <- predicted 768
    relevant P0.2:P1.4 0 768       <- predicted 768
    relevant P0.3:P2.1 0 768       <- predicted 768
    relevant P1.2:P1.4 0 384       <- predicted 384
    relevant P1.3:P1.4 0 384       <- predicted 384
    relevant P2.1:P2.4 0 384       <- predicted 384
    dim 0
    vdim 1536                      <- predicted 1536

Seven live pairs out of 105, named in advance, with their exact vector-space
dimensions, the correct raw dimension, and no eighth live pair. The collapsing
pair is the predicted one and its quotient dimension equals the raw one, so
`172327e48f4004fb` is refuted mod 32003 at the encoded scope, by a 47 s triage
rather than the 105-pair saturation that timed out on it yesterday.

This is the strongest confirmation the five-orbit partition of section 19 can
get short of a proof. Section 22 already retrodicted a four-pair live set on
data collected before the partition existed; this predicts a seven-pair live
set with its dimension profile, in writing and in the repository, before the
computation ran. Two independent orbits, one retrodiction and one prediction,
both exact.

Standing scope: all of it is mod 32003. The soundness of the partition itself
does not depend on that — patterns in one orbit differ by a permutation of the
point labels, so their ideals differ by a ring automorphism — but the verdicts
being transported are mod-p verdicts, and transporting them faithfully makes
them no stronger than they were.

Consequence for the layer: with `172327e48f4004fb` directly confirmed and
`0e31c5c5d735a779` refuted by saturation (`dim_sat -1`), the 1536-orbit is
established twice over, and `32263a5344416a02` and `5d4f4968fac1e0d5` need no
run at all. The remaining work is unchanged: the 3-orbit is untested and the
36-orbit is open.

{{NEEDS_UPDATE}}: the `1412a71e2b2792b3` triage, now running, is the last
untested orbit in the layer.

### 28. The last orbit's triage failed for an avoidable reason (2026-09-03)

`1412a71e2b2792b3`'s relevance triage finished `TIMED_OUT` at 900052 ms. Its
complete stdout is 13 bytes:

    equations 40

No `dim_raw` line, so it died in the FIRST Gröbner basis and never tested a
single pair. Under the section 25 guard this is correctly recorded as no
verdict; the last untested orbit remains untested.

The reason is avoidable and was already in the data. Plain `std` cannot do this
key: its raw run also finished `TIMED_OUT` at 900055 ms with the same 13 bytes.
`slimgb` does the identical ideal in 38.4 s, returning dim 0 and vector-space
dimension 3072. The triage was submitted without `--slimgb`, so it spent 900 s
failing at a step a different algorithm completes in under a minute.

This is the section 20 labeling effect showing up as an operational mistake
rather than an observation. That section recorded that four of six labelings in
the open orbit time out under `std` and finish in 8 to 15 s under `slimgb`, and
that the earlier "slimgb decides what std could not" note was partly a labeling
artefact. `1412a71e2b2792b3` is in exactly that category and the triage should
have carried `--slimgb` from the start.

Corrected run prepared, not yet submitted: the same triage with `--slimgb`.
It is being held rather than queued because codex-rigid221 has a sequence of
equality-core queries on the serial lane and was promised no foreign jobs
during it; a `--slimgb` script differs in bytes from the timed-out one, so
piqd's rejection of byte-identical resubmission does not apply.

Note for anyone reusing the triage: `--relevant` computes the first basis once
and then one `std(G, d)` per pair, so the algorithm flag matters only for the
first basis — but that is precisely where this key fails, and where the 53 s
`0d6996160cc83aab` triage and the 47 s `172327e48f4004fb` triage both succeeded
because plain `std` happened to suit their labelings.

{{NEEDS_UPDATE}}: the `--slimgb` triage of `1412a71e2b2792b3`, which is the
only remaining obstacle to a complete mod-32003 picture of all 111 patterns.

### 29. Interreduction is not free, and the elimpart evidence is one point (2026-09-03)

Two findings from the peer session (its commit `5d657015a`), both of which
qualify section 26 rather than change its verdict.

**`interred` + `elimpart` can make a computation strictly harder.** Mod 32003,
daemon wall:

| key | reduction | result |
|---|---|---|
| `0128294791aad010` | elimpart 4 | dim -1, 1.3 s |
| `0d6996160cc83aab` | elimpart 5 | dim 0, vdim 2048, 21.0 s |
| `32263a5344416a02` | elimpart 5 | no dim line, 900.1 s, budget reached |

`32263a5344416a02` COMPLETES without the reduction and TIMES OUT with it. Five
fewer variables is paid for with a denser generating set, and on that key the
density costs more than the variables save. So the composition must not be
applied by default, and the section 15 framing of it as strictly more reduced
was wrong: fewer variables is not monotonically easier.

The consequence for section 26 is a qualification in the direction of saying
less. The final characteristic-0 run carried `interred` + `elimpart`, so its
failure is not cleanly attributable to the variable count — it may have been
fighting a denser system as well as a rational one. What survives untouched is
the verdict itself, because four of the five dead rational routes used no
reduction at all. "This encoding is not characteristic-0 tractable in Singular"
therefore does not rest on the reduction, and section 26 should be read as one
dead route among five rather than as the decisive one.

**The `elimpart` exactness evidence is a single data point, not four.** The
planned differential returned: one key where both invariants are defined and
agree across a transform that genuinely changed the system
(`0d6996160cc83aab`, five substitutions, dimension and vector-space dimension
preserved); one key landing on the unit ideal, which any destructive transform
would also do, so it is not a test; and three keys with no usable output, two
whose jobs never ran and one that timed out. One informative confirmation.

The banking rule stays exactly as written: `elimpart` may accelerate a search,
but a refutation resting on it alone is not banked. Nothing in this layer
currently rests on it — the composition-gated run produced no verdict — so the
rule has not yet had to be invoked, and it should not be relaxed on the strength
of one agreeing key.

### 30. The last orbit is measured, and it does not collapse either (2026-09-03)

The `1412a71e2b2792b3` triage, resubmitted with `--slimgb` after section 28,
ran to a verdict: daemon job `6281d38a`, 815.7 s client wall, complete stdout
carrying both guard lines.

    equations 40
    dim_raw 0
    ... 105 relevant lines ...
    dim 0
    vdim 3072

The section 25 guard is what makes this readable as a verdict at all: the file
has `dim_raw` and `dim`, so it is a run and not an artifact of a job that never
started. 38 of the 105 pairs are live. Their quotient dimensions are

    1536  P0.2:P1.2, P0.3:P2.3
    1024  P0.1:P0.3, P0.2:P0.4
     768  six pairs
     512  ten pairs
     256  eighteen pairs

and the raw vector-space dimension is 3072. The top live quotient is exactly
half the raw one, so **no pair collapses**: no squared distance lies in the
ideal, and every solution of the raw system mod 32003 keeps all fifteen points
distinct. This is the same shape as the open 36-orbit, not the refuted
1536-orbit.

Two consequences.

The certificate route now has one customer, not two. Section 26 recorded that
the membership certificate — the only method in this lane that yields a proof
rather than mod-p evidence — certifies exactly what a collapse asserts, so it
cannot be aimed at an orbit that does not collapse. Section 26 hoped the
3-orbit might collapse and give it a second target. It does not. The
certificate applies to the 1536-orbit alone.

Collapse is the exception among the orbits that survive emptiness. Of the three
orbits whose raw ideal is nonempty and zero-dimensional, one collapses
(1536-orbit, 24 patterns, refuted) and two do not (36-orbit and 3-orbit, 39
patterns). The two refuted-by-emptiness orbits never reached this test.

Labeling cost, again. The same triage under plain `std` timed out at 900 s
without emitting `dim_raw`; under `slimgb` the first basis takes 38.4 s and the
105 quotient probes take the remaining 777 s. The section 20 effect is not
confined to the raw basis: it decides whether the triage produces a verdict at
all.

The next question for this orbit is the one section 17 prescribes: saturating
by the 38 live pairs, traced so that a timeout still reports how far it got.
Empty means the orbit is refuted at the encoded scope; finite and nonempty
puts it beside the 36-orbit. That run is submitted.

### 31. The 3-orbit is refuted, and section 30 named the certificate's customers too narrowly (2026-09-03)

Saturating `1412a71e2b2792b3` by its 38 live pairs empties the ideal. Daemon
job `ff759d6f`, `RAN`, 406371 ms, verdict `EMPTY_COMPLEX`:

    dim_raw 0
    sattrace P0.1:P0.3   2048     (from 3072)
    sattrace P0.2:P1.2   1024
    sattrace P0.3:P2.3    512
    sattrace P1.1:P1.2    256
    ... sixteen further pairs hold at 256 ...
    sattrace P1.2:P2.3     -1
    dim_sat -1
    dim -1

Twenty-two of the thirty-eight pairs suffice; the twenty-second empties it.
Removing the components on which some pair of the fifteen points coincides
leaves nothing, so every solution of the raw system over the algebraic closure
of GF(32003) has two of the fifteen points equal, and the pattern requires
them distinct. That orbit of 3 patterns is refuted at the encoded scope mod
32003, the same claim scope as the dim-2 and 1536 orbits.

Where the layer stands. Four of the five orbits are refuted, 75 of the 111
patterns: one empty over the rationals, one dim 2 and empty after saturation,
one by collapse, and now one by saturation to the unit ideal. **The 36-orbit
is the only survivor**, and the whole metric kill-test for this cell now rests
on it alone.

**Correction to section 30.** That section said the membership certificate has
one customer, because a certificate asserts that a squared distance lies in
the ideal and only a collapse asserts that. Too narrow. A saturation to the
unit ideal is also a membership statement: adding the Rabinowitsch generator
`u * prod(d) - 1` and reaching the unit ideal says that a power of the product
of the live squared distances lies in the ideal, and that is certifiable by
the same exact rational linear algebra, with the same coefficient-growth risk
and no Gröbner basis. So the technique in principle reaches every mod-p
refutation of this kind, not the collapse alone. What section 30 got right,
and what does not change, is the 36-orbit: it neither collapses nor saturates
to empty, so it presents no membership statement to certify. The route is
blocked there for a reason no amount of certificate work removes.

Claim scope, unchanged and worth restating because four orbits now carry it.
Emptiness at a single prime is evidence for emptiness in characteristic 0, not
a proof: a nonempty zero-dimensional variety over the rationals stays nonempty
modulo all but finitely many primes, so `dim -1` at 32003 is what emptiness
looks like, but 32003 is not known to be a lucky prime for this ideal. Three of
the four refutations are mod-p only. The Rabinowitsch certificate above is the
route that would upgrade them.

### 32. The labeling lever is spent (2026-09-03)

Section 26 named the labeling spread as the one concrete untried lever on the
open orbit: thirty of its thirty-six labelings were unmeasured even mod p, and
a materially cheaper one would be a different rational computation rather than
the same one retried. The sweep has now run, at a 30 s cap chosen because
anything cheaper than the 3.665 s already tried finishes well inside it and a
labeling in the 30 to 60 s band is no candidate at all.

Ten of the twenty-nine completed. Every one of them returns `dim 0` and
`vdim 2048`, exactly as a ring isomorphism requires; sixteen of the orbit's
thirty-six labelings now carry that invariant and none disagrees. Daemon wall
for the ten, against the two labelings whose cost was already known:

    2514  72a0268b2d358aa0      3665  3826b8a0dec4a6b0   (known, died rationally)
    2601  945beaee11bb6563      8163  0d6996160cc83aab   (known, died rationally)
    2639  67ca589284a3d239
    2888  fc932a4008e5021e
    4095  d0005c6a8a9084f8
    5078  7a95c8c74bedb703
    5176  87d804d3b3b280c1
    5294  aa95d62d7e36d222
    6017  80c2cd277d4ef3ca
    6367  999e18094e8ed7a1

The cheapest labeling found is 2.514 s against 3.665 s, a factor of 1.46. The
two labelings already tried over the rationals differ by a factor of 2.2 mod p
and both died the same way, so a further 1.46 sits inside a spread already
known not to predict rational tractability. **The lever is spent.** It bought
ten confirmations of the partition and no reason to open another rational
slot.

Where that leaves the open orbit, stated plainly. The metric equalities alone
do not refute it: 192 points mod 32003 with all fifteen distinct is a genuine
survivor at the encoded scope, and every technique in this lane has now been
aimed at that one ideal and failed -- five rational runs, the certificate
(nothing to certify), and the labeling spread. What the encoding drops is what
is left: reality of the solutions, and the cell's order and betweenness data
from stages 1e to 1g, none of which is in the ideal. The next route is
therefore not more algebra on the same system but a system carrying more of
the cell. That is a scoping step, not a run, and it is where this orbit should
be picked up.

### 33. The surviving orbit carries a forced collinearity (2026-09-03)

Section 32 said the next route is a system carrying more of the cell, and the
cheapest first question is what the 192 surviving points actually look like.
`kal_angles.py` gained `--orient a:b:c`, which probes an orientation
determinant against whatever ideal the flags have built, exactly as
`--relevant` probes a squared distance. The two readings that decide anything
are the extremes: `dim -1` means the determinant vanishes nowhere on the
variety, so that triple is never collinear there; a quotient vdim equal to the
ideal's own means the determinant lies in the ideal, so the triple is
collinear at every point.

Encoder check before the run, as Guardrail 1 requires. For the apex triple the
emitted determinant reduces to `sf` under every gauge placement, since the
gauge puts the special apex at the origin, the next at `(1,0)` and the third
at `(cf,sf)`; the cap-point case picks up the `(1+c01, s01)` coordinates the
encoder assigns to a `Y`-cap point. Both were read off the generated script
rather than assumed.

The run, against the 192-point Rabinowitsch ideal of `0d6996160cc83aab`
(job `3bd7d1fa`, 90 s, `equations 44`, `dim 0`, `vdim 192`), probed the apex
triple and all twelve cap points against the `A0A1` line:

    orient A0:A1:A2    -1     never collinear
    orient A0:A1:P1.1   0 192  COLLINEAR AT EVERY POINT
    orient A0:A1:<the other eleven cap points>   -1   never collinear

So the three apexes are never collinear on the surviving variety, and exactly
one cap point, `P1.1`, lies on the line through two of the apexes at every one
of the 192 points. The same equal-finite-dimension argument used for the
collapse test gives it: `R/G` surjects onto `R/(G + det)`, equal finite
dimensions force an isomorphism, so `det` lies in `G`.

This is a structural fact about the survivor, not yet a refutation. It becomes
one exactly when the cell forbids a cap point from lying on the line through
two apexes, which is a question about the leaf's binders and the stage 1e to
1g order data, not about the algebra. That question is open at the time of
writing.

Two immediate follow-ups, both cheap. The other two apex lines against all
twelve cap points, for the complete collinearity picture; that run is
submitted. And the same probe on a second labeling of the orbit, where the
orbit map predicts in advance which cap point must be the collinear one --
the same falsifier discipline that sections 21 and 27 used, applied to a new
invariant.

Scope, stated plainly: this is a mod 32003 statement about the encoded system,
one labeling, and it inherits the claim scope of section 31 unchanged.

### 34. The collinearity is unique among all thirty-six triples, and a prediction for a sibling (2026-09-03)

The other two apex lines are now probed against all twelve cap points, same
ideal and same job family as section 33:

    orient A0:A2:<all twelve cap points>   -1   never collinear
    orient A1:A2:<all twelve cap points>   -1   never collinear

With section 33 that completes the picture. Of the thirty-six (apex pair, cap
point) triples, **exactly one** is collinear on the surviving variety and the
other thirty-five are collinear nowhere. The forced degeneracy is a single
named incidence, not a general flatness of the configuration.

**Registered prediction, before the run.** `orbit_predict_orient.py` carries
`0d6996160cc83aab`'s pattern to a sibling labeling by explicit relabeling and
transports the collinear triple with it. For `72a0268b2d358aa0`, the cheapest
labeling in the orbit at 2.514 s, exactly one image survives over the whole
group:

    predicted collinear triple   A0:A1:P0.4
    transported Rabinowitsch pairs   P0.4:P2.2, P1.4:P2.3, P1.2:P1.3, P0.1:P1.4

The same holds for `3826b8a0dec4a6b0`, also `A0:A1:P0.4`. The prediction is
falsifiable three ways: the probe could find no forced collinearity, or find
one at a different triple, or find more than one. Any of those refutes either
the orbit partition or the section 33 reading. The transported pairs are part
of the prediction too, since they are what must build a 192-point ideal on the
target; if they do not, the test is inconclusive rather than passed.

This tests a different invariant from sections 21 and 27, which predicted
collapsing pairs and live-set dimensions. A relabeling that carries the metric
pattern must carry every geometric consequence of it, so a forced incidence is
as good a falsifier as a dimension, and it is one no earlier run measured.

### 35. The section 34 prediction lands exactly (2026-09-03)

The probe on `72a0268b2d358aa0` (job `65496582`, 126.9 s) matches the
prediction committed in `1d01a1818` in every part:

    equations 44
    dim 0
    vdim 192                       <- the transported pairs do build a 192-point ideal
    orient A0:A1:P0.4   0 192      <- the predicted triple, collinear at every point
    orient <the other thirty-six>  -1   never collinear

Predicted `A0:A1:P0.4`, unique; found `A0:A1:P0.4`, unique. All three ways the
prediction could have failed did not: there is a forced collinearity, it is at
the named triple, and there is only one. The transported Rabinowitsch pairs
reproducing `vdim 192` on a different labeling is a fourth check that was not
guaranteed to pass.

What this establishes and what it does not. It confirms the five-orbit
partition again, on an invariant no earlier run measured -- sections 21 and 27
predicted collapsing pairs and live-set dimensions, both metric; this is a
forced incidence, and a relabeling that carries the metric pattern must carry
it too. It also confirms the section 33 reading of the equal-finite-dimension
test, since an artefact of that reading would not transport to a named triple
under a group element found without reference to it. It does not refute the
orbit: a forced collinearity is a property of the survivor, and only a cell
constraint forbidding it turns that into a contradiction.

Two labelings of the orbit now agree that the surviving variety has exactly
one forced incidence among all thirty-six (apex pair, cap point) triples, and
that the three apexes are never collinear. The open question is unchanged and
is not an algebra question: does the cell forbid a cap point on the line
through two apexes?

### 36. The cell does forbid the collinearity: the last orbit falls mod 32003 (2026-09-03)

Sections 33 to 35 left one question, and it was not an algebra question: does
the cell forbid a cap point from lying on the line through two apexes? It
does, by a hypothesis the leaf already carries.

The chain, each link read in source rather than inferred.

1. `CounterexampleData` carries `convex : ConvexIndep A`
   (`lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:86-89`). The target
   theorem takes `D : CounterexampleData`, so this is a live hypothesis at the
   leaf, not something to be supplied.

2. `ConvexIndep.not_three_collinear`
   (`lean/Erdos9796Proof/P97/ConvexIndepHelpers.lean:67-76`) is a proved
   theorem: for `hA : ConvexIndep A` and three pairwise-distinct members of
   `A`, `Collinear ℝ {x,y,z}` is `False`. No `sorry`, and the same lemma is
   already used elsewhere in the development.

3. All three apexes are members of `A`. They are the vertices of
   `S.triangle`, and `oppApex1_mem_A'`
   (`lean/Erdos9796Proof/P97/ATail/FirstApexInteriorPairGeometry.lean:344-351`)
   discharges membership from `S.triangle.v1_mem`, `v2_mem` and `v3_mem`, one
   per surplus index, so all three vertex-membership facts exist.

4. All twelve cap-interior points are members of `A`, by
   `capInteriorByIndex_subset`
   (`lean/Erdos9796Proof/P97/N8/N8bEndpointPair.lean:52-56`).

5. The three points of the collinear triple are pairwise distinct on the
   variety. In the relevance triage of `0d6996160cc83aab`, `A0:A1`,
   `A0:P1.1` and `A1:P1.1` all read `dim -1`: those pairs can never coincide,
   so no point of the variety identifies any two of them.

6. The forced collinearity of section 33 says the orientation determinant of
   that triple lies in the ideal mod 32003, so it vanishes at every point of
   the distinctness-saturated variety.

Points 1 to 4 say the cell forbids three distinct members of `A` from being
collinear. Points 5 and 6 say every surviving point of the encoded system has
exactly that. **The 36-orbit is refuted at the encoded scope mod 32003**, and
with it all thirty-six of its patterns.

A confirmation worth recording separately: the live pairs of
`0d6996160cc83aab` are exactly the four Rabinowitsch pairs used to build the
ideal, so `vdim 192` is the fully distinctness-saturated variety and not a
partially saturated one. Saturating by the other 101 pairs is a no-op because
each is `dim -1`.

With this, all five orbits and all 111 residue metric patterns of cell
`i0-1R1R1R-in12` are refuted mod 32003. Four of the five refutations are
mod-p only; the empty orbit is the one settled over the rationals.

**Correction to section 31.** That section said the 36-orbit "presents no
membership statement to certify", and used that to conclude the certificate
route was blocked there "for a reason no amount of certificate work removes".
That is now wrong in the part that matters. The forced collinearity IS a
membership statement -- the orientation determinant lies in the ideal -- and it
is the same shape as a collapse, so the exact rational linear algebra the peer
built for `0e31c5c5d735a779` applies to it directly. What section 31 had right
is narrower than what it claimed: no COINCIDENCE membership statement exists
here, because nothing collapses. It did not occur to me that a different
polynomial could be the certified one.

That correction is the route out of mod-p. Certifying the orientation
determinant's membership over the rationals would upgrade this orbit's
refutation from evidence at one prime to a proof, with no Gröbner basis
needed.

Scope, stated exactly. This is discovery evidence for a closure route, not a
closure. The Lean bridge does not exist: `not_three_collinear` is not invoked
in `TriApexEndpointRetainedOmission.lean` or
`PairedCommonDeletionNormalForm.lean`, and writing it needs the ingress from
the leaf's binders to the encoded metric pattern, which is the same ingress
obligation the plan has carried throughout. The leaf is unchanged: one
`sorry`, measure 18.

One thing to check before leaning further on the encoding, flagged rather than
resolved: the cell name's `in12` marks the incidence census as modelling the
twelve cap-interior points and NOT the three apexes
(`census/card_head/d1_mu0_incidence_census.py:179-196`, where `ax15` is the
15-point alternative), yet the residue metric patterns carry apex classes and
the angle form gives all three apexes coordinates. That is a question about
how the patterns were extracted, predating this wave, and it should be
answered before the metric layer is called complete rather than complete at
the encoded scope.

### 37. The `in12` flag concerns shells, not existence; section 36's foundation holds (2026-09-03)

Section 36 flagged, without resolving it, that the cell name marks the census
as modelling twelve points while the angle form gives fifteen coordinates. The
flag is discharged: `in12` says which points CARRY a shell, not which points
exist.

`Cell.points` returns the twelve cap-interior labels, and with `apex_shells`
the three apexes as well (`census/card_head/d1_mu0_incidence_census.py:191-196`).
It is consumed only as the index set of the shell data and the CNF variables --
`pattern.centre[x]` and `pattern.shell[x]` for `x in cell.points`
(`:1424-1427`), and the `c`/`s` literals at `:2072-2076`. The apex class
objects are modelled separately by `Cell.classes()`, which emits one or two per
apex for every arm regardless of `apex_shells` (`:204-210`).

The model records agree. Each carries twelve `shell` keys and no apex key,
three class centres `A0.0`, `A1.0`, `A2.0`, and apexes as ordinary members of
shell supports and classes -- for example
`"P0.1": ["A2", "P0.1", "P1.3", "P2.2"]` and
`"A1.0": ["A0", "A2", "P1.1", ...]`.

So the three apexes are genuine points of the configuration in an `in12` cell;
what the flag withholds is only their own shells. Giving all three apexes
coordinates in the angle form is correct, "exact-15" is the right description
of the metric layer even here, and the section 36 chain -- which needs the
apexes to be points of `A` -- is not affected.

One naming trap worth recording: the encoding metadata field is
`modelled_points` (`:2259`) and it holds `cell.points`, so it means
shell-carrying points, not all points of the configuration. Reading it as the
latter is what raised the flag.

### 38. The certificate for the collinearity: two degrees eliminated, and a much simpler target (2026-09-03)

Section 36 corrected section 31 and named the certificate route as the way to
turn the last orbit's mod-p refutation into a proof.
`artifacts/tools/cert_search_orient.py` runs it: same exact rational linear
algebra as `cert_search.py`, but the generators carry the four Rabinowitsch
generators `u_i*d_i - 1` so membership is in the saturated ideal, and the
target is an orientation determinant rather than a squared distance.

For `0d6996160cc83aab` and the triple `A0:A1:P1.1`, 44 generators in 30
variables:

    degree 0    44 unknowns,  159 equations    inconsistent
    degree 1  1364 unknowns, 4446 equations    inconsistent

Both are proofs that no certificate of that degree exists, not failed
searches, exactly as the peer's section 20 bounds were. Degree 2 is 21824
unknowns, past the dense exact elimination here, so the naive search hits the
same wall.

**But the target is much simpler than the distance was, and that is a real
lever.** Writing out the gauge for `72a0268b2d358aa0`, where the special apex
sits at the origin: `A0 = (1,0)`, `A1 = (cf,sf)`, `P0.4 = (1+c04, s04)`, so

    det(A0, A1, P0.4) = (cf - 1)*s04 - sf*c04

Three terms in four variables, against the six terms of a squared distance and
the three the peer reached only after a hand simplification. Geometrically it
says the unit vector from `A0` to `P0.4` is parallel to the direction from
`A0` to `A1` -- the surviving configurations put that cap point on the line
through two apexes at unit distance from one of them.

The next lever follows from the shape rather than from more budget: a targeted
search restricting cofactor monomials to the variables that actually occur,
instead of all 30 at degree 2. The dense count is 21824 because it admits
every monomial in every variable; the target involves four. That is not a
guarantee -- the cofactors need not be supported on the target's variables --
but it is a specific, bounded thing to try, and it is the first idea in this
lane that attacks the degree wall rather than paying for it.

Recorded so the next session does not redo the two dead degrees.

### 39. The targeted certificate search fails; the degree wall is the real obstruction (2026-09-03)

Section 38's lever was that the determinant involves only four variables, so a
certificate with cofactors supported there would be cheap. `cert_search_orient.py`
gained `vars=` to test exactly that, on `72a0268b2d358aa0` and `A0:A1:P0.4`:

    support {cf,sf,c04,s04}              degree 0    44 unknowns   164 eqs   inconsistent
                                         degree 1   220           790        inconsistent
                                         degree 2   660          2276        inconsistent
    support {cf,sf,c04,s04,u0..u3}       degree 1  1100          3299        inconsistent
                                         degree 2  1980          6597        inconsistent

The lever does not work, and the reason is the one section 38 flagged as the
risk rather than a surprise: the ideal's generators involve all twenty-six
coordinate variables, so cofactors cancelling their monomials generally need
those variables too. Restricting support cheapens the search by discarding
most of what the cancellation needs.

Note the claim scope carefully, because these are weaker statements than the
section 38 bounds. Degrees 0 and 1 unrestricted are proofs that no certificate
of that degree exists. The rows above prove only that no certificate of that
degree **with cofactors supported on those variables** exists. They do not
bound the unrestricted degree-2 question, which remains 21824 unknowns and out
of reach of this dense exact solver.

Where the certificate route stands. It applies -- section 36's correction to
section 31 holds, the collinearity is a genuine membership statement -- but
reaching it needs either a sparse or structured exact solver at unrestricted
degree 2, or a `lift` that returns the true cofactor degree, and the peer
already found `lift` reaching its budget on both 32003 and 2147483647. Nothing
cheap remains. The mod-p refutation of the last orbit stands as evidence at
one prime, and the honest next step for turning it into a proof is a better
linear-algebra engine, not a cleverer restriction.

### 40. The metric layer does not reach the leaf; my own next-step note was mis-scoped (2026-09-03)

Sections 30 to 39 left a working note saying that the one remaining step from
section 36 to a closure was a Lean ingress from the leaf binders to the
encoded metric pattern. Read against source, that note was wrong, and it was
wrong in the direction that wastes a session. This section records what the
metric layer actually reaches.

**The leaf carries no cardinality hypothesis.** `CounterexampleData`
(`U1TwoShortCapReduction.lean:83`) has five fields — `A`, `nonempty`,
`convex`, `K4`, `packet` — and none of them fixes `|A|`.
`TriApexAllLargeContext` (`AllLargeCapCanonicalInterfaces.lean:297`) bounds
the caps from below (`cap_card_ge_six`) and relates `|A|` to the not-robust
centres, but supplies no upper bound. Inside
`false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core` every
exact-fifteen fact is parked under an undischarged binder — `hfifteen`,
`hsixSlots` and `hadjacentAtPair` are all of the form
`fun (hcard : D.A.card = 15) => …` — so `hcard` is never available in the
branch that carries the `sorry`. Both consumers of the leaf's parent
(`TriApexEndpointRetainedOmission.lean:2959`, `:3452`) are likewise
general-cardinality, so the hypothesis is not supplied from above either.

**What that costs.** The exact-15 metric layer therefore addresses the
`card = 15` arm of a split the leaf does not yet perform. The split rule in
Phase 3 permits introducing that split only in the same change that closes at
least one resulting child, so the metric layer cannot be wired in until it
closes something.

**Census cells are not measure cells.** The measure `M` counts (cardinality
class, cell) pairs over the classes `{15, ≥ 16}` and the nine leaf cells —
three `oneRadius` and six `twoRadii`. The name `i0-1R1R1R-in12` belongs to
the incidence-census vocabulary of Stage 1, one of 32 census cells (16 of
them target cells), not to that list. A map from census cells to leaf cells
would itself need proving, and none exists. So refuting every residue pattern
of one census cell leaves `M = 18` untouched, which is what every checkpoint
this session has reported.

**What the layer does reach, stated exactly.** All 111 residue metric
patterns of census cell `i0-1R1R1R-in12` are refuted mod 32003, and the claim
scope is sound in both directions that were at risk. The residue is not a
sample: the long run on this cell was uncapped (cap 200000, complete in about
22 min, 15543 CL1 cuts, 387 survivors, 111 distinct patterns), so the earlier
3000-model enumeration cap constrains the Stage 1 sample runs, not the
residue. And the reduction from 111 patterns to orbit representatives passed
its own falsifier in section 22, so the verdicts are statements about all 111
patterns rather than about the representatives alone. The refutation is
exhaustive within the exact-15 incidence and boundary-order abstraction, at
one prime, for one census cell.

**Distance still to run.** Four gaps separate that from a closure, and none
is the ingress alone: the mod-p to characteristic-0 upgrade for four of the
five orbits (sections 38 and 39); the Lean ingress; the other fifteen target
census cells; and the entire `≥ 16` cardinality class, which is half the
measure and which no run in this lane has touched.

**Correction to the working note.** "The ingress turns section 36 into a
closure" is withdrawn. A complete and correct ingress for this census cell
would still leave `M = 18`, because the cell it closes is not a cell the
measure counts and the cardinality arm it lives in is not one the leaf
splits on.

### 41. The forced collinearity is an ideal membership; its core is not the individually necessary set (2026-09-03)

Section 40 leaves the metric layer short of the leaf on four counts. The one
mechanism found in this lane that is not intrinsically tied to `card = 15` is
the forced collinearity of section 36, because both Lean facts it would use —
`signedArea2` (`Foundation.lean:75`) and `ConvexIndep.not_three_collinear`
(`ConvexIndepHelpers.lean:67`) — are cardinality-generic. That makes the size
of its hypothesis set the question worth measuring, and this section measures
it (`artifacts/tools/collinear_core.py`, piqd Singular lane, mod 32003,
`slimgb`, pattern `0d6996160cc83aab`, triple `A0:A1:P1.1`, the four
Rabinowitsch pairs `P1.1:P2.3`, `P0.1:P2.2`, `P0.2:P0.3`, `P0.1:P1.4`).

**The determinant lies in the ideal, by a second and independent route.**
`reduce(det, slimgb(I))` is zero, in 3.1 s (job `5e81c969`). Section 36 read
membership off equal finite vector-space dimensions; a zero normal form is a
different Singular code path reaching the same conclusion, so the membership
is now cross-checked rather than resting on one computation. It also settles
what sections 38 and 39 left open: a certificate exists, and those searches
failed on cofactor degree alone.

**Independent deletion sweep** (job `b28f57d9`, exit 0, 699 s, all 27 metric
generators). Dropping generator `j` alone and re-testing, 9 of the 27 are
individually necessary and 18 are individually droppable. The nine are all
shell equalities at the four cap-2 interior points, two apiece, plus a single
apex-class equality:

| index | equality |
|---|---|
| 1, 2 | `|P2.1 A0| = |P2.1 P1.1| = |P2.1 P2.3|` |
| 4, 5 | `|P2.2 P0.3| = |P2.2 P2.1| = |P2.2 P2.4|` |
| 7, 8 | `|P2.3 P0.1| = |P2.3 P2.2| = |P2.3 P2.4|` |
| 10, 11 | `|P2.4 A1| = |P2.4 P1.2| = |P2.4 P2.1|` |
| 16 | `|A0 A2| = |A0 P2.2|` |

**Those nine do not suffice** (job `799658d2`): restricted to them the ideal
has dimension 5 and the determinant's normal form is non-zero. So the natural
reading of the sweep — that the nine are the core — is wrong. Each of the
eighteen is redundant given the other twenty-six, and they are still
collectively load-bearing. Necessity one at a time is not joint sufficiency,
and the sweep answers only the first question. A deletion-minimal sufficient
subset needs sequential greedy deletion, where each successful drop is kept;
that pass is running.

**Claim scope.** A zero normal form proves membership, so every `dropped`
verdict is a genuine sufficiency claim for the smaller hypothesis set. A
non-zero normal form is not the converse: the determinant may still vanish on
the variety through the radical. So `kept` means "not shown redundant", never
"shown necessary for collinearity", and this mines a sufficient core, never a
provably minimal one.

Leaf unchanged: single `sorry`, `M = 18`.

### 42. The collinearity core is ten equalities and one distinctness, and it holds over the rationals (2026-09-03)

> **Corrected by section 44.** "Ten of twenty-seven" undercounts the
> hypotheses: thirteen of the twenty-seven are carried by the gauge, so the
> core keeps ten of the *fourteen non-trivial* equalities. Read "a
> deletion-minimal core", not "the".

Section 41 left the deletion-minimal core unmeasured. Greedy deletion, keeping
each successful drop, settles it (job `48e18b04`, exit 0, 457.5 s).

**The core is ten metric equalities**, indices `1, 2, 4, 5, 7, 8, 10, 11, 16,
21` — the nine individually necessary ones of section 41 plus index 21, whose
addition makes the set symmetric in the two apex classes:

| source object | equalities |
|---|---|
| shell at `P2.1` | `|P2.1 A0| = |P2.1 P1.1| = |P2.1 P2.3|` |
| shell at `P2.2` | `|P2.2 P0.3| = |P2.2 P2.1| = |P2.2 P2.4|` |
| shell at `P2.3` | `|P2.3 P0.1| = |P2.3 P2.2| = |P2.3 P2.4|` |
| shell at `P2.4` | `|P2.4 A1| = |P2.4 P1.2| = |P2.4 P2.1|` |
| apex class `A0` | `|A0 A2| = |A0 P2.2|` |
| apex class `A1` | `|A1 A2| = |A1 P2.3|` |

Four blocker shells, one at each interior point of cap 2, contributing two
equalities apiece, and one equality from each of the two apex classes. Eleven
points appear: the three apices, `P0.1`, `P0.3`, `P1.1`, `P1.2`, and all four
of `P2.1` to `P2.4`. Sufficiency was re-confirmed independently by restricting
the generators to exactly these ten rather than by trusting the greedy pass's
final state.

**One distinctness suffices.** The encoder carried four Rabinowitsch pairs.
Dropping them one at a time, only `P1.1 != P2.3` is needed; the other three
are individually redundant, and — tested jointly, because section 41's lesson
is precisely that individual redundancy need not be joint — they are jointly
redundant too (job `c829dd19`, `base 1`, 2.0 s). So the hypothesis set is ten
equalities and the single distinctness `P1.1 != P2.3`.

**It holds over the rationals** (job `d758d61e`, `char 0`, `base 1`, 2.1 s).
This is the substantive upgrade. Five characteristic-0 runs on the full angle
system died (section 16), and the whole layer has been mod 32003 in
consequence; on the core the same question is a two-second exact computation.
Singular's `std` in characteristic 0 is deterministic Buchberger over exact
rational arithmetic, so a zero normal form there is an exact algebraic fact,
not a modular one.

**Consequence for the orbit tally.** The 36-orbit was refuted through this
collinearity, and the refutation was mod-p only. It is now characteristic 0.
Of the five orbits, two are refuted over the rationals — this one and the
24-orbit that is empty over ℚ — and three remain mod 32003 only.

**Why the core matters beyond this orbit.** It names four shells and two apex
classes; it nowhere uses that cap 2 has exactly four interior points. The
statement is therefore cardinality-generic, which is exactly the property
section 40 found missing from everything else in this layer. Both Lean facts a
consumer would need are cardinality-generic too: `signedArea2`
(`Foundation.lean:75`) with `collinear_of_signedArea2_eq_zero`, and
`ConvexIndep.not_three_collinear` (`ConvexIndepHelpers.lean:67`), which the
leaf can reach because `D.convex` is a field of `CounterexampleData`.

**Claim scope, stated exactly.** The algebraic fact — the orientation
determinant of `A0, A1, P1.1` lies in the ideal generated by those ten
equalities, the circle gauge and that one distinctness, over ℚ — is exact, and
cross-checked mod 32003 by a second code path. Everything past that is not yet
established. The encoding-to-claim map has not had its adversarial audit
(Guardrail 2), no second engine has confirmed it (Guardrail 7), the core has
been mined on one pattern rather than transported across the orbit, and no
Lean ingress exists. It does not move `M`. Leaf unchanged: single `sorry`,
`M = 18`.

### 43. The core transports across the orbit; the certificate lift does not finish (2026-09-03)

> **Corrected by section 44.** "Ten of twenty-seven" undercounts the
> hypotheses: thirteen of the twenty-seven are carried by the gauge, so the
> core keeps ten of the *fourteen non-trivial* equalities. Read "a
> deletion-minimal core", not "the".

Section 42 mined the collinearity core on one pattern. Section 19's orbit
reduction says a verdict on one member is a verdict on the orbit, but that
licence was established for dimension and vdim, not for a hypothesis subset,
so the core needed its own transport test.

**Generator indices do not transport.** The core has to be stated invariantly,
as a centre together with a set of points equidistant from it
(`artifacts/tools/orbit_transport_core.py`). Carrying it to
`72a0268b2d358aa0` by explicit relabeling, two of the six groups land on point
sets that avoid that pattern's first-listed shell member, and no subset of the
encoder's generators spans those. Reusing `--keep` with transported indices
would therefore have silently tested six of the ten equalities and returned a
pass on a weaker hypothesis set. The invariant form is also the form a Lean
statement takes, so the tool now emits groups directly (`--groups`).

**Smoke test first** (Guardrail 1): the group path re-derives the source
verdict, `base 1` over ℚ on `0d6996160cc83aab`, before any transported run was
believed. Cost 336.4 s against 2.1 s for the same ideal presented through
`--keep` — the generator form changes the Gröbner cost by two orders of
magnitude without changing the ideal, which is the labeling-dependent cost
already recorded for `slimgb` in this lane.

**The transport passes** (job `908f7cdf`, `char 0`, `base 1`, 2.1 s). The
prediction was falsifiable on four counts and landed on all of them: a
relabeling exists; it carries the collinear triple to `A0:A1:P0.4`, which is
where section 36 independently found the collinearity for this key; it carries
the distinctness to `P0.4 != P2.2`; and the transported ten equalities plus
that one distinctness force the determinant into the ideal over the rationals.
So the core is a statement about the orbit, not about one labeling.

**The certificate lift does not finish.** `liftstd` plus `lift` over ℚ on the
core (job `b2d4dbda`) ran 754.7 s and produced no output past the generator
count, so it never reached the cofactor matrix. This is a bounded negative and
it matches the earlier lift failures, but it now isolates the cost: on this
core `std` is a 2 s computation and `lift` exceeds 754 s, so the obstruction is
`lift` itself and not the basis. It does not weaken section 42 — membership
over ℚ is established by the zero normal form, which needs no cofactors. What
is still missing is an explicit checkable identity for a Lean replay.

Leaf unchanged: single `sorry`, `M = 18`.

### 44. Guardrail 2 audit of the angle encoder: the map is sound, the headline count was wrong (2026-09-03)

Guardrail 2 requires that a solver verdict stay CONJECTURE until somebody has
tried to break the map from the encoding to the mathematical claim. This is
that audit for the angle form (`kal_angles.py`) and the core miner
(`collinear_core.py`). It is read-only and uses no solver; the four
measurements below are exact rational arithmetic in a purpose-written
polynomial routine, independent of Singular.

**The determinant is the Lean function, not a lookalike.** `collinear_core.py`
forms `det = ((xb)-(xa))*((yc)-(ya)) - ((yb)-(ya))*((xc)-(xa))`.
`P97/Foundation.lean:75` defines
`signedArea2 v vj vk = (vj 0 - v 0) * (vk 1 - v 1) - (vk 0 - v 0) * (vj 1 - v 1)`.
With `(v, vj, vk) = (a, b, c)` these are the same polynomial, the two factors of
the second product being written in the other order. So the mined object is
literally `signedArea2 A0 A1 P1.1`, and `collinear_of_signedArea2_eq_zero`
applies to it with no adapter.

**The gauge neither loses nor gains configurations.** `structure()` establishes
that one apex `X` has both other apexes in its class and that each apex's class
contains its own cap, so every selected radius equals `d(A_X, A_Y)`. Sending
`A_X` to the origin, `A_Y` to `(1,0)` and that common radius to 1 is a
similarity; `signedArea2 = 0` is invariant under translation, rotation and
scaling, and changes only sign under reflection, which the free sign of `sf`
keeps in the variety. The scaling step needs `d(A_X, A_Y) ≠ 0`, which is the
label distinctness recorded below.

**The parameterization absorbs exactly thirteen of the pattern's equalities —
no more, and none silently added.** `{c_i² + s_i² − 1}` has pairwise coprime
leading terms, so it is a Gröbner basis and `c_i² → 1 − s_i²` is a canonical
normal form. Reducing each of the 27 pattern equalities against it, over all
111 patterns of the cell, gives 13 identically zero and 14 surviving, in every
single pattern. Thirteen is also the count predicted from the class structure
(5 from `A_X`'s six-member class, 4 from `A_Y`'s, 4 from `A_Z`'s), and 13 is
the number of circle relations. The three counts agree, which is what a
content-preserving change of coordinates should look like.

**Correction to sections 42 and 43.** The headline "ten of twenty-seven
equalities" overstates the reduction, because thirteen of those twenty-seven
are the radius-uniformity hypotheses that the parameterization still enforces —
they are carried, not dropped. For the source pattern `0d6996160cc83aab` the
identically-zero indices are `{12,13,14,15,17,18,19,20,22,23,24,25,26}` and the
core `{1,2,4,5,7,8,10,11,16,21}` meets that set in nothing, so the mined core
contains no free generator and the greedy result is honest. The accurate
statement is:

> the core keeps **ten of the fourteen non-trivial equalities**, on top of the
> thirteen radius equalities the gauge carries — a hypothesis set of 23
> equalities and one distinctness, against the pattern's 27 and none.

The four non-trivial equalities it drops are indices 0, 3, 6 and 9: one from
each of the four cap-2 blocker shells. So the core asks each blocker to be
equidistant from **three** of its four shell points, not all four. That
matches the invariant group form used for the transport, where the four shell
groups have three members each and the two apex groups have two.

**The core is a deletion-minimal core, not the deletion-minimal core.** Greedy
deletion tests generators in index order and keeps each successful drop, so the
dropped generator is the first of each shell as an artifact of that order. A
different order can produce a different ten-set. Sections 42 and 43 should be
read with "a core" throughout.

**Non-triviality falsifier: passed.** If `det` already vanished from the gauge
alone the whole result would be vacuous. Two hundred exact rational
configurations were built from random Pythagorean unit vectors, each checked to
satisfy all thirteen circle relations, and `det` was non-zero in 200 of 200. The
ten equalities are load-bearing.

**Distinctness is sound, and its cost is the exact-15 scope.** The Rabinowitsch
generator `u·d²(P1.1,P2.3) − 1` is satisfiable exactly when `P1.1 ≠ P2.3`, which
is the correct encoding. The justification for assuming it is that
`d1_mu0_incidence_census.py` labels the carrier directly — apexes are labels
0, 1, 2 and `interior(k) = (3+4k+s)` gives labels 3 through 14, fifteen indices
into a fifteen-element set — so all fifteen labels denote distinct points by
construction. The same fact supplies `A0`, `A1`, `P1.1` pairwise distinct, which
`ConvexIndep.not_three_collinear` needs, and `d(A_X, A_Y) ≠ 0`, which the
scaling gauge needs. All three ride on `D.A.card = 15`, so they inherit the
exact-15 gap section 40 already recorded. Nothing new is assumed here.

**A latent defect that does not bite on this cell.** `structure()` builds
`cls = {a: set(m) for a, m in pat.classes}`, so an apex carrying two classes
would keep only the later one and could raise a spurious "no unique special
apex". Measured over the cell: no apex has more than one class in any of the
111 patterns, and `structure()` rejects none of them, so no pattern was
silently excluded and every verdict in sections 36 through 43 covers the whole
cell. The defect would bite on a cell where an apex carries two radii — the
`2R` arms — and must be fixed before the tool is pointed at one.

**Verdict.** The encoding-to-claim map is sound at the encoded scope, with the
hypothesis count corrected as above. Guardrail 2 is discharged; the geometric
reading is no longer conjectural *at the encoded scope*, which is: this cell,
this orbit, `D.A.card = 15`, and Singular's `reduce` as the single engine.
Guardrail 7 is still open — no second engine has confirmed the membership — and
Guardrail 1 for the angle encoder is a self-consistency test, not a
known-answer test. There is still no Lean ingress.

Leaf unchanged: single `sorry`, `M = 18`.

### 45. The core covers the whole 36-orbit, by functoriality rather than by thirty-four more solver runs (2026-09-03)

> **Superseded by section 49.** The core is three equalities and three
> distinctness conditions; the ten-equality set was inflated by missing
> distinctness, not minimal.

Section 43 transported the core to one sibling labeling and checked it with
Singular. The plan's next step was recorded as "transport the core to the
remaining 34 members, each run about 2 s". That is the wrong instrument. The
transport does not need a solver at all, and running it 34 times would have
bought confirmation of something the group action already gives.

**Why relabeling carries the result.** What section 42 establishes, once the
gauge is unwound, is a statement about labeled configurations:

> for any planar configuration of the pattern's fifteen distinct points with
> its radius structure, if the ten core equalities hold and `P1.1 ≠ P2.3`, then
> `A0`, `A1`, `P1.1` are collinear.

A relabeling `σ` is a bijection on point names. Given a configuration that
satisfies the `σ`-image hypotheses, compose with `σ⁻¹` to get one satisfying
the source hypotheses; the source statement makes the source triple collinear
there; push forward again and the `σ`-image triple is collinear. Nothing in
that argument touches the coordinates, so it does not care that the angle
parameterization picks a different special apex for different members.

**What can actually fail is containment.** The argument needs the target
pattern to *assert* the `σ`-image of every core group, and to satisfy the gauge
precondition so its own radius structure is the one the statement assumes.
Both are finite combinatorial checks. `orbit_core_closure.py` runs them: for
each core group `(centre, point set)` it looks for a shell or class of the
target at that centre whose members contain the set, and it re-runs
`kal_angles.structure`.

**Result: 36 of 36 contained, no failures.** Every member of the orbit asserts
the full `σ`-image of the core and admits the gauge. The special apex is `A0`
for twelve members, `A1` for twelve and `A2` for twelve, so the check does
exercise all three coordinate assignments and not just the source's.

Two facts worth recording from the run. First, exactly 36 of the group's 82944
relabelings land inside the cell, one per member, so each member's transported
triple and distinctness pair are uniquely determined — there is no ambiguity to
resolve. Second, the member `72a0268b2d358aa0` is predicted to have triple
`{A0, A1, P0.4}` and distinctness `P0.4 : P2.2`, which is exactly what section
43's Singular run found. That run is now a passed falsifier for this tool
rather than one of thirty-five needed computations.

The orbit tally is unchanged in kind — this makes the 36-orbit's collinearity
uniform across its members, it does not refute a further orbit. Three of the
five orbits still rest on mod-`p` evidence only.

Leaf unchanged: single `sorry`, `M = 18`.

### 46. The certificate blocker is `liftstd`, not `lift`; and Guardrail 1 now has a known-answer test (2026-09-03)

**Correction to section 43.** That section read the failed characteristic-0
certificate run as "`std` is 2 s and `lift` exceeds 754 s, so `lift` is the
obstruction, not the basis". That diagnosis was wrong, and the mod-32003 rerun
shows why. The certify script prints `gens … basis …` immediately *after*
`liftstd` and before `lift`; neither run ever printed that line. So both died
inside `liftstd`, and `lift` was never reached. `lift` has not been shown to be
the obstruction, and is not currently known to be one.

Two runs, same script, different characteristic:

| characteristic | wall | exit | last output |
|---|---|---|---|
| 0 | 754.7 s | `null` | `metric 27` |
| 32003 | 296.9 s | `null` | `metric 10` |

`exit_code: null` in both receipts means the process was killed rather than
returning. The informative part is that mod 32003 died **sooner** than
characteristic 0, on a smaller generating set. If the blow-up were coefficient
growth over ℚ, the modular run would have been the cheap one and would have
finished. It was not, so the cost is in the size of the transformation matrix
itself — the number of monomials Singular must carry — and not in the
arithmetic. That also means a targeted dense characteristic-0 cofactor search,
which section 43 listed as an untried option, is attacking the wrong quantity.

**What is being tried now.** `liftstd` was called under `option(redSB)`, which
makes it compute a *reduced* standard basis together with the transformation
matrix. That is much more expensive than the basis alone, and no verdict in
this lane needs a reduced basis. `collinear_core.py` gains a `--noredsb` flag
and a `built` progress print, and the mod-32003 certificate is running again
without `redSB`. If it also dies inside `liftstd`, the transformation-matrix
route is exhausted at this shape and a Lean-checkable identity needs a
different form — not a bigger budget.

**Guardrail 1 now has a real test.** Section 44 recorded, as its own weakest
point, that the only Guardrail 1 evidence for the angle encoder was a
self-consistency check, which cannot catch an error shared by both code paths.
`gauge_known_answer.py` supplies the missing known-answer test with no solver.
The parameterization claims that fifteen specific distances — special apex to
each other apex, and each apex to its own four cap points — are exactly the
common radius. Each of those squared distances must therefore reduce to the
constant 1 modulo the circle relations, identically in the twenty-six
coordinates. A wrong rotation, a wrong centre, or a cap attached to the wrong
apex would each show up as a normal form other than 1.

Result: **1554 checks over all 111 patterns, no failures.** Guardrail 1 is now
discharged for the angle encoder on an answer known in advance, not on
agreement between two of its own modes.

**A reframing worth recording.** Each three-member core group says a point is
equidistant from three others, so it is a circumcenter condition, and each
two-member apex group is a perpendicular-bisector condition. The core therefore
reads: four circumcenter conditions and two perpendicular-bisector conditions
force three points collinear. That is a classical-geometry statement, and it is
a far better Lean target than a cofactor identity, because the repository
already proves in this idiom — `ConvexPerpendicularBisectorSides.perpBisector_carrier_card_le_two`
and `false_of_three_distinct_equidistant_carriers` are exactly perpendicular-bisector
counting arguments. No route is claimed here; the point is that the certificate
is not the only shape an ingress could take, and it is currently the blocked one.

Leaf unchanged: single `sorry`, `M = 18`.

### 47. The certificate route is the wrong shape, not merely over budget (2026-09-03)

The `--noredsb` retry from section 46 died the same way: the new `built` print
appeared, so the ideal was constructed, and then `liftstd` was killed at 308.4 s
without reaching `gens … basis …`. Removing `option(redSB)` changed nothing.
The transformation-matrix computation now has four independent failures — two
characteristics, two generating sets, with and without `redSB` — and no run has
ever reached `lift`.

**Why, measured in 1.5 s.** A `--basisinfo` mode reports the standard basis the
cofactors would be expressed against:

| quantity | value |
|---|---|
| `dim` | 5 |
| basis size | 138 |
| basis max degree | 4 |
| basis monomials | 1701 |
| `member` | 1 |

So `std` on this ideal is 1.5 s and returns a 138-element basis, while
`liftstd` on the *same* ideal cannot finish: what dies is not the basis but the
24 × 138 matrix of polynomials expressing it in terms of the inputs. That is
the whole diagnosis, and it is now a measurement rather than an inference.

**The conclusion is about shape, not budget.** The reason to want cofactors was
a Lean-checkable identity `det = Σ gᵢ·fᵢ`, verified by expansion with no
Gröbner basis. An identity whose cofactor data Singular cannot construct is not
one Lean would check by `ring` either — the two costs are the same polynomial
arithmetic. Raising the budget therefore does not help, and neither does the
targeted dense characteristic-0 search section 43 proposed. This is consistent
with the earlier evidence already recorded as not-to-be-repeated: the
`cert_search_orient` dense searches at degrees 0–1 unrestricted and 0–2
restricted were all inconsistent, which is evidence that no *small* certificate
exists against these generators.

Two things this does not say. It does not weaken the membership: `member 1`
here re-reports it on the core, and section 42's characteristic-0 verdict
stands on a zero normal form, which needs no cofactors. And it does not prove
no small certificate exists — only that nothing in this lane can find one, and
that the low-degree searches that could have found one did not.

**One further fact worth keeping.** `dim 5` says the core's variety is
five-dimensional. The forced collinearity is therefore not a rigidity
phenomenon — the core does not pin the configuration to finitely many shapes
and then observe three points in a line. It cuts out a positive-dimensional
family on which the determinant vanishes identically. Any synthetic proof
should be expected to look like an identity between distances, not like a
classification of configurations.

**Direction.** The certificate route is closed at this shape. The reframing
recorded in section 46 is now the live one rather than a fallback: the core is
four circumcenter conditions and two perpendicular-bisector conditions, and the
repository already proves in that idiom
(`ConvexPerpendicularBisectorSides.perpBisector_carrier_card_le_two`,
`false_of_three_distinct_equidistant_carriers`). That is a direction to
explore, not a route that has been shown to exist.

Leaf unchanged: single `sorry`, `M = 18`.

### 48. Reuse preflight for the circumcenter reading: the nearest proved theorem does not fire (2026-09-03)

Section 47 made the circumcenter reframing the live direction, so this is the
bounded reuse preflight for it, recorded before any derivation.

**Search key.** "A point equidistant from three named points, in the TriApex
`mu = 0` cell, with the core's four cap-2 centres." Corpus:
`erdos-97-96-formalization-lean`.

**Candidates.** The closest proved statements are
`Rigid221SourceHeavy.false_of_capInterior_center_equidistant_three_points`
(`lean/…/FrontierLiveClosure/Rigid221SourceHeavy.lean:3745`),
`U5GlobalIncidenceBasic.eq_of_equidistant_three_noncollinear` (two centres
equidistant from the same three noncollinear points coincide), `Moser.NonDeg`
(three distinct points equidistant from a common centre are not collinear), and
`N4d.SmallSReductions.eq_of_dist_eq_three_of_pairwise_ne`.

**First missing antecedent, for the nearest candidate.**
`false_of_capInterior_center_equidistant_three_points` requires all four of
`d, c, a, b` to lie in the interior of **one** cap
(`hd hc ha hb : _ ∈ S.capInteriorByIndex i`). Every core group fails that
hypothesis, and not marginally — each one mixes caps:

| centre | group | why it fails |
|---|---|---|
| `P2.1` | `A0, P1.1, P2.3` | `A0` is an apex, `P1.1` is cap-1 interior |
| `P2.2` | `P0.3, P2.1, P2.4` | `P0.3` is cap-0 interior |
| `P2.3` | `P0.1, P2.2, P2.4` | `P0.1` is cap-0 interior |
| `P2.4` | `A1, P1.2, P2.1` | `A1` is an apex, `P1.2` is cap-1 interior |

So the theorem does not fire on the core, and no rearrangement of the core's
groups makes it fire. This is expected rather than surprising: the incidence
census already images this theorem as a hard clause, so every pattern that
survived to the metric layer avoids its hypotheses by construction. Chasing it
here would be re-deriving a cut the census already applied.

**Consequence for the direction.** The useful candidates are the ones that
*produce* facts from an equidistance rather than refute it — `Moser.NonDeg`
gives non-collinearity of each core group's three points, and
`eq_of_equidistant_three_noncollinear` gives circumcenter uniqueness. Whether
those compose into the target collinearity is open and is not claimed here.

**Preflight scope.** This key is now spent. Re-run it only if the candidate
statement, the ingress, the consumer, or the relevant source revision changes.

Leaf unchanged: single `sorry`, `M = 18`.

### 49. The core is three equalities and three distinctness conditions, and it has a synthetic proof (2026-09-03)

Following section 47's direction produced a much stronger result than a
reframing. The ten-equality core of sections 42–45 was not near-minimal; it was
inflated, and the reason is instructive.

**The circle collapse.** In this pattern the special apex is `A2`, so `A0`,
`A1` and all four cap-2 interior points lie at distance `r` from `A2` — six of
the core's points on one circle `C2`. On a circle, a point is equidistant from
two others exactly when it is an arc midpoint of their chord. Every core group
whose members both lie on `C2` is therefore an arc-midpoint condition, and the
four cap-2 groups form a chain that solves in closed form. Putting `A1` at
angle 0, the chain gives `P2.1 = (8a₀+3a₁)/11` and then forces
`a₀ − a₁ = ±11π/15`, at which point all six angles are integer multiples of
`π/15`:

| point | `A1` | `P2.4` | `P2.3` | `P2.2` | `P2.1` | `A0` |
|---|---|---|---|---|---|---|
| angle | `0` | `4π/15` | `5π/15` | `6π/15` | `8π/15` | `11π/15` |

Both apex conditions reduce to the *same* equation `5(a₀−a₁)/11 = ±π/3`, which
is a good sign the encoding is coherent rather than over-determined. All chain
and apex checks hold to 1e-61 at 60 digits.

**What that exposes.** `A1`'s core group says `d(A1,P2.3) = d(A1,A2) = r`, so
`P2.3` lies on `C1 := circle(A1, r)` — the same circle as `P1.1`. And `P2.1`'s
group says `P1.1` and `P2.3` are both at distance `d(P2.1,A0)` from `P2.1`, so
both lie on `K := circle(P2.1, d(P2.1,A0))`, which also passes through `A0`.
So **`P1.1` and `P2.3` are the two intersection points of one circle pair**, and
that is exactly what the distinctness hypothesis is for. Computing both
intersections at the configuration above: one has
`signedArea2(A0,A1,·) = −3.9e-61`, and the other is `P2.3` itself to 2.8e-61.
The same holds with the labels exchanged on the `a₀ = −11π/15` branch.

**The synthetic argument.** `A1` is the centre of `C1` and `P2.1` the centre of
`K`, so both are equidistant from `P1.1` and `P2.3`; the line `A1P2.1` is the
perpendicular bisector of `P1.1P2.3`, and reflection across it preserves both
circles, hence permutes `C1 ∩ K = {P1.1, P2.3}`. It cannot fix both: that would
put both on the mirror line with `A1` and `P2.1` each their midpoint, forcing
`A1 = P2.1`. So it swaps them. Since `A0`, `A1`, `P2.1`, `P2.3` all lie on `C2`
and `P2.1` is an arc midpoint of chord `A0P2.3`, the chord `A1P2.1` is a
bisector of the inscribed angle `∠A0 A1 P2.3` — internal or external according
to which arc midpoint `P2.1` is, which does not matter, because either way the
reflection carries ray `A1→P2.3` onto the **line** `A1A0`. As `P2.3` is at
distance `r` from `A1`, its image `P1.1` is at distance `r` from `A1` on that
line. Hence `A0`, `A1`, `P1.1` are collinear. ∎

**Verified hypothesis set.** The argument uses only two of the six core groups,
so the subset was tested directly. Over ℚ, three metric equalities

- `d(P2.1,A0) = d(P2.1,P1.1)`
- `d(P2.1,A0) = d(P2.1,P2.3)`
- `d(A1,A2) = d(A1,P2.3)`

with three distinctness conditions `P1.1 ≠ P2.3`, `A1 ≠ P2.1`, `A0 ≠ P2.3`
give `base 1` in 1.6 s. Every one of the six is individually necessary:
dropping any equality gives `drop … 0`, and dropping any distinctness gives
`base 0`.

**Why the greedy core was inflated.** With only `P1.1 ≠ P2.3` supplied, the
three-equality subset gives `base 0` — not because the geometry fails, but
because the ideal still carries components on which labels coincide (`A1 =
P2.1` makes the two circles concentric; `A0 = P2.3` degenerates the chord). The
determinant genuinely does not vanish there. Greedy deletion therefore kept
seven further equalities whose only job was to cut those components away. The
distinctness conditions do it directly and are free, since the census label
bijection makes all fifteen labels distinct points. **Supersedes the core of
sections 42–45: three equalities, not ten of fourteen.**

**Claim scope.** The hypothesis-set sufficiency is a Singular verdict over ℚ,
one engine, at the exact-15 encoded scope — the same trust level as section 42,
no better. The synthetic argument above is a proof sketch of my own and has had
no adversarial audit and no formalization; it is not promoted, and the numeric
configuration is a witness, not a proof. What has changed is tractability: a
Lean ingress must now discharge three equalities and three distinctness
conditions through two classical steps, instead of reproducing a cofactor
identity that section 47 showed cannot be built.

Leaf unchanged: single `sorry`, `M = 18`.

### 50. The section 49 route audited, generalized, and carried into Lean (2026-09-03)

Section 49's argument survives audit, but three things about it were wrong or
understated, and the Lean route it proposed is not the one to take.

**Audit of the synthetic argument.** Stated gauge-free, the claim is: `A0`,
`A1`, `P2.1`, `P2.3` on a circle of centre `A2` and radius `r`; `P1.1` and
`P2.3` equidistant from `A1`; `A0`, `P1.1`, `P2.3` equidistant from `P2.1`;
`P1.1 ≠ P2.3`, `A1 ≠ P2.1`, `A0 ≠ P2.3`. Then `A0`, `A1`, `P1.1` are
collinear. Sampling this at 60 digits, with `P1.1` obtained by solving the
circle pair rather than by reflecting `P2.3` (reflecting would assume the step
under audit), gives 16000 configurations with no violation and worst
`|signedArea2|` of 6e-57. So the argument's hypothesis usage is sound: it needs
only two of section 49's six groups, and no gauge fact beyond them.

**Generalization: the radius tie is not needed.** Section 49 obtains
`d(A1,P1.1) = d(A1,P2.3) = r` by combining the mined equality
`d(A1,A2) = d(A1,P2.3)` with the gauge. But step 1 of the argument needs only
that `A1` is equidistant from `P1.1` and `P2.3`; the common value is free, and
`A1`'s chord to `P2.3` never has to have length `r`. Re-running with `A1` free
on the circle and that common distance unconstrained: 12000 configurations, no
violation, worst 6e-57. The mined equality's whole role is to deliver
equidistance, not a radius.

**Correction to the necessity claim.** Section 49 called all six hypotheses
individually necessary on the strength of Singular `base` drops. That is an
ideal-theoretic statement and does not by itself say the geometric statement
fails. A random sweep cannot settle it either — dropping `A0 ≠ P2.3` or
`A1 ≠ P2.1` changes nothing under sampling, because random configurations never
land on a measure-zero locus. A first probe of mine compounded this by pinning
`P2.1` to the antipode on the `A0 = P2.3` locus, where the arc-midpoint
condition is vacuous and `P2.1` must instead be swept freely; it reported no
counterexample and was wrong. Sweeping `P2.1` free gives 3000 counterexamples
out of 3000, worst `|signedArea2|` 4.0. `A1 = P2.1` makes the two circles
concentric and coincident, leaving `P1.1` unconstrained. So all three
disequalities are necessary for the geometric statement too — but that is now
established by construction, not inferred from an ideal drop.

**The internal/external hand-wave removed.** Section 49 had to wave through
whether `P2.1` is the near or far arc midpoint ("which does not matter"). In
complex coordinates it genuinely does not, and provably so. Normalizing to the
unit circle and writing `a, b, k, p` for `A0, A1, P2.1, P2.3`, the arc-midpoint
condition is exactly `k² = a·p`, which covers **both** midpoints in one
equation. Reflection across the chord joining unit points `u, v` is
`z ↦ u + v − u·v·conj z`, so `P1.1 = b + k − a·b/k`, and

    (P1.1 − a)/(b − a) = 1 + w,   w = (k² − a·b)/(k·(b − a))

with `conj w = w` because `conj x = 1/x` on the unit circle. The branch case
split disappears into the squaring. Checked against an independent circle-circle
solve at 50 digits: `|k² − a·p|` 2e-50, formula against solved root 2e-48,
`|w − conj w|` 9e-45.

**The Lean route is algebraic, not synthetic.** A reuse preflight over this
project and mathlib returns nothing for the argument's second step. Mathlib has
no arc-midpoint concept at all, no angle-bisector API, and no equal-chords /
equal-angles lemma; the inscribed-angle theorem is present
(`EuclideanGeometry.Sphere.oangle_center_eq_two_zsmul_oangle`) but is mod π and
would need a `signedArea2` side pin. The first step fares better —
`Problem97.twoCircle_midpoint_collinear` and `signedArea2_reflection_neg` in
`U2/WitnessReflectionKernel.lean` already give it in `signedArea2` form — but
building step 2 from scratch is the bulk of the work. A polynomial certificate
avoids step 2 entirely.

**Certificate.** Over ℚ with the centre at the origin, the four circle
memberships plus the arc-midpoint equality generate an ideal in which the signed
area is not a member on its own, but is after multiplication by the three
squared distances, at exponent `(1,1,1)` and no lower. Keeping `P1.1` as a
variable, `lift` succeeds — unlike section 47's system — but yields 7 cofactors
of degree 6 and 4476 terms; substituting the reduced generator
`(P1.1−P2.3)·(A1−P2.1)` for one difference barely helps (3837). Eliminating
`P1.1` instead, by certifying the explicit reflection point cleared of its
denominator, drops the system to 5 generators, `dim 4`, basis 11, and the
certificate to **5 cofactors of degree 4 and 242 terms**, `verify 1` — an
18-fold reduction. Runs: `cb58c926`, `ecabbc67`, `2c2db6f0`, `a22340e6`,
`3015c2df` (piqd Singular lane, char 0).

**No two-circle uniqueness needed.** Working the algebra out removes the last
dependency. With `u = B − K` and `m = R + P − 2K`, the two distance hypotheses
give `(R−P)·u = 0` and `(R−P)·m = 0`; in the plane `R ≠ P` forces `u ∥ m` via
the identity `v₁·cross(u,m) = (u·v)m₂ − (m·v)u₂` and its partner; and the planar
identity `‖u‖²m = (m·u)u + cross(u,m)·u^⊥` then pins `‖u‖²(R−K)` outright. So
the file needs neither `two_circle_third_point_eq` nor an explicit second
intersection point.

**Lean.** `lean/Erdos9796Proof/P97/ATail/ArcMidpointReflectionCollinear.lean`
states `Problem97.signedArea2_eq_zero_of_arcMidpoint_twoCircle` over `ℝ²` in
`dist`/`signedArea2` vocabulary and proves it through the coordinate lemma and
the certificate. The certificate is re-checked by `ring` inside
`linear_combination`, so the file carries no solver trust: Singular supplied the
cofactors, Lean verifies the identity.

**Orbit.** Re-running the section 45 containment against the two-group core
gives 36/36 with zero failures, `P2.1` matched by a shell and `A1` by a class on
every member. This is a consistency check, not new evidence: the orbit size does
not depend on the core, and the new core is a subset of the old one, so a
run that was already 36/36 could not have come out otherwise.

**Independent read.** ProofRelay97 (#9558) reached the same reusable statement
and the same reuse verdict — no circle-intersection plus arc-midpoint
collinearity theorem in the corpus — and confirms the disequalities remove
exactly the degenerate circle and chord cases.

**Claim scope.** The Lean theorem is a general plane-geometry fact and is proved
outright; it is not a claim about the TriApex leaf. What still does not exist is
the ingress: deriving the four circle memberships, the three equalities and the
three disequalities from the live hypotheses `D, G, Q`. Until that exists this
is infrastructure, and section 40's four gaps stand unchanged.

Leaf unchanged: single `sorry`, `M = 18`.
