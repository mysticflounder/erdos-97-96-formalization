# Shared-fourth crossed arm: cap-local betweenness census

Date: 2026-08-08.  This directory is scratch computation only.  It does not
close a Lean `sorry` and no result here is a promotion candidate.

## Source-facing model

The roles are the six first-cap endpoints of the three exact rows

```text
first row:    P1, P2, X, Y       (center F)
common row:   A, B, X, S          (center C)
opposite row: R1, R2, Y, S        (center O)
```

Here `X`, `Y`, and `S` are outside the first cap.  The cap-local roles are
`P1,P2,A,B,R1,R2,F,C,O`.

The admission uses only the following nonaliases available at the current
source interface:

* `P1 ≠ P2`, `R1 ≠ R2`, and every `Pi ≠ Rj` from the disjoint retained pairs;
* `A ≠ B`, and each of `A,B` differs from every `Pi,Rj`, because each
  `CapSourceThirdCanonicalRowWitness` source is outside the four retained
  endpoints;
* `F ≠ P1,P2`, `C ≠ A,B`, and `O ≠ R1,R2` from
  `CriticalFourShell.center_not_mem_support`;
* `F ≠ C ≠ O` (and `F ≠ O`) from the blocker/source witness exclusions.

The twelve remaining center/endpoint alias pairs are not silently ruled out.
The script enumerates legal alias assignments, rejecting only assignments that
reuse one endpoint for two distinct centers.  There are 95 assignments:

| cap representatives | alias assignments |
| ---: | ---: |
| 9 | 1 |
| 8 | 14 |
| 7 | 40 |
| 6 | 40 |

For an alias assignment, `F between P1/P2`, `C between A/B`, and `O between
R1/R2` is imposed only when the center is distinct from both endpoints.  This
is exactly the premise needed by `CGN.index_strictly_between_of_equidistant`;
if an alias makes that premise unavailable, the corresponding constraint is
omitted rather than guessed.

## Enumeration

`census.py` enumerates every representative permutation.  Linear cap orders
are quotiented by reversal, which is the safe symmetry for the ordered-cap
index.  It also reports boundary-only cyclic orders modulo the dihedral group;
the source theorem is linear, so the cyclic count does **not** impose a cyclic
betweenness interpretation.

The exact run (`uv run python census.py`) produced:

* 18,168 linear orders surviving the source-available betweenness constraints
  across all alias assignments;
* by representative count: 6 → 336, 7 → 3,048, 8 → 8,064, 9 → 6,720;
* 67,920 boundary-only cyclic candidates, with 2,400 / 15,120 / 30,240 /
  20,160 for 6 / 7 / 8 / 9 representatives;
* all four v2 cross-distance sign arms (`00`, `01`, `10`, `11`) remain in each
  row as labels.

Thus survivors remain.  This bounded order census supplies no contradiction.

## Deliberate limitations

The outside roles `X,Y,S` have no source-provided placement in the first-cap
linear order, so the v2 inequalities

```text
d(C,Y) ≠ d(C,X),   d(O,X) ≠ d(O,Y)
```

are retained only as four sign-arm labels.  They are not converted into order
constraints.  No Kalmanson, Euclidean realization, omitted-row incidence,
full carrier K4, or universal finite-to-Lean lift is asserted.  In particular,
the nonempty output is a diagnostic survivor census, not evidence that the
Lean residual is realizable or that the target theorem is false.

Artifacts:

* `census.py` — reproducible exact combinatorial enumeration;
* `results/census.json` — per-alias counts and assumptions;
* `results/summary.json` — aggregate counts;
* `results/run.out` — short run record.
