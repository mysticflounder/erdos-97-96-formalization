import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3928TreeProof.Shard09Child19Child03

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
    (267, .prune .Q2 46),
    (269, .prune .Q2 46),
    (270, .prune .Q2 46),
    (275, .prune .u 408),
    (277, .prune .Q1 533),
    (278, .prune .Q2 46),
    (281, .prune .u 408),
    (282, .prune .Q2 46),
    (284, .prune .Q2 46),
    (523, .prune .Q2 46),
    (525, .prune .Q2 46),
    (526, .prune .Q2 46),
    (531, .prune .Q1 533),
    (533, .prune .Q1 533),
    (534, .prune .Q2 46),
    (537, .prune .Q1 533),
    (538, .prune .Q2 46),
    (540, .prune .Q2 46)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3928Fixed s3928Targets
      [.Pw, .Pu, .s1, .s2, .s3] [(.Q2, 46), (.Q1, 533), (.u, 408)] certificate = true := by
  decide

end Problem97.S3928TreeProof.Shard09Child19Child03
