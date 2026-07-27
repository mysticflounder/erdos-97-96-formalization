#!/usr/bin/env python3
"""Render the authenticated compact-P4 atom binding table.

The table joins the compact manifest's old-to-dense renaming to the named
literal provenance in p4.input-core-map.json.  It does not assign truth values
or assert source satisfaction.
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
PACKAGE = ROOT / "scratch/atail-force/unique4-exact-two-core-map/generated/p4-seed0-compact"
MANIFEST = PACKAGE / "p4-seed0-compact-manifest.json"
LEDGER = PACKAGE / "p4-seed0-compact-occurrences.jsonl"
OUT = HERE / "BindingData.lean"
GENERATED = HERE / "generated"
CHUNK_SIZE = 256

EXPECTED = {
    "source_map": "af829a7c99e0f969f410d398d7c32c2ba5dd945f3a7ebb2ef3f8d7679633d64b",
    "manifest": "61efb4c99512ef3cff6968f1513ebb8e3c9009ad3fcc7bb013da70a5d3f37305",
    "ledger": "b1c159058e659cbd06c4540e72e2ca94eef0ef27602733db0bc44122dcdb4aac",
    "stable": "8d5b8f5adf40cda367e7e7f72f6afc58e75201011e140ff198ace1c836521dd1",
}
EXPECTED_COUNTS = {
    "selected_row_membership": 110,
    "complete_radius_equality": 495,
    "first_apex_class": 11,
    "blocker_choice": 21,
    "critical_support": 68,
    "row_support": 1716,
    "outer_arc": 136,
}
FAMILY = {
    "selected_row_membership": "membership",
    "complete_radius_equality": "radiusEquality",
    "first_apex_class": "firstApexClass",
    "blocker_choice": "blockerChoice",
    "critical_support": "criticalSupport",
    "row_support": "rowSupport",
    "outer_arc": "outerArc",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def lean_string(value: str) -> str:
    return json.dumps(value, ensure_ascii=False)


def collect() -> list[dict]:
    if {"source_map": sha256(CORE_MAP), "manifest": sha256(MANIFEST), "ledger": sha256(LEDGER)} != {
        key: EXPECTED[key] for key in ("source_map", "manifest", "ledger")
    }:
        raise ValueError("authenticated compact-P4 input digest drift")
    manifest = json.loads(MANIFEST.read_text())
    if manifest["stable_digest"]["sha256"] != EXPECTED["stable"]:
        raise ValueError("compact manifest stable digest drift")
    renaming = manifest["dense_variable_renaming"]
    if renaming["dense_variable_count"] != 2557:
        raise ValueError("unexpected compact variable count")
    old_to_dense = dict(renaming["old_to_new"])
    if set(old_to_dense.values()) != set(range(1, 2558)):
        raise ValueError("manifest dense renaming is not exactly 1..2557")

    core_map = json.loads(CORE_MAP.read_text())
    named: dict[int, dict] = {}
    for clause in core_map["core_clauses"]:
        for literal in clause["named_literals"]:
            previous = named.setdefault(literal["variable"], literal)
            # A source variable legitimately occurs with both polarities.  Its
            # semantic name and parameters must nevertheless be stable.
            if any(previous[key] != literal[key]
                   for key in ("variable", "name", "parameters", "variable_family")):
                raise ValueError(f"source variable {literal['variable']} has inconsistent provenance")
    if not set(old_to_dense).issubset(named):
        raise ValueError("a compact source variable lacks named-literal provenance")
    bindings = []
    for source_id, dense in sorted(old_to_dense.items(), key=lambda item: item[1]):
        literal = named[source_id]
        family = literal["variable_family"]
        if family not in FAMILY:
            raise ValueError(f"non-retained family in compact map: {family}")
        bindings.append({"dense": dense, "source_id": source_id, **literal})
    counts = Counter(binding["variable_family"] for binding in bindings)
    if counts != EXPECTED_COUNTS:
        raise ValueError(f"retained family census drifted: {counts}")

    dense_to_old = {dense: old for old, dense in old_to_dense.items()}
    ledger_ids: set[int] = set()
    for line_number, row in enumerate(LEDGER.read_text().splitlines(), start=1):
        occurrence = json.loads(row)
        dense_literals = occurrence["dense_literals"]
        source_literals = occurrence["source_core_literals"]
        if len(dense_literals) != len(source_literals):
            raise ValueError(f"ledger literal arity drift at line {line_number}")
        for dense_literal, source_literal in zip(dense_literals, source_literals):
            expected_source = dense_to_old.get(abs(dense_literal))
            if expected_source != abs(source_literal) or (dense_literal < 0) != (source_literal < 0):
                raise ValueError(f"ledger source/dense literal binding drift at line {line_number}")
            ledger_ids.add(abs(dense_literal))
    if ledger_ids != set(range(1, 2558)):
        raise ValueError("occurrence ledger does not cover exactly all compact dense variables")
    return bindings


def params(binding: dict) -> str:
    p = binding["parameters"]
    family = binding["variable_family"]
    if family == "selected_row_membership":
        return f".membership {p['center']} {p['point']}"
    if family == "complete_radius_equality":
        return f".radiusEquality {p['center']} {p['left']} {p['right']}"
    if family == "first_apex_class":
        return f".firstApexClass {p['point']}"
    if family == "blocker_choice":
        return f".blockerChoice {p['source']} {p['center']}"
    if family == "critical_support":
        return f".criticalSupport {p['source']} {p['point']}"
    if family == "row_support":
        return f".rowSupport {p['center']} {p['point0']} {p['point1']} {p['point2']} {p['point3']}"
    if family == "outer_arc":
        side = ".left" if p["side"] == "left" else ".right"
        return f".outerArc {p['center']} {side} {p['turn_mask']}"
    raise AssertionError(family)


def binding_row(b: dict) -> str:
    return (
        "  { dense := %(dense)s, sourceId := %(source_id)s, sourceName := %(name)s, "
        "family := .%(family)s, parameters := %(parameters)s }," % {
            "dense": b["dense"], "source_id": b["source_id"],
            "name": lean_string(b["name"]), "family": FAMILY[b["variable_family"]],
            "parameters": params(b),
        }
    )


def render_chunk(index: int, bindings: list[dict]) -> str:
    return """import AtomBinding

