import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child33
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child24Child34

namespace Problem97.S1840TreeProof.Shard08Child24

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 582),
    (46, .prune .Q1 582),
    (51, .prune .u 368),
    (53, .prune .u 368),
    (54, .prune .Q1 582),
    (58, .prune .u 368),
    (60, .prune .u 368),
    (86, .prune .Q1 582),
    (102, .prune .Q1 582),
    (114, .prune .Q1 582),
    (116, .prune .Q1 582),
    (150, .prune .Q1 582),
    (166, .prune .Q1 582),
    (178, .prune .u 368),
    (180, .prune .u 368),
    (270, .prune .Q1 582),
    (275, Shard08Child24Child16.certificate),
    (277, Shard08Child24Child17.certificate),
    (278, .prune .Q1 582),
    (282, Shard08Child24Child19.certificate),
    (284, Shard08Child24Child20.certificate),
    (291, Shard08Child24Child21.certificate),
    (293, Shard08Child24Child22.certificate),
    (294, .prune .Q1 582),
    (298, Shard08Child24Child24.certificate),
    (300, Shard08Child24Child25.certificate),
    (305, .prune .u 368),
    (306, .prune .u 368),
    (308, .prune .u 368),
    (312, .prune .u 368),
    (390, .prune .Q1 582),
    (402, Shard08Child24Child31.certificate),
    (404, Shard08Child24Child32.certificate),
    (418, Shard08Child24Child33.certificate),
    (420, Shard08Child24Child34.certificate),
    (432, .prune .u 368)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 582), (.u, 368)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child24Child16.checked, Shard08Child24Child17.checked, by decide, Shard08Child24Child19.checked, Shard08Child24Child20.checked, Shard08Child24Child21.checked, Shard08Child24Child22.checked, by decide, Shard08Child24Child24.checked, Shard08Child24Child25.checked, by decide, by decide, by decide, by decide, by decide, Shard08Child24Child31.checked, Shard08Child24Child32.checked, Shard08Child24Child33.checked, Shard08Child24Child34.checked, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard08Child24
