import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2785TreeProof.Shard09Child19Child07

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q2 78),
    (43, .prune .Q2 78),
    (45, .prune .Q2 78),
    (46, .prune .Q2 78),
    (54, .prune .Q2 78),
    (58, .prune .Q2 78),
    (60, .prune .Q2 78),
    (75, .prune .Q2 78),
    (77, .prune .Q2 78),
    (78, .prune .Q2 78),
    (99, .prune .Q2 78),
    (101, .prune .Q2 78),
    (102, .prune .Q2 78),
    (105, .prune .Q2 78),
    (106, .prune .Q2 78),
    (108, .prune .Q2 78),
    (270, .prune .Q2 78),
    (294, .prune .Q2 78),
    (298, .prune .Q2 78),
    (300, .prune .Q2 78),
    (326, .prune .Q2 78),
    (330, .prune .Q2 78),
    (332, .prune .Q2 78),
    (354, .prune .Q2 78),
    (356, .prune .Q2 78),
    (360, .prune .Q2 78),
    (526, .prune .Q2 78),
    (550, .prune .Q2 78),
    (554, .prune .Q2 78),
    (556, .prune .Q2 78),
    (582, .prune .Q2 78),
    (586, .prune .Q2 78),
    (588, .prune .Q2 78),
    (610, .prune .Q2 78),
    (612, .prune .Q2 78),
    (616, .prune .Q2 78)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Pu, .Pw, .s1, .s3, .s2] [(.Q2, 78), (.Q1, 549), (.u, 424)] certificate = true := by
  decide

end Problem97.S2785TreeProof.Shard09Child19Child07
