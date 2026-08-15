# Search-to-action policy audit — 2026-08-12

## Status and scope

This is a review document, not a policy change. It identifies wording that is
causing theorem search to be repeated during ordinary Lean proof work and gives
patch-ready recommendations for a separate reviewer to implement.

The intended workflow is:

1. After **every actual CEGAR wave**, run a fresh general-theorem mine over
   **only the new data produced by that wave**.
2. If that wave-data mine formulates a concrete candidate theorem, run one
   bounded external reuse search for that candidate in the project Lean corpus,
   sibling corpora, mathlib, or literature as appropriate.
3. During ordinary Lean proof development, do not repeat the same external
   theorem search unless the candidate statement, available hypotheses,
   intended consumer, imports, or relevant source revision has materially
   changed.

The audit does **not** recommend weakening the mandatory post-wave checkpoint.
It recommends narrowing that checkpoint to the evidence it is meant to analyze.

## Executive verdict

The main wording defect is in the canonical SAT/CEGAR guidance:

`plugins/math-toolchain/skills/sat-solvers/references/cegar-and-marco.md`

Its section titled “Global theorem search & bank — at every wave boundary
(MANDATORY)” currently requires every wave to search the whole accumulated
pattern bank and the outside world, including mathlib and literature. That
conflates two different operations:

- **wave-data theorem mining**, which should be mandatory after every CEGAR
  wave; and
- **external theorem reuse search**, which should be run once after a concrete
  candidate theorem has emerged.

The Lean guidance has a secondary omission. It correctly says to search before
proving, but gives no stable search key or stopping rule. This makes repeated
searches of an unchanged obligation look policy-compliant even after the first
search has already identified the same missing antecedent or circular route.

The observed FirstNonHit behavior is consistent with both defects: the same
unchanged producer interface was repeatedly searched during ordinary proof
work, even though no new CEGAR wave had produced new data and no candidate
contract had materially changed.

## Terms that should be made explicit

### CEGAR wave

A solver round with a fixed source contract and finite encoding. It ends at a
terminal verdict, map-UNSAT, budget stop, or the decision to launch a successor
round with a changed encoding or new cut.

### Wave data

Only artifacts newly produced by that completed wave, including:

- accepted cores, learned cuts, and nogoods;
- validated SAT survivors and exact readbacks;
- rejected models and the source-faithful clauses that reject them;
- coverage deltas, orbit summaries, and branch statistics;
- minimized contradictions and drop-one controls; and
- the wave’s trust and validation summaries.

Earlier waves, the entire theorem bank, indexed Lean corpora, mathlib, and the
literature are **not** wave data.

### Wave-data general-theorem mine

A mandatory analysis after every wave. It groups the current wave’s data into
recurring shapes, parameterized families, invariants, and candidate general
theorems; tests whether each candidate explains the current-wave artifacts; and
records either the candidates or an explicit no-new-pattern result.

### External theorem reuse search

A separate search of existing Lean theorem banks, sibling corpora, mathlib, or
literature for one concrete theorem candidate. Its search key is:

```text
(candidate statement and hypotheses,
 intended immediate consumer,
 relevant source/import revision)
```

A completed negative result closes this reuse phase until that key materially
changes. Source navigation, elaboration, and proof debugging do not by
themselves invalidate it.

## Evidence and root cause

### P0 — canonical CEGAR reference is over-broad

File:

`/Users/adam/projects/claude-plugins/local-plugins/plugins/math-toolchain/skills/sat-solvers/references/cegar-and-marco.md`

The current mandatory wave-boundary section says to:

- search the full accumulated bank rather than the wave;
- search mathlib and literature before deriving;
- repeat this at every wave boundary; and
- record how many accumulated patterns and external sources were searched.

That wording directly contradicts the intended scope. It makes a fresh external
Lean/literature search appear mandatory even when the only new event is a solver
wave, and it encourages re-auditing old patterns rather than learning from the
new wave.

The preceding “Data pattern mining” section is closer to the intended behavior,
but it also speaks of the accumulated bank. Its periodic in-wave checkpoint may
remain local to the new material collected in the current wave.

### P1 — Lean reuse guidance lacks an invalidation rule

Canonical file:

`/Users/adam/projects/claude-plugins/local-plugins/plugins/lean-usage/skills/lean-usage/SKILL.md`

Repository overlay:

`AGENTS.md`

Both correctly require semantic search before reproving a candidate. The
canonical Lean skill also requires statement, import, axiom, hypothesis, missing
antecedent, circularity, and consumer checks. Neither says when that search is
finished or what must change before it is repeated.

This omission matters during a long proof attempt. A negative search result can
be repeatedly re-run at each checkpoint despite an unchanged target and
unchanged ingress. The policy should distinguish:

