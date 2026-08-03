from pathlib import Path
import re

root = Path(__file__).parent
cert = root / "localized-g3-product-square-certificate-exact-v1.singexpr"
out = root / "audit_factor_g3.sing"
text = cert.read_text()
rows = re.findall(r"^\s*(D[1-6])=(.*);$", text, flags=re.M)
lines = ["ring R=0,(bv,bs,bw,x,y),dp;"]
for name, expr in rows:
    lines.append(f"poly {name}={expr};")
    lines.append(f"poly Q{name}={name}/(bv*bw*x);")
    lines.append(f"print(\"{name} terms=\"); print(size(Q{name}));")
    lines.append(f"print(\"{name} factors=\"); factorize(Q{name});")
for i, left in enumerate(name for name, _ in rows):
    for right in [name for name, _ in rows][i + 1:]:
        lines.append(f"poly G{left}{right}=gcd(Q{left},Q{right}); print(\"gcd {left},{right} terms=\"); print(size(G{left}{right}));")
lines += [
    "proc ev(poly f, int a, int b, int c, int d, int e)",
    "{ poly t=f; t=subst(t,bv,a); t=subst(t,bs,b); t=subst(t,bw,c); t=subst(t,x,d); t=subst(t,y,e); return(t); }",
    "matrix M[6][6];",
]
points = [(1, 2, 3, 5, 7), (2, 3, 5, 7, 11), (3, 5, 7, 11, 13),
          (5, 7, 11, 13, 17), (7, 11, 13, 17, 19), (11, 13, 17, 19, 23)]
for i, point in enumerate(points, 1):
    for j, (name, _) in enumerate(rows, 1):
        lines.append(f"M[{i},{j}]=ev(Q{name},{','.join(map(str, point))});")
lines += ["print(\"evaluation determinant=\"); print(det(M));"]
out.write_text("\n".join(lines) + "\n")
print(f"wrote {out} bytes={out.stat().st_size} rows={len(rows)}")
