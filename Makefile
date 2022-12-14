MAKEFLAGS += --silent
TERRAFORM := terraform -chdir=terraform

.PHONY: fmt
fmt:
	$(TERRAFORM) fmt -recursive

.PHONY: init
init:
	$(TERRAFORM) init

.PHONY: plan
plan:
	$(TERRAFORM) plan

.PHONY: apply
apply:
	$(TERRAFORM) apply

.PHONY: output
output:
	$(TERRAFORM) output

.PHONY: destroy
destroy:
	$(TERRAFORM) destroy