/-! Generated compact-P4 binding payload chunk. -/

namespace Problem97.P4CompactAtomBindingScratch

def bindingChunk%02d : Array AtomBinding := #[
%s
]

end Problem97.P4CompactAtomBindingScratch
""" % (index, "\n".join(binding_row(b) for b in bindings))


def render(bindings: list[dict], chunk_count: int) -> str:
    imports = "\n".join(f"import generated.BindingChunk{index:02d}" for index in range(1, chunk_count + 1))
    chunks = " ++\n  ".join(f"bindingChunk{index:02d}" for index in range(1, chunk_count + 1))
    return """%s

/-! This file is generated by generate.py; do not edit by hand. -/

namespace Problem97.P4CompactAtomBindingScratch

def bindings : Array AtomBinding :=
  %s

def sourceMapSha256 : String := \"%s\"
def manifestSha256 : String := \"%s\"
def occurrenceLedgerSha256 : String := \"%s\"
def compactManifestStableSha256 : String := \"%s\"

end Problem97.P4CompactAtomBindingScratch
""" % (imports, chunks, EXPECTED["source_map"], EXPECTED["manifest"],
       EXPECTED["ledger"], EXPECTED["stable"])


def render_all(bindings: list[dict]) -> dict[Path, str]:
    chunks = [bindings[offset:offset + CHUNK_SIZE] for offset in range(0, len(bindings), CHUNK_SIZE)]
    rendered = {GENERATED / f"BindingChunk{index:02d}.lean": render_chunk(index, chunk)
                for index, chunk in enumerate(chunks, start=1)}
    rendered[OUT] = render(bindings, len(chunks))
    return rendered


def obsolete_chunk_paths() -> set[Path]:
    return set(GENERATED.glob("BindingChunk*.lean")) if GENERATED.exists() else set()


def write_all(rendered: dict[Path, str]) -> None:
    GENERATED.mkdir(exist_ok=True)
    for path in obsolete_chunk_paths() - set(rendered):
        path.unlink()
    for path, content in rendered.items():
        path.write_text(content)


def check_all(rendered: dict[Path, str]) -> bool:
    return not (obsolete_chunk_paths() - set(rendered)) and all(
        path.exists() and path.read_text() == content for path, content in rendered.items())


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true", help="compare generated output with BindingData.lean")
    args = parser.parse_args()
    rendered = render_all(collect())
    if args.check:
        if not check_all(rendered):
            raise SystemExit("BindingData.lean is stale; run generate.py")
    else:
        write_all(rendered)


if __name__ == "__main__":
    main()
