# B-family named-local encoding specification (2026-07-28, v1)

This package projects the three live B-family leaves in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` onto finitely many
**named local atoms**. It is a diagnostic CNF surface, not a finite carrier
model and not a proof of Problem 97.

Implementation: `census/frontier-packages/b_core/`.

## 1. B1 drift ruling

The live B1 leaf supplies the joint-deletion packets and
`β(z1) = β(z2)`. The historical B1 normal-form theorems additionally require
three interfaces which the live leaf does not supply:

- equality of the packet supports;
- the two cross-memberships; and
- the exact two-point class intersection.

Therefore this package does **not** import the banked two-bisector,
third-bisector, exact-bisector-set, or blocker-nonbisector consequences into
B1. `B1-direct-shadow` contains only the direct blocker-equality projection
through represented predicates. Its SAT/UNSAT result is explicitly
`NOT_AN_OFFICIAL_B1_VERDICT`; the manifest records
`OMITTED_PREREQUISITE_INGRESS_MISSING`.

## 2. Vocabulary and soundness discipline

Named labels:

`z1,z2,u,v,a2,b1,b2,bu,bv`, where `b1=β(z1)`, `b2=β(z2)`,
`bu=β(u)`, and `bv=β(v)`.

Atoms:

- `inA(p)`;
- `row(s,p)` for `s∈{z1,z2,u,v}`;
- `surv(x,c)` for named `x,c`;
- `packet(k,p)` for the B2 first-u, first-v, and cross packets;
- B2 collision and mutual-omission arm selectors;
- B3 survival-square arm selectors.

There is no closed-world axiom, unnamed-point enumeration, row exactness, or
claim that these labels exhaust any geometric set. Selector disjunctions are
at-least-one only. Equality arms propagate through the represented predicates,
but do not assert unrepresented global congruence.

Every clause is tagged by its source class:

- `B0-*`: common binder/definition consequences;
- `B1-*`: direct live B1 hypothesis only;
- `B2-h*`: direct live B2 hypothesis;
- `B2-bank-*`: consequences whose theorem interfaces match the live B2
  statement;
- `B3-h*`: direct live B3 hypothesis.

The ordered tag sequence for each layer and its histogram are persisted in
`out/manifest.json`; clause order within a run is layer order followed by any
pinned-arm unit.

## 3. Common clauses

For each named binder, `inA(p)`. For each tracked source `s`:

- `row(s,s)`;
- `¬row(s,β(s))`;
- `¬surv(s,β(s))`;
- `¬row(s,x) → surv(x,β(s))` for every named `x`.

These are one-way local consequences. No converse is encoded.

## 4. Leaf projections

### B1 direct shadow

`b1=b2` is propagated through the tracked carrier, row-target, and deletion
center predicates. No B1 bank normal form is used. This run is diagnostic
only and is excluded from the official leaf-verdict set.

### B2

The collision is encoded as

`z1=bu ∨ z1=bv ∨ z1=b2`

with conditional congruence. The statement-compatible bank consequences are:

- canonical packet rows: first-u = `row(u)`, first-v = `row(v)`, cross =
  `row(z2)`;
- collision-arm center exclusion;
- the at-least-one u/v mutual-omission alternative, with its four directed
  omission/survival consequences.

The aggregate run and each pinned collision arm are emitted.

### B3

The live four-way survival square is encoded with one selector per center
`a2,bu,bv,b2`; a selected center `c` implies both `surv(z1,c)` and
`surv(c,b1)`. The aggregate and four pinned-arm runs are emitted.

The banked removable-vertex equivalence quantifies over all off-center carrier
points. Replacing that universal quantifier by this named subset would be
unsound, so it is deliberately not projected. The final bank theorem
concluding `False` is also not inserted as a CNF clause.

## 5. Smoke gate

The Layer-1 third-bisector smoke uses three named bisector witnesses
`b1,a2,t`. The sole non-unit clause is the projection of the apex
at-most-two-bisectors theorem:

`Bis(b1) ∧ Bis(a2) ∧ b1≠a2 ∧ Bis(t) ∧ t≠b1 ∧ t≠a2 → False`.

Required cases:

1. all six premises: UNSAT, CaDiCaL proof checked by `drat-trim`;
2. drop `Bis(t)`: SAT;
3. drop `t≠b1`: SAT;
4. drop `t≠a2`: SAT.

DRAT verification applies to the UNSAT case. Each SAT near-miss is
independently model-checked, including that the omitted atom is false.

## 6. Trust boundary

Verdicts are empirical facts about the persisted DIMACS files. A SAT model is
only a model of this one-way named-local projection and is not a geometric
witness. An UNSAT result is only a CNF contradiction unless every clause has a
Lean ingress theorem and the certificate is replayed in the kernel. B1 has the
additional explicit prerequisite-ingress blocker in §1.
