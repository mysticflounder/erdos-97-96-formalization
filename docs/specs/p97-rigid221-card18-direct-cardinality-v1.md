# P97 Rigid221 card-18 direct cardinality v1

**Status: COMPLETE AND PUBLISHABLE; ARM-CNF, DIMACS, AND SOLVER GATES CLOSED.**

Date: 2026-08-27
Base revision: `38f6b0ced41acbda8b2d2f590f2acf6b1a14a7a4`

## 1. Purpose

This checkpoint implements only a generic auxiliary-free cardinality layer for
`Std.Sat.CNF`. It enumerates fixed-cardinality subsets of a finite variable
set and proves complete evaluation equivalences for at-most, at-least, and
exact cardinality.

It does not encode any Rigid221 `Valid` atom, define a complete BI/U/XV arm
formula, allocate a derived variable, emit DIMACS, enumerate assignments, or
run a solver.

## 2. Reuse preflight

The required one-time search of the repository's indexed Lean corpus at the
base revision found no generic full `Std.Sat.CNF` cardinality evaluation iff
theorem.

`Census554.CoverCnf.sinz_sat` is not a substitute. It proves only that a
bounded source assignment can be extended to satisfy the Sinz at-most clauses;
it does not prove that every satisfying assignment obeys the bound. Reusing it
would therefore leave the future model-to-`Valid` direction circularly
incomplete.

The implementation may reuse standard CNF evaluation lemmas and Mathlib's
finite powerset/cardinality facts. It must not copy a project-local generated
formula or depend on an external certificate.

## 3. Variable universe and true cardinality

The public input remains `xs : List Nat`, but define the encoder's mathematical
universe and its size explicitly as

```lean
U := xs.toFinset
m := U.card
```

This makes the total definitions honest even for a
duplicate-bearing input; published correspondence theorems still require
`xs.Nodup` so that the declared list length, clause-count formulas, and variable
manifest agree exactly.

Define the semantic count by filtering that finite universe:

```lean
trueSetCard (sigma : Nat -> Bool) (xs : List Nat) : Nat :=
  (xs.toFinset.filter fun v => sigma v = true).card
```

All internal variables remain zero-based `Nat`. This layer performs no DIMACS
`+1` conversion.

## 4. Canonical computable subset clauses

The executable encoder must not use `Finset.toList`: Mathlib defines that
operation as `noncomputable` through multiset choice. Instead define a
duplicate-free ascending universe and enumerate its combinations directly:

```lean
variableUniverse xs := xs.toFinset.sort (fun a b => a <= b)
subsetsOfCard xs r := List.sublistsLen r (variableUniverse xs)
```

Use explicit `Mathlib.Data.Finset.Sort` and `Mathlib.Data.List.Sublists`
imports. `Finset.powersetCard` may be used propositionally for reusable
cardinality facts, but not converted to an executable list through choice.
The exact `Finset.sort` and `List.sublistsLen` source/toolchain revisions and
raw clause order remain inputs to any later formula-custody manifest.

The declarations live in
`Problem97.ATailFrontierLiveClosure.Rigid221Card18DirectCardinality`; within
that namespace the public definitions are:

```lean
atMostClauses  : List Nat -> Nat -> Std.Sat.CNF Nat
atLeastClauses : List Nat -> Nat -> Std.Sat.CNF Nat
cardEqClauses  : List Nat -> Nat -> Std.Sat.CNF Nat
```

For finite-universe size
`m = (variableUniverse xs).length = xs.toFinset.card`:

- `atMost k` maps every subset of size `k + 1` to a clause of negative
  literals `(v, false)`;
- in range, `atLeast k` maps every subset of size `m - k + 1` to a clause of
  positive literals `(v, true)`; and
- `cardEq k` appends the at-most and at-least formulas.

The at-least definition must test `k <= m` before subtraction. When `k > m`,
it emits exactly `[[]]`, the one-clause false formula.

## 5. Required semantic theorems

The public theorem surface is:

```lean
eval_atMostClauses_iff (hxs : xs.Nodup) (hk : k <= xs.length) :
  Std.Sat.CNF.eval sigma (atMostClauses xs k) = true <->
    trueSetCard sigma xs <= k

eval_atLeastClauses_iff (hxs : xs.Nodup) (hk : k <= xs.length) :
  Std.Sat.CNF.eval sigma (atLeastClauses xs k) = true <->
    k <= trueSetCard sigma xs

eval_cardEqClauses_iff (hxs : xs.Nodup) (hk : k <= xs.length) :
  Std.Sat.CNF.eval sigma (cardEqClauses xs k) = true <->
    trueSetCard sigma xs = k
```

