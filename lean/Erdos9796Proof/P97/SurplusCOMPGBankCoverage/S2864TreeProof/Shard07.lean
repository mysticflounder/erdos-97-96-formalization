import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child13
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07Child25

namespace Problem97.S2864TreeProof.Shard07

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .u 284),
    (43, Shard07Child01.certificate),
    (45, .prune .u 284),
    (46, .prune .u 284),
    (54, .prune .u 284),
    (58, .prune .u 284),
    (60, .prune .u 284),
    (78, .prune .u 284),
    (102, Shard07Child08.certificate),
    (106, Shard07Child09.certificate),
    (108, .prune .u 284),
    (142, .prune .u 284),
    (166, Shard07Child12.certificate),
    (170, Shard07Child13.certificate),
    (172, .prune .u 284),
    (523, Shard07Child15.certificate),
    (525, .prune .u 284),
    (526, .prune .u 284),
    (534, .prune .u 284),
    (538, .prune .u 284),
    (540, .prune .u 284),
    (582, Shard07Child21.certificate),
    (586, Shard07Child22.certificate),
    (588, .prune .u 284),
    (646, Shard07Child24.certificate),
    (650, Shard07Child25.certificate),
    (652, .prune .u 284)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2864Fixed s2864Targets
      [.Q1, .Q2, .Pw, .Pu, .s1, .s3, .s2] [(.u, 284)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, Shard07Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard07Child08.checked, Shard07Child09.checked, by decide, by decide, Shard07Child12.checked, Shard07Child13.checked, by decide, Shard07Child15.checked, by decide, by decide, by decide, by decide, by decide, Shard07Child21.checked, Shard07Child22.checked, by decide, Shard07Child24.checked, Shard07Child25.checked, by decide, True.intro⟩

end Problem97.S2864TreeProof.Shard07
