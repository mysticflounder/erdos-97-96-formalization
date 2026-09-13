import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2912TreeProof.Shard01

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 46),
    (43, .prune .u 46),
    (45, .prune .u 46),
    (46, .prune .u 46),
    (54, .prune .u 46),
    (58, .prune .u 46),
    (60, .prune .u 46),
    (78, .prune .u 46),
    (102, .prune .u 46),
    (106, .prune .u 46),
    (108, .prune .u 46),
    (142, .prune .u 46),
    (166, .prune .u 46),
    (170, .prune .u 46),
    (172, .prune .u 46),
    (523, .prune .u 46),
    (525, .prune .u 46),
    (526, .prune .u 46),
    (547, .prune .u 46),
    (549, .prune .u 46),
    (550, .prune .u 46),
    (553, .prune .u 46),
    (554, .prune .u 46),
    (556, .prune .u 46),
    (582, .prune .u 46),
    (586, .prune .u 46),
    (588, .prune .u 46),
    (610, .prune .u 46),
    (612, .prune .u 46),
    (616, .prune .u 46),
    (646, .prune .u 46),
    (650, .prune .u 46),
    (652, .prune .u 46),
    (674, .prune .u 46),
    (676, .prune .u 46),
    (680, .prune .u 46)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2912Fixed s2912Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s1, .s2] [(.u, 46)] certificate = true := by
  decide

end Problem97.S2912TreeProof.Shard01
