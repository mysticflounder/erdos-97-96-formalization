import Erdos9796Proof.P97.SmallerCounterexample
import Erdos9796Proof.P97.SurplusCOMPGBank
import Erdos9796Proof.P97.SurplusCOMPGBankDFS
import Erdos9796Proof.P97.SurplusCOMPGBankGeometry
import Erdos9796Proof.P97.CapBridgeFromK4

/-!
# Removable-vertex existence for `|A| > 9`

`RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank` is the remaining
removable-vertex spine node after exposing the finite pinned-surplus COMP-G
bank handoff as an explicit, closed input:

  Every nonempty convex `HasNEquidistantProperty 4` set with `9 < |A|`
  that is minimal under the strong-induction hypothesis contains a
  removable vertex.

This is the descent step's open removable-vertex obligation: the uniform
removability of a surplus-cap vertex.  The descent wrapper consumes this lemma,
and the finite pinned-surplus bank handoff is an explicit input on the same
spine.  The generated finite bridge now includes the DFS completeness step from
`isValidPinnedFragment` to accepted search membership.  Its certificate shards
are checked by `native_decide`, so the closure still includes the native
decision-procedure trust boundary.

  The remaining proof is split into three explicit spine obligations: extracting
  a surplus-cap packet from the large convex `K4` hypotheses, closing the
  `IsM44` packet branch through its endpoint/pinned residual exclusions and
  containment-to-removable step, and closing the config-level no-`IsM44` branch
  by descent.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Statement that every nonempty convex `K4` set with `|A| > 9`
admits a removable vertex (M4 surplus-cap output shape).

The trailing hypothesis is the strong-induction IH provided by the
`UniversalProblem97_of_reduction` wrapper: every strictly smaller
nonempty convex 4-equidistant set is contradictory (no smaller K4
counterexample exists).  Carrying it through the statement lets the
proof assume minimality, which significantly simplifies the
K4-witness pinning step. -/
abbrev RemovableVertexOfLargeStatement : Prop :=
  ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
    HasNEquidistantProperty 4 A → 9 < A.card →
    (∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∃ x : ℝ², IsRemovableVertex A x

/-- Closed finite handoff for the pinned surplus COMP-G bank.  A geometric
residual only needs to construct a `SurplusCOMPGBank.Shadow` satisfying the
generated pinned-fragment predicate; the generated DFS completeness bridge turns
that predicate into bank membership. -/
abbrev PinnedSurplusCOMPGBankBridgeStatement : Prop :=
  ∀ sstar : SurplusCOMPGBank.Label, ∀ shadow : SurplusCOMPGBank.Shadow,
    SurplusCOMPGBank.isValidPinnedFragment sstar shadow = true →
      SurplusCOMPGBank.shadowInBank shadow = true

/-- The closed pinned-surplus finite-bank handoff, backed by the generated
finite-search certificate and DFS completeness bridge. -/
theorem pinnedSurplusCOMPGBankBridge :
    PinnedSurplusCOMPGBankBridgeStatement := by
  intro sstar shadow hshadow
  exact SurplusCOMPGBank.shadowInBank_of_fragmentShadowAcceptedBySearch
    (SurplusCOMPGBank.fragmentShadowAcceptedBySearch_of_isValidPinnedFragment
      hshadow)

/-- A concrete selected-class witness in the erased set is exactly the data
needed to prove that the erased point is removable. -/
theorem removableVertex_of_selectedClass_erase_witnesses
    {A : Finset ℝ²} {x : ℝ²} (hxA : x ∈ A)
    (hwitness : ∀ p : ℝ², p ∈ A.erase x →
      ∃ radius : ℝ, 0 < radius ∧
        4 ≤ (SelectedClass (A.erase x) p radius).card) :
    IsRemovableVertex A x := by
  refine ⟨hxA, ?_⟩
  intro p hp
  exact hwitness p hp

/-- Statement of the remaining removable-vertex obligation after wiring in the
closed pinned-surplus COMP-G bank bridge. -/
abbrev RemovableVertexOfLargeFromPinnedSurplusCOMPGBankStatement : Prop :=
  PinnedSurplusCOMPGBankBridgeStatement → RemovableVertexOfLargeStatement

/-- Packet-extraction branch for the removable-vertex spine: every large
nonempty convex `K4` configuration supplies a surplus-cap packet. -/
abbrev LargeK4SurplusCapPacketStatement : Prop :=
  ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
    HasNEquidistantProperty 4 A → 9 < A.card →
      Nonempty (SurplusCapPacket A)

/-- The `IsM44` branch of the removable-vertex spine.  The finite
pinned-surplus COMP-G handoff is available as a closed input; the remaining
work is to connect an `IsM44` surplus-cap packet to a removable vertex. -/
abbrev IsM44PinnedSurplusBranchStatement : Prop :=
    PinnedSurplusCOMPGBankBridgeStatement →
      ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
        HasNEquidistantProperty 4 A → 9 < A.card →
        (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
        ∀ S : SurplusCapPacket A, S.IsM44 →
          ∃ x : ℝ², IsRemovableVertex A x
  
/-- Endpoint residual exclusions needed by the `IsM44` branch.  These are the
  two endpoint-certificate targets left after the strict-adjacent-escape
  reduction. -/
abbrev IsM44EndpointResidualsExcludedStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False) ∧
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
  
/-- Pinned surplus-family residual exclusions needed by the `IsM44` branch.
  The closed finite-bank handoff is available as an input, but the remaining work
  is still the geometric payload-to-COMP-G verdict boundary. -/
abbrev IsM44PinnedSurplusResidualsExcludedStatement : Prop :=
    PinnedSurplusCOMPGBankBridgeStatement →
      ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
        HasNEquidistantProperty 4 A → 9 < A.card →
        (∀ B : Finset ℝ², B.card < A.card →
          B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
        ∀ S : SurplusCapPacket A, S.IsM44 →
          (∀ {radius : ℝ} {x : ℝ²},
            S.PinnedRightSurplusResidualAt radius x → False) ∧
          (∀ {radius : ℝ} {x : ℝ²},
            S.PinnedLeftSurplusResidualAt radius x → False)
  
/-- Final `IsM44` removable-vertex extraction once the two non-surplus Moser
  caps are contained.  Existing `SurplusM44Packet` lemmas prove count/placement
  consequences of this containment, but this extraction is not yet closed. -/
abbrev IsM44NonSurplusContainmentRemovableStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False) →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedRightSurplusResidualAt radius x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedLeftSurplusResidualAt radius x → False) →
        S.NonSurplusMoserCapContainment →
          ∃ x : ℝ², IsRemovableVertex A x

