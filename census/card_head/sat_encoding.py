"""Permanent finite SAT encoding for the AHEAD candidate-class surface.

The CNF asks whether a complete candidate cube survives C2, C4, and every
banked raw-class pattern exclusion.  Candidate generation itself lives in
``candidate_surface`` and already enforces C1, full one-hit, and the frozen
post-SUB2 PROVEN cuts.

SAT witnesses are decoded and checked again with ``cube_ok``.  An UNSAT verdict
is coverage only for the exact finite CNF and bank supplied; it is not a
geometric theorem without the separate necessity and certificate-replay chain.
"""

from __future__ import annotations

import argparse
import json
import os
import subprocess
from collections.abc import Callable, Collection, Mapping, Sequence
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Any

from .candidate_surface import (
    CandidateSurfaceError,
    CapHeadModel,
    build_model,
    candidate_classes,
    cube_ok,
)

SAT_SCOPE = (
    "EMPIRICALLY VERIFIED within the exact finite candidate-class CNF; "
    "not a geometric closure theorem"
)

CandidateProvider = Callable[
    [CapHeadModel, int], tuple[tuple[int, int, int, int], ...]
]
CubeValidator = Callable[
    [CapHeadModel, Mapping[int, Collection[int]]], bool
]


class EncodingError(ValueError):
    """Raised when CNF construction, solving, or witness decoding is invalid."""


class CNF:
    """Minimal deterministic CNF builder with Sinz at-most-k counters."""

    def __init__(self) -> None:
        self.n_variables = 0
        self.clauses: list[tuple[int, ...]] = []

    def new_variable(self) -> int:
        self.n_variables += 1
        return self.n_variables

    def add_clause(self, literals: Collection[int]) -> None:
        clause = tuple(literals)
        if any(isinstance(literal, bool) or not isinstance(literal, int) for literal in clause):
            raise EncodingError("CNF literals must be integers")
        if any(literal == 0 or abs(literal) > self.n_variables for literal in clause):
            raise EncodingError("CNF literal is zero or outside the allocated range")
        self.clauses.append(clause)

    def at_most_sinz(self, variables: Sequence[int], bound: int) -> None:
        """Encode ``sum(variables) <= bound`` using the historical Sinz layout."""

        if bound < 0:
            raise EncodingError("Sinz bound must be nonnegative")
        if any(variable <= 0 or variable > self.n_variables for variable in variables):
            raise EncodingError("Sinz input variable is outside the allocated range")
        if bound == 0:
            for variable in variables:
                self.add_clause((-variable,))
            return
        count = len(variables)
        if count <= bound:
            return
        counters = [
            [self.new_variable() for _ in range(bound)] for _ in range(count)
        ]
        self.add_clause((-variables[0], counters[0][0]))
        for index in range(1, count):
            self.add_clause((-variables[index], counters[index][0]))
            self.add_clause((-counters[index - 1][0], counters[index][0]))
            for level in range(1, bound):
                self.add_clause(
                    (
                        -variables[index],
                        -counters[index - 1][level - 1],
                        counters[index][level],
                    )
                )
                self.add_clause(
                    (-counters[index - 1][level], counters[index][level])
                )
            self.add_clause((-variables[index], -counters[index - 1][bound - 1]))


