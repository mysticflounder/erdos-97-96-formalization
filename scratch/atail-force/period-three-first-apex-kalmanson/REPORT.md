# Period-three first-apex Kalmanson quotient

Date: 2026-07-17

Status: **BOUNDED EXACT UNSAT, WITH THE ENCODING ARTIFACT IDENTIFIED.  ALL
10,368 FORWARD REPRESENTATIVE CELLS DIE FROM ONE UNSUPPORTED CROSS-SURFACE
IDENTITY: A T0/T1 TARGET PAIR WAS ALSO FIXED IN THE INDEPENDENT PHYSICAL
EXACT-FIVE ROW.  ONE KALMANSON INEQUALITY AND THE TWO ROW EQUALITIES CLOSE;
NO REVERSE ROW OR PERIOD-THREE FACT IS USED.  THIS IS NOT SOURCE COVERAGE OR
CONVERGENCE EVIDENCE, AND NO FARKAS CORE OR LEAN THEOREM SHOULD BE PROMOTED.**

This lane owns only
`scratch/atail-force/period-three-first-apex-kalmanson/`.  It did not edit
production, closure plans, proof-blueprint state, git, protected lanes, or
`SurplusM44`, and it did not run Lean/Lake.

## Required preflight

Before the decision run, the audit searched all registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted `nthdegree docs search --lean` queries covered the period-three
all-reverse rows, shared boundary order, first-apex T0/T1 rows, Kalmanson
closure, and blocker-map quotient.  No bank contains this aggregate consumer.

## Blocker-map quotient

For the proposed linear consumer, blocker values outside the three reverse
blockers do not affect a row equality:

- T0 and T1 are selected rows centered at `S.oppApex1`; they are not
  `H.selectedAt` rows.
- The physical exact-five class is centered at `S.oppApex2`; it is not a CSS
  row.
- On the period-three all-reverse packet, the only CSS rows in the metric
  formula are

  ```text
  H.selectedAt(source(successor i)), i = 0,1,2.
  ```

- Pair injectivity, exact `2+2` splitting, and straddling refer only to those
  three centers/supports.

Thus every other `H.centerAt source` is syntactically absent from the direct
row-equality/Kalmanson formula and can be existentially projected away.  This
is a formula-dependency reduction, not a claim that a theorem accepting the
whole `H` is forbidden from using global CSS/minimality later.

## Order generation

`decide_quotient.py` does not inherit one fixed boundary word as coverage.
It generates orders from three cap blocks:

```text
first apex, surplus-private block,
second apex, first-opposite-private block,
surplus vertex, physical-private block.
```

The physical block is filtered by all three exact straddles:

```text
14 between 11 and 12,
15 between 12 and 13,
4  between 13 and 11.
```

There are 12 physical-block words after the local reflection anchor
`11 < 12`, 6 surplus-private words, and 24 first-opposite-private words:

```text
12 * 6 * 24 = 1,728 generated forward representatives.
```

The reflection anchor is only a computational quotient.  No source transport
theorem is claimed, and the reflected source branch remains omitted from
coverage.

## Per-cell formula

For each generated order and each of the six current representatives

```text
rho = r or rho != r
  x
q/w roles II, IO, or OI,
```

the exact rational SMT formula contains:

- all strict triangle inequalities;
- both strict Kalmanson inequalities for every cyclic quadruple;
- T0/T1 equal-radius equations with selected-row, not exact-shell, status;
- the exact physical-apex five-class and `q/w` second-apex radius inequality;
- three solver-chosen exact reverse outside pairs from the legal outside
  role domain;
- reverse pair injectivity and pairwise shell intersection at most two;
- exact reverse-shell exclusion of every non-support point;
- negation of pair containment in T0 and T1; and
- the stronger negation that any reverse pair is co-radial from the first
  apex.

The solver uses homogeneous unit slack, so every model or infeasibility result
is over exact rational linear arithmetic.  It stops immediately on SAT or
`unknown`.

