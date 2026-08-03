# V17 static equality-cut analysis

Date: 2026-08-02

Scope: exact-`n=15` retained-omission v17 Boolean master.  This is an audit of
whether the dynamic `equality_closure_core` blockers can be moved into a finite
up-front theorem-cut bank.  It does not claim closure of the target.

## Result

**GO for the complete length-two (triangle) bank.  NO-GO for blindly inserting
all longer simple-path cuts.**

For the hardest `DDD` profile the reduced, nonredundant triangle bank contains
15,684 Boolean implications.  A direct Python enumeration takes about 0.025 s
and serializes to about 2.25 MB as JSON.  It covers all 11 v17 canary cores, and
each canary projected core contains a concrete specialization of one static
triangle implication.

The completed production run strengthens the case for this bank.  It exhausted
its 600 s wall-clock budget after 64 assignments (`UNKNOWN`, not a survivor):

- all 64 complete assignments were refuted by the full arithmetic check;
- 45 were generalized by `equality_closure_raw_replay`;
- 19 remained complete 825-literal blockers from `fixed_assignment_qf_lra`;
- the triangle bank already rejects 41 of the 45 equality-closure assignments;
- three more equality cores have length three and one has length four.

The dynamic equality replay itself was cheap (19.4 s total across the 45
equality-generalized iterations).  The expensive step paid before discovering the core is the fresh
PB-to-QF_LRA normalization, about 9 s per assignment.  Thus the triangle bank
should avoid roughly 41 expensive normalizations in this observed prefix.  It
will not address the later complete-assignment blockers, so it is an
acceleration, not a closure result.

## Exact relation-graph schema

The equality nodes are unordered carrier pairs

```text
{a,b} = {b,a},  a != b,
```

representing one squared-distance variable.  A row/class centered at `v`
connects `{u,v}` to `{v,w}` when both membership literals are true.  Hence the
relation graph is a colored subgraph of the line graph of `K_15`.

The usable row colors are:

- at each non-apex center: global `k4_c_*` and conditional exact
  `critical_row_c_*`;
- at each apex: global `k4_c_*` and one (`S`) or two (`D`) exact
  `rich_i_cls_*` rows.

The three apex critical rows are unreachable because the Boolean master proves
that rich apices are not critical centers.  They must be removed before
counting.  A global K4 row supplies equality edges but is not itself a full
shell, so a false K4 literal is not an off-circle target.  Exact-off targets are
only:

- a used non-apex critical row; or
- a rich full row.

For a critical row, exactness is guarded by

```text
Used(c) := OR_q block_q_c.
```

## Canonical minimal path cut

After deleting repeated vertices and shortcuttable consecutive steps, a
nontrivial minimal equality path is a simple carrier cycle

```text
c, v0, v1, ..., v(L-1), c.
```

Choose an exact target class `T` centered at `c`.  The exact-off assertion is

```text
T(v(L-1)) = true,   T(v0) = false.
```

For each `i`, choose a relation class `H_i` centered at `v_i` containing the
two neighboring cycle vertices.  Add `Used(v_i)` whenever `H_i` is critical,
and `Used(c)` whenever `T` is critical.  `ExactOffCircleCore` says the
conjunction is false.  Its negation is the static Boolean cut.

For `L=2`, with cycle `c-z-y-c`, the six signed membership literals are

```text
 T(y), not T(z),
 H_z(c), H_z(y),
 H_y(z), H_y(c),
```

plus zero to three `Used` guards.  In `DDD`, the 15,684 implications have this
guarded-clause length distribution:

| signed memberships plus guards | count |
|---:|---:|
| 6 | 1,764 |
| 7 | 6,792 |
| 8 | 5,808 |
| 9 | 1,320 |

`Used(c)` is currently a cached `Or` expression, not a semantic Boolean.  The
implementation should either retain the implications as Z3 Boolean formulas
or introduce a definitionally equivalent auxiliary `used_c`; it should not
naively CNF-expand multiple negated `Used` guards.

## Alias handling

The bank should use only canonical row names:

- canonicalize distances to unordered pairs;
- normalize packet/oriented `B2` rows to their conditional critical row;
- normalize the first-apex packet/oriented `B1` row through the existing rich
  profile compatibility theorem;
- do not emit duplicate packet-row colors;
- omit apex-critical colors and targets;
- omit same-center alternate-shell length-one paths.  Those are already
  inconsistent through used-critical/K4 equality, rich-class disjointness, or
  apex K4/profile compatibility.

The dynamic implementation uses the first true member of a row as a star
anchor.  This explains 8- or 9-literal projected cores that contain an
irrelevant anchor member.  Static cuts should connect any two true members
directly; this is theorem-sound and yields the smaller six-membership triangle.

## Counts by profile and path length

After the unreachable apex-critical pruning, the number of simple-cycle cuts
is

```text
sum_c exactClasses(c) * L! * e_L(classes(p) : p != c),
```

where `e_L` is the elementary symmetric polynomial.  Counts depend only on the
number of `D` apices:

| profile shape | L=2 | L=3 | L=4 | L=5 |
|---|---:|---:|---:|---:|
| SSS | 10,920 | 262,080 | 5,765,760 | 115,315,200 |
| one D | 12,376 | 305,760 | 6,918,912 | 142,222,080 |
| two D | 13,962 | 355,056 | 8,264,256 | 174,620,160 |
| DDD | 15,684 | 410,472 | 9,827,136 | 213,459,840 |

The raw counts before deleting impossible apex-critical colors are respectively
21,264, 595,584, 15,193,728, and 350,254,080 for `DDD` at lengths 2 through 5.
Those raw counts should not drive implementation sizing.

Length three is already 410,472 formulas in `DDD`; length four is nearly ten
million.  The observed production prefix has only four equality assignments
not rejected by the triangle bank (three length-three paths and one
length-four path), while the existing dynamic checker handles them exactly.
That makes wholesale pre-enumeration of longer paths a poor trade.

## Canary and production evidence

The audit script is:

```text
scratch/v17-static-equality-cuts/analyze_static_cuts.py
```

Its canary output is `scratch/v17-static-equality-cuts/canary2-audit.json`.
For `fresh_DDD_k0_d2_f1` it reports:

- 11 dynamic blockers;
- 15,684 unique triangle cuts;
- 11/11 assignments covered;
- 11/11 projected cores concretely specialized;
- 0.025 s generation time.

The production audit is
`scratch/v17-static-equality-cuts/production1-audit.json`.  It reports 41/45
equality-closure assignments covered.  The four misses are iterations 36, 37,
42, and 44, whose projected cores are respectively three length-three paths
and one length-four path.  Three other longer dynamic cores (iterations
38--40) occur in assignments that also contain an independent triangle cut,
so the static bank rejects them earlier despite not being a subset of the
chosen dynamic projected core.

## Recommended insertion gate

1. Generate all reduced `L=2` cuts for the selected profile before the first
   Boolean check.
2. Keep provenance fields recording `ExactOffCircleCore`, target class,
   inside/outside vertices, the two transition classes, and all `Used` guards.
3. Add a focused test that reproduces the 11/11 canary specialization audit.
4. Run one matched-budget `DDD` production canary and compare assignments per
   minute and terminal status.
5. Retain dynamic equality closure for `L>=3`; do not materialize those banks
   unless a later survivor census shows a concentrated, symmetry-reducible
   motif.

This is a theorem-licensed Boolean strengthening.  It changes search order and
cost only; it does not promote any `UNKNOWN` result to nonexistence.
