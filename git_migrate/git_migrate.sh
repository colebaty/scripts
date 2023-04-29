#!/bin/bash

source /home/cole/.scripts/agent.sh 2>/dev/null
source /home/cole/scratch/token.sh

WORKING_DIR=/tmp
SRC=git@cole.gitlab
DST=git@cole.saas

GITLAB_API_BASE=https://cole.gitlab/api/v4/projects
GOGS_API_BASE=http://gogs.cole.saas:3000/api/v1

# 1) get list of gitlab repos

response=$(curl -k -H "Authorization: bearer ${GITLAB_TOKEN}" ${GITLAB_API_BASE} 2>/dev/null)

gitlab_repos=$(echo "${response}" | jq '.[]|.["ssh_url_to_repo"]' -r | grep -vi monitor)

#echo -e "${gitlab_repos}\n"

for gl_repo in ${gitlab_repos}; do
    echo ${gl_repo}
    repo_name=$(basename -s .git `echo $gl_repo`)
    echo "repo name: ${repo_name}"

    #copy from gitlab
    git clone --mirror ${gl_repo} ${WORKING_DIR}/${repo_name}

    #create new repo on gogs
    data="{\"name\":\"${repo_name}\"}"
    r=$(curl \
        -H "Authorization: token ${GOGS_TOKEN}" \
        ${GOGS_API_BASE}/repos/cole/${repo_name})

    gogs_repo=$(echo ${r} | jq '.["ssh_url"]' -r)

    #push to gogs
    cd ${WORKING_DIR}/${repo_name}
    git push --mirror ${gogs_repo}
done


# clean up
for repo in ${gitlab_repos}; do
    repo_name=$(basename -s .git `echo $repo`)
    echo "repo name: ${repo_name}"
    # remove from /tmp
    rm -rf ${WORKING_DIR}/${repo_name}
done
#rm -rf ${WORKING_DIR}/*.git

#for repo in `cat list`; do
#    echo "clone command: git clone --mirror ${SRC}/${repo} ${WORKING_DIR}/${repo_name}"
#    
#done
