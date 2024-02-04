#!/bin/bash

talosctl patch mc --patch @w.yaml --nodes $WORKER_IP
#talosctl machineconfig patch worker.yaml --patch w.yaml -o worker-v2.yaml
