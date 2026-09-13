import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child13
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Shard07Child25

namespace Problem97.S1848TreeProof.Shard07

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 300),
    (46, .prune .u 300),
    (51, Shard07Child02.certificate),
    (53, .prune .u 300),
    (54, .prune .u 300),
    (58, .prune .u 300),
    (60, .prune .u 300),
    (86, Shard07Child07.certificate),
    (102, .prune .u 300),
    (114, Shard07Child09.certificate),
    (116, .prune .u 300),
    (150, Shard07Child11.certificate),
    (166, .prune .u 300),
    (178, Shard07Child13.certificate),
    (180, .prune .u 300),
    (526, .prune .u 300),
    (547, Shard07Child16.certificate),
    (549, .prune .u 300),
    (550, .prune .u 300),
    (554, .prune .u 300),
    (556, .prune .u 300),
    (582, Shard07Child21.certificate),
    (610, Shard07Child22.certificate),
    (612, .prune .u 300),
    (646, Shard07Child24.certificate),
    (674, Shard07Child25.certificate),
    (676, .prune .u 300)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1848Fixed s1848Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s2, .s1] [(.u, 300)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, Shard07Child02.checked, by decide, by decide, by decide, by decide, Shard07Child07.checked, by decide, Shard07Child09.checked, by decide, Shard07Child11.checked, by decide, Shard07Child13.checked, by decide, by decide, Shard07Child16.checked, by decide, by decide, by decide, by decide, Shard07Child21.checked, Shard07Child22.checked, by decide, Shard07Child24.checked, Shard07Child25.checked, by decide, True.intro⟩

end Problem97.S1848TreeProof.Shard07
