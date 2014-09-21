BUNDLE=$(shell which bundle)
MAKE=$(shell which make)

TARGET=isucon

setup: bundle, chef-setup

bundle:
	$(BUNDLE) install --path vendor/bundle $(BUNDLE_OPTION)

chef-setup:
	$(MAKE) -C kitchen prepare TARGET=$(TARGET)

cook:
	$(MAKE) -C kitchen cook TARGET=$(TARGET)

