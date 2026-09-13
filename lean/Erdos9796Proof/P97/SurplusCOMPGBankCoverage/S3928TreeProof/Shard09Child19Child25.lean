import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3928TreeProof.Shard09Child19Child25

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q2 298),
    (29, .prune .Q1 533),
    (30, .prune .Q2 298),
    (43, .prune .Q2 298),
    (45, .prune .Q2 298),
    (46, .prune .Q2 298),
    (51, .prune .Q2 298),
    (53, .prune .Q1 533),
    (54, .prune .Q2 298),
    (57, .prune .Q2 298),
    (58, .prune .Q2 298),
    (60, .prune .Q2 298),
    (142, .prune .Q2 298),
    (150, .prune .Q1 533),
    (154, .prune .Q2 298),
    (156, .prune .Q1 533),
    (267, .prune .Q2 298),
    (269, .prune .u 408),
    (270, .prune .Q2 298),
    (275, .prune .u 408),
    (277, .prune .Q1 533),
    (278, .prune .Q1 533),
    (281, .prune .u 408),
    (282, .prune .Q2 298),
    (284, .prune .Q1 533),
    (523, .prune .Q2 298),
    (525, .prune .Q1 533),
    (526, .prune .Q2 298),
    (531, .prune .Q1 533),
    (533, .prune .Q1 533),
    (534, .prune .Q1 533),
    (537, .prune .Q1 533),
    (538, .prune .Q2 298),
    (540, .prune .Q1 533)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3928Fixed s3928Targets
      [.Pw, .Pu, .s1, .s2, .s3] [(.Q2, 298), (.Q1, 533), (.u, 408)] certificate = true := by
  decide

end Problem97.S3928TreeProof.Shard09Child19Child25
