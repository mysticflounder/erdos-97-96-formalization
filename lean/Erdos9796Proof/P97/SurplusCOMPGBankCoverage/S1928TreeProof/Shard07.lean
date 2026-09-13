import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child13
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Shard07Child25

namespace Problem97.S1928TreeProof.Shard07

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 284),
    (46, .prune .u 284),
    (51, Shard07Child02.certificate),
    (53, .prune .u 284),
    (54, .prune .u 284),
    (58, .prune .u 284),
    (60, .prune .u 284),
    (86, .prune .u 284),
    (102, Shard07Child08.certificate),
    (114, Shard07Child09.certificate),
    (116, .prune .u 284),
    (150, .prune .u 284),
    (166, Shard07Child12.certificate),
    (178, Shard07Child13.certificate),
    (180, .prune .u 284),
    (526, .prune .u 284),
    (531, Shard07Child16.certificate),
    (533, .prune .u 284),
    (534, .prune .u 284),
    (538, .prune .u 284),
    (540, .prune .u 284),
    (582, Shard07Child21.certificate),
    (594, Shard07Child22.certificate),
    (596, .prune .u 284),
    (646, Shard07Child24.certificate),
    (658, Shard07Child25.certificate),
    (660, .prune .u 284)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1928Fixed s1928Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s2, .s1] [(.u, 284)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, Shard07Child02.checked, by decide, by decide, by decide, by decide, by decide, Shard07Child08.checked, Shard07Child09.checked, by decide, by decide, Shard07Child12.checked, Shard07Child13.checked, by decide, by decide, Shard07Child16.checked, by decide, by decide, by decide, by decide, Shard07Child21.checked, Shard07Child22.checked, by decide, Shard07Child24.checked, Shard07Child25.checked, by decide, True.intro⟩

end Problem97.S1928TreeProof.Shard07
