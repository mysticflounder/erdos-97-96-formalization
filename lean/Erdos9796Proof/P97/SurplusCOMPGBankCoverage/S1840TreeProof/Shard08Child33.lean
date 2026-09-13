import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child33Child32

namespace Problem97.S1840TreeProof.Shard08Child33

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard08Child33Child00.certificate),
    (46, .prune .Q1 674),
    (51, .prune .Q1 674),
    (53, .prune .u 368),
    (54, .prune .Q1 674),
    (58, .prune .Q1 674),
    (60, .prune .u 368),
    (86, .prune .u 368),
    (102, .prune .Q1 674),
    (114, .prune .Q1 674),
    (116, .prune .u 368),
    (150, .prune .Q1 674),
    (166, .prune .Q1 674),
    (178, .prune .Q1 674),
    (180, .prune .Q1 674),
    (270, Shard08Child33Child15.certificate),
    (275, Shard08Child33Child16.certificate),
    (277, Shard08Child33Child17.certificate),
    (278, Shard08Child33Child18.certificate),
    (282, Shard08Child33Child19.certificate),
    (284, Shard08Child33Child20.certificate),
    (291, .prune .Q1 674),
    (293, Shard08Child33Child22.certificate),
    (294, .prune .Q1 674),
    (298, .prune .Q1 674),
    (300, Shard08Child33Child25.certificate),
    (305, .prune .u 368),
    (306, .prune .Q1 674),
    (308, .prune .u 368),
    (312, .prune .u 368),
    (390, .prune .Q1 674),
    (402, .prune .Q1 674),
    (404, Shard08Child33Child32.certificate),
    (418, .prune .Q1 674),
    (420, .prune .Q1 674),
    (432, .prune .Q1 674)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 674), (.u, 368)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard08Child33Child00.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child33Child15.checked, Shard08Child33Child16.checked, Shard08Child33Child17.checked, Shard08Child33Child18.checked, Shard08Child33Child19.checked, Shard08Child33Child20.checked, by decide, Shard08Child33Child22.checked, by decide, by decide, Shard08Child33Child25.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child33Child32.checked, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard08Child33
