# Math-project instruction audit

Date: 2026-08-13

Status: read-only audit report; no instruction changes are implemented here.

## Scope

This audit covers:

- the global and session-level instructions in context that apply to mathematical
  projects, repository work, authorization, tools, memory, and skills;
- `/Users/adam/projects/math-projects/AGENTS.md`;
- this repository's `AGENTS.md`, `CLAUDE.md`, `.claude/settings*.json`, and
  `.nthdegree/docs.toml`; and
- the installed `lean-usage`, `project-progress-review`, and `nthdegree` skill
  instructions explicitly invoked by the applicable project guidance.

It deliberately excludes every sibling project and its instructions, sources,
memories, and corpora. No Lean build, Git command, index refresh, repository edit
other than this report, or persistent-memory write was part of the audit.

The findings describe the instruction surface observed on 2026-08-13. Global
platform instructions and installed skill versions can change independently of
this repository, so platform-specific findings should be rechecked when they are
implemented.

## Labels

- **FALSE**: contradicted by the live tool or repository evidence.
- **CONFLICT**: two simultaneously applicable instructions demand incompatible
  behavior. Higher-level precedence may determine what an agent must do, but the
  lower instruction remains misleading and should be corrected.
- **MISLEADING**: technically defensible only under an unstated qualification, or
  likely to cause the wrong action.
- **DUPLICATION**: the same policy is maintained in multiple places without a
  single-source mechanism.
- **QUALITY**: unnecessary ambiguity, verbosity, or editorial debt.
- **VERIFIED**: checked against the live repository or current command help.

## Verdict

The instruction set is strong on mathematical-status discipline: it distinguishes
producers from consumers, refuses to infer closure from a green build, requires
active-plan coverage of publish-reachable `sorry`s, and calls for independent
promotion review. Those rules are mutually compatible.

The main weakness is operational layering. The same policies are repeated in the
global session wrapper, the parent `AGENTS.md`, two identical repository files,
and installed skills. This has produced three material conflicts, two false
Codex-specific operational instructions, one false command example, and several
places where dated facts are presented as standing policy.

## Issue inventory

| ID | Severity | Classification | Summary |
|---|---|---|---|
| I-01 | High | FALSE — RESOLVED 2026-08-13 | `--current-project` does not scope `--lean` to this repository |
| I-02 | — | WITHDRAWN 2026-08-13 | standing commit/push language is explicit authorization |
| I-03 | High | CONFLICT | two incompatible persistent-memory authorities are mandated |
| I-04 | High | FALSE / CONFLICT | terminal wait rules assume unsupported Codex behavior |
| I-05 | Medium | DUPLICATION | repository `AGENTS.md` and `CLAUDE.md` are identical |
| I-06 | Medium | CONFLICT / DUPLICATION | `rg`-first and semantic-search-first rules lack an explicit division |
| I-07 | Medium | DUPLICATION | memory, search, and proof-skill policies recur across layers |
| I-08 | Medium | MISLEADING | overlapping evidence-label systems have no stated relationship |
| I-09 | Medium | MISLEADING | dated theorem-bank census is embedded as standing instruction |
| I-10 | Medium | MISLEADING | hardest-first, no-pivot, and solver absolutes are overbroad |
| I-11 | Low | QUALITY | empty heading, grammar error, broken reference, and undefined cleanup |
| I-12 | Low | CONFLICT | instruction discovery differs between governance skills |

## Detailed findings

### I-01 — repository-only Lean search is documented incorrectly

**Classification:** FALSE.
**Severity:** High.

Repository `AGENTS.md:86-88` and the identical `CLAUDE.md:86-88` say that an
agent can add `--current-project` to scope a `--lean` search to this repository.
The current nthdegree help and installed skill state instead:

- `--current-project` selects this repository's prose corpus;
- `--lean` searches every configured project's enabled Lean corpus; and
- `--corpus <slug>` is the repository-scoping mechanism for Lean.

This error can cause an agent to inspect sibling projects despite an explicit
repository-only boundary.

**Recommended correction:** replace the final paragraph of the local Docs & Lean
search section with:

```text
For repository-only Lean search, use
`--corpus erdos-97-96-formalization-lean`. Use `--lean` only when an
intentional cross-project search is in scope. `--current-project` selects this
repository's prose corpus; it does not narrow `--lean`.
```

**Validation:** compare the text with `nthdegree docs search --help`, then run a
small search using the named local corpus and confirm that only this corpus is
reported.

**Resolution (2026-08-13):** corrected the shared local instruction file.
`AGENTS.md` is a symlink to `CLAUDE.md`, so this single edit updates both names.
The text now identifies `--corpus erdos-97-96-formalization-lean` as the
repository-only Lean search and reserves `--current-project` for prose docs.

