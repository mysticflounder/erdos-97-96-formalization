# P97 Rigid221 card-18 clause gadgets v1

**Status: COMPLETE AND PUBLISHABLE; ARM-CNF, DIMACS, AND SOLVER GATES CLOSED.**

Date: 2026-08-27
Base revision: `78178bc899595c3a88fe30d17daf2bb4db55398b`

## 1. Purpose

This C1 checkpoint adds only the typed derived-variable layout and the generic
two-direction CNF gadgets needed to encode
`Rigid221Card18AbstractPacket.Valid` in the next checkpoint.

It does not define a complete `armCnf`, enumerate assignments, emit DIMACS,
run a solver, claim a SAT survivor, or claim an empty BI, U, or XV arm.

## 2. Review reconciliation

The review of commits `503cab0..68de8b1` recommended a pure finite packet,
source-to-packet theorem, requested source exports, and a dedicated off-spine
aggregate before search. Later published checkpoints through `78178bc8`
already provide those items:

- the selected-XV-row, physical-five, deletion-row, and BI blocker exports;
- the five crossed-incidence profile;
- the pure arm-indexed packet with decidable `Valid` and
  `source_to_abstract_packet`;
- the off-spine aggregate;
- the 288-variable constructive search base; and
- the complete direct-cardinality clause semantics.

The remaining review boundary is the checked packet/CNF correspondence. An
independent atom-map audit found that ordinary role/support atoms can use
direct eighteen-clause macros. Only signals reused by later Boolean
composition require derived variables.

## 3. Typed derived layout

Every arm retains the 288 base indices from
`Rigid221Card18SearchBase`. Derived indices are zero-gap and begin at 288.

| Arm | Family | Internal indices | Count |
| --- | --- | ---: | ---: |
| BI | physical mask | `288 ... 305` | 18 |
| BI | deleted-row/physical intersection | `306 ... 323` | 18 |
| BI | `uB1 ∩ uB2` | `324 ... 341` | 18 |
| BI | `xvB1 ∩ xvB2` | `342 ... 359` | 18 |
| U/XV | physical mask | `288 ... 305` | 18 |
| U/XV | deleted-row/physical intersection | `306 ... 323` | 18 |
| U/XV | crossed-incidence signals | `324 ... 328` | 5 |

Thus BI has 72 derived variables and 360 total variables. U and XV each have
41 derived variables and 329 total variables. U and XV remain separate arms
even though their typed layouts have the same shape.

The crossed signals have this fixed order:

1. `actualCenter1 ∈ BO`;
2. `oppApex2 ∈ K1`;
3. `actualCenter2 ∈ K1`;
4. `oppApex2 ∈ K2`; and
5. `actualCenter1 ∈ K2`.

No additional `oppApex2` inequality is authorized: the current `Valid`
predicate permits aliases not excluded by its stated atoms.

The layout module must provide total deterministic indexing, an inverse
lookup, injectivity, exact counts, base/derived disjointness, range facts,
family-list length and `Nodup` facts, and packet-derived Boolean semantics for
every retained variable. It must not define `armCnf`.

## 4. Direct role/support atoms

For each label `l`, positive membership emits

```text
not roleBit(r,l) or supportBit(S,l)
```

and negative membership emits

```text
not roleBit(r,l) or not supportBit(S,l).
```

Under `baseWellFormed`, Lean must prove both evaluation directions against the
decoded role and support. These direct macros receive no witness variables.

Role inequality emits one binary negative clause per label and likewise needs
a two-direction evaluation theorem against decoded-label inequality.

## 5. Retained composition gadgets

### 5.1 Role-selected membership signal

For a supplied signal `m`, each label contributes

```text
not roleBit(r,l) or not supportBit(S,l) or m
not roleBit(r,l) or     supportBit(S,l) or not m.
```

Under `baseWellFormed`, all 36 clauses must characterize `m` as the selected
role's support bit. C2 uses this only for the five crossed signals.

### 5.2 Physical mask

For each label, the physical-mask bit has five forward role-to-mask clauses
and one reverse mask-to-disjunction clause. Its evaluation theorem must prove
both directions against membership in the five decoded physical roles.

### 5.3 Intersections

For aligned input bits `A_l`, `B_l`, and output bit `I_l`, emit all three
conjunction clauses:

```text
not I_l or A_l
not I_l or B_l
not A_l or not B_l or I_l.
```

Every intersection output must be characterized in both directions. No free
or one-directional mask or intersection signal is accepted.

## 6. Cardinality bridge

