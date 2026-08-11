import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing
import Erdos9796Proof.P97.N9Endpoint.N4a
import Erdos9796Proof.P97.SurplusM44Packet.ExactFourAdjacentDistribution

set_option linter.style.moduleDocstring false

/-!
# Exact-four adjacent grids: the shared-boundary Kalmanson adapter

An `ExactFourTwoRadiusAdjacentCapGrid` supplies four closed-cap hits: one at
each of two radii in each cap adjacent to the indexed cap.  This file extracts
those hits and, at the first non-surplus cap, uses one zero-cut global boundary
and its direct-or-mirror cap blocks to place them in radial cyclic order.  The
mirror branch is cyclically recut at the second non-surplus apex, so both
adjacent caps are handled on the same convex polygon.

The resulting order and its strict cross-distance inequality are
cardinality-independent and source-clean.
-/

open scoped EuclideanGeometry
open scoped InnerProductSpace

namespace Problem97
namespace ExactFourAdjacentGridKalmanson

open Census554.GeneralCarrierBridge

/-- Four named hits extracted from the exact two-radius adjacent-cap grid. -/
structure FourHits {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {radius ρ : ℝ} (G : S.ExactFourTwoRadiusAdjacentCapGrid i radius ρ) where
  radiusLeft : ℝ²
  rhoLeft : ℝ²
  radiusRight : ℝ²
  rhoRight : ℝ²
  radiusLeft_mem :
    radiusLeft ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.leftAdjacentCapByIndex i
  rhoLeft_mem :
    rhoLeft ∈ SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
      S.leftAdjacentCapByIndex i
  radiusRight_mem :
    radiusRight ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.rightAdjacentCapByIndex i
  rhoRight_mem :
    rhoRight ∈ SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
      S.rightAdjacentCapByIndex i

/-- The four singleton cells of the grid have named representatives. -/
theorem FourHits.exists {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    {radius ρ : ℝ} (G : S.ExactFourTwoRadiusAdjacentCapGrid i radius ρ) :
    Nonempty (FourHits G) := by
  have hradiusLeft :
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i).Nonempty :=
    Finset.card_pos.mp (by rw [G.radius_left_card_eq_one]; omega)
  have hrhoLeft :
      (SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
        S.leftAdjacentCapByIndex i).Nonempty :=
    Finset.card_pos.mp (by rw [G.rho_left_card_eq_one]; omega)
  have hradiusRight :
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i).Nonempty :=
    Finset.card_pos.mp (by rw [G.radius_right_card_eq_one]; omega)
  have hrhoRight :
      (SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
        S.rightAdjacentCapByIndex i).Nonempty :=
    Finset.card_pos.mp (by rw [G.rho_right_card_eq_one]; omega)
  rcases hradiusLeft with ⟨radiusLeft, hradiusLeft⟩
  rcases hrhoLeft with ⟨rhoLeft, hrhoLeft⟩
  rcases hradiusRight with ⟨radiusRight, hradiusRight⟩
  rcases hrhoRight with ⟨rhoRight, hrhoRight⟩
  exact ⟨⟨radiusLeft, rhoLeft, radiusRight, rhoRight,
    hradiusLeft, hrhoLeft, hradiusRight, hrhoRight⟩⟩

/-! ## Radial order inside one retained ambient cap block -/

/-- Strict radial order from the first endpoint of a retained cap block gives
the same strict order on the corresponding ambient-boundary indices.

