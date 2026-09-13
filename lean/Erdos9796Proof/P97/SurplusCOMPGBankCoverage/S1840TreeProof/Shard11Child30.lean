import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child30Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child30Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child30Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child30Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child30Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child30Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child30Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child30Child25

namespace Problem97.S1840TreeProof.Shard11Child30

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 646),
    (46, .prune .Q1 646),
    (51, .prune .u 624),
    (53, .prune .u 624),
    (54, .prune .Q1 646),
    (58, .prune .u 624),
    (60, .prune .u 624),
    (86, .prune .Q1 646),
    (102, .prune .Q1 646),
    (114, .prune .u 624),
    (116, .prune .u 624),
    (150, .prune .Q1 646),
    (166, .prune .Q1 646),
    (178, .prune .Q1 646),
    (180, .prune .Q1 646),
    (270, .prune .Q1 646),
    (275, Shard11Child30Child16.certificate),
    (277, Shard11Child30Child17.certificate),
    (278, .prune .Q1 646),
    (282, Shard11Child30Child19.certificate),
    (284, Shard11Child30Child20.certificate),
    (291, Shard11Child30Child21.certificate),
    (293, Shard11Child30Child22.certificate),
    (294, .prune .Q1 646),
    (298, Shard11Child30Child24.certificate),
    (300, Shard11Child30Child25.certificate),
    (305, .prune .u 624),
    (306, .prune .u 624),
    (308, .prune .u 624),
    (312, .prune .u 624),
    (390, .prune .Q1 646),
    (402, .prune .Q1 646),
    (404, .prune .Q1 646),
    (418, .prune .Q1 646),
    (420, .prune .Q1 646),
    (432, .prune .u 624)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 646), (.u, 624)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard11Child30Child16.checked, Shard11Child30Child17.checked, by decide, Shard11Child30Child19.checked, Shard11Child30Child20.checked, Shard11Child30Child21.checked, Shard11Child30Child22.checked, by decide, Shard11Child30Child24.checked, Shard11Child30Child25.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard11Child30
