function routesaregoingpoof
  openstack router show $argv[1]

  set -l ROUTES (openstack router show $argv[1] -f json | jq -r .routes | sed -e 's/ //g' | sed -e 's/\'//g' | sed '/^$/d')

  echo

  for ROUTE in $ROUTES; 
    echo "Deleting route: $ROUTE"
    openstack router unset --route $ROUTE $argv[1]; 
  end

  echo

  openstack router show $argv[1]
end
