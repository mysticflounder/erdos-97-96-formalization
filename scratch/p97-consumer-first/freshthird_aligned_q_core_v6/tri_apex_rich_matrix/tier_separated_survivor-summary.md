# Tri-apex rich deletion survivor audit: separated

Representative SAT model: `(S6, D44, S6)` on the common-x+y arm. The listed survivor is the post-deletion support; D44 requires only one of the two full classes to survive.

```text
tier_separated_matrix_oppApex1-S6_oppApex2-D44_surplusApex-S6_distinct:
oppApex1=S6 deleted=['source1'] class=['source0', 'x1', 'y1', 'qFresh', 'qOther', 'shellOverlap'] survivor=['source0', 'x1', 'y1', 'qFresh', 'qOther', 'shellOverlap']
oppApex2=D44 deleted=['source1'] class1=['source0', 'source1', 'x1', 'y0', 'fill0'] class2=['x0', 'qFresh', 'qOther', 'fill1', 'fill2'] survivor1=['source0', 'x1', 'y0', 'fill0'] survivor2=['x0', 'qFresh', 'qOther', 'fill1', 'fill2'] capSlice1=['x1', 'y0'] capSlice2=['x0', 'qFresh']
surplusApex=S6 deleted=['source1'] class=['source1', 'y1', 'shellOverlap', 'fill0', 'fill1', 'fill2', 'fill3'] survivor=['y1', 'shellOverlap', 'fill0', 'fill1', 'fill2', 'fill3'] capSlice=['y1', 'shellOverlap', 'fill0', 'fill1', 'fill2', 'fill3']
tier_separated_matrix_oppApex1-S6_oppApex2-D44_surplusApex-S6_equal:
oppApex1=S6 deleted=['source0'] class=['source1', 'x1', 'y1', 'qOther', 'shellOverlap', 'fill2'] survivor=['source1', 'x1', 'y1', 'qOther', 'shellOverlap', 'fill2']
oppApex2=D44 deleted=['source0'] class1=['source0', 'source1', 'qFresh', 'shellOverlap', 'fill1'] class2=['x0', 'x1', 'y0', 'qOther'] survivor1=['source1', 'qFresh', 'shellOverlap', 'fill1'] survivor2=['x0', 'x1', 'y0', 'qOther'] capSlice1=['shellOverlap', 'fill1'] capSlice2=['x1', 'qOther']
surplusApex=S6 deleted=['source0'] class=['source0', 'x0', 'y0', 'y1', 'qFresh', 'fill0', 'fill2', 'fill3'] survivor=['x0', 'y0', 'y1', 'qFresh', 'fill0', 'fill2', 'fill3'] capSlice=['x0', 'y0', 'y1', 'qFresh', 'fill0', 'fill2', 'fill3']
```

All 16 matrix queries are SAT in both solvers; all 9 controls are UNSAT in both. This remains a bounded diagnostic, not a closure claim.
