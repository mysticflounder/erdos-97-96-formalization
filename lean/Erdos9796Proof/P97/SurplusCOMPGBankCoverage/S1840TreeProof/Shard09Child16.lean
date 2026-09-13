import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16Child23
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16Child30

namespace Problem97.S1840TreeProof.Shard09Child16

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 533),
    (46, Shard09Child16Child01.certificate),
    (51, .prune .Q1 533),
    (53, .prune .Q1 533),
    (54, .prune .Q1 533),
    (58, .prune .u 432),
    (60, .prune .Q1 533),
    (86, .prune .Q1 533),
    (102, Shard09Child16Child08.certificate),
    (114, .prune .u 432),
    (116, .prune .Q1 533),
    (150, .prune .Q1 533),
    (166, .prune .u 432),
    (178, .prune .u 432),
    (180, .prune .Q1 533),
    (270, Shard09Child16Child15.certificate),
    (275, .prune .Q1 533),
    (277, .prune .Q1 533),
    (278, .prune .Q1 533),
    (282, Shard09Child16Child19.certificate),
    (284, .prune .Q1 533),
    (291, Shard09Child16Child21.certificate),
    (293, .prune .Q1 533),
    (294, Shard09Child16Child23.certificate),
    (298, Shard09Child16Child24.certificate),
    (300, Shard09Child16Child25.certificate),
    (305, .prune .Q1 533),
    (306, .prune .u 432),
    (308, .prune .Q1 533),
    (312, .prune .u 432),
    (390, Shard09Child16Child30.certificate),
    (402, .prune .u 432),
    (404, .prune .Q1 533),
    (418, .prune .u 432),
    (420, .prune .u 432),
    (432, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 533), (.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, Shard09Child16Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child16Child08.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child16Child15.checked, by decide, by decide, by decide, Shard09Child16Child19.checked, by decide, Shard09Child16Child21.checked, by decide, Shard09Child16Child23.checked, Shard09Child16Child24.checked, Shard09Child16Child25.checked, by decide, by decide, by decide, by decide, Shard09Child16Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard09Child16
