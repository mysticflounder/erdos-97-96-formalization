# Round 6: other-cap double-hit bank audit

## Verdict

**NEGATIVE.**  The source tree already contains the desired *conditional
consumer*, but neither its import closure nor any of the required theorem-bank
registries supplies a producer of its two-hit antecedent from
`RetainedOmissionAllLargeNormalForm` plus `TriApexAllLargeContext`.

This was a source-only audit: no Lean/Lake/solver command was run.  Thus
“source-reachable” below means visible through current source imports (or the
bank's recorded source-reachability field), not a fresh kernel/axiom audit.
The anchored terminal remains the explicit `sorry` at
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6941`).

## Direct local consumer: available, but conditional

`FrontierLiveClosure.lean` directly imports `ApexRichClassStructure.lean`
(line 7), and defines the following consumer in the same module:

```lean
theorem false_of_criticalShell_center_in_cap_of_two_hits_in_distinct_cap
    {D} {S : SurplusCapPacket D.A} {H : CriticalShellSystem D.A}
    {i j : Fin 3} {x} (hx : x ∈ D.A)
    (hcenter : H.centerAt x hx ∈ S.capInteriorByIndex i)
    (hij : i ≠ j)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex j))
    (hunique : IsUniqueFourCenter D.A (H.centerAt x hx)) {r}
    (htwo : 2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
      (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
        S.capInteriorByIndex j)).card) : False
```

Source: `FrontierLiveClosure.lean:6662-6679`.  It calls the local localization
lemma `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`
(`:6612-6655`): two hits in rich cap `j` put the same blocker in `j`, contrary
to its already-known membership in distinct cap `i`.  This exactly verifies
the proposed **last step**, not the missing production step.

The imported general bound points in the opposite direction:

```lean
criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
  ... : ((shell.support ∩
    (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
      S.capInteriorByIndex i)).card ≤ 2)
```

Source: `ApexRichClassStructure.lean:104-122` (via
`criticalShell_inter_selectedClass_card_le_two_of_apexRich`, `:88-101`).
It permits a double hit; it neither forces one nor relates it to a different
cap.  `oppositeCapRichClassInteriorPattern_of_apexRichClassStructure`
(`:140-157`) similarly makes a rich apex yield either one strict-cap radius
with at least four points, or two radii with at least two points each; it has
no critical-shell membership conclusion.

## Hypothesis map and gap

| Consumer input | Available from the anchored inputs? | Source witness / gap |
| --- | --- | --- |
| critical shell and source `x, hx` | Yes | `H` is ambient in the target. |
| exact-four/unique blocker for its shell | Yes | `CriticalShellSystem` gives the canonical exact-four shell; the required `hunique` is the normal critical-system property. |
| blocker in cap `i` | Yes for the first-cap reverse shell in the reverse-hit normal-form arm | `Q.reverseHitFreshCommonDeletion.reverseBlocker_mem_capInterior`; its cap is `S.oppIndex1`. |
| distinct cap `j` | Chooseable | Any other index is distinct from `S.oppIndex1`; `G.apex_rich j` supplies only richness there. |
| rich apex at `j` | Yes | `G.apex_rich j`. |
| radius `r` and **two shell hits** in `SelectedClass(...j,r) ∩ capInteriorByIndex j` | **No** | This is the first missing antecedent. Neither `Q` nor `G` has a cross-cap shell-incidence field or an existential radius/point pair. |

More specifically, `RetainedOmissionAllLargeNormalForm`
(`FrontierLiveClosure.lean:6786-6825`) keeps `O.kept`, `O.deleted`, and—in
the reverse-hit arm—`fresh`, all in the *first* strict cap, plus
`reverseShell_inter_cap_eq = {kept, deleted}` and `fresh_not_mem_reverseShell`.
Its common-deletion packets contain two K4 rows and an overlap bound
(`CommonDeletionTwoCenter.lean:29-46`), but no membership in a radius slice of
either other cap.  `TriApexAllLargeContext` (`FrontierLiveClosure.lean:6855-6868`)
adds cap sizes, three rich-apex facts, and global cover data, but no shell
incidence.  Consequently the fresh arm cannot be mapped to `htwo` by a
renaming: it establishes first-cap data and, in the fresh arm, explicitly an
*omission* from the displayed first-cap reverse shell.

## Required-bank results

All seven mandated registries were inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`
- `certificates/p97_rvol_general_n_mining.{md,json}`
- `certificates/erdos97_legacy_general_n_mining.{md,json}`
- `certificates/erdos_general_theorem_p97_mining.{md,json}`

The closest p97-rvol entries, recorded `source_reachable: true` in that
registry, are **upper bounds or splitters conditional on a hit**, not a
producer:

- `Problem97.C5D3B.shortCap_inter_card_le_two_of_minimal_u3`,
  `lean/RVOL/P97/C5D3BC2LargeCapInterior.lean:1537`: a U5 K4 row meets a
  supplied short cap in at most two points.
- `...shortCap_inter_card_eq_one_or_two_of_mem_minimal_u3` (`:1551`) and
  `...shortCap_inter_singleton_or_pair_union_card_of_mem_minimal_u3`
  (`:4041`): begin from a supplied member/hit; the latter may branch to an
  explicit second member.
- `...freshWitness_pair_shortCap_inter_offRow_or_offShort_of_sameSideTerminal`
  (`:151`): begins from an assumed exact pair intersection.
- `Problem97.U1ShortShellPruning.long_apex_shell_card_le_two` and
  `short_endpoint_shell_meets_adjacent_cap_card_le_one`: containment/upper
  bounds under a different U1/M44 packet, not a source of two hits.
- `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
  (`lean/RVOL/P97/U1LargeCapRouteBTail.lean:2383`): an analogous Route-B
  package with extra Moser/cap-triple/live-row hypotheses.  It is not in the
  current target's import closure and does not consume the E1 normal form.

The general mining document also identifies an **unimported**
`EndpointCertificate.K4WindowBank.false_of_mem_k4DeadCertificates` as a
consumer for a Route-B shared-radius pair (lines 149-166, 841-842), while
recording the four-point classification as missing.  It is neither an E1
producer nor source-import reachable here.  Searches of both legacy registries
and the older `erdos-general-theorem` registry found no declaration matching a
critical-shell/rich-apex-radius-slice double-hit producer.

## Conclusion

The only valid next bridge for this route has the explicit shape

```lean
∃ (j : Fin 3) (hj : S.oppIndex1 ≠ j) (r : ℝ),
  2 ≤ ((K.support ∩
    (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
      S.capInteriorByIndex j)).card)
```

for the first-cap-localized critical shell `K` supplied by the selected E1
normal-form branch.  It must be derived from additional planar/packet
incidence information, not from the existing rich-class cardinalities or any
banked theorem found here.  Until such a producer is supplied, the proposed
other-cap double-hit route is a **CONJECTURED bridge with a NEGATIVE bank
audit**, not a closure path.
