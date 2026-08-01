/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedBVRoleBank
import Mathlib.Tactic

/-!
# Native row classifier for the cap-selected card-eleven branch

This module replaces the quantified color circuit with the same finite search
used by the direct census. Rows are eleven-bit masks. Equality closure is
computed deterministically by union-find on the 55 unoriented non-loop edges,
so the search has no free color variables.

The first checkpoint is executable performance on one placement. The
proof-facing soundness layer is kept separate from this search kernel.
-/

namespace Problem97
namespace Census554
namespace CapSelectedNativeClassifier

open CapSelectedBVRoleBank

abbrev RowMask := Nat

structure Row where
  center : Nat
  support : RowMask
deriving DecidableEq, Repr

structure Domain where
  center : Nat
  rows : List Row
deriving Repr

def labels : List Nat := List.range 11

/-! The support search only admits four-point masks.  Keep this finite table
explicit so every candidate domain starts from 330 masks instead of scanning
all 2048 eleven-bit masks and recounting each one.  The ordering is the
ascending order produced by the old range/filter definition. -/
def fourPointMasks : List RowMask :=
  [15, 23, 27, 29, 30, 39, 43, 45, 46, 51, 53, 54, 57, 58, 60, 71,
   75, 77, 78, 83, 85, 86, 89, 90, 92, 99, 101, 102, 105, 106, 108, 113,
   114, 116, 120, 135, 139, 141, 142, 147, 149, 150, 153, 154, 156, 163, 165, 166,
   169, 170, 172, 177, 178, 180, 184, 195, 197, 198, 201, 202, 204, 209, 210, 212,
   216, 225, 226, 228, 232, 240, 263, 267, 269, 270, 275, 277, 278, 281, 282, 284,
   291, 293, 294, 297, 298, 300, 305, 306, 308, 312, 323, 325, 326, 329, 330, 332,
   337, 338, 340, 344, 353, 354, 356, 360, 368, 387, 389, 390, 393, 394, 396, 401,
   402, 404, 408, 417, 418, 420, 424, 432, 449, 450, 452, 456, 464, 480, 519, 523,
   525, 526, 531, 533, 534, 537, 538, 540, 547, 549, 550, 553, 554, 556, 561, 562,
   564, 568, 579, 581, 582, 585, 586, 588, 593, 594, 596, 600, 609, 610, 612, 616,
   624, 643, 645, 646, 649, 650, 652, 657, 658, 660, 664, 673, 674, 676, 680, 688,
   705, 706, 708, 712, 720, 736, 771, 773, 774, 777, 778, 780, 785, 786, 788, 792,
   801, 802, 804, 808, 816, 833, 834, 836, 840, 848, 864, 897, 898, 900, 904, 912,
   928, 960, 1031, 1035, 1037, 1038, 1043, 1045, 1046, 1049, 1050, 1052, 1059, 1061, 1062, 1065,
   1066, 1068, 1073, 1074, 1076, 1080, 1091, 1093, 1094, 1097, 1098, 1100, 1105, 1106, 1108, 1112,
   1121, 1122, 1124, 1128, 1136, 1155, 1157, 1158, 1161, 1162, 1164, 1169, 1170, 1172, 1176, 1185,
   1186, 1188, 1192, 1200, 1217, 1218, 1220, 1224, 1232, 1248, 1283, 1285, 1286, 1289, 1290, 1292,
   1297, 1298, 1300, 1304, 1313, 1314, 1316, 1320, 1328, 1345, 1346, 1348, 1352, 1360, 1376, 1409,
   1410, 1412, 1416, 1424, 1440, 1472, 1539, 1541, 1542, 1545, 1546, 1548, 1553, 1554, 1556, 1560,
   1569, 1570, 1572, 1576, 1584, 1601, 1602, 1604, 1608, 1616, 1632, 1665, 1666, 1668, 1672, 1680,
   1696, 1728, 1793, 1794, 1796, 1800, 1808, 1824, 1856, 1920]

def has (mask point : Nat) : Bool := mask.testBit point

def countPoints (mask : RowMask) (points : List Nat) : Nat :=
  points.foldl (fun count point => bif has mask point then count + 1 else count) 0

def supportPoints (mask : RowMask) : List Nat :=
  labels.filter fun point => has mask point

/-! Kernel-checked regression for the generated table. -/
def fourPointMasksReference : List RowMask :=
  (List.range 2048).filter fun support => countPoints support labels == 4

