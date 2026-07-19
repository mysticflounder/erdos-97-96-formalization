# Whole-carrier shared-late-pair decision audit

Date: 2026-07-17

Status: **SAT COUNTERMODEL AT CARD 10 AND CARD 11; INDEPENDENTLY VERIFIED;
CARD-10 MODEL KERNEL-PINNED; DIRECT TWO-ROW TERMINAL NOT FORCED.**

## Decision

The following purely combinatorial hypotheses do **not** force
`false_of_two_selected_rows_shared_late_pair`:

- one four-element support row at every cyclic carrier vertex;
- exclusion of the row center;
- pairwise row intersection at most two;
- at most two row centers through any fixed carrier pair;
- strong connectivity of the selected-row digraph; and
- a total fixed-point-free source blocker map whose image omits two prescribed
  carrier values and whose blocker row contains its source.

`search.py` explicitly negates the shared-pair terminal and returns SAT in
under one second at both `n = 10` and `n = 11`, with omitted values `0,1`.
The stronger run also forbids every cyclic rotation of the four-point pattern,
not only the literal increasing presentation `a < b < c < d`.

The decisive artifacts are:

- `n10_omit01_cyclic.json` and `n10_omit01_cyclic.verify.json`;
- `n11_omit01_cyclic.json` and `n11_omit01_cyclic.verify.json`; and
- `WholeCarrierSharedLateCountermodel.lean`.

## Independent verification

`verify.py` uses only the Python standard library.  It reconstructs the row
sets and blocker map from JSON and independently checks:

```text
maximum row intersection     2
maximum pair-center count    2
selected-row graph strong    true
blocker map total            true
blocker image omits 0,1      true
cyclic shared-pair terminal  none
```

It checks strong connectivity by forward and reverse reachability, not by
replaying the solver's cut clauses.

## Lean pin

`WholeCarrierSharedLateCountermodel.lean` kernel-checks the smaller card-ten
model.  In particular:

- `finite_surface_checked` checks every local row, pair, and blocker field;
- `no_nonempty_proper_rowClosed_checked` checks the exact outgoing-cut
  characterization of strong connectivity;
- `selectedEdge_reflTransGen` turns that finite cut check into actual
  `Relation.ReflTransGen` reachability between every ordered pair;
- `no_sharedLatePair_checked` rejects the literal production antecedent; and
- `no_cyclicSharedPair_checked` rejects all four cyclic rotations.

The printed axiom closures contain only the standard project trio
`propext`, `Classical.choice`, and `Quot.sound` (the two terminal checks need
only `propext` and `Quot.sound`).  There is no `sorry` or `admit`.

## Critical boundary: generic ordinal closure remains viable

This is an incidence countermodel to the **direct two-row terminal**, not a
Kalmanson-metric realization.  Exact LRA replay rejects both the card-ten and
card-eleven row tables.  The card-ten witness has an especially small
three-row ordinal core on `0 < 1 < 2 < 6`:

```text
K1: d02 + d16 > d01 + d26
row 0: d02 = d01
row 1: d16 = d12
row 2: d26 = d12
```

Thus the reduced strict comparison is a self-loop.  The incidence prefix is
kernel-pinned by `three_row_ordinal_cycle_incidence_checked`.

The strategic conclusion is narrow but decisive: whole-carrier connectivity,
the two incidence multiplicity bounds, and two blocker omissions cannot be
used to force the specialized shared-late-pair producer.  A viable uniform
route must either:

1. target the already-produced generic ordinal-cycle consumer and prove
   source-valid coverage; or
2. add a genuinely geometric/full-critical-map field that collapses a longer
   equality chain to the two-row terminal.

The SAT shadows do not refute the first route.

## Preflight and epistemic status

The required current, sibling, and legacy theorem-bank registries were checked
before this search, followed by focused `nthdegree docs search --lean`
queries.  They found the existing production shared-pair consumer and generic
ordinal-cycle machinery, not an existing theorem asserting this combinatorial
implication.

- **KERNEL-CHECKED:** the card-ten finite incidence model and its strong
  connectivity/no-terminal properties.
- **INDEPENDENTLY VERIFIED FINITE SAT:** card ten and card eleven.
- **EXACT FOR THE FIXED ROW TABLES:** both are full-Kalmanson LRA-infeasible;
  the displayed card-ten ordinal self-loop replays exactly.
- **NOT CLAIMED:** Euclidean realization, live critical-shell extraction,
  arbitrary-cardinality coverage, or closure of a production `sorry`.

## Reproduction

```bash
UV_CACHE_DIR=.uv-cache uv run \
  scratch/atail-force/whole-carrier-shared-late-decision/search.py \
  --n 10 --second-omitted 1 --terminal-mode cyclic \
  --output scratch/atail-force/whole-carrier-shared-late-decision/n10_omit01_cyclic.json

UV_CACHE_DIR=.uv-cache uv run \
  scratch/atail-force/whole-carrier-shared-late-decision/verify.py \
  scratch/atail-force/whole-carrier-shared-late-decision/n10_omit01_cyclic.json

cd lean
lake env lean -R .. -M 16384 -s 65536 \
  ../scratch/atail-force/whole-carrier-shared-late-decision/WholeCarrierSharedLateCountermodel.lean
```
