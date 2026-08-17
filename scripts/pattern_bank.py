#!/usr/bin/env python3
"""Durable bank for candidate patterns mined out of the ``scratch/`` solver corpus.

Prior mining passes were fixed-pattern Python scripts: each one searched for a
shape its author already suspected, wrote a one-off report, and left no queryable
residue.  This module is the residue.  It stores every *candidate* pattern an LLM
mine proposes, together with the adversarial verdict on it, so that later waves
can ask "has anyone already looked at this, and what happened" instead of
re-deriving the same encoder artifact.

Nothing in this bank is a theorem.  A row is an observation about solver output
plus a candidate universal statement someone might try to prove.  The
``confidence`` and ``verdict`` columns record how much scepticism has been
applied, not how true the statement is.

Usage::

    uv run python scripts/pattern_bank.py init
    uv run python scripts/pattern_bank.py ingest --run-output <workflow.json> --run-id <id>
    uv run python scripts/pattern_bank.py stats
    uv run python scripts/pattern_bank.py list --live --bucket 5
    uv run python scripts/pattern_bank.py show <handle>
    uv run python scripts/pattern_bank.py export --format md
"""

from __future__ import annotations

import argparse
import json
import sqlite3
import sys
from collections.abc import Mapping, Sequence
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

REPO_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_DB = REPO_ROOT / "data" / "p97-pattern-bank.db"

CONFIDENCE_LEVELS = (
    "likely-encoder-artifact",
    "unclear",
    "plausible-invariant",
    "strong-invariant",
)

KILL_REASONS = (
    "encoder-artifact",
    "counterexample-found",
    "already-known-theorem",
    "already-in-dead-ends",
    "evidence-does-not-support",
    "survives",
)

# The live proof-frontier obstructions, as classified by the 2026-08-16 triage of
# the 36 open on-spine obligations.  A pattern that speaks to one of these is worth
# far more than a free-floating observation, so the bucket is a first-class column.
OBSTRUCTIONS: tuple[tuple[int, str, str], ...] = (
    (0, "none", "Speaks to no currently open obstruction."),
    (
        1,
        "pentagon-offclass-bisector",
        (
            "The proven positive-bisector technique reaches only on-class blocker "
            "identifications, never off-class branches."
        ),
    ),
    (
        2,
        "six-center-incidence-producer",
        (
            "Missing positive incidence theorem over five or six named exact "
            "deleted-K4 rows."
        ),
    ),
    (
        3,
        "cyclic-order-metric-classifier",
        (
            "Missing global cyclic-order / full-row metric classifier; the "
            "shell-equality and Kalmanson bank underdetermines the order."
        ),
    ),
    (
        4,
        "center-carrier-exclusion",
        (
            "Missing exclusion for a centre coinciding with a carrier point, or for "
            "a bidirectional K4-survival square."
        ),
    ),
    (
        5,
        "endpoint-parametric-card13",
        (
            "Missing endpoint-parametric card>=13 incidence producer for the "
            "five-conjunct packet c1 in BO, O in K1, c2 in K1, O in K2, c1 in K2."
        ),
    ),
    (6, "b1-centre-transport", "Missing global B1 centre-transport producer."),
    (
        7,
        "unbounded-n-counting",
        "Missing n-independent counting/incidence argument; no finite CEGAR applies.",
    ),
)

