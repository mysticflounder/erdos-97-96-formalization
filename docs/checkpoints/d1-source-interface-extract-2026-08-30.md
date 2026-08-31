# D1 source/interface extract — 2026-08-30

Status: **SOURCE AUDIT / INTERFACE INVENTORY**. This packet does not claim a new proof.

## Repository snapshot and provenance

- Source revision inspected: `020e43bfc328879dfdc7d8a558a80fbdbdff2438`.
- At extraction time, `HEAD`, local `main`, local `origin/main`, and the remote `refs/heads/main` all resolved to that hash.
- Previously recorded D1 inspection revision: `54e8273` (23 August 2026). It is an ancestor of the inspected revision; `main` has advanced by 152 commits.
- The checkout was **not clean before this packet was created**: 50 status entries, comprising 23 tracked changes and 27 untracked paths, including 2 tracked deletions. The D1 source file, `CapSelectedRowCounting.lean`, and `ExactFifteenApexProfile.lean` themselves were clean.
- Lean toolchain: `leanprover/lean4:v4.27.0`.
- Repository root: `/Users/adam/projects/math-projects/erdos-97-96-formalization`.
- Lean/Lake root: `lean/`.
- No build was run. This is a current-source and dependency/interface extraction.
- The project Lean corpus was indexed at the inspected source revision. Exact signatures below were checked against the working-tree source, not copied from the index snippets.

## Executive answer

1. The live D1 root is `false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core` at `TriApexEndpointRetainedOmission.lean:2028`. Its body is exactly `sorry`.
2. Its only direct code caller is `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core` at line 2054.
3. The reverse-hit route still has `reverse_mem`, exact reverse-row/cap intersection, reverse-blocker strict-cap localization, and a proved ordered-cap strict-betweenness theorem. The adapter that constructs `PairedApexClassJointDeletion` passes only `reverse_mem`; none of the order object, the strict-betweenness witness, or the exact reverse-row/cap equality is stored in `J`, `G`, or `Q`.
4. `CrossApexExactFourPaired`, `ExactNonFirstSaturation`, and `TransverseTwoRadius` are not Lean declarations and do not have prose field contracts. They occur only as three proposed constructor names in the 23 August consolidation audit.
5. Exact fifteen proves every indexed strict interior has cardinality four and proves the two-radius `2+2` slice partition. It does not currently package `W.supportAt i = S.capInteriorByIndex i`, nor a `Fin 4` order of that interior.
6. The only live “low span” theorem is the pure finite graph kernel on `Fin 4`. There is no Lean interval-potential `μ`, cap-order lift, `SR-MU0` packet, or `SR-K22` packet.
7. The exact-15 four-row and Kalmanson consumers are real, but their boundary embeddings, row-membership tables, and named order/equality hypotheses are absent from D1. No current declaration consumes “seven distinct survivor centers plus one failure center.”

## 1. Live D1 theorem, real caller, and provenance loss

### Defining module and imports

