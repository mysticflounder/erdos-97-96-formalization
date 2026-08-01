"""Phase-2 cell iterator + persistent canonical bank for the P97
counterexample search lane.

Implements ``census/p97_search/PHASE2-SPEC.md`` section 5: ``rule_bank_hash``,
``CanonicalBank`` (jsonl, atomic writes, STALE demotion + revalidation
discipline), ``iterate_cell`` (admission checks, canonical dedup,
per-domain ADMITTED pruning, manifest), and the Phase-2 generator list
(``explicit_seeds``, ``tiny_exhaustive``, ``mutation_probe`` -- NO SAT
enumeration in Phase 2).

Dedup key (implementation choice, not separately spec-named): the bank's
``digest`` field is ``sha256(repr(canonical_form))``, NOT the raw node
digest -- this is required for pi-relabeled duplicates of one node to
collapse to a single bank entry (G-ITER-DEDUP), since two isomorphic but
differently-labeled nodes have distinct raw ``node.digest()`` values but
an identical canonical form.
"""

from __future__ import annotations

import contextlib
import hashlib
import json
import os
import tempfile
from dataclasses import dataclass
from itertools import combinations, product
from pathlib import Path
from typing import Any, Callable, Iterable, Iterator

from annotations import AnnotatedNode
from canonical import canonical, canonical_annotated
from cells import Cell
from node import Node, NodeInvariantError
from rules import ALL_RULES, R_CAPGE4, apply_rule, prune_annotated_node, prune_node

__all__ = [
    "rule_bank_hash",
    "BankStaleError",
    "CanonicalBank",
    "Generator",
    "explicit_seeds",
    "tiny_exhaustive",
    "mutation_probe",
    "GENERATORS",
    "iterate_cell",
]


# ---------------------------------------------------------------------------
# rule_bank_hash (spec section 5).
# ---------------------------------------------------------------------------


def rule_bank_hash() -> str:
    """sha256 over the sorted ``(id, status, hypotheses, domain,
    citation)`` tuples of ALL rules (``rules.ALL_RULES``)."""

    tuples = sorted(
        (rule.id, rule.status, tuple(rule.hypotheses), rule.domain, rule.citation)
        for rule in ALL_RULES
    )
    payload = repr(tuples).encode("utf-8")
    return hashlib.sha256(payload).hexdigest()


# ---------------------------------------------------------------------------
# CanonicalBank (spec section 5).
# ---------------------------------------------------------------------------


class BankStaleError(RuntimeError):
    """Raised on ``CanonicalBank(path, cell)`` construction when the
    on-disk header's ``rule_bank_hash`` no longer matches the current
    rule bank AND at least one PRUNED entry was demoted to STALE as a
    result.  The bank refuses use until a revalidation pass re-runs
    ``iterate_cell`` over it -- obtain the demoted bank via
    ``CanonicalBank.open_for_revalidation`` to run that pass."""


def _cell_descriptor(cell: Cell) -> dict[str, Any]:
    return {
        "k": cell.k,
        "n": cell.n,
        "profile": list(cell.profile) if cell.profile is not None else None,
        "exact": cell.exact,
    }


def _jsonify(value: Any) -> Any:
    """Recursively convert tuples/frozensets to JSON-representable lists
    (json.dumps already handles tuples as lists, but frozensets need
    explicit conversion; sorted for determinism)."""

    if isinstance(value, (tuple, list)):
        return [_jsonify(v) for v in value]
    if isinstance(value, frozenset):
        return sorted(_jsonify(v) for v in value)
    return value