SCHEMA = """
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS mine_run (
    run_id        TEXT PRIMARY KEY,
    workflow      TEXT NOT NULL,
    source_path   TEXT,
    corpus_files  INTEGER,
    ingested_utc  TEXT NOT NULL,
    notes         TEXT
);

CREATE TABLE IF NOT EXISTS obstruction (
    bucket      INTEGER PRIMARY KEY,
    label       TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS cluster (
    cluster_id    INTEGER PRIMARY KEY,
    run_id        TEXT NOT NULL REFERENCES mine_run(run_id) ON DELETE CASCADE,
    cluster_key   TEXT NOT NULL,
    corpus_notes  TEXT,
    dead_patterns TEXT,
    UNIQUE (run_id, cluster_key)
);

CREATE TABLE IF NOT EXISTS pattern (
    pattern_id          INTEGER PRIMARY KEY,
    run_id              TEXT NOT NULL REFERENCES mine_run(run_id) ON DELETE CASCADE,
    cluster_id          INTEGER NOT NULL REFERENCES cluster(cluster_id) ON DELETE CASCADE,
    handle              TEXT NOT NULL,
    observation         TEXT,
    candidate_statement TEXT,
    evidence            TEXT,
    sample_size         TEXT,
    encoder_check       TEXT,
    obstruction_bucket  INTEGER REFERENCES obstruction(bucket),
    falsification_test  TEXT,
    confidence          TEXT,
    is_best             INTEGER NOT NULL DEFAULT 0,
    UNIQUE (run_id, cluster_id, handle)
);

CREATE TABLE IF NOT EXISTS verdict (
    verdict_id       INTEGER PRIMARY KEY,
    pattern_id       INTEGER NOT NULL UNIQUE REFERENCES pattern(pattern_id) ON DELETE CASCADE,
    killed           INTEGER NOT NULL,
    kill_reason      TEXT,
    verdict_detail   TEXT,
    salvageable_form TEXT,
    tested_utc       TEXT
);

CREATE INDEX IF NOT EXISTS idx_pattern_bucket     ON pattern(obstruction_bucket);
CREATE INDEX IF NOT EXISTS idx_pattern_confidence ON pattern(confidence);
CREATE INDEX IF NOT EXISTS idx_pattern_handle     ON pattern(handle);

-- A pattern is "live" when no verdict killed it.  Untested patterns are live by
-- default, and `tested` distinguishes them from ones that survived a real attack.
CREATE VIEW IF NOT EXISTS v_live_pattern AS
SELECT
    p.pattern_id,
    p.run_id,
    c.cluster_key,
    p.handle,
    p.confidence,
    p.obstruction_bucket,
    o.label AS obstruction_label,
    p.candidate_statement,
    p.sample_size,
    CASE WHEN v.verdict_id IS NULL THEN 0 ELSE 1 END AS tested,
    v.kill_reason,
    v.salvageable_form
FROM pattern p
JOIN cluster c ON c.cluster_id = p.cluster_id
LEFT JOIN obstruction o ON o.bucket = p.obstruction_bucket
LEFT JOIN verdict v ON v.pattern_id = p.pattern_id
WHERE COALESCE(v.killed, 0) = 0;
"""


def utc_now() -> str:
    return datetime.now(UTC).strftime("%Y-%m-%dT%H:%M:%SZ")


def connect(db_path: Path) -> sqlite3.Connection:
    db_path.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON")
    return conn


def init_db(conn: sqlite3.Connection) -> None:
    conn.executescript(SCHEMA)
    conn.executemany(
        "INSERT OR REPLACE INTO obstruction (bucket, label, description) VALUES (?, ?, ?)",
        OBSTRUCTIONS,
    )
    conn.commit()


def _unwrap(payload: Mapping[str, Any]) -> Mapping[str, Any]:
    """Accept either a raw workflow task output or its inner ``result`` object."""
    if "mined" in payload:
        return payload
    result = payload.get("result")
    if isinstance(result, Mapping) and "mined" in result:
        return result
    raise ValueError("payload has no 'mined' key; is this a pattern-mine output?")


def _coerce_bucket(value: Any) -> int | None:
    if isinstance(value, bool) or not isinstance(value, int):
        return None
    return value if 0 <= value <= 7 else None