set_option maxHeartbeats 0 in
-- The generated 330-entry table is checked against the executable reference.
set_option linter.style.maxHeartbeats false in
set_option linter.style.nativeDecide false in
set_option maxRecDepth 100000 in
theorem fourPointMasks_eq_reference :
    fourPointMasks = fourPointMasksReference := by
  native_decide

theorem countPoints_eq_four_of_mem_fourPointMasks
    {support : RowMask} (hsupport : support ∈ fourPointMasks) :
    (countPoints support labels == 4) = true := by
  rw [fourPointMasks_eq_reference, fourPointMasksReference] at hsupport
  exact (List.mem_filter.mp hsupport).2

theorem fourPointMasks_mem_lt_2048
    {support : RowMask} (hsupport : support ∈ fourPointMasks) :
    support < 2048 := by
  rw [fourPointMasks_eq_reference, fourPointMasksReference] at hsupport
  exact List.mem_range.mp (List.mem_filter.mp hsupport).1

def commonPoints (left right : RowMask) : List Nat :=
  labels.filter fun point => has left point && has right point

def allEmptyCommon (left right : RowMask) (points : List Nat) : Bool :=
  points.all fun point => !(has left point && has right point)

def hullPosition : Nat -> Nat
  | 0 => 0
  | 9 => 1
  | 10 => 2
  | 1 => 3
  | 3 => 4
  | 4 => 5
  | 5 => 6
  | 6 => 7
  | 2 => 8
  | 7 => 9
  | 8 => 10
  | _ => 0

def cyclicBetween (left right point : Nat) : Bool :=
  let pointOffset := (hullPosition point + 11 - hullPosition left) % 11
  let rightOffset := (hullPosition right + 11 - hullPosition left) % 11
  decide (0 < pointOffset && pointOffset < rightOffset)

def cyclicSeparated (left right first second : Nat) : Bool :=
  cyclicBetween left right first != cyclicBetween left right second

def cyclicOffset (left right : Nat) : Nat :=
  (hullPosition right + 11 - hullPosition left) % 11

def cyclicFive (a x b c y : Nat) : Bool :=
  let ax := cyclicOffset a x
  let ab := cyclicOffset a b
  let ac := cyclicOffset a c
  let ay := cyclicOffset a y
  decide (0 < ax && ax < ab && ab < ac && ac < ay)

def cyclicFiveUpToOrientation (a x b c y : Nat) : Bool :=
  cyclicFive a x b c y || cyclicFive a y c b x

def moserOneHitOK (center : Nat) (support : RowMask) : Bool :=
  match center with
  | 0 => countPoints support [2, 7, 8] <= 1 &&
      countPoints support [1, 9, 10] <= 1
  | 1 => countPoints support [2, 3, 4, 5, 6] <= 1 &&
      countPoints support [0, 9, 10] <= 1
  | 2 => countPoints support [1, 3, 4, 5, 6] <= 1 &&
      countPoints support [0, 7, 8] <= 1
  | _ => true

def capSelectedCountOK (center : Nat) (support : RowMask) : Bool :=
  if 1 <= center && center <= 6 then
    countPoints support [1, 2, 3, 4, 5, 6] ==
      (if center <= 2 then 1 else 2)
  else
    true

/-! The four-point count is supplied by `fourPointMasks`.  Keeping the
remaining local filters separate lets candidate-domain construction avoid
recounting all eleven labels for every table entry. -/
def localCandidateOKFourPoint (center deleted : Nat) (support : RowMask) : Bool :=
    !has support center &&
    moserOneHitOK center support &&
    (if 3 <= center then countPoints support [0, 1, 2] <= 2 else true) &&
    capSelectedCountOK center support &&
    (if center == 0 then has support deleted else true)

def localCandidateOK (center deleted : Nat) (support : RowMask) : Bool :=
  countPoints support labels == 4 &&
    localCandidateOKFourPoint center deleted support

theorem localCandidateOK_eq_localCandidateOKFourPoint_of_mem
    {center deleted : Nat} {support : RowMask}
    (hsupport : support ∈ fourPointMasks) :
    localCandidateOK center deleted support =
      localCandidateOKFourPoint center deleted support := by
  simp [localCandidateOK,
    countPoints_eq_four_of_mem_fourPointMasks hsupport]

def candidateRows (center deleted : Nat) : List Row :=
  fourPointMasks.filterMap fun support =>
    if localCandidateOKFourPoint center deleted support then
      some { center, support }
    else
      none

