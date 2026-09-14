import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3864TreeProof.Shard08Child33Child03

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
    (267, .prune .Q2 46),
    (269, .prune .Q2 46),
    (270, .prune .Q2 46),
    (275, .prune .Q1 658),
    (277, .prune .u 344),
    (278, .prune .Q2 46),
    (281, .prune .u 344),
    (282, .prune .Q2 46),
    (284, .prune .Q2 46),
    (390, .prune .Q2 46),
    (394, .prune .Q2 46),
    (396, .prune .Q2 46),
    (402, .prune .Q1 658),
    (404, .prune .u 344),
    (408, .prune .u 344),
    (523, .prune .Q2 46),
    (525, .prune .Q2 46),
    (526, .prune .Q2 46),
    (531, .prune .Q1 658),
    (533, .prune .Q1 658),
    (534, .prune .Q2 46),
    (537, .prune .Q1 658),
    (538, .prune .Q2 46),
    (540, .prune .Q2 46),
    (646, .prune .Q2 46),
    (650, .prune .Q2 46),
    (652, .prune .Q2 46),
    (658, .prune .Q1 658),
    (660, .prune .Q1 658),
    (664, .prune .Q1 658)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Pw, .Pu, .s2, .s1, .s3] [(.Q2, 46), (.Q1, 658), (.u, 344)] certificate = true := by
  decide

end Problem97.S3864TreeProof.Shard08Child33Child03