def ingest(
    conn: sqlite3.Connection,
    payload: Mapping[str, Any],
    run_id: str,
    workflow: str,
    source_path: str | None = None,
    corpus_files: int | None = None,
    notes: str | None = None,
) -> dict[str, int]:
    """Load one mine's candidates and verdicts.  Re-ingesting a run replaces it."""
    inner = _unwrap(payload)
    mined: Sequence[Any] = inner.get("mined") or []
    falsifications: Sequence[Any] = inner.get("falsifications") or []

    conn.execute("DELETE FROM mine_run WHERE run_id = ?", (run_id,))
    conn.execute(
        "INSERT INTO mine_run (run_id, workflow, source_path, corpus_files, ingested_utc, notes)"
        " VALUES (?, ?, ?, ?, ?, ?)",
        (run_id, workflow, source_path, corpus_files, utc_now(), notes),
    )

    # handle -> pattern_id, so verdicts (which reference a bare candidate_id) can
    # be attached without the cluster they came from.
    by_handle: dict[str, int] = {}
    counts = {"clusters": 0, "patterns": 0, "verdicts": 0, "orphan_verdicts": 0}

    for entry in mined:
        if not isinstance(entry, Mapping):
            continue
        cluster_key = str(entry.get("cluster") or f"cluster-{counts['clusters']}")
        cur = conn.execute(
            "INSERT INTO cluster (run_id, cluster_key, corpus_notes, dead_patterns)"
            " VALUES (?, ?, ?, ?)",
            (
                run_id,
                cluster_key,
                entry.get("corpus_notes"),
                entry.get("dead_patterns"),
            ),
        )
        cluster_id = int(cur.lastrowid or 0)
        counts["clusters"] += 1
        best = entry.get("best_candidate_id")

        for cand in entry.get("candidates") or []:
            if not isinstance(cand, Mapping):
                continue
            handle = str(cand.get("id") or "").strip()
            if not handle:
                continue
            cur = conn.execute(
                "INSERT OR REPLACE INTO pattern ("
                " run_id, cluster_id, handle, observation, candidate_statement,"
                " evidence, sample_size, encoder_check, obstruction_bucket,"
                " falsification_test, confidence, is_best"
                ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                (
                    run_id,
                    cluster_id,
                    handle,
                    cand.get("observation"),
                    cand.get("candidate_statement"),
                    cand.get("evidence"),
                    cand.get("sample_size"),
                    cand.get("encoder_check"),
                    _coerce_bucket(cand.get("obstruction_bucket")),
                    cand.get("falsification_test"),
                    cand.get("confidence"),
                    1 if handle == best else 0,
                ),
            )
            by_handle[handle] = int(cur.lastrowid or 0)
            counts["patterns"] += 1

    for verdict in falsifications:
        if not isinstance(verdict, Mapping):
            continue
        handle = str(verdict.get("candidate_id") or "").strip()
        pattern_id = by_handle.get(handle)
        if pattern_id is None:
            counts["orphan_verdicts"] += 1
            continue
        conn.execute(
            "INSERT OR REPLACE INTO verdict ("
            " pattern_id, killed, kill_reason, verdict_detail, salvageable_form, tested_utc"
            ") VALUES (?, ?, ?, ?, ?, ?)",
            (
                pattern_id,
                1 if verdict.get("killed") else 0,
                verdict.get("kill_reason"),
                verdict.get("verdict_detail"),
                verdict.get("salvageable_form"),
                utc_now(),
            ),
        )
        counts["verdicts"] += 1

    conn.commit()
    return counts


def stats(conn: sqlite3.Connection) -> dict[str, Any]:
    def scalar(sql: str) -> int:
        row = conn.execute(sql).fetchone()
        return int(row[0]) if row and row[0] is not None else 0

    by_confidence = {
        row["confidence"] or "unset": row["n"]
        for row in conn.execute(
            "SELECT confidence, COUNT(*) AS n FROM pattern GROUP BY confidence"
        )
    }
    by_reason = {
        row["kill_reason"] or "unset": row["n"]
        for row in conn.execute(
            "SELECT kill_reason, COUNT(*) AS n FROM verdict WHERE killed = 1"
            " GROUP BY kill_reason"
        )
    }
    by_bucket = {
        int(row["obstruction_bucket"]): row["n"]
        for row in conn.execute(
            "SELECT obstruction_bucket, COUNT(*) AS n FROM v_live_pattern"
            " WHERE obstruction_bucket IS NOT NULL GROUP BY obstruction_bucket"
        )
    }
    return {
        "runs": scalar("SELECT COUNT(*) FROM mine_run"),
        "clusters": scalar("SELECT COUNT(*) FROM cluster"),
        "patterns": scalar("SELECT COUNT(*) FROM pattern"),
        "verdicts": scalar("SELECT COUNT(*) FROM verdict"),
        "killed": scalar("SELECT COUNT(*) FROM verdict WHERE killed = 1"),
        "live": scalar("SELECT COUNT(*) FROM v_live_pattern"),
        "live_tested": scalar("SELECT COUNT(*) FROM v_live_pattern WHERE tested = 1"),
        "patterns_by_confidence": by_confidence,
        "kills_by_reason": by_reason,
        "live_by_obstruction": by_bucket,
    }