### I-02 — standing commit and push authority is explicit authorization

**Classification:** WITHDRAWN.
**Severity:** Not applicable.

The parent `AGENTS.md:59-67` says:

- commit every checkpoint;
- push every five checkpoints; and
- agents are always allowed to commit and push their own work.

The original audit treated this standing permission as inferred authorization.
That was incorrect. The global policy forbids *inferring* authority from a task;
the parent file supplies that authority explicitly. There is therefore no
authorization conflict.

The wording could still be made more precise as a quality improvement. A clearer
version would be:

```text
Standing user authorization: after any task in this repository that creates or
modifies durable repository files, commit and push the agent's own completed
changes without waiting for per-task confirmation. This authorization applies
even when the immediate prompt does not repeat it. It does not authorize
unrelated edits, committing another contributor's work, destructive Git
operations, force-pushes, or changes outside the current repository.
```

**Resolution (2026-08-13):** finding withdrawn after the user clarified that the
standing language intentionally grants automatic commit-and-push authority. No
policy restriction is recommended. The replacement above is optional clarity,
not a correction of a conflict.

### I-03 — persistent-memory authority is contradictory

**Classification:** CONFLICT.
**Severity:** High.

The injected project guidance says to use nthdegree for all persistent memory and
states that this supersedes default memory guidance. It also requires immediate
`nthdegree store` calls for corrections, decisions, costly facts, and references.

The global Codex memory policy requires use of the Codex memory folder when
relevant and forbids memory updates unless the user explicitly requests one; even
then, updates must be written as extension notes rather than directly to the
memory registry. These are incompatible persistence mechanisms and write gates.

The current precedence hierarchy tells Codex to follow the global developer rule,
but that only resolves execution; it does not make the project instruction true.

**Recommended correction:** choose and document an environment-specific authority.
If both mechanisms must remain supported, say explicitly:

```text
Use the persistent-memory mechanism authorized by the active host. On hosts where
nthdegree is authoritative, follow the store triggers below. On hosts with a
higher-level memory-write gate, do not bypass that gate; use nthdegree only for
read-only project recall and documentation search unless writes are authorized.
```

**Validation:** confirm that a correction from the user, an ordinary completed
task, and an explicit "remember this" request each map to exactly one permitted
write path in every supported host.

### I-04 — waiting and background-build rules do not match current Codex tools

**Classification:** FALSE / CONFLICT.
**Severity:** High.

The injected waiting rule requests `yield_time_ms = 600000` for background
terminals. In the current Codex tool contract:

- `exec_command` accepts a maximum initial yield of 30,000 ms;
- an ongoing command returns a terminal session ID;
- `write_stdin` can wait up to 300,000 ms for that session; and
- `wait_agent(timeout_ms = 600000)` is valid for subagents, but it is a different
  mechanism.

The installed `lean-usage` skill additionally assumes that the build harness will
deliver an automatic completion notice and says never to wait on a running build.
That is not guaranteed by the current Codex terminal surface; completion normally
has to be collected through the returned session ID.

**Recommended correction:** split platform-independent policy from platform
adapters:

```text
Do not busy-poll. For subagents, use the platform's blocking agent wait. For
terminal sessions, use the longest supported blocking wait on the returned session
ID. If the host supplies an automatic completion event, rely on it; otherwise
collect completion through the host's session-wait operation.
```

**Validation:** check the active tool schema for both agent and terminal waits and
ensure every documented duration is within the declared maximum.

### I-05 — repository instruction files are exact duplicates

**Classification:** DUPLICATION.
**Severity:** Medium.

Repository `AGENTS.md` and `CLAUDE.md` are byte-for-byte identical: 88 lines with
the same SHA-1. This is the largest single duplication and creates two nominally
authoritative files that can silently drift later.

**Recommended correction:** keep one canonical policy and make the other a
compatibility shim, generated mirror, or symlink if all consumers support it. If a
plain-text shim is required, it should contain only a pointer and any genuinely
host-specific differences.

**Validation:** add a small deterministic check that either verifies identity for a
generated mirror or verifies that the shim points to the canonical file.

### I-06 — source search and semantic search rules need an explicit boundary

**Classification:** CONFLICT / DUPLICATION.
**Severity:** Medium.

Global Codex guidance says to reach first for `rg` when searching for text or
files. Parent, repository, lean-usage, and nthdegree guidance says to use indexed
semantic search before `rg` for theorem and document discovery.

Specific project instructions resolve this in favor of nthdegree for the covered
cases, but the intended division is scattered and easy to miss.

**Recommended correction:** state one shared routing rule:

