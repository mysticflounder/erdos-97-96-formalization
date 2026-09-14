import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18Child30

namespace Problem97.S3864TreeProof.Shard09Child18

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 531),
    (29, .prune .Q1 531),
    (30, .prune .Q1 531),
    (46, Shard09Child18Child03.certificate),
    (54, .prune .Q1 531),
    (58, .prune .Q1 531),
    (60, .prune .u 408),
    (78, Shard09Child18Child07.certificate),
    (86, .prune .Q1 531),
    (90, .prune .Q1 531),
    (92, .prune .u 408),
    (142, .prune .u 408),
    (150, .prune .Q1 531),
    (154, .prune .Q1 531),
    (156, .prune .u 408),
    (267, .prune .Q1 531),
    (269, Shard09Child18Child16.certificate),
    (270, Shard09Child18Child17.certificate),
    (275, .prune .Q1 531),
    (277, .prune .Q1 531),
    (278, .prune .Q1 531),
    (281, .prune .Q1 531),
    (282, .prune .Q1 531),
    (284, .prune .u 408),
    (294, Shard09Child18Child24.certificate),
    (298, Shard09Child18Child25.certificate),
    (300, Shard09Child18Child26.certificate),
    (306, .prune .Q1 531),
    (308, Shard09Child18Child28.certificate),
    (312, .prune .u 408),
    (390, Shard09Child18Child30.certificate),
    (394, .prune .u 408),
    (396, .prune .u 408),
    (402, .prune .Q1 531),
    (404, .prune .u 408),
    (408, .prune .u 408)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 531), (.u, 408)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard09Child18Child03.checked, by decide, by decide, by decide, Shard09Child18Child07.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child18Child16.checked, Shard09Child18Child17.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child18Child24.checked, Shard09Child18Child25.checked, Shard09Child18Child26.checked, by decide, Shard09Child18Child28.checked, by decide, Shard09Child18Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard09Child18
