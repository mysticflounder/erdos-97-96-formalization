import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09Child30

namespace Problem97.S1840TreeProof.Shard09

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard09Child00.certificate),
    (46, Shard09Child01.certificate),
    (51, .prune .u 432),
    (53, .prune .u 432),
    (54, .prune .u 432),
    (58, .prune .u 432),
    (60, .prune .u 432),
    (86, Shard09Child07.certificate),
    (102, Shard09Child08.certificate),
    (114, .prune .u 432),
    (116, .prune .u 432),
    (150, .prune .u 432),
    (166, .prune .u 432),
    (178, .prune .u 432),
    (180, .prune .u 432),
    (531, Shard09Child15.certificate),
    (533, Shard09Child16.certificate),
    (534, Shard09Child17.certificate),
    (547, Shard09Child18.certificate),
    (549, Shard09Child19.certificate),
    (550, Shard09Child20.certificate),
    (561, .prune .u 432),
    (562, .prune .u 432),
    (564, .prune .u 432),
    (582, Shard09Child24.certificate),
    (594, Shard09Child25.certificate),
    (596, Shard09Child26.certificate),
    (610, Shard09Child27.certificate),
    (612, Shard09Child28.certificate),
    (624, .prune .u 432),
    (646, Shard09Child30.certificate),
    (658, .prune .u 432),
    (660, .prune .u 432),
    (674, .prune .u 432),
    (676, .prune .u 432),
    (688, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q1, .Q2, .Pw, .Pu, .s2, .s3, .s1] [(.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard09Child00.checked, Shard09Child01.checked, by decide, by decide, by decide, by decide, by decide, Shard09Child07.checked, Shard09Child08.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child15.checked, Shard09Child16.checked, Shard09Child17.checked, Shard09Child18.checked, Shard09Child19.checked, Shard09Child20.checked, by decide, by decide, by decide, Shard09Child24.checked, Shard09Child25.checked, Shard09Child26.checked, Shard09Child27.checked, Shard09Child28.checked, by decide, Shard09Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard09
