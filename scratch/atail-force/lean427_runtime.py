"""Canonical Lean 4.27 selection for A-TAIL certificate utilities.

These utilities elaborate generated sources outside the Lake package.  They
must nevertheless use the production project's exact Lake root and toolchain:
ambient ``ELAN_TOOLCHAIN`` selections are not an acceptable substitute.
"""

from __future__ import annotations

import os
from pathlib import Path
import subprocess
from typing import Mapping


TOOLCHAIN = "leanprover/lean4:v4.27.0"
VERSION = "4.27.0"


def canonical_lean_dir(repo_root: Path) -> Path:
    """Return the unique production Lake root and validate its pin."""

    lean_dir = (repo_root.resolve() / "lean").resolve()
    toolchain_file = lean_dir / "lean-toolchain"
    if not toolchain_file.is_file():
        raise RuntimeError(f"canonical Lean root is missing lean-toolchain: {lean_dir}")
    configured = toolchain_file.read_text(encoding="utf-8").strip()
    if configured != TOOLCHAIN:
        raise RuntimeError(
            f"canonical Lean root must pin {TOOLCHAIN}, found {configured!r}"
        )
    return lean_dir


def require_canonical_lean_dir(
    requested: Path, repo_root: Path, option: str
) -> Path:
    """Reject caller-controlled Lake roots for production-oriented utilities."""

    canonical = canonical_lean_dir(repo_root)
    actual = requested.resolve()
    if actual != canonical:
        raise ValueError(
            f"{option} must resolve to the canonical production Lean root "
            f"{canonical}; received {actual}"
        )
    return canonical


def lean427_environment(
    lean_dir: Path, base: Mapping[str, str] | None = None
) -> dict[str, str]:
    """Return an environment that overrides an ambient Elan selection."""

    canonical = canonical_lean_dir(lean_dir.resolve().parent)
    if lean_dir.resolve() != canonical:
        raise ValueError(f"Lean directory is not canonical: {lean_dir.resolve()}")
    environment = dict(os.environ if base is None else base)
    environment["ELAN_TOOLCHAIN"] = TOOLCHAIN
    return environment


def assert_lean427(lean_dir: Path, environment: Mapping[str, str]) -> str:
    """Confirm Lake resolves Lean 4.27 before a utility compiles payloads."""

    output = subprocess.run(
        ["lake", "env", "lean", "--version"],
        cwd=lean_dir,
        env=dict(environment),
        check=False,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    if output.returncode != 0:
        raise RuntimeError(
            f"could not resolve pinned Lean through Lake ({output.returncode}): "
            f"{output.stdout}"
        )
    if f"version {VERSION}" not in output.stdout:
        raise RuntimeError(
            f"Lake resolved a non-{VERSION} Lean toolchain: {output.stdout.strip()}"
        )
    return output.stdout.strip()
