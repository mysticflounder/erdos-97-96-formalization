import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1834TreeProof.Shard10Child11

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (51, .prune .u 312),
    (53, .prune .Q1 150),
    (54, .prune .Q1 150),
    (116, .prune .Q1 150),
    (150, .prune .Q1 150),
    (166, .prune .Q1 150),
    (178, .prune .Q1 150),
    (180, .prune .Q1 150),
    (277, .prune .Q1 150),
    (293, .split [
        (30, .prune .Q1 150),
        (46, .prune .s1 293),
        (51, .prune .s1 293),
        (53, .prune .s1 293),
        (54, .prune .s1 293),
        (58, .prune .Q1 150),
        (60, .prune .s1 293),
        (86, .prune .Q1 150),
        (102, .prune .s1 293),
        (114, .prune .Q1 150),
        (116, .prune .s1 293),
        (150, .prune .Q1 150),
        (166, .prune .s1 293),
        (178, .prune .Q1 150),
        (180, .prune .s1 293),
        (270, .prune .s1 293),
        (275, .prune .s1 293),
        (277, .prune .s1 293),
        (278, .prune .s1 293),
        (282, .prune .Q1 150),
        (284, .prune .s1 293),
        (291, .prune .s1 293),
        (293, .prune .s1 293),
        (294, .prune .s1 293),
        (298, .prune .s1 293),
        (300, .prune .s1 293),
        (305, .prune .s1 293),
        (306, .prune .s1 293),
        (308, .prune .s1 293),
        (312, .prune .s1 293),
        (390, .prune .s1 293),
        (402, .prune .Q1 150),
        (404, .prune .s1 293),
        (418, .prune .s1 293),
        (420, .prune .s1 293),
        (432, .prune .s1 293)
      ]),
    (305, .prune .u 312),
    (308, .prune .Q1 150),
    (404, .prune .Q1 150),
    (420, .prune .Q1 150),
    (432, .prune .Q1 150),
    (533, .prune .Q1 150),
    (549, .split [
        (30, .prune .Q1 150),
        (46, .prune .s1 549),
        (51, .prune .s1 549),
        (53, .prune .s1 549),
        (54, .prune .s1 549),
        (58, .prune .Q1 150),
        (60, .prune .s1 549),
        (86, .prune .Q1 150),
        (102, .prune .s1 549),
        (114, .prune .Q1 150),
        (116, .prune .s1 549),
        (150, .prune .Q1 150),
        (166, .prune .s1 549),
        (178, .prune .Q1 150),
        (180, .prune .s1 549),
        (270, .prune .Q1 150),
        (275, .prune .Q1 150),
        (277, .prune .s1 549),
        (278, .prune .Q1 150),
        (282, .prune .Q1 150),
        (284, .prune .Q1 150),
        (291, .prune .s1 549),
        (293, .prune .s1 549),
        (294, .prune .s1 549),
        (298, .prune .u 312),
        (300, .prune .s1 549),
        (305, .prune .s1 549),
        (306, .prune .Q1 150),
        (308, .prune .s1 549),
        (312, .prune .u 312),
        (390, .prune .Q1 150),
        (402, .prune .Q1 150),
        (404, .prune .Q1 150),
        (418, .prune .Q1 150),
        (420, .prune .s1 549),
        (432, .prune .Q1 150)
      ]),
    (561, .prune .u 312),
    (564, .prune .Q1 150),
    (660, .prune .Q1 150),
    (676, .prune .Q1 150),
    (688, .prune .Q1 150)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.s1, .Q2, .Pw, .s2, .Pu, .s3] [(.Q1, 150), (.u, 312)] certificate = true := by
  decide

end Problem97.S1834TreeProof.Shard10Child11
