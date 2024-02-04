#!/bin/bash
# Aplica la cconfig al nodo de control
talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file controlplane.yaml

