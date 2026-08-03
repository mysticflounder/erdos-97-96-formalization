"""P7 persistent CaDiCaL discovery adapter for the Phase-3 CEGAR driver.

The adapter is deliberately narrower than a terminal proof backend.  It keeps
one incremental IPASIR solver alive while the authenticated discovery CNF grows
by appending learned clauses.  Any call that requests a proof is delegated to
the supplied fresh subprocess backend.  A new adapter instance always rebuilds
from the complete CNF it receives; no opaque solver snapshot is part of the
resume contract.
"""

from __future__ import annotations

import ctypes
import hashlib
import importlib
import os
import sys
import time
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Protocol, Self

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
for directory in (ROOT, HERE):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

sat = importlib.import_module("sat_generate")


SCHEMA = "p97-phase3-persistent-cadical-discovery-v1"
IPASIR_SAT = 10
IPASIR_UNSAT = 20


class IncrementalCadicalError(RuntimeError):
    """The persistent discovery contract cannot be satisfied."""


@dataclass(frozen=True)
class IncrementalSolveResult:
    """Solver result returned by an incremental backend."""

    verdict: str
    assignment: Mapping[int, bool] = field(default_factory=dict)
    returncode: int = 0
    stdout: str = ""
    stderr: str = ""


class IncrementalSolver(Protocol):
    def add_clause(self, clause: Sequence[int]) -> None: ...

    def solve(self, timeout_s: int) -> IncrementalSolveResult: ...

    def close(self) -> None: ...


IncrementalSolverFactory = Callable[[int], IncrementalSolver]
ProofSolver = Callable[[Path, int, Path | None], Any]


def _canonical_clause_digest(
    variable_count: int, clauses: Sequence[Sequence[int]]
) -> str:
    digest = hashlib.sha256()
    digest.update(f"p cnf {variable_count} {len(clauses)}\n".encode())
    for clause in clauses:
        digest.update((" ".join(str(lit) for lit in clause) + " 0\n").encode())
    return digest.hexdigest()


def parse_dimacs(data: bytes) -> tuple[int, tuple[tuple[int, ...], ...]]:
    """Parse strict DIMACS and return its ordered clause stream.

    Comments are ignored, but the header and clause count are checked exactly.
    This parser intentionally accepts an empty clause, which is the canonical
    DIMACS representation of an immediately inconsistent formula.
    """

    try:
        text = data.decode("ascii")
    except UnicodeDecodeError as exc:
        raise IncrementalCadicalError("CNF is not ASCII DIMACS") from exc
    variable_count: int | None = None
    declared_clause_count: int | None = None
    clauses: list[tuple[int, ...]] = []
    pending: list[int] = []
    for line_number, raw_line in enumerate(text.splitlines(), start=1):
        line = raw_line.strip()
        if not line or line.startswith("c"):
            continue
        tokens = line.split()
        if tokens[0] == "p":
            if variable_count is not None or len(tokens) != 4 or tokens[1] != "cnf":
                raise IncrementalCadicalError(
                    f"invalid DIMACS header at line {line_number}"
                )
            try:
                variable_count = int(tokens[2])
                declared_clause_count = int(tokens[3])
            except ValueError as exc:
                raise IncrementalCadicalError(
                    f"non-integer DIMACS header at line {line_number}"
                ) from exc
            if variable_count < 0 or declared_clause_count < 0:
                raise IncrementalCadicalError("DIMACS header counts must be nonnegative")
            if pending:
                raise IncrementalCadicalError("clause appeared before DIMACS header")
            continue
        if variable_count is None:
            raise IncrementalCadicalError("DIMACS clause appeared before header")
        try:
            line_literals = [int(token) for token in tokens]
        except ValueError as exc:
            raise IncrementalCadicalError(
                f"non-integer DIMACS literal at line {line_number}"
            ) from exc
        for literal in line_literals:
            if literal == 0:
                clause = tuple(pending)
                clauses.append(clause)
                pending.clear()
                continue
            if abs(literal) > variable_count:
                raise IncrementalCadicalError(
                    f"literal {literal} exceeds DIMACS variable count"
                )
            pending.append(literal)
    if variable_count is None or declared_clause_count is None:
        raise IncrementalCadicalError("DIMACS is missing its p cnf header")
    if pending:
        raise IncrementalCadicalError("DIMACS has an unterminated clause")
    if len(clauses) != declared_clause_count:
        raise IncrementalCadicalError(
            "DIMACS clause count mismatch: "
            f"header={declared_clause_count}, parsed={len(clauses)}"
        )
    return variable_count, tuple(clauses)