class CanonicalBank:
    """One jsonl file per cell (spec section 5).

    First line: header ``{"rule_bank_hash": ..., "spec_version":
    "phase2-v1.0", "cell": ...}``.  Entries:
    ``{"digest": ..., "status": "OPEN" | "PRUNED" | "STALE", "fired":
    [...], "hypotheses": [...], "canonical": ...}`` (statuses
    REALIZED/INFEASIBLE reserved for the realization arm, unused in
    Phase 2).  Writes are atomic (temp file + ``os.replace``).

    On load with a mismatched ``rule_bank_hash``, every PRUNED entry is
    demoted to STALE; normal construction then raises ``BankStaleError``
    (refuses use) unless the caller went through
    ``open_for_revalidation``, the explicit opt-in for the revalidation
    pass (census-554 banking discipline).
    """

    SPEC_VERSION = "phase2-v1.0"

    def __init__(self, path: str | Path, cell: Cell, *, _allow_stale: bool = False) -> None:
        self.path = Path(path)
        self.cell = cell
        self._entries: dict[str, dict[str, Any]] = {}
        self._stale_digests: set[str] = set()
        self.header: dict[str, Any]
        if self.path.exists() and self.path.stat().st_size > 0:
            self._load(_allow_stale=_allow_stale)
        else:
            self.header = {
                "rule_bank_hash": rule_bank_hash(),
                "spec_version": self.SPEC_VERSION,
                "cell": _cell_descriptor(cell),
            }
            self._flush()

    @classmethod
    def open_for_revalidation(cls, path: str | Path, cell: Cell) -> "CanonicalBank":
        """Explicit opt-in to open a bank that may demote PRUNED entries
        to STALE on load (spec section 5 / gate G-BANK-REVAL).  Normal
        construction refuses use in that situation; this is the entry
        point for the revalidation pass itself."""

        return cls(path, cell, _allow_stale=True)

    def _load(self, *, _allow_stale: bool) -> None:
        lines = self.path.read_text().splitlines()
        if not lines:
            raise ValueError(f"CanonicalBank {self.path}: empty file, missing header")
        header = json.loads(lines[0])
        entries: dict[str, dict[str, Any]] = {}
        for line in lines[1:]:
            if not line.strip():
                continue
            entry = json.loads(line)
            entries[entry["digest"]] = entry

        current_hash = rule_bank_hash()
        stale_digests: set[str] = set()
        if header.get("rule_bank_hash") != current_hash:
            for digest, entry in entries.items():
                if entry.get("status") == "PRUNED":
                    entry["status"] = "STALE"
                    stale_digests.add(digest)
            if stale_digests and not _allow_stale:
                raise BankStaleError(
                    f"CanonicalBank {self.path}: rule_bank_hash mismatch "
                    f"(stored={header.get('rule_bank_hash')!r}, "
                    f"current={current_hash!r}); {len(stale_digests)} PRUNED "
                    "entries demoted to STALE. Refuses use until a "
                    "revalidation pass re-runs iterate_cell over this bank "
                    "(CanonicalBank.open_for_revalidation)."
                )
            header["rule_bank_hash"] = current_hash

        self.header = header
        self._entries = entries
        self._stale_digests = stale_digests
        if stale_digests:
            self._flush()

    def has(self, digest: str) -> bool:
        """True iff ``digest`` is banked with a non-STALE status (a
        STALE entry is treated as a dedup miss, forcing reprocessing --
        that is the revalidation pass)."""

        entry = self._entries.get(digest)
        return entry is not None and entry.get("status") != "STALE"

    def get(self, digest: str) -> dict[str, Any] | None:
        return self._entries.get(digest)

    def put(
        self,
        digest: str,
        *,
        status: str,
        fired: Iterable[str],
        hypotheses: Iterable[str],
        canonical: Any,
    ) -> None:
        self._entries[digest] = {
            "digest": digest,
            "status": status,
            "fired": list(fired),
            "hypotheses": sorted(set(hypotheses)),
            "canonical": _jsonify(canonical),
        }
        self._stale_digests.discard(digest)
        self._flush()

    @property
    def stale_count(self) -> int:
        return len(self._stale_digests)

    def entries(self) -> dict[str, dict[str, Any]]:
        return dict(self._entries)

    def _flush(self) -> None:
        self.path.parent.mkdir(parents=True, exist_ok=True)
        fd, tmp_name = tempfile.mkstemp(
            dir=str(self.path.parent), prefix=".bank-", suffix=".tmp"
        )
        try:
            with os.fdopen(fd, "w") as fh:
                fh.write(json.dumps(self.header) + "\n")
                for digest in sorted(self._entries):
                    fh.write(json.dumps(self._entries[digest]) + "\n")
            os.replace(tmp_name, self.path)
        except BaseException:
            with contextlib.suppress(OSError):
                os.remove(tmp_name)
            raise


# ---------------------------------------------------------------------------
# Generators (spec section 5): explicit_seeds, tiny_exhaustive,
# mutation_probe.  NO SAT enumeration in Phase 2.
# ---------------------------------------------------------------------------


@dataclass(frozen=True)
class Generator:
    name: str
    coverage: str  # "PARTIAL" | "EXHAUSTIVE"
    produce: Callable[[Cell], Iterable[Any]]

    def __post_init__(self) -> None:
        if self.coverage not in ("PARTIAL", "EXHAUSTIVE"):
            raise ValueError(f"generator {self.name!r} has unknown coverage {self.coverage!r}")


