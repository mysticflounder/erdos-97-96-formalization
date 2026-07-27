#!/usr/bin/env python3
"""Generate the authenticated P4 radius-partition occurrence bridge.

The occurrence ledger is filtered solely by its recorded family.  In
particular, neither output nor source-core ordinals are assumed contiguous.
Verify-only mode re-renders the whole generated Lean tree and byte-compares it.
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

FAMILY = "radius_partition_transitivity"
CHUNK_SIZES = (128,) * 25 + (18,)
EXPECTED = {
    "formula": "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae",
    "ledger": "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac",
    "stable": "8d5b8f5adf40cda367e7e7f72f6afc58e75201011e140ff198ace1c836521dd1",
    "source_core": "739a55ce7a818cbcdfb8c9fa0731b19b564933e546c303b17c2366871078241b",
    "source_map": "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b",
}
SELECTED_EXPECTED = {
    "ledger": "53c4f0c5bc43337c899e4391ec183278ab01cabe00135039637898878682e653",
    "compact_cnf": "652bf0077b55dbfb581354fba2f13f6664ca94e215805a354be67fa1ff2d9893",
    "source_core": "46ab1ceab9d5875871cde120f7399a42c1b0f30161450ab723097dcba01e08de",
}
MATCH_STATUS_COUNTS = {
    "semantic_unique_canonical_literal_reordering": 2175,
    "semantic_unique_exact_literal_order": 1043,
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def selected_sha256(lines: list[str]) -> str:
    return hashlib.sha256(("\n".join(lines) + "\n").encode()).hexdigest()


def p4_pairs(center: int) -> list[tuple[int, int]]:
    return [
        (left, right)
        for left in range(11)
        for right in range(11)
        if left < right and left != center and right != center
    ]


def p4_radius(center: int, left: int, right: int) -> int:
    if not (left < right and left != center and right != center):
        raise ValueError("invalid P4 radius atom")
    return 111 + 45 * center + p4_pairs(center).index((left, right))


def sorted_radius(center: int, left: int, right: int) -> int:
    return p4_radius(center, *sorted((left, right)))


def parse_clause(line: str) -> list[int]:
    values = [int(value) for value in line.split()]
    if not values or values[-1] != 0:
        raise ValueError(f"invalid DIMACS clause line: {line!r}")
    return values[:-1]


def shape_for(core_clause: dict) -> tuple[int, int, int, int]:
    negative: list[tuple[int, int, int]] = []
    positive: list[tuple[int, int, int]] = []
    for atom in core_clause["named_literals"]:
        if atom["variable_family"] != "complete_radius_equality":
            raise ValueError(f"unexpected family {atom['variable_family']!r}")
        params = atom["parameters"]
        edge = (params["center"], params["left"], params["right"])
        if atom["literal"] < 0:
            negative.append(edge)
        elif atom["literal"] > 0:
            positive.append(edge)
        else:
            raise ValueError("zero named literal")
    if len(negative) != 2 or len(positive) != 1:
        raise ValueError(f"unexpected transitivity shape at core {core_clause['core_clause_index']}")
    center = negative[0][0]
    if any(candidate[0] != center for candidate in negative + positive):
        raise ValueError(f"center drift at core {core_clause['core_clause_index']}")
    first, second = (set(edge[1:]) for edge in negative)
    shared = first & second
    if len(shared) != 1:
        raise ValueError(f"negative edges do not meet once at core {core_clause['core_clause_index']}")
    y = next(iter(shared))
    xs = first - {y}
    zs = second - {y}
    if len(xs) != 1 or len(zs) != 1:
        raise ValueError(f"degenerate negative edge at core {core_clause['core_clause_index']}")
    x, z = next(iter(xs)), next(iter(zs))
    if len({x, y, z}) != 3 or center in {x, y, z}:
        raise ValueError(f"degenerate radius triangle at core {core_clause['core_clause_index']}")
    if set(positive[0][1:]) != {x, z}:
        raise ValueError(f"positive edge mismatch at core {core_clause['core_clause_index']}")
    return center, x, y, z


def expected_literals(shape: tuple[int, int, int, int]) -> list[int]:
    center, x, y, z = shape
    return [-sorted_radius(center, x, y), -sorted_radius(center, y, z), sorted_radius(center, x, z)]


def load_entries() -> list[dict]:
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
        raise ValueError("unexpected compact formula dimensions")
    if manifest["sources"]["core"]["sha256"] != EXPECTED["source_core"]:
        raise ValueError("manifest core-source binding drifted")
    if manifest["sources"]["occurrence_map"]["sha256"] != EXPECTED["source_map"]:
        raise ValueError("manifest occurrence-map binding drifted")

    ledger_lines = LEDGER.read_text().splitlines()
    records = [json.loads(line) for line in ledger_lines]
    if len(records) != 19048:
        raise ValueError("unexpected occurrence-ledger cardinality")
    selected = [(line, record) for line, record in zip(ledger_lines, records, strict=True)
                if record["family"] == FAMILY]
    entries = [record for _, record in selected]
    if len(entries) != sum(CHUNK_SIZES):
        raise ValueError(f"selected-family cardinality drift: {len(entries)}")
    if Counter(entry["match_status"] for entry in entries) != MATCH_STATUS_COUNTS:
        raise ValueError("selected match-status census drifted")
    if selected_sha256([line for line, _ in selected]) != SELECTED_EXPECTED["ledger"]:
        raise ValueError("selected ledger digest drifted")

    output_indices = [entry["output_clause_index"] for entry in entries]
    source_indices = [entry["source_core_clause_index"] for entry in entries]
    if len(set(output_indices)) != len(output_indices) or len(set(source_indices)) != len(source_indices):
        raise ValueError("selected ordinal is not unique")
    compact_lines = CNF.read_text().splitlines()[1:]
    source_lines = SOURCE_CNF.read_text().splitlines()[1:]
    if selected_sha256([compact_lines[index - 1] for index in output_indices]) != SELECTED_EXPECTED["compact_cnf"]:
        raise ValueError("selected compact-CNF digest drifted")
    if selected_sha256([source_lines[index - 1] for index in source_indices]) != SELECTED_EXPECTED["source_core"]:
        raise ValueError("selected source-core digest drifted")

    core_map = json.loads(CORE_MAP.read_text())
    core_by_index = {clause["core_clause_index"]: clause for clause in core_map["core_clauses"]}
    for entry in entries:
        output_index = entry["output_clause_index"]
        source_index = entry["source_core_clause_index"]
        if not (1 <= output_index <= len(compact_lines) and 1 <= source_index <= len(source_lines)):
            raise ValueError("selected ordinal is outside its authenticated source")
        if Counter(parse_clause(compact_lines[output_index - 1])) != Counter(entry["dense_literals"]):
            raise ValueError(f"compact-CNF literal drift at output {output_index}")
        if Counter(parse_clause(source_lines[source_index - 1])) != Counter(entry["source_core_literals"]):
            raise ValueError(f"source-core literal drift at core {source_index}")
        core = core_by_index.get(source_index)
        if core is None:
            raise ValueError(f"missing source core clause: {source_index}")
        shape = shape_for(core)
        if Counter(expected_literals(shape)) != Counter(entry["dense_literals"]):
            raise ValueError(f"P4 dense-map drift at output {output_index}")
        entry["shape"] = shape
    return entries


def lean_list(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def render_chunk(number: int, entries: list[dict]) -> str:
    name = f"bridgeChunk{number:02d}"
    entry_names = [f"{name}Entry{offset:03d}" for offset in range(1, len(entries) + 1)]
    lines = [
        "/- This file is generated by ../generate.py; do not edit. -/",
        "import Families",
        "",
        "/-! Authenticated P4 radius-partition occurrence data chunk. -/",
        "",
        "namespace Problem97.P4RadiusPartitionOccurrenceBridgeScratch",
        "",
    ]
    for entry_name, entry in zip(entry_names, entries, strict=True):
        center, x, y, z = entry["shape"]
        lines += [
            f"/- output {entry['output_clause_index']}; source core {entry['source_core_clause_index']} -/",
            f"def {entry_name} : BridgeEntry := "
            f"⟨{lean_list(entry['dense_literals'])}, .radiusTrans {center} {x} {y} {z}⟩",
        ]
    lines += ["", f"def {name} : List BridgeEntry := ["]
    lines += [f"  {entry_name}," for entry_name in entry_names]
    lines += ["]", ""]
    for entry_name in entry_names:
        lines += [f"theorem {entry_name}_wf : entryWF {entry_name} = true := by decide", ""]
    lines += [
        f"theorem {name}_wf : {name}.all entryWF = true := by",
        f"  simp [{name}, " + ", ".join(f"{entry_name}_wf" for entry_name in entry_names) + "]",
        "",
        f"theorem {name}_length : {name}.length = {len(entries)} := by simp [{name}]",
        "",
        "end Problem97.P4RadiusPartitionOccurrenceBridgeScratch",
        "",
    ]
    return "\n".join(lines)


def render_all() -> str:
    imports = "\n".join(f"import BridgeChunk{number:02d}" for number in range(1, len(CHUNK_SIZES) + 1))
    chunks = " ++ ".join(f"bridgeChunk{number:02d}" for number in range(1, len(CHUNK_SIZES) + 1))
    lengths = ", ".join(f"bridgeChunk{number:02d}_length" for number in range(1, len(CHUNK_SIZES) + 1))
    wfs = ", ".join(f"bridgeChunk{number:02d}_wf" for number in range(1, len(CHUNK_SIZES) + 1))
    return f'''/- This file is generated by ../generate.py; do not edit. -/
{imports}

/-! Aggregation and artifact bindings for all {sum(CHUNK_SIZES)} radius-partition P4 occurrences. -/

namespace Problem97.P4RadiusPartitionOccurrenceBridgeScratch

def compactFormulaSha256 : String := "{EXPECTED['formula']}"
def occurrenceLedgerSha256 : String := "{EXPECTED['ledger']}"
def stableManifestSha256 : String := "{EXPECTED['stable']}"
def sourceCoreSha256 : String := "{EXPECTED['source_core']}"
def sourceOccurrenceMapSha256 : String := "{EXPECTED['source_map']}"
def selectedFamily : String := "{FAMILY}"
def selectedLedgerSha256 : String := "{SELECTED_EXPECTED['ledger']}"
def selectedCompactCnfSha256 : String := "{SELECTED_EXPECTED['compact_cnf']}"
def selectedSourceCoreSha256 : String := "{SELECTED_EXPECTED['source_core']}"
def selectedClauseCount : Nat := {sum(CHUNK_SIZES)}

def bridgeEntries : List BridgeEntry :=
  {chunks}

theorem bridgeEntries_length : bridgeEntries.length = {sum(CHUNK_SIZES)} := by
  simp [bridgeEntries, {lengths}]

theorem bridgeEntries_wf : bridgeEntries.all entryWF = true := by
  simp [bridgeEntries, {wfs}]

end Problem97.P4RadiusPartitionOccurrenceBridgeScratch
'''


def render_main() -> str:
    return '''/- This file is generated by ../generate.py; do not edit. -/
import BridgeAll

/-! Semantic aggregate for the generated P4 radius-partition slice. -/

namespace Problem97
namespace P4RadiusPartitionOccurrenceBridgeScratch

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

theorem bridgeClauses_length : bridgeClauses.length = 3218 := by
  simp [bridgeClauses, bridgeEntries_length]

/-- Every authenticated P4 radius-partition occurrence is semantically satisfied
by a total valuation with native direct-core agreement. -/
theorem bridgeEntries_sat (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) :
    ∀ e ∈ bridgeEntries, clauseSat v e.clause :=
  entryList_sat P hv bridgeEntries bridgeEntries_wf

/-- This source-semantics bridge covers exactly the 3218 ledger records whose
family is `radius_partition_transitivity`. It does not identify this list with
the external DIMACS file or prove a global UNSAT conclusion. -/
theorem bridgeClauses_sat (P : P4DirectBoundaryPacket R profile distribution)
    {v : Nat → Prop} (hv : CoreValAgreement P v) :
    ∀ clause ∈ bridgeClauses, clauseSat v clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  exact bridgeEntries_sat P hv entry hentry

end P4RadiusPartitionOccurrenceBridgeScratch
end Problem97
'''


def render_generated_files() -> dict[str, bytes]:
    entries = load_entries()
    rendered: dict[str, bytes] = {}
    offset = 0
    for number, size in enumerate(CHUNK_SIZES, start=1):
        chunk = entries[offset:offset + size]
        if len(chunk) != size:
            raise ValueError("chunk size drift")
        rendered[f"BridgeChunk{number:02d}.lean"] = render_chunk(number, chunk).encode()
        offset += size
    if offset != len(entries):
        raise ValueError("unemitted selected entry")
    rendered["BridgeAll.lean"] = render_all().encode()
    rendered["Main.lean"] = render_main().encode()
    return rendered


def generate() -> None:
    rendered = render_generated_files()
    OUT.mkdir(parents=True, exist_ok=True)
    for name, contents in rendered.items():
        (OUT / name).write_bytes(contents)


def verify_generated() -> None:
    expected = render_generated_files()
    expected_names = set(expected)
    actual_names = {path.relative_to(OUT).as_posix() for path in OUT.rglob("*.lean") if path.is_file()}
    missing = sorted(expected_names - actual_names)
    extra = sorted(actual_names - expected_names)
    if missing or extra:
        details = (["missing " + ", ".join(missing)] if missing else []) + (["extra " + ", ".join(extra)] if extra else [])
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
        "family": FAMILY,
        "selected_compact_cnf_sha256": SELECTED_EXPECTED["compact_cnf"],
        "selected_count": sum(CHUNK_SIZES),
        "selected_ledger_sha256": SELECTED_EXPECTED["ledger"],
        "selected_source_core_sha256": SELECTED_EXPECTED["source_core"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
