import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child33
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08Child34

namespace Problem97.S1904TreeProof.Shard08

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard08Child00.certificate),
    (46, Shard08Child01.certificate),
    (51, .prune .u 368),
    (53, .prune .u 368),
    (54, .prune .u 368),
    (58, .prune .u 368),
    (60, .prune .u 368),
    (86, .prune .u 368),
    (102, .prune .u 368),
    (114, .prune .u 368),
    (116, .prune .u 368),
    (150, Shard08Child11.certificate),
    (166, Shard08Child12.certificate),
    (178, .prune .u 368),
    (180, .prune .u 368),
    (531, Shard08Child15.certificate),
    (533, Shard08Child16.certificate),
    (534, Shard08Child17.certificate),
    (547, Shard08Child18.certificate),
    (549, Shard08Child19.certificate),
    (550, Shard08Child20.certificate),
    (561, .prune .u 368),
    (562, .prune .u 368),
    (564, .prune .u 368),
    (582, Shard08Child24.certificate),
    (594, .prune .u 368),
    (596, .prune .u 368),
    (610, .prune .u 368),
    (612, .prune .u 368),
    (624, .prune .u 368),
    (646, Shard08Child30.certificate),
    (658, Shard08Child31.certificate),
    (660, Shard08Child32.certificate),
    (674, Shard08Child33.certificate),
    (676, Shard08Child34.certificate),
    (688, .prune .u 368)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1904Fixed s1904Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s2, .s1] [(.u, 368)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard08Child00.checked, Shard08Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child11.checked, Shard08Child12.checked, by decide, by decide, Shard08Child15.checked, Shard08Child16.checked, Shard08Child17.checked, Shard08Child18.checked, Shard08Child19.checked, Shard08Child20.checked, by decide, by decide, by decide, Shard08Child24.checked, by decide, by decide, by decide, by decide, by decide, Shard08Child30.checked, Shard08Child31.checked, Shard08Child32.checked, Shard08Child33.checked, Shard08Child34.checked, by decide, True.intro⟩

end Problem97.S1904TreeProof.Shard08
