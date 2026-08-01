"""Fail-closed Phase-3 SAT enumeration for the P97 census.

This module implements ``PHASE3-SPEC.md`` v0.1.  CaDiCaL models are decoded
through the Phase-1/2 validating constructors, independently rechecked, passed
through ``iterate_cell``, and blocked as *raw labelled semantic assignments*.
Only a terminal UNSAT whose DRAT proof is accepted by ``drat-trim`` produces
``COMPLETE``.
"""

from __future__ import annotations

import argparse
import contextlib
import hashlib
import itertools
import json
import os
import shutil
import subprocess
import tempfile
from collections.abc import Callable, Iterable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from annotations import AnnotatedNode, BlockerAnnotation, CapAnnotation
from canonical import canonical, canonical_annotated
from cells import Cell
from iterate import CanonicalBank, Generator, iterate_cell, rule_bank_hash
from node import Node
from rules import r_circ2_predicate

SPEC_VERSION = "phase3-v0.1"
PROJECTED_STATIC_SPEC_VERSION = "phase3-v0.2-projected-static"
SEMANTIC_SCHEMA_LEGACY = "p97-phase3-semantic-assignment-v1-sbf"
SEMANTIC_SCHEMA_PROJECTED = "p97-phase3-semantic-assignment-v2-sf"
MINCUT_SCOPE_CARD_GE_TEN = "counterexample_card_ge_ten"
MINCUT_SCOPE_MINIMAL_SOURCE = "minimal-source"
MINCUT_SCOPES = (MINCUT_SCOPE_CARD_GE_TEN, MINCUT_SCOPE_MINIMAL_SOURCE)
CLAUSE_TAGS = (
    "S-D1",
    "S-EXACT",
    "S-CIRC2",
    "B-TOTAL",
    "B-MEM",
    "B-INDEG",
    "CAP-TOTAL",
    "CAP-PROFILE",
    "DUAL2",
    "S-MINCUT",
)


class Phase3Error(RuntimeError):
    """An encoding, decoding, validation, or artifact-contract failure."""


@dataclass(frozen=True)
class SolverResult:
    verdict: str
    assignment: Mapping[int, bool]
    returncode: int
    stdout: str = ""
    stderr: str = ""


@dataclass(frozen=True)
class CheckerResult:
    verified: bool
    returncode: int
    stdout: str = ""
    stderr: str = ""


SolverRunner = Callable[[Path, int, Path | None], SolverResult]
CheckerRunner = Callable[[Path, Path, int], CheckerResult]


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_file(path: Path) -> str:
    return _sha256_bytes(path.read_bytes())


