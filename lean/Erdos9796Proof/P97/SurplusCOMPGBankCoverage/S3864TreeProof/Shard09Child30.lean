import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child30Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child30Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child30Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child30Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child30Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child30Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child30Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child30Child28

namespace Problem97.S3864TreeProof.Shard09Child30

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 408),
    (29, .prune .u 408),
    (30, .prune .Q1 646),
    (46, .prune .Q1 646),
    (54, .prune .Q1 646),
    (58, .prune .u 408),
    (60, .prune .u 408),
    (78, .prune .Q1 646),
    (86, .prune .Q1 646),
    (90, .prune .u 408),
    (92, .prune .u 408),
    (142, .prune .Q1 646),
    (150, .prune .Q1 646),
    (154, .prune .Q1 646),
    (156, .prune .Q1 646),
    (267, Shard09Child30Child15.certificate),
    (269, Shard09Child30Child16.certificate),
    (270, .prune .Q1 646),
    (275, Shard09Child30Child18.certificate),
    (277, Shard09Child30Child19.certificate),
    (278, .prune .Q1 646),
    (281, .prune .u 408),
    (282, .prune .u 408),
    (284, .prune .u 408),
    (294, .prune .Q1 646),
    (298, Shard09Child30Child25.certificate),
    (300, Shard09Child30Child26.certificate),
    (306, Shard09Child30Child27.certificate),
    (308, Shard09Child30Child28.certificate),
    (312, .prune .u 408),
    (390, .prune .Q1 646),
    (394, .prune .Q1 646),
    (396, .prune .Q1 646),
    (402, .prune .Q1 646),
    (404, .prune .Q1 646),
    (408, .prune .u 408)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 646), (.u, 408)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child30Child15.checked, Shard09Child30Child16.checked, by decide, Shard09Child30Child18.checked, Shard09Child30Child19.checked, by decide, by decide, by decide, by decide, by decide, Shard09Child30Child25.checked, Shard09Child30Child26.checked, Shard09Child30Child27.checked, Shard09Child30Child28.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard09Child30
