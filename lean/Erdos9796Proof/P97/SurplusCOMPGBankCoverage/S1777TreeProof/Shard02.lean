import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1777TreeProof.Shard02

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
    (142, .prune .u 54),
    (150, .prune .u 54),
    (154, .prune .u 54),
    (156, .prune .u 54),
    (166, .prune .u 54),
    (170, .prune .u 54),
    (172, .prune .u 54),
    (178, .prune .u 54),
    (180, .prune .u 54),
    (184, .prune .u 54),
    (278, .prune .u 54),
    (294, .prune .u 54),
    (306, .prune .u 54),
    (308, .prune .u 54),
    (390, .prune .u 54),
    (402, .prune .u 54),
    (404, .prune .u 54),
    (418, .prune .u 54),
    (420, .prune .u 54),
    (432, .prune .u 54),
    (534, .prune .u 54),
    (550, .prune .u 54),
    (562, .prune .u 54),
    (564, .prune .u 54),
    (646, .prune .u 54),
    (658, .prune .u 54),
    (660, .prune .u 54),
    (674, .prune .u 54),
    (676, .prune .u 54),
    (688, .prune .u 54)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s1 s1777Fixed s1777Target
      [.Pw, .Pu, .Q1, .Q2, .s1, .s2, .s3] [(.u, 54)] certificate = true := by
  decide

end Problem97.S1777TreeProof.Shard02
