import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child33
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child30Child34

namespace Problem97.S1904TreeProof.Shard09Child30

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 646),
    (46, .prune .Q1 646),
    (51, .prune .u 432),
    (53, .prune .u 432),
    (54, .prune .Q1 646),
    (58, .prune .u 432),
    (60, .prune .u 432),
    (86, .prune .Q1 646),
    (102, .prune .Q1 646),
    (114, .prune .u 432),
    (116, .prune .u 432),
    (150, .prune .Q1 646),
    (166, .prune .Q1 646),
    (178, .prune .Q1 646),
    (180, .prune .Q1 646),
    (270, .prune .Q1 646),
    (275, Shard09Child30Child16.certificate),
    (277, Shard09Child30Child17.certificate),
    (278, .prune .Q1 646),
    (282, Shard09Child30Child19.certificate),
    (284, Shard09Child30Child20.certificate),
    (291, Shard09Child30Child21.certificate),
    (293, Shard09Child30Child22.certificate),
    (294, .prune .Q1 646),
    (298, Shard09Child30Child24.certificate),
    (300, Shard09Child30Child25.certificate),
    (305, .prune .u 432),
    (306, .prune .u 432),
    (308, .prune .u 432),
    (312, .prune .u 432),
    (326, .prune .Q1 646),
    (338, Shard09Child30Child31.certificate),
    (340, Shard09Child30Child32.certificate),
    (354, Shard09Child30Child33.certificate),
    (356, Shard09Child30Child34.certificate),
    (368, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1904Fixed s1904Targets
      [.Q2, .Pw, .Pu, .s3, .s2, .s1] [(.Q1, 646), (.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child30Child16.checked, Shard09Child30Child17.checked, by decide, Shard09Child30Child19.checked, Shard09Child30Child20.checked, Shard09Child30Child21.checked, Shard09Child30Child22.checked, by decide, Shard09Child30Child24.checked, Shard09Child30Child25.checked, by decide, by decide, by decide, by decide, by decide, Shard09Child30Child31.checked, Shard09Child30Child32.checked, Shard09Child30Child33.checked, Shard09Child30Child34.checked, by decide, True.intro⟩

end Problem97.S1904TreeProof.Shard09Child30
