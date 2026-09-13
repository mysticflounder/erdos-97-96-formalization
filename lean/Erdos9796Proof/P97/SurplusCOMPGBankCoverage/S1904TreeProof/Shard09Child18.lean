import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09Child18Child34

namespace Problem97.S1904TreeProof.Shard09Child18

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard09Child18Child00.certificate),
    (46, .prune .Q1 547),
    (51, .prune .Q1 547),
    (53, .prune .Q1 547),
    (54, .prune .Q1 547),
    (58, .prune .Q1 547),
    (60, .prune .u 432),
    (86, Shard09Child18Child07.certificate),
    (102, .prune .Q1 547),
    (114, .prune .Q1 547),
    (116, .prune .u 432),
    (150, .prune .u 432),
    (166, .prune .Q1 547),
    (178, .prune .Q1 547),
    (180, .prune .u 432),
    (270, Shard09Child18Child15.certificate),
    (275, .prune .Q1 547),
    (277, Shard09Child18Child17.certificate),
    (278, Shard09Child18Child18.certificate),
    (282, Shard09Child18Child19.certificate),
    (284, Shard09Child18Child20.certificate),
    (291, .prune .Q1 547),
    (293, .prune .Q1 547),
    (294, .prune .Q1 547),
    (298, .prune .Q1 547),
    (300, Shard09Child18Child25.certificate),
    (305, .prune .Q1 547),
    (306, .prune .Q1 547),
    (308, .prune .u 432),
    (312, .prune .u 432),
    (326, Shard09Child18Child30.certificate),
    (338, Shard09Child18Child31.certificate),
    (340, Shard09Child18Child32.certificate),
    (354, .prune .Q1 547),
    (356, Shard09Child18Child34.certificate),
    (368, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1904Fixed s1904Targets
      [.Q2, .Pw, .Pu, .s3, .s2, .s1] [(.Q1, 547), (.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard09Child18Child00.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child18Child07.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child18Child15.checked, by decide, Shard09Child18Child17.checked, Shard09Child18Child18.checked, Shard09Child18Child19.checked, Shard09Child18Child20.checked, by decide, by decide, by decide, by decide, Shard09Child18Child25.checked, by decide, by decide, by decide, by decide, Shard09Child18Child30.checked, Shard09Child18Child31.checked, Shard09Child18Child32.checked, by decide, Shard09Child18Child34.checked, by decide, True.intro⟩

end Problem97.S1904TreeProof.Shard09Child18
