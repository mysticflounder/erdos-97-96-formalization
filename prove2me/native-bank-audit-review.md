# Review of the native-bank replacement audit

Date: 2026-09-05. This is a read-only source review of
`prove2me/native-bank-audit.md`; it is not a Lean proof, build, or trust audit.

The central separation is correct. The polynomial section distinguishes the
universal semantic lemmas from the concrete coefficient identities and finite
rule/mask alignment checks. The cited declarations support that distinction:
`false_of_checkCertificate` and `false_of_checkProductSum` consume successful
checker premises, while `PolynomialGeometry` and `GeometryCore` prove zeros from
geometric antecedents. The report should retain the warning that reusing these
lemmas does not remove the native premises.

The outside-slice argument is mathematically sound. The source theorem
`BlockerVExactSeventeenSourceNormalForm.outsideSlice_card_eq_two` at line 640
has exactly the stated assumptions and concludes the stated cardinality by
subset cardinality and `Finset.card_sdiff_add_card_inter`. The proposed adapters
must discharge more than a name change: they must identify the Boolean filtered
support with a `Finset`, convert the Boolean conjunction in `hlong` into an
intersection-cardinality bound, prove both fixed hits lie in the long cap, and
prove that `outsideLabel` is injective with image equal to the complement of that
cap. Until those obligations are proved, “replaces two native proof sites” is a
plan or candidate impact, not an achieved reduction.

The `unused_or_exactCover` discussion is also supported by its source theorem at
`BlockerVExactSeventeenSourceNormalForm.lean:672`. Its formal conclusion is a
`Nodup` incidence bag whose `toFinset` is `outside`; the prose phrase “exact
partition” is a faithful interpretation only after translating the bag facts to
per-row disjointness and coverage. This theorem alone supplies no metric
contradiction and no coverage of the finite classifier’s admissibility cases.

The five-point candidate is accurately stated at
`Census554/FivePointCircleIsoscelesOrderBridge.lean:68`. Its assumptions include
convex independence, injective CCW enumeration with exact image, five strict
index inequalities, and the two selected-row membership packets. The two rows
yield the four distance equalities used by the core. Any claim that it retires
historical 555/654 cases still needs current case-to-antecedent adapters and a
fresh source/consumer check; the report correctly labels the historical “230
cores” figure as coverage evidence rather than current deletion proof.

Two wording controls are needed. The 135/101/34 and endpoint 105/12 figures are
directory-scoped source counts; they must not be presented as the repository
census until `native-bank-inventory.json` has been reconciled with all tracked
generated `.lean` files. Also, “general theorem” should refer to quantified
mathematical assumptions and a proof independent of the particular bank. A
theorem quantified over arbitrary assignments but proved from a fixed bank or a
native certificate remains an instance-backed wrapper.

The stated validation limits are appropriate: no build, fresh axiom probe,
refreeze, solver rerun, or proof submission was performed. Therefore every
existing source declaration cited here remains a reuse candidate pending import,
consumer, and transitive trust checks.
