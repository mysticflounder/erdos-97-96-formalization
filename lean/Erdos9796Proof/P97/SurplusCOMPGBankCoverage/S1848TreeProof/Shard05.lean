import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard05Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard05Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard05Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard05Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard05Child26

namespace Problem97.S1848TreeProof.Shard05

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 114),
    (46, .prune .u 114),
    (51, .prune .u 114),
    (53, .prune .u 114),
    (54, .prune .u 114),
    (58, .prune .u 114),
    (60, .prune .u 114),
    (86, .prune .u 114),
    (102, .prune .u 114),
    (114, .prune .u 114),
    (116, .prune .u 114),
    (150, .prune .u 114),
    (166, .prune .u 114),
    (178, .prune .u 114),
    (180, .prune .u 114),
    (526, Shard05Child15.certificate),
    (547, .prune .u 114),
    (549, Shard05Child17.certificate),
    (550, .prune .u 114),
    (554, .prune .u 114),
    (556, Shard05Child20.certificate),
    (582, .prune .u 114),
    (610, .prune .u 114),
    (612, .prune .u 114),
    (646, Shard05Child24.certificate),
    (674, .prune .u 114),
    (676, Shard05Child26.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1848Fixed s1848Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s2, .s1] [(.u, 114)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard05Child15.checked, by decide, Shard05Child17.checked, by decide, by decide, Shard05Child20.checked, by decide, by decide, by decide, Shard05Child24.checked, by decide, Shard05Child26.checked, True.intro⟩

end Problem97.S1848TreeProof.Shard05
