import Erdos9796Proof.P97.SmallerCounterexample
import Erdos9796Proof.P97.SurplusCOMPGBank
import Erdos9796Proof.P97.SurplusCOMPGBankDFS
import Erdos9796Proof.P97.SurplusCOMPGBankGeometry
import Erdos9796Proof.P97.CapBridgeFromK4
import Erdos9796Proof.P97.NoDiameterUnderK4
import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.EndpointCertificate.ResidualCoreData

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
      hcard hself huv huw hcirc hno3 hcounts hsep hsearchSep
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
      hcard hself huv huw hcirc hno3 hcounts hsep hsearchSep
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
          (centerClass cp)) = true)

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
      ?_, ?_, ?_, ?_, ?_, ?_, hno3, hcounts, hsep, hsearchSep⟩
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
      ?_, ?_, ?_, ?_, ?_, ?_, hno3, hcounts, hsep, hsearchSep⟩
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
            (∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
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
                      S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3))

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

/-- The right exact row `(0,0,2,2)` is closed by choosing the finite surplus
triple around the row's own two surplus-side selected points. -/
theorem rightNonSurplusRow0022Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts :
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
              S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)) :
    RightNonSurplusExactCountRowExcluded S x p 0 0 2 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, q₁, q₂, hp12, hpair, hq12, hqpair⟩
  rcases hM44.right_row0022_selectedClass_eq_oppInterior2_union_surplusPair
      hradius_pos hm hs hl hr hqpair with
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
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  rcases hscaffoldFacts p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpair hq12 hqpair
      hxTriple hs12 hs13 hs23 hsSub with
    ⟨hoppInterior1Facts, _hoppInterior2Facts⟩
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row0022_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hpair hqpair hpOpp hRtriple hxR
    (hoppInterior1Facts p hp hpErase)

