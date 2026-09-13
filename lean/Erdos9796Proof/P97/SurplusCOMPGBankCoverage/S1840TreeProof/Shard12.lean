import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard12Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard12Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard12Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard12Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard12Child24

namespace Problem97.S1840TreeProof.Shard12

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard12Child00.certificate),
    (46, Shard12Child01.certificate),
    (51, .prune .u 688),
    (53, .prune .u 688),
    (54, .prune .u 688),
    (58, .prune .u 688),
    (60, .prune .u 688),
    (86, Shard12Child07.certificate),
    (102, Shard12Child08.certificate),
    (114, .prune .u 688),
    (116, .prune .u 688),
    (150, .prune .u 688),
    (166, .prune .u 688),
    (178, .prune .u 688),
    (180, .prune .u 688),
    (531, .prune .u 688),
    (533, .prune .u 688),
    (534, .prune .u 688),
    (547, .prune .u 688),
    (549, .prune .u 688),
    (550, .prune .u 688),
    (561, .prune .u 688),
    (562, .prune .u 688),
    (564, .prune .u 688),
    (582, Shard12Child24.certificate),
    (594, .prune .u 688),
    (596, .prune .u 688),
    (610, .prune .u 688),
    (612, .prune .u 688),
    (624, .prune .u 688),
    (646, .prune .u 688),
    (658, .prune .u 688),
    (660, .prune .u 688),
    (674, .prune .u 688),
    (676, .prune .u 688),
    (688, .prune .u 688)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q1, .Q2, .Pw, .Pu, .s2, .s3, .s1] [(.u, 688)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard12Child00.checked, Shard12Child01.checked, by decide, by decide, by decide, by decide, by decide, Shard12Child07.checked, Shard12Child08.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard12Child24.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard12
