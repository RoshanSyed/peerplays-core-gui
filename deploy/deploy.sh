#!/bin/bash

# any future command that fails will exit the script
set -e

# let's write the public key of our aws instance
# eval $(ssh-agent -s)
# echo "$PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null

# ** Alternative approach
mkdir -p ~/.ssh
echo -e "$PRIVATE_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
# ** End of alternative approach

# disable the host key checking.
./deploy/disableHostKeyChecking.sh

# we have already setup the DEPLOYER_SERVER in our gitlab settings which is a
# comma seperated values of ip addresses.
DEPLOY_SERVERS=$QA_SERVER

# lets split this string and convert this into array
# In UNIX, we can use this commond to do this
# ${string//substring/replacement}
# our substring is "," and we replace it with nothing.
ALL_SERVERS=(${DEPLOY_SERVERS//,/ })
echo "ALL_SERVERS ${ALL_SERVERS}"

# lets iterate over this array and ssh into each EC2 instance
# once inside the server, run updateAndRestart.sh
for server in "${ALL_SERVERS[@]}"
do
  echo "deploying to ${server}"
  ssh ubuntu@${server} 'bash' < ./deploy/updateAndRestart.sh $CI_COMMIT_REF_NAME
done
