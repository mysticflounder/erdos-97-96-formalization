/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.SurplusCOMPGBank
/-!
# Endpoint finite shadow bank

This module records the finite incidence shadows for the 117 endpoint
certificate rows.  The algebraic certificates live in
`EndpointCertificate.Patterns`; this file exposes the row masks used by the
geometric faithfulness bridge.
-/
namespace Problem97

namespace EndpointCertificate

namespace ShadowBank

abbrev Label := SurplusCOMPGBank.Label
abbrev Shadow := SurplusCOMPGBank.Shadow
/-- One endpoint finite-shadow row, indexed by the corresponding certificate id. -/
structure EndpointRow where
  id : String
  escapee : Label
  masks : List Nat
  deriving Repr

/-- Interpret an endpoint row as a generic ten-label shadow. -/
def EndpointRow.toShadow (row : EndpointRow) : Shadow :=
  { masks := row.masks }

/-- Endpoint residual escape branches are exactly `Q1` and `Q2`. -/
def escapeeOK : Label → Bool
  | .Q1 => true
  | .Q2 => true
  | _ => false

/-- Possible surplus-side labels for the `.v` endpoint class. -/
def vCuHitMask : Nat :=
  SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .s3]

/-- Possible surplus-side labels for the `.w` endpoint class. -/
def wCuHitMask : Nat :=
  SurplusCOMPGBank.maskOfLabels [.v, .s1, .s2, .s3]

/-- The endpoint `.v` class has `{Pw, Pu}`, the escapee, and one surplus-side hit. -/
def endpointVShapeOK (escapee : Label) (shadow : Shadow) : Bool :=
  escapeeOK escapee &&
    shadow.classHas .v .Pw &&
    shadow.classHas .v .Pu &&
    shadow.classHas .v escapee &&
    (SurplusCOMPGBank.maskInterCard (shadow.centerMask .v) vCuHitMask == 1)

/-- The endpoint `.w` class has `{Q1, Q2, u}` and one surplus-side hit. -/
def endpointWShapeOK (shadow : Shadow) : Bool :=
  shadow.classHas .w .Q1 &&
    shadow.classHas .w .Q2 &&
    shadow.classHas .w .u &&
    (SurplusCOMPGBank.maskInterCard (shadow.centerMask .w) wCuHitMask == 1)

/-- The finite Boolean contract used by the endpoint fragment enumerator. -/
def endpointShadowOK (escapee : Label) (shadow : Shadow) : Bool :=
  shadow.hasTenMasks &&
    shadow.classesShapeOK &&
    endpointVShapeOK escapee shadow &&
    endpointWShapeOK shadow &&
    SurplusCOMPGBank.oneHitOK shadow &&
    SurplusCOMPGBank.circumcenterOK shadow &&
    SurplusCOMPGBank.noThreeOK shadow &&
    SurplusCOMPGBank.searchPairCountsOK shadow &&
    SurplusCOMPGBank.separationOK shadow &&
    SurplusCOMPGBank.searchSeparationOK shadow

/-- Endpoint-local candidate mask predicate used by the finite DFS. -/
def endpointCandidateMaskOK (escapee center : Label) (mask : Nat) : Bool :=
  SurplusCOMPGBank.maskNormalized mask &&
    SurplusCOMPGBank.maskCard mask == 4 &&
    !SurplusCOMPGBank.maskHas mask center &&
    (if center == .v then
      escapeeOK escapee &&
        SurplusCOMPGBank.maskHas mask .Pw &&
        SurplusCOMPGBank.maskHas mask .Pu &&
        SurplusCOMPGBank.maskHas mask escapee &&
        (SurplusCOMPGBank.maskInterCard mask vCuHitMask == 1)
     else
      true) &&
    (if center == .w then
      SurplusCOMPGBank.maskHas mask .Q1 &&
        SurplusCOMPGBank.maskHas mask .Q2 &&
        SurplusCOMPGBank.maskHas mask .u &&
        (SurplusCOMPGBank.maskInterCard mask wCuHitMask == 1) &&
        decide (SurplusCOMPGBank.maskInterCard mask
          SurplusCOMPGBank.cvNoWMask <= 1) &&
        decide (SurplusCOMPGBank.maskInterCard mask
          SurplusCOMPGBank.cuNoWMask <= 1)
     else
      true) &&
    (if center == .u then
      decide (SurplusCOMPGBank.maskInterCard mask
        SurplusCOMPGBank.cvNoUMask <= 1) &&
        decide (SurplusCOMPGBank.maskInterCard mask
          SurplusCOMPGBank.cwNoUMask <= 1)
     else
      true) &&
    (if SurplusCOMPGBank.isMoserLabel center then
      true
     else
      !(SurplusCOMPGBank.maskHas mask .u &&
        SurplusCOMPGBank.maskHas mask .v &&
        SurplusCOMPGBank.maskHas mask .w))

