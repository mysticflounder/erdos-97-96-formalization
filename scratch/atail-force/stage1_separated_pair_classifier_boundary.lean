import stage1_common_cap_confinement_boundary
import Erdos9796Proof.P97.Dumitrescu.L1

/-!
# ATAIL Stage-I separated-pair classifier boundary

This scratch module audits the positive classifier requested after
`URowOffDangerousSeparatedPairFields`.

The surviving pair does not itself instantiate a banked MEC, nested-chord,
five-row, or perpendicular-bisector contradiction.  The ordered-cap theorem
does give a stronger positive fact: the `u`-row center is the unique point of
the common cap equidistant from the two outside points.  Full critical-shell
exactness also identifies the entire carrier intersection with that row
circle.

The smallest current convexity-only consumed alternate for the same outside
pair is therefore explicit: produce two *additional* distinct carrier centers
on its perpendicular bisector.  Together with the `u`-row center, those three
centers contradict Dumitrescu's perpendicular-bisector bound.  The module
kernel-checks both the positive boundary and this conditional consumer; it
does not claim that the live K-A hypotheses produce the two additional
centers.

No axiom, `sorry`, `admit`, or `native_decide` is introduced.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILStageOneSeparatedPairScratch

open U1Depth5
open ATAILStageOneConfinementScratch

/-- The strongest uniform cap/full-filter packet obtained from a surviving
separated outside pair.

The `exact_circle` field records the whole critical radius class, not merely
the two selected witnesses.  The `unique_cap_bisector` field says that no
second point of the common cap can be equidistant from the outside pair. -/
def URowOutsidePairUniqueCapBisectorFields
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 u : Plane)
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ k : Fin 3, ∃ z w : Plane,
    p ∈ S.capByIndex k ∧
    rows.uRow.center ∈ S.capByIndex k ∧
    rows.uRow.center ≠ p ∧
    z ≠ w ∧
    z ∈ rows.uRow.selected.toCriticalFourShell.support ∧
    w ∈ rows.uRow.selected.toCriticalFourShell.support ∧
    z ∉ ({q, t1, t2, t3} : Finset Plane) ∧
    z ∉ S.capByIndex k ∧
    w ∉ S.capByIndex k ∧
    dist rows.uRow.center z = dist rows.uRow.center w ∧
    D.A.filter (fun x =>
      dist rows.uRow.center x = dist rows.uRow.center z) =
        rows.uRow.selected.toCriticalFourShell.support ∧
    (∀ a : Plane, a ∈ S.capByIndex k →
      (dist a z = dist a w ↔ a = rows.uRow.center))

/-- Any two distinct carrier points outside one indexed cap have at most one
equidistant center in that cap.  This is the universal form of the existing
`sameCap_outsidePair_pDistance_ne` endpoint. -/
theorem sameCap_outsidePair_unique_bisectorCenter
    {A : Finset Plane} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (k : Fin 3)
    {c z w : Plane}
    (hcCap : c ∈ S.capByIndex k)
    (hzA : z ∈ A) (hwA : w ∈ A) (hzw : z ≠ w)
    (hzOff : z ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k)
    (hcdist : dist c z = dist c w) :
    ∀ a : Plane, a ∈ S.capByIndex k →
      (dist a z = dist a w ↔ a = c) := by
  intro a haCap
  constructor
  · intro hadist
    by_contra hac
    exact sameCap_outsidePair_pDistance_ne
      S hconv k haCap hcCap (Ne.symm hac)
        hzA hwA hzw hzOff hwOff hcdist hadist
  · intro hac
    simpa [hac] using hcdist

