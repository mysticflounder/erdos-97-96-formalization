# P97 Rigid221 card-18 off-spine CEGAR aggregate v1

**Status: COMPLETE AND PUBLISHABLE; SERIALIZER AND SOLVER GATES CLOSED.**

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

It imports these eight modules explicitly:

1. `Rigid221Card18LeafExport`;
2. `Rigid221Card18FiniteDataExport`;
3. `Rigid221Card18LabeledProjection`;
4. `Rigid221Card18CrossedIncidenceProjection`;
5. `Rigid221Card18LabeledEnrichment`;
6. `Rigid221Card18AbstractPacket`;
7. `Rigid221Card18SearchBase`; and
8. `Rigid221Card18DirectCardinality`.

The aggregate declares no theorem, axiom, finite-search result, serializer, or
solver entitlement. It remains absent from `FrontierLiveClosure.lean` and the
public `Erdos9796Proof` root.

The governed build target is:

```bash
LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18Aggregate
```

`LAKE_BUILD_NO_REFRESH=1` keeps a routine aggregate replay from rewriting the
generated live blueprint. Publication work may still refresh that blueprint
explicitly and review the exact delta.

## 3. Python freshness surface

The runner checks the implementation and test file for each of these seven
layers:

1. source packet;
2. source custody;
3. crossed-incidence custody;
4. labeled-projection custody;
5. predicate coverage v1;
6. predicate coverage v2; and
7. predicate coverage v3.

It runs Ruff lint checks before the seven focused pytest suites. Pytest plugin
autoload, bytecode output, cache-provider output, distributed execution, and
numerical-library worker pools are disabled or capped.

Current Ruff formatting is deliberately not a gate over all fourteen files.
Six frozen predecessor files predate the current formatter output, and a
mechanical rewrite would broaden this lane and may require custody refreezing.
That migration requires a separate review; the aggregate does not hide it by
rewriting custody-bound inputs.

The runner is deliberately fail-closed. A legitimate change to a pinned Lean
source or dependency must re-mine and refreeze the affected custody artifact;
the target must not weaken or bypass the source manifest.

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

- all eight off-spine Lean modules still elaborate together;
- the frozen source-custody checks still authenticate their declared sources;
- the three predicate-coverage schemas still reconstruct their artifacts; and
- the pure abstract packet and its source projection remain buildable; and
- the typed 288-variable base representation, role one-hot clauses, and
  encode/decode bridge remain buildable; and
- the generic direct at-most, at-least, and exact-cardinality CNF layer remains
  buildable with both semantic directions.

It does not establish:

- existence or nonexistence of a valid abstract packet;
- an abstract-packet-to-CNF correspondence;
- application of the generic cardinality encoder to any packet support, any
  derived validity clause, or any complete arm formula;
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

### Verification evidence on 2026-08-27

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

## 7. Next boundary

After this freshness target, design an arm-separated checked-search
correspondence for `Rigid221Card18AbstractPacket.Valid`. No search run is
authorized until the Lean validity surface is proved equivalent to the exact
external formula being checked.
