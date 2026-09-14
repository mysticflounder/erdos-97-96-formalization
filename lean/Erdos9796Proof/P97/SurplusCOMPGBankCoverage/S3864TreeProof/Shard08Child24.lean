import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child33
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24Child34

namespace Problem97.S3864TreeProof.Shard08Child24

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 344),
    (29, .prune .u 344),
    (30, .prune .Q1 582),
    (46, .prune .Q1 582),
    (54, .prune .Q1 582),
    (58, .prune .u 344),
    (60, .prune .u 344),
    (78, .prune .Q1 582),
    (86, .prune .Q1 582),
    (90, .prune .Q1 582),
    (92, .prune .Q1 582),
    (142, .prune .Q1 582),
    (150, .prune .Q1 582),
    (154, .prune .u 344),
    (156, .prune .u 344),
    (267, Shard08Child24Child15.certificate),
    (269, Shard08Child24Child16.certificate),
    (270, .prune .Q1 582),
    (275, Shard08Child24Child18.certificate),
    (277, Shard08Child24Child19.certificate),
    (278, .prune .Q1 582),
    (281, .prune .u 344),
    (282, .prune .u 344),
    (284, .prune .u 344),
    (294, .prune .Q1 582),
    (298, Shard08Child24Child25.certificate),
    (300, Shard08Child24Child26.certificate),
    (306, Shard08Child24Child27.certificate),
    (308, Shard08Child24Child28.certificate),
    (312, .prune .u 344),
    (390, .prune .Q1 582),
    (394, Shard08Child24Child31.certificate),
    (396, Shard08Child24Child32.certificate),
    (402, Shard08Child24Child33.certificate),
    (404, Shard08Child24Child34.certificate),
    (408, .prune .u 344)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 582), (.u, 344)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child24Child15.checked, Shard08Child24Child16.checked, by decide, Shard08Child24Child18.checked, Shard08Child24Child19.checked, by decide, by decide, by decide, by decide, by decide, Shard08Child24Child25.checked, Shard08Child24Child26.checked, Shard08Child24Child27.checked, Shard08Child24Child28.checked, by decide, by decide, Shard08Child24Child31.checked, Shard08Child24Child32.checked, Shard08Child24Child33.checked, Shard08Child24Child34.checked, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard08Child24
