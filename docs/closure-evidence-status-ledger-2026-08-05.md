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

## Corrected route ledger

| Work item | Correct status | What remains open |
|---|---|---|
| Rigid221 deleted-row casing | **CLOSED-TO-RESIDUAL** | The `BlockerV / vRowBlockerDeleted` on-class arm is kernel-proved; its sole surviving on-spine child pins the deleted-row blocker to the strict second-cap interior outside the exact physical five-class. Other five-cycle collision terminals remain open. |
| Rigid221 stage-4 pentagon oracle | **DIAGNOSTIC-ONLY** | SAT witnesses certify only the exact encoded row-trace/apex-circle subsystem; the encoding omits other Lean hypotheses and does not establish full geometric realizability. |
| Rigid221 pentagon `<= 1` mechanism | **PROSE-EXCLUDED** | The named squeeze mechanism is excluded on paper; no `sorry` is discharged and other deletion/K4/global-counting arguments remain available. |
| E1 paired common-deletion split | **CLOSED-TO-RESIDUAL** | The split produces stronger paired residual leaves, including the grid leaf and its cap-placement data. |
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
