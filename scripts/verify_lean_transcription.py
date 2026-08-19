#!/usr/bin/env python3
"""Tier-2b transcription check: re-emit the Lean certificate banks and diff.

The algebraic recheck settles whether each committed certificate JSON states a
true identity.  It says nothing about whether the committed Lean modules carry
that same certificate.  This script closes that gap by re-running the emitters
from the committed JSON into a scratch tree and comparing the result byte for
byte with the committed Lean tree.  A difference is a provenance break.

No Lean build is needed for the diff, and nothing under ``lean/`` is written:
every emitter output path is redirected into ``--out-root``.  In particular
``scripts/multi-center-sweep-certificate.py``'s ``main()`` -- which writes six
committed Lean modules -- is never invoked from anywhere in this campaign.

The endpoint bank needs two passes, as
``certificates/endpoint/README.md`` documents: the directory pass, then a
term-sharded overwrite for each id in ``PRODUCT_SUM_ENDPOINT_IDS``
(``scripts/endpoint-certificate.py:1028``).  A single directory pass leaves
those 12 rows in the flat form and does not reproduce the committed tree.

Both emitters embed the certificate path they were given verbatim in a
``Source certificate:`` comment (``scripts/endpoint-certificate.py:812,823``;
``scripts/pinned-surplus-certificate.py:1318,1342``), so the input directory
must be passed as a repository-relative path from the repository root.  An
absolute path changes the emitted bytes.

Usage:
    uv run python scripts/verify_lean_transcription.py verify \
        --repo-root . \
        --out-root <run-root>/tmp/lean-emit \
        --report <run-root>/artifacts/lean-transcription.json
"""

from __future__ import annotations

import argparse
import ast
import hashlib
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path
from typing import Any

SCHEMA = "nonpiqd-lean-transcription/v1"

ENDPOINT_JSON_DIR = "certificates/endpoint"
ENDPOINT_LEAN_DIR = "lean/Erdos9796Proof/P97/EndpointCertificate/Patterns"
ENDPOINT_MODULE_ROOT = "Erdos9796Proof.P97.EndpointCertificate.Patterns"

SURPLUS_JSON_DIR = "certificates/surplus/relaxed_split_singleton"
SURPLUS_LEAN_DIR = "lean/Erdos9796Proof/P97/SurplusCertificate/RelaxedSplit"

# Committed modules under SURPLUS_LEAN_DIR that these emitters do not produce.
# Bank.lean comes from --emit-relaxed-split-row-bank; Payload.lean is written
# by hand.  Both are reported separately rather than counted as a break.
SURPLUS_NOT_EMITTED = ("Bank.lean", "Payload.lean")

SURPLUS_SHARD_THRESHOLD = 40000
BLOCK_SIZE = 100


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def tree_digests(root: Path) -> dict[str, str]:
    if not root.is_dir():
        return {}
    return {
        path.relative_to(root).as_posix(): sha256_file(path)
        for path in sorted(root.rglob("*"))
        if path.is_file()
    }


def compare_trees(
    emitted: Path, committed: Path, *, ignore: tuple[str, ...] = ()
) -> dict[str, Any]:
    left = tree_digests(emitted)
    right = {k: v for k, v in tree_digests(committed).items() if k not in ignore}
    identical = sorted(k for k in left.keys() & right.keys() if left[k] == right[k])
    differing = sorted(k for k in left.keys() & right.keys() if left[k] != right[k])
    only_emitted = sorted(left.keys() - right.keys())
    only_committed = sorted(right.keys() - left.keys())
    return {
        "emitted_files": len(left),
        "committed_files": len(right),
        "identical": len(identical),
        "differing": differing[:40],
        "differing_count": len(differing),
        "only_emitted": only_emitted[:40],
        "only_emitted_count": len(only_emitted),
        "only_committed": only_committed[:40],
        "only_committed_count": len(only_committed),
        "ignored_committed": list(ignore),
        "byte_identical": not differing and not only_emitted and not only_committed,
    }


