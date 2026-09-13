import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child13
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08Child27

namespace Problem97.S1834TreeProof.Shard08

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 300),
    (46, .prune .u 300),
    (51, Shard08Child02.certificate),
    (53, .prune .u 300),
    (54, .prune .u 300),
    (58, .prune .u 300),
    (60, .prune .u 300),
    (86, Shard08Child07.certificate),
    (102, .prune .u 300),
    (114, Shard08Child09.certificate),
    (116, .prune .u 300),
    (150, Shard08Child11.certificate),
    (166, .prune .u 300),
    (178, Shard08Child13.certificate),
    (180, .prune .u 300),
    (533, Shard08Child15.certificate),
    (540, .prune .u 300),
    (549, .prune .u 300),
    (556, .prune .u 300),
    (561, Shard08Child19.certificate),
    (564, .prune .u 300),
    (568, .prune .u 300),
    (596, Shard08Child22.certificate),
    (612, .prune .u 300),
    (624, Shard08Child24.certificate),
    (660, Shard08Child25.certificate),
    (676, .prune .u 300),
    (688, Shard08Child27.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets
      [.Q1, .s1, .Q2, .Pw, .s2, .Pu, .s3] [(.u, 300)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, by decide, Shard08Child02.checked, by decide, by decide, by decide, by decide, Shard08Child07.checked, by decide, Shard08Child09.checked, by decide, Shard08Child11.checked, by decide, Shard08Child13.checked, by decide, Shard08Child15.checked, by decide, by decide, by decide, Shard08Child19.checked, by decide, by decide, Shard08Child22.checked, by decide, Shard08Child24.checked, Shard08Child25.checked, by decide, Shard08Child27.checked, True.intro⟩

end Problem97.S1834TreeProof.Shard08
