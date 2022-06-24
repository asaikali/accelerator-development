#!/bin/bash
set -x
set +e

echo $KCONF  | base64 -d  > .kube/config 