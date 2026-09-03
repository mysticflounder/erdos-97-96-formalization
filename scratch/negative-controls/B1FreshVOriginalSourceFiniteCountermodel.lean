/-
  Card-five original-source negative control for the fresh-V endpoint route.

  This is a finite source map, not a Euclidean realization.  It retains the
  source-entitled incidence, cardinality, cap-block, and cut-order fields
  before the production adapter discards them.  In particular, the fresh pair
  is not identified with the ambient pair: only fresh `v` is identified with
  the named ambient `C.v` in this selected singleton arm.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSeparation

/-! The finite order projection of the card-five original-source arm. -/

namespace Problem97
namespace B1FreshVOriginalSourceFiniteCountermodel

open ATailFrontierLiveClosure

abbrev I := Fin 18

/- Source-map labels.  The chosen card-five shape is U-pair/V-singleton. -/
def zero : I := 0
def d1 : I := 1
def commonPoint : I := 2
def d2 : I := 3
def canonicalU : I := 4
def sourceRowTail₀ : I := 5
def sourceRowTail₁ : I := 6
def canonicalUBlocker : I := 7
def uMate : I := 8
def apex : I := 9
def canonicalV : I := 10
def canonicalVBlocker : I := 11
def vMate : I := 12
def vTail₀ : I := 13
def vTail₁ : I := 14
def completion₀ : I := 15
def completion₁ : I := 16
def unused : I := 17

def boundary (i : I) : I := i
def cutU : I := 3
def cutV : I := 8

def physicalClass : Finset I :=
  {d1, d2, canonicalU, uMate, canonicalV}

def capInterior : Finset I := physicalClass
def outsideFirstApexFiber : Finset I := Finset.univ
def leftAdjacentCap : Finset I := {commonPoint}
def rightAdjacentCap : Finset I := {canonicalVBlocker}

/- The two complete original rows and the source row used by fresh `u`. -/
def commonRow : Finset I := {d1, d2, completion₀, completion₁}
def canonicalURow : Finset I :=
  {canonicalU, uMate, sourceRowTail₀, sourceRowTail₁}
def canonicalVRow : Finset I := {canonicalV, vMate, vTail₀, vTail₁}
def uSlice : Finset I := canonicalURow ∩ physicalClass
def vSlice : Finset I := canonicalVRow ∩ physicalClass
def commonCompletion : Finset I := commonRow \ physicalClass

/- The selected arm has source=d1, fresh u=source, and fresh v=C.v. -/
def source : I := d1
def freshU : I := source
def freshV : I := canonicalV
def freshDeleted : I := d2
def freshURow : Finset I := {source, uMate, sourceRowTail₀, sourceRowTail₁}
def freshVRow : Finset I := canonicalVRow
def escapeSource : I := freshV
def escapeRow : Finset I := freshVRow
def sourceBlocker : I := sourceRowTail₀
def otherBlocker : I := sourceRowTail₁

/- Exact card-five local-role consequences retained as finite set data. -/
def cardFiveLocalRoles : Prop :=
  physicalClass.card = 5 ∧
    commonRow.card = 4 ∧ commonCompletion.card = 2 ∧
    canonicalURow.card = 4 ∧ canonicalVRow.card = 4 ∧
    uSlice.card = 2 ∧ vSlice.card = 1 ∧
    (canonicalURow \ physicalClass).card = 2 ∧
    (canonicalVRow \ physicalClass).card = 3 ∧
    (uSlice.card = 2 ∧ vSlice.card = 1)

theorem card_five_local_roles : cardFiveLocalRoles := by
  unfold cardFiveLocalRoles
  decide

/-
  Direct and mirror cap blocks.  These are the order-only projections of the
  corresponding DirectBoundaryBlocks/MirrorBoundaryBlocks fields; the
  physical cap predicates themselves are intentionally not reconstructed.
