#!/bin/bash

curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec

CONTROLS=$(./filter_controls.py --stage scm)
echo "Executing the following controls with Inspec:" $CONTROLS
# Run inspec
inspec exec apache_2.4_server/controls/ --controls $CONTROLS --input-file=apache_2.4_server/inspec_inputs.yaml -t docker://7b197292b89c0ae9510ac9402ef6759cc74f4b6c6f8bb7fa35fe7e74e0b2fd1e