/-- Candidate masks for one endpoint escapee and one center. -/
def endpointCandidateMasks (escapee center : Label) : List Nat :=
  SurplusCOMPGBank.allNormalizedMasks.filter
    (endpointCandidateMaskOK escapee center ·)

/-- Endpoint escapee cases searched by the finite DFS. -/
def endpointSearchEscapees : List Label :=
  [.Q1, .Q2]

/-- Endpoint DFS center order. -/
def endpointSearchOrder : List Label :=
  SurplusCOMPGBank.fragmentSearchOrder

/-- Endpoint DFS plan for a fixed escapee. -/
def endpointSearchPlan (escapee : Label) : List (Label × List Nat) :=
  endpointSearchOrder.map
    (fun center => (center, endpointCandidateMasks escapee center))

/-- Finite endpoint DFS with pair-count and separation pruning. -/
def endpointSearchAux
    (escapee : Label) (assigned : List Label) (masks pairCounts : List Nat)
    (plan : List (Label × List Nat)) : List (List Nat) :=
  match plan with
  | [] =>
      if masks.length == SurplusCOMPGBank.labelCount &&
          SurplusCOMPGBank.pairCountsOK pairCounts then
        [masks]
      else
        []
  | (center, candidates) :: rest =>
      candidates.flatMap
        (fun mask =>
          let masks' := SurplusCOMPGBank.setCenterMask masks center mask
          let pairCounts' :=
            SurplusCOMPGBank.incrementPairCounts center mask pairCounts
          if SurplusCOMPGBank.assignedSeparationOK center mask assigned masks &&
              SurplusCOMPGBank.pairCountsOK pairCounts' then
            endpointSearchAux escapee (center :: assigned) masks'
              pairCounts' rest
          else
            [])
termination_by plan.length
decreasing_by
  simp_wf

/-- Raw endpoint DFS entries for one escapee. -/
def rawEndpointSearchEntriesFor (escapee : Label) : List (Label × List Nat) :=
  (endpointSearchAux escapee [] SurplusCOMPGBank.emptyShadowMasks
    SurplusCOMPGBank.emptyPairCounts (endpointSearchPlan escapee)).map
      (fun masks => (escapee, masks))

/-- Raw endpoint DFS entries for both endpoint escapee cases. -/
def computedEndpointSearchEntries : List (Label × List Nat) :=
  endpointSearchEscapees.flatMap rawEndpointSearchEntriesFor

/-- Membership test for endpoint `(escapee, masks)` entries. -/
def containsEntry (entry : Label × List Nat) : List (Label × List Nat) → Bool
  | [] => false
  | head :: tail => if head = entry then true else containsEntry entry tail

/-- Computed endpoint DFS acceptance for one shadow. -/
def computedEndpointShadowAcceptedBySearch
    (escapee : Label) (shadow : Shadow) : Bool :=
  shadow.hasTenMasks &&
    containsEntry (escapee, shadow.masks) computedEndpointSearchEntries
/-- Endpoint rows with escapee `Q1`. -/
def endpointRowsQ1 : List EndpointRow :=
[
  { id := "ep_Q1_000", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3]
    ] },
  { id := "ep_Q1_001", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3]
    ] },
  { id := "ep_Q1_002", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3]
    ] },
  { id := "ep_Q1_003", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s2]
    ] },
  { id := "ep_Q1_004", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3]
    ] },
  { id := "ep_Q1_005", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3]
    ] },
  { id := "ep_Q1_006", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3]
    ] },
  { id := "ep_Q1_007", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3]
    ] },
  { id := "ep_Q1_008", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .s3, .Pu]
    ] },
  { id := "ep_Q1_009", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s2]
    ] },
  { id := "ep_Q1_010", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s2]
    ] },
  { id := "ep_Q1_011", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q1_012", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q1_013", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q1_014", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q1_015", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q1_016", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q1_017", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q1_018", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Q1]
    ] },
  { id := "ep_Q1_019", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s2]
    ] },
  { id := "ep_Q1_020", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s2]
    ] },
  { id := "ep_Q1_021", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s2]
    ] },
  { id := "ep_Q1_022", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pu]
    ] },
  { id := "ep_Q1_023", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3]
    ] },
  { id := "ep_Q1_024", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q1_025", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3]
    ] },
  { id := "ep_Q1_026", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1]
    ] },
  { id := "ep_Q1_027", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1]
    ] },
  { id := "ep_Q1_028", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3]
    ] },
  { id := "ep_Q1_029", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1]
    ] },
  { id := "ep_Q1_030", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3]
    ] },
  { id := "ep_Q1_031", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q1_032", escapee := .Q1, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3]
    ] }
]

