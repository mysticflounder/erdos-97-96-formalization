import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1840TreeProof.Shard08Child18Child00

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q2 30),
    (29, .prune .Q2 30),
    (30, .prune .Q2 30),
    (43, .prune .Q2 30),
    (45, .prune .Q2 30),
    (46, .prune .Q2 30),
    (51, .prune .Q2 30),
    (53, .prune .Q2 30),
    (54, .prune .Q2 30),
    (57, .prune .Q2 30),
    (58, .prune .Q2 30),
    (60, .prune .Q2 30),
    (142, .prune .Q2 30),
    (150, .prune .Q2 30),
    (154, .prune .Q2 30),
    (156, .prune .Q2 30),
    (166, .prune .Q2 30),
    (170, .prune .Q2 30),
    (172, .prune .Q2 30),
    (178, .prune .Q2 30),
    (180, .prune .Q2 30),
    (184, .prune .Q2 30),
    (275, .prune .Q2 30),
    (277, .prune .Q2 30),
    (278, .prune .Q2 30),
    (291, .prune .Q1 547),
    (293, .prune .u 368),
    (294, .prune .Q2 30),
    (305, .prune .u 368),
    (306, .prune .Q2 30),
    (308, .prune .Q2 30),
    (390, .prune .Q2 30),
    (402, .prune .Q2 30),
    (404, .prune .Q2 30),
    (418, .prune .Q1 547),
    (420, .prune .u 368),
    (432, .prune .u 368),
    (531, .prune .Q2 30),
    (533, .prune .Q2 30),
    (534, .prune .Q2 30),
    (547, .prune .Q1 547),
    (549, .prune .Q1 547),
    (550, .prune .Q2 30),
    (561, .prune .Q1 547),
    (562, .prune .Q2 30),
    (564, .prune .Q2 30),
    (646, .prune .Q2 30),
    (658, .prune .Q2 30),
    (660, .prune .Q2 30),
    (674, .prune .Q1 547),
    (676, .prune .Q1 547),
    (688, .prune .Q1 547)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Pw, .Pu, .s2, .s3, .s1] [(.Q2, 30), (.Q1, 547), (.u, 368)] certificate = true := by
  decide

end Problem97.S1840TreeProof.Shard08Child18Child00
