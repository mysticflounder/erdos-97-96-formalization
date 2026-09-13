import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06Child23

namespace Problem97.S1864TreeProof.Shard06

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 178),
    (46, .prune .u 178),
    (51, .prune .u 178),
    (53, .prune .u 178),
    (54, .prune .u 178),
    (58, .prune .u 178),
    (60, .prune .u 178),
    (86, .prune .u 178),
    (102, .prune .u 178),
    (114, .prune .u 178),
    (116, .prune .u 178),
    (150, .prune .u 178),
    (166, .prune .u 178),
    (178, .prune .u 178),
    (180, .prune .u 178),
    (526, Shard06Child15.certificate),
    (531, .prune .u 178),
    (533, Shard06Child17.certificate),
    (534, .prune .u 178),
    (538, .prune .u 178),
    (540, Shard06Child20.certificate),
    (582, Shard06Child21.certificate),
    (594, .prune .u 178),
    (596, Shard06Child23.certificate),
    (646, .prune .u 178),
    (658, .prune .u 178),
    (660, .prune .u 178)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1864Fixed s1864Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s2, .s1] [(.u, 178)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard06Child15.checked, by decide, Shard06Child17.checked, by decide, by decide, Shard06Child20.checked, Shard06Child21.checked, by decide, Shard06Child23.checked, by decide, by decide, by decide, True.intro⟩

end Problem97.S1864TreeProof.Shard06
