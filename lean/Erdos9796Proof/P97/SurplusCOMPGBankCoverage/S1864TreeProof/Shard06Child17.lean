import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17Child25

namespace Problem97.S1864TreeProof.Shard06Child17

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 533),
    (46, .prune .u 178),
    (51, .prune .Q1 533),
    (53, .prune .Q1 533),
    (54, .prune .Q1 533),
    (58, .prune .u 178),
    (60, .prune .Q1 533),
    (86, .prune .Q1 533),
    (102, .prune .u 178),
    (114, .prune .u 178),
    (116, .prune .Q1 533),
    (150, .prune .Q1 533),
    (166, .prune .u 178),
    (178, .prune .u 178),
    (180, .prune .Q1 533),
    (270, Shard06Child17Child15.certificate),
    (275, .prune .Q1 533),
    (277, .prune .Q1 533),
    (278, .prune .Q1 533),
    (282, .prune .u 178),
    (284, .prune .Q1 533),
    (291, .prune .u 178),
    (293, .prune .Q1 533),
    (294, .prune .u 178),
    (298, .prune .u 178),
    (300, Shard06Child17Child25.certificate),
    (305, .prune .Q1 533),
    (306, .prune .u 178),
    (308, .prune .Q1 533),
    (312, .prune .u 178),
    (390, .prune .u 178),
    (402, .prune .u 178),
    (404, .prune .Q1 533),
    (418, .prune .u 178),
    (420, .prune .u 178),
    (432, .prune .u 178)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1864Fixed s1864Targets
      [.Q2, .Pw, .Pu, .s3, .s2, .s1] [(.Q1, 533), (.u, 178)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard06Child17Child15.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard06Child17Child25.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1864TreeProof.Shard06Child17
