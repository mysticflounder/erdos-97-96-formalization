/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Equilateral-hinge collision cores

Four finite equality systems share the same equilateral hinge and differ only
in their closing tails.  The Euclidean collision theorems are orientation-free.
The accompanying abstract cores expose only row-equality closure witnesses and
one distinct anchor pair; no fixed finite labels occur in the public API.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- An orientation-free equilateral hinge over the normalized anchors has
horizontal coordinate `1/2` and squared vertical coordinate `3/4`. -/
theorem normalized_equilateralHinge_coordinates
    {H : ℝ²}
    (hAH : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) H)
    (hBH : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) H) :
    H 0 = 1 / 2 ∧ H 1 ^ 2 = 3 / 4 := by
  have hAHsq := congrArg (fun r : ℝ => r ^ 2) hAH
  have hBHsq := congrArg (fun r : ℝ => r ^ 2) hBH
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) H ^ 2 at hAHsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) H ^ 2 at hBHsq
  rw [dist_sq_coord, dist_sq_coord] at hAHsq hBHsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at hAHsq hBHsq
  constructor <;> nlinarith

/-- Coordinate-free hinge normalization.  No orientation is chosen: the
vertical coordinate is recorded only through its square. -/
theorem normSim_equilateralHinge_coordinates
    {A B H : ℝ²}
    (hAB : A ≠ B)
    (hAH : dist A B = dist A H)
    (hBH : dist B A = dist B H) :
    (normSim A B H) 0 = 1 / 2 ∧ (normSim A B H) 1 ^ 2 = 3 / 4 := by
  let T : ℝ² → ℝ² := normSim A B
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist A B)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image A B hAB X Y
  have hT0 : T A = pt 0 0 := by
    simpa [T] using normSim_fst A B
  have hT1 : T B = pt 1 0 := by
    simpa [T] using normSim_snd A B hAB
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (T X) (T Y) = dist (T Z) (T R) := by
    rw [hdist, hdist, h]
  have hcoords := normalized_equilateralHinge_coordinates
    (by simpa only [hT0, hT1] using map_dist_eq hAH)
    (by simpa only [hT0, hT1] using map_dist_eq hBH)
  simpa only [T] using hcoords

set_option maxHeartbeats 2000000 in
-- Coordinate squaring followed by Gröbner elimination exceeds the default budget.
/-- The normalized tail of the five-point hinge cycle is incompatible with an
equilateral hinge. -/
private theorem normalized_fivePointHingeCycle_incompatible
    {C D H : ℝ²}
    (hHx : H 0 = 1 / 2)
    (hHy : H 1 ^ 2 = 3 / 4)
    (hAD : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) D)
    (hBC : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) C)
    (hCA_CD : dist C (pt 0 0) = dist C D)
    (hDB_DH : dist D (pt 1 0) = dist D H)
    (hHC_HD : dist H C = dist H D) : False := by
  have hADsq := congrArg (fun r : ℝ => r ^ 2) hAD
  have hBCsq := congrArg (fun r : ℝ => r ^ 2) hBC
  have hCA_CDsq := congrArg (fun r : ℝ => r ^ 2) hCA_CD
  have hDB_DHsq := congrArg (fun r : ℝ => r ^ 2) hDB_DH
  have hHC_HDsq := congrArg (fun r : ℝ => r ^ 2) hHC_HD
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) D ^ 2 at hADsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) C ^ 2 at hBCsq
  change dist C (pt 0 0) ^ 2 = dist C D ^ 2 at hCA_CDsq
  change dist D (pt 1 0) ^ 2 = dist D H ^ 2 at hDB_DHsq
  change dist H C ^ 2 = dist H D ^ 2 at hHC_HDsq
  rw [dist_sq_coord, dist_sq_coord] at hADsq hBCsq hCA_CDsq hDB_DHsq hHC_HDsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hADsq hBCsq hCA_CDsq hDB_DHsq hHC_HDsq
  rw [hHx] at hDB_DHsq hHC_HDsq
  have hHy' : 4 * H 1 ^ 2 - 3 = 0 := by nlinarith [hHy]
  clear hAD hBC hCA_CD hDB_DH hHC_HD hHx hHy
  ring_nf at hADsq hBCsq hCA_CDsq hDB_DHsq hHC_HDsq hHy'
  grobner (ringSteps := 100000)

