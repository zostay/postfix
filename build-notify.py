#!/usr/bin/python

import boto3
import sys

fn = boto3.client('lambda')

build_tag = sys.argv[1]

fn.invoke(
    FunctionName   = "QublingWordpressBuildNotifier",
    Payload        = b'{"BuildTag":"' + bytearray(build_tag, "utf-8") + b'"}'
)