Both directions must be proved in the kernel. In particular, formula
satisfaction must imply the cardinality bound; source-to-satisfying lemmas
alone do not meet this checkpoint.

The proof should first characterize a generated subset clause:

- a negative clause is true exactly when at least one selected variable is
  false; and
- a positive clause is true exactly when at least one selected variable is
  true.

It may then use finite-subset existence at the offending cardinality to prove
the converses.

## 6. Boundary behavior

The total definitions must reduce as follows:

| Finite universe/cardinality | At most | At least | Exact |
| --- | --- | --- | --- |
| `m = 0, k = 0` | true, no clauses | true, no clauses | true, no clauses |
| `k = 0` | `m` negative unit clauses | true, no clauses | all variables false |
| `k = m` | true, no clauses | `m` positive unit clauses | all variables true |
| `k > m` | true, no clauses | false, one empty clause | false |

No theorem may obtain the at-least subset size from an underflowed natural
subtraction.

## 7. Clause counts and uniqueness

For `xs.Nodup`,
`n = xs.length = (variableUniverse xs).length = xs.toFinset.card`, and
`k <= n`, prove the actual CNF array clause counts:

```text
atMost:  choose(n, k + 1)
atLeast: choose(n, n - k + 1)
exact:   choose(n, k + 1) + choose(n, n - k + 1)
```

Distinct finite subsets must not generate duplicate clauses under the
`xs.Nodup` publication hypothesis. For eighteen
variables and `k = 4`, exact cardinality therefore has
`choose(18, 5) + choose(18, 15) = 8,568 + 816 = 9,384` clauses.

## 8. Acceptance gates

Publication requires:

1. a governed targeted Lean build and aggregate replay;
2. both directions of all three evaluation iff theorems;
3. explicit zero, full, excessive, empty-universe, and duplicate-input checks,
   including `k > xs.toFinset.card`;
4. the in-range actual CNF length formulas and duplicate-clause exclusion;
5. polarity review, computable ascending-universe enumeration, and an honest
   pinned-toolchain raw-order custody plan;
6. declaration-level axiom reports with no `sorryAx`, native, custom, or
   external evidence;
7. a clean forbidden-mechanism scan, including `noncomputable` and executable
   choice;
8. independent semantic review;
9. an exact off-spine live-blueprint delta; and
10. exact-path staged hygiene with no foreign staged path.

The DIMACS, enumeration, model, certificate, and solver gates remain closed.

## 9. Verification evidence on 2026-08-27

- The targeted governed build completed all 3,066 jobs with no module warning;
  the aggregate replay completed all 11,036 jobs.
- Ruff lint passed and all seven focused aggregate suites passed, totaling 348
  tests in 31.97 seconds.
- The three public semantic iff theorems, the actual clause-count theorems,
  combined duplicate-clause exclusion, and the five executable definitions
  have the exact kernel closure `[propext, Classical.choice, Quot.sound]`.
  This ordinary proof/quotient closure contains no `sorryAx`, native compiler
  trust, custom axiom, or external evidence.
- The executable source uses only `Finset.sort` and `List.sublistsLen` for
  enumeration. It contains no `Finset.toList`, `noncomputable`, source-level
  choice, arbitrary default, native evaluation, unsafe implementation, DIMACS,
  enumeration driver, or solver call.
- The governed live-blueprint delta is exactly one additional off-spine file
  and 51 symbols; the repository sorry count remains unchanged.
- The DirectCardinality source has SHA-256
  `16e196ebc18e05a455b8f5959fccb1067a0cc6b06750746998555d4ca0a9be07`.
- Independent semantic and computational trust reviews returned GO. The trust
  review inspected generated IR and found only dedup/filter, merge sort,
  `List.sublistsLen`, natural comparison, and clause construction; no
  executable Classical/choice path occurs.

## 10. Next boundary

After this generic layer is published, define the role-membership,
role-inequality, physical-mask, and intersection gadgets, then assemble the
BI/U/XV formulas. Do not open external formula generation until the complete
arm formulas have both kernel correspondence directions.
