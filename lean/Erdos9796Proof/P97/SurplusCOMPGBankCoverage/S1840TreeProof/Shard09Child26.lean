import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child23
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26Child30

namespace Problem97.S1840TreeProof.Shard09Child26

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 596),
    (46, Shard09Child26Child01.certificate),
    (51, .prune .u 432),
    (53, .prune .Q1 596),
    (54, .prune .Q1 596),
    (58, .prune .u 432),
    (60, .prune .Q1 596),
    (86, .prune .Q1 596),
    (102, .prune .Q1 596),
    (114, .prune .Q1 596),
    (116, .prune .Q1 596),
    (150, .prune .Q1 596),
    (166, .prune .u 432),
    (178, .prune .u 432),
    (180, .prune .Q1 596),
    (270, Shard09Child26Child15.certificate),
    (275, Shard09Child26Child16.certificate),
    (277, .prune .Q1 596),
    (278, .prune .Q1 596),
    (282, Shard09Child26Child19.certificate),
    (284, .prune .Q1 596),
    (291, Shard09Child26Child21.certificate),
    (293, Shard09Child26Child22.certificate),
    (294, Shard09Child26Child23.certificate),
    (298, Shard09Child26Child24.certificate),
    (300, Shard09Child26Child25.certificate),
    (305, .prune .u 432),
    (306, .prune .u 432),
    (308, .prune .Q1 596),
    (312, .prune .u 432),
    (390, Shard09Child26Child30.certificate),
    (402, .prune .u 432),
    (404, .prune .Q1 596),
    (418, .prune .u 432),
    (420, .prune .u 432),
    (432, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 596), (.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, Shard09Child26Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child26Child15.checked, Shard09Child26Child16.checked, by decide, by decide, Shard09Child26Child19.checked, by decide, Shard09Child26Child21.checked, Shard09Child26Child22.checked, Shard09Child26Child23.checked, Shard09Child26Child24.checked, Shard09Child26Child25.checked, by decide, by decide, by decide, by decide, Shard09Child26Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard09Child26
