# Exact 12-branch Euclidean projection audit

| coincidence arm | residual arm | exact verdict | first-apex radii² | named row occupancy |
|---|---|---|---|---|
| A=b1 | third | EXACT_RATIONAL_WITNESS | 25, 36 | A: a2,a1; B: b2,A/b1; C: t2,t1 |
| A=b1 | outside-first | EXACT_RATIONAL_WITNESS | 25, 36 | A: o,a2,a1,x; B: b2,A/b1 |
| A=b1 | outside-second | EXACT_RATIONAL_WITNESS | 25, 36 | A: a2,a1; B: o,b2,x,A/b1 |
| A=b2 | third | EXACT_RATIONAL_WITNESS | 25, 36 | A: a2,a1; B: b1,A/b2; C: t2,t1 |
| A=b2 | outside-first | EXACT_RATIONAL_WITNESS | 25, 36 | A: o,a2,a1,x; B: b1,A/b2 |
| A=b2 | outside-second | EXACT_RATIONAL_WITNESS | 25, 36 | A: a2,a1; B: o,b1,x,A/b2 |
| B=a1 | third | EXACT_RATIONAL_WITNESS | 25, 169 | A: a2,B/a1; B: b2,b1; C: t2,t1 |
| B=a1 | outside-first | EXACT_RATIONAL_WITNESS | 25, 169 | A: a2,o,x,B/a1; B: b2,b1 |
| B=a1 | outside-second | EXACT_RATIONAL_WITNESS | 25, 169 | A: a2,B/a1; B: o,b2,b1,x |
| B=a2 | third | EXACT_RATIONAL_WITNESS | 25, 169 | A: a1,B/a2; B: b2,b1; C: t2,t1 |
| B=a2 | outside-first | EXACT_RATIONAL_WITNESS | 25, 169 | A: a1,o,x,B/a2; B: b2,b1 |
| B=a2 | outside-second | EXACT_RATIONAL_WITNESS | 25, 169 | A: a1,B/a2; B: o,b2,b1,x |

Verdict scope: each row is an explicit rational-coordinate witness for the
named Euclidean projection listed in `README.md`. It is not a model of
`CounterexampleData`, the cap order, all four-point supports, deletion
robustness, minimality, `noM44`, or the tri-apex residual.
