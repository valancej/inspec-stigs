#!/bin/bash

curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec

inspec --chef-license=accept

CONTROLS=$(./filter_controls.py --stage scm)
echo "Executing the following controls with Inspec:" $CONTROLS

cd mongodb_enterprise_3.x

# Run inspec
inspec exec controls/ --controls $CONTROLS --input-file inspec_inputs.yaml