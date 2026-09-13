import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child19Child33

namespace Problem97.S1840TreeProof.Shard08Child19

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard08Child19Child00.certificate),
    (46, .prune .Q1 549),
    (51, .prune .Q1 549),
    (53, .prune .Q1 549),
    (54, .prune .Q1 549),
    (58, .prune .u 368),
    (60, .prune .Q1 549),
    (86, .prune .u 368),
    (102, .prune .Q1 549),
    (114, .prune .u 368),
    (116, .prune .Q1 549),
    (150, Shard08Child19Child11.certificate),
    (166, .prune .Q1 549),
    (178, .prune .u 368),
    (180, .prune .Q1 549),
    (270, Shard08Child19Child15.certificate),
    (275, Shard08Child19Child16.certificate),
    (277, .prune .Q1 549),
    (278, Shard08Child19Child18.certificate),
    (282, Shard08Child19Child19.certificate),
    (284, Shard08Child19Child20.certificate),
    (291, .prune .Q1 549),
    (293, .prune .Q1 549),
    (294, .prune .Q1 549),
    (298, Shard08Child19Child24.certificate),
    (300, .prune .Q1 549),
    (305, .prune .Q1 549),
    (306, .prune .u 368),
    (308, .prune .Q1 549),
    (312, .prune .u 368),
    (390, Shard08Child19Child30.certificate),
    (402, Shard08Child19Child31.certificate),
    (404, Shard08Child19Child32.certificate),
    (418, Shard08Child19Child33.certificate),
    (420, .prune .Q1 549),
    (432, .prune .u 368)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 549), (.u, 368)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard08Child19Child00.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child19Child11.checked, by decide, by decide, by decide, Shard08Child19Child15.checked, Shard08Child19Child16.checked, by decide, Shard08Child19Child18.checked, Shard08Child19Child19.checked, Shard08Child19Child20.checked, by decide, by decide, by decide, Shard08Child19Child24.checked, by decide, by decide, by decide, by decide, by decide, Shard08Child19Child30.checked, Shard08Child19Child31.checked, Shard08Child19Child32.checked, Shard08Child19Child33.checked, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard08Child19
