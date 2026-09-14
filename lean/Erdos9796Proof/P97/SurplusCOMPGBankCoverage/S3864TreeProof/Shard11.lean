import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard11Child30

namespace Problem97.S3864TreeProof.Shard11

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 600),
    (29, .prune .u 600),
    (30, .prune .u 600),
    (46, Shard11Child03.certificate),
    (54, Shard11Child04.certificate),
    (58, .prune .u 600),
    (60, .prune .u 600),
    (78, .prune .u 600),
    (86, .prune .u 600),
    (90, .prune .u 600),
    (92, .prune .u 600),
    (142, Shard11Child11.certificate),
    (150, Shard11Child12.certificate),
    (154, .prune .u 600),
    (156, .prune .u 600),
    (523, .prune .u 600),
    (525, .prune .u 600),
    (526, .prune .u 600),
    (531, .prune .u 600),
    (533, .prune .u 600),
    (534, .prune .u 600),
    (537, .prune .u 600),
    (538, .prune .u 600),
    (540, .prune .u 600),
    (582, .prune .u 600),
    (586, .prune .u 600),
    (588, .prune .u 600),
    (594, .prune .u 600),
    (596, .prune .u 600),
    (600, .prune .u 600),
    (646, Shard11Child30.certificate),
    (650, .prune .u 600),
    (652, .prune .u 600),
    (658, .prune .u 600),
    (660, .prune .u 600),
    (664, .prune .u 600)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q1, .Q2, .Pw, .Pu, .s2, .s1, .s3] [(.u, 600)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard11Child03.checked, Shard11Child04.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard11Child11.checked, Shard11Child12.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard11Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard11
