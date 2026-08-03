# V23 guarded-selector support-core pilot

Date: 2026-08-02

## Verdict

**Precise no-go; no shortened blocker admitted.**  A sound selector-before-
normalization prototype authenticated saved v19 assignment 0, named the 16
nontrivial source atoms, normalized their guarded conjunction once to 43,017
audited QF_LRA constraints, and queried the 16 selectors as assumptions.  The
bounded 60-second Z3 query returned `UNKNOWN` (`canceled`), so there was no
UNSAT core: raw core size 0 and projected support size 0.  The pilot therefore
failed closed to all 825 fixes (825 retained, 0 removed).

This is a terminal compute pilot.  It launched no production wave and changed
no v19-v22 or production artifact.

## Sound provenance route

The prototype deliberately does **not** normalize source leaves independently.
That would make `card2bv` auxiliary sharing and name collisions a provenance
hazard.  Instead it:

1. authenticates the finalized v19 summary, result, journal, 190 blockers, raw
   gzip bytes, and semantic raw formula;
2. parses the exact frozen raw formula in a fresh Z3 context;
3. flattens its 26 top-level source leaves and collects semantic Boolean
   support before substitution, rejecting any Boolean outside the authenticated
   825-variable assignment or tracker allowlist;
4. substitutes the complete authenticated assignment and tracker values;
5. drops 10 leaves simplifying to `True`, guards each of the remaining 16
   source atoms with a collision-checked selector, and normalizes the whole
   guarded conjunction exactly once with the v17 weighted-PB rewrite and
   `card2bv` pipeline;
6. checks that the resulting 43,017 assertions are QF_LRA (103,922 AST nodes,
   zero PB, integer, bit-vector, nonlinear, array, ITE, quantifier, or
   uninterpreted-function nodes); and
7. maps any returned selector core to the union of the exact pre-substitution
   Boolean supports of its named source atoms.

The 16 named source-atom support sizes were: nine atoms with support 0, then
one each with support sizes 84, 90, 105, 168, 435, 450, and 660.  These are
provenance metadata only: because the selector query was `UNKNOWN`, none was
used as a projected blocker.

Key identities:

- authenticated assignment: `b52c22a057736eef37850a305a609288c7c39d659f98400da02eedfba35394a9`;
- frozen raw gzip bytes: `699807aa782a9083ebec185444b483f7e9da53b4f7a43e45ae923aa82f363067`;
- semantic raw formula: `bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720`;
- normalized guarded formula: `38670a76f2db7fd999827e31d2e4571cbe80d98be44282be827438d252fa2cce`;
- canonical named-atom map: `6c25ef0c3e16dfbf3ce5310976faad6ca4649fafcfcfd13b6f5ccc129bce9bf1`;
- stored gzip map bytes: `2d7d572376d364259a441c979a72508535ad9606056ee58f1926d453f078f0c2`.

## Independent replay admission gate

A projection can be admitted only when the selector query is `UNSAT` and two
independent fresh-context parses of the exact authenticated raw formula both
return `UNSAT` after applying exactly the projected fixes and tracker values.
The two replays must agree on the candidate-fix hash, raw semantic formula
hash, and derived replay-formula hash.  `SAT`, `UNKNOWN`, malformed support,
hash disagreement, or solver error fails closed to the full 825-fix assignment.

For this no-go, both independent replays of that fail-closed full assignment
were `UNSAT`.  Each produced 30,118 replay assertions and the identical derived
formula hash
`9bf95e2d7feb547406092b4908222b9cf9238d1e77b6fb3f9f13307e8255d144`.
The replay transformations leave 105 PB nodes, so this replay is intentionally
an exact raw-formula admission check, not another QF_LRA classification claim.
It does not rescue the absent core or authorize shortening.

## Mandatory global theorem-bank audit

**NO HIT.**  The v23 run supplies no core, projected Boolean pattern, geometric
packet, or general-n statement.  Its successful raw replays prove only that one
authenticated complete Boolean assignment is inconsistent with the frozen
exact-`n = 15` formula.  They cannot be promoted to a universal geometric
theorem.

The audit checked the current registry and all three required bank censuses:

- current `Census554.EqualityCore` consumers still require a geometric
  `Realizes`/`ExactAt` producer and a concrete excluded-label witness;
- the RVOL U5 bank's 96 class-level incompatibility families still require an
  explicit dangerous triple, exact classes, and cross-memberships; it has no
  classifier from the live retained-omission context;
- the 18 unimported U1 row-slot consumers still require a row-slot packet,
  metric equalities, and certified-ordinal coverage;
- `u1TwoLargeCapObstruction` still requires its concrete five-point packet,
  seven equalities, and inequality, with no completeness producer;
- the legacy and older general-theorem banks provide no bridge from an exact
  v19 Boolean assignment to the live general carrier.

The current live spine remains
`false_of_retainedOmission_triApexAllLarge_core` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.  The already available
critical-shell chain proves cross-cap radius-slice cardinality at most one, but
the missing producer is still an actual distinct rich-cap radius slice with at
least two shell hits.  V23 produces no evidence toward that packet.

No `nthdegree docs search --lean --agentic` call was made: the no-core result
left no concrete theorem candidate for a sound scoped search.  No Lean/Lake,
proof-blueprint, generator, or kernel gate was run.

## Verification and trust boundary

The pilot command was:

```bash
nice -n 15 uv run round5_guard_support_core_v23.py \
  --assignment-ordinal 0 --core-timeout-ms 60000 --replay-timeout-ms 60000
```

Exit code 2 is intentional for fail-closed non-admission.  The focused tests are
run with:

```bash
nice -n 15 uv run --with pytest pytest -q test_round5_guard_support_core_v23.py
```

All solver evidence is external Z3 evidence.  There is no proof certificate,
Lean theorem, or kernel ingress, and this report makes no closure claim.
