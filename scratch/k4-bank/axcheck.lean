import Erdos9796Proof.P97.K4WindowBank

open Problem97.EndpointCertificate.K4WindowBank

-- Axiom closure of representative per-class theorems and the aggregate.
#print axioms k4_dead_00_valid
#print axioms k4_dead_08_valid
#print axioms k4_dead_09_valid
#print axioms k4DeadCertificates_all_valid

-- Mutation control (smoke gate iii): a corrupted certificate must be REJECTED.
-- Perturb one coefficient term of class 00 and confirm the checker returns false.
open Problem97.EndpointCertificate in
def k4_dead_00_corrupted : Certificate :=
  { generators := k4_dead_00_generators
    coefficients :=
      match k4_dead_00_coefficients with
      | (t :: ts) :: rest => ((⟨t.coeff + 1, t.monom⟩ : Term) :: ts) :: rest
      | other => other }

open Problem97.EndpointCertificate in
example : checkCertificate k4_dead_00_corrupted = false := by native_decide
