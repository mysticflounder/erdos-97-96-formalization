import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1834TreeProof.Shard08Child13

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (51, .prune .Q1 178),
    (53, .prune .Q1 178),
    (54, .prune .Q1 178),
    (116, .prune .Q1 178),
    (150, .prune .Q1 178),
    (166, .prune .Q1 178),
    (178, .prune .Q1 178),
    (180, .prune .Q1 178),
    (277, .split [
        (30, .prune .s1 277),
        (46, .prune .Q1 178),
        (51, .prune .s1 277),
        (53, .prune .s1 277),
        (54, .prune .s1 277),
        (58, .prune .Q1 178),
        (60, .prune .s1 277),
        (86, .prune .s1 277),
        (102, .prune .Q1 178),
        (114, .prune .Q1 178),
        (116, .prune .s1 277),
        (150, .prune .s1 277),
        (166, .prune .Q1 178),
        (178, .prune .Q1 178),
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
        (298, .prune .Q1 178),
        (300, .prune .s1 277),
        (305, .prune .s1 277),
        (306, .prune .s1 277),
        (308, .prune .s1 277),
        (312, .prune .s1 277),
        (390, .prune .s1 277),
        (402, .prune .s1 277),
        (404, .prune .s1 277),
        (418, .prune .Q1 178),
        (420, .prune .s1 277),
        (432, .prune .s1 277)
      ]),
    (293, .prune .u 300),
    (305, .prune .Q1 178),
    (308, .prune .Q1 178),
    (404, .prune .Q1 178),
    (420, .prune .Q1 178),
    (432, .prune .Q1 178),
    (533, .split [
        (30, .prune .s1 533),
        (46, .prune .Q1 178),
        (51, .prune .s1 533),
        (53, .prune .s1 533),
        (54, .prune .s1 533),
        (58, .prune .Q1 178),
        (60, .prune .s1 533),
        (86, .prune .s1 533),
        (102, .prune .Q1 178),
        (114, .prune .Q1 178),
        (116, .prune .s1 533),
        (150, .prune .s1 533),
        (166, .prune .Q1 178),
        (178, .prune .Q1 178),
        (180, .prune .s1 533),
        (270, .prune .u 300),
        (275, .prune .s1 533),
        (277, .prune .s1 533),
        (278, .prune .s1 533),
        (282, .prune .Q1 178),
        (284, .prune .s1 533),
        (291, .prune .Q1 178),
        (293, .prune .s1 533),
        (294, .prune .Q1 178),
        (298, .prune .Q1 178),
        (300, .prune .u 300),
        (305, .prune .s1 533),
        (306, .prune .Q1 178),
        (308, .prune .s1 533),
        (312, .prune .Q1 178),
        (390, .prune .Q1 178),
        (402, .prune .Q1 178),
        (404, .prune .s1 533),
        (418, .prune .Q1 178),
        (420, .prune .Q1 178),
        (432, .prune .Q1 178)
      ]),
    (549, .prune .u 300),
    (561, .prune .Q1 178),
    (564, .prune .Q1 178),
    (660, .prune .Q1 178),
    (676, .prune .Q1 178),
    (688, .prune .Q1 178)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.s1, .Q2, .Pw, .s2, .Pu, .s3] [(.Q1, 178), (.u, 300)] certificate = true := by
  decide

end Problem97.S1834TreeProof.Shard08Child13
