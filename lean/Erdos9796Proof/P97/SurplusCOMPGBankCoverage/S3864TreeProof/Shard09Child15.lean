import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15Child30

namespace Problem97.S3864TreeProof.Shard09Child15

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 523),
    (29, .prune .Q1 523),
    (30, .prune .Q1 523),
    (46, .prune .Q1 523),
    (54, Shard09Child15Child04.certificate),
    (58, .prune .Q1 523),
    (60, .prune .u 408),
    (78, .prune .Q1 523),
    (86, Shard09Child15Child08.certificate),
    (90, .prune .Q1 523),
    (92, .prune .u 408),
    (142, .prune .Q1 523),
    (150, .prune .u 408),
    (154, .prune .Q1 523),
    (156, .prune .u 408),
    (267, .prune .Q1 523),
    (269, .prune .Q1 523),
    (270, .prune .Q1 523),
    (275, .prune .Q1 523),
    (277, Shard09Child15Child19.certificate),
    (278, Shard09Child15Child20.certificate),
    (281, .prune .Q1 523),
    (282, .prune .Q1 523),
    (284, .prune .u 408),
    (294, Shard09Child15Child24.certificate),
    (298, .prune .Q1 523),
    (300, Shard09Child15Child26.certificate),
    (306, Shard09Child15Child27.certificate),
    (308, Shard09Child15Child28.certificate),
    (312, .prune .u 408),
    (390, Shard09Child15Child30.certificate),
    (394, .prune .Q1 523),
    (396, .prune .u 408),
    (402, .prune .u 408),
    (404, .prune .u 408),
    (408, .prune .u 408)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 523), (.u, 408)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, Shard09Child15Child04.checked, by decide, by decide, by decide, Shard09Child15Child08.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child15Child19.checked, Shard09Child15Child20.checked, by decide, by decide, by decide, Shard09Child15Child24.checked, by decide, Shard09Child15Child26.checked, Shard09Child15Child27.checked, Shard09Child15Child28.checked, by decide, Shard09Child15Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard09Child15
