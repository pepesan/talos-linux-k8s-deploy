#!/bin/bash
talosctl apply-config --insecure --nodes $WORKER_IP --file worker.yaml
