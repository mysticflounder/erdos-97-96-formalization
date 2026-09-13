import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1904TreeProof.Shard09Child18Child20

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q2 284),
    (29, .prune .Q2 284),
    (30, .prune .Q2 284),
    (43, .prune .Q1 547),
    (45, .prune .Q2 284),
    (46, .prune .Q2 284),
    (51, .prune .Q1 547),
    (53, .prune .Q2 284),
    (54, .prune .Q2 284),
    (57, .prune .Q2 284),
    (58, .prune .Q2 284),
    (60, .prune .Q2 284),
    (150, .prune .Q2 284),
    (166, .prune .Q1 547),
    (178, .prune .Q1 547),
    (180, .prune .Q2 284),
    (275, .prune .u 432),
    (277, .prune .Q2 284),
    (278, .prune .Q2 284),
    (291, .prune .Q1 547),
    (293, .prune .u 432),
    (294, .prune .Q1 547),
    (305, .prune .u 432),
    (306, .prune .Q1 547),
    (308, .prune .Q2 284),
    (531, .prune .Q1 547),
    (533, .prune .Q2 284),
    (534, .prune .Q2 284),
    (547, .prune .Q1 547),
    (549, .prune .Q1 547),
    (550, .prune .Q1 547),
    (561, .prune .Q1 547),
    (562, .prune .Q1 547),
    (564, .prune .Q2 284)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1904Fixed s1904Targets
      [.Pw, .Pu, .s3, .s2, .s1] [(.Q2, 284), (.Q1, 547), (.u, 432)] certificate = true := by
  decide

end Problem97.S1904TreeProof.Shard09Child18Child20