def _factory_descriptor(factory: Any) -> dict[str, Any]:
    descriptor = getattr(factory, "descriptor", None)
    if callable(descriptor):
        value = descriptor()
        if not isinstance(value, Mapping):
            raise IncrementalCadicalError("factory descriptor must be an object")
        return {str(key): value[key] for key in value}
    return {"factory_type": f"{type(factory).__module__}.{type(factory).__qualname__}"}


@dataclass
class PersistentDiscoveryRunner:
    """Callable v3 solver backend with append-only incremental discovery."""

    factory: IncrementalSolverFactory
    proof_solver: ProofSolver = sat.run_cadical
    _solver: IncrementalSolver | None = field(default=None, init=False, repr=False)
    _variable_count: int | None = field(default=None, init=False, repr=False)
    _clauses: tuple[tuple[int, ...], ...] | None = field(
        default=None, init=False, repr=False
    )
    _closed: bool = field(default=False, init=False, repr=False)
    solve_count: int = field(default=0, init=False)
    rebuild_count: int = field(default=0, init=False)

    def __call__(
        self,
        cnf_path: Path,
        timeout_s: int,
        proof_path: Path | None,
    ) -> Any:
        if proof_path is not None:
            # This is the trusted terminal boundary.  It never touches the
            # incremental object and therefore always starts a fresh solver.
            return self.proof_solver(cnf_path, timeout_s, proof_path)
        if self._closed:
            raise IncrementalCadicalError("persistent discovery runner is closed")
        if timeout_s <= 0:
            raise IncrementalCadicalError("incremental timeout must be positive")
        variable_count, clauses = parse_dimacs(cnf_path.read_bytes())
        if self._clauses is None:
            self._variable_count = variable_count
            self._solver = self.factory(variable_count)
            for clause in clauses:
                self._solver.add_clause(clause)
            self._clauses = clauses
            self.rebuild_count += 1
        else:
            if variable_count != self._variable_count:
                raise IncrementalCadicalError(
                    "incremental CNF variable count changed across discovery"
                )
            previous = self._clauses
            if clauses[: len(previous)] != previous:
                raise IncrementalCadicalError(
                    "incremental CNF is not an append-only extension"
                )
            assert self._solver is not None
            for clause in clauses[len(previous) :]:
                self._solver.add_clause(clause)
            self._clauses = clauses
        assert self._solver is not None
        raw = self._solver.solve(timeout_s)
        self.solve_count += 1
        result = IncrementalSolveResult(
            verdict=str(raw.verdict),
            assignment=dict(raw.assignment),
            returncode=int(raw.returncode),
            stdout=str(raw.stdout),
            stderr=str(raw.stderr),
        )
        return sat.SolverResult(
            result.verdict,
            result.assignment,
            result.returncode,
            result.stdout,
            result.stderr,
        )

    def manifest_metadata(self) -> dict[str, Any]:
        clauses = self._clauses or ()
        variable_count = self._variable_count or 0
        return {
            "schema": SCHEMA,
            "enabled": True,
            "backend": _factory_descriptor(self.factory),
            "solve_count": self.solve_count,
            "rebuild_count": self.rebuild_count,
            "solve_stats": {
                "discovery_solves": self.solve_count,
                "formula_rebuilds": self.rebuild_count,
            },
            "clause_frontier": len(clauses),
            "clause_frontier_sha256": _canonical_clause_digest(
                variable_count, clauses
            ),
            "resume_policy": "rebuild from authenticated CNF/journals",
            "terminal_policy": "fresh proof-producing solver plus DRAT checker",
        }

    def close(self) -> None:
        if self._closed:
            return
        self._closed = True
        if self._solver is not None:
            self._solver.close()
            self._solver = None

    def __enter__(self) -> Self:
        return self

    def __exit__(self, *_: object) -> None:
        self.close()

    def __del__(self) -> None:
        # Native IPASIR handles must not survive a short-lived driver object.
        try:
            self.close()
        except Exception:  # pragma: no cover - interpreter shutdown  # noqa: BLE001, S110
            pass


TerminateCallback = ctypes.CFUNCTYPE(ctypes.c_int, ctypes.c_void_p)


