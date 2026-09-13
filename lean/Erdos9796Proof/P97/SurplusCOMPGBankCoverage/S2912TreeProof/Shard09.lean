import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child26
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09Child30

namespace Problem97.S2912TreeProof.Shard09

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard09Child00.certificate),
    (43, .prune .u 424),
    (45, .prune .u 424),
    (46, .prune .u 424),
    (54, Shard09Child04.certificate),
    (58, .prune .u 424),
    (60, .prune .u 424),
    (78, Shard09Child07.certificate),
    (102, Shard09Child08.certificate),
    (106, .prune .u 424),
    (108, .prune .u 424),
    (142, .prune .u 424),
    (166, .prune .u 424),
    (170, .prune .u 424),
    (172, .prune .u 424),
    (523, Shard09Child15.certificate),
    (525, Shard09Child16.certificate),
    (526, Shard09Child17.certificate),
    (547, Shard09Child18.certificate),
    (549, Shard09Child19.certificate),
    (550, Shard09Child20.certificate),
    (553, .prune .u 424),
    (554, .prune .u 424),
    (556, .prune .u 424),
    (582, Shard09Child24.certificate),
    (586, Shard09Child25.certificate),
    (588, Shard09Child26.certificate),
    (610, Shard09Child27.certificate),
    (612, Shard09Child28.certificate),
    (616, .prune .u 424),
    (646, Shard09Child30.certificate),
    (650, .prune .u 424),
    (652, .prune .u 424),
    (674, .prune .u 424),
    (676, .prune .u 424),
    (680, .prune .u 424)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2912Fixed s2912Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s1, .s2] [(.u, 424)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard09Child00.checked, by decide, by decide, by decide, Shard09Child04.checked, by decide, by decide, Shard09Child07.checked, Shard09Child08.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child15.checked, Shard09Child16.checked, Shard09Child17.checked, Shard09Child18.checked, Shard09Child19.checked, Shard09Child20.checked, by decide, by decide, by decide, Shard09Child24.checked, Shard09Child25.checked, Shard09Child26.checked, Shard09Child27.checked, Shard09Child28.checked, by decide, Shard09Child30.checked, by decide, by decide, by decide, by decide, by decide, True.intro⟩

end Problem97.S2912TreeProof.Shard09
