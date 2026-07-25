#!/usr/bin/env python3
"""Complete enumeration of minimal support-local-UNSAT schemas at small support.

An *equality schema* here is a set of positive atoms `("+", center, left,
right)` read as `d(center,left) = d(center,right)` over k points labelled
`0..k-1` in cyclic convex order.  A schema is **support-local UNSAT** iff
it is infeasible against positivity + strict triangle + both strict
Kalmanson inequalities on those k points alone, i.e. iff
`schema_mine.decide_schema(k, atoms) == "unsat"`.  It is **minimal** iff
deleting any single atom leaves a satisfiable set.

Axioms are NOT reimplemented here: the whole constraint block is taken
verbatim from `schema_mine.schema_smt(k, ())` and the per-atom assertion
lines are built with `schema_mine.dvar`; a start-up gate asserts that the
concatenation reproduces `schema_mine.schema_smt(k, atoms)` character for
character.  Only the z3 *invocation* is batched (one process runs many
`(push)…(check-sat)…(pop)` blocks over a shared axiom prefix), and every
recorded schema is additionally re-decided through the unbatched
`schema_mine.decide_schema` path.

SUPPORT CONVENTION.  For a run at k, only schemas whose support is
*exactly* `{0,…,k-1}` (every label occurs in some atom, via
`schema_mine.support`) are recorded as k-schemas.  A candidate whose atoms
miss some label is a schema of a smaller support and belongs to that
smaller k; it is still enumerated (it is needed as a search node and as a
non-minimality witness) and reported separately under
`sub_support_minimal`, where it must reappear — after re-ranking — in the
complete family of its own support.  That cross-run agreement is checked
and reported.

SEARCH.  For fixed k the atom universe is all `k*C(k-1,2)` atoms (k=4: 12,
k=5: 30, k=6: 60).  Candidates are enumerated by increasing size m: the
level-m candidates are the one-atom extensions of the level-(m-1)
*satisfiable* representatives, deduplicated by the canonical form under
the dihedral group of the k-cycle (order 2k) acting on the k labels — the
same group `schema_mine.canonical_schema` uses, applied here inside the
fixed ambient k universe instead of on the induced support, so that
distinct embeddings of a small pattern into the k labels stay distinct.
Decisions are cached by that canonical form.

Two soundness notes on the pruning, both stronger than superset pruning:

  * every proper subset of a minimal UNSAT set is satisfiable, so a
    minimal UNSAT set of size m is always a one-atom extension of a
    satisfiable set of size m-1 — extending satisfiable representatives
    only is therefore complete, and it subsumes "prune supersets of known
    minimal UNSAT sets" (a superset of an UNSAT set is never generated
    because its UNSAT subset is never a parent);
  * satisfiability is downward closed, so the level-(m-1) satisfiable
    representative table is a complete oracle for "is this (m-1)-subset
    satisfiable?".  Minimality of an UNSAT candidate is decided by looking
    up the canonical form of each single-atom deletion in that table
    (`run_cegar2.minimize_schema`'s rank-level deletion test, with the
    re-ranking handled by the canonical form and with no extra solver
    calls), and re-verified afterwards by explicit `decide_schema` calls
    on every deletion, in both the ambient-k and the re-ranked
    support-local reading.

STOPPING.  Per k the loop stops at the first of: `exhausted` (no
satisfiable set of size m-1 exists, so no minimal UNSAT set of size >= m
can exist — completeness is then unconditional in the atom count),
`saturated` (no new minimal schema at two consecutive sizes; a heuristic —
completeness is NOT implied), or `max-atoms` (the `--max-atoms` cutoff —
completeness holds only up to that atom count).  The condition that fired
is recorded per k and must be read before any completeness claim.

What this script does NOT establish: nothing about Euclidean
realizability, nothing about cardinality-14 or any specific n, and no
Lean-side consequence.  It decides the QF_LRA relaxation
(positivity + strict triangle + strict Kalmanson) on k labelled points.
"""

from __future__ import annotations

import argparse
import itertools
import json
import random
import subprocess
import sys
import tempfile
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import schema_mine as S  # noqa: E402

Atom = S.Atom
Idxs = tuple[int, ...]


def atom_universe(k: int) -> list[Atom]:
    """All positive equality atoms on k labelled points."""
    atoms: list[Atom] = []
    for center in range(k):
        others = [p for p in range(k) if p != center]
        for left, right in itertools.combinations(others, 2):
            atoms.append(S.normalize("+", center, left, right))
    return atoms


