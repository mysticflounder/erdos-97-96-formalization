import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18Child34

namespace Problem97.S3864TreeProof.Shard08Child18

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 531),
    (29, .prune .Q1 531),
    (30, .prune .Q1 531),
    (46, Shard08Child18Child03.certificate),
    (54, .prune .Q1 531),
    (58, .prune .Q1 531),
    (60, .prune .u 344),
    (78, .prune .u 344),
    (86, .prune .Q1 531),
    (90, .prune .Q1 531),
    (92, .prune .u 344),
    (142, Shard08Child18Child11.certificate),
    (150, .prune .Q1 531),
    (154, .prune .Q1 531),
    (156, .prune .u 344),
    (267, .prune .Q1 531),
    (269, Shard08Child18Child16.certificate),
    (270, Shard08Child18Child17.certificate),
    (275, .prune .Q1 531),
    (277, .prune .Q1 531),
    (278, .prune .Q1 531),
    (281, .prune .Q1 531),
    (282, .prune .Q1 531),
    (284, .prune .u 344),
    (294, Shard08Child18Child24.certificate),
    (298, Shard08Child18Child25.certificate),
    (300, Shard08Child18Child26.certificate),
    (306, .prune .Q1 531),
    (308, Shard08Child18Child28.certificate),
    (312, .prune .u 344),
    (390, Shard08Child18Child30.certificate),
    (394, Shard08Child18Child31.certificate),
    (396, Shard08Child18Child32.certificate),
    (402, .prune .Q1 531),
    (404, Shard08Child18Child34.certificate),
    (408, .prune .u 344)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 531), (.u, 344)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard08Child18Child03.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child18Child11.checked, by decide, by decide, by decide, by decide, Shard08Child18Child16.checked, Shard08Child18Child17.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child18Child24.checked, Shard08Child18Child25.checked, Shard08Child18Child26.checked, by decide, Shard08Child18Child28.checked, by decide, Shard08Child18Child30.checked, Shard08Child18Child31.checked, Shard08Child18Child32.checked, by decide, Shard08Child18Child34.checked, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard08Child18