def list_patterns(
    conn: sqlite3.Connection,
    live_only: bool = False,
    bucket: int | None = None,
    min_confidence: str | None = None,
    run_id: str | None = None,
) -> list[sqlite3.Row]:
    if live_only:
        sql = ["SELECT * FROM v_live_pattern WHERE 1 = 1"]
    else:
        sql = [
            (
                "SELECT p.pattern_id, p.run_id, c.cluster_key, p.handle, p.confidence,"
                " p.obstruction_bucket, o.label AS obstruction_label,"
                " p.candidate_statement, p.sample_size,"
                " CASE WHEN v.verdict_id IS NULL THEN 0 ELSE 1 END AS tested,"
                " v.kill_reason, v.salvageable_form"
                " FROM pattern p"
                " JOIN cluster c ON c.cluster_id = p.cluster_id"
                " LEFT JOIN obstruction o ON o.bucket = p.obstruction_bucket"
                " LEFT JOIN verdict v ON v.pattern_id = p.pattern_id"
                " WHERE 1 = 1"
            )
        ]
    params: list[Any] = []
    if bucket is not None:
        sql.append(
            "AND obstruction_bucket = ?"
            if live_only
            else "AND p.obstruction_bucket = ?"
        )
        params.append(bucket)
    if run_id is not None:
        sql.append("AND run_id = ?" if live_only else "AND p.run_id = ?")
        params.append(run_id)
    if min_confidence is not None:
        keep = CONFIDENCE_LEVELS[CONFIDENCE_LEVELS.index(min_confidence) :]
        placeholders = ",".join("?" for _ in keep)
        sql.append(
            f"AND {'confidence' if live_only else 'p.confidence'} IN ({placeholders})"
        )
        params.extend(keep)
    sql.append(
        "ORDER BY obstruction_bucket, handle"
        if live_only
        else "ORDER BY p.obstruction_bucket, p.handle"
    )
    return list(conn.execute(" ".join(sql), params))


def export_markdown(conn: sqlite3.Connection) -> str:
    st = stats(conn)
    lines = [
        "# P97 scratch pattern bank",
        "",
        (
            "Candidate patterns mined from the `scratch/` solver corpus. "
            "**No row here is a theorem.** Each is an observation plus a candidate "
            "universal statement, with whatever scepticism has been applied so far."
        ),
        "",
        f"- runs ingested: {st['runs']}",
        f"- candidate patterns: {st['patterns']}",
        f"- adversarially tested: {st['verdicts']} (killed {st['killed']})",
        f"- live: {st['live']} (of which {st['live_tested']} survived a real attack)",
        "",
        "## Live candidates",
        "",
        "| handle | obstruction | confidence | tested | sample | candidate statement |",
        "|---|---|---|---|---|---|",
    ]
    for row in list_patterns(conn, live_only=True):
        bucket = row["obstruction_bucket"]
        label = row["obstruction_label"] or "-"
        statement = (
            (row["candidate_statement"] or "").replace("|", "\\|").replace("\n", " ")
        )
        sample = (row["sample_size"] or "-").replace("|", "\\|").replace("\n", " ")
        lines.append(
            f"| `{row['handle']}` | {bucket if bucket is not None else '-'} {label} "
            f"| {row['confidence'] or '-'} | {'yes' if row['tested'] else 'no'} "
            f"| {sample[:60]} | {statement[:200]} |"
        )
    lines.extend(["", "## Kills by reason", ""])
    if st["kills_by_reason"]:
        for reason, count in sorted(st["kills_by_reason"].items()):
            lines.append(f"- {reason}: {count}")
    else:
        lines.append("- none recorded")
    return "\n".join(lines) + "\n"


def _cmd_init(args: argparse.Namespace) -> int:
    with connect(args.db) as conn:
        init_db(conn)
    print(f"initialized {args.db}")
    return 0


