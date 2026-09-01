# Rigid221 S0 coupled-two-row exact polynomial model

**Base HEAD:** `f26de746bc16d15d891c42ad8cfb42876a63ab06`
**Arithmetic:** exact rational arithmetic; no tolerance and no nonlinear solver
**Displayed-coordinate verdict:** `ROW_CORE_POSITIVE_CONTROL`; source status
`SOURCE_INVALID`. Separate wave-2 coordinates give
`SAT_EXACT_L1_CAP_TWO_ROW_CORE` for S0-I and S0-N.

## Exact target

Determine whether the displayed prior single-row seed and its known opposite
row extension reach the source L1 S0-I or S0-N packet, or identify the first
source field that they cannot supply.

## Intended source-faithful L1 model

For every modeled role `p`, use coordinates `(pₓ,pᵧ)`. Define

```text
d²(c,p) = (pₓ-cₓ)² + (pᵧ-cᵧ)²
orient(a,b,p) = (bₓ-aₓ)(pᵧ-aᵧ) - (bᵧ-aᵧ)(pₓ-aₓ).
```

After a valid Euclidean scaling-and-isometry normalization, the physical center
and radius may be fixed to `O=(0,0)` and `rho=1`. The exact physical fiber requires

```text
d²(O,p)=1  for p∈{u,xu,delta,v,xv},
d²(O,z)≠1  for every modeled z∈A\C.
```

The actual rows require positive variables `ru²,rv²` and complete ambient
fibers

```text
d²(cu,p)=ru²  exactly for p∈Ku={u,xu,au,bu},
d²(cv,p)=rv²  exactly for p∈Kv={v,xv,av,bv}.
```

For a closed finite carrier, singleton blocking is checked without a tolerance:
after deleting `u`, every positive value in `{d²(cu,z) : z∈A\{u}}` has
multiplicity at most three. After deleting `v`, the corresponding assertion is
checked at `cv`.

For a proposed injective CCW enumeration `p₀,…,pₙ₋₁`, strict convexity is the
complete family

```text
orient(pᵢ,pᵢ₊₁,pⱼ)>0
```

for every nonincident `pⱼ`, with indices read cyclically. Consecutive triples
alone are insufficient.

For Moser vertices `(m1,m2,O)`, MEC center `m`, and squared radius `R²`, the
source packet requires all carrier points in the closed disk, all three Moser
vertices on its boundary, three nonnegative angle dot products, the exact
closed `OnArcOpposite` cap filters, and a cap selected by `surplusIdx` with
cardinality greater than four. `J` is the cap at `oppIndex2 surplusIdx` after
erasing its two Moser endpoints.

## Exact replay of the prior coordinate seed

**EMPIRICALLY VERIFIED (finite exact replay; row-core positive control only).**
The known opposite-row extension has exact fibers

```text
d²(O,C)=1,
d²(cu,Ku)=17/25,
d²(cv,Kv)=53649709/67240000.
```

Its 120 edge/nonincident orientations are positive, with minimum

```text
orient(v,delta,u)=2/5525.
```

After deleting the corresponding source, the maximum positive-distance
multiplicity at each actual row center is three. Thus the added row `Kv` causes
no contradiction in this closed row core.

## Exact MEC obstruction for the prior seed

Let

```text
v  = (8/17,-15/17),
xv = (228/397,325/397).
```

Their midpoint and quarter squared separation are

```text
m  = (v+xv)/2 = (3526/6749,-215/6749),
R² = d²(v,xv)/4 = 4900/6749.
```

**EMPIRICALLY VERIFIED (finite exact replay).** The independent verifier checks
`R²-d²(m,p)>0` for every other role in
both the nine-role seed and the twelve-role coupled extension. Equality holds
only for `v` and `xv`.

**PROVEN (pen-and-paper, conditional on the replayed arithmetic).** Every disk
containing `v` and `xv` has radius at least `dist(v,xv)/2` by the triangle
inequality. The displayed midpoint disk has that radius and contains the entire
listed carrier. It is therefore a minimum enclosing disk, with carrier boundary
exactly `{v,xv}`.

**PROVEN (pen-and-paper).** `SurplusCapPacket.hCirc` requires three
pairwise-distinct MEC-boundary Moser vertices. The prior carrier has only the
two boundary roles certified above and cannot supply that field. Its manual cap
is invalid: the named wedge cannot be interpreted as the source cap `J`, and it
decides neither S0-I nor S0-N.

## Completion matrix