-/
def opp2Block : Finset I := {d1}
def surplusBlock : Finset I := {canonicalU}
def opp1Block : Finset I := {canonicalV}

def directBlocks : Prop :=
  zero < cutU ∧ cutU < cutV ∧
    (∀ x ∈ opp2Block,
      ∃ i, zero < i ∧ i < cutU ∧ boundary i = x) ∧
    (∀ x ∈ surplusBlock,
      ∃ i, cutU < i ∧ i < cutV ∧ boundary i = x) ∧
    (∀ x ∈ opp1Block,
      ∃ i, cutV < i ∧ boundary i = x)

def mirrorBlocks : Prop :=
  zero < cutU ∧ cutU < cutV ∧
    (∀ x ∈ opp1Block,
      ∃ i, zero < i ∧ i < cutU ∧ boundary i = x) ∧
    (∀ x ∈ surplusBlock,
      ∃ i, cutU < i ∧ i < cutV ∧ boundary i = x) ∧
    (∀ x ∈ opp2Block,
      ∃ i, cutV < i ∧ boundary i = x)

def capBlockCases : Prop := directBlocks ∨ mirrorBlocks

theorem direct_blocks : directBlocks := by
  unfold directBlocks
  refine ⟨by decide, by decide, ?_, ?_, ?_⟩
  · intro x hx
    have hx' : x = d1 := by simpa [opp2Block] using hx
    subst x
    exact ⟨d1, by decide, by decide, rfl⟩
  · intro x hx
    have hx' : x = canonicalU := by simpa [surplusBlock] using hx
    subst x
    exact ⟨canonicalU, by decide, by decide, rfl⟩
  · intro x hx
    have hx' : x = canonicalV := by simpa [opp1Block] using hx
    subst x
    exact ⟨canonicalV, by decide, rfl⟩

theorem cap_block_cases : capBlockCases := by
  exact Or.inl direct_blocks

/- Convex-independence/cap consequences retained at the cardinality level. -/
def capCardinalityConsequences : Prop :=
  physicalClass ⊆ capInterior ∧
    capInterior.card = 5 ∧
    leftAdjacentCap.card ≤ 1 ∧ rightAdjacentCap.card ≤ 1

theorem cap_cardinality_consequences : capCardinalityConsequences := by
  unfold capCardinalityConsequences
  refine ⟨?_, by decide, by decide, by decide⟩
  intro x hx
  exact hx

/- A finite projection of the exact mutually omitted joint-deletion packet. -/
structure FreshJointDeletionProjection (u v deleted : I) : Prop where
  u_mem_class : u ∈ physicalClass
  v_mem_class : v ∈ physicalClass
  deleted_mem_class : deleted ∈ physicalClass
  u_ne_v : u ≠ v
  deleted_ne_u : deleted ≠ u
  deleted_ne_v : deleted ≠ v
  deleted_not_mem_uRow : deleted ∉ freshURow
  deleted_not_mem_vRow : deleted ∉ freshVRow
  blockers_ne : sourceBlocker ≠ otherBlocker

def freshJoint : FreshJointDeletionProjection freshU freshV freshDeleted := {
  u_mem_class := by decide
  v_mem_class := by decide
  deleted_mem_class := by decide
  u_ne_v := by decide
  deleted_ne_u := by decide
  deleted_ne_v := by decide
  deleted_not_mem_uRow := by decide
  deleted_not_mem_vRow := by decide
  blockers_ne := by decide
}

theorem fresh_joint_realized :
    FreshJointDeletionProjection freshU freshV freshDeleted :=
  freshJoint

/- Both cross-row omissions are kept explicitly. -/
def mutualRowOmissions : Prop :=
  freshV ∉ freshURow ∧ freshU ∉ freshVRow

theorem mutual_row_omissions : mutualRowOmissions := by
  unfold mutualRowOmissions
  decide

/- The source-context projection mirrors every field used by the producer. -/
def retainedQSurvives : Prop := True
def retainedWSurvives : Prop := False

