#!/bin/bash

curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec

inspec --chef-license=accept

cd mongodb_enterprise_3.x

# Generate json file from existing controls
inspec json controls/ > inspec_controls.json

CONTROLS=$(.././filter_controls.py --stage scm --file inspec_controls.json)
echo "Executing the following controls with Inspec:" $CONTROLS

# Run inspec
inspec exec controls/ --controls $CONTROLS --input-file inspec_inputs.yaml