def _explicit_seeds_produce(cell: Cell) -> Iterator[Node]:
    """Yield every ``seeds.py`` seed node matching ``cell``'s (k, n)
    (spec section 6).  Local import: keeps a bare ``import iterate`` from
    requiring sympy unless a seed cell is actually run."""

    import seeds as _seeds_mod

    for seed in _seeds_mod.SEEDS:
        if seed.node.k == cell.k and seed.node.n == cell.n:
            yield seed.node


explicit_seeds = Generator(name="explicit_seeds", coverage="PARTIAL", produce=_explicit_seeds_produce)


def _subsets_at_least(pool: tuple[int, ...], min_size: int) -> list[tuple[int, ...]]:
    out: list[tuple[int, ...]] = []
    for size in range(min_size, len(pool) + 1):
        out.extend(combinations(pool, size))
    return out


def _tiny_exhaustive_produce(cell: Cell) -> Iterator[Node]:
    """Full enumeration of every valid Node at ``(cell.n, cell.k)``.
    Gate scale only (spec section 5): ``n <= 5``, ``k = 2``, FRAMELESS."""

    if cell.profile is not None:
        raise ValueError("tiny_exhaustive is gate-scale only: FRAMELESS cells")
    if cell.n > 5 or cell.k != 2:
        raise ValueError(
            f"tiny_exhaustive is gate-scale only: n <= 5, k = 2; got "
            f"n={cell.n}, k={cell.k}"
        )
    n, k = cell.n, cell.k
    pools = [tuple(q for q in range(n) if q != p) for p in range(n)]
    per_point_choices = [_subsets_at_least(pool, k) for pool in pools]
    for combo in product(*per_point_choices):
        shells = tuple(frozenset(c) for c in combo)
        yield Node(n=n, k=k, shells=shells)


tiny_exhaustive = Generator(name="tiny_exhaustive", coverage="EXHAUSTIVE", produce=_tiny_exhaustive_produce)


def _mutation_probe_candidates() -> tuple[int, int, list[dict[int, Any]]]:
    """1 planted valid n=9, k=2 node (9-cycle neighbors) + 50 mutants (9
    D1-violating, 9 D2-violating, 32 R-CIRC2-violating) -- reproduces
    PHASE1-SPEC.md section 5's G-SEEDED scaffold, for the G-SEEDED-2
    full-``iterate_cell``-path harness (spec section 5)."""

    n, k = 9, 2
    planted_S: dict[int, Any] = {p: {(p - 1) % n, (p + 1) % n} for p in range(n)}
    candidates: list[dict[int, Any]] = [dict(planted_S)]

    for p in range(n):
        mutant = dict(planted_S)
        mutant[p] = set(planted_S[p]) | {p}
        candidates.append(mutant)

    for p in range(n):
        mutant = dict(planted_S)
        mutant[p] = set()
        candidates.append(mutant)

    circ2_count = 0
    for p in range(n):
        if circ2_count >= 32:
            break
        for q in range(n):
            if q == p:
                continue
            if circ2_count >= 32:
                break
            pool = sorted(set(range(n)) - {p, q})
            shared = frozenset(pool[:3])
            mutant = dict(planted_S)
            mutant[p] = shared
            mutant[q] = shared
            candidates.append(mutant)
            circ2_count += 1

    assert len(candidates) == 51, f"expected 1 planted + 50 mutants, got {len(candidates)}"
    return n, k, candidates


def _mutation_probe_produce(cell: Cell) -> Iterator[Node]:
    n, k, candidates = _mutation_probe_candidates()
    if cell.n != n or cell.k != k:
        return
    for raw_S in candidates:
        try:
            yield Node.from_mapping(n=n, k=k, S=raw_S)
        except NodeInvariantError:
            continue  # (D1)/(D2) rejection at construction, not pruning


mutation_probe = Generator(name="mutation_probe", coverage="PARTIAL", produce=_mutation_probe_produce)

GENERATORS: tuple[Generator, ...] = (explicit_seeds, tiny_exhaustive, mutation_probe)


# ---------------------------------------------------------------------------
# iterate_cell (spec section 5).
# ---------------------------------------------------------------------------


