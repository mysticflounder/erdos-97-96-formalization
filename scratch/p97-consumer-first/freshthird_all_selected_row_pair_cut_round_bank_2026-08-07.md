# FreshThird all-selected-row shared-pair cut bank audit

Date: 2026-08-07  
Target: `freshthird_all_selected_row_pair_cut_round.results.txt`

## Solver status and normalized model

No solver was run in this audit. The saved run is a representative-only
artifact: structural LIA is `sat` (0.106 s), with 96 inherited cuts and 36
extra row-pair cuts (`results.txt:6-11`). The metric QF_LRA check is
`unknown` after 120.123 s, with no core (`:20-30`); `final_exact_result=sat`
means no contradiction was extracted, not that the source packet is
consistent. The run explicitly remains diagnostic pending universal source
coverage (`:3, :31-32`).

The model's alias classes normalize to

```text
qOutside = pinnedCenter
f1 = a2_0
qBetween = drowCenter
w0 = a3_0
a2_2 = a3_1
```

Only `drowCenter = qBetween` is the corrected endpoint assignment explicitly
required by this order arm (`:2`); the other equalities are model aliases.
`blocker_rows=1000,0100,0010,1001`, `blocker_caps=2222`, and all `cap_profiles`
are finite representative data, not source labels or universal cap facts.
The selected order `outside_fresh_between_source_canonical` is one model arm,
not a source-level order disjunction.

## Fresh global theorem search

The required natural-language `nthdegree docs search --lean --agentic` pass was
attempted (including queries for shared-pair cyclic alternation and
cardinality-generic consumers), but the agentic backend hit its
GPT-5.3-Codex-Spark usage limit and the retry returned no rows. Plain
all-corpus search was used as an evidence fallback. It returned:

* `Problem97.selectedFourClass_shared_pair_separated`,
  `P97/Phase3SharedPairSeparation.lean:31`;
* `SurplusCOMPGBank.btw_sep`, `P97/SurplusCOMPGBankSep.lean:100`;
* `Census554.SharedPairSeparationCore.satisfiedBy_of_realizes_ccw`,
  `P97/Census554/SeparationCore.lean:68`.

The weakest cardinality-generic consumer is `SurplusCOMPGBank.btw_sep`: for
arbitrary `Fin n`, CCW/injective boundary, distinct centers and points, and
two equal-radius equations, it returns `btw i j a ↔ ¬ btw i j b`. The exact
row-level adapter is `selectedFourClass_shared_pair_separated`, which obtains
those equalities from four selected-row membership proofs. Thus all 96 + 36
cuts are already instances of an existing generic consumer; this round adds
no new theorem or contradiction consumer.

## Source entitlement boundary and registry audit

The cut implication is source-entitled only after supplying a real
`BoundaryIndexing`/injective CCW boundary, distinct physical centers and
points, and memberships of the same two named supports in both rows. The
`support_eq_radius` equalities are therefore conditional source facts. The
finite aliases `f1=a2_0`, `w0=a3_0`, `a2_2=a3_1`, the blocker bit rows/caps,
and the chosen order arm have no universal source lift. Even
`qOutside=pinnedCenter` is an emergent representative alias, not a declared
FreshThird identity. The corrected `qBetween=drowCenter` assignment is the
only explicitly configured endpoint equality; a universal order/row-membership
producer is still missing.

Inspected all mandated registries:
`docs/general-n-certificate-bank-mining-2026-07-09.md`,
`certificates/p97_rvol_general_n_mining.{md,json}`,
`certificates/erdos97_legacy_general_n_mining.{md,json}`, and
`certificates/erdos_general_theorem_p97_mining.{md,json}`. They document
cardinality-independent separation/Kalmanson surfaces, but the sibling and
legacy ledgers report no exact-name or statement-shape duplicate and no
FreshThird source producer. Keep this SAT/`unknown` round diagnostic; do not
promote it to Lean closure.
