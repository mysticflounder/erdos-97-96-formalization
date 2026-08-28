# P97 Rigid221 card-18 off-spine CEGAR aggregate v1

**Status: BASE AND SAT POSITIVE-CONTROL IMPORT COMPLETE; OFF-SPINE.**

Date: 2026-08-27

## 1. Purpose

The exact-card-eighteen Rigid221 projection chain is intentionally absent from
the publication root. That separation prevents finite-lane infrastructure from
silently becoming a theorem dependency, but it also means an ordinary root
build does not keep the chain fresh.

This checkpoint adds one explicit off-spine aggregate and one repository test
runner. Together they replay the complete finite projection chain, source
custody, and predicate-coverage ledgers without opening a serializer or solver
gate.

## 2. Lean aggregate

The import-only target is:

```text
Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18Aggregate
```

It imports these twelve modules explicitly:

1. `Rigid221Card18LeafExport`;
2. `Rigid221Card18FiniteDataExport`;
3. `Rigid221Card18LabeledProjection`;
4. `Rigid221Card18CrossedIncidenceProjection`;
5. `Rigid221Card18LabeledEnrichment`;
6. `Rigid221Card18AbstractPacket`;
7. `Rigid221Card18SearchBase`;
8. `Rigid221Card18DirectCardinality`;
9. `Rigid221Card18ArmLayout`;
10. `Rigid221Card18ClauseGadgets`;
11. `Rigid221Card18ArmCnf`; and
12. `Rigid221Card18PositiveControls`.

The aggregate itself declares no theorem or axiom. Its positive-control import proves that all three
v1 formulas have satisfying assignments; it adds no serializer, external finite-search result, or
solver entitlement. The aggregate remains absent from `FrontierLiveClosure.lean` and the public
`Erdos9796Proof` root.

The governed build target is:

```bash
LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18Aggregate
```

`LAKE_BUILD_NO_REFRESH=1` keeps a routine aggregate replay from rewriting the
generated live blueprint. Publication work may still refresh that blueprint
explicitly and review the exact delta.

## 3. Python freshness surface

The runner keeps the seven immutable predecessor layers executable in the
exact predicate-coverage-v3 source snapshot:

1. source packet;
2. source custody;
3. crossed-incidence custody;
4. labeled-projection custody;
5. predicate coverage v1;
6. predicate coverage v2; and
7. predicate coverage v3.

It separately checks labeled-projection custody v2, crossed-incidence custody
v2, and predicate coverage v4 against the live source tree. Ruff runs over
both generations before 348 historical tests and 131 live tests. Pytest
plugin autoload, bytecode output, cache-provider output, distributed
execution, and numerical-library worker pools are disabled or capped.

Current Ruff formatting is deliberately not a gate over all fourteen files.
Six frozen predecessor files predate the current formatter output, and a
mechanical rewrite would broaden this lane and may require custody refreezing.
That migration requires a separate review; the aggregate does not hide it by
rewriting custody-bound inputs.

The runner is deliberately fail-closed. A legitimate change to a pinned Lean
source or dependency must re-mine and publish a new version of the affected
custody artifact; the target must not weaken, bypass, or rewrite a historical
source manifest.

## 4. Repository wiring

The standalone entry point is:

```text
scripts/test-p97-rigid221-card18.sh
```

The existing sequential `test-p97-piqd-remaining-solvers.sh` aggregate invokes
it before the separate Rigid221 pentagon lane. The card-18 runner itself calls
no PIQD daemon, SAT/SMT backend, finite enumerator, or external solver.

There is no committed `.github/workflows` configuration in this repository.
This checkpoint therefore provides a repository-local aggregate target, not a
claim that a hosted CI service currently executes it.

## 5. Scope and nonclaims

Passing this target establishes only that:

- all twelve off-spine Lean modules still elaborate together;
- the frozen historical custody and coverage suites still pass in their exact
  v3 source snapshot;
- the active custody-v2 receipts still authenticate the live declared sources;
- all four predicate-coverage schemas reconstruct their artifacts;
- the pure abstract packet and its source projection remain buildable;
- the typed 288-variable base representation, role one-hot clauses, and
  encode/decode bridge remain buildable;
- the generic direct at-most, at-least, and exact-cardinality CNF layer remains
  buildable with both semantic directions; and
- the reduced BI/U/XV derived layout and generic role/support, inequality,
  mask, intersection, and cardinality-bridge gadgets remain buildable with
  both semantic directions; and
- the deterministic BI/U/XV formulas, their exact clause totals, and both
  packet/model correspondence directions remain buildable; and
- explicit valid BI/U/XV packets and the resulting three formula-satisfiability theorems remain
  buildable.

It does not establish:

