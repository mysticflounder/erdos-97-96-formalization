# P97 n=12 frozen-bank SAT encoding audit

**Date:** 2026-09-05  
**Question:** Did an error in `lazy_row_sat.cpp` produce a vacuous or spurious SAT result?  
**Verdict:** **No.** The displayed twelve-row assignment is a genuine satisfying assignment of the exact frozen Boolean problem: loopless cardinality-four rows plus all 777,108 monotone no-good clauses in the bank with SHA-256 `1cbf12d01d0be74be503f8ab8aa0e1da2355f4061daca3f407083e283492c709`.

This does **not** make the assignment a strict-Kalmanson model or a P97 counterexample. The bank is incomplete as a representation of all strict-Kalmanson consequences; an independently checked eight-role Kalmanson cancellation excludes the witness and contributes 1,980 missing clauses.

## 1. Audited inputs

```text
Frozen bank:
/mnt/data/p97-n12-simplification-2026-09-04/results/
  n12-bank-r220-antichain.p97monotone
bytes:   25,139,960
SHA-256: 1cbf12d01d0be74be503f8ab8aa0e1da2355f4061daca3f407083e283492c709

Original solver source:
/mnt/data/p97-n12-resume-2026-09-05/source/lazy_row_sat.cpp
SHA-256: 2a441a2e263f96a97c75a5a7083058fde81ff125e1a0241aa31532c03b5fe32b
```

The bank parser independently confirmed:

- header `p97monotone 12 777108`;
- exactly 777,108 following clauses;
- every clause is nonempty and zero-terminated;
- every atom is in `1..144`;
- every atom list is strictly increasing, with no duplicate atom;
- no atom selects a row center itself;
- no trailing non-whitespace data occurs.

## 2. Exact Boolean semantics

For each center `c` and point `p`, the primary Boolean variable is

```text
h(c,p)  <->  point p belongs to the selected row at center c.
```

The atom serializer is

```text
atom(c,p) = 12*c + p + 1.
```

The base row constraints are:

```text
not h(c,c)
exactly four of {h(c,p) : p != c} are true.
```

A bank line

```text
a1 a2 ... ak 0
```

is a monotone no-good: it forbids all listed positive memberships from holding simultaneously. The solver assertion is therefore

```text
not h(a1) or not h(a2) or ... or not h(ak).
```

This sign convention agrees with the documented `p97monotone` serializer and with the older custom exact row solver.

### Pure-CNF exact-four encoding

The separate `cnf` mode encodes each 11-variable row as:

- all `C(11,5)=462` five-subset negative clauses, enforcing at most four hits;
- all `C(11,8)=165` eight-subset positive clauses, enforcing at least four hits;
- one center-exclusion unit.

Across twelve rows this gives 7,536 exact-cardinality clauses. The audited witness satisfies this formulation as well as Z3's pseudo-Boolean equality formulation.

## 3. Constructive witness certificate

The assignment is:

```text
0:  2 7 8 10
1:  0 2 3 11
2:  0 4 6 7
3:  1 4 5 11
4:  2 6 9 11
5:  3 4 7 9
6:  1 2 4 8
7:  5 6 8 9
8:  0 1 6 10
9:  5 7 10 11
10: 0 3 5 8
11: 1 3 9 10
```

An independent Python parser—not the C++ parser or its bitset replay code—verified:

- twelve rows are present;
- every row has four distinct points;
- no row contains its center;
- exactly 48 primary atoms are true;
- **zero of the 777,108 frozen-bank clauses is violated**.

That is already a complete SAT certificate for the frozen Boolean problem. It does not depend on trusting Z3, the support auxiliaries, the lazy-loading loop, or the symmetry breaker.

## 4. Independent solver cross-checks

The witness was forced only for the purpose of checking the encoding. Exact-four then makes the four asserted memberships at each center determine the complete row.

### All bank clauses asserted, no auxiliaries, no grouping, no symmetry

Two independent exact-cardinality formulations both returned SAT with precisely the displayed support map:

```text
Pseudo-Boolean exact-four:
installed bank clauses: 777,108 / 777,108
status: SAT
reason: exact full-bank replay

Pure-CNF exact-four:
installed bank clauses: 777,108 / 777,108
status: SAT
reason: exact full-bank replay
```

Thus the result does not rely on lazy omission of wide clauses.

### Lazy and auxiliary formulations

With the normal width-eight initial subset, 329,604 bank clauses were asserted initially and the remaining 447,504 were checked during full-bank replay. The following three formulations all returned the identical witness in one iteration:

```text
qffd + primary hit variables only
cnf  + primary hit variables only
qffd + grouped clauses + complete support channel
```

The support channel created 6,600 definitional predicates:

```text
3,960 exact four-support conjunctions
  660 pair-membership conjunctions
1,980 triple-membership conjunctions
```

On the witness, exactly one four-support predicate is true at each center. Every pair/triple predicate agrees with existence of a containing exact four-support. All 6,600 definitions were checked independently.

Grouping is also semantics-preserving. A clause with centerwise atom sets `A_c` is rewritten as

