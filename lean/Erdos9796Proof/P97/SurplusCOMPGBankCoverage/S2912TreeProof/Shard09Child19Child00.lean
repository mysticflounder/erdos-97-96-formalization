import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2912TreeProof.Shard09Child19Child00

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q2 30),
    (29, .prune .Q2 30),
    (30, .prune .Q2 30),
    (43, .prune .Q2 30),
    (45, .prune .Q2 30),
    (46, .prune .Q2 30),
    (51, .prune .Q2 30),
    (53, .prune .Q2 30),
    (54, .prune .Q2 30),
    (57, .prune .Q2 30),
    (58, .prune .Q2 30),
    (60, .prune .Q2 30),
    (142, .prune .Q2 30),
    (166, .prune .Q2 30),
    (170, .prune .Q2 30),
    (172, .prune .Q2 30),
    (267, .prune .Q2 30),
    (269, .prune .Q2 30),
    (270, .prune .Q2 30),
    (291, .prune .u 424),
    (293, .prune .Q1 549),
    (294, .prune .Q2 30),
    (297, .prune .u 424),
    (298, .prune .Q2 30),
    (300, .prune .Q2 30),
    (523, .prune .Q2 30),
    (525, .prune .Q2 30),
    (526, .prune .Q2 30),
    (547, .prune .Q1 549),
    (549, .prune .Q1 549),
    (550, .prune .Q2 30),
    (553, .prune .Q1 549),
    (554, .prune .Q2 30),
    (556, .prune .Q2 30)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2912Fixed s2912Targets
      [.Pw, .Pu, .s3, .s1, .s2] [(.Q2, 30), (.Q1, 549), (.u, 424)] certificate = true := by
  decide

end Problem97.S2912TreeProof.Shard09Child19Child00
