#!/usr/bin/env python3
"""Extract the 18 unimported sibling-bank U1 consumer surfaces.

Sources:
  - certificates/p97_rvol_general_n_mining.md  (authoritative list of the 18)
  - certificates/p97_rvol_general_n_mining.json (statement text per declaration)
  - sibling source files under ~/projects/math-projects/p97-rvol (cross-check)

Output: bank_surfaces.json — per consumer, the exact hypothesis surface parsed
field-by-field into atoms:
  hfixed     : U3FixedTriplePacket arg order
  packet     : RowSlotLabelPacket requirement (always present)
  all8       : whether AllEightSlotMetricCore packet is required (expanded)
  placements : [(lhs, row_source, slot)] from hocc_*/hfix_* hypotheses
  hrows      : [(name, center, member, base)] from hrow_* hypotheses
"""
import json
import re
import sys
from pathlib import Path

REPO = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization")
SIBLING = Path("/Users/adam/projects/math-projects/p97-rvol")
OUT = REPO / "scratch/live-bank-match/bank_surfaces.json"

# The 18 unimported consumers, exactly as listed in
# certificates/p97_rvol_general_n_mining.md "Unimported Contradiction Consumers"
# (u1TwoLargeCapObstruction excluded: different family, not a row-slot consumer).
UNIMPORTED_18 = [
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal002.lean", 744,
     "cert_00002_2e15afed885f93cb_false_of_row_slot_packet"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal012.lean", 740,
     "cert_00012_09f8848e88550951_false_of_row_slot_packet"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal040.lean", 736,
     "cert_00040_0226817ca7c08b07_false_of_row_slot_packet"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal047.lean", 736,
     "cert_00047_15a8d1eeea964671_false_of_row_slot_packet"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal047.lean", 778,
     "cert_00047_15a8d1eeea964671_branch_00000_false_of_all8_slot_metric_core"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal088.lean", 744,
     "cert_00088_01033d22033a54f1_false_of_row_slot_packet"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal088.lean", 786,
     "cert_00088_01033d22033a54f1_branch_00000_false_of_all8_slot_metric_core"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal088.lean", 908,
     "cert_00088_01033d22033a54f1_branch_00001_false_of_all8_slot_metric_core"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal136.lean", 740,
     "cert_00136_00e18ed96771f88a_false_of_row_slot_packet"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal169.lean", 740,
     "cert_00169_0682ec22d1827c59_false_of_row_slot_packet"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal169.lean", 782,
     "cert_00169_0682ec22d1827c59_branch_00000_false_of_all8_slot_metric_core"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal169.lean", 1027,
     "cert_00169_0682ec22d1827c59_branch_00002_false_of_all8_slot_metric_core"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal169.lean", 1519,
     "cert_00169_0682ec22d1827c59_branch_00006_false_of_all8_slot_metric_core"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal169.lean", 1764,
     "cert_00169_0682ec22d1827c59_branch_00008_false_of_all8_slot_metric_core"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal206.lean", 736,
     "cert_00206_000e6b5dd2d132e1_false_of_row_slot_packet"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal206.lean", 778,
     "cert_00206_000e6b5dd2d132e1_branch_00000_false_of_all8_slot_metric_core"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal206.lean", 900,
     "cert_00206_000e6b5dd2d132e1_branch_00001_false_of_all8_slot_metric_core"),
    ("lean/RVOL/P97/U1Depth5SourceUnitQT3Ordinal206.lean", 1022,
     "cert_00206_000e6b5dd2d132e1_branch_00002_false_of_all8_slot_metric_core"),
]

LABELS = {"p", "q", "t1", "t2", "t3", "f1", "f2", "f3", "f4", "f5"}


def extract_source_statement(path: Path, line: int, name: str) -> str:
    """Read the theorem statement text from the sibling source file.

    Statement = from `theorem <name>` up to the trailing `: False := by` (or
    `:= by`), whichever terminator appears first at declaration level.
    """
    lines = path.read_text().splitlines()
    idx = line - 1
    head = lines[idx]
    assert name in head, f"{path}:{line} does not contain {name}: {head!r}"
    buf = []
    for cur in lines[idx:]:
        buf.append(cur)
        if ":= by" in cur or cur.rstrip().endswith(":="):
            break
    text = "\n".join(buf)
    # cut at the := by
    cut = text.find(":= by")
    if cut == -1:
        cut = text.rfind(":=")
    return text[:cut]


