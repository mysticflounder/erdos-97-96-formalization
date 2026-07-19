# Role-coverage gate: engine design

Status: DESIGN. Blocks on the Round 188 named-interior normal form for the
final role/field tables. Constraint semantics below cite the intended Lean
provenance; every cited fact must be re-verified against the actual
declaration before encoding. {{NEEDS_PROOF}} markers flag the ones not yet
confirmed at source level.

## Coverage contract

Each enumerated schema is a RELAXATION of one class of real configurations:
every constraint asserted must be a proven consequence of the production
packet plus that schema's discrete choices. Then

- schema UNSAT  =>  that class is impossible (portable, via its core);
- all schemas UNSAT  =>  the aligned exact-seven interior branch is closed;
- any schema SAT  =>  a genuine residual telling us exactly which
  non-encoded geometry must be consumed next (Round 166's producers).

Discrete choices must partition the real possibilities: identification
patterns and arc-side assignments are enumerated; boundary order within
arcs is symbolic (see below), so it never splits schemas.

## Named points

Physical cap, order fixed by the normal form (up to the enumerated
endpoint-side choice):

```text
V?  s0  b0  s1  b1  s2  F?      (V?F? = endpoint-side choice, 2 ways)
```

Opposite arc, contiguous cap structure: F-side strict surplus arc, then O
(second apex), then strict opp-1 arc back to V.

Non-cap named roles:

- outside pairs P0={p0,p0'}, P1={p1,p1'}, P2={p2,p2'} of the three reverse
  rows (rows centered at b0, b1, s1 respectively);
- exact-five extras e1, e2 (class at O minus the three sources);
- retained first-apex row {x, y, r3, r4} with frontier pair {x,y};
- double-deletion first-apex row {g1..g4};
- second-apex common rows as forced by the continuation packet.

## Enumerated dimensions (schema id)

1. endpoint side (2, then quotient by the dihedral reflection);
2. arc side (strict surplus vs strict opp-1 vs exceptional memberships
   allowed by the packet) for each non-cap named point — exceptional
   membership tables (may a role point be O, a cap point, a Moser vertex)
   to be pinned from the Lean field types before implementation;
3. identification pattern among non-cap named points, filtered by every
   proven distinctness fact (pairs distinct as pairs, in-pair distinctness,
   row disjointness, frontier-pair exclusions);
4. first-apex same-radius vs distinct-radius arm;
5. blockers of the two cap endpoints per the Round 152 alternative
   (named-residual position vs strict other-cap interior), including which
   residual point.

## Symbolic (inside one Z3 query per schema)

- Boundary order: relative order of the non-cap named points within their
  arcs is NOT enumerated. Introduce Boolean order atoms (or integer
  positions) and assert Kalmanson / crossing-ordinal constraints as
  implications conditional on the order atoms. This removes the
  interleaving explosion entirely; Z3 case-splits internally.
- All distances: nonnegative reals with the homogeneous unit-slack
  normalization of the sibling encoder, EXCEPT that min-distance
  normalization must only be asserted for pairs proven distinct in the
  schema (identification soundness).

## Constraint families (provenance sketch)

- support-locked complete radius classes at every named blocker value
  (selectedFourClass_support_eq_shell); equalities + completeness
  exclusions over all named points;
- exact 2+2 reverse rows: row ∩ cap = {source, successor}, outside pair
  outside the cap (production all-reverse row decomposition);
- cap-chain strict monotonicity along the physical cap order and both
  opposite-arc cap chains (cap-chains assumable fact; linear);
- crossing-ordinal cuts: cyclic quadruple (a,b,c,d) with d(a,c)=d(a,d)
  forces d(b,c)<d(b,d) (general crossing fact; conditional on order atoms);
- cross-cap bisector injectivity (at most one cap point equidistant from a
  fixed outside pair) — clause schema over named points;
- witness-circle crossing at the distinguished vertices (ri + rj strict
  lower bounds; linear);
- K4 at every named center not otherwise locked: disjunction over
  4-subsets of named points PLUS an anonymous-support escape disjunct
  (a row through ≥ some anonymous points imposes only its named-point
  constraints) — the escape keeps the relaxation honest for arbitrary |A|;
- strict triangle everywhere; strict Kalmanson conditional on order atoms;
- aligned collision facts from the Round 188 normal form (centerAt s0 = s1,
  b2 = s1, strictly-inside-MEC as NEGATION of the closed boundary arm:
  encode only its order/incidence consequences, the metric MEC facts are
  not linear — omit rather than approximate).

## Cut banks (speed + Lean-port targets, not soundness)

- equilateral-hinge collapse (this lane, Finding 1);
- five-point circle-isosceles order cuts (Round 186 core + Round 183
  cyclic transport), conditional on order atoms;
- six-point planar terminals (Rounds 170/177), same conditioning.

Cuts are redundant w.r.t. the base families only where the base families
already imply them (hinge: yes — class equalities + exclusions; five/six
point: NO — genuinely planar, they must be added as clauses and their
soundness comes from the kernel-checked terminals).

## Pipeline

1. smoke A: the sibling fixed fixture expressed as a schema must return
   UNSAT and its minimized core must be the recorded hinge;
2. smoke B: the same schema with the hinge memberships removed from the
   support tables must return SAT (Round 156-style escape must survive the
   base families);
3. full run: schema census with verdict + minimized labeled core per
   schema, resumable, JSONL ledger; offload candidates: flux.local worker;
4. audit: every UNSAT core checked for named-role-only support; cores
   using the anonymous-escape disjunct or MEC-adjacent facts are flagged
   NOT-PORTABLE and treated as SAT for closure accounting;
5. census summary → next Lean step (coverage theorem if clean, or the
   sharpest SAT survivor as the new frontier object).
