#!/usr/bin/env python3
"""Tier-2d bank chain re-verification for the non-piqd durable computation.

``scratch/rigid221-sourceheavy-anchor/refreeze_narrowed_chain.py --verify``
prints ``CHAIN VERIFY COMPLETE`` and exits 0.  That banner is not evidence.

``--verify`` gates exactly two things (``refreeze_narrowed_chain.py:79`` and
``:132``): it leaves the frozen pins in force, and it changes the closing word.
The hash-drift recovery loop at ``:100-117`` is **not** gated on it, and
``:107`` assigns ``module.EXPECTED_BANK_SHA256 = candidate`` unconditionally --
so a bank whose own sha has drifted can be rebuilt under the drifted value,
accepted, and reported with the success banner.  Nothing is logged on that
path: ``:102-117`` contains no print, and both paths converge on the same
``:122`` line.

Two facts limit the damage, and one does not.  A drift at chain position N is
re-caught at N+1, because ``--verify`` leaves N+1's ``EXPECTED_PARENT_BANK_SHA256``
frozen and the resulting error does not carry the ``"hash drifted"`` text the
loop filters on.  And chain positions 1-5 hold no own pin at all, so ``:107``
only creates a dead attribute there.  But position 13 is the chain tail: it has
no downstream parent pin, so its drift is absorbed silently.

The only reliable detector is therefore the one this script implements: diff
every sha in the ``REFROZEN`` block against the literal frozen in source.  For
the eight modules that carry ``EXPECTED_BANK_SHA256`` that is their own
literal; for the five that do not, it is the successor's
``EXPECTED_PARENT_BANK_SHA256``, which pins the same value.

Nothing here writes to the repository.  The refreeze script holds no ``open``,
``write_text`` or ``subprocess`` call in either mode; the miner writes only
into a ``TemporaryDirectory``.
"""

from __future__ import annotations

import argparse
import ast
import hashlib
import json
import subprocess
import sys
import time
from pathlib import Path
from typing import Any

SCHEMA = "nonpiqd-bank-chain-pins/v1"

REFREEZE = "scratch/rigid221-sourceheavy-anchor/refreeze_narrowed_chain.py"
MINER = "scripts/mine_bank_lean_dependencies.py"
CARD_HEAD = "census/card_head"

REFROZEN_HEADER = "REFROZEN"
VERIFY_BANNER = "CHAIN VERIFY COMPLETE"
REFREEZE_BANNER = "CHAIN REFREEZE COMPLETE"
UNCHANGED_PREFIX = "UNCHANGED "

PARENT_CLAUSES = "EXPECTED_PARENT_CLAUSES"
FINAL_CLAUSES = "EXPECTED_FINAL_CLAUSES"

OWN_PIN = "EXPECTED_BANK_SHA256"
PARENT_PIN = "EXPECTED_PARENT_BANK_SHA256"

OWN_LITERAL = "own_literal"
SUCCESSOR_PARENT = "successor_parent_literal"

MATCH, MISMATCH, ABSENT = "MATCH", "MISMATCH", "ABSENT"

GUARDED_TREES = ("lean", "certificates", "census", "scripts", "docs")
SHA_LENGTH = 64
HEX = "0123456789abcdef"


def is_sha256(text: str) -> bool:
    return len(text) == SHA_LENGTH and all(character in HEX for character in text)


def tracked_tree_state(repo_root: Path) -> str:
    result = subprocess.run(
        ["git", "status", "--porcelain=v1", "--", *GUARDED_TREES],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=True,
    )
    return hashlib.sha256(result.stdout.encode("utf-8")).hexdigest()


# --------------------------------------------------------------------------
# what source says the answer must be
# --------------------------------------------------------------------------


def chain_modules(repo_root: Path) -> list[str]:
    """The CHAIN tuple, read out of the refreeze script rather than restated."""

    tree = ast.parse((repo_root / REFREEZE).read_text(encoding="utf-8"))
    for node in tree.body:
        if not isinstance(node, ast.Assign):
            continue
        if not any(getattr(target, "id", None) == "CHAIN" for target in node.targets):
            continue
        if not isinstance(node.value, ast.Tuple):
            raise TypeError(f"{REFREEZE}: CHAIN is not a tuple literal")
        names = []
        for element in node.value.elts:
            if not isinstance(element, ast.Constant) or not isinstance(
                element.value, str
            ):
                raise TypeError(f"{REFREEZE}: CHAIN holds a non-literal entry")
            names.append(element.value)
        return names
    raise ValueError(f"{REFREEZE}: no CHAIN assignment found")