class CoverInstance:
    """One deterministic C1/C2/C4 candidate-cube coverage CNF."""

    def __init__(
        self,
        model: CapHeadModel,
        *,
        candidate_provider: CandidateProvider = candidate_classes,
        cube_validator: CubeValidator = cube_ok,
    ) -> None:
        self.model = model
        self.candidate_provider = candidate_provider
        self.cube_validator = cube_validator
        self.candidates = {
            center: candidate_provider(model, center)
            for center in range(model.cardinality)
        }
        self.cnf = CNF()
        self.choice_variables: dict[tuple[int, int], int] = {}
        for center in range(model.cardinality):
            for index in range(len(self.candidates[center])):
                self.choice_variables[(center, index)] = self.cnf.new_variable()
        self._build_one_hot()
        self.n_c2_clauses = self._build_c2()
        self._build_c4()
        self.base_n_variables = self.cnf.n_variables
        self.base_n_clauses = len(self.cnf.clauses)
        self.pattern_variables: dict[tuple[int, frozenset[int]], int] = {}
        self.exclusion_clauses: list[tuple[int, ...]] = []

    def _build_one_hot(self) -> None:
        for center in range(self.model.cardinality):
            choices = [
                self.choice_variables[(center, index)]
                for index in range(len(self.candidates[center]))
            ]
            self.cnf.add_clause(choices)
            self.cnf.at_most_sinz(choices, 1)

    def _build_c2(self) -> int:
        masks = {
            center: [sum(1 << point for point in candidate) for candidate in rows]
            for center, rows in self.candidates.items()
        }
        n_clauses = 0
        for first, second in combinations(range(self.model.cardinality), 2):
            for first_index, first_mask in enumerate(masks[first]):
                first_variable = self.choice_variables[(first, first_index)]
                for second_index, second_mask in enumerate(masks[second]):
                    if (first_mask & second_mask).bit_count() > 2:
                        self.cnf.add_clause(
                            (
                                -first_variable,
                                -self.choice_variables[(second, second_index)],
                            )
                        )
                        n_clauses += 1
        return n_clauses

    def _build_c4(self) -> None:
        incident = {
            pair: []
            for pair in combinations(range(self.model.cardinality), 2)
        }
        for center, rows in self.candidates.items():
            for index, candidate in enumerate(rows):
                variable = self.choice_variables[(center, index)]
                for pair in combinations(candidate, 2):
                    incident[pair].append(variable)
        for variables in incident.values():
            self.cnf.at_most_sinz(variables, 2)

    def candidate_index(self, center: int, candidate: Collection[int]) -> int:
        normalized = tuple(sorted(candidate))
        try:
            return self.candidates[center].index(normalized)
        except (KeyError, ValueError) as exc:
            raise EncodingError("requested class is absent from the candidate surface") from exc

    def pattern_variable(self, center: int, required: Collection[int]) -> int:
        if not 0 <= center < self.model.cardinality:
            raise EncodingError("pattern center is outside the model")
        normalized = frozenset(required)
        key = (center, normalized)
        if key in self.pattern_variables:
            return self.pattern_variables[key]
        variable = self.cnf.new_variable()
        self.pattern_variables[key] = variable
        for index, candidate in enumerate(self.candidates[center]):
            if normalized <= set(candidate):
                self.cnf.add_clause(
                    (-self.choice_variables[(center, index)], variable)
                )
        return variable

    def add_pattern_instance(
        self, pattern: Mapping[int, Collection[int]]
    ) -> None:
        if not pattern:
            raise EncodingError("an empty pattern would exclude every cube")
        clause = tuple(
            -self.pattern_variable(center, required)
            for center, required in sorted(pattern.items())
        )
        self.exclusion_clauses.append(clause)

    def clauses_with(
        self, extra_clauses: Sequence[Collection[int]] = ()
    ) -> tuple[tuple[int, ...], ...]:
        normalized_extra: list[tuple[int, ...]] = []
        for literals in extra_clauses:
            clause = tuple(literals)
            if any(
                literal == 0 or abs(literal) > self.cnf.n_variables
                for literal in clause
            ):
                raise EncodingError("extra clause has an invalid literal")
            normalized_extra.append(clause)
        return tuple(self.cnf.clauses) + tuple(self.exclusion_clauses) + tuple(
            normalized_extra
        )

    def dimacs(self, extra_clauses: Sequence[Collection[int]] = ()) -> str:
        clauses = self.clauses_with(extra_clauses)
        lines = [f"p cnf {self.cnf.n_variables} {len(clauses)}"]
        lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
        return "\n".join(lines) + "\n"

    def decode_model(self, positive_variables: Collection[int]) -> dict[int, list[int]]:
        positive = set(positive_variables)
        cube: dict[int, list[int]] = {}
        for center in range(self.model.cardinality):
            selected = [
                index
                for index in range(len(self.candidates[center]))
                if self.choice_variables[(center, index)] in positive
            ]
            if len(selected) != 1:
                raise EncodingError(
                    f"SAT model selects {len(selected)} classes at center {center}"
                )
            cube[center] = list(self.candidates[center][selected[0]])
        if not self.cube_validator(self.model, cube):
            raise EncodingError("decoded SAT model fails independent cube_ok")
        return cube


