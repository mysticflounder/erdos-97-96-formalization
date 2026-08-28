# P97 Rigid221 card-18 search base v1

**Status: COMPLETE AND PUBLISHABLE; DERIVED-CNF, DIMACS, AND SOLVER GATES CLOSED.**

Date: 2026-08-27
Base revision: `47765d2ab4e1c3d0ef5b3e070a16478de2c0e46f`

## 1. Purpose

This checkpoint implements only the kernel-defined base representation required
by the checked-search correspondence design. It gives each BI/U/XV packet a
typed 288-variable Boolean view, proves the role selectors are exactly one-hot,
and constructs a choice-free decoder with round-trip theorems.

It does not define the common, crossed, or BI validity clauses beyond role
wellformedness. It emits no DIMACS bytes and runs no model enumeration or
solver.

## 2. Semantic packet reuse

The search layer must not invent a parallel packet with fewer invariants or
different field orientation. For each search arm, `PacketOfArm` reuses the
existing abstract common data paired with the matching payload:

| Arm | Packet payload |
| --- | --- |
| BI | common data × BI data |
| U | common data × crossed data |
| XV | common data × crossed data |

A total `toAbstractPacket` map reconstructs the existing constructor. Search
validity remains exactly `toAbstractPacket p |>.Valid` in later checkpoints.

## 3. Slot layout

Every arm uses common role slots `0 ... 9` in this order:

```text
u, v, xu, xv, deleted,
source1, source2, deletedCenter, actualCenter1, actualCenter2
```

U and XV add `oppApex2` at role slot 10.

Every arm uses common support slots 0 and 1:

```text
selectedXvRow, deletedCenterRow
```

BI support slots `2 ... 5` are:

```text
uB1, uB2, xvB1, xvB2
```

U/XV support slots `2 ... 4` are:

```text
K1, K2, BO
```

The slot accessors are total functions over `Fin (roleCount arm)` and
`Fin (supportCount arm)`. U and XV share a layout but remain different packet
constructors.

## 4. Typed base variables

A base variable is either:

```text
role selector      (role slot, Fin 18 label)
support membership (support slot, Fin 18 label)
```

The counts are:

| Arm | Role bits | Support bits | Total |
| --- | ---: | ---: | ---: |
| BI | `10 * 18` | `6 * 18` | 288 |
| U | `11 * 18` | `5 * 18` | 288 |
| XV | `11 * 18` | `5 * 18` | 288 |

The internal natural-number map is zero based:

```text
roleBit(r,l)    = 18 * r + l
supportBit(s,l) = 18 * roleCount + 18 * s + l
```

All base indices lie in `0 ... 287`. The map must prove role/support ranges do
not overlap and distinct typed base variables cannot alias. External DIMACS
numbering remains out of scope.

## 5. Encoding and role clauses

`encodeBase p` assigns a role selector exactly when the packet's role equals
that label, and assigns a support bit exactly when the label lies in that
packet support.

For each role, the kernel CNF contains:

- one positive clause over its eighteen selectors; and
- one negative binary clause for every ordered pair of distinct labels.

The ordered-pair implementation deliberately retains both orientations. This
is redundant but semantically exact: it produces 306 binary clauses plus one
positive clause per role, hence 3,070 clauses for BI and 3,377 for U or XV.

The implementation must prove both:

```text
encoded packet -> role clauses evaluate true
role clauses evaluate true -> exactly one selector is true for every role
```

This is an internal `Std.Sat.CNF` definition, not external formula generation.
In Lean 4.27, `Std.Sat.CNF.Sat` takes an assignment and a formula; any future
existential satisfiability theorem must quantify the assignment explicitly.

## 6. Choice-free decoding

`baseWellFormed arm sigma` says every role selector is exactly one-hot. The
decoder:

1. obtains each selected `Fin 18` label through an explicit finite first-true
   scan, either a local definition or Batteries' `Fin.find?` under an explicit
   `Batteries.Data.Fin.Lemmas` import;
2. uses the wellformedness proof to establish that the scan succeeds and is
   unique; and
3. reconstructs each support as the Finset of labels whose membership bits are
   true.

Bare Lean 4.27 does not export `Fin.find?`; the implementation must not rely on
an implicit transitive import. The decoder may not use `Classical.choose`,
`Classical.choice`, or an arbitrary default justified only after the fact.

The required public round trips are:

```text
decodeBase (encodeBase p) = p
wellformed sigma -> encodeBase (decodeBase sigma) agrees with sigma on all
  288 base variables
```

The second theorem ignores future derived variables by design.

## 7. Scope and nonclaims

This checkpoint does not provide:

- decoded `Valid` clauses beyond role exactly-one representation constraints;
- role-inequality, physical-mask, membership, or intersection gadgets;
- exact-cardinality support clauses;
- BI/U/XV `armCnf` formulas;
- an assignment-to-`Valid` theorem;
- a DIMACS serializer, formula manifest, model, or certificate;
- a SAT/UNSAT result; or
- `no_valid_abstract_packet`.

## 8. Acceptance gates

Publication requires:

1. a governed targeted Lean build;
2. exact 288-variable count and no-alias proofs for all arms;
3. both directions of the role-one-hot evaluation theorem;
4. choice-free encode/decode round trips;
5. declaration-level axiom reports with no `sorryAx`, native, or external
   evidence;
6. a clean forbidden-mechanism scan;
7. independent semantic review of slot orientation and proof directions;
8. an exact off-spine live-blueprint delta; and
9. exact-path staged hygiene with no foreign staged path.

External formula/DIMACS emission, enumeration, and solver gates remain closed.

## 9. Verification evidence on 2026-08-27

- The targeted governed build completed all 11,034 jobs; the aggregate replay
  completed all 11,035 jobs.
- Ruff lint passed and all seven focused aggregate suites passed, totaling 348
  tests in 32.26 seconds.
- `baseVarCount_eq_288` has no axioms. `BaseVar.toNat_injective`,
  `decode_encode`, `encode_decode_on_base`, and
  `toAbstractPacket_decode_encode` depend only on `propext` and `Quot.sound`.
- The one-hot evaluation theorems and `BaseVar.card_eq_288` additionally use
  ordinary proof-level `Classical.choice` through library finite-container
  infrastructure. The executable decoder itself uses the explicit Batteries
  Boolean scan and no choice or arbitrary default; both round-trip closures
  exclude `Classical.choice`.
- A focused source scan found no `sorry`, `admit`, custom `axiom`, explicit
  `Classical.choose`/`Classical.choice`, native evaluation, unsafe/external
  implementation, or proof-generating tactic escape.
- The governed live-blueprint delta is exactly one additional off-spine file
  and 73 symbols; the repository sorry count remains unchanged.
- The SearchBase source has SHA-256
  `da11efb3912645f92a3df7472d56a10be8881f0dd82283bb5b6b0b59a9a3ae1d`.
- Independent semantic/custody review and a separate constructive-decoder
  audit both returned GO.

## 10. Next boundary

After this base bridge, implement the generic direct at-most, at-least, and
exact-cardinality CNF encoders with full kernel evaluation iff theorems. Do not
define the complete arm formulas until that cardinality surface is proved.
