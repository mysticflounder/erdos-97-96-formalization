import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2785TreeProof.Shard09Child16Child04

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q2 54),
    (43, .prune .Q2 54),
    (45, .prune .Q2 54),
    (46, .prune .Q2 54),
    (54, .prune .Q2 54),
    (58, .prune .Q2 54),
    (60, .prune .Q2 54),
    (75, .split [
        (30, .prune .Pu 75),
        (43, .prune .Pu 75),
        (45, .prune .Pu 75),
        (46, .prune .Pu 75),
        (54, .prune .Q2 54),
        (58, .prune .Pu 75),
        (60, .prune .Q2 54),
        (142, .prune .Pu 75),
        (150, .prune .Q2 54),
        (154, .prune .Pu 75),
        (156, .prune .Q2 54),
        (166, .prune .Q2 54),
        (170, .prune .Pu 75),
        (172, .prune .Q2 54),
        (178, .prune .Q2 54),
        (180, .prune .Q2 54),
        (184, .prune .Q2 54),
        (270, .prune .Pu 75),
        (294, .prune .Q2 54),
        (298, .prune .Pu 75),
        (300, .prune .Q2 54),
        (390, .prune .Q2 54),
        (394, .prune .Pu 75),
        (396, .prune .Q1 525),
        (418, .prune .Q2 54),
        (420, .prune .Q2 54),
        (424, .prune .u 424),
        (526, .prune .Pu 75),
        (550, .prune .Q2 54),
        (554, .prune .Pu 75),
        (556, .prune .Q2 54),
        (646, .prune .Q2 54),
        (650, .prune .Pu 75),
        (652, .prune .Q1 525),
        (674, .prune .Q2 54),
        (676, .prune .Q2 54),
        (680, .prune .Q1 525)
      ]),
    (77, .prune .Q1 525),
    (78, .prune .Q2 54),
    (99, .prune .Q2 54),
    (101, .prune .Q2 54),
    (102, .prune .Q2 54),
    (105, .prune .u 424),
    (106, .prune .Q2 54),
    (108, .prune .Q2 54),
    (270, .prune .Q2 54),
    (294, .prune .Q2 54),
    (298, .prune .Q2 54),
    (300, .prune .Q2 54),
    (326, .prune .Q2 54),
    (330, .prune .u 424),
    (332, .prune .Q1 525),
    (354, .prune .Q2 54),
    (356, .prune .Q2 54),
    (360, .prune .u 424),
    (526, .prune .Q2 54),
    (550, .prune .Q2 54),
    (554, .prune .Q2 54),
    (556, .prune .Q2 54),
    (582, .prune .Q2 54),
    (586, .prune .Q1 525),
    (588, .prune .Q1 525),
    (610, .prune .Q2 54),
    (612, .prune .Q2 54),
    (616, .prune .Q1 525)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Pu, .Pw, .s1, .s3, .s2] [(.Q2, 54), (.Q1, 525), (.u, 424)] certificate = true := by
  decide

end Problem97.S2785TreeProof.Shard09Child16Child04
