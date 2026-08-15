# Tri-apex rich deletion survivor audit: interior

Representative SAT model: `(S6, D44, S6)` on the common-x+y arm. The listed survivor is the post-deletion support; D44 requires only one of the two full classes to survive.

```text
tier_interior_matrix_oppApex1-S6_oppApex2-D44_surplusApex-S6_distinct:
oppApex1=S6 deleted=['source0'] class=['source0', 'x0', 'y0', 'qFresh', 'qOther', 'fill3'] survivor=['x0', 'y0', 'qFresh', 'qOther', 'fill3']
oppApex2=D44 deleted=['source0'] class1=['x0', 'x1', 'y0', 'fill1'] class2=['source0', 'source1', 'qOther', 'shellOverlap', 'fill0', 'fill2'] survivor1=['x0', 'x1', 'y0', 'fill1'] survivor2=['source1', 'qOther', 'shellOverlap', 'fill0', 'fill2'] capSlice1=['x0', 'x1', 'y0', 'fill1'] capSlice2=['source1', 'qOther', 'shellOverlap', 'fill0', 'fill2']
surplusApex=S6 deleted=['source0'] class=['source1', 'x1', 'y1', 'qFresh', 'fill1', 'fill2', 'fill3'] survivor=['source1', 'x1', 'y1', 'qFresh', 'fill1', 'fill2', 'fill3'] capSlice=['source1', 'x1', 'y1', 'qFresh', 'fill1', 'fill2', 'fill3']
tier_interior_matrix_oppApex1-S6_oppApex2-D44_surplusApex-S6_equal:
oppApex1=S6 deleted=['y1'] class=['source0', 'x0', 'x1', 'y0', 'qFresh', 'fill1'] survivor=['source0', 'x0', 'x1', 'y0', 'qFresh', 'fill1']
oppApex2=D44 deleted=['y1'] class1=['source0', 'y1', 'qOther', 'fill1'] class2=['source1', 'x1', 'qFresh', 'shellOverlap', 'fill0'] survivor1=['source0', 'qOther', 'fill1'] survivor2=['source1', 'x1', 'qFresh', 'shellOverlap', 'fill0'] capSlice1=['source0', 'qOther', 'fill1'] capSlice2=['source1', 'x1', 'qFresh', 'shellOverlap', 'fill0']
surplusApex=S6 deleted=['y1'] class=['source1', 'x0', 'y1', 'qFresh', 'qOther', 'fill2', 'fill3'] survivor=['source1', 'x0', 'qFresh', 'qOther', 'fill2', 'fill3'] capSlice=['source1', 'x0', 'qFresh', 'qOther', 'fill2', 'fill3']
```

All 16 matrix queries are SAT in both solvers; all 7 controls are UNSAT in both. This remains a bounded diagnostic, not a closure claim.