def run(command: list[str], repo_root: Path, timeout_s: int) -> dict[str, Any]:
    started = time.monotonic()
    try:
        proc = subprocess.run(
            command,
            cwd=repo_root,
            capture_output=True,
            text=True,
            timeout=timeout_s,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {
            "command": command[1:],
            "returncode": None,
            "timed_out": True,
            "seconds": round(time.monotonic() - started, 3),
        }
    return {
        "command": command[1:],
        "returncode": proc.returncode,
        "timed_out": False,
        "stderr_tail": proc.stderr.strip()[-1200:],
        "seconds": round(time.monotonic() - started, 3),
    }


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


# --------------------------------------------------------------------------
# endpoint
# --------------------------------------------------------------------------


def verify_endpoint(repo_root: Path, out_root: Path, timeout_s: int) -> dict[str, Any]:
    tool = load_module(
        repo_root / "scripts" / "endpoint-certificate.py", "endpoint_certificate_tool"
    )
    out = out_root / "endpoint"
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)
    script = "scripts/endpoint-certificate.py"

    steps = [
        run(
            [
                sys.executable,
                script,
                "--emit-lean-dir",
                ENDPOINT_JSON_DIR,
                "--lean-out-dir",
                str(out),
                "--lean-aggregate-out",
                str(out / "All.lean"),
                "--lean-module-root",
                ENDPOINT_MODULE_ROOT,
                "--quiet",
            ],
            repo_root,
            timeout_s,
        )
    ]

    for pid in sorted(tool.PRODUCT_SUM_ENDPOINT_IDS):
        stem = tool.lean_module_stem(pid)
        steps.append(
            run(
                [
                    sys.executable,
                    script,
                    "--emit-lean-term-sharded",
                    f"{ENDPOINT_JSON_DIR}/{pid}.json",
                    "--lean-out",
                    str(out / f"{stem}.lean"),
                    "--lean-shard-out-dir",
                    str(out / f"{stem}TermShards"),
                    "--block-size",
                    str(BLOCK_SIZE),
                    "--quiet",
                ],
                repo_root,
                timeout_s,
            )
        )

    return {
        "family": "endpoint",
        "json_dir": ENDPOINT_JSON_DIR,
        "committed_lean_dir": ENDPOINT_LEAN_DIR,
        "term_sharded_ids": sorted(tool.PRODUCT_SUM_ENDPOINT_IDS),
        "steps": steps,
        "all_steps_succeeded": all(s.get("returncode") == 0 for s in steps),
        "diff": compare_trees(out, repo_root / ENDPOINT_LEAN_DIR),
    }


# --------------------------------------------------------------------------
# surplus
# --------------------------------------------------------------------------


def verify_surplus(repo_root: Path, out_root: Path, timeout_s: int) -> dict[str, Any]:
    out = out_root / "surplus"
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)

    step = run(
        [
            sys.executable,
            "scripts/pinned-surplus-certificate.py",
            "--emit-relaxed-split-lean-dir",
            SURPLUS_JSON_DIR,
            "--lean-out-dir",
            str(out),
            "--lean-aggregate-out",
            str(out / "All.lean"),
            "--block-size",
            str(BLOCK_SIZE),
            "--lean-shard-threshold",
            str(SURPLUS_SHARD_THRESHOLD),
        ],
        repo_root,
        timeout_s,
    )

    entry: dict[str, Any] = {
        "family": "surplus_relaxed_split_singleton",
        "json_dir": SURPLUS_JSON_DIR,
        "committed_lean_dir": SURPLUS_LEAN_DIR,
        "steps": [step],
        "all_steps_succeeded": step.get("returncode") == 0,
        "diff": compare_trees(
            out, repo_root / SURPLUS_LEAN_DIR, ignore=SURPLUS_NOT_EMITTED
        ),
    }
    if not entry["all_steps_succeeded"]:
        entry["blocked"] = classify_surplus_failure(repo_root, step)
        entry["row_replay"] = surplus_row_replay(repo_root, out_root)
    return entry


