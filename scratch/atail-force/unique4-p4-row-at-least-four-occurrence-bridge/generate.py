#!/usr/bin/env python3
"""Generate the authenticated, bounded P4 `row_at_least_4` bridge."""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CORE_MAP = ROOT / "scratch/atail-force/unique4-exact-two-core-map/p4.input-core-map.json"
SOURCE_CNF = ROOT / "scratch/atail-force/unique4-exact-two-core-map/p4.input-core.cnf"
PACKAGE = ROOT / "scratch/atail-force/unique4-exact-two-core-map/generated/p4-seed0-compact"
MANIFEST = PACKAGE / "p4-seed0-compact-manifest.json"
LEDGER = PACKAGE / "p4-seed0-compact-occurrences.jsonl"
CNF = PACKAGE / "p4-seed0-compact.cnf"
OUT = HERE / "generated"

FAMILY = "row_at_least_4"
EXPECTED_COUNT = 981
CHUNK_SIZES = (128, 128, 128, 128, 128, 128, 128, 85)
EXPECTED = {
    "formula": "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae",
    "ledger": "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac",
    "manifest": "61efb4c99512ef3cff6968f1513ebb8e3c9009ad3fcc7bb013da70a5d3f37305",
    "source_core": "739a55ce7a818cbcdfb8c9fa0731b19b564933e546c303b17c2366871078241b",
    "source_map": "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b",
    "selected_ledger": "4714c3f23f70e335780bec0f460460e3d1a9dee9179c5715bee2fc17f5c980ba",
    "selected_compact_cnf": "cd0b4baa222b5f73d51924437e071a7063cb50d03bb5aad3efa00c4bed92d57c",
    "selected_source_core": "e326d6579b9f39f086381bd2e7575eae04b3a9d3d1e64c7aad4ede35cd45eb05",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def selected_digest(lines: list[str]) -> str:
    return hashlib.sha256(("\n".join(lines) + "\n").encode()).hexdigest()


def p4_row(center: int, point: int) -> int:
    if center == point:
        raise ValueError("row endpoint equals center")
    return 1 + 10 * center + (point if point < center else point - 1)


def shape_for(core_clause: dict) -> tuple[int, list[int]]:
    atoms = core_clause["named_literals"]
    if len(atoms) != 7:
        raise ValueError(f"unexpected literal count at {core_clause['core_clause_index']}")
    if any(atom["variable_family"] != "selected_row_membership" or atom["literal"] <= 0
           for atom in atoms):
        raise ValueError(f"not a positive selected-row clause at {core_clause['core_clause_index']}")
    centers = {atom["parameters"]["center"] for atom in atoms}
    points = [atom["parameters"]["point"] for atom in atoms]
    if len(centers) != 1 or len(set(points)) != 7 or next(iter(centers)) in points:
        raise ValueError(f"invalid row-at-least-four shape at {core_clause['core_clause_index']}")
    return next(iter(centers)), points


def load_entries() -> tuple[dict, list[dict]]:
    for name, path in (("formula", CNF), ("ledger", LEDGER), ("manifest", MANIFEST),
                       ("source_core", SOURCE_CNF), ("source_map", CORE_MAP)):
        if sha256(path) != EXPECTED[name]:
            raise ValueError(f"{name} provenance digest drifted")
    manifest = json.loads(MANIFEST.read_text())
    ledger_lines = LEDGER.read_text().splitlines()
    records = [json.loads(line) for line in ledger_lines]
    if len(records) != 19048:
        raise ValueError(f"unexpected ledger count: {len(records)}")
    selected_lines = [line for line, record in zip(ledger_lines, records, strict=True)
                      if record["family"] == FAMILY]
    entries = [record for record in records if record["family"] == FAMILY]
    if len(entries) != EXPECTED_COUNT or sum(CHUNK_SIZES) != EXPECTED_COUNT:
        raise ValueError("selected count or chunk partition drifted")
    if selected_digest(selected_lines) != EXPECTED["selected_ledger"]:
        raise ValueError("selected ledger digest drifted")
    output_indices = [entry["output_clause_index"] for entry in entries]
    source_indices = [entry["source_core_clause_index"] for entry in entries]
    if len(set(output_indices)) != EXPECTED_COUNT or len(set(source_indices)) != EXPECTED_COUNT:
        raise ValueError("duplicate occurrence ordinal")
    if min(output_indices) != 3227 or max(output_indices) != 4595:
        raise ValueError("output ordinal boundary drifted")
    if min(source_indices) != 3332 or max(source_indices) != 5567:
        raise ValueError("source ordinal boundary drifted")
    compact_lines = CNF.read_text().splitlines()[1:]
    source_lines = SOURCE_CNF.read_text().splitlines()[1:]
    if selected_digest([compact_lines[index - 1] for index in output_indices]) != EXPECTED["selected_compact_cnf"]:
        raise ValueError("selected compact CNF digest drifted")
    if selected_digest([source_lines[index - 1] for index in source_indices]) != EXPECTED["selected_source_core"]:
        raise ValueError("selected source-core digest drifted")
    core_map = json.loads(CORE_MAP.read_text())
    by_index = {clause["core_clause_index"]: clause for clause in core_map["core_clauses"]}
    for entry in entries:
        core = by_index.get(entry["source_core_clause_index"])
        if core is None or core["allocated_family"] != FAMILY:
            raise ValueError(f"core-map family mismatch at output {entry['output_clause_index']}")
        center, points = shape_for(core)
        expected = [p4_row(center, point) for point in points]
        if Counter(expected) != Counter(entry["dense_literals"]):
            raise ValueError(f"dense P4 row map mismatch at output {entry['output_clause_index']}")
        entry["shape"] = (center, points)
    return manifest, entries


def lean_list(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def render_chunk(number: int, entries: list[dict]) -> str:
    name = f"bridgeChunk{number:02d}"
    entry_names = [f"{name}Entry{offset:03d}" for offset in range(1, len(entries) + 1)]
    lines = [
        "/- This file is generated by ../generate.py; do not edit. -/",
        "import Families", "",
        "/-! Authenticated P4 `row_at_least_4` occurrence data chunk. -/", "",
        "namespace Problem97.P4RowAtLeastFourOccurrenceBridgeScratch", "",
    ]
    for entry_name, entry in zip(entry_names, entries, strict=True):
        center, points = entry["shape"]
        lines.append(
            f"def {entry_name} : BridgeEntry := "
            f"⟨{lean_list(entry['dense_literals'])}, .rowAtLeastFour {center} {lean_list(points)}⟩")
    lines += ["", f"def {name} : List BridgeEntry := [",
              *[f"  {entry_name}," for entry_name in entry_names], "]", ""]
    for entry_name in entry_names:
        lines += [f"theorem {entry_name}_wf : entryWF {entry_name} = true := by decide", ""]
    lines += [
        f"theorem {name}_wf : {name}.all entryWF = true := by",
        f"  simp [{name}, " + ", ".join(f"{entry_name}_wf" for entry_name in entry_names) + "]", "",
        f"theorem {name}_length : {name}.length = {len(entries)} := by simp [{name}]", "",
        "end Problem97.P4RowAtLeastFourOccurrenceBridgeScratch", "",
    ]
    return "\n".join(lines)


def render_all() -> str:
    imports = "\n".join(f"import BridgeChunk{number:02d}" for number in range(1, len(CHUNK_SIZES) + 1))
    chunks = " ++ ".join(f"bridgeChunk{number:02d}" for number in range(1, len(CHUNK_SIZES) + 1))
    lengths = ", ".join(f"bridgeChunk{number:02d}_length" for number in range(1, len(CHUNK_SIZES) + 1))
    well_formed = ", ".join(f"bridgeChunk{number:02d}_wf" for number in range(1, len(CHUNK_SIZES) + 1))
    return f'''/- This file is generated by ../generate.py; do not edit. -/
{imports}

/-! Aggregation and authenticated provenance bindings for P4 row cardinality occurrences. -/

namespace Problem97.P4RowAtLeastFourOccurrenceBridgeScratch

def compactFormulaSha256 : String := "{EXPECTED['formula']}"
def occurrenceLedgerSha256 : String := "{EXPECTED['ledger']}"
def stableManifestSha256 : String := "{EXPECTED['manifest']}"
def sourceCoreSha256 : String := "{EXPECTED['source_core']}"
def sourceOccurrenceMapSha256 : String := "{EXPECTED['source_map']}"
def selectedLedgerSha256 : String := "{EXPECTED['selected_ledger']}"
def selectedCompactCnfSha256 : String := "{EXPECTED['selected_compact_cnf']}"
def selectedSourceCoreSha256 : String := "{EXPECTED['selected_source_core']}"
def selectedClauseCount : Nat := {EXPECTED_COUNT}

def bridgeEntries : List BridgeEntry :=
  {chunks}

theorem bridgeEntries_length : bridgeEntries.length = {EXPECTED_COUNT} := by
  simp [bridgeEntries, {lengths}]

theorem bridgeEntries_wf : bridgeEntries.all entryWF = true := by
  simp [bridgeEntries, {well_formed}]

end Problem97.P4RowAtLeastFourOccurrenceBridgeScratch
'''


def render_main() -> str:
    return f'''/- This file is generated by ../generate.py; do not edit. -/
import BridgeAll

/-! Semantic aggregate for the P4 `row_at_least_4` occurrence slice. -/

namespace Problem97
namespace P4RowAtLeastFourOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch

variable {{D : CounterexampleData}} {{S : SurplusCapPacket D.A}} {{radius : ℝ}}
  {{H : CriticalShellSystem D.A}} {{F : CriticalPairFrontier D S radius H}}
  {{R : OriginalUniqueFourResidual F}}
  {{distribution : ExactTwoStrictHitDistribution R}}
  {{profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}}

def bridgeClauses : List (List Int) := bridgeEntries.map BridgeEntry.clause

theorem bridgeClauses_length : bridgeClauses.length = {EXPECTED_COUNT} := by
  simp [bridgeClauses, bridgeEntries_length]

theorem bridgeEntries_sat (P : P4DirectBoundaryPacket R profile distribution)
    {{v : Nat → Prop}} (hv : CoreValAgreement P v) :
    ∀ e ∈ bridgeEntries, clauseSat v e.clause :=
  entryList_sat P hv bridgeEntries bridgeEntries_wf

theorem bridgeClauses_sat (P : P4DirectBoundaryPacket R profile distribution)
    {{v : Nat → Prop}} (hv : CoreValAgreement P v) :
    ∀ clause ∈ bridgeClauses, clauseSat v clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  exact bridgeEntries_sat P hv entry hentry

end P4RowAtLeastFourOccurrenceBridgeScratch
end Problem97
'''


def render_generated_files() -> dict[str, bytes]:
    _, entries = load_entries()
    rendered: dict[str, bytes] = {}
    offset = 0
    for number, size in enumerate(CHUNK_SIZES, start=1):
        chunk = entries[offset:offset + size]
        if len(chunk) != size:
            raise ValueError("chunk size drift")
        rendered[f"BridgeChunk{number:02d}.lean"] = render_chunk(number, chunk).encode()
        offset += size
    if offset != len(entries):
        raise ValueError("unemitted entry drift")
    rendered["BridgeAll.lean"] = render_all().encode()
    rendered["Main.lean"] = render_main().encode()
    return rendered


def generate() -> None:
    for name, contents in render_generated_files().items():
        (OUT / name).parent.mkdir(parents=True, exist_ok=True)
        (OUT / name).write_bytes(contents)


def verify_generated() -> None:
    expected = render_generated_files()
    actual = {path.relative_to(OUT).as_posix() for path in OUT.rglob("*.lean") if path.is_file()}
    missing, extra = sorted(set(expected) - actual), sorted(actual - set(expected))
    if missing or extra:
        detail = (["missing " + ", ".join(missing)] if missing else []) + (["extra " + ", ".join(extra)] if extra else [])
        raise ValueError("generated file-set drift: " + "; ".join(detail))
    for name, contents in expected.items():
        if (OUT / name).read_bytes() != contents:
            raise ValueError(f"generated content drift: {name}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--verify-only", action="store_true")
    args = parser.parse_args()
    if args.verify_only:
        verify_generated()
    else:
        generate()
        verify_generated()
    print(json.dumps({"count": EXPECTED_COUNT, "chunk_sizes": CHUNK_SIZES,
                      "selected_ledger_sha256": EXPECTED["selected_ledger"],
                      "selected_compact_cnf_sha256": EXPECTED["selected_compact_cnf"],
                      "selected_source_core_sha256": EXPECTED["selected_source_core"]}, sort_keys=True))


if __name__ == "__main__":
    main()