class Universe:
    """Atom universe of one k, its dihedral action, and its SMT prefix."""

    def __init__(self, k: int) -> None:
        self.k = k
        self.atoms = atom_universe(k)
        self.size = len(self.atoms)
        index = {atom: i for i, atom in enumerate(self.atoms)}
        self.index = index

        # Dihedral group of the k-cycle, lifted to atom indices as bit shifts.
        self.shifts: list[list[int]] = []
        for reflect in (False, True):
            for rotation in range(k):
                def act(i: int, reflect: bool = reflect,
                        rotation: int = rotation) -> int:
                    return ((rotation - i) if reflect else (i + rotation)) % k
                table = [
                    1 << index[S.normalize(sign, act(c), act(l), act(r))]
                    for sign, c, l, r in self.atoms
                ]
                self.shifts.append(table)

        base = S.schema_smt(k, ()).splitlines()
        if base[-1] != "(check-sat)":
            raise RuntimeError("unexpected schema_smt tail")
        self.axioms = base[:-1]
        self.assert_line = [
            f"(assert (= {S.dvar(c, l)} {S.dvar(c, r)}))"
            if sign == "+" else
            f"(assert (not (= {S.dvar(c, l)} {S.dvar(c, r)})))"
            for sign, c, l, r in self.atoms
        ]
        self._gate()

    def _gate(self) -> None:
        """The batched per-candidate text must equal schema_smt's output."""
        rng = random.Random(20260724)
        trials = [tuple(range(min(3, self.size)))]
        for size in (1, 2, 4, 6):
            if size <= self.size:
                trials.append(tuple(sorted(rng.sample(range(self.size), size))))
        for idxs in trials:
            mine = "\n".join(
                self.axioms + [self.assert_line[i] for i in idxs]
                + ["(check-sat)"]
            ) + "\n"
            theirs = S.schema_smt(self.k, tuple(self.atoms[i] for i in idxs))
            if mine != theirs:
                raise AssertionError(
                    f"batch text diverges from schema_mine.schema_smt at k="
                    f"{self.k}, atoms {idxs}"
                )

    def canon(self, idxs: Idxs) -> int:
        best = -1
        for table in self.shifts:
            mask = 0
            for i in idxs:
                mask |= table[i]
            if best < 0 or mask < best:
                best = mask
        return best

    @staticmethod
    def raw_mask(idxs: Idxs) -> int:
        """Bit mask of an index set (its own canonical form, if canonical)."""
        mask = 0
        for i in idxs:
            mask |= 1 << i
        return mask

    @staticmethod
    def unmask(mask: int) -> Idxs:
        out: list[int] = []
        while mask:
            low = mask & -mask
            out.append(low.bit_length() - 1)
            mask ^= low
        return tuple(out)

    def as_atoms(self, idxs: Idxs) -> tuple[Atom, ...]:
        return tuple(self.atoms[i] for i in idxs)

    def batch(self, cands: list[Idxs], timeout: float) -> list[str]:
        """Decide many candidates in one z3 process (shared axiom prefix)."""
        if not cands:
            return []
        lines = list(self.axioms)
        line = self.assert_line
        for idxs in cands:
            lines.append("(push 1)")
            for i in idxs:
                lines.append(line[i])
            lines.append("(check-sat)")
            lines.append("(pop 1)")
        with tempfile.NamedTemporaryFile(
            "w", suffix=".smt2", delete=False, encoding="ascii"
        ) as handle:
            handle.write("\n".join(lines) + "\n")
            path = Path(handle.name)
        try:
            completed = subprocess.run(
                ["z3", "-smt2", str(path)],
                capture_output=True, text=True, timeout=timeout, check=False,
            )
        finally:
            path.unlink(missing_ok=True)
        verdicts = completed.stdout.split()
        if len(verdicts) != len(cands) or any(
            v not in {"sat", "unsat"} for v in verdicts
        ):
            raise RuntimeError(
                f"z3 batch mismatch: {len(verdicts)} verdicts for "
                f"{len(cands)} candidates; head {verdicts[:5]}, "
                f"stderr {completed.stderr[:200]}"
            )
        return verdicts


