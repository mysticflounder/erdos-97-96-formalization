import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3928TreeProof.Shard09Child16Child04

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q2 54),
    (29, .prune .Q2 54),
    (30, .prune .Q2 54),
    (43, .prune .Q2 54),
    (45, .prune .Q2 54),
    (46, .prune .Q2 54),
    (51, .prune .Q2 54),
    (53, .prune .Q2 54),
    (54, .prune .Q2 54),
    (57, .prune .Q2 54),
    (58, .prune .Q2 54),
    (60, .prune .Q2 54),
    (142, .prune .Q2 54),
    (150, .prune .Q2 54),
    (154, .prune .Q2 54),
    (156, .prune .Q2 54),
    (267, .prune .u 408),
    (269, .prune .Q1 525),
    (270, .prune .Q2 54),
    (275, .prune .Q2 54),
    (277, .prune .Q2 54),
    (278, .prune .Q2 54),
    (281, .prune .u 408),
    (282, .prune .Q2 54),
    (284, .prune .Q2 54),
    (523, .prune .Q1 525),
    (525, .prune .Q1 525),
    (526, .prune .Q2 54),
    (531, .prune .Q2 54),
    (533, .prune .Q2 54),
    (534, .prune .Q2 54),
    (537, .prune .Q1 525),
    (538, .prune .Q2 54),
    (540, .prune .Q2 54)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3928Fixed s3928Targets
      [.Pw, .Pu, .s1, .s2, .s3] [(.Q2, 54), (.Q1, 525), (.u, 408)] certificate = true := by
  decide

end Problem97.S3928TreeProof.Shard09Child16Child04
