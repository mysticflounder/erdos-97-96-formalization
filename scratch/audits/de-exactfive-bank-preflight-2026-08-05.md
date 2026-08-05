# P97 D--E exact-five obstruction-center theorem-bank preflight

**Status:** no valid bank closer.  This is a read-only preflight; it does not
promote, import, or claim a closure.

## Live surface audited

`D` is
`FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F` and `E`
is `FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F`, both in
`lean/Erdos9796Proof/P97/ATail/FirstApexUniqueRadiusResidual.lean`.

Their common surface supplies minimality, no-M44, `9 < D.A.card`, an exact
five selected class, uniqueness of a four-or-more radius, first-apex full
deletion robustness, the original and interior-pair double-deletion
obstructions, and the interior critical-pair frontier.  D further supplies
distinct selected centers and a directed cross-deletion survivor; E instead
supplies equal centers, mutual cross-membership, the common center's interior
and non-surplus location, and no third carrier bisector.  In particular,
neither branch supplies `D.A.card = 11`, a U1 source-row packet with its
explicit row equalities, a U5 q-critical class packet, a fixed-cardinality
chart, or a legacy coordinate/sign configuration.

## Applicable declaration found

The only pair-adjacent mined declaration whose entire antecedent is already
available (instantiate once at each interior source) is:

| Declaration | Provenance | Entailed antecedent | Result and status |
|---|---|---|---|
| `Problem97.CriticalShellSystem.source_eq_named` | sibling `p97-rvol`, `lean/RVOL/P97/U1CarrierInjection.lean`, source-proved and RVOL-reachable in `certificates/p97_rvol_general_n_mining.json` | `H : CriticalShellSystem D.A` and `q ∈ D.A` (respectively `w ∈ D.A`) come from `R.interior.frontier.pair` | Names a source as one of its selected-row labels.  It neither derives a row-slot packet nor contradicts D or E, so it is **not a closer**. |

No other pair-relevant mined declaration has all of its hypotheses entailed by
the D--E surface.

## Rejected families (first missing antecedent)

- The 96 `U5` global-incidence incompatibility families in the sibling bank
  require classification of the live packet into their bounded q-critical
  class/incidence hypotheses.  D/E gives only a critical-pair frontier and
  center relation; it does not entail that classifier.
- The unimported `U1` source-unit contradiction consumers require their
  concrete row-slot packet and explicit `hrows`/metric-core equalities.  D/E
  supplies neither.  They are also outside the sibling RVOL import closure.
- The legacy `erdos/97` reserves are fixed-N or fixed-coordinate/Radon/scalar
  consumers.  D/E only proves cardinality greater than nine and has none of
  their chart or coordinate hypotheses.
- The older `erdos-general-theorem` archive adds no elaborating source-free
  all-n closer; its C-F sign item is prose only and needs a reduced two-chord
  surface not present here.

The local cardinal-eleven endpoints are likewise not applicable: the
distinct-case theorem
`false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual_of_card_eq_eleven`
and the common-center certificate adapter both require the additional
`D.A.card = 11`, whereas the D--E obligations are general under `9 < D.A.card`.

## Registries and index checked

- `docs/general-n-certificate-bank-mining-2026-07-09.md`
- `certificates/p97_rvol_general_n_mining.md` and `.json`
- `certificates/erdos97_legacy_general_n_mining.md` and `.json`
- `certificates/erdos_general_theorem_p97_mining.md` and `.json`
- One indexed search only:
  `nthdegree docs search --lean 'P97 exact five common distinct obstruction center' --kind theorem`.
  Its pair-specific hits were the present-repo cardinal-eleven adapters/closer
  and the sibling U5 consumers; none supplies an all-general-n D--E closer.

**Conclusion:** the active mathematics remains the missing D/E producer or a
new direct contradiction; the bank contains no theorem whose antecedent and
conclusion close either exact-five obstruction-center branch.
