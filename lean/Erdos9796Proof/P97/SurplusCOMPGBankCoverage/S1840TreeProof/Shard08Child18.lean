import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child18Child34

namespace Problem97.S1840TreeProof.Shard08Child18

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard08Child18Child00.certificate),
    (46, .prune .Q1 547),
    (51, .prune .Q1 547),
    (53, .prune .Q1 547),
    (54, .prune .Q1 547),
    (58, .prune .Q1 547),
    (60, .prune .u 368),
    (86, .prune .u 368),
    (102, .prune .Q1 547),
    (114, .prune .Q1 547),
    (116, .prune .u 368),
    (150, Shard08Child18Child11.certificate),
    (166, .prune .Q1 547),
    (178, .prune .Q1 547),
    (180, .prune .u 368),
    (270, Shard08Child18Child15.certificate),
    (275, .prune .Q1 547),
    (277, Shard08Child18Child17.certificate),
    (278, Shard08Child18Child18.certificate),
    (282, Shard08Child18Child19.certificate),
    (284, Shard08Child18Child20.certificate),
    (291, .prune .Q1 547),
    (293, .prune .Q1 547),
    (294, .prune .Q1 547),
    (298, .prune .Q1 547),
    (300, Shard08Child18Child25.certificate),
    (305, .prune .Q1 547),
    (306, .prune .Q1 547),
    (308, .prune .u 368),
    (312, .prune .u 368),
    (390, Shard08Child18Child30.certificate),
    (402, Shard08Child18Child31.certificate),
    (404, Shard08Child18Child32.certificate),
    (418, .prune .Q1 547),
    (420, Shard08Child18Child34.certificate),
    (432, .prune .u 368)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 547), (.u, 368)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard08Child18Child00.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child18Child11.checked, by decide, by decide, by decide, Shard08Child18Child15.checked, by decide, Shard08Child18Child17.checked, Shard08Child18Child18.checked, Shard08Child18Child19.checked, Shard08Child18Child20.checked, by decide, by decide, by decide, by decide, Shard08Child18Child25.checked, by decide, by decide, by decide, by decide, Shard08Child18Child30.checked, Shard08Child18Child31.checked, Shard08Child18Child32.checked, by decide, Shard08Child18Child34.checked, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard08Child18
