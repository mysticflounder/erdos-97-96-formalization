import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child23
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25Child30

namespace Problem97.S1840TreeProof.Shard09Child25

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 594),
    (46, Shard09Child25Child01.certificate),
    (51, .prune .Q1 594),
    (53, .prune .u 432),
    (54, .prune .Q1 594),
    (58, .prune .Q1 594),
    (60, .prune .u 432),
    (86, .prune .Q1 594),
    (102, .prune .Q1 594),
    (114, .prune .Q1 594),
    (116, .prune .Q1 594),
    (150, .prune .Q1 594),
    (166, .prune .u 432),
    (178, .prune .Q1 594),
    (180, .prune .u 432),
    (270, Shard09Child25Child15.certificate),
    (275, .prune .Q1 594),
    (277, Shard09Child25Child17.certificate),
    (278, .prune .Q1 594),
    (282, .prune .Q1 594),
    (284, Shard09Child25Child20.certificate),
    (291, Shard09Child25Child21.certificate),
    (293, Shard09Child25Child22.certificate),
    (294, Shard09Child25Child23.certificate),
    (298, Shard09Child25Child24.certificate),
    (300, Shard09Child25Child25.certificate),
    (305, .prune .u 432),
    (306, .prune .Q1 594),
    (308, .prune .u 432),
    (312, .prune .u 432),
    (390, Shard09Child25Child30.certificate),
    (402, .prune .Q1 594),
    (404, .prune .u 432),
    (418, .prune .u 432),
    (420, .prune .u 432),
    (432, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 594), (.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, Shard09Child25Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child25Child15.checked, by decide, Shard09Child25Child17.checked, by decide, by decide, Shard09Child25Child20.checked, Shard09Child25Child21.checked, Shard09Child25Child22.checked, Shard09Child25Child23.checked, Shard09Child25Child24.checked, Shard09Child25Child25.checked, by decide, by decide, by decide, by decide, Shard09Child25Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard09Child25
