import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26Child30

namespace Problem97.S3864TreeProof.Shard09Child26

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 408),
    (29, .prune .Q1 588),
    (30, .prune .Q1 588),
    (46, .prune .Q1 588),
    (54, Shard09Child26Child04.certificate),
    (58, .prune .u 408),
    (60, .prune .Q1 588),
    (78, .prune .Q1 588),
    (86, .prune .Q1 588),
    (90, .prune .Q1 588),
    (92, .prune .Q1 588),
    (142, .prune .Q1 588),
    (150, .prune .u 408),
    (154, .prune .u 408),
    (156, .prune .Q1 588),
    (267, Shard09Child26Child15.certificate),
    (269, .prune .Q1 588),
    (270, .prune .Q1 588),
    (275, Shard09Child26Child18.certificate),
    (277, Shard09Child26Child19.certificate),
    (278, Shard09Child26Child20.certificate),
    (281, .prune .u 408),
    (282, .prune .u 408),
    (284, .prune .Q1 588),
    (294, Shard09Child26Child24.certificate),
    (298, Shard09Child26Child25.certificate),
    (300, .prune .Q1 588),
    (306, Shard09Child26Child27.certificate),
    (308, Shard09Child26Child28.certificate),
    (312, .prune .u 408),
    (390, Shard09Child26Child30.certificate),
    (394, .prune .u 408),
    (396, .prune .Q1 588),
    (402, .prune .u 408),
    (404, .prune .u 408),
    (408, .prune .u 408)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 588), (.u, 408)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, Shard09Child26Child04.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child26Child15.checked, by decide, by decide, Shard09Child26Child18.checked, Shard09Child26Child19.checked, Shard09Child26Child20.checked, by decide, by decide, by decide, Shard09Child26Child24.checked, Shard09Child26Child25.checked, by decide, Shard09Child26Child27.checked, Shard09Child26Child28.checked, by decide, Shard09Child26Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard09Child26