def pin_literals(repo_root: Path, module_name: str) -> dict[str, Any]:
    """The module-level pin literals, by AST rather than by text matching.

    A pin reached through an import alias -- position 13 takes its parent that
    way -- is reported as an alias rather than a value, because the value it
    resolves to is the predecessor's own literal and is already covered there.
    """

    path = repo_root / CARD_HEAD / f"{module_name}.py"
    tree = ast.parse(path.read_text(encoding="utf-8"))
    found: dict[str, Any] = {OWN_PIN: None, PARENT_PIN: None}
    for node in tree.body:
        if isinstance(node, ast.ImportFrom):
            for alias in node.names:
                if alias.asname in (OWN_PIN, PARENT_PIN):
                    found[alias.asname] = {"import_from": node.module}
            continue
        if isinstance(node, ast.Assign):
            targets = [getattr(target, "id", None) for target in node.targets]
            value = node.value
        elif isinstance(node, ast.AnnAssign):
            targets = [getattr(node.target, "id", None)]
            value = node.value
        else:
            continue
        if not isinstance(value, ast.Constant) or not isinstance(value.value, str):
            continue
        for name in (OWN_PIN, PARENT_PIN):
            if name in targets:
                found[name] = value.value
    return found


def expected_own_shas(repo_root: Path) -> dict[str, Any]:
    """Map each chain module to the sha source says it must produce."""

    order = chain_modules(repo_root)
    literals = {name: pin_literals(repo_root, name) for name in order}
    expected: list[dict[str, Any]] = []
    for index, name in enumerate(order):
        own = literals[name][OWN_PIN]
        if isinstance(own, str):
            expected.append(
                {
                    "position": index + 1,
                    "module": name,
                    "expected_sha256": own,
                    "pinned_by": OWN_LITERAL,
                }
            )
            continue
        successor = order[index + 1] if index + 1 < len(order) else None
        parent = literals[successor][PARENT_PIN] if successor else None
        if isinstance(parent, str):
            expected.append(
                {
                    "position": index + 1,
                    "module": name,
                    "expected_sha256": parent,
                    "pinned_by": SUCCESSOR_PARENT,
                    "pinned_in": successor,
                }
            )
            continue
        expected.append(
            {
                "position": index + 1,
                "module": name,
                "expected_sha256": None,
                "pinned_by": "unpinned",
                "note": "no own literal and no successor parent literal",
            }
        )
    return {
        "chain_length": len(order),
        "expected": expected,
        "unpinned": [
            row["module"] for row in expected if row["expected_sha256"] is None
        ],
        "tail_module": order[-1] if order else None,
    }


def parent_link_consistency(repo_root: Path) -> list[dict[str, Any]]:
    """Each successor's parent literal must equal its predecessor's own sha."""

    order = chain_modules(repo_root)
    literals = {name: pin_literals(repo_root, name) for name in order}
    rows = []
    for index in range(1, len(order)):
        predecessor, successor = order[index - 1], order[index]
        own = literals[predecessor][OWN_PIN]
        parent = literals[successor][PARENT_PIN]
        if isinstance(parent, dict):
            verdict = "IMPORT_ALIAS"
        elif not isinstance(own, str):
            verdict = "PREDECESSOR_UNPINNED"
        else:
            verdict = MATCH if own == parent else MISMATCH
        rows.append(
            {
                "predecessor": predecessor,
                "successor": successor,
                "verdict": verdict,
            }
        )
    return rows


# --------------------------------------------------------------------------
# Tier 2e -- the clause chain the drift guards enforce
# --------------------------------------------------------------------------


