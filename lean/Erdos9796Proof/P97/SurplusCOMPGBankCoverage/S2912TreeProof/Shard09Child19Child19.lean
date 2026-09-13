import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2912TreeProof.Shard09Child19Child19

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Q2 282),
    (29, .prune .Q2 282),
    (30, .prune .Q2 282),
    (43, .prune .Q2 282),
    (45, .prune .Q1 549),
    (46, .prune .Q2 282),
    (51, .prune .Q2 282),
    (53, .prune .Q1 549),
    (54, .prune .Q2 282),
    (57, .prune .Q2 282),
    (58, .prune .Q2 282),
    (60, .prune .Q2 282),
    (142, .prune .Q2 282),
    (166, .prune .Q1 549),
    (170, .prune .Q2 282),
    (172, .prune .Q1 549),
    (267, .prune .Q2 282),
    (269, .prune .u 424),
    (270, .prune .Q2 282),
    (291, .prune .u 424),
    (293, .prune .Q1 549),
    (294, .prune .Q1 549),
    (297, .prune .u 424),
    (298, .prune .Q2 282),
    (300, .prune .Q1 549),
    (523, .prune .Q2 282),
    (525, .prune .Q1 549),
    (526, .prune .Q2 282),
    (547, .prune .Q1 549),
    (549, .prune .Q1 549),
    (550, .prune .Q1 549),
    (553, .prune .Q1 549),
    (554, .prune .Q2 282),
    (556, .prune .Q1 549)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2912Fixed s2912Targets
      [.Pw, .Pu, .s3, .s1, .s2] [(.Q2, 282), (.Q1, 549), (.u, 424)] certificate = true := by
  decide

end Problem97.S2912TreeProof.Shard09Child19Child19