- one reuse preflight for a concrete candidate;
- ordinary source navigation after that preflight; and
- a genuinely new candidate or interface that warrants a new preflight.

### P1 — authoritative plan uses ambiguous shorthand

File:

`docs/computational-closure-plan-2026-07-28.md`

The plan is authoritative and its mathematical strategy remains valid. Several
forward-looking passages use “global theorem-bank audit,” “global theorem-bank
pass,” “mandatory general-theorem scan,” or “exhaustive general-refinement
mining.” Without a local definition, those phrases can inherit the over-broad
canonical CEGAR meaning.

The plan already contains the right strategic precedent: section 13.7 says the
unbounded theorem-bank search is `RETIRED-AS-WORKSTREAM`. The ambiguity is in
checkpoint terminology, not in that decision.

### No material defect — trust and promotion policy

The solver discovery-versus-promotion distinction, kernel trust gates,
proof-blueprint spine checks, and source-level producer/lift requirements are
not responsible for repeated theorem searches. They should remain unchanged.

The SAT guidance correctly allows computation to discover a missing theorem
before that theorem has been proved. The proposed edits must not turn theorem
reuse search into a prerequisite for launching a source-faithful diagnostic
wave.

## Recommended changes

| Priority | File | Change | Reason |
|---|---|---|---|
| P0 | `plugins/math-toolchain/skills/sat-solvers/references/cegar-and-marco.md` | Replace the mandatory global wave-boundary search with mandatory current-wave-data theorem mining. | This is the direct source of the scope error. |
| P1 | `plugins/lean-usage/skills/lean-usage/SKILL.md` | Add a stable search key and stop/invalidation rule for external reuse searches. | Prevents repeated searches during unchanged Lean work. |
| P1 | repository `AGENTS.md` | Add the same distinction in short project-local wording. | Makes the intended local workflow explicit to every session. |
| P1 | `docs/computational-closure-plan-2026-07-28.md` | Define post-wave mining near the operating premise and clarify forward-looking checkpoint language. | Keeps the authoritative plan unambiguous. |
| P2 | `plugins/math-toolchain/skills/sat-solvers/SKILL.md` | Add a short cross-reference distinguishing wave-data mining from external theorem reuse. | Prevents the reference edit from being misread elsewhere. |

## Patch-ready wording

### 1. Replace the canonical mandatory CEGAR section

Replace “Global theorem search & bank — at every wave boundary (MANDATORY)”
with wording substantially equivalent to:

> ## Wave-data general-theorem mining — after every wave (MANDATORY)
>
> A wave ends at map-UNSAT, a terminal status, a budget stop, or a decision to
> launch a successor round. Before launching the next wave, analyze the
> artifacts newly produced by the completed wave as data.
>
> 1. Mine the current wave only: accepted cores and cuts, validated survivors,
>    exact readbacks, rejected proposals, coverage deltas, and validation
>    summaries.
> 2. Group recurring shapes, formulate parameterized families and invariants,
>    and state any candidate general theorem precisely.
> 3. Check each candidate against all relevant artifacts from the current wave.
> 4. Record the result even when no candidate emerges.
> 5. Bank any validated wave-level generalization and incorporate its cut or
>    consequence before the next wave.
>
> This mandatory checkpoint does not search prior waves, the entire theorem
> bank, indexed Lean corpora, mathlib, or literature. Cross-wave synthesis may
> be scheduled separately. If the wave-data analysis yields a concrete theorem
> candidate, run the Lean theorem-reuse preflight once for that candidate under
> the Lean-usage policy.

The periodic in-wave “Data pattern mining” section should similarly refer to
patterns collected so far **in the current wave**, not the global accumulated
bank.

### 2. Add a Lean theorem-search stopping rule

Add after the canonical theorem reuse preflight:

> A reuse search is scoped to one concrete search key: the proposed statement
> and available hypotheses, its intended immediate consumer, and the relevant
> source/import revision. Record the best candidates and the first missing
> antecedent or circularity. Do not repeat semantic corpus or literature search
> while that key is unchanged. Source navigation, elaboration, and proof
> debugging may continue without restarting semantic search. Re-run the reuse
> preflight only when the candidate statement, ingress, consumer, imports, or
> relevant source revision materially changes.
>
> A mandatory post-CEGAR general-theorem mine is a different operation: it
> analyzes only the newly completed wave’s solver artifacts. It does not by
> itself trigger an external Lean-corpus or literature search.

### 3. Add concise repository-local wording

After `AGENTS.md` says to search the indexed Lean corpus before reproving a
candidate, add:

> Treat that as one bounded reuse preflight per concrete theorem candidate, not
> a recurring checkpoint during ordinary proof work. Record the candidate,
> immediate consumer, first missing antecedent or circularity, and relevant
> source/import revision; do not repeat the search until one of those materially
> changes. Separately, after every actual CEGAR wave, mine only that wave’s new
> solver data for general theorems. Search the Lean corpus again only if that
> wave-data mine produces a concrete new candidate.

