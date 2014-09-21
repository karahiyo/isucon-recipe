TARGET=zeus

CWD=`pwd`

BUNDLE=$(shell which bundle)
BERKS=$(shell which berks)

prepare: setup-ssl berks
	$(BUNDLE) exec knife solo prepare $(TARGET)

cook:
	$(BUNDLE) exec knife solo cook $(TARGET)

new-recipe:
	$(BUNDLE) exec knife cookbook create $(TARGET) -o ./site-cookbooks

setup-ssl:
	grep "ssl_verify_mode :verify_peer" ${CWD}/.chef/knife.rb || echo "ssl_verify_mode :verify_peer" >> ${CWD}/.chef/knife.rb

berks:
	${BUNDLE} exec berks vendor #--path cookbooks
