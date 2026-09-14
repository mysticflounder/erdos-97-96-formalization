import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child33
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16Child34

namespace Problem97.S3864TreeProof.Shard08Child16

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 525),
    (29, .prune .Q1 525),
    (30, .prune .Q1 525),
    (46, .prune .Q1 525),
    (54, Shard08Child16Child04.certificate),
    (58, .prune .u 344),
    (60, .prune .Q1 525),
    (78, .prune .Q1 525),
    (86, .prune .u 344),
    (90, .prune .u 344),
    (92, .prune .Q1 525),
    (142, .prune .Q1 525),
    (150, Shard08Child16Child12.certificate),
    (154, .prune .u 344),
    (156, .prune .Q1 525),
    (267, .prune .Q1 525),
    (269, .prune .Q1 525),
    (270, .prune .Q1 525),
    (275, Shard08Child16Child18.certificate),
    (277, .prune .Q1 525),
    (278, Shard08Child16Child20.certificate),
    (281, .prune .Q1 525),
    (282, .prune .u 344),
    (284, .prune .Q1 525),
    (294, Shard08Child16Child24.certificate),
    (298, Shard08Child16Child25.certificate),
    (300, .prune .Q1 525),
    (306, Shard08Child16Child27.certificate),
    (308, Shard08Child16Child28.certificate),
    (312, .prune .u 344),
    (390, Shard08Child16Child30.certificate),
    (394, Shard08Child16Child31.certificate),
    (396, .prune .Q1 525),
    (402, Shard08Child16Child33.certificate),
    (404, Shard08Child16Child34.certificate),
    (408, .prune .u 344)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 525), (.u, 344)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, Shard08Child16Child04.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child16Child12.checked, by decide, by decide, by decide, by decide, by decide, Shard08Child16Child18.checked, by decide, Shard08Child16Child20.checked, by decide, by decide, by decide, Shard08Child16Child24.checked, Shard08Child16Child25.checked, by decide, Shard08Child16Child27.checked, Shard08Child16Child28.checked, by decide, Shard08Child16Child30.checked, Shard08Child16Child31.checked, by decide, Shard08Child16Child33.checked, Shard08Child16Child34.checked, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard08Child16