def q3PairOK (left right : Row) : Bool :=
  let c := left.center
  let d := right.center
  let L := left.support
  let R := right.support
  if c == 0 && d == 1 || c == 1 && d == 0 then
    allEmptyCommon L R [9, 10] &&
      (allEmptyCommon L R [3, 4, 5, 6] || allEmptyCommon L R [7, 8])
  else if c == 0 && d == 2 || c == 2 && d == 0 then
    allEmptyCommon L R [7, 8] &&
      (allEmptyCommon L R [3, 4, 5, 6] || allEmptyCommon L R [9, 10])
  else if c == 1 && d == 2 || c == 2 && d == 1 then
    allEmptyCommon L R [3, 4, 5, 6] &&
      (allEmptyCommon L R [7, 8] || allEmptyCommon L R [9, 10])
  else
    true

def crossSeparationOK (left right : Row) : Bool :=
  match commonPoints left.support right.support with
  | first :: second :: _ =>
      cyclicSeparated left.center right.center first second
  | _ => true

def rowsCompatible (left right : Row) : Bool :=
  countPoints left.support (supportPoints right.support) <= 2 &&
    q3PairOK left right &&
    crossSeparationOK left right

def decodePair (code : Nat) : Nat × Nat := (code / 11, code % 11)

def containsPair (row : Row) (code : Nat) : Bool :=
  let pair := decodePair code
  has row.support pair.1 && has row.support pair.2

def pairBoundOK (assigned : List Row) (row : Row) : Bool :=
  pairCodes.all fun code =>
    !containsPair row code ||
      (assigned.countP fun previous => containsPair previous code) < 2

/-! PARKED-SPEC: incremental pair-capacity state for a future fast DFS.  Pair codes are already
unique and below 110, so their values can be used directly as Nat bit
positions.  `once` records pairs seen at least once and `twice` records pairs
seen at least twice; higher multiplicities do not matter to the classifier.
The evaluator below remains unwired until its equivalence with `pairBoundOK`
is proved. -/
structure PairUse where
  once : Nat
  twice : Nat

def rowPairMask (row : Row) : Nat :=
  pairCodes.foldl
    (fun mask code =>
      if containsPair row code then mask ||| ((1 : Nat) <<< code) else mask)
    0

def addPairUse (use : PairUse) (row : Row) : PairUse :=
  let mask := rowPairMask row
  { once := use.once ||| mask
    twice := use.twice ||| (use.once &&& mask) }

def pairUseOfRows (rows : List Row) : PairUse :=
  rows.foldl addPairUse { once := 0, twice := 0 }

def pairBoundOKWithUse (use : PairUse) (row : Row) : Bool :=
  (use.twice &&& rowPairMask row) == 0

def compatibleWithPairUse
    (assigned : List Row) (use : PairUse) (row : Row) : Bool :=
  pairBoundOKWithUse use row && assigned.all fun previous => rowsCompatible row previous

def compatibleWith (assigned : List Row) (row : Row) : Bool :=
  pairBoundOK assigned row && assigned.all fun previous => rowsCompatible row previous

def edgeCode (left right : Nat) : Nat :=
  if left < right then 11 * left + right else 11 * right + left

def initialParents : Array Nat := (List.range 121).toArray

def rootAux : Nat -> Array Nat -> Nat -> Nat
  | 0, _, edge => edge
  | fuel + 1, parents, edge =>
      let parent := parents[edge]!
      if parent == edge then edge else rootAux fuel parents parent

def root (parents : Array Nat) (edge : Nat) : Nat :=
  rootAux 121 parents edge

def unionEdges (parents : Array Nat) (left right : Nat) : Array Nat :=
  let leftRoot := root parents left
  let rightRoot := root parents right
  if leftRoot == rightRoot then parents else parents.set! rightRoot leftRoot

def addRowEqualities (parents : Array Nat) (row : Row) : Array Nat :=
  match supportPoints row.support with
  | [] => parents
  | first :: rest =>
      rest.foldl
        (fun current point =>
          unionEdges current (edgeCode row.center first) (edgeCode row.center point))
        parents

def equalityClosure (rows : List Row) : Array Nat :=
  rows.foldl addRowEqualities initialParents

def normalizedRoots (parents : Array Nat) : Array Nat :=
  (List.range 121).toArray.map fun edge => root parents edge

def edgesEqual (roots : Array Nat)
    (left₁ right₁ left₂ right₂ : Nat) : Bool :=
  roots[edgeCode left₁ right₁]! == roots[edgeCode left₂ right₂]!

def atLeast (count : Nat) (xs : List Nat) (predicate : Nat -> Bool) : Bool :=
  count <= xs.countP predicate

def duplicateCenterCore (roots : Array Nat) : Bool :=
  tripleCodes.any fun code =>
    let p := code / 121
    let q := (code / 11) % 11
    let r := code % 11
    atLeast 2 labels fun center =>
      edgesEqual roots center p center q &&
        edgesEqual roots center p center r

