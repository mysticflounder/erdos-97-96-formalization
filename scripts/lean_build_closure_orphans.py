#!/usr/bin/env python3
"""Report Lean modules outside the declared lake library closure.

`lean/lakefile.toml` declares each `lean_lib` with neither `roots` nor `globs`,
so `lake build` compiles exactly the transitive import closure of the declared
root modules.  Any other module under the source trees is never compiled, never
reported, and keeps whatever `.olean` it last had.  This script names those
modules.

Usage:
    uv run python scripts/lean_build_closure_orphans.py [--lake-root lean]
                                                        [--json OUT.json]
                                                        [--list OUT.txt]

Exit status is 0 whether or not orphans exist; the count is on stdout.
"""

from __future__ import annotations

import argparse
import json
import os
import re
from pathlib import Path

# Every module name `lean/lakefile.toml` declares as a build root: the three
# `lean_lib` roots plus the `erase_m1_gate` executable root.
ROOTS = (
    "Erdos9796",
    "Erdos9796Proof",
    "Erdos9796BankSupport",
    "Erdos9796Proof.P97.ErasedCertificate.ErasedNativeEvalGate",
)
# Source trees to walk. The executable root lives under `Erdos9796Proof`.
SOURCE_TREES = ("Erdos9796", "Erdos9796Proof", "Erdos9796BankSupport")
IMPORT_RE = re.compile(r"^import\s+([A-Za-z0-9_.«»]+)", re.M)


def collect(lake_root: Path) -> dict[str, Path]:
    """Map module name -> source path for every module under the two roots."""
    mods: dict[str, Path] = {}
    for base in SOURCE_TREES:
        top = lake_root / f"{base}.lean"
        if top.exists():
            mods[base] = top
        for dirpath, _dirnames, filenames in os.walk(lake_root / base):
            for name in filenames:
                if not name.endswith(".lean"):
                    continue
                path = Path(dirpath) / name
                rel = path.relative_to(lake_root)
                mods[str(rel)[:-5].replace(os.sep, ".")] = path
    return mods


def closure(mods: dict[str, Path]) -> set[str]:
    """Transitive import closure of the declared library roots."""
    edges: dict[str, list[str]] = {}
    for name, path in mods.items():
        text = path.read_text(encoding="utf-8")
        edges[name] = [m for m in IMPORT_RE.findall(text) if m in mods]
    seen: set[str] = set()
    stack = [r for r in ROOTS if r in mods]
    while stack:
        node = stack.pop()
        if node in seen:
            continue
        seen.add(node)
        stack.extend(edges.get(node, ()))
    return seen


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lake-root", default="lean", type=Path)
    parser.add_argument("--json", dest="json_out", type=Path)
    parser.add_argument("--list", dest="list_out", type=Path)
    args = parser.parse_args()

    lake_root = args.lake_root.resolve()
    mods = collect(lake_root)
    reached = closure(mods)
    orphans = sorted(set(mods) - reached)

    print(f"modules={len(mods)} in_closure={len(reached)} orphans={len(orphans)}")

    if args.list_out:
        args.list_out.write_text(
            "".join(f"{str(mods[m].relative_to(lake_root))}\n" for m in orphans),
            encoding="utf-8",
        )
    if args.json_out:
        payload = {
            "schema": "lean-build-closure-orphans/v1",
            "lake_root": str(args.lake_root),
            "library_roots": list(ROOTS),
            "module_count": len(mods),
            "in_closure": len(reached),
            "orphan_count": len(orphans),
            "orphan_modules": orphans,
        }
        args.json_out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
