import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33Child32

namespace Problem97.S3864TreeProof.Shard08Child33

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 658),
    (29, .prune .u 344),
    (30, .prune .Q1 658),
    (46, Shard08Child33Child03.certificate),
    (54, .prune .Q1 658),
    (58, .prune .Q1 658),
    (60, .prune .u 344),
    (78, .prune .u 344),
    (86, .prune .Q1 658),
    (90, .prune .Q1 658),
    (92, .prune .u 344),
    (142, .prune .Q1 658),
    (150, .prune .Q1 658),
    (154, .prune .Q1 658),
    (156, .prune .Q1 658),
    (267, Shard08Child33Child15.certificate),
    (269, Shard08Child33Child16.certificate),
    (270, Shard08Child33Child17.certificate),
    (275, .prune .Q1 658),
    (277, Shard08Child33Child19.certificate),
    (278, .prune .Q1 658),
    (281, .prune .u 344),
    (282, .prune .Q1 658),
    (284, .prune .u 344),
    (294, Shard08Child33Child24.certificate),
    (298, Shard08Child33Child25.certificate),
    (300, Shard08Child33Child26.certificate),
    (306, .prune .Q1 658),
    (308, Shard08Child33Child28.certificate),
    (312, .prune .u 344),
    (390, .prune .Q1 658),
    (394, .prune .Q1 658),
    (396, Shard08Child33Child32.certificate),
    (402, .prune .Q1 658),
    (404, .prune .Q1 658),
    (408, .prune .Q1 658)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q2, .Pw, .Pu, .s2, .s1, .s3] [(.Q1, 658), (.u, 344)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard08Child33Child03.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child33Child15.checked, Shard08Child33Child16.checked, Shard08Child33Child17.checked, by decide, Shard08Child33Child19.checked, by decide, by decide, by decide, by decide, Shard08Child33Child24.checked, Shard08Child33Child25.checked, Shard08Child33Child26.checked, by decide, Shard08Child33Child28.checked, by decide, by decide, by decide, Shard08Child33Child32.checked, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard08Child33
