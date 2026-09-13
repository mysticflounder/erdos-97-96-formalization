import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1912TreeProof.Shard02

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
    (547, .prune .u 54),
    (549, .prune .u 54),
    (550, .prune .u 54),
    (554, .prune .u 54),
    (556, .prune .u 54),
    (582, .prune .u 54),
    (610, .prune .u 54),
    (612, .prune .u 54),
    (646, .prune .u 54),
    (674, .prune .u 54),
    (676, .prune .u 54)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s1 s1912Fixed s1912Target
      [.Q1, .Pw, .Pu, .Q2, .s3, .s2, .s1] [(.u, 54)] certificate = true := by
  decide

end Problem97.S1912TreeProof.Shard02
