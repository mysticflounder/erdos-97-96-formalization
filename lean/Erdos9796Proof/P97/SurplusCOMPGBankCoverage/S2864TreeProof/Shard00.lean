import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2864TreeProof.Shard00

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 30),
    (43, .prune .u 30),
    (45, .prune .u 30),
    (46, .prune .u 30),
    (54, .prune .u 30),
    (58, .prune .u 30),
    (60, .prune .u 30),
    (78, .prune .u 30),
    (102, .prune .u 30),
    (106, .prune .u 30),
    (108, .prune .u 30),
    (142, .prune .u 30),
    (166, .prune .u 30),
    (170, .prune .u 30),
    (172, .prune .u 30),
    (523, .prune .u 30),
    (525, .prune .u 30),
    (526, .prune .u 30),
    (534, .prune .u 30),
    (538, .prune .u 30),
    (540, .prune .u 30),
    (582, .prune .u 30),
    (586, .prune .u 30),
    (588, .prune .u 30),
    (646, .prune .u 30),
    (650, .prune .u 30),
    (652, .prune .u 30)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2864Fixed s2864Targets
      [.Q1, .Q2, .Pw, .Pu, .s1, .s3, .s2] [(.u, 30)] certificate = true := by
  decide

end Problem97.S2864TreeProof.Shard00
