import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3928TreeProof.Shard09Child16Child27

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q2 306),
    (29, .prune .Q1 525),
    (30, .prune .Q2 306),
    (43, .prune .Q2 306),
    (45, .prune .Q1 525),
    (46, .prune .Q2 306),
    (51, .prune .Q2 306),
    (53, .prune .Q2 306),
    (54, .prune .Q2 306),
    (57, .prune .Q2 306),
    (58, .prune .Q2 306),
    (60, .prune .Q2 306),
    (142, .prune .Q1 525),
    (150, .prune .Q2 306),
    (154, .prune .Q2 306),
    (156, .prune .Q1 525),
    (267, .prune .u 408),
    (269, .prune .Q1 525),
    (270, .prune .Q1 525),
    (275, .prune .Q2 306),
    (277, .prune .u 408),
    (278, .prune .Q2 306),
    (281, .prune .u 408),
    (282, .prune .Q2 306),
    (284, .prune .Q1 525),
    (523, .prune .Q1 525),
    (525, .prune .Q1 525),
    (526, .prune .Q1 525),
    (531, .prune .Q2 306),
    (533, .prune .Q1 525),
    (534, .prune .Q2 306),
    (537, .prune .Q1 525),
    (538, .prune .Q2 306),
    (540, .prune .Q1 525)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3928Fixed s3928Targets
      [.Pw, .Pu, .s1, .s2, .s3] [(.Q2, 306), (.Q1, 525), (.u, 408)] certificate = true := by
  decide

end Problem97.S3928TreeProof.Shard09Child16Child27
