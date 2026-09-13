import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child23
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10Child26

namespace Problem97.S1834TreeProof.Shard10

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 312),
    (46, .prune .u 312),
    (51, .prune .u 312),
    (53, .prune .u 312),
    (54, .prune .u 312),
    (58, .prune .u 312),
    (60, .prune .u 312),
    (86, Shard10Child07.certificate),
    (102, Shard10Child08.certificate),
    (114, .prune .u 312),
    (116, .prune .u 312),
    (150, Shard10Child11.certificate),
    (166, Shard10Child12.certificate),
    (178, .prune .u 312),
    (180, .prune .u 312),
    (533, Shard10Child15.certificate),
    (540, .prune .u 312),
    (549, Shard10Child17.certificate),
    (556, .prune .u 312),
    (561, .prune .u 312),
    (564, .prune .u 312),
    (568, .prune .u 312),
    (596, Shard10Child22.certificate),
    (612, Shard10Child23.certificate),
    (624, .prune .u 312),
    (660, Shard10Child25.certificate),
    (676, Shard10Child26.certificate),
    (688, .prune .u 312)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.Q1, .s1, .Q2, .Pw, .s2, .Pu, .s3] [(.u, 312)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard10Child07.checked, Shard10Child08.checked, by decide, by decide, Shard10Child11.checked, Shard10Child12.checked, by decide, by decide, Shard10Child15.checked, by decide, Shard10Child17.checked, by decide, by decide, by decide, by decide, Shard10Child22.checked, Shard10Child23.checked, by decide, Shard10Child25.checked, Shard10Child26.checked, by decide, True.intro⟩

end Problem97.S1834TreeProof.Shard10
