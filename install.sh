#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

EXTRACT_PATH=$1
INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
TBB_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
echo -e "[INSTALL][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[INSTALL][ARGS] TBB VERSION: ${TBB_VERSION}"

echo "-------------------------------------"
echo ${EXTRACT_PATH}
echo "-------------------------------------"

echo "-------------------------------------"
echo ${INSTALL_PATH}
echo "-------------------------------------"

# We check if the arguments variables we need are correctly set.
# If not, we abort the process.
if [[ -z ${EXTRACT_PATH} || -z ${INSTALL_PATH} || -z ${TBB_VERSION} ]]; then
    echo -e "\n"
    echo -e "[INSTALL][ARGS] One or more of the argument variables are empty. Aborting..."
    echo -e "\n"

    exit 1
fi

# Create INSTALL_PATH if it doesn't exist
if [[ ! -d ${INSTALL_PATH} ]]; then
    echo -e "[INSTALL] INSTALL_PATH does not exist. Creating directory: ${INSTALL_PATH}"
    mkdir -p ${INSTALL_PATH}
fi

# We install TBB.
echo -e "\n"
echo -e "[INSTALL] Installing TBB-${TBB_VERSION}..."
echo -e "\n"

cp -R ${EXTRACT_PATH}/* ${INSTALL_PATH}

echo -e "[INSTALL] Finished installing TBB-${TBB_VERSION}!"
echo -e "\n"


# #!/usr/bin/bash

# # Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
# set -e

# EXTRACT_PATH=$1
# INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
# TBB_VERSION=${REZ_BUILD_PROJECT_VERSION}

# # We print the arguments passed to the Bash script.
# echo -e "\n"
# echo -e "==============="
# echo -e "=== INSTALL ==="
# echo -e "==============="
# echo -e "\n"

# echo -e "[INSTALL][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
# echo -e "[INSTALL][ARGS] INSTALL PATH: ${INSTALL_PATH}"
# echo -e "[INSTALL][ARGS] TBB VERSION: ${TBB_VERSION}"

# # We check if the arguments variables we need are correctly set.
# # If not, we abort the process.
# if [[ -z ${EXTRACT_PATH} || -z ${INSTALL_PATH} || -z ${TBB_VERSION} ]]; then
#     echo -e "\n"
#     echo -e "[INSTALL][ARGS] One or more of the argument variables are empty. Aborting..."
#     echo -e "\n"

#     exit 1
# fi

# # # Create INSTALL_PATH if it doesn't exist
# # if [[ ! -d ${INSTALL_PATH} ]]; then
# #     echo -e "[INSTALL] INSTALL_PATH does not exist. Creating directory: ${INSTALL_PATH}"
# #     mkdir -p ${INSTALL_PATH}
# # fi

# # We install TBB.
# echo -e "\n"
# echo -e "[INSTALL] Installing TBB-${TBB_VERSION}..."
# echo -e "\n"

# # cp -R ${EXTRACT_PATH}/* ${INSTALL_PATH}

# cp -R /source/user/td/jmw/rez-tbb/build/* ${INSTALL_PATH}

# echo -e "[INSTALL] Finished installing TBB-${TBB_VERSION}!"
# echo -e "\n"
