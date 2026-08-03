#!/usr/bin/env python3
"""Screen Singular monomial/variable orders for a sparse characteristic-zero certificate."""

from concurrent.futures import ThreadPoolExecutor, as_completed
from itertools import permutations
import subprocess

VARIABLES = ("br", "bs", "bu", "bv", "bw")
POLYS = r"""
poly e2=br^2*bs^3-br^2*bs^2*bu-br^2*bs^2*bv+br^2*bs*bu*bv-br*bs^3*bu+br*bs^2*bu^2+br*bs^2*bu*bv-br*bs*bu^2*bv-br*bs*bu^2*bw+br*bs*bu*bw^2+br*bs*bv^2*bw+br*bu^2*bv*bw-br*bu*bv^2*bw-br*bu*bv*bw^2-bs*bv^2*bw^2+bu*bv^2*bw^2;
poly e5=br^2*bs^3-br^2*bs^2*bu-br^2*bs^2*bv+br^2*bs*bu*bv+br^2*bs*bu-br^2*bu*bv-br*bs^3+br*bs^2*bu+br*bs^2*bv-br*bs*bu^2-br*bs*bu*bv+br*bu^2*bv+bs*bu*bv^2-bs*bv^2-bu^2*bv^2+bu*bv^2;
poly e7=bs^3*bu-bs^3-bs^2*bu^2-bs^2*bu*bv+bs^2*bu+bs^2*bv+bs*bu^2*bv+bs*bu*bv-bs*bu-bs*bv^2-bu^2*bv+bu*bv;
poly e8=bs^2*bv*bw-bs^2*bw^2+bs^2*bw-bs^2-bs*bv^2*bw+bs*bv*bw^2-bs*bv*bw+bs*bv+bv^2*bw-bv*bw;
poly e9=br^2*bv+br*bs^2*bv-br*bs^2-br*bs*bv^2+br*bs*bv-br*bv^2-br*bv+bv^3;
poly q1=bs^3-2*bs^2*bu-bs^2*bw+bs*bu^2+bs*bu*bw+bs*bw^2-bu^2*bw;
ideal H=e2,e5,e7,e8,e9,q1;
poly target=bv^2*bw^3*(bv-1)^2;
matrix T; ideal B=liftstd(H,T); matrix C=lift(B,ideal(target)); matrix D=T*C;
poly check=0; int i; int terms=0; int md=0;
for(i=1;i<=nrows(D);i++){check=check+D[i,1]*H[i]; terms=terms+size(D[i,1]); if(deg(D[i,1])>md){md=deg(D[i,1]);}}
print("RESULT "+string(check==target)+" "+string(terms)+" "+string(md)+" "+string(size(B)));
quit;
"""


def run_case(case):
    order, perm = case
    source = f"ring R=32003,({','.join(perm)}),{order};\n" + POLYS
    try:
        proc = subprocess.run(
            ["/opt/homebrew/bin/Singular", "-q"],
            input=source,
            text=True,
            capture_output=True,
            timeout=180,
        )
    except subprocess.TimeoutExpired:
        return order, perm, "TIMEOUT"
    lines = [line for line in proc.stdout.splitlines() if line.startswith("RESULT ")]
    result = lines[-1] if lines else f"ERROR rc={proc.returncode}"
    return order, perm, result


def main():
    # Graded orders with the target variables last were the only broad-screen
    # family that did not immediately become a multi-gigabyte computation.
    selected = [perm + ("bv", "bw") for perm in permutations(("br", "bs", "bu"))]
    cases = [("dp", perm) for perm in selected]
    with ThreadPoolExecutor(max_workers=1) as pool:
        futures = [pool.submit(run_case, case) for case in cases]
        results = []
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            print(result[0], ",".join(result[1]), result[2], flush=True)
    def key(item):
        fields = item[2].split()
        return int(fields[2]) if len(fields) >= 4 and fields[0] == "RESULT" else 10**12
    print("SORTED", flush=True)
    for order, perm, result in sorted(results, key=key):
        print(order, ",".join(perm), result, flush=True)


if __name__ == "__main__":
    main()
