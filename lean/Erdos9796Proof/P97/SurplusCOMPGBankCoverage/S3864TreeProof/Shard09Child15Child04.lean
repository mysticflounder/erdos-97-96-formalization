import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3864TreeProof.Shard09Child15Child04

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
    (166, .prune .Q2 54),
    (170, .prune .Q2 54),
    (172, .prune .Q2 54),
    (178, .prune .Q2 54),
    (180, .prune .Q2 54),
    (184, .prune .Q2 54),
    (267, .prune .Q1 523),
    (269, .prune .u 408),
    (270, .prune .Q2 54),
    (275, .prune .Q2 54),
    (277, .prune .Q2 54),
    (278, .prune .Q2 54),
    (281, .prune .u 408),
    (282, .prune .Q2 54),
    (284, .prune .Q2 54),
    (390, .prune .Q2 54),
    (394, .prune .Q1 523),
    (396, .prune .u 408),
    (402, .prune .Q2 54),
    (404, .prune .Q2 54),
    (408, .prune .u 408),
    (523, .prune .Q1 523),
    (525, .prune .Q1 523),
    (526, .prune .Q2 54),
    (531, .prune .Q2 54),
    (533, .prune .Q2 54),
    (534, .prune .Q2 54),
    (537, .prune .Q1 523),
    (538, .prune .Q2 54),
    (540, .prune .Q2 54),
    (646, .prune .Q2 54),
    (650, .prune .Q1 523),
    (652, .prune .Q1 523),
    (658, .prune .Q2 54),
    (660, .prune .Q2 54),
    (664, .prune .Q1 523)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Pw, .Pu, .s2, .s1, .s3] [(.Q2, 54), (.Q1, 523), (.u, 408)] certificate = true := by
  decide

end Problem97.S3864TreeProof.Shard09Child15Child04
