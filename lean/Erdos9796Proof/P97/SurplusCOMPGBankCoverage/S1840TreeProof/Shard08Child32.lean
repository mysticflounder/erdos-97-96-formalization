import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child23
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child32Child33

namespace Problem97.S1840TreeProof.Shard08Child32

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 660),
    (46, Shard08Child32Child01.certificate),
    (51, .prune .u 368),
    (53, .prune .Q1 660),
    (54, .prune .Q1 660),
    (58, .prune .u 368),
    (60, .prune .Q1 660),
    (86, .prune .Q1 660),
    (102, .prune .u 368),
    (114, .prune .u 368),
    (116, .prune .Q1 660),
    (150, .prune .Q1 660),
    (166, .prune .Q1 660),
    (178, .prune .Q1 660),
    (180, .prune .Q1 660),
    (270, Shard08Child32Child15.certificate),
    (275, Shard08Child32Child16.certificate),
    (277, .prune .Q1 660),
    (278, .prune .Q1 660),
    (282, Shard08Child32Child19.certificate),
    (284, .prune .Q1 660),
    (291, Shard08Child32Child21.certificate),
    (293, Shard08Child32Child22.certificate),
    (294, Shard08Child32Child23.certificate),
    (298, Shard08Child32Child24.certificate),
    (300, Shard08Child32Child25.certificate),
    (305, .prune .u 368),
    (306, .prune .u 368),
    (308, .prune .Q1 660),
    (312, .prune .u 368),
    (390, .prune .Q1 660),
    (402, .prune .Q1 660),
    (404, .prune .Q1 660),
    (418, Shard08Child32Child33.certificate),
    (420, .prune .Q1 660),
    (432, .prune .Q1 660)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 660), (.u, 368)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, Shard08Child32Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child32Child15.checked, Shard08Child32Child16.checked, by decide, by decide, Shard08Child32Child19.checked, by decide, Shard08Child32Child21.checked, Shard08Child32Child22.checked, Shard08Child32Child23.checked, Shard08Child32Child24.checked, Shard08Child32Child25.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child32Child33.checked, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard08Child32
