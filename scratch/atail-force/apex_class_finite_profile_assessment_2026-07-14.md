# Opposite-apex finite-profile assessment

## Checked classification

Assume the first opposite apex has an exact five-point radius class.  The
checked complement theorem says every radius class at the second opposite
apex satisfies

```text
second-class card + 2 <= |A \ surplusCap|.
```

Combining this with global K4 at the second apex gives the following complete
cardinality table.  It is checked in
`apex_class_finite_profile_classifier.lean`.

| `A.card` | `surplusCap.card` | complement | selected second-apex class |
|---:|---:|---:|---:|
| 11 | 5 | 6 | exactly 4 |
| 11 | 6 | 5 | impossible |
| 12 | 5 | 7 | exactly 4 or exactly 5 |
| 12 | 6 | 6 | exactly 4 |

All four Lean results have axiom closure exactly `propext`,
`Classical.choice`, and `Quot.sound`.

## Existing-sink audit

### Card 11, surplus 6

This branch is genuinely closed by the new threshold.  In the live no-M44
lane it was already excluded at the cap-profile level: the cap-sum identity
and the proven lower bound four on both opposite caps force `(6,4,4)`, hence
an `IsM44` packet, contrary to `hNoM44`.  The complement argument is a shorter
independent contradiction, not a new surviving producer.

### Card 11, surplus 5

With `hNoM44`, the cap profile is `(5,5,4)` up to the two opposite-cap
orientations.  The new result adds an exact four-class at `oppApex2`.  This is
compatible with the Census554 geometry interface: `ofGlobalK4` already
chooses a four-class at every labeled center.  No Census554 or theorem-bank
consumer turns the single exact apex class into a contradiction without the
missing multi-row incidence data.  Consequently this case hands off to the
existing card-11 census lane rather than closing locally.

### Card 12, surplus 6

The cap sum is fifteen.  Under `hNoM44`, at least one opposite cap has card at
least five, so the cap profile is `(6,5,4)` up to orientation.  The selected
second-apex class is exactly four, but no imported theorem-bank declaration
consumes `(6,5,4)` plus one exact opposite-apex class.  The available
four-point-cap endpoint theorems require containment of a Moser-centered
selected class in the card-four cap; the complement threshold supplies
neither containment nor identification of `oppApex2` with the opposite vertex
of that card-four cap.

### Card 12, surplus 5

The cap profile is `(5,5,5)` or `(5,6,4)` up to orientation, and the selected
second-apex class may have card four or five.  The card-five equality case is
not excluded by cap counting: `pure_cap_count_shadow` in
`apex_class_complement_threshold.lean` realizes the `(5,5,5)` closed-cap
ledger with two five-classes, one surplus hit each, and only one common
off-surplus point.  This is an exact finite-incidence countermodel, not a
Euclidean realization.

## First missing producer

The equality profiles do not yet feed a metric sink.  The first new field must
be one of:

1. containment of the exact second-apex four-class in a named card-four cap,
   enabling the banked endpoint-radius theorem;
2. a second common off-surplus member of the two apex classes, which closes by
   the existing reflection theorem; or
3. cross-incidence from the exact apex class into a critical/global selected
   row, enabling a three-bisector or U5 incidence kernel.

`hNoM44`, cap cover, global K4, and the current complement threshold do not
produce any of these fields by themselves.
