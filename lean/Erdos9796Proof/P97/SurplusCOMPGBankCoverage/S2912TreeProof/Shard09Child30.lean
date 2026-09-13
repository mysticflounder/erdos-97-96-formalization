import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child33
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30Child34

namespace Problem97.S2912TreeProof.Shard09Child30

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 646),
    (43, .prune .u 424),
    (45, .prune .u 424),
    (46, .prune .Q1 646),
    (54, .prune .Q1 646),
    (58, .prune .u 424),
    (60, .prune .u 424),
    (78, .prune .Q1 646),
    (102, .prune .Q1 646),
    (106, .prune .u 424),
    (108, .prune .u 424),
    (142, .prune .Q1 646),
    (166, .prune .Q1 646),
    (170, .prune .Q1 646),
    (172, .prune .Q1 646),
    (267, Shard09Child30Child15.certificate),
    (269, Shard09Child30Child16.certificate),
    (270, .prune .Q1 646),
    (278, .prune .Q1 646),
    (282, Shard09Child30Child19.certificate),
    (284, Shard09Child30Child20.certificate),
    (291, Shard09Child30Child21.certificate),
    (293, Shard09Child30Child22.certificate),
    (294, .prune .Q1 646),
    (297, .prune .u 424),
    (298, .prune .u 424),
    (300, .prune .u 424),
    (306, Shard09Child30Child27.certificate),
    (308, Shard09Child30Child28.certificate),
    (312, .prune .u 424),
    (326, .prune .Q1 646),
    (330, Shard09Child30Child31.certificate),
    (332, Shard09Child30Child32.certificate),
    (354, Shard09Child30Child33.certificate),
    (356, Shard09Child30Child34.certificate),
    (360, .prune .u 424)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2912Fixed s2912Targets
      [.Q2, .Pw, .Pu, .s3, .s1, .s2] [(.Q1, 646), (.u, 424)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child30Child15.checked, Shard09Child30Child16.checked, by decide, by decide, Shard09Child30Child19.checked, Shard09Child30Child20.checked, Shard09Child30Child21.checked, Shard09Child30Child22.checked, by decide, by decide, by decide, by decide, Shard09Child30Child27.checked, Shard09Child30Child28.checked, by decide, by decide, Shard09Child30Child31.checked, Shard09Child30Child32.checked, Shard09Child30Child33.checked, Shard09Child30Child34.checked, by decide, True.intro⟩

end Problem97.S2912TreeProof.Shard09Child30
