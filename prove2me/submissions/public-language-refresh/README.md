# Public-language refresh

This packet replaces internal formalization labels in the live mission with
mathematical descriptions. It updates the mission introduction, sixteen
milestones, and seventeen theorem or definition descriptions. Lean declaration
names, formal statements, proof records, dependencies, statuses, source links,
and attribution are unchanged.

The replacements spell out the three finite-nine witness-location patterns:

- two points in the two cap interiors opposite the chosen triangle vertex;
- one cap-interior point together with the adjacent opposite triangle vertex;
- the other opposite triangle vertex together with one cap-interior point.

The script is idempotent and checks every remote UUID against its expected Lean
declaration before sending a patch. It writes an exact verification receipt after
each successful readback.

The updater also keeps completion language synchronized with the live graph. In
particular, the counting obstruction and exact-nine exclusion milestones describe
proved results rather than saying that their source proofs are awaiting transfer.

```bash
uv run python prove2me/submissions/public-language-refresh/apply.py validate
uv run python prove2me/submissions/public-language-refresh/apply.py apply
```

Prove2Me API version 0.10.1 permits edits to mission descriptions, milestone
titles and descriptions, and theorem or definition natural-language descriptions.
It does not permit edits to a published theorem's `theorem_title`. Consequently,
old display titles such as “Finite-nine N4e core support” cannot be renamed in
place. Republishing the proved dependency graph solely to change those titles
would create duplicate declarations and disturb existing proof dependencies; this
packet does not do that. The natural-language text attached to those nodes is
made audience-facing, and the remaining title limitation is explicit here for a
future platform metadata migration.
