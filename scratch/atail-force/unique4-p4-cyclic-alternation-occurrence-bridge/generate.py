#!/usr/bin/env python3
"""Generate the authenticated P4 cyclic-alternation occurrence bridge."""

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
FAMILY = "full_class_cyclic_alternation"
CHUNK_SIZE = 128
EXPECTED_COUNT = 1279
EXPECTED = {
    "formula": "449cea2217bf144caafdd2dadb2ae7083d7ca34816bd226c2ab776f52ea58dae",
    "ledger": "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac",
    "stable": "8d5b8f5adf40cda367e7e7f72f6afc58e75201011e140ff198ace1c836521dd1",
    "source_core": "739a55ce7a818cbcdfb8c9fa0731b19b564933e546c303b17c2366871078241b",
    "source_map": "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def lines_sha256(lines: list[str]) -> str:
    return hashlib.sha256(("\n".join(lines) + "\n").encode()).hexdigest()


def p4_pairs(center: int) -> list[tuple[int, int]]:
    return [(left, right) for left in range(11) for right in range(11)
            if left < right and left != center and right != center]


def p4_radius(center: int, left: int, right: int) -> int:
    assert left < right and left != center and right != center
    return 111 + 45 * center + p4_pairs(center).index((left, right))


def shape_for(core: dict) -> tuple[int, int, int, int]:
    literals = core["named_literals"]
    if len(literals) != 2 or any(x["polarity"] != "negative" or
                                 x["variable_family"] != "complete_radius_equality" for x in literals):
        raise ValueError(f"not a two-negative-radius cyclic clause {core['core_clause_index']}")
    params = [x["parameters"] for x in literals]
    if any(not (p["left"] < p["right"]) for p in params):
        raise ValueError("unordered radius pair")
    if params[0]["left"] != params[1]["left"] or params[0]["right"] != params[1]["right"]:
        raise ValueError("cyclic centers have different chord pairs")
    l, r = sorted((params[0]["center"], params[1]["center"]))
    p, q = params[0]["left"], params[0]["right"]
    if len({l, r, p, q}) != 4 or not l < r or not p < q:
        raise ValueError("cyclic distinctness/order failure")
    if ((l < p < r) != (l < q < r)):
        raise ValueError("alternating clause misclassified as cyclic")
    return l, r, p, q


def expected_literals(shape: tuple[int, int, int, int]) -> list[int]:
    l, r, p, q = shape
    return [-p4_radius(l, p, q), -p4_radius(r, p, q)]


def load_entries() -> tuple[dict, list[dict], dict[str, str]]:
    manifest = json.loads(MANIFEST.read_text())
    checks = {"formula": sha256(CNF), "ledger": sha256(LEDGER),
              "source_core": sha256(SOURCE_CNF), "source_map": sha256(CORE_MAP),
              "stable": manifest["stable_digest"]["sha256"]}
    for name, actual in checks.items():
        if actual != EXPECTED[name]:
            raise ValueError(f"{name} digest mismatch: {actual}")
    if manifest["compact_cnf"]["clause_count"] != 19048 or manifest["compact_cnf"]["variable_count"] != 2557:
        raise ValueError("unexpected compact dimensions")
    if manifest["sources"]["core"]["sha256"] != EXPECTED["source_core"] or manifest["sources"]["occurrence_map"]["sha256"] != EXPECTED["source_map"]:
        raise ValueError("manifest source binding drifted")
    ledger_lines = LEDGER.read_text().splitlines()
    records = [json.loads(line) for line in ledger_lines]
    if len(records) != 19048:
        raise ValueError("unexpected ledger count")
    entries = [record for record in records if record["family"] == FAMILY]
    if len(entries) != EXPECTED_COUNT:
        raise ValueError(f"unexpected {FAMILY} count: {len(entries)}")
    if len({entry["output_clause_index"] for entry in entries}) != len(entries):
        raise ValueError("duplicate compact occurrence index")
    if len({entry["source_core_clause_index"] for entry in entries}) != len(entries):
        raise ValueError("duplicate source occurrence index")
    core_map = json.loads(CORE_MAP.read_text())
    core_by_index = {clause["core_clause_index"]: clause for clause in core_map["core_clauses"]}
    cnf_lines = CNF.read_text().splitlines()[1:]
    source_lines = SOURCE_CNF.read_text().splitlines()[1:]
    selected_ledger_lines, selected_cnf_lines, selected_source_lines = [], [], []
    for entry in entries:
        output = entry["output_clause_index"]
        source = entry["source_core_clause_index"]
        if not (1 <= output <= len(cnf_lines)) or not (1 <= source <= len(source_lines)):
            raise ValueError("out-of-range occurrence reference")
        core = core_by_index.get(source)
        if core is None or core["allocated_family"] != FAMILY:
            raise ValueError("source occurrence family drift")
        shape = shape_for(core)
        if Counter(expected_literals(shape)) != Counter(entry["dense_literals"]):
            raise ValueError(f"P4 dense map mismatch at output {output}")
        entry["shape"] = shape
        selected_ledger_lines.append(ledger_lines[output - 1])
        selected_cnf_lines.append(cnf_lines[output - 1])
        selected_source_lines.append(source_lines[source - 1])
    return manifest, entries, {
        "ledger": lines_sha256(selected_ledger_lines),
        "compact_cnf": lines_sha256(selected_cnf_lines),
        "source_core": lines_sha256(selected_source_lines),
    }


def lean_list(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def render_chunk(number: int, entries: list[dict]) -> str:
    name = f"bridgeChunk{number:02d}"
    names = [f"{name}Entry{i:03d}" for i in range(1, len(entries) + 1)]
    lines = ["/- This file is generated by ../generate.py; do not edit. -/", "import Families", "",
             "/-! Authenticated direct-P4 cyclic-alternation occurrence data. -/", "",
             "namespace Problem97.P4CyclicAlternationOccurrenceBridgeScratch", ""]
    for name_i, entry in zip(names, entries, strict=True):
        l, r, p, q = entry["shape"]
        lines.append(f"def {name_i} : BridgeEntry := ⟨{lean_list(entry['dense_literals'])}, .cyclic {l} {r} {p} {q}⟩")
    lines += ["", f"def {name} : List BridgeEntry := [", *[f"  {x}," for x in names], "]", ""]
    for name_i in names:
        lines += [f"theorem {name_i}_wf : entryWF {name_i} = true := by decide", ""]
    lines += [f"theorem {name}_wf : {name}.all entryWF = true := by",
              f"  simp [{name}, " + ", ".join(f"{x}_wf" for x in names) + "]", "",
              f"theorem {name}_length : {name}.length = {len(entries)} := by simp [{name}]", "",
              "end Problem97.P4CyclicAlternationOccurrenceBridgeScratch", ""]
    return "\n".join(lines)


def render_all(manifest: dict, entries: list[dict], digests: dict[str, str]) -> str:
    chunks = (len(entries) + CHUNK_SIZE - 1) // CHUNK_SIZE
    imports = "\n".join(f"import BridgeChunk{i:02d}" for i in range(1, chunks + 1))
    chunk_names = " ++ ".join(f"bridgeChunk{i:02d}" for i in range(1, chunks + 1))
    wfs = ", ".join(f"bridgeChunk{i:02d}_wf" for i in range(1, chunks + 1))
    lengths = ", ".join(f"bridgeChunk{i:02d}_length" for i in range(1, chunks + 1))
    return f'''/- This file is generated by ../generate.py; do not edit. -/
{imports}

/-! Aggregate bindings for the direct-P4 cyclic-alternation occurrence slice. -/

namespace Problem97.P4CyclicAlternationOccurrenceBridgeScratch

def compactFormulaSha256 : String := "{EXPECTED['formula']}"
def occurrenceLedgerSha256 : String := "{EXPECTED['ledger']}"
def stableManifestSha256 : String := "{EXPECTED['stable']}"
def selectedLedgerSha256 : String := "{digests['ledger']}"
def selectedCompactCnfSha256 : String := "{digests['compact_cnf']}"
def selectedSourceCoreSha256 : String := "{digests['source_core']}"
def bridgeEntries : List BridgeEntry := {chunk_names}

theorem bridgeEntries_wf : bridgeEntries.all entryWF = true := by
  simp [bridgeEntries, {wfs}]

theorem bridgeEntries_length : bridgeEntries.length = {len(entries)} := by
  simp [bridgeEntries, {lengths}]

end Problem97.P4CyclicAlternationOccurrenceBridgeScratch
'''


def render_main(entries: list[dict]) -> str:
    return f'''/- This file is generated by ../generate.py; do not edit. -/
import BridgeAll

/-! Semantic aggregate for the direct-P4 cyclic-alternation occurrence slice. -/

namespace Problem97.P4CyclicAlternationOccurrenceBridgeScratch

open ATailCriticalPairFrontier ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch RetainedKalmansonDecoderScratch

variable {{D : CounterexampleData}} {{S : SurplusCapPacket D.A}} {{radius : ℝ}}
  {{H : CriticalShellSystem D.A}} {{F : CriticalPairFrontier D S radius H}}
  {{R : OriginalUniqueFourResidual F}} {{distribution : ExactTwoStrictHitDistribution R}}
  {{profile : S.surplusCap.card = 5 ∧ S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}}

def bridgeClauses : List (List Int) := bridgeEntries.map BridgeEntry.clause
theorem bridgeClauses_length : bridgeClauses.length = {len(entries)} := by simp [bridgeClauses, bridgeEntries_length]
theorem bridgeEntries_sat (P : P4DirectBoundaryPacket R profile distribution)
    {{v : Nat → Prop}} (hv : CoreValAgreement P v) : ∀ e ∈ bridgeEntries, clauseSat v e.clause :=
  entryList_sat P hv bridgeEntries bridgeEntries_wf
theorem bridgeClauses_sat (P : P4DirectBoundaryPacket R profile distribution)
    {{v : Nat → Prop}} (hv : CoreValAgreement P v) : ∀ clause ∈ bridgeClauses, clauseSat v clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  exact bridgeEntries_sat P hv entry hentry

end Problem97.P4CyclicAlternationOccurrenceBridgeScratch
'''


def render() -> dict[str, bytes]:
    manifest, entries, digests = load_entries()
    chunks = [entries[i:i + CHUNK_SIZE] for i in range(0, len(entries), CHUNK_SIZE)]
    files = {f"BridgeChunk{i:02d}.lean": render_chunk(i, chunk).encode()
             for i, chunk in enumerate(chunks, 1)}
    files["BridgeAll.lean"] = render_all(manifest, entries, digests).encode()
    files["Main.lean"] = render_main(entries).encode()
    return files


def generate() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    for name, content in render().items():
        (OUT / name).write_bytes(content)


def verify_generated() -> None:
    expected = render()
    actual = {path.relative_to(OUT).as_posix() for path in OUT.rglob("*.lean") if path.is_file()}
    missing, extra = sorted(set(expected) - actual), sorted(actual - set(expected))
    if missing or extra:
        details = (["missing " + ", ".join(missing)] if missing else []) + (["extra " + ", ".join(extra)] if extra else [])
        raise ValueError("generated file-set drift: " + "; ".join(details))
    for name, content in expected.items():
        if (OUT / name).read_bytes() != content:
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
    _, entries, digests = load_entries()
    print(json.dumps({"count": len(entries), "chunk_size": CHUNK_SIZE, "chunk_sizes": [CHUNK_SIZE] * 9 + [127], "selected_sha256": digests}, sort_keys=True))


if __name__ == "__main__":
    main()