/-- The right exact row `(0,1,2,1)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem rightNonSurplusRow0121Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts :
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
              S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)) :
    RightNonSurplusExactCountRowExcluded S x p 0 1 2 1 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, q₁, q₂, hp12, hpair, hq12, hqpair⟩
  rcases hM44.right_row0121_selectedClass_eq_oppInterior2_union_sameCap_surplus
      hradius_pos hm hs hl hr hqpair with
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
  have hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  rcases hscaffoldFacts p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpair hq12 hqpair
      hxTriple hs12 hs13 hs23 hsSub with
    ⟨hoppInterior1Facts, _hoppInterior2Facts⟩
  have hpOpp : p ∈ S.oppInterior1 := by
    simpa [SurplusCapPacket.oppInterior1] using hp
  exact false_of_right_row0121_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hp12 hpair hqpair hpOpp hxTriple hxR
    (hoppInterior1Facts p hp hpErase)

/-- The left exact row `(0,0,2,2)` is closed by choosing the finite surplus
triple around the row's own two surplus-side selected points. -/
theorem leftNonSurplusRow0022Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts :
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
              S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)) :
    LeftNonSurplusExactCountRowExcluded S x p 0 0 2 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, q₁, q₂, hp12, hpair, hq12, hqpair⟩
  rcases hM44.left_row0022_selectedClass_eq_oppInterior1_union_surplusPair
      hradius_pos hm hs hl hr hpair with
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
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I hq12 hp12 hs12 hs13 hs23
  rcases hscaffoldFacts p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpair hq12 hqpair
      hxTriple hs12 hs13 hs23 hsSub with
    ⟨_hoppInterior1Facts, hoppInterior2Facts⟩
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row0022_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hqpair hpair hpOpp hLtriple hxL
    (hoppInterior2Facts p hp hpErase)

/-- The left exact row `(0,1,1,2)` is closed by choosing a finite surplus
triple around the row's surplus-side singleton. -/
theorem leftNonSurplusRow0112Excluded_of_finiteScaffold
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hpErase : p ∈ A.erase x)
    (hscaffoldFacts :
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
              S x (dist p x) q₁ q₂ p₁ p₂ s1 s2 s3)) :
    LeftNonSurplusExactCountRowExcluded S x p 0 1 1 2 := by
  classical
  intro hm hs hl hr
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius_pos : 0 < dist p x := dist_pos.mpr hp_ne_x
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, q₁, q₂, hp12, hpair, hq12, hqpair⟩
  rcases hM44.left_row0112_selectedClass_eq_oppInterior1_union_sameCap_surplus
      hradius_pos hm hs hl hr hpair with
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
  have hinj :
      Function.Injective
        (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3) :=
    leftPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I hq12 hp12 hs12 hs13 hs23
  rcases hscaffoldFacts p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpair hq12 hqpair
      hxTriple hs12 hs13 hs23 hsSub with
    ⟨_hoppInterior1Facts, hoppInterior2Facts⟩
  have hpOpp : p ∈ S.oppInterior2 := by
    simpa [SurplusCapPacket.oppInterior2] using hp
  exact false_of_left_row0112_finiteCandidateFacts S hM44
    hradius_pos hm hs hl hr hinj hq12 hqpair hpair hpOpp hxTriple hxL
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
  
/-- Endpoint residuals are impossible in the `IsM44` branch.  This is a spine
  obligation consumed by
  `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit`. -/
theorem isM44EndpointResidualsExcluded :
      IsM44EndpointResidualsExcludedStatement := by
    classical
    intro A _hne hconv hK4 _hgt _hMin S hM44
    constructor
    · intro radius rho x hend
      rcases
          EndpointCertificate.endpointLeft_residual_exists_false_of_metric_shadow_data
            hM44 hconv hend with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel,
          hdata⟩
      let pointOf :=
        EndpointCertificate.endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      rcases hdata with
        ⟨_hxLabel, _haLabel, _hbLabel, _hinj, _hxEq, _hpointMem,
          _hvMask, _hwMask, hfalse⟩
      have hshadow :
          ∃ shadow : EndpointCertificate.ShadowBank.Shadow,
            EndpointCertificate.ShadowBank.endpointShadowInBank xLabel
                shadow = true ∧
              EndpointCertificate.Variables.EndpointMetricShadow pointOf
                shadow := by
        -- Real remaining finite endpoint row-bank metric-shadow producer.
        sorry
      rcases hshadow with ⟨shadow, hinBank, hmetric⟩
      exact hfalse shadow hinBank hmetric
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
        -- Real remaining finite endpoint row-bank metric-shadow producer.
        sorry
      rcases hshadow with ⟨shadow, hinBank, hmetric⟩
      exact hfalse shadow hinBank hmetric
  
/-- Pinned surplus-family residuals are impossible in the `IsM44` branch.  This
  is the finite-bank/COMP-G residual obligation consumed by
  `removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit`. -/
theorem isM44PinnedSurplusResidualsExcluded :
      IsM44PinnedSurplusResidualsExcludedStatement := sorry
  
/-- Categorized residual concrete erasure-witness production for the `IsM44`
containment branch reduced to U5-style erased-pin triple circles.  The
non-surplus interior cases are discharged by exact selected-count row
exclusions for the erased-pin selected class. -/
theorem isM44NonSurplusContainmentErasedPinTripleResidualsExcluded :
      IsM44NonSurplusContainmentErasedPinTripleResidualsExcludedStatement := by
    have hprunedRows :
        IsM44NonSurplusContainmentErasedPinTripleRoutedSeedPrunedRowsFactsStatement := by
      sorry
    have hseedRows :
        IsM44NonSurplusContainmentErasedPinTripleRoutedSeedRowsFactsStatement :=
      routedSeedRowsFactsStatement_of_prunedRowsFactsStatement hprunedRows
    have hrouted :
        IsM44NonSurplusContainmentErasedPinTripleRoutedRowsFactsStatement :=
      routedRowsFactsStatement_of_routedSeedRowsFactsStatement hseedRows
    have hrows :
        IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement :=
      countRowsFactsStatement_of_routedRowsFactsStatement hrouted
    have hcount :
        IsM44NonSurplusContainmentErasedPinTripleCountFamilyFactsStatement :=
      countFamilyFactsStatement_of_countRowsFactsStatement hrows
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases hcount A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
        hcontain with
      ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
        hoppInterior1Count, hoppInterior2Count⟩
    refine ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple, ?_, ?_⟩
    · intro p hpI hpErase htriple
      have hpOpp : p ∈ S.oppInterior1 := by
        simpa [SurplusCapPacket.oppInterior1] using hpI
      exact
        SurplusCapPacket.IsM44.oppIndex1_surplusErasedPinTriple_false_of_exactCountFamily
          hM44 hK4 hcontain hxI hpOpp
        (hoppInterior1Count p hpI hpErase)
        htriple
    · intro p hpI hpErase htriple
      have hpOpp : p ∈ S.oppInterior2 := by
        simpa [SurplusCapPacket.oppInterior2] using hpI
      exact
        SurplusCapPacket.IsM44.oppIndex2_surplusErasedPinTriple_false_of_exactCountFamily
          hM44 hK4 hcontain hxI hpOpp
        (hoppInterior2Count p hpI hpErase)
        htriple

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
is a spine obligation consumed by `RemovableVertexOfLarge_from_threeWaySplit`.

The proof is the copied p97-rvol U-lane route-B tail, reassembled at the
configuration level.  A `CounterexampleData` is built on the carrier `A`;
minimality (from the strong-induction IH) excludes removable vertices and
supplies a critical shell system; the no-`IsM44` hypothesis discharges the
exact-pair branch of the cap-triple split; the surplus (non-exact) branch is
closed by `u1_largeCap_routeB_tail_false`.  The remaining open content is the
two named residuals inside that tail —
`u1_largeCap_routeB_tail_liveData_false` and
`U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
(the two-large-cap DoubleApex kill). -/
theorem removableVertexOfLarge_of_nonIsM44 :
    NonIsM44DescentStatement := by
  classical
  intro A hne hconv hK4 hgt hMin hNoM44
  -- Build the counterexample datum on the carrier `A`.
  obtain ⟨packet⟩ := MEC.nonempty_surplusCapPacket_of_K4 hne hconv hK4 hgt
  let D : CounterexampleData := ⟨A, hne, hconv, hK4, packet⟩
  have hDA : D.A = A := rfl
  have hDcard : 9 < D.A.card := by rw [hDA]; exact hgt
  -- Minimality of `D` from the strong-induction hypothesis.
  have hmin : D.Minimal := by
    intro B hBne hBconv hBK4
    by_contra hlt
    exact hMin B (not_le.mp hlt) hBne hBconv hBK4
  -- No `IsM44` surplus-cap packet on `D.A = A`.
  have hNoM44D : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44 := by rw [hDA]; exact hNoM44
  -- Minimality excludes removable vertices and supplies a critical shell system.
  have hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x :=
    CounterexampleData.not_isRemovableVertex_of_minimal hmin
  have hcritical : Nonempty (CriticalShellSystem D.A) :=
    D.exists_criticalShellSystem_of_minimal hmin
  -- The route-B tail derives `False`, closing the goal ex falso.
  exfalso
  have hncol : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three (by omega)
  have hcirc :
      3 ≤ (D.A.filter fun p =>
        dist p (MEC.mec D.A D.nonempty).center =
          (MEC.mec D.A D.nonempty).radius).card :=
    MEC.no_diameter_under_k4 D.nonempty hncol D.convex D.K4
  rcases MEC.exists_capTriple_of_circumscribed D.nonempty hncol D.convex hcirc with
    ⟨MT, hCirc, ⟨CP⟩⟩
  rcases CP.exactPair_or_nonExactSurplusBranch_of_card_gt_nine hDcard with
    hexact | hnonExact
  · exact hNoM44D
      (isM44Packet_of_capTriple_two_exact_of_card_gt_nine MT hCirc CP hDcard hexact)
  · rcases hnonExact with ⟨i, hsurplus, hnotOppExact⟩
    exact u1_largeCap_routeB_tail_false D hDcard hnoRem hcritical hNoM44D
      MT hCirc CP rfl hsurplus hnotOppExact

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