def ranked(atoms: tuple[Atom, ...]) -> tuple[int, tuple[Atom, ...]]:
    """Re-rank an atom set onto its own support (run_cegar2 deletion test)."""
    points = S.support(list(atoms))
    rank = {p: i for i, p in enumerate(points)}
    return len(points), tuple(
        S.normalize(sign, rank[c], rank[l], rank[r])
        for sign, c, l, r in atoms
    )


def enumerate_k(
    universe: Universe, max_atoms: int, jobs: int, chunk: int,
    early_stop: bool, timeout: float,
) -> dict:
    """Level-wise complete search for minimal UNSAT sets in one universe."""
    k = universe.k
    canon = universe.canon
    unmask = universe.unmask
    started = time.monotonic()

    parents: list[Idxs] = [()]
    prev_masks: set[int] = {0}
    minimal: list[tuple[int, Idxs]] = []          # (size, canonical idxs)
    levels: list[dict] = []
    stats = {
        "children_generated": 0, "cache_hits": 0,
        "z3_calls": 0, "z3_batches": 0,
    }
    stopping = "max-atoms"
    new_minimal_history: list[int] = []

    for m in range(1, max_atoms + 1):
        if not parents:
            stopping = f"exhausted (no satisfiable set of size {m - 1})"
            break

        seen: set[int] = set()
        sat_children: list[Idxs] = []
        sat_masks: set[int] = set()
        level = {
            "m": m, "candidates": 0, "sat": 0, "unsat": 0,
            "minimal": 0, f"minimal_support_{k}": 0,
        }
        pending: list[Idxs] = []
        universe_size = universe.size

        def consume(cands: list[Idxs], verdicts: list[str]) -> None:
            for idxs, verdict in zip(cands, verdicts):
                level["candidates"] += 1
                if verdict == "sat":
                    level["sat"] += 1
                    if m < max_atoms:  # no level above needs these
                        sat_children.append(idxs)
                        # idxs is the canonical representative of its class,
                        # so its plain bit mask already is the canonical form.
                        sat_masks.add(universe.raw_mask(idxs))
                    continue
                level["unsat"] += 1
                is_minimal = True
                for drop in idxs:
                    rest = tuple(i for i in idxs if i != drop)
                    if canon(rest) not in prev_masks:
                        is_minimal = False
                        break
                if is_minimal:
                    level["minimal"] += 1
                    minimal.append((m, idxs))
                    if len(S.support(list(universe.as_atoms(idxs)))) == k:
                        level[f"minimal_support_{k}"] += 1

        def flush(force: bool = False) -> None:
            nonlocal pending
            limit = chunk * jobs
            while pending and (force or len(pending) >= limit):
                take = pending[:limit]
                pending = pending[limit:]
                slices = [take[i::jobs] for i in range(jobs)]
                slices = [s for s in slices if s]
                stats["z3_batches"] += len(slices)
                stats["z3_calls"] += len(take)
                if len(slices) == 1:
                    results = [universe.batch(slices[0], timeout)]
                else:
                    with ThreadPoolExecutor(max_workers=len(slices)) as pool:
                        results = list(pool.map(
                            lambda s: universe.batch(s, timeout), slices
                        ))
                for cands, verdicts in zip(slices, results):
                    consume(cands, verdicts)

        for parent in parents:
            member = set(parent)
            for extra in range(universe_size):
                if extra in member:
                    continue
                child = tuple(sorted(parent + (extra,)))
                mask = canon(child)
                stats["children_generated"] += 1
                if mask in seen:
                    stats["cache_hits"] += 1
                    continue
                seen.add(mask)
                pending.append(unmask(mask))
            flush()
        flush(force=True)

        levels.append(level)
        print(f"  [k={k}] m={m}: candidates={level['candidates']:,} "
              f"sat={level['sat']:,} unsat={level['unsat']:,} "
              f"minimal={level['minimal']} "
              f"(support-{k}: {level[f'minimal_support_{k}']}) "
              f"{time.monotonic() - started:.0f}s", flush=True)

        parents = sat_children
        prev_masks = sat_masks
        new_minimal_history.append(level["minimal"])
        if m == max_atoms:
            stopping = f"max-atoms cutoff at {max_atoms}"
            break
        if (early_stop and len(new_minimal_history) >= 2
                and new_minimal_history[-1] == 0
                and new_minimal_history[-2] == 0):
            stopping = f"saturated (no new minimal schema at sizes {m-1}, {m})"
            break

    full: list[dict] = []
    partial: list[dict] = []
    for size, idxs in minimal:
        atoms = universe.as_atoms(idxs)
        support = S.support(list(atoms))
        record = {
            "support": len(support),
            "atoms": [list(atom) for atom in atoms],
            "size": size,
        }
        if len(support) == k:
            # Re-express in schema_mine.canonical_schema's representative of
            # the same dihedral orbit (this search's own canonical form
            # minimizes the atom-index bit mask, schema_mine's minimizes the
            # sorted atom tuple; the orbits coincide, the representatives
            # need not).  Recording schema_mine's makes every emitted schema
            # directly comparable to `schema-bank.json`.
            canon_k, canon_atoms = S.canonical_schema(list(atoms))
            if canon_k != k:
                raise AssertionError(
                    f"support drift vs schema_mine at k={k}: {atoms}"
                )
            record["atoms"] = [list(atom) for atom in canon_atoms]
            full.append(record)
        else:
            s, re = ranked(atoms)
            record["ranked_support"] = s
            record["ranked_atoms"] = [
                list(a) for a in S.canonical_schema(list(re))[1]
            ]
            partial.append(record)

    return {
        "atom_universe": universe.size,
        "levels": levels,
        "stopping_condition": stopping,
        "candidates_tested": sum(lv["candidates"] for lv in levels),
        "wall_seconds": round(time.monotonic() - started, 1),
        "schemas": full,
        "sub_support_minimal": partial,
        **stats,
    }