def exactPinnedOffCircleCore (roots : Array Nat) (pinned : RowMask) : Bool :=
  labels.any fun onCircle =>
    has pinned onCircle && labels.any fun offCircle =>
      !has pinned offCircle && edgesEqual roots 1 onCircle 1 offCircle

def perpendicularBisectorCore (roots : Array Nat) : Bool :=
  pairCodes.any fun code =>
    let pair := decodePair code
    atLeast 3 labels fun point =>
      edgesEqual roots point pair.1 point pair.2

def fivePointCoreAtEndpoints (roots : Array Nat) (a b : Nat) : Bool :=
  let bisectors := labels.filter fun point => edgesEqual roots point a point b
  bisectors.any fun x => bisectors.any fun y =>
    x != y && labels.any fun c =>
      cyclicFiveUpToOrientation a x b c y &&
        edgesEqual roots c b c x &&
        edgesEqual roots c b c y

def convexFivePointCore (roots : Array Nat) : Bool :=
  pairCodes.any fun code =>
    let pair := decodePair code
    fivePointCoreAtEndpoints roots pair.1 pair.2 ||
      fivePointCoreAtEndpoints roots pair.2 pair.1

def convexRhombusCore (roots : Array Nat) : Bool :=
  sixRoleCodes.any fun code =>
    let d := code % 11
    let code := code / 11
    let y := code % 11
    let code := code / 11
    let x := code % 11
    let code := code / 11
    let c := code % 11
    let code := code / 11
    let b := code % 11
    let a := code / 11
    edgesEqual roots a b b c &&
      edgesEqual roots a b c d &&
      edgesEqual roots a b d a &&
      edgesEqual roots a b b y &&
      edgesEqual roots a b c y &&
      edgesEqual roots a b x d &&
      edgesEqual roots a b x a

def hasPrefixCore (rows : List Row) : Bool :=
  let roots := normalizedRoots (equalityClosure rows)
  let pinned := rows.find? (fun row => row.center == 1)
  duplicateCenterCore roots ||
    (match pinned with
      | some row => exactPinnedOffCircleCore roots row.support
      | none => false) ||
    perpendicularBisectorCore roots ||
    convexFivePointCore roots

def insertDomain (domain : Domain) : List Domain -> List Domain
  | [] => [domain]
  | next :: rest =>
      if domain.rows.length <= next.rows.length then
        domain :: next :: rest
      else
        next :: insertDomain domain rest

def sortDomains (domains : List Domain) : List Domain :=
  domains.foldr insertDomain []

def restrictDomain (assigned : List Row) (domain : Domain) : Domain :=
  { domain with rows := domain.rows.filter fun row => compatibleWith assigned row }

/-- Restrict a domain list while stopping as soon as one restricted domain is empty.

This returns the same mapped list as `List.map (restrictDomain assigned)` when no
empty domain occurs, and `none` exactly when the old `map`/`any` pair would detect
an empty domain.  Keeping the list in the successful case lets the evaluator
avoid doing the restriction work twice. -/
def restrictDomainsChecked (assigned : List Row) : List Domain → Option (List Domain)
  | [] => some []
  | domain :: rest =>
      let restricted := restrictDomain assigned domain
      if restricted.rows.isEmpty then
        none
      else
        match restrictDomainsChecked assigned rest with
        | none => none
        | some remaining => some (restricted :: remaining)

theorem restrictDomainsChecked_none_iff (assigned : List Row) (domains : List Domain) :
    restrictDomainsChecked assigned domains = none ↔
      (domains.map (restrictDomain assigned)).any (fun domain => domain.rows.isEmpty) := by
  induction domains with
  | nil => simp [restrictDomainsChecked]
  | cons domain rest ih =>
      by_cases hdomain : (restrictDomain assigned domain).rows = []
      · simp [restrictDomainsChecked, hdomain]
      · cases hrest : restrictDomainsChecked assigned rest with
        | none =>
            have htail := ih.mp hrest
            simp [restrictDomainsChecked, hdomain, hrest, htail]
        | some remaining =>
            have hnone : restrictDomainsChecked assigned rest ≠ none := by
              intro hnone
              rw [hnone] at hrest
              cases hrest
            have hnotany :
                ¬ ((List.map (restrictDomain assigned) rest).any
                    (fun domain => domain.rows.isEmpty) = true) := by
              intro hany
              exact hnone (ih.mpr hany)
            simp [restrictDomainsChecked, hdomain, hrest, hnotany]

