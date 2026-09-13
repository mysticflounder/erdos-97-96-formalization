import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3801TreeProof.Shard09Child08

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 86),
    (29, .prune .Q1 86),
    (30, .prune .Q1 86),
    (46, .prune .Q1 86),
    (54, .prune .Q1 86),
    (58, .prune .Q1 86),
    (60, .prune .Q1 86),
    (75, .prune .Q1 86),
    (77, .prune .Q1 86),
    (78, .prune .Q1 86),
    (83, .prune .Q1 86),
    (85, .prune .Q1 86),
    (86, .prune .Q1 86),
    (89, .prune .Q1 86),
    (90, .prune .Q1 86),
    (92, .prune .Q1 86),
    (270, .prune .Q1 86),
    (278, .prune .Q1 86),
    (282, .prune .Q1 86),
    (284, .prune .Q1 86),
    (326, .prune .Q1 86),
    (330, .prune .Q1 86),
    (332, .prune .Q1 86),
    (338, .prune .Q1 86),
    (340, .prune .Q1 86),
    (344, .prune .Q1 86),
    (526, .prune .Q1 86),
    (534, .prune .Q1 86),
    (538, .prune .Q1 86),
    (540, .prune .Q1 86),
    (582, .prune .Q1 86),
    (586, .prune .Q1 86),
    (588, .prune .Q1 86),
    (594, .prune .Q1 86),
    (596, .prune .Q1 86),
    (600, .prune .Q1 86)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s3 s3801Fixed s3801Target
      [.Pu, .Q2, .Pw, .s3, .s2, .s1] [(.Q1, 86), (.u, 408)] certificate = true := by
  decide

end Problem97.S3801TreeProof.Shard09Child08
