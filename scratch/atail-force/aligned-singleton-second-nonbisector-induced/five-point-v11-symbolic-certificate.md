# V11 five-point symbolic certificate

## Result

The v11 quotient core on ordered classes `[0,2,7,8,10]` has a
four-orientation, three-row Euclidean contradiction.  Writing the five points
as `A,B,C,D,E` in that order, the metric hypotheses are

```text
DA = DC
DC = DE
EA = EB
```

and one minimum orientation set is

```text
signedArea2 A B C < 0
signedArea2 A B D < 0
signedArea2 C D E < 0
signedArea2 E A C < 0.
```

The sign shown is the project's descending-sign convention.  Reversing all
four signs gives the equivalent SMT convention.

Exhaustive Z3 checks found no UNSAT orientation subset of cardinality 0, 1, 2,
or 3.  At cardinality 4 there are twelve UNSAT subsets; the one above is
`orient_0_1_2`, `orient_0_1_3`, `orient_2_3_4`, `orient_4_0_2`.
The search script is `minimize_v11_five_point_orientations.py`.

## Coordinate-free polynomial certificate

Take `u = B - A` and, for vectors based at `A`, use coordinates relative to
`u`:

```text
U = u · u
X = u · (C-A)        Y = cross(u,C-A)
R = u · (D-A)        V = cross(u,D-A)
Z = u · (E-A)        W = cross(u,E-A)
O = signedArea2 C D E
```

The metric equalities give

```text
2 Z = U
2 R X + 2 V Y = X^2 + Y^2                         (C)
4 R U + 8 V W = U^2 + 4 W^2                       (E)
```

and the dot/cross identity for `O` gives

```text
2 U O = 2 R W - 2 R Y - V U + 2 V X + U Y - 2 W X.  (O)
```

Define

```text
T = 2 W X - U Y
S = U X + 2 W Y
Q = 4 (W-Y)^2 + (2 X-U)^2.
```

The two certificate identities are

```text
4 T V = 4 W^2 X - 2 U X^2 + U^2 X - 2 U Y^2       (1)
8 U T O = -S Q.                                     (2)
```

They have short ideal-membership witnesses.  With each named equality
understood as `lhs-rhs = 0`,

```text
(1) = X*(E) - 2 U*(C)

(2) = 4 T*(O)
      - 2 Y (W-Y)*(E)
      + 8 W (W-Y)*(C)
      - (U-2X)*(1).
```

This is directly accepted by Lean's `linear_combination`.

## Sign finish

The four orientation inequalities give

```text
Y < 0,  V < 0,  T < 0,  O < 0,
```

where `T = 2 U * signedArea2 E A C`, and `U > 0`.

`Q > 0`: if both squares in `Q` vanished, then `W=Y` and `2X=U`,
which would force `T=0`.

Identity (2), with `U>0`, `T<0`, `O<0`, and `Q>0`, forces `S<0`.
Also `T<0` and `U Y<0` force `W X<0`.  If `X>0`, then `W<0`;
since `Y<0`, both terms `U X` and `2 W Y` in `S` would be positive.
Therefore `X<0`.

Every term on the right of (1) is then nonpositive and the `U^2 X`
and `-2 U Y^2` terms are strictly negative, so the right side is negative.
But `T<0` and `V<0` make the left side positive, contradiction.

## Lean validation

`FivePointV11AlgebraicCertificate.lean` contains:

- the abstract algebraic certificate;
- the complete point-level theorem with exactly the four orientations and
  three distance equalities above; and
- no `sorry`.

It typechecks under the repository's Lean 4.27 toolchain:

```text
lake env lean \
  ../scratch/atail-force/aligned-singleton-second-nonbisector-induced/\
FivePointV11AlgebraicCertificate.lean
```

The command exits 0.