@dataclass(frozen=True)
class CadicalResult:
    verdict: str
    cube: dict[int, list[int]] | None
    returncode: int | None
    proof_verified: bool
    stdout_tail: str
    positive_variables: frozenset[int] | None = None


def solve_cadical(
    instance: CoverInstance,
    cnf_path: Path,
    *,
    extra_clauses: Sequence[Collection[int]] = (),
    timeout_seconds: int = 30,
    nice: int = 10,
    proof_path: Path | None = None,
    cnf_fd: int | None = None,
    proof_fd: int | None = None,
) -> CadicalResult:
    """Solve one persisted CNF and optionally verify its UNSAT DRAT proof.

    When ``cnf_fd`` is supplied, the caller retains custody of every supplied
    descriptor.  CaDiCaL and drat-trim receive only the corresponding
    ``/dev/fd`` paths; this helper neither reopens the artifact pathnames nor
    closes the descriptors.  Omitting the descriptors preserves the legacy
    pathname-based behavior.
    """

    if timeout_seconds <= 0:
        raise EncodingError("timeout_seconds must be positive")
    if not 1 <= nice <= 19:
        raise EncodingError("nice must be between 1 and 19")
    held_mode = cnf_fd is not None
    if held_mode:
        _validate_held_fd("cnf_fd", cnf_fd)
        if proof_path is None:
            if proof_fd is not None:
                raise EncodingError("proof_fd requires proof_path")
        else:
            _validate_held_fd("proof_fd", proof_fd)
            if proof_fd == cnf_fd:
                raise EncodingError("cnf_fd and proof_fd must be distinct")
    elif proof_fd is not None:
        raise EncodingError("proof_fd requires cnf_fd held mode")

    dimacs = instance.dimacs(extra_clauses)
    if held_mode:
        assert cnf_fd is not None
        _replace_fd_bytes(cnf_fd, dimacs.encode("utf-8"))
        if proof_fd is not None:
            _reset_fd(proof_fd)
        cnf_argument = f"/dev/fd/{cnf_fd}"
        inherited_fds = (cnf_fd,) if proof_fd is None else (cnf_fd, proof_fd)
    else:
        cnf_path.parent.mkdir(parents=True, exist_ok=True)
        cnf_path.write_text(dimacs, encoding="utf-8")
        cnf_argument = str(cnf_path)
        inherited_fds = ()
    command = [
        "nice",
        "-n",
        str(nice),
        "cadical",
        "-q",
        "-t",
        str(timeout_seconds),
        cnf_argument,
    ]
    if proof_path is not None:
        command.append(
            f"/dev/fd/{proof_fd}" if held_mode else str(proof_path)
        )
    inherited_kwargs = {"pass_fds": inherited_fds} if held_mode else {}
    try:
        completed = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=timeout_seconds + 30,
            check=False,
            **inherited_kwargs,
        )
    except subprocess.TimeoutExpired:
        return CadicalResult("TIMEOUT", None, None, False, "subprocess timeout")

    output = completed.stdout + "\n" + completed.stderr
    tail = output[-1000:]
    if completed.returncode == 10:
        positive: set[int] = set()
        for line in completed.stdout.splitlines():
            if line.startswith("v "):
                positive.update(
                    int(token)
                    for token in line[2:].split()
                    if int(token) > 0
                )
        return CadicalResult(
            "SAT",
            instance.decode_model(positive),
            completed.returncode,
            False,
            tail,
            frozenset(positive),
        )
    if completed.returncode != 20:
        return CadicalResult("UNKNOWN", None, completed.returncode, False, tail)

    proof_verified = False
    if proof_path is not None:
        if not held_mode and not proof_path.is_file():
            raise EncodingError("CaDiCaL returned UNSAT without the requested proof")
        if held_mode:
            assert cnf_fd is not None and proof_fd is not None
            os.fsync(proof_fd)
            os.lseek(cnf_fd, 0, os.SEEK_SET)
            os.lseek(proof_fd, 0, os.SEEK_SET)
            checker_cnf = f"/dev/fd/{cnf_fd}"
            checker_proof = f"/dev/fd/{proof_fd}"
        else:
            checker_cnf = str(cnf_path)
            checker_proof = str(proof_path)
        try:
            checked = subprocess.run(
                [
                    "nice",
                    "-n",
                    str(nice),
                    "drat-trim",
                    checker_cnf,
                    checker_proof,
                ],
                capture_output=True,
                text=True,
                timeout=timeout_seconds + 30,
                check=False,
                **inherited_kwargs,
            )
        except subprocess.TimeoutExpired as exc:
            raise EncodingError("DRAT verification timed out") from exc
        proof_output = checked.stdout + "\n" + checked.stderr
        proof_verified = checked.returncode == 0 and "s VERIFIED" in proof_output
        if not proof_verified:
            raise EncodingError(f"DRAT verification failed: {proof_output[-1000:]}")
    return CadicalResult("UNSAT", None, completed.returncode, proof_verified, tail)


