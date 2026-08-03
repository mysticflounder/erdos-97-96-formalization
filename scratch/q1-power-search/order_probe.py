"""Generate reduced Singular probes for several variable orders."""
from pathlib import Path
src = Path("scratch/q1-power-search/x_subst_qq.singular").read_text()
start = src.index("option(redSB);")
# Retain generator definitions through H, then perform std/lift only.
body = src[start:src.index("matrix Tmat;")]
body = body.replace("ideal H=e2,e5,e7,e8,e9,q1;", "ideal H=e2,e5,e7,e8,e9,q1;")
tail = '''
ideal G=std(H);
poly target=x^8*bv^2*bw;
poly rem=reduce(target,G);
print("ORDER_BASIS_SIZE="+string(size(G))+" ORDER_REM_ZERO="+string(rem==0));
matrix C=lift(G,ideal(target));
int i; int nz=0; int total=0; int mx=0;
for(i=1;i<=nrows(C);i++){if(C[i,1]!=0){int t=size(C[i,1]);nz=nz+1;total=total+t;if(t>mx){mx=t;}}}
print("ORDER_LIFT_NZ="+string(nz)+" ORDER_LIFT_TERMS="+string(total)+" ORDER_LIFT_MAXTERMS="+string(mx));
for(i=1;i<=nrows(C);i++){if(C[i,1]!=0){print("CROW "+string(i)+" CTERMS="+string(size(C[i,1]))+" G="+string(G[i])+" C="+string(C[i,1]));}}
quit;
'''
orders = {
  "br_bs_x_bv_bw": "(br,bs,x,bv,bw)",
  "x_br_bs_bv_bw": "(x,br,bs,bv,bw)",
  "br_x_bs_bv_bw": "(br,x,bs,bv,bw)",
  "br_bs_bv_bw_x": "(br,bs,bv,bw,x)",
  "bw_bv_x_bs_br": "(bw,bv,x,bs,br)",
}
for name, order in orders.items():
    text = body.replace("ring R=0,(br,bs,x,bv,bw),dp;", f"ring R=0,{order},dp;") + tail
    Path(f"scratch/q1-power-search/order_{name}.singular").write_text(text)
print("GENERATED", len(orders))
