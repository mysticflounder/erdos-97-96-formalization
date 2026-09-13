import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S3801TreeProof.Shard09Child24

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 408),
    (29, .prune .u 408),
    (30, .prune .Q1 582),
    (46, .prune .Q1 582),
    (54, .prune .Q1 582),
    (58, .prune .u 408),
    (60, .prune .u 408),
    (75, .prune .Q1 582),
    (77, .prune .Q1 582),
    (78, .prune .Q1 582),
    (83, .prune .Q1 582),
    (85, .prune .Q1 582),
    (86, .prune .Q1 582),
    (89, .prune .u 408),
    (90, .prune .Q1 582),
    (92, .prune .Q1 582),
    (270, .prune .Q1 582),
    (278, .prune .Q1 582),
    (282, .prune .u 408),
    (284, .prune .u 408),
    (326, .prune .Q1 582),
    (330, .prune .Q1 582),
    (332, .prune .Q1 582),
    (338, .prune .Q1 582),
    (340, .prune .Q1 582),
    (344, .prune .u 408),
    (526, .prune .Q1 582),
    (534, .prune .Q1 582),
    (538, .prune .Q1 582),
    (540, .prune .Q1 582),
    (582, .prune .Q1 582),
    (586, .prune .Q1 582),
    (588, .prune .Q1 582),
    (594, .prune .Q1 582),
    (596, .prune .Q1 582),
    (600, .prune .Q1 582)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s3 s3801Fixed s3801Target
      [.Pu, .Q2, .Pw, .s3, .s2, .s1] [(.Q1, 582), (.u, 408)] certificate = true := by
  decide

end Problem97.S3801TreeProof.Shard09Child24
