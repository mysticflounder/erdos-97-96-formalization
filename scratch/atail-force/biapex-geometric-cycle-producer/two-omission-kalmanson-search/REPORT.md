# Fixed-profile two-omission Kalmanson search

Date: 2026-07-17

Status: **STOPPED — theorem-discovery only; the fixed profile is not a live
`FrontierBiApexRobustResidual` surface.**

## Quantifier/cardinality mismatch

The inherited search in
`scratch/atail-force/robust-all-center-cegar/search.py` fixes

```text
PROFILE = (8,4,5)
OPP_CAP_2 = {C,G,K,O}
```

so the physical second opposite cap represented by this model has cardinality
four. The live large-physical-radius branch instead carries

```lean
6 ≤ S.oppCap2.card
```

through `LargePhysicalSecondApexRadiusIngress.second_cap_card_ge_six` (and the
corresponding exact-two-four-radius residual has the same lower bound). No
production theorem extracts this fixed `(8,4,5)` role surface from
`FrontierBiApexRobustResidual` or from the live ingress packet.

Therefore SAT, UNSAT, or Kalmanson exhaustion on this search would classify
only this non-live fixed abstraction. It cannot close the robust endpoint or a
production `sorry`. The script now refuses to run unless the caller explicitly
passes `--allow-nonlive-profile`.

## Encoding correction retained

`search.py` records the useful theorem-discovery correction without promoting
the surface to a live model:

1. it eagerly forbids every increasing quadruple `a<b<c<d` for which selected
   rows at both `a` and `b` contain `c,d`;
2. that terminal is consumed in production by
   `false_of_two_selected_rows_shared_late_pair`;
3. decoded models are checked against equality-quotiented
   `SelectedRowOrdinalComparison` closure before acceptance; and
4. a full homogeneous linear strict-Kalmanson verifier is implemented over
   all cyclic quadruples plus all selected and ambient row equalities, with
   strict slack normalized to one and serialized UNSAT cores.

The linear layer was not reached by the bounded run reported below. It is
retained only as reusable theorem-discovery infrastructure; no claim of full
Kalmanson feasibility or infeasibility was obtained.

## Smoke gates

The corrected matcher detects the kernel-checked `Fin 12` regression at the
first expected quadruple:

```text
0 < 1 < 2 < 3
row 0 contains 2,3
row 1 contains 2,3
```

Thus row 0 forces `d(1,2) < d(1,3)`, while row 1 identifies the two distance
terms. The smoke witness is exactly `[0,1,2,3]`. A clean four-label negative
fixture passes.

This fixes a real bug in the old Fin12 regression interpretation. It does not
make Fin12 a live robust-branch model.

## Bounded run already completed

One 180-second run was completed before the live-surface mismatch was
identified. It used:

```text
replayed producer-bank cuts                  524
eager shared-late-pair quadruples           1001
omitted blocker centers                     O,A
stored corrected survivors                  101
stored survivors satisfying both omissions 0
```

The terminal result was:

```text
status                              UNKNOWN_FAIL_CLOSED
operational reason                  wall limit / final solver canceled
elapsed seconds                     180.001
structural refinements              14,407
ordinal cycle refinements           1
linear Kalmanson refinements        0
new current-bank cuts               0
verified accepted survivors         0
```

This is neither SAT nor UNSAT. No survivor was accepted.

The one structurally verified candidate reached by the run was rejected by a
one-edge equality-quotiented ordinal cycle. Its strict edge was:

```text
center C, constructor diagonalEqLastSide
quadruple t1 < I < C < K
d(t1,I) < d(I,K)
```

and selected-row equalities at `K,G,F,I` identified `d(I,K)` back with
`d(t1,I)`. The serialized dependency set was `{C,G,K,I,F}`. This is a useful
generic-cycle smoke certificate, but it belongs only to the non-live fixed
profile.

The prior checkpoint's `producer_bank.py` source hash had drifted; the 524
stored clauses were replayed literally, while current-bank rescanning was
required before acceptance. The run never accepted a model and never reached
a new current-bank cut.

## Epistemic verdict and next live action

- **Kernel-checked:** the shared-late-pair Lean consumer and the Fin12
  incidence theorem in the separate scratch audit.
- **Exact finite theorem-discovery evidence:** the serialized ordinal
  self-cycle found after structural verification.
- **Unknown:** the bounded two-omission fixed-profile map after 180 seconds.
- **Not tested:** full linear Kalmanson feasibility on an ordinal-clean
  structurally verified candidate.
- **Not a live coverage statement:** every result in this directory, because
  of the cap-cardinality and extraction mismatch.

Do not spend more compute on this fixed profile for K-A-PAIR closure. A live
finite route would first need a source-faithful abstraction parameterized by
both opposite cap sizes at least six, together with a proved extraction from
the actual ingress/robust packet. Otherwise the next work should stay in Lean
and derive a Kalmanson terminal directly from the live cap/order fields.

