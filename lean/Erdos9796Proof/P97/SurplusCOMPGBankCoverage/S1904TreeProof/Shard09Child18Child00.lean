import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1904TreeProof.Shard09Child18Child00

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
    (150, .prune .Q2 30),
    (166, .prune .Q2 30),
    (178, .prune .Q2 30),
    (180, .prune .Q2 30),
    (275, .prune .Q2 30),
    (277, .prune .Q2 30),
    (278, .prune .Q2 30),
    (291, .prune .Q1 547),
    (293, .prune .u 432),
    (294, .prune .Q2 30),
    (305, .prune .u 432),
    (306, .prune .Q2 30),
    (308, .prune .Q2 30),
    (531, .prune .Q2 30),
    (533, .prune .Q2 30),
    (534, .prune .Q2 30),
    (547, .prune .Q1 547),
    (549, .prune .Q1 547),
    (550, .prune .Q2 30),
    (561, .prune .Q1 547),
    (562, .prune .Q2 30),
    (564, .prune .Q2 30)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1904Fixed s1904Targets
      [.Pw, .Pu, .s3, .s2, .s1] [(.Q2, 30), (.Q1, 547), (.u, 432)] certificate = true := by
  decide

end Problem97.S1904TreeProof.Shard09Child18Child00