```text
OR_c not P(c,A_c),
P(c,A_c) <-> AND_{p in A_c} h(c,p).
```

By De Morgan this is exactly the original clause. The audit checked this equivalence on every frozen clause for the witness and on 501,400 sampled clause/independent-random-exact-four-assignment pairs.

### Sanitizer run

The original source was compiled with AddressSanitizer and UndefinedBehaviorSanitizer. A full-bank forced-witness replay completed with no sanitizer finding and returned the same support map.

## 5. Adversarial tests

The independent audit ran fifteen negative/control tests. All passed:

- pseudo-Boolean exact-four on the unique `n=5` row system;
- pure-CNF exact-four on the same system;
- lazy installation of an initially omitted inevitable clause, followed by UNSAT;
- a satisfiable `n=6` unit no-good avoided while retaining exactly four hits;
- rejection of a center/self atom;
- rejection of duplicate atoms;
- rejection of descending atoms;
- rejection of an out-of-range atom;
- rejection of an empty clause;
- rejection of a missing zero terminator;
- rejection of a short bank;
- rejection of trailing extra clause data;
- rejection of a three-bit pivot row;
- rejection of a five-bit pivot row;
- rejection of a pivot row containing its own center.

A separate one-second unforced timeout probe returned `UNKNOWN` with reason `timeout`, rather than returning SAT or UNSAT spuriously.

## 6. Why this SAT result is not vacuous

The decisive statement does not depend on any search behavior:

1. The 48-element set of true atoms is explicitly listed.
2. It directly satisfies the twelve loopless exact-four constraints.
3. An independent scan proves every frozen-bank no-good contains at least one false atom.

Therefore the assignment is a mathematical model of the frozen Boolean formula. Even a completely broken SAT search would not invalidate that direct certificate.

The following possible culprits are specifically excluded:

- **Missing exact-cardinality constraints:** excluded by direct row checks and by both PB and pure-CNF formulations.
- **Unconnected support-choice variables:** excluded because SAT persists with the entire support channel disabled.
- **Incorrect grouped-clause semantics:** excluded because SAT persists with grouping disabled and all original clauses asserted.
- **Lazy failure to install wide clauses:** excluded by the all-777,108-clauses-asserted runs and independent replay.
- **Bad symmetry breaker:** excluded because the decisive runs use `P97_SYMMETRY=0`. In any event, a symmetry breaker can remove solutions but cannot make an invalid primary assignment satisfy independently replayed clauses.
- **Partial or undefined Z3 Boolean values:** excluded by the explicit 48-atom assignment and independent replay.

## 7. What is actually incomplete

The SAT assignment is a model of the **finite learned bank**, not of the complete strict-Kalmanson theory.

The assignment contains the eight-role pattern

```text
row(1) contains {0,4}
row(3) contains {2,6}
row(5) contains {0,4}
row(7) contains {2,6}
```

under increasing role image `[0,2,3,5,6,8,9,11]`. Six strict Kalmanson inequalities cancel exactly against the four row equalities. Its four dihedral templates have 1,980 order-preserving lifts at `n=12`. An independent scan confirms that **none of those 1,980 clauses occurs in the frozen bank**.

So the correct diagnosis is:

```text
SAT encoding: sound for the supplied Boolean bank.
Frozen bank: incomplete for strict-Kalmanson feasibility.
```

## 8. Implementation findings and hardening patch

No implementation bug found can account for the SAT certificate. Two code-quality issues should nevertheless be repaired:

### 8.1 Z3 ABI declaration

The original handwritten declaration uses C++ `bool` for `Z3_model_eval`. The C API returns `Z3_bool`, an unsigned integer type. This is an incompatible declaration at the C++ language level, even though it works under the observed x86-64 ABI and did not trigger the sanitizer run.

The audited patch changes the return and `model_completion` argument to an unsigned ABI type and rejects `Z3_L_UNDEF` explicitly.

### 8.2 Input/reproducibility validation

The patch also:

- rejects negative initial widths;
- rejects unknown `P97_SAT_MODE` strings rather than silently selecting the SAT tactic;
- removes misleading parser indentation.

The patched source reproduces the all-clause pure-CNF SAT certificate exactly.

These fixes improve robustness but do not change the logical encoding or the witness verdict.

## 9. Remaining provenance limitation

The original unforced 26.958-second discovery output, exact invocation, and immutable run receipt are not present in the recovered runtime directory. This audit validates the resulting witness and formula independently, but it does not authenticate that historical timing/transcript.

Likewise, the frozen bank generator and its full source manifest are not included with the recovered two-file runtime. The audit establishes the bank's exact bytes and the witness's satisfaction of those bytes. It does not certify that the bank contains every clause its historical generator was intended to emit; indeed the new eight-role family proves it does not contain every strict-Kalmanson consequence.

## 10. Final verdict

```text
NO VACUOUS SAT.
```

The displayed support table is a genuine model of all 777,108 supplied no-goods and loopless exact-four row constraints. The failure is one of **theory/bank completeness**, not Boolean SAT encoding soundness.
