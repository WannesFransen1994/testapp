#!/bin/bash

docker run -e SECRET_KEY_BASE="$(mix phx.gen.secret)" -p 4000:4000 my_kube_app