def _validate_held_fd(name: str, descriptor: int | None) -> None:
    if type(descriptor) is not int or descriptor < 0:
        raise EncodingError(f"{name} must be a nonnegative exact built-in int")
    try:
        os.fstat(descriptor)
    except OSError as exc:
        raise EncodingError(f"{name} is not a valid open descriptor") from exc


def _replace_fd_bytes(descriptor: int, payload: bytes) -> None:
    try:
        os.ftruncate(descriptor, 0)
        os.lseek(descriptor, 0, os.SEEK_SET)
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise OSError("short write to held CNF descriptor")
            view = view[written:]
        os.fsync(descriptor)
        os.lseek(descriptor, 0, os.SEEK_SET)
    except OSError as exc:
        raise EncodingError("cannot write held CNF descriptor") from exc


def _reset_fd(descriptor: int) -> None:
    try:
        os.ftruncate(descriptor, 0)
        os.fsync(descriptor)
        os.lseek(descriptor, 0, os.SEEK_SET)
    except OSError as exc:
        raise EncodingError("cannot reset held proof descriptor") from exc


def _unit(instance: CoverInstance, center: int, candidate: Collection[int]) -> list[int]:
    index = instance.candidate_index(center, candidate)
    return [instance.choice_variables[(center, index)]]


