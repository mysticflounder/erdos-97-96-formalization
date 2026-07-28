# E round-1 response (deep thinker, 2026-07-28)

Response to `2026-07-27-tri-apex-directed-omission.md` (E package, leaf E1
`false_of_retainedInteriorDirectedOmission_and_all_low_hits`, now at
`FrontierLiveClosure.lean:6594` after refactor `a0f73bc1`). Math delimiters
preserved verbatim (source mangling). No resolution; central finding: the
polarity mismatch (omission supplies survival, the localizer needs failure),
re-derivation of the 15-point equality-shadow obstruction
(`scratch/triapex-incidence-obstruction/`), and two sufficient forms of the
missing positive-incidence producer.

---

## Result

I did **not** obtain either success condition required by the prompt:

* no rigorous derivation of `False` from exactly (E0)–(E9); and
* no exact algebraic configuration satisfying every hypothesis, especially global minimality and no-$(m,4,4)$ repackaging.

Consequently, I do not have a sound Lean term that can replace the `sorry` in

```lean
false_of_retainedInteriorDirectedOmission_and_all_low_hits
```

and I will not present an unsupported proof as closure. I treated the attachment’s complete E0–E9 bundle and its dual-branch contract as binding.

The current source still contains the target with a literal `sorry`, and the current computational-closure plan lists Family E as an unresolved package whose encoding has not yet been validated.

## Strongest rigorous derivation

Normalize the directed-omission disjunction by symmetry. Write

[
u=x_1,\qquad v=x_2,\qquad b=c(u),\qquad \Sigma=\Sigma(u),
]

and suppose

[
v\notin\Sigma
\quad\text{and}\quad
K4(A\setminus{v},b).
]

The other orientation is identical with (u,v) exchanged.

The following consequences are source-clean.

### 1. The three apices are fully deletion robust

Rich structure at (a_1,a_2,a_0) implies full deletion robustness in either arm:

* a class of cardinality at least six retains at least five members after one deletion;
* two distinct K4 radii cannot both be destroyed by deleting a single point.

Hence no blocker center equals any of the three apices. This also separates every blocker row from every apex circle, so the generic two-circle theorem already gives

[
|\Sigma(x)\cap\Gamma(v_i,r)|\le 2.
]

Thus the low-hit assumption is not a new source of positive information: it is the cap-restricted form of an already available upper bound.

### 2. The omission has the wrong polarity for localization

For same-cap points (u,v) on one (a_1)-circle, if cross-deletion **fails**,

[
\neg K4(A\setminus{v},c(u)),
]

then blocker criticality forces (v\in\Sigma(u)). Since (u\in\Sigma(u)), the row has two hits on

[
\Gamma(a_1,\rho_0)\cap C_{i_1}^{\circ},
]

and the banked two-hit localization theorem traps (c(u)) in (C_{i_1}^{\circ}).

But the packet (P) supplies exactly the opposite statement:

[
v\notin\Sigma(u)
\quad\Longleftrightarrow\quad
K4(A\setminus{v},c(u)).
]

Therefore the localizer cannot be applied to the directed-omission edge itself. This is the central polarity mismatch:

```text
available from P:       cross deletion survives / partner omitted
needed by localizer:    cross deletion fails / partner lies in row
```

The project’s present findings identify the same missing positive-incidence bridge. ([GitHub][1])

### 3. Distinct blockers do not add a second incidence

Because (u) and (v) lie on the same (a_1)-circle, (a_1) lies on the perpendicular bisector of (uv). If both cross-memberships held,

[
v\in\Sigma(u),\qquad u\in\Sigma(v),
]

then both (c(u)) and (c(v)) would also lie on that bisector. Convex independence gives the carrier perpendicular-bisector bound of at most two carrier points. Since (a_1,c(u),c(v)\in A) and the blocker centers are distinct from (a_1), this is impossible.

That proves at least one directed omission, but this is essentially the producer of (P), not a contradiction. It explains why the distinct-blocker branch naturally yields an omission rather than a concentration.

### 4. The rich interior patterns do not attach their points to a row

Each E8 arm supplies either:

[
|,\Gamma(v_i,r)\cap C_i^\circ,|\ge4,
]

or two slices of size at least two. However, no hypothesis says that any fixed blocker row contains two or three of those points.

E7 says every carrier point occurs in **its own source row**, but rows associated with different sources may coincide or may distribute the rich points two at a time. E9 only forbids a row from taking three points after such an attachment is produced. It cannot produce the attachment.

The exact missing terminal witness would have the form

