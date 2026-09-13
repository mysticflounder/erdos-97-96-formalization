import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11Child30

namespace Problem97.S1840TreeProof.Shard11

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard11Child00.certificate),
    (46, Shard11Child01.certificate),
    (51, .prune .u 624),
    (53, .prune .u 624),
    (54, .prune .u 624),
    (58, .prune .u 624),
    (60, .prune .u 624),
    (86, .prune .u 624),
    (102, .prune .u 624),
    (114, .prune .u 624),
    (116, .prune .u 624),
    (150, Shard11Child11.certificate),
    (166, Shard11Child12.certificate),
    (178, .prune .u 624),
    (180, .prune .u 624),
    (531, .prune .u 624),
    (533, .prune .u 624),
    (534, .prune .u 624),
    (547, .prune .u 624),
    (549, .prune .u 624),
    (550, .prune .u 624),
    (561, .prune .u 624),
    (562, .prune .u 624),
    (564, .prune .u 624),
    (582, .prune .u 624),
    (594, .prune .u 624),
    (596, .prune .u 624),
    (610, .prune .u 624),
    (612, .prune .u 624),
    (624, .prune .u 624),
    (646, Shard11Child30.certificate),
    (658, .prune .u 624),
    (660, .prune .u 624),
    (674, .prune .u 624),
    (676, .prune .u 624),
    (688, .prune .u 624)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q1, .Q2, .Pw, .Pu, .s2, .s3, .s1] [(.u, 624)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard11Child00.checked, Shard11Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard11Child11.checked, Shard11Child12.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard11Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard11
