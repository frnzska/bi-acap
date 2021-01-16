#!/usr/bin/env bash

# config
method=$1
KEY_NAME=${2:-<YOURSSHKEY>}
SETUP_IP=$(curl ifconfig.me)/12
STACK_NAME='Redash-EC2-Stack'
AWS_DEFAULT_PROFILE='eu-west-1'

TEMPLATE=file://template.yml

_validate() {
	echo 'Validate stack...' $TEMPLATE
	aws cloudformation validate-template --template-body $TEMPLATE
}

_check_status() {
	echo .. $method still in progress.
	aws cloudformation wait stack-$method-complete --stack-name $STACK_NAME

	echo 'Done'

}

create() {
	_validate
	echo 'Create stack, allow access to web server from your IP' $SETUP_IP
	aws cloudformation create-stack --stack-name $STACK_NAME \
			--template-body $TEMPLATE \
			--parameters ParameterKey=KeyName,ParameterValue=$KEY_NAME ParameterKey=SetupIp,ParameterValue=$SETUP_IP

	_check_status
}

update() {
	_validate
	echo 'Allow access from everywhere'
	aws cloudformation update-stack --stack-name $STACK_NAME \
			--template-body $TEMPLATE \
			--parameters ParameterKey=KeyName,UsePreviousValue=true ParameterKey=SetupIp,ParameterValue=0.0.0.0/0
	_check_status
}


delete() {
    aws cloudformation delete-stack --stack-name $STACK_NAME
    _check_status
}

if [ "$method" ]; then
	echo doing $method stack
fi


"$@"