/-- **Five-point hinge-cycle collision.**

The seven displayed equalities force the two anchor points to coincide:

```text
AB = AD = AH
BA = BC = BH
CA = CD
DB = DH
HC = HD
```
-/
theorem five_point_hinge_cycle_collision
    {A B C D H : ℝ²}
    (hAB_AD : dist A B = dist A D)
    (hAB_AH : dist A B = dist A H)
    (hBA_BC : dist B A = dist B C)
    (hBA_BH : dist B A = dist B H)
    (hCA_CD : dist C A = dist C D)
    (hDB_DH : dist D B = dist D H)
    (hHC_HD : dist H C = dist H D) : A = B := by
  by_contra hAB
  let T : ℝ² → ℝ² := normSim A B
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist A B)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image A B hAB X Y
  have hT0 : T A = pt 0 0 := by
    simpa [T] using normSim_fst A B
  have hT1 : T B = pt 1 0 := by
    simpa [T] using normSim_snd A B hAB
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (T X) (T Y) = dist (T Z) (T R) := by
    rw [hdist, hdist, h]
  have hHcoords := normSim_equilateralHinge_coordinates hAB hAB_AH hBA_BH
  apply normalized_fivePointHingeCycle_incompatible
      (C := T C) (D := T D) (H := T H)
      hHcoords.1 hHcoords.2
  · simpa only [hT0, hT1] using map_dist_eq hAB_AD
  · simpa only [hT0, hT1] using map_dist_eq hBA_BC
  · simpa only [hT0, hT1] using map_dist_eq hCA_CD
  · simpa only [hT0, hT1] using map_dist_eq hDB_DH
  · simpa only [hT0, hT1] using map_dist_eq hHC_HD

set_option maxHeartbeats 4000000 in
-- The nine-equation hinge-tail elimination exceeds the default budget.
/-- The normalized six-point hinge-tail network is incompatible with an
equilateral hinge. -/
private theorem normalized_sixPointHingeTail_incompatible
    {C D H T : ℝ²}
    (hHx : H 0 = 1 / 2)
    (hHy : H 1 ^ 2 = 3 / 4)
    (hAD : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) D)
    (hBC : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) C)
    (hCA_CD : dist C (pt 0 0) = dist C D)
    (hCA_CT : dist C (pt 0 0) = dist C T)
    (hDB_DH : dist D (pt 1 0) = dist D H)
    (hDB_DT : dist D (pt 1 0) = dist D T)
    (hHC_HT : dist H C = dist H T) : False := by
  have hADsq := congrArg (fun r : ℝ => r ^ 2) hAD
  have hBCsq := congrArg (fun r : ℝ => r ^ 2) hBC
  have hCA_CDsq := congrArg (fun r : ℝ => r ^ 2) hCA_CD
  have hCA_CTsq := congrArg (fun r : ℝ => r ^ 2) hCA_CT
  have hDB_DHsq := congrArg (fun r : ℝ => r ^ 2) hDB_DH
  have hDB_DTsq := congrArg (fun r : ℝ => r ^ 2) hDB_DT
  have hHC_HTsq := congrArg (fun r : ℝ => r ^ 2) hHC_HT
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) D ^ 2 at hADsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) C ^ 2 at hBCsq
  change dist C (pt 0 0) ^ 2 = dist C D ^ 2 at hCA_CDsq
  change dist C (pt 0 0) ^ 2 = dist C T ^ 2 at hCA_CTsq
  change dist D (pt 1 0) ^ 2 = dist D H ^ 2 at hDB_DHsq
  change dist D (pt 1 0) ^ 2 = dist D T ^ 2 at hDB_DTsq
  change dist H C ^ 2 = dist H T ^ 2 at hHC_HTsq
  rw [dist_sq_coord, dist_sq_coord]
    at hADsq hBCsq hCA_CDsq hCA_CTsq hDB_DHsq hDB_DTsq hHC_HTsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hADsq hBCsq hCA_CDsq hCA_CTsq hDB_DHsq hDB_DTsq hHC_HTsq
  rw [hHx] at hDB_DHsq hHC_HTsq
  have hHy' : 4 * H 1 ^ 2 - 3 = 0 := by nlinarith [hHy]
  clear hAD hBC hCA_CD hCA_CT hDB_DH hDB_DT hHC_HT hHx hHy
  ring_nf at hADsq hBCsq hCA_CDsq hCA_CTsq hDB_DHsq hDB_DTsq hHC_HTsq hHy'
  grobner (ringSteps := 100000)

