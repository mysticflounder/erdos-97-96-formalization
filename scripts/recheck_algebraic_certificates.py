#!/usr/bin/env python3
"""Tier-2a independent recheck of the algebraic certificates the Lean spine names.

Each certificate under ``certificates/endpoint/`` and
``certificates/surplus/relaxed_split_singleton/`` asserts the polynomial
identity ``sum_i coefficients[i] * generators[i] = 1`` over its declared
``variables``.  Lean admits each one by ``native_decide``, so the identity rests
on the approved ``Lean.trustCompiler`` axiom rather than on the kernel.  135 of
the 252 were written with the exact-polynomial route switched off and carry
``checks.python_exact_polynomial: false``; that field echoes a command-line
option (``scripts/endpoint-certificate.py:732``), so it reports whether the
check ran, not whether the identity holds.

Three legs run against each certificate.

Leg A -- independent.  sympy exact rational arithmetic over QQ, written here.
It shares no code with either producer: a different parser, a different
polynomial representation, a different arithmetic engine.

Leg B -- producer.  ``check_identity`` from ``scripts/endpoint-certificate.py``,
loaded through the same importlib shim the surplus producer uses
(``scripts/pinned-surplus-certificate.py:50``).  Both families were checked at
write time by exactly this function, so leg B reproduces the write-time check.
It corroborates leg A; it is not a second independent implementation.

Leg B' -- arms length.  ``endpoint-certificate.py --check <dir>`` in a
subprocess, run once per directory.  Only the endpoint family has this entry
point: ``check_certificate_file`` rejects any schema other than
``endpoint_certificate.v1`` (``scripts/endpoint-certificate.py:2028``).

Mutation control.  For every certificate the run also builds two mutants in
memory and puts each through the full leg-A and leg-B path.  Both legs must
reject both mutants.  The run reports ``mutation_control_rejects`` and is void
unless ``n_rejected`` equals ``n_mutants``.

Exit status: 0 clean; 2 when a certificate fails, a leg errors, or the two legs
disagree; 3 when the mutation control is void; 1 on checker error.

Usage:
    uv run --with sympy python scripts/recheck_algebraic_certificates.py recheck \
        --repo-root . \
        --root certificates/endpoint \
        --root certificates/surplus/relaxed_split_singleton \
        --jobs 8 \
        --out <run-root>/artifacts/algebraic-recheck.jsonl \
        --summary-out <run-root>/artifacts/algebraic-recheck-summary.json
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import multiprocessing
import os
import re
import stat
import subprocess
import sys
import time
from collections import Counter
from concurrent.futures import ProcessPoolExecutor
from pathlib import Path
from typing import Any

import sympy
from sympy.parsing.sympy_parser import (
    convert_xor,
    parse_expr,
    standard_transformations,
)

SCHEMA = "nonpiqd-algebraic-recheck/v1"
SUMMARY_SCHEMA = "nonpiqd-algebraic-recheck-summary/v1"

ENDPOINT_SCHEMA = "endpoint_certificate.v1"
SURPLUS_SCHEMA = "pinned_surplus_relaxed_split_certificate.v1"
SUPPORTED_SCHEMAS = frozenset({ENDPOINT_SCHEMA, SURPLUS_SCHEMA})

HOLDS = "HOLDS"
FAILS = "FAILS"
ERROR = "ERROR"

INDEPENDENT_ENGINE = "sympy-poly-QQ"
PRODUCER_ENGINE = "endpoint_certificate_tool.check_identity"

# Bounded reads, following census/card_head/exact12_next_row_arm_static_v24_validator.py.
MAX_FILE_BYTES = 256 * 1024 * 1024
MAX_JSON_BYTES = 64 * 1024 * 1024

# ``^`` in these certificates is exponentiation.  sympy's default reading of
# ``^`` is XOR, so convert_xor is mandatory, not cosmetic.
_TRANSFORMS = standard_transformations + (convert_xor,)

# The parser needs the numeric and symbol constructors that auto_number and
# auto_symbol emit, and nothing else.  Withholding the rest of the sympy
# namespace keeps a certificate string from naming a callable.
_PARSE_GLOBALS = {
    "Integer": sympy.Integer,
    "Float": sympy.Float,
    "Rational": sympy.Rational,
    "Symbol": sympy.Symbol,
}

# Match a FULL extension.  An alternation on `json` truncates `bank.jsonl` to
# `bank.json` and reports false dangling links.
_LEAN_CERT_REF = re.compile(r"certificates/[A-Za-z0-9_./-]+\.[A-Za-z0-9]+")

_TOOL: Any = None


# --------------------------------------------------------------------------
# bounded IO
# --------------------------------------------------------------------------


def _read_regular(path: Path) -> bytes:
    """Read a regular file below the size bound, never following a symlink."""
    fd = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    try:
        info = os.fstat(fd)
        if not stat.S_ISREG(info.st_mode):
            raise ValueError(f"{path}: not a regular file")
        if info.st_size > MAX_FILE_BYTES:
            raise ValueError(f"{path}: {info.st_size} bytes exceeds the read bound")
        with os.fdopen(fd, "rb") as handle:
            fd = -1
            return handle.read()
    finally:
        if fd >= 0:
            os.close(fd)


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    out: dict[str, Any] = {}
    for key, value in pairs:
        if key in out:
            raise ValueError(f"duplicate JSON key {key!r}")
        out[key] = value
    return out


def load_certificate(path: Path) -> tuple[dict[str, Any], str]:
    """Return the parsed certificate and the sha256 of its bytes on disk."""
    raw = _read_regular(path)
    if len(raw) > MAX_JSON_BYTES:
        raise ValueError(f"{path}: {len(raw)} bytes exceeds the JSON bound")
    digest = hashlib.sha256(raw).hexdigest()
    cert = json.loads(raw.decode("utf-8"), object_pairs_hook=_reject_duplicate_keys)
    if not isinstance(cert, dict):
        raise TypeError(f"{path}: top level is not an object")
    return cert, digest


def payload(cert: dict[str, Any]) -> tuple[list[str], list[str], list[str]]:
    variables = cert.get("variables")
    generators = cert.get("generators")
    coefficients = cert.get("coefficients")
    for name, value in (
        ("variables", variables),
        ("generators", generators),
        ("coefficients", coefficients),
    ):
        if not isinstance(value, list) or not all(isinstance(x, str) for x in value):
            raise ValueError(f"invalid {name}")
    if not variables:
        raise ValueError("certificate declares no variables")
    if len(generators) != len(coefficients):
        raise ValueError(
            f"generator/coefficient length mismatch: "
            f"{len(generators)} != {len(coefficients)}"
        )
    return variables, generators, coefficients


# --------------------------------------------------------------------------
# leg A -- independent sympy arithmetic
# --------------------------------------------------------------------------


def _symbol_table(variables: list[str]) -> dict[str, sympy.Symbol]:
    seen: set[str] = set()
    table: dict[str, sympy.Symbol] = {}
    for name in variables:
        if not name.isidentifier():
            raise ValueError(f"variable {name!r} is not an identifier")
        if name in seen:
            raise ValueError(f"variable {name!r} is declared twice")
        seen.add(name)
        table[name] = sympy.Symbol(name)
    return table


def parse_polynomial(text: str, table: dict[str, sympy.Symbol]) -> sympy.Expr:
    """Parse one certificate polynomial string exactly.

    Rejects a float literal and any symbol the certificate did not declare.  An
    undeclared name would otherwise become a fresh free symbol and let a
    typo-ridden certificate still cancel to 1.
    """
    expr = parse_expr(
        text,
        local_dict=table,
        global_dict=_PARSE_GLOBALS,
        transformations=_TRANSFORMS,
    )
    if expr.atoms(sympy.Float):
        raise ValueError("floating point literal in an exact certificate")
    undeclared = sorted(symbol.name for symbol in expr.free_symbols)
    undeclared = [name for name in undeclared if name not in table]
    if undeclared:
        raise ValueError(f"undeclared symbols {undeclared}")
    return expr


def independent_leg(
    cert: dict[str, Any], *, want_mutation_index: bool = False
) -> dict[str, Any]:
    """Re-derive ``sum_i c_i * g_i = 1`` with sympy over QQ."""
    variables, generators, coefficients = payload(cert)
    table = _symbol_table(variables)
    order = [table[name] for name in variables]

    parsed_generators = [parse_polynomial(text, table) for text in generators]
    parsed_coefficients = [parse_polynomial(text, table) for text in coefficients]

    total: sympy.Expr = sympy.Integer(0)
    for coefficient, generator in zip(
        parsed_coefficients, parsed_generators, strict=True
    ):
        total = total + coefficient * generator

    residual = sympy.Poly(total - 1, *order, domain=sympy.QQ)
    holds = bool(residual.is_zero)
    entry: dict[str, Any] = {
        "engine": INDEPENDENT_ENGINE,
        "verdict": HOLDS if holds else FAILS,
        "residual_terms": 0 if holds else len(residual.terms()),
    }
    if want_mutation_index:
        entry["mutation_index"] = _mutation_index(
            order, parsed_generators, parsed_coefficients
        )
    return entry


def _mutation_index(
    order: list[sympy.Symbol],
    generators: list[sympy.Expr],
    coefficients: list[sympy.Expr],
) -> int | None:
    """Smallest index whose coefficient and generator are both nonzero.

    Perturbing an index where either side vanishes leaves the sum unchanged, so
    the mutant would still verify and the control would record a false pass.
    With both sides nonzero, ``c_i -> (c_i)+1`` shifts the sum by ``g_i != 0``
    and ``g_i -> (g_i)+1`` shifts it by ``c_i != 0``.  Each mutant is therefore
    guaranteed detectable, and a mutant that survives is a checker defect.
    """
    for index, (coefficient, generator) in enumerate(
        zip(coefficients, generators, strict=True)
    ):
        if sympy.Poly(coefficient, *order, domain=sympy.QQ).is_zero:
            continue
        if sympy.Poly(generator, *order, domain=sympy.QQ).is_zero:
            continue
        return index
    return None


# --------------------------------------------------------------------------
# leg B -- the producer's own checker
# --------------------------------------------------------------------------


def load_producer_tool(repo_root: Path) -> Any:
    """Load ``scripts/endpoint-certificate.py`` the way the surplus producer does."""
    path = repo_root / "scripts" / "endpoint-certificate.py"
    spec = importlib.util.spec_from_file_location("endpoint_certificate_tool", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def _tool(repo_root: Path) -> Any:
    global _TOOL
    if _TOOL is None:
        _TOOL = load_producer_tool(repo_root)
    return _TOOL


def producer_leg(cert: dict[str, Any], repo_root: Path) -> dict[str, Any]:
    variables, generators, coefficients = payload(cert)
    try:
        _tool(repo_root).check_identity(variables, generators, coefficients)
    except ValueError as exc:
        return {"engine": PRODUCER_ENGINE, "verdict": FAILS, "error": str(exc)}
    return {"engine": PRODUCER_ENGINE, "verdict": HOLDS, "error": None}


# --------------------------------------------------------------------------
# mutation control
# --------------------------------------------------------------------------


def mutate(cert: dict[str, Any], field: str, index: int) -> dict[str, Any]:
    """Return a shallow copy whose ``field[index]`` polynomial is shifted by 1."""
    values = list(cert[field])
    values[index] = f"({values[index]})+1"
    mutant = dict(cert)
    mutant[field] = values
    return mutant


def run_mutation_control(
    cert: dict[str, Any], index: int | None, repo_root: Path
) -> dict[str, Any]:
    out: dict[str, Any] = {
        "index": index,
        "n_mutants": 0,
        "n_rejected": 0,
        "mutants": [],
    }
    if index is None:
        out["skipped"] = (
            "no index has both a nonzero coefficient and a nonzero generator"
        )
        return out
    for field in ("coefficients", "generators"):
        mutant = mutate(cert, field, index)
        record: dict[str, Any] = {"field": field}
        try:
            record["independent"] = independent_leg(mutant)["verdict"]
        except (ValueError, RecursionError) as exc:
            record["independent"] = ERROR
            record["independent_error"] = f"{type(exc).__name__}: {exc}"
        record["producer"] = producer_leg(mutant, repo_root)["verdict"]
        record["rejected"] = (
            record["independent"] == FAILS and record["producer"] == FAILS
        )
        out["n_mutants"] += 1
        out["n_rejected"] += int(record["rejected"])
        out["mutants"].append(record)
    return out


# --------------------------------------------------------------------------
# Lean reverse link
# --------------------------------------------------------------------------


def lean_certificate_consumers(repo_root: Path) -> dict[str, list[str]]:
    """Map each ``certificates/**`` path named in Lean source to its modules."""
    consumers: dict[str, set[str]] = {}
    lean_root = repo_root / "lean"
    for path in sorted(lean_root.rglob("*.lean")):
        if any(part in {".lake", "vendor", "__pycache__"} for part in path.parts):
            continue
        try:
            text = path.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        module = path.relative_to(repo_root).as_posix()
        for token in _LEAN_CERT_REF.findall(text):
            consumers.setdefault(token, set()).add(module)
    return {token: sorted(modules) for token, modules in sorted(consumers.items())}


# --------------------------------------------------------------------------
# per-certificate driver
# --------------------------------------------------------------------------


def recheck_one(path_str: str, repo_root_str: str) -> dict[str, Any]:
    repo_root = Path(repo_root_str)
    path = Path(path_str)
    started = time.monotonic()
    record: dict[str, Any] = {
        "schema": SCHEMA,
        "path": path.relative_to(repo_root).as_posix(),
    }
    try:
        cert, digest = load_certificate(path)
    except (
        OSError,
        TypeError,
        ValueError,
        UnicodeDecodeError,
        json.JSONDecodeError,
    ) as exc:
        record["load_error"] = f"{type(exc).__name__}: {exc}"
        record["independent"] = {"engine": INDEPENDENT_ENGINE, "verdict": ERROR}
        record["producer"] = {"engine": PRODUCER_ENGINE, "verdict": ERROR}
        record["legs_agree"] = False
        record["mutation_control"] = {"n_mutants": 0, "n_rejected": 0}
        record["seconds"] = round(time.monotonic() - started, 3)
        return record

    record["sha256"] = digest
    record["record_schema"] = cert.get("schema")
    record["certificate_id"] = cert.get("pid") or cert.get("certificate_id")
    checks = cert.get("checks")
    record["declared_checks"] = checks if isinstance(checks, dict) else None
    record["declared_python_exact_polynomial"] = (
        checks.get("python_exact_polynomial") if isinstance(checks, dict) else None
    )

    try:
        variables, generators, _ = payload(cert)
        record["n_variables"] = len(variables)
        record["n_generators"] = len(generators)
    except ValueError:
        record["n_variables"] = None
        record["n_generators"] = None

    try:
        independent = independent_leg(cert, want_mutation_index=True)
    except (ValueError, RecursionError) as exc:
        independent = {
            "engine": INDEPENDENT_ENGINE,
            "verdict": ERROR,
            "error": f"{type(exc).__name__}: {exc}",
            "mutation_index": None,
        }
    record["independent"] = independent

    try:
        record["producer"] = producer_leg(cert, repo_root)
    except (ValueError, TypeError) as exc:
        record["producer"] = {
            "engine": PRODUCER_ENGINE,
            "verdict": ERROR,
            "error": f"{type(exc).__name__}: {exc}",
        }

    record["legs_agree"] = (
        record["independent"]["verdict"] == record["producer"]["verdict"]
    )
    record["declared_false_but_holds"] = (
        record["declared_python_exact_polynomial"] is False
        and record["independent"]["verdict"] == HOLDS
    )
    record["mutation_control"] = run_mutation_control(
        cert, independent.get("mutation_index"), repo_root
    )
    record["seconds"] = round(time.monotonic() - started, 3)
    return record


# --------------------------------------------------------------------------
# arms-length subprocess leg
# --------------------------------------------------------------------------


def arms_length_check(
    repo_root: Path, directory: Path, timeout_s: int
) -> dict[str, Any]:
    """Run the producer's own ``--check`` entry point over a whole directory."""
    command = [
        sys.executable,
        str(repo_root / "scripts" / "endpoint-certificate.py"),
        "--check",
        str(directory),
        "--quiet",
    ]
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
            "command": command,
            "returncode": None,
            "timed_out": True,
            "seconds": round(time.monotonic() - started, 3),
        }
    return {
        "command": command,
        "returncode": proc.returncode,
        "timed_out": False,
        "stdout_tail": proc.stdout.strip()[-2000:],
        "stderr_tail": proc.stderr.strip()[-2000:],
        "seconds": round(time.monotonic() - started, 3),
    }


# --------------------------------------------------------------------------
# summary
# --------------------------------------------------------------------------


def git_head(repo_root: Path) -> str | None:
    try:
        proc = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=repo_root,
            capture_output=True,
            text=True,
            check=False,
        )
    except OSError:
        return None
    return proc.stdout.strip() or None


def summarize(
    records: list[dict[str, Any]],
    consumers: dict[str, list[str]],
    arms_length: list[dict[str, Any]],
    repo_root: Path,
    jobs: int,
) -> dict[str, Any]:
    independent = Counter(r["independent"]["verdict"] for r in records)
    producer = Counter(r["producer"]["verdict"] for r in records)
    declared = Counter(str(r.get("declared_python_exact_polynomial")) for r in records)
    by_family = Counter(str(r.get("record_schema")) for r in records)

    n_mutants = sum(r["mutation_control"]["n_mutants"] for r in records)
    n_rejected = sum(r["mutation_control"]["n_rejected"] for r in records)
    skipped = [
        r["path"] for r in records if r["mutation_control"].get("skipped") is not None
    ]

    return {
        "schema": SUMMARY_SCHEMA,
        "repo_head": git_head(repo_root),
        "jobs": jobs,
        "certificates": {
            "total": len(records),
            "by_record_schema": dict(sorted(by_family.items())),
            "lean_named": sum(1 for r in records if r.get("lean_consumers")),
        },
        "independent_leg": {
            "engine": INDEPENDENT_ENGINE,
            "verdicts": dict(sorted(independent.items())),
        },
        "producer_leg": {
            "engine": PRODUCER_ENGINE,
            "verdicts": dict(sorted(producer.items())),
        },
        "leg_disagreements": sorted(r["path"] for r in records if not r["legs_agree"]),
        "declared_python_exact_polynomial": dict(sorted(declared.items())),
        "declared_false_but_holds": sum(
            1 for r in records if r.get("declared_false_but_holds")
        ),
        "mutation_control_rejects": {
            "n_mutants": n_mutants,
            "n_rejected": n_rejected,
        },
        "mutation_control_valid": bool(n_mutants > 0 and n_mutants == n_rejected),
        "mutation_control_skipped": skipped,
        "arms_length": arms_length,
        "lean_named_certificate_tokens": len(consumers),
        "failures": sorted(
            r["path"] for r in records if r["independent"]["verdict"] != HOLDS
        ),
        "total_seconds": round(sum(r["seconds"] for r in records), 3),
    }


def canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, indent=2, ensure_ascii=False) + "\n"


# --------------------------------------------------------------------------
# commands
# --------------------------------------------------------------------------


def certificate_paths(repo_root: Path, roots: list[str]) -> list[Path]:
    out: list[Path] = []
    for root in roots:
        base = (repo_root / root).resolve()
        if not base.is_dir():
            raise SystemExit(f"not a directory: {root}")
        out.extend(sorted(base.glob("*.json")))
    return out


def command_recheck(args: argparse.Namespace) -> int:
    repo_root = args.repo_root.resolve()
    paths = certificate_paths(repo_root, args.root)
    if not paths:
        raise SystemExit("no certificate JSON files under the requested roots")

    consumers = lean_certificate_consumers(repo_root)

    records: list[dict[str, Any]]
    if args.jobs > 1:
        context = multiprocessing.get_context("spawn")
        with ProcessPoolExecutor(max_workers=args.jobs, mp_context=context) as pool:
            records = list(
                pool.map(
                    recheck_one,
                    [str(p) for p in paths],
                    [str(repo_root)] * len(paths),
                    chunksize=1,
                )
            )
    else:
        records = [recheck_one(str(p), str(repo_root)) for p in paths]

    for record in records:
        record["lean_consumers"] = consumers.get(record["path"], [])
    records.sort(key=lambda r: r["path"])

    arms_length: list[dict[str, Any]] = []
    for root in args.root:
        base = (repo_root / root).resolve()
        first = next(iter(sorted(base.glob("*.json"))), None)
        if first is None:
            continue
        cert, _ = load_certificate(first)
        if cert.get("schema") != ENDPOINT_SCHEMA:
            arms_length.append(
                {
                    "root": root,
                    "skipped": (
                        "endpoint-certificate.py --check rejects schema "
                        f"{cert.get('schema')!r}"
                    ),
                }
            )
            continue
        entry = arms_length_check(repo_root, base, args.arms_length_timeout_s)
        entry["root"] = root
        arms_length.append(entry)

    summary = summarize(records, consumers, arms_length, repo_root, args.jobs)

    if args.out is not None:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        with args.out.open("w", encoding="utf-8") as handle:
            for record in records:
                handle.write(
                    json.dumps(record, sort_keys=True, ensure_ascii=False) + "\n"
                )
    if args.summary_out is not None:
        args.summary_out.parent.mkdir(parents=True, exist_ok=True)
        args.summary_out.write_text(canonical_json(summary), encoding="utf-8")

    sys.stdout.write(canonical_json(summary))

    if not summary["mutation_control_valid"]:
        sys.stderr.write("mutation control void: the run establishes nothing\n")
        return 3
    if summary["failures"] or summary["leg_disagreements"]:
        return 2
    return 0


def command_lean_links(args: argparse.Namespace) -> int:
    repo_root = args.repo_root.resolve()
    consumers = lean_certificate_consumers(repo_root)
    present = {t: m for t, m in consumers.items() if (repo_root / t).is_file()}
    missing = {t: m for t, m in consumers.items() if t not in present}
    by_directory = Counter(t.rsplit("/", 1)[0] for t in consumers)
    sys.stdout.write(
        canonical_json(
            {
                "schema": "nonpiqd-lean-certificate-link/v1",
                "tokens_named": len(consumers),
                "present": len(present),
                "missing": sorted(missing),
                "by_directory": dict(sorted(by_directory.items())),
                "consumers": consumers if args.detail else None,
            }
        )
    )
    return 0 if not missing else 2


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)

    recheck = sub.add_parser("recheck", help="Re-derive every certificate identity.")
    recheck.add_argument("--repo-root", type=Path, default=Path("."))
    recheck.add_argument(
        "--root",
        action="append",
        default=None,
        help="Certificate directory, repeatable.",
    )
    recheck.add_argument("--jobs", type=int, default=1)
    recheck.add_argument("--out", type=Path, help="JSONL output path.")
    recheck.add_argument("--summary-out", type=Path, help="Summary JSON output path.")
    recheck.add_argument("--arms-length-timeout-s", type=int, default=1800)
    recheck.set_defaults(func=command_recheck)

    links = sub.add_parser(
        "lean-links", help="List the certificate paths Lean source names."
    )
    links.add_argument("--repo-root", type=Path, default=Path("."))
    links.add_argument("--detail", action="store_true")
    links.set_defaults(func=command_lean_links)

    args = parser.parse_args(argv)
    if args.command == "recheck":
        if not args.root:
            args.root = [
                "certificates/endpoint",
                "certificates/surplus/relaxed_split_singleton",
            ]
        if args.jobs < 1:
            raise SystemExit("--jobs must be at least 1")
    return args


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    return int(args.func(args))


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
