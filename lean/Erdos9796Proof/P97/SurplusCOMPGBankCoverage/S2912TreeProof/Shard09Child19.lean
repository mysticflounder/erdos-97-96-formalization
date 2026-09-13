import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19Child33

namespace Problem97.S2912TreeProof.Shard09Child19

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard09Child19Child00.certificate),
    (43, .prune .Q1 549),
    (45, .prune .Q1 549),
    (46, .prune .Q1 549),
    (54, .prune .Q1 549),
    (58, .prune .u 424),
    (60, .prune .Q1 549),
    (78, Shard09Child19Child07.certificate),
    (102, .prune .Q1 549),
    (106, .prune .u 424),
    (108, .prune .Q1 549),
    (142, .prune .u 424),
    (166, .prune .Q1 549),
    (170, .prune .u 424),
    (172, .prune .Q1 549),
    (267, Shard09Child19Child15.certificate),
    (269, .prune .Q1 549),
    (270, Shard09Child19Child17.certificate),
    (278, Shard09Child19Child18.certificate),
    (282, Shard09Child19Child19.certificate),
    (284, Shard09Child19Child20.certificate),
    (291, .prune .Q1 549),
    (293, .prune .Q1 549),
    (294, .prune .Q1 549),
    (297, .prune .Q1 549),
    (298, .prune .u 424),
    (300, .prune .Q1 549),
    (306, Shard09Child19Child27.certificate),
    (308, .prune .Q1 549),
    (312, .prune .u 424),
    (326, Shard09Child19Child30.certificate),
    (330, Shard09Child19Child31.certificate),
    (332, Shard09Child19Child32.certificate),
    (354, Shard09Child19Child33.certificate),
    (356, .prune .Q1 549),
    (360, .prune .u 424)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2912Fixed s2912Targets
      [.Q2, .Pw, .Pu, .s3, .s1, .s2] [(.Q1, 549), (.u, 424)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard09Child19Child00.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child19Child07.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child19Child15.checked, by decide, Shard09Child19Child17.checked, Shard09Child19Child18.checked, Shard09Child19Child19.checked, Shard09Child19Child20.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child19Child27.checked, by decide, by decide, Shard09Child19Child30.checked, Shard09Child19Child31.checked, Shard09Child19Child32.checked, Shard09Child19Child33.checked, by decide, by decide, True.intro⟩

end Problem97.S2912TreeProof.Shard09Child19
