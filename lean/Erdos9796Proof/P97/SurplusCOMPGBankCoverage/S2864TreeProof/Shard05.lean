import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard05Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard05Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard05Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard05Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard05Child26

namespace Problem97.S2864TreeProof.Shard05

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 106),
    (43, .prune .u 106),
    (45, .prune .u 106),
    (46, .prune .u 106),
    (54, .prune .u 106),
    (58, .prune .u 106),
    (60, .prune .u 106),
    (78, .prune .u 106),
    (102, .prune .u 106),
    (106, .prune .u 106),
    (108, .prune .u 106),
    (142, .prune .u 106),
    (166, .prune .u 106),
    (170, .prune .u 106),
    (172, .prune .u 106),
    (523, .prune .u 106),
    (525, Shard05Child16.certificate),
    (526, .prune .u 106),
    (534, Shard05Child18.certificate),
    (538, .prune .u 106),
    (540, Shard05Child20.certificate),
    (582, .prune .u 106),
    (586, .prune .u 106),
    (588, .prune .u 106),
    (646, Shard05Child24.certificate),
    (650, .prune .u 106),
    (652, Shard05Child26.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2864Fixed s2864Targets
      [.Q1, .Q2, .Pw, .Pu, .s1, .s3, .s2] [(.u, 106)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard05Child16.checked, by decide, Shard05Child18.checked, by decide, Shard05Child20.checked, by decide, by decide, by decide, Shard05Child24.checked, by decide, Shard05Child26.checked, True.intro⟩

end Problem97.S2864TreeProof.Shard05
