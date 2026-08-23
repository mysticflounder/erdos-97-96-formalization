# Closure evidence status ledger (2026-08-05)

This ledger records the claim corrections from the 2026-08-05 audit.  It is a
terminology and evidence ledger, not a proof artifact.  A green build, a finite
model, an `UNKNOWN` solver result, a source-clean producer, or a reduction to a
smaller residual is not by itself closure of a publish-target obligation.

## Status vocabulary

- **KERNEL-CLOSED** — the former obligation is discharged transitively on the
  publish spine, with no unapproved axiom or `sorryAx` in its dependency path.
- **CLOSED-TO-RESIDUAL** — a checked producer or exhaustive split replaces a
  parent by one or more explicit, load-bearing residual obligations.  This is
  narrowing, not theorem closure.
- **PROVEN-PRODUCER** — a checked theorem constructs useful data, but a named
  consumer or an ingress/lift hypothesis is still missing.
- **PROSE-EXCLUDED** — a written mathematical argument rules out one precisely
  named mechanism.  It is not kernel closure until formalized and wired.
- **RETIRED-AS-WORKSTREAM** — a search campaign is no longer recommended.  This
  is a planning decision, not a theorem that no proof of that broad type exists.
- **DIAGNOSTIC-ONLY** — finite, sampled, incomplete, or unreproducible evidence
  that may guide theorem discovery but cannot be promoted as closure.
- **PARKED-SPEC** — an exploratory or conditional interface that is not a
  current proof obligation and receives no closure credit.

Use the unqualified word "closed" only for **KERNEL-CLOSED** claims.  Otherwise
write the exact status above and name the residual, mechanism, or abstraction.

## 2026-08-22 complete-prose synthesis update

The 117-file prose bundle dated 2026-08-22 has been reconciled into the live
manuscript and branch audits. The bundle is complete as a collected research
library, not as a proof of Erdős Problem 97. No fresh integrated Lean build or
publish-spine axiom audit was run during this prose merge.

| Area | Strongest integrated evidence | Exact remaining boundary |
|---|---|---|
| Canonical descent | The deletion calculus, blocker reformulation, incidence package, MEC/surplus-cap extraction, `IsM44` branch, and universal physical-source package are assembled in one current manuscript. | The general non-`IsM44` contradiction remains open. |
| A5 escape | The 178-assignment classifier, ten same-side cells, and Cell 7 midpoint contradiction are exact finite/prose evidence. | Nine full-A5 same-side cells, Child O, source adapters, elaboration, and spine wiring remain. |
| B family / Rigid221 | Revision 4 gives source-validated B1/B2/B3 contracts; the exact-seventeen/cap-nine terminal is reduced to two cap orders and four outside pairs. | The B1 positive terminal, B2/B3 geometric consumers, exact-cover impossibility, and scalable `|A|≥18` transfer remain. The 57/57 check was static only. |
| F1 TriApex | The 2026-08-23 refactor kernel-checks `nonempty_pairedApexClassJointDeletion_of_reverseHit`: the shared retained source lowers the union of the two shell/class intersections to at most three, so a four-point frontier class supplies a source omitted from both shells. D3--D9 are source-clean compatibility wrappers through D1. D2 is now kernel-closed by the scaled-coordinate, convex-nesting, escape-synchronization, zero-cut boundary-sign, and polynomial route. | Exactly one independent live `sorry` root remains: D1, `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`. D2 has core-only axiom closure; the D1 route and publish target still reach `sorryAx`. The freshly mined global frontier is 28. |
| F2 TwoSource | Four intrinsic packets reduce to Root A/Root B; checkpoint 36 supplies a cross-radius mutual-omission-cycle producer; the preferred FreshThird route is prose-complete. | Eight live F2 `sorry`s, Root A, Root B, the F8 saturation adapter, preferred-source integration, build, and axiom audit remain. |
| F3 TwoDeletion | Local joint-locus calculus, physical traces, sparse conflict graphs, survival amplification, and bounded/grid/diagonal normal forms are prose-complete. | The second-pass recursive interface is rejected. Three live `sorry`s and five metric roots remain. |
| Literature bridge | LB0--LB2 are internal or prose-derived; LB3--LB7 identify external candidates; LB8--LB10 organize applicability and adapter work. | External statements and project-native adapters are unverified; the bridge closes no proof obligation. |

Superseded drafts, patches, ZIP/DOCX exports, static audits, and solver outputs
were integrated through their surviving claims, corrections, or provenance.
They are not independent proof authorities. Exact per-file disposition is in
`docs/p97-prose-material-integration-ledger-2026-08-22.md`.

## Corrected route ledger

| Work item | Correct status | What remains open |
|---|---|---|
| Rigid221 deleted-row casing | **CLOSED-TO-RESIDUAL** | The `BlockerV / vRowBlockerDeleted` on-class arm is kernel-proved; its sole surviving on-spine child pins the deleted-row blocker to the strict second-cap interior outside the exact physical five-class. Other five-cycle collision terminals remain open. |
| Rigid221 stage-4 pentagon oracle | **DIAGNOSTIC-ONLY** | SAT witnesses certify only the exact encoded row-trace/apex-circle subsystem; the encoding omits other Lean hypotheses and does not establish full geometric realizability. |
| Rigid221 pentagon `<= 1` mechanism | **PROSE-EXCLUDED** | The named squeeze mechanism is excluded on paper; no `sorry` is discharged and other deletion/K4/global-counting arguments remain available. |
| E1 paired common-deletion split | **CLOSED-TO-RESIDUAL** | The split produces stronger paired residual leaves, including the grid leaf and its cap-placement data. |
| E1 paired-grid D2 | **KERNEL-CLOSED** | `false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core` is reachable, has no `sorry`, and reports exactly `propext`, `Classical.choice`, and `Quot.sound`; D1 remains the F1 residual. |
| E1 paired-grid 400-branch probe | **DIAGNOSTIC-ONLY** | No committed paired-grid generator, branch manifest, exact command, or output artifact currently makes the reported `UNKNOWN` census reproducible. |
| FreshThird triple-shell escape | **PROVEN-PRODUCER** | The anonymous seed center and escape point still need named-label transport and endpoint-support ingress into a terminal consumer. |
| B1 blocker-collision contract | **PARKED-SPEC** | A source theorem producing the contract, plus a universal lift to the live leaf, is still absent. |

These classifications deliberately do not assert a current global `sorry`
count.  The authoritative count is the freshly generated proof-blueprint
frontier for the exact source revision being assessed.

## Artifact and provenance correction for `0ca00bc7`

Commit `0ca00bc7` is a mixed curation commit, not an atomic proof or certificate
landing.  It combines production Lean, scratch probes, generated CNF/model
files, reports, and a forward contract.  Some interfaces referenced there were
added by later commits, and the generated overflow artifacts do not carry a
complete command/manifest/hash chain in that commit.

Consequently:

1. do not cite `0ca00bc7` alone as evidence that any route or producer-consumer
   chain is complete;
2. treat its scratch results as discovery evidence until the exact generator,
   command line, input revision, output hashes, and independent replay are
   committed together;
3. audit the production theorem from its current statement, imports, axioms,
   and immediate spine consumer rather than from the mixed commit message; and
4. make future certificate or probe landings atomic enough that the semantic
   contract and the replay artifact can be reviewed in one change.

No history rewrite is required.  This ledger is the forward correction.
