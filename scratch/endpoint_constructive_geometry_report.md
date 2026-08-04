# Constructive exact-rational endpoint geometry audit

**Verdict: all four endpoint residual orders are locally realizable by strictly convex exact-rational configurations.**

Scope: this refutes a local Euclidean-impossibility route using only the named shell
equalities, the two source nonincidences, branch identity, and residual cyclic order.
It is not a global Problem 97 configuration and does not realize anonymous deleted-row supports.

The generator normalizes `O=(0,0)` and puts `C,M,J` on the rational unit circle.
This verifier reparses only the final coordinates and recomputes every claim exactly.
For each directed hull edge, every other representative has positive cross product;
this simultaneously checks the displayed CCW order and strict convexity.

## `X=C/OCAKJ`

Full representative hull: `O < C < A < K < B < M < J` (CCW).

Residual projection: `O < C < A < K < J`.

Coordinates:

- `O = (0, 0)`
- `A = (-564365/424021, 1915438/1272063)`
- `B = (-4557/965, 294/965)`
- `C = (-95/193, 168/193)`
- `J = (5/13, -12/13)`
- `K = (-1010515/424021, 640596/424021)`
- `M = (-3/5, -4/5)`
- `X = (-95/193, 168/193)`

Squared-distance checks:

- `OC2=OM2=OJ2 = 1`
- `AC2=AK2 = 25000/22581`
- `AM2 = 8587784/1467765`
- `BC2=BM2 = 17576/965`
- `BK2 = 86888/12545`
- `XJ2=XK2 = 10000/2509`

Consecutive hull cross products (all strictly positive):

- `530950/1272063`, `5000/7527`, `9640/7527`, `246448/32617`, `112/193`, `56/65`, `300/2509`

## `X=C/OJKAC`

Full representative hull: `O < M < J < B < K < A < C` (CCW).

Residual projection: `O < J < K < A < C`.

Coordinates:

- `O = (0, 0)`
- `A = (7285/1599, 17185/1599)`
- `B = (14637/9685, -5712/9685)`
- `C = (5/13, 12/13)`
- `J = (-9/41, -40/41)`
- `K = (1217/533, 170/533)`
- `M = (-51/149, -140/149)`
- `X = (5/13, 12/13)`

Squared-distance checks:

- `OC2=OM2=OJ2 = 1`
- `AC2=AK2 = 546457/4797`
- `AM2 = 114773213/714753`
- `BC2=BM2 = 172304/48425`
- `BK2 = 2822804/1985425`
- `XJ2=XK2 = 2116/533`

Consecutive hull cross products (all strictly positive):

- `780/6109`, `8712/79417`, `506276/397085`, `2376728/397085`, `33856/1599`, `115/1599`, `88/1937`

## `A=J/OCXKA`

Full representative hull: `O < M < B < C < X < K < A` (CCW).

Residual projection: `O < C < X < K < A`.

Coordinates:

- `O = (0, 0)`
- `A = (-117/125, -44/125)`
- `B = (-2183/4875, 4181/4875)`
- `C = (-117/125, 44/125)`
- `J = (-117/125, -44/125)`
- `K = (-5037/3125, -1716/3125)`
- `M = (16/65, 63/65)`
- `X = (-21137/15625, -2816/15625)`

Squared-distance checks:

- `OC2=OM2=OJ2 = 1`
- `AC2=AK2 = 7744/15625`
- `AM2 = 25538/8125`
- `BC2=BM2 = 289/585`
- `BK2 = 152373197/45703125`
- `XJ2=XK2 = 79376/390625`

Consecutive hull cross products (all strictly positive):

- `629/975`, `289/975`, `5984/121875`, `30976/1953125`, `15488/78125`, `20856/390625`, `6667/8125`

## `A=J/OAKXC`

Full representative hull: `O < A < M < K < B < X < C` (CCW).

Residual projection: `O < A < K < X < C`.

Coordinates:

- `O = (0, 0)`
- `A = (-9/41, 40/41)`
- `B = (-1469/534, -113/178)`
- `C = (0, -1)`
- `J = (-9/41, 40/41)`
- `K = (-2106/1025, 217/1025)`
- `M = (-39/89, 80/89)`
- `X = (-153/410, -509/410)`

Squared-distance checks:

- `OC2=OM2=OJ2 = 1`
- `AC2=AK2 = 162/41`
- `AM2 = 196/3649`
- `BC2=BM2 = 12337/1602`
- `BK2 = 394573/328410`
- `XJ2=XK2 = 405/82`

Consecutive hull cross products (all strictly positive):

- `840/3649`, `2394/91225`, `243542/273675`, `88863/36490`, `29211/36490`, `153/410`, `9/41`