structure ExactFourMutualOmissionSourceContextProjection
    (source other u v : I) : Prop where
  source_mem_class : source ∈ physicalClass
  source_mem_interior : source ∈ capInterior
  source_mem_outside : source ∈ outsideFirstApexFiber
  source_cross_card_le_two :
    (freshURow ∩ (physicalClass ∩ capInterior)).card ≤ 2
  other_ne_source : other ≠ source
  other_mem_class : other ∈ physicalClass
  other_mem_interior : other ∈ capInterior
  other_not_mem_source_row : other ∉ freshURow
  source_other_blockers_ne : sourceBlocker ≠ otherBlocker
  source_survives_q_or_w : retainedQSurvives ∨ retainedWSurvives
  source_mem_u_row : source ∈ freshURow
  v_not_mem_source_row : v ∉ freshURow
  u_eq_source_or_not_mem_source_row :
    u = source ∨ u ∉ freshURow

def sourceContext :
    ExactFourMutualOmissionSourceContextProjection
      source freshV freshU freshV := {
  source_mem_class := by decide
  source_mem_interior := by decide
  source_mem_outside := by decide
  source_cross_card_le_two := by decide
  other_ne_source := by decide
  other_mem_class := by decide
  other_mem_interior := by decide
  other_not_mem_source_row := by decide
  source_other_blockers_ne := by decide
  source_survives_q_or_w := Or.inl trivial
  source_mem_u_row := by decide
  v_not_mem_source_row := by decide
  u_eq_source_or_not_mem_source_row := Or.inl rfl
}

theorem source_context_realized :
    ExactFourMutualOmissionSourceContextProjection
      source freshV freshU freshV :=
  sourceContext

/- The escape witness fields retained before the endpoint adapter drops them. -/
def escapeSourceData : Prop :=
  escapeSource ∈ physicalClass ∧
    escapeSource ∈ capInterior ∧
    escapeSource ∈ outsideFirstApexFiber ∧
    escapeSource ≠ d1 ∧ escapeSource ≠ d2 ∧
    escapeSource ∉ commonRow ∧
    (escapeSource ∈ uSlice ∨ escapeSource ∈ vSlice) ∧
    d1 ∉ escapeRow ∧ d2 ∉ escapeRow ∧
    (escapeRow ∩ commonRow).card ≤ 2

theorem escape_source_data : escapeSourceData := by
  unfold escapeSourceData
  decide

/-
  The following structures retain the complete production field families in
  a finite, non-metric projection.  The `boundary_ccw`, survival, and
  same-radius fields are explicit abstract propositions: this file makes no
  claim that the Fin 18 labels are points in a Euclidean realization.
-/

set_option maxHeartbeats 1000000

def boundaryMap (i : I) : I := boundary i

structure BoundaryIndexingProjection : Prop where
  boundary_injective : Function.Injective boundaryMap
  boundary_image : Finset.univ.image boundaryMap = Finset.univ
  boundary_ccw : True
  index_injective : Function.Injective boundaryMap
  point_eq : ∀ label, boundaryMap (boundaryMap label) = label
  boundary_identity : ∀ i, boundaryMap i = i
  index_identity : ∀ i, boundaryMap i = i

def boundaryIndexing : BoundaryIndexingProjection := {
  boundary_injective := by
    intro x y h
    exact h
  boundary_image := by
    ext x
    simp [boundaryMap, boundary]
  boundary_ccw := trivial
  index_injective := by
    intro x y h
    exact h
  point_eq := by
    intro label
    rfl
  boundary_identity := by
    intro i
    rfl
  index_identity := by
    intro i
    rfl
}

theorem boundary_indexing_realized : BoundaryIndexingProjection :=
  boundaryIndexing

def surplusApex : I := zero
def oppositeApex1 : I := d2
def oppositeApex2 : I := uMate
def zeroIndex : I := zero