This packages precisely the reusable `CGN4g`/`E3-L20a` bookkeeping needed by
the adjacent-grid producer.  It does not construct the retained block: the
caller must supply a `StrictCapBlockData` whose `phi` is the shared global
boundary under consideration. -/
theorem ambientIndex_lt_of_dist_lt_from_first
    {A C : Finset ℝ²} (B : CGN.StrictCapBlockData A C) {x y : ℝ²}
    (hx : x ∈ C) (hy : y ∈ C)
    (hxy :
      dist (B.L.points (CGN.firstIndex B.Packet.hm)) x <
        dist (B.L.points (CGN.firstIndex B.Packet.hm)) y) :
    ∃ ix iy : Fin B.m,
      B.L.points ix = x ∧ B.L.points iy = y ∧
        B.Block.idx ix < B.Block.idx iy := by
  rcases B.exists_index_of_mem_cap hx with ⟨ix, hix⟩
  rcases B.exists_index_of_mem_cap hy with ⟨iy, hiy⟩
  have hmono :
      FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
        (B.L.points (CGN.firstIndex B.Packet.hm))
        (FiniteEndpoint.OrderedSideChain.ofOrderedCap B.L) := by
    intro i j hij
    exact FiniteEndpoint.E3L20a_of_cgnCapData B.Packet B.Hside B.Hord hij
  have hlt : ix < iy := by
    rcases lt_trichotomy ix iy with hixy | hixy | hiyx
    · exact hixy
    · subst iy
      have hxyPoint : x = y := hix.symm.trans hiy
      exact ((ne_of_lt hxy) (congrArg (dist (B.L.points
        (CGN.firstIndex B.Packet.hm))) hxyPoint)).elim
    · have hback := hmono hiyx
      have hback' :
          dist (B.L.points (CGN.firstIndex B.Packet.hm)) y <
            dist (B.L.points (CGN.firstIndex B.Packet.hm)) x := by
        simpa only [FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
          hiy, hix] using hback
      exact ((not_lt_of_ge (le_of_lt hback')) hxy).elim
  exact ⟨ix, iy, hix, hiy, B.Block.idx_strict hlt⟩

/-- Strict radial order from the last endpoint of a retained cap block gives
the reverse strict order on its ambient-boundary indices.

`E3-L20b` enumerates the local cap from the last endpoint, hence a point closer
to that endpoint has a larger index in the native (first-to-last) cap order. -/
theorem ambientIndex_lt_of_dist_lt_from_last
    {A C : Finset ℝ²} (B : CGN.StrictCapBlockData A C) {x y : ℝ²}
    (hx : x ∈ C) (hy : y ∈ C)
    (hxy :
      dist (B.L.points (CGN.lastIndex B.Packet.hm)) x <
        dist (B.L.points (CGN.lastIndex B.Packet.hm)) y) :
    ∃ ix iy : Fin B.m,
      B.L.points ix = x ∧ B.L.points iy = y ∧
        B.Block.idx iy < B.Block.idx ix := by
  rcases B.exists_index_of_mem_cap hx with ⟨ix, hix⟩
  rcases B.exists_index_of_mem_cap hy with ⟨iy, hiy⟩
  have hmono :
      FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
        (B.L.points (CGN.lastIndex B.Packet.hm))
        (FiniteEndpoint.OrderedSideChain.ofOrderedCapRev B.L) := by
    intro i j hij
    exact FiniteEndpoint.E3L20b_of_cgnCapData B.Packet B.Hside B.Hord hij
  have hlt : iy < ix := by
    rcases lt_trichotomy ix iy with hixy | hixy | hiyx
    · have hrev : iy.rev < ix.rev := Fin.rev_lt_rev.mpr hixy
      have hback := hmono hrev
      simp only [FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
        Fin.rev_rev] at hback
      rw [hiy, hix] at hback
      exact ((not_lt_of_ge (le_of_lt hback)) hxy).elim
    · subst iy
      have hxyPoint : x = y := hix.symm.trans hiy
      exact ((ne_of_lt hxy) (congrArg (dist (B.L.points
        (CGN.lastIndex B.Packet.hm))) hxyPoint)).elim
    · exact hiyx
  exact ⟨ix, iy, hix, hiy, B.Block.idx_strict hlt⟩

/-- A retained counterclockwise boundary indexing has strict negative signed
area on every increasing triple.  This is the orientation premise consumed by
`CGN4g2`--`CGN4g4`, extracted without choosing a second boundary. -/
theorem signedArea_strict_of_boundaryIndexing
    {A : Finset ℝ²} (B : BoundaryIndexing A) :
    ∀ {i j k : Fin B.n}, i < j → j < k →
      Problem97.signedArea2
        (B.boundary i) (B.boundary j) (B.boundary k) < 0 := by
  intro i j k hij hjk
  have hij_ne : B.boundary i ≠ B.boundary j := by
    intro h
    exact (ne_of_lt hij) (B.boundary_injective h)
  have hkj_ne : B.boundary k ≠ B.boundary j := by
    intro h
    exact (ne_of_gt hjk) (B.boundary_injective h)
  have hswap :
      Problem97.signedArea2 (B.boundary j) (B.boundary i) (B.boundary k) =
        -Problem97.signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) := by
    simp [Problem97.signedArea2]
    ring
  have hsign :
      SignType.sign
          (Problem97.signedArea2 (B.boundary j) (B.boundary i) (B.boundary k)) = 1 := by
    rw [Problem97.signedArea2_sign_eq_oangle_sign
      (B.boundary j) (B.boundary i) (B.boundary k) hij_ne hkj_ne]
    exact B.boundary_ccw.sign_oangle hij hjk
  have hpos :
      0 < Problem97.signedArea2 (B.boundary j) (B.boundary i) (B.boundary k) :=
    (sign_eq_one_iff).mp hsign
  rw [hswap] at hpos
  linarith

/-- Strict negative signed-area order on increasing boundary triples is
preserved by a cyclic re-cut of the enumeration.  `CGN4g` uses this fact
internally; the public form is needed when the mirror zero-cut cap wraps and
must be presented to `BoundaryCapBlock` as an ordinary closed interval. -/
theorem signedArea_strict_of_cyclicShift
    {n : ℕ} {phi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0)
    (cut : Fin n) :
    ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2
        (phi (i + cut)) (phi (j + cut)) (phi (k + cut)) < 0 := by
  have hcyc {a b c : ℝ²} :
      Problem97.signedArea2 a b c = Problem97.signedArea2 c a b := by
    simp [Problem97.signedArea2]
    ring
  let bound : ℕ := n - cut.val
  have hval_nowrap {t : Fin n} (ht : (t : ℕ) < bound) :
      ((t + cut : Fin n) : ℕ) = t.val + cut.val := by
    rw [Fin.val_add_eq_ite]
    have hlt : ¬ n ≤ t.val + cut.val := by omega
    simp [hlt]
  have hval_wrap {t : Fin n} (ht : bound ≤ (t : ℕ)) :
      ((t + cut : Fin n) : ℕ) = t.val - bound := by
    rw [Fin.val_add_eq_ite]
    have hge : n ≤ t.val + cut.val := by omega
    simp [hge]
    omega
  intro i j k hij hjk
  by_cases hk : (k : ℕ) < bound
  · have hi : (i : ℕ) < bound := by omega
    have hj : (j : ℕ) < bound := by omega
    have hij' : i + cut < j + cut := by
      change (((i + cut : Fin n) : ℕ) < ((j + cut : Fin n) : ℕ))
      rw [hval_nowrap hi, hval_nowrap hj]
      omega
    have hjk' : j + cut < k + cut := by
      change (((j + cut : Fin n) : ℕ) < ((k + cut : Fin n) : ℕ))
      rw [hval_nowrap hj, hval_nowrap hk]
      omega
    exact hneg hij' hjk'
  · by_cases hj : (j : ℕ) < bound
    · have hi : (i : ℕ) < bound := by omega
      have hk' : bound ≤ (k : ℕ) := by omega
      have hki : k + cut < i + cut := by
        change (((k + cut : Fin n) : ℕ) < ((i + cut : Fin n) : ℕ))
        rw [hval_wrap hk', hval_nowrap hi]
        omega
      have hij' : i + cut < j + cut := by
        change (((i + cut : Fin n) : ℕ) < ((j + cut : Fin n) : ℕ))
        rw [hval_nowrap hi, hval_nowrap hj]
        omega
      have hneg' :
          Problem97.signedArea2
            (phi (k + cut)) (phi (i + cut)) (phi (j + cut)) < 0 :=
        hneg hki hij'
      simpa [hcyc] using hneg'
    · by_cases hi : (i : ℕ) < bound
      · have hj' : bound ≤ (j : ℕ) := by omega
        have hk' : bound ≤ (k : ℕ) := by omega
        have hjk' : j + cut < k + cut := by
          change (((j + cut : Fin n) : ℕ) < ((k + cut : Fin n) : ℕ))
          rw [hval_wrap hj', hval_wrap hk']
          omega
        have hki : k + cut < i + cut := by
          change (((k + cut : Fin n) : ℕ) < ((i + cut : Fin n) : ℕ))
          rw [hval_wrap hk', hval_nowrap hi]
          omega
        have hneg' :
            Problem97.signedArea2
              (phi (j + cut)) (phi (k + cut)) (phi (i + cut)) < 0 :=
          hneg hjk' hki
        simpa [hcyc] using hneg'
      · have hi' : bound ≤ (i : ℕ) := by omega
        have hj' : bound ≤ (j : ℕ) := by omega
        have hk' : bound ≤ (k : ℕ) := by omega
        have hij' : i + cut < j + cut := by
          change (((i + cut : Fin n) : ℕ) < ((j + cut : Fin n) : ℕ))
          rw [hval_wrap hi', hval_wrap hj']
          omega
        have hjk' : j + cut < k + cut := by
          change (((j + cut : Fin n) : ℕ) < ((k + cut : Fin n) : ℕ))
          rw [hval_wrap hj', hval_wrap hk']
          omega
        exact hneg hij' hjk'

/-- Assemble the full retained `CGN4g` cap-order packet on a *specified*
global boundary interval.  The existing high-level extractor chooses its own
boundary; this fixed-boundary form is what lets two adjacent caps share one
cyclic polygon in the grid argument. -/
theorem strictCapBlockData_of_supportCap_on_boundary
    {A C : Finset ℝ²} {M : MoserTriangle A}
    (hA : ConvexIndep A) (hC_subset : C ⊆ A)
    (P : CircumscribedMECPacket A M)
    (hacute : 0 ≤ ⟪M.v2 - M.v1, M.v3 - M.v1⟫_ℝ)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    {u lo hi : Fin n} (hlohi : lo < hi)
    (hC_interval : ∀ x : ℝ²,
      x ∈ C ↔ ∃ q : Fin n, lo ≤ q ∧ q ≤ hi ∧ phi q = x)
    (hu : phi u = M.v1)
    (hends :
      (phi lo = M.v2 ∧ phi hi = M.v3) ∨
        (phi lo = M.v3 ∧ phi hi = M.v2))
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0)
    (hbase_neg : Problem97.signedArea2 (phi u) (phi lo) (phi hi) < 0) :
    ∃ m, ∃ L : CGN.OrderedCap m,
      ∃ Packet : CGN.MecCapPacket A L,
      ∃ _Hside : CGN.MinorCapSideHypotheses Packet,
      ∃ Block : CGN.BoundaryCapBlock A C phi L,
      ∃ _Hord : CGN.StrictCapOrder A L,
        Block.lo = lo ∧ Block.hi = hi := by
  classical
  have hcap_side :
      ∀ x, x ∈ C → 0 ≤ Problem97.signedArea2 (phi lo) (phi hi) x := by
    intro x hxC
    rcases (hC_interval x).1 hxC with ⟨q, hqlo, hqhi, rfl⟩
    rcases eq_or_lt_of_le hqlo with rfl | hqlo'
    · simp [Problem97.signedArea2]
    rcases eq_or_lt_of_le hqhi with rfl | hqhi'
    · simp [Problem97.signedArea2]
    · have hmid : Problem97.signedArea2 (phi lo) (phi q) (phi hi) < 0 :=
        hneg hqlo' hqhi'
      have hswap :
          Problem97.signedArea2 (phi lo) (phi hi) (phi q) =
            -Problem97.signedArea2 (phi lo) (phi q) (phi hi) := by
        simp [Problem97.signedArea2]
      rw [hswap]
      linarith
  have hcenter_prod :
      0 ≤ Problem97.signedArea2 P.center (phi lo) (phi hi) *
        Problem97.signedArea2 (phi u) (phi lo) (phi hi) := by
    have hacute' : 0 ≤ ⟪phi lo - phi u, phi hi - phi u⟫_ℝ := by
      rcases hends with hforward | hreverse
      · simpa [hu, hforward.1, hforward.2] using hacute
      · simpa [hu, hreverse.1, hreverse.2, real_inner_comm] using hacute
    have h := Problem97.center_same_side_as_apex_of_nonobtuse
      (O := P.center) (a := phi lo) (b := phi hi) (c := phi u)
      (r := P.radius)
      (by
        rcases hends with hforward | hreverse
        · simpa [hforward.1] using P.moser_on_boundary_2
        · simpa [hreverse.1] using P.moser_on_boundary_3)
      (by
        rcases hends with hforward | hreverse
        · simpa [hforward.2] using P.moser_on_boundary_3
        · simpa [hreverse.2] using P.moser_on_boundary_2)
      (by simpa [hu] using P.moser_on_boundary_1)
      hacute'
    simpa [mul_comm] using h
  have hcenter_side :
      Problem97.signedArea2 (phi lo) (phi hi) P.center ≤ 0 := by
    have hcyc :
        Problem97.signedArea2 P.center (phi lo) (phi hi) =
          Problem97.signedArea2 (phi lo) (phi hi) P.center := by
      simp [Problem97.signedArea2]
      ring
    rw [hcyc] at hcenter_prod
    by_contra hpos
    push_neg at hpos
    have hprod_neg :
        Problem97.signedArea2 (phi lo) (phi hi) P.center *
          Problem97.signedArea2 (phi u) (phi lo) (phi hi) < 0 :=
      mul_neg_of_pos_of_neg hpos hbase_neg
    linarith
  have hlo_on : dist (phi lo) P.center = P.radius := by
    rcases hends with hforward | hreverse
    · simpa only [hforward.1, dist_eq_norm] using P.moser_on_boundary_2
    · simpa only [hreverse.1, dist_eq_norm] using P.moser_on_boundary_3
  have hhi_on : dist (phi hi) P.center = P.radius := by
    rcases hends with hforward | hreverse
    · simpa only [hforward.2, dist_eq_norm] using P.moser_on_boundary_3
    · simpa only [hreverse.2, dist_eq_norm] using P.moser_on_boundary_2
  obtain ⟨m, L, Packet, Hside, Block, hloBlock, hhiBlock⟩ :=
    CGN.CGN4g1_capBlock_of_supportCap
      (A := A) (C := C) (phi := phi)
      hphi_inj hphi_image hlohi hC_interval
      P.center P.radius (le_of_lt P.radius_pos)
      (fun x hx => P.disk_contains_A x (hC_subset hx))
      hlo_on hhi_on
      hcap_side hcenter_side
  have hturn := CGN.CGN4g2_consecutiveTurn_nonpos_of_capBlock Block hneg
  have hproj :
      ∀ {r s : Fin m}, r < s →
        0 < inner ℝ (L.points s - L.points r)
          (L.points (CGN.lastIndex Packet.hm) -
            L.points (CGN.firstIndex Packet.hm)) := by
    intro r s hrs
    exact CGN.CGN4g3_chordProjection_strict_of_capBlock
      (A := A) (C := C) (phi := phi) (L := L)
      hA Block hneg Packet Hside hrs
  have hno3 :
      ∀ {x y z : ℝ²}, x ∈ A → y ∈ A → z ∈ A →
        x ≠ y → y ≠ z → x ≠ z → Problem97.signedArea2 x y z ≠ 0 := by
    intro x y z hx hy hz hxy hyz hxz hzero
    have hcol : Collinear ℝ ({x, y, z} : Set ℝ²) :=
      (Problem97.signedArea2_eq_zero_iff_collinear x y z).1 hzero
    exact False.elim
      (ConvexIndep.not_three_collinear hA hx hy hz hxy hxz hyz hcol)
  have hsideiff :
      ∀ {r s : Fin m}, r < s → ∀ {x : ℝ²}, x ∈ A →
        (0 < Problem97.signedArea2 (L.points r) (L.points s) x ↔
          ∃ j : Fin m, r < j ∧ j < s ∧ L.points j = x) := by
    intro r s hrs x hx
    exact CGN.CGN4g4_subchord_open_side_iff_A_of_capBlock
      (A := A) (C := C) (phi := phi) (L := L)
      Block hneg hno3 hrs hx
  let Hord : CGN.StrictCapOrder A L :=
    CGN.CGN4g5_strictCapOrder_of_capBlock Block hturn hproj hsideiff
  exact ⟨m, L, Packet, Hside, Block, Hord, hloBlock, hhiBlock⟩

/-- The exact output contract required from a shared-boundary cap-block
argument.  For the smaller radius, its two hits lie between the larger-radius
hits; the alternative records the reverse linear cut of the same boundary.

The source-clean producer below constructs this packet at `S.oppIndex1` from
one zero-cut boundary and its direct-or-mirror adjacent-cap blocks. -/
structure SharedBoundaryRadialOrder
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {radius ρ : ℝ}
    {G : S.ExactFourTwoRadiusAdjacentCapGrid i radius ρ}
    (H : FourHits G) (B : BoundaryIndexing A) where
  radiusLeftIndex : Fin B.n
  rhoLeftIndex : Fin B.n
  radiusRightIndex : Fin B.n
  rhoRightIndex : Fin B.n
  radiusLeft_eq : B.boundary radiusLeftIndex = H.radiusLeft
  rhoLeft_eq : B.boundary rhoLeftIndex = H.rhoLeft
  radiusRight_eq : B.boundary radiusRightIndex = H.radiusRight
  rhoRight_eq : B.boundary rhoRightIndex = H.rhoRight
  direct_or_mirror :
    (radius < ρ ∧
        ((rhoLeftIndex < radiusLeftIndex ∧
            radiusLeftIndex < radiusRightIndex ∧
            radiusRightIndex < rhoRightIndex) ∨
          (rhoRightIndex < radiusRightIndex ∧
            radiusRightIndex < radiusLeftIndex ∧
            radiusLeftIndex < rhoLeftIndex))) ∨
      (ρ < radius ∧
        ((radiusLeftIndex < rhoLeftIndex ∧
            rhoLeftIndex < rhoRightIndex ∧
            rhoRightIndex < radiusRightIndex) ∨
          (radiusRightIndex < rhoRightIndex ∧
            rhoRightIndex < rhoLeftIndex ∧
            rhoLeftIndex < radiusLeftIndex)))

private theorem cyclicOrder_of_indices {A : Finset ℝ²}
    (B : BoundaryIndexing A) {ia ib ic id : Fin B.n}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) :
    ConvexCyclicOrder A (B.boundary ia) (B.boundary ib)
      (B.boundary ic) (B.boundary id) := by
  exact ⟨B.n, B.boundary, B.boundary_injective, B.boundary_image,
    B.boundary_ccw, ia, ib, ic, id, hiab, hibc, hicd, rfl, rfl, rfl, rfl⟩

/-- Cut-independent output contract for the adjacent-grid producer.  This is
the consumer-facing form: unlike `SharedBoundaryRadialOrder`, it remains
usable when a hit is the zero-cut endpoint and the witnessing linear boundary
must be cyclically re-cut. -/
structure RadialCyclicOrder
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {radius ρ : ℝ}
    {G : S.ExactFourTwoRadiusAdjacentCapGrid i radius ρ}
    (H : FourHits G) : Prop where
  order :
    (radius < ρ ∧
        (ConvexCyclicOrder A H.rhoLeft H.radiusLeft H.radiusRight H.rhoRight ∨
          ConvexCyclicOrder A H.rhoRight H.radiusRight H.radiusLeft H.rhoLeft)) ∨
      (ρ < radius ∧
        (ConvexCyclicOrder A H.radiusLeft H.rhoLeft H.rhoRight H.radiusRight ∨
          ConvexCyclicOrder A H.radiusRight H.rhoRight H.rhoLeft H.radiusLeft))

/-- A shared-boundary radial-order packet gives the corresponding direct or
mirror cyclic order of the four named hits. -/
theorem SharedBoundaryRadialOrder.cyclicOrder
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {radius ρ : ℝ}
    {G : S.ExactFourTwoRadiusAdjacentCapGrid i radius ρ}
    {H : FourHits G} {B : BoundaryIndexing A}
    (O : SharedBoundaryRadialOrder H B) :
    (radius < ρ ∧
        (ConvexCyclicOrder A H.rhoLeft H.radiusLeft H.radiusRight H.rhoRight ∨
          ConvexCyclicOrder A H.rhoRight H.radiusRight H.radiusLeft H.rhoLeft)) ∨
      (ρ < radius ∧
        (ConvexCyclicOrder A H.radiusLeft H.rhoLeft H.rhoRight H.radiusRight ∨
          ConvexCyclicOrder A H.radiusRight H.rhoRight H.rhoLeft H.radiusLeft)) := by
  rcases O.direct_or_mirror with
    ⟨hrlt, hdirect | hmirror⟩ | ⟨hρlt, hdirect | hmirror⟩
  · left
    refine ⟨hrlt, Or.inl ?_⟩
    simpa [O.rhoLeft_eq, O.radiusLeft_eq, O.radiusRight_eq, O.rhoRight_eq] using
      cyclicOrder_of_indices B hdirect.1 hdirect.2.1 hdirect.2.2
  · left
    refine ⟨hrlt, Or.inr ?_⟩
    simpa [O.rhoRight_eq, O.radiusRight_eq, O.radiusLeft_eq, O.rhoLeft_eq] using
      cyclicOrder_of_indices B hmirror.1 hmirror.2.1 hmirror.2.2
  · right
    refine ⟨hρlt, Or.inl ?_⟩
    simpa [O.radiusLeft_eq, O.rhoLeft_eq, O.rhoRight_eq, O.radiusRight_eq] using
      cyclicOrder_of_indices B hdirect.1 hdirect.2.1 hdirect.2.2
  · right
    refine ⟨hρlt, Or.inr ?_⟩
    simpa [O.radiusRight_eq, O.rhoRight_eq, O.rhoLeft_eq, O.radiusLeft_eq] using
      cyclicOrder_of_indices B hmirror.1 hmirror.2.1 hmirror.2.2

/-- Forget the particular linear cut after extracting the cyclic order. -/
theorem SharedBoundaryRadialOrder.radialCyclicOrder
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {radius ρ : ℝ}
    {G : S.ExactFourTwoRadiusAdjacentCapGrid i radius ρ}
    {H : FourHits G} {B : BoundaryIndexing A}
    (O : SharedBoundaryRadialOrder H B) : RadialCyclicOrder H :=
  ⟨O.cyclicOrder⟩

private theorem strictKalmanson_of_cyclicOrder {A : Finset ℝ²}
    (hconv : ConvexIndep A) {a b c d : ℝ²}
    (hcyclic : ConvexCyclicOrder A a b c d) :
    dist b c + dist a d < dist a c + dist b d := by
  rcases hcyclic with
    ⟨n, boundary, hinj, himage, hccw, ia, ib, ic, id,
      hiab, hibc, hicd, ha, hb, hc, hd⟩
  simpa [ha, hb, hc, hd] using
    CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      hconv hinj himage hccw hiab hibc hicd

/-- The cardinality-independent strict Kalmanson consequence of the grid once
the cut-independent radial cyclic order has been supplied. -/
theorem RadialCyclicOrder.strict_cross_distance
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {radius ρ : ℝ}
    {G : S.ExactFourTwoRadiusAdjacentCapGrid i radius ρ}
    {H : FourHits G}
    (hconv : ConvexIndep A) (O : RadialCyclicOrder H) :
    dist H.radiusLeft H.radiusRight + dist H.rhoLeft H.rhoRight <
      dist H.radiusLeft H.rhoRight + dist H.rhoLeft H.radiusRight := by
  rcases O.order with
    ⟨_, hdirect | hmirror⟩ | ⟨_, hdirect | hmirror⟩
  · have h := strictKalmanson_of_cyclicOrder hconv hdirect
    simpa [add_comm] using h
  · have h := strictKalmanson_of_cyclicOrder hconv hmirror
    simpa [dist_comm, add_comm] using h
  · have h := strictKalmanson_of_cyclicOrder hconv hdirect
    simpa [add_comm] using h
  · have h := strictKalmanson_of_cyclicOrder hconv hmirror
    simpa [dist_comm, add_comm] using h

/-! ## Source-clean producer at the first non-surplus cap -/

open Census554.ZeroCutBoundaryIndexing
open Census554.CapSelectedGeometry
open SurplusCapPacket

private theorem rightAdjacentIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    rightAdjacentIndex S.oppIndex1 = S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightAdjacentIndex, SurplusCapPacket.oppIndex1, hi]

private theorem radialCyclicOrder_of_direct
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {radius ρ : ℝ}
    (G : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex1 radius ρ)
    (H : FourHits G)
    (hradius_pos : 0 < radius) (hρ_pos : 0 < ρ) (hne : radius ≠ ρ)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hu : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hv : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1)
    (hw : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2)
    (O : DirectBoundaryBlocks S B.boundary hn iv iw) :
    RadialCyclicOrder H := by
  classical
  let iz : Fin B.n := zeroIndex hn
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 :=
    by
      intro i j k hij hjk
      exact signedArea_strict_of_boundaryIndexing B hij hjk
  have hleftInterval : ∀ x : ℝ²,
      x ∈ S.capByIndex S.oppIndex2 ↔
        ∃ q : Fin B.n, iz ≤ q ∧ q ≤ iv ∧ B.boundary q = x := by
    apply S.capByIndex_interval_of_global_indices S.oppIndex2
      B.boundary_ccw B.boundary_injective B.boundary_image O.apex_order.1
      (Or.inr O.apex_order.2)
    · simpa [iz, hw] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm
    · simpa [iz, hu] using
        S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
    · simpa [hv] using
        S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  have hleftBase :
      signedArea2 (B.boundary iw) (B.boundary iz) (B.boundary iv) < 0 := by
    have h := hneg O.apex_order.1 O.apex_order.2
    have hcycle :
        signedArea2 (B.boundary iw) (B.boundary iz) (B.boundary iv) =
          signedArea2 (B.boundary iz) (B.boundary iv) (B.boundary iw) := by
      simp [signedArea2]
      ring
    rw [hcycle]
    simpa only [iz] using h
  obtain ⟨mL, LL, PL, HL, BlockL, HordL, hloL, hhiL⟩ :=
    strictCapBlockData_of_supportCap_on_boundary
      D.convex (S.capByIndex_subset S.oppIndex2)
      (S.circPacketByIndex S.oppIndex2)
      (S.circPacketByIndex S.oppIndex2).inner_at_v1
      B.boundary_injective B.boundary_image O.apex_order.1 hleftInterval
      (u := iw) (lo := iz) (hi := iv)
      (by simpa [hw] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm)
      (Or.inl ⟨
        by simpa [iz, hu] using
          S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm,
        by simpa [hv] using
          S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm⟩)
      hneg hleftBase
  have hrightCap :
      S.rightAdjacentCapByIndex S.oppIndex1 = S.capByIndex S.surplusIdx := by
    rw [S.rightAdjacentCapByIndex_eq_capByIndex,
      rightAdjacentIndex_oppIndex1 S]
  have hrightInterval : ∀ x : ℝ²,
      x ∈ S.capByIndex S.surplusIdx ↔
        ∃ q : Fin B.n, iv ≤ q ∧ q ≤ iw ∧ B.boundary q = x := by
    apply S.capByIndex_interval_of_global_indices S.surplusIdx
      B.boundary_ccw B.boundary_injective B.boundary_image O.apex_order.2
      (Or.inl O.apex_order.1)
    · simpa [iz, hu] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm
    · simpa [hv] using
        S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
    · simpa [hw] using
        S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hrightBase :
      signedArea2 (B.boundary iz) (B.boundary iv) (B.boundary iw) < 0 :=
    hneg O.apex_order.1 O.apex_order.2
  obtain ⟨mR, LR, PR, HR, BlockR, HordR, hloR, hhiR⟩ :=
    strictCapBlockData_of_supportCap_on_boundary
      D.convex (S.capByIndex_subset S.surplusIdx)
      (S.circPacketByIndex S.surplusIdx)
      (S.circPacketByIndex S.surplusIdx).inner_at_v1
      B.boundary_injective B.boundary_image O.apex_order.2 hrightInterval
      (u := iz) (lo := iv) (hi := iw)
      (by simpa [iz, hu] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm)
      (Or.inl ⟨
        by simpa [hv] using
          S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm,
        by simpa [hw] using
          S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm⟩)
      hneg hrightBase
  let BL : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2) :=
    { n := B.n, m := mL, phi := B.boundary,
      phi_injective := B.boundary_injective, phi_ccw := B.boundary_ccw,
      L := LL, Packet := PL, Hside := HL, Block := BlockL, Hord := HordL }
  let BR : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx) :=
    { n := B.n, m := mR, phi := B.boundary,
      phi_injective := B.boundary_injective, phi_ccw := B.boundary_ccw,
      L := LR, Packet := PR, Hside := HR, Block := BlockR, Hord := HordR }
  have hleftLast : BL.L.points (CGN.lastIndex BL.Packet.hm) =
      S.oppositeVertexByIndex S.oppIndex1 := by
    calc
      _ = BL.phi (BL.Block.idx (CGN.lastIndex BL.Packet.hm)) :=
        BL.Block.points_eq _
      _ = B.boundary iv := by simp only [BL]; rw [BlockL.idx_last, hhiL]
      _ = _ := hv
  have hrightFirst : BR.L.points (CGN.firstIndex BR.Packet.hm) =
      S.oppositeVertexByIndex S.oppIndex1 := by
    calc
      _ = BR.phi (BR.Block.idx (CGN.firstIndex BR.Packet.hm)) :=
        BR.Block.points_eq _
      _ = B.boundary iv := by simp only [BR]; rw [BlockR.idx_first, hloR]
      _ = _ := hv
  have hmemRL : H.radiusLeft ∈ S.capByIndex S.oppIndex2 := by
    simpa only [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2]
      using (Finset.mem_inter.mp H.radiusLeft_mem).2
  have hmemρL : H.rhoLeft ∈ S.capByIndex S.oppIndex2 := by
    simpa only [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2]
      using (Finset.mem_inter.mp H.rhoLeft_mem).2
  have hmemRR : H.radiusRight ∈ S.capByIndex S.surplusIdx := by
    rw [← hrightCap]
    exact (Finset.mem_inter.mp H.radiusRight_mem).2
  have hmemρR : H.rhoRight ∈ S.capByIndex S.surplusIdx := by
    rw [← hrightCap]
    exact (Finset.mem_inter.mp H.rhoRight_mem).2
  have hdRL : dist (S.oppositeVertexByIndex S.oppIndex1) H.radiusLeft = radius :=
    (mem_selectedClass.mp (Finset.mem_inter.mp H.radiusLeft_mem).1).2
  have hdρL : dist (S.oppositeVertexByIndex S.oppIndex1) H.rhoLeft = ρ :=
    (mem_selectedClass.mp (Finset.mem_inter.mp H.rhoLeft_mem).1).2
  have hdRR : dist (S.oppositeVertexByIndex S.oppIndex1) H.radiusRight = radius :=
    (mem_selectedClass.mp (Finset.mem_inter.mp H.radiusRight_mem).1).2
  have hdρR : dist (S.oppositeVertexByIndex S.oppIndex1) H.rhoRight = ρ :=
    (mem_selectedClass.mp (Finset.mem_inter.mp H.rhoRight_mem).1).2
  have hRL_ne : H.radiusLeft ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro heq
    rw [heq, dist_self] at hdRL
    linarith
  have hρL_ne : H.rhoLeft ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro heq
    rw [heq, dist_self] at hdρL
    linarith
  have hRR_ne : H.radiusRight ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro heq
    rw [heq, dist_self] at hdRR
    linarith
  have hρR_ne : H.rhoRight ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro heq
    rw [heq, dist_self] at hdρR
    linarith
  rcases lt_or_gt_of_ne hne with hrρ | hρr
  · obtain ⟨irL, iρL, hirL, hiρL, hiρLirL⟩ :=
      ambientIndex_lt_of_dist_lt_from_last BL hmemRL hmemρL (by
        simpa only [hleftLast, hdRL, hdρL] using hrρ)
    obtain ⟨irR, iρR, hirR, hiρR, hirRiρR⟩ :=
      ambientIndex_lt_of_dist_lt_from_first BR hmemRR hmemρR (by
        simpa only [hrightFirst, hdRR, hdρR] using hrρ)
    have hleft_lt_iv : BlockL.idx irL < iv := by
      have hle : BlockL.idx irL ≤ iv := by
        have h := ((BlockL.idx_range_exact (BlockL.idx irL)).2 ⟨irL, rfl⟩).2
        simpa only [hhiL] using h
      apply lt_of_le_of_ne hle
      intro heq
      apply hRL_ne
      calc
        H.radiusLeft = LL.points irL := by simpa only [BL] using hirL.symm
        _ = B.boundary (BlockL.idx irL) := BlockL.points_eq irL
        _ = B.boundary iv := congrArg B.boundary heq
        _ = _ := hv
    have hiv_lt_right : iv < BlockR.idx irR := by
      have hle : iv ≤ BlockR.idx irR := by
        have h := ((BlockR.idx_range_exact (BlockR.idx irR)).2 ⟨irR, rfl⟩).1
        simpa only [hloR] using h
      apply lt_of_le_of_ne hle
      intro heq
      apply hRR_ne
      calc
        H.radiusRight = LR.points irR := by simpa only [BR] using hirR.symm
        _ = B.boundary (BlockR.idx irR) := BlockR.points_eq irR
        _ = B.boundary iv := congrArg B.boundary heq.symm
        _ = _ := hv
    let P : SharedBoundaryRadialOrder H B :=
      { radiusLeftIndex := BlockL.idx irL
        rhoLeftIndex := BlockL.idx iρL
        radiusRightIndex := BlockR.idx irR
        rhoRightIndex := BlockR.idx iρR
        radiusLeft_eq := (BlockL.points_eq irL).symm.trans (by
          simpa only [BL] using hirL)
        rhoLeft_eq := (BlockL.points_eq iρL).symm.trans (by
          simpa only [BL] using hiρL)
        radiusRight_eq := (BlockR.points_eq irR).symm.trans (by
          simpa only [BR] using hirR)
        rhoRight_eq := (BlockR.points_eq iρR).symm.trans (by
          simpa only [BR] using hiρR)
        direct_or_mirror := Or.inl ⟨hrρ, Or.inl ⟨hiρLirL,
          lt_trans hleft_lt_iv hiv_lt_right, hirRiρR⟩⟩ }
    exact P.radialCyclicOrder
  · obtain ⟨iρL, irL, hiρL, hirL, hirLiρL⟩ :=
      ambientIndex_lt_of_dist_lt_from_last BL hmemρL hmemRL (by
        simpa only [hleftLast, hdRL, hdρL] using hρr)
    obtain ⟨iρR, irR, hiρR, hirR, hiρRirR⟩ :=
      ambientIndex_lt_of_dist_lt_from_first BR hmemρR hmemRR (by
        simpa only [hrightFirst, hdRR, hdρR] using hρr)
    have hleft_lt_iv : BlockL.idx iρL < iv := by
      have hle : BlockL.idx iρL ≤ iv := by
        have h := ((BlockL.idx_range_exact (BlockL.idx iρL)).2 ⟨iρL, rfl⟩).2
        simpa only [hhiL] using h
      apply lt_of_le_of_ne hle
      intro heq
      apply hρL_ne
      calc
        H.rhoLeft = LL.points iρL := by simpa only [BL] using hiρL.symm
        _ = B.boundary (BlockL.idx iρL) := BlockL.points_eq iρL
        _ = B.boundary iv := congrArg B.boundary heq
        _ = _ := hv
    have hiv_lt_right : iv < BlockR.idx iρR := by
      have hle : iv ≤ BlockR.idx iρR := by
        have h := ((BlockR.idx_range_exact (BlockR.idx iρR)).2 ⟨iρR, rfl⟩).1
        simpa only [hloR] using h
      apply lt_of_le_of_ne hle
      intro heq
      apply hρR_ne
      calc
        H.rhoRight = LR.points iρR := by simpa only [BR] using hiρR.symm
        _ = B.boundary (BlockR.idx iρR) := BlockR.points_eq iρR
        _ = B.boundary iv := congrArg B.boundary heq.symm
        _ = _ := hv
    let P : SharedBoundaryRadialOrder H B :=
      { radiusLeftIndex := BlockL.idx irL
        rhoLeftIndex := BlockL.idx iρL
        radiusRightIndex := BlockR.idx irR
        rhoRightIndex := BlockR.idx iρR
        radiusLeft_eq := (BlockL.points_eq irL).symm.trans (by
          simpa only [BL] using hirL)
        rhoLeft_eq := (BlockL.points_eq iρL).symm.trans (by
          simpa only [BL] using hiρL)
        radiusRight_eq := (BlockR.points_eq irR).symm.trans (by
          simpa only [BR] using hirR)
        rhoRight_eq := (BlockR.points_eq iρR).symm.trans (by
          simpa only [BR] using hiρR)
        direct_or_mirror := Or.inr ⟨hρr, Or.inl ⟨hirLiρL,
          lt_trans hleft_lt_iv hiv_lt_right, hiρRirR⟩⟩ }
    exact P.radialCyclicOrder

