# Exact-fifteen apex-profile adapter audit (R3)

## Verdict

`lean/Erdos9796Proof/P97/ATail/ExactFifteenApexProfile.lean` is a
source-clean producer (no `sorry`/`axiom`; direct `lake env lean` from `lean/`
completed successfully).  It is not imported by `ATail/FrontierLiveClosure.lean`.
It is reusable only as a conditional exact-`|A| = 15` apex-profile producer;
it does not close the live fresh-third or first-fiber obligations.

## Exact hypotheses and available outputs

* `capByIndex_card_eq_six_of_card_eq_fifteen` and
  `exactCapProfile_of_card_eq_fifteen` require `A.card = 15` and
  `forall i : Fin 3, 6 <= (S.capByIndex i).card`; they return all cap cards
  equal to 6 and all strict interiors equal to 4.
* `selectedFourClass_support_subset_richSixClass_of_cap_card_eq_six` requires
  `ConvexIndep A`, an index `i`, a `SelectedFourClass A
  (S.oppositeVertexByIndex i)`, positive rich radius, rich-class card at least
  6, and cap card exactly 6.  It gives support inclusion in that six-class.
* `selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six`
  (and its card producer) requires the same apex/index setting, two positive
  distinct rich radii, each class card at least 4, and cap card exactly 6;
  it gives equality of the selected support with one of the two four-classes.
  The global corollary additionally needs `HasNEquidistantProperty 4 A` and an
  apex membership witness.

## Mismatch with `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`

The live theorem (lines 9738--9747 of `FrontierLiveClosure.lean`) has a
`TwoCapSourceThirdCanonicalRowSurface` whose only cap-size field is
`8 <= |S.capByIndex S.oppIndex1|`; its two sources are arbitrary
`CriticalShellSystem.CarrierVertex`s, with exact four-point critical rows at
their *chosen blocker centers*.  The surrounding residual supplies the
frontier four-card hypotheses, exact two-point cap intersections, tri-apex
rich structures, deletion cycles, and disjointness, but no `D.A.card = 15`.
The all-large residual gives cap lower bounds (hence `|D.A| >= 15`), not
equality.  Therefore the exact-cap profile cannot be instantiated universally.

Even after adding a conditional `D.A.card = 15`, the profile is about a
`SelectedFourClass` centered at a Moser apex
`S.oppositeVertexByIndex i`.  A fresh-third source row is a
`CriticalFourShell` centered at `H.centerAt source`, with no hypothesis that
this blocker center is a Moser apex or that its row is the apex-selected
class.  No theorem in the module transfers an apex six/four-shell profile to
these arbitrary blocker rows.  Thus the normalized residual's first missing
bridge is a center/row transfer (or an independent metric contradiction), not
cap arithmetic.

## Mismatch with first-fiber leaves

`FirstFiberCapSourceWitness` likewise records a cap-eight margin, source in the
strict interior, and an exact four-point critical shell at
`H.centerAt source`; it does not identify that center with an apex.  In
`false_of_twoCapSources_firstFiber` (lines 12149--12160), the extra
`hsourceRadius`/`hsourceRadius'` only put two source points in one apex radius
class; they do not provide a four-point apex class, `D.A.card = 15`, or an
exact cap card.  The aligned singleton and one-sided-deletion leaves have the
same issue.  Exact-fifteen can constrain a separately constructed apex
`SelectedFourClass`, but there is no checked link from that support to either
first-fiber source row or its fresh blocker fiber.

## Recommendation

Keep this module out of the universal Frontier import/closure path.  If an
exact-15 finite slice is explicitly in scope, add a separate adapter carrying
`hcard15`, derive `exactCapProfile_of_card_eq_fifteen`, and apply the apex
support profile only to a genuinely apex-centered `SelectedFourClass` (for
example one built from a known apex radius class).  Treat the result as a
conditional producer for an encoder.  Do not use it as a proof of the
normalized residual or first-fiber leaves until a new theorem supplies the
missing apex-to-blocker-row transfer (and, for the first-fiber common-radius
arm, a four-point class-card antecedent).
