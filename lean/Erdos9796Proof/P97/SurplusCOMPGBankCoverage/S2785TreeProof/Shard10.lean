import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2785TreeProof.Shard10

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 556),
    (43, .prune .u 556),
    (45, .prune .u 556),
    (46, .prune .u 556),
    (54, .prune .u 556),
    (58, .prune .u 556),
    (60, .prune .u 556),
    (78, .prune .u 556),
    (102, .prune .u 556),
    (106, .prune .u 556),
    (108, .prune .u 556),
    (142, .prune .u 556),
    (166, .prune .u 556),
    (170, .prune .u 556),
    (172, .prune .u 556),
    (523, .prune .u 556),
    (525, .prune .u 556),
    (526, .prune .u 556),
    (547, .prune .u 556),
    (549, .prune .u 556),
    (550, .prune .u 556),
    (553, .prune .u 556),
    (554, .prune .u 556),
    (556, .prune .u 556),
    (582, .prune .u 556),
    (586, .prune .u 556),
    (588, .prune .u 556),
    (610, .prune .u 556),
    (612, .prune .u 556),
    (616, .prune .u 556),
    (646, .prune .u 556),
    (650, .prune .u 556),
    (652, .prune .u 556),
    (674, .prune .u 556),
    (676, .prune .u 556),
    (680, .prune .u 556)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Q1, .Q2, .Pu, .Pw, .s1, .s3, .s2] [(.u, 556)] certificate = true := by
  decide

end Problem97.S2785TreeProof.Shard10
