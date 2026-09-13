import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child13
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child23
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07Child27

namespace Problem97.S1834TreeProof.Shard07

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 284),
    (46, .prune .u 284),
    (51, Shard07Child02.certificate),
    (53, .prune .u 284),
    (54, .prune .u 284),
    (58, .prune .u 284),
    (60, .prune .u 284),
    (86, .prune .u 284),
    (102, Shard07Child08.certificate),
    (114, Shard07Child09.certificate),
    (116, .prune .u 284),
    (150, .prune .u 284),
    (166, Shard07Child12.certificate),
    (178, Shard07Child13.certificate),
    (180, .prune .u 284),
    (533, .prune .u 284),
    (540, .prune .u 284),
    (549, Shard07Child17.certificate),
    (556, .prune .u 284),
    (561, Shard07Child19.certificate),
    (564, .prune .u 284),
    (568, .prune .u 284),
    (596, .prune .u 284),
    (612, Shard07Child23.certificate),
    (624, Shard07Child24.certificate),
    (660, .prune .u 284),
    (676, Shard07Child26.certificate),
    (688, Shard07Child27.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.Q1, .s1, .Q2, .Pw, .s2, .Pu, .s3] [(.u, 284)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, Shard07Child02.checked, by decide, by decide, by decide, by decide, by decide, Shard07Child08.checked, Shard07Child09.checked, by decide, by decide, Shard07Child12.checked, Shard07Child13.checked, by decide, by decide, by decide, Shard07Child17.checked, by decide, Shard07Child19.checked, by decide, by decide, by decide, Shard07Child23.checked, Shard07Child24.checked, by decide, Shard07Child26.checked, Shard07Child27.checked, True.intro⟩

end Problem97.S1834TreeProof.Shard07
