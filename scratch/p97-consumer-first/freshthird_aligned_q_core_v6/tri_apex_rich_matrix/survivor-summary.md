# Tri-apex rich deletion survivor audit

Representative SAT model: `(S6, D44, S6)` on the common-x+y arm. The listed survivor is the post-deletion support; D44 requires only one of the two full classes to survive.

```text
matrix_oppApex1-S6_oppApex2-D44_surplusApex-S6_distinct:
oppApex1=S6 deleted=['fill3'] class=['source1', 'x0', 'y0', 'qFresh', 'shellOverlap', 'fill3'] survivor=['source1', 'x0', 'y0', 'qFresh', 'shellOverlap']
oppApex2=D44 deleted=['fill3'] class1=['source1', 'y0', 'qOther', 'fill2'] class2=['y1', 'shellOverlap', 'fill0', 'fill3'] survivor1=['source1', 'y0', 'qOther', 'fill2'] survivor2=['y1', 'shellOverlap', 'fill0']
surplusApex=S6 deleted=['fill1'] class=['source0', 'source1', 'y1', 'qFresh', 'qOther', 'fill0', 'fill1'] survivor=['source0', 'source1', 'y1', 'qFresh', 'qOther', 'fill0']
matrix_oppApex1-S6_oppApex2-D44_surplusApex-S6_equal:
oppApex1=S6 deleted=['fill1'] class=['source1', 'qFresh', 'qOther', 'shellOverlap', 'fill0', 'fill1'] survivor=['source1', 'qFresh', 'qOther', 'shellOverlap', 'fill0']
oppApex2=D44 deleted=['fill3'] class1=['source0', 'qFresh', 'qOther', 'fill2'] class2=['x0', 'shellOverlap', 'fill1', 'fill3'] survivor1=['source0', 'qFresh', 'qOther', 'fill2'] survivor2=['x0', 'shellOverlap', 'fill1']
surplusApex=S6 deleted=['fill3'] class=['source0', 'source1', 'x0', 'fill0', 'fill2', 'fill3'] survivor=['source0', 'source1', 'x0', 'fill0', 'fill2']
```

All 16 matrix queries are SAT in both solvers; three negative controls are UNSAT in both. This remains a bounded diagnostic, not a closure claim.
