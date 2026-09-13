import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2785TreeProof.Shard09Child16Child28

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 525),
    (43, .prune .Q2 354),
    (45, .prune .Q1 525),
    (46, .prune .Q2 354),
    (54, .prune .Q2 354),
    (58, .prune .Q2 354),
    (60, .prune .Q1 525),
    (75, .prune .Q2 354),
    (77, .prune .Q1 525),
    (78, .prune .Q2 354),
    (99, .prune .Q2 354),
    (101, .prune .Q2 354),
    (102, .prune .Q2 354),
    (105, .prune .Q2 354),
    (106, .prune .Q2 354),
    (108, .prune .Q2 354),
    (270, .prune .Q1 525),
    (294, .prune .Q2 354),
    (298, .prune .Q2 354),
    (300, .prune .Q1 525),
    (326, .prune .Q2 354),
    (330, .prune .Q2 354),
    (332, .prune .Q1 525),
    (354, .prune .Q2 354),
    (356, .prune .Q2 354),
    (360, .prune .Q2 354),
    (526, .prune .Q1 525),
    (550, .prune .Q2 354),
    (554, .prune .Q2 354),
    (556, .prune .Q1 525),
    (582, .prune .Q2 354),
    (586, .prune .Q2 354),
    (588, .prune .Q1 525),
    (610, .prune .Q2 354),
    (612, .prune .Q2 354),
    (616, .prune .Q2 354)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Pu, .Pw, .s1, .s3, .s2] [(.Q2, 354), (.Q1, 525), (.u, 424)] certificate = true := by
  decide

end Problem97.S2785TreeProof.Shard09Child16Child28