def normalize(text: str) -> str:
    text = re.sub(r"\s+", " ", text).strip()
    return text


def split_binders(stmt: str) -> list[str]:
    """Split a normalized theorem statement into top-level (...) binder groups."""
    binders = []
    depth = 0
    start = None
    for i, ch in enumerate(stmt):
        if ch == "(":
            if depth == 0:
                start = i
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0 and start is not None:
                binders.append(stmt[start + 1 : i])
                start = None
    return binders


def strip_ns(s: str) -> str:
    s = s.replace("U1Depth5.", "").replace("Problem97.", "")
    return s


HROW_RE = re.compile(
    r"^(hrow_\d+)\s*:\s*dist \(packet\.point (\w+)\) \(packet\.point (\w+)\)"
    r"\s*=\s*dist \(packet\.point (\w+)\) \(packet\.point (\w+)\)$"
)
# placements: two shapes
#   hfix_X_R_S : <base label var> = ((packet.rows.rowAt CriticalSource.R).slotPoint S)
#   hocc_fK_R_S : packet.rows.pointOfChoice packet.fKChoice = ((...rowAt CriticalSource.R).slotPoint S)
FIX_RE = re.compile(
    r"^(hfix_\w+)\s*:\s*(\w+)\s*=\s*\(\(packet\.rows\.rowAt CriticalSource\.(\w+)\)\.slotPoint (\d)\)$"
)
OCC_RE = re.compile(
    r"^(hocc_\w+)\s*:\s*packet\.rows\.pointOfChoice packet\.(f\d)Choice\s*=\s*"
    r"\(\(packet\.rows\.rowAt CriticalSource\.(\w+)\)\.slotPoint (\d)\)$"
)

VAR2LABEL = {
    "baseP": "p", "baseQ": "q", "baseT1": "t1", "baseT2": "t2",
    "baseT3": "t3", "selectedU": "f1",
}

# AllEightSlotMetricCore expanded (from p97-rvol U1Depth5Prefix.lean:2769,
# identical field list; centers are the packet labels f1, q, t1; members are
# row slots of the SAME source row; base is slot 0 of that row):
ALL8_FIELDS = [
    {"field": "hslot_f1_f3_f2", "center": "f1", "row": "f1", "member_slot": 1, "base_slot": 0},
    {"field": "hslot_f1_f4_f2", "center": "f1", "row": "f1", "member_slot": 2, "base_slot": 0},
    {"field": "hslot_f1_p_f2",  "center": "f1", "row": "f1", "member_slot": 3, "base_slot": 0},
    {"field": "hslot_q_t1_f1",  "center": "q",  "row": "q",  "member_slot": 2, "base_slot": 0},
    {"field": "hslot_q_t2_f1",  "center": "q",  "row": "q",  "member_slot": 3, "base_slot": 0},
    {"field": "hslot_t1_p_f1",  "center": "t1", "row": "t1", "member_slot": 1, "base_slot": 0},
    {"field": "hslot_t1_q_f1",  "center": "t1", "row": "t1", "member_slot": 2, "base_slot": 0},
    {"field": "hslot_t1_t3_f1", "center": "t1", "row": "t1", "member_slot": 3, "base_slot": 0},
]


