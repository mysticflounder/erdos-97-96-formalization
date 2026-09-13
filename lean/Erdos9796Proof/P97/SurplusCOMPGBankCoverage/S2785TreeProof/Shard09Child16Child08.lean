import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2785TreeProof.Shard09Child16Child08

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q2 102),
    (43, .prune .Q2 102),
    (45, .prune .Q2 102),
    (46, .prune .Q2 102),
    (54, .prune .Q2 102),
    (58, .prune .Q2 102),
    (60, .prune .Q2 102),
    (75, .prune .Q2 102),
    (77, .prune .Q2 102),
    (78, .prune .Q2 102),
    (99, .prune .Q2 102),
    (101, .prune .Q2 102),
    (102, .prune .Q2 102),
    (105, .prune .Q2 102),
    (106, .prune .Q2 102),
    (108, .prune .Q2 102),
    (270, .prune .Q2 102),
    (294, .prune .Q2 102),
    (298, .prune .Q2 102),
    (300, .prune .Q2 102),
    (326, .prune .Q2 102),
    (330, .prune .Q2 102),
    (332, .prune .Q2 102),
    (354, .prune .Q2 102),
    (356, .prune .Q2 102),
    (360, .prune .Q2 102),
    (526, .prune .Q2 102),
    (550, .prune .Q2 102),
    (554, .prune .Q2 102),
    (556, .prune .Q2 102),
    (582, .prune .Q2 102),
    (586, .prune .Q2 102),
    (588, .prune .Q2 102),
    (610, .prune .Q2 102),
    (612, .prune .Q2 102),
    (616, .prune .Q2 102)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Pu, .Pw, .s1, .s3, .s2] [(.Q2, 102), (.Q1, 525), (.u, 424)] certificate = true := by
  decide

end Problem97.S2785TreeProof.Shard09Child16Child08