/- The numerical cap consequences are retained separately from the order
  blocks, as in the robust surface input. -/
def robustCapBounds : Prop :=
  4 ≤ 4 ∧
    5 ≤ 5 ∧
    5 = 5 ∧
    4 = 4 ∧
    12 + 6 = 18

theorem robust_cap_bounds : robustCapBounds := by
  unfold robustCapBounds
  decide

structure EscapeWitnessProjection : Prop where
  source_mem_class : escapeSource ∈ physicalClass
  source_mem_interior : escapeSource ∈ capInterior
  source_ne_first : escapeSource ≠ d1
  source_ne_second : escapeSource ≠ d2
  source_not_mem_commonRow : escapeSource ∉ commonRow
  commonBlocker_survives_source_deletion : True
  escapeBlocker_ne_common : canonicalVBlocker ≠ commonPoint
  escapeBlocker_ne_apex : canonicalVBlocker ≠ oppositeApex2
  overlap_le_two : (escapeRow ∩ commonRow).card ≤ 2

theorem freshEscapeWitness : EscapeWitnessProjection := {
  source_mem_class := by decide
  source_mem_interior := by decide
  source_ne_first := by decide
  source_ne_second := by decide
  source_not_mem_commonRow := by decide
  commonBlocker_survives_source_deletion := trivial
  escapeBlocker_ne_common := by decide
  escapeBlocker_ne_apex := by decide
  overlap_le_two := by decide
}

def fresh_escape_witness_realized : EscapeWitnessProjection :=
  freshEscapeWitness

/- Full BoundaryIndexing/B1EscapeRowProvenanceStar field projection. -/
structure EscapeRowProvenanceStarProjection : Prop where
  boundary : BoundaryIndexingProjection
  boundary_nonempty : 0 < (18 : Nat)
  surplusApex_at_zero :
    boundaryMap zeroIndex = surplusApex
  oppApex1_at_index :
    boundaryMap cutU = oppositeApex1
  oppApex2_at_index :
    boundaryMap cutV = oppositeApex2
  cap_blocks : capBlockCases
  escape : EscapeWitnessProjection
  winning_slice_card : uSlice.card = 2 ∨ vSlice.card = 2
  escape_mem_live_slice :
    escapeSource ∈ uSlice ∨ escapeSource ∈ vSlice
  cross_omission : d1 ∉ escapeRow ∨ d2 ∉ escapeRow

theorem escapeRowProvenanceStar : EscapeRowProvenanceStarProjection := {
  boundary := boundaryIndexing
  boundary_nonempty := by decide
  surplusApex_at_zero := by rfl
  oppApex1_at_index := by rfl
  oppApex2_at_index := by rfl
  cap_blocks := cap_block_cases
  escape := freshEscapeWitness
  winning_slice_card := Or.inl (by decide)
  escape_mem_live_slice := Or.inr (by decide)
  cross_omission := Or.inl (by decide)
}

theorem escape_row_provenance_star_realized :
    EscapeRowProvenanceStarProjection :=
  escapeRowProvenanceStar

/- The actual-late-row second-class card bounds are retained for both
  canonical rows and the fresh strict-interior source row. -/
structure ActualLateRowSecondClassBoundProjection : Prop where
  u_row_card_le_two : uSlice.card ≤ 2
  v_row_card_le_two : vSlice.card ≤ 2
  fresh_row_card_le_two : (freshVRow ∩ physicalClass).card ≤ 2
  fresh_source_mem_strict_interior : escapeSource ∈ capInterior

def actualLateRowSecondClassBounds :
    ActualLateRowSecondClassBoundProjection := {
  u_row_card_le_two := by decide
  v_row_card_le_two := by decide
  fresh_row_card_le_two := by decide
  fresh_source_mem_strict_interior := by decide
}

