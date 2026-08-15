# FreshThird aligned Q/core v5 survivor summary

Bounded Z3 model census only; all source clauses come from the v5 diagnostic. No closure claim.

## Representative models

### common-x, mode=distinct
- row0 = {source0,source1,y1,qFresh}
- row1 = {source0,source1,qOther,shellOverlap}
- Q = {x0,x1,qFresh,qOther}
- xShell = {source0,source1,x0,x1}
- yShell = {y0,y1,qOther,shellOverlap}

### common-x, mode=equal
- row0 = {source0,source1,qFresh,shellOverlap}
- row1 = {source0,source1,qFresh,shellOverlap}
- Q = {x0,x1,qFresh,qOther}
- xShell = {source0,source1,x0,x1}
- yShell = {y0,y1,qOther,shellOverlap}

### common-y, mode=distinct
- row0 = {source0,source1,y1,qFresh}
- row1 = {source0,source1,qOther,shellOverlap}
- Q = {x0,x1,qFresh,qOther}
- xShell = {source0,source1,x0,x1}
- yShell = {y0,y1,qFresh,shellOverlap}

### common-y, mode=equal
- row0 = {source0,source1,y1,qFresh}
- row1 = {source0,source1,y1,qFresh}
- Q = {x0,x1,qFresh,qOther}
- xShell = {source0,x0,x1,shellOverlap}
- yShell = {y0,y1,qFresh,qOther}

### common-x+y, mode=distinct
- row0 = {source0,source1,x1,qOther}
- row1 = {source0,source1,y1,qFresh}
- Q = {x0,x1,qFresh,qOther}
- xShell = {source0,x0,x1,shellOverlap}
- yShell = {source1,y0,y1,qOther}

### common-x+y, mode=equal
- row0 = {source0,source1,qOther,shellOverlap}
- row1 = {source0,source1,qOther,shellOverlap}
- Q = {x0,x1,qFresh,qOther}
- xShell = {source0,source1,x0,x1}
- yShell = {y0,y1,qFresh,qOther}

## Cross-survivor membership census

The census covers all 24 arm/mode models.

- row0: always={source0,source1}; never={}; variable={qFresh,qOther,x0,shellOverlap,y0,y1,x1}
- row1: always={source0,source1}; never={}; variable={qFresh,qOther,x0,shellOverlap,y0,y1,x1}
- Q: always={qFresh,x1,x0,qOther}; never={y0,source1,shellOverlap,y1,source0}; variable={}
- xShell: always={x1,x0}; never={qFresh,y1,qOther,y0}; variable={shellOverlap,source0,source1}
- yShell: always={y0,y1}; never={x1,x0}; variable={qFresh,source1,shellOverlap,qOther,source0}

## Structural invariants visible in every model

- row0 and row1 are exact-four supports containing source0 and source1.
- Q is exactly {x0,x1,qFresh,qOther}.
- xShell is exact-four and contains x0,x1; yShell is exact-four and contains y0,y1.
- xShell and yShell are synchronized across core0/core1 and disjoint.
- All source-row/apex-shell and Q/apex-shell intersections are ≤2.
- Equal mode has row0=row1; distinct mode has row0∩row1 of size ≤2.

status=PASS