def classify_surplus_failure(repo_root: Path, step: dict[str, Any]) -> dict[str, Any]:
    """Name the missing producer symbols when the surplus emitter aborts.

    The surplus emitter reaches its polynomial helpers through the dynamically
    loaded endpoint tool (``scripts/pinned-surplus-certificate.py:50``).  If a
    helper is gone from ``scripts/endpoint-certificate.py`` the emit aborts, and
    every certificate above the shard threshold becomes unreproducible.

    One call site is deliberately tolerant: ``:228`` wraps
    ``run_singular_script`` in ``except AttributeError`` with a local fallback.
    A guarded site is reported but is not a break, so the two are counted apart.
    """
    tool = load_module(
        repo_root / "scripts" / "endpoint-certificate.py", "endpoint_certificate_tool"
    )
    path = repo_root / "scripts" / "pinned-surplus-certificate.py"
    tree = ast.parse(path.read_text(encoding="utf-8"), filename=str(path))

    guarded_lines: set[int] = set()
    for node in ast.walk(tree):
        if not isinstance(node, ast.Try):
            continue
        tolerant = any(
            isinstance(handler.type, ast.Name) and handler.type.id == "AttributeError"
            for handler in node.handlers
        )
        if not tolerant:
            continue
        for statement in node.body:
            for inner in ast.walk(statement):
                if hasattr(inner, "lineno"):
                    guarded_lines.add(inner.lineno)

    missing: list[dict[str, Any]] = []
    for node in ast.walk(tree):
        if not isinstance(node, ast.Attribute):
            continue
        if not (isinstance(node.value, ast.Name) and node.value.id == "endpoint_tool"):
            continue
        if hasattr(tool, node.attr):
            continue
        missing.append(
            {
                "symbol": node.attr,
                "call_site_line": node.lineno,
                "guarded_by_attributeerror": node.lineno in guarded_lines,
            }
        )
    missing.sort(key=lambda item: item["call_site_line"])
    return {
        "missing_producer_symbols": missing,
        "unguarded_missing_symbols": [
            item for item in missing if not item["guarded_by_attributeerror"]
        ],
        "stderr_tail": step.get("stderr_tail"),
    }


def surplus_row_replay(repo_root: Path, out_root: Path) -> dict[str, Any]:
    """Bound the break: replay every row the working code path can still emit.

    ``emit_relaxed_split_lean_dir`` routes a certificate to the term-sharded
    emitter when its content size passes the threshold
    (``scripts/pinned-surplus-certificate.py:1794-1799``).  Only that branch is
    broken.  This pass calls the direct branch itself, one certificate at a
    time, and diffs each emitted module against the committed one, so the
    report says how many rows are reproducible rather than only where the
    directory run stopped.  It bypasses the CLI on purpose and is labelled as a
    scope measurement, not as a reproduction of the documented command.
    """
    producer = load_module(
        repo_root / "scripts" / "pinned-surplus-certificate.py",
        "pinned_surplus_certificate_tool",
    )
    scratch = out_root / "surplus-rows"
    if scratch.exists():
        shutil.rmtree(scratch)
    scratch.mkdir(parents=True)
    committed_dir = repo_root / SURPLUS_LEAN_DIR

    reproduced: list[str] = []
    differing: list[str] = []
    blocked: list[str] = []
    absent: list[str] = []
    # The emitter writes the certificate path it was handed into a
    # "Source certificate:" comment, so it must be handed the repository-
    # relative path the committed modules carry.  That means running from the
    # repository root, the same requirement the documented CLI has.
    previous = Path.cwd()
    os.chdir(repo_root)
    try:
        for cert_path in producer.relaxed_certificate_paths(Path(SURPLUS_JSON_DIR)):
            cert_id, _variables, _generators, _coefficients = (
                producer.read_relaxed_certificate(cert_path)
            )
            stem = producer.relaxed_lean_module_stem(cert_id)
            if (
                producer.relaxed_certificate_source_size(cert_path)
                > SURPLUS_SHARD_THRESHOLD
            ):
                blocked.append(stem)
                continue
            out_path = scratch / f"{stem}.lean"
            producer.emit_relaxed_split_lean_certificate(
                cert_path,
                out_path,
                producer.safe_lean_decl_name(cert_id),
                namespace_suffix="RelaxedSplit",
            )
            committed = committed_dir / f"{stem}.lean"
            if not committed.is_file():
                absent.append(stem)
            elif sha256_file(out_path) == sha256_file(committed):
                reproduced.append(stem)
            else:
                differing.append(stem)
    finally:
        os.chdir(previous)

    return {
        "note": (
            "direct-branch replay, bypassing the CLI, to bound how much of the "
            "bank is still reproducible from its JSON"
        ),
        "shard_threshold": SURPLUS_SHARD_THRESHOLD,
        "rows_total": len(reproduced) + len(differing) + len(blocked) + len(absent),
        "byte_identical": len(reproduced),
        "differing": differing,
        "blocked_term_sharded": len(blocked),
        "blocked_stems": blocked,
        "absent_from_committed_tree": absent,
    }