## Exact replay and result

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/period-three-first-apex-kalmanson/decide_quotient.py
```

Final output:

```text
{'completed_orders': 1728, 'status': 'six_representatives_unsat'}
DECISION: BOUNDED_UNSAT_NOT_SOURCE_COVERAGE
```

The run performed

```text
1,728 orders * 6 cells = 10,368 exact checks.
```

It found zero SAT cells and zero `unknown` cells.  `RESULT.json` records the
machine-readable status.

The root session independently replayed the displayed command after the lane
finished and obtained the same terminal result at 1,728 completed orders.

## Uniform core diagnosis

The follow-up common-schema census checks every displayed representative and
finds the same semantic core:

```text
two distinct owners O1,O2,
one target pair x,y,
dist O1 x = dist O1 y,
dist O2 x = dist O2 y,
and the owner chord does not alternate with the target chord.
```

In the fixed cells, `O1` is the first apex, `O2` is the physical apex, and
`x,y` are hard-wired simultaneously into T0/T1 and the physical exact-five
row.  The nonalternating order gives the complementary Kalmanson inequality
whose equality substitution is impossible.  This is the already-known
two-owner chord-alternation theorem in linear form.

Those shared target identities are possible branches but are not consequences
of the independent F0 and exact-five constructions.  The reverse rows,
outside-pair choices, period-three cycle, triangle inequalities, row exactness,
CSS/minimality, and `noM44` are absent from the semantic core.  Therefore the
10,368-cell result diagnoses the representative encoding; it supplies no
positive evidence that the source-complete period-three packet is
contradictory.

## Why this is not `COMPLETE_UNSAT`

The source role audit's exact enumerator reports:

```text
labelled same-radius row assignments: 31
```

The current `cell()` function chooses only one T0/T1 label realization for
each `II`, `IO`, and `OI` aggregate role, in each radius arm.  It therefore
does not cover:

1. the remaining labelled same-radius T1 role words;
2. T0/T1 overlap sizes zero and one or fresh same-radius completions;
3. the distinct-radius labelled completion-role space;
4. the physical exact-five profiles with four or five strict-cap hits;
5. legal identity partitions between the independent F0/T0/T1 and exact-five
   cycle, noncycle, blocker, and outside-target roles;
6. fresh reverse outside targets and their cross-row sharing partitions;
7. legal reverse-center/nonincident-source identifications;
8. the reflected source-facing orientation; or
9. a Lean/source theorem transporting every live packet to one enumerated
   boundary cell.

Moreover `FirstApexShellRolePacket` explicitly records no common anchored
order with the reverse rows.  A convex set has an actual boundary order, but
the adapter from the named Lean packet to the finite word has not been
formalized or even packaged in scratch.  That missing source extraction is
the immediate coverage gate.

Consequently the bounded UNSAT result is evidence that the shared-order
metric route may converge, but it does not prove
`false_of_periodThree_allReverse_firstApexRows` and does not close a `sorry`.

## Next exact work

Before more solver time or Farkas minimization:

1. Derive one common `ReverseCycleSharedCapOrder K` packet from the cap and
   all-reverse data; do not add it as a public theorem premise.
2. Prove/enumerate its forward and reflected word alternatives without fixing
   unnamed points; unnamed carrier vertices must remain gaps.
3. Generate the full role/identity quotient: same- and unequal-radius row
   roles, all overlap/fresh-completion branches, every physical exact-five
   profile, all legal cross-surface identities, fresh outside-target sharing,
   and blocker/source identifications.
4. Re-run the quotient decision.  Stop on the first exact SAT witness.
5. Only after source-complete UNSAT, split Boolean pair/exactness choices into
   pure LRA cells, minimize rational Farkas cores, and expose a coverage
   theorem interface suitable for Lean `linarith` replay.

Provisional future interface:

```lean
theorem false_of_periodThree_allReverse_firstApexRows
    (P : FirstApexShellRolePacket F0 R)
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hperiod : K.period = 3)
    (hreverse : AllReverseMembership K H) : False
```

The shared-order packet is an internal producer currently missing from the
proof, and no claim is made that the current six representatives cover the
full source quotient.

## Epistemic ledger

- **EXACT BOUNDED UNSAT:** 10,368 displayed representative cells.
- **UNIFORM CAUSE:** unsupported first-apex/physical-five shared-pair identity;
  reverse rows and period-three data unused.
- **FORMULA-DEPENDENCY CHECKED:** non-reverse blocker values do not occur in
  the quotient row equations.
- **NOT SOURCE COVERAGE:** overlap/fresh roles, cross-surface identities,
  outside-target sharing, reflected orientation, and shared-order extraction
  are incomplete.
- **NOT RUN:** Farkas minimization, Lean/Lake, blueprint, production build.
- **PRODUCTION `sorry` CLOSED:** none.
