import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17Child25Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17Child25Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17Child25Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17Child25Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17Child25Child36
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17Child25Child37
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17Child25Child47

namespace Problem97.S1864TreeProof.Shard06Child17Child25

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 178),
    (29, .prune .Q2 300),
    (30, .prune .Q2 300),
    (43, .prune .Q2 300),
    (45, .prune .Q2 300),
    (46, .prune .Q2 300),
    (51, .prune .u 178),
    (53, .prune .Q2 300),
    (54, .prune .Q2 300),
    (57, .prune .Q2 300),
    (58, .prune .Q2 300),
    (60, .prune .Q2 300),
    (142, .prune .Q2 300),
    (150, .prune .Q1 533),
    (154, .prune .u 178),
    (156, .prune .Q2 300),
    (166, .prune .Q2 300),
    (170, .prune .Q2 300),
    (172, .prune .Q2 300),
    (178, .prune .u 178),
    (180, .prune .Q2 300),
    (184, .prune .Q2 300),
    (267, Shard06Child17Child25Child22.certificate),
    (269, .prune .Q2 300),
    (270, .prune .Q2 300),
    (275, .prune .u 178),
    (277, .prune .Q1 533),
    (278, .prune .Q1 533),
    (281, Shard06Child17Child25Child28.certificate),
    (282, .prune .u 178),
    (284, .prune .Q2 300),
    (390, Shard06Child17Child25Child31.certificate),
    (394, Shard06Child17Child25Child32.certificate),
    (396, .prune .Q2 300),
    (402, .prune .u 178),
    (404, .prune .Q1 533),
    (408, Shard06Child17Child25Child36.certificate),
    (523, Shard06Child17Child25Child37.certificate),
    (525, .prune .Q2 300),
    (526, .prune .Q2 300),
    (531, .prune .Q1 533),
    (533, .prune .Q1 533),
    (534, .prune .Q1 533),
    (537, .prune .Q1 533),
    (538, .prune .Q1 533),
    (540, .prune .Q2 300),
    (646, .prune .Q1 533),
    (650, Shard06Child17Child25Child47.certificate),
    (652, .prune .Q2 300),
    (658, .prune .Q1 533),
    (660, .prune .Q1 533),
    (664, .prune .Q1 533)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1864Fixed s1864Targets
      [.Pw, .Pu, .s3, .s2, .s1] [(.Q2, 300), (.Q1, 533), (.u, 178)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard06Child17Child25Child22.checked, by decide, by decide, by decide, by decide, by decide, Shard06Child17Child25Child28.checked, by decide, by decide, Shard06Child17Child25Child31.checked, Shard06Child17Child25Child32.checked, by decide, by decide, by decide, Shard06Child17Child25Child36.checked, Shard06Child17Child25Child37.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard06Child17Child25Child47.checked, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1864TreeProof.Shard06Child17Child25
