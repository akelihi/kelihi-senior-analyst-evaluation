# Kelihi Senior Analyst Assessment (Starter)

Token: KELIHI-SA-155cc8e0

This package contains sample data and a DuckDB starter script to run locally.

Contents
- data/raw/ (users, orders_v1, payments, events.jsonl, product_catalog v1/v2)
- setup.sql (creates staging tables and a helper view)
- pyproject.toml (pinned Python 3.11 environment via uv)
- UV_SETUP.md (setup instructions)
- run_example.sh (optional helper)

Quickstart (Python)
1) Create environment and install deps (see UV_SETUP.md)
2) Initialize:
   uv run python -c "import duckdb, pathlib; con=duckdb.connect('kelihi.duckdb'); con.execute(pathlib.Path('setup.sql').read_text()); print('DB initialized')"

Notes
- Use Python and DuckDB for all tasks.
- Save outputs to data/out/ for easy review.
- Include the token in all submitted files.
