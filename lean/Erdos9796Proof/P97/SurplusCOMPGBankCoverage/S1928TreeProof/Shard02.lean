import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1928TreeProof.Shard02

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 54),
    (46, .prune .u 54),
    (51, .prune .u 54),
    (53, .prune .u 54),
    (54, .prune .u 54),
    (58, .prune .u 54),
    (60, .prune .u 54),
    (86, .prune .u 54),
    (102, .prune .u 54),
    (114, .prune .u 54),
    (116, .prune .u 54),
    (150, .prune .u 54),
    (166, .prune .u 54),
    (178, .prune .u 54),
    (180, .prune .u 54),
    (526, .prune .u 54),
    (531, .prune .u 54),
    (533, .prune .u 54),
    (534, .prune .u 54),
    (538, .prune .u 54),
    (540, .prune .u 54),
    (582, .prune .u 54),
    (594, .prune .u 54),
    (596, .prune .u 54),
    (646, .prune .u 54),
    (658, .prune .u 54),
    (660, .prune .u 54)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1928Fixed s1928Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s2, .s1] [(.u, 54)] certificate = true := by
  decide

end Problem97.S1928TreeProof.Shard02
