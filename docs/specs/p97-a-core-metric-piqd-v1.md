# P97 A-core metric PIQD v1

Status: implemented diagnostic infrastructure. This is off the P97 proof spine.
Proof-blueprint session `019fdf9c` remains `OPEN`, unchanged, and `OFF_SPINE`.

## Scope

`census/p97_search/a_core_metric_driver.py` adapts each of the five canonical
physical A-core SAT completions to the three `MetricRow` facts actually
licensed by the source. The PIQD route preserves those canonical rows and the
driver's cap-compatible order enumeration exactly. It neither imports raw
unconstrained row bits nor promotes a result to an exhaustive A-leaf, global
P97, Euclidean P97, Lean, or proof claim.

The production default is `--solver-route piqd`. It is sequential and requires
`--workers 1`. The old in-process Z3 backend is reachable only through the
explicit `--solver-route legacy-local-z3` switch. A PIQD error never invokes
that backend and there is no fallback.

The complete current source has 37,440 cap-compatible physical orders, so the
default route is deliberately sequential rather than small. A bounded canary
must select both `--run` and `--order-index`; source ingress still authenticates
all five physical leaves before selecting the one order.

## Source-semantic query contract

`census/p97_search/a_core_metric_piqd.py` is the A-core-specific source adapter.
It builds on the maintained public single-solver entry points:

```python
from census.p97_search import phase3_piqd_smt_source_adapter as neutral

neutral.validate_authenticated_single_solver_query(...)
neutral.run_authenticated_single_solver_query(...)
```

Each stage record binds all of the following before PIQD session creation:

- the current A-core manifest, all five physical model files, `RESULTS.md`, and
  `A-CORE-ENCODING-SPEC.md`, with byte digests and filesystem identities;
- the physical run, order index, exact canonical order, canonical `MetricRow`
  system, and constraint counts;
- stage identity and normalized state-command-only SMT journal;
- the Z3/QF_NRA, one-shot, one-worker profile and timeout;
- exact bytes of the A-core driver and adapter, the maintained generic
  source-semantic adapter, and the metric encoder/replayer.

Every stage receives a fresh PIQD session. The authenticated journal is
asserted once and solved once. The archive retains the descriptor, original
SMT, journal, source snapshots, implementation snapshots, session lifecycle,
receipts, solve response, and semantic-replay result.

Filesystem custody fails closed on non-native or subclassed `Path` values,
symlinks, non-regular source files, multiple hard links, identity changes,
oversized/deep artifacts, duplicate JSON keys, crossed inventories, stale or
reused sessions, crossed receipts, and unexpected archive files. Publication
is a create-once staging directory followed by an atomic no-replace rename.

## Stage and verdict semantics

The stage sequence reproduces the existing metric probe:

1. `exact-metric-relaxation`;
2. `full-convex`, only after replayed SAT or `UNKNOWN` from stage 1;
3. `convex-only-relaxation`, only after `UNKNOWN` from stage 2.

Z3 `SAT` is never retained from the daemon response alone. The independent
exact-rational replayer parses every requested coordinate and re-evaluates
every asserted atom. A failed or incomplete replay becomes inconclusive. Only
a replayed `full-convex` SAT is returned as the row-level diagnostic `SAT`.

Z3 `UNSAT` has no proof object on this QF_NRA route. It is returned only as
`Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED`; it is not a proof, Lean theorem, leaf
closure, or P97 conclusion. `UNKNOWN`, protocol errors, custody errors, and
semantic-replay rejection are inconclusive. These classifications are also
recorded in the compact driver artifact with `local_fallback: false`.

## Invocation and offline validation

The following commands describe the interface. Tests must use an in-memory
fake transport; the project test script does not contact PIQD or Z3.

```bash
PYTHONPATH=. uv run python census/p97_search/a_core_metric_driver.py \
  --run base+P+A2 --order-index 0 \
  --output scratch/a-core-a2-order0.json \
  --piqd-output-directory scratch/a-core-a2-order0.piqd

PYTHONPATH=. uv run python census/p97_search/a_core_metric_piqd.py \
  --check scratch/a-core-a2-order0.piqd/base-P-A2/order-00000
```

The standalone validator opens the published tree with the same bounded,
nofollow custody policy, reconstructs the source-semantic query from current
authenticated A-core inputs, validates every recorded PIQD lifecycle artifact,
replays SAT semantics independently, checks fresh sessions and stage control
flow, and returns the derived diagnostic result. It performs no daemon or
solver request.