- use nthdegree for theorem discovery and semantic plan/document search;
- use Lean LSP for definitions, references, diagnostics, and source-local semantic
  navigation when available;
- use `rg` for exact strings, file discovery, provenance, counts, unindexed
  artifacts, and follow-up source navigation.

**Validation:** apply the rule to representative queries such as "find a theorem
equivalent to X," "where is declaration Y defined," and "which files mention exact
hash Z."

### I-07 — memory, search, and proof governance are repeated across layers

**Classification:** DUPLICATION.
**Severity:** Medium.

Repeated material includes:

- memory commands and "recall first" in the wrapper, parent policy, both local
  files, and nthdegree skill;
- theorem/docs search guidance twice within each local file (`:17-40` and
  `:72-88`), in addition to the parent and skills; and
- the requirement to load `lean-usage` in both parent and local policy.

**Recommended correction:** assign homes by stability:

- global/skill: command semantics and reusable workflow;
- parent `AGENTS.md`: math-project invariants and authorization-neutral routing;
- repository `AGENTS.md`: corpus slug, theorem-bank registry, local communication
  channel, and project-specific proof gates;
- dated report or plan: changing theorem counts and frontier facts.

**Validation:** for each surviving rule, identify one authoritative home and at
most one short pointer from another layer.

### I-08 — evidence labels overlap without a declared model

**Classification:** MISLEADING.
**Severity:** Medium.

The instruction surface uses at least three overlapping vocabularies:

- `PROVEN`, `CONJECTURED`, `EMPIRICALLY VERIFIED`, and `HEURISTIC`;
- `CONJECTURE`, conditional, empirical, and bookkeeping; and
- `COMPLETE PROOF`, `SCOPED CLOSURE`, `PROVED PRODUCER`, `PROVED CONSUMER`,
  `NARROWING`, `OBSTRUCTION`, `CONDITIONAL`, `EMPIRICAL`, and `INFRASTRUCTURE`.

These are not all competitors: the first set describes epistemic status, while
many items in the last set describe proof-spine role. Without saying that, agents
can treat unlike labels as mutually exclusive or replace a trust label with a role
label.

**Recommended correction:** define two independent axes:

1. epistemic status: `PROVEN`, `CONJECTURED`, `EMPIRICALLY VERIFIED`, `HEURISTIC`;
2. proof-spine role: closure, producer, consumer, narrowing, obstruction,
   conditional interface, infrastructure, or bookkeeping.

A result may then be reported as, for example, `PROVEN — PRODUCER` or
`EMPIRICALLY VERIFIED — OBSTRUCTION CANDIDATE`.

**Validation:** classify several existing cases, including a source-clean helper,
a conditional contradiction consumer, an exhaustive finite solver result, and a
publish theorem with approved transitive axioms.

### I-09 — dated theorem-bank facts are presented as permanent policy

**Classification:** MISLEADING.
**Severity:** Medium.

Local `AGENTS.md:42-48` embeds a sibling-bank census: 96 U5 class-level items, 88
metric-point kernels, 112 scalar-algebra kernels, 18 U1 consumers, and one named
obstruction. The dated mining report supports the counts, but calls the 96 items
class-level contradiction consumers within a 296-module family; the instruction
calls them "families."

The facts are also snapshots. At audit time, the repository's prose and Lean
corpora were indexed at source commit `d0453ffb`, while the live branch ref was
`571f83ce`. The audit did not refresh the corpora or rebuild the historical sibling
declarations.

**Recommended correction:** keep only a pointer in standing policy:

```text
For the dated sibling-bank census and its trust/reachability qualifications, see
`docs/general-n-certificate-bank-mining-2026-07-09.md`. Treat its counts as a
snapshot and verify candidate statements, imports, and trust state before reuse.
```

If the summary remains, replace "96 ... families" with "96 class-level ...
consumers."

**Validation:** ensure every changing numeric claim has a dated evidence source and
is not phrased as current without a freshness check.

### I-10 — several universal workflow rules are too broad

**Classification:** MISLEADING.
**Severity:** Medium.

The parent policy contains three strong but underspecified absolutes:

- `:6-9`: work the "HARDEST" part first;
- `:39-41`: do not suggest pivoting from the active goal; and
- `:43-44`: always validate a solver encoding first against a known result.

Problems:

- difficulty is subjective and can send audits or maintenance tasks toward
  unrelated mathematics;
- a refuted route must be reported even when changing goals still requires user
  authorization; and
- some encodings have no known-result oracle, requiring property, differential,
  or metamorphic tests instead.

**Recommended correction:**

