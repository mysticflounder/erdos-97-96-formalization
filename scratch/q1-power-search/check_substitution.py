"""Check transformed QQ generators equal original generators under bu=bs+x."""
from pathlib import Path
import re
import sympy as sp

bs, bu, br, bv, bw, x = sp.symbols("bs bu br bv bw x")
def polys(path, names):
    txt = Path(path).read_text()
    out = {}
    for n, rhs in re.findall(r"^poly\s+(\w+)\s*=\s*(.*?);$", txt, re.M):
        if n in names:
            out[n] = sp.expand(sp.sympify(rhs.replace("^", "**"), locals={"bs":bs,"bu":bu,"br":br,"bv":bv,"bw":bw,"x":x}))
    return out

names = {"q1", "e2", "e5", "e7", "e8", "e9"}
orig = polys("scratch/q1-power-search/q1_power_target.singular", names)
shift = polys("scratch/q1-power-search/x_subst_qq.singular", names)
for n in sorted(names):
    got = sp.expand(orig[n].subs({bu: bs + x}, simultaneous=True))
    diff = sp.expand(got - shift[n])
    if diff:
        print("MISMATCH", n, "DIFF=", diff)
        raise SystemExit(1)
print("SUBSTITUTION_CHECK=1 generators=6")