def module_bindings(path: Path) -> dict[str, Any]:
    """Every module-level binding this check can follow.

    Three forms occur among the banks and all three must be followed, or the
    chain reads as broken where it is not.  A plain ``= 635_440`` is the value.
    A ``from .x import EXPECTED_FINAL_CLAUSES as Y`` is a cross-module hop.  And
    a bare ``EXPECTED_PARENT_CLAUSES = FAMILY_FINAL_CLAUSES`` is a local hop --
    the form that links three-triad to block-spanning.
    """

    tree = ast.parse(path.read_text(encoding="utf-8"))
    bindings: dict[str, Any] = {}
    for node in tree.body:
        if isinstance(node, ast.ImportFrom):
            for alias in node.names:
                bindings[alias.asname or alias.name] = {
                    "import_from": node.module,
                    "import_name": alias.name,
                }
            continue
        if isinstance(node, ast.Assign):
            targets = [getattr(target, "id", None) for target in node.targets]
            value = node.value
        elif isinstance(node, ast.AnnAssign):
            targets = [getattr(node.target, "id", None)]
            value = node.value
        else:
            continue
        for target in targets:
            if target is None:
                continue
            if isinstance(value, ast.Constant) and isinstance(value.value, int):
                bindings[target] = value.value
            elif isinstance(value, ast.Name):
                bindings[target] = {"local": value.id}
    return bindings


def clause_chain(repo_root: Path) -> dict[str, Any]:
    """Check the fail-closed clause chain across every bank that declares one.

    Each bank raises unless the compiled instance it is handed reports
    ``initial_n_clauses == EXPECTED_PARENT_CLAUSES`` and produces
    ``final_n_clauses == EXPECTED_FINAL_CLAUSES``.  Those literals therefore
    describe one contiguous chain, and a break localizes to a single link.

    Two links are held by import aliasing rather than by a restated literal.
    Those cannot drift apart by construction, and are reported as such instead
    of being counted as agreeing literals.
    """

    directory = repo_root / CARD_HEAD
    carriers = sorted(directory.glob("*.py"))
    # Bindings for every module, not only the banks: an alias can hop through
    # a module that declares no chain of its own.
    bindings = {path.stem: module_bindings(path) for path in carriers}
    banks = sorted(
        stem
        for stem, values in bindings.items()
        if PARENT_CLAUSES in values and FINAL_CLAUSES in values
    )

    def resolve(module: str, name: str, depth: int = 0) -> int | None:
        if depth > 6 or module not in bindings:
            return None
        value = bindings[module].get(name)
        if isinstance(value, int):
            return value
        if not isinstance(value, dict):
            return None
        if "local" in value:
            return resolve(module, value["local"], depth + 1)
        source = str(value["import_from"]).lstrip(".")
        return resolve(source, value["import_name"], depth + 1)

    finals: dict[int, list[str]] = {}
    for name in banks:
        value = resolve(name, FINAL_CLAUSES)
        if value is not None:
            finals.setdefault(value, []).append(name)

    rows = []
    for name in banks:
        parent = resolve(name, PARENT_CLAUSES)
        final = resolve(name, FINAL_CLAUSES)
        producers = finals.get(parent, []) if parent is not None else []
        aliased = not isinstance(bindings[name][PARENT_CLAUSES], int)
        if parent is None or final is None:
            verdict = "UNRESOLVED"
        elif aliased and producers:
            verdict = "IMPORT_ALIAS"
        elif len(producers) == 1:
            verdict = MATCH
        elif not producers:
            verdict = "CHAIN_HEAD" if parent not in finals else MISMATCH
        else:
            verdict = "FORKED"
        rows.append(
            {
                "module": name,
                "parent_clauses": parent,
                "final_clauses": final,
                "predecessors": sorted(producers),
                "parent_by_import_alias": aliased,
                "verdict": verdict,
            }
        )

    counts: dict[str, int] = {}
    for row in rows:
        counts[row["verdict"]] = counts.get(row["verdict"], 0) + 1
    heads = [row["module"] for row in rows if row["verdict"] == "CHAIN_HEAD"]
    linked = {MATCH, "IMPORT_ALIAS"}
    return {
        "carriers_scanned": len(carriers),
        "banks_declaring_a_clause_chain": len(banks),
        "rows": rows,
        "verdicts": counts,
        "chain_heads": heads,
        "contiguous": (
            all(row["verdict"] in linked or row["module"] in heads for row in rows)
            and len(heads) == 1
        ),
    }


