/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import JointTransitionCore
import JointProfileElimination

/-!
# Scratch: joint-transition packet adapter for paired profile elimination

The verifier's names are fixed here:

* `b = v`, the divergent member of the row centered at `y`;
* `c = u`, the divergent member of the row centered at `x`.

Thus `v = {y,a}` and `u = {x,a}` is the crossed collinear assignment, while
`v = {x,a}` and `u = {y,a}` is the reverse mixed residual.  The final theorem
eliminates the two same-profile assignments and the crossed collinear
assignment directly from a `JointTransitionPacket`, leaving only a low-hit row
or the explicitly named reverse mixed profile.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailJointProfileEliminationScratch

open ATailThirdRowProfileBankScratch
open ATailJointTransitionCoreScratch

attribute [local instance] Classical.propDecidable

namespace ATailJointTransitionCoreScratch.JointTransitionPacket

private theorem v_ne_u
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv) : v ≠ u := by
  intro h
  apply J.u_not_mem_rowY
  simpa [h] using J.v_mem_rowY

private theorem x_ne_v
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv) : x ≠ v := by
  intro h
  apply J.v_outside
  have hxCap : x ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.x_strict).1
  simpa [h] using hxCap

private theorem y_ne_u
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv) : y ≠ u := by
  intro h
  apply J.u_outside
  have hyCap : y ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.y_strict).1
  simpa [h] using hyCap

/-- A live packet cannot give both generated rows the `{x,a}` profile. -/
theorem false_of_same_xa_profiles
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKu : x ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support) : False := by
  exact false_of_same_xa_profile_pair
    P.rowX P.rowY Kv Ku
    P.y_mem_rowX P.a_mem_rowX P.x_mem_rowY P.a_mem_rowY
    J.v_mem_rowY J.u_mem_rowX
    hxKv haKv hxKu haKu (y_ne_u J) (v_ne_u J)

/-- A live packet cannot give both generated rows the `{y,a}` profile. -/
theorem false_of_same_ya_profiles
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support)
    (hyKv : y ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support) : False := by
  exact false_of_same_ya_profile_pair
    P.rowX P.rowY Kv Ku
    P.y_mem_rowX P.a_mem_rowX P.x_mem_rowY P.a_mem_rowY
    J.v_mem_rowY J.u_mem_rowX
    hyKv haKv hyKu haKu (x_ne_v J) (v_ne_u J)

/-- Construct the verifier's crossed collinear profile (`b=v`, `c=u`). -/
def crossedCollinearProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hyKv : y ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hxKu : x ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    CrossedCollinearProfile D.A x y S.oppApex2 v u
      P.rowX P.rowY Kv Ku :=
  { y_mem_rowX := P.y_mem_rowX
    a_mem_rowX := P.a_mem_rowX
    x_mem_rowY := P.x_mem_rowY
    a_mem_rowY := P.a_mem_rowY
    b_mem_rowY := J.v_mem_rowY
    c_mem_rowX := J.u_mem_rowX
    y_mem_rowB := hyKv
    a_mem_rowB := haKv
    x_mem_rowC := hxKu
    a_mem_rowC := haKu
    b_ne_x := (x_ne_v J).symm
    c_ne_y := (y_ne_u J).symm }

/-- The verifier's crossed orientation is impossible by collinearity. -/
theorem false_of_crossed_collinear_profiles
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hyKv : y ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hxKu : x ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) : False :=
  (crossedCollinearProfile J hyKv haKv hxKu haKu).false_of_convexIndep

/-- Construct the reverse mixed orientation (`v={x,a}`, `u={y,a}`), which is
the positive-profile residual rather than a contradiction. -/
def mixedResidualProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    MixedResidualProfile D.A x y S.oppApex2 v u
      P.rowX P.rowY Kv Ku :=
  { y_mem_rowX := P.y_mem_rowX
    a_mem_rowX := P.a_mem_rowX
    x_mem_rowY := P.x_mem_rowY
    a_mem_rowY := P.a_mem_rowY
    b_mem_rowY := J.v_mem_rowY
    c_mem_rowX := J.u_mem_rowX
    x_mem_rowB := hxKv
    a_mem_rowB := haKv
    y_mem_rowC := hyKu
    a_mem_rowC := haKu }

/-- Paired positive-profile pruning at the exact live packet surface.

After eliminating both equal assignments and the crossed collinear assignment,
either generated row is low-hit or the reverse mixed profile remains. -/
theorem lowHit_or_lowHit_or_mixedResidualProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv) :
    LowHit Ku x y S.oppApex2 ∨
      LowHit Kv x y S.oppApex2 ∨
        MixedResidualProfile D.A x y S.oppApex2 v u
          P.rowX P.rowY Kv Ku := by
  rcases J.u_transition with huLow | huXa | huYa
  · exact Or.inl huLow
  · rcases J.v_transition with hvLow | hvXa | hvYa
    · exact Or.inr (Or.inl hvLow)
    · exact False.elim
        (false_of_same_xa_profiles J
          huXa.1 huXa.2.1 hvXa.1 hvXa.2.1)
    · exact False.elim
        (false_of_crossed_collinear_profiles J
          hvYa.1 hvYa.2.1 huXa.1 huXa.2.1)
  · rcases J.v_transition with hvLow | hvXa | hvYa
    · exact Or.inr (Or.inl hvLow)
    · exact Or.inr (Or.inr
        (mixedResidualProfile J hvXa.1 hvXa.2.1 huYa.1 huYa.2.1))
    · exact False.elim
        (false_of_same_ya_profiles J
          huYa.1 huYa.2.1 hvYa.1 hvYa.2.1)

#print axioms false_of_same_xa_profiles
#print axioms false_of_same_ya_profiles
#print axioms false_of_crossed_collinear_profiles
#print axioms lowHit_or_lowHit_or_mixedResidualProfile

end ATailJointTransitionCoreScratch.JointTransitionPacket

end ATailJointProfileEliminationScratch
end Problem97
