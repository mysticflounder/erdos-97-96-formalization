import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28Child30

namespace Problem97.S1840TreeProof.Shard09Child28

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard09Child28Child00.certificate),
    (46, .prune .Q1 612),
    (51, .prune .u 432),
    (53, .prune .Q1 612),
    (54, .prune .Q1 612),
    (58, .prune .u 432),
    (60, .prune .Q1 612),
    (86, .prune .Q1 612),
    (102, .prune .Q1 612),
    (114, .prune .Q1 612),
    (116, .prune .Q1 612),
    (150, .prune .u 432),
    (166, .prune .Q1 612),
    (178, .prune .u 432),
    (180, .prune .Q1 612),
    (270, Shard09Child28Child15.certificate),
    (275, Shard09Child28Child16.certificate),
    (277, Shard09Child28Child17.certificate),
    (278, Shard09Child28Child18.certificate),
    (282, Shard09Child28Child19.certificate),
    (284, Shard09Child28Child20.certificate),
    (291, Shard09Child28Child21.certificate),
    (293, .prune .Q1 612),
    (294, .prune .Q1 612),
    (298, Shard09Child28Child24.certificate),
    (300, .prune .Q1 612),
    (305, .prune .u 432),
    (306, .prune .u 432),
    (308, .prune .Q1 612),
    (312, .prune .u 432),
    (390, Shard09Child28Child30.certificate),
    (402, .prune .u 432),
    (404, .prune .u 432),
    (418, .prune .u 432),
    (420, .prune .Q1 612),
    (432, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 612), (.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard09Child28Child00.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child28Child15.checked, Shard09Child28Child16.checked, Shard09Child28Child17.checked, Shard09Child28Child18.checked, Shard09Child28Child19.checked, Shard09Child28Child20.checked, Shard09Child28Child21.checked, by decide, by decide, Shard09Child28Child24.checked, by decide, by decide, by decide, by decide, by decide, Shard09Child28Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard09Child28
