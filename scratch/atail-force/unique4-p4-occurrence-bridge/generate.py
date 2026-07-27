#!/usr/bin/env python3
"""Generate the bounded P4 mutual-transport occurrence bridge.

The input ledger and core map are authenticated artifacts owned elsewhere.
This generator is the sole writer of `generated/*.lean`; it validates the
package hashes and reconstructs the exact 392-entry window before rendering.
"""

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

FIRST = 4641
LAST = 5032
FAMILY = "mutual_triangle_cross_center_radius_transport"
CHUNK_SIZES = (128, 128, 128, 8)
EXPECTED = {
    "formula": "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae",
    "ledger": "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac",
    "stable": "8d5b8f5adf40cda367e7e7f72f6afc58e75201011e140ff198ace1c836521dd1",
    "source_core": "739a55ce7a818cbcdfb8c9fa0731b19b564933e546c303b17c2366871078241b",
    "source_map": "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b",
}
WINDOW_EXPECTED = {
    "ledger": "8b5f71cddd261c606b31678a879bae195740367a018fa8d62f8862395555adf3",
    "compact_cnf": "f90216a0e4d10f7e1ab60bc65989da55fd4e7e49f624e0dc7128acffcc4f6ecc",
    "source_core": "39cde4a01f1c2a0e13cbfa9645ea79c3313761fb677a7dfb6b88e19419b133c9",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def line_window_sha256(lines: list[str], start: int, end: int) -> str:
    """Hash one inclusive 1-based clause/ledger window, preserving newline form."""
    return hashlib.sha256(("\n".join(lines[start - 1:end]) + "\n").encode()).hexdigest()


def p4_row(center: int, point: int) -> int:
    assert center != point
    return 1 + 10 * center + (point if point < center else point - 1)


def p4_pairs(center: int) -> list[tuple[int, int]]:
    return [(left, right) for left in range(11) for right in range(11)
            if left < right and left != center and right != center]


def p4_radius(center: int, left: int, right: int) -> int:
    assert left < right and left != center and right != center
    return 111 + 45 * center + p4_pairs(center).index((left, right))


def shape_for(core_clause: dict) -> tuple[int, int, int]:
    named = core_clause["named_literals"]
    rows = []
    equalities = []
    for atom in named:
        family = atom["variable_family"]
        if family == "selected_row_membership":
            if atom["literal"] >= 0:
                raise ValueError(f"non-negative row literal in {core_clause['core_clause_index']}")
            rows.append((atom["parameters"]["center"], atom["parameters"]["point"]))
        elif family == "complete_radius_equality":
            if atom["literal"] <= 0:
                raise ValueError(f"non-positive equality literal in {core_clause['core_clause_index']}")
            equalities.append(atom["parameters"])
        else:
            raise ValueError(f"unexpected family {family!r}")
    if len(rows) != 4 or len(equalities) != 1:
        raise ValueError(f"unexpected atom count in {core_clause['core_clause_index']}")
    # The core occurrence order is not stable enough to orient the symmetric
    # pair (a, mid), so choose its increasing canonical orientation.
    centers = sorted({center for center, _ in rows})
    if len(centers) != 2:
        raise ValueError(f"unexpected row centers in {core_clause['core_clause_index']}")
    a, mid = centers
    bc = equalities[0]["center"]
    expected_rows = {(a, mid), (a, bc), (mid, a), (mid, bc)}
    eq = equalities[0]
    if len({a, mid, bc}) != 3 or set(rows) != expected_rows or \
            eq["center"] != bc or {eq["left"], eq["right"]} != {a, mid}:
        raise ValueError(f"malformed mutual shape in {core_clause['core_clause_index']}")
    return a, mid, bc


def expected_literals(shape: tuple[int, int, int]) -> list[int]:
    a, mid, bc = shape
    left, right = sorted((a, mid))
    return [-p4_row(a, mid), -p4_row(a, bc), -p4_row(mid, a),
            -p4_row(mid, bc), p4_radius(bc, left, right)]


def load_entries() -> tuple[dict, list[dict]]:
    manifest = json.loads(MANIFEST.read_text())
    checks = {
        "formula": sha256(CNF),
        "ledger": sha256(LEDGER),
        "source_core": sha256(SOURCE_CNF),
        "source_map": sha256(CORE_MAP),
        "stable": manifest["stable_digest"]["sha256"],
    }
    for name, actual in checks.items():
        if actual != EXPECTED[name]:
            raise ValueError(f"{name} digest mismatch: {actual}")
    if manifest["compact_cnf"]["clause_count"] != 19048 or manifest["compact_cnf"]["variable_count"] != 2557:
        raise ValueError("unexpected compact output dimensions")
    if manifest["sources"]["core"]["sha256"] != EXPECTED["source_core"] or \
            manifest["sources"]["occurrence_map"]["sha256"] != EXPECTED["source_map"]:
        raise ValueError("manifest source binding drifted")
    ledger_lines = LEDGER.read_text().splitlines()
    records = [json.loads(line) for line in ledger_lines]
    if len(records) != 19048:
        raise ValueError(f"unexpected ledger count: {len(records)}")
    entries = [record for record in records if FIRST <= record["output_clause_index"] <= LAST]
    if len(entries) != sum(CHUNK_SIZES):
        raise ValueError(f"unexpected window size: {len(entries)}")
    if [entry["output_clause_index"] for entry in entries] != list(range(FIRST, LAST + 1)):
        raise ValueError("non-contiguous output window")
    if any(entry["family"] != FAMILY for entry in entries):
        raise ValueError("window contains a different family")
    if [entry["source_core_clause_index"] for entry in entries] != list(range(5613, 6005)):
        raise ValueError("source-core occurrence range drifted")
    if line_window_sha256(ledger_lines, FIRST, LAST) != WINDOW_EXPECTED["ledger"]:
        raise ValueError("ledger window digest drifted")
    compact_lines = CNF.read_text().splitlines()[1:]
    source_lines = SOURCE_CNF.read_text().splitlines()[1:]
    if line_window_sha256(compact_lines, FIRST, LAST) != WINDOW_EXPECTED["compact_cnf"]:
        raise ValueError("compact CNF window digest drifted")
    if line_window_sha256(source_lines, 5613, 6004) != WINDOW_EXPECTED["source_core"]:
        raise ValueError("source-core window digest drifted")
    core_map = json.loads(CORE_MAP.read_text())
    core_by_index = {clause["core_clause_index"]: clause for clause in core_map["core_clauses"]}
    for entry in entries:
        core = core_by_index[entry["source_core_clause_index"]]
        shape = shape_for(core)
        expected = expected_literals(shape)
        if Counter(expected) != Counter(entry["dense_literals"]):
            raise ValueError(f"P4 dense map mismatch at output {entry['output_clause_index']}")
        entry["shape"] = shape
    return manifest, entries


def lean_list(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def render_chunk(number: int, entries: list[dict]) -> str:
    name = f"bridgeChunk{number:02d}"
    entry_names = [f"{name}Entry{offset:03d}" for offset in range(1, len(entries) + 1)]
    lines = [
        "/- This file is generated by ../generate.py; do not edit. -/",
        "import Families",
        "",
        "/-! Authenticated P4 mutual-transport occurrence data chunk. -/",
        "",
        "namespace Problem97.P4MutualTransportOccurrenceBridgeScratch",
        "",
    ]
    for entry_name, entry in zip(entry_names, entries, strict=True):
        a, mid, bc = entry["shape"]
        lines.append(
            f"def {entry_name} : BridgeEntry := "
            f"⟨{lean_list(entry['dense_literals'])}, .mutualTriangle {a} {mid} {bc}⟩"
        )
    lines += [
        "",
        f"def {name} : List BridgeEntry := [",
        *[f"  {entry_name}," for entry_name in entry_names],
        "]",
        "",
    ]
    for entry_name in entry_names:
        lines += [
            f"theorem {entry_name}_wf : entryWF {entry_name} = true := by decide",
            "",
        ]
    lines += [
        f"theorem {name}_wf : {name}.all entryWF = true := by",
        f"  simp [{name}, " + ", ".join(f"{entry_name}_wf" for entry_name in entry_names) + "]",
        "",
        f"theorem {name}_length : {name}.length = {len(entries)} := by simp [{name}]",
        "",
        "end Problem97.P4MutualTransportOccurrenceBridgeScratch",
        "",
    ]
    return "\n".join(lines)


def render_all(manifest: dict) -> str:
    return f'''/- This file is generated by ../generate.py; do not edit. -/
import BridgeChunk01
import BridgeChunk02
import BridgeChunk03
import BridgeChunk04

/-! Aggregation and artifact bindings for the generated P4 occurrence chunks. -/

namespace Problem97.P4MutualTransportOccurrenceBridgeScratch

/-- Authenticated external package binding for this bounded ledger slice. -/
def compactFormulaSha256 : String := "{EXPECTED['formula']}"
def occurrenceLedgerSha256 : String := "{EXPECTED['ledger']}"
def stableManifestSha256 : String := "{EXPECTED['stable']}"
def sourceCoreSha256 : String := "{EXPECTED['source_core']}"
def sourceOccurrenceMapSha256 : String := "{EXPECTED['source_map']}"
def outputClauseStart : Nat := {FIRST}
def outputClauseEnd : Nat := {LAST}
def sourceCoreClauseStart : Nat := 5613
def sourceCoreClauseEnd : Nat := 6004

def bridgeEntries : List BridgeEntry :=
  bridgeChunk01 ++ bridgeChunk02 ++ bridgeChunk03 ++ bridgeChunk04

theorem bridgeEntries_length : bridgeEntries.length = 392 := by
  simp [bridgeEntries, bridgeChunk01_length, bridgeChunk02_length,
    bridgeChunk03_length, bridgeChunk04_length]

theorem bridgeEntries_wf : bridgeEntries.all entryWF = true := by
  simp [bridgeEntries, bridgeChunk01_wf, bridgeChunk02_wf,
    bridgeChunk03_wf, bridgeChunk04_wf]

end Problem97.P4MutualTransportOccurrenceBridgeScratch
'''


def render_main() -> str:
    return '''/- This file is generated by ../generate.py; do not edit. -/
import BridgeAll

/-! Semantic aggregate for the generated P4 mutual-transport ledger slice. -/

namespace Problem97
namespace P4MutualTransportOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

def bridgeClauses : List (List Int) := bridgeEntries.map BridgeEntry.clause

theorem bridgeClauses_length : bridgeClauses.length = 392 := by
  simp [bridgeClauses, bridgeEntries_length]

/-- Every entry in the authenticated P4 window is semantically satisfied by
an exact-two core under any source-faithful index transport. -/
theorem bridgeEntries_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : CoreValAgreement Q σ v) :
    ∀ e ∈ bridgeEntries, clauseSat v e.clause :=
  entryList_sat Q σ hv bridgeEntries bridgeEntries_wf

/-- The exact 392 compact clauses in the ledger slice are semantically
satisfied.  This is a source-semantics bridge only; it does not prove an
equality with the external DIMACS file or any global UNSAT conclusion. -/
theorem bridgeClauses_sat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : CoreValAgreement Q σ v) :
    ∀ clause ∈ bridgeClauses, clauseSat v clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  exact bridgeEntries_sat Q σ hv entry hentry

end P4MutualTransportOccurrenceBridgeScratch
end Problem97
'''


def render_generated_files() -> dict[str, bytes]:
    """Regenerate the complete expected Lean tree without touching disk."""
    manifest, entries = load_entries()
    rendered: dict[str, bytes] = {}
    offset = 0
    for number, size in enumerate(CHUNK_SIZES, start=1):
        chunk = entries[offset:offset + size]
        if len(chunk) != size:
            raise ValueError("chunk size drift")
        rendered[f"BridgeChunk{number:02d}.lean"] = render_chunk(number, chunk).encode("utf-8")
        offset += size
    if offset != len(entries):
        raise ValueError("unemitted entry drift")
    rendered["BridgeAll.lean"] = render_all(manifest).encode("utf-8")
    rendered["Main.lean"] = render_main().encode("utf-8")
    return rendered


def generate() -> None:
    rendered = render_generated_files()
    OUT.mkdir(parents=True, exist_ok=True)
    for name, contents in rendered.items():
        (OUT / name).write_bytes(contents)


def verify_generated() -> None:
    expected = render_generated_files()
    expected_names = set(expected)
    actual_names = {
        path.relative_to(OUT).as_posix()
        for path in OUT.rglob("*.lean")
        if path.is_file()
    }
    missing = sorted(expected_names - actual_names)
    extra = sorted(actual_names - expected_names)
    if missing or extra:
        details = []
        if missing:
            details.append("missing " + ", ".join(missing))
        if extra:
            details.append("extra " + ", ".join(extra))
        raise ValueError("generated file-set drift: " + "; ".join(details))
    for name in sorted(expected):
        if (OUT / name).read_bytes() != expected[name]:
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
    print(json.dumps({
        "chunk_sizes": list(CHUNK_SIZES),
        "compact_cnf_window_sha256": WINDOW_EXPECTED["compact_cnf"],
        "ledger_window_sha256": WINDOW_EXPECTED["ledger"],
        "output_clause_range": [FIRST, LAST],
        "source_core_window_sha256": WINDOW_EXPECTED["source_core"],
        "source_core_clause_range": [5613, 6004],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