| Obligation | Statement | Label | Status | Evidence |
|---|---|---|---|---|
| M1 | The displayed twelve-role coordinates satisfy the closed row equations, convexity checks, and deletion multiplicity bounds. | EMPIRICALLY VERIFIED | 🟡 row-core positive control | Exact producer plus independent exact verifier; no source cap claim. |
| M2 | The displayed midpoint disk encloses every listed role with boundary `{v,xv}`. | EMPIRICALLY VERIFIED | 🟡 partial | Exact rational slack inventory. |
| M3 | M2 forces the listed carriers into the MEC diameter branch and excludes `SurplusCapPacket.hCirc`. | PROVEN (pen-and-paper) | ✅ done | Radius lower bound and the source field requiring three distinct boundary vertices. |
| M4 | Different coordinate families supply every active finite L1 cap/two-row field for S0-I and S0-N. | EMPIRICALLY VERIFIED | ✅ done | Separate exact witnesses and independent replay. |
| M5 | A modeled first-apex extension satisfies the finite L2 fiber/blocker geometry in each branch. | EMPIRICALLY VERIFIED | ✅ finite core | Exact 16-role and 15-role extensions; no actual Lean source-context fields instantiated. |
| M6 | Either finite carrier extends to a global-`K4` `CounterexampleData` and total `CriticalShellSystem`. | CONJECTURED | ⬜ open | The modeled carriers fail global `K4`; actual deletion packets and robust surface are absent. |
| M7 | Adding an exact delta row satisfies every named finite geometric predicate abstracted from joint deletion, robust surface, and singleton global deletion. | EMPIRICALLY VERIFIED | ✅ field-level core | Exact 19-role and 18-role packets; typed dependent Lean packets remain unconstructed. |
| M8 | A finite S0-I carrier satisfies a total modeled shell assignment and deletion blocker at every source. | EMPIRICALLY VERIFIED | ✅ finite total-system model | Seven exact four-fibers partition 28 roles; global K4 fails at 20 centers. |
| M9 | The compatible named rows either exhaust a global-K4 carrier within the sharp bound or have a faithful selected-row escape. | PROVEN (source API, conditional on genuine D.K4) | 🟡 split | Raw `|B|≤20`; proper `B` has an actual row escaping `B`, while `B=A` remains a bounded endpoint. |

The finite seed rejection and both wave-2 finite-core satisfiability statements
are **EMPIRICALLY VERIFIED** because their arithmetic premises are externally
replayed. They are not theorem counterexamples. A source-faithful continuation
still needs a genuine global-`K4` ambient extension and the total structures
derived from it.

Wave 1 additionally gives `UNSAT_FIXED_CELL_EXACT` for both S0 branches before
the membership split: `hCirc` fails first at boundary cardinality two, and the
conditional physical-`O` boundary consequence is independently contradicted by
slack `3051/6749`. A finite rational addition grid with at most two new roles
has been exhausted exactly, but it is only bounded evidence about that prior
cell; wave 2 resolves the finite L1 cap/two-row cores with different coordinates.

Wave 2 supplies exact rational L1 witnesses with MEC boundaries
`{O,delta,xv}` and `{O,delta,xu}`, cap profiles `(5,4,7)` and `(5,3,7)`, and
source caps `J={cu,cv,u,v,xu}` and `J={cu,cv,u,v,xv}` respectively. The
independent verifier derives all nine endpoint memberships from the closed-cap
filters. Exact first-apex extensions further verify cap profiles `(5,7,7)` and
`(5,6,7)` plus the modeled first-fiber/blocker geometry. Those L2 certificates
instantiate zero actual Lean `ExactFourMutualOmissionSourceContext` fields and
explicitly make no `CounterexampleData`, robustness, global-deletion, or theorem
claim.

The L3 extensions add
`Kdelta={delta,d1,d2,d3}` at radius squared `80656/54389`. S0-I has 19
roles, cap profile `(5,10,7)`, and first-opposite cap growth; S0-N has 18
roles, cap profile `(8,6,7)`, and surplus cap growth. Independent exact replay
accepts the modeled common-deletion overlaps, row omissions, robustness checks,
cap growth, and singleton deletion restoration. These are field-level finite
predicates only. The global card-minimal blocking-subdeletion constructor first
requires `R.minimal : D.Minimal` and uses `D.K4`; a total source-indexed
`CriticalShellSystem` is also absent.

The total-system extension adds three more exact rows and partitions all 28
roles into seven complete four-fibers. Assigning every source to its unique
block center gives exact modeled `shellAt` and `no_qfree` data, including the
blocker cycle `xv→cv→fp→xv`. Only 8 carrier points are centers of a four-point
radius class; the other 20 fail centerwise K4. Thus total finite shell geometry
does not close the global gap. Exact replay corrects the supplied cap profile
to `(8,10,13)` and the `Kdelta` center to `xu`.

For a genuine global-K4 ambient carrier, preserving the physical five-class in
`FaithfulCarrierPattern` requires choosing a compatible four-subset. The named
seed has raw sharp envelope `|B|≤20`. Compatible aliases
`oppApex1=cv` or `oppApex1=cdelta` force the corresponding rows to coincide and
give `|B|≤15-|Ku∩Kv|`. If `B` is proper, the trusted escape theorem yields an
actual selected class centered at `a∈B` with some support point `z∉B`; no
further location or incidence is source-forced. If `B=A`, the remaining target
is a bounded all-center K4 endpoint, not an established contradiction.
