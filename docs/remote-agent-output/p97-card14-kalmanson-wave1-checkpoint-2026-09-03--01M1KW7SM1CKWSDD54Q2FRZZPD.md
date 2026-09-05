# P97 card-14 Kalmanson screen — wave 1 checkpoint

**Date:** 2026-09-03  
**Scope:** exact screen of the authenticated maximal `firstOppositeO1Six` card-14 model; generic scanners prepared for the other five models.  
**Status:** one model refuted; five profile models awaiting their raw support/equality packets or CEGAR rerun output.

## Exact result

The maximal authenticated model has cyclic order

```text
[1,3,4,5,0,6,7,8,9,2,10,11,12,13].
```

Its 91 pair distances quotient to 38 equality components, so the retained equalities have rank 53. Exhaustive generation produces 2,002 strict Kalmanson inequalities. After equality cancellation:

- 597 reduce to one-component comparisons `X > Y`;
- 170 pairs have opposite reduced coefficient vectors and are immediate exact contradictions;
- the homogeneous full-system LP has no positive strict margin.

A canonical six-role certificate uses only three authenticated selected rows:

```text
center 3  contains {4,6}
center 1  contains {6,9}
center 10 contains {4,9}
```

The roles occur in cyclic order

```text
1 < 3 < 4 < 6 < 9 < 10.
```

Strict Kalmanson on `(1,3,4,6)` gives

```text
d(1,4) + d(3,6) > d(1,6) + d(3,4).
```

Because the row at center `3` gives `d(3,6)=d(3,4)`,

```text
d(1,4) > d(1,6).
```

Strict Kalmanson on `(1,4,9,10)` gives

```text
d(1,9) + d(4,10) > d(1,4) + d(9,10).
```

Because the row at center `10` gives `d(4,10)=d(9,10)`,

```text
d(1,9) > d(1,4).
```

The row at center `1` gives `d(1,6)=d(1,9)`, hence

```text
d(1,4) > d(1,6) = d(1,9) > d(1,4),
```

a contradiction.

This is the literal six-role/two-K2/three-selected-row triangle motif. It avoids the distinguished-X versus chosen-selected-row distinction in the earlier certificate.

## Occurrence census in the maximal model

The dedicated support-level occurrence scanner checks every cyclic cut and both orientations. It finds:

- 20 unique oriented occurrences;
- 13 direct-order occurrences;
- 7 reflected-order occurrences.

Thus the maximal assignment is not marginal: it violates the small source-clean motif in many places.

## Programs

`card14_triangle_occurrence_scan.py`
: Checks the exact six-role selected-row motif from cyclic order plus one four-support at every center. It requires no full equality assignment.

`card14_kalmanson_scan.py`
: Accepts the complete equality-component partition, generates all two Kalmanson families, detects immediate `0>0`, opposite-vector pairs, shortest strict comparison cycles, and optionally runs the full normalized LP relaxation.

## Next execution

For each of the other five authenticated card-14 profile assignments:

1. run `card14_triangle_occurrence_scan.py` from its cyclic order and selected support map;
2. if no occurrence is found, derive the complete positive-distance equality partition and run `card14_kalmanson_scan.py`;
3. if the exact short-certificate layer is silent, retain the full rational Kalmanson LP survivor or minimize an infeasibility certificate;
4. distinguish elimination of the displayed model from CEGAR closure of the entire profile.

The raw packets were requested in `#erdos-97-96-formalization` message `#9394`; the universal no-good/CEGAR rerun was independently requested in `#9395`.

## File integrity

```text
372f9a5495ba82f6d55007b8735dc191cc8b27932301e3844bef10a1bea435dd  card14_kalmanson_scan.py
746538bcc26b1c4e5676e1bf41cd1dc26f27c0e5572bc94592e36e6833217260  card14_triangle_occurrence_scan.py
cbbf3171dda33b90650e8d8ee8b19d690370a9b1f5d54b8112df08b52bed56e4  maximal-profile.json
9117f0cd4ba6d0b8d7bd40dfcdb5d8d126767a1d9c98b624f302ee35d6ff1ead  maximal-profile-result.json
5bd727f2be0e0de52863a23b9fe94c444c163ef8213604950ef0699644f8c0d2  maximal-support-model.json
97f52db7c96043f136e76aa6dc943aa9f86d7969db7215b093dac6b8e9bebab4  maximal-support-result.json
```

The maximal equality packet is the machine-readable transcription from project message `#9378`; the support map and cyclic order are the authenticated model data from the same packet.