def smoke_card12_654(workdir: Path, timeout_seconds: int = 30) -> dict[str, Any]:
    """Replay the five historical encoding gates under the PROVEN cut tier."""

    model = build_model(12, (6, 5, 4))
    instance = CoverInstance(model)
    empty = solve_cadical(
        instance, workdir / "empty.cnf", timeout_seconds=timeout_seconds
    )
    if empty.verdict != "SAT" or empty.cube is None:
        raise EncodingError(f"empty-bank smoke expected SAT, got {empty.verdict}")

    first_cube = empty.cube
    instance.add_pattern_instance(first_cube)
    changed = solve_cadical(
        instance, workdir / "changed.cnf", timeout_seconds=timeout_seconds
    )
    if changed.verdict != "SAT" or changed.cube == first_cube:
        raise EncodingError("full-cube exclusion did not force a new SAT witness")

    c2_extra = [
        _unit(instance, 3, {0, 1, 7, 8}),
        _unit(instance, 4, {0, 1, 7, 9}),
    ]
    c2 = solve_cadical(
        instance,
        workdir / "forced_c2.cnf",
        extra_clauses=c2_extra,
        timeout_seconds=timeout_seconds,
        proof_path=workdir / "forced_c2.drat",
    )
    if c2.verdict != "UNSAT" or not c2.proof_verified:
        raise EncodingError("forced C2 violation did not yield verified UNSAT")

    c4_extra = [
        _unit(instance, 3, {0, 7, 8, 10}),
        _unit(instance, 5, {1, 7, 8, 11}),
        _unit(instance, 6, {2, 7, 8, 9}),
    ]
    c4 = solve_cadical(
        instance,
        workdir / "forced_c4.cnf",
        extra_clauses=c4_extra,
        timeout_seconds=timeout_seconds,
        proof_path=workdir / "forced_c4.drat",
    )
    if c4.verdict != "UNSAT" or not c4.proof_verified:
        raise EncodingError("forced C4 violation did not yield verified UNSAT")

    submask_instance = CoverInstance(model)
    submask_instance.add_pattern_instance({3: {4, 5}})
    containing = next(
        candidate
        for candidate in submask_instance.candidates[3]
        if {4, 5} <= set(candidate)
    )
    submask_forced = solve_cadical(
        submask_instance,
        workdir / "forced_submask.cnf",
        extra_clauses=[_unit(submask_instance, 3, containing)],
        timeout_seconds=timeout_seconds,
        proof_path=workdir / "forced_submask.drat",
    )
    if submask_forced.verdict != "UNSAT" or not submask_forced.proof_verified:
        raise EncodingError("forced excluded submask did not yield verified UNSAT")
    submask_free = solve_cadical(
        submask_instance,
        workdir / "free_submask.cnf",
        timeout_seconds=timeout_seconds,
    )
    if (
        submask_free.verdict != "SAT"
        or submask_free.cube is None
        or {4, 5} <= set(submask_free.cube[3])
    ):
        raise EncodingError("free submask witness violates the pattern exclusion")

    return {
        "schema": "p97_ahead_sat_encoding_smoke.v1",
        "status": "PASS",
        "cardinality": 12,
        "profile": [6, 5, 4],
        "proof_tier": "PROVEN",
        "base_variables": instance.base_n_variables,
        "base_clauses": instance.base_n_clauses,
        "c2_nand_clauses": instance.n_c2_clauses,
        "gates": {
            "empty_bank_sat_cube_ok": True,
            "full_cube_exclusion_changes_witness": True,
            "forced_c2_unsat_drat_verified": True,
            "forced_c4_unsat_drat_verified": True,
            "submask_exclusion_unsat_drat_and_free_sat_verified": True,
        },
        "scope": SAT_SCOPE,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="action", required=True)
    summary_parser = subparsers.add_parser("summary")
    summary_parser.add_argument("--cardinality", type=int, required=True)
    summary_parser.add_argument("--profile", required=True)
    smoke_parser = subparsers.add_parser("smoke-card12-654")
    smoke_parser.add_argument("--workdir", type=Path)
    smoke_parser.add_argument("--timeout-seconds", type=int, default=30)
    args = parser.parse_args()

    if args.action == "summary":
        try:
            profile = tuple(int(part) for part in args.profile.split(","))
            instance = CoverInstance(build_model(args.cardinality, profile))
        except (CandidateSurfaceError, EncodingError, ValueError) as exc:
            parser.error(str(exc))
        print(
            json.dumps(
                {
                    "cardinality": args.cardinality,
                    "profile": list(profile),
                    "base_variables": instance.base_n_variables,
                    "base_clauses": instance.base_n_clauses,
                    "c2_nand_clauses": instance.n_c2_clauses,
                    "scope": SAT_SCOPE,
                },
                sort_keys=True,
                indent=2,
            )
        )
        return 0

    try:
        if args.workdir is None:
            with TemporaryDirectory(prefix="p97-ahead-sat-smoke-") as temporary:
                result = smoke_card12_654(
                    Path(temporary), timeout_seconds=args.timeout_seconds
                )
        else:
            args.workdir.mkdir(parents=True, exist_ok=True)
            result = smoke_card12_654(
                args.workdir, timeout_seconds=args.timeout_seconds
            )
    except (EncodingError, OSError) as exc:
        parser.error(str(exc))
    print(json.dumps(result, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
