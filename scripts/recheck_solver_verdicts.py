#!/usr/bin/env python3
"""Tier-2c solver-verdict recheck for the non-piqd durable computation.

Two routes, both read-only with respect to the repository tree.

``arm-cells`` reruns ``prepare_exact12_next_row_arm_terminal_rup_source.py``
unchanged on each retained terminal cell workdir.  That tool rematerializes the
CNF from current source, prechecks the wave's original DRAT with ``drat-trim``,
solves the identical CNF afresh with ``cadical --plain``, rechecks that proof,
emits LRAT and normalizes it to dense pure RUP.  This script adds the part the
tool does not do: a byte comparison of every emitted artifact against the
committed one.

``pairs`` covers the remaining ``(cnf, proof)`` pairs that Tier 0 found present
and hash-matching.  A pair is only taken when one record names exactly one
matching CNF and exactly one matching proof -- the pairing is read off the
record, never guessed from filenames.

The declared verdict decides what counts as a pass.  A record reporting
``UNSAT``/``DRAT_VERIFIED`` must reproduce ``s VERIFIED``; a record reporting
``UNKNOWN`` from a timed-out solver run holds a partial proof by construction
and must NOT verify.  Reading the second class as a defect is the error this
split exists to prevent.

The verdict authority is ``_verify_drat`` imported from the v24 validator, not
a local reimplementation.  Its 600 s timeout cannot distinguish a slow proof
from a bad one, so a False verdict is always re-run here with a longer timeout
and a captured transcript to separate TIMEOUT from NOT_VERIFIED.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import shutil
import stat
import subprocess
import sys
import time
from pathlib import Path
from typing import Any

SCHEMA = "nonpiqd-solver-verdict-recheck/v1"
SUMMARY_SCHEMA = "nonpiqd-solver-verdict-recheck-summary/v1"

VERIFIED_LINE = "s VERIFIED"
VALIDATOR = "census/card_head/exact12_next_row_arm_static_v24_validator.py"
PREPARER = "scripts/prepare_exact12_next_row_arm_terminal_rup_source.py"

# Verdicts a record can declare, and what the recheck must then observe.
TERMINAL_DECLARED = ("UNSAT", "DRAT_VERIFIED")
INCONCLUSIVE_DECLARED = ("UNKNOWN", "INDETERMINATE", "TIMEOUT")

VERIFIED, NOT_VERIFIED, TIMEOUT, ERROR = (
    "VERIFIED",
    "NOT_VERIFIED",
    "TIMEOUT",
    "ERROR",
)
AGREES, DISAGREES = "AGREES", "DISAGREES"

# The preparer stages solver and checker transcripts alongside the proof
# artifacts.  Those three embed wall-clock and memory figures, so they are
# expected to differ between runs; everything else must be byte-identical.
VOLATILE_ARTIFACTS = (
    "cadical-plain-output.txt",
    "drat-trim-original-output.txt",
    "drat-trim-output.txt",
)

# Derived: records the digests of the volatile transcripts, then hashes itself.
RECEIPT = "receipt.json"

# Guarded against accidental writes into committed source by this run.
GUARDED_TREES = ("lean", "certificates", "census", "scripts", "docs")

# Binary DRAT lemma markers: 'a' for an addition, 'd' for a deletion.
ADD_MARKER, DELETE_MARKER = 0x61, 0x64

# One flip can leave a proof RUP, so the control tries successive lemmas.
MAX_MUTATION_ATTEMPTS = 3

MAX_JSON_BYTES = 64 * 1024 * 1024
READ_CHUNK = 1024 * 1024


# --------------------------------------------------------------------------
# bounded IO
# --------------------------------------------------------------------------


def open_regular(path: Path):
    """Open without following a symlink, refusing anything but a regular file."""

    descriptor = os.open(
        path, os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0)
    )
    try:
        status = os.fstat(descriptor)
        if not stat.S_ISREG(status.st_mode):
            raise OSError(f"{path}: not a regular file")
    except BaseException:
        os.close(descriptor)
        raise
    return os.fdopen(descriptor, "rb")


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open_regular(path) as handle:
        while True:
            chunk = handle.read(READ_CHUNK)
            if not chunk:
                break
            digest.update(chunk)
    return digest.hexdigest()


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    seen: dict[str, Any] = {}
    for key, value in pairs:
        if key in seen:
            raise ValueError(f"duplicate JSON key {key!r}")
        seen[key] = value
    return seen


def load_json(path: Path) -> Any:
    with open_regular(path) as handle:
        raw = handle.read(MAX_JSON_BYTES + 1)
    if len(raw) > MAX_JSON_BYTES:
        raise ValueError(f"{path}: exceeds {MAX_JSON_BYTES} bytes")
    return json.loads(raw.decode("utf-8"), object_pairs_hook=_reject_duplicate_keys)


def load_module(path: Path, name: str) -> Any:
    """Import a hyphenated or package-nested file as a standalone module."""

    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise ImportError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    # Registered before exec so dataclasses in the module resolve their own
    # __module__ (scripts/pinned-surplus-certificate.py:56 does the same).
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


# --------------------------------------------------------------------------
# the repository tree must be unchanged by this run
# --------------------------------------------------------------------------


def tracked_tree_state(repo_root: Path) -> str:
    """Digest of `git status` over the trees a stray write would land in."""

    result = subprocess.run(
        ["git", "status", "--porcelain=v1", "--", *GUARDED_TREES],
        cwd=repo_root,
        capture_output=True,
        text=True,
        check=True,
    )
    return hashlib.sha256(result.stdout.encode("utf-8")).hexdigest()


# --------------------------------------------------------------------------
# candidate enumeration, read off the Tier-0 survey
# --------------------------------------------------------------------------


def declared_verdict(record: Any) -> str:
    """The verdict the record claims for itself, uppercased, or UNDECLARED."""

    if not isinstance(record, dict):
        return "UNDECLARED"
    for key in ("status", "verdict", "result"):
        value = record.get(key)
        if isinstance(value, str) and value:
            return value.upper()
    return "UNDECLARED"


def declared_class(verdict: str) -> str:
    if verdict in TERMINAL_DECLARED:
        return "TERMINAL"
    if verdict in INCONCLUSIVE_DECLARED:
        return "INCONCLUSIVE"
    return "UNDECLARED"


def matching_inputs(record: dict[str, Any], suffixes: tuple[str, ...]) -> list[str]:
    """Distinct resolved paths of MATCH references with one of these suffixes."""

    found = set()
    for reference in record.get("referenced_inputs") or []:
        if not isinstance(reference, dict):
            continue
        if reference.get("hash_verdict") != "MATCH":
            continue
        path = reference.get("path") or ""
        resolved = reference.get("resolved_path")
        if not isinstance(resolved, str) or not resolved:
            continue
        if any(path.endswith(suffix) for suffix in suffixes):
            found.add(resolved)
    return sorted(found)


def enumerate_pairs(survey_path: Path, repo_root: Path) -> dict[str, Any]:
    """Read declared (cnf, proof) pairs out of the Tier-0 survey.

    A pair is declared only when one record names exactly one matching CNF and
    exactly one matching proof.  Records naming several of either are recorded
    as ambiguous and reported, never resolved by filename similarity.
    """

    pairs: dict[tuple[str, str], dict[str, Any]] = {}
    ambiguous: list[dict[str, Any]] = []
    carriers = 0
    with open_regular(survey_path) as handle:
        for line in handle:
            if not line.strip():
                continue
            carriers += 1
            record = json.loads(line.decode("utf-8"))
            if not isinstance(record, dict):
                continue
            cnfs = matching_inputs(record, (".cnf",))
            proofs = matching_inputs(record, (".drat",))
            if not cnfs or not proofs:
                continue
            if len(cnfs) != 1 or len(proofs) != 1:
                ambiguous.append(
                    {
                        "record": record.get("path"),
                        "n_matching_cnf": len(cnfs),
                        "n_matching_proof": len(proofs),
                    }
                )
                continue
            source = repo_root / str(record.get("path"))
            verdict = (
                declared_verdict(load_json(source))
                if source.is_file()
                else "UNDECLARED"
            )
            key = (cnfs[0], proofs[0])
            entry = pairs.setdefault(
                key,
                {
                    "cnf": cnfs[0],
                    "proof": proofs[0],
                    "records": [],
                    "declared_verdicts": [],
                },
            )
            entry["records"].append(record.get("path"))
            if verdict not in entry["declared_verdicts"]:
                entry["declared_verdicts"].append(verdict)
    listed = []
    for entry in pairs.values():
        entry["records"].sort()
        entry["declared_verdicts"].sort()
        classes = {declared_class(v) for v in entry["declared_verdicts"]}
        entry["declared_class"] = (
            classes.pop()
            if len(classes) == 1
            else "CONFLICTING:" + ",".join(sorted(classes))
        )
        listed.append(entry)
    listed.sort(key=lambda item: (item["cnf"], item["proof"]))
    return {
        "survey": survey_path.as_posix(),
        "carriers_scanned": carriers,
        "pairs": listed,
        "ambiguous_records": sorted(ambiguous, key=lambda item: str(item["record"])),
    }


# --------------------------------------------------------------------------
# drat-trim, run twice over: once through the reused authority, once for detail
# --------------------------------------------------------------------------


def run_drat_trim(
    cnf: Path, proof: Path, timeout_seconds: int, emit_core: Path | None = None
) -> tuple[str, dict[str, Any]]:
    """Run drat-trim directly and classify the outcome from its transcript.

    ``emit_core`` passes ``-l``, which writes the core lemmas as a DRAT proof
    of their own.  Those are the lemmas the backward check actually used.
    """

    executable = shutil.which("drat-trim")
    if executable is None:
        return ERROR, {"error": "drat-trim is not on PATH"}
    command = [executable, str(cnf), str(proof)]
    if emit_core is not None:
        command += ["-l", str(emit_core)]
    started = time.monotonic()
    try:
        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            check=False,
            timeout=timeout_seconds,
        )
    except subprocess.TimeoutExpired:
        return TIMEOUT, {
            "timeout_seconds": timeout_seconds,
            "elapsed_seconds": round(time.monotonic() - started, 3),
        }
    except OSError as exc:
        return ERROR, {"error": str(exc)}
    lines = result.stdout.splitlines()
    verified = any(line.strip() == VERIFIED_LINE for line in lines)
    detail = {
        "exit_code": result.returncode,
        "elapsed_seconds": round(time.monotonic() - started, 3),
        "status_lines": [line.strip() for line in lines if line.startswith("s ")],
        "error_lines": [line.strip() for line in lines if "ERROR" in line][:4],
    }
    if verified and result.returncode == 0:
        return VERIFIED, detail
    return NOT_VERIFIED, detail


def verify_pair(
    verify_drat: Any, cnf: Path, proof: Path, timeout_seconds: int
) -> dict[str, Any]:
    """Authoritative verdict from the reused checker, explained when it is False.

    ``_verify_drat`` hardcodes a 600 s timeout and collapses a timeout, a
    missing binary and a genuine refutation failure into one False.  A False is
    therefore always re-run here with the caller's timeout and a captured
    transcript so the three are told apart.
    """

    started = time.monotonic()
    accepted = bool(verify_drat(cnf, proof))
    elapsed = round(time.monotonic() - started, 3)
    entry: dict[str, Any] = {
        "authority": f"{VALIDATOR}:_verify_drat",
        "authority_accepted": accepted,
        "authority_elapsed_seconds": elapsed,
    }
    if accepted:
        entry["verdict"] = VERIFIED
        return entry
    outcome, detail = run_drat_trim(cnf, proof, timeout_seconds)
    entry["verdict"] = outcome
    entry["explanation"] = detail
    return entry


# --------------------------------------------------------------------------
# mutation control
# --------------------------------------------------------------------------


def is_binary_drat(proof: Path) -> bool:
    """Binary-mode DRAT, which ``drat-trim`` announces on its first line.

    Every proof in this corpus is binary, so a text-line mutator finds nothing
    to perturb and the control silently does nothing.  A NUL byte decides it:
    binary DRAT terminates each lemma with one, and text DRAT never holds one.
    """

    with open_regular(proof) as handle:
        head = handle.read(READ_CHUNK)
    return b"\x00" in head and (not head or head[0] in (ADD_MARKER, DELETE_MARKER))


def binary_lemma_starts(data: bytes) -> list[int]:
    """Offsets of the addition lemmas in a binary DRAT proof.

    A lemma is a marker byte, then one LEB128-style varint per literal, then a
    NUL.  Only additions can be perturbed; deleting a delete-instruction
    literal changes what is removed, not what is claimed.
    """

    starts: list[int] = []
    index = 0
    size = len(data)
    while index < size:
        marker = data[index]
        if marker not in (ADD_MARKER, DELETE_MARKER):
            return starts
        if marker == ADD_MARKER:
            starts.append(index)
        index += 1
        while index < size and data[index] != 0:
            index += 1
        index += 1
    return starts


def mutate_binary_proof(
    proof: Path, target: Path, skip: int = 0
) -> dict[str, Any] | None:
    """Negate one literal of a binary lemma by flipping a single bit.

    A literal ``l`` is encoded as the unsigned ``2*|l| + (l < 0)``, written
    seven bits per byte.  Negating it toggles bit 0 of that unsigned value,
    which is bit 0 of its first byte.  Toggling the lowest bit moves the value
    by one and can never cross a varint length boundary, so the edit is exactly
    one byte and the rest of the proof stays aligned.
    """

    data = bytearray(proof.read_bytes())
    starts = binary_lemma_starts(bytes(data))
    # The final addition is the empty clause -- a marker followed straight by
    # its terminator, with no literal to negate.  Skip every such lemma.
    usable = [
        start for start in starts if start + 1 < len(data) and data[start + 1] != 0
    ]
    if len(usable) <= skip:
        return None
    start = usable[-1 - skip]
    literal_byte = start + 1
    before = data[literal_byte]
    data[literal_byte] = before ^ 1
    target.write_bytes(bytes(data))
    return {
        "encoding": "binary",
        "lemma_offset": start,
        "total_addition_lemmas": len(starts),
        "byte_offset": literal_byte,
        "original_byte": before,
        "mutated_byte": before ^ 1,
    }


def _is_lemma(line: bytes) -> bool:
    """A DRAT addition line: signed integers terminated by a lone 0."""

    fields = line.split()
    if len(fields) < 2 or fields[-1] != b"0":
        return False
    if fields[0] in (b"d", b"0"):
        return False
    for field in fields:
        try:
            int(field)
        except ValueError:
            return False
    return True


def mutate_proof(proof: Path, target: Path, skip: int = 0) -> dict[str, Any] | None:
    """Negate the first literal of the ``skip``-th addition lemma from the end.

    Working from the end is deliberate.  ``drat-trim`` checks backwards from the
    empty clause and never examines a lemma outside the core, so perturbing an
    early lemma can leave the verdict untouched; the lemmas nearest the empty
    clause are the ones that derive it.

    Even so, a single flip is not guaranteed to break the proof -- the negated
    lemma can itself be RUP against the accumulated formula.  That is why the
    caller escalates through successive lemmas instead of taking one attempt as
    the answer.
    """

    lines = proof.read_bytes().splitlines(keepends=True)
    remaining = skip
    for index in range(len(lines) - 1, -1, -1):
        stripped = lines[index].rstrip(b"\r\n")
        if not _is_lemma(stripped):
            continue
        fields = stripped.split()
        literal = int(fields[0])
        if literal == 0:
            continue
        if remaining:
            remaining -= 1
            continue
        fields[0] = str(-literal).encode("ascii")
        ending = lines[index][len(stripped) :]
        mutated = b" ".join(fields) + ending
        lines[index] = mutated
        target.write_bytes(b"".join(lines))
        return {
            "line_index": index,
            "total_lines": len(lines),
            "original_literal": literal,
            "mutated_literal": -literal,
        }
    return None


def mutation_control(
    cnf: Path, proof: Path, scratch: Path, timeout_seconds: int
) -> dict[str, Any]:
    """A perturbed proof must not verify.  A control that passes voids the run.

    The perturbation is aimed at the **core**, not at the stored proof.
    ``drat-trim`` checks backwards from the empty clause and never looks at a
    lemma outside the core, and these proofs end in a long tail of lemmas that
    the backward pass does not need -- measured here, eight consecutive
    single-literal flips near the end of a real 11 MB proof all still verified.
    A control aimed there reports a pass while establishing nothing.

    ``-l`` writes the core lemmas as a DRAT proof in their own right.  Every
    lemma in it was used, so a flip lands somewhere the checker must look.  The
    core is verified unperturbed first: a control that only runs the broken
    case cannot tell a working checker from one that rejects everything.

    Escalation is still needed on top of that, because a negated lemma can
    itself be RAT against the accumulated formula.  Every ineffective attempt
    is recorded rather than discarded.
    """

    scratch.mkdir(parents=True, exist_ok=True)
    target = scratch / (proof.name + ".mutant")
    core = scratch / (proof.name + ".core")
    provenance: dict[str, Any] = {}
    try:
        extracted, core_detail = run_drat_trim(
            cnf, proof, timeout_seconds, emit_core=core
        )
        if extracted == VERIFIED and core.is_file() and core.stat().st_size:
            baseline, baseline_detail = run_drat_trim(cnf, core, timeout_seconds)
            if baseline == VERIFIED:
                subject = core
                provenance = {
                    "target": "core_lemmas",
                    "core_bytes": core.stat().st_size,
                    "stored_proof_bytes": proof.stat().st_size,
                    "core_verifies_unperturbed": True,
                    "core_extraction": core_detail,
                }
            else:
                subject = proof
                provenance = {
                    "target": "stored_proof",
                    "reason": "the extracted core did not verify on its own",
                    "core_verdict": baseline,
                    "core_detail": baseline_detail,
                }
        else:
            subject = proof
            provenance = {
                "target": "stored_proof",
                "reason": "core extraction did not produce a usable proof",
                "extraction_verdict": extracted,
            }

        binary = is_binary_drat(subject)
        mutate = mutate_binary_proof if binary else mutate_proof
        return _escalate(
            cnf, subject, mutate, binary, target, timeout_seconds, provenance
        )
    finally:
        target.unlink(missing_ok=True)
        core.unlink(missing_ok=True)


def _escalate(
    cnf: Path,
    subject: Path,
    mutate: Any,
    binary: bool,
    target: Path,
    timeout_seconds: int,
    provenance: dict[str, Any],
) -> dict[str, Any]:
    """Flip one literal at a time, deepest lemma first, until one is rejected."""

    encoding = "binary" if binary else "text"
    attempts: list[dict[str, Any]] = []
    for skip in range(MAX_MUTATION_ATTEMPTS):
        applied = mutate(subject, target, skip=skip)
        if applied is None:
            break
        outcome, detail = run_drat_trim(cnf, target, timeout_seconds)
        attempts.append({**applied, "skip": skip, "verdict": outcome, "detail": detail})
        if outcome != VERIFIED:
            return {
                "n_mutants": 1,
                "n_rejected": 1,
                "encoding": encoding,
                "provenance": provenance,
                "attempts": attempts,
                "rejected_at_skip": skip,
            }
    if not attempts:
        # Not a pass.  The mutator could not touch this proof at all, so the
        # pair has no control and the caller must treat the run as void.
        return {
            "n_mutants": 0,
            "n_rejected": 0,
            "encoding": encoding,
            "provenance": provenance,
            "skipped": "no addition lemma the mutator could perturb",
        }
    # Every attempt stayed RAT.  Not a pass -- an ineffective control.
    return {
        "n_mutants": 1,
        "n_rejected": 0,
        "encoding": encoding,
        "provenance": provenance,
        "attempts": attempts,
        "ineffective": (
            f"all {len(attempts)} single-literal flips still verified; "
            "this control establishes nothing for this pair"
        ),
    }


# --------------------------------------------------------------------------
# route 1 -- the four retained terminal arm cells
# --------------------------------------------------------------------------


def compare_cell_tree(committed: Path, emitted: Path) -> dict[str, Any]:
    """Byte-compare a reproduced cell against the committed one."""

    def digests(root: Path) -> dict[str, str]:
        return {
            path.relative_to(root).as_posix(): sha256_file(path)
            for path in sorted(root.rglob("*"))
            if path.is_file()
        }

    left, right = digests(emitted), digests(committed)
    shared = sorted(set(left) & set(right))
    identical, differing, volatile = [], [], []
    derived: dict[str, Any] = {}
    for name in shared:
        if left[name] == right[name]:
            identical.append(name)
        elif name in VOLATILE_ARTIFACTS:
            volatile.append(
                {"path": name, "committed": right[name], "emitted": left[name]}
            )
        elif name == RECEIPT:
            derived[name] = compare_receipts(committed / name, emitted / name)
            if not derived[name]["redacted_identical"]:
                differing.append(name)
        else:
            differing.append(name)
    only_emitted = sorted(set(left) - set(right))
    only_committed = sorted(set(right) - set(left))
    return {
        "identical": len(identical),
        "identical_paths": identical,
        "volatile_transcripts": volatile,
        "derived": derived,
        "differing": differing,
        "only_emitted": only_emitted,
        "only_committed": only_committed,
        "deterministic_artifacts_identical": (
            not differing
            and not only_emitted
            and not only_committed
            and bool(identical)
        ),
    }


def redact_receipt(document: dict[str, Any]) -> dict[str, Any]:
    """Drop the parts of a receipt that only record wall-clock text.

    The receipt stores a digest of each staged artifact, including the three
    solver and checker transcripts, and then hashes itself.  Those four fields
    cannot match across runs.  Everything else -- the CNF and proof digests,
    the normalization counts, the reported verdicts, the drift table -- stays
    under exact comparison, so a real regression still shows.
    """

    redacted = {
        key: value for key, value in document.items() if key != "receipt_sha256"
    }
    artifacts = redacted.get("artifacts")
    if isinstance(artifacts, dict):
        redacted["artifacts"] = {
            key: value
            for key, value in artifacts.items()
            if not (isinstance(value, dict) and value.get("path") in VOLATILE_ARTIFACTS)
        }
    return redacted


def compare_receipts(committed: Path, emitted: Path) -> dict[str, Any]:
    """Compare two receipts with only the transcript-derived fields redacted."""

    left, right = load_json(committed), load_json(emitted)
    redacted_left, redacted_right = redact_receipt(left), redact_receipt(right)
    dropped = sorted(
        {"receipt_sha256"}
        | {
            f"artifacts.{key}"
            for key in set(left.get("artifacts", {})) | set(right.get("artifacts", {}))
            if key not in redacted_left.get("artifacts", {})
        }
    )
    return {
        "redacted_fields": dropped,
        "redacted_identical": redacted_left == redacted_right,
        "committed_receipt_sha256": left.get("receipt_sha256"),
        "emitted_receipt_sha256": right.get("receipt_sha256"),
    }


def recheck_arm_cell(
    repo_root: Path,
    cell: Path,
    output_dir: Path,
    timeout_seconds: int,
) -> dict[str, Any]:
    """Run the preparer unchanged, then byte-compare what it produced."""

    entry: dict[str, Any] = {
        "route": "arm-cell",
        "tool": PREPARER,
        "cell": cell.relative_to(repo_root).as_posix(),
    }
    target = output_dir / cell.name
    if target.exists():
        shutil.rmtree(target)
    environment = dict(os.environ)
    scripts = (repo_root / "scripts").as_posix()
    environment["PYTHONPATH"] = (
        scripts
        if not environment.get("PYTHONPATH")
        else scripts + os.pathsep + environment["PYTHONPATH"]
    )
    started = time.monotonic()
    result = subprocess.run(
        [
            sys.executable,
            str(repo_root / PREPARER),
            "--workdir",
            str(cell),
            "--output-dir",
            str(target),
            "--repo-root",
            str(repo_root),
        ],
        cwd=repo_root,
        env=environment,
        capture_output=True,
        text=True,
        check=False,
        timeout=timeout_seconds,
    )
    entry["elapsed_seconds"] = round(time.monotonic() - started, 3)
    entry["exit_code"] = result.returncode
    if result.returncode != 0:
        entry["verdict"] = ERROR
        entry["stderr_tail"] = result.stderr.strip().splitlines()[-6:]
        return entry
    entry["comparison"] = compare_cell_tree(cell, target)
    committed = load_json(cell / "receipt.json")
    fresh = load_json(target / "receipt.json")
    entry["receipt"] = {
        "declared_original_precheck": committed.get("original_proof_precheck", {}).get(
            "reported_verdict"
        ),
        "declared_fresh_verdict": committed.get("fresh_proof", {}).get(
            "reported_verdict"
        ),
        "reproduced_original_precheck": fresh.get("original_proof_precheck", {}).get(
            "reported_verdict"
        ),
        "reproduced_fresh_verdict": fresh.get("fresh_proof", {}).get(
            "reported_verdict"
        ),
        "normalization_identical": committed.get("normalization")
        == fresh.get("normalization"),
        "rematerialization": fresh.get("rematerialization", {}).get(
            "cnf_bytes_identical"
        ),
    }
    entry["verdict"] = (
        AGREES
        if entry["comparison"]["deterministic_artifacts_identical"]
        and entry["receipt"]["normalization_identical"]
        and entry["receipt"]["rematerialization"] is True
        else DISAGREES
    )
    return entry


# --------------------------------------------------------------------------
# route 2 -- declared (cnf, proof) pairs
# --------------------------------------------------------------------------


def recheck_pair(
    repo_root: Path,
    verify_drat: Any,
    pair: dict[str, Any],
    scratch: Path,
    timeout_seconds: int,
    solve_timeout_seconds: int,
    run_control: bool,
) -> dict[str, Any]:
    """Recheck one declared pair against the verdict its record claims."""

    cnf = repo_root / pair["cnf"]
    proof = repo_root / pair["proof"]
    entry: dict[str, Any] = {
        "route": "pair",
        "cnf": pair["cnf"],
        "proof": pair["proof"],
        "records": pair["records"],
        "declared_verdicts": pair["declared_verdicts"],
        "declared_class": pair["declared_class"],
        "cnf_bytes": cnf.stat().st_size,
        "proof_bytes": proof.stat().st_size,
    }
    stored = verify_pair(verify_drat, cnf, proof, timeout_seconds)
    entry["stored_proof"] = stored

    expected = VERIFIED if pair["declared_class"] == "TERMINAL" else NOT_VERIFIED
    entry["expected_verdict"] = expected
    entry["verdict"] = AGREES if stored["verdict"] == expected else DISAGREES
    if stored["verdict"] in (TIMEOUT, ERROR):
        entry["verdict"] = stored["verdict"]

    if pair["declared_class"] == "TERMINAL" and stored["verdict"] == VERIFIED:
        entry["fresh_proof"] = solve_afresh(
            repo_root, cnf, scratch, timeout_seconds, solve_timeout_seconds
        )
    if run_control and pair["declared_class"] == "TERMINAL":
        entry["mutation_control"] = mutation_control(
            cnf, proof, scratch, timeout_seconds
        )
    return entry


def solve_afresh(
    repo_root: Path,
    cnf: Path,
    scratch: Path,
    check_timeout_seconds: int,
    solve_timeout_seconds: int,
) -> dict[str, Any]:
    """Second implementation: a fresh cadical --plain proof, rechecked.

    One checker agreeing with the proof it was handed is not evidence.  This
    re-derives the refutation from the CNF alone and checks that proof too.
    """

    executable = shutil.which("cadical")
    if executable is None:
        return {"verdict": ERROR, "error": "cadical is not on PATH"}
    scratch.mkdir(parents=True, exist_ok=True)
    fresh = scratch / (cnf.stem + ".fresh.drat")
    try:
        started = time.monotonic()
        try:
            solved = subprocess.run(
                [executable, "--plain", str(cnf), str(fresh)],
                capture_output=True,
                text=True,
                check=False,
                timeout=solve_timeout_seconds,
            )
        except subprocess.TimeoutExpired:
            return {
                "verdict": TIMEOUT,
                "timeout_seconds": solve_timeout_seconds,
            }
        entry: dict[str, Any] = {
            "command": "cadical --plain",
            "exit_code": solved.returncode,
            "elapsed_seconds": round(time.monotonic() - started, 3),
            "proof_bytes": fresh.stat().st_size if fresh.is_file() else 0,
        }
        # CaDiCaL reports 20 for UNSAT and 10 for SAT.
        if solved.returncode != 20:
            entry["verdict"] = DISAGREES
            entry["reported"] = "SAT" if solved.returncode == 10 else "INCONCLUSIVE"
            return entry
        outcome, detail = run_drat_trim(cnf, fresh, check_timeout_seconds)
        entry["reported"] = "UNSAT"
        entry["recheck"] = detail
        entry["verdict"] = AGREES if outcome == VERIFIED else outcome
        return entry
    finally:
        fresh.unlink(missing_ok=True)


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------


def write_outputs(
    output_dir: Path, name: str, records: list[dict[str, Any]], summary: dict[str, Any]
) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)
    with (output_dir / f"{name}.jsonl").open("w", encoding="utf-8") as handle:
        for record in records:
            handle.write(json.dumps(record, sort_keys=True) + "\n")
    (output_dir / f"{name}-summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


def summarize(records: list[dict[str, Any]]) -> dict[str, Any]:
    verdicts: dict[str, int] = {}
    for record in records:
        verdicts[record["verdict"]] = verdicts.get(record["verdict"], 0) + 1
    mutants = sum(
        record.get("mutation_control", {}).get("n_mutants", 0) for record in records
    )
    rejected = sum(
        record.get("mutation_control", {}).get("n_rejected", 0) for record in records
    )
    # A terminal pair with no control is not a pass.  Counting only mutants
    # would let a mutator that perturbs nothing report a clean run.
    owed = [
        record
        for record in records
        if record.get("declared_class") == "TERMINAL" and record.get("route") == "pair"
    ]
    uncontrolled = [
        record["proof"]
        for record in owed
        if record.get("mutation_control", {}).get("n_mutants", 0) == 0
    ]
    return {
        "n_records": len(records),
        "verdicts": verdicts,
        "mutation_control": {
            "n_mutants": mutants,
            "n_rejected": rejected,
            "controls_owed": len(owed),
            "uncontrolled_terminal_proofs": sorted(uncontrolled),
        },
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--repo-root", type=Path, default=Path(__file__).resolve().parents[1]
    )
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=7200)
    # Mutants and fresh proofs are transient and can be hundreds of megabytes,
    # so they belong in the run root's tmp class, not beside the artifacts.
    parser.add_argument("--scratch-dir", type=Path)
    parser.add_argument("--solve-timeout-seconds", type=int, default=7200)
    sub = parser.add_subparsers(dest="command", required=True)

    listing = sub.add_parser("enumerate", help="report the candidate pairs only")
    listing.add_argument("--survey", type=Path, required=True)

    cells = sub.add_parser("arm-cells", help="rerun the preparer on retained cells")
    cells.add_argument("--cells", type=Path, nargs="+", required=True)

    pairs = sub.add_parser("pairs", help="recheck declared (cnf, proof) pairs")
    pairs.add_argument("--survey", type=Path, required=True)
    pairs.add_argument("--no-control", action="store_true")

    args = parser.parse_args(argv)
    repo_root = args.repo_root.resolve()
    output_dir = args.output_dir.resolve()
    scratch = (args.scratch_dir or output_dir / "tmp").resolve()

    before = tracked_tree_state(repo_root)

    if args.command == "enumerate":
        listing_result = enumerate_pairs(args.survey.resolve(), repo_root)
        output_dir.mkdir(parents=True, exist_ok=True)
        (output_dir / "solver-verdict-candidates.json").write_text(
            json.dumps(listing_result, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        print(json.dumps(listing_result, indent=2, sort_keys=True))
        return 0

    if args.command == "arm-cells":
        records = [
            recheck_arm_cell(
                repo_root, cell.resolve(), output_dir / "cells", args.timeout_seconds
            )
            for cell in args.cells
        ]
        name = "solver-verdict-arm-cells"
    else:
        verify_drat = load_module(
            repo_root / VALIDATOR, "exact12_next_row_arm_static_v24_validator"
        )._verify_drat
        listing_result = enumerate_pairs(args.survey.resolve(), repo_root)
        records = [
            recheck_pair(
                repo_root,
                verify_drat,
                pair,
                scratch,
                args.timeout_seconds,
                args.solve_timeout_seconds,
                not args.no_control,
            )
            for pair in listing_result["pairs"]
        ]
        name = "solver-verdict-pairs"

    after = tracked_tree_state(repo_root)
    summary = {
        "schema": SUMMARY_SCHEMA,
        "record_schema": SCHEMA,
        "command": args.command,
        **summarize(records),
        "write_guard": {
            "trees": list(GUARDED_TREES),
            "before": before,
            "after": after,
            "unchanged": before == after,
        },
    }
    write_outputs(output_dir, name, records, summary)
    print(json.dumps(summary, indent=2, sort_keys=True))

    if not summary["write_guard"]["unchanged"]:
        return 3
    control = summary["mutation_control"]
    if control["n_mutants"] != control["n_rejected"]:
        return 3
    if control["uncontrolled_terminal_proofs"]:
        return 3
    if control["n_rejected"] != control["controls_owed"]:
        return 3
    if any(record["verdict"] in (DISAGREES, ERROR, TIMEOUT) for record in records):
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
