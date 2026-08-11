      intro x hx
      rcases Finset.mem_image.mp hx with ⟨point, _hpoint, rfl⟩
      rw [← hboundaryImage]
      exact Finset.mem_image.mpr
        ⟨labelIndex point, Finset.mem_univ _, rfl⟩
    have hfImageCard : (Finset.univ.image f).card = 15 := by
      rw [Finset.card_image_of_injective _ hfInjective]
      simp
    have hfImage : Finset.univ.image f = D.A := by
      apply Finset.eq_of_subset_of_card_le hfImageSubset
      rw [hfImageCard, hcard]
    have hrowSubset : ∀ row, rowSupport row ⊆ D.A := by
      intro row
      fin_cases row
      · exact Kxv.support_subset_A
      · exact Ku.support_subset_A
      · exact Kv.support_subset_A
      · exact Kdel.support_subset_A
    have hrowCard : ∀ row, (rowSupport row).card = 4 := by
      intro row
      fin_cases row
      · exact Kxv.support_card
      · exact Ku.support_card
      · exact Kv.support_card
      · exact Kdel.support_card
    have htotal : ∀ row,
        (Finset.univ.filter fun point => membership row point).card = 4 := by
      intro row
      change (Finset.univ.filter fun point => decide (f point ∈ rowSupport row)).card = 4
      calc
        _ = (rowSupport row).card :=
          filter_decide_mem_card_eq f hfInjective hfImage (hrowSubset row)
        _ = 4 := hrowCard row
    have hfixed₁ : ∀ row,
        membership row
          (BlockerVExactFifteenFourRowCoverage.fixedHit₁ row) = true := by
      intro row
      fin_cases row
      · simpa [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₁, huPoint] using
          Q.huXvRow
      · simpa [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₁, huPoint] using
          Ku.q_mem_support
      · simpa [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₁, hvPoint] using
          Kv.q_mem_support
      · simpa [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₁, hvPoint] using
          Q.hvDeletedRow
    have hfixed₂ : ∀ row,
        membership row
          (BlockerVExactFifteenFourRowCoverage.fixedHit₂ row) = true := by
      intro row
      fin_cases row <;>
        simp [membership, f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.fixedHit₂,
          hxuPoint, hxvPoint, hdeletedPoint,
          Kxv.q_mem_support, hxuURow, hxvVRow, Kdel.q_mem_support]
    have hrowCap : ∀ row,
        (rowSupport row ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
      intro row
      fin_cases row
      · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2 Kxv.toSelectedFourClass
          (by simpa only [Hlate, Q.hblockerEqV] using interiorCap hvInterior)
      · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2 Ku.toSelectedFourClass
          (by simpa only [Hlate, hcenterU] using interiorCap hxvInterior)
      · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2 Kv.toSelectedFourClass
          (by simpa only [Hlate, hcenterV] using interiorCap hdeletedInterior)
      · exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex2 Kdel.toSelectedFourClass
          (by simpa only [Hlate, c] using interiorCap hcInterior)
    have hlong : ∀ row,
        (Finset.univ.filter fun point =>
          membership row point &&
            BlockerVExactFifteenFourRowCoverage.longLabelBool point).card ≤ 2 := by
      intro row
      exact filter_decide_mem_and_mask_card_le f hfInjective
        (rowSupport row) (S.capByIndex S.oppIndex2)
        BlockerVExactFifteenFourRowCoverage.longLabelBool hlongPoint
        (hrowCap row)
    have hshell : ∀ row point₁ point₂,
        membership row point₁ = true → membership row point₂ = true →
          dist
              (boundary (labelIndex
                (BlockerVExactFifteenFourRowCoverage.centerLabel row)))
              (boundary (labelIndex point₁)) =
            dist
              (boundary (labelIndex
                (BlockerVExactFifteenFourRowCoverage.centerLabel row)))
              (boundary (labelIndex point₂)) := by
      intro row point₁ point₂ hpoint₁ hpoint₂
      have hmem₁ : f point₁ ∈ rowSupport row :=
        of_decide_eq_true (by simpa only [membership] using hpoint₁)
      have hmem₂ : f point₂ ∈ rowSupport row :=
        of_decide_eq_true (by simpa only [membership] using hpoint₂)
      fin_cases row
      · have hdist := (Kxv.support_eq_radius _ hmem₁).trans
          (Kxv.support_eq_radius _ hmem₂).symm
        simpa only [f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.centerLabel,
          hvPoint, Hlate, Q.hblockerEqV] using hdist
      · have hdist := (Ku.support_eq_radius _ hmem₁).trans
          (Ku.support_eq_radius _ hmem₂).symm
        simpa only [f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.centerLabel,
          hxvPoint, Hlate, hcenterU] using hdist
      · have hdist := (Kv.support_eq_radius _ hmem₁).trans
          (Kv.support_eq_radius _ hmem₂).symm
        simpa only [f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.centerLabel,
          hdeletedPoint, Hlate, hcenterV] using hdist
      · have hdist := (Kdel.support_eq_radius _ hmem₁).trans
          (Kdel.support_eq_radius _ hmem₂).symm
        simpa only [f, rowSupport,
          BlockerVExactFifteenFourRowCoverage.centerLabel,
          hcPoint, c, Hlate] using hdist
    exact
      BlockerVExactFifteenFourRowCoverage.false_of_positionEmbedding_membershipRows
        D.convex hboundaryInjective hboundaryImage hboundaryCcw
        orientation order labelIndex membership hposition htotal hfixed₁
        hfixed₂ hlong hshell
  have closeForward
      (order : Fin 2)
      (huPos :
        (BlockerVExactFifteenFourRowCoverage.position order 6).val = iu.val)
      (hxuPos :
        (BlockerVExactFifteenFourRowCoverage.position order 7).val = ixu.val)
      (hvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 8).val = iv.val)
      (hxvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 9).val = ixv.val)
      (hdeletedPos :
        (BlockerVExactFifteenFourRowCoverage.position order 10).val = id.val)
      (hcPos :
        (BlockerVExactFifteenFourRowCoverage.position order 11).val = ic.val)
      (hePos :
        (BlockerVExactFifteenFourRowCoverage.position order 12).val = ie.val) :
      False := by
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + B.Block.lo)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let labelIndex : Fin 15 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (BlockerVExactFifteenFourRowCoverage.position order point)
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
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw B.Block.lo
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          .forward order labelIndex := by
      intro point₁ point₂ hlt
      change labelIndex point₁ < labelIndex point₂
      change
        (BlockerVExactFifteenFourRowCoverage.position order point₁).val <
          (BlockerVExactFifteenFourRowCoverage.position order point₂).val
      exact hlt
    have pointAt (point : Fin 15) (t : Fin B.m)
        (hpoint :
          (BlockerVExactFifteenFourRowCoverage.position order point).val =
            t.val) :
        boundary (labelIndex point) = B.L.points t := by
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (BlockerVExactFifteenFourRowCoverage.position order point)) =
            Fin.castLE (by have hspan := B.block_span; omega) t := by
        apply Fin.ext
        exact hpoint
      simpa only [boundary, shifted, labelIndex, hcast] using
        B.shifted_phi_cast_eq_points t
    have hlongPosition : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactFifteenFourRowCoverage.position order point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      change B.phi
        (Fin.cast B.ambient_card_eq.symm
            (Fin.cast hcard.symm
              (BlockerVExactFifteenFourRowCoverage.position order point)) +
          B.Block.lo) ∈ S.capByIndex S.oppIndex2
      rw [B.shifted_phi_mem_cap_iff]
      change
        (BlockerVExactFifteenFourRowCoverage.position order point).val < B.m
      omega
    exact close .forward order boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hlongPoint
  have closeReverse
      (order : Fin 2)
      (huPos :
        (BlockerVExactFifteenFourRowCoverage.position order 6).val + iu.val = 8)
      (hxuPos :
        (BlockerVExactFifteenFourRowCoverage.position order 7).val + ixu.val = 8)
      (hvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 8).val + iv.val = 8)
      (hxvPos :
        (BlockerVExactFifteenFourRowCoverage.position order 9).val + ixv.val = 8)
      (hdeletedPos :
        (BlockerVExactFifteenFourRowCoverage.position order 10).val + id.val = 8)
      (hcPos :
        (BlockerVExactFifteenFourRowCoverage.position order 11).val + ic.val = 8)
      (hePos :
        (BlockerVExactFifteenFourRowCoverage.position order 12).val + ie.val = 8) :
      False := by
    letI : NeZero B.n := ⟨by have hspan := B.block_span; omega⟩
    let cut : Fin B.n := ⟨(B.Block.hi.val + 1) % B.n,
      Nat.mod_lt _ (by have := B.Block.hi.isLt; omega)⟩
    let shifted : Fin B.n → ℝ² := fun point => B.phi (point + cut)
    let boundary : Fin D.A.card → ℝ² := fun point =>
      shifted (Fin.cast B.ambient_card_eq.symm point)
    let labelIndex : Fin 15 → Fin D.A.card := fun point =>
      Fin.cast hcard.symm
        (Fin.rev (BlockerVExactFifteenFourRowCoverage.position order point))
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
    have hshiftedCcw : EuclideanGeometry.IsCcwConvexPolygon shifted := by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift B.phi_injective B.phi_ccw cut
    have hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
      simpa only [boundary] using
        ccw_finCast_domain B.ambient_card_eq hshiftedCcw
    have hposition :
        BlockerVExactFifteenFourRowCoverage.PositionEmbedding
          .reverse order labelIndex := by
      intro point₁ point₂ hlt
      change labelIndex point₂ < labelIndex point₁
      change
        (Fin.rev
            (BlockerVExactFifteenFourRowCoverage.position order point₂)).val <
          (Fin.rev
            (BlockerVExactFifteenFourRowCoverage.position order point₁)).val
      rw [Fin.val_rev, Fin.val_rev]
      omega
    have pointAt (point : Fin 15) (t : Fin B.m)
        (hpoint :
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
              t.val = 8) :
        boundary (labelIndex point) = B.L.points t := by
      let offset : Fin B.n := ⟨B.n - B.m + t.val, by
        have hspan := B.block_span
        have hmpos := B.Block.hm
        omega⟩
      have hcast :
          Fin.cast B.ambient_card_eq.symm
              (Fin.cast hcard.symm
                (Fin.rev
                  (BlockerVExactFifteenFourRowCoverage.position order point))) =
            offset := by
        apply Fin.ext
        simp only [Fin.val_cast, Fin.val_rev]
        dsimp only [offset]
        have hn : B.n = 15 := B.ambient_card_eq.trans hcard
        omega
      simpa only [boundary, shifted, labelIndex, cut, hcast, offset] using
        B.shifted_after_block_phi_cast_eq_points t
    have hlongPosition : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          (BlockerVExactFifteenFourRowCoverage.position order point).val < 9 := by
      fin_cases order <;> decide
    have hlongPoint : ∀ point,
        BlockerVExactFifteenFourRowCoverage.longLabelBool point = true →
          boundary (labelIndex point) ∈ S.capByIndex S.oppIndex2 := by
      intro point hlong
      have hlt := hlongPosition point hlong
      let t : Fin B.m := ⟨B.m - 1 -
          (BlockerVExactFifteenFourRowCoverage.position order point).val, by
        omega⟩
      have hsum :
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
              t.val = 8 := by
        change
          (BlockerVExactFifteenFourRowCoverage.position order point).val +
              (B.m - 1 -
                (BlockerVExactFifteenFourRowCoverage.position order point).val) = 8
        omega
      exact (pointAt point t hsum) ▸ B.points_mem_cap t
    exact close .reverse order boundary hboundaryInjective hboundaryImage
      hboundaryCcw labelIndex hposition
      ((pointAt 6 iu huPos).trans hiu) ((pointAt 7 ixu hxuPos).trans hixu)
      ((pointAt 8 iv hvPos).trans hiv) ((pointAt 9 ixv hxvPos).trans hixv)
      ((pointAt 10 id hdeletedPos).trans hid) ((pointAt 11 ic hcPos).trans hic)
      ((pointAt 12 ie hePos).trans hie) hlongPoint
  rcases horders with horder | horder | horder | horder
  · exact closeForward 0 (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
  · exact closeForward 1 (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
      (by simp [BlockerVExactFifteenFourRowCoverage.position]; omega)