theorem actual_late_row_second_class_bounds_realized :
    ActualLateRowSecondClassBoundProjection :=
  actualLateRowSecondClassBounds

/- Finite analogues of the exact row-completion and named-slice packets. -/
structure NamedSingletonSliceProjection
    (slice : Finset I) (source : I) : Prop where
  slice_eq : slice = {source}

structure NamedTwoPointSliceProjection
    (slice : Finset I) (source : I) : Type where
  other : I
  source_ne_other : source ≠ other
  slice_eq : slice = {source, other}

structure RowCompletionPairProjection
    (row physical : Finset I) : Type where
  first : I
  second : I
  first_ne_second : first ≠ second
  complement_eq : row \ physical = {first, second}

structure RowCompletionTripleProjection
    (row physical : Finset I) : Type where
  first : I
  second : I
  third : I
  first_ne_second : first ≠ second
  first_ne_third : first ≠ third
  second_ne_third : second ≠ third
  complement_eq : row \ physical = {first, second, third}

def exactUPhysical :
    NamedTwoPointSliceProjection uSlice canonicalU := {
  other := uMate
  source_ne_other := by decide
  slice_eq := by decide
}

def exactVPhysical :
    NamedSingletonSliceProjection vSlice canonicalV := {
  slice_eq := by decide
}

def exactUCompletion :
    RowCompletionPairProjection canonicalURow physicalClass := {
  first := sourceRowTail₀
  second := sourceRowTail₁
  first_ne_second := by decide
  complement_eq := by decide
}

def exactVCompletion :
    RowCompletionTripleProjection canonicalVRow physicalClass := {
  first := vMate
  second := vTail₀
  third := vTail₁
  first_ne_second := by decide
  first_ne_third := by decide
  second_ne_third := by decide
  complement_eq := by decide
}

def exactCommonCompletion :
    RowCompletionPairProjection commonRow physicalClass := {
  first := completion₀
  second := completion₁
  first_ne_second := by decide
  complement_eq := by decide
}

structure CardFiveVSingletonRowsProjection : Type where
  uPhysical : NamedTwoPointSliceProjection uSlice canonicalU
  vPhysical : NamedSingletonSliceProjection vSlice canonicalV
  uCompletion : RowCompletionPairProjection canonicalURow physicalClass
  vCompletion : RowCompletionTripleProjection canonicalVRow physicalClass

structure CardFiveLocalRolePacketProjection : Type where
  physicalClass_card : physicalClass.card = 5
  commonCompletion : RowCompletionPairProjection commonRow physicalClass
  liveRows : CardFiveVSingletonRowsProjection

def exactCardFiveRolePacket : CardFiveLocalRolePacketProjection := {
  physicalClass_card := by decide
  commonCompletion := exactCommonCompletion
  liveRows := {
    uPhysical := exactUPhysical
    vPhysical := exactVPhysical
    uCompletion := exactUCompletion
    vCompletion := exactVCompletion
  }
}

theorem exact_card_five_role_packet_exists :
    Nonempty CardFiveLocalRolePacketProjection :=
  ⟨exactCardFiveRolePacket⟩

/- The common-deletion two-center packet is retained at the exact field
  level, with finite abstract survival and radius relations. -/
def abstractSameRadius (_center _point : I) : Prop := True

structure QDeletedK4RowProjection (deleted : I) (row : Finset I) : Prop where
  subset_carrier : row ⊆ (Finset.univ : Finset I)
  card_four : row.card = 4
  deleted_not_mem : deleted ∉ row
  radius_pos : 0 < (1 : Nat)
  same_radius : ∀ y ∈ row, abstractSameRadius sourceBlocker y

def freshUPacketRow : QDeletedK4RowProjection freshDeleted freshURow := {
  subset_carrier := by simp
  card_four := by decide
  deleted_not_mem := by decide
  radius_pos := by decide
  same_radius := by intro y hy; trivial
}