File: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean`.

Direct imports:

~~~lean
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Legacy.Rigid221Wrappers
import Erdos9796Proof.P97.ATail.AllLargeCapCanonicalInterfaces
import Erdos9796Proof.P97.ATail.SourceFaithfulSelectedFourFan
import Erdos9796Proof.P97.ATail.SecondRadiusMutualCrossMembership
import Erdos9796Proof.P97.ATail.EndpointFreshTwoShellSeed
import Erdos9796Proof.P97.ATail.ExactFourAdjacentGridKalmanson
import Erdos9796Proof.P97.ATail.FourVertexLowSpan
import Erdos9796Proof.P97.ATail.PairedCommonDeletionNormalForm
import Erdos9796Proof.P97.ATail.TriApexFiveSurviveOneFail
import Erdos9796Proof.P97.ATail.TwoRadiusGridCapBoundarySigns
import Erdos9796Proof.P97.ATail.TwoRadiusGridCoordinateGeometry
import Erdos9796Proof.P97.ATail.TwoRadiusGridConvexNesting
import Erdos9796Proof.P97.ATail.TwoRadiusGridEscapeSynchronization
import Erdos9796Proof.P97.ATail.TwoRadiusGridZeroCutAssembly
~~~

### Exact live declaration

Anchor: `TriApexEndpointRetainedOmission.lean:2028-2040`.

~~~lean
theorem false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (G : TriApexAllLargeContext D S)
    (Q : TriApexFiveSurviveOneFail S H O.kept O.deleted
      O.kept_mem_A O.deleted_mem_A) :
    False := by
  sorry
~~~

### Only direct caller

Anchor: `TriApexEndpointRetainedOmission.lean:2054-2070`.

~~~lean
theorem false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (G : TriApexAllLargeContext D S) :
    False := by
  let Q : TriApexFiveSurviveOneFail S H O.kept O.deleted
      O.kept_mem_A O.deleted_mem_A :=
    triApexFiveSurviveOneFailOfApexRich S H O.kept O.deleted
      O.kept_mem_A O.deleted_mem_A D.convex G.apex_rich
  exact
    false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
      J G Q
~~~

This caller constructs `Q` solely from `S`, `H`, the two retained sources, convexity, and `G.apex_rich`. It does not recover any reverse-row trace or boundary order.

The caller itself has two direct callers:

- `false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core`, lines 2076-2092;
- `false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core`, lines 2569-2597.

The publication-facing chain then continues through:

~~~text
false_of_retainedInteriorDirectedOmission_triApexAllLargeContext  (line 4373)
  -> false_of_retainedOmission_triApexAllLarge_core               (line 4345)
     -> paired / reverse-hit-fresh wrappers
        -> false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core
           -> false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
~~~

### Hypotheses before flattening into J, G, and Q

The exact reverse split is `RetainedReverseCouplingOutcome O` in
`RetainedMatchingLargeCapConsumer.lean:278-301`. Its reverse-hit constructor stores:

~~~lean
| reverseHit
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reverseBlocker_mem_capInterior :
      H.centerAt O.deleted O.deleted_mem_A ∈
        S.capInteriorByIndex S.oppIndex1)
    (reverseShell_inter_cap_eq :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted})
~~~

The later `RetainedOmissionAllLargeNormalForm` reverse-hit-fresh arm also stores:

- the same three reverse facts;
- a fresh point in the first strict cap;
- distinctness from both retained sources;
- nonmembership in the reverse shell;
- a full `CommonDeletionTwoCenterPacket` for the fresh deletion.

The paired constructor, by contrast, stores `reverse_omission` and a reverse `CommonDeletionTwoCenterPacket`. The D1 paired route then calls `nonempty_pairedCommonDeletionOutcome`; its apex-class arm stores only `PairedApexClassJointDeletion`.

### Where the requested facts are lost

| Fact | Present upstream | Exact loss point / D1 status |
|---|---|---|
| `reverse_mem` | `RetainedReverseCouplingOutcome.reverseHit` and the reverse-hit normal form | Passed to `nonempty_pairedApexClassJointDeletion_of_reverseHit`, but omitted from the `PairedApexClassJointDeletion` literal at lines 2011-2020. It is not a field of `J`. |
| Reverse-row exact support trace | `reverseShell_inter_cap_eq` gives full reverse shell ∩ first closed cap = `{kept, deleted}` | Not passed to the reverse-hit J producer and absent from `J/G/Q`. |
| Reverse-row center trace | `actualRow_center_eq_reverseBlocker_of_reverseHit`, `RetainedMatchingLargeCapConsumer.lean:412-429` | No D1 caller in the target module uses it. |
| Strict reverse-blocker betweenness/order | `exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit`, lines 479-577 | Consumed by `reverseHit_twoCenter_sqdist_acute`, but neither the ordered cap nor indices/betweenness are forwarded to D1. |
| Kept/deleted first-apex radius equality | Reconstructible from `O.kept_mem_radius` and `O.deleted_mem_radius`; explicitly derived in the reverse-hit geometry | The standalone equality and its derivation proof are not stored in `J`, but remain reconstructible from `O`. |
| Fresh source outside reverse row | `exists_fresh_firstCap_commonDeletion_of_reverseHit` and the reverse-hit-fresh normal form | The fresh wrapper later calls the joint-deletion wrapper using `reverse_mem`; it does not forward fresh-source fields to the D1 root. |
| Fresh source outside both retained rows | Paired escape construction in `PairedCommonDeletionNormalForm.lean:724-756` | Retained as `J.source_not_mem_keptShell` and `J.source_not_mem_deletedShell`. This is not reverse-row freshness. |
| Physical exact-four packet rows | `CommonDeletionTwoCenterPacket` stores both rows, exact row/cardinality data, and overlap information | Still present inside `O.packet`, `reversePacket`, `J.keptPacket`, and `J.deletedPacket`. |
| Stronger U5 physical ingress | `RetainedSourceReturnJointU5Ingress` stores dangerous/actual rows and blockers | The paired normal form calls the weaker `nonempty_sourceReturnRadiusOutcome`, not `nonempty_sourceReturnU5Outcome`; dangerous/blocker/actual-row fields are dropped at `PairedCommonDeletionNormalForm.lean:550-563`. |

### Exact reverse strict-order theorem

Anchor: `TriApexEndpointRetainedOmission.lean:479-511`.

~~~lean
theorem exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reverseBlocker_mem_capInterior :
      H.centerAt O.deleted O.deleted_mem_A ∈
        S.capInteriorByIndex S.oppIndex1)
    (reverseShell_inter_cap_eq :
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted}) :
    ∃ (m : ℕ) (L : CGN.OrderedCap m)
      (Packet : CGN.MecCapPacket D.A L)
      (Hside : CGN.MinorCapSideHypotheses Packet)
      (Hord : CGN.StrictCapOrder D.A L)
      (j r s : Fin m),
        Finset.univ.image L.points = S.capByIndex S.oppIndex1 ∧
        L.points r = O.kept ∧
        L.points s = O.deleted ∧
        L.points j = H.centerAt O.deleted O.deleted_mem_A ∧
        ((r < j ∧ j < s) ∨ (s < j ∧ j < r))
~~~

Its generic engine is `CGN.index_strictly_between_of_equidistant` in
`CapSelectedRowCounting.lean:51`:

~~~lean
theorem index_strictly_between_of_equidistant
    {A : Finset ℝ²} {m : ℕ} {L : OrderedCap m}
    (Packet : MecCapPacket A L)
    (Hside : MinorCapSideHypotheses Packet)
    (Hord : StrictCapOrder A L)
    {j r s : Fin m}
    (hrs : r < s) (hjr : j ≠ r) (hjs : j ≠ s)
    (heq : dist (L.points j) (L.points r) =
      dist (L.points j) (L.points s)) :
    r < j ∧ j < s
~~~

All three points are indices of one complete `OrderedCap L`. No consecutiveness of `r,s` is assumed. The theorem needs only strict index order, distinctness from the blocker index, and equal distances; `StrictCapOrder` supplies the cap geometry.

### Verbatim source context: 100 lines before and after the D1 declaration

The following is the exact current source span `TriApexEndpointRetainedOmission.lean:1928-2128`. It contains the reverse-hit J adapter, the live D1 root, its direct caller, and the reverse-hit wrapper.

~~~lean
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    Nonempty (PairedApexClassJointDeletion O) := by
  classical
  let C := SelectedClass D.A S.oppApex1 radius
  let K :=
    (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support ∩ C
  let M :=
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩ C
  have hKcard : K.card ≤ 2 := by
    simpa only [K, C] using
      ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two
        R O.kept O.kept_mem_A
  have hMcard : M.card ≤ 2 := by
    simpa only [M, C] using
      ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two
        R O.deleted O.deleted_mem_A
  have hcommon : O.kept ∈ K ∩ M := by
    refine Finset.mem_inter.mpr ⟨?_, ?_⟩
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.q_mem_support,
          O.kept_mem_radius⟩
    · exact Finset.mem_inter.mpr ⟨reverse_mem, O.kept_mem_radius⟩
  have hinterPos : 0 < (K ∩ M).card :=
    Finset.card_pos.mpr ⟨O.kept, hcommon⟩
  have hcardIdentity := Finset.card_union_add_card_inter K M
  have hunionCard : (K ∪ M).card ≤ 3 := by
    omega
  have hnotSubset : ¬ C ⊆ K ∪ M := by
    intro hsubset
    have hcardLe := Finset.card_le_card hsubset
    have hCcard : 4 ≤ C.card := by
      simpa only [C] using R.frontierRadius_class_card_ge_four
    omega
  rcases Finset.not_subset.mp hnotSubset with
    ⟨source, hsourceClass, hsourceOutside⟩
  have hsourceNotKept :
      source ∉
        (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support := by
    intro hsource
    apply hsourceOutside
    exact Finset.mem_union.mpr
      (Or.inl (Finset.mem_inter.mpr ⟨hsource, hsourceClass⟩))
  have hsourceNotDeleted :
      source ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    intro hsource
    apply hsourceOutside
    exact Finset.mem_union.mpr
      (Or.inr (Finset.mem_inter.mpr ⟨hsource, hsourceClass⟩))
  have hsourceA : source ∈ D.A :=
    (mem_selectedClass.mp hsourceClass).1
  have hfirstSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives source hsourceA
  have hkeptSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source)
        (H.centerAt O.kept O.kept_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H O.kept_mem_A).mpr hsourceNotKept
  rcases nonempty_commonDeletionTwoCenterPacket H
      hsourceA (oppApex1_mem_A_for_reverseHit S) O.packet.center₂_mem_A
      O.packet.centers_ne hfirstSurvives hkeptSurvives with
    ⟨keptPacket⟩
  have hdeletedBlockerA :
      H.centerAt O.deleted O.deleted_mem_A ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt O.deleted
        O.deleted_mem_A).toCriticalFourShell.center_mem).2
  have hdeletedCentersNe :
      S.oppApex1 ≠ H.centerAt O.deleted O.deleted_mem_A :=
    (R.actualBlocker_ne_firstApex O.deleted O.deleted_mem_A).symm
  have hdeletedSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source)
        (H.centerAt O.deleted O.deleted_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H O.deleted_mem_A).mpr hsourceNotDeleted
  rcases nonempty_commonDeletionTwoCenterPacket H
      hsourceA (oppApex1_mem_A_for_reverseHit S) hdeletedBlockerA
      hdeletedCentersNe hfirstSurvives hdeletedSurvives with
    ⟨deletedPacket⟩
  exact ⟨{
    sourceRadius := radius
    sourceRadius_pos := F.radius_pos
    sourceClass_card_ge_four := R.frontierRadius_class_card_ge_four
    source := source
    source_mem_class := hsourceClass
    source_not_mem_keptShell := hsourceNotKept
    source_not_mem_deletedShell := hsourceNotDeleted
    keptPacket := keptPacket
    deletedPacket := deletedPacket }⟩

/-- Residual contradiction after the tri-apex witness count has produced four
strict sources with the full five-survive/one-fail deletion signature.

The producer is now checked.  This residual must consume its cap/radius
provenance; it must not repackage non-first-cap sources as
`PairedApexClassJointDeletion`. -/
theorem false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (G : TriApexAllLargeContext D S)
    (Q : TriApexFiveSurviveOneFail S H O.kept O.deleted
      O.kept_mem_A O.deleted_mem_A) :
    False := by
  sorry

/-- Escaping-source child of the paired common-deletion leaf.

The retained common deletion renews at a carrier point on a first-apex class of
at least four points which is omitted by *both* retained shells.  Deleting it
preserves K4 at the first apex and at both retained blockers, and its own
actual blocker is a fourth centre distinct from all three
(`PairedApexClassJointDeletion.blocker_ne_keptBlocker`,
`…blocker_ne_deletedBlocker`).

Narrowing relative to the parent: the parent supplies only the mutual-omission
pair; this leaf additionally names a third source on a first-apex class with a
four-centre survival surface. -/
theorem false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorDirectedOmission R}
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (G : TriApexAllLargeContext D S) :
    False := by
  let Q : TriApexFiveSurviveOneFail S H O.kept O.deleted
      O.kept_mem_A O.deleted_mem_A :=
    triApexFiveSurviveOneFailOfApexRich S H O.kept O.deleted
      O.kept_mem_A O.deleted_mem_A D.convex G.apex_rich
  exact
    false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
      J G Q

/-- A reverse hit already forces the escaping-source child of the paired
common-deletion leaf.  This is the common contradiction route for all
source-faithful refinements of the reverse-hit branch; endpoint data can be
retained by compatibility wrappers without creating new proof obligations. -/
theorem false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (G : TriApexAllLargeContext D S) :
    False := by
  rcases nonempty_pairedApexClassJointDeletion_of_reverseHit R O reverse_mem with
    ⟨J⟩
  exact
    false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core
      J G

/-- The source-independent algebraic contradiction behind the two-radius-grid
leaf.  The variables are scaled longitudinal and transverse coordinates along
one shell-blocker axis; all geometric normalization is kept outside this
lemma. -/
private theorem polynomial_nested_escape_core
    {x y X Y u v : ℝ}
    (hx : 0 < x) (hy : 0 < y) (hyY : y < Y)
    (hNest : 0 < X * y - Y * x)
    (hNorm : u ^ 2 + v ^ 2 = x ^ 2 + y ^ 2)
    (hRayOrder : 0 < x * v - y * u)
    (hTriple :
      0 < (x - X) * (v - Y) - (y - Y) * (u - X)) :
    x * v + y * u < 0 := by
  have hNormDiff : x ^ 2 + y ^ 2 - u ^ 2 - v ^ 2 = 0 := by
    nlinarith [hNorm]
  have hN : 0 < x ^ 2 + y ^ 2 := by
    positivity
  have hE : 0 < x ^ 2 + y ^ 2 + x * u + y * v := by
    nlinarith [sq_nonneg (x + u), sq_nonneg (y + v)]
  have hFactor :
      (x ^ 2 + y ^ 2) * (x ^ 2 + y ^ 2 + x * u + y * v) *
          ((x - X) * (v - Y) - (y - Y) * (u - X)) =
        (x * v - y * u) *
          ((x * v - y * u) * (X * y - Y * x) +
            (x ^ 2 + y ^ 2 + x * u + y * v) *
              (x ^ 2 + y ^ 2 - (X * x + Y * y))) := by
    calc
      _ =
          (x * v - y * u) *
              ((x * v - y * u) * (X * y - Y * x) +
                (x ^ 2 + y ^ 2 + x * u + y * v) *
                  (x ^ 2 + y ^ 2 - (X * x + Y * y))) +
            (x ^ 2 + y ^ 2) * (X * y - Y * x) *
              (x ^ 2 + y ^ 2 - u ^ 2 - v ^ 2) := by ring
      _ = _ := by rw [hNormDiff]; ring
~~~

## 2. Intended D1 child interfaces

### Exact-name result

The following names have no Lean declaration and no prose structure/field contract:

- `CrossApexExactFourPaired`
- `ExactNonFirstSaturation`
- `TransverseTwoRadius`

Their only exact-name occurrence is the proposed, unimplemented output skeleton in
`docs/audits/2026-08-23-consolidation-refactor-audit.md:246-258`:

~~~lean
inductive TriApexJointDeletionOutcome ...
  | contradiction
  | crossApexExactFourPaired (...)
  | exactNonFirstSaturation (...)
  | transverseTwoRadius (...)
~~~

Therefore none has an intended producer/consumer established by a checked interface, and none has its own `sorry`. The live `sorry` is the monolithic D1 root.

### Closest live objects and strength audit

| Proposed child | Closest live object | Physical class or selected subset? | Order/consecutiveness? | Caller-specific survivals? | Producer / consumer |
|---|---|---|---|---|---|
| `CrossApexExactFourPaired` | `TriApexFiveSurviveOneFail` | `E` is an arbitrary exact four-point subset of a union of three selected strict witnesses. Membership in a witness is existential by cap index; it is not equality with a full physical radius class. | None. | Strong: every `x ∈ E` survives at all three indexed apices and both retained blockers and fails at its own blocker. | Produced by `triApexFiveSurviveOneFailOfApexRich`; consumed only by the live D1 root. |
| `ExactNonFirstSaturation` | No matching packet. Nearest prose proposal: `PairedOffRadiusJointDeletion`. Nearest live split: cross-radius/same-radius constructors in `JointDeletion/Producers.lean:306-339`. | No current object with the proposed semantics. | None. | No current packet tied to the D1 caller. | A sound adapter must explicitly store `J.sourceRadius ≠ radius`. The current source-return branch sets `sourceRadius := radius`. |
| `TransverseTwoRadius` | `PairedTwoRadiusGrid` plus `PairedGridCapPlacement` | `PairedTwoRadiusGrid` stores two complete selected classes, each exactly cardinality four, and exact two-hit shell intersections. | Cap placement has exact intersection/cardinality data but no full boundary indices or consecutiveness. Private oriented labels do not give a complete eight-point order. | `PairedTwoRadiusGrid` itself has no deletion-survival packets. | Produced by `nonempty_pairedCommonDeletionOutcome`; consumed by `false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core` through the separate zero-cut assembly. |

Exact current outcome type, `PairedCommonDeletionNormalForm.lean:234-240`:

~~~lean
inductive PairedCommonDeletionOutcome (O : OrientedRetainedCommonDeletion P)
  | apexClassJointDeletion (data : PairedApexClassJointDeletion O)
  | twoRadiusGrid (data : PairedTwoRadiusGrid O)
~~~

Strength warnings:

- `TriApexFiveSurviveOneFail.E.card = 4` plus existential `supportAt` provenance does not establish complete radius-class equality, pair correspondence, or a physical cap order.
- An `ExactNonFirstSaturation` adapter without `sourceRadius ≠ radius` would merge the cross-radius branch into the recursive same-radius state.
- `PairedTwoRadiusGrid` carries exact classes but no D1-specific all-apex survival and no complete boundary order.
- `TriApexJointDeletionProvenance` and `TwoSourceJointDeletionProvenance` are stronger provenance records elsewhere, but neither is wired to this D1 leaf.

## 3. Existing order-geometry lemmas

### Same-radius hits force strict betweenness

The exact declaration is `CGN.index_strictly_between_of_equidistant` above. Direct imports of
`CapSelectedRowCounting.lean`:

~~~lean
import Erdos9796Proof.P97.CGN.CGN6
import Erdos9796Proof.P97.SurplusM44Packet
import Erdos9796Proof.P97.SurplusCOMPGBankSep
import Erdos9796Proof.P97.U1CarrierInjection
~~~

Applicability:

- hits and blocker center all appear as indices in one complete ordered cap;
- the two hits need not be consecutive;
- it returns the blocker’s exact index between the two hit indices;
- it assumes equal distances, not a selected/full radius-class object.

The D1-specific wrapper `exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit` identifies the physical points and the first-cap image exactly.

### Other strict cap gives at most one hit in a fixed rich slice

Anchor: `TriApexEndpointRetainedOmission.lean:312`.

~~~lean
theorem criticalShell_inter_otherRichCapSlice_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i j : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hcenter : H.centerAt x hx ∈ S.capInteriorByIndex i)
    (hij : i ≠ j)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex j))
    (r : ℝ) :
    ((H.selectedAt x hx).toCriticalFourShell.support ∩
      (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
        S.capInteriorByIndex j)).card ≤ 1
~~~

This uses the full exact critical shell at the blocker and an arbitrary radius slice of a distinct indexed rich cap. No consecutive-points hypothesis appears.

The underlying localization theorem is `AllLargeCapCanonicalInterfaces.lean:85`:

~~~lean
theorem criticalShellCenter_mem_capInteriorByIndex_of_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hx))
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex i
~~~

The direct contradiction wrapper at `TriApexEndpointRetainedOmission.lean:289` additionally takes `hunique`. The cardinality-one theorem reconstructs uniqueness with `isUniqueFourCenter_centerAt`.

Global source-faithful wrapper, line 718:

~~~lean
theorem exists_criticalShell_center_with_otherRichCapSlice_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x : ℝ²} (hx : x ∈ D.A) :
    ∃ i : Fin 3,
      H.centerAt x hx ∈ S.capInteriorByIndex i ∧
      ∀ j : Fin 3, i ≠ j → ∀ r : ℝ,
        ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
            S.capInteriorByIndex j)).card ≤ 1
~~~

Direct imports of `AllLargeCapCanonicalInterfaces.lean`:

~~~lean
import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.LargeOppositeCapsBiApexSurface
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization
import Erdos9796Proof.P97.CapSelectedRowCounting
~~~

Nearby generic one-hit APIs are weaker adapters, not substitutes for the rich-slice theorem:

~~~lean
theorem FiniteEndpoint.OrderedSideChain.card_le_one_of_subset_sameRadius
    (center : ℝ²) (L : OrderedSideChain m)
    (hmono : ∀ {i j : Fin m}, i < j → dist center (L.points i) < dist center (L.points j))
    {T : Finset ℝ²} (r : ℝ)
    (hsub : T ⊆ L.support)
    (hrad : ∀ x ∈ T, dist center x = r) :
    T.card ≤ 1
~~~

This is `N9Endpoint/N4a.lean:109`; that file imports `CGN4g` and `CGN6`. The
indexed-cap endpoint wrappers
`capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep` and its `v3` twin are at
`SurplusM44Packet/Shard01.lean:839,887`. `U2/OneHitBound.lean:91` also proves
`u2_selectedClass_one_hit_of_mono`, but requires an already supplied adjacent-cap
distance-monotonicity witness. None identifies the blocker cap from D1 data.

## 4. Exact-fifteen APIs

Defining imports of `ExactFifteenApexProfile.lean`:

~~~lean
import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity
~~~

### Exact cap and interior cardinalities

~~~lean
theorem capByIndex_card_eq_six_of_card_eq_fifteen
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcard : A.card = 15)
    (hlarge : ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card)
    (i : Fin 3) :
    (S.capByIndex i).card = 6

theorem capInteriorByIndex_card_eq_four_of_card_eq_fifteen
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcard : A.card = 15)
    (hlarge : ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card)
    (i : Fin 3) :
    (S.capInteriorByIndex i).card = 4

theorem exactCapProfile_of_card_eq_fifteen
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hcard : A.card = 15)
    (hlarge : ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card) :
    ∀ i : Fin 3,
      (S.capByIndex i).card = 6 ∧
        (S.capInteriorByIndex i).card = 4
~~~

Supporting arithmetic: `capInteriorByIndex_card_add_two`,
`CapApexRadiusRigidity.lean:29`.

### Interior disjointness and carrier cover

There is no single packaged “three interiors are pairwise disjoint” theorem for the full interiors. The exact pointwise interfaces are:

~~~lean
theorem capInteriorByIndex_not_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) (hij : i ≠ j) :
    x ∉ S.capByIndex j

theorem capInteriorByIndex_ne_of_mem_of_mem_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3} {x y : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) (hyI : y ∈ S.capInteriorByIndex j)
    (hij : i ≠ j) :
    x ≠ y
~~~

Anchors: `SurplusM44Packet/Shard02.lean:200` and following.

The pointwise carrier cover is `SurplusM44Packet/Shard01.lean:1486`:

~~~lean
theorem mem_triangle_verts_or_exists_capInteriorByIndex_of_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} (hxA : x ∈ A) :
    x ∈ S.triangle.verts ∨ ∃ i : Fin 3, x ∈ S.capInteriorByIndex i
~~~

The reverse inclusions are `capInteriorByIndex_subset` and triangle-vertex membership. No packaged Finset union equality was found.

For selected witness supports, `StrictApexFourFamily.support_pairwise_disjoint` is present, but it concerns chosen supports rather than full interiors.

### Two-radius D44 decomposition

~~~lean
theorem twoRichClassSlices_partition_of_capInterior_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (hfour₁ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₁).card)
    (hfour₂ : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r₂).card)
    (hinterior : (S.capInteriorByIndex i).card = 4) :
    let I₁ := SelectedClass A (S.oppositeVertexByIndex i) r₁ ∩
      S.capInteriorByIndex i
    let I₂ := SelectedClass A (S.oppositeVertexByIndex i) r₂ ∩
      S.capInteriorByIndex i
    I₁.card = 2 ∧ I₂.card = 2 ∧ Disjoint I₁ I₂ ∧
      S.capInteriorByIndex i = I₁ ∪ I₂
~~~

Exact full-class and selected-row APIs:

- `twoRichClasses_card_eq_four_of_cap_card_eq_six`, line 261;
- `selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six`, line 341;
- `selectedFourClass_exactApexProfile_of_card_eq_fifteen`, line 538.

The exact-15 dispatcher concludes either a six-point physical class containing the chosen support, or two distinct physical classes of card four with the support equal to one of them.

### Cap order

Generic complete-cap order exists:

~~~lean
theorem capByIndex_cgn4g_capData_oriented
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) :
    ∃ m, ∃ L : Problem97.CGN.OrderedCap m,
      ∃ Packet : Problem97.CGN.MecCapPacket A L,
      ∃ _ : Problem97.CGN.MinorCapSideHypotheses Packet,
      ∃ _ : Problem97.CGN.StrictCapOrder A L,
        Finset.univ.image L.points = S.capByIndex i ∧
          ((L.points (Problem97.CGN.firstIndex Packet.hm) =
                (S.triangleByIndex i).v2 ∧
              L.points (Problem97.CGN.lastIndex Packet.hm) =
                (S.triangleByIndex i).v3) ∨
            (L.points (Problem97.CGN.firstIndex Packet.hm) =
                (S.triangleByIndex i).v3 ∧
              L.points (Problem97.CGN.lastIndex Packet.hm) =
                (S.triangleByIndex i).v2))
~~~

Anchor: `SurplusM44Packet/Shard01.lean:704`.

However, no exact-15 theorem packages an ordered `Fin 4 → ℝ²` representation of the strict interior or proves the selected four points are consecutive in that representation.

### Proposed support/interior equality

Current theorem:

~~~lean
theorem StrictApexFourFamily.supportAt_subset_capInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (W : StrictApexFourFamily A S) (i : Fin 3) :
    W.supportAt i ⊆ S.capInteriorByIndex i
~~~

Each witness support and, at exact fifteen, each interior have cardinality four. Thus the requested equality is a short cardinality upgrade, but the declaration

~~~lean
W.supportAt i = S.capInteriorByIndex i
~~~

does not currently exist.
+

## 5. Consecutive-four / low-span status

### Exact-name search result

No current Lean or prose declaration was found for:

- `IntervalPotential`;
- a theorem restricted to “four consecutive points” of a complete strict same-radius slice;
- a cap-order lift or interval-descent theorem;
- `SR-MU0` or `SR-K22` packet types.

The only current Lean result is a finite directed-graph kernel.

File: `lean/Erdos9796Proof/P97/ATail/FourVertexLowSpan.lean:24-33`.
Direct import: `Mathlib`.

~~~lean
theorem finFour_exists_nearby_mutualFalse_of_card_le_two :
    ∀ contains : Fin 4 → Fin 4 → Bool,
      (∀ i, contains i i = true) →
      (∀ i, (Finset.univ.filter fun j ↦ contains i j).card ≤ 2) →
      ∃ i j : Fin 4,
        i < j ∧ j.1 ≤ i.1 + 2 ∧
        contains i j = false ∧ contains j i = false
~~~

This theorem has no carrier, cap, radius, full-slice, order, or source-provenance argument. Its output only says that the chosen enumeration indices have at most one slot between them.

A private wrapper in `SourceFaithfulSelectedFourFan.lean:424-437` discards the nearby-index bound and returns a mutually omitted pair. It does not add geometry or order.

### Interval potential μ

The only definition is prose, `docs/erdos-97-descent-prose-proof-atomic.md:2664`:

~~~text
I_C(q,w) = {x in C : τ(q) < τ(x) < τ(w)}
μ(q,w)   = |I_C(q,w)|
~~~

The proposed Lean surface at lines 2717-2743 is:

~~~lean
def capOpenInterval
    (C : Finset P) (τ : P → ℝ) (q w : P) : Finset P :=
  C.filter fun x => τ q < τ x ∧ τ x < τ w

def capSpan
    (C : Finset P) (τ : P → ℝ) (q w : P) : Nat :=
  (capOpenInterval C τ q w).card
~~~

The proposed strict-decrease lemmas `capSpan_left_lt`, `capSpan_right_lt`, and
`capSpan_inner_lt` are also prose-only.

### Output alternatives and missing witnesses

The current prose says the conditional same-radius descent ends at:

- `μ = 0`, a paired fixed-point terminal; or
- a disjoint outside `K2,2` packet with global escapes.

The `μ = 1` arm is described as reducing to one of those. No Lean inductive, structure, theorem, or consumer packages these outcomes.

The required but absent ingress fields are:

1. four physical sources on one complete same-radius strict-cap slice;
2. an order object whose support is that complete slice;
3. an injective map from `Fin 4` slots to the four physical sources;
4. proof the slots are consecutive in the complete slice order;
5. the map from mutual omissions to interval endpoints;
6. the `μ` value and strict-decrease proof;
7. source/deletion provenance needed by the eventual terminal.

Exact fifteen currently supplies radius/cardinality/set information. It does not supply items 2-7. The generic complete-cap `StrictCapOrder` is available, but no adapter restricts it to a `Fin 4` complete same-radius strict slice.

The repository’s current audit states this gap explicitly at
`docs/erdos-97-descent-prose-proof-atomic.md:8548-8587` and
`docs/audits/2026-08-22-f1-triapex-checkpoint4-review.md:137-157`.

## 6. Kalmanson, bisector, finite-cover, and Euclidean terminals

### Direct-consumption verdict

Neither proposed terminal can be called from current D1 data.

| Proposed terminal | Closest checked consumer | Missing from `J/G/Q` |
|---|---|---|
| Seven distinct survivor centers plus one failure center | Seven-source complement and Paley critical-shell APIs | No seven-center list, no proof the centers are distinct, no literal seven-row support pattern, and no adapter from survival/failure predicates to the required row equalities. |
| Exact-15 four-row cover plus reverse-hit order | `false_of_positionEmbedding_membershipRows` | No `Fin 15` label map, boundary embedding, full four-row Boolean membership table, prescribed fixed-hit normalization, long-hit bound, or row-shell equality table. The reverse-hit theorem orders only three named first-cap points. |

### Exact-15 four-row consumer

File: `BlockerVExactFifteenFourRowCoverage.lean`.
Direct imports:

~~~lean
import Erdos9796Proof.P97.Phase3SharedPairSeparation
import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas
~~~

Nearest terminal, line 739:

~~~lean
theorem false_of_positionEmbedding_membershipRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (order : Fin 2)
    (labelIndex : Fin 15 → Fin A.card)
    (membership : Fin 4 → Fin 15 → Bool)
    (hposition : PositionEmbedding orientation order labelIndex)
    (htotal : ∀ row,
      (Finset.univ.filter fun point => membership row point).card = 4)
    (hfixed₁ : ∀ row, membership row (fixedHit₁ row) = true)
    (hfixed₂ : ∀ row, membership row (fixedHit₂ row) = true)
    (hlong : ∀ row,
      (Finset.univ.filter fun point =>
        membership row point && longLabelBool point).card ≤ 2)
    (hshell : ∀ row point₁ point₂,
      membership row point₁ = true → membership row point₂ = true →
        dist (boundary (labelIndex (centerLabel row)))
            (boundary (labelIndex point₁)) =
          dist (boundary (labelIndex (centerLabel row)))
            (boundary (labelIndex point₂))) :
    False
~~~

Supporting declarations:

- `OutsidePair`, line 32;
- `PositionEmbedding`, line 288;
- `RealizesRows`, line 295;
- `pairwiseSeparated_of_positionEmbedding_realizesRows`, line 352;
- `false_of_pairwiseSeparated_realizedRows`, line 505;
- `false_of_positionEmbedding_realizedRows`, line 720.

This module is `sorry`-free but uses `native_decide` in finite normalization/exhaustion. Its trust boundary therefore includes compiler trust under the repository policy.

### Seven-source and literal Paley branch

`SevenSourcesOutsideTwoShells.lean` imports `U1CarrierInjection` and provides:

~~~lean
theorem seven_le_outside_two_selected_supports_card
    {A : Finset ℝ²} (hA : 15 ≤ A.card) {c₁ c₂ : ℝ²}
    (K₁ : SelectedFourClass A c₁) (K₂ : SelectedFourClass A c₂) :
    7 ≤ (A \ (K₁.support ∪ K₂.support)).card
~~~

The file also provides `exists_seven_carrierVertices_outside_two_selected_supports` at line 41. These are source-point producers, not survivor-center or contradiction consumers.

`SevenSourceCriticalShellDichotomy.lean` produces either a mutually omitted pair or a literal Paley-pattern permutation. `SevenSourceCriticalShellMutualOmission.lean` returns a mutually omitted pair; it does not return `False`.

The physical Paley terminal is `PaleyCriticalShellAdapter.lean:122`:

~~~lean
theorem false_of_literal_paley_critical_shells
    {A : Finset ℝ²}
    (points : Fin 7 ↪ {p : ℝ² // p ∈ A})
    (centers : Fin 7 → ℝ²)
    (K : ∀ i, CriticalFourShell A (points i).1 (centers i))
    (hsupport : ∀ i j,
      (points j).1 ∈ (K i).support ↔
        j ∈ ({i, i + 1, i + 2, i + 4} : Finset (Fin 7))) :
    False
~~~

It needs seven exact critical shells and the entire literal support pattern. Five-survive/one-fail data does not provide that pattern.

### Reverse-hit ordered cross-row terminal

`CriticalFiberClosingCore.lean:117` defines:

~~~lean
structure OrderedCrossRowCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) : Type where
  C : ℝ²
  K : ℝ²
  fiber_orientation : IsFiberOrientation P C K
  J : ℝ²
  J_mem_A : J ∈ D.A
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iO iA iX iJ iC iK : Fin D.A.card
  hOA : iO < iA
  hAX : iA < iX
  hXJ : iX < iJ
  hJC : iJ < iC
  hCK : iC < iK
  boundary_O : boundary iO = S.oppApex1
  boundary_A : boundary iA = H.centerAt P.source₁.1 P.source₁.2
  boundary_X : boundary iX = H.centerAt J J_mem_A
  boundary_J : boundary iJ = J
  boundary_C : boundary iC = C
  boundary_K : boundary iK = K
  robust_equidistant : dist S.oppApex1 J = dist S.oppApex1 C
  K_mem_J_shell :
    K ∈ (H.selectedAt J J_mem_A).toCriticalFourShell.support
~~~

Exact consumer:

~~~lean
theorem OrderedCrossRowCore.false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R}
    (Q : OrderedCrossRowCore P) : False
~~~

`EndpointFreshOrderedCrossRowPlacement` at
`TriApexEndpointRetainedOmission.lean:2654` is the corresponding endpoint packet, consumed by
`false_of_endpointFreshCrossHit_of_orderedPlacement` at line 2688. Current reverse-hit normal forms have no six-index boundary placement.

### Kalmanson declaration inventory

`CapCrossingKalmanson.lean` directly imports `ConvexCyclicOrder.Construct` and
`U1CarrierInjection`. Source-clean contradiction consumers:

- `false_of_five_ccw_three_shell_equalities`, line 341;
- `false_of_selected_rows_in_five_ccw_order`, line 380;
- `false_of_two_selected_rows_shared_late_pair`, line 427;
- `false_of_three_selected_rows_bridged_late_pair`, line 464;
- `false_of_four_ccw_endpoint_centers_bisect_middle_pair`, line 504;
- `false_of_four_ccw_middle_centers_bisect_endpoint_pair`, line 535;
- `false_of_four_ccw_late_centers_bisect_early_pair`, line 569;
- `false_of_four_selected_rows_chained_late_pair`, line 606;
- `false_of_freshThird_four_order_arms`, line 670;
- `false_of_seven_ccw_three_chained_bisectors`, line 730;
- `false_of_seven_ccw_three_chained_selected_rows`, line 795;
- `false_of_two_selected_middle_rows_shared_endpoint_pair`, line 834;
- `false_of_six_ccw_two_k2_three_selected_rows`, line 863.

The most relevant seven-point exact signature is:

~~~lean
theorem false_of_seven_ccw_three_chained_bisectors
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {iBase iWing iOutside iFresh iBlocker iBetween iSource : Fin n}
    (hBaseWing : iBase < iWing)
    (hWingOutside : iWing < iOutside)
    (hOutsideFresh : iOutside < iFresh)
    (hFreshBlocker : iFresh < iBlocker)
    (hBlockerBetween : iBlocker < iBetween)
    (hBetweenSource : iBetween < iSource)
    (hSourceEq :
      dist (boundary iSource) (boundary iBetween) =
        dist (boundary iSource) (boundary iOutside))
    (hOutsideEq :
      dist (boundary iOutside) (boundary iWing) =
        dist (boundary iOutside) (boundary iBetween))
    (hBlockerEq :
      dist (boundary iBlocker) (boundary iWing) =
        dist (boundary iBlocker) (boundary iOutside)) :
    False
~~~

The selected-row variant at line 795 replaces the three displayed equalities by three
`SelectedFourClass` values and six named support-membership hypotheses.

`KalmansonThreeEqualitySchemas.lean` imports `CapCrossingKalmanson`,
`FivePointEuclideanObstruction`, and `ConvexCyclicOrder.Basic`. It contains the complete
`false_of_{four,five,six}_ccw_three_shell_equalities_*` family and selected-row wrappers
at lines 1213-1488. Suffix inventory:

~~~text
013_412_523  301_415_205  104_245_305  215_305_401
124_304_402  105_245_304  103_302_423  215_301_405
104_203_534  145_205_304  302_401_512  105_302_425
312_401_502  132_234_024  501_241_304  421_301_520
541_031_234  012_325_415  012_124_314  013_235_415
140_250_354  415_305_201  043_140_203  410_304_241
103_243_340  341_201_104  012_123_413  012_413_423
013_412_423  014_024_312  023_024_134  012_013_123
012_102_301  013_023_312  013_023_312_cyclicShift
013_103_201
~~~

All take an injective exact-image CCW boundary, strict index inequalities, and three named distance equalities (or selected-row memberships that derive them). `J/G/Q` does not supply the boundary/index packet.

`KalmansonFourEqualitySchemas.lean` similarly contains families A-M, with increasing,
decreasing, cyclic-shift, and selected-row variants. Those are exact ordered-row consumers;
none accepts D1 packets directly.

### Perpendicular-bisector and Euclidean-algebraic terminals

`ConvexPerpendicularBisectorSides.lean`:

~~~lean
theorem perpBisector_carrier_card_le_two
    {A : Finset ℝ²} (hconv : ConvexIndep A) {p z : ℝ²}
    (hp : p ∈ A) (hz : z ∈ A) (hpz : p ≠ z) :
    (A.filter fun c => dist c p = dist c z).card ≤ 2
~~~

`false_of_three_distinct_equidistant_carriers` at line 33 is the three-center contradiction form.

`ConvexPerpendicularBisectorArcSides.lean` adds signed-area/arc-side consumers:
`perpBisector_signedArea_ratio`, `strict_closer_to_p_of_between_of_anchor`,
`strict_closer_to_p_of_outside_of_anchor`, and the two `closer_side_constant_*` theorems.
They require explicit boundary indices and sign/arc hypotheses absent from D1.

`SixPointEuclideanObstruction.lean` and `SixPointSparseEuclideanObstruction.lean` contain
ordered six-point equality and selected-row consumers, including:

- `false_of_six_ccw_mirror_interleaving_row_equalities`;
- `false_of_six_ccw_row_equalities`;
- `false_of_six_ccw_three_selected_rows`;
- sparse `false_of_six_ccw_two_selected_rows` and its cyclic/decreasing wrappers.

No declaration explicitly models an EDM or Euclidean distance matrix.

The closest algebraic collision APIs are
`Census554/FiniteRowAlgebraicCollisions.lean`:
`EightCenterSeventeenEqualityCollisionCore`,
`NineCenterEighteenEqualityCollisionCore`,
`TenCenterTwentySixEqualityCollisionCore`, and their `not_realizes_of_*` theorems.
They consume a `RowPattern` and 17/18/26 `EdgeClosure` equalities, not survivor/failure or cap-order packets. They are `sorry`-free but use `native_decide`.

### Survival amplification and removable-vertex search result

The current D1-adjacent “amplification” fact is the seven-source complement count, not a contradiction. `SurvivalCover.lean` is a card-≥14 producer into a physical-second-apex consumer; it does not accept `Q` as a seven-center packet.

The removable-vertex APIs live under `RemovableVertexAxiom` and in `GlobalMinimalDeletion.lean`. They construct minimal blocking subdeletions or source-faithful physical rows. No declaration was found whose input is exactly one failure center plus seven distinct survival centers.

## 7. Selected-row identity and blocker uniqueness

### Direction audit

The generic checked direction is **equal centers imply equal supports**, not the requested reverse:

File: `SurvivalCover.lean:48`. Imports
`PhysicalSecondApexCommonDeletion` and `AnchoredDoubleDeletionProducer`.

~~~lean
theorem selectedSupports_eq_of_actualBlockers_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source₁ source₂ : ℝ²}
    (hsource₁ : source₁ ∈ A) (hsource₂ : source₂ ∈ A)
    (hcenters :
      H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂) :
    (H.selectedAt source₁ hsource₁).toCriticalFourShell.support =
      (H.selectedAt source₂ hsource₂).toCriticalFourShell.support
~~~

No generic declaration proves support equality implies center equality.

The only matching reverse theorem is finite-assignment-specific,
`FirstNonHitFiniteBlockerFiber.lean:106`:

~~~lean
theorem firstNonHitFiniteBlockerMap_eq_of_row_eq
    {source anchor : Fin A.boundary.n}
    (hrow : A.row source = A.row anchor) :
    A.blockerMap source = A.blockerMap anchor
~~~

It requires `FirstNonHitSourceTotalFiniteAssignment`, row-image-to-shell identities, and the indexed boundary injection. It is not D1-spine reachable. Its two-direction wrapper is
`firstNonHitFiniteBlockerMap_eq_iff_row_eq` at line 145.

### Distinct centers give intersection card ≤ 2

`U1CarrierInjection.lean:474`:

~~~lean
theorem SelectedFourClass.inter_card_le_two
    {A : Finset ℝ²} {x y : ℝ²}
    (Kx : SelectedFourClass A x) (Ky : SelectedFourClass A y)
    (hxy : x ≠ y) :
    (Kx.support ∩ Ky.support).card ≤ 2
~~~

This is sufficient to prove the missing generic reverse as a short derived lemma when both supports have card four, but that adapter is not currently declared.

### Source belongs to its own selected row

Exact field, `U1CarrierInjection.lean:652`:

~~~lean
CriticalFourShell.q_mem_support : q ∈ support
~~~

Generic chosen-row theorem, line 1165:

~~~lean
theorem source_mem_selectedFourClass
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A)
    (K : SelectedFourClass A (H.centerAt q hq)) :
    q ∈ K.support
~~~

### Cross-deletion survival ↔ selected-support omission

`CriticalPairFrontier.lean:781`; direct imports `U1CarrierInjection` and
`U2NonSurplusOneHit`:

~~~lean
theorem cross_deletion_survives_iff_not_mem_selected_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w : ℝ²} (hq : q ∈ A) :
    HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq) ↔
      w ∉ (H.selectedAt q hq).toCriticalFourShell.support
~~~

### Actual blocker fails after deleting its own source

`U1CarrierInjection.lean:1142`:

~~~lean
theorem CriticalShellSystem.no_qfree_at
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) :
    ¬ HasNEquidistantPointsAt 4 (A.erase q) (H.centerAt q hq)
~~~

`TriApexFiveSurviveOneFail` also records this pointwise as
`actual_blocker_fails` for every selected source.

## 8. D1-local sorry and dependency inventory

### Bounded source scan

At the inspected revision:

- `lean/Erdos9796Proof/P97/ATail` contains 28 source lines with `sorry`;
- it contains 0 source lines with `admit`;
- the active spine has 25 `sorry` declarations;
- the only TriApex/D1 `sorry` is
  `false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core`.

Exact-name search:

| Search | Result |
|---|---|
| `CrossApexExactFourPaired` | none |
| `ExactNonFirstSaturation` | none |
| `TransverseTwoRadius` | none; only unrelated “transverse” coordinate statements in the D2 two-radius geometry |
| `fiveSurviveOneFail` | the checked packet/producer plus the one live D1 root |
| `reverse_mem` | binders/fields only; no declaration named `reverse_mem` |
| `triApexAllLarge` | the context and wrapper chain below |

### D1-only dependency table

| Declaration | Anchor | Status | Edge / first missing antecedent |
|---|---|---|---|
| `triApexFiveSurviveOneFailOfApexRich` | `TriApexFiveSurviveOneFail.lean:71` | proved | Builds `Q` from the three apex-rich systems. It does not provide one complete ordered same-radius four-slice. |
| `false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core` | `TriApexEndpointRetainedOmission.lean:2028` | **sorry** | Needs a contradiction from `J/G/Q`. First absent ingress: either four ordered sources on one complete same-radius strict slice or the exact transverse two-radius packet with provenance. |
| `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core` | line 2054 | proved wrapper | Constructs `Q` and calls the D1 root. |
| `false_of_retainedOmission_reverseHit_jointDeletion_triApexAllLarge_core` | line 2076 | proved wrapper | Builds `J` from `reverse_mem`, dropping reverse order/exact-row fields, then calls the apex-class wrapper. |
| `false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core` | line 2569 | proved dispatcher | Apex-class arm reaches D1; two-radius arm reaches the separate D2 consumer. |
| `false_of_retainedOmission_reverseHitFresh_triApexAllLarge_core` | line 4307 | proved wrapper | Reverse-hit-fresh provenance is present but only `reverse_mem` reaches the D1 adapter. |
| `false_of_retainedOmission_triApexAllLarge_core` | line 4345 | proved dispatcher | Paired and reverse-hit-fresh normal-form branches. |
| `false_of_retainedInteriorDirectedOmission_triApexAllLargeContext` | line 4373 | proved coordinator | Builds the normal form and dispatches. `hfirstLarge` follows from `G.cap_card_ge_six`. |
| `false_of_retainedInteriorDirectedOmission_and_all_low_hits` | line 4388 | proved wrapper | Repackages legacy residual inputs into the context route. |
| `false_of_frontierAllLargeCapsTriApex_all_low_hits` | `Coordinator.lean:579` | proved | Publication-spine ingress to the D1 omission branch. |
| `false_of_criticalPairFrontier` | `Coordinator.lean:779` | proved | Upstream coordinator. |
| `false_of_twoLargeCaps_commonCriticalMap` | `Coordinator.lean:797` | proved | Upstream coordinator. |

No new circular candidate was found. Indexed reuse search at revision
`020e43bfc` returned the live target and its existing wrappers; all contradiction paths through those wrappers bottom out at the same D1 `sorry`.

## Pro-model handoff: highest-value extracts

The two immediately actionable facts are:

1. `reverse_mem` is not the only available reverse-hit datum. Before D1 flattening, the source has the exact reverse shell/cap equality, strict-cap location of the reverse blocker, a complete ordered-cap witness, exact indices for kept/deleted/blocker, and a proved strict-betweenness disjunction.
2. Exact fifteen supplies card-four strict interiors and enough generic complete-cap order infrastructure to attempt an adapter, but no current theorem binds a four-point same-radius physical slice to four consecutive order indices.

Therefore the exact-15 one-radius arm does **not yet** produce a checked `μ = 0` packet. The next interface test is narrowly defined: construct a provenance-preserving order adapter from an exact full same-radius strict slice to four consecutive indices of `capByIndex_cgn4g_capData_oriented`, while retaining the reverse-hit fields. If that adapter cannot be proved, the recent same-radius reduction must be revised rather than routed through the finite `Fin 4` kernel alone.
