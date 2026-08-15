# FreshThird exact five-assertion core: theorem-bank pass (2026-08-07)

## Scope and search status

Input was `scratch/p97-consumer-first/freshthird_source_faithful_core_shrink.results.txt`.
No solver, CEGAR rerun, or Lean edit was used.  The required registries were
scanned (`docs/general-n-certificate-bank-mining-2026-07-09.md` and the three
`certificates/*p97*mining.{md,json}` files).  They point to the generic
Kalmanson banks but contain no FreshThird-specific declaration matching these
five labels.  The requested `nthdegree docs search --lean --agentic` calls were
attempted but the backend reported its GPT-5.3-Codex-Spark usage limit; the
non-agentic corpus search still located the source declarations below.

## Five assertions and weakest reusable consumers

| assertion | normalized source/consumer | source entitlement in the active residual |
|---|---|---|
| `a00404`, `a00405` (`known_row_equal_radius`, center `drowCenter`, points `e1`,`e2`) | `SelectedFourClass.support_eq_radius` / `CriticalFourShell.support_eq_radius`; these are the equality producers consumed by a Kalmanson inequality | `qBetween = drowCenter` is source-corrected in arm 1.  Equal-radius is available only for actual support members; fixed labels `e1`,`e2` and their order are not produced. |
| `a00524`, `a00526` (`blocker_slot_shell`, `b3`, slots `a3_0`,`a3_2`) | same support-radius producers, but only after a shell-slot-to-physical-support incidence lift | anonymous encoder slots are not source-entitled aliases of named D-row points.  No live theorem transports `a3_0/a3_2` to `e1/e2` (or proves their D-row membership). |
| `a19885` (`kalmanson`, quad `b3,qBetween,e1,e2`, `first`) | `OrderedQuadData.kalmanson_lt` with `KalmansonForm.innerOuter`; its RHS/LHS is the strict four-point inequality `d(qBetween,e1)+d(b3,e2) < d(b3,e1)+d(qBetween,e2)` | Requires one boundary order such as `b3 < qBetween < e1 < e2` (plus injective/image/CCW/convexity).  FreshThird only orders `qOutside,freshCenter,qBetween,sourceCenter,canonicalSource`; it gives no order or shell incidence for `b3,e1,e2`. |

Thus the five-core is naturally one generic Kalmanson consumer plus four
support equalities.  `false_of_freshThird_four_order_arms` is a stronger,
FreshThird-specific consumer, but it consumes the five-point arm order and
source-center equalities, not this `(b3,qBetween,e1,e2)` quad; it is therefore
not the weakest match.

## Alias, incidence, and order audit

Source-entitled by the active FreshThird residual:

* `qBetween = drowCenter` (the corrected selected-endpoint arm);
* `canonicalSource = pinnedCenter` (canonical source-row alias);
* the four-way order of `qOutside,freshCenter,qBetween,sourceCenter,canonicalSource`;
* source/fresh shell memberships, boundary injectivity/image/CCW, and
  `support_eq_radius` once an existential selected-four support point is supplied.

Not source-entitled:

* `f2 = e0` (a finite alias artifact; the source/fresh shell contract does not
  identify a fresh extra with a D-row point);
* `a3_0 = e1` and `a3_2 = e2` (or any slot-to-D-row mapping);
* `b3 < qBetween < e1 < e2`, any permutation of that order, or any theorem
  identifying `b3` with a FreshThird center/source;
* fixed D-row names `e1,e2` as support points.  The source API produces an
  existential `SelectedFourClass` and its support, not these encoder labels.

Consequently the diagnostic UNSAT is not a promoted contradiction: the
finite core still contains aliases/order/incidences for which no universal
source producer has been identified.

## Smallest reusable source theorem/cut

The first missing bridge is a source-faithful selected-blocker-shell lift,
not a new metric lemma.  A useful minimal shape is either

```text
∃ e1 e2, e1 < e2 ∧
  e1,e2 ∈ blockerShell(b3) ∩ DRow.support ∧
  dist b3 e1 = dist b3 e2 ∧
  dist qBetween e1 = dist qBetween e2
```

or, if preserving the encoder names,

```text
a3_0 = e1 ∧ a3_2 = e2 ∧
e1,e2 ∈ (selected D-row).support
```

together with the required boundary order.  In an equal-centre branch this
can be factored as a reusable `shell_mem_row_of_equal_branch` theorem: support
equality plus anonymous-slot membership yields row membership; existing
`support_eq_radius` then supplies both metric equalities.  Once this lift and
the order are present, `OrderedQuadData.kalmanson_lt` (inner/outer form)
closes the five assertions by linear arithmetic.  Until then the smallest
honest next cut is a source-level negation forbidding these unlifted alias/order
assignments, rather than promotion of the finite UNSAT.

## Provenance

* `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/GenericRowNogoodCertificate.lean`:
  `OrderedQuadData.kalmanson_lt`, `false_of_selected_rows_in_five_ccw_order`.
* `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean`:
  `false_of_five_ccw_three_shell_equalities` and the underlying strict
  Kalmanson inequalities.
* `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean`:
  `endpointCentered_dist_eq_of_two_blocked_deletions`,
  `false_of_freshThird_orderSelectedEndpointDeletionObstructions` and its
  canonical-source adapter.
* `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean`:
  `FreshThirdFivePointKalmansonOrder` (order producer only).

Classification: the finite result is diagnostic empirical evidence; the
generic Kalmanson theorem is a checked consumer, while the required slot/order
lift is an unproved source producer.  No closure claim follows from this pass.