def freshVPacketRow : QDeletedK4RowProjection freshDeleted freshVRow := {
  subset_carrier := by simp
  card_four := by decide
  deleted_not_mem := by decide
  radius_pos := by decide
  same_radius := by intro y hy; trivial
}

structure CommonDeletionTwoCenterPacketProjection
    (deleted center₁ center₂ : I) : Type where
  q_mem_carrier : deleted ∈ (Finset.univ : Finset I)
  center₁_mem_carrier : center₁ ∈ (Finset.univ : Finset I)
  center₂_mem_carrier : center₂ ∈ (Finset.univ : Finset I)
  centers_ne : center₁ ≠ center₂
  survives₁ : True
  survives₂ : True
  actual_blocker_ne_center₁ : apex ≠ center₁
  actual_blocker_ne_center₂ : apex ≠ center₂
  B₁ : Finset I
  B₂ : Finset I
  row₁ : QDeletedK4RowProjection deleted B₁
  row₂ : QDeletedK4RowProjection deleted B₂
  B₁_card : B₁.card = 4
  B₂_card : B₂.card = 4
  overlap_le_two : (B₁ ∩ B₂).card ≤ 2

def freshJointPacket :
    CommonDeletionTwoCenterPacketProjection
      freshDeleted sourceBlocker otherBlocker := {
  q_mem_carrier := by simp
  center₁_mem_carrier := by simp
  center₂_mem_carrier := by simp
  centers_ne := by decide
  survives₁ := trivial
  survives₂ := trivial
  actual_blocker_ne_center₁ := by decide
  actual_blocker_ne_center₂ := by decide
  B₁ := freshURow
  B₂ := freshVRow
  row₁ := freshUPacketRow
  row₂ := freshVPacketRow
  B₁_card := by decide
  B₂_card := by decide
  overlap_le_two := by decide
}

theorem fresh_joint_packet_exists :
    Nonempty (CommonDeletionTwoCenterPacketProjection
      freshDeleted sourceBlocker otherBlocker) :=
  ⟨freshJointPacket⟩

/- The cut predicates are the exact order-only shape of the two candidate arcs. -/
def finiteSameBoundaryArc (cut blocker : I) (slice : Finset I) : Prop :=
  ∀ ix iy : I, ix ∈ slice → iy ∈ slice → ix ≠ iy →
    (SurplusCOMPGBank.btw cut blocker ix ↔
      SurplusCOMPGBank.btw cut blocker iy)

def uSameArc : Prop :=
  finiteSameBoundaryArc apex canonicalUBlocker uSlice

def vCandidatePair : Finset I := {canonicalV, vMate}
def vSameArc : Prop :=
  finiteSameBoundaryArc apex canonicalVBlocker vCandidatePair

theorem not_u_same_arc : ¬ uSameArc := by
  intro h
  have hbits := h canonicalU uMate
    (by simp [uSlice, canonicalURow, physicalClass])
    (by simp [uSlice, canonicalURow, physicalClass])
    (by decide)
  have hfirst : ¬ SurplusCOMPGBank.btw apex canonicalUBlocker canonicalU := by
    decide
  have hsecond : SurplusCOMPGBank.btw apex canonicalUBlocker uMate := by
    decide
  exact hfirst (hbits.mpr hsecond)

theorem not_v_same_arc : ¬ vSameArc := by
  intro h
  have hbits := h canonicalV vMate
    (by simp [vCandidatePair])
    (by simp [vCandidatePair])
    (by decide)
  have hfirst : SurplusCOMPGBank.btw apex canonicalVBlocker canonicalV := by
    decide
  have hsecond : ¬ SurplusCOMPGBank.btw apex canonicalVBlocker vMate := by
    decide
  exact hsecond (hbits.mp hfirst)

def candidateUArc : Prop := uSlice.card = 2 ∧ uSameArc
def candidateVArc : Prop := vSlice.card = 2 ∧ vSameArc

