# FreshThird six-center provenance canary v1

Run on 2026-08-08 with:

```bash
uv run python scratch/p97-consumer-first/freshthird_six_center_provenance_v1/freshthird_six_center_provenance_canary.py
```

## Scope

This is a named-incidence abstraction of the source-clean Lean boundary
`SixSurvivorExactRowsSourceProvenanceBoundary`. It encodes:

- six exact four-point q-deleted rows;
- omission of the common deleted point and each row's own center;
- `Pρ.source₁, Pρ.source₂ ∈ B₀`;
- `B₁ = {P.source₁, P.source₂, Q.source, Q.otherOutsidePoint}`; and
- the surviving source incidence in `B₅`.

It does **not** encode the full carrier-wide K4 hypothesis, Euclidean metric
realizability, cap order, or a general-cardinality lift. Consequently it is a
theorem-discovery canary, not a closure certificate.

## Exact result

Z3 4.16.0, QF_FD, 5-second per-query timeout:

| Query | Result |
|---|---|
| Base provenance packet | SAT |
| Some 8-incidence tetrahedron consumer motif exists | SAT |
| No 8-incidence tetrahedron consumer motif exists | SAT |
| Omit `rho1` from `B₀` | UNSAT control |
| Put the deleted point in `B₀` | UNSAT control |
| Omit `Q.otherOutsidePoint` from `B₁` | UNSAT control |
| Put the deleted point in `B₅` | UNSAT control |

The absent-motif survivor was:

```text
B0 = {c1, c5, rho1, rho2}
B1 = {p1, p2, q_source, q_other}
B2 = {c4, q_other, f2, f6}
B3 = {c0, c1, c2, c4}
B4 = {c0, c5, f2, f5}
B5 = {c1, c2, q_source, source5}
```

## Consequence

The newly retained B0/B1/B5 provenance is genuine but does not
propositionally force the eight incidences consumed by
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`. Growing
this same incidence abstraction cannot close the live FreshThird residual.
The next source theorem must add cross-row center incidence, a common point,
or cyclic-order information, or supply a different checked consumer.
