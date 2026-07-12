import Erdos9796Proof.P97.SmallerCounterexample
import Erdos9796Proof.P97.SurplusCOMPGBank
import Erdos9796Proof.P97.SurplusCOMPGBankDFS
import Erdos9796Proof.P97.SurplusCOMPGBankGeometry
import Erdos9796Proof.P97.CapBridgeFromK4
import Erdos9796Proof.P97.NoDiameterUnderK4
import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.EndpointCertificate.ResidualCoreData
import Erdos9796Proof.P97.PinnedHullOrder
import Erdos9796Proof.P97.EndpointCertificate.GeometryProducer

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

open SurplusCOMPGBank

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

/-- General-`m` endpoint residual exclusions: the `5 < m` branch of
  `IsM44EndpointResidualsExcludedStatement` after the label-complete `m = 5`
  split (route decision (b), 2026-07-11).  In this regime
  `A.card = S.surplusCap.card + 5 > 10`, so the ten endpoint labels cannot
  cover `A` and the label-complete shadow producer does not apply. -/
abbrev IsM44EndpointGeneralMResidualsExcludedStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 → 5 < S.surplusCap.card →
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

/-- Producer data needed to send a right-pinned surplus residual through the
checked pinned-surplus row-zero bank.  This is the remaining geometric bridge:
it must construct the induced ten-label shadow, prove finite-bank validity, and
prove the metric same-radius interpretation for that shadow. -/
abbrev RightPinnedSurplusMetricShadowData
    {A : Finset ℝ²} (S : SurplusCapPacket A) (_radius : ℝ) (_x : ℝ²) :
    Prop :=
  ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
  ∃ centerClass : SurplusCOMPGBank.Label → Finset ℝ²,
  ∃ sstar : SurplusCOMPGBank.Label,
    let pointOf :=
      SurplusCOMPGBank.rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
    SurplusCOMPGBank.isValidPinnedFragment sstar
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass) = true ∧
      EndpointCertificate.Variables.EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)

/-- Left-oriented mirror of `RightPinnedSurplusMetricShadowData`. -/
abbrev LeftPinnedSurplusMetricShadowData
    {A : Finset ℝ²} (S : SurplusCapPacket A) (_radius : ℝ) (_x : ℝ²) :
    Prop :=
  ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
  ∃ centerClass : SurplusCOMPGBank.Label → Finset ℝ²,
  ∃ sstar : SurplusCOMPGBank.Label,
    let pointOf :=
      SurplusCOMPGBank.leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
    SurplusCOMPGBank.isValidPinnedFragment sstar
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass) = true ∧
      EndpointCertificate.Variables.EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)

/-- The pinned-surplus geometry producer in the label-complete `m = 5` regime.
The ten named points exhaust the ambient packet in this regime, so the induced
valid metric shadow is faithful to the checked row-zero bank. -/
abbrev IsM44PinnedSurplusMetricShadowProducerStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        S.surplusCap.card = 5 →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedRightSurplusResidualAt radius x →
            RightPinnedSurplusMetricShadowData S radius x) ∧
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedLeftSurplusResidualAt radius x →
            LeftPinnedSurplusMetricShadowData S radius x)

/-- The remaining pinned-surplus exclusion in the non-label-complete regime.
It is stated at the residual boundary rather than forcing a larger packet
through the exact ten-label metric-shadow interface. -/
abbrev IsM44PinnedSurplusGeneralMResidualsExcludedStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        5 < S.surplusCap.card →
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

/-- Reduced input surface for the erased-pin triple residual.  The surplus
opposite vertex and surplus-interior survivors remain direct triple exclusions.
The two non-surplus interior families are reduced to the already-formalized
U5-style split: adjacent chain data, primitive packet-row exclusion, and
one-sided erased-payload exclusion. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleReductionInputsStatement :
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
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex1 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1)) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                SurplusCapPacket.RightOneSidedErasedPayload
                  S S.oppIndex1 p x (dist p x) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex2 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1)) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                SurplusCapPacket.LeftOneSidedErasedPayload
                  S S.oppIndex2 p x (dist p x) → False)

/-- The finite seed-mask interface needed to refute a right one-sided erased
payload after naming the two non-surplus interiors and the three surplus labels.
This packages exactly the hypotheses consumed by
`false_of_rightOneSidedErasedPayload_pointClasses_of_named_pair_seed_mask_interfaces`. -/
abbrev RightOneSidedErasedPayloadSeedMaskInputs {A : Finset ℝ²}
    (S : SurplusCapPacket A) (p x : ℝ²) (radius : ℝ) : Prop :=
  ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
  ∃ centerClass : Label → Finset ℝ²,
  ∃ sstar : Label,
    Function.Injective (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
    isSurplusStar sstar = true ∧
    rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
    p₁ ≠ p₂ ∧
    S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
    S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
    p ∈ S.oppInterior1 ∧
    centerClass .v = S.capByIndex S.oppIndex1 ∧
    centerClass .w = S.capByIndex S.oppIndex2 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    (∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4) ∧
    (∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false) ∧
    maskInterCard
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .u))
        cvNoUMask <= 1 ∧
    maskInterCard
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .u))
        cwNoUMask <= 1 ∧
    (∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      isMoserLabel center = false → center ≠ priv →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false) ∧
    noThreeOK
      (shadowOfPointClasses
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) = true ∧
    (∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true) ∧
    (∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) ∧
    (maskHas
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .u)) sstar &&
      decide
        (1 <=
          maskInterCard
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass .u))
            uPwPuMask)) = false ∧
    (maskHas
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .Q1)) sstar &&
      decide
        (1 <=
          maskInterCard
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass .Q1))
            uPwPuMask)) = false ∧
    (maskHas
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .Q2)) sstar &&
      decide
        (1 <=
          maskInterCard
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass .Q2))
            uPwPuMask)) = false ∧
    (∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false) ∧
    maskInterCard
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass sstar))
        uPwPuMask <= 1

/-- Mirror seed-mask interface needed to refute a left one-sided erased
payload. -/
abbrev LeftOneSidedErasedPayloadSeedMaskInputs {A : Finset ℝ²}
    (S : SurplusCapPacket A) (p x : ℝ²) (radius : ℝ) : Prop :=
  ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
  ∃ centerClass : Label → Finset ℝ²,
  ∃ sstar : Label,
    Function.Injective (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
    isSurplusStar sstar = true ∧
    leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
    p₁ ≠ p₂ ∧
    S.oppInterior2 = ({p₁, p₂} : Finset ℝ²) ∧
    S.oppInterior1 = ({q₁, q₂} : Finset ℝ²) ∧
    p ∈ S.oppInterior2 ∧
    centerClass .v = S.capByIndex S.oppIndex2 ∧
    centerClass .w = S.capByIndex S.oppIndex1 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    (∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4) ∧
    (∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false) ∧
    maskInterCard
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .u))
        cvNoUMask <= 1 ∧
    maskInterCard
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .u))
        cwNoUMask <= 1 ∧
    (∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      isMoserLabel center = false → center ≠ priv →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false) ∧
    noThreeOK
      (shadowOfPointClasses
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) = true ∧
    (∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true) ∧
    (∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) ∧
    (maskHas
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .u)) sstar &&
      decide
        (1 <=
          maskInterCard
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass .u))
            uPwPuMask)) = false ∧
    (maskHas
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .Q1)) sstar &&
      decide
        (1 <=
          maskInterCard
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass .Q1))
            uPwPuMask)) = false ∧
    (maskHas
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .Q2)) sstar &&
      decide
        (1 <=
          maskInterCard
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass .Q2))
            uPwPuMask)) = false ∧
    (∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false) ∧
    maskInterCard
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass sstar))
        uPwPuMask <= 1

/-- Feed the packaged right seed-mask interface into the generated
seeded-shadow contradiction. -/
theorem false_of_rightOneSidedErasedPayload_of_seedMaskInputs
    {A : Finset ℝ²} {S : SurplusCapPacket A} {p x : ℝ²} {radius : ℝ}
    (hseed : RightOneSidedErasedPayloadSeedMaskInputs S p x radius)
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p x radius) :
    False := by
  rcases hseed with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
      hinj, hsstar, hsstar_eq, hp12, hpair, hqpair, hp,
      hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcard, hself, huv, huw, hcirc, hno3, hcounts, hsep,
      hsearchSep, htriggerU, htriggerQ1, htriggerQ2, htriggerPrevious,
      hfinal⟩
  exact
    false_of_rightOneSidedErasedPayload_pointClasses_of_named_pair_seed_mask_interfaces
      S hinj hsstar hsstar_eq hp12 hpair hqpair hp hpayload
      hvClass hwClass hprivatePwClass hprivatePuClass
      hcard hself huv huw hcirc hno3
      (fun assigned _ => hcounts assigned) hsep hsearchSep
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal

/-- Feed the packaged left seed-mask interface into the generated
seeded-shadow contradiction. -/
theorem false_of_leftOneSidedErasedPayload_of_seedMaskInputs
    {A : Finset ℝ²} {S : SurplusCapPacket A} {p x : ℝ²} {radius : ℝ}
    (hseed : LeftOneSidedErasedPayloadSeedMaskInputs S p x radius)
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p x radius) :
    False := by
  rcases hseed with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
      hinj, hsstar, hsstar_eq, hp12, hpair, hqpair, hp,
      hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcard, hself, huv, huw, hcirc, hno3, hcounts, hsep,
      hsearchSep, htriggerU, htriggerQ1, htriggerQ2, htriggerPrevious,
      hfinal⟩
  exact
    false_of_leftOneSidedErasedPayload_pointClasses_of_named_pair_seed_mask_interfaces
      S hinj hsstar hsstar_eq hp12 hpair hqpair hp hpayload
      hvClass hwClass hprivatePwClass hprivatePuClass
      hcard hself huv huw hcirc hno3
      (fun assigned _ => hcounts assigned) hsep hsearchSep
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal

/-- Candidate-remainder interface for refuting a right one-sided erased
payload.  This is weaker than the full seed-mask interface: fixed seed masks
and non-fixed candidate memberships are supplied directly. -/
abbrev RightOneSidedErasedPayloadSeedCandidateInputs {A : Finset ℝ²}
    (S : SurplusCapPacket A) (p x : ℝ²) (radius : ℝ) : Prop :=
  ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
  ∃ centerClass : Label → Finset ℝ²,
  ∃ sstar : Label,
    Function.Injective (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
    isSurplusStar sstar = true ∧
    rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
    p₁ ≠ p₂ ∧
    S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
    S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
    p ∈ S.oppInterior1 ∧
    centerClass .v = S.capByIndex S.oppIndex1 ∧
    centerClass .w = S.capByIndex S.oppIndex2 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .own,
          privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .own,
          privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
          privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
          privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
          privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
          privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
        OneSidedSeed) ∧
    noThreeOK
      (shadowOfPointClasses
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) = true ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)

/-- Candidate-remainder interface for refuting a left one-sided erased
payload. -/
abbrev LeftOneSidedErasedPayloadSeedCandidateInputs {A : Finset ℝ²}
    (S : SurplusCapPacket A) (p x : ℝ²) (radius : ℝ) : Prop :=
  ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
  ∃ centerClass : Label → Finset ℝ²,
  ∃ sstar : Label,
    Function.Injective (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
    isSurplusStar sstar = true ∧
    leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
    p₁ ≠ p₂ ∧
    S.oppInterior2 = ({p₁, p₂} : Finset ℝ²) ∧
    S.oppInterior1 = ({q₁, q₂} : Finset ℝ²) ∧
    p ∈ S.oppInterior2 ∧
    centerClass .v = S.capByIndex S.oppIndex2 ∧
    centerClass .w = S.capByIndex S.oppIndex1 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .own,
          privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .own,
          privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
          privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
          privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
          privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
          privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
        OneSidedSeed) ∧
    noThreeOK
      (shadowOfPointClasses
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) = true ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)

/-- Named right-oriented point-class facts for one erased-payload radius.  The
structural pair/triple and injectivity hypotheses are discharged by the adapter
below, so this surface only records the finite shadow facts that still need to
be produced. -/
abbrev RightOneSidedErasedPayloadNamedCandidateFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) (radius : ℝ)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) : Prop :=
  ∃ centerClass : Label → Finset ℝ²,
  ∃ sstar : Label,
    isSurplusStar sstar = true ∧
    rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
    centerClass .v = S.capByIndex S.oppIndex1 ∧
    centerClass .w = S.capByIndex S.oppIndex2 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .own,
          privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .own,
          privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
          privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
          privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
          privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
          privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
        OneSidedSeed) ∧
    noThreeOK
      (shadowOfPointClasses
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) = true ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)

/-- Named left-oriented point-class facts for one erased-payload radius. -/
abbrev LeftOneSidedErasedPayloadNamedCandidateFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) (radius : ℝ)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) : Prop :=
  ∃ centerClass : Label → Finset ℝ²,
  ∃ sstar : Label,
    isSurplusStar sstar = true ∧
    leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
    centerClass .v = S.capByIndex S.oppIndex2 ∧
    centerClass .w = S.capByIndex S.oppIndex1 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .own,
          privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .own,
          privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
          privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
          privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
          privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
        OneSidedSeed) ∧
    OneSidedSeedCandidateRemainder
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      centerClass
      ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
          privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
        OneSidedSeed) ∧
    noThreeOK
      (shadowOfPointClasses
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) = true ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)

/-- Right-oriented finite point-class facts with the erased surplus-star label
derived outside the finite surface. -/
abbrev RightOneSidedErasedPayloadFiniteCandidateFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) (radius : ℝ)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) : Prop :=
  ∃ centerClass : Label → Finset ℝ²,
    centerClass .v = S.capByIndex S.oppIndex1 ∧
    centerClass .w = S.capByIndex S.oppIndex2 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    (∀ sstar : Label,
      isSurplusStar sstar = true →
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
          OneSidedSeedCandidateRemainder
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
                privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
                privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
                privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
                privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
              OneSidedSeed)) ∧
    noThreeOK
      (shadowOfPointClasses
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) = true ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)

/-- Left-oriented finite point-class facts with the erased surplus-star label
derived outside the finite surface. -/
abbrev LeftOneSidedErasedPayloadFiniteCandidateFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) (radius : ℝ)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) : Prop :=
  ∃ centerClass : Label → Finset ℝ²,
    centerClass .v = S.capByIndex S.oppIndex2 ∧
    centerClass .w = S.capByIndex S.oppIndex1 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    (∀ sstar : Label,
      isSurplusStar sstar = true →
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
          OneSidedSeedCandidateRemainder
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
                privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
                privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
                privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
              OneSidedSeed) ∧
          OneSidedSeedCandidateRemainder
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass
            ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
                privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
              OneSidedSeed)) ∧
    noThreeOK
      (shadowOfPointClasses
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) = true ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)

/-- Right-oriented finite point-class facts with the derivable `noThreeOK`
field omitted.  Separation is carried on the generated checker domains:
`labelPairs` for pointwise separation and `orderedLabelPairs` for mask-level
search separation. -/
abbrev RightOneSidedErasedPayloadFiniteCandidateSepFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) (radius : ℝ)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) : Prop :=
  ∃ centerClass : Label → Finset ℝ²,
    centerClass .v = S.capByIndex S.oppIndex1 ∧
    centerClass .w = S.capByIndex S.oppIndex2 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    (∀ sstar : Label,
      isSurplusStar sstar = true →
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
          (OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                OneSidedSeed))) ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
        crossSeparationOKForMasks c
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass c)) cp
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass cp)) = true)

/-- Left-oriented finite point-class facts with the same derivable fields as the
right reduced packet omitted. -/
abbrev LeftOneSidedErasedPayloadFiniteCandidateSepFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) (radius : ℝ)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) : Prop :=
  ∃ centerClass : Label → Finset ℝ²,
    centerClass .v = S.capByIndex S.oppIndex2 ∧
    centerClass .w = S.capByIndex S.oppIndex1 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    (∀ sstar : Label,
      isSurplusStar sstar = true →
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
          (OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                OneSidedSeed))) ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
        crossSeparationOKForMasks c
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass c)) cp
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass cp)) = true)

/-- Right-oriented finite point-class facts for the relaxed-shape terminal row.
Compared with the candidate packet, this keeps exact four-label/no-self shape
for every non-cap center and drops membership in the generated candidate-mask
filters. -/
abbrev RightOneSidedErasedPayloadFiniteRelaxedShapeFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (_x : ℝ²) (radius : ℝ)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) : Prop :=
  ∃ centerClass : Label → Finset ℝ²,
    centerClass .v = S.capByIndex S.oppIndex1 ∧
    centerClass .w = S.capByIndex S.oppIndex2 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    (∀ center : Label, center ≠ .v → center ≠ .w →
      maskCard
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass center)) = 4) ∧
    (∀ center : Label, center ≠ .v → center ≠ .w →
      maskHas
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass center)) center = false) ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
        crossSeparationOKForMasks c
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass c)) cp
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass cp)) = true)

/-- Left-oriented mirror of
`RightOneSidedErasedPayloadFiniteRelaxedShapeFacts`. -/
abbrev LeftOneSidedErasedPayloadFiniteRelaxedShapeFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (_x : ℝ²) (radius : ℝ)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) : Prop :=
  ∃ centerClass : Label → Finset ℝ²,
    centerClass .v = S.capByIndex S.oppIndex2 ∧
    centerClass .w = S.capByIndex S.oppIndex1 ∧
    centerClass .Pw = SelectedClass A p₁ radius ∧
    centerClass .Pu = SelectedClass A p₂ radius ∧
    (∀ center : Label, center ≠ .v → center ≠ .w →
      maskCard
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass center)) = 4) ∧
    (∀ center : Label, center ≠ .v → center ≠ .w →
      maskHas
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass center)) center = false) ∧
    PrefixPairCountsOK
      (shadowOfPointClasses
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass) ∧
    (∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true) ∧
    (∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
        crossSeparationOKForMasks c
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass c)) cp
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass cp)) = true)

/-- The reduced right finite-candidate packet implies the existing full packet:
search cross-separation is just the mask form of the supplied `sepOKFor`
interface. -/
theorem rightFiniteCandidateFacts_of_sepFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateSepFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3 := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hcounts, hsep, hsearchSep⟩
  have hno3 :
      noThreeOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true :=
    noThreeOK_of_PrefixPairCountsOK hcounts
  have hcandidateFull :
      ∀ sstar : Label,
        isSurplusStar sstar = true →
          rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
            OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
                  privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
                  privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
                  privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
                  privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
                OneSidedSeed) := by
    intro sstar hsstar hsstar_eq
    rcases hcandidate sstar hsstar hsstar_eq with
      ⟨hcandidateOwnPw, hcandidateOwnPu⟩
    let ownPw : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .own,
        privateMask := maskOfLabels [.u, .w, sstar, .Pu] }
    let ownPu : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .own,
        privateMask := maskOfLabels [.u, .w, sstar, .Pw] }
    let oppositePwU : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pu] }
    let oppositePwW : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pu] }
    let oppositePuU : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pw] }
    let oppositePuW : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pw] }
    refine
      ⟨hcandidateOwnPw, hcandidateOwnPu, ?_, ?_, ?_, ?_⟩
    · exact oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := oppositePwU) (base := ownPw) rfl rfl hcandidateOwnPw
    · exact oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := oppositePwW) (base := ownPw) rfl rfl hcandidateOwnPw
    · exact oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := oppositePuU) (base := ownPu) rfl rfl hcandidateOwnPu
    · exact oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := oppositePuW) (base := ownPu) rfl rfl hcandidateOwnPu
  refine
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidateFull, hno3, hcounts, hsep, hsearchSep⟩

/-- Mirror conversion from reduced left finite-candidate facts to the existing
full packet. -/
theorem leftFiniteCandidateFacts_of_sepFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateSepFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3 := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hcounts, hsep, hsearchSep⟩
  have hno3 :
      noThreeOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true :=
    noThreeOK_of_PrefixPairCountsOK hcounts
  have hcandidateFull :
      ∀ sstar : Label,
        isSurplusStar sstar = true →
          leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
            OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
                  privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
                  privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
                  privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass
              ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
                  privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
                OneSidedSeed) := by
    intro sstar hsstar hsstar_eq
    rcases hcandidate sstar hsstar hsstar_eq with
      ⟨hcandidateOwnPw, hcandidateOwnPu⟩
    let ownPw : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .own,
        privateMask := maskOfLabels [.u, .w, sstar, .Pu] }
    let ownPu : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .own,
        privateMask := maskOfLabels [.u, .w, sstar, .Pw] }
    let oppositePwU : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pu] }
    let oppositePwW : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pu] }
    let oppositePuU : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pw] }
    let oppositePuW : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pw] }
    refine
      ⟨hcandidateOwnPw, hcandidateOwnPu, ?_, ?_, ?_, ?_⟩
    · exact oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := oppositePwU) (base := ownPw) rfl rfl hcandidateOwnPw
    · exact oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := oppositePwW) (base := ownPw) rfl rfl hcandidateOwnPw
    · exact oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := oppositePuU) (base := ownPu) rfl rfl hcandidateOwnPu
    · exact oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := oppositePuW) (base := ownPu) rfl rfl hcandidateOwnPu
  refine
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidateFull, hno3, hcounts, hsep, hsearchSep⟩