def _classify_object(obj: Any) -> tuple[str, Node]:
    """Determine ``(mode, underlying_node)`` for one produced object.
    mode in {"bare", "cap-annotated", "blocker-annotated",
    "cap+blocker-annotated"}."""

    if isinstance(obj, Node):
        return "bare", obj
    if isinstance(obj, AnnotatedNode):
        if obj.blocker is not None and obj.caps is None:
            return "blocker-annotated", obj.node
        if obj.caps is not None and obj.blocker is None:
            return "cap-annotated", obj.node
        if obj.blocker is None and obj.caps is None:
            return "bare", obj.node
        return "cap+blocker-annotated", obj.node
    raise TypeError(f"iterate_cell: unsupported produced object type {type(obj)!r}")


def iterate_cell(cell: Cell, generator: Generator, bank: CanonicalBank) -> dict[str, Any]:
    """Run every object ``generator.produce(cell)`` yields through
    admission, canonical dedup, and per-domain ADMITTED pruning, banking
    each admitted non-duplicate and returning the run manifest (spec
    section 5).

    R-FIBER4's defensive predicate firing is NOT caught here -- per spec
    section 4.1, if it ever returns True that is a bug in the annotation
    code, and this function (the "iterator") must raise, not prune; the
    ``FiberDefensivePredicateFired`` exception from ``prune_annotated_node``
    propagates uncaught.
    """

    if bank.cell != cell:
        raise ValueError("iterate_cell: bank was opened for a different cell")

    counts = {
        "produced": 0,
        "admitted": 0,
        "rejected_admission": 0,
        "duplicate": 0,
        "open": 0,
        "pruned": 0,
    }
    mode: str | None = None
    used_blocker_mode = False
    fired_hypotheses: set[str] = set()

    for obj in generator.produce(cell):
        counts["produced"] += 1
        obj_mode, node = _classify_object(obj)

        # Mode consistency is a generator-level contract, so check every
        # produced object, including objects later rejected by admission.
        # Otherwise a rejected object in one mode could be silently followed
        # by an admitted object in another mode.
        if mode is None:
            mode = obj_mode
        elif mode != obj_mode:
            raise ValueError(
                f"iterate_cell: generator {generator.name!r} produced mixed "
                f"object modes ({mode!r} then {obj_mode!r}) within one cell run"
            )

        # --- admission checks (spec section 5) ---
        if node.n != cell.n or node.k != cell.k:
            counts["rejected_admission"] += 1
            continue
        if cell.exact and any(len(node.shell(p)) != cell.k for p in range(node.n)):
            counts["rejected_admission"] += 1
            continue
        has_caps = isinstance(obj, AnnotatedNode) and obj.caps is not None
        has_blocker = isinstance(obj, AnnotatedNode) and obj.blocker is not None
        if cell.profile is not None:
            if not has_caps or obj.caps.closed_profile() != cell.profile:
                counts["rejected_admission"] += 1
                continue
        elif has_caps:
            # a profileless (FRAMELESS) cell does not admit cap-annotated
            # objects -- those belong to a profiled cell matching their
            # own closed_profile().
            counts["rejected_admission"] += 1
            continue

        if has_blocker:
            used_blocker_mode = True

        counts["admitted"] += 1

        # --- canonical form (spec section 3) ---
        canon = canonical(node) if obj_mode == "bare" else canonical_annotated(obj)
        digest = hashlib.sha256(repr(canon).encode("utf-8")).hexdigest()

        # --- dedup against the bank ---
        if bank.has(digest):
            counts["duplicate"] += 1
            continue

        # --- ADMITTED rules for the object's domain ---
        fired: list[str] = []
        hyps: set[str] = set()

        node_result = prune_node(node)
        fired.extend(node_result.fired)
        hyps.update(node_result.hypotheses)

        if has_blocker:
            ann_result = prune_annotated_node(obj)  # raises on defensive fire
            fired.extend(ann_result.fired)
            hyps.update(ann_result.hypotheses)

        if cell.profile is not None:
            if apply_rule(R_CAPGE4, cell):
                fired.append(R_CAPGE4.id)
                hyps.update(R_CAPGE4.hypotheses)

        status = "PRUNED" if fired else "OPEN"
        counts["pruned" if fired else "open"] += 1
        fired_hypotheses.update(hyps)

        bank.put(digest, status=status, fired=fired, hypotheses=sorted(hyps), canonical=canon)

    published = set(cell.frame_hypotheses) | fired_hypotheses
    if used_blocker_mode:
        published.add("blocker-annotated")

    return {
        "cell": _cell_descriptor(cell),
        "frame_hypotheses": sorted(cell.frame_hypotheses),
        "mode": mode,
        "exact": cell.exact,
        "coverage": generator.coverage,
        "rule_bank_hash": rule_bank_hash(),
        "published_hypotheses": sorted(published),
        "counts": counts,
    }
