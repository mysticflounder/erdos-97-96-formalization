import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3928TreeProof.Shard10

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 540),
    (29, .prune .u 540),
    (30, .prune .u 540),
    (46, .prune .u 540),
    (54, .prune .u 540),
    (58, .prune .u 540),
    (60, .prune .u 540),
    (78, .prune .u 540),
    (86, .prune .u 540),
    (90, .prune .u 540),
    (92, .prune .u 540),
    (142, .prune .u 540),
    (150, .prune .u 540),
    (154, .prune .u 540),
    (156, .prune .u 540),
    (523, .prune .u 540),
    (525, .prune .u 540),
    (526, .prune .u 540),
    (531, .prune .u 540),
    (533, .prune .u 540),
    (534, .prune .u 540),
    (537, .prune .u 540),
    (538, .prune .u 540),
    (540, .prune .u 540),
    (582, .prune .u 540),
    (586, .prune .u 540),
    (588, .prune .u 540),
    (594, .prune .u 540),
    (596, .prune .u 540),
    (600, .prune .u 540),
    (646, .prune .u 540),
    (650, .prune .u 540),
    (652, .prune .u 540),
    (658, .prune .u 540),
    (660, .prune .u 540),
    (664, .prune .u 540)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3928Fixed s3928Targets
      [.Q1, .Q2, .Pw, .Pu, .s1, .s2, .s3] [(.u, 540)] certificate = true := by
  decide

end Problem97.S3928TreeProof.Shard10
