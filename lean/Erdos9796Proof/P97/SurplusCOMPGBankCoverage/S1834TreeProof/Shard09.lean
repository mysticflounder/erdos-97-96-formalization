import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1834TreeProof.Shard09

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 308),
    (46, .prune .u 308),
    (51, .prune .u 308),
    (53, .prune .u 308),
    (54, .prune .u 308),
    (58, .prune .u 308),
    (60, .prune .u 308),
    (86, .prune .u 308),
    (102, .prune .u 308),
    (114, .prune .u 308),
    (116, .prune .u 308),
    (150, .prune .u 308),
    (166, .prune .u 308),
    (178, .prune .u 308),
    (180, .prune .u 308),
    (533, .prune .u 308),
    (540, .prune .u 308),
    (549, .prune .u 308),
    (556, .prune .u 308),
    (561, .prune .u 308),
    (564, .prune .u 308),
    (568, .prune .u 308),
    (596, .prune .u 308),
    (612, .prune .u 308),
    (624, .prune .u 308),
    (660, .prune .u 308),
    (676, .prune .u 308),
    (688, .prune .u 308)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.Q1, .s1, .Q2, .Pw, .s2, .Pu, .s3] [(.u, 308)] certificate = true := by
  decide

end Problem97.S1834TreeProof.Shard09