/-- Right-oriented erased-payload center classes: the two non-surplus apex
classes are exact caps, the private centers are the erased-payload selected
classes, and all remaining labels use caller-supplied selected-class radii. -/
noncomputable def rightPinnedErasedPayloadCenterClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) (radius : ℝ)
    (radiusOf : Label → ℝ) : Label → Finset ℝ²
  | .u =>
      SelectedClass A
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u)
        (radiusOf .u)
  | .v => S.capByIndex S.oppIndex1
  | .w => S.capByIndex S.oppIndex2
  | .s1 =>
      SelectedClass A
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s1)
        (radiusOf .s1)
  | .s2 =>
      SelectedClass A
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s2)
        (radiusOf .s2)
  | .s3 =>
      SelectedClass A
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s3)
        (radiusOf .s3)
  | .Pw => SelectedClass A p₁ radius
  | .Pu => SelectedClass A p₂ radius
  | .Q1 =>
      SelectedClass A
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Q1)
        (radiusOf .Q1)
  | .Q2 =>
      SelectedClass A
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Q2)
        (radiusOf .Q2)

/-- Left-oriented mirror of `rightPinnedErasedPayloadCenterClass`. -/
noncomputable def leftPinnedErasedPayloadCenterClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) (radius : ℝ)
    (radiusOf : Label → ℝ) : Label → Finset ℝ²
  | .u =>
      SelectedClass A
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u)
        (radiusOf .u)
  | .v => S.capByIndex S.oppIndex2
  | .w => S.capByIndex S.oppIndex1
  | .s1 =>
      SelectedClass A
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s1)
        (radiusOf .s1)
  | .s2 =>
      SelectedClass A
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s2)
        (radiusOf .s2)
  | .s3 =>
      SelectedClass A
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s3)
        (radiusOf .s3)
  | .Pw => SelectedClass A p₁ radius
  | .Pu => SelectedClass A p₂ radius
  | .Q1 =>
      SelectedClass A
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Q1)
        (radiusOf .Q1)
  | .Q2 =>
      SelectedClass A
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Q2)
        (radiusOf .Q2)

/-- Producer for the reduced right finite-candidate packet from the concrete
erased-payload center classes, generated prefix counts, and generated
separation certificates. -/
theorem rightFiniteCandidateSepFacts_of_erasedPayloadCenterClass
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {radius : ℝ}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (radiusOf : Label → ℝ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
          (labelOfHullFin i)))
    (hcandidate : ∀ sstar : Label,
      isSurplusStar sstar = true →
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
          (OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (rightPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3
                radius radiusOf)
              ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (rightPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3
                radius radiusOf)
              ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                OneSidedSeed))) :
    RightOneSidedErasedPayloadFiniteCandidateSepFacts
      S x radius p₁ p₂ q₁ q₂ s1 s2 s3 := by
  classical
  let centerClass :=
    rightPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3 radius
      radiusOf
  have hvClass : centerClass .v = S.capByIndex S.oppIndex1 := rfl
  have hwClass : centerClass .w = S.capByIndex S.oppIndex2 := rfl
  have hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius := rfl
  have hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius := rfl
  have hselectedOther : ∀ center : Label,
      center ≠ .v → center ≠ .w → center ≠ .Pw → center ≠ .Pu →
        centerClass center =
          SelectedClass A
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
            (radiusOf center) := by
    intro center hv hw hPw hPu
    cases center <;> simp [centerClass, rightPinnedErasedPayloadCenterClass] at hv hw hPw hPu ⊢
  have hcounts :
      PrefixPairCountsOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) :=
    prefixPairCountsOK_rightPinnedLabelPoint_of_exactCaps_selectedClasses
      S hconv hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I
      hs3I hp12 hq12 hs12 hs13 hs23 hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  have hsep : ∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
          sepOKFor
            (shadowOfPointClasses
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass) c cp a b = true :=
    rightPinned_sepOKFor_of_exactCaps_selectedClasses
      S hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12
      hq12 hs12 hs13 hs23 hccw hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  have hsearchSep : ∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
        crossSeparationOKForMasks c
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass c)) cp
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass cp)) = true :=
    rightPinned_crossSeparationOKForMasks_of_exactCaps_selectedClasses
      S hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12
      hq12 hs12 hs13 hs23 hccw hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  refine
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      ?_, hcounts, hsep, hsearchSep⟩
  intro sstar hsstar hsstar_eq
  simpa [centerClass] using hcandidate sstar hsstar hsstar_eq

/-- Left-oriented mirror of
`rightFiniteCandidateSepFacts_of_erasedPayloadCenterClass`. -/
theorem leftFiniteCandidateSepFacts_of_erasedPayloadCenterClass
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {radius : ℝ}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (radiusOf : Label → ℝ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
          (labelOfHullFin i)))
    (hcandidate : ∀ sstar : Label,
      isSurplusStar sstar = true →
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
          (OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (leftPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3
                radius radiusOf)
              ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (leftPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3
                radius radiusOf)
              ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                OneSidedSeed))) :
    LeftOneSidedErasedPayloadFiniteCandidateSepFacts
      S x radius p₁ p₂ q₁ q₂ s1 s2 s3 := by
  classical
  let centerClass :=
    leftPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3 radius
      radiusOf
  have hvClass : centerClass .v = S.capByIndex S.oppIndex2 := rfl
  have hwClass : centerClass .w = S.capByIndex S.oppIndex1 := rfl
  have hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius := rfl
  have hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius := rfl
  have hselectedOther : ∀ center : Label,
      center ≠ .v → center ≠ .w → center ≠ .Pw → center ≠ .Pu →
        centerClass center =
          SelectedClass A
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
            (radiusOf center) := by
    intro center hv hw hPw hPu
    cases center <;> simp [centerClass, leftPinnedErasedPayloadCenterClass] at hv hw hPw hPu ⊢
  have hcounts :
      PrefixPairCountsOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) :=
    prefixPairCountsOK_leftPinnedLabelPoint_of_exactCaps_selectedClasses
      S hconv hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I
      hs3I hp12 hq12 hs12 hs13 hs23 hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  have hsep : ∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
          sepOKFor
            (shadowOfPointClasses
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass) c cp a b = true :=
    leftPinned_sepOKFor_of_exactCaps_selectedClasses
      S hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12
      hq12 hs12 hs13 hs23 hccw hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  have hsearchSep : ∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
        crossSeparationOKForMasks c
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass c)) cp
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass cp)) = true :=
    leftPinned_crossSeparationOKForMasks_of_exactCaps_selectedClasses
      S hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12
      hq12 hs12 hs13 hs23 hccw hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  refine
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      ?_, hcounts, hsep, hsearchSep⟩
  intro sstar hsstar hsstar_eq
  simpa [centerClass] using hcandidate sstar hsstar hsstar_eq

/-- Reflected-hull variant of
`rightFiniteCandidateSepFacts_of_erasedPayloadCenterClass`, used by the
nonmatching P1 orientation branch. -/
theorem rightFiniteCandidateSepFacts_of_reflectedErasedPayloadCenterClass
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {radius : ℝ}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (radiusOf : Label → ℝ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
          (reflectedHullLabel (labelOfHullFin i))))
    (hcandidate : ∀ sstar : Label,
      isSurplusStar sstar = true →
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
          (OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (rightPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3
                radius radiusOf)
              ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (rightPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3
                radius radiusOf)
              ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                OneSidedSeed))) :
    RightOneSidedErasedPayloadFiniteCandidateSepFacts
      S x radius p₁ p₂ q₁ q₂ s1 s2 s3 := by
  classical
  let centerClass :=
    rightPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3 radius
      radiusOf
  have hvClass : centerClass .v = S.capByIndex S.oppIndex1 := rfl
  have hwClass : centerClass .w = S.capByIndex S.oppIndex2 := rfl
  have hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius := rfl
  have hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius := rfl
  have hselectedOther : ∀ center : Label,
      center ≠ .v → center ≠ .w → center ≠ .Pw → center ≠ .Pu →
        centerClass center =
          SelectedClass A
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
            (radiusOf center) := by
    intro center hv hw hPw hPu
    cases center <;>
      simp [centerClass, rightPinnedErasedPayloadCenterClass] at hv hw hPw hPu ⊢
  have hcounts :
      PrefixPairCountsOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) :=
    prefixPairCountsOK_rightPinnedLabelPoint_of_exactCaps_selectedClasses
      S hconv hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I
      hs3I hp12 hq12 hs12 hs13 hs23 hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  have hsearchSep : ∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
        crossSeparationOKForMasks c
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass c)) cp
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass cp)) = true :=
    rightPinned_crossSeparationOKForMasks_of_reflectedExactCaps_selectedClasses
      S hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12
      hq12 hs12 hs13 hs23 hccw hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  have hsep : ∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
          sepOKFor
            (shadowOfPointClasses
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass) c cp a b = true := by
    intro c cp a b hcenterPair hab
    exact
      sepOKFor_of_crossSeparationOKForMasks
        (hsearchSep c cp (labelPairs_mem_orderedLabelPairs hcenterPair)) hab
  refine
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      ?_, hcounts, hsep, hsearchSep⟩
  intro sstar hsstar hsstar_eq
  simpa [centerClass] using hcandidate sstar hsstar hsstar_eq

/-- Reflected-hull variant of
`leftFiniteCandidateSepFacts_of_erasedPayloadCenterClass`, used by the
nonmatching P1 orientation branch. -/
theorem leftFiniteCandidateSepFacts_of_reflectedErasedPayloadCenterClass
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {radius : ℝ}
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (radiusOf : Label → ℝ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 =>
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
          (reflectedHullLabel (labelOfHullFin i))))
    (hcandidate : ∀ sstar : Label,
      isSurplusStar sstar = true →
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
          (OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (leftPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3
                radius radiusOf)
              ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                OneSidedSeed) ∧
            OneSidedSeedCandidateRemainder
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (leftPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3
                radius radiusOf)
              ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                  privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                OneSidedSeed))) :
    LeftOneSidedErasedPayloadFiniteCandidateSepFacts
      S x radius p₁ p₂ q₁ q₂ s1 s2 s3 := by
  classical
  let centerClass :=
    leftPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂ s1 s2 s3 radius
      radiusOf
  have hvClass : centerClass .v = S.capByIndex S.oppIndex2 := rfl
  have hwClass : centerClass .w = S.capByIndex S.oppIndex1 := rfl
  have hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius := rfl
  have hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius := rfl
  have hselectedOther : ∀ center : Label,
      center ≠ .v → center ≠ .w → center ≠ .Pw → center ≠ .Pu →
        centerClass center =
          SelectedClass A
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
            (radiusOf center) := by
    intro center hv hw hPw hPu
    cases center <;>
      simp [centerClass, leftPinnedErasedPayloadCenterClass] at hv hw hPw hPu ⊢
  have hcounts :
      PrefixPairCountsOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) :=
    prefixPairCountsOK_leftPinnedLabelPoint_of_exactCaps_selectedClasses
      S hconv hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I
      hs3I hp12 hq12 hs12 hs13 hs23 hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  have hsearchSep : ∀ c cp : Label,
      (c, cp) ∈ orderedLabelPairs →
        crossSeparationOKForMasks c
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass c)) cp
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass cp)) = true :=
    leftPinned_crossSeparationOKForMasks_of_reflectedExactCaps_selectedClasses
      S hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12
      hq12 hs12 hs13 hs23 hccw hvClass hwClass hprivatePwClass
      hprivatePuClass hselectedOther
  have hsep : ∀ c cp a b : Label,
      (c, cp) ∈ labelPairs →
        (a, b) ∈ labelPairs →
          sepOKFor
            (shadowOfPointClasses
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              centerClass) c cp a b = true := by
    intro c cp a b hcenterPair hab
    exact
      sepOKFor_of_crossSeparationOKForMasks
        (hsearchSep c cp (labelPairs_mem_orderedLabelPairs hcenterPair)) hab
  refine
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      ?_, hcounts, hsep, hsearchSep⟩
  intro sstar hsstar hsstar_eq
  simpa [centerClass] using hcandidate sstar hsstar hsstar_eq

/-- A right-oriented finite point-class fact packet supplies the named surface
once the erased surplus point lies in the selected surplus triple. -/
theorem rightOneSidedErasedPayloadNamedCandidateFacts_of_finiteCandidateFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    RightOneSidedErasedPayloadNamedCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3 := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  rcases hcandidate sstar hsstar hsstar_eq with
    ⟨hcandidateOwnPw, hcandidateOwnPu, hcandidateOppositePwU,
      hcandidateOppositePwW, hcandidateOppositePuU,
      hcandidateOppositePuW⟩
  exact
    ⟨centerClass, sstar, hsstar, hsstar_eq, hvClass, hwClass,
      hprivatePwClass, hprivatePuClass, hcandidateOwnPw,
      hcandidateOwnPu, hcandidateOppositePwU, hcandidateOppositePwW,
      hcandidateOppositePuU, hcandidateOppositePuW, hno3, hcounts,
      hsep, hsearchSep⟩

/-- In the right pure surplus row `(0,0,0,4)`, once three selected
surplus-side hits are named, the private selected class has exactly the
surplus-triple ten-label mask.  The selected class may contain an additional
unnamed surplus point, which is invisible to the ten-label mask. -/
theorem right_row0004_privateMask_eq_surplusTriple
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex1 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 0)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hpPair : p = p₁ ∨ p = p₂)
    (hs1Sel : s1 ∈ SelectedClass A p radius)
    (hs2Sel : s2 ∈ SelectedClass A p radius)
    (hs3Sel : s3 ∈ SelectedClass A p radius) :
    pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p radius) =
      maskOfLabels [.s1, .s2, .s3] := by
  classical
  let M := SelectedClass A p radius ∩ S.triangle.verts
  let C := SelectedClass A p radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase p
  let L := SelectedClass A p radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  have hMeq : M = ∅ := by
    have hMcard : M.card = 0 := by
      simpa [M, SurplusCapPacket.moserCount] using hm
    exact Finset.card_eq_zero.mp hMcard
  have hCeq : C = ∅ := by
    have hCcard : C.card = 0 := by
      simpa [C, SurplusCapPacket.sameCapCount] using hs
    exact Finset.card_eq_zero.mp hCcard
  have hLeq : L = ∅ := by
    have hLcard : L.card = 0 := by
      simpa [L, SurplusCapPacket.leftAdjCount] using hl
    exact Finset.card_eq_zero.mp hLcard
  have hnotTriangle (y : ℝ²) (hy : y ∈ S.triangle.verts) :
      y ∉ SelectedClass A p radius := by
    intro hySel
    have hyM : y ∈ M := Finset.mem_inter.mpr ⟨hySel, hy⟩
    simp [M, hMeq] at hyM
  have hnotSame (y : ℝ²)
      (hy : y ∈ (S.capInteriorByIndex S.oppIndex1).erase p) :
      y ∉ SelectedClass A p radius := by
    intro hySel
    have hyC : y ∈ C := Finset.mem_inter.mpr ⟨hySel, hy⟩
    simp [C, hCeq] at hyC
  have hnotLeft (y : ℝ²)
      (hy : y ∈ S.leftAdjacentInteriorByIndex S.oppIndex1) :
      y ∉ SelectedClass A p radius := by
    intro hySel
    have hyL : y ∈ L := Finset.mem_inter.mpr ⟨hySel, hy⟩
    simp [L, hLeq] at hyL
  have hu :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u ∉
        SelectedClass A p radius := by
    simpa [rightPinnedLabelPoint] using
      hnotTriangle (S.oppositeVertexByIndex S.surplusIdx)
        (S.oppositeVertexByIndex_mem_triangle_verts S.surplusIdx)
  have hv :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v ∉
        SelectedClass A p radius := by
    simpa [rightPinnedLabelPoint] using
      hnotTriangle (S.oppositeVertexByIndex S.oppIndex1)
        (S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex1)
  have hw :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w ∉
        SelectedClass A p radius := by
    simpa [rightPinnedLabelPoint] using
      hnotTriangle (S.oppositeVertexByIndex S.oppIndex2)
        (S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex2)
  have hq₁Left : q₁ ∈ S.leftAdjacentInteriorByIndex S.oppIndex1 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
      using hq₁Opp
  have hq₂Left : q₂ ∈ S.leftAdjacentInteriorByIndex S.oppIndex1 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
      using hq₂Opp
  have hQ1 :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Q1 ∉
        SelectedClass A p radius := by
    simpa [rightPinnedLabelPoint] using hnotLeft q₁ hq₁Left
  have hQ2 :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Q2 ∉
        SelectedClass A p radius := by
    simpa [rightPinnedLabelPoint] using hnotLeft q₂ hq₂Left
  have hs1Mem :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s1 ∈
        SelectedClass A p radius := by
    simpa [rightPinnedLabelPoint] using hs1Sel
  have hs2Mem :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s2 ∈
        SelectedClass A p radius := by
    simpa [rightPinnedLabelPoint] using hs2Sel
  have hs3Mem :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s3 ∈
        SelectedClass A p radius := by
    simpa [rightPinnedLabelPoint] using hs3Sel
  have hcap :
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior1] using hpair
  rcases hpPair with rfl | rfl
  · have hpNotSel : p ∉ SelectedClass A p radius := by
      intro hpSel
      have hdist : dist p p = radius := (mem_selectedClass.mp hpSel).2
      have hzero : (0 : ℝ) = radius := by simpa using hdist
      linarith
    have hp₂Erase :
        p₂ ∈ (S.capInteriorByIndex S.oppIndex1).erase p := by
      rw [hcap]
      simp [hp12.symm]
    have hPw :
        rightPinnedLabelPoint S p p₂ q₁ q₂ s1 s2 s3 .Pw ∉
          SelectedClass A p radius := by
      simpa [rightPinnedLabelPoint] using hpNotSel
    have hPu :
        rightPinnedLabelPoint S p p₂ q₁ q₂ s1 s2 s3 .Pu ∉
          SelectedClass A p radius := by
      simpa [rightPinnedLabelPoint] using hnotSame p₂ hp₂Erase
    exact pointMask_eq_surplusTripleMask_of_label_members hu hv hw
      hs1Mem hs2Mem hs3Mem hPw hPu hQ1 hQ2
  · have hpNotSel : p ∉ SelectedClass A p radius := by
      intro hpSel
      have hdist : dist p p = radius := (mem_selectedClass.mp hpSel).2
      have hzero : (0 : ℝ) = radius := by simpa using hdist
      linarith
    have hp₁Erase :
        p₁ ∈ (S.capInteriorByIndex S.oppIndex1).erase p := by
      rw [hcap]
      simp [hp12]
    have hPw :
        rightPinnedLabelPoint S p₁ p q₁ q₂ s1 s2 s3 .Pw ∉
          SelectedClass A p radius := by
      simpa [rightPinnedLabelPoint] using hnotSame p₁ hp₁Erase
    have hPu :
        rightPinnedLabelPoint S p₁ p q₁ q₂ s1 s2 s3 .Pu ∉
          SelectedClass A p radius := by
      simpa [rightPinnedLabelPoint] using hpNotSel
    exact pointMask_eq_surplusTripleMask_of_label_members hu hv hw
      hs1Mem hs2Mem hs3Mem hPw hPu hQ1 hQ2

/-- The right exact row `(0,0,0,4)` closes from the finite point-class packet:
three named surplus-side selected hits force the private mask to be the pure
surplus triple, which cannot be cross-separated from any admissible `.u`
class. -/
theorem false_of_right_row0004_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex1 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 0)
    (_hr : S.rightAdjCount S.oppIndex1 p radius = 4)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs1Sel : s1 ∈ SelectedClass A p radius)
    (hs2Sel : s2 ∈ SelectedClass A p radius)
    (hs3Sel : s3 ∈ SelectedClass A p radius)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  classical
  rcases hfacts with
    ⟨centerClass, _hvClass, _hwClass, hprivatePwClass,
      hprivatePuClass, hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  have hpPairMem : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPairMem
  have hprivateMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (SelectedClass A p radius) =
        maskOfLabels [.s1, .s2, .s3] :=
    right_row0004_privateMask_eq_surplusTriple S hradius_pos hm hs hl
      hp12 hpair hqpair hpPairMem hs1Sel hs2Sel hs3Sel
  rcases hpPairMem with hp_eq | hp_eq
  · subst p
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate sstar hsstar hsstar_eq).1
    have hu :
        pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u) ∈ candidateMasks sstar .u := by
      have hmem := hterminal .u (by decide) (by decide) (by simp)
      exact mem_candidateMasks_u_of_mem_seed_candidateMasks hsstar hmem
    have hprivate :
        pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Pw) =
          maskOfLabels [.s1, .s2, .s3] := by
      rw [hprivatePwClass]
      exact hprivateMask
    exact false_of_privateSurplusTriple_u_crossSeparation
      hsstar (Or.inl rfl) hu hprivate hsearchSep
  · subst p
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate sstar hsstar hsstar_eq).2.1
    have hu :
        pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u) ∈ candidateMasks sstar .u := by
      have hmem := hterminal .u (by decide) (by decide) (by simp)
      exact mem_candidateMasks_u_of_mem_seed_candidateMasks hsstar hmem
    have hprivate :
        pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Pu) =
          maskOfLabels [.s1, .s2, .s3] := by
      rw [hprivatePuClass]
      exact hprivateMask
    exact false_of_privateSurplusTriple_u_crossSeparation
      hsstar (Or.inr rfl) hu hprivate hsearchSep

