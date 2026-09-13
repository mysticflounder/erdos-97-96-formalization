import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child10
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child13
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child27
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child28
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child33
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child34
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09Child35

namespace Problem97.S1777TreeProof.Shard09

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
    (142, Shard09Child07.certificate),
    (150, Shard09Child08.certificate),
    (154, Shard09Child09.certificate),
    (156, Shard09Child10.certificate),
    (166, Shard09Child11.certificate),
    (170, Shard09Child12.certificate),
    (172, Shard09Child13.certificate),
    (178, .prune .u 432),
    (180, .prune .u 432),
    (184, .prune .u 432),
    (278, .prune .u 432),
    (294, .prune .u 432),
    (306, .prune .u 432),
    (308, .prune .u 432),
    (390, Shard09Child21.certificate),
    (402, .prune .u 432),
    (404, .prune .u 432),
    (418, .prune .u 432),
    (420, .prune .u 432),
    (432, .prune .u 432),
    (534, Shard09Child27.certificate),
    (550, Shard09Child28.certificate),
    (562, .prune .u 432),
    (564, .prune .u 432),
    (646, Shard09Child31.certificate),
    (658, Shard09Child32.certificate),
    (660, Shard09Child33.certificate),
    (674, Shard09Child34.certificate),
    (676, Shard09Child35.certificate),
    (688, .prune .u 432)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s1 s1777Fixed s1777Target
      [.Pw, .Pu, .Q1, .Q2, .s1, .s2, .s3] [(.u, 432)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificate, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard09Child00.checked, Shard09Child01.checked, by decide, by decide, by decide, by decide, by decide, Shard09Child07.checked, Shard09Child08.checked, Shard09Child09.checked, Shard09Child10.checked, Shard09Child11.checked, Shard09Child12.checked, Shard09Child13.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard09Child21.checked, by decide, by decide, by decide, by decide, by decide, Shard09Child27.checked, Shard09Child28.checked, by decide, by decide, Shard09Child31.checked, Shard09Child32.checked, Shard09Child33.checked, Shard09Child34.checked, Shard09Child35.checked, by decide, True.intro⟩

end Problem97.S1777TreeProof.Shard09
