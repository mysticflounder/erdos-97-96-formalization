# Exact-five safe-selector test and a weaker omission selector

## Preamble: target under investigation

For EVERY tuple of parameters and witnesses satisfying the EXACT live physical
theorem signature, there exists x in A such that x is outside E, B, and L,
and x belongs to the first closed cap or the supporting triangle, or
radius ≤ dist(firstApex, x).

This is the safe strict-fresh selector proposed in Pro response #16367,
consult `01M1TT294Z8AG49YBDVAF9XWM2`. **CONJECTURED; not established here.**
The live consumer is
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`.
Its ordinary residual, normal form, original strict-fresh packet, retained
omission and retained deletion packet are kept unchanged. No minimum-pair
evidence is substituted. The physical `sorry` remains open.

This checkpoint supplies a finite-metric diagnostic and a separate, weaker
paper result sufficient to choose a non-double-hit source when |A| ≥ 15.
That result does not prove the safe selector and does not close omission cases.
No production Lean declaration or admission is added.

Lane: `exactfive-safe-selector-20260906`.
Base: `3a86fc5616d90a2d75e5e382c243337a47e352e8`.
Source preflight began at `8e6f754f72a5c421a1c5c59308ee4bdd77f6913b`;
the inspected residual and fresh-row geometry were unchanged from `02fa6e206`.

## Definitions and source inputs

A is the finite planar carrier, O the first apex, r its selected radius,
and q,w the distinct interior pair. Write E for the five-point radius-r
class at O, B for the retained blocker's four selected witnesses, L for
the second apex's four selected witnesses, U = E ∪ B ∪ L, and F = A ∖ U.
The retained endpoint belongs to E ∩ B. Both endpoints belong to E.
The original strict-fresh source belongs to F.

The original safe condition uses actual geometric cap and triangle membership.
The finite control below has only *marked* cap and triangle sets, not these
geometric objects. That distinction is load-bearing.

The bounded current-project/cross-project reuse preflight found:

- `Dumitrescu.perpBisector_apex_bound`, `P97/Dumitrescu/L1.lean:128`:
  at most two carrier points equidistant from distinct q,w in a
  convex-independent planar carrier.
- `ATailThirdCenterCommonPair.selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers`,
  `ATail/ThirdCenterCommonPair.lean:144`, an existing consumer of that bound.
- `CriticalShellSystem.source_mem_selectedFourClass`,
  `P97/U1CarrierInjection.lean:1165`: every selected four-class at a chosen
  blocker contains the source whose deletion makes it critical.
- The three `actualFreshBlocker_doubleHit` consequences in
  `ATail/ExactFiveDistinctPhysicalFreshRowRadiusDrop.lean`, at lines 231,
  417 and 452: an off-E double-hit source is outside the first cap,
  strictly closer than r to O, and outside the support triangle.

These are inspected source statements, not a fresh kernel/axiom audit.
The geometric argument below also explains the needed bisector and
source-membership facts directly. The immediate intended consumer is the
physical pair-hit split. Its remaining missing consumers are stated below.

## Auxiliary proposition: at most two double-hit fresh sources

**PROVEN — pen-and-paper, independently reviewed; not newly Lean-formalized.**
Under the live physical hypotheses, at most two members of F have their
canonical actual row containing both q and w. Consequently, if |F| ≥ 3,
some x in F has an actual row omitting q or w.

Proof. Every center of a double-hit row is equidistant from q and w.
O is also equidistant from them because q,w belong to E. The first-apex
deletion-robustness field excludes O as an actual blocker: a source deletion
cannot both preserve K4 at O and destroy all positive-radius four-witnesses
there.

The perpendicular bisector of distinct q,w is a line. A convex-independent
finite planar carrier has at most two points on a line: among three distinct
collinear points, one belongs to the segment joining the other two and hence
to their convex hull. Since O already occupies one position on this bisector,
there is at most one other carrier center available for all double-hit rows.

If there are no double-hit sources in F, the bound holds. Otherwise fix one
such source and its exact four-point actual support K, centered at c. All
other double-hit sources have actual center c. Every such source lies in K:
if a source y did not lie in K, deleting y would leave K as four equidistant
witnesses at c, contradicting the chosen blocker's deletion failure.

The distinct points q,w are already in K. Neither belongs to F, since both
belong to E. Thus double-hit members of F lie in K ∖ {q,w}, a two-point set.
Three distinct members of F cannot all be double-hit. This proves the claim.

**Corollary — PROVEN, pen-and-paper under the same source hypotheses.**
If |A| ≥ 15, a strict-fresh non-double-hit source exists.

Indeed |U| ≤ 5 + 4 + 4 − 1 = 12 because the retained endpoint lies in E ∩ B.
As U is contained in A, |F| = |A| − |U| ≥ 3, so the proposition applies.
This corollary makes no conclusion for |A| ≤ 14.

Choose its x while keeping H, the ordinary residual, and the normal form
fixed. The original deleted point belongs to E, so x differs from it.
The identity firstApexClass.support = E.erase deleted and the B,L omissions
allow reconstruction of the same three-row packet with x using
`nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses`.
The retained omission and retained packet do not change. This is a possible
ingress into an omission-only continuation, not a contradiction for that
continuation or permission to introduce new admitted wrappers.

## Exact finite diagnostic

**EMPIRICALLY VERIFIED — one rational 13-point metric and all 8,190 proper
nonempty subsets.** Replay:

```bash
uv run --no-cache --no-sync python -B scripts/check_exactfive_safe_selector_metric_control.py
uv run --no-cache --no-sync python -B -m pytest -q -p no:cacheprovider tests/test_exactfive_safe_selector_metric_control.py
```

The carrier is {0,...,12}. Give edges of the square of the 13-cycle,
together with {0,6}, distance 3/2. Each remaining unordered pair receives
its own rational distance (1000+j)/1000, where j is its one-based index
in lexicographic enumeration of all 78 unordered pairs. Diagonal distances
are zero. All distinct-point distances lie between 1 and 3/2, so triangle
inequalities hold strictly; the checker also tests them directly.

The selected data are O=0, V=6, q=1, w=2, and retained blocker=4:

| Data | Points |
| --- | --- |
| E, full unique rich class at O | 1,2,6,11,12 |
| B, exact actual row at blocker 4 | 2,3,5,6 |
| L, selected four-witness subset at V | 0,4,5,7 |
| Marked support triangle | 0,6,5 |
| Marked first-cap interior | 1,2,11 |
| F = A ∖ (E ∪ B ∪ L) | 8,9,10 |

The marked closed cap adds boundary labels 6 and 5 to the marked interior.
All marked safe points are covered by U, so the *marked-set* selector fails.
L is not claimed to be a full ambient class: V's rich class is {0,4,5,7,8}.
This is consistent with the selected-subset meaning of `SelectedFourClass`;
it does not supply a geometric instance of that Lean type.

The checker reconstructs all radius classes from the rational distance
matrix and checks global metric K4, no proper nonempty subset with global
metric K4, all 13 matrix-defined critical choices and deletion failures, single
deletion robustness at O and V, first-apex double-deletion failure,
second-apex joint survival, and rich-row pair intersections at most two.
It does not substitute graph degrees for these matrix checks.

### Explicit geometric rejection

The points (a,b,c,d)=(0,3,11,4) violate the planar Ptolemy inequality:

    d(a,c)d(b,d) = 9/4 > 2097311/1000000
                         = d(a,b)d(c,d) + d(a,d)d(b,c).

For complex coordinates the identity
(a−c)(b−d) = (a−b)(c−d) + (a−d)(b−c), followed by absolute values and the
triangle inequality, gives the opposite weak inequality. Thus these
distances cannot come from planar Euclidean coordinates. This is an exact
rejection diagnostic, not a candidate geometric counterexample.

There is also a directly relevant source failure: H(q)=3 is equidistant from
the marked interior pair q,w at radius 3/2, equal to r. The existing interior
pair radius-drop result would force a strict inequality in the geometric
source. No MEC, actual cap geometry, convex planar realization, or no-M44
condition is supplied. The metric/global-minimality/total-critical data alone
are therefore an insufficient relaxation for proving the safe selector.
All three fresh points in this control already have zero-hit actual rows;
it does not challenge the auxiliary non-double-hit conclusion.

## Validation and completion matrix

Independent read-only code/mathematical review passed for the stated scope.
Five tests pass, including rejection of asymmetric, nonmetric, nonminimal,
and invalid-blocker mutations. Ruff passes. No solver or Lean build was run.
The encoder audit found no retained encoding with all of the exact selector's
planar, global K4, total-shell and minimality hypotheses. Existing local
rational controls and PiQD geometry lanes omit some of these inputs.

| Obligation | Label | Status / evidence |
| --- | --- | --- |
| Bisector capacity, robust O exclusion, exact-row source membership | PROVEN (paper) | Arguments above; source APIs inspected |
| At most two double-hit fresh sources | PROVEN (paper) | Argument and independent review above |
| Carrier cardinality ≥ 15 gives a non-double-hit strict-fresh source | PROVEN (paper) | Union count and proposition above |
| Original uniform safe selector | CONJECTURED | Open; metric relaxation does not decide it |
| Finite metric negative control | EMPIRICALLY VERIFIED | One exact matrix; 8,190 subsets; five tests |
| New Lean formalization and current transitive trust audit | CONJECTURED | Not performed; no promotion claim |
| Small-cardinality and omission-only terminal consumers | CONJECTURED | Open; physical admission unchanged |

## Next work

Keep the exact safe selector open. The weaker source-count result provides a
more direct route to its intended double-hit elimination when |A| ≥ 15, but
does not solve the remaining cases. Before any production integration,
identify a real contradiction consumer for the remaining small-cardinality
or omission cases and update the active plan's measured reduction. Do not
turn this audit into another collection of off-spine helpers or admissions.
