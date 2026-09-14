import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32Child33

namespace Problem97.S3864TreeProof.Shard08Child32

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 344),
    (29, .prune .Q1 652),
    (30, .prune .Q1 652),
    (46, .prune .Q1 652),
    (54, Shard08Child32Child04.certificate),
    (58, .prune .u 344),
    (60, .prune .Q1 652),
    (78, .prune .Q1 652),
    (86, .prune .u 344),
    (90, .prune .u 344),
    (92, .prune .Q1 652),
    (142, .prune .Q1 652),
    (150, .prune .Q1 652),
    (154, .prune .Q1 652),
    (156, .prune .Q1 652),
    (267, Shard08Child32Child15.certificate),
    (269, .prune .Q1 652),
    (270, .prune .Q1 652),
    (275, Shard08Child32Child18.certificate),
    (277, Shard08Child32Child19.certificate),
    (278, Shard08Child32Child20.certificate),
    (281, .prune .u 344),
    (282, .prune .u 344),
    (284, .prune .Q1 652),
    (294, Shard08Child32Child24.certificate),
    (298, Shard08Child32Child25.certificate),
    (300, .prune .Q1 652),
    (306, Shard08Child32Child27.certificate),
    (308, Shard08Child32Child28.certificate),
    (312, .prune .u 344),
    (390, .prune .Q1 652),
    (394, .prune .Q1 652),
    (396, .prune .Q1 652),
    (402, Shard08Child32Child33.certificate),
    (404, .prune .Q1 652),
    (408, .prune .Q1 652)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 652), (.u, 344)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, Shard08Child32Child04.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child32Child15.checked, by decide, by decide, Shard08Child32Child18.checked, Shard08Child32Child19.checked, Shard08Child32Child20.checked, by decide, by decide, by decide, Shard08Child32Child24.checked, Shard08Child32Child25.checked, by decide, Shard08Child32Child27.checked, Shard08Child32Child28.checked, by decide, by decide, by decide, by decide, Shard08Child32Child33.checked, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard08Child32