- a geometric realization of any valid abstract packet;
- a canonical DIMACS representation or strict serializer readback theorem;
- a checked UNSAT certificate;
- a Euclidean realization for a finite assignment;
- closure of any exact-card-eighteen arm; or
- a lift from exact cardinality eighteen to the live unbounded residual.

## 6. Acceptance gates

This checkpoint is publishable only after:

1. the runner passes `bash -n` and is executable;
2. Ruff lint checks pass on all fourteen Python files;
3. all seven focused pytest suites pass;
4. the governed aggregate build succeeds;
5. proof-blueprint confirms the aggregate is absent from the publication
   spine;
6. the focused script scan confirms that no solver command is invoked;
7. independent review confirms exact test/module coverage and honest scope;
8. any generated live-blueprint delta is exact; and
9. exact-path staged hygiene passes with no foreign staged path.

The serializer and solver gates remain closed.

### Verification evidence through the direct-cardinality checkpoint

- The runner passed `bash -n`, was executable, and had no solver command.
- Ruff lint passed on all fourteen declared Python files.
- All seven focused suites passed, totaling 348 tests in 31.97 seconds.
- The aggregate build completed all 11,036 jobs.
- A governed refresh added one off-spine source file and 51 indexed symbols to
  the live-blueprint census; the sorry count remained three.
- The 2,518-file publication spine contained no `Rigid221Card18` path.
- Exact-path whitespace and line-length checks were clean.
- The Lean aggregate has SHA-256
  `0db0af5686f183295328beb237d9bc3f551d2c21c2a1502812407ecea54b0391`.
- The standalone runner has SHA-256
  `3c675ecbba7f2dd2e1fcf58c53c6d501c3c2df090efbc88cd3df12bf993b1881`.
- The current direct-cardinality lane explicitly owns this aggregate source and
  spec for the eight-import extension. The predecessor seven-import lane is
  published at `38f6b0ced41acbda8b2d2f590f2acf6b1a14a7a4`; the original
  six-import lane is published at `467b58a186fe1d81b78be8d042d8ab4bf0e585bd`.
- Independent review returned GO; exact-path staged hygiene passed with zero
  issues and no foreign staged paths.

### C1 extension evidence on 2026-08-27

- The final ten-import aggregate replay completed all 11,038 Lean jobs.
- Ruff passed and all seven focused suites passed, totaling 348 tests in
  31.51 seconds.
- A governed refresh indexed the two new source files and regenerated the live
  blueprint. The exact delta is two additional off-spine files and 191 symbols;
  the off-spine sorry count remains three.
- The 2,518-file publication spine contains no `Rigid221Card18` path.
- The new layout and gadget modules have no `sorry`, custom axiom, native or
  external trust, unsafe runtime hook, DIMACS path, enumerator, or solver call.
  Independent semantic and executable-trust reviews returned GO.
- The ten-import aggregate SHA-256 is
  `ad6a1a4dd3e508d80ac5eaaaa171dbfedcb43431096c02888a2bcc5cf8e1ffae`.
- Read-only lane hygiene reports zero lane issues. The shared worktree's foreign
  dirty and unregistered artifacts remain outside this lane's ownership.

### C2 extension evidence on 2026-08-27

- The final eleven-import aggregate replay completed all 11,039 Lean jobs.
- Ruff passed and all seven focused suites passed, totaling 348 tests in
  30.58 seconds.
- A governed refresh indexed the new arm-formula module. The exact generated
  blueprint delta is one additional off-spine file and 110 symbols; the
  off-spine sorry count remains three.
- The 2,518-file publication spine contains no `Rigid221Card18` path.
- Lean proves exact complete formula totals of 61,969 clauses for BI and 51,333
  for each crossed arm, plus both packet/model directions and the generic
  `armCnf_sat_iff` theorem.
- Source, axiom, generated-IR, import, and independent semantic reviews found no
  forbidden trust mechanism, external artifact boundary, or semantic gap.
- Exact-path staged hygiene passed with zero issues and no foreign staged path.
- The eleven-import aggregate SHA-256 is
  `a42f831bb78855da36e265ab241df25ba9d31bb3651a93030b192d42f7c912db`.
- The new arm-formula module SHA-256 is
  `076abeb793c61aad760e92d4847911979326292962fa2307c69d9f20e2d97011`.

## 7. Revised next boundary

The v1 formulas are now checked satisfiable and are frozen as positive controls. Do not serialize or
solve the unchanged formulas. The next mathematical boundary is a source-derived relation connecting
the two fixed-center deletion views in the live bi-survival rectangle. A canonical DIMACS boundary
may be reconsidered only for a source-justified v2 projection; enumeration, certificate generation,
and solver execution remain unauthorized.
