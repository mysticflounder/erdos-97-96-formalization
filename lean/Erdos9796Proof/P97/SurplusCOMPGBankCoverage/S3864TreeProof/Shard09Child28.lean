import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28Child30

namespace Problem97.S3864TreeProof.Shard09Child28

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 408),
    (29, .prune .Q1 596),
    (30, .prune .Q1 596),
    (46, Shard09Child28Child03.certificate),
    (54, .prune .Q1 596),
    (58, .prune .u 408),
    (60, .prune .Q1 596),
    (78, .prune .Q1 596),
    (86, .prune .Q1 596),
    (90, .prune .Q1 596),
    (92, .prune .Q1 596),
    (142, .prune .u 408),
    (150, .prune .Q1 596),
    (154, .prune .u 408),
    (156, .prune .Q1 596),
    (267, Shard09Child28Child15.certificate),
    (269, Shard09Child28Child16.certificate),
    (270, Shard09Child28Child17.certificate),
    (275, Shard09Child28Child18.certificate),
    (277, .prune .Q1 596),
    (278, .prune .Q1 596),
    (281, .prune .u 408),
    (282, .prune .u 408),
    (284, .prune .Q1 596),
    (294, Shard09Child28Child24.certificate),
    (298, Shard09Child28Child25.certificate),
    (300, Shard09Child28Child26.certificate),
    (306, Shard09Child28Child27.certificate),
    (308, .prune .Q1 596),
    (312, .prune .u 408),
    (390, Shard09Child28Child30.certificate),
    (394, .prune .u 408),
    (396, .prune .u 408),
    (402, .prune .u 408),
    (404, .prune .Q1 596),
    (408, .prune .u 408)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 596), (.u, 408)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard09Child28Child03.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child28Child15.checked, Shard09Child28Child16.checked, Shard09Child28Child17.checked, Shard09Child28Child18.checked, by decide, by decide, by decide, by decide, by decide, Shard09Child28Child24.checked, Shard09Child28Child25.checked, Shard09Child28Child26.checked, Shard09Child28Child27.checked, by decide, by decide, Shard09Child28Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard09Child28
