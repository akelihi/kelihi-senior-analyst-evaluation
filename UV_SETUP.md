# uv setup

Python 3.11 and pinned packages are required.

Prereqs
- Python 3.11.x
- uv (see https://docs.astral.sh/uv/)

Create environment and install
uv venv --python 3.11
uv sync

Run
uv run python -c "import duckdb, pathlib; con=duckdb.connect('kelihi.duckdb'); con.execute(pathlib.Path('setup.sql').read_text()); print('DB initialized')"

Optional extras for BI prototype
uv sync --extra viz
