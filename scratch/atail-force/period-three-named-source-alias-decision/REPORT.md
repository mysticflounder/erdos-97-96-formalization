# Period-three named-source alias decision

Date: 2026-07-17

Status: **EXACT DEPENDENCY DECISION COMPLETE: ALL 72 ALIAS INSTANCES ARE
FORMULA-IDENTICAL TO THEIR BASE QF_LRA CELL. THE TWO CONTINUATION-TO-CYCLE
ALIASES REPAIR PROVENANCE BUT ADD NO ARITHMETIC ATOM. THE STRENGTHENED
TARGET-NEGATING METRIC RUN REMAINS UNRESOLVED UNDER BUDGET.**

This lane owns only
`scratch/atail-force/period-three-named-source-alias-decision/`.  It did not
edit production Lean, shared docs, proof-blueprint state, git, `ShellCurvature`,
`SurplusM44`, card-five, FA-UNIQ, or another scratch lane.  It ran no Lean,
Lake, LSP, or project build.

## 1. Required preflight

Before changing a finite-pattern encoding, the audit checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The bank already contains the downstream Kalmanson and same-cap consumers,
including `CapSelectedRowCounting.outsidePair_unique_capCenter`; it contains no
producer making one reverse outside pair co-radial from the first apex.  This
decision therefore tests a proposed producer antecedent rather than mining a
new local contradiction.

## 2. Exact source audit

Production
`ATail/LargeCapUniqueFiveLowHit.lean` defines
`LargeCapUniqueFiveTwoCommonDeletionSources`.  Its `first` and `second` fields
are distinct points of the physical exact-five class and strict physical cap.
They are not the retained first-apex frontier sources `F.pair.q,F.pair.w`.

The transition-global all-reverse argument recorded in
`transition-reverse-outside-pair-api/REPORT.md` has the following finite
consequence:

1. the total successor is injective;
2. it has no fixed point and no two-cycle;
3. the physical vertex type has cardinality at most five; hence it has one
   orbit; and
4. on the period-three branch, both distinct continuation points occur among
   the three cycle sources `c0,c1,c2`.

The consequence is mathematically complete finite dynamics.  After this
solver audit finished, it was packaged in production by
`exists_entryZeroPeriodThreeCycle_containing_continuationSources`; the
focused build passes and its axiom closure is exactly `propext`,
`Classical.choice`, and `Quot.sound`.

Most importantly, these are only semantic aliases:

```text
continuation.first  = one c_i
continuation.second = a different c_j.
```

The existing 25-role QF_LRA formula already names `c0,c1,c2` and contains no
separate continuation variables.  Therefore all six ordered aliases compile
to the identical arithmetic formula.  No source theorem licenses any of

```text
continuation.first  = q,
continuation.second = w,
{continuation.first, continuation.second} = {q,w}.
```

Imposing one of those stronger identities would repeat the old unsupported
cross-front alias bug.

## 3. Audited fixed-family decision

`audit_alias_dependency.py` starts from the fully-disjoint source-facing
25-role family in `period-three-full-role-identity-quotient` and exactly
enumerates:

- equal and unequal first-apex selected-row radii;
- frontier roles `II`, `IO`, and `OI`;
- the forward named boundary and its exact reflection;
- all six ordered distinct continuation aliases into `{c0,c1,c2}`; and
- all six ordered continuation aliases for each structural descriptor.

The resulting exact count is:

```text
12 structural descriptors
* 6 ordered distinct aliases
= 72 alias instances.
```

There are exactly 12 arithmetic formula descriptors, not 72: each group of
six aliases has the same descriptor hash.  The audit checks directly that the
existing encoder names `c0,c1,c2` but has no `continuation.first` or
`continuation.second` variable.  `ALIAS_DEPENDENCY_AUDIT.json` records every
instance and `arithmetic_atoms_added_by_alias = 0`.

The existing exact rational ledger decides `unequal-II-forward` SAT, and
reflection transports that ledger exactly to `unequal-II-reflected`.  The ten
other base metric cells were not already decided by an exact stored ledger.
The alias audit deliberately preserves that distinction: it proves that each
alias has its base cell's status, not that every base status is SAT or UNSAT.

### Strengthened target-negating attempt

`decide_alias_cells.py` additionally attempted the stronger condition

```text
dist(first,x_i) != dist(first,y_i),  i=0,1,2.
```

Every attempted structural formula included:

- positive distances and every strict triangle inequality;
- both strict Kalmanson inequalities for every cyclic quadruple;
- the two first-apex selected rows;
- the exact named physical five-class;
- three exact named reverse four-shells;
- the physical-apex `q/w` distance inequality; and
- exact exclusion of every other named point from the physical and reverse
  radii.

Strict inequalities and disequalities used homogeneous unit slack.  Three
bounded variants were tried:

1. the original independent disequality disjunctions returned Z3 `unknown`
   (`timeout`) on `unequal-OI-forward` after 350.631 seconds;
2. 512 exact global-sign LRA subcells returned no model and at least one
   `unknown` (`canceled`) after 344.016 seconds; and
3. an individual-disequality incremental LRA extension returned no completed
   cell after 660 seconds.

All three were stopped fail-closed.  No SAT or UNSAT result from them is
banked.  `ATTEMPT_LOG.json` records the exact run boundary.  `PROGRESS.jsonl`
records the stopped final run rather than pretending it completed.

This does not weaken the dependency decision: because the alias contributes
no atom, it cannot change whichever verdict the target-negating base cell
eventually receives.  It only means the strengthened base cells themselves
remain undecided here.

## 4. Exact implication for the corrected transition route

Regardless of the metric verdict, the alias theorem has one precise use:

```text
global transition + all reverse + period 3
  -> continuation.first and continuation.second are named cycle sources
  -> existing reverse-pair APIs may be instantiated source-faithfully at both.
```

It does **not** supply the missing metric equality

```text
dist S.oppApex1 a = dist S.oppApex1 b
```

for either reverse residual `{a,b}`.  To add new force to the full-`L` route,
the next encoding or theorem must consume continuation-specific data absent
from the old 25-role ledger, such as:

- their shared unused-row actual blocker and both support omissions;
- the two `CommonDeletionTwoCenterPacket`s;
- `R.common.firstApexDouble` and the retained frontier radius class; or
- nonlinear Euclidean/MEC, total-CSS, minimality, or no-`M44` information.

Thus named-source occurrence is a valid API repair, not by itself the
aggregate all-reverse producer.

## Epistemic boundary

- continuation-to-cycle aliases: **PROVED IN PRODUCTION LEAN; FOCUSED BUILD
  AND CORE-AXIOM AUDIT PASS**;
- absence of an arithmetic effect from those aliases: **PROVEN BY ENCODING
  DEPENDENCY AUDIT**;
- 72-cell alias dependency quotient: **EXACTLY ENUMERATED; 12 FORMULAS, SIX
  SEMANTIC ALIASES EACH, ZERO NEW ATOMS**;
- existing `unequal-II` rational ledger and reflection: **EXACT QF_LRA SAT**;
- strengthened target-negating metric cells: **UNRESOLVED UNDER BUDGET; NO
  VERDICT BANKED**;
- source-complete identity quotient: **NOT CLAIMED**;
- Euclidean/MEC/total-CSS/full-parent realization: **NOT CLAIMED**;
- production `sorry` closed: **NONE**.
