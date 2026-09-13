import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1834TreeProof.Shard10Child12

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (51, .prune .u 312),
    (53, .prune .Q1 166),
    (54, .prune .Q1 166),
    (116, .prune .Q1 166),
    (150, .prune .Q1 166),
    (166, .prune .Q1 166),
    (178, .prune .Q1 166),
    (180, .prune .Q1 166),
    (277, .split [
        (30, .prune .s1 277),
        (46, .prune .Q1 166),
        (51, .prune .s1 277),
        (53, .prune .s1 277),
        (54, .prune .s1 277),
        (58, .prune .Q1 166),
        (60, .prune .s1 277),
        (86, .prune .s1 277),
        (102, .prune .Q1 166),
        (114, .prune .Q1 166),
        (116, .prune .s1 277),
        (150, .prune .s1 277),
        (166, .prune .Q1 166),
        (178, .prune .Q1 166),
        (180, .prune .s1 277),
        (270, .prune .s1 277),
        (275, .prune .s1 277),
        (277, .prune .s1 277),
        (278, .prune .s1 277),
        (282, .prune .s1 277),
        (284, .prune .s1 277),
        (291, .prune .s1 277),
        (293, .prune .s1 277),
        (294, .prune .s1 277),
        (298, .prune .Q1 166),
        (300, .prune .s1 277),
        (305, .prune .s1 277),
        (306, .prune .s1 277),
        (308, .prune .s1 277),
        (312, .prune .s1 277),
        (390, .prune .s1 277),
        (402, .prune .s1 277),
        (404, .prune .s1 277),
        (418, .prune .Q1 166),
        (420, .prune .s1 277),
        (432, .prune .s1 277)
      ]),
    (293, .prune .Q1 166),
    (305, .prune .u 312),
    (308, .prune .Q1 166),
    (404, .prune .Q1 166),
    (420, .prune .Q1 166),
    (432, .prune .Q1 166),
    (533, .split [
        (30, .prune .s1 533),
        (46, .prune .Q1 166),
        (51, .prune .s1 533),
        (53, .prune .s1 533),
        (54, .prune .s1 533),
        (58, .prune .Q1 166),
        (60, .prune .s1 533),
        (86, .prune .s1 533),
        (102, .prune .Q1 166),
        (114, .prune .Q1 166),
        (116, .prune .s1 533),
        (150, .prune .s1 533),
        (166, .prune .Q1 166),
        (178, .prune .Q1 166),
        (180, .prune .s1 533),
        (270, .prune .Q1 166),
        (275, .prune .s1 533),
        (277, .prune .s1 533),
        (278, .prune .s1 533),
        (282, .prune .u 312),
        (284, .prune .s1 533),
        (291, .prune .Q1 166),
        (293, .prune .s1 533),
        (294, .prune .Q1 166),
        (298, .prune .Q1 166),
        (300, .prune .Q1 166),
        (305, .prune .s1 533),
        (306, .prune .Q1 166),
        (308, .prune .s1 533),
        (312, .prune .u 312),
        (390, .prune .Q1 166),
        (402, .prune .Q1 166),
        (404, .prune .s1 533),
        (418, .prune .Q1 166),
        (420, .prune .Q1 166),
        (432, .prune .Q1 166)
      ]),
    (549, .prune .Q1 166),
    (561, .prune .u 312),
    (564, .prune .Q1 166),
    (660, .prune .Q1 166),
    (676, .prune .Q1 166),
    (688, .prune .Q1 166)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.s1, .Q2, .Pw, .s2, .Pu, .s3] [(.Q1, 166), (.u, 312)] certificate = true := by
  decide

end Problem97.S1834TreeProof.Shard10Child12
