#!/usr/bin/env python3
"""Measure the 14-equation quotient left by each 15-core deletion."""

from __future__ import annotations

import importlib.util
import json
import re
import subprocess
import sys
import tempfile
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
SYSTEM = HERE / "macaulay_certificate.py"
OUTPUT = HERE / "deletion_dimension_audit.json"


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    system = load_module(SYSTEM, "p97_bank_clean_macaulay_system")
    names, generators, symbols, _polynomials = system.load_system()

    def probe(deleted: str) -> dict[str, object]:
        kept = [
            generator
            for name, generator in zip(names, generators, strict=True)
            if name != deleted
        ]
        source = (
            ",".join(str(symbol) for symbol in symbols)
            + "\n0\n"
            + ",\n".join(text.replace("**", "^") for text in kept)
            + "\n"
        )
        started = time.monotonic()
        with tempfile.TemporaryDirectory(prefix="p97-core14-degree-") as temp:
            root = Path(temp)
            input_path = root / "input.ms"
            output_path = root / "output.ms"
            input_path.write_text(source, encoding="utf-8")
            try:
                process = subprocess.run(
                    [
                        "msolve",
                        "-f",
                        str(input_path),
                        "-o",
                        str(output_path),
                        "-t",
                        "4",
                        "-v",
                        "1",
                    ],
                    capture_output=True,
                    text=True,
                    timeout=20,
                    check=False,
                )
                status = "EXITED"
            except subprocess.TimeoutExpired as exc:
                return {
                    "status": "TIMEOUT",
                    "seconds": time.monotonic() - started,
                    "stdout_tail": (exc.stdout or "")[-1000:],
                }
            trace = process.stdout + "\n" + process.stderr
            degrees = [int(value) for value in re.findall(r"degree of ideal\s+(\d+)", trace)]
            basis_sizes = [int(value) for value in re.findall(r"size of basis\s+(\d+)", trace)]
            if degrees:
                classification = "ZERO_DIMENSIONAL"
            elif "infinitely many solutions" in trace.lower() or "positive dimension" in trace.lower():
                classification = "POSITIVE_DIMENSIONAL"
            else:
                output_text = output_path.read_text(encoding="utf-8") if output_path.exists() else ""
                classification = "UNKNOWN_NONUNIT" if output_text.strip() else "UNKNOWN"
            return {
                "status": status,
                "exit_code": process.returncode,
                "seconds": time.monotonic() - started,
                "classification": classification,
                "degrees": degrees,
                "basis_sizes": basis_sizes,
                "trace_sha256": system.hashlib.sha256(trace.encode()).hexdigest(),
            }

    results: dict[str, dict[str, object]] = {}
    with ThreadPoolExecutor(max_workers=4) as pool:
        futures = {pool.submit(probe, name): name for name in names}
        for future in as_completed(futures):
            name = futures[future]
            results[name] = future.result()
            print(name, results[name], flush=True)
    document = {
        "schema": "p97-bank-clean-15-single-deletion-dimension-audit-v1",
        "results": {name: results[name] for name in names},
    }
    OUTPUT.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(OUTPUT)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