/-- A surviving separated pair upgrades to exact full-shell information and
unique-cap-bisector information.  In particular, the unequal distance at `p`
is not an unclassified numerical accident: it is forced for every cap point
other than the `u`-row center. -/
theorem separatedPair_to_uniqueCapBisectorFields
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hpair : URowOffDangerousSeparatedPairFields
      S p q t1 t2 t3 u rows) :
    URowOutsidePairUniqueCapBisectorFields
      S p q t1 t2 t3 u rows := by
  classical
  rcases hpair with
    ⟨k, z, w, hp, hc, hzw, hzSupport, hwSupport, hzDangerous,
      hzOff, hwOff, hcdist, hpdist⟩
  have hc_ne_p : rows.uRow.center ≠ p := by
    intro hcp
    apply hpdist
    simpa [hcp] using hcdist
  have hzA : z ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hzSupport
  have hwA : w ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hwSupport
  have hzRadius :
      dist rows.uRow.center z =
        rows.uRow.selected.toCriticalFourShell.radius :=
    rows.uRow.selected.toCriticalFourShell.support_eq_radius z hzSupport
  have hExact :
      D.A.filter (fun x =>
        dist rows.uRow.center x = dist rows.uRow.center z) =
          rows.uRow.selected.toCriticalFourShell.support := by
    rw [hzRadius]
    exact rows.uRow.selected.toCriticalFourShell.support_eq.symm
  exact ⟨k, z, w, hp, hc, hc_ne_p, hzw, hzSupport, hwSupport,
    hzDangerous, hzOff, hwOff, hcdist, hExact,
    sameCap_outsidePair_unique_bisectorCenter
      S D.convex k hc hzA hwA hzw hzOff hwOff hcdist⟩

/-- The honest global-order refinement of a same-cap outside pair.

The retained cap is one closed interval in a global convex-boundary
enumeration.  Both centers have indices in that interval and both outside
points have indices outside it.  The two center indices and the two outside
indices each have one of the two strict linear orders.  No cross-row metric
equality follows from these order fields. -/
structure OutsidePairGlobalBlockPlacement
    {A : Finset Plane} (C : Finset Plane)
    (p c z w : Plane) where
  block : CGN.StrictCapBlockData A C
  pIndex : Fin block.n
  cIndex : Fin block.n
  zIndex : Fin block.n
  wIndex : Fin block.n
  p_point : block.phi pIndex = p
  c_point : block.phi cIndex = c
  z_point : block.phi zIndex = z
  w_point : block.phi wIndex = w
  p_in_block : block.Block.lo ≤ pIndex ∧ pIndex ≤ block.Block.hi
  c_in_block : block.Block.lo ≤ cIndex ∧ cIndex ≤ block.Block.hi
  z_not_in_block : ¬ (block.Block.lo ≤ zIndex ∧ zIndex ≤ block.Block.hi)
  w_not_in_block : ¬ (block.Block.lo ≤ wIndex ∧ wIndex ≤ block.Block.hi)
  center_order : pIndex < cIndex ∨ cIndex < pIndex
  outside_order : zIndex < wIndex ∨ wIndex < zIndex

