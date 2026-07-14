# `(5,5,5)` common-system round-18 wrap-order candidate

## Scope and status

This is a **CONJECTURED exact algebraic reduction**, not a Lean theorem and
not a proof of the live ATAIL producer. It records the bounded successor to
the kernel-closed round-17 circle-chain residual so the cyclic-order change is
not rediscovered from scratch.

The theorem-bank registries required by `AGENTS.md` and the indexed
`nthdegree docs search --lean` corpus yielded no exact existing consumer for
this wrap-order pattern.

## Pinned residual

- profile: `CARD-EQ-12` `(5,5,5)`;
- round: 18;
- assignment digest:
  `5dac7824ce5ab4dd7c6f18e2fb3c88306d64dc2cefe1bce2d3d696b8ad4e49f8`;
- rows:
  `0:{1,2,3,4}`, `1:{0,2,6,7}`, `2:{3,8,9,10}`,
  `3:{1,4,5,6}`, `4:{1,2,9,11}`;
- saved cyclic order:
  `(0,9,10,11,1,3,4,5,2,6,7,8)`.

Use

```text
(O,Y,A,D,E,C) = (0,9,1,3,4,2).
```

The five rows imply the same circle-chain equality closure as round 17:

```text
OA = OC = AC = OD = OE
DA = DE
EA = EC = EY
CD = CY.
```

The production `SixPointCircleChainOrderCore` does not apply: its order is
`O,A,D,E,C,Y`, while round 18 places `Y` on the arc from `O` to `A`. In
particular its decisive `C,Y,O` orientation has the opposite sign here.

## Candidate normalized contradiction

Normalize `O=(0,0)` and `A=(1,0)`. The same first four orientation choices as
in the round-17 analysis are expected to force

```text
h^2 = 3/4,
t^2 = 1/2,
h > 0,
t > 0,
1/2 < t < h,
```

for the fixed `C,E,D` branch. Writing the second coordinate of `Y` as `g`,
elimination of the two remaining circle equations gives the candidate exact
identity

```text
4(h - 1) g^2
  + (4 h t + 4 h - 2 t - 4) g
  + (6 h t - 3 h - 3 t + 1) = 0.
```

Under the displayed algebraic relations, the quadratic coefficient and
constant term are negative and the linear coefficient is positive. Hence the
left side is strictly negative for `g <= 0`. But cyclic order `O,Y,A` gives
`signedArea2 O Y A > 0`, which is exactly `g < 0` in this normalization.

## Required next gate

Before promotion, independently verify the eliminated polynomial and its
three coefficient signs, then kernel-check a generic metric theorem, positive
and reflected `EdgeClosure` consumers, and the actual
`FaithfulCarrierPattern`/`BoundaryIndexing` adapter. Until those gates pass,
round 18 remains an uncovered `CROSSCHECKED_NONUNIT` equality shadow with real
feasibility undecided.
