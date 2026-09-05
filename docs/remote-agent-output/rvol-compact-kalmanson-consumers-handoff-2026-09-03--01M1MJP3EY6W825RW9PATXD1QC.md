# Luna handoff: compact Kalmanson consumers from the source-aware RVOL wave

**Date:** 2026-09-03  
**Scope:** pure ordered-point metric geometry; no source-ingress or ordinal claim

## Honesty boundary

Do not formalize a theorem saying that the reverse/Q/common-shell packet is
inconsistent. An independently checked all-distinct row-9 model satisfies:

- all six prescribed rows as exact four-point distance fibers;
- pair-codegree at most two and shared-pair alternation;
- deleting any support point destroys every four-point fiber at its row center;
- every triangle and strict K1/K2 inequality;
- simultaneous strict large-radius inequalities for the reverse, Q, and common
  rows.

Thus a valid theorem needs an additional alias/order relation. Two small exact
consumers were found.

## Target A: three-Kalmanson alias/large contradiction

Let six distinct boundary points occur in cyclic order

```text
u < J < O < C < A < v.
```

Assume

```text
d J O = d O C                 -- J,C lie in the Q row centered at O
d O A = d C A                 -- O,C lie in the common row centered at A
d J C ≤ d O C                 -- Q radius is at least physical chord JC
```

Then `False`.

Use the strict Kalmanson inequalities

```text
K2(u,J,O,C): d u O + d J C > d u C + d J O
K1(u,O,C,v): d u C + d O v > d u O + d C v
K2(O,C,A,v): d O A + d C v > d O v + d C A.
```

Their sum is

```text
d J C + d O A > d J O + d C A.
```

The two radius identities reduce this to `d J C > d O C`, contradicting the
large-radius hypothesis. The proof should be three applications of the current
strict Kalmanson theorem plus `linarith`.

Suggested theorem name:

```lean
false_of_threeKalmanson_qRow_commonAlias_qLarge
```

The source branch meaning is `L = O`: the common shell `{C,J,K,L}` contains the
Q-row center `O`. Do not assume source currently produces this alias.

## Target B: five-Kalmanson / three-row cycle

Let nine distinct boundary roles satisfy

```text
a < b < c < d < e < f < g < h < i.
```

Assume the three row-radius identities

```text
d f e = d f i
d g c = d g e
d h c = d h i.
```

Then `False`, using

```text
K2(a,b,g,h)
K1(a,g,h,i)
K2(b,c,g,h)
K2(d,e,f,g)
K1(d,f,g,i).
```

Adding the five strict inequalities leaves exactly

```text
(d h c - d h i) + (d g e - d g c) + (d f i - d f e) > 0,
```

which is zero by the row equalities.

Suggested theorem name:

```lean
false_of_fiveKalmanson_threeSelectedRowCycle
```

This is the human-scale core of the displayed source-aware `C18` metric
infeasibility certificate. It is a pure reusable consumer; no `C18` ordinal or
finite certificate import is needed.

## Existing infrastructure likely reusable

Use the project’s strict crossed-quadrilateral/Kalmanson theorem, such as the
current declaration corresponding to

```text
dist_add_dist_lt_diagonal_sum_of_ccw
```

and normalize with `dist_comm` before `linarith`. Keep the theorem in the
lowest acyclic metric/order module available.

## Acceptance

- no `sorry`, `admit`, `native_decide`, or external proof artifact;
- direct touched-module build and strongest governed aggregate build;
- `#print axioms` no stronger than project baseline;
- commit/push only owned files and report exact FQNs and commit;
- add the all-large row-9 model as a prose regression warning, not as a Lean
  trusted artifact.

## Computational receipts

The exact coefficient replays are in:

```text
artifacts/compact-certificates/
```

The all-large negative control is:

```text
artifacts/row09-all-named-large-complete-fiber-metric.json
artifacts/row09-large-verification/verification-summary.json
```
