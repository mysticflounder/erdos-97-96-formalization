import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard06Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard06Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard06Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard06Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard06Child23

namespace Problem97.S2864TreeProof.Shard06

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 170),
    (43, .prune .u 170),
    (45, .prune .u 170),
    (46, .prune .u 170),
    (54, .prune .u 170),
    (58, .prune .u 170),
    (60, .prune .u 170),
    (78, .prune .u 170),
    (102, .prune .u 170),
    (106, .prune .u 170),
    (108, .prune .u 170),
    (142, .prune .u 170),
    (166, .prune .u 170),
    (170, .prune .u 170),
    (172, .prune .u 170),
    (523, .prune .u 170),
    (525, Shard06Child16.certificate),
    (526, .prune .u 170),
    (534, Shard06Child18.certificate),
    (538, .prune .u 170),
    (540, Shard06Child20.certificate),
    (582, Shard06Child21.certificate),
    (586, .prune .u 170),
    (588, Shard06Child23.certificate),
    (646, .prune .u 170),
    (650, .prune .u 170),
    (652, .prune .u 170)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2864Fixed s2864Targets
      [.Q1, .Q2, .Pw, .Pu, .s1, .s3, .s2] [(.u, 170)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard06Child16.checked, by decide, Shard06Child18.checked, by decide, Shard06Child20.checked, Shard06Child21.checked, by decide, Shard06Child23.checked, by decide, by decide, by decide, True.intro⟩

end Problem97.S2864TreeProof.Shard06