### 4. Clarify the authoritative computational plan

Add near the opening operating premise:

> In this plan, a mandatory post-wave general-theorem mine analyzes only the
> artifacts newly produced by that CEGAR or PIQD wave. It is not a fresh search
> of the accumulated theorem bank, indexed Lean corpora, mathlib, or literature.
> When wave data yields a concrete candidate theorem, run one bounded external
> reuse preflight for that candidate before deriving it.

Then change only forward-looking normative phrases:

- “global theorem-bank audit” near the v30 round protocol → “current-wave-data
  general-theorem mine”;
- “global theorem-bank pass” in the Schema 10 protocol → “current-wave-data
  general-theorem mine”;
- “mandatory general-theorem scan” in future PIQD checkpoints → “mandatory
  current-wave-data general-theorem mine”; and
- “exhaustive general-refinement mining” in future PIQD checkpoints →
  “exhaustive generalization mining over that wave’s validated artifacts.”

Do not rewrite historical statements reporting completed scans or audits. They
are provenance, not current instructions.

### 5. Add a cross-reference to the SAT skill

Near its discovery-run guidance, add one sentence:

> The mandatory post-wave theorem checkpoint mines only the completed wave’s
> new data; external Lean/literature reuse search is a separate bounded step
> after a concrete candidate has been formulated.

No other discovery, trust, or promotion gates need to change.

## What must not change

- Do not skip the wave-data theorem mine after any actual CEGAR wave.
- Do not cache a prior wave’s mine as a substitute for mining a new wave.
- Do not call a SAT survivor, finite UNSAT result, or mined pattern a universal
  theorem without the existing source-level producer/lift and trust gates.
- Do not require an external theorem-bank search before every diagnostic solver
  run.
- Do not restart external theorem search merely because Lean elaboration failed,
  a proof was refactored without changing its interface, or another source file
  was inspected.
- Do not edit deployed plugin cache copies. Apply canonical plugin changes in
  `/Users/adam/projects/claude-plugins/local-plugins/plugins/...` and follow that
  repository’s version, validation, and reinstall workflow.

## Acceptance tests for the policy edit

### Scenario A — ordinary Lean proof work

An agent formulates candidate theorem `T`, searches once, records that every hit
lacks hypothesis `h`, and continues source/proof work. Three later checkpoints
with the same `T`, `h`, consumer, and source/import revision do not trigger more
semantic searches.

Expected: **one external reuse search**.

### Scenario B — completed CEGAR wave

A wave produces six new cores, two validated SAT survivors, and one minimized
rejection. The agent groups and analyzes those artifacts and records a candidate
family or a no-new-pattern result.

Expected: **one mandatory theorem mine over those wave artifacts only**.

### Scenario C — wave data yields a concrete candidate

The wave-data mine formulates a precise parametric Lean statement with an
immediate consumer.

Expected: **one new external reuse preflight for that candidate**, after the
wave-data mine. Prior unrelated searches do not satisfy it.

### Scenario D — wave data yields no candidate

The wave-data mine records that no stable family or invariant emerged.

Expected: **no automatic Lean-corpus or literature search** and no unbounded
attempt to rediscover a theorem.

### Scenario E — promotion

A solver-derived theorem is prepared for production.

Expected: existing exact replay, trust-profile, source-ingress, lift,
proof-blueprint spine, axiom, and consumer checks remain required and unchanged.

## Validation requested from the implementing reviewer

1. Confirm that no mandatory post-wave clause still says to search the whole
   accumulated bank or outside world.
2. Confirm that the wave-data checkpoint remains mandatory after every wave.
3. Confirm that external search is triggered by a concrete candidate, not by an
   ordinary proof checkpoint.
4. Confirm that the repository overlay and authoritative plan use the same
   terminology as the canonical skills.
5. Run the local-plugins repository’s normal skill/manifest validation, version
   parity, cachebuster, and reinstall checks after canonical plugin edits.
6. Run `git diff --check` in both affected repositories.

## Suggested implementation order

1. Fix `cegar-and-marco.md`; it contains the primary behavioral defect.
2. Add the canonical Lean reuse-search stopping rule.
3. Add the short SAT-skill cross-reference.
4. Update the repository `AGENTS.md` overlay.
5. Clarify forward-looking language in the authoritative computational plan.
6. Run the acceptance scenarios above as a prose consistency review before
   publishing the plugin changes.

## Non-goals

This audit does not alter the current FreshThird anchor, prove or refactor a
Lean theorem, authorize a new solver wave, change the trust profile, or weaken
the computational promotion criteria. It only separates mandatory wave-data
theorem mining from bounded external theorem reuse search.