/-- Endpoint rows with escapee `Q2`. -/
def endpointRowsQ2 : List EndpointRow :=
[
  { id := "ep_Q2_000", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q1]
    ] },
  { id := "ep_Q2_001", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pu, .Q1]
    ] },
  { id := "ep_Q2_002", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3]
    ] },
  { id := "ep_Q2_003", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_004", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_005", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_006", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_007", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3]
    ] },
  { id := "ep_Q2_008", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Q1]
    ] },
  { id := "ep_Q2_009", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_010", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_011", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_012", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_013", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_014", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3]
    ] },
  { id := "ep_Q2_015", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Q1]
    ] },
  { id := "ep_Q2_016", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3]
    ] },
  { id := "ep_Q2_017", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Q1]
    ] },
  { id := "ep_Q2_018", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s2, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3]
    ] },
  { id := "ep_Q2_019", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_020", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_021", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_022", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_023", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_024", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_025", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_026", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_027", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_028", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3]
    ] },
  { id := "ep_Q2_029", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_030", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_031", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_032", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_033", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_034", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1]
    ] },
  { id := "ep_Q2_035", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .Pu, .Q1]
    ] },
  { id := "ep_Q2_036", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1]
    ] },
  { id := "ep_Q2_037", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_038", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_039", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1]
    ] },
  { id := "ep_Q2_040", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1]
    ] },
  { id := "ep_Q2_041", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q1]
    ] },
  { id := "ep_Q2_042", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1]
    ] },
  { id := "ep_Q2_043", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .s2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_044", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1]
    ] },
  { id := "ep_Q2_045", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_046", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_047", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_048", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_049", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q1]
    ] },
  { id := "ep_Q2_050", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_051", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_052", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_053", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_054", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_055", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_056", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1]
    ] },
  { id := "ep_Q2_057", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1]
    ] },
  { id := "ep_Q2_058", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1]
    ] },
  { id := "ep_Q2_059", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1]
    ] },
  { id := "ep_Q2_060", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .s2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_061", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .s2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_062", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s2, .Q1]
    ] },
  { id := "ep_Q2_063", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .s2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_064", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q2_065", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q2_066", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3]
    ] },
  { id := "ep_Q2_067", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q1]
    ] },
  { id := "ep_Q2_068", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_069", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s3, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .s3, .Q1]
    ] },
  { id := "ep_Q2_070", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_071", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pu]
    ] },
  { id := "ep_Q2_072", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s2, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s1, .s3, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_073", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pu, .Q1]
    ] },
  { id := "ep_Q2_074", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_075", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_076", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1]
    ] },
  { id := "ep_Q2_077", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .s3, .Q1]
    ] },
  { id := "ep_Q2_078", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1]
    ] },
  { id := "ep_Q2_079", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .s2, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1]
    ] },
  { id := "ep_Q2_080", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .s3, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .s1, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1]
    ] },
  { id := "ep_Q2_081", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q1]
    ] },
  { id := "ep_Q2_082", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s2, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .s1, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pu],
      SurplusCOMPGBank.maskOfLabels [.w, .s2, .Pw, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .Pw, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s3, .Q1]
    ] },
  { id := "ep_Q2_083", escapee := .Q2, masks := [
      SurplusCOMPGBank.maskOfLabels [.s1, .s2, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.s3, .Pw, .Pu, .Q2],
      SurplusCOMPGBank.maskOfLabels [.u, .s3, .Q1, .Q2],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .s2, .Q2],
      SurplusCOMPGBank.maskOfLabels [.w, .s1, .s3, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s2, .Pu],
      SurplusCOMPGBank.maskOfLabels [.v, .w, .Pu, .Q1],
      SurplusCOMPGBank.maskOfLabels [.u, .w, .s1, .Pw],
      SurplusCOMPGBank.maskOfLabels [.u, .v, .s1, .s3],
      SurplusCOMPGBank.maskOfLabels [.v, .s2, .Pw, .Q1]
    ] }
]

/-- All 117 endpoint finite-shadow rows. -/
def allEndpointRows : List EndpointRow :=
  endpointRowsQ1 ++ endpointRowsQ2

/-- The `(escapee, masks)` keys of the endpoint row bank. -/
def endpointRowEntries : List (Label × List Nat) :=
  allEndpointRows.map (fun row => (row.escapee, row.masks))

/-- Endpoint row-bank membership for one shadow. -/
def endpointShadowInBank (escapee : Label) (shadow : Shadow) : Bool :=
  shadow.hasTenMasks && containsEntry (escapee, shadow.masks) endpointRowEntries

theorem endpointRowsQ1_length : endpointRowsQ1.length = 33 := by
  rfl

theorem endpointRowsQ2_length : endpointRowsQ2.length = 84 := by
  rfl

theorem allEndpointRows_length : allEndpointRows.length = 117 := by
  rfl

/-- Every generated endpoint row satisfies the endpoint fragment Boolean contract. -/
theorem allEndpointRows_valid :
    allEndpointRows.all (fun row => endpointShadowOK row.escapee row.toShadow) = true := by
  native_decide

end ShadowBank

end EndpointCertificate

end Problem97
