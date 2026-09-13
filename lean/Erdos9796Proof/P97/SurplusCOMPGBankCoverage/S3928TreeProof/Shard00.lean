import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3928TreeProof.Shard00

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 30),
    (29, .prune .u 30),
    (30, .prune .u 30),
    (46, .prune .u 30),
    (54, .prune .u 30),
    (58, .prune .u 30),
    (60, .prune .u 30),
    (78, .prune .u 30),
    (86, .prune .u 30),
    (90, .prune .u 30),
    (92, .prune .u 30),
    (142, .prune .u 30),
    (150, .prune .u 30),
    (154, .prune .u 30),
    (156, .prune .u 30),
    (523, .prune .u 30),
    (525, .prune .u 30),
    (526, .prune .u 30),
    (531, .prune .u 30),
    (533, .prune .u 30),
    (534, .prune .u 30),
    (537, .prune .u 30),
    (538, .prune .u 30),
    (540, .prune .u 30),
    (582, .prune .u 30),
    (586, .prune .u 30),
    (588, .prune .u 30),
    (594, .prune .u 30),
    (596, .prune .u 30),
    (600, .prune .u 30),
    (646, .prune .u 30),
    (650, .prune .u 30),
    (652, .prune .u 30),
    (658, .prune .u 30),
    (660, .prune .u 30),
    (664, .prune .u 30)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3928Fixed s3928Targets
      [.Q1, .Q2, .Pw, .Pu, .s1, .s2, .s3] [(.u, 30)] certificate = true := by
  decide

end Problem97.S3928TreeProof.Shard00
