#!/usr/bin/env python3
"""Emit Singular inputs for the G3 localization x,y,bv,bw != 0."""
from pathlib import Path
import sympy as sp

ROOT = Path(__file__).resolve().parent
br, bs, bu, bv, bw = sp.symbols("br bs bu bv bw")
x, y = sp.symbols("x y")

lines = (ROOT / "verify-generic-factor-branches-q.out").read_text().splitlines()
src = {}
for line in lines[:6]:
    name, value = line.split("=", 1)
    src[name] = sp.sympify(value.replace("^", "**"))

localized = {
    name: sp.expand(value.subs({bu: bs + x, br: bv + y}))
    for name, value in src.items()
}

def singular(p):
    return str(p).replace("**", "^")

for characteristic, suffix in ((32003, "mod32003"), (0, "exact")):
    out = [f"ring R={characteristic},(bs,bv,bw,x,y,ix,iy,iv,iw),dp;"]
    for name in ("e2", "e5", "e7", "e8", "e9", "q1"):
        out.append(f"poly {name}={singular(localized[name])};")
    out += [
        "poly ux=x*ix-1; poly uy=y*iy-1; poly uv=bv*iv-1; poly uw=bw*iw-1;",
        "ideal H=e2,e5,e7,e8,e9,q1,ux,uy,uv,uw;",
        "option(redSB);",
    ]
    if characteristic == 0:
        out += [
            "matrix C; ideal G=liftstd(H,C);",
            'print("GB_SIZE="+string(size(G))+" CONTAINS_ONE="+string(reduce(1,G)==0));',
            "poly check=0; int terms=0; int md=0; int i;",
            "for(i=1;i<=10;i++){check=check+C[i,1]*H[i]; terms=terms+size(C[i,1]); if(C[i,1]!=0 and deg(C[i,1])>md){md=deg(C[i,1]);}}",
            'print("IDENTITY="+string(check==1)+" TERMS="+string(terms)+" MAXDEG="+string(md));',
            'write("localized-g3-unit-certificate.singexpr","");',
            'for(i=1;i<=10;i++){write("localized-g3-unit-certificate.singexpr","C"+string(i)+"="+string(C[i,1])+";"+newline);}',
        ]
    else:
        out += [
            "ideal G=std(H);",
            'print("GB_SIZE="+string(size(G))+" CONTAINS_ONE="+string(reduce(1,G)==0));',
        ]
    out.append("quit;")
    (ROOT / f"localized-g3-unit-{suffix}.sing").write_text("\n".join(out) + "\n")
    if characteristic != 0:
        lift_out = out[:out.index("ideal G=std(H);")] + [
            "matrix C; ideal G=liftstd(H,C);",
            'print("GB_SIZE="+string(size(G))+" CONTAINS_ONE="+string(reduce(1,G)==0));',
            "poly check=0; int terms=0; int md=0; int i;",
            "for(i=1;i<=10;i++){check=check+C[i,1]*H[i]; terms=terms+size(C[i,1]); if(C[i,1]!=0 and deg(C[i,1])>md){md=deg(C[i,1]);}}",
            'print("IDENTITY="+string(check==1)+" TERMS="+string(terms)+" MAXDEG="+string(md));',
            "for(i=1;i<=10;i++){print(\"C\"+string(i)+\" TERMS=\"+string(size(C[i,1]))+\" DEG=\"+string(deg(C[i,1])));}",
            "quit;",
        ]
        (ROOT / "localized-g3-unit-liftstd-mod32003.sing").write_text("\n".join(lift_out) + "\n")
        subset_out = out[:out.index("ideal H=e2,e5,e7,e8,e9,q1,ux,uy,uv,uw;")] + [
            "ideal A=e2,e5,e7,e8,e9,q1; ideal U=ux,uy,uv,uw; int mask; int j; ideal J; ideal G;",
            "for(mask=1;mask<64;mask++){J=U; for(j=1;j<=6;j++){if((mask div 2^(j-1))%2==1){J[size(J)+1]=A[j];}} G=std(J); if(reduce(1,G)==0){print(\"UNIT MASK=\"+string(mask)+\" INPUTS=\"+string(size(J)));}}",
            "quit;",
        ]
        (ROOT / "localized-g3-unit-subsets-mod32003.sing").write_text("\n".join(subset_out) + "\n")

for name, p in localized.items():
    print(name, "terms", len(sp.Poly(p, bs, bv, bw, x, y).terms()), "degree", sp.total_degree(p), singular(p))

