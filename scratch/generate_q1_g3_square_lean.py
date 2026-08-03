from pathlib import Path

root = Path("scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra-v4/metric-core-miner-v9")
src = root / "localized-g3-product-square-certificate-exact-v1.singexpr"
defs = {}
for raw in src.read_text().splitlines():
    raw = raw.strip()
    if not raw:
        continue
    name, expr = raw.split("=", 1)
    defs[name] = expr.rstrip(";")

shifted = {
    "e2Shift": "-bs^3*bv*bw + bs^3*bv*x - bs^3*bw*y + bs^3*x*y + bs^2*bv^2*bw - 2*bs^2*bv^2*x + bs^2*bv*bw^2 - 2*bs^2*bv*bw*x + bs^2*bv*bw*y + bs^2*bv*x^2 - 3*bs^2*bv*x*y + bs^2*bw^2*y - 2*bs^2*bw*x*y + bs^2*x^2*y - bs^2*x*y^2 + bs*bv^3*x - bs*bv^2*bw^2 + 2*bs*bv^2*bw*x - bs*bv^2*x^2 + 2*bs*bv^2*x*y + bs*bv*bw^2*x - bs*bv*bw^2*y - bs*bv*bw*x^2 + 2*bs*bv*bw*x*y - bs*bv*x^2*y + bs*bv*x*y^2 + bs*bw^2*x*y - bs*bw*x^2*y - bv^3*bw*x + bv^2*bw*x^2 - bv^2*bw*x*y - bv*bw^2*x*y + bv*bw*x^2*y",
    "e5Shift": "-bs^3*bv - bs^3*y - bs^2*bv^2*x + 2*bs^2*bv^2 - 2*bs^2*bv*x*y - bs^2*bv*x + 3*bs^2*bv*y - bs^2*x*y^2 - bs^2*x*y + bs^2*y^2 + bs*bv^3*x - bs*bv^3 + 2*bs*bv^2*x*y + bs*bv^2*x - 2*bs*bv^2*y - bs*bv*x^2 + bs*bv*x*y^2 + 3*bs*bv*x*y - bs*bv*y^2 - bs*x^2*y + bs*x*y^2 - bv^3*x - 2*bv^2*x*y + bv^2*x + bv*x^2*y - bv*x*y^2",
    "e7Shift": "-bs^3*x + bs^2*bv*x + bs^2*bv - bs^2*x^2 + bs^2*x - bs^2 - bs*bv^2 + bs*bv*x^2 - bs*bv*x + bs*bv - bs*x - bv*x^2 + bv*x",
    "e8Shift": "-bs^2*bv*bw + bs^2*bw^2 - bs^2*bw + bs^2 + bs*bv^2*bw - bs*bv*bw^2 + bs*bv*bw - bs*bv - bv^2*bw + bv*bw",
    "e9Shift": "bs^2*bv^2 + bs^2*bv*y - bs^2*bv - bs^2*y - bs*bv^3 - bs*bv^2*y + bs*bv^2 + bs*bv*y + bv^3 + bv^2*y - bv^2 + bv*y^2 - bv*y",
    "q1Shift": "-bs^2*bw + bs*bw^2 - bs*bw*x + bs*x^2 - bw*x^2",
}

out = Path("scratch/q1_g3_square_certificate.lean")
with out.open("w") as f:
    f.write("import Erdos9796Proof.P97.Census554.EqualityCore\n\n")
    f.write("namespace Problem97\nnamespace Q1G3SquareScratch\n\n")
    f.write("set_option maxHeartbeats 12000000\nset_option maxRecDepth 100000\n\n")
    for name, expr in shifted.items():
        f.write(f"def {name} (bs bv bw x y : ℂ) : ℂ := {expr}\n\n")
    for name in ("D1", "D2", "D3", "D4", "D5", "D6"):
        f.write(f"def {name} (bs bv bw x y : ℂ) : ℂ := {defs[name]}\n\n")
    f.write("set_option maxHeartbeats 12000000 in\n")
    f.write("set_option maxRecDepth 100000 in\n")
    f.write("theorem q1G3SquareShifted\n")
    f.write("    {bs bv bw x y : ℂ}\n")
    f.write("    (he2 : e2Shift bs bv bw x y = 0)\n")
    f.write("    (he5 : e5Shift bs bv bw x y = 0)\n")
    f.write("    (he7 : e7Shift bs bv bw x y = 0)\n")
    f.write("    (he8 : e8Shift bs bv bw x y = 0)\n")
    f.write("    (he9 : e9Shift bs bv bw x y = 0)\n")
    f.write("    (hq1 : q1Shift bs bv bw x y = 0) :\n")
    f.write("    (x * y * bv * bw) ^ 2 = 0 := by\n")
    f.write("  linear_combination\n")
    f.write("    D1 bs bv bw x y * he2 + D2 bs bv bw x y * he5\n")
    f.write("      + D3 bs bv bw x y * he7 + D4 bs bv bw x y * he8\n")
    f.write("      + D5 bs bv bw x y * he9 + D6 bs bv bw x y * hq1\n\n")
    f.write("end Q1G3SquareScratch\nend Problem97\n")
print(out)
