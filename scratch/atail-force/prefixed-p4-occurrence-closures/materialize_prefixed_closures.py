#!/usr/bin/env python3
"""Materialize collision-free module copies of three generated P4 closures."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


HERE = Path(__file__).resolve().parent
ATAIL_FORCE = HERE.parent

CLOSURES = {
    "unique4-p4-radius-partition-occurrence-bridge": "P4RadiusPartitionOccurrenceBridge",
    "unique4-p4-row-at-least-four-occurrence-bridge": "P4RowAtLeastFourOccurrenceBridge",
    "unique4-p4-row-radius-occurrence-bridge": "P4RowRadiusOccurrenceBridge",
}

LOCAL_IMPORT_RE = re.compile(r"^(import) ([A-Za-z][A-Za-z0-9_]*)\s*$")


def source_files(source_dir: Path) -> dict[str, Path]:
    by_stem: dict[str, Path] = {}
    for path in sorted(source_dir.rglob("*.lean")):
        if path.stem in by_stem:
            raise ValueError(
                f"duplicate module basename {path.stem}: {by_stem[path.stem]} and {path}"
            )
        by_stem[path.stem] = path
    return by_stem


def rewrite_local_imports(text: str, prefix: str, local_modules: set[str]) -> str:
    rewritten: list[str] = []
    for line in text.splitlines(keepends=True):
        bare = line.rstrip("\r\n")
        match = LOCAL_IMPORT_RE.fullmatch(bare)
        if match is None or match.group(2) not in local_modules:
            rewritten.append(line)
            continue
        newline = line[len(bare) :]
        rewritten.append(f"import {prefix}.{match.group(2)}{newline}")
    return "".join(rewritten)


def expected_outputs(source_dir: Path, prefix: str) -> dict[Path, str]:
    sources = source_files(source_dir)
    local_modules = set(sources)
    return {
        HERE / prefix / f"{stem}.lean": rewrite_local_imports(
            path.read_text(), prefix, local_modules
        )
        for stem, path in sources.items()
    }


def smoke_source() -> str:
    return """\
import P4RadiusPartitionOccurrenceBridge.AxiomAudit
import P4RowAtLeastFourOccurrenceBridge.AxiomAudit
import P4RowRadiusOccurrenceBridge.AxiomAudit

/-! Import smoke test for the three collision-free P4 occurrence closures. -/

#check Problem97.P4RadiusPartitionOccurrenceBridgeScratch.bridgeClauses_sat
#check Problem97.P4RowAtLeastFourOccurrenceBridgeScratch.bridgeClauses_sat
#check Problem97.P4RowRadiusOccurrenceBridgeScratch.bridgeClauses_sat_direct
#check Problem97.P4RowRadiusOccurrenceBridgeScratch.bridgeClauses_sat_mirror
"""


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="verify that every materialized file is current without writing",
    )
    args = parser.parse_args()

    expected: dict[Path, str] = {}
    for source_slug, prefix in CLOSURES.items():
        expected.update(expected_outputs(ATAIL_FORCE / source_slug, prefix))
    expected[HERE / "AllThreeSmoke.lean"] = smoke_source()

    stale = [
        path
        for path, content in expected.items()
        if not path.exists() or path.read_text() != content
    ]
    if args.check:
        if stale:
            for path in stale:
                print(f"stale: {path.relative_to(HERE)}")
            return 1
        print(f"checked {len(expected)} files")
        return 0

    for path, content in expected.items():
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content)
    print(f"materialized {len(expected)} files")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
