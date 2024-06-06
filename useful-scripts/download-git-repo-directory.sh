#!/bin/bash
echo -n "Github repo URL: "
read -r repo_url

echo -n "List directory to download: "
read -r list_directory

# TODO: validate the input 

# TODO: choose specific branch

# TODO: handle error and remove the unfinished directory
# TODO: show prompt to confirm delete directory

# Get the repo name
repo_name=$(echo "$repo_url" | sed 's|.*/||')

# Remove .git if present
repo_name=${repo_name%.git}

# Clone the repo
git clone -n --depth=1 --filter=tree:0 $repo_url
cd $repo_name

# Set the list directory to download
git sparse-checkout set --no-cone $list_directory
git checkout

# cd $repo_name/ TODO: change directory to the finish repo cloned