/-- Concrete erasure-witness production needed for the `IsM44`
containment-to-removable extraction.  It asks for an erased vertex and, for
every remaining point, an explicit four-point selected class inside the erased
set. -/
abbrev IsM44NonSurplusContainmentErasureWitnessesStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False) →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedRightSurplusResidualAt radius x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedLeftSurplusResidualAt radius x → False) →
        S.NonSurplusMoserCapContainment →
          ∃ x : ℝ², x ∈ A ∧
            ∀ p : ℝ², p ∈ A.erase x →
              ∃ radius : ℝ, 0 < radius ∧
                4 ≤ (SelectedClass (A.erase x) p radius).card

/-- Categorized residual erasure-witness production for the `IsM44`
containment branch.  Once the two non-surplus opposite Moser vertices have
been handled by exact-cap survival, the remaining survivors are the surplus
opposite Moser vertex and strict interiors of the three indexed caps. -/
abbrev IsM44NonSurplusContainmentResidualErasureWitnessesStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False) →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedRightSurplusResidualAt radius x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedLeftSurplusResidualAt radius x → False) →
        S.NonSurplusMoserCapContainment →
          ∃ x : ℝ², x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (∃ radius : ℝ, 0 < radius ∧
              4 ≤ (SelectedClass (A.erase x)
                (S.oppositeVertexByIndex S.surplusIdx) radius).card) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x →
                ∃ radius : ℝ, 0 < radius ∧
                  4 ≤ (SelectedClass (A.erase x) p radius).card) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                ∃ radius : ℝ, 0 < radius ∧
                  4 ≤ (SelectedClass (A.erase x) p radius).card) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                ∃ radius : ℝ, 0 < radius ∧
                  4 ≤ (SelectedClass (A.erase x) p radius).card)

