import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child18
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child19
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child30
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child31
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child32
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child33
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08Child34

namespace Problem97.S2912TreeProof.Shard08

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard08Child00.certificate),
    (43, .prune .u 360),
    (45, .prune .u 360),
    (46, .prune .u 360),
    (54, Shard08Child04.certificate),
    (58, .prune .u 360),
    (60, .prune .u 360),
    (78, .prune .u 360),
    (102, .prune .u 360),
    (106, .prune .u 360),
    (108, .prune .u 360),
    (142, Shard08Child11.certificate),
    (166, Shard08Child12.certificate),
    (170, .prune .u 360),
    (172, .prune .u 360),
    (523, Shard08Child15.certificate),
    (525, Shard08Child16.certificate),
    (526, Shard08Child17.certificate),
    (547, Shard08Child18.certificate),
    (549, Shard08Child19.certificate),
    (550, Shard08Child20.certificate),
    (553, .prune .u 360),
    (554, .prune .u 360),
    (556, .prune .u 360),
    (582, Shard08Child24.certificate),
    (586, .prune .u 360),
    (588, .prune .u 360),
    (610, .prune .u 360),
    (612, .prune .u 360),
    (616, .prune .u 360),
    (646, Shard08Child30.certificate),
    (650, Shard08Child31.certificate),
    (652, Shard08Child32.certificate),
    (674, Shard08Child33.certificate),
    (676, Shard08Child34.certificate),
    (680, .prune .u 360)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2912Fixed s2912Targets
      [.Q1, .Q2, .Pw, .Pu, .s3, .s1, .s2] [(.u, 360)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard08Child00.checked, by decide, by decide, by decide, Shard08Child04.checked, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child11.checked, Shard08Child12.checked, by decide, by decide, Shard08Child15.checked, Shard08Child16.checked, Shard08Child17.checked, Shard08Child18.checked, Shard08Child19.checked, Shard08Child20.checked, by decide, by decide, by decide, Shard08Child24.checked, by decide, by decide, by decide, by decide, by decide, Shard08Child30.checked, Shard08Child31.checked, Shard08Child32.checked, Shard08Child33.checked, Shard08Child34.checked, by decide, True.intro⟩

end Problem97.S2912TreeProof.Shard08
