#!/usr/bin/env python3
"""Generate a Lean scratch proof from the exact Singular H -> U -> G7 certificate."""

from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent
DIRECT = ROOT / "q1_bv1_direct_target.lean"
U_CERT = ROOT / "q1_six_u_exact_lifts.cert"
G7_CERT = ROOT / (
    "atail-force/same-blocker-common-omission-euclidean-v3/"
    "theorem-bank-cegar-audit/crossed-arm-qf-nra-v4/metric-core-miner-v9/"
    "check-h-six-g7.cert"
)
GB_CERT = ROOT / "q1_six_g7_liftstd_columns_v1.cert"
OUT = ROOT / "q1_g7_staged_exact.lean"
TWO_STAGE_OUT = ROOT / "q1_g7_twostage_exact.lean"
U_ONLY_OUT = ROOT / "q1_six_u_exact.lean"

prefix = DIRECT.read_text().split("set_option maxRecDepth", 1)[0]
prefix = prefix.replace("ScratchQ1Bv1DirectTarget", "ScratchQ1G7StagedExact")

u_text = U_CERT.read_text()
blocks = re.findall(
    r"BEGIN U(\d+) P=(.*?);\n(.*?)END U\1 TERMS=\d+ IDENTITY=1;",
    u_text,
    flags=re.S,
)
if len(blocks) != 6:
    raise SystemExit(f"expected 6 U blocks, found {len(blocks)}")

h_names = {1: "p2", 2: "p5", 3: "p7", 4: "p8", 5: "p9", 6: "hq"}


def production_coefficient(row: int, coefficient: str) -> str:
    """Translate the Singular H basis to the production polynomial signs."""
    return f"-({coefficient})" if row == 4 else coefficient


u_defs = []
u_lemmas = []
u_names = []
all_defs = [
    "q1Polynomial", "e2Polynomial", "e5Polynomial", "e7Polynomial",
    "e8Polynomial", "e9Polynomial",
]
for number, polynomial, lifts_text in blocks:
    uname = f"u{number}Polynomial"
    hname = f"hU{number}"
    u_names.append((number, uname, hname))
    all_defs.append(uname)
    u_defs.append(
        f"private def {uname} (br bs bu bv bw : ℂ) : ℂ :=\n  {polynomial}\n"
    )
    lift_rows = re.findall(r"H(\d+)=(.*?);", lifts_text)
    combination = " +\n      ".join(
        f"({production_coefficient(int(row), coefficient)}) * {h_names[int(row)]}"
        for row, coefficient in lift_rows
    )
    u_lemmas.append(f"""
private theorem u{number}OfH
    {{br bs bu bv bw : ℂ}}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    {uname} br bs bu bv bw = 0 := by
  simp only [{', '.join(all_defs[:6])}, {uname}] at *
  linear_combination
      {combination}
""")

g7_rows = {}
for line in G7_CERT.read_text().splitlines():
    match = re.fullmatch(r"C(\d+)=(.*);", line)
    if not match:
        raise SystemExit("malformed G7 certificate line")
    g7_rows[int(match.group(1))] = match.group(2)

row_names = {
    1: "p2", 2: "p5", 3: "p7", 4: "p8", 5: "p9", 6: "hq",
    7: "hU8", 8: "hU24", 9: "hU30", 10: "hU32", 11: "hU34", 12: "hU37",
}
g7_combination = " +\n      ".join(
    f"({production_coefficient(row, g7_rows[row])}) * {row_names[row]}"
    for row in sorted(g7_rows)
)

calls = "\n".join(
    f"  have {hname} := u{number}OfH hq p2 p5 p7 p8 p9"
    for number, _uname, hname in u_names
)

main = f"""
set_option maxRecDepth 10000 in
set_option maxHeartbeats 12000000 in
theorem q1EqZeroG7Staged
    {{br bs bu bv bw : ℂ}}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
{calls}
  simp only [{', '.join(all_defs)}] at *
  linear_combination
      {g7_combination}

end ScratchQ1G7StagedExact
"""

common = prefix + "\n".join(u_defs) + "\n".join(u_lemmas)
U_ONLY_OUT.write_text(common + "\nend ScratchQ1G7StagedExact\n")
OUT.write_text(common + main)

gb_blocks = re.findall(
    r"BEGIN G(\d+) P=(.*?) C=(.*?);\n(.*?)END G\1 TTERMS=\d+;",
    GB_CERT.read_text(),
    flags=re.S,
)
if len(gb_blocks) != 2:
    raise SystemExit(f"expected 2 GB blocks, found {len(gb_blocks)}")

gb_defs = []
gb_lemmas = []
gb_calls = []
gb_final_terms = []
for number, polynomial, final_coefficient, lifts_text in gb_blocks:
    gname = f"g{number}Polynomial"
    hname = f"hG{number}"
    gb_defs.append(
        f"private def {gname} (br bs bu bv bw : ℂ) : ℂ :=\n  {polynomial}\n"
    )
    lift_rows = re.findall(r"S(\d+)=(.*?);", lifts_text)
    combination = " +\n      ".join(
        f"({production_coefficient(int(row), coefficient)}) * {row_names[int(row)]}"
        for row, coefficient in lift_rows
    )
    gb_lemmas.append(f"""
private theorem g{number}OfS
    {{br bs bu bv bw : ℂ}}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0)
    (hU8 : u8Polynomial br bs bu bv bw = 0)
    (hU24 : u24Polynomial br bs bu bv bw = 0)
    (hU30 : u30Polynomial br bs bu bv bw = 0)
    (hU32 : u32Polynomial br bs bu bv bw = 0)
    (hU34 : u34Polynomial br bs bu bv bw = 0)
    (hU37 : u37Polynomial br bs bu bv bw = 0) :
    {gname} br bs bu bv bw = 0 := by
  simp only [{', '.join(all_defs)}, {gname}] at *
  linear_combination
      {combination}
""")
    gb_calls.append(
        f"  have {hname} := g{number}OfS hq p2 p5 p7 p8 p9 hU8 hU24 hU30 hU32 hU34 hU37"
    )
    gb_final_terms.append(f"({final_coefficient}) * {hname}")

two_stage_main = f"""
set_option maxRecDepth 10000
set_option maxHeartbeats 12000000

{''.join(gb_defs)}
{''.join(gb_lemmas)}
set_option maxRecDepth 10000 in
set_option maxHeartbeats 12000000 in
theorem q1EqZeroG7TwoStage
    {{br bs bu bv bw : ℂ}}
    (hq : q1Polynomial bs bu bw = 0)
    (p2 : e2Polynomial br bs bu bv bw = 0)
    (p5 : e5Polynomial br bs bu bv = 0)
    (p7 : e7Polynomial bs bu bv = 0)
    (p8 : e8Polynomial bs bv bw = 0)
    (p9 : e9Polynomial br bs bv = 0) :
    bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
{calls}
{chr(10).join(gb_calls)}
  simp only [{', '.join(all_defs)}, {', '.join(f'g{n}Polynomial' for n, *_ in gb_blocks)}] at *
  linear_combination
      {' + '.join(gb_final_terms)}

end ScratchQ1G7StagedExact
"""
TWO_STAGE_OUT.write_text(common + two_stage_main)
print(
    f"{OUT} bytes={OUT.stat().st_size} U_lemmas={len(blocks)} G7_rows={len(g7_rows)} "
    f"U_only_bytes={U_ONLY_OUT.stat().st_size} TWO_STAGE_bytes={TWO_STAGE_OUT.stat().st_size}"
)