/-- **Six-point hinge-tail collision.**

```text
AB = AD = AH
BA = BC = BH
CA = CD = CT
DB = DH = DT
HC = HT
```
-/
theorem six_point_hinge_tail_collision
    {A B C D H T : ℝ²}
    (hAB_AD : dist A B = dist A D)
    (hAB_AH : dist A B = dist A H)
    (hBA_BC : dist B A = dist B C)
    (hBA_BH : dist B A = dist B H)
    (hCA_CD : dist C A = dist C D)
    (hCA_CT : dist C A = dist C T)
    (hDB_DH : dist D B = dist D H)
    (hDB_DT : dist D B = dist D T)
    (hHC_HT : dist H C = dist H T) : A = B := by
  by_contra hAB
  let F : ℝ² → ℝ² := normSim A B
  have hdist (X Y : ℝ²) :
      dist (F X) (F Y) = (dist A B)⁻¹ * dist X Y := by
    simpa [F] using normSim_dist_image A B hAB X Y
  have hF0 : F A = pt 0 0 := by simpa [F] using normSim_fst A B
  have hF1 : F B = pt 1 0 := by simpa [F] using normSim_snd A B hAB
  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :
      dist (F X) (F Y) = dist (F Z) (F R) := by
    rw [hdist, hdist, h]
  have hHcoords := normSim_equilateralHinge_coordinates hAB hAB_AH hBA_BH
  apply normalized_sixPointHingeTail_incompatible
      (C := F C) (D := F D) (H := F H) (T := F T)
      hHcoords.1 hHcoords.2
  · simpa only [hF0, hF1] using map_dist_eq hAB_AD
  · simpa only [hF0, hF1] using map_dist_eq hBA_BC
  · simpa only [hF0, hF1] using map_dist_eq hCA_CD
  · simpa only [hF0, hF1] using map_dist_eq hCA_CT
  · simpa only [hF0, hF1] using map_dist_eq hDB_DH
  · simpa only [hF0, hF1] using map_dist_eq hDB_DT
  · simpa only [hF0, hF1] using map_dist_eq hHC_HT

set_option maxHeartbeats 4000000 in
-- The nine-equation double-spoke elimination exceeds the default budget.
/-- The normalized double-spoke tail is incompatible with an equilateral
hinge. -/
private theorem normalized_sixPointHingeDoubleSpoke_incompatible
    {C L H R : ℝ²}
    (hHx : H 0 = 1 / 2)
    (hHy : H 1 ^ 2 = 3 / 4)
    (hAL : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) L)
    (hBC : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) C)
    (hBR : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) R)
    (hLB_LC : dist L (pt 1 0) = dist L C)
    (hHC_HR : dist H C = dist H R)
    (hRA_RC : dist R (pt 0 0) = dist R C)
    (hRA_RL : dist R (pt 0 0) = dist R L) : False := by
  have hALsq := congrArg (fun r : ℝ => r ^ 2) hAL
  have hBCsq := congrArg (fun r : ℝ => r ^ 2) hBC
  have hBRsq := congrArg (fun r : ℝ => r ^ 2) hBR
  have hLB_LCsq := congrArg (fun r : ℝ => r ^ 2) hLB_LC
  have hHC_HRsq := congrArg (fun r : ℝ => r ^ 2) hHC_HR
  have hRA_RCsq := congrArg (fun r : ℝ => r ^ 2) hRA_RC
  have hRA_RLsq := congrArg (fun r : ℝ => r ^ 2) hRA_RL
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) L ^ 2 at hALsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) C ^ 2 at hBCsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) R ^ 2 at hBRsq
  change dist L (pt 1 0) ^ 2 = dist L C ^ 2 at hLB_LCsq
  change dist H C ^ 2 = dist H R ^ 2 at hHC_HRsq
  change dist R (pt 0 0) ^ 2 = dist R C ^ 2 at hRA_RCsq
  change dist R (pt 0 0) ^ 2 = dist R L ^ 2 at hRA_RLsq
  rw [dist_sq_coord, dist_sq_coord]
    at hALsq hBCsq hBRsq hLB_LCsq hHC_HRsq hRA_RCsq hRA_RLsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hALsq hBCsq hBRsq hLB_LCsq hHC_HRsq hRA_RCsq hRA_RLsq
  rw [hHx] at hHC_HRsq
  have hHy' : 4 * H 1 ^ 2 - 3 = 0 := by nlinarith [hHy]
  clear hAL hBC hBR hLB_LC hHC_HR hRA_RC hRA_RL hHx hHy
  ring_nf at hALsq hBCsq hBRsq hLB_LCsq hHC_HRsq hRA_RCsq hRA_RLsq hHy'
  grobner (ringSteps := 100000)

