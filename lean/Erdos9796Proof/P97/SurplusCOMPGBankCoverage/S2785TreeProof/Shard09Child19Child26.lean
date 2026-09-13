import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2785TreeProof.Shard09Child19Child26

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q2 330),
    (43, .prune .Q2 330),
    (45, .prune .Q1 549),
    (46, .prune .Q2 330),
    (54, .prune .Q1 549),
    (58, .prune .Q2 330),
    (60, .prune .Q1 549),
    (75, .prune .Q2 330),
    (77, .prune .Q2 330),
    (78, .prune .Q2 330),
    (99, .prune .Q2 330),
    (101, .prune .Q1 549),
    (102, .prune .Q2 330),
    (105, .prune .Q2 330),
    (106, .prune .Q2 330),
    (108, .prune .Q2 330),
    (270, .prune .Q2 330),
    (294, .prune .Q1 549),
    (298, .prune .Q2 330),
    (300, .prune .Q1 549),
    (326, .prune .Q2 330),
    (330, .prune .Q2 330),
    (332, .prune .Q2 330),
    (354, .prune .Q2 330),
    (356, .prune .Q1 549),
    (360, .prune .Q2 330),
    (526, .prune .Q2 330),
    (550, .prune .Q1 549),
    (554, .prune .Q2 330),
    (556, .prune .Q1 549),
    (582, .prune .Q2 330),
    (586, .prune .Q2 330),
    (588, .prune .Q2 330),
    (610, .prune .Q2 330),
    (612, .prune .Q1 549),
    (616, .prune .Q2 330)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Pu, .Pw, .s1, .s3, .s2] [(.Q2, 330), (.Q1, 549), (.u, 424)] certificate = true := by
  decide

end Problem97.S2785TreeProof.Shard09Child19Child26