def installer_owners(repo_root: Path) -> dict[str, str]:
    """Map each ``install_*`` function name to the bank module defining it."""

    owners: dict[str, str] = {}
    for path in sorted((repo_root / CARD_HEAD).glob("*.py")):
        tree = ast.parse(path.read_text(encoding="utf-8"))
        for node in tree.body:
            if isinstance(node, ast.FunctionDef) and node.name.startswith("install_"):
                owners[node.name] = path.stem
    return owners


def called_installers(source: str, function_name: str) -> list[str]:
    """The ``install_*`` names reached from one function, in source order."""

    tree = ast.parse(source)
    found: list[str] = []
    for node in ast.walk(tree):
        if not isinstance(node, ast.FunctionDef) or node.name != function_name:
            continue
        for inner in ast.walk(node):
            name = None
            if isinstance(inner, ast.Name):
                name = inner.id
            elif isinstance(inner, ast.Call) and isinstance(inner.func, ast.Name):
                name = inner.func.id
            if name and name.startswith("install_") and name not in found:
                found.append(name)
    return found


def runtime_coverage(repo_root: Path) -> dict[str, Any]:
    """Which clause-chain banks the --verify walk actually builds.

    The banks have no CLI -- they are import-only library modules with no
    ``__main__`` and no write of any kind -- so "rerun the generator" means
    building it under its frozen pins, which is exactly what the chain walk
    does.  Every ``install_*`` calls its own ``build_*`` and ``validate_*``
    first, so an installed bank has had its drift guards exercised.

    Three sources contribute: the cell materializer installs the first two
    banks, the chain head's ``_parent`` runs nine more installers, and the
    CHAIN loop explicitly builds, validates and installs the last thirteen.
    """

    owners = installer_owners(repo_root)
    head_test = (
        repo_root
        / CARD_HEAD
        / "tests"
        / "test_exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank.py"
    )
    cegar = repo_root / CARD_HEAD / "exact12_next_row_static_cegar.py"

    materializer = [
        owners[name]
        for name in called_installers(
            cegar.read_text(encoding="utf-8"),
            "materialize_positive_membership_static_cell",
        )
        if name in owners
    ]
    head = [
        owners[name]
        for name in called_installers(head_test.read_text(encoding="utf-8"), "_parent")
        if name in owners
    ]
    walked = chain_modules(repo_root)

    built: list[str] = []
    for name in (*materializer, *head, *walked):
        if name not in built:
            built.append(name)
    declared = {row["module"] for row in clause_chain(repo_root)["rows"]}
    return {
        "via_cell_materializer": materializer,
        "via_chain_head_parent": head,
        "via_chain_loop": walked,
        "built_at_runtime": built,
        "declared_banks": sorted(declared),
        "not_built": sorted(declared - set(built)),
        "every_declared_bank_built": not (declared - set(built)),
    }


# --------------------------------------------------------------------------
# what the walk actually produced
# --------------------------------------------------------------------------


def parse_refrozen(transcript: str) -> dict[str, Any]:
    """Read the REFROZEN block and the closing banner out of stdout."""

    lines = [line.rstrip() for line in transcript.splitlines()]
    observed: list[tuple[str, str]] = []
    started = False
    for line in lines:
        if line.strip() == REFROZEN_HEADER:
            started = True
            continue
        if not started:
            continue
        fields = line.split()
        if len(fields) == 2 and is_sha256(fields[1]):
            observed.append((fields[0], fields[1]))
    return {
        "refrozen_header_present": started,
        "observed": [{"module": name, "sha256": sha} for name, sha in observed],
        # The banner is reported, never trusted: it prints after a silent
        # drift recovery exactly as it does after a clean walk.
        "verify_banner_present": any(VERIFY_BANNER in line for line in lines),
        "refreeze_banner_present": any(REFREEZE_BANNER in line for line in lines),
    }


