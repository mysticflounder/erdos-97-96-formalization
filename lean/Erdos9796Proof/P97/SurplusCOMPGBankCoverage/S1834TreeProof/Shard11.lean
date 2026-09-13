import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11Child26

namespace Problem97.S1834TreeProof.Shard11

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard11Child00.certificate),
    (46, Shard11Child01.certificate),
    (51, .prune .u 368),
    (53, .prune .u 368),
    (54, .prune .u 368),
    (58, .prune .u 368),
    (60, .prune .u 368),
    (86, .prune .u 368),
    (102, .prune .u 368),
    (114, .prune .u 368),
    (116, .prune .u 368),
    (150, Shard11Child11.certificate),
    (166, Shard11Child12.certificate),
    (178, .prune .u 368),
    (180, .prune .u 368),
    (533, Shard11Child15.certificate),
    (540, Shard11Child16.certificate),
    (549, Shard11Child17.certificate),
    (556, Shard11Child18.certificate),
    (561, .prune .u 368),
    (564, .prune .u 368),
    (568, .prune .u 368),
    (596, .prune .u 368),
    (612, .prune .u 368),
    (624, .prune .u 368),
    (660, Shard11Child25.certificate),
    (676, Shard11Child26.certificate),
    (688, .prune .u 368)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.Q1, .s1, .Q2, .Pw, .s2, .Pu, .s3] [(.u, 368)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard11Child00.checked, Shard11Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard11Child11.checked, Shard11Child12.checked, by decide, by decide, Shard11Child15.checked, Shard11Child16.checked, Shard11Child17.checked, Shard11Child18.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard11Child25.checked, Shard11Child26.checked, by decide, True.intro⟩

end Problem97.S1834TreeProof.Shard11
