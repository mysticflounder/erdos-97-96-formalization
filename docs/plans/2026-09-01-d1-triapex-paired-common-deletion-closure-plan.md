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
| `J : PairedApexClassJointDeletion O` | `source` on `Γ(oppApex1, sourceRadius)`, class card `≥ 4`, omitted by both retained shells, two packets: `A \ {source}` keeps K4 at `oppApex1`, `c(kept)`, `c(deleted)` (`ATail/PairedCommonDeletionNormalForm.lean:93`) | `source ≠ kept, deleted`; `c(source) ∉ {c(kept), c(deleted)}` (`:140`, `:154`); four pairwise-distinct centres `oppApex1, c(kept), c(deleted), c(source)`. Both live producers set `sourceRadius := radius` (`TriApexEndpointRetainedOmission.lean:2012`, `PairedCommonDeletionNormalForm.lean:556`); `J` never records `sourceRadius ≠ radius` |
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
four-row at the first apex containing `J.source`, from `J` and `G` alone.
This is the "smallest helper" the 2026-08-23 audit asked for; it exists and
is unconsumed. Phase 1 item L6 wires it.

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
the Phase 1 controls are needed in every outcome and are cheap.

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

Cells at `i`:

- `oneRadius` at `i`: safe count `s ∈ {2, 3, 4}` on one radius (3 cells);
- `twoRadii` at `i`: safe pair `(s₁, s₂)` on the two two-point slices with
  `s₁ + s₂ ≥ 2`: `(2,2), (2,1), (1,2), (2,0), (0,2), (1,1)` (6 cells). The
  cell `(1,1)` is the transverse saturation of item 2 above; every other cell
  carries a same-radius safe pair.

Measure `M` = number of (cardinality class, cell) pairs not covered by a
checked terminal or replayed certificate, with cardinality classes
`{15, ≥ 16}`. At base head `M = 18`. A checkpoint counts as proof progress
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
  `{kept, deleted}` again; `K` may contain them.
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
coincide; one encoding suffices.

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
- SAT models are read back and replayed in exact rational arithmetic; a model
  that fails replay is not a witness.
- UNSAT is reported only at scope `card = 15`.

Decision rule:

- a cell metrically SAT with every hypothesis encoded and an exact rational
  witness: that cell does not close from its binders at 15. Stop, report, and
  propose an upstream re-split. First re-split candidate: retain the dropped
  provenance of Section 2 in `J` at both adapters (reverse-hit order,
  betweenness, acuteness; source-return U5 rows), because those facts are
  already proved and cost no new obligation.
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
  15 is the tight case, in the direction the plan assumed (review question
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

- 3a same-radius cells (all but `(1,1)`): after L5, wire
  `finFour_exists_nearby_mutualFalse_of_card_le_two` and the interval
  descent. The descent terminals (`μ = 0` fixed point, disjoint `K2,2` plus
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
recorded). Phase 3, two to four. Phase 4, unknown, at least three.
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