/-- Exact-pin residual exclusion for the categorized containment branch.  The
generic erased-selected-class lemma reduces survivor-witness production to
excluding exact four-point selected classes through the erased surplus point. -/
abbrev IsM44NonSurplusContainmentExactPinResidualsExcludedStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False) →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedRightSurplusResidualAt radius x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedLeftSurplusResidualAt radius x → False) →
        S.NonSurplusMoserCapContainment →
          ∃ x : ℝ², x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (∀ {radius : ℝ}, 0 < radius →
              (SelectedClass A
                (S.oppositeVertexByIndex S.surplusIdx) radius).card = 4 →
              x ∈ SelectedClass A
                (S.oppositeVertexByIndex S.surplusIdx) radius → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x →
                ∀ {radius : ℝ}, 0 < radius →
                  (SelectedClass A p radius).card = 4 →
                  x ∈ SelectedClass A p radius → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                ∀ {radius : ℝ}, 0 < radius →
                  (SelectedClass A p radius).card = 4 →
                  x ∈ SelectedClass A p radius → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                ∀ {radius : ℝ}, 0 < radius →
                  (SelectedClass A p radius).card = 4 →
                  x ∈ SelectedClass A p radius → False)

/-- U5-style triple-circle residual exclusion for the categorized containment
branch.  An exact pin through the erased point is converted into this
three-point residual circle by `erasedPinTriple_of_exact_erased_pin`. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleResidualsExcludedStatement :
    Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False) →
        (∀ {radius rho : ℝ} {x : ℝ²},
          S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedRightSurplusResidualAt radius x → False) →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedLeftSurplusResidualAt radius x → False) →
        S.NonSurplusMoserCapContainment →
          ∃ x : ℝ², x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (ErasedPinTriple A x
              (S.oppositeVertexByIndex S.surplusIdx) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x → ErasedPinTriple A x p → False)

/-- Adapter that closes the broad `IsM44` branch from the two residual
  exclusions plus the containment-to-removable extraction. -/
abbrev IsM44PinnedSurplusBranchFromResidualSplitStatement : Prop :=
    IsM44EndpointResidualsExcludedStatement →
      IsM44PinnedSurplusResidualsExcludedStatement →
      IsM44NonSurplusContainmentRemovableStatement →
        IsM44PinnedSurplusBranchStatement
  