class IpasirCadicalSolver:
    """Small ctypes wrapper around CaDiCaL's exported IPASIR C API."""

    def __init__(self, library: ctypes.CDLL, variable_count: int) -> None:
        self._library = library
        self._variable_count = variable_count
        self._handle = library.ipasir_init()
        if not self._handle:
            raise IncrementalCadicalError("ipasir_init returned a null solver")
        self._closed = False
        self._terminate_callback: Any = None

    def add_clause(self, clause: Sequence[int]) -> None:
        if self._closed:
            raise IncrementalCadicalError("IPASIR solver is closed")
        for literal in clause:
            if type(literal) is not int or literal == 0:
                raise IncrementalCadicalError("IPASIR clauses contain invalid literals")
            if abs(literal) > self._variable_count:
                raise IncrementalCadicalError("IPASIR literal exceeds variable count")
            self._library.ipasir_add(self._handle, literal)
        self._library.ipasir_add(self._handle, 0)

    def solve(self, timeout_s: int) -> IncrementalSolveResult:
        if self._closed:
            raise IncrementalCadicalError("IPASIR solver is closed")
        if timeout_s <= 0:
            raise IncrementalCadicalError("IPASIR timeout must be positive")
        deadline = time.monotonic() + timeout_s

        @TerminateCallback
        def terminate(_: ctypes.c_void_p) -> int:
            return int(time.monotonic() >= deadline)

        self._terminate_callback = terminate
        self._library.ipasir_set_terminate(
            self._handle, None, ctypes.cast(terminate, ctypes.c_void_p)
        )
        try:
            code = int(self._library.ipasir_solve(self._handle))
        finally:
            self._library.ipasir_set_terminate(self._handle, None, None)
            self._terminate_callback = None
        if code == IPASIR_SAT:
            assignment: dict[int, bool] = {}
            for variable in range(1, self._variable_count + 1):
                value = int(self._library.ipasir_val(self._handle, variable))
                # IPASIR returns zero for a don't-care variable.  Completing
                # such variables deterministically keeps the existing v3
                # model decoder's total-assignment contract.
                assignment[variable] = value > 0
            return IncrementalSolveResult("SAT", assignment, code)
        if code == IPASIR_UNSAT:
            return IncrementalSolveResult("UNSAT", {}, code)
        return IncrementalSolveResult("UNKNOWN", {}, code)

    def close(self) -> None:
        if not self._closed:
            self._library.ipasir_release(self._handle)
            self._closed = True


@dataclass
class IpasirCadicalFactory:
    """Factory for the optional native CaDiCaL IPASIR library."""

    library_path: Path
    _library: ctypes.CDLL = field(init=False, repr=False)
    _signature: str = field(init=False)
    _library_sha256: str = field(init=False)

    def __post_init__(self) -> None:
        if not self.library_path.is_file():
            raise IncrementalCadicalError(
                f"IPASIR CaDiCaL library does not exist: {self.library_path}"
            )
        try:
            self._library_sha256 = hashlib.sha256(
                self.library_path.read_bytes()
            ).hexdigest()
        except OSError as exc:
            raise IncrementalCadicalError(
                f"could not hash IPASIR CaDiCaL library: {exc}"
            ) from exc
        try:
            library = ctypes.CDLL(str(self.library_path))
        except OSError as exc:
            raise IncrementalCadicalError(
                f"could not load IPASIR CaDiCaL library: {exc}"
            ) from exc
        self._library = library
        self._configure_api()
        raw_signature = self._library.ipasir_signature()
        self._signature = (
            raw_signature.decode("utf-8", errors="replace")
            if raw_signature
            else "unknown"
        )

    def _configure_api(self) -> None:
        library = self._library
        library.ipasir_signature.argtypes = []
        library.ipasir_signature.restype = ctypes.c_char_p
        library.ipasir_init.argtypes = []
        library.ipasir_init.restype = ctypes.c_void_p
        library.ipasir_release.argtypes = [ctypes.c_void_p]
        library.ipasir_release.restype = None
        library.ipasir_add.argtypes = [ctypes.c_void_p, ctypes.c_int]
        library.ipasir_add.restype = None
        library.ipasir_solve.argtypes = [ctypes.c_void_p]
        library.ipasir_solve.restype = ctypes.c_int
        library.ipasir_val.argtypes = [ctypes.c_void_p, ctypes.c_int]
        library.ipasir_val.restype = ctypes.c_int
        library.ipasir_set_terminate.argtypes = [
            ctypes.c_void_p,
            ctypes.c_void_p,
            ctypes.c_void_p,
        ]
        library.ipasir_set_terminate.restype = None

    def __call__(self, variable_count: int) -> IpasirCadicalSolver:
        if type(variable_count) is not int or variable_count < 0:
            raise IncrementalCadicalError("invalid IPASIR variable count")
        return IpasirCadicalSolver(self._library, variable_count)

    def descriptor(self) -> dict[str, Any]:
        return {
            "api": "IPASIR",
            "signature": self._signature,
            "library": str(self.library_path.resolve()),
            "library_sha256": self._library_sha256,
            "options": [],
        }

    @classmethod
    def from_environment(cls) -> IpasirCadicalFactory:
        raw_path = os.environ.get("P97_CADICAL_IPASIR_LIB")
        if not raw_path:
            raise IncrementalCadicalError(
                "persistent discovery requires P97_CADICAL_IPASIR_LIB; "
                "the standalone cadical binary is not an incremental API"
            )
        return cls(Path(raw_path))
