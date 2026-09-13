import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1834TreeProof.Shard15

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 564),
    (46, .prune .u 564),
    (51, .prune .u 564),
    (53, .prune .u 564),
    (54, .prune .u 564),
    (58, .prune .u 564),
    (60, .prune .u 564),
    (86, .prune .u 564),
    (102, .prune .u 564),
    (114, .prune .u 564),
    (116, .prune .u 564),
    (150, .prune .u 564),
    (166, .prune .u 564),
    (178, .prune .u 564),
    (180, .prune .u 564),
    (533, .prune .u 564),
    (540, .prune .u 564),
    (549, .prune .u 564),
    (556, .prune .u 564),
    (561, .prune .u 564),
    (564, .prune .u 564),
    (568, .prune .u 564),
    (596, .prune .u 564),
    (612, .prune .u 564),
    (624, .prune .u 564),
    (660, .prune .u 564),
    (676, .prune .u 564),
    (688, .prune .u 564)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.Q1, .s1, .Q2, .Pw, .s2, .Pu, .s3] [(.u, 564)] certificate = true := by
  decide

end Problem97.S1834TreeProof.Shard15