/-- In the left pure surplus row `(0,0,4,0)`, once three selected
surplus-side hits are named, the private selected class has exactly the
surplus-triple ten-label mask.  The selected class may contain an additional
unnamed surplus point, which is invisible to the ten-label mask. -/
theorem left_row0040_privateMask_eq_surplusTriple
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex2 p radius = 0)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 0)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hpPair : p = p₁ ∨ p = p₂)
    (hs1Sel : s1 ∈ SelectedClass A p radius)
    (hs2Sel : s2 ∈ SelectedClass A p radius)
    (hs3Sel : s3 ∈ SelectedClass A p radius) :
    pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p radius) =
      maskOfLabels [.s1, .s2, .s3] := by
  classical
  let M := SelectedClass A p radius ∩ S.triangle.verts
  let C := SelectedClass A p radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase p
  let R := SelectedClass A p radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMeq : M = ∅ := by
    have hMcard : M.card = 0 := by
      simpa [M, SurplusCapPacket.moserCount] using hm
    exact Finset.card_eq_zero.mp hMcard
  have hCeq : C = ∅ := by
    have hCcard : C.card = 0 := by
      simpa [C, SurplusCapPacket.sameCapCount] using hs
    exact Finset.card_eq_zero.mp hCcard
  have hReq : R = ∅ := by
    have hRcard : R.card = 0 := by
      simpa [R, SurplusCapPacket.rightAdjCount] using hr
    exact Finset.card_eq_zero.mp hRcard
  have hnotTriangle (y : ℝ²) (hy : y ∈ S.triangle.verts) :
      y ∉ SelectedClass A p radius := by
    intro hySel
    have hyM : y ∈ M := Finset.mem_inter.mpr ⟨hySel, hy⟩
    simp [M, hMeq] at hyM
  have hnotSame (y : ℝ²)
      (hy : y ∈ (S.capInteriorByIndex S.oppIndex2).erase p) :
      y ∉ SelectedClass A p radius := by
    intro hySel
    have hyC : y ∈ C := Finset.mem_inter.mpr ⟨hySel, hy⟩
    simp [C, hCeq] at hyC
  have hnotRight (y : ℝ²)
      (hy : y ∈ S.rightAdjacentInteriorByIndex S.oppIndex2) :
      y ∉ SelectedClass A p radius := by
    intro hySel
    have hyR : y ∈ R := Finset.mem_inter.mpr ⟨hySel, hy⟩
    simp [R, hReq] at hyR
  have hu :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u ∉
        SelectedClass A p radius := by
    simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel] using
      hnotTriangle (S.oppositeVertexByIndex S.surplusIdx)
        (S.oppositeVertexByIndex_mem_triangle_verts S.surplusIdx)
  have hv :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v ∉
        SelectedClass A p radius := by
    simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel] using
      hnotTriangle (S.oppositeVertexByIndex S.oppIndex2)
        (S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex2)
  have hw :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w ∉
        SelectedClass A p radius := by
    simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel] using
      hnotTriangle (S.oppositeVertexByIndex S.oppIndex1)
        (S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex1)
  have hq₁Right : q₁ ∈ S.rightAdjacentInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior1 := by
      rw [hqpair]
      simp
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
      using hq₁Opp
  have hq₂Right : q₂ ∈ S.rightAdjacentInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior1 := by
      rw [hqpair]
      simp
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
      using hq₂Opp
  have hQ1 :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Q1 ∉
        SelectedClass A p radius := by
    simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel] using hnotRight q₁ hq₁Right
  have hQ2 :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Q2 ∉
        SelectedClass A p radius := by
    simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel] using hnotRight q₂ hq₂Right
  have hs1Mem :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s1 ∈
        SelectedClass A p radius := by
    simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel] using hs1Sel
  have hs2Mem :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s2 ∈
        SelectedClass A p radius := by
    simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel] using hs2Sel
  have hs3Mem :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .s3 ∈
        SelectedClass A p radius := by
    simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel] using hs3Sel
  have hcap :
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior2] using hpair
  rcases hpPair with rfl | rfl
  · have hpNotSel : p ∉ SelectedClass A p radius := by
      intro hpSel
      have hdist : dist p p = radius := (mem_selectedClass.mp hpSel).2
      have hzero : (0 : ℝ) = radius := by simpa using hdist
      linarith
    have hp₂Erase :
        p₂ ∈ (S.capInteriorByIndex S.oppIndex2).erase p := by
      rw [hcap]
      simp [hp12.symm]
    have hPw :
        leftPinnedLabelPoint S p p₂ q₁ q₂ s1 s2 s3 .Pw ∉
          SelectedClass A p radius := by
      simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel] using hpNotSel
    have hPu :
        leftPinnedLabelPoint S p p₂ q₁ q₂ s1 s2 s3 .Pu ∉
          SelectedClass A p radius := by
      simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel] using hnotSame p₂ hp₂Erase
    exact pointMask_eq_surplusTripleMask_of_label_members hu hv hw
      hs1Mem hs2Mem hs3Mem hPw hPu hQ1 hQ2
  · have hpNotSel : p ∉ SelectedClass A p radius := by
      intro hpSel
      have hdist : dist p p = radius := (mem_selectedClass.mp hpSel).2
      have hzero : (0 : ℝ) = radius := by simpa using hdist
      linarith
    have hp₁Erase :
        p₁ ∈ (S.capInteriorByIndex S.oppIndex2).erase p := by
      rw [hcap]
      simp [hp12]
    have hPw :
        leftPinnedLabelPoint S p₁ p q₁ q₂ s1 s2 s3 .Pw ∉
          SelectedClass A p radius := by
      simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel] using hnotSame p₁ hp₁Erase
    have hPu :
        leftPinnedLabelPoint S p₁ p q₁ q₂ s1 s2 s3 .Pu ∉
          SelectedClass A p radius := by
      simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel] using hpNotSel
    exact pointMask_eq_surplusTripleMask_of_label_members hu hv hw
      hs1Mem hs2Mem hs3Mem hPw hPu hQ1 hQ2

/-- The left exact row `(0,0,4,0)` closes from the finite point-class packet:
three named surplus-side selected hits force the private mask to be the pure
surplus triple, which cannot be cross-separated from any admissible `.u`
class. -/
theorem false_of_left_row0040_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex2 p radius = 0)
    (_hl : S.leftAdjCount S.oppIndex2 p radius = 4)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 0)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs1Sel : s1 ∈ SelectedClass A p radius)
    (hs2Sel : s2 ∈ SelectedClass A p radius)
    (hs3Sel : s3 ∈ SelectedClass A p radius)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  classical
  rcases hfacts with
    ⟨centerClass, _hvClass, _hwClass, hprivatePwClass,
      hprivatePuClass, hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  have hpPairMem : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPairMem
  have hprivateMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (SelectedClass A p radius) =
        maskOfLabels [.s1, .s2, .s3] :=
    left_row0040_privateMask_eq_surplusTriple S hradius_pos hm hs hr
      hp12 hpair hqpair hpPairMem hs1Sel hs2Sel hs3Sel
  rcases hpPairMem with hp_eq | hp_eq
  · subst p
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate sstar hsstar hsstar_eq).1
    have hu :
        pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u) ∈ candidateMasks sstar .u := by
      have hmem := hterminal .u (by decide) (by decide) (by simp)
      exact mem_candidateMasks_u_of_mem_seed_candidateMasks hsstar hmem
    have hprivate :
        pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Pw) =
          maskOfLabels [.s1, .s2, .s3] := by
      rw [hprivatePwClass]
      exact hprivateMask
    exact false_of_privateSurplusTriple_u_crossSeparation
      hsstar (Or.inl rfl) hu hprivate hsearchSep
  · subst p
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate sstar hsstar hsstar_eq).2.1
    have hu :
        pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u) ∈ candidateMasks sstar .u := by
      have hmem := hterminal .u (by decide) (by decide) (by simp)
      exact mem_candidateMasks_u_of_mem_seed_candidateMasks hsstar hmem
    have hprivate :
        pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Pu) =
          maskOfLabels [.s1, .s2, .s3] := by
      rw [hprivatePuClass]
      exact hprivateMask
    exact false_of_privateSurplusTriple_u_crossSeparation
      hsstar (Or.inr rfl) hu hprivate hsearchSep

