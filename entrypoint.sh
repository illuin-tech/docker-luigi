#!/usr/bin/env bash

j2 /luigi/luigi.cfg.j2 > luigi.cfg

luigid
