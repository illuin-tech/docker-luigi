#!/usr/bin/env bash
set -e

j2 /luigi/luigi.cfg.j2 > luigi.cfg

exec "$@"