def _cmd_ingest(args: argparse.Namespace) -> int:
    payload = json.loads(Path(args.run_output).read_text())
    with connect(args.db) as conn:
        init_db(conn)
        counts = ingest(
            conn,
            payload,
            run_id=args.run_id,
            workflow=args.workflow,
            source_path=str(args.run_output),
            corpus_files=args.corpus_files,
            notes=args.notes,
        )
    print(json.dumps(counts, indent=2))
    if counts["orphan_verdicts"]:
        print(
            f"warning: {counts['orphan_verdicts']} verdict(s) referenced an unknown"
            " candidate id and were skipped",
            file=sys.stderr,
        )
    return 0


def _cmd_stats(args: argparse.Namespace) -> int:
    with connect(args.db) as conn:
        print(json.dumps(stats(conn), indent=2, sort_keys=True))
    return 0


def _cmd_list(args: argparse.Namespace) -> int:
    with connect(args.db) as conn:
        rows = list_patterns(
            conn,
            live_only=args.live,
            bucket=args.bucket,
            min_confidence=args.min_confidence,
            run_id=args.run_id,
        )
        if args.format == "json":
            print(json.dumps([dict(r) for r in rows], indent=2))
        else:
            for row in rows:
                flag = (
                    "live" if not row["kill_reason"] else f"KILLED:{row['kill_reason']}"
                )
                bucket = row["obstruction_bucket"]
                print(
                    f"[{flag}] {row['handle']}  bucket={bucket if bucket is not None else '-'}"
                    f"  conf={row['confidence']}  cluster={row['cluster_key']}"
                )
                if row["candidate_statement"]:
                    print(f"    {row['candidate_statement'][:300]}")
    return 0


def _cmd_show(args: argparse.Namespace) -> int:
    with connect(args.db) as conn:
        row = conn.execute(
            "SELECT p.*, c.cluster_key, v.killed, v.kill_reason, v.verdict_detail,"
            " v.salvageable_form"
            " FROM pattern p JOIN cluster c ON c.cluster_id = p.cluster_id"
            " LEFT JOIN verdict v ON v.pattern_id = p.pattern_id"
            " WHERE p.handle = ?",
            (args.handle,),
        ).fetchone()
        if row is None:
            print(f"no pattern with handle {args.handle!r}", file=sys.stderr)
            return 1
        print(json.dumps({k: row[k] for k in row.keys()}, indent=2))  # noqa: SIM118
    return 0


def _cmd_export(args: argparse.Namespace) -> int:
    with connect(args.db) as conn:
        text = export_markdown(conn)
    if args.out:
        Path(args.out).write_text(text)
        print(f"wrote {args.out}")
    else:
        print(text, end="")
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--db", type=Path, default=DEFAULT_DB, help="bank path")
    sub = parser.add_subparsers(dest="command", required=True)

    sub.add_parser(
        "init", help="create schema and seed obstruction buckets"
    ).set_defaults(func=_cmd_init)

    p_ing = sub.add_parser("ingest", help="load a pattern-mine workflow output")
    p_ing.add_argument("--run-output", required=True, type=Path)
    p_ing.add_argument("--run-id", required=True)
    p_ing.add_argument("--workflow", default="p97-scratch-lemma-mine")
    p_ing.add_argument("--corpus-files", type=int, default=None)
    p_ing.add_argument("--notes", default=None)
    p_ing.set_defaults(func=_cmd_ingest)

    sub.add_parser(
        "stats", help="counts by confidence, kill reason, obstruction"
    ).set_defaults(func=_cmd_stats)

    p_list = sub.add_parser("list", help="list patterns")
    p_list.add_argument("--live", action="store_true", help="only patterns not killed")
    p_list.add_argument("--bucket", type=int, default=None)
    p_list.add_argument("--min-confidence", choices=CONFIDENCE_LEVELS, default=None)
    p_list.add_argument("--run-id", default=None)
    p_list.add_argument("--format", choices=("text", "json"), default="text")
    p_list.set_defaults(func=_cmd_list)

    p_show = sub.add_parser("show", help="full record for one handle")
    p_show.add_argument("handle")
    p_show.set_defaults(func=_cmd_show)

    p_exp = sub.add_parser("export", help="render the bank as markdown")
    p_exp.add_argument("--format", choices=("md",), default="md")
    p_exp.add_argument("--out", type=Path, default=None)
    p_exp.set_defaults(func=_cmd_export)

    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    return int(args.func(args))


if __name__ == "__main__":
    raise SystemExit(main())