for characteristic, suffix in ((32003, "mod32003"), (0, "exact")):
    out = [f"ring R={characteristic},(bs,bv,bw,x,y,t),dp;"]
    for name in ("e2", "e5", "e7", "e8", "e9", "q1"):
        out.append(f"poly {name}={singular(localized[name])};")
    out += [
        "poly unit=x*y*bv*bw*t-1; ideal H=e2,e5,e7,e8,e9,q1,unit;",
        "option(redSB); matrix C; ideal G=liftstd(H,C);",
        'print("GB_SIZE="+string(size(G))+" CONTAINS_ONE="+string(reduce(1,G)==0));',
        "poly check=0; int terms=0; int md=0; int i;",
        "for(i=1;i<=7;i++){check=check+C[i,1]*H[i]; terms=terms+size(C[i,1]); if(C[i,1]!=0 and deg(C[i,1])>md){md=deg(C[i,1]);}}",
        'print("IDENTITY="+string(check==1)+" TERMS="+string(terms)+" MAXDEG="+string(md));',
        "for(i=1;i<=7;i++){print(\"C\"+string(i)+\" TERMS=\"+string(size(C[i,1]))+\" DEG=\"+string(deg(C[i,1])));}",
    ]
    if characteristic == 0:
        out += [
            'write("localized-g3-product-unit-certificate.singexpr","");',
            'for(i=1;i<=7;i++){write("localized-g3-product-unit-certificate.singexpr","C"+string(i)+"="+string(C[i,1])+";"+newline);}',
        ]
    else:
        out += [
            'write("localized-g3-product-unit-certificate-mod32003.singexpr","");',
            'for(i=1;i<=7;i++){write("localized-g3-product-unit-certificate-mod32003.singexpr","C"+string(i)+"="+string(C[i,1])+";"+newline);}',
        ]
    out.append("quit;")
    (ROOT / f"localized-g3-product-unit-{suffix}.sing").write_text("\n".join(out) + "\n")
    if characteristic != 0:
        subset_out = out[:out.index("poly unit=x*y*bv*bw*t-1; ideal H=e2,e5,e7,e8,e9,q1,unit;")] + [
            "poly unit=x*y*bv*bw*t-1; ideal A=e2,e5,e7,e8,e9,q1; int mask; int j; ideal J; ideal G;",
            "for(mask=1;mask<64;mask++){J=unit; for(j=1;j<=6;j++){if((mask div 2^(j-1))%2==1){J[size(J)+1]=A[j];}} G=std(J); if(reduce(1,G)==0){print(\"UNIT MASK=\"+string(mask)+\" INPUTS=\"+string(size(J)));}}",
            "quit;",
        ]
        (ROOT / "localized-g3-product-unit-subsets-mod32003.sing").write_text("\n".join(subset_out) + "\n")

for suffix, characteristic in (("mod32003", 32003), ("exact", 0)):
    path = ROOT / f"localized-g3-product-unit-{suffix}.sing"
    rows = path.read_text().splitlines()
    rows[0] = f"ring R={characteristic},(t,bv,bs,bw,x,y),dp;"
    (ROOT / f"localized-g3-product-unit-bestorder-{suffix}.sing").write_text("\n".join(rows) + "\n")
    if characteristic == 0:
        verify = rows[:rows.index("option(redSB); matrix C; ideal G=liftstd(H,C);")] + [
            'execute(read("localized-g3-product-unit-certificate-reconstructed.singexpr"));',
            "poly check=C1*H[1]+C2*H[2]+C3*H[3]+C4*H[4]+C5*H[5]+C6*H[6]+C7*H[7];",
            'print("INDEPENDENT_IDENTITY="+string(check==1));',
            "quit;",
        ]
        (ROOT / "verify-localized-g3-product-unit-exact.sing").write_text("\n".join(verify) + "\n")

for characteristic, suffix in ((32003, "mod32003"), (0, "exact")):
    out = [f"ring R={characteristic},(bv,bs,bw,x,y),dp;"]
    for name in ("e2", "e5", "e7", "e8", "e9", "q1"):
        out.append(f"poly {name}={singular(localized[name])};")
    out += [
        "ideal H=e2,e5,e7,e8,e9,q1; poly target=(x*y*bv*bw)^2;",
        "matrix C=lift(H,ideal(target)); poly check=0; int terms=0; int md=0; int i;",
        "for(i=1;i<=6;i++){check=check+C[i,1]*H[i]; terms=terms+size(C[i,1]); if(C[i,1]!=0 and deg(C[i,1])>md){md=deg(C[i,1]);}}",
        'print("IDENTITY="+string(check==target)+" TERMS="+string(terms)+" MAXDEG="+string(md));',
        "for(i=1;i<=6;i++){print(\"C\"+string(i)+\" TERMS=\"+string(size(C[i,1]))+\" DEG=\"+string(deg(C[i,1])));}",
    ]
    if characteristic == 0:
        out += [
            'write("localized-g3-square-certificate.singexpr","");',
            'for(i=1;i<=6;i++){write("localized-g3-square-certificate.singexpr","C"+string(i)+"="+string(C[i,1])+";"+newline);}',
        ]
    out.append("quit;")
    (ROOT / f"localized-g3-square-{suffix}.sing").write_text("\n".join(out) + "\n")