def parse_consumer(name: str, stmt_norm: str) -> dict:
    stmt = strip_ns(stmt_norm)
    binders = split_binders(stmt)
    out = {
        "name": name,
        "hfixed": None,
        "packet": None,
        "all8": False,
        "all8_fields": [],
        "placements": [],
        "hrows": [],
        "unparsed": [],
    }
    for b in binders:
        b = normalize(b)
        if b.startswith("hfixed"):
            m = re.match(r"hfixed\s*:\s*U3FixedTriplePacket D (\w+) (\w+) (\w+) (\w+) (\w+)$", b)
            assert m, b
            out["hfixed"] = [VAR2LABEL[g] for g in m.groups()]
            continue
        if b.startswith("packet"):
            m = re.match(r"packet\s*:\s*RowSlotLabelPacket D (\w+) (\w+) (\w+) (\w+) (\w+) (\w+)$", b)
            assert m, b
            out["packet"] = [VAR2LABEL[g] for g in m.groups()]
            continue
        if b.startswith("hall8"):
            assert re.match(r"hall8\s*:\s*RowSlotLabelPacket\.AllEightSlotMetricCore packet$", b), b
            out["all8"] = True
            out["all8_fields"] = ALL8_FIELDS
            continue
        m = HROW_RE.match(b)
        if m:
            nm, c1, member, c2, base = m.groups()
            assert c1 == c2, b
            assert {c1, member, base} <= LABELS, b
            out["hrows"].append({"name": nm, "center": c1, "member": member, "base": base})
            continue
        m = FIX_RE.match(b)
        if m:
            nm, var, row, slot = m.groups()
            out["placements"].append(
                {"name": nm, "kind": "fix", "lhs": VAR2LABEL[var],
                 "row": row, "slot": int(slot)})
            continue
        m = OCC_RE.match(b)
        if m:
            nm, fchoice, row, slot = m.groups()
            out["placements"].append(
                {"name": nm, "kind": "occ", "lhs": f"{fchoice}Choice",
                 "row": row, "slot": int(slot)})
            continue
        out["unparsed"].append(b)
    return out


def main() -> None:
    census = json.loads((REPO / "certificates/p97_rvol_general_n_mining.json").read_text())
    decls = census["candidate_declarations"]
    by_name = {}
    for d in decls:
        by_name.setdefault(d["name"], []).append(d)

    consumers = []
    errors = []
    for relpath, line, name in UNIMPORTED_18:
        recs = by_name.get(name)
        assert recs, f"census JSON missing {name}"
        stmts = {normalize(r["statement"]) for r in recs}
        assert len(stmts) == 1, f"conflicting census statements for {name}"
        census_stmt = stmts.pop()
        # cross-check census line/path
        rec = recs[0]
        assert rec["path"] == relpath and rec["line"] == line, (
            f"census path/line mismatch for {name}: {rec['path']}:{rec['line']}")
        # cross-check against sibling source text
        src_stmt = normalize(extract_source_statement(SIBLING / relpath, line, name))
        cs = census_stmt.replace("theorem " + name, "").strip()
        ss = src_stmt.replace("theorem " + name, "").strip()
        # census statements normalize some whitespace/paren details; compare
        # after removing all whitespace
        if re.sub(r"\s", "", cs.replace(": False", "")) != re.sub(r"\s", "", ss.rstrip(": Fals e").rstrip()):
            # do a softer check: identical binder multiset
            cb = sorted(normalize(x) for x in split_binders(strip_ns(cs)))
            sb = sorted(normalize(x) for x in split_binders(strip_ns(ss)))
            if cb != sb:
                errors.append({"name": name, "census_only": [x for x in cb if x not in sb],
                               "source_only": [x for x in sb if x not in cb]})
        parsed = parse_consumer(name, census_stmt)
        m = re.match(r"cert_(\d+)_", name)
        parsed["ordinal"] = int(m.group(1))
        parsed["kind"] = ("all8_slot_metric_core" if "all8" in name else "row_slot_packet")
        parsed["path"] = relpath
        parsed["line"] = line
        parsed["statement"] = census_stmt
        # derived summary
        centers = sorted({h["center"] for h in parsed["hrows"]})
        if parsed["all8"]:
            centers = sorted(set(centers) | {f["center"] for f in ALL8_FIELDS})
        parsed["required_centers"] = centers
        consumers.append(parsed)

    unparsed = [(c["name"], c["unparsed"]) for c in consumers if c["unparsed"]]
    result = {
        "source_commit_p97_rvol": "3380775eba572be83f40166403c3c2d631af9389",
        "census": "certificates/p97_rvol_general_n_mining.json",
        "n_consumers": len(consumers),
        "cross_check_errors": errors,
        "consumers": consumers,
    }
    OUT.write_text(json.dumps(result, indent=2))
    print(f"wrote {OUT}: {len(consumers)} consumers")
    if errors:
        print("CROSS-CHECK ERRORS:", json.dumps(errors, indent=2))
        sys.exit(1)
    if unparsed:
        print("UNPARSED BINDERS:", unparsed)
        sys.exit(1)
    for c in consumers:
        print(f"  {c['name']}: hrows={len(c['hrows'])} placements={len(c['placements'])} "
              f"all8={c['all8']} centers={c['required_centers']}")


if __name__ == "__main__":
    main()
