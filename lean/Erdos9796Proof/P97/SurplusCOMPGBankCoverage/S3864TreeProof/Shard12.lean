import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard12Child24

namespace Problem97.S3864TreeProof.Shard12

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 664),
    (29, .prune .u 664),
    (30, .prune .u 664),
    (46, Shard12Child03.certificate),
    (54, Shard12Child04.certificate),
    (58, .prune .u 664),
    (60, .prune .u 664),
    (78, Shard12Child07.certificate),
    (86, Shard12Child08.certificate),
    (90, .prune .u 664),
    (92, .prune .u 664),
    (142, .prune .u 664),
    (150, .prune .u 664),
    (154, .prune .u 664),
    (156, .prune .u 664),
    (523, .prune .u 664),
    (525, .prune .u 664),
    (526, .prune .u 664),
    (531, .prune .u 664),
    (533, .prune .u 664),
    (534, .prune .u 664),
    (537, .prune .u 664),
    (538, .prune .u 664),
    (540, .prune .u 664),
    (582, Shard12Child24.certificate),
    (586, .prune .u 664),
    (588, .prune .u 664),
    (594, .prune .u 664),
    (596, .prune .u 664),
    (600, .prune .u 664),
    (646, .prune .u 664),
    (650, .prune .u 664),
    (652, .prune .u 664),
    (658, .prune .u 664),
    (660, .prune .u 664),
    (664, .prune .u 664)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q1, .Q2, .Pw, .Pu, .s2, .s1, .s3] [(.u, 664)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard12Child03.checked, Shard12Child04.checked, by decide, by decide, Shard12Child07.checked, Shard12Child08.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard12Child24.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard12
