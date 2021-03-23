#!/usr/bin/env python3
import argparse
import sys
import yaml


###### Setup command line parser
def setup_parser():
    parser = argparse.ArgumentParser(description="Tool for filter STIG profile controls per stage in CI/CD")
    parser.add_argument('-s', '--stage', default='none', help='Pipeline step/stage name. ex. scm, image, deployment, runtime')

    return parser

def parse_controls(input_stage):

    with open("stig_controls_stages.yaml", 'r') as stream:
        try:
            yaml_controls = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)

    stages = []

    for yaml_stage in yaml_controls.get("stages"):
        stages.append(yaml_stage)

    if input_stage in stages:
        found_stage = input_stage
    else:
        print("No stage match")

    found_controls = yaml_controls.get("stages").get(found_stage)

    for control in found_controls:
        print(control, end=" ")

def main(arg_parser):

    parser = arg_parser
    args = parser.parse_args()
    input_stage = args.stage

    parse_controls(input_stage)

if __name__ == "__main__":
    try:
        arg_parser = setup_parser()
        main(arg_parser)
    except Exception as error:
        print ("\n\nERROR executing script - Exception: {}".format(error))
        sys.exit(1)