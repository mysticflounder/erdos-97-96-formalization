import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27Child30

namespace Problem97.S1840TreeProof.Shard09Child27

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard09Child27Child00.certificate),
    (46, .prune .Q1 610),
    (51, .prune .Q1 610),
    (53, .prune .u 432),
    (54, .prune .Q1 610),
    (58, .prune .Q1 610),
    (60, .prune .u 432),
    (86, .prune .Q1 610),
    (102, .prune .Q1 610),
    (114, .prune .Q1 610),
    (116, .prune .Q1 610),
    (150, .prune .u 432),
    (166, .prune .Q1 610),
    (178, .prune .Q1 610),
    (180, .prune .u 432),
    (270, Shard09Child27Child15.certificate),
    (275, Shard09Child27Child16.certificate),
    (277, Shard09Child27Child17.certificate),
    (278, Shard09Child27Child18.certificate),
    (282, Shard09Child27Child19.certificate),
    (284, Shard09Child27Child20.certificate),
    (291, .prune .Q1 610),
    (293, Shard09Child27Child22.certificate),
    (294, .prune .Q1 610),
    (298, .prune .Q1 610),
    (300, Shard09Child27Child25.certificate),
    (305, .prune .u 432),
    (306, .prune .Q1 610),
    (308, .prune .u 432),
    (312, .prune .u 432),
    (390, Shard09Child27Child30.certificate),
    (402, .prune .u 432),
    (404, .prune .u 432),
    (418, .prune .Q1 610),
    (420, .prune .u 432),
    (432, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 610), (.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard09Child27Child00.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child27Child15.checked, Shard09Child27Child16.checked, Shard09Child27Child17.checked, Shard09Child27Child18.checked, Shard09Child27Child19.checked, Shard09Child27Child20.checked, by decide, Shard09Child27Child22.checked, by decide, by decide, Shard09Child27Child25.checked, by decide, by decide, by decide, by decide, Shard09Child27Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard09Child27
