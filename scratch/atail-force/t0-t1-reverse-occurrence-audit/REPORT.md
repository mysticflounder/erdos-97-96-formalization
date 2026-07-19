# T0/T1 reverse-pair occurrence audit

Date: 2026-07-17

Status: **REFUTED IN THE STRONG FINITE ROLE/RADIUS ABSTRACTION.  ALL SIX
`rho`/FRONTIER-ROLE CELLS ARE SAT WHILE EVERY REVERSE OUTSIDE PAIR AVOIDS
BEING CONTAINED IN T0 OR T1; IN FACT EVERY PAIR HAS UNEQUAL FIRST-APEX
DISTANCES.  THE FIRST OMITTED LIVE FORCE IS THE MAP-INDEPENDENT STRICT
KALMANSON/EUCLIDEAN COUPLING OF THE NAMED ROWS, NOT MORE CSS OR MINIMALITY
MARGINALS.  NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/t0-t1-reverse-occurrence-audit/`.  It did not edit
production, plans, proof-blueprint state, git, protected lanes, or
`SurplusM44`, and it did not run Lean/Lake.

## Required preflight

The audit first searched every registry required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered reverse outside-pair
return, retained/double-deletion first-apex rows, exact all-reverse rows, and
common-pair terminals.  No bank supplies the occurrence.

## Correction to the old fixture

`first-apex-return-kalmanson/verify_distinct_radius_branch.py` is not a
faithful regression for this question.  Its reverse row at center `15` is
`{12,13,8,5}`, while its physical-apex exact-five class is
`{11,12,13,5,8}`.  Two distinct centers therefore share four co-radial
points, violating the imported two-circle intersection bound.  This audit
does not use that stale assignment.

The corrected search restricts every reverse outside pair to

```text
{1,3,6,7,9,10},
```

which is outside the physical cap and disjoint from the two non-cycle points
of the physical exact-five class.  Hence each reverse shell meets that class
exactly in its adjacent cycle-source pair.

## Exact finite/full-role encoding

`check_full_role_occurrence.py` uses exact rational Z3 arithmetic.  It fixes
the correct apex map

```text
first_apex  = S.oppApex1 = 0
second_apex = S.oppApex2 = 1
surplus vertex             = 2
```

and the common boundary order

```text
0,5,6,7,1,3,8,9,10,2,11,14,12,4,15,13.
```

The three cap chains and physical-cap order are therefore exact, and the
reverse blockers `14,15,4` strictly straddle source pairs
`{11,12}`, `{12,13}`, `{13,11}`.

For each of the six cells

```text
rho = r, rho != r
  x
q/w roles II, IO, OI,
```

the encoding retains:

- T0 and T1 as `SelectedFourClass` rows centered at the first apex;
- T0 contains `q,w`, T1 avoids them, and both have two strict-`oppCap1`
  hits;
- the exact same-radius six-class or unequal-radius disjoint-support split;
- all-reverse membership, forward omission, exact `2+2` reverse supports,
  pair injectivity, and straddling;
- the exact physical-apex five-class;
- a total fixed-point-free CSS blocker map omitting both robust apices;
- an exact four-class at every blocker containing every source in its fiber;
- a selected K4 row at every carrier center;
- source-by-source deletion failure: after deleting `s`, no four remaining
  points are equidistant from `blocker(s)`;
- cap-local row intersection bounds and at-most-two intersections for
  distinct displayed circles; and
- the negation of the requested occurrence and of the weaker co-radial
  return at `S.oppApex1`.

Thus global K4, the total CSS, and the finite distance-class consequence of
minimality are present; this is not another cap-six or shell-packing marginal.

## Result

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/t0-t1-reverse-occurrence-audit/\
check_full_role_occurrence.py
```

All six cells are SAT.  Representative selected outside pairs are:

| arm | role | reverse outside pairs |
| --- | --- | --- |
| `rho = r` | `II` | `{7,9}`, `{1,6}`, `{1,10}` |
| `rho = r` | `IO` | `{7,9}`, `{6,9}`, `{3,6}` |
| `rho = r` | `OI` | `{1,9}`, `{1,7}`, `{1,6}` |
| `rho != r` | `II` | `{1,6}`, `{6,7}`, `{1,10}` |
| `rho != r` | `IO` | `{1,7}`, `{3,9}`, `{1,9}` |
| `rho != r` | `OI` | `{1,9}`, `{3,9}`, `{1,3}` |

In every cell each pair has two different first-apex distance values.  Hence
it is not contained in T0, not contained in T1, and not merely co-radial in a
larger unnamed first-apex class.

This is an exact SAT result in the stated abstraction, not sampling and not
`UNKNOWN`.

## Strongest honest verdict and first omitted field

The occurrence

```text
exists i,
  reverseOutsidePair(i) <= T0.support or
  reverseOutsidePair(i) <= T1.support
```

is **not a consequence of the finite row roles, total CSS, global K4, or
minimality/deletion data**.  It should not be the next producer theorem on
that hypothesis surface.

The SAT layer deliberately does not impose all strict Kalmanson crossing
inequalities on its abstract distance table.  Adding those inequalities to
one *fixed auxiliary blocker map* makes even the unnegated base cell UNSAT.
That does not prove the occurrence: the source does not fix that auxiliary
map, so this is one incompatible map assignment rather than map-independent
coverage.  It does show where the first new force lives.

The first omitted live field is therefore:

> a common strict-convex/Kalmanson distance coupling for T0, T1, and the
> three complete reverse rows, with the non-cycle CSS rows quantified rather
> than pinned to the stale fixture.

Full planar Euclidean realizability, MEC containment, and `noM44` are also
omitted.  Existing audits show that same-packet `noM44` and bare MEC/cap
marginals are not independently load-bearing, so they should not replace the
common-order metric coupling as the next test.

## Next theorem shape

Do not target the refuted occurrence as a pure incidence theorem.  The next
honest branch theorem should consume the named rows and convex-order metric
force directly, provisionally:

```lean
theorem false_of_periodThree_allReverse_firstApexRows
    (P : FirstApexShellRolePacket F0 R)
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hperiod : K.period = 3)
    (hreverse : AllReverseMembership K H)
    (hsharedOrder : SourceFaithfulSharedBoundaryOrder P K) : False
```

Its discovery gate is a symbolic blocker-map Kalmanson solve.  Either:

1. all blocker-map/order cells are UNSAT and yield small rational Farkas
   certificates, giving a direct `linarith`-style consumer; or
2. one cell is SAT, which identifies the next genuinely Euclidean/MEC field.

Until that quantified solve is done, the strongest overall status is:

- finite/full-role occurrence: **REFUTED BY SAT**;
- one pinned Kalmanson blocker map: **UNSAT, NOT COVERAGE**;
- source theorem/direct `False`: **UNRESOLVED**.

## Epistemic ledger

- **EXACT SAT:** six finite role/radius cells with target negation.
- **EXACT UNSAT:** one pinned-map Kalmanson diagnostic, already UNSAT before
  target negation.
- **NOT CLAIMED:** quantified blocker-map Kalmanson coverage, planar Euclidean
  realization, MEC realization, or `noM44` use.
- **PRODUCTION `sorry` CLOSED:** none.