theorem restrictDomainsChecked_some_map_iff (assigned : List Row) (domains : List Domain) :
    restrictDomainsChecked assigned domains =
        some (domains.map (restrictDomain assigned)) ↔
      ¬ (domains.map (restrictDomain assigned)).any (fun domain => domain.rows.isEmpty) := by
  induction domains with
  | nil => simp [restrictDomainsChecked]
  | cons domain rest ih =>
      by_cases hdomain : (restrictDomain assigned domain).rows = []
      · simp [restrictDomainsChecked, hdomain]
      · cases hrest : restrictDomainsChecked assigned rest with
        | none =>
            have htail :=
              (restrictDomainsChecked_none_iff assigned rest).mp hrest
            simp [restrictDomainsChecked, hdomain, hrest, htail]
        | some remaining =>
            have hnone : restrictDomainsChecked assigned rest ≠ none := by
              intro hnone
              rw [hnone] at hrest
              cases hrest
            have hnotany :
                ¬ ((List.map (restrictDomain assigned) rest).any
                    (fun domain => domain.rows.isEmpty) = true) := by
              intro hany
              exact hnone
                ((restrictDomainsChecked_none_iff assigned rest).mpr hany)
            have hmap := ih.mpr hnotany
            have hremaining :
                remaining = List.map (restrictDomain assigned) rest :=
              Option.some.inj (hrest.symm.trans hmap)
            simp [restrictDomainsChecked, hdomain, hrest, hremaining,
              hnotany]

def restrictDomainPairUse
    (assigned : List Row) (use : PairUse) (domain : Domain) : Domain :=
  { domain with
    rows := domain.rows.filter fun row => compatibleWithPairUse assigned use row }

def allKilled : Nat -> List Row -> List Domain -> Bool
  | 0, assigned, _ => hasPrefixCore assigned
  | fuel + 1, assigned, domains =>
      if hasPrefixCore assigned then
        true
      else
        match sortDomains domains with
        | [] => false
        | domain :: rest =>
            domain.rows.all fun row =>
              if compatibleWith assigned row then
                let nextAssigned := row :: assigned
                match restrictDomainsChecked nextAssigned rest with
                | none => true
                | some nextDomains => allKilled fuel nextAssigned nextDomains
              else
                true

/-! PARKED-SPEC side-by-side evaluator.  It preserves the old closure calculation and
domain ordering while replacing repeated pair-count scans with `PairUse`. -/
def allKilledPairUse : Nat -> List Row -> PairUse -> List Domain -> Bool
  | 0, assigned, _, _ => hasPrefixCore assigned
  | fuel + 1, assigned, use, domains =>
      if hasPrefixCore assigned then
        true
      else
        match sortDomains domains with
        | [] => false
        | domain :: rest =>
            domain.rows.all fun row =>
              if compatibleWithPairUse assigned use row then
                let nextAssigned := row :: assigned
                let nextUse := addPairUse use row
                let nextDomains :=
                  rest.map (restrictDomainPairUse nextAssigned nextUse)
                if nextDomains.any fun next => next.rows.isEmpty then
                  true
                else
                  allKilledPairUse fuel nextAssigned nextUse nextDomains
              else
                true

def fixedPinnedRow (pinSource : Nat) : Row :=
  { center := 1
    support := 2 ^ 0 + 2 ^ 7 + 2 ^ 8 + 2 ^ pinSource }

def variableCenters : List Nat := [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def placementCheck (pinSource deleted : Nat) : Bool :=
  let fixed := fixedPinnedRow pinSource
  if !localCandidateOK fixed.center deleted fixed.support then
    false
  else
    let assigned := [fixed]
    let baseDomains := variableCenters.map fun center =>
      { center, rows := candidateRows center deleted }
    match restrictDomainsChecked assigned baseDomains with
    | none => true
    | some domains => allKilled variableCenters.length assigned domains

def placementCheckPairUse (pinSource deleted : Nat) : Bool :=
  let fixed := fixedPinnedRow pinSource
  if !localCandidateOK fixed.center deleted fixed.support then
    false
  else
    let assigned := [fixed]
    let use := pairUseOfRows assigned
    let domains := variableCenters.map fun center =>
      restrictDomainPairUse assigned use { center, rows := candidateRows center deleted }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allKilledPairUse variableCenters.length assigned use domains

set_option maxHeartbeats 0 in
-- Native replay traverses the complete finite placement search tree.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem placementCheck_p6_d4 : placementCheck 6 4 = true := by
  native_decide

end CapSelectedNativeClassifier
end Census554
end Problem97