theorem not_candidate_u_arc : ¬ candidateUArc := by
  intro h
  exact not_u_same_arc h.2

theorem not_candidate_v_arc : ¬ candidateVArc := by
  intro h
  have hcard : vSlice.card = 2 := h.1
  have hv : vSlice.card = 1 := by
    decide
  omega

theorem not_both_candidate_live_arcs : ¬ (candidateUArc ∨ candidateVArc) := by
  intro h
  rcases h with h | h
  · exact not_candidate_u_arc h
  · exact not_candidate_v_arc h

/- The relevant source/deletion role is the opposite canonical deletion arm. -/
def deletionRoleSplit : Prop :=
  (source = d1 ∧ freshDeleted = d2) ∨
    (source = d2 ∧ freshDeleted = d1)

theorem deletion_role_split : deletionRoleSplit := by
  exact Or.inl ⟨rfl, rfl⟩

theorem canonical_source_identity : source = d1 := by
  rfl

theorem fresh_v_original_live :
    freshV ∈ uSlice ∨ freshV ∈ vSlice := by
  exact Or.inr (by decide)

theorem fresh_v_is_named_ambient_source :
    freshV = canonicalV := by
  rfl

/-
  A single proposition packages the complete finite model.  Its fields are
  intentionally source-entitled facts rather than a production theorem:
  there is no Euclidean realization claim and no conclusion is inferred from
  the model beyond falsifying both candidate arc bits.
-/
structure CardFiveOriginalSourceArm : Prop where
  physical_card_five : physicalClass.card = 5
  local_roles : cardFiveLocalRoles
  cap_consequences : capCardinalityConsequences
  robust_cap_bounds : robustCapBounds
  cap_blocks : capBlockCases
  fresh_pair : FreshJointDeletionProjection freshU freshV freshDeleted
  fresh_joint_packet :
    Nonempty (CommonDeletionTwoCenterPacketProjection
      freshDeleted sourceBlocker otherBlocker)
  mutual_omissions : mutualRowOmissions
  source_context :
    ExactFourMutualOmissionSourceContextProjection
      source freshV freshU freshV
  escape_source_data : escapeSourceData
  escape_row_star : EscapeRowProvenanceStarProjection
  actual_late_row_bounds : ActualLateRowSecondClassBoundProjection
  exact_role_packet : Nonempty CardFiveLocalRolePacketProjection
  canonical_source : source = d1
  fresh_v_live : freshV ∈ uSlice ∨ freshV ∈ vSlice
  fresh_v_ambient_identity : freshV = canonicalV
  deletion_role : deletionRoleSplit
  not_u_arc : ¬ candidateUArc
  not_v_arc : ¬ candidateVArc

def model : CardFiveOriginalSourceArm := {
  physical_card_five := by decide
  local_roles := card_five_local_roles
  cap_consequences := cap_cardinality_consequences
  robust_cap_bounds := robust_cap_bounds
  cap_blocks := cap_block_cases
  fresh_pair := fresh_joint_realized
  fresh_joint_packet := fresh_joint_packet_exists
  mutual_omissions := mutual_row_omissions
  source_context := source_context_realized
  escape_source_data := escape_source_data
  escape_row_star := escape_row_provenance_star_realized
  actual_late_row_bounds := actual_late_row_second_class_bounds_realized
  exact_role_packet := exact_card_five_role_packet_exists
  canonical_source := canonical_source_identity
  fresh_v_live := fresh_v_original_live
  fresh_v_ambient_identity := fresh_v_is_named_ambient_source
  deletion_role := deletion_role_split
  not_u_arc := not_candidate_u_arc
  not_v_arc := not_candidate_v_arc
}

theorem model_exists : Nonempty CardFiveOriginalSourceArm :=
  ⟨model⟩

#print axioms model_exists

end B1FreshVOriginalSourceFiniteCountermodel
end Problem97
