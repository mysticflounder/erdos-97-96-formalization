# N>=17/general encoder inventory (bounded source audit)

Scope: source-only inventory of computational encoders relevant to a faithful
model of `TwoCapSourceThirdCanonicalRowSurface`.  I did not run solvers or
modify production Lean.  The required surface is read here as including:

* a variable carrier with `n >= 17` (or a genuinely general `n` parameter);
* a cap of cardinality at least eight, with two source points in one cap;
* source exclusion from four designated collision endpoints; and
* exact support/deletion constraints (both positive support and exclusion of
  every off-support point), together with the source/blocker and critical-row
  packet data.

## Executive finding

No existing encoder in the retained-omission lane satisfies all four items.
The closest reusable pieces are split across two incompatible artifacts:

1. `scratch/atail-force/generic-biapex-kalmanson-search/` has a real `n`
   parameter and a broad abstract Kalmanson/row/blocker model, but has no cap
   sets, cap cardinality, source-in-cap predicate, collision-endpoint packet,
   or deletion semantics.
2. `scratch/atail-force/three-complete-reverse-rows-analytic/verify_exact_countermodel.py`
   is an exact rational Euclidean/MEC replay on 17 named points.  It has an
   eight-point physical cap and three sources in that cap, but is a fixed
   witness with several load-bearing `TwoCap...` fields intentionally omitted.

The retained round-5/round-6 CEGAR scripts are exact-cardinality-15 models,
not n>=17 encoders; the n14 cap-aware wrapper is likewise a fixed profile.

## Fidelity matrix

| Artifact | General `n` | Cap >=8 | Two sources in same cap | Four collision endpoints excluded | Exact support/deletion | Trust/model |
|---|---:|---:|---:|---:|---:|---|
| `scratch/atail-force/generic-biapex-kalmanson-search/search.py` | yes | no | no | no | no | external Z3, abstract Kalmanson shadow |
| `.../generic-biapex-kalmanson-search/cegar.py` plus `WholeCarrierBiApexKalmansonSurface.lean` | yes | no | no | no | no | source-faithful whole-carrier rows, still no cap/deletion packet |
| `scratch/retained-omission-e1/round5-general-cegar/round5_cegar.py` and wrappers | no (hard-coded 15) | no (fixed caps of 6) | no generalized source pair | no explicit collision-endpoint exclusion | partial selected-row packets only | external Z3 finite relaxation |
| `scratch/atail-force/n14-cap-aware-kalmanson/search.py` | no (14) | no (5,6,6 profile) | no | no | no | external Z3 cap bounds |
| `scratch/atail-force/three-complete-reverse-rows-analytic/verify_exact_countermodel.py` | no (17-point fixture) | yes (8,6,6 named caps) | yes (q0,q1,q2 all in physical cap) | no packet-level exclusion | exact for displayed rows only; deletion/minimality/global packet omitted | exact rational Euclidean/MEC replay |
| `scratch/computational_residual_probe_20260731.py` | no actual geometry/`n` | abstract labels `(8,6,6)` | abstract labels only | no | no | finite-label probe, not an encoder |

## Artifact notes

### Retained round-5/round-6 lane

`round5_cegar.py` declares `POINTS = tuple(range(15))`, three fixed apices,
three fixed four-point interiors, and three six-point `CLOSED_CAPS`
(`scratch/retained-omission-e1/round5-general-cegar/round5_cegar.py:40-54`).
The v7/v8/v9+ and round-6 full-multiplicity scripts wrap this base, so they do
not introduce a variable carrier or cap-source packet.  Their README/report
describes an exact n=15 normalized finite slice; it must not be advertised as
an n>=17/general model.

### Generic whole-carrier Kalmanson search

`generic-biapex-kalmanson-search/search.py:48-75` accepts arbitrary `n`,
creates all-center membership rows of exact cardinality four, and one radius
per center.  Its module docstring records strict Kalmanson, triangle,
incidence, connectivity, and a total blocker map
(`search.py:2-16`).  `cegar.py` has the same `n` parameter and structural
surface.  These are useful metric/row scaffolds, but the row cardinality is
fixed at four and there are no named caps or source/deletion constraints.
The accompanying Lean extractor is source-clean for that whole-carrier
surface only; it does not prove the missing cap/source theorem.

### Exact n=17 rational fixture

`verify_exact_countermodel.py` reconstructs all coordinates over `Fraction`
without an SMT solver (`:1-7`).  It checks exact four-point supports and
off-support exclusion for the three displayed blocker rows (`:205-220`), and
defines named caps of sizes 8, 6, and 6 (`:230-235`).  The physical cap
contains q0, q1, q2 (hence at least two sources in one cap).  Its payload
explicitly omits global `CounterexampleData.K4`, the full `CriticalShellSystem`,
deletion minimality, `noM44`, and retained first-apex selected rows
(`:265-270`).  Thus this is a high-value regression fixture, not a faithful
universal encoder.

### Abstract residual probe

`scratch/computational_residual_probe_20260731.py` labels an abstract cap
profile `(8,6,6)`, but it does not construct coordinates, a source map, four
collision endpoints, or exact support/deletion constraints.  It should only be
used as a bookkeeping/probe artifact.

## Concrete recommendation

Use the generic whole-carrier search/CEGAR code as the metric indexing base,
then add a separate cap/source/deletion overlay.  The overlay should:

1. parameterize the three cyclic closed caps and assert a cap cardinality
   lower bound of eight;
2. introduce source booleans (or a source map) and assert two distinct sources
   in one cap;
3. name four collision endpoints and assert every selected source is outside
   that set, with all required distinctness conditions;
4. encode exact row support as an iff: selected points have the source radius,
   and every other carrier point is explicitly excluded; and
5. add the source-to-critical-blocker map, common critical shell, and deletion
   minimality only as explicit packet fields wired to the target.

Use the 17-point rational fixture as a regression/sanity witness for the
cap-cardinality and same-cap-source clauses.  Any finite solver result should
remain labelled bounded external evidence; it is not a uniform n>=17 closure
until the parameterized overlay is checked and promoted through the Lean
surface.