def reverify(universe: Universe, records: list[dict], jobs: int, chunk: int,
             timeout: float, sample: int) -> dict:
    """Independently re-decide every recorded schema and every deletion.

    Ambient reading: the deletion is decided on all k points.  Support-local
    reading (the `run_cegar2.minimize_schema` convention the CEGAR bank
    uses): the deletion is re-ranked onto its own support first.  Both are
    reported; a divergence would mean the two minimality notions differ.
    """
    k = universe.k
    index = universe.index
    ambient: list[Idxs] = []
    schema_calls: list[Idxs] = []
    local: dict[int, list[tuple[Atom, ...]]] = {}
    plan: list[tuple[int, list[int], list[tuple[int, int]]]] = []
    for record in records:
        atoms = tuple(tuple(a) for a in record["atoms"])
        idxs = tuple(sorted(index[a] for a in atoms))
        schema_calls.append(idxs)
        ambient_slots = []
        local_slots = []
        for drop in idxs:
            rest = tuple(i for i in idxs if i != drop)
            ambient_slots.append(len(ambient))
            ambient.append(rest)
            s, re = ranked(universe.as_atoms(rest))
            local.setdefault(s, [])
            local_slots.append((s, len(local[s])))
            local[s].append(re)
        plan.append((len(schema_calls) - 1, ambient_slots, local_slots))

    def run(u: Universe, cands: list) -> list[str]:
        out: list[str] = []
        for start in range(0, len(cands), chunk * jobs):
            block = cands[start:start + chunk * jobs]
            slices = [block[i::jobs] for i in range(jobs)]
            slices = [s for s in slices if s]
            with ThreadPoolExecutor(max_workers=max(1, len(slices))) as pool:
                results = list(pool.map(lambda s: u.batch(s, timeout), slices))
            merged: list[str | None] = [None] * len(block)
            for offset, verdicts in enumerate(results):
                merged[offset::jobs] = verdicts
            out.extend(v for v in merged if v is not None)
        return out

    schema_verdicts = run(universe, schema_calls)
    ambient_verdicts = run(universe, ambient)
    local_verdicts: dict[int, list[str]] = {}
    for s, sets in local.items():
        sub = Universe(s)
        local_verdicts[s] = run(sub, [
            tuple(sorted(sub.index[a] for a in atoms)) for atoms in sets
        ])

    unsat_ok = all(v == "unsat" for v in schema_verdicts)
    ambient_ok = all(v == "sat" for v in ambient_verdicts)
    local_ok = all(
        v == "sat" for verdicts in local_verdicts.values() for v in verdicts
    )
    agree = all(
        ambient_verdicts[a] == local_verdicts[s][i]
        for _, slots, locs in plan
        for a, (s, i) in zip(slots, locs)
    )

    # Unbatched control path: schema_mine.decide_schema on a random sample.
    rng = random.Random(k * 1000 + 7)
    picks = rng.sample(range(len(records)), min(sample, len(records)))
    control = 0
    for pick in picks:
        atoms = tuple(tuple(a) for a in records[pick]["atoms"])
        if S.decide_schema(k, atoms) != "unsat":
            raise AssertionError(f"control path disagrees at k={k}: {atoms}")
        control += 1

    return {
        "schemas": len(records),
        "all_unsat": unsat_ok,
        "all_ambient_deletions_sat": ambient_ok,
        "all_support_local_deletions_sat": local_ok,
        "ambient_and_support_local_agree": agree,
        "decide_schema_control_sample": control,
    }


