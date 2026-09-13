import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S2785TreeProof.Shard09Child19Child00

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q2 30),
    (43, .prune .Q2 30),
    (45, .prune .Q2 30),
    (46, .prune .Q2 30),
    (54, .prune .Q2 30),
    (58, .prune .Q2 30),
    (60, .prune .Q2 30),
    (75, .prune .Q2 30),
    (77, .prune .Q2 30),
    (78, .prune .Q2 30),
    (99, .split [
        (30, .prune .Q2 30),
        (43, .prune .Pu 99),
        (45, .prune .Pu 99),
        (46, .prune .Pu 99),
        (54, .prune .Pu 99),
        (58, .prune .Pu 99),
        (60, .prune .Q2 30),
        (142, .prune .Q2 30),
        (150, .prune .Q2 30),
        (154, .prune .Q2 30),
        (156, .prune .Q2 30),
        (166, .prune .Pu 99),
        (170, .prune .Pu 99),
        (172, .prune .Q2 30),
        (178, .prune .Pu 99),
        (180, .prune .Q2 30),
        (184, .prune .Q2 30),
        (270, .prune .Q2 30),
        (294, .prune .Pu 99),
        (298, .prune .Pu 99),
        (300, .prune .Q2 30),
        (390, .prune .Q2 30),
        (394, .prune .Q2 30),
        (396, .prune .Q2 30),
        (418, .prune .Pu 99),
        (420, .prune .Q1 549),
        (424, .prune .u 424),
        (526, .prune .Q2 30),
        (550, .prune .Pu 99),
        (554, .prune .Pu 99),
        (556, .prune .Q2 30),
        (646, .prune .Q2 30),
        (650, .prune .Q2 30),
        (652, .prune .Q2 30),
        (674, .prune .Pu 99),
        (676, .prune .Q1 549),
        (680, .prune .Q1 549)
      ]),
    (101, .prune .Q1 549),
    (102, .prune .Q2 30),
    (105, .prune .u 424),
    (106, .prune .Q2 30),
    (108, .prune .Q2 30),
    (270, .prune .Q2 30),
    (294, .prune .Q2 30),
    (298, .prune .Q2 30),
    (300, .prune .Q2 30),
    (326, .prune .Q2 30),
    (330, .prune .Q2 30),
    (332, .prune .Q2 30),
    (354, .prune .u 424),
    (356, .prune .Q1 549),
    (360, .prune .u 424),
    (526, .prune .Q2 30),
    (550, .prune .Q2 30),
    (554, .prune .Q2 30),
    (556, .prune .Q2 30),
    (582, .prune .Q2 30),
    (586, .prune .Q2 30),
    (588, .prune .Q2 30),
    (610, .prune .Q1 549),
    (612, .prune .Q1 549),
    (616, .prune .Q1 549)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets
      [.Pu, .Pw, .s1, .s3, .s2] [(.Q2, 30), (.Q1, 549), (.u, 424)] certificate = true := by
  decide

end Problem97.S2785TreeProof.Shard09Child19Child00