/-- **Six-point hinge double-spoke collision.**

```text
AB = AL = AH
BA = BC = BH = BR
LB = LC
HC = HR
RA = RC = RL
```
-/
theorem six_point_hinge_double_spoke_collision
    {A B C L H R : ℝ²}
    (hAB_AL : dist A B = dist A L)
    (hAB_AH : dist A B = dist A H)
    (hBA_BC : dist B A = dist B C)
    (hBA_BH : dist B A = dist B H)
    (hBA_BR : dist B A = dist B R)
    (hLB_LC : dist L B = dist L C)
    (hHC_HR : dist H C = dist H R)
    (hRA_RC : dist R A = dist R C)
    (hRA_RL : dist R A = dist R L) : A = B := by
  by_contra hAB
  let F : ℝ² → ℝ² := normSim A B
  have hdist (X Y : ℝ²) :
      dist (F X) (F Y) = (dist A B)⁻¹ * dist X Y := by
    simpa [F] using normSim_dist_image A B hAB X Y
  have hF0 : F A = pt 0 0 := by simpa [F] using normSim_fst A B
  have hF1 : F B = pt 1 0 := by simpa [F] using normSim_snd A B hAB
  have map_dist_eq {X Y Z S : ℝ²} (h : dist X Y = dist Z S) :
      dist (F X) (F Y) = dist (F Z) (F S) := by
    rw [hdist, hdist, h]
  have hHcoords := normSim_equilateralHinge_coordinates hAB hAB_AH hBA_BH
  apply normalized_sixPointHingeDoubleSpoke_incompatible
      (C := F C) (L := F L) (H := F H) (R := F R)
      hHcoords.1 hHcoords.2
  · simpa only [hF0, hF1] using map_dist_eq hAB_AL
  · simpa only [hF0, hF1] using map_dist_eq hBA_BC
  · simpa only [hF0, hF1] using map_dist_eq hBA_BR
  · simpa only [hF0, hF1] using map_dist_eq hLB_LC
  · simpa only [hF0, hF1] using map_dist_eq hHC_HR
  · simpa only [hF0, hF1] using map_dist_eq hRA_RC
  · simpa only [hF0, hF1] using map_dist_eq hRA_RL

