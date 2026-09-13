import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1912TreeProof.Shard01

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 46),
    (46, .prune .u 46),
    (51, .prune .u 46),
    (53, .prune .u 46),
    (54, .prune .u 46),
    (58, .prune .u 46),
    (60, .prune .u 46),
    (86, .prune .u 46),
    (102, .prune .u 46),
    (114, .prune .u 46),
    (116, .prune .u 46),
    (150, .prune .u 46),
    (166, .prune .u 46),
    (178, .prune .u 46),
    (180, .prune .u 46),
    (526, .prune .u 46),
    (547, .prune .u 46),
    (549, .prune .u 46),
    (550, .prune .u 46),
    (554, .prune .u 46),
    (556, .prune .u 46),
    (582, .prune .u 46),
    (610, .prune .u 46),
    (612, .prune .u 46),
    (646, .prune .u 46),
    (674, .prune .u 46),
    (676, .prune .u 46)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s1 s1912Fixed s1912Target
      [.Q1, .Pw, .Pu, .Q2, .s3, .s2, .s1] [(.u, 46)] certificate = true := by
  decide

end Problem97.S1912TreeProof.Shard01
