#!/usr/bin/env python3
import argparse
import sys
import json
import yaml


###### Setup command line parser
def setup_parser():
    parser = argparse.ArgumentParser(description="Tool for filter STIG profile controls per stage in CI/CD")
    parser.add_argument('-s', '--stage', default='none', help='Pipeline step/stage name. ex. scm, image, deployment, runtime')
    parser.add_argument('-f', '--file', default='inspec_controls.json', help='name of inspec_controls file. output of: inspec json controls/')

    return parser

# Find and print controls annotated with name of the stage passed to script as input (ex. scm)
def parse_controls(input_stage, input_file):

    with open(input_file, 'r') as file:
        inspec_controls = json.load(file)

        for control in inspec_controls.get("controls"):
            if control.get("tags").get("sdlc_stages"):
                for stage in control.get("tags").get("sdlc_stages"):
                    if stage == input_stage:
                        print(control.get("id"), end=" ")

def main(arg_parser):

    parser = arg_parser
    args = parser.parse_args()
    input_stage = args.stage
    input_file = args.file

    parse_controls(input_stage, input_file)

if __name__ == "__main__":
    try:
        arg_parser = setup_parser()
        main(arg_parser)
    except Exception as error:
        print ("\n\nERROR executing script - Exception: {}".format(error))
        sys.exit(1)