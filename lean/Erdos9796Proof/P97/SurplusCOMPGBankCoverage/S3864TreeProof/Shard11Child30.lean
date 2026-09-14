import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child30Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child30Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child30Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child30Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child30Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child30Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child30Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child30Child28

namespace Problem97.S3864TreeProof.Shard11Child30

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 600),
    (29, .prune .u 600),
    (30, .prune .Q1 646),
    (46, .prune .Q1 646),
    (54, .prune .Q1 646),
    (58, .prune .u 600),
    (60, .prune .u 600),
    (78, .prune .Q1 646),
    (86, .prune .Q1 646),
    (90, .prune .u 600),
    (92, .prune .u 600),
    (142, .prune .Q1 646),
    (150, .prune .Q1 646),
    (154, .prune .Q1 646),
    (156, .prune .Q1 646),
    (267, Shard11Child30Child15.certificate),
    (269, Shard11Child30Child16.certificate),
    (270, .prune .Q1 646),
    (275, Shard11Child30Child18.certificate),
    (277, Shard11Child30Child19.certificate),
    (278, .prune .Q1 646),
    (281, .prune .u 600),
    (282, .prune .u 600),
    (284, .prune .u 600),
    (294, .prune .Q1 646),
    (298, Shard11Child30Child25.certificate),
    (300, Shard11Child30Child26.certificate),
    (306, Shard11Child30Child27.certificate),
    (308, Shard11Child30Child28.certificate),
    (312, .prune .u 600),
    (390, .prune .Q1 646),
    (394, .prune .Q1 646),
    (396, .prune .Q1 646),
    (402, .prune .Q1 646),
    (404, .prune .Q1 646),
    (408, .prune .u 600)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 646), (.u, 600)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard11Child30Child15.checked, Shard11Child30Child16.checked, by decide, Shard11Child30Child18.checked, Shard11Child30Child19.checked, by decide, by decide, by decide, by decide, by decide, Shard11Child30Child25.checked, Shard11Child30Child26.checked, Shard11Child30Child27.checked, Shard11Child30Child28.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard11Child30
