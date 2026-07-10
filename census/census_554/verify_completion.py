"""Consumer-side verifier for a published Census554 completion pointer."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
from pathlib import Path
from typing import Callable


class CompletionVerificationError(RuntimeError):
    """Raised when a completion pointer or one of its artifacts is invalid."""


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _inside(root: Path, relative: str) -> Path:
    path = (root / relative).resolve()
    try:
        path.relative_to(root.resolve())
    except ValueError as exc:
        raise CompletionVerificationError(f"artifact escapes root: {relative}") from exc
    return path


def verify_completion(
    root: str | os.PathLike[str],
    *,
    checker: str = "drat-trim",
    timeout: int = 14_400,
    command_runner: Callable[..., subprocess.CompletedProcess[str]] = subprocess.run,
) -> dict:
    """Verify pointer schema, all recorded digests, and the DRAT proof again."""

    root_path = Path(root).resolve()
    marker_path = root_path / "COVERAGE_COMPLETE.json"
    try:
        marker = json.loads(marker_path.read_text(encoding="utf-8"))
    except (FileNotFoundError, json.JSONDecodeError) as exc:
        raise CompletionVerificationError("missing or invalid completion marker") from exc
    if marker.get("schema") != "census554_coverage_pointer.v1":
        raise CompletionVerificationError("legacy or unknown completion marker schema")

    metadata_path = _inside(root_path, marker["metadata"])
    if _sha256(metadata_path) != marker.get("metadata_sha256"):
        raise CompletionVerificationError("metadata digest mismatch")
    metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
    if metadata.get("schema") != "census554_coverage_generation.v1":
        raise CompletionVerificationError("unknown generation schema")
    if metadata.get("generation") != marker.get("generation"):
        raise CompletionVerificationError("pointer/generation mismatch")
    if metadata.get("verdict") != "UNSAT":
        raise CompletionVerificationError("generation is not UNSAT")

    generation_dir = metadata_path.parent
    artifacts = metadata.get("artifacts", {})
    required = ("cnf", "drat", "core", "lrat", "instances", "bank", "certificates")
    paths = {}
    for name in required:
        record = artifacts.get(name)
        if not isinstance(record, dict) or not isinstance(record.get("path"), str):
            raise CompletionVerificationError(f"missing {name} artifact record")
        path = _inside(generation_dir, record["path"])
        if not path.is_file() or _sha256(path) != record.get("sha256"):
            raise CompletionVerificationError(f"{name} artifact digest mismatch")
        paths[name] = path

    checked = command_runner(
        [checker, str(paths["cnf"]), str(paths["drat"])],
        capture_output=True,
        text=True,
        timeout=timeout,
    )
    output = checked.stdout + "\n" + checked.stderr
    if checked.returncode != 0 or "s VERIFIED" not in output:
        raise CompletionVerificationError("independent DRAT recheck failed")
    return metadata


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    args = parser.parse_args()
    metadata = verify_completion(args.root)
    print(
        "VERIFIED "
        f"generation={metadata['generation']} "
        f"instances={metadata['artifacts']['instances']['rows']} "
        f"core_instances={metadata['artifacts']['instances']['core_rows']}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
