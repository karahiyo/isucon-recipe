BUNDLE=$(shell which bundle)
MAKE=$(shell which make)

TARGET=isucon

install:
	$(BUNDLE) install --path vendor/bundle $(BUNDLE_OPTION)

chef-setup:
	$(MAKE) -C kitchen prepare TARGET=$(TARGET)

cook:
	$(MAKE) -C kitchen cook TARGET=$(TARGET)

clean:
	$(MAKE) -C kitchen clean TARGET=$(TARGET)
