#!/usr/bin/env python3
"""Compile the generated scratch BitVec circuit in dependency order.

The source tree is outside Lake's configured roots, so direct source imports do
not work.  This driver asks Lake for the exact Lean binary/search path, places
scratch oleans under a temporary module root, compiles ``Base`` first, compiles
all independent chunks in parallel, and only then compiles the aggregate file.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import os
from pathlib import Path
import subprocess
import sys
import time


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ATAIL_ROOT = ROOT / "scratch" / "atail-force"
if str(ATAIL_ROOT) not in sys.path:
    sys.path.insert(0, str(ATAIL_ROOT))
from lean427_runtime import (  # noqa: E402
    assert_lean427,
    canonical_lean_dir,
    lean427_environment,
)

LEAN_DIR = canonical_lean_dir(ROOT)
CHUNKS = HERE / "ExactFiveCard13BVCircuitChunks"
MAIN = HERE / "ExactFiveCard13BVCircuit.lean"
CORE_CHUNKS = HERE / "ExactFiveCard13BVSourceCoreChunks"


def lake_output(*args: str, env: dict[str, str]) -> str:
    result = subprocess.run(
        ["lake", "env", *args],
        cwd=LEAN_DIR,
        env=env,
        check=True,
        text=True,
        stdout=subprocess.PIPE,
    )
    return result.stdout.strip().splitlines()[-1]


def module_output(output_root: Path, source: Path) -> tuple[Path, Path]:
    relative = source.relative_to(HERE).with_suffix("")
    olean = (output_root / relative).with_suffix(".olean")
    ilean = (output_root / relative).with_suffix(".ilean")
    olean.parent.mkdir(parents=True, exist_ok=True)
    return olean, ilean


def compile_one(
    lean: str,
    lean_path: str,
    output_root: Path,
    source: Path,
    base_env: dict[str, str],
) -> tuple[str, float]:
    olean, ilean = module_output(output_root, source)
    env = dict(base_env)
    env["LEAN_PATH"] = os.pathsep.join((str(output_root), lean_path))
    command = [
        lean,
        "-M", "4096",
        "-DwarningAsError=true",
        "-R", str(HERE),
        "-o", str(olean),
        "-i", str(ilean),
        str(source),
    ]
    started = time.monotonic()
    log = output_root / "logs" / f"{source.stem}.log"
    log.parent.mkdir(parents=True, exist_ok=True)
    with log.open("w", encoding="utf-8") as handle:
        result = subprocess.run(
            command,
            cwd=LEAN_DIR,
            env=env,
            text=True,
            stdout=handle,
            stderr=subprocess.STDOUT,
        )
    elapsed = time.monotonic() - started
    if result.returncode != 0:
        output = log.read_text(encoding="utf-8")
        raise RuntimeError(
            f"Lean failed for {source.name} after {elapsed:.1f}s; log={log}\n"
            f"{output[-20000:]}"
        )
    return source.name, elapsed


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--jobs", type=int, default=16)
    parser.add_argument(
        "--output-root", type=Path, default=Path("/tmp/exact5-card13-bv")
    )
    parser.add_argument(
        "--stage",
        choices=("base", "one-chunk", "chunks", "all"),
        default="all",
    )
    parser.add_argument(
        "--circuit",
        choices=(
            "full",
            "direct-core",
            "mirror-core",
            "direct-flat",
            "mirror-flat",
            "cube6-worst",
        ),
        default="full",
    )
    args = parser.parse_args()
    if args.jobs < 1 or args.jobs > 24:
        raise ValueError("--jobs must lie in [1, 24]")

    lean_env = lean427_environment(LEAN_DIR)
    assert_lean427(LEAN_DIR, lean_env)
    lean = lake_output("which", "lean", env=lean_env)
    lean_path = lake_output("printenv", "LEAN_PATH", env=lean_env)
    args.output_root.mkdir(parents=True, exist_ok=True)

    name, elapsed = compile_one(
        lean, lean_path, args.output_root, CHUNKS / "Base.lean", lean_env
    )
    print(f"compiled {name} in {elapsed:.1f}s", flush=True)
    if args.stage == "base":
        return

    if args.circuit == "full":
        chunk_sources = sorted(CHUNKS.glob("Common*.lean")) + [
            CHUNKS / "DirectRole.lean",
            CHUNKS / "MirrorRole.lean",
        ]
        main_source = MAIN
    elif args.circuit in {"direct-core", "mirror-core"}:
        prefix = "Direct" if args.circuit == "direct-core" else "Mirror"
        chunk_sources = sorted(CORE_CHUNKS.glob(f"{prefix}[0-9][0-9][0-9].lean"))
        main_source = HERE / f"ExactFiveCard13BVSourceCore{prefix}.lean"
        if not chunk_sources:
            raise FileNotFoundError(f"no generated {prefix} source-core chunks")
    elif args.circuit in {"direct-flat", "mirror-flat"}:
        prefix = "Direct" if args.circuit == "direct-flat" else "Mirror"
        chunk_sources = []
        main_source = HERE / f"ExactFiveCard13BVSourceCore{prefix}Flat.lean"
    else:
        chunk_sources = []
        main_source = HERE / "ExactFiveCard13BVCube6WorstLeaf.lean"
    if args.stage == "one-chunk":
        chunk_sources = chunk_sources[:1]
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
        futures = {
            pool.submit(
                compile_one, lean, lean_path, args.output_root, source, lean_env
            ): source
            for source in chunk_sources
        }
        completed = 0
        for future in concurrent.futures.as_completed(futures):
            name, elapsed = future.result()
            completed += 1
            print(
                f"compiled {name} in {elapsed:.1f}s "
                f"({completed}/{len(chunk_sources)})",
                flush=True,
            )
    if args.stage in {"one-chunk", "chunks"}:
        return
    name, elapsed = compile_one(
        lean, lean_path, args.output_root, main_source, lean_env
    )
    print(f"compiled {name} in {elapsed:.1f}s", flush=True)


if __name__ == "__main__":
    try:
        main()
    except Exception as error:
        print(error, file=sys.stderr)
        raise