private theorem radialCyclicOrder_of_mirror
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {radius ρ : ℝ}
    (G : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex1 radius ρ)
    (H : FourHits G)
    (hradius_pos : 0 < radius) (hρ_pos : 0 < ρ) (hne : radius ≠ ρ)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hu : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hv : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1)
    (hw : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2)
    (O : MirrorBoundaryBlocks S B.boundary hn iv iw) :
    RadialCyclicOrder H := by
  classical
  letI : NeZero B.n := ⟨Nat.ne_of_gt hn⟩
  let iz : Fin B.n := zeroIndex hn
  let phi : Fin B.n → ℝ² := fun t => B.boundary (t + iw)
  let jV : Fin B.n := iv - iw
  let jU : Fin B.n := iz - iw
  have hphi0 : phi 0 = S.oppositeVertexByIndex S.oppIndex2 := by
    simpa only [phi, zero_add] using hw
  have hphiV : phi jV = S.oppositeVertexByIndex S.oppIndex1 := by
    simpa only [phi, jV, sub_add_cancel] using hv
  have hphiU : phi jU = S.oppositeVertexByIndex S.surplusIdx := by
    simpa only [phi, jU, sub_add_cancel, iz] using hu
  have hjVpos : (0 : Fin B.n) < jV := by
    apply Fin.pos_iff_ne_zero.mpr
    intro hj
    have hadd := congrArg (fun t : Fin B.n => t + iw) hj
    have : iv = iw := by simpa only [jV, sub_add_cancel, zero_add] using hadd
    exact (ne_of_gt O.apex_order.2) this
  have hjUpos : (0 : Fin B.n) < jU := by
    apply Fin.pos_iff_ne_zero.mpr
    intro hj
    have hadd := congrArg (fun t : Fin B.n => t + iw) hj
    have : iz = iw := by simpa only [jU, sub_add_cancel, zero_add] using hadd
    exact (ne_of_gt O.apex_order.1) (by simpa only [iz] using this.symm)
  have hjV_ne_jU : jV ≠ jU := by
    intro heq
    have hadd := congrArg (fun t : Fin B.n => t + iw) heq
    have : iv = iz := by simpa only [jV, jU, sub_add_cancel] using hadd
    exact (ne_of_gt (lt_trans O.apex_order.1 O.apex_order.2))
      (by simpa only [iz] using this)
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 := by
    intro i j k hij hjk
    exact signedArea_strict_of_boundaryIndexing B hij hjk
  have hnegShift : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (phi i) (phi j) (phi k) < 0 := by
    intro i j k hij hjk
    exact signedArea_strict_of_cyclicShift hneg iw hij hjk
  have hjV_lt_jU : jV < jU := by
    rcases lt_or_gt_of_ne hjV_ne_jU with hlt | hgt
    · exact hlt
    · have hs := hnegShift hjUpos hgt
      have ho := hneg O.apex_order.1 O.apex_order.2
      have hswap :
          signedArea2 (B.boundary iw) (B.boundary iz) (B.boundary iv) =
            -signedArea2 (B.boundary iz) (B.boundary iw) (B.boundary iv) := by
        simp [signedArea2]
        ring
      rw [hphi0, hphiU, hphiV] at hs
      rw [← hw, ← hu, ← hv] at hs
      rw [hswap] at hs
      simpa only [iz] using (show False by linarith)
  have hphiInj : Function.Injective phi :=
    injective_cyclicShift B.boundary_injective iw
  have hphiImage : Finset.univ.image phi = D.A := by
    simpa only [phi, image_univ_cyclicShift B.boundary iw] using B.boundary_image
  have hphiCcw : EuclideanGeometry.IsCcwConvexPolygon phi :=
    isCcwConvexPolygon_cyclicShift B.boundary_injective B.boundary_ccw iw
  let B' : BoundaryIndexing D.A :=
    boundaryIndexingOfBoundary phi hphiInj hphiImage hphiCcw
  have hrightInterval : ∀ x : ℝ²,
      x ∈ S.capByIndex S.surplusIdx ↔
        ∃ q : Fin B.n, 0 ≤ q ∧ q ≤ jV ∧ phi q = x := by
    apply S.capByIndex_reverse_interval_of_global_indices S.surplusIdx
      hphiCcw hphiInj hphiImage hjVpos (Or.inr hjV_lt_jU)
    · simpa [hphiU] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm
    · simpa [hphiV] using
        S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
    · simpa [hphi0] using
        S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hrightBase : signedArea2 (phi jU) (phi 0) (phi jV) < 0 := by
    have h := hnegShift hjVpos hjV_lt_jU
    have hcycle : signedArea2 (phi jU) (phi 0) (phi jV) =
        signedArea2 (phi 0) (phi jV) (phi jU) := by
      simp [signedArea2]
      ring
    rw [hcycle]
    exact h
  obtain ⟨mR, LR, PR, HR, BlockR, HordR, hloR, hhiR⟩ :=
    strictCapBlockData_of_supportCap_on_boundary
      D.convex (S.capByIndex_subset S.surplusIdx)
      (S.circPacketByIndex S.surplusIdx)
      (S.circPacketByIndex S.surplusIdx).inner_at_v1
      hphiInj hphiImage hjVpos hrightInterval
      (u := jU) (lo := 0) (hi := jV)
      (by simpa [hphiU] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm)
      (Or.inr ⟨
        by simpa [hphi0] using
          S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm,
        by simpa [hphiV] using
          S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm⟩)
      hnegShift hrightBase
  have hleftInterval : ∀ x : ℝ²,
      x ∈ S.capByIndex S.oppIndex2 ↔
        ∃ q : Fin B.n, jV ≤ q ∧ q ≤ jU ∧ phi q = x := by
    apply S.capByIndex_reverse_interval_of_global_indices S.oppIndex2
      hphiCcw hphiInj hphiImage hjV_lt_jU (Or.inl hjVpos)
    · simpa [hphi0] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm
    · simpa [hphiU] using
        S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
    · simpa [hphiV] using
        S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  have hleftBase : signedArea2 (phi 0) (phi jV) (phi jU) < 0 :=
    hnegShift hjVpos hjV_lt_jU
  obtain ⟨mL, LL, PL, HL, BlockL, HordL, hloL, hhiL⟩ :=
    strictCapBlockData_of_supportCap_on_boundary
      D.convex (S.capByIndex_subset S.oppIndex2)
      (S.circPacketByIndex S.oppIndex2)
      (S.circPacketByIndex S.oppIndex2).inner_at_v1
      hphiInj hphiImage hjV_lt_jU hleftInterval
      (u := 0) (lo := jV) (hi := jU)
      (by simpa [hphi0] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm)
      (Or.inr ⟨
        by simpa [hphiV] using
          S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm,
        by simpa [hphiU] using
          S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm⟩)
      hnegShift hleftBase
  let BR : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx) :=
    { n := B.n, m := mR, phi := phi,
      phi_injective := hphiInj, phi_ccw := hphiCcw,
      L := LR, Packet := PR, Hside := HR, Block := BlockR, Hord := HordR }
  let BL : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2) :=
    { n := B.n, m := mL, phi := phi,
      phi_injective := hphiInj, phi_ccw := hphiCcw,
      L := LL, Packet := PL, Hside := HL, Block := BlockL, Hord := HordL }
  have hrightLast : BR.L.points (CGN.lastIndex BR.Packet.hm) =
      S.oppositeVertexByIndex S.oppIndex1 := by
    calc
      _ = BR.phi (BR.Block.idx (CGN.lastIndex BR.Packet.hm)) :=
        BR.Block.points_eq _
      _ = phi jV := by simp only [BR]; rw [BlockR.idx_last, hhiR]
      _ = _ := hphiV
  have hleftFirst : BL.L.points (CGN.firstIndex BL.Packet.hm) =
      S.oppositeVertexByIndex S.oppIndex1 := by
    calc
      _ = BL.phi (BL.Block.idx (CGN.firstIndex BL.Packet.hm)) :=
        BL.Block.points_eq _
      _ = phi jV := by simp only [BL]; rw [BlockL.idx_first, hloL]
      _ = _ := hphiV
  have hrightCap :
      S.rightAdjacentCapByIndex S.oppIndex1 = S.capByIndex S.surplusIdx := by
    rw [S.rightAdjacentCapByIndex_eq_capByIndex,
      rightAdjacentIndex_oppIndex1 S]
  have hmemRL : H.radiusLeft ∈ S.capByIndex S.oppIndex2 := by
    simpa only [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2]
      using (Finset.mem_inter.mp H.radiusLeft_mem).2
  have hmemρL : H.rhoLeft ∈ S.capByIndex S.oppIndex2 := by
    simpa only [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2]
      using (Finset.mem_inter.mp H.rhoLeft_mem).2
  have hmemRR : H.radiusRight ∈ S.capByIndex S.surplusIdx := by
    rw [← hrightCap]
    exact (Finset.mem_inter.mp H.radiusRight_mem).2
  have hmemρR : H.rhoRight ∈ S.capByIndex S.surplusIdx := by
    rw [← hrightCap]
    exact (Finset.mem_inter.mp H.rhoRight_mem).2
  have hdRL : dist (S.oppositeVertexByIndex S.oppIndex1) H.radiusLeft = radius :=
    (mem_selectedClass.mp (Finset.mem_inter.mp H.radiusLeft_mem).1).2
  have hdρL : dist (S.oppositeVertexByIndex S.oppIndex1) H.rhoLeft = ρ :=
    (mem_selectedClass.mp (Finset.mem_inter.mp H.rhoLeft_mem).1).2
  have hdRR : dist (S.oppositeVertexByIndex S.oppIndex1) H.radiusRight = radius :=
    (mem_selectedClass.mp (Finset.mem_inter.mp H.radiusRight_mem).1).2
  have hdρR : dist (S.oppositeVertexByIndex S.oppIndex1) H.rhoRight = ρ :=
    (mem_selectedClass.mp (Finset.mem_inter.mp H.rhoRight_mem).1).2
  have hRL_ne : H.radiusLeft ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro heq
    rw [heq, dist_self] at hdRL
    linarith
  have hρL_ne : H.rhoLeft ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro heq
    rw [heq, dist_self] at hdρL
    linarith
  have hRR_ne : H.radiusRight ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro heq
    rw [heq, dist_self] at hdRR
    linarith
  have hρR_ne : H.rhoRight ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    intro heq
    rw [heq, dist_self] at hdρR
    linarith
  rcases lt_or_gt_of_ne hne with hrρ | hρr
  · obtain ⟨irR, iρR, hirR, hiρR, hiρRirR⟩ :=
      ambientIndex_lt_of_dist_lt_from_last BR hmemRR hmemρR (by
        simpa only [hrightLast, hdRR, hdρR] using hrρ)
    obtain ⟨irL, iρL, hirL, hiρL, hirLiρL⟩ :=
      ambientIndex_lt_of_dist_lt_from_first BL hmemRL hmemρL (by
        simpa only [hleftFirst, hdRL, hdρL] using hrρ)
    have hright_lt_jV : BlockR.idx irR < jV := by
      have hle : BlockR.idx irR ≤ jV := by
        have h := ((BlockR.idx_range_exact (BlockR.idx irR)).2 ⟨irR, rfl⟩).2
        simpa only [hhiR] using h
      apply lt_of_le_of_ne hle
      intro heq
      apply hRR_ne
      calc
        H.radiusRight = LR.points irR := by simpa only [BR] using hirR.symm
        _ = phi (BlockR.idx irR) := BlockR.points_eq irR
        _ = phi jV := congrArg phi heq
        _ = _ := hphiV
    have hjV_lt_left : jV < BlockL.idx irL := by
      have hle : jV ≤ BlockL.idx irL := by
        have h := ((BlockL.idx_range_exact (BlockL.idx irL)).2 ⟨irL, rfl⟩).1
        simpa only [hloL] using h
      apply lt_of_le_of_ne hle
      intro heq
      apply hRL_ne
      calc
        H.radiusLeft = LL.points irL := by simpa only [BL] using hirL.symm
        _ = phi (BlockL.idx irL) := BlockL.points_eq irL
        _ = phi jV := congrArg phi heq.symm
        _ = _ := hphiV
    let P : SharedBoundaryRadialOrder H B' :=
      { radiusLeftIndex := BlockL.idx irL
        rhoLeftIndex := BlockL.idx iρL
        radiusRightIndex := BlockR.idx irR
        rhoRightIndex := BlockR.idx iρR
        radiusLeft_eq := by
          simpa only [B', boundaryIndexingOfBoundary, BL] using
            (BlockL.points_eq irL).symm.trans hirL
        rhoLeft_eq := by
          simpa only [B', boundaryIndexingOfBoundary, BL] using
            (BlockL.points_eq iρL).symm.trans hiρL
        radiusRight_eq := by
          simpa only [B', boundaryIndexingOfBoundary, BR] using
            (BlockR.points_eq irR).symm.trans hirR
        rhoRight_eq := by
          simpa only [B', boundaryIndexingOfBoundary, BR] using
            (BlockR.points_eq iρR).symm.trans hiρR
        direct_or_mirror := Or.inl ⟨hrρ, Or.inr ⟨hiρRirR,
          lt_trans hright_lt_jV hjV_lt_left, hirLiρL⟩⟩ }
    exact P.radialCyclicOrder
  · obtain ⟨iρR, irR, hiρR, hirR, hirRiρR⟩ :=
      ambientIndex_lt_of_dist_lt_from_last BR hmemρR hmemRR (by
        simpa only [hrightLast, hdRR, hdρR] using hρr)
    obtain ⟨iρL, irL, hiρL, hirL, hiρLirL⟩ :=
      ambientIndex_lt_of_dist_lt_from_first BL hmemρL hmemRL (by
        simpa only [hleftFirst, hdRL, hdρL] using hρr)
    have hright_lt_jV : BlockR.idx iρR < jV := by
      have hle : BlockR.idx iρR ≤ jV := by
        have h := ((BlockR.idx_range_exact (BlockR.idx iρR)).2 ⟨iρR, rfl⟩).2
        simpa only [hhiR] using h
      apply lt_of_le_of_ne hle
      intro heq
      apply hρR_ne
      calc
        H.rhoRight = LR.points iρR := by simpa only [BR] using hiρR.symm
        _ = phi (BlockR.idx iρR) := BlockR.points_eq iρR
        _ = phi jV := congrArg phi heq
        _ = _ := hphiV
    have hjV_lt_left : jV < BlockL.idx iρL := by
      have hle : jV ≤ BlockL.idx iρL := by
        have h := ((BlockL.idx_range_exact (BlockL.idx iρL)).2 ⟨iρL, rfl⟩).1
        simpa only [hloL] using h
      apply lt_of_le_of_ne hle
      intro heq
      apply hρL_ne
      calc
        H.rhoLeft = LL.points iρL := by simpa only [BL] using hiρL.symm
        _ = phi (BlockL.idx iρL) := BlockL.points_eq iρL
        _ = phi jV := congrArg phi heq.symm
        _ = _ := hphiV
    let P : SharedBoundaryRadialOrder H B' :=
      { radiusLeftIndex := BlockL.idx irL
        rhoLeftIndex := BlockL.idx iρL
        radiusRightIndex := BlockR.idx irR
        rhoRightIndex := BlockR.idx iρR
        radiusLeft_eq := by
          simpa only [B', boundaryIndexingOfBoundary, BL] using
            (BlockL.points_eq irL).symm.trans hirL
        rhoLeft_eq := by
          simpa only [B', boundaryIndexingOfBoundary, BL] using
            (BlockL.points_eq iρL).symm.trans hiρL
        radiusRight_eq := by
          simpa only [B', boundaryIndexingOfBoundary, BR] using
            (BlockR.points_eq irR).symm.trans hirR
        rhoRight_eq := by
          simpa only [B', boundaryIndexingOfBoundary, BR] using
            (BlockR.points_eq iρR).symm.trans hiρR
        direct_or_mirror := Or.inr ⟨hρr, Or.inr ⟨hirRiρR,
          lt_trans hright_lt_jV hjV_lt_left, hiρLirL⟩⟩ }
    exact P.radialCyclicOrder

/-- At the first non-surplus cap, the two-radius adjacent-cap grid always has
four representatives in the radial direct-or-mirror cyclic order.  The proof
uses a single global zero-cut boundary; the mirror cap-block packet is handled
by cyclically recutting that boundary at the second non-surplus apex. -/
theorem exists_fourHits_radialCyclicOrder_oppIndex1
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {radius ρ : ℝ}
    (G : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex1 radius ρ)
    (hradius_pos : 0 < radius) (hρ_pos : 0 < ρ) (hne : radius ≠ ρ) :
    ∃ H : FourHits G, RadialCyclicOrder H := by
  classical
  let H : FourHits G := Classical.choice (FourHits.exists G)
  rcases Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S with
    ⟨B, hn, iv, iw, hu, hv, hw, hdirect | hmirror⟩
  · exact ⟨H, radialCyclicOrder_of_direct D S G H
      hradius_pos hρ_pos hne B hn iv iw hu hv hw hdirect⟩
  · exact ⟨H, radialCyclicOrder_of_mirror D S G H
      hradius_pos hρ_pos hne B hn iv iw hu hv hw hmirror⟩

/-- Source-clean strict Kalmanson inequality produced directly from the
two-radius adjacent-cap grid at the first non-surplus cap. -/
theorem exists_fourHits_strict_cross_distance_oppIndex1
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {radius ρ : ℝ}
    (G : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex1 radius ρ)
    (hradius_pos : 0 < radius) (hρ_pos : 0 < ρ) (hne : radius ≠ ρ) :
    ∃ H : FourHits G,
      dist H.radiusLeft H.radiusRight + dist H.rhoLeft H.rhoRight <
        dist H.radiusLeft H.rhoRight + dist H.rhoLeft H.radiusRight := by
  rcases exists_fourHits_radialCyclicOrder_oppIndex1 D S G
      hradius_pos hρ_pos hne with ⟨H, horder⟩
  exact ⟨H, horder.strict_cross_distance D.convex⟩

#print axioms FourHits.exists
#print axioms ambientIndex_lt_of_dist_lt_from_first
#print axioms ambientIndex_lt_of_dist_lt_from_last
#print axioms signedArea_strict_of_boundaryIndexing
#print axioms signedArea_strict_of_cyclicShift
#print axioms SharedBoundaryRadialOrder.cyclicOrder
#print axioms SharedBoundaryRadialOrder.radialCyclicOrder
#print axioms RadialCyclicOrder.strict_cross_distance
#print axioms exists_fourHits_radialCyclicOrder_oppIndex1
#print axioms exists_fourHits_strict_cross_distance_oppIndex1

end ExactFourAdjacentGridKalmanson
end Problem97
