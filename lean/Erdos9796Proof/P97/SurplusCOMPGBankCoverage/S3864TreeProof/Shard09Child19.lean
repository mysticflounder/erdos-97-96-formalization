import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19Child30

namespace Problem97.S3864TreeProof.Shard09Child19

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 533),
    (29, .prune .Q1 533),
    (30, .prune .Q1 533),
    (46, Shard09Child19Child03.certificate),
    (54, .prune .Q1 533),
    (58, .prune .u 408),
    (60, .prune .Q1 533),
    (78, Shard09Child19Child07.certificate),
    (86, .prune .Q1 533),
    (90, .prune .u 408),
    (92, .prune .Q1 533),
    (142, .prune .u 408),
    (150, .prune .Q1 533),
    (154, .prune .u 408),
    (156, .prune .Q1 533),
    (267, Shard09Child19Child15.certificate),
    (269, .prune .Q1 533),
    (270, Shard09Child19Child17.certificate),
    (275, .prune .Q1 533),
    (277, .prune .Q1 533),
    (278, .prune .Q1 533),
    (281, .prune .Q1 533),
    (282, .prune .u 408),
    (284, .prune .Q1 533),
    (294, Shard09Child19Child24.certificate),
    (298, Shard09Child19Child25.certificate),
    (300, Shard09Child19Child26.certificate),
    (306, Shard09Child19Child27.certificate),
    (308, .prune .Q1 533),
    (312, .prune .u 408),
    (390, Shard09Child19Child30.certificate),
    (394, .prune .u 408),
    (396, .prune .u 408),
    (402, .prune .u 408),
    (404, .prune .Q1 533),
    (408, .prune .u 408)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 533), (.u, 408)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard09Child19Child03.checked, by decide, by decide, by decide, Shard09Child19Child07.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child19Child15.checked, by decide, Shard09Child19Child17.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child19Child24.checked, Shard09Child19Child25.checked, Shard09Child19Child26.checked, Shard09Child19Child27.checked, by decide, by decide, Shard09Child19Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard09Child19