def _atomic_bytes(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp_name = tempfile.mkstemp(
        dir=str(path.parent), prefix=f".{path.name}-", suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "wb") as fh:
            fh.write(data)
            fh.flush()
            os.fsync(fh.fileno())
        os.replace(tmp_name, path)
    except BaseException:
        with contextlib.suppress(OSError):
            os.remove(tmp_name)
        raise


def _atomic_text(path: Path, text: str) -> None:
    _atomic_bytes(path, text.encode("utf-8"))


def _atomic_json(path: Path, value: Any) -> None:
    _atomic_text(path, json.dumps(value, indent=2, sort_keys=True) + "\n")


def _jsonl_bytes(records: Sequence[Mapping[str, Any]]) -> bytes:
    return "".join(
        json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n"
        for record in records
    ).encode("utf-8")


def _cell_json(cell: Cell) -> dict[str, Any]:
    return {
        "k": cell.k,
        "n": cell.n,
        "profile": list(cell.profile) if cell.profile is not None else None,
        "exact": cell.exact,
    }


def _version(command: Sequence[str]) -> str:
    try:
        result = subprocess.run(
            list(command), capture_output=True, text=True, timeout=10, check=False
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        return f"unavailable: {exc}"
    text = (result.stdout + "\n" + result.stderr).strip()
    return text.splitlines()[0] if text else f"exit {result.returncode}"


class SatEncoding:
    """Deterministic CNF for one exact Phase-3 cell."""

    def __init__(
        self,
        cell: Cell,
        *,
        blocker: bool = False,
        cap: bool | None = None,
        project_blockers: bool = False,
        static_dual2: bool = False,
        mincut_scope: str | None = None,
    ) -> None:
        if not cell.exact:
            raise Phase3Error("Phase 3 accepts exact=True cells only")
        if cell.k > max(0, cell.n - 1):
            raise Phase3Error(f"exact row size k={cell.k} exceeds n-1={cell.n - 1}")
        if cap is None:
            cap = cell.profile is not None
        if cell.profile is not None and not cap:
            raise Phase3Error("profiled cells require a cap-bearing mode")
        if cell.profile is None and cap:
            raise Phase3Error("FRAMELESS cells reject cap-bearing modes")
        if project_blockers and not blocker:
            raise Phase3Error("blocker projection requires blocker=True")
        if mincut_scope not in (None, *MINCUT_SCOPES):
            raise Phase3Error(
                "mincut_scope must be None, 'counterexample_card_ge_ten', "
                "or 'minimal-source'"
            )
        if (
            mincut_scope == MINCUT_SCOPE_CARD_GE_TEN
            and (cell.k != 4 or cell.n != 10)
        ):
            raise Phase3Error(
                "counterexample_card_ge_ten admits S-MINCUT only at k=4, n=10"
            )

        self.cell = cell
        self.blocker = blocker
        self.cap = bool(cap)
        self.project_blockers = project_blockers
        self.static_dual2 = static_dual2
        self.mincut_scope = mincut_scope
        self.projected_static = bool(
            project_blockers or static_dual2 or mincut_scope is not None
        )
        self.spec_version = (
            PROJECTED_STATIC_SPEC_VERSION if self.projected_static else SPEC_VERSION
        )
        self.semantic_schema = (
            SEMANTIC_SCHEMA_PROJECTED
            if self.project_blockers
            else SEMANTIC_SCHEMA_LEGACY
        )
        if self.cap and self.blocker and self.project_blockers:
            self.mode = "cap+blocker-projected"
        elif self.blocker and self.project_blockers:
            self.mode = "blocker-projected"
        elif self.cap and self.blocker:
            self.mode = "cap+blocker-annotated"
        elif self.cap:
            self.mode = "cap-annotated"
        elif self.blocker:
            self.mode = "blocker-annotated"
        else:
            self.mode = "bare"

        self.var_for: dict[tuple[Any, ...], int] = {}
        self.key_for: dict[int, tuple[Any, ...]] = {}
        self.semantic_vars: list[int] = []
        self.clauses: list[tuple[int, ...]] = []
        self.clause_counts: dict[str, int] = {tag: 0 for tag in CLAUSE_TAGS}
        self._allocate_semantic_variables()
        self._emit_hard_clauses()

    @property
    def num_vars(self) -> int:
        return len(self.key_for)

    def configuration(self) -> dict[str, Any]:
        """Versioned, hashable description of the exact SAT/semantic contract."""
        return {
            "spec_version": self.spec_version,
            "semantic_assignment_schema": self.semantic_schema,
            "project_blockers": self.project_blockers,
            "static_dual2": self.static_dual2,
            "mincut_scope": self.mincut_scope,
        }

    def _new_var(self, key: tuple[Any, ...], *, semantic: bool) -> int:
        if key in self.var_for:
            raise Phase3Error(f"duplicate SAT variable key {key!r}")
        var = len(self.key_for) + 1
        self.var_for[key] = var
        self.key_for[var] = key
        if semantic:
            self.semantic_vars.append(var)
        return var

    def _allocate_semantic_variables(self) -> None:
        n = self.cell.n
        for p in range(n):
            for q in range(n):
                if p != q:
                    self._new_var(("s", p, q), semantic=True)
        if self.blocker and not self.project_blockers:
            for x in range(n):
                for d in range(n):
                    if x != d:
                        self._new_var(("b", x, d), semantic=True)
        if self.cap:
            for x in range(3, n):  # fixed M = {0,1,2}
                for i in range(3):
                    self._new_var(("f", x, i), semantic=True)

    def var(self, *key: Any) -> int:
        try:
            return self.var_for[tuple(key)]
        except KeyError as exc:
            raise Phase3Error(f"SAT variable does not exist: {tuple(key)!r}") from exc

    def _add(self, tag: str, clause: Iterable[int]) -> None:
        normalized = tuple(clause)
        if not normalized:
            # The empty clause is meaningful (e.g. impossible cardinality).
            pass
        if any(lit == 0 or abs(lit) > self.num_vars for lit in normalized):
            raise Phase3Error(f"bad literal in {normalized!r}")
        self.clauses.append(normalized)
        self.clause_counts[tag] += 1

    def _exactly(
        self,
        variables: Sequence[int],
        target: int,
        tag: str,
        *,
        prefix: Sequence[int] = (),
    ) -> None:
        m = len(variables)
        if target < 0 or target > m:
            self._add(tag, prefix)
            return
        # At least target: every (m-target+1)-set contains a true variable.
        if target > 0:
            for subset in itertools.combinations(variables, m - target + 1):
                self._add(tag, (*prefix, *subset))
        # At most target: every (target+1)-set contains a false variable.
        if target < m:
            for subset in itertools.combinations(variables, target + 1):
                self._add(tag, (*prefix, *(-v for v in subset)))

    def _emit_hard_clauses(self) -> None:
        n, k = self.cell.n, self.cell.k
        # S-D1 has count zero: diagonal variables are definitionally absent.
        for p in range(n):
            row = [self.var("s", p, q) for q in range(n) if q != p]
            self._exactly(row, k, "S-EXACT")

        for p, q in itertools.combinations(range(n), 2):
            other = [a for a in range(n) if a not in (p, q)]
            for a, b, c in itertools.combinations(other, 3):
                self._add(
                    "S-CIRC2",
                    (
                        -self.var("s", p, a),
                        -self.var("s", p, b),
                        -self.var("s", p, c),
                        -self.var("s", q, a),
                        -self.var("s", q, b),
                        -self.var("s", q, c),
                    ),
                )

        if self.blocker and not self.project_blockers:
            for x in range(n):
                choices = [self.var("b", x, d) for d in range(n) if d != x]
                self._exactly(choices, 1, "B-TOTAL")
                for d in range(n):
                    if d != x:
                        self._add(
                            "B-MEM",
                            (-self.var("b", x, d), self.var("s", d, x)),
                        )
        elif self.project_blockers:
            for x in range(n):
                self._add(
                    "B-INDEG",
                    (self.var("s", d, x) for d in range(n) if d != x),
                )

        if self.static_dual2:
            for a, b in itertools.combinations(range(n), 2):
                centers = [p for p in range(n) if p not in (a, b)]
                for p, q, r in itertools.combinations(centers, 3):
                    self._add(
                        "DUAL2",
                        (
                            -self.var("s", p, a),
                            -self.var("s", p, b),
                            -self.var("s", q, a),
                            -self.var("s", q, b),
                            -self.var("s", r, a),
                            -self.var("s", r, b),
                        ),
                    )

        if self.mincut_scope is not None:
            labels = range(n)
            for mask in range(1, (1 << n) - 1):
                inside = [x for x in labels if mask & (1 << x)]
                outside = [p for p in labels if not mask & (1 << p)]
                self._add(
                    "S-MINCUT",
                    (
                        self.var("s", p, x)
                        for p in outside
                        for x in inside
                    ),
                )

        if self.cap:
            non_moser = list(range(3, n))
            for x in non_moser:
                self._exactly(
                    [self.var("f", x, i) for i in range(3)], 1, "CAP-TOTAL"
                )
            assert self.cell.profile is not None
            strict = tuple(h - 2 for h in self.cell.profile)
            profiles = tuple(sorted(set(itertools.permutations(strict))))
            selectors = [
                self._new_var(("profile-selector", j, *profile), semantic=False)
                for j, profile in enumerate(profiles)
            ]
            self._exactly(selectors, 1, "CAP-PROFILE")
            for selector, profile in zip(selectors, profiles):
                for i, target in enumerate(profile):
                    variables = [self.var("f", x, i) for x in non_moser]
                    self._exactly(
                        variables, target, "CAP-PROFILE", prefix=(-selector,)
                    )

    def semantic_name(self, var: int) -> str:
        key = self.key_for[var]
        return "[".join((str(key[0]), ",".join(str(v) for v in key[1:]))) + "]"

    def cnf_header_bytes(self, clause_count: int) -> bytes:
        """Render the DIMACS header for an already-counted clause body."""
        return (
            f"c {self.spec_version} mode={self.mode}\n"
            f"p cnf {self.num_vars} {clause_count}\n"
        ).encode("ascii")

    def cnf_clause_body_bytes(
        self, clauses: Sequence[Sequence[int]]
    ) -> bytes:
        """Render clause lines without a DIMACS header."""
        return b"".join(
            (" ".join(str(lit) for lit in clause) + " 0\n").encode("ascii")
            for clause in clauses
        )

    def cnf_bytes(self, extra_clauses: Sequence[Sequence[int]] = ()) -> bytes:
        clauses = [*self.clauses, *(tuple(c) for c in extra_clauses)]
        return b"".join(
            (
                self.cnf_header_bytes(len(clauses)),
                self.cnf_clause_body_bytes(clauses),
            )
        )

    def decode(self, assignment: Mapping[int, bool]) -> Node | AnnotatedNode:
        missing = [var for var in self.semantic_vars if var not in assignment]
        if missing:
            raise Phase3Error(
                f"model omits {len(missing)} semantic variables; first={missing[:5]}"
            )
        n, k = self.cell.n, self.cell.k
        shells = tuple(
            frozenset(
                q
                for q in range(n)
                if q != p and assignment[self.var("s", p, q)]
            )
            for p in range(n)
        )
        node = Node(n=n, k=k, shells=shells)
        blocker_ann = None
        if self.blocker and self.project_blockers:
            c = []
            for x in range(n):
                chosen = [
                    d
                    for d in range(n)
                    if d != x and assignment[self.var("s", d, x)]
                ]
                if not chosen:
                    raise Phase3Error(
                        f"projected blocker reconstruction has no incoming center at x={x}"
                    )
                c.append(min(chosen))
            blocker_ann = BlockerAnnotation(node=node, c=tuple(c))
        elif self.blocker:
            c: list[int] = []
            for x in range(n):
                chosen = [
                    d
                    for d in range(n)
                    if d != x and assignment[self.var("b", x, d)]
                ]
                if len(chosen) != 1:
                    raise Phase3Error(f"decoded blocker row x={x} has {chosen!r}")
                c.append(chosen[0])
            blocker_ann = BlockerAnnotation(node=node, c=tuple(c))
        cap_ann = None
        if self.cap:
            f: dict[int, int] = {}
            for x in range(3, n):
                chosen = [
                    i for i in range(3) if assignment[self.var("f", x, i)]
                ]
                if len(chosen) != 1:
                    raise Phase3Error(f"decoded cap row x={x} has {chosen!r}")
                f[x] = chosen[0]
            cap_ann = CapAnnotation(node=node, M=frozenset({0, 1, 2}), f=f)
        obj: Node | AnnotatedNode
        if blocker_ann is None and cap_ann is None:
            obj = node
        else:
            obj = AnnotatedNode(node=node, blocker=blocker_ann, caps=cap_ann)
        self.validate(obj, assignment)
        return obj

    def validate(
        self, obj: Node | AnnotatedNode, assignment: Mapping[int, bool]
    ) -> None:
        node = obj if isinstance(obj, Node) else obj.node
        if node.n != self.cell.n or node.k != self.cell.k:
            raise Phase3Error("decoded node does not match the cell")
        if any(len(shell) != self.cell.k for shell in node.shells):
            raise Phase3Error("decoded model violates exact row sizes")
        if r_circ2_predicate(node):
            raise Phase3Error("decoded model violates R-CIRC2")
        if self.static_dual2:
            for a, b in itertools.combinations(range(self.cell.n), 2):
                centers = [
                    p
                    for p in range(self.cell.n)
                    if a in node.shell(p) and b in node.shell(p)
                ]
                if len(centers) > 2:
                    raise Phase3Error(
                        f"decoded model violates DUAL2 at targets {(a, b)}"
                    )
        if self.mincut_scope is not None:
            for mask in range(1, (1 << self.cell.n) - 1):
                if not any(
                    x in node.shell(p)
                    for x in range(self.cell.n)
                    if mask & (1 << x)
                    for p in range(self.cell.n)
                    if not mask & (1 << p)
                ):
                    raise Phase3Error(
                        f"decoded model violates S-MINCUT at mask={mask}"
                    )

        blocker = obj.blocker if isinstance(obj, AnnotatedNode) else None
        caps = obj.caps if isinstance(obj, AnnotatedNode) else None
        if self.blocker != (blocker is not None) or self.cap != (caps is not None):
            raise Phase3Error("decoded annotation mode mismatch")
        if blocker is not None:
            for x, d in enumerate(blocker.c):
                if x not in node.shell(d):
                    raise Phase3Error(f"decoded model violates B1 at x={x}, d={d}")
            # Defensive R-FIBER4 derivation.
            if any(len(fiber) > self.cell.k for fiber in blocker.fibers().values()):
                raise Phase3Error("decoded blocker fiber exceeds exact shell size")
        if caps is not None:
            if caps.M != frozenset({0, 1, 2}):
                raise Phase3Error("decoded cap annotation does not use fixed M={0,1,2}")
            if caps.closed_profile() != self.cell.profile:
                raise Phase3Error(
                    f"decoded cap profile {caps.closed_profile()} != {self.cell.profile}"
                )
        elif self.cell.profile is not None:
            raise Phase3Error("profiled cell decoded without caps")

        for var in self.semantic_vars:
            key = self.key_for[var]
            if key[0] == "s":
                _, p, q = key
                expected = q in node.shell(p)
            elif key[0] == "b":
                assert blocker is not None and not self.project_blockers
                _, x, d = key
                expected = blocker.c[x] == d
            else:
                assert key[0] == "f" and caps is not None
                _, x, i = key
                expected = caps.f[x] == i
            if assignment[var] is not expected:
                raise Phase3Error(
                    f"semantic readback mismatch for {key!r}: "
                    f"model={assignment[var]}, reconstructed={expected}"
                )

    def semantic_record(self, assignment: Mapping[int, bool]) -> dict[str, bool]:
        return {
            self.semantic_name(var): bool(assignment[var])
            for var in self.semantic_vars
        }

    def assignment_from_record(self, record: Mapping[str, Any]) -> dict[int, bool]:
        semantic = record.get("semantic_assignment")
        if not isinstance(semantic, dict):
            raise Phase3Error("model record lacks semantic_assignment object")
        expected_names = {self.semantic_name(v): v for v in self.semantic_vars}
        if set(semantic) != set(expected_names):
            raise Phase3Error("model record semantic variable set is inconsistent")
        if any(type(value) is not bool for value in semantic.values()):
            raise Phase3Error("model record semantic assignment contains non-booleans")
        return {var: semantic[name] for name, var in expected_names.items()}

    def blocking_clause(self, assignment: Mapping[int, bool]) -> tuple[int, ...]:
        clause = tuple(
            -var if assignment[var] else var for var in self.semantic_vars
        )
        if len(clause) != len(self.semantic_vars):
            raise Phase3Error("incomplete semantic blocking clause")
        if any(
            (lit > 0 and assignment[abs(lit)])
            or (lit < 0 and not assignment[abs(lit)])
            for lit in clause
        ):
            raise Phase3Error("blocking clause does not negate the current assignment")
        return clause


def run_cadical(cnf_path: Path, timeout_s: int, proof_path: Path | None) -> SolverResult:
    command = ["cadical", "-q", "-t", str(timeout_s), str(cnf_path)]
    if proof_path is not None:
        command.append(str(proof_path))
    try:
        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=timeout_s + 30,
            check=False,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        return SolverResult("UNKNOWN", {}, 0, stderr=str(exc))
    if result.returncode == 10:
        assignment: dict[int, bool] = {}
        try:
            for line in result.stdout.splitlines():
                if line.startswith("v "):
                    for token in line.split()[1:]:
                        lit = int(token)
                        if lit:
                            assignment[abs(lit)] = lit > 0
        except ValueError as exc:
            return SolverResult(
                "UNKNOWN", {}, result.returncode, result.stdout, f"bad model: {exc}"
            )
        return SolverResult(
            "SAT", assignment, result.returncode, result.stdout, result.stderr
        )
    if result.returncode == 20:
        return SolverResult(
            "UNSAT", {}, result.returncode, result.stdout, result.stderr
        )
    return SolverResult(
        "UNKNOWN", {}, result.returncode, result.stdout, result.stderr
    )


def run_drat_trim(cnf_path: Path, proof_path: Path, timeout_s: int) -> CheckerResult:
    try:
        result = subprocess.run(
            ["drat-trim", str(cnf_path), str(proof_path)],
            capture_output=True,
            text=True,
            timeout=timeout_s + 30,
            check=False,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        return CheckerResult(False, 0, stderr=str(exc))
    verified = any(line.strip() == "s VERIFIED" for line in result.stdout.splitlines())
    return CheckerResult(
        verified, result.returncode, result.stdout, result.stderr
    )


def _canonical_digest(obj: Node | AnnotatedNode) -> str:
    value = canonical(obj) if isinstance(obj, Node) else canonical_annotated(obj)
    return hashlib.sha256(repr(value).encode("utf-8")).hexdigest()


def _artifact_hashes(run_dir: Path) -> dict[str, str]:
    names = (
        "base.cnf",
        "models.jsonl",
        "bank.jsonl",
        "terminal.cnf",
        "terminal.drat",
        "terminal.drat.check",
    )
    return {
        name: _sha256_file(run_dir / name)
        for name in names
        if (run_dir / name).is_file()
    }


def _claim_for(status: str) -> str:
    if status == "COMPLETE":
        return (
            "complete semantic enumeration relative to the audited cell CNF; "
            "terminal UNSAT is DRAT-verified"
        )
    if status == "PARTIAL":
        return "SAT witness census only; semantic enumeration is incomplete"
    return "no completeness or non-existence claim; run failed closed"


def _manifest(
    encoding: SatEncoding,
    run_dir: Path,
    *,
    status: str,
    timeout_s: int,
    model_limit: int | None,
    raw_count: int,
    canonical_count: int,
    terminal_clause_count: int | None,
    unsat_verified: bool,
    diagnostic: str | None,
) -> dict[str, Any]:
    return {
        "spec_version": encoding.spec_version,
        "encoding_configuration": encoding.configuration(),
        "semantic_assignment_schema": encoding.semantic_schema,
        "cell": _cell_json(encoding.cell),
        "mode": encoding.mode,
        "clause_tags": dict(encoding.clause_counts),
        "semantic_variable_count": len(encoding.semantic_vars),
        "base_variable_count": encoding.num_vars,
        "base_clause_count": len(encoding.clauses),
        "terminal_variable_count": (
            encoding.num_vars if terminal_clause_count is not None else None
        ),
        "terminal_clause_count": terminal_clause_count,
        "solver_version": _version(("cadical", "--version")),
        "checker_version": _version(("drat-trim",)),
        "timeout_s": timeout_s,
        "model_limit": model_limit,
        "rule_bank_hash": rule_bank_hash(),
        "status": status,
        "result_claim": _claim_for(status),
        "raw_count": raw_count,
        "canonical_count": canonical_count,
        "unsat_verified": unsat_verified,
        "diagnostic": diagnostic,
        "artifact_hashes": _artifact_hashes(run_dir),
    }


def _read_models(path: Path) -> list[dict[str, Any]]:
    if not path.exists():
        return []
    records: list[dict[str, Any]] = []
    for line_no, line in enumerate(path.read_text().splitlines(), 1):
        if not line.strip():
            continue
        try:
            record = json.loads(line)
        except json.JSONDecodeError as exc:
            raise Phase3Error(f"{path}:{line_no}: malformed JSON: {exc}") from exc
        if not isinstance(record, dict):
            raise Phase3Error(f"{path}:{line_no}: model record is not an object")
        records.append(record)
    return records


def _verify_prior_records(
    encoding: SatEncoding,
    records: Sequence[Mapping[str, Any]],
    bank: CanonicalBank,
) -> list[tuple[int, ...]]:
    blocks: list[tuple[int, ...]] = []
    seen: set[tuple[bool, ...]] = set()
    for index, record in enumerate(records):
        if record.get("index") != index:
            raise Phase3Error(f"non-consecutive model index at record {index}")
        assignment = encoding.assignment_from_record(record)
        obj = encoding.decode(assignment)
        block = encoding.blocking_clause(assignment)
        if list(block) != record.get("blocking_clause"):
            raise Phase3Error(f"blocking clause mismatch at model {index}")
        raw_key = tuple(assignment[v] for v in encoding.semantic_vars)
        if raw_key in seen:
            raise Phase3Error(f"duplicate raw semantic assignment at model {index}")
        seen.add(raw_key)
        digest = _canonical_digest(obj)
        if record.get("canonical_digest") != digest or not bank.has(digest):
            raise Phase3Error(f"canonical bank mismatch at model {index}")
        blocks.append(block)
    return blocks


def verify_run_artifacts(run_dir: str | Path) -> dict[str, Any]:
    """Fail-closed verification of a completed/partial Phase-3 run directory."""

    path = Path(run_dir)
    manifest_path = path / "manifest.json"
    if not manifest_path.is_file():
        raise Phase3Error("missing manifest.json")
    manifest = json.loads(manifest_path.read_text())
    cell_data = manifest["cell"]
    cell = Cell(
        k=cell_data["k"],
        n=cell_data["n"],
        profile=(
            tuple(cell_data["profile"]) if cell_data["profile"] is not None else None
        ),
        exact=cell_data["exact"],
    )
    mode = manifest["mode"]
    configuration = manifest.get("encoding_configuration")
    if configuration is None:
        if manifest.get("spec_version") != SPEC_VERSION:
            raise Phase3Error("manifest spec_version mismatch")
        configuration = {
            "spec_version": SPEC_VERSION,
            "semantic_assignment_schema": SEMANTIC_SCHEMA_LEGACY,
            "project_blockers": False,
            "static_dual2": False,
            "mincut_scope": None,
        }
    if not isinstance(configuration, dict):
        raise Phase3Error("manifest encoding_configuration is not an object")
    encoding = SatEncoding(
        cell,
        blocker=mode in (
            "blocker-annotated",
            "cap+blocker-annotated",
            "blocker-projected",
            "cap+blocker-projected",
        ),
        cap=mode in (
            "cap-annotated",
            "cap+blocker-annotated",
            "cap+blocker-projected",
        ),
        project_blockers=configuration.get("project_blockers", False),
        static_dual2=configuration.get("static_dual2", False),
        mincut_scope=configuration.get("mincut_scope"),
    )
    if mode != encoding.mode:
        raise Phase3Error(f"manifest has unknown or inconsistent mode {mode!r}")
    if configuration != encoding.configuration():
        raise Phase3Error("manifest encoding_configuration mismatch")
    if manifest.get("spec_version") != encoding.spec_version:
        raise Phase3Error("manifest spec_version mismatch")
    if manifest.get(
        "semantic_assignment_schema", SEMANTIC_SCHEMA_LEGACY
    ) != encoding.semantic_schema:
        raise Phase3Error("manifest semantic_assignment_schema mismatch")
    manifest_clause_tags = manifest.get("clause_tags")
    if (
        encoding.spec_version == SPEC_VERSION
        and isinstance(manifest_clause_tags, dict)
    ):
        manifest_clause_tags = dict(manifest_clause_tags)
        for tag in CLAUSE_TAGS:
            manifest_clause_tags.setdefault(tag, 0)
    expected_scalars = {
        "clause_tags": encoding.clause_counts,
        "semantic_variable_count": len(encoding.semantic_vars),
        "base_variable_count": encoding.num_vars,
        "base_clause_count": len(encoding.clauses),
        "rule_bank_hash": rule_bank_hash(),
    }
    for field, expected in expected_scalars.items():
        actual = (
            manifest_clause_tags if field == "clause_tags" else manifest.get(field)
        )
        if actual != expected:
            raise Phase3Error(
                f"manifest {field} mismatch: {actual!r} != {expected!r}"
            )
    status = manifest.get("status")
    if status not in ("PARTIAL", "COMPLETE", "UNKNOWN"):
        raise Phase3Error(f"manifest has invalid status {status!r}")
    if manifest.get("result_claim") != _claim_for(status):
        raise Phase3Error("manifest result_claim is inconsistent with status")
    if status == "COMPLETE" and manifest.get("unsat_verified") is not True:
        raise Phase3Error("COMPLETE manifest does not assert verified UNSAT")
    if status != "COMPLETE" and manifest.get("unsat_verified") is not False:
        raise Phase3Error(f"{status} manifest incorrectly asserts verified UNSAT")
    base_path = path / "base.cnf"
    if not base_path.is_file() or base_path.read_bytes() != encoding.cnf_bytes():
        raise Phase3Error("base.cnf is missing or inconsistent with the manifest")
    for name, digest in manifest.get("artifact_hashes", {}).items():
        artifact = path / name
        if not artifact.is_file() or _sha256_file(artifact) != digest:
            raise Phase3Error(f"artifact hash mismatch: {name}")
    if manifest.get("rule_bank_hash") != rule_bank_hash():
        raise Phase3Error("manifest rule_bank_hash is stale")
    bank = CanonicalBank(path / "bank.jsonl", cell)
    records = _read_models(path / "models.jsonl")
    blocks = _verify_prior_records(encoding, records, bank)
    if manifest.get("raw_count") != len(records):
        raise Phase3Error("manifest raw_count mismatch")
    if manifest.get("canonical_count") != len(bank.entries()):
        raise Phase3Error("manifest canonical_count mismatch")
    if manifest.get("status") == "COMPLETE":
        terminal = path / "terminal.cnf"
        expected = encoding.cnf_bytes(blocks)
        if not terminal.is_file() or terminal.read_bytes() != expected:
            raise Phase3Error("terminal.cnf does not equal base plus raw blocks")
        if manifest.get("terminal_variable_count") != encoding.num_vars:
            raise Phase3Error("manifest terminal_variable_count mismatch")
        if manifest.get("terminal_clause_count") != len(encoding.clauses) + len(blocks):
            raise Phase3Error("manifest terminal_clause_count mismatch")
        proof = path / "terminal.drat"
        if not proof.is_file():
            raise Phase3Error("COMPLETE run lacks terminal.drat")
        checked = run_drat_trim(terminal, proof, int(manifest["timeout_s"]))
        if not checked.verified:
            raise Phase3Error("COMPLETE run terminal DRAT no longer verifies")
    return manifest


def enumerate_cell(
    cell: Cell,
    run_dir: str | Path,
    *,
    blocker: bool = False,
    cap: bool | None = None,
    project_blockers: bool = False,
    static_dual2: bool = False,
    mincut_scope: str | None = None,
    timeout_s: int = 30,
    model_limit: int | None = None,
    resume: bool = False,
    overwrite: bool = False,
    solver_runner: SolverRunner = run_cadical,
    checker_runner: CheckerRunner = run_drat_trim,
) -> dict[str, Any]:
    """Enumerate one cell and atomically maintain the Phase-3 artifacts."""

    if timeout_s <= 0:
        raise Phase3Error("timeout_s must be positive")
    if model_limit is not None and model_limit <= 0:
        raise Phase3Error("model_limit must be positive or None")
    encoding = SatEncoding(
        cell,
        blocker=blocker,
        cap=cap,
        project_blockers=project_blockers,
        static_dual2=static_dual2,
        mincut_scope=mincut_scope,
    )
    path = Path(run_dir)
    if path.exists() and any(path.iterdir()) and not (resume or overwrite):
        raise Phase3Error("run directory is nonempty; pass resume=True or overwrite=True")
    if overwrite and path.exists():
        for child in path.iterdir():
            if child.is_dir():
                shutil.rmtree(child)
            else:
                child.unlink()
    path.mkdir(parents=True, exist_ok=True)

    base_bytes = encoding.cnf_bytes()
    base_path = path / "base.cnf"
    models_path = path / "models.jsonl"
    bank_path = path / "bank.jsonl"
    manifest_path = path / "manifest.json"
    if resume:
        prior_manifest = verify_run_artifacts(path)
        if prior_manifest["cell"] != _cell_json(cell):
            raise Phase3Error("resume cell mismatch")
        if prior_manifest["mode"] != encoding.mode:
            raise Phase3Error("resume mode mismatch")
        if prior_manifest["status"] == "COMPLETE":
            return prior_manifest
        if prior_manifest["status"] != "PARTIAL":
            raise Phase3Error("only a verified PARTIAL run may be resumed")
    else:
        _atomic_bytes(base_path, base_bytes)
        _atomic_bytes(models_path, b"")

    bank = CanonicalBank(bank_path, cell)
    records = _read_models(models_path)
    blocks = _verify_prior_records(encoding, records, bank)
    diagnostic: str | None = None
    unsat_verified = False
    terminal_clause_count: int | None = None
    status = "UNKNOWN"

    def publish() -> dict[str, Any]:
        manifest = _manifest(
            encoding,
            path,
            status=status,
            timeout_s=timeout_s,
            model_limit=model_limit,
            raw_count=len(records),
            canonical_count=len(bank.entries()),
            terminal_clause_count=terminal_clause_count,
            unsat_verified=unsat_verified,
            diagnostic=diagnostic,
        )
        _atomic_json(manifest_path, manifest)
        return manifest

    try:
        while True:
            if model_limit is not None and len(records) >= model_limit:
                status = "PARTIAL"
                diagnostic = "model limit reached after valid decoded model(s)"
                return publish()

            solve_path = path / ".solver.cnf"
            proof_tmp = path / ".solver.drat"
            _atomic_bytes(solve_path, encoding.cnf_bytes(blocks))
            with contextlib.suppress(FileNotFoundError):
                proof_tmp.unlink()
            result = solver_runner(solve_path, timeout_s, proof_tmp)
            _atomic_text(
                path / ".solver.log",
                result.stdout + ("\nSTDERR\n" + result.stderr if result.stderr else ""),
            )

            if result.verdict == "SAT":
                with contextlib.suppress(FileNotFoundError):
                    proof_tmp.unlink()
                try:
                    obj = encoding.decode(result.assignment)
                    block = encoding.blocking_clause(result.assignment)
                except Exception as exc:  # noqa: BLE001
                    status = "UNKNOWN"
                    diagnostic = f"model decode/revalidation failed: {exc}"
                    return publish()

                before = set(bank.entries())
                generator = Generator(
                    name="phase3-sat-single-model",
                    coverage="PARTIAL",
                    produce=lambda _cell, item=obj: iter((item,)),
                )
                try:
                    iterator_manifest = iterate_cell(cell, generator, bank)
                except Exception as exc:  # noqa: BLE001
                    status = "UNKNOWN"
                    diagnostic = f"iterate_cell failed: {exc}"
                    return publish()
                digest = _canonical_digest(obj)
                if not bank.has(digest):
                    status = "UNKNOWN"
                    diagnostic = "iterate_cell did not bank the decoded model"
                    return publish()
                raw_key = tuple(result.assignment[v] for v in encoding.semantic_vars)
                for old in records:
                    old_assignment = encoding.assignment_from_record(old)
                    if raw_key == tuple(old_assignment[v] for v in encoding.semantic_vars):
                        status = "UNKNOWN"
                        diagnostic = "solver repeated an already blocked assignment"
                        return publish()
                records.append(
                    {
                        "index": len(records),
                        "semantic_assignment": encoding.semantic_record(result.assignment),
                        "blocking_clause": list(block),
                        "canonical_digest": digest,
                        "canonical_was_new": digest not in before,
                        "iterator": iterator_manifest,
                    }
                )
                blocks.append(block)
                _atomic_bytes(models_path, _jsonl_bytes(records))
                continue

            if result.verdict == "UNSAT":
                terminal_path = path / "terminal.cnf"
                proof_path = path / "terminal.drat"
                _atomic_bytes(terminal_path, solve_path.read_bytes())
                terminal_clause_count = len(encoding.clauses) + len(blocks)
                if not proof_tmp.is_file() or proof_tmp.stat().st_size == 0:
                    status = "UNKNOWN"
                    diagnostic = "solver reported UNSAT but terminal DRAT is missing"
                    return publish()
                os.replace(proof_tmp, proof_path)
                try:
                    checked = checker_runner(terminal_path, proof_path, timeout_s)
                except Exception as exc:  # noqa: BLE001
                    status = "UNKNOWN"
                    diagnostic = f"DRAT checker failed: {exc}"
                    return publish()
                _atomic_text(
                    path / "terminal.drat.check",
                    checked.stdout
                    + ("\nSTDERR\n" + checked.stderr if checked.stderr else ""),
                )
                if not checked.verified:
                    status = "UNKNOWN"
                    diagnostic = "drat-trim did not report exact line 's VERIFIED'"
                    return publish()
                unsat_verified = True
                status = "COMPLETE"
                diagnostic = None
                return publish()

            status = "UNKNOWN"
            diagnostic = (
                f"solver returned UNKNOWN (returncode={result.returncode}); "
                "no blocking clause was added"
            )
            return publish()
    except KeyboardInterrupt:
        status = "PARTIAL" if records else "UNKNOWN"
        diagnostic = "external interruption"
        return publish()
    finally:
        with contextlib.suppress(FileNotFoundError):
            (path / ".solver.drat").unlink()


def _parse_profile(text: str) -> tuple[int, int, int] | None:
    if text.upper() in ("FRAMELESS", "NONE"):
        return None
    values = tuple(int(part) for part in text.split(","))
    if len(values) != 3:
        raise argparse.ArgumentTypeError("profile must be FRAMELESS or h0,h1,h2")
    return values  # Cell validates sorting and sum.


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--k", type=int, required=True)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--profile", type=_parse_profile, default=None)
    parser.add_argument("--blocker", action="store_true")
    parser.add_argument(
        "--project-blockers",
        action="store_true",
        help="existentially project b variables and reconstruct the least B1 witness",
    )
    parser.add_argument(
        "--static-dual2",
        action="store_true",
        help="compile the target-pair codegree-at-most-two clauses",
    )
    parser.add_argument(
        "--mincut-scope",
        choices=MINCUT_SCOPES,
        help="compile all proper-cut ingress clauses under the named theorem scope",
    )
    parser.add_argument("--timeout", type=int, default=30)
    parser.add_argument("--model-limit", type=int)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--overwrite", action="store_true")
    args = parser.parse_args(argv)
    cell = Cell(k=args.k, n=args.n, profile=args.profile, exact=True)
    manifest = enumerate_cell(
        cell,
        args.out,
        blocker=args.blocker,
        project_blockers=args.project_blockers,
        static_dual2=args.static_dual2,
        mincut_scope=args.mincut_scope,
        timeout_s=args.timeout,
        model_limit=args.model_limit,
        resume=args.resume,
        overwrite=args.overwrite,
    )
    print(json.dumps(manifest, indent=2, sort_keys=True))
    return 0 if manifest["status"] in ("PARTIAL", "COMPLETE") else 2


if __name__ == "__main__":
    raise SystemExit(main())
