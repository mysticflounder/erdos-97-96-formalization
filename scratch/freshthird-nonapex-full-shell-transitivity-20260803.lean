/- PARKED-SPEC: source-clean metric kernel for the v34 nonapex
   five-membership implication.  This is a diagnostic theorem only; it is not
   wired into the live FreshThird obligation or the CEGAR contract. -/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

/- The five directed full-shell memberships share one radius at each center.
   Distance symmetry then transports the three edge lengths around the
   triangle, forcing the sixth membership.  Positivity and exact-shell
   cardinality are deliberately not needed by this metric kernel. -/
theorem parked_dist_eq_of_five_nonapex_shell_memberships
    {a b c : ℝ²} {ra rb rc : ℝ}
    (hab : dist a b = ra)
    (hba : dist b a = rb)
    (hbc : dist b c = rb)
    (hca : dist c a = rc)
    (hcb : dist c b = rc) :
    dist a c = ra := by
  have habc : dist a b = dist b c := by
    calc
      dist a b = dist b a := dist_comm a b
      _ = rb := hba
      _ = dist b c := hbc.symm
  calc
    dist a c = dist c a := dist_comm a c
    _ = dist c b := hca.trans hcb.symm
    _ = dist b c := dist_comm c b
    _ = dist a b := habc.symm
    _ = ra := hab

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.parked_dist_eq_of_five_nonapex_shell_memberships
