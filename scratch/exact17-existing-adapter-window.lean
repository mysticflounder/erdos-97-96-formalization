    intro heClass
    have heInsert : e ∈ insert c C := Finset.mem_insert_of_mem heClass
    have hsmall : (insert e (insert c C)).card = 6 := by
      rw [Finset.insert_eq_self.mpr heInsert,
        Finset.card_insert_of_notMem hcOff]
      have hCcard : C.card = 5 := by
        simpa only [C] using P.hclassFive
      omega
    omega
  have heNeXv : e ≠ packet.xv := by
    intro h
    exact heOff (by simpa only [h] using hxvClass)
  rcases S.capByIndex_cgn4g_strictCapBlockData_oriented D.convex S.oppIndex2 with
    ⟨B, hBorient⟩
  have hm : B.m = 9 := B.cap_card_eq.trans hcapCard
  have interiorCap {x : ℝ²} (hx : x ∈ I) : x ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
  rcases B.exists_index_of_mem_cap (interiorCap huInterior) with ⟨iu, hiu⟩
  rcases B.exists_index_of_mem_cap (interiorCap hvInterior) with ⟨iv, hiv⟩
  rcases B.exists_index_of_mem_cap (interiorCap hcInterior) with ⟨ic, hic⟩
  rcases B.exists_index_of_mem_cap (interiorCap hdeletedInterior) with ⟨id, hid⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxvInterior) with ⟨ixv, hixv⟩
  rcases B.exists_index_of_mem_cap (interiorCap heInterior) with ⟨ie, hie⟩
  rcases B.exists_index_of_mem_cap (interiorCap hxuInterior) with ⟨ixu, hixu⟩
  have indexBounds {x : ℝ²} (hx : x ∈ I) (i : Fin B.m)
      (hi : B.L.points i = x) : 0 < i.val ∧ i.val < B.m - 1 := by
    have hfirst : i ≠ CGN.firstIndex B.Packet.hm := by
      intro hifirst
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inl (hi.symm.trans (by simpa only [hifirst] using hb.1))
        · exact Or.inr (hi.symm.trans (by simpa only [hifirst] using hb.1))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hlast : i ≠ CGN.lastIndex B.Packet.hm := by
      intro hilast
      have hxEndpoint :
          x = (S.triangleByIndex S.oppIndex2).v2 ∨
            x = (S.triangleByIndex S.oppIndex2).v3 := by
        rcases hBorient with hb | hb
        · exact Or.inr (hi.symm.trans (by simpa only [hilast] using hb.2))
        · exact Or.inl (hi.symm.trans (by simpa only [hilast] using hb.2))
      rcases hxEndpoint with hxEndpoint | hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v2 hx hxEndpoint
      · exact S.capInteriorByIndex_ne_triangleByIndex_v3 hx hxEndpoint
    have hfirstVal : i.val ≠ 0 := by
      intro hi
      apply hfirst
      apply Fin.ext
      simpa only [CGN.firstIndex_val] using hi
    have hlastVal : i.val ≠ B.m - 1 := by
      intro hi
      apply hlast
      apply Fin.ext
      simpa only [CGN.lastIndex_val] using hi
    constructor <;> omega
  have hiuBounds := indexBounds huInterior iu hiu
  have hivBounds := indexBounds hvInterior iv hiv
  have hicBounds := indexBounds hcInterior ic hic
  have hidBounds := indexBounds hdeletedInterior id hid
  have hixvBounds := indexBounds hxvInterior ixv hixv
  have hieBounds := indexBounds heInterior ie hie
  have hixuBounds := indexBounds hxuInterior ixu hixu
  have between {j r s : Fin B.m} (hjr : B.L.points j ≠ B.L.points r)
      (hjs : B.L.points j ≠ B.L.points s)
      (hrs : B.L.points r ≠ B.L.points s)
      (heq : dist (B.L.points j) (B.L.points r) =
        dist (B.L.points j) (B.L.points s)) :
      (r < j ∧ j < s) ∨ (s < j ∧ j < r) := by
    have hjrIndex : j ≠ r := by
      intro h
      exact hjr (congrArg B.L.points h)
    have hjsIndex : j ≠ s := by
      intro h
      exact hjs (congrArg B.L.points h)
    have hrsIndex : r ≠ s := by
      intro h
      exact hrs (congrArg B.L.points h)
    rcases lt_or_gt_of_ne hrsIndex with hrs | hsr
    · exact Or.inl (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hjrIndex hjsIndex heq)
    · exact Or.inr (CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hjsIndex hjrIndex heq.symm)
  have hXv : (iu < ixv ∧ ixv < ixu) ∨ (ixu < ixv ∧ ixv < iu) :=
    between (by simpa only [hixv, hiu] using huNeXv.symm)
      (by simpa only [hixv, hixu] using hxuNeXv.symm)
      (by simpa only [hiu, hixu] using huNeXu)
      (by simpa only [hixv, hiu, hixu] using hE)
  have hV : (iu < iv ∧ iv < ixv) ∨ (ixv < iv ∧ iv < iu) :=
    between (by simpa only [hiv, hiu] using huNeV.symm)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hiu, hixv] using huNeXv)
      (by simpa only [hiv, hiu, hixv] using hD.symm)
  have hDel : (iv < id ∧ id < ixv) ∨ (ixv < id ∧ id < iv) :=
    between (by simpa only [hid, hiv] using hdelNeV)
      (by simpa only [hid, hixv] using hdelNeXv)
      (by simpa only [hiv, hixv] using hvNeXv)
      (by simpa only [hid, hiv, hixv] using hC)
  have hCenter : (iv < ic ∧ ic < id) ∨ (id < ic ∧ ic < iv) :=
    between (by simpa only [hic, hiv] using hcNeV)
      (by simpa only [hic, hid] using hcNeDeleted)
      (by simpa only [hiv, hid] using hdelNeV.symm)
      (by simpa only [hic, hiv, hid] using hA.symm)
  have hXuCenter : (id < ie ∧ ie < ixu) ∨ (ixu < ie ∧ ie < id) :=
    between (by simpa only [hie, hid] using heNeDeleted)
      (by simpa only [hie, hixu] using heNeXu)
      (by simpa only [hid, hixu] using hdelNeXu)
      (by simpa only [hie, hid, hixu] using hB.symm)
  have hieNeIxv : ie ≠ ixv := by
    intro h
    apply heNeXv
    calc
      e = B.L.points ie := hie.symm
      _ = B.L.points ixv := congrArg B.L.points h
      _ = packet.xv := hixv
  have horders := seven_index_order_classification hm iu iv ic id ixv ie ixu
    hiuBounds.1 hiuBounds.2 hivBounds.1 hivBounds.2 hicBounds.1 hicBounds.2
    hidBounds.1 hidBounds.2 hixvBounds.1 hixvBounds.2 hieBounds.1 hieBounds.2
    hixuBounds.1 hixuBounds.2
    hieNeIxv
    hXv hV hDel hCenter hXuCenter
  have close
      (orientation : BlockerVExactSixteenFourRowCoverage.Orientation)
      (order : Fin 2) (insertion : Fin 7)
      (boundary : Fin D.A.card → ℝ²)
      (hboundaryInjective : Function.Injective boundary)
      (hboundaryImage : Finset.univ.image boundary = D.A)
      (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
      (labelIndex : Fin 16 → Fin D.A.card)
      (hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          orientation order insertion labelIndex)
      (huPoint : boundary (labelIndex 6) = P.u.1)
      (hxuPoint : boundary (labelIndex 7) = packet.xu)
      (hvPoint : boundary (labelIndex 8) = P.v.1)
      (hxvPoint : boundary (labelIndex 9) = packet.xv)
      (hdeletedPoint :
        boundary (labelIndex 10) = P.jointDeletion.deleted.1)
      (hcPoint : boundary (labelIndex 11) = c)
      (hePoint : boundary (labelIndex 12) = e)
      (hKxvCovered : Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary (labelIndex point)))
      (hKuCovered : Ku.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary (labelIndex point)))
      (hKvCovered : Kv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary (labelIndex point)))
      (hKdelCovered : Kdel.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary (labelIndex point)))
      (hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2) : False := by
    exact false_of_blockerVExactSixteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      orientation order insertion labelIndex hposition
      (by simpa only [Kxv, Hlate] using hKxvCovered)
      (by simpa only [Ku, Hlate] using hKuCovered)
      (by simpa only [Kv, Hlate] using hKvCovered)
      (by simpa only [Kdel, Hlate] using hKdelCovered)
      hvInterior hxvInterior
      hdeletedInterior hcInterior huPoint hxuPoint hvPoint hxvPoint
      hdeletedPoint
      (by simpa only [c, Hlate] using hcPoint)
      (by simpa only [e, Hlate] using hePoint)
      hlongPoint
  have closeForward
      (order : Fin 2)
      (huPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 6).val = iu.val)
      (hxuPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 7).val = ixu.val)
      (hvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 8).val = iv.val)
      (hxvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 9).val = ixv.val)
      (hdeletedPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 10).val = id.val)
      (hcPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 11).val = ic.val)
      (hePos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 12).val = ie.val) :
      False := by
    -- Exact-17 unused-point forward adapter.
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary17 : Fin 17 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using
        injective_cyclicShift B.phi_injective B.Block.lo
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using
            image_univ_cyclicShift B.phi B.Block.lo
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary17Image : Finset.univ.image boundary17 = D.A := by
      simpa only [boundary17] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hunusedImage : unused ∈ Finset.univ.image boundary17 := by
      simpa only [hboundary17Image] using hunusedA
    rcases Finset.mem_image.mp hunusedImage with
      ⟨gap17, _hgap17, hgapPoint⟩
    have hgapGe : 9 ≤ gap17.val := by
      by_contra hgap
      apply hunusedCap
      rw [← hgapPoint]
      change B.phi
        (Fin.cast B.ambient_card_eq.symm (Fin.cast hcard.symm gap17) +
          B.Block.lo) ∈ S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change gap17.val < B.m
      omega
    let labelIndex : Fin 16 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (gap17.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point))
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          .forward order 0 labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        skip_exactSixteen_position_embedding_forward gap17 order
    have pointAt (point : Fin 16) (t : Fin B.m)
        (hpoint :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val =
            t.val) :
        boundary (labelIndex point) = B.L.points t := by
      have hp :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).castSucc <
            gap17 := by
        simpa only [Fin.lt_iff_val_lt_val, Fin.val_castSucc] using
          (show
            (BlockerVExactSixteenFourRowCoverage.position order 0 point).val <
              gap17.val by omega)
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (gap17.succAbove
                  (BlockerVExactSixteenFourRowCoverage.position order 0 point))) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_castLE]
        rw [Fin.succAbove_of_castSucc_lt _ _ hp]
        simpa only [Fin.val_castSucc] using hpoint
      simpa only [boundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    have huPoint := (pointAt 6 iu huPos).trans hiu
    have hxuPoint := (pointAt 7 ixu hxuPos).trans hixu
    have hvPoint := (pointAt 8 iv hvPos).trans hiv
    have hxvPoint := (pointAt 9 ixv hxvPos).trans hixv
    have hdeletedPoint := (pointAt 10 id hdeletedPos).trans hid
    have hcPoint := (pointAt 11 ic hcPos).trans hic
    have hePoint := (pointAt 12 ie hePos).trans hie
    have hgapNotKxv : boundary17 gap17 ∉ Kxv.support := by
      simpa only [hgapPoint] using hunusedKxv
    have hgapNotKu : boundary17 gap17 ∉ Ku.support := by
      simpa only [hgapPoint] using hunusedKu
    have hgapNotKv : boundary17 gap17 ∉ Kv.support := by
      simpa only [hgapPoint] using hunusedKv
    have hgapNotKdel : boundary17 gap17 ∉ Kdel.support := by
      simpa only [hgapPoint] using hunusedKdel
    have hpositionSurjective : Function.Surjective
        (BlockerVExactSixteenFourRowCoverage.position order 0) :=
      Finite.injective_iff_surjective.mp
        (BlockerVExactSixteenFourRowCoverage.position_injective order 0)
    have hKxvCovered :
        Kxv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Kxv.support_subset_A gap17 hgapNotKxv _ hpositionSurjective
    have hKuCovered :
        Ku.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Ku.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Ku.support_subset_A gap17 hgapNotKu _ hpositionSurjective
    have hKvCovered :
        Kv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Kv.support_subset_A gap17 hgapNotKv _ hpositionSurjective
    have hKdelCovered :
        Kdel.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kdel.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundary17
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundary17Image
        Kdel.support_subset_A gap17 hgapNotKdel _ hpositionSurjective
    have hlongPosition : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactSixteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      change B.phi
        (Fin.cast B.ambient_card_eq.symm
            (Fin.cast hcard.symm
              (gap17.succAbove
                (BlockerVExactSixteenFourRowCoverage.position order 0 point))) +
          B.Block.lo) ∈ S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change
        (gap17.succAbove
          (BlockerVExactSixteenFourRowCoverage.position order 0 point)).val < B.m
      have hp :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).castSucc <
            gap17 := by
        simpa only [Fin.lt_iff_val_lt_val, Fin.val_castSucc] using
          (show
            (BlockerVExactSixteenFourRowCoverage.position order 0 point).val <
              gap17.val by omega)
      rw [Fin.succAbove_of_castSucc_lt _ _ hp]
      simp only [Fin.val_castSucc]
      omega
    exact false_of_blockerVExactSixteen_bank_of_covered_source_rows
      Q hcenterV boundary hboundaryInjective hboundaryImage hboundaryCcw
      .forward order 0 labelIndex hposition hKxvCovered hKuCovered hKvCovered
      hKdelCovered hvInterior hxvInterior hdeletedInterior hcInterior
      huPoint hxuPoint hvPoint hxvPoint hdeletedPoint hcPoint hePoint hlongPoint
  have closeReverse
      (order : Fin 2)
      (huPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 6).val + iu.val = 8)
      (hxuPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 7).val + ixu.val = 8)
      (hvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 8).val + iv.val = 8)
      (hxvPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 9).val + ixv.val = 8)
      (hdeletedPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 10).val + id.val = 8)
      (hcPos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 11).val + ic.val = 8)
      (hePos :
        (BlockerVExactSixteenFourRowCoverage.position order 0 12).val + ie.val = 8) :
      False := by
    -- Exact-17 unused-point reverse adapter.
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let boundary17 : Fin 17 → ℝ² := fun point =>
      boundary (Fin.cast hcard.symm point)
    let boundaryRev : Fin 17 → ℝ² := fun point => boundary17 (Fin.rev point)
    have hshiftedInjective : Function.Injective shifted := by
      simpa only [shifted] using injective_cyclicShift B.phi_injective cut
    have hboundaryInjective : Function.Injective boundary := by
      simpa only [boundary] using
        injective_finCast_domain B.ambient_card_eq hshiftedInjective
    have hshiftedImage : Finset.univ.image shifted = D.A := by
      calc
        Finset.univ.image shifted = Finset.univ.image B.phi := by
          simpa only [shifted] using image_univ_cyclicShift B.phi cut
        _ = D.A := B.Block.phi_image
    have hboundaryImage : Finset.univ.image boundary = D.A := by
      simpa only [boundary] using
        (image_univ_finCast_domain B.ambient_card_eq shifted).trans
          hshiftedImage
    have hboundary17Image : Finset.univ.image boundary17 = D.A := by
      simpa only [boundary17] using
        (image_univ_finCast_domain hcard boundary).trans hboundaryImage
    have hboundaryRevImage : Finset.univ.image boundaryRev = D.A := by
      rw [← hboundary17Image]
      ext point
      constructor
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by simp only [boundaryRev]⟩
      · intro hpoint
        rcases Finset.mem_image.mp hpoint with ⟨index, _hindex, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.rev index, Finset.mem_univ _, by
            simp only [boundaryRev, Fin.rev_rev]⟩
    have hunusedImage : unused ∈ Finset.univ.image boundaryRev := by
      simpa only [hboundaryRevImage] using hunusedA
    rcases Finset.mem_image.mp hunusedImage with
      ⟨gap17, _hgap17, hgapPoint⟩
    have hgapGe : 9 ≤ gap17.val := by
      by_contra hgap
      let t : Fin B.m := ⟨B.m - 1 - gap17.val, by omega⟩
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm (Fin.rev gap17)) = offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset, t]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        omega
      have hgapAsPoint : boundaryRev gap17 = B.L.points t := by
        simpa only [boundaryRev, boundary17, boundary, shifted, cut, hcast,
          offset] using B.shifted_after_block_phi_cast_eq_points t
      apply hunusedCap
      rw [← hgapPoint, hgapAsPoint]
      exact B.points_mem_cap t
    let labelIndex : Fin 16 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (Fin.rev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactSixteenFourRowCoverage.PositionEmbedding
          .reverse order 0 labelIndex := by
      simpa only [labelIndex, Fin.val_cast] using
        skip_exactSixteen_position_embedding_reverse gap17 order
    have pointAt (point : Fin 16) (t : Fin B.m)
        (hpoint :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).val +
              t.val = 8) :
        boundary (labelIndex point) = B.L.points t := by
      have hp :
          (BlockerVExactSixteenFourRowCoverage.position order 0 point).castSucc <
            gap17 := by
        simpa only [Fin.lt_iff_val_lt_val, Fin.val_castSucc] using
          (show
            (BlockerVExactSixteenFourRowCoverage.position order 0 point).val <
              gap17.val by omega)
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (Fin.rev
                  (gap17.succAbove
                    (BlockerVExactSixteenFourRowCoverage.position order 0 point)))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        rw [Fin.succAbove_of_castSucc_lt _ _ hp]
        simp only [Fin.val_castSucc]
        dsimp only [offset]
        have hn : B.n = 17 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, shifted, labelIndex, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points t
    have huPoint := (pointAt 6 iu huPos).trans hiu
    have hxuPoint := (pointAt 7 ixu hxuPos).trans hixu
    have hvPoint := (pointAt 8 iv hvPos).trans hiv
    have hxvPoint := (pointAt 9 ixv hxvPos).trans hixv
    have hdeletedPoint := (pointAt 10 id hdeletedPos).trans hid
    have hcPoint := (pointAt 11 ic hcPos).trans hic
    have hePoint := (pointAt 12 ie hePos).trans hie
    have hgapNotKxv : boundaryRev gap17 ∉ Kxv.support := by
      simpa only [hgapPoint] using hunusedKxv
    have hgapNotKu : boundaryRev gap17 ∉ Ku.support := by
      simpa only [hgapPoint] using hunusedKu
    have hgapNotKv : boundaryRev gap17 ∉ Kv.support := by
      simpa only [hgapPoint] using hunusedKv
    have hgapNotKdel : boundaryRev gap17 ∉ Kdel.support := by
      simpa only [hgapPoint] using hunusedKdel
    have hpositionSurjective : Function.Surjective
        (BlockerVExactSixteenFourRowCoverage.position order 0) :=
      Finite.injective_iff_surjective.mp
        (BlockerVExactSixteenFourRowCoverage.position_injective order 0)
    have hKxvCovered :
        Kxv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kxv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kxv.support_subset_A gap17 hgapNotKxv _ hpositionSurjective
    have hKuCovered :
        Ku.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Ku.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Ku.support_subset_A gap17 hgapNotKu _ hpositionSurjective
    have hKvCovered :
        Kv.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kv.support ⊆ Finset.univ.image
        (fun point : Fin 16 => boundaryRev
          (gap17.succAbove
            (BlockerVExactSixteenFourRowCoverage.position order 0 point)))
      exact support_subset_image_skip_reindex hboundaryRevImage
        Kv.support_subset_A gap17 hgapNotKv _ hpositionSurjective
    have hKdelCovered :
        Kdel.support ⊆ Finset.univ.image
          (fun point : Fin 16 => boundary (labelIndex point)) := by
      change Kdel.support ⊆ Finset.univ.image
