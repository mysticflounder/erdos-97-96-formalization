# Results

Run: `uv run python freshthird_aligned_boundary_v2.py` (serial; exact-17
finite incidence/cap abstraction).

```text
negative_overfull_source_row: z3=unsat cvc5=unsat
negative_no_common_omission: z3=unsat cvc5=unsat
negative_boundary_order: z3=unsat cvc5=unsat
negative_cyclic_separation: z3=unsat cvc5=unsat
positive_direct: z3=sat cvc5=unknown
positive_mirror: z3=sat cvc5=unknown
```

Both live arms remain SAT. The smallest surviving motif is the exact
four-cell adjacent-cap grid: two retained radii, two adjacent closed-cap
sides, one selected hit per cell, sidewise cross-radius disjointness, and a
strict-interior hit on each side. The script's independent read-back validator
passed both SAT models; concrete points and strict marks are in `results.txt`.

This is not Euclidean/universal closure and does not modify Lean or docs.
