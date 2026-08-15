# Tri-apex rich deletion survivor audit: common

Representative SAT model: `(S6, D44, S6)` on the common-x+y arm. The listed survivor is the post-deletion support; D44 requires only one of the two full classes to survive.

```text
tier_common_matrix_oppApex1-S6_oppApex2-D44_surplusApex-S6_distinct:
oppApex1=S6 deleted=['y0'] class=['source0', 'source1', 'y0', 'qFresh', 'qOther', 'fill3'] survivor=['source0', 'source1', 'qFresh', 'qOther', 'fill3']
oppApex2=D44 deleted=['y0'] class1=['source0', 'source1', 'fill1', 'fill2'] class2=['x0', 'qFresh', 'qOther', 'shellOverlap', 'fill0'] survivor1=['source0', 'source1', 'fill1', 'fill2'] survivor2=['x0', 'qFresh', 'qOther', 'shellOverlap', 'fill0']
surplusApex=S6 deleted=['y0'] class=['x0', 'y0', 'fill0', 'fill1', 'fill2', 'fill3'] survivor=['x0', 'fill0', 'fill1', 'fill2', 'fill3']
tier_common_matrix_oppApex1-S6_oppApex2-D44_surplusApex-S6_equal:
oppApex1=S6 deleted=['fill3'] class=['source1', 'y1', 'qFresh', 'qOther', 'shellOverlap', 'fill0'] survivor=['source1', 'y1', 'qFresh', 'qOther', 'shellOverlap', 'fill0']
oppApex2=D44 deleted=['fill3'] class1=['source0', 'qFresh', 'qOther', 'fill1', 'fill3'] class2=['source1', 'x0', 'shellOverlap', 'fill2'] survivor1=['source0', 'qFresh', 'qOther', 'fill1'] survivor2=['source1', 'x0', 'shellOverlap', 'fill2']
surplusApex=S6 deleted=['fill3'] class=['source0', 'x0', 'y1', 'fill0', 'fill2', 'fill3'] survivor=['source0', 'x0', 'y1', 'fill0', 'fill2']
```

All 16 matrix queries are SAT in both solvers; all 5 controls are UNSAT in both. This remains a bounded diagnostic, not a closure claim.