set_option maxHeartbeats 12000000 in
-- The eleven-equation closed-tail elimination exceeds the default budget.
/-- The normalized closed-tail network is incompatible with an equilateral
hinge. -/
private theorem normalized_sevenPointHingeClosedTail_incompatible
    {L M H R T : ℝ²}
    (hHx : H 0 = 1 / 2)
    (hHy : H 1 ^ 2 = 3 / 4)
    (hAL : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) L)
    (hAM : dist (pt 0 0) (pt 1 0) = dist (pt 0 0) M)
    (hBR : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) R)
    (hLB_LH : dist L (pt 1 0) = dist L H)
    (hLB_LT : dist L (pt 1 0) = dist L T)
    (hHM_HR : dist H M = dist H R)
    (hHM_HT : dist H M = dist H T)
    (hTA_TM : dist T (pt 0 0) = dist T M)
    (hTA_TR : dist T (pt 0 0) = dist T R) : False := by
  have hALsq := congrArg (fun r : ℝ => r ^ 2) hAL
  have hAMsq := congrArg (fun r : ℝ => r ^ 2) hAM
  have hBRsq := congrArg (fun r : ℝ => r ^ 2) hBR
  have hLB_LHsq := congrArg (fun r : ℝ => r ^ 2) hLB_LH
  have hLB_LTsq := congrArg (fun r : ℝ => r ^ 2) hLB_LT
  have hHM_HRsq := congrArg (fun r : ℝ => r ^ 2) hHM_HR
  have hHM_HTsq := congrArg (fun r : ℝ => r ^ 2) hHM_HT
  have hTA_TMsq := congrArg (fun r : ℝ => r ^ 2) hTA_TM
  have hTA_TRsq := congrArg (fun r : ℝ => r ^ 2) hTA_TR
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) L ^ 2 at hALsq
  change dist (pt 0 0) (pt 1 0) ^ 2 = dist (pt 0 0) M ^ 2 at hAMsq
  change dist (pt 1 0) (pt 0 0) ^ 2 = dist (pt 1 0) R ^ 2 at hBRsq
  change dist L (pt 1 0) ^ 2 = dist L H ^ 2 at hLB_LHsq
  change dist L (pt 1 0) ^ 2 = dist L T ^ 2 at hLB_LTsq
  change dist H M ^ 2 = dist H R ^ 2 at hHM_HRsq
  change dist H M ^ 2 = dist H T ^ 2 at hHM_HTsq
  change dist T (pt 0 0) ^ 2 = dist T M ^ 2 at hTA_TMsq
  change dist T (pt 0 0) ^ 2 = dist T R ^ 2 at hTA_TRsq
  rw [dist_sq_coord, dist_sq_coord]
    at hALsq hAMsq hBRsq hLB_LHsq hLB_LTsq hHM_HRsq hHM_HTsq hTA_TMsq hTA_TRsq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one]
    at hALsq hAMsq hBRsq hLB_LHsq hLB_LTsq hHM_HRsq hHM_HTsq hTA_TMsq hTA_TRsq
  rw [hHx] at hLB_LHsq hHM_HRsq hHM_HTsq
  have hHy' : 4 * H 1 ^ 2 - 3 = 0 := by nlinarith [hHy]
  clear hAL hAM hBR hLB_LH hLB_LT hHM_HR hHM_HT hTA_TM hTA_TR hHx hHy
  ring_nf at hALsq hAMsq hBRsq hLB_LHsq hLB_LTsq hHM_HRsq hHM_HTsq hTA_TMsq hTA_TRsq hHy'
  grobner (ringSteps := 100000)

/-- **Seven-point hinge closed-tail collision.**

```text
AB = AL = AM = AH
BA = BH = BR
LB = LH = LT
HM = HR = HT
TA = TM = TR
```
-/
theorem seven_point_hinge_closed_tail_collision
    {A B L M H R T : ℝ²}
    (hAB_AL : dist A B = dist A L)
    (hAB_AM : dist A B = dist A M)
    (hAB_AH : dist A B = dist A H)
    (hBA_BH : dist B A = dist B H)
    (hBA_BR : dist B A = dist B R)
    (hLB_LH : dist L B = dist L H)
    (hLB_LT : dist L B = dist L T)
    (hHM_HR : dist H M = dist H R)
    (hHM_HT : dist H M = dist H T)
    (hTA_TM : dist T A = dist T M)
    (hTA_TR : dist T A = dist T R) : A = B := by
  by_contra hAB
  let F : ℝ² → ℝ² := normSim A B
  have hdist (X Y : ℝ²) :
      dist (F X) (F Y) = (dist A B)⁻¹ * dist X Y := by
    simpa [F] using normSim_dist_image A B hAB X Y
  have hF0 : F A = pt 0 0 := by simpa [F] using normSim_fst A B
  have hF1 : F B = pt 1 0 := by simpa [F] using normSim_snd A B hAB
  have map_dist_eq {X Y Z S : ℝ²} (h : dist X Y = dist Z S) :
      dist (F X) (F Y) = dist (F Z) (F S) := by
    rw [hdist, hdist, h]
  have hHcoords := normSim_equilateralHinge_coordinates hAB hAB_AH hBA_BH
  apply normalized_sevenPointHingeClosedTail_incompatible
      (L := F L) (M := F M) (H := F H) (R := F R) (T := F T)
      hHcoords.1 hHcoords.2
  · simpa only [hF0, hF1] using map_dist_eq hAB_AL
  · simpa only [hF0, hF1] using map_dist_eq hAB_AM
  · simpa only [hF0, hF1] using map_dist_eq hBA_BR
  · simpa only [hF0, hF1] using map_dist_eq hLB_LH
  · simpa only [hF0, hF1] using map_dist_eq hLB_LT
  · simpa only [hF0, hF1] using map_dist_eq hHM_HR
  · simpa only [hF0, hF1] using map_dist_eq hHM_HT
  · simpa only [hF0, hF1] using map_dist_eq hTA_TM
  · simpa only [hF0, hF1] using map_dist_eq hTA_TR