/-- The right exact row `(0,0,1,3)` closes from the finite point-class packet,
provided the named surplus triple contains the row's three surplus-side
selected hits.  The terminal candidate remainders in the finite scaffold
transfer to the residual row seed because non-fixed candidate lists depend
only on the surplus-star and private-center labels. -/
theorem false_of_right_row0013_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex1 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 3)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3)
    (hp : p ∈ S.oppInterior1)
    (hRtriple : SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row0013_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hqpair hRtriple hs12 hs13 hs23 hxR
        (privateCenter := .Pw) (Or.inl rfl) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m0_s0_l1_r3_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases right_row0013_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hqpair hRtriple hs12 hs13 hs23 hxR
        (privateCenter := .Pu) (Or.inr rfl) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m0_s0_l1_r3_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The left exact row `(0,0,3,1)` closes from the finite point-class packet,
provided the named surplus triple contains the row's three surplus-side
selected hits.  The terminal candidate remainders in the finite scaffold
transfer to the residual row seed because non-fixed candidate lists depend
only on the surplus-star and private-center labels. -/
theorem false_of_left_row0031_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex2 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 3)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3)
    (hp : p ∈ S.oppInterior2)
    (hLtriple : SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row0031_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hqpair hLtriple hs12 hs13 hs23 hxL
        (privateCenter := .Pw) (Or.inl rfl) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m0_s0_l3_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases left_row0031_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hqpair hLtriple hs12 hs13 hs23 hxL
        (privateCenter := .Pu) (Or.inr rfl) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m0_s0_l3_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The right exact row `(0,1,0,3)` closes from the finite point-class packet,
provided the named surplus triple contains the row's three surplus-side
selected hits. -/
theorem false_of_right_row0103_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex1 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 0)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 3)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3)
    (hp : p ∈ S.oppInterior1)
    (hRtriple : SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row0103_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hRtriple
        hs12 hs13 hs23 hxR
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m0_s1_l0_r3_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases right_row0103_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hRtriple
        hs12 hs13 hs23 hxR
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m0_s1_l0_r3_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The left exact row `(0,1,3,0)` closes from the finite point-class packet,
provided the named surplus triple contains the row's three surplus-side
selected hits. -/
theorem false_of_left_row0130_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex2 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 3)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 0)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3)
    (hp : p ∈ S.oppInterior2)
    (hLtriple : SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row0130_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hLtriple
        hs12 hs13 hs23 hxL
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m0_s1_l3_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases left_row0130_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hLtriple
        hs12 hs13 hs23 hxL
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m0_s1_l3_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The right exact row `(1,0,0,3)` closes from the finite point-class packet,
provided the named surplus triple contains the row's three surplus-side
selected hits. -/
theorem false_of_right_row1003_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex1 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 0)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 3)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3)
    (hp : p ∈ S.oppInterior1)
    (hRtriple : SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row1003_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hRtriple hs12 hs13 hs23 hxR
        (privateCenter := .Pw) (Or.inl rfl) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m1_s0_l0_r3_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases right_row1003_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hRtriple hs12 hs13 hs23 hxR
        (privateCenter := .Pu) (Or.inr rfl) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m1_s0_l0_r3_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The left exact row `(1,0,3,0)` closes from the finite point-class packet,
provided the named surplus triple contains the row's three surplus-side
selected hits. -/
theorem false_of_left_row1030_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex2 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 3)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 0)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3)
    (hp : p ∈ S.oppInterior2)
    (hLtriple : SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row1030_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hLtriple hs12 hs13 hs23 hxL
        (privateCenter := .Pw) (Or.inl rfl) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m1_s0_l3_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases left_row1030_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hLtriple hs12 hs13 hs23 hxL
        (privateCenter := .Pu) (Or.inr rfl) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m1_s0_l3_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The right exact row `(0,0,2,2)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits.  The proof keeps the row-specific finite data visible; the bare exact
count row alone does not contain the masks or cross-separation table. -/
theorem false_of_right_row0022_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex1 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hRtriple : SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, _hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      _hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    exact false_of_right_row0022_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hRtriple hxR
      (privateCenter := .Pw) (Or.inl rfl) hprivatePwClass hwMask
      hsearchSep
  · subst p
    exact false_of_right_row0022_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hRtriple hxR
      (privateCenter := .Pu) (Or.inr rfl) hprivatePuClass hwMask
      hsearchSep

/-- The right exact row `(0,1,2,1)` closes from the finite point-class packet,
provided the named surplus triple contains the row's surplus-side singleton.
-/
theorem false_of_right_row0121_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex1 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, _hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      _hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    exact false_of_right_row0121_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxR
      (privateCenter := .Pw) (otherPrivate := .Pu)
      (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass hwMask hsearchSep
  · subst p
    exact false_of_right_row0121_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxR
      (privateCenter := .Pu) (otherPrivate := .Pw)
      (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass hwMask hsearchSep

/-- The right exact row `(0,1,1,2)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits. -/
theorem false_of_right_row0112_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex1 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hRtriple : SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row0112_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hqpair hRtriple hxR
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m0_s1_l1_r2_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases right_row0112_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hqpair hRtriple hxR
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m0_s1_l1_r2_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The right exact row `(1,0,1,2)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits. -/
theorem false_of_right_row1012_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex1 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hRtriple : SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row1012_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hqpair hRtriple hxR
        (privateCenter := .Pw) (Or.inl rfl) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m1_s0_l1_r2_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases right_row1012_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hqpair hRtriple hxR
        (privateCenter := .Pu) (Or.inr rfl) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m1_s0_l1_r2_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The right exact row `(1,1,1,1)` closes from the finite point-class packet,
provided the named surplus triple contains the row's surplus-side singleton.
-/
theorem false_of_right_row1111_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex1 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row1111_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxR
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m1_s1_l1_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases right_row1111_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxR
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m1_s1_l1_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The right exact row `(1,1,0,2)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits. -/
theorem false_of_right_row1102_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex1 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 0)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hRtriple : SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row1102_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hRtriple hxR
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m1_s1_l0_r2_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases right_row1102_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hRtriple hxR
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m1_s1_l0_r2_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The right exact row `(2,0,0,2)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits. -/
theorem false_of_right_row2002_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 2)
    (hs : S.sameCapCount S.oppIndex1 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 0)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hRtriple : SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row2002_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hRtriple hxR
        (privateCenter := .Pw) (Or.inl ⟨rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m2_s0_l0_r2_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases right_row2002_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hRtriple hxR
        (privateCenter := .Pu) (Or.inr ⟨rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m2_s0_l0_r2_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The right exact row `(1,0,2,1)` closes from the finite point-class packet,
provided the named surplus triple contains the row's surplus-side singleton.
-/
theorem false_of_right_row1021_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex1 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, _hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      _hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    exact false_of_right_row1021_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxR
      (privateCenter := .Pw) (Or.inl ⟨rfl, rfl⟩) hprivatePwClass
      hwMask hsearchSep
  · subst p
    exact false_of_right_row1021_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxR
      (privateCenter := .Pu) (Or.inr ⟨rfl, rfl⟩) hprivatePuClass
      hwMask hsearchSep

/-- The right exact row `(2,0,1,1)` closes from the finite point-class packet,
provided the named surplus triple contains the row's surplus-side singleton.
-/
theorem false_of_right_row2011_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 2)
    (hs : S.sameCapCount S.oppIndex1 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 p radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 p radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A p radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, _hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      _hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    exact false_of_right_row2011_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxR
      (privateCenter := .Pw) (Or.inl ⟨rfl, rfl⟩) hprivatePwClass
      hwMask hsearchSep
  · subst p
    exact false_of_right_row2011_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxR
      (privateCenter := .Pu) (Or.inr ⟨rfl, rfl⟩) hprivatePuClass
      hwMask hsearchSep

/-- The left exact row `(0,1,1,2)` closes from the finite point-class packet,
provided the named surplus triple contains the row's surplus-side singleton.
-/
theorem false_of_left_row0112_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex2 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, _hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      _hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    exact false_of_left_row0112_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxL
      (privateCenter := .Pw) (otherPrivate := .Pu)
      (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass hwMask hsearchSep
  · subst p
    exact false_of_left_row0112_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxL
      (privateCenter := .Pu) (otherPrivate := .Pw)
      (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass hwMask hsearchSep

/-- The left exact row `(0,1,2,1)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits. -/
theorem false_of_left_row0121_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex2 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hLtriple : SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row0121_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hqpair hLtriple hxL
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m0_s1_l2_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases left_row0121_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hqpair hLtriple hxL
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m0_s1_l2_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The left exact row `(1,0,2,1)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits. -/
theorem false_of_left_row1021_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex2 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hLtriple : SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row1021_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hqpair hLtriple hxL
        (privateCenter := .Pw) (Or.inl rfl) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m1_s0_l2_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases left_row1021_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hqpair hLtriple hxL
        (privateCenter := .Pu) (Or.inr rfl) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m1_s0_l2_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The left exact row `(1,1,1,1)` closes from the finite point-class packet,
provided the named surplus triple contains the row's surplus-side singleton.
-/
theorem false_of_left_row1111_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex2 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row1111_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxL
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m1_s1_l1_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases left_row1111_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxL
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m1_s1_l1_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The left exact row `(1,1,2,0)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits. -/
theorem false_of_left_row1120_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex2 p radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 0)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hLtriple : SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row1120_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hLtriple hxL
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m1_s1_l2_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases left_row1120_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hp12 hpair hLtriple hxL
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m1_s1_l2_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The left exact row `(2,0,2,0)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits. -/
theorem false_of_left_row2020_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 2)
    (hs : S.sameCapCount S.oppIndex2 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 0)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hLtriple : SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row2020_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hLtriple hxL
        (privateCenter := .Pw) (Or.inl ⟨rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m2_s0_l2_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases left_row2020_exists_erasedPinRowSeed_privateMask S hM44
        hradius_pos hm hs hl hr hinj hLtriple hxL
        (privateCenter := .Pu) (Or.inr ⟨rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m2_s0_l2_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The right terminal row `(2,1,0,1)` closes from the finite point-class
packet and the exact erased-payload geometry.  The proof splits the named
private center first, so only the corresponding own-private candidate
remainder is consumed. -/
theorem false_of_right_row2101_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p x radius)
    (hfacts :
      RightOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row2101_exists_erasedPinRowSeed_privateMask S
        hpayload hinj hp12 hpair hxTriple
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m2_s1_l0_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases right_row2101_exists_erasedPinRowSeed_privateMask S
        hpayload hinj hp12 hpair hxTriple
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_right_m2_s1_l0_r1_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- The left terminal row `(2,1,1,0)` closes from the finite point-class
packet and the exact erased-payload geometry.  The proof splits the named
private center first, so only the corresponding own-private candidate
remainder is consumed. -/
theorem false_of_left_row2110_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p x radius)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row2110_exists_erasedPinRowSeed_privateMask S
        hpayload hinj hp12 hpair hxTriple
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pu] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m2_s1_l1_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep
  · subst p
    rcases left_row2110_exists_erasedPinRowSeed_privateMask S
        hpayload hinj hp12 hpair hxTriple
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, hsstar_eq, hprivateCenter, hprivate⟩
    have hterminal :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass
          ({ sstar := seed.sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] } :
            OneSidedSeed) := by
      exact (hcandidate seed.sstar hsstar hsstar_eq).2.1
    have hrem :
        OneSidedSeedCandidateRemainder
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass seed :=
      oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
        (seed := seed)
        (base :=
          { sstar := seed.sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, seed.sstar, .Pw] })
        rfl hprivateCenter hterminal
    exact false_of_erasedPinRow_ep_left_m2_s1_l1_r0_seedShadow_pointClasses
      hseed hsstar hvMask hwMask hprivate hrem hno3 hcounts hsep hsearchSep

/-- Relaxed-shape version of the right terminal row `(2,1,0,1)`.  This row
uses exact four-label/no-self shape for the non-cap centers instead of
candidate-mask membership. -/
theorem false_of_right_row2101_finiteRelaxedShapeFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p x radius)
    (hfacts :
      RightOneSidedErasedPayloadFiniteRelaxedShapeFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcard, hself, hcounts, hsep, hsearchSep⟩
  have hno3 :
      noThreeOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true :=
    noThreeOK_of_PrefixPairCountsOK hcounts
  have hvMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
      S hinj hpair
  have hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases right_row2101_exists_erasedPinRowSeed_privateMask S
        hpayload hinj hp12 hpair hxTriple
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
    exact false_of_erasedPinRow_ep_right_m2_s1_l0_r1_relaxedShape_pointClasses
      hseed hsstar hvMask hwMask hprivate hcard hself hno3 hcounts hsep
      hsearchSep
  · subst p
    rcases right_row2101_exists_erasedPinRowSeed_privateMask S
        hpayload hinj hp12 hpair hxTriple
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
    exact false_of_erasedPinRow_ep_right_m2_s1_l0_r1_relaxedShape_pointClasses
      hseed hsstar hvMask hwMask hprivate hcard hself hno3 hcounts hsep
      hsearchSep

/-- Relaxed-shape version of the left terminal row `(2,1,1,0)`.  This row
uses exact four-label/no-self shape for the non-cap centers instead of
candidate-mask membership. -/
theorem false_of_left_row2110_finiteRelaxedShapeFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p x radius)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteRelaxedShapeFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcard, hself, hcounts, hsep, hsearchSep⟩
  have hno3 :
      noThreeOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true :=
    noThreeOK_of_PrefixPairCountsOK hcounts
  have hvMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        firstOppExactCapMask := by
    rw [hvClass]
    exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
      S hinj hpair
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    rcases left_row2110_exists_erasedPinRowSeed_privateMask S
        hpayload hinj hp12 hpair hxTriple
        (privateCenter := .Pw) (otherPrivate := .Pu)
        (Or.inl ⟨rfl, rfl, rfl⟩) hprivatePwClass with
      ⟨seed, hseed, hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
    exact false_of_erasedPinRow_ep_left_m2_s1_l1_r0_relaxedShape_pointClasses
      hseed hsstar hvMask hwMask hprivate hcard hself hno3 hcounts hsep
      hsearchSep
  · subst p
    rcases left_row2110_exists_erasedPinRowSeed_privateMask S
        hpayload hinj hp12 hpair hxTriple
        (privateCenter := .Pu) (otherPrivate := .Pw)
        (Or.inr ⟨rfl, rfl, rfl⟩) hprivatePuClass with
      ⟨seed, hseed, hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
    exact false_of_erasedPinRow_ep_left_m2_s1_l1_r0_relaxedShape_pointClasses
      hseed hsstar hvMask hwMask hprivate hcard hself hno3 hcounts hsep
      hsearchSep

/-- The left exact row `(1,0,1,2)` closes from the finite point-class packet,
provided the named surplus triple contains the row's surplus-side singleton.
-/
theorem false_of_left_row1012_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 1)
    (hs : S.sameCapCount S.oppIndex2 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, _hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      _hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    exact false_of_left_row1012_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxL
      (privateCenter := .Pw) (Or.inl ⟨rfl, rfl⟩) hprivatePwClass
      hwMask hsearchSep
  · subst p
    exact false_of_left_row1012_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxL
      (privateCenter := .Pu) (Or.inr ⟨rfl, rfl⟩) hprivatePuClass
      hwMask hsearchSep

/-- The left exact row `(2,0,1,1)` closes from the finite point-class packet,
provided the named surplus triple contains the row's surplus-side singleton.
-/
theorem false_of_left_row2011_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 2)
    (hs : S.sameCapCount S.oppIndex2 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, _hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      _hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    exact false_of_left_row2011_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxL
      (privateCenter := .Pw) (Or.inl ⟨rfl, rfl⟩) hprivatePwClass
      hwMask hsearchSep
  · subst p
    exact false_of_left_row2011_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxL
      (privateCenter := .Pu) (Or.inr ⟨rfl, rfl⟩) hprivatePuClass
      hwMask hsearchSep

/-- The left exact row `(0,0,2,2)` closes from the finite point-class packet,
provided the named surplus triple contains the row's two surplus-side selected
hits.  The proof keeps the row-specific finite data visible; the bare exact
count row alone does not contain the masks or cross-separation table. -/
theorem false_of_left_row0022_finiteCandidateFacts
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {p x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount p radius = 0)
    (hs : S.sameCapCount S.oppIndex2 p radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 p radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 p radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hLtriple : SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A p radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    False := by
  rcases hfacts with
    ⟨centerClass, _hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      _hcandidate, _hno3, _hcounts, _hsep, hsearchSep⟩
  have hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask := by
    rw [hwClass]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  have hpPair : p ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpair] using hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hpPair
  rcases hpPair with hp_eq | hp_eq
  · subst p
    exact false_of_left_row0022_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hLtriple hxL
      (privateCenter := .Pw) (Or.inl rfl) hprivatePwClass hwMask
      hsearchSep
  · subst p
    exact false_of_left_row0022_private_w_crossSeparation S hM44
      hradius_pos hm hs hl hr hinj hqpair hLtriple hxL
      (privateCenter := .Pu) (Or.inr rfl) hprivatePuClass hwMask
      hsearchSep

/-- A left-oriented finite point-class fact packet supplies the named surface
once the erased surplus point lies in the selected surplus triple. -/
theorem leftOneSidedErasedPayloadNamedCandidateFacts_of_finiteCandidateFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hfacts :
      LeftOneSidedErasedPayloadFiniteCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    LeftOneSidedErasedPayloadNamedCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3 := by
  rcases hfacts with
    ⟨centerClass, hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidate, hno3, hcounts, hsep, hsearchSep⟩
  rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  rcases hcandidate sstar hsstar hsstar_eq with
    ⟨hcandidateOwnPw, hcandidateOwnPu, hcandidateOppositePwU,
      hcandidateOppositePwW, hcandidateOppositePuU,
      hcandidateOppositePuW⟩
  exact
    ⟨centerClass, sstar, hsstar, hsstar_eq, hvClass, hwClass,
      hprivatePwClass, hprivatePuClass, hcandidateOwnPw,
      hcandidateOwnPu, hcandidateOppositePwU, hcandidateOppositePwW,
      hcandidateOppositePuU, hcandidateOppositePuW, hno3, hcounts,
      hsep, hsearchSep⟩

/-- Structural adapter from named right-oriented point-class facts to the
current right seed-candidate payload input. -/
theorem rightOneSidedErasedPayloadSeedCandidateInputs_of_namedCandidateFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {p x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hfacts :
      RightOneSidedErasedPayloadNamedCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    RightOneSidedErasedPayloadSeedCandidateInputs S p x radius := by
  rcases hfacts with
    ⟨centerClass, sstar, hsstar, hsstar_eq, hvClass, hwClass,
      hprivatePwClass, hprivatePuClass, hcandidateOwnPw,
      hcandidateOwnPu, hcandidateOppositePwU, hcandidateOppositePwW,
      hcandidateOppositePuU, hcandidateOppositePuW, hno3, hcounts,
      hsep, hsearchSep⟩
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
    rightPinnedLabelPoint_injective_of_mem S hp₁I hp₂I hq₁I hq₂I
      hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  exact
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar, hinj,
      hsstar, hsstar_eq, hp12, hpair, hqpair, hp, hvClass, hwClass,
      hprivatePwClass, hprivatePuClass, hcandidateOwnPw,
      hcandidateOwnPu, hcandidateOppositePwU, hcandidateOppositePwW,
      hcandidateOppositePuU, hcandidateOppositePuW, hno3, hcounts,
      hsep, hsearchSep⟩

/-- Structural adapter from named left-oriented point-class facts to the
current left seed-candidate payload input. -/
theorem leftOneSidedErasedPayloadSeedCandidateInputs_of_namedCandidateFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {p x : ℝ²} {radius : ℝ}
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hfacts :
      LeftOneSidedErasedPayloadNamedCandidateFacts
        S x radius p₁ p₂ q₁ q₂ s1 s2 s3) :
    LeftOneSidedErasedPayloadSeedCandidateInputs S p x radius := by
  rcases hfacts with
    ⟨centerClass, sstar, hsstar, hsstar_eq, hvClass, hwClass,
      hprivatePwClass, hprivatePuClass, hcandidateOwnPw,
      hcandidateOwnPu, hcandidateOppositePwU, hcandidateOppositePwW,
      hcandidateOppositePuU, hcandidateOppositePuW, hno3, hcounts,
      hsep, hsearchSep⟩
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
    leftPinnedLabelPoint_injective_of_mem S hp₁I hp₂I hq₁I hq₂I
      hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  exact
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar, hinj,
      hsstar, hsstar_eq, hp12, hpair, hqpair, hp, hvClass, hwClass,
      hprivatePwClass, hprivatePuClass, hcandidateOwnPw,
      hcandidateOwnPu, hcandidateOppositePwU, hcandidateOppositePwW,
      hcandidateOppositePuU, hcandidateOppositePuW, hno3, hcounts,
      hsep, hsearchSep⟩

/-- The older right seed-mask interface implies the current candidate-remainder
interface.  This keeps the stronger mask route reusable while the proof-facing
local obligation stays at candidate remainders. -/
theorem rightOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs
    {A : Finset ℝ²} {S : SurplusCapPacket A} {p x : ℝ²} {radius : ℝ}
    (hseed : RightOneSidedErasedPayloadSeedMaskInputs S p x radius) :
    RightOneSidedErasedPayloadSeedCandidateInputs S p x radius := by
  rcases hseed with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
      hinj, hsstar, hsstar_eq, hp12, hpair, hqpair, hp,
      hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcard, hself, huv, huw, hcirc, hno3, hcounts, hsep, hsearchSep,
      htriggerU, htriggerQ1, htriggerQ2, htriggerPrevious, hfinal⟩
  refine
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
      hinj, hsstar, hsstar_eq, hp12, hpair, hqpair, hp,
      hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      ?_, ?_, ?_, ?_, ?_, ?_, hno3, (fun assigned _ => hcounts assigned),
      (fun c cp a b _ _ => hsep c cp a b),
      (fun c cp _ => hsearchSep c cp)⟩
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal

/-- Mirror conversion from the older left seed-mask interface to the current
candidate-remainder interface. -/
theorem leftOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs
    {A : Finset ℝ²} {S : SurplusCapPacket A} {p x : ℝ²} {radius : ℝ}
    (hseed : LeftOneSidedErasedPayloadSeedMaskInputs S p x radius) :
    LeftOneSidedErasedPayloadSeedCandidateInputs S p x radius := by
  rcases hseed with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
      hinj, hsstar, hsstar_eq, hp12, hpair, hqpair, hp,
      hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcard, hself, huv, huw, hcirc, hno3, hcounts, hsep, hsearchSep,
      htriggerU, htriggerQ1, htriggerQ2, htriggerPrevious, hfinal⟩
  refine
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
      hinj, hsstar, hsstar_eq, hp12, hpair, hqpair, hp,
      hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      ?_, ?_, ?_, ?_, ?_, ?_, hno3, (fun assigned _ => hcounts assigned),
      (fun c cp a b _ _ => hsep c cp a b),
      (fun c cp _ => hsearchSep c cp)⟩
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal

/-- Feed the right candidate-remainder interface into the generated
seeded-shadow contradiction. -/
theorem false_of_rightOneSidedErasedPayload_of_seedCandidateInputs
    {A : Finset ℝ²} {S : SurplusCapPacket A} {p x : ℝ²} {radius : ℝ}
    (hseed : RightOneSidedErasedPayloadSeedCandidateInputs S p x radius)
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p x radius) :
    False := by
  rcases hseed with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
      hinj, hsstar, hsstar_eq, hp12, hpair, hqpair, hp,
      hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidateOwnPw, hcandidateOwnPu, hcandidateOppositePwU,
      hcandidateOppositePwW, hcandidateOppositePuU, hcandidateOppositePuW,
      hno3, hcounts, hsep, hsearchSep⟩
  exact
    false_of_rightOneSidedErasedPayload_pointClasses_of_named_pair_seed_candidates
      S hinj hsstar hsstar_eq hp12 hpair hqpair hp hpayload
      hvClass hwClass hprivatePwClass hprivatePuClass
      hcandidateOwnPw hcandidateOwnPu hcandidateOppositePwU
      hcandidateOppositePwW hcandidateOppositePuU hcandidateOppositePuW
      hno3 hcounts hsep hsearchSep

/-- Feed the left candidate-remainder interface into the generated
seeded-shadow contradiction. -/
theorem false_of_leftOneSidedErasedPayload_of_seedCandidateInputs
    {A : Finset ℝ²} {S : SurplusCapPacket A} {p x : ℝ²} {radius : ℝ}
    (hseed : LeftOneSidedErasedPayloadSeedCandidateInputs S p x radius)
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p x radius) :
    False := by
  rcases hseed with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
      hinj, hsstar, hsstar_eq, hp12, hpair, hqpair, hp,
      hvClass, hwClass, hprivatePwClass, hprivatePuClass,
      hcandidateOwnPw, hcandidateOwnPu, hcandidateOppositePwU,
      hcandidateOppositePwW, hcandidateOppositePuU, hcandidateOppositePuW,
      hno3, hcounts, hsep, hsearchSep⟩
  exact
    false_of_leftOneSidedErasedPayload_pointClasses_of_named_pair_seed_candidates
      S hinj hsstar hsstar_eq hp12 hpair hqpair hp hpayload
      hvClass hwClass hprivatePwClass hprivatePuClass
      hcandidateOwnPw hcandidateOwnPu hcandidateOppositePwU
      hcandidateOppositePwW hcandidateOppositePuU hcandidateOppositePuW
      hno3 hcounts hsep hsearchSep

/-- Seed-mask version of the reduced input surface.  Compared with
`IsM44NonSurplusContainmentErasedPinTripleReductionInputsStatement`, the
one-sided payload contradictions are replaced by the finite seed-mask
interfaces that the generated seeded-shadow wrappers consume. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleSeedMaskInputsStatement :
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
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex1 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1)) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                RightOneSidedErasedPayloadSeedMaskInputs
                  S p x (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex2 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1)) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                LeftOneSidedErasedPayloadSeedMaskInputs
                  S p x (dist p x))

/-- Candidate-remainder version of the erased-pin seed input surface.  This is
the current proof-facing surface: one-sided payload contradictions are reduced
to generated candidate remainders plus global finite shadow checks. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleSeedCandidateInputsStatement :
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
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex1 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1)) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                RightOneSidedErasedPayloadSeedCandidateInputs
                  S p x (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex2 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1)) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                LeftOneSidedErasedPayloadSeedCandidateInputs
                  S p x (dist p x))

/-- Named point-class version of the erased-pin seed input surface.  Compared
with `IsM44NonSurplusContainmentErasedPinTripleSeedCandidateInputsStatement`,
this fixes one pair-labelling for each non-surplus short cap and one
three-point surplus subpacket, then asks only for the finite shadow facts at
each one-sided radius. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleNamedCandidateFactsStatement :
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
          ∃ x p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
            x ∈ S.capInteriorByIndex S.surplusIdx ∧
            p₁ ≠ p₂ ∧
            S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
            q₁ ≠ q₂ ∧
            S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
            x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
            s1 ≠ s2 ∧
            s1 ≠ s3 ∧
            s2 ≠ s3 ∧
            ({s1, s2, s3} : Finset ℝ²) ⊆
              S.capInteriorByIndex S.surplusIdx ∧
            (ErasedPinTriple A x
              (S.oppositeVertexByIndex S.surplusIdx) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex1 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1)) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                RightOneSidedErasedPayloadNamedCandidateFacts
                  S x (dist p x) p₁ p₂ q₁ q₂ s1 s2 s3) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex2 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1)) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                LeftOneSidedErasedPayloadNamedCandidateFacts
                  S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)

/-- Finite candidate scaffold for the erased-pin producer.  It keeps one
oriented non-surplus pair labelling, one opposite pair labelling, and one
three-point surplus subpacket visible long enough for row-level finite
candidate contradictions to consume exact masks and separation data. -/
abbrev ErasedPinFiniteCandidateScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
    p₁ ≠ p₂ →
    S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) →
    q₁ ≠ q₂ →
    S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) →
    x ∈ ({s1, s2, s3} : Finset ℝ²) →
    s1 ≠ s2 →
    s1 ≠ s3 →
    s2 ≠ s3 →
    ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx →
      (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
        p ∈ A.erase x →
          RightOneSidedErasedPayloadFiniteCandidateFacts
            S x (dist p x) p₁ p₂ q₁ q₂ s1 s2 s3) ∧
      (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
        p ∈ A.erase x →
          LeftOneSidedErasedPayloadFiniteCandidateFacts
            S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)

/-- Reduced finite candidate scaffold for the erased-pin producer.  It omits
the mask-level search separation field, which is derivable from `sepOKFor` by
`crossSeparationOKForMasks_of_sepOKFor`. -/
abbrev ErasedPinFiniteCandidateSepScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
    p₁ ≠ p₂ →
    S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) →
    q₁ ≠ q₂ →
    S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) →
    x ∈ ({s1, s2, s3} : Finset ℝ²) →
    s1 ≠ s2 →
    s1 ≠ s3 →
    s2 ≠ s3 →
    ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx →
      (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
        p ∈ A.erase x →
          RightOneSidedErasedPayloadFiniteCandidateSepFacts
            S x (dist p x) p₁ p₂ q₁ q₂ s1 s2 s3) ∧
      (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
        p ∈ A.erase x →
          LeftOneSidedErasedPayloadFiniteCandidateSepFacts
            S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)

/-- Ordered finite candidate scaffold for the erased-pin producer.  Rather
than asking for every arbitrary presentation of the two pairs and surplus
triple, this surface asks for one naming of each concrete three-point surplus
set the row consumers use. -/
abbrev ErasedPinFiniteCandidateOrderedScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ∀ T : Finset ℝ²,
    x ∈ T →
    T.card = 3 →
    T ⊆ S.capInteriorByIndex S.surplusIdx →
      ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
        p₁ ≠ p₂ ∧
        S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
        q₁ ≠ q₂ ∧
        S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
        T = ({s1, s2, s3} : Finset ℝ²) ∧
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧
        s1 ≠ s3 ∧
        s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx ∧
        (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
          p ∈ A.erase x →
            RightOneSidedErasedPayloadFiniteCandidateFacts
              S x (dist p x) p₁ p₂ q₁ q₂ s1 s2 s3) ∧
        (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
          p ∈ A.erase x →
            LeftOneSidedErasedPayloadFiniteCandidateFacts
              S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)

/-- Reduced ordered finite candidate scaffold. -/
abbrev ErasedPinFiniteCandidateSepOrderedScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ∀ T : Finset ℝ²,
    x ∈ T →
    T.card = 3 →
    T ⊆ S.capInteriorByIndex S.surplusIdx →
      ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
        p₁ ≠ p₂ ∧
        S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
        q₁ ≠ q₂ ∧
        S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
        T = ({s1, s2, s3} : Finset ℝ²) ∧
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧
        s1 ≠ s3 ∧
        s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx ∧
        (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
          p ∈ A.erase x →
            RightOneSidedErasedPayloadFiniteCandidateSepFacts
              S x (dist p x) p₁ p₂ q₁ q₂ s1 s2 s3) ∧
        (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
          p ∈ A.erase x →
            LeftOneSidedErasedPayloadFiniteCandidateSepFacts
              S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)

/-- Right ordered finite candidate scaffold.  It exposes only the naming
needed by the first non-surplus cap, so the mirror side may choose its own
ordered packet. -/
abbrev ErasedPinRightFiniteCandidateOrderedScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ∀ T : Finset ℝ²,
    x ∈ T →
    T.card = 3 →
    T ⊆ S.capInteriorByIndex S.surplusIdx →
      ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
        p₁ ≠ p₂ ∧
        S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
        q₁ ≠ q₂ ∧
        S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
        T = ({s1, s2, s3} : Finset ℝ²) ∧
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧
        s1 ≠ s3 ∧
        s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx ∧
        (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
          p ∈ A.erase x →
            RightOneSidedErasedPayloadFiniteCandidateFacts
              S x (dist p x) p₁ p₂ q₁ q₂ s1 s2 s3)

/-- Left ordered finite candidate scaffold.  It exposes only the mirror-side
naming, allowing its surplus triple order to differ from the right packet. -/
abbrev ErasedPinLeftFiniteCandidateOrderedScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ∀ T : Finset ℝ²,
    x ∈ T →
    T.card = 3 →
    T ⊆ S.capInteriorByIndex S.surplusIdx →
      ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
        p₁ ≠ p₂ ∧
        S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
        q₁ ≠ q₂ ∧
        S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
        T = ({s1, s2, s3} : Finset ℝ²) ∧
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧
        s1 ≠ s3 ∧
        s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx ∧
        (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
          p ∈ A.erase x →
            LeftOneSidedErasedPayloadFiniteCandidateFacts
              S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)

/-- Split ordered finite candidate scaffold.  The two sides share the same
three-point set input, but each side is free to choose its own ordered
presentation of that set. -/
abbrev ErasedPinFiniteCandidateSplitOrderedScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x ∧
  ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x

/-- Reduced right ordered finite candidate scaffold. -/
abbrev ErasedPinRightFiniteCandidateSepOrderedScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ∀ T : Finset ℝ²,
    x ∈ T →
    T.card = 3 →
    T ⊆ S.capInteriorByIndex S.surplusIdx →
      ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
        p₁ ≠ p₂ ∧
        S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
        q₁ ≠ q₂ ∧
        S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
        T = ({s1, s2, s3} : Finset ℝ²) ∧
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧
        s1 ≠ s3 ∧
        s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx ∧
        (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
          p ∈ A.erase x →
            RightOneSidedErasedPayloadFiniteCandidateSepFacts
              S x (dist p x) p₁ p₂ q₁ q₂ s1 s2 s3)

/-- Reduced left ordered finite candidate scaffold. -/
abbrev ErasedPinLeftFiniteCandidateSepOrderedScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ∀ T : Finset ℝ²,
    x ∈ T →
    T.card = 3 →
    T ⊆ S.capInteriorByIndex S.surplusIdx →
      ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
        p₁ ≠ p₂ ∧
        S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
        q₁ ≠ q₂ ∧
        S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
        T = ({s1, s2, s3} : Finset ℝ²) ∧
        x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
        s1 ≠ s2 ∧
        s1 ≠ s3 ∧
        s2 ≠ s3 ∧
        ({s1, s2, s3} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.surplusIdx ∧
        (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
          p ∈ A.erase x →
            LeftOneSidedErasedPayloadFiniteCandidateSepFacts
              S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)

/-- Reduced split ordered finite candidate scaffold. -/
abbrev ErasedPinFiniteCandidateSepSplitOrderedScaffoldFacts {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x : ℝ²) : Prop :=
  ErasedPinRightFiniteCandidateSepOrderedScaffoldFacts S x ∧
  ErasedPinLeftFiniteCandidateSepOrderedScaffoldFacts S x

/-- The reduced scaffold supplies the existing full scaffold by deriving the
search cross-separation facts from `sepOKFor`. -/
theorem finiteCandidateScaffoldFacts_of_sepScaffoldFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hscaffold : ErasedPinFiniteCandidateSepScaffoldFacts S x) :
    ErasedPinFiniteCandidateScaffoldFacts S x := by
  intro p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpair hq12 hqpair hxTriple
    hs12 hs13 hs23 hsSub
  rcases hscaffold p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpair hq12 hqpair
      hxTriple hs12 hs13 hs23 hsSub with
    ⟨hright, hleft⟩
  exact
    ⟨fun p hpI hpErase =>
        rightFiniteCandidateFacts_of_sepFacts (hright p hpI hpErase),
      fun p hpI hpErase =>
        leftFiniteCandidateFacts_of_sepFacts (hleft p hpI hpErase)⟩

/-- The reduced ordered scaffold supplies the full ordered scaffold by deriving
the search cross-separation facts from `sepOKFor`. -/
theorem finiteCandidateOrderedScaffoldFacts_of_sepOrderedScaffoldFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hscaffold : ErasedPinFiniteCandidateSepOrderedScaffoldFacts S x) :
    ErasedPinFiniteCandidateOrderedScaffoldFacts S x := by
  intro T hxT hTcard hTsub
  rcases hscaffold T hxT hTcard hTsub with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      hTeq, hxTriple, hs12, hs13, hs23, hsSub, hright, hleft⟩
  exact
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      hTeq, hxTriple, hs12, hs13, hs23, hsSub,
      fun p hpI hpErase =>
        rightFiniteCandidateFacts_of_sepFacts (hright p hpI hpErase),
      fun p hpI hpErase =>
        leftFiniteCandidateFacts_of_sepFacts (hleft p hpI hpErase)⟩

/-- The reduced right ordered scaffold supplies the full right ordered
scaffold by deriving the search cross-separation facts from `sepOKFor`. -/
theorem rightFiniteCandidateOrderedScaffoldFacts_of_sepOrderedScaffoldFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hscaffold : ErasedPinRightFiniteCandidateSepOrderedScaffoldFacts S x) :
    ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x := by
  intro T hxT hTcard hTsub
  rcases hscaffold T hxT hTcard hTsub with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      hTeq, hxTriple, hs12, hs13, hs23, hsSub, hright⟩
  exact
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      hTeq, hxTriple, hs12, hs13, hs23, hsSub,
      fun p hpI hpErase =>
        rightFiniteCandidateFacts_of_sepFacts (hright p hpI hpErase)⟩

/-- The reduced left ordered scaffold supplies the full left ordered scaffold
by deriving the search cross-separation facts from `sepOKFor`. -/
theorem leftFiniteCandidateOrderedScaffoldFacts_of_sepOrderedScaffoldFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hscaffold : ErasedPinLeftFiniteCandidateSepOrderedScaffoldFacts S x) :
    ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x := by
  intro T hxT hTcard hTsub
  rcases hscaffold T hxT hTcard hTsub with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      hTeq, hxTriple, hs12, hs13, hs23, hsSub, hleft⟩
  exact
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      hTeq, hxTriple, hs12, hs13, hs23, hsSub,
      fun p hpI hpErase =>
        leftFiniteCandidateFacts_of_sepFacts (hleft p hpI hpErase)⟩

/-- The reduced split ordered scaffold supplies the full split ordered
scaffold by deriving the search cross-separation facts from `sepOKFor`. -/
theorem finiteCandidateSplitOrderedScaffoldFacts_of_sepSplitOrderedScaffoldFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hscaffold : ErasedPinFiniteCandidateSepSplitOrderedScaffoldFacts S x) :
    ErasedPinFiniteCandidateSplitOrderedScaffoldFacts S x := by
  exact
    ⟨rightFiniteCandidateOrderedScaffoldFacts_of_sepOrderedScaffoldFacts
        hscaffold.1,
      leftFiniteCandidateOrderedScaffoldFacts_of_sepOrderedScaffoldFacts
        hscaffold.2⟩

/-- Transitional adapter: the old universal scaffold implies the ordered
surface by choosing any naming of the concrete surplus triple.  The active
closure route should eventually produce the ordered surface directly. -/
theorem finiteCandidateOrderedScaffoldFacts_of_scaffoldFacts
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hM44 : S.IsM44)
    (hscaffold : ErasedPinFiniteCandidateScaffoldFacts S x) :
    ErasedPinFiniteCandidateOrderedScaffoldFacts S x := by
  intro T hxT hTcard hTsub
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, q₁, q₂, hp12, hpair, hq12, hqpair⟩
  have hTcardLe : T.card ≤ 3 := by omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hTsub
      hTcardLe with
    ⟨s1, s2, s3, hTtriple, hs12, hs13, hs23, hsSub⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hTtriple hxT
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  have hTriple_le : ({s1, s2, s3} : Finset ℝ²).card ≤ T.card := by
    rw [hTripleCard, hTcard]
  have hTeq : T = ({s1, s2, s3} : Finset ℝ²) :=
    Finset.eq_of_subset_of_card_le hTtriple hTriple_le
  rcases hscaffold p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpair hq12 hqpair
      hxTriple hs12 hs13 hs23 hsSub with
    ⟨hright, hleft⟩
  exact
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      hTeq, hxTriple, hs12, hs13, hs23, hsSub, hright, hleft⟩

/-- Finite point-class version of the erased-pin seed input surface.  The
non-surplus pair labels, the three-point surplus subpacket, and the erased
surplus-star label are derived by closed structural adapters from `S.IsM44` and
the chosen erased surplus point. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleFiniteFactsStatement :
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
          ∃ x : ℝ²,
            x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (ErasedPinTriple A x
              (S.oppositeVertexByIndex S.surplusIdx) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex1 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex1 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex1 T = 1)) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                S.AdjacentChainOneHitData S.oppIndex2 p (dist p x)) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                ∀ {T : Finset ℝ²},
                  T ⊆ SelectedClass A p (dist p x) →
                  T.card = 4 →
                  ((S.packetMoserCount T = 1 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 1 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1) ∨
                    (S.packetMoserCount T = 2 ∧
                      S.packetSameCapCount S.oppIndex2 p T = 0 ∧
                      S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
                      S.packetRightAdjCount S.oppIndex2 T = 1)) → False) ∧
            ErasedPinFiniteCandidateScaffoldFacts S x

/-- Exact selected-count row exclusion for the first non-surplus cap in the
erased-pin residual.  The row variables are `(moser, same, left, right)` at
radius `dist p x`; the surplus erased point supplies the right-adjacent hit. -/
abbrev RightNonSurplusExactCountFamilyExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  ∀ m s l r : ℕ,
    S.moserCount p (dist p x) = m →
    S.sameCapCount S.oppIndex1 p (dist p x) = s →
    S.leftAdjCount S.oppIndex1 p (dist p x) = l →
    S.rightAdjCount S.oppIndex1 p (dist p x) = r →
    m + s + l + r = 4 →
    m ≤ 2 →
    s ≤ 1 →
    1 ≤ r →
    False

/-- Exact selected-count row exclusion for the second non-surplus cap in the
erased-pin residual.  The row variables are `(moser, same, left, right)` at
radius `dist p x`; the surplus erased point supplies the left-adjacent hit. -/
abbrev LeftNonSurplusExactCountFamilyExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  ∀ m s l r : ℕ,
    S.moserCount p (dist p x) = m →
    S.sameCapCount S.oppIndex2 p (dist p x) = s →
    S.leftAdjCount S.oppIndex2 p (dist p x) = l →
    S.rightAdjCount S.oppIndex2 p (dist p x) = r →
    m + s + l + r = 4 →
    m ≤ 2 →
    s ≤ 1 →
    1 ≤ l →
    False

/-- One concrete exact selected-count row for the first non-surplus cap in the
erased-pin residual. -/
abbrev RightNonSurplusExactCountRowExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) (m s l r : ℕ) : Prop :=
  S.moserCount p (dist p x) = m →
  S.sameCapCount S.oppIndex1 p (dist p x) = s →
  S.leftAdjCount S.oppIndex1 p (dist p x) = l →
  S.rightAdjCount S.oppIndex1 p (dist p x) = r →
  False

/-- One concrete exact selected-count row for the second non-surplus cap in the
erased-pin residual. -/
abbrev LeftNonSurplusExactCountRowExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) (m s l r : ℕ) : Prop :=
  S.moserCount p (dist p x) = m →
  S.sameCapCount S.oppIndex2 p (dist p x) = s →
  S.leftAdjCount S.oppIndex2 p (dist p x) = l →
  S.rightAdjCount S.oppIndex2 p (dist p x) = r →
  False

/-- In the first non-surplus pure surplus-side row `(0,0,0,4)`, every selected
point lies in the surplus cap interior.  This isolates the exact geometric
shape still needed by the surplus-extra bridge. -/
theorem rightNonSurplusPureRow_selectedClass_subset_surplusInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hm : S.moserCount p (dist p x) = 0)
    (hs : S.sameCapCount S.oppIndex1 p (dist p x) = 0)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) = 0) :
    SelectedClass A p (dist p x) ⊆
      S.capInteriorByIndex S.surplusIdx := by
  intro y hy
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hcover :=
    S.selectedClass_subset_groupUnion S.oppIndex1 hradius_pos hy
  simp only [Finset.mem_union] at hcover
  rcases hcover with (((hyM | hySame) | hyLeft) | hyRight)
  · have hpos :
        0 < (SelectedClass A p (dist p x) ∩ S.triangle.verts).card :=
      Finset.card_pos.mpr ⟨y, Finset.mem_inter.mpr ⟨hy, hyM⟩⟩
    have hzero :
        (SelectedClass A p (dist p x) ∩ S.triangle.verts).card = 0 := by
      simpa [SurplusCapPacket.moserCount] using hm
    omega
  · have hpos :
        0 <
          (SelectedClass A p (dist p x) ∩
            (S.capInteriorByIndex S.oppIndex1).erase p).card :=
      Finset.card_pos.mpr ⟨y, Finset.mem_inter.mpr ⟨hy, hySame⟩⟩
    have hzero :
        (SelectedClass A p (dist p x) ∩
            (S.capInteriorByIndex S.oppIndex1).erase p).card = 0 := by
      simpa [SurplusCapPacket.sameCapCount] using hs
    omega
  · have hpos :
        0 <
          (SelectedClass A p (dist p x) ∩
            S.leftAdjacentInteriorByIndex S.oppIndex1).card :=
      Finset.card_pos.mpr ⟨y, Finset.mem_inter.mpr ⟨hy, hyLeft⟩⟩
    have hzero :
        (SelectedClass A p (dist p x) ∩
            S.leftAdjacentInteriorByIndex S.oppIndex1).card = 0 := by
      simpa [SurplusCapPacket.leftAdjCount] using hl
    omega
  · simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight

/-- In the second non-surplus pure surplus-side row `(0,0,4,0)`, every
selected point lies in the surplus cap interior. -/
theorem leftNonSurplusPureRow_selectedClass_subset_surplusInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hm : S.moserCount p (dist p x) = 0)
    (hs : S.sameCapCount S.oppIndex2 p (dist p x) = 0)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) = 0) :
    SelectedClass A p (dist p x) ⊆
      S.capInteriorByIndex S.surplusIdx := by
  intro y hy
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hcover :=
    S.selectedClass_subset_groupUnion S.oppIndex2 hradius_pos hy
  simp only [Finset.mem_union] at hcover
  rcases hcover with (((hyM | hySame) | hyLeft) | hyRight)
  · have hpos :
        0 < (SelectedClass A p (dist p x) ∩ S.triangle.verts).card :=
      Finset.card_pos.mpr ⟨y, Finset.mem_inter.mpr ⟨hy, hyM⟩⟩
    have hzero :
        (SelectedClass A p (dist p x) ∩ S.triangle.verts).card = 0 := by
      simpa [SurplusCapPacket.moserCount] using hm
    omega
  · have hpos :
        0 <
          (SelectedClass A p (dist p x) ∩
            (S.capInteriorByIndex S.oppIndex2).erase p).card :=
      Finset.card_pos.mpr ⟨y, Finset.mem_inter.mpr ⟨hy, hySame⟩⟩
    have hzero :
        (SelectedClass A p (dist p x) ∩
            (S.capInteriorByIndex S.oppIndex2).erase p).card = 0 := by
      simpa [SurplusCapPacket.sameCapCount] using hs
    omega
  · simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  · have hpos :
        0 <
          (SelectedClass A p (dist p x) ∩
            S.rightAdjacentInteriorByIndex S.oppIndex2).card :=
      Finset.card_pos.mpr ⟨y, Finset.mem_inter.mpr ⟨hy, hyRight⟩⟩
    have hzero :
        (SelectedClass A p (dist p x) ∩
            S.rightAdjacentInteriorByIndex S.oppIndex2).card = 0 := by
      simpa [SurplusCapPacket.rightAdjCount] using hr
    omega

/-- A first non-surplus pure surplus-side row always has a selected surplus
point outside any named three-point surplus subpacket. -/
theorem rightNonSurplusPureRow_exists_surplusExtra
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {x p s1 s2 s3 : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hm : S.moserCount p (dist p x) = 0)
    (hs : S.sameCapCount S.oppIndex1 p (dist p x) = 0)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) = 0)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) = 4)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3) :
    ∃ y : ℝ²,
      y ∈ SelectedClass A p (dist p x) ∧
        y ∈ S.capInteriorByIndex S.surplusIdx ∧
        y ∉ ({s1, s2, s3} : Finset ℝ²) := by
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hcard :
      (SelectedClass A p (dist p x)).card = 4 := by
    have hsum :=
      S.selectedClass_card_eq_groupSum (x := p) S.oppIndex1 hradius_pos
    simpa [hm, hs, hl, hr] using hsum
  by_contra hno
  have hsubTriple :
      SelectedClass A p (dist p x) ⊆
        ({s1, s2, s3} : Finset ℝ²) := by
    intro y hy
    by_contra hyTriple
    exact hno ⟨y, hy,
      rightNonSurplusPureRow_selectedClass_subset_surplusInterior
        hx hp hm hs hl hy,
      hyTriple⟩
  have hle :
      (SelectedClass A p (dist p x)).card ≤
        ({s1, s2, s3} : Finset ℝ²).card :=
    Finset.card_le_card hsubTriple
  have htripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  omega

/-- A second non-surplus pure surplus-side row always has a selected surplus
point outside any named three-point surplus subpacket. -/
theorem leftNonSurplusPureRow_exists_surplusExtra
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {x p s1 s2 s3 : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hm : S.moserCount p (dist p x) = 0)
    (hs : S.sameCapCount S.oppIndex2 p (dist p x) = 0)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) = 4)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) = 0)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3) :
    ∃ y : ℝ²,
      y ∈ SelectedClass A p (dist p x) ∧
        y ∈ S.capInteriorByIndex S.surplusIdx ∧
        y ∉ ({s1, s2, s3} : Finset ℝ²) := by
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hcard :
      (SelectedClass A p (dist p x)).card = 4 := by
    have hsum :=
      S.selectedClass_card_eq_groupSum (x := p) S.oppIndex2 hradius_pos
    simpa [hm, hs, hl, hr] using hsum
  by_contra hno
  have hsubTriple :
      SelectedClass A p (dist p x) ⊆
        ({s1, s2, s3} : Finset ℝ²) := by
    intro y hy
    by_contra hyTriple
    exact hno ⟨y, hy,
      leftNonSurplusPureRow_selectedClass_subset_surplusInterior
        hx hp hm hs hr hy,
      hyTriple⟩
  have hle :
      (SelectedClass A p (dist p x)).card ≤
        ({s1, s2, s3} : Finset ℝ²).card :=
    Finset.card_le_card hsubTriple
  have htripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  omega

/-- The right exact row `(0,0,0,4)` is closed by choosing three of the four
surplus-side selected points for the finite surplus triple. -/
theorem rightNonSurplusRow0004Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 0 4 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyRight := (Finset.mem_inter.mp hy).2
    simpa [R, S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight
  have hRcardEq : R.card = 4 := by
    simpa [R, SurplusCapPacket.rightAdjCount] using hr
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hEraseCard : (R.erase x).card = 3 := by
    rw [Finset.card_erase_of_mem hxR]
    omega
  have hErasePos : 0 < (R.erase x).card := by
    rw [hEraseCard]
    omega
  rcases Finset.card_pos.mp hErasePos with ⟨y, hyErase⟩
  have hyR : y ∈ R := (Finset.mem_erase.mp hyErase).2
  have hy_ne_x : y ≠ x := (Finset.mem_erase.mp hyErase).1
  let R3 := R.erase y
  have hxR3 : x ∈ R3 :=
    Finset.mem_erase.mpr ⟨Ne.symm hy_ne_x, hxR⟩
  have hR3subSurplus : R3 ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro z hz
    exact hRsubSurplus (Finset.mem_erase.mp hz).2
  have hR3cardEq : R3.card = 3 := by
    rw [Finset.card_erase_of_mem hyR]
    omega
  rcases hscaffoldFacts R3 hxR3 hR3cardEq hR3subSurplus with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      hR3eqTriple, hxTriple, _hs12, _hs13, _hs23, _hsSub,
      hoppInterior1Facts⟩
  have hs1Sel : s1 ∈ SelectedClass A p (dist p x) := by
    have hs1R3 : s1 ∈ R3 := by
      rw [hR3eqTriple]
      simp
    exact (Finset.mem_inter.mp (Finset.mem_erase.mp hs1R3).2).1
  have hs2Sel : s2 ∈ SelectedClass A p (dist p x) := by
    have hs2R3 : s2 ∈ R3 := by
      rw [hR3eqTriple]
      simp
    exact (Finset.mem_inter.mp (Finset.mem_erase.mp hs2R3).2).1
  have hs3Sel : s3 ∈ SelectedClass A p (dist p x) := by
    have hs3R3 : s3 ∈ R3 := by
      rw [hR3eqTriple]
      simp
    exact (Finset.mem_inter.mp (Finset.mem_erase.mp hs3R3).2).1
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row0004_finiteCandidateFacts S
    hradius_pos hm hs hl hr hp12 hpair hqpair hpOpp hxTriple
    hs1Sel hs2Sel hs3Sel (hoppInterior1Facts p hp hpErase)

/-- The left exact row `(0,0,4,0)` is closed by choosing three of the four
surplus-side selected points for the finite surplus triple. -/
theorem leftNonSurplusRow0040Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 4 0 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyLeft := (Finset.mem_inter.mp hy).2
    simpa [L, S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  have hLcardEq : L.card = 4 := by
    simpa [L, SurplusCapPacket.leftAdjCount] using hl
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hEraseCard : (L.erase x).card = 3 := by
    rw [Finset.card_erase_of_mem hxL]
    omega
  have hErasePos : 0 < (L.erase x).card := by
    rw [hEraseCard]
    omega
  rcases Finset.card_pos.mp hErasePos with ⟨y, hyErase⟩
  have hyL : y ∈ L := (Finset.mem_erase.mp hyErase).2
  have hy_ne_x : y ≠ x := (Finset.mem_erase.mp hyErase).1
  let L3 := L.erase y
  have hxL3 : x ∈ L3 :=
    Finset.mem_erase.mpr ⟨Ne.symm hy_ne_x, hxL⟩
  have hL3subSurplus : L3 ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro z hz
    exact hLsubSurplus (Finset.mem_erase.mp hz).2
  have hL3cardEq : L3.card = 3 := by
    rw [Finset.card_erase_of_mem hyL]
    omega
  rcases hscaffoldFacts L3 hxL3 hL3cardEq hL3subSurplus with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      hL3eqTriple, hxTriple, _hs12, _hs13, _hs23, _hsSub,
      hoppInterior2Facts⟩
  have hs1Sel : s1 ∈ SelectedClass A p (dist p x) := by
    have hs1L3 : s1 ∈ L3 := by
      rw [hL3eqTriple]
      simp
    exact (Finset.mem_inter.mp (Finset.mem_erase.mp hs1L3).2).1
  have hs2Sel : s2 ∈ SelectedClass A p (dist p x) := by
    have hs2L3 : s2 ∈ L3 := by
      rw [hL3eqTriple]
      simp
    exact (Finset.mem_inter.mp (Finset.mem_erase.mp hs2L3).2).1
  have hs3Sel : s3 ∈ SelectedClass A p (dist p x) := by
    have hs3L3 : s3 ∈ L3 := by
      rw [hL3eqTriple]
      simp
    exact (Finset.mem_inter.mp (Finset.mem_erase.mp hs3L3).2).1
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row0040_finiteCandidateFacts S
    hradius_pos hm hs hl hr hq12 hqpair hpair hpOpp hxTriple
    hs1Sel hs2Sel hs3Sel (hoppInterior2Facts p hp hpErase)

/-- The right exact row `(0,0,1,3)` is closed by choosing the finite surplus
triple around the row's three surplus-side selected points. -/
theorem rightNonSurplusRow0013Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 1 3 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyRight := (Finset.mem_inter.mp hy).2
    simpa [R, S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight
  have hRcard : R.card ≤ 3 := by
    have hRcardEq : R.card = 3 := by
      simpa [R, SurplusCapPacket.rightAdjCount] using hr
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row0013_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hpair hqpair ht12 ht13 ht23 hpOpp
    hRtripleOrdered hxR (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(0,1,0,3)` is closed by choosing the finite surplus
