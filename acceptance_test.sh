#!/bin/bash
test $(curl http://host.docker.internal:8765/sum?a=1\&b=2) -eq 3