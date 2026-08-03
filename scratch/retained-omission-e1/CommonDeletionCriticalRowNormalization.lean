import Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPhysicalSecondApexCommonDeletion

open ATailCommonDeletionTwoCenter

attribute [local instance] Classical.propDecidable

/-- A deleted-carrier row at a named critical blocker is the canonical full
ambient shell, even though the packet initially stores it as a chosen
four-subset. -/
theorem secondRow_support_eq_criticalShell_of_center_eq
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ source : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂)
    (hsource : source ∈ D.A)
    (hcenter : center₂ = H.centerAt source hsource) :
    C.B₂ =
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  subst center₂
  simpa [secondRowSelectedFourClass] using
    H.selectedFourClass_support_eq_shell source hsource
      (secondRowSelectedFourClass C)

/-- First-row counterpart of
`secondRow_support_eq_criticalShell_of_center_eq`. -/
theorem firstRow_support_eq_criticalShell_of_center_eq
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ source : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂)
    (hsource : source ∈ D.A)
    (hcenter : center₁ = H.centerAt source hsource) :
    C.B₁ =
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  subst center₁
  simpa [firstRowSelectedFourClass] using
    H.selectedFourClass_support_eq_shell source hsource
      (firstRowSelectedFourClass C)

end ATailPhysicalSecondApexCommonDeletion
end Problem97
