#!/usr/bin/env python3
"""Materialize collision-free module copies of the three generated P4 closures."""

from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
SOURCE_ROOT = ROOT / "scratch" / "atail-force"
OUTPUT_ROOT = SOURCE_ROOT / "unique4-p4-prefixed-closures"
MODULE_ROOT = OUTPUT_ROOT / "P4OccurrenceClosure"

CLOSURES = {
    "MutualTransport": (
        SOURCE_ROOT / "unique4-p4-occurrence-bridge",
        {
            "Core": "P4OccurrenceClosure.MutualTransport.Core",
            "Families": "P4OccurrenceClosure.MutualTransport.Families",
            "BridgeChunk01": "P4OccurrenceClosure.MutualTransport.BridgeChunk01",
            "BridgeChunk02": "P4OccurrenceClosure.MutualTransport.BridgeChunk02",
            "BridgeChunk03": "P4OccurrenceClosure.MutualTransport.BridgeChunk03",
            "BridgeChunk04": "P4OccurrenceClosure.MutualTransport.BridgeChunk04",
            "BridgeAll": "P4OccurrenceClosure.MutualTransport.BridgeAll",
            "Main": "P4OccurrenceClosure.MutualTransport.Main",
            "Orientation": "P4OccurrenceClosure.MutualTransport.Orientation",
        },
    ),
    "CyclicAlternation": (
        SOURCE_ROOT / "unique4-p4-cyclic-alternation-occurrence-bridge",
        {
            "Core": "P4OccurrenceClosure.CyclicAlternation.Core",
            "Families": "P4OccurrenceClosure.CyclicAlternation.Families",
            **{
                f"BridgeChunk{i:02d}":
                    f"P4OccurrenceClosure.CyclicAlternation.BridgeChunk{i:02d}"
                for i in range(1, 11)
            },
            "BridgeAll": "P4OccurrenceClosure.CyclicAlternation.BridgeAll",
            "Main": "P4OccurrenceClosure.CyclicAlternation.Main",
        },
    ),
    "Kalmanson": (
        SOURCE_ROOT / "unique4-p4-kalmanson-occurrence-bridge",
        {
            "KalmansonCore": "P4OccurrenceClosure.Kalmanson.KalmansonCore",
            "Families": "P4OccurrenceClosure.Kalmanson.Families",
            **{
                f"BridgeChunk{i:02d}": f"P4OccurrenceClosure.Kalmanson.BridgeChunk{i:02d}"
                for i in range(1, 16)
            },
            "BridgeAll": "P4OccurrenceClosure.Kalmanson.BridgeAll",
            "Main": "P4OccurrenceClosure.Kalmanson.Main",
        },
    ),
}


def source_files(source_dir: Path) -> list[Path]:
    files = sorted(source_dir.glob("*.lean"))
    files.extend(sorted((source_dir / "generated").glob("*.lean")))
    return files


def rewrite_imports(closure: str, text: str, modules: dict[str, str]) -> str:
    output = []
    for line in text.splitlines(keepends=True):
        if not line.startswith("import "):
            output.append(line)
            continue
        imported = line.removeprefix("import ").strip()
        replacement = modules.get(imported)
        if closure == "Kalmanson" and imported == "Core":
            replacement = "P4OccurrenceClosure.MutualTransport.Core"
        output.append(f"import {replacement}\n" if replacement else line)
    return "".join(output)


def main() -> None:
    copied = 0
    for closure, (source_dir, modules) in CLOSURES.items():
        target_dir = MODULE_ROOT / closure
        target_dir.mkdir(parents=True, exist_ok=True)
        for source in source_files(source_dir):
            target = target_dir / source.name
            original = source.read_text()
            rewritten = rewrite_imports(closure, original, modules)
            if closure == "Kalmanson" and source.name == "Core.lean":
                rewritten += "\n/-! Compatibility import for the prefixed Kalmanson closure. -/\n"
            target.write_text(rewritten)
            copied += 1

    smoke = """import P4OccurrenceClosure.MutualTransport.Orientation
import P4OccurrenceClosure.CyclicAlternation.Main
import P4OccurrenceClosure.Kalmanson.Main

/-! Simultaneous-import smoke test for the three prefixed P4 occurrence closures. -/

#check Problem97.P4MutualTransportOccurrenceBridgeScratch.bridgeClauses_sat_direct
#check Problem97.P4MutualTransportOccurrenceBridgeScratch.bridgeClauses_sat_mirror
#check Problem97.P4CyclicAlternationOccurrenceBridgeScratch.bridgeClauses_sat
#check Problem97.P4KalmansonOccurrenceBridgeScratch.bridgeClauses_sat_direct
#check Problem97.P4KalmansonOccurrenceBridgeScratch.bridgeClauses_sat_mirror
"""
    (MODULE_ROOT / "Smoke.lean").write_text(smoke)
    print(f"materialized {copied} copied modules under {OUTPUT_ROOT}")


if __name__ == "__main__":
    main()
