import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1840TreeProof.Shard09Child16Child01

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q2 46),
    (29, .prune .Q2 46),
    (30, .prune .Q2 46),
    (43, .prune .Q2 46),
    (45, .prune .Q2 46),
    (46, .prune .Q2 46),
    (51, .prune .Q2 46),
    (53, .prune .Q2 46),
    (54, .prune .Q2 46),
    (57, .prune .Q2 46),
    (58, .prune .Q2 46),
    (60, .prune .Q2 46),
    (142, .prune .Q2 46),
    (150, .prune .Q2 46),
    (154, .prune .Q2 46),
    (156, .prune .Q2 46),
    (166, .prune .Q2 46),
    (170, .prune .Q2 46),
    (172, .prune .Q2 46),
    (178, .prune .Q2 46),
    (180, .prune .Q2 46),
    (184, .prune .Q2 46),
    (275, .prune .u 432),
    (277, .prune .Q1 533),
    (278, .prune .Q2 46),
    (291, .prune .Q2 46),
    (293, .prune .Q2 46),
    (294, .prune .Q2 46),
    (305, .prune .u 432),
    (306, .prune .Q2 46),
    (308, .prune .Q2 46),
    (390, .prune .Q2 46),
    (402, .prune .u 432),
    (404, .prune .Q1 533),
    (418, .prune .Q2 46),
    (420, .prune .Q2 46),
    (432, .prune .u 432),
    (531, .prune .Q1 533),
    (533, .prune .Q1 533),
    (534, .prune .Q2 46),
    (547, .prune .Q2 46),
    (549, .prune .Q2 46),
    (550, .prune .Q2 46),
    (561, .prune .Q1 533),
    (562, .prune .Q2 46),
    (564, .prune .Q2 46),
    (646, .prune .Q2 46),
    (658, .prune .Q1 533),
    (660, .prune .Q1 533),
    (674, .prune .Q2 46),
    (676, .prune .Q2 46),
    (688, .prune .Q1 533)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Pw, .Pu, .s2, .s3, .s1] [(.Q2, 46), (.Q1, 533), (.u, 432)] certificate = true := by
  decide

end Problem97.S1840TreeProof.Shard09Child16Child01
