import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1840TreeProof.Shard10

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
    (531, .prune .u 564),
    (533, .prune .u 564),
    (534, .prune .u 564),
    (547, .prune .u 564),
    (549, .prune .u 564),
    (550, .prune .u 564),
    (561, .prune .u 564),
    (562, .prune .u 564),
    (564, .prune .u 564),
    (582, .prune .u 564),
    (594, .prune .u 564),
    (596, .prune .u 564),
    (610, .prune .u 564),
    (612, .prune .u 564),
    (624, .prune .u 564),
    (646, .prune .u 564),
    (658, .prune .u 564),
    (660, .prune .u 564),
    (674, .prune .u 564),
    (676, .prune .u 564),
    (688, .prune .u 564)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q1, .Q2, .Pw, .Pu, .s2, .s3, .s1] [(.u, 564)] certificate = true := by
  decide

end Problem97.S1840TreeProof.Shard10
