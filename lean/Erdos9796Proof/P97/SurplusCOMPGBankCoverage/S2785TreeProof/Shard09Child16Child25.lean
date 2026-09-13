import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2785TreeProof.Shard09Child16Child25

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q2 326),
    (43, .prune .u 424),
    (45, .prune .Q1 525),
    (46, .prune .Q2 326),
    (54, .prune .Q2 326),
    (58, .prune .u 424),
    (60, .prune .Q1 525),
    (75, .prune .Q2 326),
    (77, .prune .Q2 326),
    (78, .prune .Q2 326),
    (99, .prune .Q2 326),
    (101, .prune .Q2 326),
    (102, .prune .Q2 326),
    (105, .prune .u 424),
    (106, .prune .Q2 326),
    (108, .prune .Q2 326),
    (270, .prune .Q2 326),
    (294, .prune .Q2 326),
    (298, .prune .u 424),
    (300, .prune .Q1 525),
    (326, .prune .Q2 326),
    (330, .prune .Q2 326),
    (332, .prune .Q2 326),
    (354, .prune .Q2 326),
    (356, .prune .Q2 326),
    (360, .prune .u 424),
    (526, .prune .Q2 326),
    (550, .prune .Q2 326),
    (554, .prune .Q1 525),
    (556, .prune .Q1 525),
    (582, .prune .Q2 326),
    (586, .prune .Q2 326),
    (588, .prune .Q2 326),
    (610, .prune .Q2 326),
    (612, .prune .Q2 326),
    (616, .prune .Q1 525)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Pu, .Pw, .s1, .s3, .s2] [(.Q2, 326), (.Q1, 525), (.u, 424)] certificate = true := by
  decide

end Problem97.S2785TreeProof.Shard09Child16Child25