/-- The non-`IsM44` branch of the removable-vertex spine.  The copied U-lane
proof works at configuration level: there is no `IsM44` surplus-cap packet for
the configuration. -/
abbrev NonIsM44DescentStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
    HasNEquidistantProperty 4 A → 9 < A.card →
    (∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
    (¬ ∃ S : SurplusCapPacket A, S.IsM44) →
      ∃ x : ℝ², IsRemovableVertex A x

/-- Three-way adapter for the removable-vertex spine.  It separates packet
extraction, the `IsM44` pinned-surplus branch, and the non-`IsM44` descent
branch while preserving the existing pinned-surplus handoff interface. -/
abbrev RemovableVertexOfLargeFromThreeWaySplitStatement : Prop :=
  LargeK4SurplusCapPacketStatement →
    IsM44PinnedSurplusBranchStatement →
    NonIsM44DescentStatement →
    RemovableVertexOfLargeFromPinnedSurplusCOMPGBankStatement

/-- Large convex `K4` configurations admit a surplus-cap packet.  This is a
spine obligation consumed by `RemovableVertexOfLarge_from_threeWaySplit`. -/
theorem largeK4SurplusCapPacket :
      LargeK4SurplusCapPacketStatement :=
  fun _A hne hconv hK4 hgt => MEC.nonempty_surplusCapPacket_of_K4 hne hconv hK4 hgt
  
/-- Endpoint residuals are impossible in the `IsM44` branch.  This is a spine
  obligation consumed by
  `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit`. -/
theorem isM44EndpointResidualsExcluded :
      IsM44EndpointResidualsExcludedStatement := sorry
  
/-- Pinned surplus-family residuals are impossible in the `IsM44` branch.  This
  is the finite-bank/COMP-G residual obligation consumed by
  `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit`. -/
theorem isM44PinnedSurplusResidualsExcluded :
      IsM44PinnedSurplusResidualsExcludedStatement := sorry
  
/-- Categorized residual concrete erasure-witness production for the `IsM44`
containment branch reduced to U5-style erased-pin triple circles. -/
theorem isM44NonSurplusContainmentErasedPinTripleResidualsExcluded :
      IsM44NonSurplusContainmentErasedPinTripleResidualsExcludedStatement :=
  sorry

/-- Categorized residual concrete erasure-witness production for the `IsM44`
containment branch reduced to exact four-point selected-class pins through the
erased surplus point. -/
theorem isM44NonSurplusContainmentExactPinResidualsExcluded :
      IsM44NonSurplusContainmentExactPinResidualsExcludedStatement := by
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
        A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain with
      ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
        hoppInterior1Triple, hoppInterior2Triple⟩
    refine ⟨x, hxI, ?_, ?_, ?_, ?_⟩
    · intro radius hradius hcard hxpin
      exact hsurplusOppTriple
        (erasedPinTriple_of_exact_erased_pin hradius hcard hxpin)
    · intro p hpI hpErase radius hradius hcard hxpin
      exact hsurplusInteriorTriple p hpI hpErase
        (erasedPinTriple_of_exact_erased_pin hradius hcard hxpin)
    · intro p hpI hpErase radius hradius hcard hxpin
      exact hoppInterior1Triple p hpI hpErase
        (erasedPinTriple_of_exact_erased_pin hradius hcard hxpin)
    · intro p hpI hpErase radius hradius hcard hxpin
      exact hoppInterior2Triple p hpI hpErase
        (erasedPinTriple_of_exact_erased_pin hradius hcard hxpin)
  
/-- Categorized residual concrete erasure-witness production for the `IsM44`
containment branch after exact-cap survival handles the two non-surplus
opposite Moser vertices. -/
theorem isM44NonSurplusContainmentResidualErasureWitnesses :
      IsM44NonSurplusContainmentResidualErasureWitnessesStatement := by
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases isM44NonSurplusContainmentExactPinResidualsExcluded
        A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain with
      ⟨x, hxI, hsurplusOppPin, hsurplusInteriorPin, hoppInterior1Pin,
        hoppInterior2Pin⟩
    have hsurplusOppErase :
        S.oppositeVertexByIndex S.surplusIdx ∈ A.erase x := by
      exact Finset.mem_erase.mpr
        ⟨(S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
            (j := S.surplusIdx) hxI).symm,
          S.oppositeVertexByIndex_mem S.surplusIdx⟩
    refine ⟨x, hxI, ?_, ?_, ?_, ?_⟩
    · exact selectedClass_erase_witness_of_no_exact_erased_pin hK4
        hsurplusOppErase
        (fun hradius hcard hxpin =>
          hsurplusOppPin hradius hcard hxpin)
    · intro p hpI hpErase
      exact selectedClass_erase_witness_of_no_exact_erased_pin hK4 hpErase
        (fun hradius hcard hxpin =>
          hsurplusInteriorPin p hpI hpErase hradius hcard hxpin)
    · intro p hpI hpErase
      exact selectedClass_erase_witness_of_no_exact_erased_pin hK4 hpErase
        (fun hradius hcard hxpin =>
          hoppInterior1Pin p hpI hpErase hradius hcard hxpin)
    · intro p hpI hpErase
      exact selectedClass_erase_witness_of_no_exact_erased_pin hK4 hpErase
        (fun hradius hcard hxpin =>
          hoppInterior2Pin p hpI hpErase hradius hcard hxpin)

/-- Concrete erasure-witness production for the `IsM44` containment branch.
The two non-surplus opposite Moser vertices are supplied by exact-cap survival;
the residual theorem handles the other survivors. -/
theorem isM44NonSurplusContainmentErasureWitnesses :
      IsM44NonSurplusContainmentErasureWitnessesStatement := by
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases isM44NonSurplusContainmentResidualErasureWitnesses
        A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain with
      ⟨x, hxI, hsurplusOpp, hsurplusInterior, hoppInterior1,
        hoppInterior2⟩
    have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hxI
    refine ⟨x, hxA, ?_⟩
    intro p hp
    by_cases hp1 : p = S.oppositeVertexByIndex S.oppIndex1
    · subst p
      exact hM44.exists_oppIndex1_erase_witness_of_surplusInterior
        hK4 hcontain hxI
    · by_cases hp2 : p = S.oppositeVertexByIndex S.oppIndex2
      · subst p
        exact hM44.exists_oppIndex2_erase_witness_of_surplusInterior
          hK4 hcontain hxI
      · have hpA : p ∈ A := (Finset.mem_erase.mp hp).2
        rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hpA with
          hpVerts | ⟨i, hpI⟩
        · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hpVerts with
            hsurplus | hopp1 | hopp2
          · simpa [hsurplus] using hsurplusOpp
          · exact False.elim (hp1 hopp1)
          · exact False.elim (hp2 hopp2)
        · rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
            hi | hi | hi
          · exact hsurplusInterior p (by simpa [hi] using hpI) hp
          · exact hoppInterior1 p (by simpa [hi] using hpI) hp
          · exact hoppInterior2 p (by simpa [hi] using hpI) hp

/-- Non-surplus Moser-cap containment supplies a removable vertex in the
`IsM44` branch once the concrete erasure witnesses are produced. -/
theorem isM44NonSurplusContainmentRemovable :
      IsM44NonSurplusContainmentRemovableStatement := by
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases isM44NonSurplusContainmentErasureWitnesses
        A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain with
      ⟨x, hxA, hwitness⟩
    exact ⟨x, removableVertex_of_selectedClass_erase_witnesses hxA hwitness⟩
  
/-- Closed adapter from the residual split to the broad `IsM44` pinned-surplus
  branch. -/
theorem removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit :
      IsM44PinnedSurplusBranchFromResidualSplitStatement := by
    intro hendpoint hpinned hrem hbridge A hne hconv hK4 hgt hMin S hM44
    rcases hendpoint A hne hconv hK4 hgt hMin S hM44 with ⟨hend1, hend2⟩
    rcases hpinned hbridge A hne hconv hK4 hgt hMin S hM44 with
      ⟨hpin1, hpin2⟩
    have hcontain : S.NonSurplusMoserCapContainment :=
      hM44.nonSurplusMoserCapContainment_of_endpoint_pinnedSurplusResiduals
        hK4 hconv hend1 hend2 hpin1 hpin2
    exact hrem A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
  
/-- `IsM44` surplus-cap packets close the removable-vertex branch after the
  endpoint residuals, pinned surplus-family residuals, and
  containment-to-removable extraction are discharged.  This is consumed by
  `RemovableVertexOfLarge_from_threeWaySplit`. -/
theorem removableVertexOfLarge_of_isM44PinnedSurplus :
      IsM44PinnedSurplusBranchStatement :=
    removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit
      isM44EndpointResidualsExcluded
      isM44PinnedSurplusResidualsExcluded
      isM44NonSurplusContainmentRemovable

/-- Configurations with no `IsM44` surplus-cap packet close by descent.  This
is a spine obligation consumed by
`RemovableVertexOfLarge_from_threeWaySplit`. -/
theorem removableVertexOfLarge_of_nonIsM44 :
    NonIsM44DescentStatement := sorry

/-- Closed adapter from the three-way split to the existing removable-vertex
spine node. -/
theorem RemovableVertexOfLarge_from_threeWaySplit :
    RemovableVertexOfLargeFromThreeWaySplitStatement := by
  classical
  intro _hpacket hM44 hnonM44 hbridge A hne hconv hK4 hgt hMin
  by_cases h : ∃ S : SurplusCapPacket A, S.IsM44
  · rcases h with ⟨S, hS⟩
    exact hM44 hbridge A hne hconv hK4 hgt hMin S hS
  · exact hnonM44 A hne hconv hK4 hgt hMin h

/-- Remaining removable-vertex obligation with the finite pinned-surplus bank
handoff available as a closed input.  It is now routed through the three-way
split into packet extraction, the `IsM44` pinned-surplus branch, and the
non-`IsM44` descent branch. -/
theorem RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank :
    RemovableVertexOfLargeFromPinnedSurplusCOMPGBankStatement :=
  RemovableVertexOfLarge_from_threeWaySplit
    largeK4SurplusCapPacket
    removableVertexOfLarge_of_isM44PinnedSurplus
    removableVertexOfLarge_of_nonIsM44

/-- **Removable-vertex existence for `|A| > 9` counterexamples.**
This is now wired through the finite pinned-surplus COMP-G bank bridge; the
open work is
the three obligations consumed by
`RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank`. -/
theorem RemovableVertexOfLarge : RemovableVertexOfLargeStatement :=
  RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank
    pinnedSurplusCOMPGBankBridge

end Problem97
