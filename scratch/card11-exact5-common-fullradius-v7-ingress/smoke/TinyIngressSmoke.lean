import Std.Tactic.BVDecide.Reflect

open Std.Sat
open Std.Tactic.BVDecide

namespace Problem97.Card11Exact5CommonFullradiusV7CertificateIngress

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def TinyIngressSmokeDimacs : List (List Int) := [
  [-1],
  [1]
]

def TinyIngressSmokeToLit (literal : Int) : Nat × Bool :=
  (literal.natAbs - 1, decide (0 < literal))

def TinyIngressSmokeCnf : CNF Nat :=
  TinyIngressSmokeDimacs.map fun clause => clause.map TinyIngressSmokeToLit

def TinyIngressSmokeLrat : String := include_str "tiny.normalized.lrat"

theorem TinyIngressSmokeCore_unsat : TinyIngressSmokeCnf.Unsat := by
  apply Reflect.verifyCert_correct TinyIngressSmokeCnf TinyIngressSmokeLrat
  native_decide

#print axioms TinyIngressSmokeCore_unsat

end Problem97.Card11Exact5CommonFullradiusV7CertificateIngress
