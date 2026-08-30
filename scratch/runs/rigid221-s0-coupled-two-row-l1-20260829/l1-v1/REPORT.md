# Rigid221 S0 computation run `l1-v1`

**Status:** positive control complete; full L1 and S0 remain encoding-blocked
**Epistemic status:** EMPIRICALLY VERIFIED external exact computation
**Base and executed Git HEAD:** `55687ab3e1d47a0f8a5a3646031faf912e28ac80`

## Accepted result

The corrected harness found an exact rational realization of the fixed,
pairwise-distinct twelve-role positive-control cell:

```text
SAT_12_ROLE_POSITIVE_CONTROL_EXACT
```

This is not an L1 or S0 verdict. The modeled carrier is closed at the twelve
named roles, all roles are assumed distinct, off-row supports are therefore
disjoint, center-role identification cells are excluded, and one cyclic
order/nine-point seed is fixed.

The selected new points are

```text
cv = (79/100, -79/1640)
av = (237/2050, -2599/4100)
bv = (13557/26650, 2131/2665)
```

The bounded rational grid contained 4,059 candidates and 1,904 exact survivors.
The selection rule minimized the maximum coordinate denominator and then exact
bit complexity.

## Verification

- Exact `Fraction` replay checked all 120 edge/nonincident orientations; the
  global minimum is `2/5525 > 0`.
- Within the modeled carrier, the exact fibers are
  `C={u,xu,delta,v,xv}`, `Ku={u,xu,au,bu}`, and
  `Kv={v,xv,av,bv}`.
- The squared row radii are `17/25` and
  `53649709/67240000`.
- At the designated centers, the largest positive multiplicity after deleting
  `u` or `v` is three.
- Strict serialized-JSON replay passed without writing.
- Z3 returned `sat` with exact rational readback; cvc5 1.3.3 independently
  returned `sat`, and all 24 coordinate values matched.
- A repeated run reproduced identical JSON and SMT2 SHA-256 digests.
- Twenty focused pytest tests, Ruff lint, and Ruff format checks passed.

Primary runtime was 1.958 s real / 1.937 s user / 0.017 s system. The cvc5
recheck took 0.074 s real.

## Authenticated artifacts

```text
artifacts/accepted-primary/positive_control_result.json
  8f007b55fb95aa636fbf62e17e40dee7a6b8771e94bba8af5a62076ca55cf854
artifacts/accepted-primary/positive_control_query.smt2
  b4a282978c443091cdf22d7476a497a26f2a7faa347094c8aa0de653d388c9e9
artifacts/accepted-secondary/cvc5-output.txt
  22382bfc5cef4c06046a060e3d96a61320ec310d3bbe3603996bb536330030aa
```

The script records the runtime Git HEAD and its own byte digest separately and
makes no authentication claim for uncommitted source.

## Scope audit and next computation

The first audit rejected the initial `L1-row-core` label because source
`D.A` may contain more than twelve points and the source permits incidence
cells excluded by pairwise distinctness. The repaired result is therefore only
a positive control.

The next full-L1 step must derive each cap from the repository's exact
`OnArcOpposite` signed-area predicate over a closed carrier, erase the two
endpoints for `capInteriorByIndex`, rotate `oppIndex2` with `surplusIdx`,
and validate an actual non-obtuse minimum-enclosing-circle Moser certificate.
It must also enumerate legal support overlaps and center-role identifications.
Until those checks exist, both `L1-S0-I` and `L1-S0-N` remain
`ENCODING_BLOCKED`.

The focused Lean module build passed. Existing `sorry` declarations remain,
so nothing from this run is promoted to Lean.