def diff_shas(expectation: dict[str, Any], parsed: dict[str, Any]) -> dict[str, Any]:
    """Diff observed against frozen.  This is the only detector of a drift."""

    observed = {row["module"]: row["sha256"] for row in parsed["observed"]}
    rows = []
    for row in expectation["expected"]:
        seen = observed.get(row["module"])
        if seen is None:
            verdict = ABSENT
        elif row["expected_sha256"] is None:
            verdict = "UNPINNED"
        else:
            verdict = MATCH if seen == row["expected_sha256"] else MISMATCH
        rows.append({**row, "observed_sha256": seen, "verdict": verdict})
    unexpected = sorted(
        set(observed) - {row["module"] for row in expectation["expected"]}
    )
    counts: dict[str, int] = {}
    for row in rows:
        counts[row["verdict"]] = counts.get(row["verdict"], 0) + 1
    return {
        "rows": rows,
        "verdicts": counts,
        "unexpected_modules": unexpected,
        "all_pinned_shas_match": (
            counts.get(MATCH, 0) == expectation["chain_length"] and not unexpected
        ),
    }


def run_chain_verify(repo_root: Path, timeout_seconds: int) -> dict[str, Any]:
    """Run the refreeze script unchanged in --verify mode, from the repo root."""

    started = time.monotonic()
    result = subprocess.run(
        [sys.executable, REFREEZE, "--verify"],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=False,
        timeout=timeout_seconds,
    )
    return {
        "command": f"{REFREEZE} --verify",
        "exit_code": result.returncode,
        "elapsed_seconds": round(time.monotonic() - started, 3),
        "stdout": result.stdout,
        "stderr_tail": result.stderr.strip().splitlines()[-8:],
    }


# --------------------------------------------------------------------------
# the frozen dependency set
# --------------------------------------------------------------------------


def mine_compare(
    repo_root: Path, module_name: str, timeout_seconds: int
) -> dict[str, Any]:
    """`--compare` must report UNCHANGED; anything else is a drifted pin."""

    started = time.monotonic()
    result = subprocess.run(
        [sys.executable, MINER, f"census.card_head.{module_name}", "--compare"],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=False,
        timeout=timeout_seconds,
    )
    lines = [line.strip() for line in result.stderr.splitlines()]
    unchanged = [line for line in lines if line.startswith(UNCHANGED_PREFIX)]
    entry: dict[str, Any] = {
        "module": module_name,
        "exit_code": result.returncode,
        "elapsed_seconds": round(time.monotonic() - started, 3),
        "unchanged_line": unchanged[0] if unchanged else None,
        "added": [line for line in lines if line.startswith("ADDED")],
        "removed": [line for line in lines if line.startswith("REMOVED")],
    }
    entry["verdict"] = (
        MATCH
        if result.returncode == 0 and unchanged and not entry["added"]
        else MISMATCH
    )
    if unchanged:
        entry["n_modules"] = int(unchanged[0].split()[1])
    if entry["verdict"] == MISMATCH and not unchanged:
        entry["stderr_tail"] = lines[-6:]
    return entry


# --------------------------------------------------------------------------
# negative control -- corrupt one source_manifest entry in memory
# --------------------------------------------------------------------------


def corrupt_digest(digest: str) -> str:
    """Change one hex character.  One byte is enough to break the bank hash."""

    replacement = "0" if digest[0] != "0" else "1"
    return replacement + digest[1:]


