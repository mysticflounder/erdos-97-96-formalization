import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19Child30

namespace Problem97.S1840TreeProof.Shard09Child19

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard09Child19Child00.certificate),
    (46, .prune .Q1 549),
    (51, .prune .Q1 549),
    (53, .prune .Q1 549),
    (54, .prune .Q1 549),
    (58, .prune .u 432),
    (60, .prune .Q1 549),
    (86, Shard09Child19Child07.certificate),
    (102, .prune .Q1 549),
    (114, .prune .u 432),
    (116, .prune .Q1 549),
    (150, .prune .u 432),
    (166, .prune .Q1 549),
    (178, .prune .u 432),
    (180, .prune .Q1 549),
    (270, Shard09Child19Child15.certificate),
    (275, Shard09Child19Child16.certificate),
    (277, .prune .Q1 549),
    (278, Shard09Child19Child18.certificate),
    (282, Shard09Child19Child19.certificate),
    (284, Shard09Child19Child20.certificate),
    (291, .prune .Q1 549),
    (293, .prune .Q1 549),
    (294, .prune .Q1 549),
    (298, Shard09Child19Child24.certificate),
    (300, .prune .Q1 549),
    (305, .prune .Q1 549),
    (306, .prune .u 432),
    (308, .prune .Q1 549),
    (312, .prune .u 432),
    (390, Shard09Child19Child30.certificate),
    (402, .prune .u 432),
    (404, .prune .u 432),
    (418, .prune .u 432),
    (420, .prune .Q1 549),
    (432, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 549), (.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard09Child19Child00.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child19Child07.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child19Child15.checked, Shard09Child19Child16.checked, by decide, Shard09Child19Child18.checked, Shard09Child19Child19.checked, Shard09Child19Child20.checked, by decide, by decide, by decide, Shard09Child19Child24.checked, by decide, by decide, by decide, by decide, by decide, Shard09Child19Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard09Child19