# --------------------------------------------------------------------------
# driver
# --------------------------------------------------------------------------


def git_head(repo_root: Path) -> str | None:
    proc = subprocess.run(
        ["git", "rev-parse", "HEAD"],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=False,
    )
    return proc.stdout.strip() or None


def tracked_tree_state(repo_root: Path, *paths: str) -> str:
    """Digest of the git index entries under ``paths``.

    Recorded before and after the emit runs.  A change means an emitter wrote
    into the repository instead of the scratch tree.
    """
    proc = subprocess.run(
        ["git", "status", "--porcelain=v1", "--", *paths],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=False,
    )
    return hashlib.sha256(proc.stdout.encode("utf-8")).hexdigest()


def command_verify(args: argparse.Namespace) -> int:
    repo_root = args.repo_root.resolve()
    out_root = (repo_root / args.out_root).resolve()
    out_root.mkdir(parents=True, exist_ok=True)

    guarded = ("lean", "certificates")
    before = tracked_tree_state(repo_root, *guarded)

    families = [
        verify_endpoint(repo_root, out_root, args.timeout_s),
        verify_surplus(repo_root, out_root, args.timeout_s),
    ]

    after = tracked_tree_state(repo_root, *guarded)

    report = {
        "schema": SCHEMA,
        "repo_head": git_head(repo_root),
        "out_root": args.out_root,
        "write_guard": {
            "paths": list(guarded),
            "before": before,
            "after": after,
            "unchanged": before == after,
        },
        "families": families,
        "byte_identical_families": [
            f["family"] for f in families if f["diff"]["byte_identical"]
        ],
        "broken_families": [
            f["family"] for f in families if not f["diff"]["byte_identical"]
        ],
    }

    if args.report is not None:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(
            json.dumps(report, sort_keys=True, indent=2, ensure_ascii=False) + "\n",
            encoding="utf-8",
        )
    sys.stdout.write(json.dumps(report, sort_keys=True, indent=2) + "\n")

    if not report["write_guard"]["unchanged"]:
        sys.stderr.write("an emitter wrote into lean/ or certificates/\n")
        return 3
    return 0 if not report["broken_families"] else 2


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    verify = sub.add_parser("verify", help="Re-emit both banks and diff.")
    verify.add_argument("--repo-root", type=Path, default=Path("."))
    verify.add_argument("--out-root", required=True)
    verify.add_argument("--report", type=Path)
    verify.add_argument("--timeout-s", type=int, default=1800)
    verify.set_defaults(func=command_verify)
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    return int(args.func(args))


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