```lean
∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
  ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
    3 ≤
      ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card
```

because `hlow` would immediately contradict it. The later theorem with this conclusion is not an independent solution of E1: its source commentary and proof route place it downstream of the same unresolved low-hit coordinator, so using it here would be circular.

### 5. Minimality does not turn the omitted source into a removable point

Deleting (v) preserves K4 at:

* all three apices, by tri-apex robustness; and
* (c(u)), by the directed omission.

But deletion of (v) destroys K4 at its own blocker (c(v)), because (v\in\Sigma(v)) and (\Sigma(v)) is the unique four-class at (c(v)). Thus minimality supplies no immediate removable-vertex contradiction.

More generally, the cover bound

[
|A|\le 4|\mathcal N|
]

is a **lower bound** on the number of non-robust centers,

[
|\mathcal N|\ge \lceil |A|/4\rceil,
]

not an upper bound that would force row concentration.

The tempting shortcut “minimality plus (|A|>9) is already contradictory” also fails: the repository includes the finite-(n) closure establishing that a convex K4 carrier has cardinality at least ten. ([GitHub][2])

## Exhaustive structural check

The repository’s 15-point equality-shadow model realizes the main finite-incidence content simultaneously:

* 15 carrier labels;
* three cap interiors of four labels each;
* three six-point rich apex classes;
* exact four-point unique blocker rows;
* source inclusion in its own row;
* blocker centers avoiding the apices;
* shell–shell and shell–rich intersections at most two;
* directed omissions;
* no proper nonempty K4 subcarrier in the equality shadow.

Its reported checks are:

```text
vertices=15
shells=12
rich_classes=3
blocker_fiber_max=2
doubled_fibers=3
max_shell_shell_intersection=2
max_shell_rich_class_intersection=2
proper_nonempty_K4_subcarriers=0
```

This does **not** establish Branch B: it is only a distance-equality/incidence shadow. It does not supply planar coordinates, convex independence, the MEC/cap geometry, global minimality among all Euclidean configurations, or no-M44 under every repackaging. It does rigorously show that counting with E6.4, E7, E8 and E9 alone cannot be the missing proof mechanism.

I also tested the full displayed equality shadow as a planar nonlinear least-squares system under a fixed Euclidean gauge. No nondegenerate embedding was found; the residual remained bounded away from zero. That is only computational evidence against that particular metric skeleton, not an exact infeasibility certificate and therefore not Branch A.

## Off-spine normal forms

The existing retained-matching bank decomposes directed omission into more structured endpoints, including cross-hit, source-return and three-cycle configurations. The decomposition is useful, but its terminal consumers require an additional boundary order, cross-membership, or second-row incidence not derivable from (P) as currently stated. The project’s own audit classifies this bank as a refinement rather than closure. ([GitHub][3])

In particular:

* a blocker cycle is not intrinsically contradictory;
* a blocker coinciding with another source is not intrinsically contradictory;
* two distinct blockers in one strict cap do not by themselves determine either of the Kalmanson boundary orders;
* the no-tri-apex-circle condition becomes effective only after one produces a center and a single positive radius through all three apices.

## Exact remaining gap

The first genuinely missing statement is a **positive incidence producer**, not another upper bound. One sufficient form is the three-hit witness above. A weaker but still potentially closing form would force, for some same-rich-cap pair (p,q),

[
\neg K4(A\setminus{q},c(p))
]

while simultaneously forcing (c(p)\notin C_i^\circ); failure gives two hits, and two-hit localization would place the center inside the cap, yielding a contradiction.

Neither conclusion follows from the current direction of E4.5. E4.5 explicitly gives survival for its selected orientation.

Accordingly, the truthful deliverable is:

```lean
theorem false_of_retainedInteriorDirectedOmission_and_all_low_hits
    ...
    : False := by
  -- No source-valid proof term obtained.
  sorry
```

There is no valid source patch to return from this analysis.

[1]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/refs/heads/main/scratch/triapex-planar-bridge/findings.md "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/refs/heads/main/scratch/triapex-planar-bridge/findings.md"
[2]: https://github.com/mysticflounder/erdos-97-96-formalization "GitHub - mysticflounder/erdos-97-96-formalization · GitHub"
[3]: https://github.com/mysticflounder/erdos-97-96-formalization/raw/refs/heads/main/docs/off-spine-atail-module-disposition-2026-07-26.md "https://github.com/mysticflounder/erdos-97-96-formalization/raw/refs/heads/main/docs/off-spine-atail-module-disposition-2026-07-26.md"
