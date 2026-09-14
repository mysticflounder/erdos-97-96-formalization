import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard07Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard07Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard07Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard07Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard07Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard07Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard07Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard07Child33

namespace Problem97.S3864TreeProof.Shard07

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 284),
    (29, .prune .u 284),
    (30, .prune .u 284),
    (46, .prune .u 284),
    (54, .prune .u 284),
    (58, .prune .u 284),
    (60, .prune .u 284),
    (78, .prune .u 284),
    (86, .prune .u 284),
    (90, .prune .u 284),
    (92, .prune .u 284),
    (142, .prune .u 284),
    (150, .prune .u 284),
    (154, .prune .u 284),
    (156, .prune .u 284),
    (523, Shard07Child15.certificate),
    (525, .prune .u 284),
    (526, .prune .u 284),
    (531, Shard07Child18.certificate),
    (533, .prune .u 284),
    (534, .prune .u 284),
    (537, .prune .u 284),
    (538, .prune .u 284),
    (540, .prune .u 284),
    (582, Shard07Child24.certificate),
    (586, Shard07Child25.certificate),
    (588, .prune .u 284),
    (594, Shard07Child27.certificate),
    (596, .prune .u 284),
    (600, .prune .u 284),
    (646, Shard07Child30.certificate),
    (650, Shard07Child31.certificate),
    (652, .prune .u 284),
    (658, Shard07Child33.certificate),
    (660, .prune .u 284),
    (664, .prune .u 284)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q1, .Q2, .Pw, .Pu, .s2, .s1, .s3] [(.u, 284)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard07Child15.checked, by decide, by decide, Shard07Child18.checked, by decide, by decide, by decide, by decide, by decide, Shard07Child24.checked, Shard07Child25.checked, by decide, Shard07Child27.checked, by decide, by decide, Shard07Child30.checked, Shard07Child31.checked, by decide, Shard07Child33.checked, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard07
