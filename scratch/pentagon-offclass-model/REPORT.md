# Pentagon off-class finite incidence model

## Verdict

**SAT.** The facts in the requested finite incidence abstraction are
insufficient for a contradiction. `model.json` is an explicit 12-point model,
and `verify.py` substitutes it back into the pre-encoding conditions.

This is an incidence countermodel only. It is not a Euclidean realization, a
`CounterexampleData` value, or a counterexample to the anchored Lean theorem.
It shows that a consumer of only the projected facts below cannot prove
`False`; a closing consumer needs an additional geometric, cyclic-order,
deletion-coupling, or blocker-localization premise.

## Exact semantics checked

The carrier `U` consists of 12 distinct points. Every carrier point is a source.
There is one selected support `R(s)` and one carrier-valued blocker `B(s)` for
each source `s`. The class is

```text
C = {u, xu, deleted, v, xv}.
```

The checker requires:

1. `|R(s)| = 4` and `s in R(s)` for every source `s`;
2. `|R(s) intersect C| <= 2` for every source;
3. `B(s) = B(t)` implies `R(s) = R(t)`;
4. every blocker fiber `{s | B(s)=q}` has cardinality at most 4;
5. `R(xv) intersect C = {xv,u}`;
6. `R(xu) intersect C = {xu,deleted}`;
7. `v in R(deleted)` and `u,xu,xv` are absent from `R(deleted)`;
8. `B(xv)=c` and `c` is not in `C`; and
9. for every source `s` outside `R(xv)`, `R(s)` omits `u` or omits
   `xv` (inclusive disjunction).

The checker additionally requires `B(s) notin R(s)`, the natural positive-radius
shell condition. The model is therefore also a model of the requested weaker
surface if that condition is left out.

The source theorem `pentagonOffClass_pairDeletion_survival_probe` phrases item
9 as existence of a four-point class at the source's actual blocker after
deleting `u` or after deleting `xv`; it does not require that witness to be the
chosen row `R(s)`. Here the chosen row itself is the witness. This is another
strengthening of the requested existential semantics, so it cannot create a
false-positive SAT witness for the weaker abstraction.

“Trace exactly” above is stronger than the raw one-sided Lean trace-bound
hypotheses in the anchored theorem. It is justified in the intended projection
by source membership plus the named positive incidences and exact class census.

## Explicit model

All rows have size four. The class points in each row are shown in parentheses.

| source | selected support | class trace | blocker |
|---|---|---|---|
| `u` | `{u,xv,e,f}` | `{u,xv}` | `xu` |
| `xu` | `{xu,deleted,e,f}` | `{xu,deleted}` | `u` |
| `deleted` | `{deleted,v,g,h}` | `{deleted,v}` | `xv` |
| `v` | `{v,deleted,a,e}` | `{v,deleted}` | `g` |
| `xv` | `{xv,u,a,b}` | `{xv,u}` | `c` |
| `c` | `{c,xu,e,g}` | `{xu}` | `v` |
| `a` | `{a,v,c,f}` | `{v}` | `deleted` |
| `b` | `{b,xv,e,g}` | `{xv}` | `a` |
| `e` | `{e,xu,c,h}` | `{xu}` | `b` |
| `f` | `{f,deleted,a,g}` | `{deleted}` | `h` |
| `g` | `{g,v,b,e}` | `{v}` | `f` |
| `h` | `{h,xv,c,f}` | `{xv}` | `e` |

The blocker map is injective, so equal-blocker support equality holds and every
blocker fiber has size 1. The sources outside
`R(xv)={xv,u,a,b}` are `xu,deleted,v,c,e,f,g,h`; their rows all omit `u`,
and all except `h` also omit `xv`.

This escape is compatible with the currently proved incidence consequences:
there are many distinct actual blockers, but the abstraction does not localize
them to a common cap/bisector or force a consumer-ready crossed incidence.

## Replay

Run:

```bash
python3 scratch/pentagon-offclass-model/verify.py
```

The checker includes twelve negative smoke mutations, one for each constraint
family (including the additional blocker-not-in-support check), and requires all
of them to be rejected.
