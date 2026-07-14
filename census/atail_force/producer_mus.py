#!/usr/bin/env python3
"""Bounded MARCO-style enumeration for monotone producer obstructions.

The map layer is purely propositional.  The caller supplies the expensive
semantic oracle and classifies every subset as ``SAT``, ``UNSAT``, or
``UNKNOWN``.  ``UNSAT`` must be monotone under adding atoms.  Unknown answers
stop the run fail-closed and are never converted into blocking clauses.

This module does not turn a solver core into a mathematical proof.  Its job is
to amortize an audited exact-oracle call by banking several minimal patterns
from one witness.  A pattern becomes a CEGAR cut only after a separate bank or
Lean consumer check.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Callable, Generic, Hashable, Iterable, Literal, TypeVar

import z3


Atom = TypeVar("Atom", bound=Hashable)
Verdict = Literal["SAT", "UNSAT", "UNKNOWN"]
Oracle = Callable[[frozenset[Atom]], Verdict]


class MarcoError(ValueError):
    """The requested surface or oracle violates the MARCO contract."""


@dataclass(frozen=True)
class MinimalCore(Generic[Atom]):
    atoms: tuple[Atom, ...]
    discovery_index: int


@dataclass(frozen=True)
class MarcoResult(Generic[Atom]):
    status: str
    minimal_cores: tuple[MinimalCore[Atom], ...]
    oracle_calls: int
    cache_hits: int
    map_iterations: int
    unknown_subset: tuple[Atom, ...] | None


class MarcoEnumerator(Generic[Atom]):
    """Enumerate several MUSes of a finite monotone obstruction surface."""

    def __init__(
        self,
        universe: Iterable[Atom],
        oracle: Oracle[Atom],
        *,
        max_oracle_calls: int = 64,
        max_minimal_cores: int = 8,
        max_map_iterations: int = 256,
    ) -> None:
        atoms = tuple(universe)
        if not atoms:
            raise MarcoError("the atom universe must be nonempty")
        if len(set(atoms)) != len(atoms):
            raise MarcoError("the atom universe contains duplicates")
        if min(max_oracle_calls, max_minimal_cores, max_map_iterations) <= 0:
            raise MarcoError("all MARCO budgets must be positive")
        self.atoms = atoms
        self.oracle = oracle
        self.max_oracle_calls = max_oracle_calls
        self.max_minimal_cores = max_minimal_cores
        self.max_map_iterations = max_map_iterations
        self._variables = tuple(z3.Bool(f"atom_{index}") for index in range(len(atoms)))
        self._index = {atom: index for index, atom in enumerate(atoms)}
        self._map_clauses: list[z3.BoolRef] = []
        self._cache: dict[frozenset[Atom], Verdict] = {}
        self._oracle_calls = 0
        self._cache_hits = 0

    def _classify(self, subset: frozenset[Atom]) -> Verdict | None:
        cached = self._cache.get(subset)
        if cached is not None:
            self._cache_hits += 1
            return cached
        if self._oracle_calls >= self.max_oracle_calls:
            return None
        verdict = self.oracle(subset)
        if verdict not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise MarcoError(f"invalid oracle verdict {verdict!r}")
        self._oracle_calls += 1
        self._cache[subset] = verdict
        return verdict

    def _maximal_unexplored(self) -> frozenset[Atom] | None:
        """Return a deterministic inclusion-maximal unexplored subset."""

        solver = z3.Solver()
        solver.add(*self._map_clauses)
        if solver.check() != z3.sat:
            return None
        selected: list[int] = []
        for index, variable in enumerate(self._variables):
            solver.push()
            solver.add(variable)
            if solver.check() == z3.sat:
                solver.pop()
                solver.add(variable)
                selected.append(index)
            else:
                solver.pop()
                solver.add(z3.Not(variable))
        if solver.check() != z3.sat:
            raise MarcoError("map solver lost a previously satisfiable seed")
        return frozenset(self.atoms[index] for index in selected)

    def _block_supersets(self, core: frozenset[Atom]) -> None:
        if not core:
            self._map_clauses.append(z3.BoolVal(False))
            return
        self._map_clauses.append(
            z3.Or(*(z3.Not(self._variables[self._index[atom]]) for atom in core))
        )

    def _block_subsets(self, mss: frozenset[Atom]) -> None:
        complement = [atom for atom in self.atoms if atom not in mss]
        if not complement:
            self._map_clauses.append(z3.BoolVal(False))
            return
        self._map_clauses.append(
            z3.Or(*(self._variables[self._index[atom]] for atom in complement))
        )

    def _shrink(self, seed: frozenset[Atom]) -> tuple[str, frozenset[Atom]]:
        core = set(seed)
        for atom in self.atoms:
            if atom not in core:
                continue
            candidate = frozenset(core - {atom})
            verdict = self._classify(candidate)
            if verdict is None:
                return "ORACLE_BUDGET", frozenset(core)
            if verdict == "UNKNOWN":
                return "UNKNOWN", candidate
            if verdict == "UNSAT":
                core.remove(atom)
        return "DONE", frozenset(core)

    def _grow(self, seed: frozenset[Atom]) -> tuple[str, frozenset[Atom]]:
        mss = set(seed)
        for atom in self.atoms:
            if atom in mss:
                continue
            candidate = frozenset(mss | {atom})
            verdict = self._classify(candidate)
            if verdict is None:
                return "ORACLE_BUDGET", frozenset(mss)
            if verdict == "UNKNOWN":
                return "UNKNOWN", candidate
            if verdict == "SAT":
                mss.add(atom)
        return "DONE", frozenset(mss)

    def run(self) -> MarcoResult[Atom]:
        cores: list[MinimalCore[Atom]] = []
        unknown: tuple[Atom, ...] | None = None
        status = "MAP_EXHAUSTED"
        iterations = 0

        while iterations < self.max_map_iterations:
            if len(cores) >= self.max_minimal_cores:
                status = "MINIMAL_CORE_BUDGET"
                break
            seed = self._maximal_unexplored()
            if seed is None:
                status = "MAP_EXHAUSTED"
                break
            iterations += 1
            verdict = self._classify(seed)
            if verdict is None:
                status = "ORACLE_BUDGET"
                break
            if verdict == "UNKNOWN":
                status = "UNKNOWN_FAIL_CLOSED"
                unknown = tuple(atom for atom in self.atoms if atom in seed)
                break
            if verdict == "UNSAT":
                shrink_status, core = self._shrink(seed)
                if shrink_status != "DONE":
                    status = (
                        "UNKNOWN_FAIL_CLOSED"
                        if shrink_status == "UNKNOWN"
                        else "ORACLE_BUDGET"
                    )
                    if shrink_status == "UNKNOWN":
                        unknown = tuple(atom for atom in self.atoms if atom in core)
                    break
                ordered = tuple(atom for atom in self.atoms if atom in core)
                cores.append(MinimalCore(ordered, len(cores)))
                self._block_supersets(core)
            else:
                grow_status, mss = self._grow(seed)
                if grow_status != "DONE":
                    status = (
                        "UNKNOWN_FAIL_CLOSED"
                        if grow_status == "UNKNOWN"
                        else "ORACLE_BUDGET"
                    )
                    if grow_status == "UNKNOWN":
                        unknown = tuple(atom for atom in self.atoms if atom in mss)
                    break
                self._block_subsets(mss)
        else:
            status = "MAP_ITERATION_BUDGET"

        return MarcoResult(
            status=status,
            minimal_cores=tuple(cores),
            oracle_calls=self._oracle_calls,
            cache_hits=self._cache_hits,
            map_iterations=iterations,
            unknown_subset=unknown,
        )
