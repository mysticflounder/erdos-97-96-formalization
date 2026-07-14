# Rank-1 residue-930 producer audit

Date: 2026-07-14

Status: **PROVEN NEGATIVE NORMAL FORM; LIVE PRODUCER OPEN.**

This audit is scratch-only. It does not edit the K-A-PAIR source or claim that
the live two-large-cap hypotheses are satisfiable.

## Result

The rank-1 packet is not obtained by first proving a cross membership and then
letting two-circle geometry supply the open-arc placement. Geometry supplies
the opposite sign.

For the actual `SurvivorPairRelocationPacket P` and actual common-system row at
source `P.q`, the Lean theorem

```text
signedArea_product_neg_of_cross_membership
```

proves that

```text
P.w in H.selectedAt(P.q).support
centerAt(P.q) != oppApex1
```

imply

```text
signedArea(P.w, oppApex1, centerAt(P.q))
  * signedArea(P.q, oppApex1, centerAt(P.q)) < 0.
```

The reciprocal source orientation has the same strict-negative conclusion.
This follows from the exact two-circle midpoint/reflection kernel and strict
noncollinearity from `D.convex`; it is not a finite-census inference.

Thus the requested positive product, equivalently placing the two common
points on one open boundary arc between the two centers, is already the
contradiction. It is not an automatic field attached to a cross hit.

## Exact branch normal form

At the blocker selected for source `P.q`, Lean proves

```text
K4(A.erase P.w, centerAt(P.q))
  OR
P.w in H.selectedAt(P.q).support.
```

The second arm is exactly
`source_mem_critical_support_of_no_qfree`, applied to failure of the first
arm. In the unique card-five first-apex branch, single deletion leaves the
other four class members, so `centerAt(P.q) != oppApex1` is automatic. The
combined checked normal form is therefore

```text
K4(A.erase P.w, centerAt(P.q))
  OR
(P.w in H.selectedAt(P.q).support AND signed-area product < 0).
```

This is the weakest honest split currently available at rank 1.

The first missing antecedent is consequently

```text
NOT K4(A.erase P.w, centerAt(P.q)),
```

or a separately consumed alternate for its survival. That antecedent produces
the cross hit exactly. A second, independent cap/order theorem must then force
the positive sign against the reflection-forced negative sign.

## Why the current live packets do not fill the gap

- `hlocalNoQFree` is localized to the named original deletion `q` and center
  `p`; it does not concern the existential frontier points `P.q,P.w` at
  `H.centerAt P.q`.
- `hfixed` and `U1LargeCapRouteBTailLiveData` constrain the named
  `p,q,t1,t2,t3,u` rows. No current field identifies either frontier source or
  its blocker with one of those named rows.
- `hNoM44` and the card profile determine cap counts, but expose no
  cross-source deletion failure or selected-row membership.
- The public ordered-cap theorem `outsidePair_unique_capCenter` consumes a
  second bisector center only after that center is known to lie in the same
  indexed cap as the apex. No live theorem localizes `H.centerAt P.q` there.
  In fact the already checked scratch theorem
  `criticalSource_extraBisector_not_mem_commonCap` shows that a genuinely new
  bisector center for two points outside that cap must lie outside it.
- The imported adjacent-cap one-hit theorems constrain apex-centered selected
  classes. They do not constrain an arbitrary off-cap blocker row enough to
  determine which open arc contains `P.q,P.w`.

Therefore no existing cap theorem found in the current import graph forces the
positive sign on the live cross-hit branch. The viable next statement is a
branch theorem that either refutes cross-deletion survival using additional
live provenance, or consumes that survival through another already banked
alternate.

## Search preflight

Before deriving the scratch lemmas, the required P97 registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- all three concise certificate censuses and their exhaustive JSON
  inventories; and
- the indexed Lean corpora via `nthdegree docs search --lean` for critical-row
  cross membership, open-arc placement, and card-five deletion survival.

The closest reusable declarations were
`selectedFourClass_support_eq_shell`,
`source_mem_selectedFourClass`,
`source_mem_critical_support_of_no_qfree`, and
`sameRadius_double_erase_survives_or_unique_class_card_four_or_five`.
No bank declaration produces the missing cross-deletion failure or positive
orientation from the current parent binders.

## Validation and rigor

`cross_membership_orientation.lean` was checked directly from the Lake root:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/rank1-producer/cross_membership_orientation.lean
```

The check exited successfully. Every printed theorem uses exactly
`propext`, `Classical.choice`, and `Quot.sound`; there is no `sorryAx`.

- **PROVEN:** the cross-deletion disjunction, automatic card-five center
  separation, strict-negative orientation under either directed cross hit,
  and the combined card-five normal form.
- **PROVEN:** cross-deletion failure is sufficient for the missing membership.
- **NOT PROVEN:** cross-deletion failure from the live K-A-PAIR binders.
- **NOT FOUND / OPEN:** a live cap/order theorem forcing the positive sign for
  an arbitrary off-cap actual blocker.
- **NOT CLAIMED:** a countermodel to the full K-A-PAIR hypotheses. The theorem
  under attack is a contradiction theorem, so weaker abstraction models do
  not falsify its full antecedent.
