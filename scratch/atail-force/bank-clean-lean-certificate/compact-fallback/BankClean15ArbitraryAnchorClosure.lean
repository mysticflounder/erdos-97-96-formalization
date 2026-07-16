import BankClean15DistanceClosure

/-!
# Arbitrary-anchor wrapper for the bank-clean fifteen-row contradiction

The normalized distance consumer uses anchors `(0,0)` and `(1,0)`.  This
wrapper transports an arbitrary noncoincident anchor pair through `normSim`.
-/

open scoped EuclideanGeometry

namespace Problem97.ATailBankClean15ArbitraryAnchorClosureScratch

theorem bank_clean_15_anchor_collision
    {O A E F G K X Y Z : ℝ²}
    (hA_O_G : dist A O = dist A G)
    (hA_O_K : dist A O = dist A K)
    (hF_A_Z : dist F A = dist F Z)
    (hF_A_K : dist F A = dist F K)
    (hG_X_E : dist G X = dist G E)
    (hG_X_K : dist G X = dist G K)
    (hK_O_Y : dist K O = dist K Y)
    (hK_O_G : dist K O = dist K G)
    (hO_A_E : dist O A = dist O E)
    (hX_Z_G : dist X Z = dist X G)
    (hX_Z_F : dist X Z = dist X F)
    (hY_O_X : dist Y O = dist Y X)
    (hY_O_Z : dist Y O = dist Y Z)
    (hZ_A_Y : dist Z A = dist Z Y)
    (hZ_A_G : dist Z A = dist Z G) :
    O = A := by
  by_contra hOA
  let T : ℝ² → ℝ² := normSim O A
  let e := T E
  let f := T F
  let g := T G
  let k := T K
  let x := T X
  let y := T Y
  let z := T Z
  have hdist (P Q : ℝ²) :
      dist (T P) (T Q) = (dist O A)⁻¹ * dist P Q := by
    simpa [T] using normSim_dist_image O A hOA P Q
  have hT0 : T O = pt 0 0 := by
    simpa [T] using normSim_fst O A
  have hT1 : T A = pt 1 0 := by
    simpa [T] using normSim_snd O A hOA
  have map_dist_eq {P Q R S : ℝ²}
      (h : dist P Q = dist R S) :
      dist (T P) (T Q) = dist (T R) (T S) := by
    rw [hdist, hdist, h]
  apply
    Problem97.ATailBankClean15DistanceClosureScratch.bank_clean_15_distance_rows_incompatible
      (E := e) (F := f) (G := g) (K := k) (X := x) (Y := y) (Z := z)
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hA_O_G
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hA_O_K
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hF_A_Z
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hF_A_K
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hG_X_E
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hG_X_K
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hK_O_Y
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hK_O_G
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hO_A_E
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hX_Z_G
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hX_Z_F
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hY_O_X
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hY_O_Z
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hZ_A_Y
  · simpa [e, f, g, k, x, y, z, hT0, hT1] using map_dist_eq hZ_A_G

theorem false_of_bank_clean_15_rows
    {O A E F G K X Y Z : ℝ²}
    (hOA : O ≠ A)
    (hA_O_G : dist A O = dist A G)
    (hA_O_K : dist A O = dist A K)
    (hF_A_Z : dist F A = dist F Z)
    (hF_A_K : dist F A = dist F K)
    (hG_X_E : dist G X = dist G E)
    (hG_X_K : dist G X = dist G K)
    (hK_O_Y : dist K O = dist K Y)
    (hK_O_G : dist K O = dist K G)
    (hO_A_E : dist O A = dist O E)
    (hX_Z_G : dist X Z = dist X G)
    (hX_Z_F : dist X Z = dist X F)
    (hY_O_X : dist Y O = dist Y X)
    (hY_O_Z : dist Y O = dist Y Z)
    (hZ_A_Y : dist Z A = dist Z Y)
    (hZ_A_G : dist Z A = dist Z G) :
    False := by
  exact hOA (bank_clean_15_anchor_collision hA_O_G hA_O_K hF_A_Z hF_A_K
    hG_X_E hG_X_K hK_O_Y hK_O_G hO_A_E hX_Z_G hX_Z_F hY_O_X hY_O_Z
    hZ_A_Y hZ_A_G)

#print axioms bank_clean_15_anchor_collision
#print axioms false_of_bank_clean_15_rows

end Problem97.ATailBankClean15ArbitraryAnchorClosureScratch
