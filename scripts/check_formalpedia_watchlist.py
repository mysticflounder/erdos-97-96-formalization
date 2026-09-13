"""Check a Prove2Me Formalpedia theorem watchlist without modifying it.

The online mode refreshes an agent token in memory and compares each saved
theorem snapshot with the current API response.  ``--offline`` only validates
the watchlist and prints its saved baseline.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path
from typing import Any
from uuid import UUID

API_BASE = "https://prove2.me/api/v1"
REFRESH_PATH = "/agent/refresh"
WATCHLIST_SCHEMA = "formalpedia-watchlist/v1"
DEFAULT_WATCHLIST = Path("prove2me/formalpedia-watchlist.json")
DEFAULT_CREDENTIALS = Path("~/prove2me_workspace/credentials.json")
REQUEST_TIMEOUT = 60
MAX_RESPONSE_BYTES = 4 * 1024 * 1024
SNAPSHOT_FIELDS = ("status", "name", "formal_statement_sha256")


class CheckerError(RuntimeError):
    """A bounded, user-facing checker error."""


class WatchlistError(CheckerError):
    """The watchlist is absent or does not have the expected schema."""


class CredentialsError(CheckerError):
    """The credentials file cannot supply an API key."""


class RequestError(CheckerError):
    """A request failed without exposing response contents."""


class _NoRedirectHandler(urllib.request.HTTPRedirectHandler):
    """Reject redirects before urllib can resend a body or Authorization."""

    def redirect_request(self, request: urllib.request.Request, fp: Any, code: int,
                         msg: str, headers: Any) -> None:
        raise urllib.error.HTTPError(
            request.full_url, code, "redirect refused", headers, None
        )


def _api_url(path: str) -> str:
    """Build and validate an API URL from the hardcoded origin."""

    if not path.startswith("/") or "?" in path or "#" in path:
        raise RequestError("invalid API path")
    url = API_BASE + path
    parsed = urllib.parse.urlsplit(url)
    if (
        parsed.scheme != "https"
        or parsed.netloc != "prove2.me"
        or parsed.path != "/api/v1" + path
        or parsed.query
        or parsed.fragment
    ):
        raise RequestError("API URL origin validation failed")
    return url


def _request_json(
    opener: urllib.request.OpenerDirector,
    method: str,
    path: str,
    *,
    body: bytes | None = None,
    token: str | None = None,
) -> Any:
    url = _api_url(path)
    headers = {"Accept": "application/json"}
    if token is not None:
        headers["Authorization"] = f"Bearer {token}"
    if body is not None:
        headers["Content-Type"] = "application/json"
    request = urllib.request.Request(url, data=body, headers=headers, method=method)
    try:
        with opener.open(request, timeout=REQUEST_TIMEOUT) as response:
            # No response body is ever read from an HTTPError, and successful
            # responses are bounded so a broken endpoint cannot consume memory.
            raw = response.read(MAX_RESPONSE_BYTES + 1)
            if len(raw) > MAX_RESPONSE_BYTES:
                raise RequestError(f"{method} {path} returned an oversized response")
            if response.geturl() != url:
                raise RequestError(f"{method} {path} returned an unexpected URL")
    except RequestError:
        raise
    except urllib.error.HTTPError as error:
        raise RequestError(f"{method} {path} failed with HTTP {error.code}") from None
    except urllib.error.URLError:
        raise RequestError(f"{method} {path} failed with a network error") from None
    except TimeoutError:
        raise RequestError(f"{method} {path} timed out") from None
    try:
        return json.loads(raw)
    except (UnicodeDecodeError, json.JSONDecodeError):
        raise RequestError(f"{method} {path} returned invalid JSON") from None


def _load_json(path: Path, label: str) -> Any:
    try:
        with path.open("r", encoding="utf-8") as handle:
            return json.load(handle)
    except FileNotFoundError:
        raise CheckerError(f"{label} file was not found: {path}") from None
    except OSError:
        raise CheckerError(f"{label} file could not be read: {path}") from None
    except (UnicodeDecodeError, json.JSONDecodeError):
        raise CheckerError(f"{label} file is not valid UTF-8 JSON: {path}") from None


def _validate_watchlist(path: Path) -> tuple[dict[str, Any], list[dict[str, Any]]]:
    try:
        payload = _load_json(path, "watchlist")
    except CheckerError as error:
        raise WatchlistError(str(error)) from None
    if not isinstance(payload, dict):
        raise WatchlistError("watchlist root must be a JSON object")
    if payload.get("schema") != WATCHLIST_SCHEMA:
        raise WatchlistError(f"watchlist schema must be {WATCHLIST_SCHEMA}")
    if payload.get("api_base") != API_BASE:
        raise WatchlistError(f"watchlist api_base must be {API_BASE}")
    rows = payload.get("theorems")
    if not isinstance(rows, list):
        raise WatchlistError("watchlist theorems must be a JSON array")
    validated: list[dict[str, Any]] = []
    seen: set[str] = set()
    for index, row in enumerate(rows, 1):
        if not isinstance(row, dict):
            raise WatchlistError(f"theorems[{index}] must be a JSON object")
        theorem_id = row.get("id")
        if not isinstance(theorem_id, str) or not theorem_id.strip():
            raise WatchlistError(f"theorems[{index}].id must be a nonempty string")
        try:
            UUID(theorem_id)
        except ValueError:
            raise WatchlistError(f"theorems[{index}].id must be a UUID") from None
        if theorem_id in seen:
            raise WatchlistError(f"duplicate theorem id: {theorem_id}")
        seen.add(theorem_id)
        for field in ("name", "status", "formal_statement_sha256"):
            if not isinstance(row.get(field), str):
                raise WatchlistError(f"theorems[{index}].{field} must be a string")
        digest = row["formal_statement_sha256"]
        if len(digest) != 64 or any(c not in "0123456789abcdef" for c in digest):
            raise WatchlistError(
                f"theorems[{index}].formal_statement_sha256 must be lowercase SHA-256"
            )
        if "formal_statement" in row:
            statement = row["formal_statement"]
            if not isinstance(statement, str):
                raise WatchlistError(f"theorems[{index}].formal_statement must be a string")
            if hashlib.sha256(statement.encode("utf-8")).hexdigest() != digest:
                raise WatchlistError(
                    f"theorems[{index}].formal_statement_sha256 does not match formal_statement"
                )
        validated.append(row)
    queries = payload.get("search_queries", [])
    if not isinstance(queries, list) or any(not isinstance(q, str) for q in queries):
        raise WatchlistError("watchlist search_queries must be an array of strings")
    return payload, validated


def _load_api_key(path: Path) -> str:
    try:
        payload = _load_json(path.expanduser(), "credentials")
    except CheckerError as error:
        raise CredentialsError(str(error)) from None
    if not isinstance(payload, dict):
        raise CredentialsError("credentials root must be a JSON object")
    key = payload.get("api_key")
    if not isinstance(key, str) or not key.strip():
        raise CredentialsError("credentials has no API key")
    return key.strip()


def _baseline_line(row: dict[str, Any], prefix: str = "BASELINE") -> str:
    return (
        f"{prefix} id={row['id']} status={row['status']!r} "
        f"name={row['name']!r} formal_statement_sha256={row['formal_statement_sha256']}"
    )


def _api_snapshot(theorem: Any, theorem_id: str) -> dict[str, str]:
    if isinstance(theorem, dict) and isinstance(theorem.get("theorem"), dict):
        theorem = theorem["theorem"]
    if not isinstance(theorem, dict):
        raise RequestError(f"theorem {theorem_id} returned an invalid object")
    returned_id = theorem.get("theorem_id")
    if returned_id != theorem_id:
        raise RequestError(f"theorem {theorem_id} returned a mismatched theorem_id")
    name = theorem.get("theorem_name")
    status = theorem.get("status")
    formal_statement = theorem.get("formal_statement")
    if not isinstance(name, str) or not isinstance(status, str):
        raise RequestError(f"theorem {theorem_id} omitted status or name")
    if not isinstance(formal_statement, str):
        raise RequestError(f"theorem {theorem_id} omitted formal_statement")
    digest = hashlib.sha256(formal_statement.encode("utf-8")).hexdigest()
    return {"name": name, "status": status, "formal_statement_sha256": digest}


def _print_comparison(row: dict[str, Any], current: dict[str, str]) -> bool:
    changed = [field for field in SNAPSHOT_FIELDS if row[field] != current[field]]
    if not changed:
        return False
    pieces = [f"CHANGED id={row['id']}"]
    for field in changed:
        pieces.append(f"{field}={row[field]!r}->{current[field]!r}")
    print(" ".join(pieces))
    return True


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--watchlist", type=Path, default=DEFAULT_WATCHLIST)
    parser.add_argument("--credentials", type=Path, default=DEFAULT_CREDENTIALS)
    parser.add_argument("--offline", action="store_true", help="validate and print saved baselines")
    parser.add_argument("--all", action="store_true", help="print unchanged theorem comparisons too")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        _, rows = _validate_watchlist(args.watchlist)
        if args.offline:
            for row in rows:
                print(_baseline_line(row))
            print(f"SUMMARY checked={len(rows)} changed=0 unchanged={len(rows)} errors=0 mode=offline")
            return 0

        opener = urllib.request.build_opener(_NoRedirectHandler())
        key = _load_api_key(args.credentials)
        refresh = _request_json(
            opener,
            "POST",
            REFRESH_PATH,
            body=json.dumps({"api_key": key}, separators=(",", ":")).encode("utf-8"),
        )
        if not isinstance(refresh, dict) or not isinstance(refresh.get("access_token"), str):
            raise RequestError("agent refresh returned no access token")
        token = refresh["access_token"]
    except WatchlistError as error:
        print(f"ERROR watchlist: {error}", file=sys.stderr)
        return 2
    except CredentialsError as error:
        print(f"ERROR credentials: {error}", file=sys.stderr)
        return 2
    except CheckerError as error:
        print(f"ERROR refresh: {error}", file=sys.stderr)
        return 1

    changed = 0
    errors = 0
    checked = 0
    for row in rows:
        theorem_id = row["id"]
        escaped_id = urllib.parse.quote(theorem_id, safe="")
        try:
            current = _api_snapshot(
                _request_json(opener, "GET", f"/theorems/{escaped_id}", token=token),
                theorem_id,
            )
        except RequestError as error:
            print(f"ERROR theorem id={theorem_id}: {error}", file=sys.stderr)
            errors += 1
            continue
        checked += 1
        if _print_comparison(row, current):
            changed += 1
        elif args.all:
            print(_baseline_line({**row, **current}, prefix="UNCHANGED"))
    print(f"SUMMARY checked={checked} changed={changed} unchanged={checked - changed} errors={errors}")
    return 1 if errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
