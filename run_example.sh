#!/usr/bin/env bash
set -euo pipefail
DUCKDB_DB=${1:-kelihi.duckdb}
duckdb "$DUCKDB_DB" -init setup.sql
echo "Initialized $DUCKDB_DB. Add your own scripts to run transformations."
