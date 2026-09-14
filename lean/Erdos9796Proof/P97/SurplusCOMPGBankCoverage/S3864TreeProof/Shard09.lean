import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard09Child30

namespace Problem97.S3864TreeProof.Shard09

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 408),
    (29, .prune .u 408),
    (30, .prune .u 408),
    (46, Shard09Child03.certificate),
    (54, Shard09Child04.certificate),
    (58, .prune .u 408),
    (60, .prune .u 408),
    (78, Shard09Child07.certificate),
    (86, Shard09Child08.certificate),
    (90, .prune .u 408),
    (92, .prune .u 408),
    (142, .prune .u 408),
    (150, .prune .u 408),
    (154, .prune .u 408),
    (156, .prune .u 408),
    (523, Shard09Child15.certificate),
    (525, Shard09Child16.certificate),
    (526, Shard09Child17.certificate),
    (531, Shard09Child18.certificate),
    (533, Shard09Child19.certificate),
    (534, Shard09Child20.certificate),
    (537, .prune .u 408),
    (538, .prune .u 408),
    (540, .prune .u 408),
    (582, Shard09Child24.certificate),
    (586, Shard09Child25.certificate),
    (588, Shard09Child26.certificate),
    (594, Shard09Child27.certificate),
    (596, Shard09Child28.certificate),
    (600, .prune .u 408),
    (646, Shard09Child30.certificate),
    (650, .prune .u 408),
    (652, .prune .u 408),
    (658, .prune .u 408),
    (660, .prune .u 408),
    (664, .prune .u 408)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q1, .Q2, .Pw, .Pu, .s2, .s1, .s3] [(.u, 408)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard09Child03.checked, Shard09Child04.checked, by decide, by decide, Shard09Child07.checked, Shard09Child08.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child15.checked, Shard09Child16.checked, Shard09Child17.checked, Shard09Child18.checked, Shard09Child19.checked, Shard09Child20.checked, by decide, by decide, by decide, Shard09Child24.checked, Shard09Child25.checked, Shard09Child26.checked, Shard09Child27.checked, Shard09Child28.checked, by decide, Shard09Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard09
