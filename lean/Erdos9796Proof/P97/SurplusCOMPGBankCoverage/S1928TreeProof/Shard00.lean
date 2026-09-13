import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1928TreeProof.Shard00

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 30),
    (46, .prune .u 30),
    (51, .prune .u 30),
    (53, .prune .u 30),
    (54, .prune .u 30),
    (58, .prune .u 30),
    (60, .prune .u 30),
    (86, .prune .u 30),
    (102, .prune .u 30),
    (114, .prune .u 30),
    (116, .prune .u 30),
    (150, .prune .u 30),
    (166, .prune .u 30),
    (178, .prune .u 30),
    (180, .prune .u 30),
    (526, .prune .u 30),
    (531, .prune .u 30),
    (533, .prune .u 30),
    (534, .prune .u 30),
    (538, .prune .u 30),
    (540, .prune .u 30),
    (582, .prune .u 30),
    (594, .prune .u 30),
    (596, .prune .u 30),
    (646, .prune .u 30),
    (658, .prune .u 30),
    (660, .prune .u 30)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1928Fixed s1928Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s2, .s1] [(.u, 30)] certificate = true := by
  decide

end Problem97.S1928TreeProof.Shard00