```text
For proof work, test the highest-risk load-bearing assumption or obstruction
first, after any prerequisites needed to make that test meaningful.

Do not change the active goal without authorization. Report sound obstructions
and alternative routes without silently pivoting.

Before relying on a solver result, validate the encoding with the strongest
available oracle: a known instance when available, otherwise independent small
instances, differential checks, or structural invariants.
```

**Validation:** confirm the rules remain sensible for prose audits, configuration
work, theorem proving, SAT encoding, and a genuinely open route.

### I-11 — editorial and lifecycle defects

**Classification:** QUALITY.
**Severity:** Low.

- Local `AGENTS.md:3` and `CLAUDE.md:3` contain an empty `## Erdo` heading.
- Local `:7` says "Several large corpora ... is available" rather than "are
  available."
- Parent `AGENTS.md:86` says "see DOCS SEARCH above," but that file has no such
  heading.
- Parent `AGENTS.md:56-57` says to "Clean up agents" without defining an available
  lifecycle operation. The current collaboration interface can interrupt agents
  but has no delete/close command.
- Tone guidance uses more examples and capitalization than needed to convey neutral
  mathematical language.

**Recommended correction:** fix the heading, grammar, and broken reference; replace
the lifecycle rule with "interrupt agents that are no longer needed, when the host
provides that operation"; compress tone guidance to one rule plus one example.

**Validation:** run a Markdown link/heading check and read the condensed policy once
without relying on implied platform features.

### I-12 — instruction-file discovery rules disagree

**Classification:** CONFLICT.
**Severity:** Low.

The `project-progress-review` skill says to read every applicable `AGENTS.md`. The
`lean-usage` repository-policy reference explicitly requires `AGENTS.md`,
`CLAUDE.md`, and any instruction file named by a parent contract. In this repository
the discrepancy is currently masked because `AGENTS.md` and `CLAUDE.md` are
identical, but it could matter after consolidation.

**Recommended correction:** use one rule across skills: discover and read every
applicable instruction file recognized by the active host or explicitly named by a
parent policy, then apply the documented precedence chain.

**Validation:** after consolidating the local files, verify that both review and
Lean workflows load the canonical policy exactly once and still see any host shim.

## Verified statements

The audit also checked the following claims and found them sound within the stated
scope:

- all seven files named by the local theorem-bank registry exist;
- `.nthdegree/docs.toml` defines the corpus slug
  `erdos-97-96-formalization-lean` over `lean/Erdos9796Proof`;
- `nthdegree docs search --agentic` is a current option;
- the dated mining report supports 96 class-level U5 consumers, 88 metric-point
  kernels, 112 scalar-algebra kernels, 18 U1 consumers over the eight listed
  ordinals, and the named five-point obstruction;
- `wait_agent(timeout_ms = 600000)` is supported for subagent waiting;
- the active-plan gate, on-spine `sorry` coverage rule, source/consumer distinction,
  and independent promotion audit are mutually compatible; and
- `lake-build` availability does not itself authorize a build, and the skill says
  this explicitly.

These verifications do not refresh dated indexes, rebuild Lean declarations, or
promote historical sibling-bank results into current repository facts.

## Recommended consolidation

Use four layers with distinct responsibilities:

1. **Global platform policy:** authorization, destructive-action safety, tool
   limits, platform-specific waiting, and persistent-memory authority.
2. **Parent math-project policy:** neutral mathematical language, rigor labels,
   highest-risk-first proof strategy, solver-validation principle, and general
   delegation rules.
3. **One canonical repository policy:** local corpus slug, theorem-bank registry,
   communication channel, active proof-governance skill, and repository-specific
   trust or publication gates.
4. **Skills and dated reports:** reusable command/workflow detail in skills;
   changing theorem counts, frontier state, and historical evidence in dated
   reports or active plans.

Repository `CLAUDE.md` should be a compatibility shim rather than a second policy
copy unless a host requires identical full contents and an automated parity check
enforces that requirement.

## Issue-by-issue review order

The recommended discussion order is:

1. I-01: fix the false Lean corpus-scoping command;
2. I-03: choose the memory authority by host;
3. I-04: make waiting and build completion platform-adaptive;
4. I-05 and I-07: choose canonical files and remove duplication;
5. I-06: establish the nthdegree/LSP/`rg` routing rule;
6. I-08: adopt the two-axis evidence vocabulary;
7. I-09: move snapshot facts out of standing policy;
8. I-10: qualify the workflow absolutes; and
9. I-11 and I-12: perform the editorial and discovery cleanup.

Each issue should be agreed before its edit is made. After all edits, perform a
fresh static audit of the resulting instruction chain and validate command examples
against the active host. Lean builds are neither necessary nor appropriate for
these policy-only changes.
