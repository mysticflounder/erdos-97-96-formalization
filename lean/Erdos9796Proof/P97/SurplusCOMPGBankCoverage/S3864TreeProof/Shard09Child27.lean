import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27Child30

namespace Problem97.S3864TreeProof.Shard09Child27

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 594),
    (29, .prune .u 408),
    (30, .prune .Q1 594),
    (46, Shard09Child27Child03.certificate),
    (54, .prune .Q1 594),
    (58, .prune .Q1 594),
    (60, .prune .u 408),
    (78, .prune .Q1 594),
    (86, .prune .Q1 594),
    (90, .prune .Q1 594),
    (92, .prune .Q1 594),
    (142, .prune .u 408),
    (150, .prune .Q1 594),
    (154, .prune .Q1 594),
    (156, .prune .u 408),
    (267, Shard09Child27Child15.certificate),
    (269, Shard09Child27Child16.certificate),
    (270, Shard09Child27Child17.certificate),
    (275, .prune .Q1 594),
    (277, Shard09Child27Child19.certificate),
    (278, .prune .Q1 594),
    (281, .prune .u 408),
    (282, .prune .Q1 594),
    (284, .prune .u 408),
    (294, Shard09Child27Child24.certificate),
    (298, Shard09Child27Child25.certificate),
    (300, Shard09Child27Child26.certificate),
    (306, .prune .Q1 594),
    (308, Shard09Child27Child28.certificate),
    (312, .prune .u 408),
    (390, Shard09Child27Child30.certificate),
    (394, .prune .u 408),
    (396, .prune .u 408),
    (402, .prune .Q1 594),
    (404, .prune .u 408),
    (408, .prune .u 408)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 594), (.u, 408)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard09Child27Child03.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child27Child15.checked, Shard09Child27Child16.checked, Shard09Child27Child17.checked, by decide, Shard09Child27Child19.checked, by decide, by decide, by decide, by decide, Shard09Child27Child24.checked, Shard09Child27Child25.checked, Shard09Child27Child26.checked, by decide, Shard09Child27Child28.checked, by decide, Shard09Child27Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard09Child27