def restriction_gate(k: int, trials: int, jobs: int, chunk: int,
                     timeout: float) -> dict:
    """Does the ambient-k verdict equal the support-local verdict?

    Sampled check that an atom set missing some of the k labels has the
    same verdict on k points as after re-ranking onto its own support.
    Agreement is what makes the support convention benign; a divergence
    would mean sets of smaller support must be decided in both universes.
    """
    universe = Universe(k)
    rng = random.Random(31 * k + 5)
    picked: list[Idxs] = []
    while len(picked) < trials:
        size = rng.randint(2, 6)
        idxs = tuple(sorted(rng.sample(range(universe.size), size)))
        atoms = universe.as_atoms(idxs)
        if len(S.support(list(atoms))) >= k:
            continue
        picked.append(idxs)
    ambient = universe.batch(picked, timeout)
    disagreements = 0
    for idxs, verdict in zip(picked, ambient):
        s, re = ranked(universe.as_atoms(idxs))
        sub = Universe(s)
        local = sub.batch([tuple(sorted(sub.index[a] for a in re))], timeout)[0]
        if local != verdict:
            disagreements += 1
    return {"trials": len(picked), "disagreements": disagreements}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--k", type=int, action="append", required=True,
                        help="support to enumerate (repeatable)")
    parser.add_argument("--max-atoms", type=int, default=6)
    parser.add_argument("--output", type=Path,
                        default=HERE / "complete-schemas.json")
    parser.add_argument("--bank-output", type=Path,
                        help="also write the avoid_probe bank shape "
                             '({"schemas": [{"support", "atoms"}]})')
    parser.add_argument("--jobs", type=int, default=4)
    parser.add_argument("--chunk", type=int, default=20000,
                        help="candidates per z3 process")
    parser.add_argument("--no-early-stop", action="store_true",
                        help="disable the two-consecutive-sizes saturation "
                             "stop (run to exhaustion or --max-atoms)")
    parser.add_argument("--timeout", type=float, default=3600.0)
    parser.add_argument("--verify-sample", type=int, default=200,
                        help="recorded schemas re-decided through the "
                             "unbatched schema_mine.decide_schema path")
    parser.add_argument("--restriction-gate", type=int, default=0,
                        help="sampled ambient-vs-support-local agreement gate")
    args = parser.parse_args()

    report: dict[str, dict] = {}
    for k in args.k:
        universe = Universe(k)
        print(f"[k={k}] atom universe {universe.size}, max-atoms "
              f"{args.max_atoms}, jobs {args.jobs}", flush=True)
        result = enumerate_k(
            universe, args.max_atoms, args.jobs, args.chunk,
            not args.no_early_stop, args.timeout,
        )
        started = time.monotonic()
        result["verification"] = reverify(
            universe, result["schemas"], args.jobs, args.chunk,
            args.timeout, args.verify_sample,
        )
        result["verification_seconds"] = round(time.monotonic() - started, 1)
        if args.restriction_gate:
            result["restriction_gate"] = restriction_gate(
                k, args.restriction_gate, args.jobs, args.chunk, args.timeout,
            )
        report[str(k)] = result
        print(f"[k={k}] {len(result['schemas'])} minimal schemas of support "
              f"exactly {k}; {len(result['sub_support_minimal'])} of smaller "
              f"support; stop: {result['stopping_condition']}; "
              f"{result['wall_seconds']}s + "
              f"{result['verification_seconds']}s verify", flush=True)
        print(f"[k={k}] verification: "
              f"{json.dumps(result['verification'])}", flush=True)

    payload = {"max_atoms": args.max_atoms, "k": report}
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    if args.bank_output:
        args.bank_output.write_text(json.dumps({
            "schemas": [
                {"support": record["support"], "atoms": record["atoms"]}
                for k in sorted(report, key=int)
                for record in report[k]["schemas"]
            ],
        }, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