Support-variable and derived-family lists must have exact length and `Nodup`.
The gadget layer must bridge the number of assignment-true list variables to
the decoded support or intersection cardinality. It may then instantiate
`Rigid221Card18DirectCardinality.eval_atMostClauses_iff`,
`eval_atLeastClauses_iff`, and `eval_cardEqClauses_iff` without reproving the
subset encoder.

The executable path must continue to exclude noncomputable `Finset.toList`,
arbitrary choice, native evaluation, and external evidence.

## 7. Formula accounting reserved for C2

With ordered-pair one-hot clauses and the direct macros above, the audited
complete-formula counts are:

| Arm | One-hot | Common semantics | Arm-specific | Total clauses |
| --- | ---: | ---: | ---: | ---: |
| BI | 3,070 | 19,479 | 39,420 | 61,969 |
| U | 3,377 | 19,479 | 28,477 | 51,333 |
| XV | 3,377 | 19,479 | 28,477 | 51,333 |

These are design checks for C2, not claims about a generated formula in C1.
The BI atom map has twelve common and fourteen BI atoms. Each crossed arm has
the same twelve common atoms plus twelve crossed atoms.

## 8. Acceptance gates

C1 publication requires:

1. exact typed counts and ranges for every derived family;
2. both evaluation directions for direct membership, nonmembership, role
   inequality, selected-membership signal, physical mask, and intersection;
3. exact list `Nodup`, truth-cardinality, and direct-cardinality bridges;
4. a targeted governed build and replay through the off-spine aggregate;
5. zero new `sorry`, warning, custom axiom, native trust, or external evidence;
6. a forbidden-mechanism and executable-trust audit;
7. independent semantic review; and
8. exact-path staged worktree hygiene.

## 9. Verification evidence on 2026-08-27

- `Rigid221Card18ArmLayout` defines the typed 72-variable BI and 41-variable
  U/XV layouts, total inverse lookup, exact range/count/list facts, canonical
  physical roles, `encodeArm`, base agreement, and `encodeArm_wellFormed`.
- `Rigid221Card18ClauseGadgets` defines the direct and typed clause families,
  the canonical 108-clause physical mask, the 180-clause physical-role
  distinctness layer, support and derived truth-cardinality bridges, and the
  at-most, at-least, and exact-cardinality wrappers.
- The final focused runner passed Ruff and all 348 tests in 31.51 seconds. Its
  governed aggregate replay completed all 11,038 Lean jobs.
- A second governed aggregate build refreshed the source index and kernel call
  graph, then regenerated `docs/live-blueprint.md`. The exact delta is two
  additional off-spine files and 191 symbols; the off-spine sorry count remains
  three. None of the 2,518 publication-spine paths contains `Rigid221Card18`.
- The public semantic theorems have exact kernel closure
  `[propext, Classical.choice, Quot.sound]`. The executable definitions use
  only `[propext, Quot.sound]` or no axioms. There is no `sorryAx`, custom axiom,
  native compiler trust, or external evidence.
- Independent generated-IR review found only structural matching, natural and
  Boolean operations, `List.map`/`flatMap`, multiset membership/intersection,
  and typed lookups. It found no executable choice, `Finset.toList`, unsafe or
  external implementation hook, DIMACS path, assignment enumerator, or solver.
- Independent layout, gadget-semantics, and trust reviews returned GO after
  the Nat-list, canonical physical-role, typed-output, and cardinality bridges
  were added.
- Read-only lane hygiene reports zero lane issues. The shared worktree remains
  globally blocking only because of foreign dirty and unregistered artifacts;
  none is owned or modified by this checkpoint.
- Source SHA-256 values are:
  - `Rigid221Card18ArmLayout.lean`:
    `69e28a6142ae653b047cdaa1badc38ea9dd3e278ddffda9baeeec2a42ad7a04f`;
  - `Rigid221Card18ClauseGadgets.lean`:
    `3ea8aab1913df9fe5c26f31109288aad19e4d38d530a588975b0d88501458d5e`;
  - `Rigid221Card18Aggregate.lean`:
    `ad6a1a4dd3e508d80ac5eaaaa171dbfedcb43431096c02888a2bcc5cf8e1ffae`.

## 10. Closed gates and next boundary

C2 will assemble the common, BI, and crossed formulas, orient U and XV
separately, and prove `valid_extends_to_model`, `model_decodes_to_valid`, and
the public `armCnf_sat_iff` theorem for all three arms.

Until C2 proves both directions, no external CNF/DIMACS emission, assignment
enumeration, model claim, solver run, certificate generation, or
`no_valid_abstract_packet` claim is authorized.
