import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1834TreeProof.Shard04

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 60),
    (46, .prune .u 60),
    (51, .prune .u 60),
    (53, .prune .u 60),
    (54, .prune .u 60),
    (58, .prune .u 60),
    (60, .prune .u 60),
    (86, .prune .u 60),
    (102, .prune .u 60),
    (114, .prune .u 60),
    (116, .prune .u 60),
    (150, .prune .u 60),
    (166, .prune .u 60),
    (178, .prune .u 60),
    (180, .prune .u 60),
    (533, .prune .u 60),
    (540, .prune .u 60),
    (549, .prune .u 60),
    (556, .prune .u 60),
    (561, .prune .u 60),
    (564, .prune .u 60),
    (568, .prune .u 60),
    (596, .prune .u 60),
    (612, .prune .u 60),
    (624, .prune .u 60),
    (660, .prune .u 60),
    (676, .prune .u 60),
    (688, .prune .u 60)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.Q1, .s1, .Q2, .Pw, .s2, .Pu, .s3] [(.u, 60)] certificate = true := by
  decide

end Problem97.S1834TreeProof.Shard04
