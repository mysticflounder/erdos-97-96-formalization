# Whole-carrier ordinal-coverage decision

Date: 2026-07-17

Status: **LOCAL ONE-ROW ORDINAL COVERAGE REFUTED AT LIVE CARD 11; GLOBAL
EQUALITY-QUOTIENTED ORDINAL REPLAY KILLS THE MODEL; THEOREM-DISCOVERY ONLY**

This audit asks whether the weakest plausible uniform consumer is sufficient:
one selected four-point equal-radius row at every cyclic carrier vertex,
strong connectivity of the selected-edge digraph, and only the one-row strict
distance comparisons obtained by cancelling one equality in either strict
Kalmanson inequality.

`search.py` encodes all eight cancellation orientations for every increasing
cyclic quadruple.  A SAT result is a finite countermodel to ordinal-only
coverage, but not a Kalmanson metric or Euclidean realization.  An UNSAT
result is bounded discovery evidence only.

The required current/sibling/legacy theorem-bank registries and indexed Lean
corpora were searched before introducing this decision surface.  Production
`ATail/OrdinalKalmansonCycle.lean` is the existing contradiction consumer;
this audit tests its missing coverage antecedent rather than adding another
consumer.

## Decision

The proposed local one-row ordinal coverage theorem is false.  `search.py` returns SAT
at both card 10 and the live threshold card 11.  A strengthened card-11 run
also retains the faithful structural prefix: row intersection at most two,
pair-center multiplicity at most two, cyclic alternation of every shared pair,
strong connectivity, and a total fixed-point-free blocker map whose image
omits two prescribed apices and whose blocker row contains its source.  Its
integer rank assignment satisfies all 285 active one-row comparisons generated
by all eight Kalmanson cancellation orientations.

`verify.py` is independent of Z3 and uses only the Python standard library.
It rechecks every row, computes forward reachability from every source, and
replays every active ordinal implication against the serialized ranks.

This does not provide a Kalmanson metric or encode the negative half of exact
critical-shell support. More importantly, it does not quotient distance terms
through equality chains contributed by several different selected rows.

`full_linear_replay.py` rejects the faithful card-11 table with one strict
Kalmanson inequality and seven row equalities across six centers. All four
terms in `kal2_1_2_3_4` collapse into one global equality class, so the strict
inequality becomes a self-loop. The deletion-minimal core is recorded by the
replay output and uses only vertices `0,1,2,3,4,10`.

`GlobalEqualityKalmansonCore.lean` kernel-checks ambient-cardinality-independent
consumers for both strict Kalmanson sums. Each pair of `EdgeClosure` hypotheses
may be transitive equality chains through arbitrarily many selected rows;
together they identify the two terms on each side of the corresponding strict
sum. Both theorems close over only `propext`, `Classical.choice`, and
`Quot.sound`.

This establishes the exact strategy boundary:

- **blocked:** coverage by local one-row cancellation comparisons alone;
- **still live:** global equality-quotiented ordinal coverage, followed when
  necessary by full multi-inequality Kalmanson/Farkas coverage;
- **fallback after a verified linear survivor:** exact critical-shell or
  additional Euclidean/MEC geometry.

## Reproduction

```bash
UV_CACHE_DIR=.uv-cache uv run \
  scratch/atail-force/whole-carrier-ordinal-coverage/search.py \
  --n 11 --faithful-structural --second-apex 1 --output \
  scratch/atail-force/whole-carrier-ordinal-coverage/n11_faithful.json

UV_CACHE_DIR=.uv-cache uv run \
  scratch/atail-force/whole-carrier-ordinal-coverage/verify.py \
  scratch/atail-force/whole-carrier-ordinal-coverage/n11_faithful.json

UV_CACHE_DIR=.uv-cache uv run \
  scratch/atail-force/whole-carrier-ordinal-coverage/full_linear_replay.py \
  scratch/atail-force/whole-carrier-ordinal-coverage/n11_faithful.json \
  --output scratch/atail-force/whole-carrier-ordinal-coverage/n11_full_linear_core.json

cd lean
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/whole-carrier-ordinal-coverage/GlobalEqualityKalmansonCore.lean
```