def source_manifest_control(repo_root: Path, timeout_seconds: int) -> dict[str, Any]:
    """A bank whose source manifest is perturbed must fail to build.

    Runs in a subprocess so the monkeypatched builders cannot leak into this
    process.  The walk mirrors ``refreeze_narrowed_chain.py:70-124`` and stops
    at the first chain position that carries an own ``EXPECTED_BANK_SHA256``;
    positions before it hold no own pin, so a perturbation there has nothing to
    fail closed against.
    """

    script = repo_root / "scripts" / "_bank_chain_pin_control.py"
    started = time.monotonic()
    result = subprocess.run(
        [sys.executable, str(script)],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=False,
        timeout=timeout_seconds,
    )
    entry: dict[str, Any] = {
        "elapsed_seconds": round(time.monotonic() - started, 3),
        "exit_code": result.returncode,
    }
    try:
        entry.update(json.loads(result.stdout))
    except json.JSONDecodeError:
        entry["error"] = "control produced no JSON"
        entry["stderr_tail"] = result.stderr.strip().splitlines()[-8:]
        entry["n_mutants"] = 0
        entry["n_rejected"] = 0
    return entry


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--repo-root", type=Path, default=Path(__file__).resolve().parents[1]
    )
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=7200)
    parser.add_argument(
        "--transcript",
        type=Path,
        help="use a captured refreeze --verify stdout instead of running it",
    )
    parser.add_argument("--skip-mine", action="store_true")
    parser.add_argument("--skip-control", action="store_true")
    args = parser.parse_args(argv)

    repo_root = args.repo_root.resolve()
    output_dir = args.output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)
    before = tracked_tree_state(repo_root)

    expectation = expected_own_shas(repo_root)
    if args.transcript:
        run = {
            "command": f"{REFREEZE} --verify",
            "source": args.transcript.as_posix(),
            "stdout": args.transcript.read_text(encoding="utf-8"),
            "exit_code": 0,
        }
    else:
        run = run_chain_verify(repo_root, args.timeout_seconds)
    parsed = parse_refrozen(run["stdout"])
    comparison = diff_shas(expectation, parsed)

    report: dict[str, Any] = {
        "schema": SCHEMA,
        "chain": {
            "source": REFREEZE,
            "length": expectation["chain_length"],
            "tail_module": expectation["tail_module"],
            "exit_code": run["exit_code"],
            "elapsed_seconds": run.get("elapsed_seconds"),
            "verify_banner_present": parsed["verify_banner_present"],
            "refrozen_header_present": parsed["refrozen_header_present"],
            "banner_is_not_evidence": (
                "refreeze_narrowed_chain.py:100-117 is not gated on VERIFY_ONLY "
                "and prints nothing on the recovery path, so the banner also "
                "appears after a silently re-accepted drift"
            ),
        },
        "parent_link_consistency": parent_link_consistency(repo_root),
        "pin_comparison": comparison,
        "clause_chain": clause_chain(repo_root),
        "runtime_coverage": runtime_coverage(repo_root),
    }
    if not args.skip_mine:
        report["dependency_set"] = [
            mine_compare(repo_root, name, args.timeout_seconds)
            for name in chain_modules(repo_root)
        ]
    if not args.skip_control:
        report["mutation_control"] = source_manifest_control(
            repo_root, args.timeout_seconds
        )

    after = tracked_tree_state(repo_root)
    report["write_guard"] = {
        "trees": list(GUARDED_TREES),
        "before": before,
        "after": after,
        "unchanged": before == after,
    }
    (output_dir / "bank-chain-pins.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    (output_dir / "bank-chain-verify-stdout.txt").write_text(
        run["stdout"], encoding="utf-8"
    )
    summary = {
        key: report[key] for key in ("schema", "chain", "write_guard") if key in report
    }
    summary["pin_verdicts"] = comparison["verdicts"]
    summary["runtime_coverage"] = {
        "banks_built": len(report["runtime_coverage"]["built_at_runtime"]),
        "not_built": report["runtime_coverage"]["not_built"],
        "every_declared_bank_built": report["runtime_coverage"][
            "every_declared_bank_built"
        ],
    }
    summary["clause_chain"] = {
        key: report["clause_chain"][key]
        for key in (
            "banks_declaring_a_clause_chain",
            "verdicts",
            "chain_heads",
            "contiguous",
        )
    }
    summary["all_pinned_shas_match"] = comparison["all_pinned_shas_match"]
    if "dependency_set" in report:
        summary["dependency_set_verdicts"] = {
            verdict: sum(
                1 for row in report["dependency_set"] if row["verdict"] == verdict
            )
            for verdict in sorted({row["verdict"] for row in report["dependency_set"]})
        }
    if "mutation_control" in report:
        summary["mutation_control"] = {
            "n_mutants": report["mutation_control"].get("n_mutants", 0),
            "n_rejected": report["mutation_control"].get("n_rejected", 0),
        }
    print(json.dumps(summary, indent=2, sort_keys=True))

    if not report["write_guard"]["unchanged"]:
        return 3
    control = report.get("mutation_control")
    if control is not None and control.get("n_mutants") != control.get("n_rejected"):
        return 3
    if run["exit_code"] != 0 or not comparison["all_pinned_shas_match"]:
        return 2
    if any(row["verdict"] != MATCH for row in report.get("dependency_set", [])):
        return 2
    if not report["clause_chain"]["contiguous"]:
        return 2
    if not report["runtime_coverage"]["every_declared_bank_built"]:
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