/-- Extract the retained global boundary block and the exact in-block/out-of-
block index facts.  This is all cyclic order supplies before a bank-specific
equality pattern is produced. -/
theorem outsidePair_globalBlockPlacement
    {A : Finset Plane} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (k : Fin 3)
    {p c z w : Plane}
    (hpCap : p ∈ S.capByIndex k)
    (hcCap : c ∈ S.capByIndex k)
    (hcp : c ≠ p)
    (hzA : z ∈ A) (hwA : w ∈ A) (hzw : z ≠ w)
    (hzOff : z ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k) :
    Nonempty (OutsidePairGlobalBlockPlacement (A := A)
      (S.capByIndex k) p c z w) := by
  classical
  rcases S.capByIndex_cgn4g_strictCapBlockData hconv k with ⟨B⟩
  rcases B.exists_index_of_mem_cap hpCap with ⟨rp, hrp⟩
  rcases B.exists_index_of_mem_cap hcCap with ⟨rc, hrc⟩
  have hzImage : z ∈ Finset.univ.image B.phi := by
    rw [B.Block.phi_image]
    exact hzA
  have hwImage : w ∈ Finset.univ.image B.phi := by
    rw [B.Block.phi_image]
    exact hwA
  rcases Finset.mem_image.mp hzImage with ⟨rz, _hrz, hrz⟩
  rcases Finset.mem_image.mp hwImage with ⟨rw, _hrw, hrw⟩
  have hpPoint : B.phi (B.Block.idx rp) = p :=
    (B.Block.points_eq rp).symm.trans hrp
  have hcPoint : B.phi (B.Block.idx rc) = c :=
    (B.Block.points_eq rc).symm.trans hrc
  have hpInside :
      B.Block.lo ≤ B.Block.idx rp ∧ B.Block.idx rp ≤ B.Block.hi :=
    (B.Block.idx_range_exact (B.Block.idx rp)).2 ⟨rp, rfl⟩
  have hcInside :
      B.Block.lo ≤ B.Block.idx rc ∧ B.Block.idx rc ≤ B.Block.hi :=
    (B.Block.idx_range_exact (B.Block.idx rc)).2 ⟨rc, rfl⟩
  have outside_of_not_mem_cap
      {x : Plane} {r : Fin B.n}
      (hrx : B.phi r = x) (hxOff : x ∉ S.capByIndex k) :
      ¬ (B.Block.lo ≤ r ∧ r ≤ B.Block.hi) := by
    intro hrInside
    rcases (B.Block.idx_range_exact r).1 hrInside with ⟨t, ht⟩
    apply hxOff
    rw [← B.cap_image]
    exact Finset.mem_image.mpr ⟨t, Finset.mem_univ t, by
      calc
        B.L.points t = B.phi (B.Block.idx t) := B.Block.points_eq t
        _ = B.phi r := by rw [ht]
        _ = x := hrx⟩
  have hpcIndex : B.Block.idx rp ≠ B.Block.idx rc := by
    intro hidx
    apply hcp
    calc
      c = B.phi (B.Block.idx rc) := hcPoint.symm
      _ = B.phi (B.Block.idx rp) := by rw [hidx]
      _ = p := hpPoint
  have hzwIndex : rz ≠ rw := by
    intro hidx
    apply hzw
    calc
      z = B.phi rz := hrz.symm
      _ = B.phi rw := by rw [hidx]
      _ = w := hrw
  exact ⟨
    { block := B
      pIndex := B.Block.idx rp
      cIndex := B.Block.idx rc
      zIndex := rz
      wIndex := rw
      p_point := hpPoint
      c_point := hcPoint
      z_point := hrz
      w_point := hrw
      p_in_block := hpInside
      c_in_block := hcInside
      z_not_in_block := outside_of_not_mem_cap hrz hzOff
      w_not_in_block := outside_of_not_mem_cap hrw hwOff
      center_order := lt_or_gt_of_ne hpcIndex
      outside_order := lt_or_gt_of_ne hzwIndex }⟩

/-- The surviving Stage-I pair always has the retained global block placement
above.  This exhausts the order information available from cap membership
alone. -/
theorem separatedPair_to_globalBlockPlacement
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hpair : URowOffDangerousSeparatedPairFields
      S p q t1 t2 t3 u rows) :
    ∃ k : Fin 3, ∃ z w : Plane,
      Nonempty (OutsidePairGlobalBlockPlacement (A := D.A)
        (S.capByIndex k) p rows.uRow.center z w) := by
  rcases hpair with
    ⟨k, z, w, hp, hc, hzw, hzSupport, hwSupport, _hzDangerous,
      hzOff, hwOff, hcdist, hpdist⟩
  have hc_ne_p : rows.uRow.center ≠ p := by
    intro hcp
    apply hpdist
    simpa [hcp] using hcdist
  have hzA : z ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hzSupport
  have hwA : w ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hwSupport
  exact ⟨k, z, w, outsidePair_globalBlockPlacement
    S D.convex k hp hc hc_ne_p hzA hwA hzw hzOff hwOff⟩

