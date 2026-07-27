#!/usr/bin/env python3
"""Generate the bounded P4 retained-Kalmanson occurrence bridge.

The compact ledger is authoritative for the emitted DIMACS clauses.  The
input-core map's unique `schema_orientation_candidates` field is authoritative
for the source schema/orientation.  Candidate provenance is deliberately not
used to select a schema: it may contain more than one historical witness.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from itertools import combinations
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
MAP = ROOT / "scratch/atail-force/unique4-exact-two-core-map/p4.input-core-map.json"
SOURCE = ROOT / "scratch/atail-force/unique4-exact-two-core-map/p4.input-core.cnf"
COMPACT = ROOT / "scratch/atail-force/unique4-exact-two-core-map/generated/p4-seed0-compact"
MANIFEST = COMPACT / "p4-seed0-compact-manifest.json"
LEDGER = COMPACT / "p4-seed0-compact-occurrences.jsonl"
CNF = COMPACT / "p4-seed0-compact.cnf"
OUT = HERE / "generated"

FAMILY = "verified_kalmanson_order_schema_cut"
FIRST, LAST = 6467, 8373
SOURCE_FIRST, SOURCE_LAST = 27352, 29258
CHUNK_SIZE = 128
EXPECTED = {
    "formula": "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae",
    "ledger": "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac",
    "source": "739a55ce7a818cbcdfb8c9fa0731b19b564933e546c303b17c2366871078241b",
    "map": "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b",
    "stable": "8d5b8f5adf40cda367e7e7f72f6afc58e75201011e140ff198ace1c836521dd1",
}
EXPECTED_WINDOWS = {
    "compact_window": "4891dac3b1630c85cad7227add2d42178c3f94326a72647bc11aae5b9dd10f70",
    "ledger_window": "41a03f8a0ed14364d11c12778aa7d3cb4228185d3a2e7a0fc45cdc07e80b432a",
    "source_window": "ab08792ac52be3ddb99b35eeb6a081f6277c8c5dfd11c7eb9742940bb3ef4f3e",
}

# These two entries use the generic normalized schema-5 terminal rather than
# `retainedBankSchemas`.  Keep their exact compact/source records here so the
# exceptional route cannot silently widen or move.
EXPECTED_SCHEMA5_FORWARD = [
    {"output": 7721, "source": 28606, "schema": "kalmanson:index:5",
     "orientation": "forward",
     "dense_literals": [-100, -95, -104, -23, -24, -110, -50, -49, -30],
     "source_literals": [-110, -104, -114, -26, -27, -120, -55, -54, -33]},
    {"output": 7722, "source": 28607, "schema": "kalmanson:index:5",
     "orientation": "forward",
     "dense_literals": [-79, -78, -94, -27, -99, -89, -88, -29, -23],
     "source_literals": [-87, -86, -103, -30, -108, -98, -96, -32, -26]},
]

# This is the exact retained-bank order in IndexedSourceValuation.lean.
SLOTS = {
    (0, "forward"): ("schema0Forward", 6, [(0, 1), (0, 2), (4, 1), (4, 3), (5, 2), (5, 3)]),
    (0, "reflected"): ("schema0Reflected", 6, [(5, 4), (5, 3), (1, 4), (1, 2), (0, 3), (0, 2)]),
    (1, "forward"): ("schema1Forward", 6, [(0, 1), (0, 3), (4, 2), (4, 3), (5, 1), (5, 2)]),
    (1, "reflected"): ("schema1Reflected", 6, [(5, 4), (5, 2), (1, 3), (1, 2), (0, 4), (0, 3)]),
    (2, "forward"): ("schema2Forward", 4, [(0, 1), (0, 2), (1, 2), (1, 3), (2, 1), (2, 3)]),
    (2, "reflected"): ("schema2Reflected", 4, [(3, 2), (3, 1), (2, 1), (2, 0), (1, 2), (1, 0)]),
    (3, "forward"): ("schema3Forward", 6, [(0, 1), (0, 5), (1, 0), (1, 2), (2, 0), (2, 1), (2, 5), (3, 0), (3, 2)]),
    (3, "reflected"): ("schema3Reflected", 6, [(5, 4), (5, 0), (4, 5), (4, 3), (3, 5), (3, 4), (3, 0), (2, 5), (2, 3)]),
    (4, "forward"): ("schema4Forward", 5, [(0, 1), (0, 3), (2, 3), (2, 4), (3, 1), (3, 4)]),
    (4, "reflected"): ("schema4Reflected", 5, [(4, 3), (4, 1), (2, 1), (2, 0), (1, 3), (1, 0)]),
    (5, "forward"): ("schema5Forward", 5, [(0, 1), (0, 2), (0, 4), (2, 3), (2, 4), (3, 2), (3, 4), (4, 1), (4, 3)]),
    (5, "reflected"): ("schema5Reflected", 5, [(4, 3), (4, 2), (4, 0), (2, 1), (2, 0), (1, 2), (1, 0), (0, 3), (0, 1)]),
    (6, "forward"): ("schema6Forward", 6, [(0, 3), (0, 4), (1, 0), (1, 4), (2, 0), (2, 3)]),
    (6, "reflected"): ("schema6Reflected", 6, [(5, 2), (5, 1), (4, 5), (4, 1), (3, 5), (3, 2)]),
    (7, "forward"): ("schema7Forward", 7, [(0, 1), (0, 5), (1, 0), (1, 3), (1, 4), (2, 0), (2, 5), (3, 1), (3, 4), (6, 0), (6, 3)]),
    (7, "reflected"): ("schema7Reflected", 7, [(6, 5), (6, 1), (5, 6), (5, 3), (5, 2), (4, 6), (4, 1), (3, 5), (3, 2), (0, 6), (0, 3)]),
    (8, "reflected"): ("schema8Reflected", 8, [(7, 6), (7, 5), (7, 0), (2, 6), (2, 3), (2, 1), (1, 4), (1, 3), (1, 0), (0, 5), (0, 4), (0, 1)]),
    (9, "forward"): ("schema9Forward", 6, [(0, 1), (0, 3), (0, 5), (4, 1), (4, 2), (5, 2), (5, 3)]),
    (9, "reflected"): ("schema9Reflected", 6, [(5, 4), (5, 2), (5, 0), (1, 4), (1, 3), (0, 3), (0, 2)]),
}

def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()

def window_digest(lines: list[str], first: int, last: int) -> str:
    return hashlib.sha256(("\n".join(lines[first - 1:last]) + "\n").encode()).hexdigest()

def p4_row(center: int, point: int) -> int:
    if center == point:
        raise ValueError("self row atom")
    return 1 + 10 * center + (point if point < center else point - 1)

def candidate_key(core: dict) -> tuple[int, str]:
    candidates = core["schema_orientation_candidates"]
    if len(candidates) != 1:
        raise ValueError(f"non-canonical schema candidate at {core['core_clause_index']}")
    item = candidates[0]
    prefix, index = item["schema"].split(":index:")
    if prefix != "kalmanson":
        raise ValueError(f"unexpected schema {item['schema']!r}")
    key = (int(index), item["orientation"])
    try:
        return key
    except KeyError as exc:
        raise AssertionError("unreachable") from exc

def targets_and_literals(core: dict, role_count: int,
                         schema: list[tuple[int, int]]) -> tuple[list[int], list[int]]:
    atoms = core["named_literals"]
    if any(a["variable_family"] != "selected_row_membership" or a["literal"] >= 0 for a in atoms):
        raise ValueError(f"non-negative/non-row Kalmanson atom at {core['core_clause_index']}")
    actual_pairs = [(a["parameters"]["center"], a["parameters"]["point"]) for a in atoms]
    # Some retained schemas have an unused role.  Recover a deterministic
    # increasing target tuple from the canonical schema and the named row
    # atoms alone; candidate provenance is intentionally not consulted.
    candidates = [list(xs) for xs in combinations(range(11), role_count)
                  if Counter((xs[a], xs[b]) for a, b in schema) == Counter(actual_pairs)]
    if not candidates:
        raise ValueError(f"schema row-pair mismatch at {core['core_clause_index']}")
    targets = candidates[0]
    expected = [-p4_row(targets[a], targets[b]) for a, b in schema]
    return targets, expected

def load() -> tuple[dict, list[dict], dict[str, str]]:
    paths = {"formula": CNF, "ledger": LEDGER, "source": SOURCE, "map": MAP}
    for key, path in paths.items():
        if digest(path) != EXPECTED[key]:
            raise ValueError(f"{key} digest mismatch")
    manifest = json.loads(MANIFEST.read_text())
    if manifest["stable_digest"]["sha256"] != EXPECTED["stable"]:
        raise ValueError("manifest stable digest mismatch")
    if manifest["compact_cnf"]["clause_count"] != 19048 or manifest["compact_cnf"]["variable_count"] != 2557:
        raise ValueError("compact dimensions drifted")
    if manifest["sources"]["core"]["sha256"] != EXPECTED["source"] or manifest["sources"]["occurrence_map"]["sha256"] != EXPECTED["map"]:
        raise ValueError("manifest source binding drifted")
    ledger_lines = LEDGER.read_text().splitlines()
    records = [json.loads(line) for line in ledger_lines]
    window = [r for r in records if FIRST <= r["output_clause_index"] <= LAST]
    if len(records) != 19048 or len(window) != LAST - FIRST + 1:
        raise ValueError("ledger window size drifted")
    if [e["output_clause_index"] for e in window] != list(range(FIRST, LAST + 1)):
        raise ValueError("ledger output range is not contiguous")
    if [e["source_core_clause_index"] for e in window] != list(range(SOURCE_FIRST, SOURCE_LAST + 1)):
        raise ValueError("source-core range is not contiguous")
    if any(e["family"] != FAMILY for e in window):
        raise ValueError("ledger window family drifted")
    core_map = json.loads(MAP.read_text())
    by_index = {c["core_clause_index"]: c for c in core_map["core_clauses"]}
    source_lines = SOURCE.read_text().splitlines()[1:]
    compact_lines = CNF.read_text().splitlines()[1:]
    entries, special = [], []
    for entry in window:
        core = by_index[entry["source_core_clause_index"]]
        key = candidate_key(core)
        if key in SLOTS:
            slot, role_count, schema = SLOTS[key]
        else:
            raise ValueError(f"unexpected unretained Kalmanson orientation {key}")
        targets, expected = targets_and_literals(core, role_count, schema)
        if Counter(entry["dense_literals"]) != Counter(expected):
            raise ValueError(f"compact literal mismatch at {entry['output_clause_index']}")
        if Counter(entry["source_core_literals"]) != Counter(core["core_clause_literal_order"]):
            raise ValueError(f"source-core literal mismatch at {entry['output_clause_index']}")
        entry.update(slot=slot, targets=targets,
                     canonical_schema=core["schema_orientation_candidates"][0]["schema"],
                     canonical_orientation=core["schema_orientation_candidates"][0]["orientation"])
        entries.append(entry)
        if slot == "schema5Forward":
            special.append(entry)
    actual_special = [{
        "output": e["output_clause_index"], "source": e["source_core_clause_index"],
        "schema": e["canonical_schema"],
        "orientation": e["canonical_orientation"],
        "dense_literals": e["dense_literals"], "source_literals": e["source_core_literals"],
    } for e in special]
    if actual_special != EXPECTED_SCHEMA5_FORWARD or len(entries) != 1907:
        raise ValueError("schema-5-forward coverage drift")
    hashes = {
        "ledger_window": window_digest(ledger_lines, FIRST, LAST),
        "compact_window": window_digest(compact_lines, FIRST, LAST),
        "source_window": window_digest(source_lines, SOURCE_FIRST, SOURCE_LAST),
    }
    if hashes != EXPECTED_WINDOWS:
        raise ValueError("authenticated window digest mismatch")
    return manifest, entries, hashes

def lean_list(items: list[int]) -> str:
    return "[" + ", ".join(map(str, items)) + "]"

def render_chunk(number: int, entries: list[dict]) -> str:
    prefix = f"bridgeChunk{number:02d}"
    names = [f"{prefix}Entry{i:03d}" for i in range(1, len(entries) + 1)]
    lines = ["/- This file is generated by ../generate.py; do not edit. -/", "import Families", "", "/-! Authenticated P4 Kalmanson compact-clause entries. -/", "", "namespace Problem97.P4KalmansonOccurrenceBridgeScratch", ""]
    for name, entry in zip(names, entries, strict=True):
        lines += [f"def {name} : BridgeEntry :=", f"  ⟨{lean_list(entry['dense_literals'])}, .{entry['slot']}, {lean_list(entry['targets'])}, by decide, by decide, by decide, by decide⟩", ""]
    lines += [f"def {prefix} : List BridgeEntry := [", *(f"  {name}," for name in names), "]", "", f"theorem {prefix}_length : {prefix}.length = {len(entries)} := by rfl", "", f"end Problem97.P4KalmansonOccurrenceBridgeScratch", ""]
    return "\n".join(lines)

def render_all(manifest: dict, entries: list[dict], hashes: dict[str, str]) -> str:
    chunks = (len(entries) + CHUNK_SIZE - 1) // CHUNK_SIZE
    imports = "\n".join(f"import BridgeChunk{i:02d}" for i in range(1, chunks + 1))
    concat = " ++ ".join(f"bridgeChunk{i:02d}" for i in range(1, chunks + 1))
    length_lemmas = ", ".join(f"bridgeChunk{i:02d}_length" for i in range(1, chunks + 1))
    return f'''/- This file is generated by ../generate.py; do not edit. -/
{imports}

/-! Aggregation and hashes for the authenticated P4 Kalmanson window. -/

namespace Problem97.P4KalmansonOccurrenceBridgeScratch

def bridgeEntries : List BridgeEntry := {concat}
theorem bridgeEntries_length : bridgeEntries.length = {len(entries)} := by
  simp [bridgeEntries, {length_lemmas}]

/-- Authenticated compact P4 Kalmanson window metadata. -/
def compactWindowSha256 : String := "{hashes['compact_window']}"
def ledgerWindowSha256 : String := "{hashes['ledger_window']}"
def sourceWindowSha256 : String := "{hashes['source_window']}"
def compactFormulaSha256 : String := "{EXPECTED['formula']}"
def sourceMapSha256 : String := "{EXPECTED['map']}"
def compactStableSha256 : String := "{manifest['stable_digest']['sha256']}"

/-- The only canonical forward-schema-5 entries, each discharged by the
explicit direct and reflected-boundary terminals in `KalmansonCore`. -/
def schema5ForwardCompactIndices : List Nat := [7721, 7722]
def schema5ForwardSourceIndices : List Nat := [28606, 28607]

end Problem97.P4KalmansonOccurrenceBridgeScratch
'''

def render_main() -> str:
    return '''/- This file is generated by ../generate.py; do not edit. -/
import BridgeAll
import Families

/-! Source-satisfaction interface for the P4 Kalmanson compact window. -/

namespace Problem97.P4KalmansonOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch
open P4MutualTransportOccurrenceBridgeScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

def bridgeClauses : List (List Int) := bridgeEntries.map BridgeEntry.clause
theorem bridgeClauses_length : bridgeClauses.length = 1907 := by simp [bridgeClauses, bridgeEntries_length]

/-- Source satisfaction of the authenticated compact Kalmanson window on the direct branch. -/
theorem bridgeClauses_sat_direct (Q : ExactTwoBoundaryCore R distribution)
    {v : Nat → Prop} (hv : CoreValAgreement Q directIndex v) :
    ∀ clause ∈ bridgeClauses, clauseSat v clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  by_cases hslot : entry.slot = .schema5Forward
  · exact entry_sat_schema5Forward_direct Q hv entry hslot
  · exact entry_sat_retained Q directIndex
      (verifiedKalmansonOrderSchemaCutSat_direct Q) hv entry hslot

/-- Source satisfaction of the authenticated compact Kalmanson window on the
mirror branch, including the reflected forward-schema-5 terminal. -/
theorem bridgeClauses_sat_mirror (Q : ExactTwoBoundaryCore R distribution)
    {v : Nat → Prop} (hv : CoreValAgreement Q mirrorIndex v) :
    ∀ clause ∈ bridgeClauses, clauseSat v clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  by_cases hslot : entry.slot = .schema5Forward
  · exact entry_sat_schema5Forward_mirror Q hv entry hslot
  · exact entry_sat_retained Q mirrorIndex
      (verifiedKalmansonOrderSchemaCutSat_mirror Q) hv entry hslot

end Problem97.P4KalmansonOccurrenceBridgeScratch
'''

def rendered() -> dict[str, bytes]:
    manifest, entries, hashes = load()
    files: dict[str, bytes] = {}
    for number, offset in enumerate(range(0, len(entries), CHUNK_SIZE), start=1):
        files[f"BridgeChunk{number:02d}.lean"] = render_chunk(number, entries[offset:offset + CHUNK_SIZE]).encode()
    files["BridgeAll.lean"] = render_all(manifest, entries, hashes).encode()
    files["Main.lean"] = render_main().encode()
    return files

def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--verify-only", action="store_true")
    args = parser.parse_args()
    expected = rendered()
    if args.verify_only:
        actual = {p.name for p in OUT.glob("*.lean")}
        if actual != set(expected):
            raise ValueError("generated file-set drift")
        for name, contents in expected.items():
            if (OUT / name).read_bytes() != contents:
                raise ValueError(f"generated content drift: {name}")
    else:
        OUT.mkdir(parents=True, exist_ok=True)
        for name, contents in expected.items():
            (OUT / name).write_bytes(contents)
    print(json.dumps({"clause_count": 1907, "output_range": [FIRST, LAST], "source_range": [SOURCE_FIRST, SOURCE_LAST]}, sort_keys=True))

if __name__ == "__main__":
    main()
