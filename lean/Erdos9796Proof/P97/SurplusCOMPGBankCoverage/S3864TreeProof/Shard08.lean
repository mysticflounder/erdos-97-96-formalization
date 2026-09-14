import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child33
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3864TreeProof.Shard08Child34

namespace Problem97.S3864TreeProof.Shard08

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (27, .prune .u 344),
    (29, .prune .u 344),
    (30, .prune .u 344),
    (46, Shard08Child03.certificate),
    (54, Shard08Child04.certificate),
    (58, .prune .u 344),
    (60, .prune .u 344),
    (78, .prune .u 344),
    (86, .prune .u 344),
    (90, .prune .u 344),
    (92, .prune .u 344),
    (142, Shard08Child11.certificate),
    (150, Shard08Child12.certificate),
    (154, .prune .u 344),
    (156, .prune .u 344),
    (523, Shard08Child15.certificate),
    (525, Shard08Child16.certificate),
    (526, Shard08Child17.certificate),
    (531, Shard08Child18.certificate),
    (533, Shard08Child19.certificate),
    (534, Shard08Child20.certificate),
    (537, .prune .u 344),
    (538, .prune .u 344),
    (540, .prune .u 344),
    (582, Shard08Child24.certificate),
    (586, .prune .u 344),
    (588, .prune .u 344),
    (594, .prune .u 344),
    (596, .prune .u 344),
    (600, .prune .u 344),
    (646, Shard08Child30.certificate),
    (650, Shard08Child31.certificate),
    (652, Shard08Child32.certificate),
    (658, Shard08Child33.certificate),
    (660, Shard08Child34.certificate),
    (664, .prune .u 344)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s3 s3864Fixed s3864Targets
      [.Q1, .Q2, .Pw, .Pu, .s2, .s1, .s3] [(.u, 344)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, Shard08Child03.checked, Shard08Child04.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child11.checked, Shard08Child12.checked, by decide, by decide, Shard08Child15.checked, Shard08Child16.checked, Shard08Child17.checked, Shard08Child18.checked, Shard08Child19.checked, Shard08Child20.checked, by decide, by decide, by decide, Shard08Child24.checked, by decide, by decide, by decide, by decide, by decide, Shard08Child30.checked, Shard08Child31.checked, Shard08Child32.checked, Shard08Child33.checked, Shard08Child34.checked, by decide, True.intro⟩

end Problem97.S3864TreeProof.Shard08
