import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2785TreeProof.Shard09Child19Child15

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q2 270),
    (43, .prune .Q2 270),
    (45, .prune .Q2 270),
    (46, .prune .Q2 270),
    (54, .prune .Q2 270),
    (58, .prune .Q2 270),
    (60, .prune .Q2 270),
    (75, .prune .Q2 270),
    (77, .prune .Q2 270),
    (78, .prune .Q2 270),
    (99, .split [
        (30, .prune .Q2 270),
        (43, .prune .Pu 99),
        (45, .prune .Pu 99),
        (46, .prune .Pu 99),
        (54, .prune .Pu 99),
        (58, .prune .Pu 99),
        (60, .prune .Q2 270),
        (142, .prune .Q2 270),
        (150, .prune .Q2 270),
        (154, .prune .Q2 270),
        (156, .prune .Q2 270),
        (166, .prune .Pu 99),
        (170, .prune .Pu 99),
        (172, .prune .Q2 270),
        (178, .prune .Pu 99),
        (180, .prune .Q1 549),
        (184, .prune .u 424),
        (270, .prune .Q2 270),
        (294, .prune .Pu 99),
        (298, .prune .Pu 99),
        (300, .prune .Q2 270),
        (390, .prune .Q2 270),
        (394, .prune .Q2 270),
        (396, .prune .Q2 270),
        (418, .prune .Pu 99),
        (420, .prune .Q1 549),
        (424, .prune .u 424),
        (526, .prune .Q2 270),
        (550, .prune .Pu 99),
        (554, .prune .Pu 99),
        (556, .prune .Q2 270),
        (646, .prune .Q2 270),
        (650, .prune .Q2 270),
        (652, .prune .Q2 270),
        (674, .prune .Pu 99),
        (676, .prune .Q1 549),
        (680, .prune .Q1 549)
      ]),
    (101, .prune .Q1 549),
    (102, .prune .Q2 270),
    (105, .prune .u 424),
    (106, .prune .Q2 270),
    (108, .prune .Q2 270),
    (270, .prune .Q2 270),
    (294, .prune .Q2 270),
    (298, .prune .Q2 270),
    (300, .prune .Q2 270),
    (326, .prune .Q2 270),
    (330, .prune .Q2 270),
    (332, .prune .Q2 270),
    (354, .prune .u 424),
    (356, .prune .Q1 549),
    (360, .prune .u 424),
    (526, .prune .Q2 270),
    (550, .prune .Q2 270),
    (554, .prune .Q2 270),
    (556, .prune .Q2 270),
    (582, .prune .Q2 270),
    (586, .prune .Q2 270),
    (588, .prune .Q2 270),
    (610, .prune .Q1 549),
    (612, .prune .Q1 549),
    (616, .prune .Q1 549)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Pu, .Pw, .s1, .s3, .s2] [(.Q2, 270), (.Q1, 549), (.u, 424)] certificate = true := by
  decide

end Problem97.S2785TreeProof.Shard09Child19Child15
