import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child23
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child29
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09Child16Child31

namespace Problem97.S2785TreeProof.Shard09Child16

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 525),
    (43, .prune .Q1 525),
    (45, .prune .Q1 525),
    (46, .prune .Q1 525),
    (54, Shard09Child16Child04.certificate),
    (58, .prune .u 424),
    (60, .prune .Q1 525),
    (78, .prune .Q1 525),
    (102, Shard09Child16Child08.certificate),
    (106, .prune .u 424),
    (108, .prune .Q1 525),
    (142, .prune .Q1 525),
    (166, .prune .u 424),
    (170, .prune .u 424),
    (172, .prune .Q1 525),
    (270, .prune .Q1 525),
    (278, Shard09Child16Child16.certificate),
    (282, Shard09Child16Child17.certificate),
    (284, .prune .Q1 525),
    (294, Shard09Child16Child19.certificate),
    (298, .prune .u 424),
    (300, .prune .Q1 525),
    (306, Shard09Child16Child22.certificate),
    (308, Shard09Child16Child23.certificate),
    (312, .prune .u 424),
    (326, Shard09Child16Child25.certificate),
    (330, Shard09Child16Child26.certificate),
    (332, .prune .Q1 525),
    (354, Shard09Child16Child28.certificate),
    (356, Shard09Child16Child29.certificate),
    (360, .prune .u 424),
    (390, Shard09Child16Child31.certificate),
    (394, .prune .u 424),
    (396, .prune .Q1 525),
    (418, .prune .u 424),
    (420, .prune .u 424),
    (424, .prune .u 424)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Q2, .Pu, .Pw, .s1, .s3, .s2] [(.Q1, 525), (.u, 424)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, Shard09Child16Child04.checked, by decide, by decide, by decide, Shard09Child16Child08.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child16Child16.checked, Shard09Child16Child17.checked, by decide, Shard09Child16Child19.checked, by decide, by decide, Shard09Child16Child22.checked, Shard09Child16Child23.checked, by decide, Shard09Child16Child25.checked, Shard09Child16Child26.checked, by decide, Shard09Child16Child28.checked, Shard09Child16Child29.checked, by decide, Shard09Child16Child31.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S2785TreeProof.Shard09Child16
