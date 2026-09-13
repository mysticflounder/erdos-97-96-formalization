import Erdos9796Proof.P97.SurplusCOMPGBankCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child20
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child21
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child22
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child23
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child24
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child25
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08Child31Child34

namespace Problem97.S1840TreeProof.Shard08Child31

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def certificate : CompatibilityCertificate :=
  .split [
    (30, .prune .Q1 658),
    (46, Shard08Child31Child01.certificate),
    (51, .prune .Q1 658),
    (53, .prune .u 368),
    (54, .prune .Q1 658),
    (58, .prune .Q1 658),
    (60, .prune .u 368),
    (86, .prune .Q1 658),
    (102, .prune .u 368),
    (114, .prune .Q1 658),
    (116, .prune .u 368),
    (150, .prune .Q1 658),
    (166, .prune .Q1 658),
    (178, .prune .Q1 658),
    (180, .prune .Q1 658),
    (270, Shard08Child31Child15.certificate),
    (275, .prune .Q1 658),
    (277, Shard08Child31Child17.certificate),
    (278, .prune .Q1 658),
    (282, .prune .Q1 658),
    (284, Shard08Child31Child20.certificate),
    (291, Shard08Child31Child21.certificate),
    (293, Shard08Child31Child22.certificate),
    (294, Shard08Child31Child23.certificate),
    (298, Shard08Child31Child24.certificate),
    (300, Shard08Child31Child25.certificate),
    (305, .prune .u 368),
    (306, .prune .Q1 658),
    (308, .prune .u 368),
    (312, .prune .u 368),
    (390, .prune .Q1 658),
    (402, .prune .Q1 658),
    (404, .prune .Q1 658),
    (418, .prune .Q1 658),
    (420, Shard08Child31Child34.certificate),
    (432, .prune .Q1 658)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets
      [.Q2, .Pw, .Pu, .s2, .s3, .s1] [(.Q1, 658), (.u, 368)] certificate = true := by
  simp only [certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨by decide, Shard08Child31Child01.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child31Child15.checked, by decide, Shard08Child31Child17.checked, by decide, by decide, Shard08Child31Child20.checked, Shard08Child31Child21.checked, Shard08Child31Child22.checked, Shard08Child31Child23.checked, Shard08Child31Child24.checked, Shard08Child31Child25.checked, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, Shard08Child31Child34.checked, by decide, True.intro⟩

end Problem97.S1840TreeProof.Shard08Child31
