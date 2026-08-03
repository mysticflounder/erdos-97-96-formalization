from pathlib import Path
import re

root = Path(__file__).parent
sing = root / "verify-localized-g3-product-square-exact.sing"
cert = root / "localized-g3-product-square-certificate-exact-v1.singexpr"
out = root / "LocalizedG3ProductSquareProducer.lean"

def polys(path):
    text = path.read_text()
    return re.findall(r"^poly ([A-Za-z][A-Za-z0-9]*)=(.*);$", text, flags=re.M)

def cert_polys(path):
    text = path.read_text()
    return re.findall(r"^\s*(D[1-6])=(.*);$", text, flags=re.M)

eqs = dict(polys(sing))
ds = dict(cert_polys(cert))
names = ["e2", "e5", "e7", "e8", "e9", "q1"]
dnames = ["D1", "D2", "D3", "D4", "D5", "D6"]
lines = ["import Mathlib", "set_option maxHeartbeats 2000000", "", "example (bv bs bw x y : ℚ) :"]
for n in names + ["P"]:
    expr = eqs[n] if n != "P" else "x*y*bv*bw"
    lines.append(f"  let {n} : ℚ := {expr}")
for n in dnames:
    lines.append(f"  let {n} : ℚ := {ds[n]}")
lines.append("  D1*e2 + D2*e5 + D3*e7 + D4*e8 + D5*e9 + D6*q1 = P^2 := by")
lines.append("  ring")
out.write_text("\n".join(lines) + "\n")
print(f"wrote {out} bytes={out.stat().st_size} eqs={len(eqs)} certs={len(ds)}")
