import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child24Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child24Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child24Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child24Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child24Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child24Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child24Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child24Child28

namespace Problem97.S3864TreeProof.Shard12Child24

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 664),
    (29, .prune .u 664),
    (30, .prune .Q1 582),
    (46, .prune .Q1 582),
    (54, .prune .Q1 582),
    (58, .prune .u 664),
    (60, .prune .u 664),
    (78, .prune .Q1 582),
    (86, .prune .Q1 582),
    (90, .prune .Q1 582),
    (92, .prune .Q1 582),
    (142, .prune .Q1 582),
    (150, .prune .Q1 582),
    (154, .prune .u 664),
    (156, .prune .u 664),
    (267, Shard12Child24Child15.certificate),
    (269, Shard12Child24Child16.certificate),
    (270, .prune .Q1 582),
    (275, Shard12Child24Child18.certificate),
    (277, Shard12Child24Child19.certificate),
    (278, .prune .Q1 582),
    (281, .prune .u 664),
    (282, .prune .u 664),
    (284, .prune .u 664),
    (294, .prune .Q1 582),
    (298, Shard12Child24Child25.certificate),
    (300, Shard12Child24Child26.certificate),
    (306, Shard12Child24Child27.certificate),
    (308, Shard12Child24Child28.certificate),
    (312, .prune .u 664),
    (390, .prune .Q1 582),
    (394, .prune .u 664),
    (396, .prune .u 664),
    (402, .prune .u 664),
    (404, .prune .u 664),
    (408, .prune .u 664)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 582), (.u, 664)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard12Child24Child15.checked, Shard12Child24Child16.checked, by decide, Shard12Child24Child18.checked, Shard12Child24Child19.checked, by decide, by decide, by decide, by decide, by decide, Shard12Child24Child25.checked, Shard12Child24Child26.checked, Shard12Child24Child27.checked, Shard12Child24Child28.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard12Child24
