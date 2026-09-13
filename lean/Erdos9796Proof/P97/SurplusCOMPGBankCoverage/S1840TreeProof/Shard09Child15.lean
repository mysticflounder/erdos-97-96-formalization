import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15Child23
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15Child30

namespace Problem97.S1840TreeProof.Shard09Child15

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 531),
    (46, Shard09Child15Child01.certificate),
    (51, .prune .Q1 531),
    (53, .prune .Q1 531),
    (54, .prune .Q1 531),
    (58, .prune .Q1 531),
    (60, .prune .u 432),
    (86, .prune .Q1 531),
    (102, Shard09Child15Child08.certificate),
    (114, .prune .Q1 531),
    (116, .prune .u 432),
    (150, .prune .Q1 531),
    (166, .prune .u 432),
    (178, .prune .Q1 531),
    (180, .prune .u 432),
    (270, Shard09Child15Child15.certificate),
    (275, .prune .Q1 531),
    (277, .prune .Q1 531),
    (278, .prune .Q1 531),
    (282, .prune .Q1 531),
    (284, Shard09Child15Child20.certificate),
    (291, .prune .Q1 531),
    (293, Shard09Child15Child22.certificate),
    (294, Shard09Child15Child23.certificate),
    (298, Shard09Child15Child24.certificate),
    (300, Shard09Child15Child25.certificate),
    (305, .prune .Q1 531),
    (306, .prune .Q1 531),
    (308, .prune .u 432),
    (312, .prune .u 432),
    (390, Shard09Child15Child30.certificate),
    (402, .prune .Q1 531),
    (404, .prune .u 432),
    (418, .prune .u 432),
    (420, .prune .u 432),
    (432, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 531), (.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, Shard09Child15Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child15Child08.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child15Child15.checked, by decide, by decide, by decide, by decide, Shard09Child15Child20.checked, by decide, Shard09Child15Child22.checked, Shard09Child15Child23.checked, Shard09Child15Child24.checked, Shard09Child15Child25.checked, by decide, by decide, by decide, by decide, Shard09Child15Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard09Child15
