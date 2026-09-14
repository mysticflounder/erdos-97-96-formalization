import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19Child33

namespace Problem97.S3864TreeProof.Shard08Child19

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 533),
    (29, .prune .Q1 533),
    (30, .prune .Q1 533),
    (46, Shard08Child19Child03.certificate),
    (54, .prune .Q1 533),
    (58, .prune .u 344),
    (60, .prune .Q1 533),
    (78, .prune .u 344),
    (86, .prune .Q1 533),
    (90, .prune .u 344),
    (92, .prune .Q1 533),
    (142, Shard08Child19Child11.certificate),
    (150, .prune .Q1 533),
    (154, .prune .u 344),
    (156, .prune .Q1 533),
    (267, Shard08Child19Child15.certificate),
    (269, .prune .Q1 533),
    (270, Shard08Child19Child17.certificate),
    (275, .prune .Q1 533),
    (277, .prune .Q1 533),
    (278, .prune .Q1 533),
    (281, .prune .Q1 533),
    (282, .prune .u 344),
    (284, .prune .Q1 533),
    (294, Shard08Child19Child24.certificate),
    (298, Shard08Child19Child25.certificate),
    (300, Shard08Child19Child26.certificate),
    (306, Shard08Child19Child27.certificate),
    (308, .prune .Q1 533),
    (312, .prune .u 344),
    (390, Shard08Child19Child30.certificate),
    (394, Shard08Child19Child31.certificate),
    (396, Shard08Child19Child32.certificate),
    (402, Shard08Child19Child33.certificate),
    (404, .prune .Q1 533),
    (408, .prune .u 344)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 533), (.u, 344)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard08Child19Child03.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child19Child11.checked, by decide, by decide, by decide, Shard08Child19Child15.checked, by decide, Shard08Child19Child17.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child19Child24.checked, Shard08Child19Child25.checked, Shard08Child19Child26.checked, Shard08Child19Child27.checked, by decide, by decide, Shard08Child19Child30.checked, Shard08Child19Child31.checked, Shard08Child19Child32.checked, Shard08Child19Child33.checked, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard08Child19
