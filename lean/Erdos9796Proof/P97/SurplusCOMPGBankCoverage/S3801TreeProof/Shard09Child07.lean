import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3801TreeProof.Shard09Child07

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q1 78),
    (29, .prune .Q1 78),
    (30, .prune .Q1 78),
    (46, .prune .Q1 78),
    (54, .prune .Q1 78),
    (58, .prune .Q1 78),
    (60, .prune .Q1 78),
    (75, .prune .Q1 78),
    (77, .prune .Q1 78),
    (78, .prune .Q1 78),
    (83, .prune .Q1 78),
    (85, .prune .Q1 78),
    (86, .prune .Q1 78),
    (89, .prune .Q1 78),
    (90, .prune .Q1 78),
    (92, .prune .Q1 78),
    (270, .prune .Q1 78),
    (278, .prune .Q1 78),
    (282, .prune .Q1 78),
    (284, .prune .Q1 78),
    (326, .prune .Q1 78),
    (330, .prune .Q1 78),
    (332, .prune .Q1 78),
    (338, .prune .Q1 78),
    (340, .prune .Q1 78),
    (344, .prune .Q1 78),
    (526, .prune .Q1 78),
    (534, .prune .Q1 78),
    (538, .prune .Q1 78),
    (540, .prune .Q1 78),
    (582, .prune .Q1 78),
    (586, .prune .Q1 78),
    (588, .prune .Q1 78),
    (594, .prune .Q1 78),
    (596, .prune .Q1 78),
    (600, .prune .Q1 78)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s3 s3801Fixed s3801Target
      [.Pu, .Q2, .Pw, .s3, .s2, .s1] [(.Q1, 78), (.u, 408)] certificate = true := by
  decide

end Problem97.S3801TreeProof.Shard09Child07