/-- A seven-equality hinge-cycle closure with distinct anchors. -/
structure FivePointHingeCycleCore {α : Type*} (P : RowPattern α) where
  A : α
  B : α
  C : α
  D : α
  H : α
  hAB : A ≠ B
  AB_AD : EdgeClosure P (A, B) (A, D)
  AB_AH : EdgeClosure P (A, B) (A, H)
  BA_BC : EdgeClosure P (B, A) (B, C)
  BA_BH : EdgeClosure P (B, A) (B, H)
  CA_CD : EdgeClosure P (C, A) (C, D)
  DB_DH : EdgeClosure P (D, B) (D, H)
  HC_HD : EdgeClosure P (H, C) (H, D)

/-- A five-point hinge-cycle core contradicts injective planar realization. -/
theorem false_of_fivePointHingeCycleCore
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : FivePointHingeCycleCore P) : False := by
  have sound {e f : Edge α} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f := EdgeClosure.sound hreal h
  have collision : pointOf core.A = pointOf core.B :=
    five_point_hinge_cycle_collision
      (by simpa [edgeDist] using sound core.AB_AD)
      (by simpa [edgeDist] using sound core.AB_AH)
      (by simpa [edgeDist] using sound core.BA_BC)
      (by simpa [edgeDist] using sound core.BA_BH)
      (by simpa [edgeDist] using sound core.CA_CD)
      (by simpa [edgeDist] using sound core.DB_DH)
      (by simpa [edgeDist] using sound core.HC_HD)
  exact core.hAB (hreal.injective collision)

/-- A nine-equality hinge-tail closure with distinct anchors. -/
structure SixPointHingeTailCore {α : Type*} (P : RowPattern α) where
  A : α
  B : α
  C : α
  D : α
  H : α
  T : α
  hAB : A ≠ B
  AB_AD : EdgeClosure P (A, B) (A, D)
  AB_AH : EdgeClosure P (A, B) (A, H)
  BA_BC : EdgeClosure P (B, A) (B, C)
  BA_BH : EdgeClosure P (B, A) (B, H)
  CA_CD : EdgeClosure P (C, A) (C, D)
  CA_CT : EdgeClosure P (C, A) (C, T)
  DB_DH : EdgeClosure P (D, B) (D, H)
  DB_DT : EdgeClosure P (D, B) (D, T)
  HC_HT : EdgeClosure P (H, C) (H, T)

/-- A six-point hinge-tail core contradicts injective planar realization. -/
theorem false_of_sixPointHingeTailCore
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : SixPointHingeTailCore P) : False := by
  have sound {e f : Edge α} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f := EdgeClosure.sound hreal h
  have collision : pointOf core.A = pointOf core.B :=
    six_point_hinge_tail_collision
      (by simpa [edgeDist] using sound core.AB_AD)
      (by simpa [edgeDist] using sound core.AB_AH)
      (by simpa [edgeDist] using sound core.BA_BC)
      (by simpa [edgeDist] using sound core.BA_BH)
      (by simpa [edgeDist] using sound core.CA_CD)
      (by simpa [edgeDist] using sound core.CA_CT)
      (by simpa [edgeDist] using sound core.DB_DH)
      (by simpa [edgeDist] using sound core.DB_DT)
      (by simpa [edgeDist] using sound core.HC_HT)
  exact core.hAB (hreal.injective collision)

