import Erdos9796Proof.P97.SurplusCOMPGBankCoverage

namespace Problem97.S1864TreeProof.Shard06Child17Child25Child22

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .Pw 267),
    (29, .prune .Pw 267),
    (30, .prune .Pw 267),
    (43, .prune .Pw 267),
    (45, .prune .Pw 267),
    (46, .prune .Pw 267),
    (51, .prune .Pw 267),
    (53, .prune .Q2 300),
    (54, .prune .Q2 300),
    (57, .prune .Pw 267),
    (58, .prune .Pw 267),
    (60, .prune .Q2 300),
    (83, .prune .Pw 267),
    (85, .prune .Q1 533),
    (86, .prune .Q1 533),
    (99, .prune .Pw 267),
    (101, .prune .Q2 300),
    (102, .prune .Q2 300),
    (113, .prune .u 178),
    (114, .prune .u 178),
    (116, .prune .Q2 300),
    (267, .prune .Pw 267),
    (269, .prune .Pw 267),
    (270, .prune .Pw 267),
    (275, .prune .Pw 267),
    (277, .prune .Pw 267),
    (278, .prune .Pw 267),
    (281, .prune .Pw 267),
    (282, .prune .Pw 267),
    (284, .prune .Pw 267),
    (323, .prune .Pw 267),
    (325, .prune .Pw 267),
    (326, .prune .Pw 267),
    (337, .prune .Pw 267),
    (338, .prune .Pw 267),
    (340, .prune .Q1 533),
    (523, .prune .Pw 267),
    (525, .prune .Pw 267),
    (526, .prune .Pw 267),
    (531, .prune .Pw 267),
    (533, .prune .Q1 533),
    (534, .prune .Q1 533),
    (537, .prune .Pw 267),
    (538, .prune .Pw 267),
    (540, .prune .Q2 300),
    (579, .prune .Pw 267),
    (581, .prune .Q1 533),
    (582, .prune .Q1 533),
    (593, .prune .Q1 533),
    (594, .prune .Q1 533),
    (596, .prune .Q1 533)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1864Fixed s1864Targets
      [.Pu, .s3, .s2, .s1] [(.Pw, 267), (.Q2, 300), (.Q1, 533), (.u, 178)] certificate = true := by
  decide

end Problem97.S1864TreeProof.Shard06Child17Child25Child22
