import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing
import Erdos9796Proof.P97.ATail.ExactFourAdjacentGridKalmanson

/-!
# Scratch polar-order packet for the sharp canonical-cap branch

This file only packages the direct/mirror sign consequence of the existing
zero-cut boundary blocks.  It does not add a production theorem or solver
constraint.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FreshThirdCapEightPolarOrder

open Census554.GeneralCarrierBridge
open Census554.CapSelectedGeometry
open Census554.ZeroCutBoundaryIndexing
open ExactFourAdjacentGridKalmanson

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem direct_signedArea_order
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {B : BoundaryIndexing A} {hn : 0 < B.n} {iv iw : Fin B.n}
    (hiv : B.boundary iv =
      S.oppositeVertexByIndex S.oppIndex1)
    (hblocks : DirectBoundaryBlocks S B.boundary hn iv iw)
    {x y : ℝ²} {ix iy : Fin B.n}
    (hix : iw < ix) (hxy : ix < iy)
    (hixPoint : B.boundary ix = x)
    (hiyPoint : B.boundary iy = y) :
    signedArea2 S.oppApex1 x y < 0 := by
  have hivx : iv < ix := lt_trans hblocks.apex_order.2 hix
  have hneg := signedArea_strict_of_boundaryIndexing B hivx hxy
  have hapex : B.boundary iv = S.oppApex1 :=
    hiv.trans (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
  simpa [hapex, hixPoint, hiyPoint] using hneg

private theorem mirror_signedArea_order
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {B : BoundaryIndexing A} {hn : 0 < B.n} {iv iw : Fin B.n}
    (hiv : B.boundary iv =
      S.oppositeVertexByIndex S.oppIndex1)
    (hblocks : MirrorBoundaryBlocks S B.boundary hn iv iw)
    {x y : ℝ²} {ix iy : Fin B.n}
    (hiy : iy < ix) (hix : ix < iw)
    (hixPoint : B.boundary ix = x)
    (hiyPoint : B.boundary iy = y) :
    0 < signedArea2 S.oppApex1 x y := by
  have hiyIw : iy < iw := lt_trans hiy hix
  have hiwiv : iw < iv := hblocks.apex_order.2
  have hneg := signedArea_strict_of_boundaryIndexing (B := B)
    (i := iy) (j := ix) (k := iv) hiy (lt_trans hix hiwiv)
  have hswap :
      signedArea2 (B.boundary ix) (B.boundary iy) (B.boundary iv) =
        -signedArea2 (B.boundary iy) (B.boundary ix) (B.boundary iv) := by
    simp only [signedArea2]
    ring
  have hpos :
      0 < signedArea2 (B.boundary ix) (B.boundary iy) (B.boundary iv) := by
    linarith
  have hcyc :
      signedArea2 (B.boundary iv) (B.boundary ix) (B.boundary iy) =
        signedArea2 (B.boundary ix) (B.boundary iy) (B.boundary iv) := by
    simp only [signedArea2]
    ring
  have hapex : B.boundary iv = S.oppApex1 :=
    hiv.trans (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
  have hpos' :
      0 < signedArea2 (B.boundary iv) (B.boundary ix) (B.boundary iy) := by
    rw [hcyc]
    exact hpos
  simpa [hapex, hixPoint, hiyPoint] using hpos'

/-- Existing zero-cut cap blocks, strengthened with the strict polar sign.

In the direct arm the block order is the global boundary order and gives
negative area.  In the mirror arm the displayed local order is reversed
(`iy < ix`), giving positive area; this is the sign-opposite formulation
needed by a solver that keeps one local orientation for both arms. -/
theorem exists_oppIndex1_polar_order_packet
    {D : CounterexampleData} (S : SurplusCapPacket D.A) :
    ∃ (B : BoundaryIndexing D.A) (hn : 0 < B.n)
        (iv iw : Fin B.n),
      B.boundary (zeroIndex hn) =
          S.oppositeVertexByIndex S.surplusIdx ∧
      B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
      B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
      ((∃ _hblocks : DirectBoundaryBlocks S B.boundary hn iv iw,
          ∀ {x y : ℝ²} {ix iy : Fin B.n},
            x ∈ S.capInteriorByIndex S.oppIndex1 →
            y ∈ S.capInteriorByIndex S.oppIndex1 →
            iw < ix → ix < iy →
            B.boundary ix = x → B.boundary iy = y →
            signedArea2 S.oppApex1 x y < 0) ∨
       (∃ _hblocks : MirrorBoundaryBlocks S B.boundary hn iv iw,
          ∀ {x y : ℝ²} {ix iy : Fin B.n},
            x ∈ S.capInteriorByIndex S.oppIndex1 →
            y ∈ S.capInteriorByIndex S.oppIndex1 →
            iy < ix → ix < iw →
            B.boundary ix = x → B.boundary iy = y →
            0 < signedArea2 S.oppApex1 x y)) := by
  rcases Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S with
    ⟨B, hn, iv, iw, hzero, hiv, hiw, horientation⟩
  refine ⟨B, hn, iv, iw, hzero, hiv, hiw, ?_⟩
  rcases horientation with hdirect | hmirror
  · left
    refine ⟨hdirect, ?_⟩
    intro x y ix iy hx hy hix hxy hixPoint hiyPoint
    exact direct_signedArea_order S hiv hdirect hix hxy hixPoint hiyPoint
  · right
    refine ⟨hmirror, ?_⟩
    intro x y ix iy hx hy hiy hix hixPoint hiyPoint
    exact mirror_signedArea_order S hiv hmirror hiy hix hixPoint hiyPoint

end FreshThirdCapEightPolarOrder
end Problem97