/-- A named already-consumed alternate for the separated pair: three distinct
carrier centers (`uRow.center`, `a`, and `b`) are all equidistant from the
same distinct pair `z,w`.

Dumitrescu's perpendicular-bisector theorem consumes exactly this packet.
The first unavailable producer field is the existence of `a`; a complete
contradiction also needs the independent second center `b`. -/
def URowTripleBisectorAlternateFields
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u) : Prop :=
  ∃ z w a b : Plane,
    z ≠ w ∧
    z ∈ rows.uRow.selected.toCriticalFourShell.support ∧
    w ∈ rows.uRow.selected.toCriticalFourShell.support ∧
    a ∈ D.A ∧
    b ∈ D.A ∧
    rows.uRow.center ≠ a ∧
    rows.uRow.center ≠ b ∧
    a ≠ b ∧
    dist rows.uRow.center z = dist rows.uRow.center w ∧
    dist a z = dist a w ∧
    dist b z = dist b w

/-- The named triple-bisector alternate is impossible in a convex-independent
carrier. -/
theorem false_of_uRowTripleBisectorAlternateFields
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (halt : URowTripleBisectorAlternateFields rows) : False := by
  classical
  rcases halt with
    ⟨z, w, a, b, hzw, hzSupport, hwSupport, haA, hbA,
      hca, hcb, hab, hcdist, hadist, hbdist⟩
  have hzA : z ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hzSupport
  have hwA : w ∈ D.A :=
    rows.uRow.selected.toCriticalFourShell.support_subset_A hwSupport
  have hcA : rows.uRow.center ∈ D.A :=
    (Finset.mem_erase.mp
      rows.uRow.selected.toCriticalFourShell.center_mem).2
  have hbound := Dumitrescu.perpBisector_apex_bound
    D.convex hzA hwA hzw
  have hthree :
      2 < (D.A.filter (fun x => dist x z = dist x w)).card := by
    rw [Finset.two_lt_card]
    refine ⟨rows.uRow.center, Finset.mem_filter.mpr ⟨hcA, ?_⟩,
      a, Finset.mem_filter.mpr ⟨haA, hadist⟩,
      b, Finset.mem_filter.mpr ⟨hbA, hbdist⟩,
      hca, hcb, hab⟩
    simpa only [dist_comm] using hcdist
  exact (not_lt_of_ge (by simpa only using hbound)) hthree

/-- Exact classifier/consumer boundary for the current route.  Once a theorem
maps every separated pair to the named triple-bisector alternate, the existing
confinement adapter closes the branch. -/
theorem confinement_of_tripleBisector_classifier
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (S : SurplusCapPacket D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (hcenter_ne : rows.uRow.center ≠ p)
    (hcommon : URowCommonCapFields S p q t1 t2 t3 u rows)
    (hclassify :
      URowOffDangerousSeparatedPairFields S p q t1 t2 t3 u rows →
        URowTripleBisectorAlternateFields rows) :
    URowCommonCapOffDangerousConfinement
      S p q t1 t2 t3 u rows := by
  exact confinement_of_pSeparatedPair_classifier_and_consumer
    S rows (URowTripleBisectorAlternateFields rows)
      hcenter_ne hcommon hclassify
      (false_of_uRowTripleBisectorAlternateFields rows)

#print axioms sameCap_outsidePair_unique_bisectorCenter
#print axioms separatedPair_to_uniqueCapBisectorFields
#print axioms outsidePair_globalBlockPlacement
#print axioms separatedPair_to_globalBlockPlacement
#print axioms false_of_uRowTripleBisectorAlternateFields
#print axioms confinement_of_tripleBisector_classifier

end ATAILStageOneSeparatedPairScratch
end Problem97