/-- A nine-equality double-spoke hinge closure with distinct anchors. -/
structure SixPointHingeDoubleSpokeCore {α : Type*} (P : RowPattern α) where
  A : α
  B : α
  C : α
  L : α
  H : α
  R : α
  hAB : A ≠ B
  AB_AL : EdgeClosure P (A, B) (A, L)
  AB_AH : EdgeClosure P (A, B) (A, H)
  BA_BC : EdgeClosure P (B, A) (B, C)
  BA_BH : EdgeClosure P (B, A) (B, H)
  BA_BR : EdgeClosure P (B, A) (B, R)
  LB_LC : EdgeClosure P (L, B) (L, C)
  HC_HR : EdgeClosure P (H, C) (H, R)
  RA_RC : EdgeClosure P (R, A) (R, C)
  RA_RL : EdgeClosure P (R, A) (R, L)

/-- A double-spoke hinge core contradicts injective planar realization. -/
theorem false_of_sixPointHingeDoubleSpokeCore
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf)
    (core : SixPointHingeDoubleSpokeCore P) : False := by
  have sound {e f : Edge α} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f := EdgeClosure.sound hreal h
  have collision : pointOf core.A = pointOf core.B :=
    six_point_hinge_double_spoke_collision
      (by simpa [edgeDist] using sound core.AB_AL)
      (by simpa [edgeDist] using sound core.AB_AH)
      (by simpa [edgeDist] using sound core.BA_BC)
      (by simpa [edgeDist] using sound core.BA_BH)
      (by simpa [edgeDist] using sound core.BA_BR)
      (by simpa [edgeDist] using sound core.LB_LC)
      (by simpa [edgeDist] using sound core.HC_HR)
      (by simpa [edgeDist] using sound core.RA_RC)
      (by simpa [edgeDist] using sound core.RA_RL)
  exact core.hAB (hreal.injective collision)

/-- An eleven-equality closed-tail hinge closure with distinct anchors. -/
structure SevenPointHingeClosedTailCore {α : Type*} (P : RowPattern α) where
  A : α
  B : α
  L : α
  M : α
  H : α
  R : α
  T : α
  hAB : A ≠ B
  AB_AL : EdgeClosure P (A, B) (A, L)
  AB_AM : EdgeClosure P (A, B) (A, M)
  AB_AH : EdgeClosure P (A, B) (A, H)
  BA_BH : EdgeClosure P (B, A) (B, H)
  BA_BR : EdgeClosure P (B, A) (B, R)
  LB_LH : EdgeClosure P (L, B) (L, H)
  LB_LT : EdgeClosure P (L, B) (L, T)
  HM_HR : EdgeClosure P (H, M) (H, R)
  HM_HT : EdgeClosure P (H, M) (H, T)
  TA_TM : EdgeClosure P (T, A) (T, M)
  TA_TR : EdgeClosure P (T, A) (T, R)

/-- A closed-tail hinge core contradicts injective planar realization. -/
theorem false_of_sevenPointHingeClosedTailCore
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf)
    (core : SevenPointHingeClosedTailCore P) : False := by
  have sound {e f : Edge α} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f := EdgeClosure.sound hreal h
  have collision : pointOf core.A = pointOf core.B :=
    seven_point_hinge_closed_tail_collision
      (by simpa [edgeDist] using sound core.AB_AL)
      (by simpa [edgeDist] using sound core.AB_AM)
      (by simpa [edgeDist] using sound core.AB_AH)
      (by simpa [edgeDist] using sound core.BA_BH)
      (by simpa [edgeDist] using sound core.BA_BR)
      (by simpa [edgeDist] using sound core.LB_LH)
      (by simpa [edgeDist] using sound core.LB_LT)
      (by simpa [edgeDist] using sound core.HM_HR)
      (by simpa [edgeDist] using sound core.HM_HT)
      (by simpa [edgeDist] using sound core.TA_TM)
      (by simpa [edgeDist] using sound core.TA_TR)
  exact core.hAB (hreal.injective collision)

end EqualityCore
end Census554
end Problem97
