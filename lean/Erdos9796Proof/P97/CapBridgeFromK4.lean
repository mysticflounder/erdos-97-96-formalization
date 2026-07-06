/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ArcPartitionCount
import Erdos9796Proof.P97.NoDiameterUnderK4

/-!
# Cap-sum bridge from `K4`

Closes the spine leaf `largeK4SurplusCapPacket`: from `9 < |A|` together with
`ConvexIndep A` and `HasNEquidistantProperty 4 A`, construct a
`SurplusCapPacket A`.

Two steps:
* `no_diameter_under_k4` (CGN3) excludes the diameter branch of the Sylvester
  dichotomy, so the MEC boundary carries at least three points (`hcirc`);
* the circumscribed-branch chain through already-proven lemmas
  `exists_nonobtuse_circumscribed_triple` → `moser_triangle_signed_area_ne_zero`
  + `arc_partition_count_eq_one` → `cap_partition_from_moser_circumscribed` →
  `CapTriple.toSurplusCapPacket_of_card_gt_nine`
  turns `hcirc` into the packet.

The circumscribed structure built here mirrors the proven
`nonempty_nonobtuseCircumscribedMoserTriangle`, but keeps the triangle as
*data* (a `let`) so its `case_split` field is `Or.inl …` definitionally and
the downstream lemmas can consume the circumscribed-branch witness.
-/

open scoped EuclideanGeometry

namespace Problem97.MEC

/-- **MEC circumscribed branch → cap triple.**  This exposes the generic cap
partition construction used by the surplus-packet bridge.  It only produces a
`CapTriple`; exact opposite-cap cardinalities are separate data. -/
theorem exists_capTriple_of_circumscribed
    {A : Finset ℝ²} (hA : A.Nonempty) (hncol : ¬ Collinear ℝ (A : Set ℝ²))
    (hConv : Problem97.ConvexIndep A)
    (hcirc : 3 ≤ (A.filter
      (fun p => dist p (mec A hA).center = (mec A hA).radius)).card) :
    ∃ (MT : NonObtuseCircumscribedMoserTriangle A hA hncol)
        (hCirc : ∃ h12 h23 h13,
          MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩),
      Nonempty (Problem97.CapTriple A
        (MT.toMoserTriangle.toStructural hCirc)) := by
  -- Extract the non-obtuse circumscribed boundary triple.
  obtain ⟨a, b, c, ha_mem, hb_mem, hc_mem, hab, hbc, hac,
          ha_bdry, hb_bdry, hc_bdry, hinn1, hinn2, hinn3⟩ :=
    exists_nonobtuse_circumscribed_triple hA hncol hcirc
  -- Build the non-obtuse circumscribed Moser triangle as data, so its
  -- `case_split` field is `Or.inl ⟨hab, hbc, hac⟩` definitionally.
  let MT : NonObtuseCircumscribedMoserTriangle A hA hncol :=
    { toMoserTriangle :=
        { v1 := a, v2 := b, v3 := c,
          v1_mem := ha_mem, v2_mem := hb_mem, v3_mem := hc_mem,
          v1_boundary := ha_bdry, v2_boundary := hb_bdry,
          v3_boundary := hc_bdry,
          case_split := Or.inl ⟨hab, hbc, hac⟩ }
      inner_at_v1 := hinn1
      inner_at_v2 := hinn2
      inner_at_v3 := hinn3 }
  -- Circumscribed-branch witness for `MT.toMoserTriangle` (holds by `rfl`).
  have hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩ :=
    ⟨hab, hbc, hac, rfl⟩
  -- Non-degeneracy of the support triangle.
  have hNonDeg : Problem97.signedArea2
      MT.toMoserTriangle.v1 MT.toMoserTriangle.v2 MT.toMoserTriangle.v3 ≠ 0 :=
    moser_triangle_signed_area_ne_zero MT.toMoserTriangle hCirc
  -- Generic cap-count hypothesis: every other point lies on exactly one cap.
  have hCount := arc_partition_count_eq_one hConv MT.toMoserTriangle hCirc
  -- Assemble the cap partition.
  obtain ⟨CP⟩ := cap_partition_from_moser_circumscribed
    MT.toMoserTriangle hCirc hNonDeg hCount
  exact ⟨MT, hCirc, ⟨CP⟩⟩

/-- **MEC → `SurplusCapPacket` (circumscribed branch).**  Given a nonempty
noncollinear convex-independent `A` whose MEC boundary carries at least three
points (`hcirc`) and with `9 < |A|`, build a `SurplusCapPacket A`. -/
theorem nonempty_surplusCapPacket_of_circumscribed
    {A : Finset ℝ²} (hA : A.Nonempty) (hncol : ¬ Collinear ℝ (A : Set ℝ²))
    (hConv : Problem97.ConvexIndep A)
    (hcirc : 3 ≤ (A.filter
      (fun p => dist p (mec A hA).center = (mec A hA).radius)).card)
    (hcard : 9 < A.card) :
    Nonempty (Problem97.SurplusCapPacket A) := by
  rcases exists_capTriple_of_circumscribed hA hncol hConv hcirc with
    ⟨MT, hCirc, ⟨CP⟩⟩
  -- Pigeonhole on `9 < |A|` produces the surplus cap.
  exact Problem97.CapTriple.toSurplusCapPacket_of_card_gt_nine MT hCirc CP hcard

/-- **Cap-sum bridge from `K4`.**  `9 < |A|` together with `ConvexIndep A` and
`HasNEquidistantProperty 4 A` yields a `SurplusCapPacket A`.  CGN3
(`no_diameter_under_k4`) excludes the diameter branch; the circumscribed chain
then builds the packet. -/
theorem nonempty_surplusCapPacket_of_K4
    {A : Finset ℝ²} (hA : A.Nonempty) (hConv : Problem97.ConvexIndep A)
    (hK4 : Problem97.HasNEquidistantProperty 4 A) (hcard : 9 < A.card) :
    Nonempty (Problem97.SurplusCapPacket A) := by
  have hncol : ¬ Collinear ℝ (A : Set ℝ²) :=
    hConv.not_collinear_of_card_ge_three (by omega)
  have hcirc := no_diameter_under_k4 hA hncol hConv hK4
  exact nonempty_surplusCapPacket_of_circumscribed hA hncol hConv hcirc hcard

end Problem97.MEC
