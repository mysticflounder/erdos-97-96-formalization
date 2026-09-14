import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34Child31

namespace Problem97.S3864TreeProof.Shard08Child34

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 344),
    (29, .prune .Q1 660),
    (30, .prune .Q1 660),
    (46, Shard08Child34Child03.certificate),
    (54, .prune .Q1 660),
    (58, .prune .u 344),
    (60, .prune .Q1 660),
    (78, .prune .u 344),
    (86, .prune .Q1 660),
    (90, .prune .u 344),
    (92, .prune .Q1 660),
    (142, .prune .Q1 660),
    (150, .prune .Q1 660),
    (154, .prune .Q1 660),
    (156, .prune .Q1 660),
    (267, Shard08Child34Child15.certificate),
    (269, Shard08Child34Child16.certificate),
    (270, Shard08Child34Child17.certificate),
    (275, Shard08Child34Child18.certificate),
    (277, .prune .Q1 660),
    (278, .prune .Q1 660),
    (281, .prune .u 344),
    (282, .prune .u 344),
    (284, .prune .Q1 660),
    (294, Shard08Child34Child24.certificate),
    (298, Shard08Child34Child25.certificate),
    (300, Shard08Child34Child26.certificate),
    (306, Shard08Child34Child27.certificate),
    (308, .prune .Q1 660),
    (312, .prune .u 344),
    (390, .prune .Q1 660),
    (394, Shard08Child34Child31.certificate),
    (396, .prune .Q1 660),
    (402, .prune .Q1 660),
    (404, .prune .Q1 660),
    (408, .prune .Q1 660)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 660), (.u, 344)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard08Child34Child03.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child34Child15.checked, Shard08Child34Child16.checked, Shard08Child34Child17.checked, Shard08Child34Child18.checked, by decide, by decide, by decide, by decide, by decide, Shard08Child34Child24.checked, Shard08Child34Child25.checked, Shard08Child34Child26.checked, Shard08Child34Child27.checked, by decide, by decide, by decide, Shard08Child34Child31.checked, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard08Child34