triple around the row's three surplus-side selected points. -/
theorem rightNonSurplusRow0103Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 0 3 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyRight := (Finset.mem_inter.mp hy).2
    simpa [R, S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight
  have hRcard : R.card ≤ 3 := by
    have hRcardEq : R.card = 3 := by
      simpa [R, SurplusCapPacket.rightAdjCount] using hr
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row0103_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hp12 hpair hqpair ht12 ht13 ht23 hpOpp
    hRtripleOrdered hxR (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(1,0,0,3)` is closed by choosing the finite surplus
triple around the row's three surplus-side selected points. -/
theorem rightNonSurplusRow1003Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 1 0 0 3 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyRight := (Finset.mem_inter.mp hy).2
    simpa [R, S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight
  have hRcard : R.card ≤ 3 := by
    have hRcardEq : R.card = 3 := by
      simpa [R, SurplusCapPacket.rightAdjCount] using hr
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row1003_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hpair hqpair ht12 ht13 ht23 hpOpp
    hRtripleOrdered hxR (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(0,0,2,2)` is closed by choosing the finite surplus
triple around the row's own two surplus-side selected points. -/
theorem rightNonSurplusRow0022Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 2 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨_, _, _, _, _, _, _, hqpairStruct⟩
  rcases hM44.right_row0022_selectedClass_eq_oppInterior2_union_surplusPair
      hradius_pos hm hs hl hr hqpairStruct with
    ⟨r₁, r₂, _hr12, hReq, hRsub, _hsel_eq⟩
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({r₁, r₂} : Finset ℝ²) := by
      simpa [R, hReq] using hy
    exact hRsub hyPair
  have hRcard : R.card ≤ 3 := by
    have hRcardEq : R.card = ({r₁, r₂} : Finset ℝ²).card := by
      rw [show R = ({r₁, r₂} : Finset ℝ²) by simpa [R] using hReq]
    have hpairCard : ({r₁, r₂} : Finset ℝ²).card = 2 := by
      simp [_hr12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row0022_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hpair hqpair hpOpp hRtripleOrdered hxR
    (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(0,1,2,1)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem rightNonSurplusRow0121Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 2 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨_, _, _, _, _, _, _, hqpairStruct⟩
  rcases hM44.right_row0121_selectedClass_eq_oppInterior2_union_sameCap_surplus
      hradius_pos hm hs hl hr hqpairStruct with
    ⟨_c, r, _hCeq, hReq, hrSurplus, _hsel_eq⟩
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hReqR : R = ({r} : Finset ℝ²) := by
    simpa [R] using hReq
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hy_eq : y = r := by
      simpa [hReqR] using hy
    simpa [hy_eq] using hrSurplus
  have hRcard : R.card ≤ 3 := by
    rw [hReqR]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row0121_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hp12 hpair hqpair hpOpp (hRtripleOrdered hxR) hxR
    (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(0,1,1,2)` is closed by choosing a finite surplus
triple around the row's surplus-side pair. -/
theorem rightNonSurplusRow0112Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 1 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.right_row0112_selectedClass_eq_oppInterior2_singleton_sameCap_surplusPair
      hradius_pos hm hs hl hr with
    ⟨_q, _c, r₁, r₂, hr12, _hCeq, _hLeq, _hqOpp, hReq, hRsub,
      _hsel_eq⟩
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hReqR : R = ({r₁, r₂} : Finset ℝ²) := by
    simpa [R] using hReq
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({r₁, r₂} : Finset ℝ²) := by
      simpa [hReqR] using hy
    exact hRsub hyPair
  have hRcard : R.card ≤ 3 := by
    have hRcardEq : R.card = ({r₁, r₂} : Finset ℝ²).card := by
      rw [hReqR]
    have hpairCard : ({r₁, r₂} : Finset ℝ²).card = 2 := by
      simp [hr12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row0112_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hp12 hpair hqpair hpOpp hRtripleOrdered hxR
    (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(1,0,1,2)` is closed by choosing a finite surplus
triple around the row's surplus-side pair. -/
theorem rightNonSurplusRow1012Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 1 0 1 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.right_row1012_selectedClass_eq_moser_oppInterior2_singleton_surplusPair
      hradius_pos hm hs hl hr with
    ⟨_q, _m, r₁, r₂, hr12, _hMeq, _hmVerts, _hLeq, _hqOpp, hReq,
      hRsub, _hsel_eq⟩
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hReqR : R = ({r₁, r₂} : Finset ℝ²) := by
    simpa [R] using hReq
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({r₁, r₂} : Finset ℝ²) := by
      simpa [hReqR] using hy
    exact hRsub hyPair
  have hRcard : R.card ≤ 3 := by
    have hRcardEq : R.card = ({r₁, r₂} : Finset ℝ²).card := by
      rw [hReqR]
    have hpairCard : ({r₁, r₂} : Finset ℝ²).card = 2 := by
      simp [hr12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row1012_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hpair hqpair hpOpp hRtripleOrdered hxR
    (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(1,0,2,1)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem rightNonSurplusRow1021Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 1 0 2 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨_, _, _, _, _, _, _, hqpairStruct⟩
  rcases hM44.right_row1021_selectedClass_eq_moser_oppInterior2_surplus
      hradius_pos hm hs hl hr hqpairStruct with
    ⟨_m, r, _hMeq, _hmVerts, hReq, hrSurplus, _hsel_eq⟩
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hReqR : R = ({r} : Finset ℝ²) := by
    simpa [R] using hReq
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hy_eq : y = r := by
      simpa [hReqR] using hy
    simpa [hy_eq] using hrSurplus
  have hRcard : R.card ≤ 3 := by
    rw [hReqR]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row1021_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hpair hqpair hpOpp (hRtripleOrdered hxR) hxR
    (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(1,1,1,1)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem rightNonSurplusRow1111Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 1 1 1 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.right_row1111_selectedClass_eq_moser_sameCap_oppInterior2_singleton_surplus
      hradius_pos hm hs hl hr with
    ⟨_q, _c, _m, r, _hCeq, _hMeq, _hmVerts, _hLeq, _hqOpp, hReq,
      hrSurplus, _hsel_eq⟩
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hReqR : R = ({r} : Finset ℝ²) := by
    simpa [R] using hReq
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hy_eq : y = r := by
      simpa [hReqR] using hy
    simpa [hy_eq] using hrSurplus
  have hRcard : R.card ≤ 3 := by
    rw [hReqR]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row1111_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hp12 hpair hqpair hpOpp (hRtripleOrdered hxR) hxR
    (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(1,1,0,2)` is closed by choosing a finite surplus
triple around the row's surplus-side pair. -/
theorem rightNonSurplusRow1102Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 1 1 0 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.right_row1102_selectedClass_eq_moser_sameCap_surplusPair
      hradius_pos hm hs hl hr with
    ⟨_c, _m, r₁, r₂, hr12, _hCeq, _hMeq, _hmVerts, hReq, hRsub,
      _hsel_eq⟩
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hReqR : R = ({r₁, r₂} : Finset ℝ²) := by
    simpa [R] using hReq
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({r₁, r₂} : Finset ℝ²) := by
      simpa [hReqR] using hy
    exact hRsub hyPair
  have hRcard : R.card ≤ 3 := by
    have hRcardEq : R.card = ({r₁, r₂} : Finset ℝ²).card := by
      rw [hReqR]
    have hpairCard : ({r₁, r₂} : Finset ℝ²).card = 2 := by
      simp [hr12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row1102_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hp12 hpair hqpair hpOpp hRtripleOrdered hxR
    (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(2,0,0,2)` is closed by choosing a finite surplus
triple around the row's surplus-side pair. -/
theorem rightNonSurplusRow2002Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 2 0 0 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.right_row2002_selectedClass_eq_moserPair_surplusPair
      hradius_pos hm hs hl hr with
    ⟨_m₁, _m₂, r₁, r₂, _hm₁₂, hr12, _hMeq, _hm₁Verts,
      _hm₂Verts, hReq, hRsub, _hsel_eq⟩
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hReqR : R = ({r₁, r₂} : Finset ℝ²) := by
    simpa [R] using hReq
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({r₁, r₂} : Finset ℝ²) := by
      simpa [hReqR] using hy
    exact hRsub hyPair
  have hRcard : R.card ≤ 3 := by
    have hRcardEq : R.card = ({r₁, r₂} : Finset ℝ²).card := by
      rw [hReqR]
    have hpairCard : ({r₁, r₂} : Finset ℝ²).card = 2 := by
      simp [hr12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row2002_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hpair hqpair hpOpp hRtripleOrdered hxR
    (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(2,0,1,1)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem rightNonSurplusRow2011Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusExactCountRowExcluded S x p 2 0 1 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.right_row2011_selectedClass_eq_moserPair_oppInterior2_surplus
      hradius_pos hm hs hl hr with
    ⟨_m₁, _m₂, _q, r, _hm₁₂, _hMeq, _hm₁Verts, _hm₂Verts,
      _hLeq, _hqOpp, hReq, hrSurplus, _hsel_eq⟩
  let R := SelectedClass A p (dist p x) ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hReqR : R = ({r} : Finset ℝ²) := by
    simpa [R] using hReq
  have hRsubSurplus : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hy_eq : y = r := by
      simpa [hReqR] using hy
    simpa [hy_eq] using hrSurplus
  have hRcard : R.card ≤ 3 := by
    rw [hReqR]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hRsubSurplus
      hRcard with
    ⟨s1, s2, s3, hRtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxRight :
      x ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior] using hx
  have hxR : x ∈ R := Finset.mem_inter.mpr ⟨hxSelected, hxRight⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior1Facts⟩
  have hRtripleOrdered : R ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hRtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ t1 t2 t3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I ht1I ht2I ht3I hp12 hq12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row2011_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hpair hqpair hpOpp (hRtripleOrdered hxR) hxR
    (hoppInterior1Facts p hp hpErase)

/-- The left exact row `(0,0,3,1)` is closed by choosing the finite surplus
triple around the row's three surplus-side selected points. -/
theorem leftNonSurplusRow0031Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 3 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyLeft := (Finset.mem_inter.mp hy).2
    simpa [L, S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  have hLcard : L.card ≤ 3 := by
    have hLcardEq : L.card = 3 := by
      simpa [L, SurplusCapPacket.leftAdjCount] using hl
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row0031_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hqpair hpair ht12 ht13 ht23 hpOpp
    hLtripleOrdered hxL (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(0,1,3,0)` is closed by choosing the finite surplus
triple around the row's three surplus-side selected points. -/
theorem leftNonSurplusRow0130Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 3 0 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyLeft := (Finset.mem_inter.mp hy).2
    simpa [L, S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  have hLcard : L.card ≤ 3 := by
    have hLcardEq : L.card = 3 := by
      simpa [L, SurplusCapPacket.leftAdjCount] using hl
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row0130_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hq12 hqpair hpair ht12 ht13 ht23 hpOpp
    hLtripleOrdered hxL (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(1,0,3,0)` is closed by choosing the finite surplus
triple around the row's three surplus-side selected points. -/
theorem leftNonSurplusRow1030Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 0 3 0 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyLeft := (Finset.mem_inter.mp hy).2
    simpa [L, S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  have hLcard : L.card ≤ 3 := by
    have hLcardEq : L.card = 3 := by
      simpa [L, SurplusCapPacket.leftAdjCount] using hl
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row1030_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hqpair hpair ht12 ht13 ht23 hpOpp
    hLtripleOrdered hxL (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(0,0,2,2)` is closed by choosing the finite surplus
triple around the row's own two surplus-side selected points. -/
theorem leftNonSurplusRow0022Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 2 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨_, _, _, _, _, hpairStruct, _, _⟩
  rcases hM44.left_row0022_selectedClass_eq_oppInterior1_union_surplusPair
      hradius_pos hm hs hl hr hpairStruct with
    ⟨l₁, l₂, _hl12, hLeq, hLsub, _hsel_eq⟩
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({l₁, l₂} : Finset ℝ²) := by
      simpa [L, hLeq] using hy
    exact hLsub hyPair
  have hLcard : L.card ≤ 3 := by
    have hLcardEq : L.card = ({l₁, l₂} : Finset ℝ²).card := by
      rw [show L = ({l₁, l₂} : Finset ℝ²) by simpa [L] using hLeq]
    have hpairCard : ({l₁, l₂} : Finset ℝ²).card = 2 := by
      simp [_hl12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row0022_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hqpair hpair hpOpp hLtripleOrdered hxL
    (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(0,1,1,2)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem leftNonSurplusRow0112Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 1 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨_, _, _, _, _, hpairStruct, _, _⟩
  rcases hM44.left_row0112_selectedClass_eq_oppInterior1_union_sameCap_surplus
      hradius_pos hm hs hl hr hpairStruct with
    ⟨_c, l, _hCeq, hLeq, hlSurplus, _hsel_eq⟩
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLeqL : L = ({l} : Finset ℝ²) := by
    simpa [L] using hLeq
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hy_eq : y = l := by
      simpa [hLeqL] using hy
    simpa [hy_eq] using hlSurplus
  have hLcard : L.card ≤ 3 := by
    rw [hLeqL]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row0112_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hq12 hqpair hpair hpOpp
    (hLtripleOrdered hxL) hxL
    (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(0,1,2,1)` is closed by choosing a finite surplus
triple around the row's surplus-side pair. -/
theorem leftNonSurplusRow0121Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 2 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.left_row0121_selectedClass_eq_oppInterior1_singleton_sameCap_surplusPair
      hradius_pos hm hs hl hr with
    ⟨_q, _c, l₁, l₂, hl12, _hCeq, _hReq, _hqOpp, hLeq, hLsub,
      _hsel_eq⟩
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLeqL : L = ({l₁, l₂} : Finset ℝ²) := by
    simpa [L] using hLeq
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({l₁, l₂} : Finset ℝ²) := by
      simpa [hLeqL] using hy
    exact hLsub hyPair
  have hLcard : L.card ≤ 3 := by
    have hLcardEq : L.card = ({l₁, l₂} : Finset ℝ²).card := by
      rw [hLeqL]
    have hpairCard : ({l₁, l₂} : Finset ℝ²).card = 2 := by
      simp [hl12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row0121_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hq12 hqpair hpair hpOpp hLtripleOrdered hxL
    (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(1,0,2,1)` is closed by choosing a finite surplus
triple around the row's surplus-side pair. -/
theorem leftNonSurplusRow1021Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 0 2 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.left_row1021_selectedClass_eq_moser_oppInterior1_singleton_surplusPair
      hradius_pos hm hs hl hr with
    ⟨_q, _m, l₁, l₂, hl12, _hMeq, _hmVerts, _hReq, _hqOpp, hLeq,
      hLsub, _hsel_eq⟩
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLeqL : L = ({l₁, l₂} : Finset ℝ²) := by
    simpa [L] using hLeq
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({l₁, l₂} : Finset ℝ²) := by
      simpa [hLeqL] using hy
    exact hLsub hyPair
  have hLcard : L.card ≤ 3 := by
    have hLcardEq : L.card = ({l₁, l₂} : Finset ℝ²).card := by
      rw [hLeqL]
    have hpairCard : ({l₁, l₂} : Finset ℝ²).card = 2 := by
      simp [hl12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row1021_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hqpair hpair hpOpp hLtripleOrdered hxL
    (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(1,1,1,1)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem leftNonSurplusRow1111Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 1 1 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.left_row1111_selectedClass_eq_moser_sameCap_oppInterior1_singleton_surplus
      hradius_pos hm hs hl hr with
    ⟨_q, _c, _m, l, _hCeq, _hMeq, _hmVerts, _hReq, _hqOpp, hLeq,
      hlSurplus, _hsel_eq⟩
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLeqL : L = ({l} : Finset ℝ²) := by
    simpa [L] using hLeq
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hy_eq : y = l := by
      simpa [hLeqL] using hy
    simpa [hy_eq] using hlSurplus
  have hLcard : L.card ≤ 3 := by
    rw [hLeqL]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row1111_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hq12 hqpair hpair hpOpp
    (hLtripleOrdered hxL) hxL
    (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(1,1,2,0)` is closed by choosing a finite surplus
triple around the row's surplus-side pair. -/
theorem leftNonSurplusRow1120Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 1 2 0 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.left_row1120_selectedClass_eq_moser_sameCap_surplusPair
      hradius_pos hm hs hl hr with
    ⟨_c, _m, l₁, l₂, hl12, _hCeq, _hMeq, _hmVerts, hLeq, hLsub,
      _hsel_eq⟩
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLeqL : L = ({l₁, l₂} : Finset ℝ²) := by
    simpa [L] using hLeq
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({l₁, l₂} : Finset ℝ²) := by
      simpa [hLeqL] using hy
    exact hLsub hyPair
  have hLcard : L.card ≤ 3 := by
    have hLcardEq : L.card = ({l₁, l₂} : Finset ℝ²).card := by
      rw [hLeqL]
    have hpairCard : ({l₁, l₂} : Finset ℝ²).card = 2 := by
      simp [hl12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row1120_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hq12 hqpair hpair hpOpp hLtripleOrdered hxL
    (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(2,0,2,0)` is closed by choosing a finite surplus
triple around the row's surplus-side pair. -/
theorem leftNonSurplusRow2020Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 2 0 2 0 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.left_row2020_selectedClass_eq_moserPair_surplusPair
      hradius_pos hm hs hl hr with
    ⟨_m₁, _m₂, l₁, l₂, _hm₁₂, hl12, _hMeq, _hm₁Verts,
      _hm₂Verts, hLeq, hLsub, _hsel_eq⟩
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLeqL : L = ({l₁, l₂} : Finset ℝ²) := by
    simpa [L] using hLeq
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyPair : y ∈ ({l₁, l₂} : Finset ℝ²) := by
      simpa [hLeqL] using hy
    exact hLsub hyPair
  have hLcard : L.card ≤ 3 := by
    have hLcardEq : L.card = ({l₁, l₂} : Finset ℝ²).card := by
      rw [hLeqL]
    have hpairCard : ({l₁, l₂} : Finset ℝ²).card = 2 := by
      simp [hl12]
    omega
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row2020_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hqpair hpair hpOpp hLtripleOrdered hxL
    (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(1,0,1,2)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem leftNonSurplusRow1012Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 1 0 1 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨_, _, _, _, _, hpairStruct, _, _⟩
  rcases hM44.left_row1012_selectedClass_eq_moser_oppInterior1_surplus
      hradius_pos hm hs hl hr hpairStruct with
    ⟨_m, l, _hMeq, _hmVerts, hLeq, hlSurplus, _hsel_eq⟩
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLeqL : L = ({l} : Finset ℝ²) := by
    simpa [L] using hLeq
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hy_eq : y = l := by
      simpa [hLeqL] using hy
    simpa [hy_eq] using hlSurplus
  have hLcard : L.card ≤ 3 := by
    rw [hLeqL]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row1012_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hqpair hpair hpOpp (hLtripleOrdered hxL) hxL
    (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(2,0,1,1)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem leftNonSurplusRow2011Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusExactCountRowExcluded S x p 2 0 1 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.left_row2011_selectedClass_eq_moserPair_oppInterior1_surplus
      hradius_pos hm hs hl hr with
    ⟨_m₁, _m₂, _q, l, _hm₁₂, _hMeq, _hm₁Verts, _hm₂Verts,
      _hReq, _hqOpp, hLeq, hlSurplus, _hsel_eq⟩
  let L := SelectedClass A p (dist p x) ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  have hLeqL : L = ({l} : Finset ℝ²) := by
    simpa [L] using hLeq
  have hLsubSurplus : L ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hy_eq : y = l := by
      simpa [hLeqL] using hy
    simpa [hy_eq] using hlSurplus
  have hLcard : L.card ≤ 3 := by
    rw [hLeqL]
    simp
  rcases hM44.exists_surplusInterior_triple_preserving_subset hLsubSurplus
      hLcard with
    ⟨s1, s2, s3, hLtriple, hs12, hs13, hs23, hsSub⟩
  have hxSelected : x ∈ SelectedClass A p (dist p x) := by
    rw [mem_selectedClass]
    exact ⟨S.capInteriorByIndex_subset S.surplusIdx hx, rfl⟩
  have hxLeft :
      x ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior] using hx
  have hxL : x ∈ L := Finset.mem_inter.mpr ⟨hxSelected, hxLeft⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  rcases hscaffoldFacts ({s1, s2, s3} : Finset ℝ²) hxTriple
      hTripleCard hsSub with
    ⟨p₁, p₂, q₁, q₂, t1, t2, t3, hp12, hpair, hq12, hqpair,
      hTripleEq, _hxTriple, ht12, ht13, ht23, htSub,
      hoppInterior2Facts⟩
  have hLtripleOrdered : L ⊆ ({t1, t2, t3} : Finset ℝ²) := by
    intro y hy
    rw [← hTripleEq]
    exact hLtriple hy
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have ht1I : t1 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht2I : t2 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have ht3I : t3 ∈ S.capInteriorByIndex S.surplusIdx := htSub (by simp)
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ t1 t2 t3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I ht1I ht2I ht3I hq12 hp12 ht12 ht13 ht23
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row2011_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hqpair hpair hpOpp (hLtripleOrdered hxL) hxL
    (hoppInterior2Facts p hp hpErase)

/-- Finite right-adjacent row census for the first non-surplus cap.  These are
exactly the rows satisfying `m + s + l + r = 4`, `m <= 2`, `s <= 1`, and
`1 <= r`. -/
abbrev RightNonSurplusExactCountRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  RightNonSurplusExactCountRowExcluded S x p 0 0 3 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 0 2 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 0 1 3 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 0 0 4 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 1 2 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 1 1 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 1 0 3 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 0 2 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 0 1 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 0 0 3 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 1 1 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 1 0 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 2 0 1 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 2 0 0 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 2 1 0 1

/-- Finite left-adjacent row census for the second non-surplus cap.  These are
exactly the rows satisfying `m + s + l + r = 4`, `m <= 2`, `s <= 1`, and
`1 <= l`. -/
abbrev LeftNonSurplusExactCountRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  LeftNonSurplusExactCountRowExcluded S x p 0 0 1 3 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 0 2 2 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 0 3 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 0 4 0 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 1 1 2 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 1 2 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 1 3 0 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 0 1 2 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 0 2 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 0 3 0 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 1 1 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 1 2 0 ∧
  LeftNonSurplusExactCountRowExcluded S x p 2 0 1 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 2 0 2 0 ∧
  LeftNonSurplusExactCountRowExcluded S x p 2 1 1 0

/-- First non-surplus rows where both adjacent sides are hit. -/
abbrev RightNonSurplusLeftRightSubpacketRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  RightNonSurplusExactCountRowExcluded S x p 0 0 3 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 0 2 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 0 1 3 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 1 2 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 1 1 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 0 2 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 0 1 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 1 1 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 2 0 1 1

/-- Second non-surplus rows where both adjacent sides are hit. -/
abbrev LeftNonSurplusLeftRightSubpacketRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  LeftNonSurplusExactCountRowExcluded S x p 0 0 1 3 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 0 2 2 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 0 3 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 1 1 2 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 1 2 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 0 1 2 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 0 2 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 1 1 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 2 0 1 1

/-- First non-surplus left-right rows after removing the structurally
impossible three-hit row on the other non-surplus side. -/
abbrev RightNonSurplusLeftRightSubpacketPrunedRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  RightNonSurplusExactCountRowExcluded S x p 0 0 2 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 0 1 3 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 1 2 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 1 1 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 0 2 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 0 1 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 1 1 1 ∧
  RightNonSurplusExactCountRowExcluded S x p 2 0 1 1

/-- Second non-surplus left-right rows after removing the structurally
impossible three-hit row on the other non-surplus side. -/
abbrev LeftNonSurplusLeftRightSubpacketPrunedRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  LeftNonSurplusExactCountRowExcluded S x p 0 0 2 2 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 0 3 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 1 1 2 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 1 2 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 0 1 2 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 0 2 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 1 1 1 ∧
  LeftNonSurplusExactCountRowExcluded S x p 2 0 1 1

/-- First non-surplus pruned left-right finite residual rows.  This bucket is
empty after the finite-candidate scaffold also removes the `(1,1,1,1)` row. -/
abbrev RightNonSurplusLeftRightSubpacketFiniteResidualRowsExcluded
    {A : Finset ℝ²} (_S : SurplusCapPacket A) (_x _p : ℝ²) : Prop :=
  True

/-- Second non-surplus pruned left-right finite residual rows.  This bucket is
empty after the finite-candidate scaffold also removes the `(1,1,1,1)` row. -/
abbrev LeftNonSurplusLeftRightSubpacketFiniteResidualRowsExcluded
    {A : Finset ℝ²} (_S : SurplusCapPacket A) (_x _p : ℝ²) : Prop :=
  True

/-- First non-surplus rows with only the surplus-side adjacent bucket hit,
excluding the terminal one-sided payload row. -/
abbrev RightNonSurplusSameSideHeavyRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  RightNonSurplusExactCountRowExcluded S x p 0 0 0 4 ∧
  RightNonSurplusExactCountRowExcluded S x p 0 1 0 3 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 0 0 3 ∧
  RightNonSurplusExactCountRowExcluded S x p 1 1 0 2 ∧
  RightNonSurplusExactCountRowExcluded S x p 2 0 0 2

/-- Second non-surplus rows with only the surplus-side adjacent bucket hit,
excluding the terminal one-sided payload row. -/
abbrev LeftNonSurplusSameSideHeavyRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  LeftNonSurplusExactCountRowExcluded S x p 0 0 4 0 ∧
  LeftNonSurplusExactCountRowExcluded S x p 0 1 3 0 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 0 3 0 ∧
  LeftNonSurplusExactCountRowExcluded S x p 1 1 2 0 ∧
  LeftNonSurplusExactCountRowExcluded S x p 2 0 2 0

/-- First non-surplus same-side-heavy finite residual rows.  The finite
scaffold also removes the pure surplus-side four-hit row, so this bucket is
empty. -/
abbrev RightNonSurplusSameSideHeavyFiniteResidualRowsExcluded {A : Finset ℝ²}
    (_S : SurplusCapPacket A) (_x _p : ℝ²) : Prop :=
  True

/-- Second non-surplus same-side-heavy finite residual rows.  The finite
scaffold also removes the pure surplus-side four-hit row, so this bucket is
empty. -/
abbrev LeftNonSurplusSameSideHeavyFiniteResidualRowsExcluded {A : Finset ℝ²}
    (_S : SurplusCapPacket A) (_x _p : ℝ²) : Prop :=
  True

/-- Payload exclusion for the first non-surplus terminal row `(2,1,0,1)`. -/
abbrev RightNonSurplusOneSidedTerminalPayloadExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  SurplusCapPacket.RightOneSidedErasedPayload
      S S.oppIndex1 p x (dist p x) → False

/-- Payload exclusion for the second non-surplus terminal row `(2,1,1,0)`. -/
abbrev LeftNonSurplusOneSidedTerminalPayloadExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  SurplusCapPacket.LeftOneSidedErasedPayload
      S S.oppIndex2 p x (dist p x) → False

/-- Seed-candidate data for the first non-surplus terminal row `(2,1,0,1)`. -/
abbrev RightNonSurplusOneSidedTerminalSeedInputs {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  RightOneSidedErasedPayloadSeedCandidateInputs S p x (dist p x)

/-- Seed-candidate data for the second non-surplus terminal row `(2,1,1,0)`. -/
abbrev LeftNonSurplusOneSidedTerminalSeedInputs {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  LeftOneSidedErasedPayloadSeedCandidateInputs S p x (dist p x)

/-- First non-surplus row exclusions grouped by the generated route census. -/
abbrev RightNonSurplusRoutedRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  RightNonSurplusLeftRightSubpacketRowsExcluded S x p ∧
  RightNonSurplusSameSideHeavyRowsExcluded S x p ∧
  RightNonSurplusOneSidedTerminalPayloadExcluded S x p

/-- Second non-surplus row exclusions grouped by the generated route census. -/
abbrev LeftNonSurplusRoutedRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  LeftNonSurplusLeftRightSubpacketRowsExcluded S x p ∧
  LeftNonSurplusSameSideHeavyRowsExcluded S x p ∧
  LeftNonSurplusOneSidedTerminalPayloadExcluded S x p

/-- First non-surplus row data grouped by the generated route census, with the
terminal row reduced to generated seed-candidate inputs. -/
abbrev RightNonSurplusRoutedSeedRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  RightNonSurplusLeftRightSubpacketRowsExcluded S x p ∧
  RightNonSurplusSameSideHeavyRowsExcluded S x p ∧
  RightNonSurplusOneSidedTerminalSeedInputs S x p

/-- Second non-surplus row data grouped by the generated route census, with the
terminal row reduced to generated seed-candidate inputs. -/
abbrev LeftNonSurplusRoutedSeedRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  LeftNonSurplusLeftRightSubpacketRowsExcluded S x p ∧
  LeftNonSurplusSameSideHeavyRowsExcluded S x p ∧
  LeftNonSurplusOneSidedTerminalSeedInputs S x p

/-- First non-surplus routed seed-row data with the impossible three-hit row
removed from the proof-facing obligations. -/
abbrev RightNonSurplusRoutedSeedPrunedRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  RightNonSurplusLeftRightSubpacketPrunedRowsExcluded S x p ∧
  RightNonSurplusSameSideHeavyRowsExcluded S x p ∧
  RightNonSurplusOneSidedTerminalSeedInputs S x p

/-- Second non-surplus routed seed-row data with the impossible three-hit row
removed from the proof-facing obligations. -/
abbrev LeftNonSurplusRoutedSeedPrunedRowsExcluded {A : Finset ℝ²}
    (S : SurplusCapPacket A) (x p : ℝ²) : Prop :=
  LeftNonSurplusLeftRightSubpacketPrunedRowsExcluded S x p ∧
  LeftNonSurplusSameSideHeavyRowsExcluded S x p ∧
  LeftNonSurplusOneSidedTerminalSeedInputs S x p

/-- First non-surplus routed row data after the finite-candidate scaffold has
discharged the finite left-right rows, same-side-heavy rows, and terminal seed
input.  The finite residual row bucket is empty. -/
abbrev RightNonSurplusRoutedFiniteResidualRowsExcluded
    {A : Finset ℝ²} (_S : SurplusCapPacket A) (_x _p : ℝ²) : Prop :=
  True

/-- Second non-surplus routed row data after the finite-candidate scaffold has
discharged the finite left-right rows, same-side-heavy rows, and terminal seed
input.  The finite residual row bucket is empty. -/
abbrev LeftNonSurplusRoutedFiniteResidualRowsExcluded
    {A : Finset ℝ²} (_S : SurplusCapPacket A) (_x _p : ℝ²) : Prop :=
  True

theorem rightNonSurplusLeftAdjacentThreeRowExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²} {m s r : ℕ} :
    RightNonSurplusExactCountRowExcluded S x p m s 3 r := by
  intro _hm _hs hl _hr
  have hle : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 2 := by
    calc
      S.leftAdjCount S.oppIndex1 p (dist p x)
          = (SelectedClass A p (dist p x) ∩
              S.leftAdjacentInteriorByIndex S.oppIndex1).card := rfl
      _ ≤ (S.leftAdjacentInteriorByIndex S.oppIndex1).card :=
          Finset.card_le_card Finset.inter_subset_right
      _ = S.oppInterior2.card := by
          rw [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
      _ = 2 := hM44.oppInterior2_card_eq_two
  omega

theorem leftNonSurplusRightAdjacentThreeRowExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²} {m s l : ℕ} :
    LeftNonSurplusExactCountRowExcluded S x p m s l 3 := by
  intro _hm _hs _hl hr
  have hle : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 2 := by
    calc
      S.rightAdjCount S.oppIndex2 p (dist p x)
          = (SelectedClass A p (dist p x) ∩
              S.rightAdjacentInteriorByIndex S.oppIndex2).card := rfl
      _ ≤ (S.rightAdjacentInteriorByIndex S.oppIndex2).card :=
          Finset.card_le_card Finset.inter_subset_right
      _ = S.oppInterior1.card := by
          rw [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
      _ = 2 := hM44.oppInterior1_card_eq_two
  omega

theorem rightNonSurplusLeftRightSubpacketRowsExcluded_of_pruned
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hrows : RightNonSurplusLeftRightSubpacketPrunedRowsExcluded S x p) :
    RightNonSurplusLeftRightSubpacketRowsExcluded S x p := by
  rcases hrows with
    ⟨h0022, h0013, h0121, h0112, h1021, h1012, h1111, h2011⟩
  exact
    ⟨rightNonSurplusLeftAdjacentThreeRowExcluded hM44, h0022, h0013,
      h0121, h0112, h1021, h1012, h1111, h2011⟩

theorem leftNonSurplusLeftRightSubpacketRowsExcluded_of_pruned
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hrows : LeftNonSurplusLeftRightSubpacketPrunedRowsExcluded S x p) :
    LeftNonSurplusLeftRightSubpacketRowsExcluded S x p := by
  rcases hrows with
    ⟨h0022, h0031, h0112, h0121, h1012, h1021, h1111, h2011⟩
  exact
    ⟨leftNonSurplusRightAdjacentThreeRowExcluded hM44, h0022, h0031,
      h0112, h0121, h1012, h1021, h1111, h2011⟩

theorem rightNonSurplusLeftRightSubpacketPrunedRowsExcluded_of_finiteResidualRows
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x)
    (_hrows :
      RightNonSurplusLeftRightSubpacketFiniteResidualRowsExcluded S x p) :
    RightNonSurplusLeftRightSubpacketPrunedRowsExcluded S x p := by
  exact
    ⟨rightNonSurplusRow0022Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow0013Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow0121Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow0112Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow1021Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow1012Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow1111Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow2011Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts⟩

theorem leftNonSurplusLeftRightSubpacketPrunedRowsExcluded_of_finiteResidualRows
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x)
    (_hrows :
      LeftNonSurplusLeftRightSubpacketFiniteResidualRowsExcluded S x p) :
    LeftNonSurplusLeftRightSubpacketPrunedRowsExcluded S x p := by
  exact
    ⟨leftNonSurplusRow0022Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow0031Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow0112Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow0121Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow1012Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow1021Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow1111Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow2011Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts⟩

theorem rightNonSurplusSameSideHeavyRowsExcluded_of_finiteResidualRows
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x)
    (_hrows :
      RightNonSurplusSameSideHeavyFiniteResidualRowsExcluded S x p) :
    RightNonSurplusSameSideHeavyRowsExcluded S x p := by
  exact
    ⟨rightNonSurplusRow0004Excluded_of_finiteScaffold
        hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow0103Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow1003Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow1102Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      rightNonSurplusRow2002Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts⟩

theorem leftNonSurplusSameSideHeavyRowsExcluded_of_finiteResidualRows
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x)
    (_hrows :
      LeftNonSurplusSameSideHeavyFiniteResidualRowsExcluded S x p) :
    LeftNonSurplusSameSideHeavyRowsExcluded S x p := by
  exact
    ⟨leftNonSurplusRow0040Excluded_of_finiteScaffold
        hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow0130Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow1030Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow1120Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts,
      leftNonSurplusRow2020Excluded_of_finiteScaffold
        hM44 hx hp hpErase hscaffoldFacts⟩

theorem rightNonSurplusOneSidedTerminalPayloadExcluded_of_seedInputs
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hseed : RightNonSurplusOneSidedTerminalSeedInputs S x p) :
    RightNonSurplusOneSidedTerminalPayloadExcluded S x p := by
  intro hpayload
  exact false_of_rightOneSidedErasedPayload_of_seedCandidateInputs hseed hpayload

theorem leftNonSurplusOneSidedTerminalPayloadExcluded_of_seedInputs
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hseed : LeftNonSurplusOneSidedTerminalSeedInputs S x p) :
    LeftNonSurplusOneSidedTerminalPayloadExcluded S x p := by
  intro hpayload
  exact false_of_leftOneSidedErasedPayload_of_seedCandidateInputs hseed hpayload

theorem rightNonSurplusOneSidedTerminalSeedInputs_of_orderedScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x) :
    RightNonSurplusOneSidedTerminalSeedInputs S x p := by
  classical
  rcases hM44.exists_surplusInterior_triple_preserving hx with
    ⟨u1, u2, u3, hxTriple, hu12, hu13, hu23, huSub⟩
  have hTripleCard : ({u1, u2, u3} : Finset ℝ²).card = 3 := by
    simp [hu12, hu13, hu23]
  rcases hscaffoldFacts ({u1, u2, u3} : Finset ℝ²) hxTriple
      hTripleCard huSub with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      _hTripleEq, hxTripleOrdered, hs12, hs13, hs23, hsSub,
      hoppInterior1Facts⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  have hnamed :
      RightOneSidedErasedPayloadNamedCandidateFacts
        S x (dist p x) p₁ p₂ q₁ q₂ s1 s2 s3 :=
    rightOneSidedErasedPayloadNamedCandidateFacts_of_finiteCandidateFacts
      hxTripleOrdered (hoppInterior1Facts p hp hpErase)
  exact rightOneSidedErasedPayloadSeedCandidateInputs_of_namedCandidateFacts
    hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
    hpair hqpair hpOpp hnamed

theorem leftNonSurplusOneSidedTerminalSeedInputs_of_orderedScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x) :
    LeftNonSurplusOneSidedTerminalSeedInputs S x p := by
  classical
  rcases hM44.exists_surplusInterior_triple_preserving hx with
    ⟨u1, u2, u3, hxTriple, hu12, hu13, hu23, huSub⟩
  have hTripleCard : ({u1, u2, u3} : Finset ℝ²).card = 3 := by
    simp [hu12, hu13, hu23]
  rcases hscaffoldFacts ({u1, u2, u3} : Finset ℝ²) hxTriple
      hTripleCard huSub with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
      _hTripleEq, hxTripleOrdered, hs12, hs13, hs23, hsSub,
      hoppInterior2Facts⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  have hnamed :
      LeftOneSidedErasedPayloadNamedCandidateFacts
        S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3 :=
    leftOneSidedErasedPayloadNamedCandidateFacts_of_finiteCandidateFacts
      hxTripleOrdered (hoppInterior2Facts p hp hpErase)
  exact leftOneSidedErasedPayloadSeedCandidateInputs_of_namedCandidateFacts
    hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I hq12 hp12 hs12 hs13 hs23
    hqpair hpair hpOpp hnamed

theorem rightNonSurplusRoutedRowsExcluded_of_seedRowsExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hrows : RightNonSurplusRoutedSeedRowsExcluded S x p) :
    RightNonSurplusRoutedRowsExcluded S x p := by
  rcases hrows with ⟨hsubpacket, hsameSide, hseed⟩
  exact ⟨hsubpacket, hsameSide,
    rightNonSurplusOneSidedTerminalPayloadExcluded_of_seedInputs hseed⟩

theorem leftNonSurplusRoutedRowsExcluded_of_seedRowsExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hrows : LeftNonSurplusRoutedSeedRowsExcluded S x p) :
    LeftNonSurplusRoutedRowsExcluded S x p := by
  rcases hrows with ⟨hsubpacket, hsameSide, hseed⟩
  exact ⟨hsubpacket, hsameSide,
    leftNonSurplusOneSidedTerminalPayloadExcluded_of_seedInputs hseed⟩

theorem rightNonSurplusRoutedSeedRowsExcluded_of_pruned
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hrows : RightNonSurplusRoutedSeedPrunedRowsExcluded S x p) :
    RightNonSurplusRoutedSeedRowsExcluded S x p := by
  rcases hrows with ⟨hsubpacket, hsameSide, hseed⟩
  exact
    ⟨rightNonSurplusLeftRightSubpacketRowsExcluded_of_pruned hM44 hsubpacket,
      hsameSide, hseed⟩

theorem leftNonSurplusRoutedSeedRowsExcluded_of_pruned
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hrows : LeftNonSurplusRoutedSeedPrunedRowsExcluded S x p) :
    LeftNonSurplusRoutedSeedRowsExcluded S x p := by
  rcases hrows with ⟨hsubpacket, hsameSide, hseed⟩
  exact
    ⟨leftNonSurplusLeftRightSubpacketRowsExcluded_of_pruned hM44 hsubpacket,
      hsameSide, hseed⟩

theorem rightNonSurplusRoutedSeedPrunedRowsExcluded_of_finiteResidualRows
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinRightFiniteCandidateOrderedScaffoldFacts S x)
    (_hrows : RightNonSurplusRoutedFiniteResidualRowsExcluded S x p) :
    RightNonSurplusRoutedSeedPrunedRowsExcluded S x p := by
  exact
    ⟨rightNonSurplusLeftRightSubpacketPrunedRowsExcluded_of_finiteResidualRows
        hM44 hx hp hpErase hscaffoldFacts trivial,
      rightNonSurplusSameSideHeavyRowsExcluded_of_finiteResidualRows
        hM44 hx hp hpErase hscaffoldFacts trivial,
      rightNonSurplusOneSidedTerminalSeedInputs_of_orderedScaffold
        hM44 hx hp hpErase hscaffoldFacts⟩

theorem leftNonSurplusRoutedSeedPrunedRowsExcluded_of_finiteResidualRows
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts : ErasedPinLeftFiniteCandidateOrderedScaffoldFacts S x)
    (_hrows : LeftNonSurplusRoutedFiniteResidualRowsExcluded S x p) :
    LeftNonSurplusRoutedSeedPrunedRowsExcluded S x p := by
  exact
    ⟨leftNonSurplusLeftRightSubpacketPrunedRowsExcluded_of_finiteResidualRows
        hM44 hx hp hpErase hscaffoldFacts trivial,
      leftNonSurplusSameSideHeavyRowsExcluded_of_finiteResidualRows
        hM44 hx hp hpErase hscaffoldFacts trivial,
      leftNonSurplusOneSidedTerminalSeedInputs_of_orderedScaffold
        hM44 hx hp hpErase hscaffoldFacts⟩

theorem rightNonSurplusTerminalRowExcluded_of_payloadExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hterminal : RightNonSurplusOneSidedTerminalPayloadExcluded S x p) :
    RightNonSurplusExactCountRowExcluded S x p 2 1 0 1 := by
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hcard : (SelectedClass A p (dist p x)).card = 4 := by
    have hsum :=
      S.selectedClass_card_eq_groupSum (x := p) S.oppIndex1 hradius_pos
    simpa [hm, hs, hl, hr] using hsum
  have hpayload :
      SurplusCapPacket.RightOneSidedObstructionPayload
        S S.oppIndex1 p (dist p x) :=
    S.right_one_sided_obstruction_payload S.oppIndex1
      hradius_pos hcard hm hs hl hr
  exact hterminal
    (S.rightOneSidedErasedPayload_of_oppIndex1_surplus_mem hx hpayload)

theorem leftNonSurplusTerminalRowExcluded_of_payloadExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hterminal : LeftNonSurplusOneSidedTerminalPayloadExcluded S x p) :
    LeftNonSurplusExactCountRowExcluded S x p 2 1 1 0 := by
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hcard : (SelectedClass A p (dist p x)).card = 4 := by
    have hsum :=
      S.selectedClass_card_eq_groupSum (x := p) S.oppIndex2 hradius_pos
    simpa [hm, hs, hl, hr] using hsum
  have hpayload :
      SurplusCapPacket.LeftOneSidedObstructionPayload
        S S.oppIndex2 p (dist p x) :=
    S.left_one_sided_obstruction_payload S.oppIndex2
      hradius_pos hcard hm hs hl hr
  exact hterminal
    (S.leftOneSidedErasedPayload_of_oppIndex2_surplus_mem hx hpayload)

theorem rightNonSurplusExactCountRowsExcluded_of_routedRowsExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hrouted : RightNonSurplusRoutedRowsExcluded S x p) :
    RightNonSurplusExactCountRowsExcluded S x p := by
  rcases hrouted with ⟨hsubpacket, hsameSide, hterminalPayload⟩
  rcases hsubpacket with
    ⟨h0031, h0022, h0013, h0121, h0112, h1021, h1012, h1111, h2011⟩
  rcases hsameSide with ⟨h0004, h0103, h1003, h1102, h2002⟩
  exact
    ⟨h0031, h0022, h0013, h0004, h0121, h0112, h0103,
      h1021, h1012, h1003, h1111, h1102, h2011, h2002,
      rightNonSurplusTerminalRowExcluded_of_payloadExcluded
        hx hp hterminalPayload⟩

theorem leftNonSurplusExactCountRowsExcluded_of_routedRowsExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hrouted : LeftNonSurplusRoutedRowsExcluded S x p) :
    LeftNonSurplusExactCountRowsExcluded S x p := by
  rcases hrouted with ⟨hsubpacket, hsameSide, hterminalPayload⟩
  rcases hsubpacket with
    ⟨h0013, h0022, h0031, h0112, h0121, h1012, h1021, h1111, h2011⟩
  rcases hsameSide with ⟨h0040, h0130, h1030, h1120, h2020⟩
  exact
    ⟨h0013, h0022, h0031, h0040, h0112, h0121, h0130,
      h1012, h1021, h1030, h1111, h1120, h2011, h2020,
      leftNonSurplusTerminalRowExcluded_of_payloadExcluded
        hx hp hterminalPayload⟩

theorem rightNonSurplusExactCountFamilyExcluded_of_rowsExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hrows : RightNonSurplusExactCountRowsExcluded S x p) :
    RightNonSurplusExactCountFamilyExcluded S x p := by
  intro m s l r hmEq hsEq hlEq hrEq hsum hm hs hr
  rcases hrows with
    ⟨h0031, h0022, h0013, h0004, h0121, h0112, h0103,
      h1021, h1012, h1003, h1111, h1102, h2011, h2002, h2101⟩
  have hlle : l ≤ 4 := by omega
  have hrle : r ≤ 4 := by omega
  interval_cases m <;> interval_cases s <;> interval_cases l <;>
    interval_cases r
  all_goals first
    | omega
    | exact h0031 hmEq hsEq hlEq hrEq
    | exact h0022 hmEq hsEq hlEq hrEq
    | exact h0013 hmEq hsEq hlEq hrEq
    | exact h0004 hmEq hsEq hlEq hrEq
    | exact h0121 hmEq hsEq hlEq hrEq
    | exact h0112 hmEq hsEq hlEq hrEq
    | exact h0103 hmEq hsEq hlEq hrEq
    | exact h1021 hmEq hsEq hlEq hrEq
    | exact h1012 hmEq hsEq hlEq hrEq
    | exact h1003 hmEq hsEq hlEq hrEq
    | exact h1111 hmEq hsEq hlEq hrEq
    | exact h1102 hmEq hsEq hlEq hrEq
    | exact h2011 hmEq hsEq hlEq hrEq
    | exact h2002 hmEq hsEq hlEq hrEq
    | exact h2101 hmEq hsEq hlEq hrEq

theorem leftNonSurplusExactCountFamilyExcluded_of_rowsExcluded
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hrows : LeftNonSurplusExactCountRowsExcluded S x p) :
    LeftNonSurplusExactCountFamilyExcluded S x p := by
  intro m s l r hmEq hsEq hlEq hrEq hsum hm hs hl
  rcases hrows with
    ⟨h0013, h0022, h0031, h0040, h0112, h0121, h0130,
      h1012, h1021, h1030, h1111, h1120, h2011, h2020, h2110⟩
  have hlle : l ≤ 4 := by omega
  have hrle : r ≤ 4 := by omega
  interval_cases m <;> interval_cases s <;> interval_cases l <;>
    interval_cases r
  all_goals first
    | omega
    | exact h0013 hmEq hsEq hlEq hrEq
    | exact h0022 hmEq hsEq hlEq hrEq
    | exact h0031 hmEq hsEq hlEq hrEq
    | exact h0040 hmEq hsEq hlEq hrEq
    | exact h0112 hmEq hsEq hlEq hrEq
    | exact h0121 hmEq hsEq hlEq hrEq
    | exact h0130 hmEq hsEq hlEq hrEq
    | exact h1012 hmEq hsEq hlEq hrEq
    | exact h1021 hmEq hsEq hlEq hrEq
    | exact h1030 hmEq hsEq hlEq hrEq
    | exact h1111 hmEq hsEq hlEq hrEq
    | exact h1120 hmEq hsEq hlEq hrEq
    | exact h2011 hmEq hsEq hlEq hrEq
    | exact h2020 hmEq hsEq hlEq hrEq
    | exact h2110 hmEq hsEq hlEq hrEq

/-- Count-family version of the erased-pin residual input surface.  This is
the proof-facing replacement for the transitional finite-facts surface carrying
`AdjacentChainOneHitData`: the non-surplus branches ask directly for exclusion
of every exact four-count row allowed by the structural budget and lower hit. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleCountFamilyFactsStatement :
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
          ∃ x : ℝ²,
            x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (ErasedPinTriple A x
              (S.oppositeVertexByIndex S.surplusIdx) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                RightNonSurplusExactCountFamilyExcluded S x p) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                LeftNonSurplusExactCountFamilyExcluded S x p)

/-- Finite-row version of the erased-pin residual input surface.  This is the
current generated-data target: the universal exact-count families above are
obtained from these concrete rows by arithmetic case splitting. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement :
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
          ∃ x : ℝ²,
            x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (ErasedPinTriple A x
              (S.oppositeVertexByIndex S.surplusIdx) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                RightNonSurplusExactCountRowsExcluded S x p) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                LeftNonSurplusExactCountRowsExcluded S x p)

/-- Route-grouped finite-row version of the erased-pin residual input surface.
The two terminal rows are exposed as erased one-sided payload exclusions; the
remaining rows stay grouped as left-right subpacket and same-side-heavy row
targets. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleRoutedRowsFactsStatement :
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
          ∃ x : ℝ²,
            x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (ErasedPinTriple A x
              (S.oppositeVertexByIndex S.surplusIdx) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                RightNonSurplusRoutedRowsExcluded S x p) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                LeftNonSurplusRoutedRowsExcluded S x p)

/-- Route-grouped finite-row input surface whose terminal rows are reduced to
the generated seed-candidate interfaces. -/
abbrev IsM44NonSurplusContainmentErasedPinTripleRoutedSeedRowsFactsStatement :
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
          ∃ x : ℝ²,
            x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (ErasedPinTriple A x
              (S.oppositeVertexByIndex S.surplusIdx) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                RightNonSurplusRoutedSeedRowsExcluded S x p) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                LeftNonSurplusRoutedSeedRowsExcluded S x p)

/-- Route-grouped seed-row input surface with the two structurally impossible
three-hit rows on the other non-surplus side removed from the proof-facing
obligation. -/
abbrev
    IsM44NonSurplusContainmentErasedPinTripleRoutedSeedPrunedRowsFactsStatement :
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
          ∃ x : ℝ²,
            x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (ErasedPinTriple A x
              (S.oppositeVertexByIndex S.surplusIdx) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
                RightNonSurplusRoutedSeedPrunedRowsExcluded S x p) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
                LeftNonSurplusRoutedSeedPrunedRowsExcluded S x p)

/-- Route-grouped seed-row input surface after the finite-candidate scaffold
has discharged all finite ten-label left-right and same-side-heavy rows plus
the pure surplus-side four-hit rows and terminal seed inputs.  The remaining
producer obligations are the reduced finite candidate scaffold and direct
surplus erased-pin exclusions. -/
abbrev
    IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement :
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
          ∃ x : ℝ²,
            x ∈ S.capInteriorByIndex S.surplusIdx ∧
            (ErasedPinTriple A x
              (S.oppositeVertexByIndex S.surplusIdx) → False) ∧
            (∀ p : ℝ², p ∈ S.capInteriorByIndex S.surplusIdx →
              p ∈ A.erase x → ErasedPinTriple A x p → False) ∧
            ErasedPinFiniteCandidateSepSplitOrderedScaffoldFacts S x

theorem prunedRowsFactsStatement_of_finiteResidualRowsFactsStatement
    (hfiniteResidual :
      IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement) :
    IsM44NonSurplusContainmentErasedPinTripleRoutedSeedPrunedRowsFactsStatement := by
  intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
  rcases hfiniteResidual A hne hconv hK4 hgt hMin S hM44 hend1 hend2
      hpin1 hpin2 hcontain with
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple, hscaffold⟩
  have horderedScaffold :
      ErasedPinFiniteCandidateSplitOrderedScaffoldFacts S x :=
    finiteCandidateSplitOrderedScaffoldFacts_of_sepSplitOrderedScaffoldFacts
      hscaffold
  refine
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple, ?_, ?_⟩
  · intro p hpI hpErase
    exact rightNonSurplusRoutedSeedPrunedRowsExcluded_of_finiteResidualRows
      hM44 hxI hpI hpErase horderedScaffold.1 trivial
  · intro p hpI hpErase
    exact leftNonSurplusRoutedSeedPrunedRowsExcluded_of_finiteResidualRows
      hM44 hxI hpI hpErase horderedScaffold.2 trivial

theorem countFamilyFactsStatement_of_countRowsFactsStatement
    (hrows :
      IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement) :
    IsM44NonSurplusContainmentErasedPinTripleCountFamilyFactsStatement := by
  intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
  rcases hrows A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
      hcontain with
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
      hoppInterior1Rows, hoppInterior2Rows⟩
  refine
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple, ?_, ?_⟩
  · intro p hpI hpErase
    exact rightNonSurplusExactCountFamilyExcluded_of_rowsExcluded
      (hoppInterior1Rows p hpI hpErase)
  · intro p hpI hpErase
    exact leftNonSurplusExactCountFamilyExcluded_of_rowsExcluded
      (hoppInterior2Rows p hpI hpErase)

theorem countRowsFactsStatement_of_routedRowsFactsStatement
    (hrouted :
      IsM44NonSurplusContainmentErasedPinTripleRoutedRowsFactsStatement) :
    IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement := by
  intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
  rcases hrouted A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
      hcontain with
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
      hoppInterior1Rows, hoppInterior2Rows⟩
  refine
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple, ?_, ?_⟩
  · intro p hpI hpErase
    exact rightNonSurplusExactCountRowsExcluded_of_routedRowsExcluded
      hxI hpI (hoppInterior1Rows p hpI hpErase)
  · intro p hpI hpErase
    exact leftNonSurplusExactCountRowsExcluded_of_routedRowsExcluded
      hxI hpI (hoppInterior2Rows p hpI hpErase)

theorem routedRowsFactsStatement_of_routedSeedRowsFactsStatement
    (hseedRows :
      IsM44NonSurplusContainmentErasedPinTripleRoutedSeedRowsFactsStatement) :
    IsM44NonSurplusContainmentErasedPinTripleRoutedRowsFactsStatement := by
  intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
  rcases hseedRows A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
      hcontain with
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
      hoppInterior1Rows, hoppInterior2Rows⟩
  refine
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple, ?_, ?_⟩
  · intro p hpI hpErase
    exact rightNonSurplusRoutedRowsExcluded_of_seedRowsExcluded
      (hoppInterior1Rows p hpI hpErase)
  · intro p hpI hpErase
    exact leftNonSurplusRoutedRowsExcluded_of_seedRowsExcluded
      (hoppInterior2Rows p hpI hpErase)

theorem routedSeedRowsFactsStatement_of_prunedRowsFactsStatement
    (hpruned :
      IsM44NonSurplusContainmentErasedPinTripleRoutedSeedPrunedRowsFactsStatement) :
    IsM44NonSurplusContainmentErasedPinTripleRoutedSeedRowsFactsStatement := by
  intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
  rcases hpruned A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
      hcontain with
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
      hoppInterior1Rows, hoppInterior2Rows⟩
  refine
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple, ?_, ?_⟩
  · intro p hpI hpErase
    exact rightNonSurplusRoutedSeedRowsExcluded_of_pruned hM44
      (hoppInterior1Rows p hpI hpErase)
  · intro p hpI hpErase
    exact leftNonSurplusRoutedSeedRowsExcluded_of_pruned hM44
      (hoppInterior2Rows p hpI hpErase)

namespace SurplusCapPacket

/-- The first non-surplus erased-pin branch is closed by excluding every exact
selected-count row compatible with the four-count budget and structural
non-surplus bounds. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_exactCountFamily
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hcountFalse : RightNonSurplusExactCountFamilyExcluded S x p)
    (htriple : ErasedPinTriple A x p) :
    False := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
  have hbudget :
      S.moserCount p (dist p x) +
          S.sameCapCount S.oppIndex1 p (dist p x) +
          S.leftAdjCount S.oppIndex1 p (dist p x) +
          S.rightAdjCount S.oppIndex1 p (dist p x) = 4 :=
    S.selectedCount_groupSum_eq_four_of_card S.oppIndex1
      hexact.1 hexact.2.1
  have hm :
      S.moserCount p (dist p x) ≤ 2 :=
    hM44.moserCount_oppIndex1_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x)
  have hs :
      S.sameCapCount S.oppIndex1 p (dist p x) ≤ 1 :=
    hM44.sameCapCount_oppIndex1_le_one (dist p x) hp
  have hr_pos :
      1 ≤ S.rightAdjCount S.oppIndex1 p (dist p x) :=
    S.one_le_rightAdjCount_oppIndex1_of_surplus_mem hx
  exact hcountFalse
    (S.moserCount p (dist p x))
    (S.sameCapCount S.oppIndex1 p (dist p x))
    (S.leftAdjCount S.oppIndex1 p (dist p x))
    (S.rightAdjCount S.oppIndex1 p (dist p x))
    rfl rfl rfl rfl hbudget hm hs hr_pos

/-- The second non-surplus erased-pin branch is closed by excluding every exact
selected-count row compatible with the four-count budget and structural
non-surplus bounds. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_exactCountFamily
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hcountFalse : LeftNonSurplusExactCountFamilyExcluded S x p)
    (htriple : ErasedPinTriple A x p) :
    False := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hx
  have hexact := exact_erased_pin_of_erasedPinTriple hxA htriple
  have hbudget :
      S.moserCount p (dist p x) +
          S.sameCapCount S.oppIndex2 p (dist p x) +
          S.leftAdjCount S.oppIndex2 p (dist p x) +
          S.rightAdjCount S.oppIndex2 p (dist p x) = 4 :=
    S.selectedCount_groupSum_eq_four_of_card S.oppIndex2
      hexact.1 hexact.2.1
  have hm :
      S.moserCount p (dist p x) ≤ 2 :=
    hM44.moserCount_oppIndex2_le_two_of_moserCapContainment
      hK4 hcontain hp (dist p x)
  have hs :
      S.sameCapCount S.oppIndex2 p (dist p x) ≤ 1 :=
    hM44.sameCapCount_oppIndex2_le_one (dist p x) hp
  have hl_pos :
      1 ≤ S.leftAdjCount S.oppIndex2 p (dist p x) :=
    S.one_le_leftAdjCount_oppIndex2_of_surplus_mem hx
  exact hcountFalse
    (S.moserCount p (dist p x))
    (S.sameCapCount S.oppIndex2 p (dist p x))
    (S.leftAdjCount S.oppIndex2 p (dist p x))
    (S.rightAdjCount S.oppIndex2 p (dist p x))
    rfl rfl rfl rfl hbudget hm hs hl_pos

end SurplusCapPacket

/-- A finite point-class proof supplies the named point-class proof by choosing
the canonical structural labels guaranteed by `S.IsM44`. -/
theorem namedCandidateFactsStatement_of_finiteFactsStatement
    (hfinite :
      IsM44NonSurplusContainmentErasedPinTripleFiniteFactsStatement) :
    IsM44NonSurplusContainmentErasedPinTripleNamedCandidateFactsStatement := by
  intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
  rcases hfinite A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
      hcontain with
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
      hoppInterior1Chain, hoppInterior1Primitive, hoppInterior2Chain,
      hoppInterior2Primitive, hscaffoldFacts⟩
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, q₁, q₂, hp12, hpair, hq12, hqpair⟩
  rcases hM44.exists_surplusInterior_triple_preserving hxI with
    ⟨s1, s2, s3, hxTriple, hs12, hs13, hs23, hsSub⟩
  rcases hscaffoldFacts p₁ p₂ q₁ q₂ s1 s2 s3
      hp12 hpair hq12 hqpair hxTriple hs12 hs13 hs23 hsSub with
    ⟨hoppInterior1FiniteFacts, hoppInterior2FiniteFacts⟩
  refine
    ⟨x, p₁, p₂, q₁, q₂, s1, s2, s3, hxI, hp12, hpair, hq12,
      hqpair, hxTriple, hs12, hs13, hs23, hsSub, hsurplusOppTriple,
      hsurplusInteriorTriple, hoppInterior1Chain, hoppInterior1Primitive,
      ?_, hoppInterior2Chain, hoppInterior2Primitive, ?_⟩
  · intro p hpI hpErase
    exact rightOneSidedErasedPayloadNamedCandidateFacts_of_finiteCandidateFacts
      hxTriple (hoppInterior1FiniteFacts p hpI hpErase)
  · intro p hpI hpErase
    exact leftOneSidedErasedPayloadNamedCandidateFacts_of_finiteCandidateFacts
      hxTriple (hoppInterior2FiniteFacts p hpI hpErase)

/-- A named point-class finite-fact proof supplies the current seed-candidate
input surface. -/
theorem seedCandidateInputsStatement_of_namedCandidateFactsStatement
    (hnamed :
      IsM44NonSurplusContainmentErasedPinTripleNamedCandidateFactsStatement) :
    IsM44NonSurplusContainmentErasedPinTripleSeedCandidateInputsStatement := by
  intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
  rcases hnamed A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
      hcontain with
    ⟨x, p₁, p₂, q₁, q₂, s1, s2, s3, hxI, hp12, hpair, hq12,
      hqpair, hxTriple, hs12, hs13, hs23, hsSub, hsurplusOppTriple,
      hsurplusInteriorTriple, hoppInterior1Chain, hoppInterior1Primitive,
      hoppInterior1Facts, hoppInterior2Chain, hoppInterior2Primitive,
      hoppInterior2Facts⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁Opp : p₁ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂Opp : p₂ ∈ S.oppInterior1 := by
      rw [hpair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁Opp : q₁ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂Opp : q₂ ∈ S.oppInterior2 := by
      rw [hqpair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  refine
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
      hoppInterior1Chain, hoppInterior1Primitive, ?_,
      hoppInterior2Chain, hoppInterior2Primitive, ?_⟩
  · intro p hpI hpErase
    have hpOpp : p ∈ S.oppInterior1 := by
      simpa [SurplusCapPacket.oppInterior1] using hpI
    exact rightOneSidedErasedPayloadSeedCandidateInputs_of_namedCandidateFacts
      hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
      hpair hqpair hpOpp (hoppInterior1Facts p hpI hpErase)
  · intro p hpI hpErase
    have hpOpp : p ∈ S.oppInterior2 := by
      simpa [SurplusCapPacket.oppInterior2] using hpI
    exact leftOneSidedErasedPayloadSeedCandidateInputs_of_namedCandidateFacts
      hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I hq12 hp12 hs12 hs13 hs23
      hqpair hpair hpOpp (hoppInterior2Facts p hpI hpErase)

/-- A proof of the older seed-mask reduced surface supplies the current
candidate-remainder reduced surface. -/
theorem seedCandidateInputsStatement_of_seedMaskInputsStatement
    (hseed : IsM44NonSurplusContainmentErasedPinTripleSeedMaskInputsStatement) :
    IsM44NonSurplusContainmentErasedPinTripleSeedCandidateInputsStatement := by
  intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
  rcases hseed A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
      hcontain with
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
      hoppInterior1Chain, hoppInterior1Primitive, hoppInterior1Seed,
      hoppInterior2Chain, hoppInterior2Primitive, hoppInterior2Seed⟩
  refine
    ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
      hoppInterior1Chain, hoppInterior1Primitive, ?_,
      hoppInterior2Chain, hoppInterior2Primitive, ?_⟩
  · intro p hpI hpErase
    exact rightOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs
      (hoppInterior1Seed p hpI hpErase)
  · intro p hpI hpErase
    exact leftOneSidedErasedPayloadSeedCandidateInputs_of_seedMaskInputs
      (hoppInterior2Seed p hpI hpErase)

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

/-- General-`m` endpoint residuals are the remaining branch after the
  label-complete `m = 5` split (route decision (b), 2026-07-11).  The ten-label
  shadow producer does not claim this regime; see the closure-matrix K-B-END
  row for the route evidence. -/
theorem isM44EndpointGeneralMResidualsExcluded :
      IsM44EndpointGeneralMResidualsExcludedStatement := by
  sorry

/-- Endpoint residuals are impossible in the `IsM44` branch.  This is a spine
  obligation consumed by
  `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit`.  Split by
  surplus-cap cardinality: the `5 < m` regime delegates to
  `isM44EndpointGeneralMResidualsExcluded`; the label-complete `m = 5` regime
  (`A.card = 10`) carries the shadow-producer holes with `hcard5` in scope. -/
theorem isM44EndpointResidualsExcluded :
      IsM44EndpointResidualsExcludedStatement := by
    classical
    intro A hne hconv hK4 hgt hMin S hM44
    by_cases hcard5 : S.surplusCap.card = 5
    case neg =>
      have hge5 := hM44.surplus_card_ge_five
      exact isM44EndpointGeneralMResidualsExcluded A hne hconv hK4 hgt hMin
        S hM44 (by omega)
    constructor
    · intro radius rho x hend
      -- Label-complete `m = 5` left endpoint producer (both ambient CCW apex
      -- orientations), `hcard5 : S.surplusCap.card = 5` in scope.
      exact EndpointCertificate.endpointLeft_residual_false_of_card_five hM44 hne
        hconv hK4 hcard5 hend
    · intro radius rho x hend
      rcases
          EndpointCertificate.endpointRight_residual_exists_false_of_metric_shadow_data
            hM44 hconv hend with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel,
          hdata⟩
      let pointOf :=
        EndpointCertificate.endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      rcases hdata with
        ⟨_hxLabel, _haLabel, _hbLabel, _hinj, _hxEq, _hpointMem,
          _hvMask, _hwMask, hfalse⟩
      have hshadow :
          ∃ shadow : EndpointCertificate.ShadowBank.Shadow,
            EndpointCertificate.ShadowBank.endpointShadowInBank xLabel
                shadow = true ∧
              EndpointCertificate.Variables.EndpointMetricShadow pointOf
                shadow := by
        -- Mirror remaining endpoint producer: the same non-`.v`/`.w`
        -- selected-class geometry package remains to be built.  `hcard5` is
        -- in scope as in the left branch.
        sorry
      rcases hshadow with ⟨shadow, hinBank, hmetric⟩
      exact hfalse shadow hinBank hmetric

end Problem97
